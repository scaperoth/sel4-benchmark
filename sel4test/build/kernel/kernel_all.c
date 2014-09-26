#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <types.h>
#include <benchmark.h>
#include <api/syscall.h>
#include <api/failures.h>
#include <api/faults.h>
#include <kernel/cspace.h>
#include <kernel/faulthandler.h>
#include <kernel/thread.h>
#include <kernel/vspace.h>
#include <machine/io.h>
#include <object/interrupt.h>
#include <model/statedata.h>

#ifdef DEBUG
#include <arch/machine/capdl.h>
#endif

/* The haskell function 'handleEvent' is split into 'handleXXX' variants
 * for each event causing a kernel entry */

exception_t
handleInterruptEntry(void)
{
    irq_t irq;

    irq = getActiveIRQ();
    if (irq != irqInvalid) {
        handleInterrupt(irq);
    } else {
        printf("Spurious interrupt\n");
        handleSpuriousIRQ();
    }

    schedule();
    activateThread();

    return EXCEPTION_NONE;
}

exception_t
handleUnknownSyscall(word_t w)
{
#ifdef DEBUG
    if (w == SysDebugPutChar) {
        kernel_putchar(getRegister(ksCurThread, capRegister));
        return EXCEPTION_NONE;
    }
    if (w == SysDebugHalt) {
        printf("Debug halt syscall from user thread 0x%x\n", (unsigned int)ksCurThread);
        halt();
    }
    if (w == SysDebugSnapshot) {
        printf("Debug snapshot syscall from user thread 0x%x\n", (unsigned int)ksCurThread);
        capDL();
        return EXCEPTION_NONE;
    }
    if (w == SysDebugCapIdentify) {
        word_t cptr = getRegister(ksCurThread, capRegister);
        lookupCapAndSlot_ret_t lu_ret = lookupCapAndSlot(ksCurThread, cptr);
        uint32_t cap_type = cap_get_capType(lu_ret.cap);
        setRegister(ksCurThread, capRegister, cap_type);
        return EXCEPTION_NONE;
    }
#endif

#ifdef DANGEROUS_CODE_INJECTION
    if (w == SysDebugRun) {
        ((void (*) (void *))getRegister(ksCurThread, capRegister))((void*)getRegister(ksCurThread, msgInfoRegister));
        return EXCEPTION_NONE;
    }
#endif

#ifdef CONFIG_BENCHMARK
    if (w == SysBenchmarkResetLog) {
        ksLogIndex = 0;
        return EXCEPTION_NONE;
    } else if (w == SysBenchmarkDumpLog) {
        int i;
        word_t *buffer = lookupIPCBuffer(true, ksCurThread);
        word_t start = getRegister(ksCurThread, capRegister);
        word_t size = getRegister(ksCurThread, msgInfoRegister);
        word_t logSize = ksLogIndex > MAX_LOG_SIZE ? MAX_LOG_SIZE : ksLogIndex;

        if (buffer == NULL) {
            userError("Cannot dump benchmarking log to a thread without an ipc buffer\n");
            current_syscall_error.type = seL4_IllegalOperation;
            return EXCEPTION_SYSCALL_ERROR;
        }

        if (start > logSize) {
            userError("Start > logsize\n");
            current_syscall_error.type = seL4_InvalidArgument;
            return EXCEPTION_SYSCALL_ERROR;
        }

        /* Assume we have access to an ipc buffer 1024 words big.
         * Do no write to the first 4 bytes as these are overwritten */
        if (size > MAX_IPC_BUFFER_STORAGE) {
            size = MAX_IPC_BUFFER_STORAGE;
        }

        /* trim to size */
        if ((start + size) > logSize) {
            size = logSize - start;
        }

        /* write to ipc buffer */
        for (i = 0; i < size; i++) {
            buffer[i + 1] = ksLog[i + start];
        }

        /* Return the amount written */
        setRegister(ksCurThread, capRegister, size);
        return EXCEPTION_NONE;
    } else if (w == SysBenchmarkLogSize) {
        /* Return the amount of log items we tried to log (may exceed max size) */
        setRegister(ksCurThread, capRegister, ksLogIndex);
        return EXCEPTION_NONE;
    }
#endif /* CONFIG_BENCHMARK */

    current_fault = fault_unknown_syscall_new(w);
    handleFault(ksCurThread);

    schedule();
    activateThread();

    return EXCEPTION_NONE;
}

exception_t
handleUserLevelFault(word_t w_a, word_t w_b)
{
    current_fault = fault_user_exception_new(w_a, w_b);
    handleFault(ksCurThread);

    schedule();
    activateThread();

    return EXCEPTION_NONE;
}

exception_t
handleVMFaultEvent(vm_fault_type_t vm_faultType)
{
    exception_t status;

    status = handleVMFault(ksCurThread, vm_faultType);
    if (status != EXCEPTION_NONE) {
        handleFault(ksCurThread);
    }

    schedule();
    activateThread();

    return EXCEPTION_NONE;
}


static exception_t
handleInvocation(bool_t isCall, bool_t isBlocking)
{
    message_info_t info;
    cptr_t cptr;
    lookupCapAndSlot_ret_t lu_ret;
    word_t *buffer;
    exception_t status;
    word_t length;
    tcb_t *thread;

    thread = ksCurThread;

    info = messageInfoFromWord(getRegister(thread, msgInfoRegister));
    cptr = getRegister(thread, capRegister);

    /* faulting section */
    lu_ret = lookupCapAndSlot(thread, cptr);

    if (unlikely(lu_ret.status != EXCEPTION_NONE)) {
        userError("Invocation of invalid cap #%d.", (int)cptr);
        current_fault = fault_cap_fault_new(cptr, false);

        if (isBlocking) {
            handleFault(thread);
        }

        return EXCEPTION_NONE;
    }

    buffer = lookupIPCBuffer(false, thread);

    status = lookupExtraCaps(thread, buffer, info);

    if (unlikely(status != EXCEPTION_NONE)) {
        userError("Lookup of extra caps failed.");
        if (isBlocking) {
            handleFault(thread);
        }
        return EXCEPTION_NONE;
    }

    /* Syscall error/Preemptible section */
    length = message_info_get_msgLength(info);
    if (unlikely(length > n_msgRegisters && !buffer)) {
        length = n_msgRegisters;
    }
    status = decodeInvocation(message_info_get_msgLabel(info), length,
                              cptr, lu_ret.slot, lu_ret.cap,
                              current_extra_caps, isBlocking, isCall,
                              buffer);

    if (unlikely(status == EXCEPTION_PREEMPTED)) {
        return status;
    }

    if (unlikely(status == EXCEPTION_SYSCALL_ERROR)) {
        if (isCall) {
            replyFromKernel_error(thread);
        }
        return EXCEPTION_NONE;
    }

    if (unlikely(
                thread_state_get_tsType(thread->tcbState) == ThreadState_Restart)) {
        if (isCall) {
            replyFromKernel_success_empty(thread);
        }
        setThreadState(thread, ThreadState_Running);
    }

    return EXCEPTION_NONE;
}

static void
handleReply(void)
{
    cte_t *callerSlot;
    cap_t callerCap;

    callerSlot = TCB_PTR_CTE_PTR(ksCurThread, tcbCaller);
    callerCap = callerSlot->cap;
    switch (cap_get_capType(callerCap)) {
    case cap_reply_cap: {
        tcb_t *caller;

        if (cap_reply_cap_get_capReplyMaster(callerCap)) {
            break;
        }
        caller = TCB_PTR(cap_reply_cap_get_capTCBPtr(callerCap));
        /* Haskell error:
         * "handleReply: caller must not be the current thread" */
        assert(caller != ksCurThread);
        doReplyTransfer(ksCurThread, caller, callerSlot);
        return;
    }

    case cap_null_cap:
        userError("Attempted reply operation when no reply cap present.");
        return;

    default:
        break;
    }

    fail("handleReply: invalid caller cap");
}

static void
handleWait(void)
{
    word_t epCPtr;
    lookupCap_ret_t lu_ret;

    deleteCallerCap(ksCurThread);

    epCPtr = getRegister(ksCurThread, capRegister);

    lu_ret = lookupCap(ksCurThread, epCPtr);
    if (unlikely(lu_ret.status != EXCEPTION_NONE)) {
        /* current_lookup_fault has been set by lookupCap */
        current_fault = fault_cap_fault_new(epCPtr, true);
        handleFault(ksCurThread);
        return;
    }

    switch (cap_get_capType(lu_ret.cap)) {
    case cap_endpoint_cap:
        if (unlikely(!cap_endpoint_cap_get_capCanReceive(lu_ret.cap))) {
            current_lookup_fault = lookup_fault_missing_capability_new(0);
            current_fault = fault_cap_fault_new(epCPtr, true);
            handleFault(ksCurThread);
            break;
        }

        receiveIPC(ksCurThread, lu_ret.cap);
        break;

    case cap_async_endpoint_cap:
        if (unlikely(!cap_async_endpoint_cap_get_capAEPCanReceive(lu_ret.cap))) {
            current_lookup_fault = lookup_fault_missing_capability_new(0);
            current_fault = fault_cap_fault_new(epCPtr, true);
            handleFault(ksCurThread);
            break;
        }

        receiveAsyncIPC(ksCurThread, lu_ret.cap);
        break;

    default:
        current_lookup_fault = lookup_fault_missing_capability_new(0);
        current_fault = fault_cap_fault_new(epCPtr, true);
        handleFault(ksCurThread);
        break;
    }
}

static void
handleYield(void)
{
    tcbSchedDequeue(ksCurThread);
    tcbSchedAppend(ksCurThread);
    rescheduleRequired();
}

exception_t
handleSyscall(syscall_t syscall)
{
    exception_t ret;
    irq_t irq;

    switch (syscall) {
    case SysSend:
        ret = handleInvocation(false, true);
        if (unlikely(ret != EXCEPTION_NONE)) {
            irq = getActiveIRQ();
            if (irq != irqInvalid) {
                handleInterrupt(irq);
            }
        }
        break;

    case SysNBSend:
        ret = handleInvocation(false, false);
        if (unlikely(ret != EXCEPTION_NONE)) {
            irq = getActiveIRQ();
            if (irq != irqInvalid) {
                handleInterrupt(irq);
            }
        }
        break;

    case SysCall:
        ret = handleInvocation(true, true);
        if (unlikely(ret != EXCEPTION_NONE)) {
            irq = getActiveIRQ();
            if (irq != irqInvalid) {
                handleInterrupt(irq);
            }
        }
        break;

    case SysWait:
        handleWait();
        break;

    case SysReply:
        handleReply();
        break;

    case SysReplyWait:
        handleReply();
        handleWait();
        break;

    case SysYield:
        handleYield();
        break;

    default:
        fail("Invalid syscall");
    }

    schedule();
    activateThread();

    return EXCEPTION_NONE;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/benchmark.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#ifdef CONFIG_BENCHMARK

#include <benchmark.h>
#include <arch/benchmark.h>
#include <arch/machine/hardware.h>

DATA_GLOB uint64_t ksEntry;
DATA_GLOB uint64_t ksExit;
DATA_GLOB uint32_t ksLogIndex = 0;
DATA_GLOB uint32_t *ksLog;

#endif /* CONFIG_BENCHMARK */

#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/faults.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <types.h>
#include <object.h>
#include <machine/io.h>
#include <kernel/vspace.h>
#include <api/faults.h>
#include <api/syscall.h>
#include <util.h>

bool_t handleFaultReply(tcb_t *receiver, tcb_t *sender)
{
    message_info_t tag;
    word_t         label;
    fault_t        fault;
    unsigned int   length;

    /* These lookups are moved inward from doReplyTransfer */
    tag = messageInfoFromWord(getRegister(sender, msgInfoRegister));
    label = message_info_get_msgLabel(tag);
    length = message_info_get_msgLength(tag);
    fault = receiver->tcbFault;

    switch (fault_get_faultType(fault)) {
    case fault_cap_fault:
        return true;

    case fault_vm_fault:
        return true;

    case fault_unknown_syscall: {
        unsigned int i;
        register_t   r;
        word_t       v;
        word_t*      sendBuf;

        sendBuf = lookupIPCBuffer(false, sender);

        /* Assumes n_syscallMessage > n_msgRegisters */
        for (i = 0; i < length && i < n_msgRegisters; i++) {
            r = syscallMessage[i];
            v = getRegister(sender, msgRegisters[i]);
            setRegister(receiver, r, sanitiseRegister(r, v));
        }

        if (sendBuf) {
            for (; i < length && i < n_syscallMessage; i++) {
                r = syscallMessage[i];
                v = sendBuf[i + 1];
                setRegister(receiver, r, sanitiseRegister(r, v));
            }
        }
        /* HACK: Copy NextEIP to FaultEIP because FaultEIP will be copied */
        /* back to NextEIP later on (and we don't wanna lose NextEIP)     */
        setRegister(receiver, FaultEIP, getRegister(receiver, NextEIP));
    }
    return (label == 0);

    case fault_user_exception: {
        unsigned int i;
        register_t   r;
        word_t       v;
        word_t*      sendBuf;

        sendBuf = lookupIPCBuffer(false, sender);

        /* Assumes n_exceptionMessage > n_msgRegisters */
        for (i = 0; i < length && i < n_msgRegisters; i++) {
            r = exceptionMessage[i];
            v = getRegister(sender, msgRegisters[i]);
            setRegister(receiver, r, sanitiseRegister(r, v));
        }

        if (sendBuf) {
            for (; i < length && i < n_exceptionMessage; i++) {
                r = exceptionMessage[i];
                v = sendBuf[i + 1];
                setRegister(receiver, r, sanitiseRegister(r, v));
            }
        }
    }
    return (label == 0);

    default:
        fail("Invalid fault");
    }
}

#ifdef DEBUG

void handleKernelException(
    uint32_t vector,
    uint32_t errcode,
    uint32_t eip,
    uint32_t esp,
    uint32_t eflags,
    uint32_t cr0,
    uint32_t cr2,
    uint32_t cr3,
    uint32_t cr4
);

VISIBLE
void handleKernelException(
    uint32_t vector,
    uint32_t errcode,
    uint32_t eip,
    uint32_t esp,
    uint32_t eflags,
    uint32_t cr0,
    uint32_t cr2,
    uint32_t cr3,
    uint32_t cr4
)
{
    unsigned int i;

    printf("\n========== KERNEL EXCEPTION ==========\n");
    printf("Vector:  0x%x\n", vector);
    printf("ErrCode: 0x%x\n", errcode);
    printf("EIP:     0x%x\n", eip);
    printf("ESP:     0x%x\n", esp);
    printf("EFLAGS:  0x%x\n", eflags);
    printf("CR0:     0x%x\n", cr0);
    printf("CR2:     0x%x (page-fault address)\n", cr2);
    printf("CR3:     0x%x (page-directory physical address)\n", cr3);
    printf("CR4:     0x%x\n", cr4);
    printf("\nStack Dump:\n");
    for (i = 0; i < 20; i++) {
        printf("*0x%x == 0x%x\n", esp + i * 4, *(uint32_t*)(esp + i * 4));
    }
    printf("\nHalting...\n");
}

#endif
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/c_traps.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <model/statedata.h>
#include <arch/kernel/lock.h>
#include <arch/machine/fpu.h>
#include <arch/fastpath/fastpath.h>

#include <api/syscall.h>

void __attribute__((noreturn)) __attribute__((externally_visible)) restore_user_context(void);
void __attribute__((noreturn)) __attribute__((externally_visible)) restore_user_context(void)
{
    /* set the tss.esp0 */
    tss_ptr_set_esp0(&ia32KStss, ((uint32_t)ksCurThread) + 0x4c);
    if (unlikely(ksCurThread == ia32KSfpuOwner)) {
        /* We are using the FPU, make sure it is enabled */
        enableFpu();
    } else if (unlikely(ia32KSfpuOwner)) {
        /* Someone is using the FPU and it might be enabled */
        disableFpu();
    } else {
        /* No-one (including us) is using the FPU, so we assume it
         * is currently disabled */
    }
    /* see if we entered via syscall */
    if (likely(ksCurThread->tcbContext.registers[Error] == -1)) {
        ksCurThread->tcbContext.registers[EFLAGS] &= ~0x200;
        asm volatile(
            // Set our stack pointer to the top of the tcb so we can efficiently pop
            "movl %0, %%esp\n"
            // restore syscall number
            "popl %%eax\n"
            // cap/badge reigster
            "popl %%ebx\n"
            // skip ecx and edx, these will contain esp and nexteip due to sysenter/sysexit convention
            "addl $8, %%esp\n"
            // message info register
            "popl %%esi\n"
            // message register
            "popl %%edi\n"
            // message register
            "popl %%ebp\n"
            //ds (if changed)
            "cmpl $0x23, (%%esp)\n"
            "je 1f\n"
            "popl %%ds\n"
            "jmp 2f\n"
            "1: addl $4, %%esp\n"
            "2:\n"
            //es (if changed)
            "cmpl $0x23, (%%esp)\n"
            "je 1f\n"
            "popl %%es\n"
            "jmp 2f\n"
            "1: addl $4, %%esp\n"
            "2:\n"
            //have to reload other selectors
            "popl %%fs\n"
            "popl %%gs\n"
            // skip faulteip, tls_base and error (these are fake registers)
            "addl $12, %%esp\n"
            // restore nexteip
            "popl %%edx\n"
            // skip cs
            "addl $4,  %%esp\n"
            "popfl\n"
            // reset interrupt bit
            "orl $0x200, -4(%%esp)\n"
            // restore esp
            "pop %%ecx\n"
            "sti\n"
            "sysexit\n"
            :
            : "r"(&ksCurThread->tcbContext.registers[EAX])
            // Clobber memory so the compiler is forced to complete all stores
            // before running this assembler
            : "memory"
        );
    } else {
        asm volatile(
            // Set our stack pointer to the top of the tcb so we can efficiently pop
            "movl %0, %%esp\n"
            "popl %%eax\n"
            "popl %%ebx\n"
            "popl %%ecx\n"
            "popl %%edx\n"
            "popl %%esi\n"
            "popl %%edi\n"
            "popl %%ebp\n"
            "popl %%ds\n"
            "popl %%es\n"
            "popl %%fs\n"
            "popl %%gs\n"
            // skip faulteip, tls_base, error
            "addl $12, %%esp\n"
            "iret\n"
            :
            : "r"(&ksCurThread->tcbContext.registers[EAX])
            // Clobber memory so the compiler is forced to complete all stores
            // before running this assembler
            : "memory"
        );
    }
    while (1);
}

void __attribute__((fastcall)) __attribute__((externally_visible)) c_handle_interrupt(int irq, int syscall);
void __attribute__((fastcall)) __attribute__((externally_visible)) c_handle_interrupt(int irq, int syscall)
{
    if (irq == int_unimpl_dev) {
        handleUnimplementedDevice();
    } else if (irq == int_page_fault) {
        /* Error code is in Error. Pull out bit 5, which is whether it was instruction or data */
        handleVMFaultEvent((ksCurThread->tcbContext.registers[Error] >> 4) & 1);
    } else if (irq < int_irq_min) {
        handleUserLevelFault(irq, ksCurThread->tcbContext.registers[Error]);
    } else if (likely(irq < int_trap_min)) {
        ia32KScurInterrupt = irq;
        handleInterruptEntry();
    } else if (irq == int_spurious) {
        /* fall through to restore_user_context and do nothing */
    } else {
        /* Interpret a trap as an unknown syscall */
        /* Adjust FaultEIP to point to trapping INT
         * instruction by subtracting 2 */
        int sys_num;
        ksCurThread->tcbContext.registers[FaultEIP] -= 2;
        /* trap number is MSBs of the syscall number and the LSBS of EAX */
        sys_num = (irq << 24) | (syscall & 0x00ffffff);
        handleUnknownSyscall(sys_num);
    }
    restore_user_context();
}

void __attribute__((noreturn))
slowpath(syscall_t syscall)
{
    ia32KScurInterrupt = -1;
    /* increment nextEIP to skip sysenter */
    ksCurThread->tcbContext.registers[NextEIP] += 2;
    /* check for undefined syscall */
    if (unlikely(syscall < SYSCALL_MIN || syscall > SYSCALL_MAX)) {
        handleUnknownSyscall(syscall);
    } else {
        handleSyscall(syscall);
    }
    restore_user_context();
}

void __attribute__((externally_visible)) c_handle_syscall(syscall_t syscall, word_t cptr, word_t msgInfo);
void __attribute__((externally_visible)) c_handle_syscall(syscall_t syscall, word_t cptr, word_t msgInfo)
{
#ifdef FASTPATH
    if (syscall == SysCall) {
        fastpath_call(cptr, msgInfo);
    } else if (syscall == SysReplyWait) {
        fastpath_reply_wait(cptr, msgInfo);
    }
#endif

    slowpath(syscall);
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <util.h>
#include <api/syscall.h>
#include <kernel/thread.h>
#include <machine/io.h>
#include <machine/profiler.h>
#include <machine/registerset.h>
#include <model/statedata.h>
#include <object/cnode.h>
#include <object/structures.h>
#include <config.h>
#include <assert.h>
#include <arch/fastpath/fastpath.h>
#include <arch/kernel/thread.h>
#include <arch/machine/fpu.h>

/* Fastpath cap lookup.  Returns a null_cap on failure. */
static inline cap_t
lookup_fp(cap_t cap, cptr_t cptr)
{
    word_t cptr2;
    cte_t *slot;
    word_t guardBits, radixBits, bits;
    word_t radix, capGuard;

    bits = 0;

    if (unlikely(!cap_capType_equals(cap, cap_cnode_cap))) {
        return cap_null_cap_new();
    }

    do {
        guardBits = cap_cnode_cap_get_capCNodeGuardSize(cap);
        radixBits = cap_cnode_cap_get_capCNodeRadix(cap);
        cptr2 = cptr << bits;

        capGuard = cap_cnode_cap_get_capCNodeGuard(cap);

        /* Check the guard. Depth mismatch check is deferred.
           The 32MinusGuardSize encoding contains an exception
           when the guard is 0, when 32MinusGuardSize will be
           reported as 0 also. In this case we skip the check */
        if (unlikely(guardBits && (cptr2 >> (wordBits - guardBits) != capGuard))) {
            return cap_null_cap_new();
        }

        radix = cptr2 << guardBits >> (wordBits - radixBits);
        slot = CTE_PTR(cap_cnode_cap_get_capCNodePtr(cap)) + radix;

        cap = slot->cap;
        bits += guardBits + radixBits;

    } while (unlikely(bits < wordBits && cap_capType_equals(cap, cap_cnode_cap)));

    if (unlikely(bits > wordBits)) {
        /* Depth mismatch. We've overshot 32 bits. The lookup we've done is
           safe, but wouldn't be allowed by the slowpath. */
        return cap_null_cap_new();
    }

    return cap;
}

static inline void FASTCALL
switchToThread_fp(tcb_t *thread, pde_t *pd)
{
    word_t base;
    uint32_t new_pd = pptr_to_paddr(pd);

    if (likely(getCurrentPD() != new_pd)) {
        setCurrentPD(new_pd);
    }

    /* Code equivalent to in Arch_switchToThread, see arch/object/structures.bf
     * for layout of gdt_data */
    /* update the GDT_TLS entry with the thread's TLS_BASE address */
    base = getRegister(thread, TLS_BASE);
    gdt_entry_gdt_data_ptr_set_base_low(ia32KSgdt + GDT_TLS, base);
    gdt_entry_gdt_data_ptr_set_base_mid(ia32KSgdt + GDT_TLS,  (base >> 16) & 0xFF);
    gdt_entry_gdt_data_ptr_set_base_high(ia32KSgdt + GDT_TLS, (base >> 24) & 0xFF);

    /* update the GDT_IPCBUF entry with the thread's IPC buffer address */
    base = thread->tcbIPCBuffer;
    gdt_entry_gdt_data_ptr_set_base_low(ia32KSgdt + GDT_IPCBUF, base);
    gdt_entry_gdt_data_ptr_set_base_mid(ia32KSgdt + GDT_IPCBUF,  (base >> 16) & 0xFF);
    gdt_entry_gdt_data_ptr_set_base_high(ia32KSgdt + GDT_IPCBUF, (base >> 24) & 0xFF);

    ksCurThread = thread;
}

/* Custom implementation of functions for maniuplating some data structures generated
   from arch/object/structures.bf */

static inline void
thread_state_ptr_set_tsType_np(thread_state_t *ts_ptr, word_t tsType)
{
    ts_ptr->words[0] = tsType;
}

static inline void
thread_state_ptr_mset_blockingIPCEndpoint_tsType(thread_state_t *ts_ptr,
                                                 word_t ep_ref,
                                                 word_t tsType)
{
    ts_ptr->words[0] = ep_ref | tsType;
}

static inline void
thread_state_ptr_set_blockingIPCDiminish_np(thread_state_t *ts_ptr, word_t dim)
{
    ts_ptr->words[2] &= BIT(0);
    ts_ptr->words[1] = dim;
}

static inline void
mdb_node_ptr_mset_mdbNext_mdbRevocable_mdbFirstBadged(
    mdb_node_t *node_ptr, word_t mdbNext,
    word_t mdbRevocable, word_t mdbFirstBadged)
{
    node_ptr->words[1] = mdbNext | (mdbRevocable << 1) | mdbFirstBadged;
}

static inline void
mdb_node_ptr_set_mdbPrev_np(mdb_node_t *node_ptr, word_t mdbPrev)
{
    node_ptr->words[0] = mdbPrev;
}

static inline void
cap_reply_cap_ptr_new_np(cap_t *cap_ptr, word_t capReplyMaster,
                         word_t capTCBPtr)
{
    cap_ptr->words[1] = capReplyMaster;
    cap_ptr->words[0] = TCB_REF(capTCBPtr) | cap_reply_cap;
}

static inline void
endpoint_ptr_mset_epQueue_tail_state(endpoint_t *ep_ptr, word_t epQueue_tail,
                                     word_t state)
{
    ep_ptr->words[0] = epQueue_tail | state;
}

static inline void
endpoint_ptr_set_epQueue_head_np(endpoint_t *ep_ptr, word_t epQueue_head)
{
    ep_ptr->words[1] = epQueue_head;
}


static inline bool_t
isValidVTableRoot_fp(cap_t pd_cap)
{
    return cap_capType_equals(pd_cap, cap_page_directory_cap) && cap_page_directory_cap_get_capPDIsMapped(pd_cap);
}

static inline void
fastpath_copy_mrs(unsigned int length, tcb_t *src, tcb_t *dest)
{
    if (length == 2) {
        setRegister(dest, EBP, getRegister(src, EBP));
    }
    if (length == 2 || length == 1) {
        setRegister(dest, EDI, getRegister(src, EDI));
    }
}

/* This is an accelerated check that msgLength, which appears
   in the bottom of the msgInfo word, is <= 2 and that msgExtraCaps
   which appears above it is zero. We are assuming that n_msgRegisters == 2
   for this check to be useful.*/
compile_assert (n_msgRegisters_eq_2, n_msgRegisters == 2)
static inline int
fastpath_mi_check(word_t msgInfo)
{
    return (msgInfo & MASK(seL4_MsgLengthBits + seL4_MsgExtraCapBits)) > 2;
}

static inline bool_t hasDefaultSelectors(tcb_t *thread)
{
    return thread->tcbContext.registers[DS] == SEL_DS_3   &&
           thread->tcbContext.registers[ES] == SEL_DS_3;
}

static inline void FASTCALL NORETURN
fastpath_restore(word_t badge, word_t msgInfo)
{
    if (unlikely(ksCurThread == ia32KSfpuOwner)) {
        /* We are using the FPU, make sure it is enabled */
        enableFpu();
    } else if (unlikely(ia32KSfpuOwner)) {
        /* Someone is using the FPU and it might be enabled */
        disableFpu();
    } else {
        /* No-one (including us) is using the FPU, so we assume it
         * is currently disabled */
    }
    tss_ptr_set_esp0(&ia32KStss, ((uint32_t)ksCurThread) + 0x4c);
    ksCurThread->tcbContext.registers[EFLAGS] &= ~0x200;
    if (likely(hasDefaultSelectors(ksCurThread))) {
        asm volatile("\
                movl %%ecx, %%esp \n\
                popl %%edi \n\
                popl %%ebp \n\
                addl $8, %%esp \n\
                popl %%fs \n\
                popl %%gs \n\
                addl $20, %%esp \n\
                popfl \n\
                orl $0x200, 44(%%ecx) \n\
                movl 36(%%ecx), %%edx \n\
                pop %%ecx \n\
                sti \n\
                sysexit \n\
            "
                     :
                     : "c"(&ksCurThread->tcbContext.registers[EDI]),
                     "a" (ksCurThread->tcbContext.registers[EAX]),
                     "b" (badge),
                     "S" (msgInfo)
                     : "memory"
                    );
    } else {
        asm volatile("\
                movl %%ecx, %%esp \n\
                popl %%edi \n\
                popl %%ebp \n\
                popl %%ds \n\
                popl %%es \n\
                popl %%fs \n\
                popl %%gs \n\
                addl $20, %%esp \n\
                popfl \n\
                orl $0x200, 44(%%ecx) \n\
                movl 36(%%ecx), %%edx \n\
                pop %%ecx \n\
                sti \n\
                sysexit \n\
            "
                     :
                     : "c"(&ksCurThread->tcbContext.registers[EDI]),
                     "a" (ksCurThread->tcbContext.registers[EAX]),
                     "b" (badge),
                     "S" (msgInfo)
                     : "memory"
                    );
    }
    /* This function is marked NORETURN, but gcc is not aware that the previous assembly
       block will return to user level. This loop prevents gcc complaining, and also helps
       it optimize register usage in this function (since gcc knows it can clobber everything
       as it will not be returning or calling anything else */
    while (1);
}

void FASTCALL NORETURN
fastpath_call(word_t cptr, word_t msgInfo)
{
    message_info_t info;
    cap_t ep_cap;
    endpoint_t *ep_ptr;
    unsigned int length;
    tcb_t *dest;
    word_t badge;
    cte_t *replySlot, *callerSlot;
    cap_t newVTable;
    pde_t *cap_pd;
    uint32_t fault_type;

    /* Get message info, length, and fault type. */
    info = messageInfoFromWord(msgInfo);
    length = message_info_get_msgLength(info);
    fault_type = fault_get_faultType(ksCurThread->tcbFault);

    /* Check there's no extra caps, the length is ok and there's no
     * saved fault. */
    if (unlikely(fastpath_mi_check(msgInfo) ||
                 fault_type != fault_null_fault)) {
        slowpath(SysCall);
    }

    /* Lookup the cap */
    ep_cap = lookup_fp(TCB_PTR_CTE_PTR(ksCurThread, tcbCTable)->cap, cptr);

    /* Check it's an endpoint */
    if (unlikely(!cap_capType_equals(ep_cap, cap_endpoint_cap) ||
                 !cap_endpoint_cap_get_capCanSend(ep_cap))) {
        slowpath(SysCall);
    }

    /* Get the endpoint address */
    ep_ptr = EP_PTR(cap_endpoint_cap_get_capEPPtr(ep_cap));

    /* Get the destination thread, which is only going to be valid
     * if the endpoint is valid. */
    dest = TCB_PTR(endpoint_ptr_get_epQueue_head(ep_ptr));

    /* Check that there's a thread waiting to receive */
    if (unlikely(endpoint_ptr_get_state(ep_ptr) != EPState_Recv)) {
        slowpath(SysCall);
    }

    /* Get destination thread.*/
    newVTable = TCB_PTR_CTE_PTR(dest, tcbVTable)->cap;

    /* Get Page Directory. */
    cap_pd = PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(newVTable));

    /* Ensure that the destination has a valid VTable. */
    if (unlikely(! isValidVTableRoot_fp(newVTable))) {
        slowpath(SysCall);
    }

    /* Ensure the destination has a higher/equal priority to us. */
    if (unlikely(dest->tcbPriority < ksCurThread->tcbPriority)) {
        slowpath(SysCall);
    }

    /* Ensure that the endpoint has standard non-diminishing rights. */
    if (unlikely(!cap_endpoint_cap_get_capCanGrant(ep_cap) ||
                 thread_state_ptr_get_blockingIPCDiminishCaps(&dest->tcbState))) {
        slowpath(SysCall);
    }

    /*
     * --- POINT OF NO RETURN ---
     *
     * At this stage, we have commited to performing the IPC.
     */

    /* Need to update NextEIP in the calling thread */
    setRegister(ksCurThread, NextEIP, getRegister(ksCurThread, NextEIP) + 2);

    /* Dequeue the destination. */
    endpoint_ptr_set_epQueue_head_np(ep_ptr, TCB_REF(dest->tcbEPNext));
    if (unlikely(dest->tcbEPNext)) {
        dest->tcbEPNext->tcbEPPrev = NULL;
    } else {
        endpoint_ptr_mset_epQueue_tail_state(ep_ptr, 0, EPState_Idle);
    }

    badge = cap_endpoint_cap_get_capEPBadge(ep_cap);

    /* Block sender */
    thread_state_ptr_set_tsType_np(&ksCurThread->tcbState,
                                   ThreadState_BlockedOnReply);

    /* Get sender reply slot */
    replySlot = TCB_PTR_CTE_PTR(ksCurThread, tcbReply);

    /* Get dest caller slot */
    callerSlot = TCB_PTR_CTE_PTR(dest, tcbCaller);

    /* Insert reply cap */
    cap_reply_cap_ptr_new_np(&callerSlot->cap, 0, TCB_REF(ksCurThread));
    mdb_node_ptr_set_mdbPrev_np(&callerSlot->cteMDBNode, CTE_REF(replySlot));
    mdb_node_ptr_mset_mdbNext_mdbRevocable_mdbFirstBadged(
        &replySlot->cteMDBNode, CTE_REF(callerSlot), 1, 1);

    fastpath_copy_mrs (length, ksCurThread, dest);

    /* Dest thread is set Running, but not queued. */
    thread_state_ptr_set_tsType_np(&dest->tcbState,
                                   ThreadState_Running);
    switchToThread_fp(dest, cap_pd);

    msgInfo = wordFromMessageInfo(message_info_set_msgCapsUnwrapped(info, 0));
    fastpath_restore(badge, msgInfo);
}

void FASTCALL
fastpath_reply_wait(word_t cptr, word_t msgInfo)
{
    message_info_t info;
    cap_t ep_cap;
    endpoint_t *ep_ptr;
    unsigned int length;
    cte_t *callerSlot;
    cap_t callerCap;
    tcb_t *caller;
    word_t badge;
    tcb_t *endpointTail;
    uint32_t fault_type;

    cap_t newVTable;
    pde_t *cap_pd;

    /* Get message info and length */
    info = messageInfoFromWord(msgInfo);
    length = message_info_get_msgLength(info);
    fault_type = fault_get_faultType(ksCurThread->tcbFault);

    /* Check there's no extra caps, the length is ok and there's no
     * saved fault. */
    if (unlikely(fastpath_mi_check(msgInfo) ||
                 fault_type != fault_null_fault)) {
        slowpath(SysReplyWait);
    }

    /* Lookup the cap */
    ep_cap = lookup_fp(TCB_PTR_CTE_PTR(ksCurThread, tcbCTable)->cap,
                       cptr);

    /* Check it's an endpoint */
    if (unlikely(!cap_capType_equals(ep_cap, cap_endpoint_cap) ||
                 !cap_endpoint_cap_get_capCanReceive(ep_cap))) {
        slowpath(SysReplyWait);
    }

    /* Get the endpoint address */
    ep_ptr = EP_PTR(cap_endpoint_cap_get_capEPPtr(ep_cap));

    /* Check that there's not a thread waiting to send */
    if (unlikely(endpoint_ptr_get_state(ep_ptr) == EPState_Send)) {
        slowpath(SysReplyWait);
    }

    /* Only reply if the reply cap is valid. */
    callerSlot = TCB_PTR_CTE_PTR(ksCurThread, tcbCaller);
    callerCap = callerSlot->cap;
    if (unlikely(!cap_capType_equals(callerCap, cap_reply_cap))) {
        slowpath(SysReplyWait);
    }

    /* Determine who the caller is. */
    caller = TCB_PTR(cap_reply_cap_get_capTCBPtr(callerCap));

    /* Check that the caller has not faulted, in which case a fault
       reply is generated instead. */
    fault_type = fault_get_faultType(caller->tcbFault);
    if (unlikely(fault_type != fault_null_fault)) {
        slowpath(SysReplyWait);
    }

    /* Get destination thread.*/
    newVTable = TCB_PTR_CTE_PTR(caller, tcbVTable)->cap;

    /* Get Page Directory. */
    cap_pd = PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(newVTable));

    /* Ensure that the destination has a valid MMU. */
    if (unlikely(! isValidVTableRoot_fp (newVTable))) {
        slowpath(SysReplyWait);
    }

    /* Ensure the original caller can be scheduled directly. */
    if (unlikely(caller->tcbPriority < ksCurThread->tcbPriority)) {
        slowpath(SysReplyWait);
    }

    /*
     * --- POINT OF NO RETURN ---
     *
     * At this stage, we have commited to performing the IPC.
     */

    /* Need to update NextEIP in the calling thread */
    setRegister(ksCurThread, NextEIP, getRegister(ksCurThread, NextEIP) + 2);

    /* Set thread state to BlockedOnReceive */
    thread_state_ptr_mset_blockingIPCEndpoint_tsType(
        &ksCurThread->tcbState, (word_t)ep_ptr, ThreadState_BlockedOnReceive);
    thread_state_ptr_set_blockingIPCDiminish_np(
        &ksCurThread->tcbState, ! cap_endpoint_cap_get_capCanSend(ep_cap));

    /* Place the thread in the endpoint queue */
    endpointTail = TCB_PTR(endpoint_ptr_get_epQueue_tail(ep_ptr));
    if (likely(!endpointTail)) {
        ksCurThread->tcbEPPrev = NULL;
        ksCurThread->tcbEPNext = NULL;

        /* Set head/tail of queue and endpoint state. */
        endpoint_ptr_set_epQueue_head_np(ep_ptr, TCB_REF(ksCurThread));
        endpoint_ptr_mset_epQueue_tail_state(ep_ptr, TCB_REF(ksCurThread),
                                             EPState_Recv);
    } else {
        /* Append current thread onto the queue. */
        endpointTail->tcbEPNext = ksCurThread;
        ksCurThread->tcbEPPrev = endpointTail;
        ksCurThread->tcbEPNext = NULL;

        /* Update tail of queue. */
        endpoint_ptr_mset_epQueue_tail_state(ep_ptr, TCB_REF(ksCurThread),
                                             EPState_Recv);
    }

    /* Delete the reply cap. */
    mdb_node_ptr_mset_mdbNext_mdbRevocable_mdbFirstBadged(
        &CTE_PTR(mdb_node_get_mdbPrev(callerSlot->cteMDBNode))->cteMDBNode,
        0, 1, 1);
    callerSlot->cap = cap_null_cap_new();
    callerSlot->cteMDBNode = nullMDBNode;

    /* I know there's no fault, so straight to the transfer. */

    /* Replies don't have a badge. */
    badge = 0;

    fastpath_copy_mrs (length, ksCurThread, caller);

    /* Dest thread is set Running, but not queued. */
    thread_state_ptr_set_tsType_np(&caller->tcbState,
                                   ThreadState_Running);
    switchToThread_fp(caller, cap_pd);

    msgInfo = wordFromMessageInfo(message_info_set_msgCapsUnwrapped(info, 0));
    fastpath_restore(badge, msgInfo);
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/apic.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <machine/io.h>
#include <arch/machine.h>
#include <arch/kernel/apic.h>
#include <arch/linker.h>
#include <plat/machine/devices.h>
#include <plat/machine/pit.h>

typedef enum _apic_reg_t {
    APIC_ID             = 0x020,
    APIC_VERSION        = 0x030,
    APIC_TASK_PRIO      = 0x080,
    APIC_ARBITR_PRIO    = 0x090,
    APIC_PROC_PRIO      = 0x0A0,
    APIC_EOI            = 0x0B0,
    APIC_LOCAL_DEST     = 0x0D0,
    APIC_DEST_FORMAT    = 0x0E0,
    APIC_SVR            = 0x0F0,
    APIC_ISR_BASE       = 0x100,
    APIC_TMR_BASE       = 0x180,
    APIC_IRR_BASE       = 0x200,
    APIC_ERR_STATUS     = 0x280,
    APIC_ICR1           = 0x300,
    APIC_ICR2           = 0x310,
    APIC_LVT_TIMER      = 0x320,
    APIC_LVT_THERMAL    = 0x330,
    APIC_LVT_PERF_CNTR  = 0x340,
    APIC_LVT_LINT0      = 0x350,
    APIC_LVT_LINT1      = 0x360,
    APIC_LVT_ERROR      = 0x370,
    APIC_TIMER_COUNT    = 0x380,
    APIC_TIMER_CURRENT  = 0x390,
    APIC_TIMER_DIVIDE   = 0x3E0
} apic_reg_t;

PHYS_CODE
static inline uint32_t FORCE_INLINE
apic_read_reg_(uint32_t addr, apic_reg_t reg)
{
    return *(volatile uint32_t*)(addr + reg);
}

PHYS_CODE
static inline void FORCE_INLINE
apic_write_reg_(uint32_t addr, apic_reg_t reg, uint32_t val)
{
    *(volatile uint32_t*)(addr + reg) = val;
}

static inline uint32_t
apic_read_reg(apic_reg_t reg)
{
    return *(volatile uint32_t*)(PPTR_APIC + reg);
}

static inline void
apic_write_reg(apic_reg_t reg, uint32_t val)
{
    *(volatile uint32_t*)(PPTR_APIC + reg) = val;
}

PHYS_CODE VISIBLE uint32_t
apic_measure_freq(paddr_t paddr_apic)
{
    pit_init();
    /* wait for 1st PIT wraparound */
    pit_wait_wraparound();

    /* start APIC timer countdown */
    apic_write_reg_(paddr_apic, APIC_TIMER_DIVIDE, 0xb); /* divisor = 1 */
    apic_write_reg_(paddr_apic, APIC_TIMER_COUNT, 0xffffffff);

    /* wait for 2nd PIT wraparound */
    pit_wait_wraparound();

    /* calculate APIC/bus cycles per ms = frequency in kHz */
    return (0xffffffff - apic_read_reg_(paddr_apic, APIC_TIMER_CURRENT)) / PIT_WRAPAROUND_MS;
}

BOOT_CODE paddr_t
apic_get_base_paddr(void)
{
    apic_base_msr_t apic_base_msr;

    apic_base_msr.words[0] = ia32_rdmsr_low(IA32_APIC_BASE_MSR);
    if (!apic_base_msr_get_enabled(apic_base_msr)) {
        printf("APIC: Enabled bit not set\n");
    }

    return apic_base_msr_get_base_addr(apic_base_msr);
}

BOOT_CODE bool_t
apic_init(uint32_t apic_khz, bool_t mask_legacy_irqs)
{
    apic_version_t apic_version;
    uint32_t num_lvt_entries;

    apic_version.words[0] = apic_read_reg(APIC_VERSION);

    /* check for correct version: 0x1X */
    if (apic_version_get_version(apic_version) >> 4 != 1) {
        printf("APIC: apic_version must be 0x1X\n");
        return false;
    }

    /* check for correct number of LVT entries */
    num_lvt_entries = apic_version_get_max_lvt_entry(apic_version) + 1;
    if (num_lvt_entries < 3) {
        printf("APIC: number of LVT entries: %d\n", num_lvt_entries);
        printf("APIC: number of LVT entries must be >= 3\n");
        return false;
    }

    /* initialise APIC timer */
    apic_write_reg(APIC_TIMER_DIVIDE, 0xb); /* divisor = 1 */
    apic_write_reg(APIC_TIMER_COUNT, apic_khz * CONFIG_TIMER_TICK_MS);

    /* enable APIC using SVR register */
    apic_write_reg(
        APIC_SVR,
        apic_svr_new(
            0,           /* focus_processor_chk */
            1,           /* enabled             */
            int_spurious /* spurious_vector     */
        ).words[0]
    );

    /* mask/unmask LINT0 (used for legacy IRQ delivery) */
    apic_write_reg(
        APIC_LVT_LINT0,
        apic_lvt_new(
            0,                /* timer_mode      */
            mask_legacy_irqs, /* masked          */
            0,                /* trigger_mode    */
            0,                /* remote_irr      */
            0,                /* pin_polarity    */
            0,                /* delivery_status */
            7,                /* delivery_mode   */
            0                 /* vector          */
        ).words[0]
    );

    /* mask LINT1 (used for NMI delivery) */
    apic_write_reg(
        APIC_LVT_LINT1,
        apic_lvt_new(
            0,  /* timer_mode      */
            1,  /* masked          */
            0,  /* trigger_mode    */
            0,  /* remote_irr      */
            0,  /* pin_polarity    */
            0,  /* delivery_status */
            0,  /* delivery_mode   */
            0   /* vector          */
        ).words[0]
    );

    /* initialise timer */
    apic_write_reg(
        APIC_LVT_TIMER,
        apic_lvt_new(
            1,        /* timer_mode      */
            0,        /* masked          */
            0,        /* trigger_mode    */
            0,        /* remote_irr      */
            0,        /* pin_polarity    */
            0,        /* delivery_status */
            0,        /* delivery_mode   */
            int_timer /* vector          */
        ).words[0]
    );

    /*
    printf("APIC: ID=0x%x\n", apic_read_reg(APIC_ID) >> 24);
    printf("APIC: SVR=0x%x\n", apic_read_reg(APIC_SVR));
    printf("APIC: LVT_TIMER=0x%x\n", apic_read_reg(APIC_LVT_TIMER));
    printf("APIC: LVT_LINT0=0x%x\n", apic_read_reg(APIC_LVT_LINT0));
    printf("APIC: LVT_LINT1=0x%x\n", apic_read_reg(APIC_LVT_LINT1));
    printf("APIC: LVT_ERROR=0x%x\n", apic_read_reg(APIC_LVT_ERROR));
    printf("APIC: LVT_PERF_CNTR=0x%x\n", apic_read_reg(APIC_LVT_PERF_CNTR));
    printf("APIC: LVT_THERMAL=0x%x\n", apic_read_reg(APIC_LVT_THERMAL));
    */
    return true;
}

bool_t apic_is_interrupt_pending(void)
{
    unsigned int i;

    /* read 256-bit register: each 32-bit word is 16 byte aligned */
    assert(int_irq_min % 32 == 0);
    for (i = int_irq_min; i <= int_irq_max; i += 32) {
        if (apic_read_reg(APIC_IRR_BASE + i / 2) != 0) {
            return true;
        }
    }
    return false;
}

void apic_ack_active_interrupt(void)
{
    apic_write_reg(APIC_EOI, 0);
}

BOOT_CODE void
apic_send_init_ipi(cpu_id_t cpu_id)
{
    apic_write_reg(
        APIC_ICR2,
        apic_icr2_new(
            cpu_id /* dest */
        ).words[0]
    );
    apic_write_reg(
        APIC_ICR1,
        apic_icr1_new(
            0,  /* dest_shorthand  */
            1,  /* trigger_mode    */
            1,  /* level           */
            0,  /* delivery_status */
            0,  /* dest_mode       */
            5,  /* delivery_mode   */
            0   /* vector          */
        ).words[0]
    );

    apic_write_reg(
        APIC_ICR2,
        apic_icr2_new(
            cpu_id /* dest */
        ).words[0]
    );
    apic_write_reg(
        APIC_ICR1,
        apic_icr1_new(
            0,  /* dest_shorthand  */
            1,  /* trigger_mode    */
            0,  /* level           */
            0,  /* delivery_status */
            0,  /* dest_mode       */
            5,  /* delivery_mode   */
            0   /* vector          */
        ).words[0]
    );
}

BOOT_CODE void
apic_send_startup_ipi(cpu_id_t cpu_id, paddr_t startup_addr)
{
    /* check if 4K aligned */
    assert(IS_ALIGNED(startup_addr, PAGE_BITS));
    /* check if startup_addr < 640K */
    assert(startup_addr < 0xa0000);
    startup_addr >>= PAGE_BITS;

    apic_write_reg(
        APIC_ICR2,
        apic_icr2_new(
            cpu_id /* dest */
        ).words[0]
    );
    apic_write_reg(
        APIC_ICR1,
        apic_icr1_new(
            0,           /* dest_shorthand  */
            0,           /* trigger_mode    */
            0,           /* level           */
            0,           /* delivery_status */
            0,           /* dest_mode       */
            6,           /* delivery_mode   */
            startup_addr /* vector          */
        ).words[0]
    );
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <kernel/boot.h>
#include <machine/io.h>
#include <model/statedata.h>
#include <object/interrupt.h>
#include <arch/machine.h>
#include <arch/kernel/apic.h>
#include <arch/kernel/boot.h>
#include <arch/kernel/boot_sys.h>
#include <arch/kernel/vspace.h>
#include <arch/machine/fpu.h>
#include <arch/object/ioport.h>
#include <arch/linker.h>

#ifdef CONFIG_IOMMU
#include <plat/machine/intel-vtd.h>
#endif

#ifdef CONFIG_BENCHMARK
/* defined in boot_sys.c */
extern uint32_t kernel_pd_list[CONFIG_MAX_NUM_NODES][BIT(PD_BITS)];
#endif /* CONFIG_BENCHMARK */

/* functions exactly corresponding to abstract specification */

BOOT_CODE static void
init_irqs(cap_t root_cnode_cap, bool_t mask_legacy_irqs)
{
    irq_t i;

    for (i = 0; i <= maxIRQ; i++) {
        if (i == irq_timer) {
            setIRQState(IRQTimer, i);
        } else if (i == irq_iommu || i == 2 /* cascaded legacy PIC */) {
            setIRQState(IRQReserved, i);
        } else if (i >= irq_isa_min && i <= irq_isa_max)
            if (mask_legacy_irqs)
                /* Don't use setIRQState() here because it implicitly also enables */
                /* the IRQ on the PIC which only node 0 is allowed to do. */
            {
                intStateIRQTable[i] = IRQReserved;
            } else {
                setIRQState(IRQInactive, i);
            }
        else if (i >= irq_msi_min && i <= irq_msi_max) {
            setIRQState(IRQInactive, i);
        }
    }

    /* provide the IRQ control cap */
    write_slot(SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_IRQ_CTRL), cap_irq_control_cap_new());
}

/* Create a frame cap for the initial thread. */

static BOOT_CODE cap_t
create_it_frame_cap(pptr_t pptr, vptr_t vptr, asid_t asid, bool_t use_large)
{
    vm_page_size_t frame_size;

    if (use_large) {
        frame_size = IA32_4M;
    } else {
        frame_size = IA32_4K;
    }

    return
        cap_frame_cap_new(
            frame_size,                    /* capFSize           */
#ifdef CONFIG_IOMMU
            0,                             /* capFIsIOSpace      */
#endif
            ASID_LOW(asid),                /* capFMappedASIDLow  */
            vptr,                          /* capFMappedAddress  */
            ASID_HIGH(asid),               /* capFMappedASIDHigh */
            wordFromVMRights(VMReadWrite), /* capFVMRights       */
            pptr                           /* capFBasePtr        */
        );
}

BOOT_CODE cap_t
create_unmapped_it_frame_cap(pptr_t pptr, bool_t use_large)
{
    return create_it_frame_cap(pptr, 0, asidInvalid, use_large);
}

BOOT_CODE cap_t
create_mapped_it_frame_cap(cap_t pd_cap, pptr_t pptr, vptr_t vptr, asid_t asid, bool_t use_large)
{
    cap_t cap = create_it_frame_cap(pptr, vptr, asid, use_large);
    map_it_frame_cap(pd_cap, cap);
    return cap;
}

/* Create a page table for the initial thread */

static BOOT_CODE cap_t
create_it_page_table_cap(cap_t pd, pptr_t pptr, vptr_t vptr, asid_t asid)
{
    cap_t cap;
    cap = cap_page_table_cap_new(
              1,    /* capPTIsMapped      */
              asid, /* capPTMappedASID    */
              vptr, /* capPTMappedAddress */
              pptr  /* capPTBasePtr       */
          );
    if (asid != asidInvalid) {
        map_it_pt_cap(pd, cap);
    }
    return cap;
}

/* Create an address space for the initial thread.
 * This includes page directory and page tables */
BOOT_CODE static cap_t
create_it_address_space(cap_t root_cnode_cap, v_region_t it_v_reg)
{
    cap_t      pd_cap;
    vptr_t     pt_vptr;
    pptr_t     pt_pptr;
    slot_pos_t slot_pos_before;
    slot_pos_t slot_pos_after;
    pptr_t pd_pptr;

    /* create PD obj and cap */
    pd_pptr = alloc_region(PD_SIZE_BITS);
    if (!pd_pptr) {
        return cap_null_cap_new();
    }
    memzero(PDE_PTR(pd_pptr), 1 << PD_SIZE_BITS);
    copyGlobalMappings(PDE_PTR(pd_pptr));
    pd_cap =
        cap_page_directory_cap_new(
            true,    /* capPDIsMapped   */
            IT_ASID, /* capPDMappedASID */
            pd_pptr  /* capPDBasePtr    */
        );
    write_slot(SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_IT_PD), pd_cap);

    /* create all PT objs and caps necessary to cover userland image */
    slot_pos_before = ndks_boot.slot_pos_cur;

    for (pt_vptr = ROUND_DOWN(it_v_reg.start, PT_BITS + PAGE_BITS);
            pt_vptr < it_v_reg.end;
            pt_vptr += BIT(PT_BITS + PAGE_BITS)) {
        pt_pptr = alloc_region(PT_SIZE_BITS);
        if (!pt_pptr) {
            return cap_null_cap_new();
        }
        memzero(PTE_PTR(pt_pptr), 1 << PT_SIZE_BITS);
        if (!provide_cap(root_cnode_cap,
                         create_it_page_table_cap(pd_cap, pt_pptr, pt_vptr, IT_ASID))
           ) {
            return cap_null_cap_new();
        }
    }

    slot_pos_after = ndks_boot.slot_pos_cur;
    ndks_boot.bi_frame->ui_pt_caps = (slot_region_t) {
        slot_pos_before, slot_pos_after
    };

    return pd_cap;
}

BOOT_CODE static bool_t
create_device_frames(
    cap_t         root_cnode_cap,
    dev_p_regs_t* dev_p_regs
)
{
    slot_pos_t     slot_pos_before;
    slot_pos_t     slot_pos_after;
    vm_page_size_t frame_size;
    region_t       dev_reg;
    bi_dev_reg_t   bi_dev_reg;
    cap_t          frame_cap;
    uint32_t       i;
    pptr_t         f;

    for (i = 0; i < dev_p_regs->count; i++) {
        /* write the frame caps of this device region into the root CNode and update the bootinfo */
        dev_reg = paddr_to_pptr_reg(dev_p_regs->list[i]);
        /* use 4M frames if possible, otherwise use 4K frames */
        if (IS_ALIGNED(dev_reg.start, pageBitsForSize(IA32_4M)) &&
                IS_ALIGNED(dev_reg.end,   pageBitsForSize(IA32_4M))) {
            frame_size = IA32_4M;
        } else {
            frame_size = IA32_4K;
        }

        slot_pos_before = ndks_boot.slot_pos_cur;

        /* create/provide frame caps covering the region */
        for (f = dev_reg.start; f < dev_reg.end; f += BIT(pageBitsForSize(frame_size))) {
            frame_cap = create_it_frame_cap(f, 0, asidInvalid, frame_size == IA32_4M);
            if (!provide_cap(root_cnode_cap, frame_cap)) {
                return false;
            }
        }

        slot_pos_after = ndks_boot.slot_pos_cur;

        /* add device-region entry to bootinfo */
        bi_dev_reg.base_paddr = pptr_to_paddr((void*)dev_reg.start);
        bi_dev_reg.frame_size_bits = pageBitsForSize(frame_size);
        bi_dev_reg.frame_caps = (slot_region_t) {
            slot_pos_before, slot_pos_after
        };
        ndks_boot.bi_frame->dev_reg_list[i] = bi_dev_reg;
    }

    ndks_boot.bi_frame->num_dev_regs = dev_p_regs->count;
    return true;
}

/* This function initialises a node's kernel state. It does NOT initialise the CPU. */

BOOT_CODE bool_t
init_node_state(
    p_region_t    avail_p_reg,
    p_region_t    sh_p_reg,
    dev_p_regs_t* dev_p_regs,
    ui_info_t     ui_info,
    p_region_t    boot_mem_reuse_p_reg,
    node_id_t     node_id,
    uint32_t      num_nodes,
    /* parameters below not modeled in abstract specification */
    pde_t*        kernel_pd,
    pte_t*        kernel_pt
#ifdef CONFIG_IOMMU
    , cpu_id_t      cpu_id,
    uint32_t      num_drhu,
    paddr_t*      drhu_list,
    uint32_t      num_passthrough_dev,
    dev_id_t*     passthrough_dev_list,
    uint32_t*     pci_bus_used_bitmap
#endif
)
{
    cap_t         root_cnode_cap;
    vptr_t        bi_frame_vptr;
    vptr_t        ipcbuf_vptr;
    cap_t         it_pd_cap;
    cap_t         it_ap_cap;
    cap_t         ipcbuf_cap;
    pptr_t        bi_frame_pptr;
    create_frames_of_region_ret_t create_frames_ret;
    int i;
#ifdef CONFIG_BENCHMARK
    vm_attributes_t buffer_attr = {{ 0 }};
    uint32_t paddr;
    pde_t pde;
#endif /* CONFIG_BENCHMARK */

    /* convert from physical addresses to kernel pptrs */
    region_t avail_reg          = paddr_to_pptr_reg(avail_p_reg);
    region_t ui_reg             = paddr_to_pptr_reg(ui_info.p_reg);
    region_t sh_reg             = paddr_to_pptr_reg(sh_p_reg);
    region_t boot_mem_reuse_reg = paddr_to_pptr_reg(boot_mem_reuse_p_reg);

    /* convert from physical addresses to userland vptrs */
    v_region_t ui_v_reg;
    v_region_t it_v_reg;
    ui_v_reg.start = ui_info.p_reg.start - ui_info.pv_offset;
    ui_v_reg.end   = ui_info.p_reg.end   - ui_info.pv_offset;

    ipcbuf_vptr = ui_v_reg.end;
    bi_frame_vptr = ipcbuf_vptr + BIT(PAGE_BITS);

    /* The region of the initial thread is the user image + ipcbuf and boot info */
    it_v_reg.start = ui_v_reg.start;
    it_v_reg.end = bi_frame_vptr + BIT(PAGE_BITS);

    /* make the free memory available to alloc_region() */
    ndks_boot.freemem[0] = avail_reg;
    for (i = 1; i < MAX_NUM_FREEMEM_REG; i++) {
        ndks_boot.freemem[i] = REG_EMPTY;
    }

    /* initialise virtual-memory-related data structures (not in abstract spec) */
    if (!init_vm_state(kernel_pd, kernel_pt)) {
        return false;
    }

#ifdef CONFIG_BENCHMARK
    /* allocate and create the log buffer */
    buffer_attr.words[0] = IA32_PAT_MT_WRITE_THROUGH;

    paddr = pptr_to_paddr((void *) alloc_region(pageBitsForSize(IA32_4M)));

    /* allocate a 4MB buffer for logging */
    pde = pde_pde_4m_new(
              paddr,                                   /* page_base_address    */
              vm_attributes_get_ia32PATBit(buffer_attr),      /* pat                  */
              0,                                       /* avl_cte_depth        */
              1,                                       /* global               */
              0,                                       /* dirty                */
              0,                                       /* accessed             */
              vm_attributes_get_ia32PCDBit(buffer_attr),      /* cache_disabled       */
              vm_attributes_get_ia32PWTBit(buffer_attr),      /* write_through        */
              0,                                       /* super_user           */
              1,                                       /* read_write           */
              1                                        /* present              */
          );

    /* TODO this shouldn't be hardcoded */
    ((pde_t *) kernel_pd_list[0])[IA32_KSLOG_IDX] = pde;


    /* flush the tlb */
    invalidatePageStructureCache();

    /* if we crash here, the log isn't working */
#ifdef CONFIG_DEBUG_BUILD
    printf("Testing log\n");
    ksLog[0] = 0xdeadbeef;
    printf("Wrote to ksLog %x\n", ksLog[0]);
    assert(ksLog[0] == 0xdeadbeef);
#endif /* CONFIG_DEBUG_BUILD */
#endif /* CONFIG_BENCHMARK */

    /* create the root cnode */
    root_cnode_cap = create_root_cnode();

    /* create the IO port cap */
    write_slot(
        SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_IO_PORT),
        cap_io_port_cap_new(
            0,                /* first port */
            NUM_IO_PORTS - 1 /* last port  */
        )
    );

    /* create the cap for managing thread domains */
    create_domain_cap(root_cnode_cap);

    /* create the IRQ CNode */
    if (!create_irq_cnode()) {
        return false;
    }

    /* initialise the IRQ states and provide the IRQ control cap */
    init_irqs(root_cnode_cap, node_id != 0);

    /* create the bootinfo frame */
    bi_frame_pptr = allocate_bi_frame(node_id, num_nodes, ipcbuf_vptr);
    if (!bi_frame_pptr) {
        return false;
    }

    /* Construct an initial address space with enough virtual addresses
     * to cover the user image + ipc buffer and bootinfo frames */
    it_pd_cap = create_it_address_space(root_cnode_cap, it_v_reg);
    if (cap_get_capType(it_pd_cap) == cap_null_cap) {
        return false;
    }

    /* Create and map bootinfo frame cap */
    create_bi_frame_cap(
        root_cnode_cap,
        it_pd_cap,
        bi_frame_pptr,
        bi_frame_vptr
    );

    /* create the initial thread's IPC buffer */
    ipcbuf_cap = create_ipcbuf_frame(root_cnode_cap, it_pd_cap, ipcbuf_vptr);
    if (cap_get_capType(ipcbuf_cap) == cap_null_cap) {
        return false;
    }

    /* create all userland image frames */
    create_frames_ret =
        create_frames_of_region(
            root_cnode_cap,
            it_pd_cap,
            ui_reg,
            true,
            ui_info.pv_offset
        );
    if (!create_frames_ret.success) {
        return false;
    }
    ndks_boot.bi_frame->ui_frame_caps = create_frames_ret.region;

    /* create the initial thread's ASID pool */
    it_ap_cap = create_it_asid_pool(root_cnode_cap);
    if (cap_get_capType(it_ap_cap) == cap_null_cap) {
        return false;
    }
    write_it_asid_pool(it_ap_cap, it_pd_cap);

    /*
     * Initialise the NULL FPU state. This is different from merely zero'ing it
     * out (i.e., the NULL FPU state is non-zero), and must be performed before
     * the first thread is created.
     */
    resetFpu();
    saveFpuState(&ia32KSnullFpuState);
    ia32KSfpuOwner = NULL;

    /* create the idle thread */
    if (!create_idle_thread()) {
        return false;
    }

    /* create the initial thread */
    if (!create_initial_thread(
                root_cnode_cap,
                it_pd_cap,
                ui_info.v_entry,
                bi_frame_vptr,
                ipcbuf_vptr,
                ipcbuf_cap
            )) {
        return false;
    }

#ifdef CONFIG_IOMMU
    /* initialise VTD-related data structures and the IOMMUs */
    if (!vtd_init(cpu_id, num_drhu, pci_bus_used_bitmap, num_passthrough_dev, passthrough_dev_list)) {
        return false;
    }

    /* write number of IOMMU PT levels into bootinfo */
    ndks_boot.bi_frame->num_iopt_levels = ia32KSnumIOPTLevels;

    /* write IOSpace master cap */
    write_slot(SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_IO_SPACE), master_iospace_cap());
#endif

    /* convert the remaining free memory into UT objects and provide the caps */
    if (!create_untypeds(root_cnode_cap, boot_mem_reuse_reg)) {
        return false;
    }
    /* WARNING: alloc_region() must not be called anymore after here! */

    /* create device frames */
    if (!create_device_frames(root_cnode_cap, dev_p_regs)) {
        return false;
    }

    /* create all shared frames */
    create_frames_ret =
        create_frames_of_region(
            root_cnode_cap,
            it_pd_cap,
            sh_reg,
            false,
            0
        );
    if (!create_frames_ret.success) {
        return false;
    }
    ndks_boot.bi_frame->sh_frame_caps = create_frames_ret.region;;

    /* finalise the bootinfo frame */
    bi_finalise();

#ifdef DEBUG
    ia32KSconsolePort = console_port_of_node(node_id);
    ia32KSdebugPort = debug_port_of_node(node_id);
#endif

    return true;
}

/* This function initialises the CPU. It does NOT initialise any kernel state. */

BOOT_CODE bool_t
init_node_cpu(
    uint32_t apic_khz,
    bool_t   mask_legacy_irqs
)
{
    /* initialise CPU's descriptor table registers (GDTR, IDTR, LDTR, TR) */
    init_dtrs();

    /* initialise MSRs (needs an initialised TSS) */
    init_sysenter_msrs();

    /* setup additional PAT MSR */
    if (!init_pat_msr()) {
        return false;
    }

    /* initialise floating-point unit */
    Arch_initFpu();

    /* initialise local APIC */
    if (!apic_init(apic_khz, mask_legacy_irqs)) {
        return false;
    }

    return true;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <util.h>
#include <machine/io.h>
#include <arch/machine.h>
#include <arch/kernel/apic.h>
#include <arch/kernel/cmdline.h>
#include <arch/kernel/boot.h>
#include <arch/kernel/boot_sys.h>
#include <arch/kernel/vspace.h>
#include <arch/kernel/elf.h>
#include <arch/linker.h>
#include <plat/machine/acpi.h>
#include <plat/machine/devices.h>
#include <plat/machine/pci.h>
#include <plat/machine/pic.h>

/* addresses defined in linker script */
/* need a fake array to get the pointer from the linker script */

/* start/end of CPU boot code */
extern char _boot_cpu_start[1];
extern char _boot_cpu_end[1];

/* start/end of boot stack */
extern char _boot_stack_bottom[1];
extern char _boot_stack_top[1];

/* locations in kernel image */
extern char ki_boot_end[1];
extern char ki_end[1];

#ifdef DEBUG
/* start/end of .ndks section */
extern char _ndks_start[1];
extern char _ndks_end[1];

/* start/end of kernel stack */
extern char _kernel_stack_bottom[1];
extern char _kernel_stack_top[1];

/* kernel entry point */
extern char _start[1];
#endif

/* constants */

#define BOOT_NODE_PADDR 0x80000
#define NDKS_SIZE 0x3000
compile_assert(align_ndks_size, IS_ALIGNED(NDKS_SIZE, PAGE_BITS))
compile_assert(max_ndks_size, NDKS_SIZE <= PPTR_KDEV - PPTR_NDKS)

/* type definitions (directly corresponding to abstract specification) */

typedef struct glks {
    p_region_t   avail_p_reg; /* region of available physical memory on platform */
    p_region_t   ki_p_reg;    /* region where the kernel image is in */
    p_region_t   sh_p_reg;    /* region shared between nodes */
    uint32_t     num_nodes;   /* number of nodes */
    cpu_id_t     cpu_list       [CONFIG_MAX_NUM_NODES]; /* CPUs assigned to nodes */
    ui_info_t    ui_info_list   [CONFIG_MAX_NUM_NODES]; /* info about userland images */
    dev_p_regs_t dev_p_regs;  /* device memory regions */
    uint32_t     apic_khz;    /* frequency of APIC/bus */
#ifdef CONFIG_IOMMU
    uint32_t     num_drhu; /* number of IOMMUs */
    paddr_t      drhu_list[MAX_NUM_DRHU]; /* list of physical addresses of the IOMMUs */
    uint32_t     num_passthrough_dev;
    dev_id_t     passthrough_dev_list[CONFIG_MAX_NUM_PASSTHROUGH_DEVICES];
    uint32_t     pci_bus_used_bitmap[32]; /* 256 bit map of PCI buses in use */
#endif
} glks_t;

typedef char ndks_t[NDKS_SIZE];

/* global variables (called var_glks, var_ndks_list in abstract specification) */

BOOT_DATA_GLOB
glks_t glks;

DATA_GLOB ALIGN(BIT(PAGE_BITS))
ndks_t ndks_list[CONFIG_MAX_NUM_NODES];

/* The kernel stack is actually allocated per-node as part of ndks_list, above.
 * The following definition, in conjunction with the linker script, tells the
 * linker to reserve space in virtual memory at the start of the NDKS section.
 */
SECTION(".ndks.stack") ALIGN(BIT(PAGE_BITS))
char kernel_stack_alloc[4096];

/* global variables (not covered by abstract specification) */

BOOT_DATA_GLOB
cmdline_opt_t cmdline_opt;

/* the array type is uint32_t instead of pde_t due to a c-parser limitation */
DATA_GLOB ALIGN(BIT(PD_SIZE_BITS))
uint32_t kernel_pd_list[CONFIG_MAX_NUM_NODES][BIT(PD_BITS)];

/* the array type is uint32_t instead of pte_t due to a c-parser limitation */
DATA_GLOB ALIGN(BIT(PT_SIZE_BITS))
uint32_t kernel_pt_list[CONFIG_MAX_NUM_NODES][BIT(PT_BITS)];

#ifdef DEBUG

/* Determine whether we are in bootstrapping phase or runtime phase.
 * Is currently only needed to determine console port in debug mode.
 */
bool_t
in_boot_phase()
{
    paddr_t esp = pptr_to_paddr(get_current_esp());

    return (esp <= BOOT_NODE_PADDR ||
            (esp <= (paddr_t)_boot_stack_top && esp > (paddr_t)_boot_stack_bottom));
}

BOOT_CODE uint16_t
console_port_of_node(node_id_t node_id)
{
    return cmdline_opt.console_port[node_id];
}

BOOT_CODE uint16_t
debug_port_of_node(node_id_t node_id)
{
    return cmdline_opt.debug_port[node_id];
}
#endif

/* functions not modeled in abstract specification */

BOOT_CODE static paddr_t
load_boot_module(node_id_t node, multiboot_module_t* boot_module, paddr_t load_paddr)
{
    Elf32_Header_t* elf_file = (Elf32_Header_t*)boot_module->start;
    v_region_t v_reg;

    if (!elf32_checkFile(elf_file)) {
        printf("Boot module does not contain a valid ELF32 image\n");
        return 0;
    }

    v_reg = elf32_getMemoryBounds(elf_file);

    if (v_reg.end == 0) {
        printf("ELF32 image in boot module does not contain any segments\n");
        return 0;
    }
    v_reg.end = ROUND_UP(v_reg.end, PAGE_BITS);

    printf("size=0x%x v_entry=0x%x v_start=0x%x v_end=0x%x ",
           v_reg.end - v_reg.start,
           elf_file->e_entry,
           v_reg.start,
           v_reg.end
          );

    if (!IS_ALIGNED(v_reg.start, PAGE_BITS)) {
        printf("Userland image virtual start address must be 4KB-aligned\n");
        return 0;
    }
    if (v_reg.end + 2 * BIT(PAGE_BITS) > PPTR_BASE) {
        /* for IPC buffer frame and bootinfo frame, need 2*4K of additional userland virtual memory */
        printf("Userland image virtual end address too high\n");
        return 0;
    }
    if ((elf_file->e_entry < v_reg.start) || (elf_file->e_entry >= v_reg.end)) {
        printf("Userland image entry point does not lie within userland image\n");
        return 0;
    }

    /* fill ui_info struct */
    glks.ui_info_list[node].pv_offset = load_paddr - v_reg.start;
    glks.ui_info_list[node].p_reg.start = load_paddr;
    load_paddr += v_reg.end - v_reg.start;
    glks.ui_info_list[node].p_reg.end = load_paddr;
    glks.ui_info_list[node].v_entry = elf_file->e_entry;

    printf("p_start=0x%x p_end=0x%x\n",
           glks.ui_info_list[node].p_reg.start,
           glks.ui_info_list[node].p_reg.end
          );

    if (load_paddr > glks.avail_p_reg.end) {
        printf("End of loaded userland image lies outside of usable physical memory\n");
        return 0;
    }

    /* initialise all initial userland memory and load potentially sparse ELF image */
    memzero(
        (void*)glks.ui_info_list[node].p_reg.start,
        glks.ui_info_list[node].p_reg.end - glks.ui_info_list[node].p_reg.start
    );
    elf32_load(elf_file, glks.ui_info_list[node].pv_offset);

    return load_paddr;
}

BOOT_CODE void
insert_dev_p_reg(p_region_t reg)
{
    if (glks.dev_p_regs.count < CONFIG_MAX_NUM_BOOTINFO_DEVICE_REGIONS) {
        glks.dev_p_regs.list[glks.dev_p_regs.count] = reg;
        glks.dev_p_regs.count++;
        printf("\n");
    } else {
        printf(" -> IGNORED! (too many)\n");
    }
}

/* functions directly corresponding to abstract specification */

BOOT_CODE cpu_id_t
cur_cpu_id(void)
{
    cpu_id_t cpu_id;
    paddr_t  esp = pptr_to_paddr(get_current_esp());

    if (esp <= (paddr_t)_boot_stack_top && esp > (paddr_t)_boot_stack_bottom) {
        cpu_id = glks.cpu_list[0];
    } else {
        cpu_id = esp >> 11;
    }

    return cpu_id;
}

BOOT_CODE node_id_t
node_of_cpu(cpu_id_t cpu_id)
{
    node_id_t i;

    for (i = 0; i < glks.num_nodes;  i++) {
        if (glks.cpu_list[i] == cpu_id) {
            return i;
        }
    }
    /* Is it even possible for this to happen? */
    fail("Couldn't find node of CPU");
}


BOOT_CODE static void
discover_devices(void)
{
    /* We do not add any ia32 specific devices. Just add any platform ones */
    platAddDevices();
}

/* split a region of physical memory into n mutually disjoint pieces */

BOOT_CODE static p_region_t
split_region(unsigned int i, unsigned int n, p_region_t reg)
{
    uint32_t offset;
    uint32_t total_frames = (reg.end - reg.start) >> PAGE_BITS;
    uint32_t frames_div = total_frames / n;
    uint32_t frames_mod = total_frames % n;

    if (i < frames_mod) {
        offset = (i * (frames_div + 1)) << PAGE_BITS;
        return (p_region_t) {
            .start = reg.start + offset,
             .end   = reg.start + offset + ((frames_div + 1) << PAGE_BITS)
        };
    } else {
        offset = (frames_mod * (frames_div + 1) + (i - frames_mod) * frames_div) << PAGE_BITS;
        return (p_region_t) {
            .start = reg.start + offset,
             .end   = reg.start + offset + (frames_div << PAGE_BITS)
        };
    }
}

BOOT_CODE static bool_t
lift_ndks(node_id_t node_id)
{
    p_region_t ndks_p_reg;

    ndks_p_reg.start = pptr_to_paddr(ndks_list[node_id]);
    ndks_p_reg.end = ndks_p_reg.start + NDKS_SIZE;

    if (!map_kernel_window(
                (pde_t*)kernel_pd_list[node_id],
                (pte_t*)kernel_pt_list[node_id],
                ndks_p_reg
#ifdef CONFIG_IOMMU
                , node_id == 0 ? glks.num_drhu : 0,
                glks.drhu_list
#endif
            )) {
        return false;
    }
    write_cr3(pptr_to_paddr(kernel_pd_list[node_id]));
    /* Sync up the compilers view of the world here to force the PD to actually
     * be set *right now* instead of delayed */
    asm volatile("" ::: "memory");
    return true;
}

static BOOT_CODE bool_t
try_boot_node(void)
{
    p_region_t boot_mem_reuse_p_reg;

    cpu_id_t   cpu_id  = cur_cpu_id();
    node_id_t  node_id = node_of_cpu(cpu_id);

    uint32_t      num_nodes  = glks.num_nodes;
    ui_info_t     ui_info    = glks.ui_info_list[node_id];
    dev_p_regs_t* dev_p_regs = &glks.dev_p_regs;

    /* calculate this node's available physical memory */
    p_region_t this_avail_p_reg = split_region(node_id, num_nodes, glks.avail_p_reg);

    /* if we only boot up one node, we can reuse boot code/data memory */
    if (num_nodes == 1) {
        boot_mem_reuse_p_reg.start = PADDR_LOAD;
        boot_mem_reuse_p_reg.end = (paddr_t)ki_boot_end - BASE_OFFSET;
    } else {
        boot_mem_reuse_p_reg = P_REG_EMPTY;
    }

    /* map NDKS (node kernel state) into PD/PT and activate PD */
    if (!lift_ndks(node_id)) {
        return false;
    }

    /* initialise NDKS and kernel heap */
    if (!init_node_state(
                this_avail_p_reg,
                glks.sh_p_reg,
                dev_p_regs,
                ui_info,
                boot_mem_reuse_p_reg,
                node_id,
                num_nodes,
                /* parameters below not modeled in abstract specification */
                (pde_t*)kernel_pd_list[node_id],
                (pte_t*)kernel_pt_list[node_id]
#ifdef CONFIG_IOMMU
                , cpu_id,
                node_id == 0 ? glks.num_drhu : 0,
                glks.drhu_list,
                glks.num_passthrough_dev,
                glks.passthrough_dev_list,
                glks.pci_bus_used_bitmap
#endif
            )) {
        return false;
    }

    /* initialise the CPU */
    if (!init_node_cpu(
                glks.apic_khz,
                node_id != 0
            )) {
        return false;
    }
    return true;
}

/* This is the entry function for SMP nodes. Node 0 calls
 * try_boot_node directly */
BOOT_CODE VISIBLE void
boot_node(void)
{
    bool_t result;
    result = try_boot_node();
    if (!result) {
        fail("Failed to start node :(\n");
    }
}

BOOT_CODE static void
start_cpu(cpu_id_t cpu_id, paddr_t boot_fun_paddr)
{
    /* memory fence needed before starting the other CPU */
    ia32_mfence();

    /* starting the other CPU */
    apic_send_init_ipi(cpu_id);
    apic_send_startup_ipi(cpu_id, boot_fun_paddr);
}

static BOOT_CODE bool_t
try_boot_sys(
    unsigned long multiboot_magic,
    multiboot_info_t* mbi,
    uint32_t apic_khz
)
{
    /* ==== following code corresponds to the "select" in abstract specification ==== */

    acpi_rsdt_t* acpi_rsdt; /* physical address of ACPI root */
    paddr_t mods_end_paddr; /* physical address where boot modules end */
    paddr_t load_paddr;
    unsigned int i;
    p_region_t ui_p_regs;

    glks.num_nodes = 1; /* needed to enable console output */

    if (multiboot_magic != MULTIBOOT_MAGIC) {
        printf("Boot loader not multiboot compliant\n");
        return false;
    }
    cmdline_parse(mbi->cmdline, &cmdline_opt);

    /* assert correct NDKS location and size */
    assert((uint32_t)_ndks_start == PPTR_NDKS);
    assert(_ndks_end - _ndks_start <= NDKS_SIZE);

    if ((mbi->flags & MULTIBOOT_INFO_MEM_FLAG) == 0) {
        printf("Boot loader did not provide information about physical memory size\n");
        return false;
    }

    assert(_boot_cpu_end - _boot_cpu_start < 0x400);
    if ((mbi->mem_lower << 10) < BOOT_NODE_PADDR + 0x400) {
        printf("Need at least 513K of available lower physical memory\n");
        return false;
    }

    /* copy CPU bootup code to lower memory */
    memcpy((void*)BOOT_NODE_PADDR, _boot_cpu_start, _boot_cpu_end - _boot_cpu_start);

    /* calculate available physical memory (above 1M) */
    glks.avail_p_reg.start = 0x100000;
    glks.avail_p_reg.end = ROUND_DOWN(glks.avail_p_reg.start + (mbi->mem_upper << 10), PAGE_BITS);

    /* check maximum seL4 can use */
    if (glks.avail_p_reg.end > PADDR_TOP) {
        glks.avail_p_reg.end = PADDR_TOP;
    }

    printf("Physical memory usable by seL4: start=0x%x end=0x%x size=0x%x\n",
           glks.avail_p_reg.start,
           glks.avail_p_reg.end,
           glks.avail_p_reg.end - glks.avail_p_reg.start
          );

    glks.ki_p_reg.start = PADDR_LOAD;
    glks.ki_p_reg.end = pptr_to_paddr(ki_end);

    printf("Kernel loaded to: start=0x%x end=0x%x size=0x%x entry=0x%x\n",
           glks.ki_p_reg.start,
           glks.ki_p_reg.end,
           glks.ki_p_reg.end - glks.ki_p_reg.start,
           (paddr_t)_start
          );
    printf("Kernel stack size: 0x%x\n", _kernel_stack_top - _kernel_stack_bottom);

    glks.apic_khz = apic_khz;
    printf("APIC: Bus frequency is %d MHz\n", glks.apic_khz / 1000);

    /* remapping legacy IRQs to their correct vectors */
    pic_remap_irqs(IRQ_INT_OFFSET);

    /* Prepare for accepting device regions from here on */
    glks.dev_p_regs.count = 0;

    /* get ACPI root table */
    acpi_rsdt = acpi_init();
    if (!acpi_rsdt) {
        return false;
    }

#ifdef CONFIG_IOMMU
    if (cmdline_opt.disable_iommu) {
        glks.num_drhu = 0;
    } else {
        /* query available IOMMUs from ACPI */
        acpi_dmar_scan(
            acpi_rsdt,
            glks.drhu_list,
            &glks.num_drhu,
            MAX_NUM_DRHU,
            glks.passthrough_dev_list,
            &glks.num_passthrough_dev,
            CONFIG_MAX_NUM_PASSTHROUGH_DEVICES
        );
    }
#endif

    /* query available CPUs from ACPI */
    glks.num_nodes = acpi_madt_scan(acpi_rsdt, glks.cpu_list, CONFIG_MAX_NUM_NODES);
    if (glks.num_nodes == 0) {
        printf("No CPUs detected\n");
        return false;
    }

    if (glks.num_nodes > cmdline_opt.max_num_nodes) {
        glks.num_nodes = cmdline_opt.max_num_nodes;
    }
    printf("Will boot up %d seL4 node(s)\n", glks.num_nodes);

    if (!(mbi->flags & MULTIBOOT_INFO_MODS_FLAG)) {
        printf("Boot loader did not provide information about boot modules\n");
        return false;
    }

    printf("Detected %d boot module(s):\n", mbi->mod_count);
    mods_end_paddr = 0;

    for (i = 0; i < mbi->mod_count; i++) {
        printf(
            "  module #%d: start=0x%x end=0x%x size=0x%x name='%s'\n",
            i,
            mbi->mod_list[i].start,
            mbi->mod_list[i].end,
            mbi->mod_list[i].end - mbi->mod_list[i].start,
            mbi->mod_list[i].name
        );
        if ((int32_t)(mbi->mod_list[i].end - mbi->mod_list[i].start) <= 0) {
            printf("Invalid boot module size! Possible cause: boot module file not found by QEMU\n");
            return false;
        }
        if (mods_end_paddr < mbi->mod_list[i].end) {
            mods_end_paddr = mbi->mod_list[i].end;
        }
    }
    mods_end_paddr = ROUND_UP(mods_end_paddr, PAGE_BITS);
    assert(mods_end_paddr > glks.ki_p_reg.end);

    if (mbi->mod_count < 1) {
        printf("Expect at least one boot module (containing a userland image)\n");
        return false;
    }

    printf("ELF-loading userland images from boot modules:\n");
    load_paddr = mods_end_paddr;

    for (i = 0; i < mbi->mod_count && i < glks.num_nodes; i++) {
        printf("  module #%d for node #%d: ", i, i);
        load_paddr = load_boot_module(i, mbi->mod_list + i, load_paddr);
        if (!load_paddr) {
            return false;
        }
    }

    for (i = mbi->mod_count; i < glks.num_nodes; i++) {
        printf("  module #%d for node #%d: ", mbi->mod_count - 1, i);
        load_paddr = load_boot_module(i, mbi->mod_list + mbi->mod_count - 1, load_paddr);
        if (!load_paddr) {
            return false;
        }
    }

    /* calculate final location of userland images */
    ui_p_regs.start = glks.ki_p_reg.end;
    ui_p_regs.end = ui_p_regs.start + load_paddr - mods_end_paddr;

    printf(
        "Moving loaded userland images to final location: from=0x%x to=0x%x size=0x%x\n",
        mods_end_paddr,
        ui_p_regs.start,
        ui_p_regs.end - ui_p_regs.start
    );
    memcpy((void*)ui_p_regs.start, (void*)mods_end_paddr, ui_p_regs.end - ui_p_regs.start);

    for (i = 0; i < glks.num_nodes; i++) {
        /* adjust p_reg and pv_offset to final load address */
        glks.ui_info_list[i].p_reg.start -= mods_end_paddr - ui_p_regs.start;
        glks.ui_info_list[i].p_reg.end   -= mods_end_paddr - ui_p_regs.start;
        glks.ui_info_list[i].pv_offset   -= mods_end_paddr - ui_p_regs.start;
    }

    /* ==== following code corresponds to abstract specification after "select" ==== */

    /* exclude kernel image from available memory */
    assert(glks.avail_p_reg.start == glks.ki_p_reg.start);
    glks.avail_p_reg.start = glks.ki_p_reg.end;

    /* exclude userland images from available memory */
    assert(glks.avail_p_reg.start == ui_p_regs.start);
    glks.avail_p_reg.start = ui_p_regs.end;

    /* choose shared region */
    glks.sh_p_reg.start = glks.avail_p_reg.start;
    glks.sh_p_reg.end = glks.sh_p_reg.start + (cmdline_opt.num_sh_frames << PAGE_BITS);
    if (glks.sh_p_reg.end > glks.avail_p_reg.end || glks.sh_p_reg.end < glks.sh_p_reg.start) {
        printf("Not enough usable physical memory to allocate shared region\n");
        return false;
    }

    /* exclude shared region from available memory */
    assert(glks.avail_p_reg.start == glks.sh_p_reg.start);
    glks.avail_p_reg.start = glks.sh_p_reg.end;

    discover_devices();

    printf("Starting node #0\n");
    if (!try_boot_node()) {
        return false;
    }

    /* start up other CPUs and initialise their nodes */
    for (i = 1; i < glks.num_nodes; i++) {
        printf("Starting node #%d\n", i);
        start_cpu(glks.cpu_list[i], BOOT_NODE_PADDR);
    }
    return true;
}

BOOT_CODE VISIBLE void
boot_sys(
    unsigned long multiboot_magic,
    multiboot_info_t* mbi,
    uint32_t apic_khz)
{
    bool_t result;
    result = try_boot_sys(multiboot_magic, mbi, apic_khz);

    if (!result) {
        fail("boot_sys failed for some reason :(\n");
    }
}

#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/cmdline.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <util.h>
#include <machine/io.h>
#include <arch/kernel/cmdline.h>
#include <arch/kernel/boot_sys.h>
#include <arch/linker.h>

/* 'cmdline_val' is declared globally because of a C-subset restriction.
 * It is only used in cmdline_parse(), which therefore is non-reentrant.
 */
#define MAX_CMDLINE_VAL_LEN 1000
BOOT_DATA_GLOB
char cmdline_val[MAX_CMDLINE_VAL_LEN];

/* workaround because string literals are not supported by C parser */
const char cmdline_str_max_num_nodes[]  = {'m', 'a', 'x', '_', 'n', 'u', 'm', '_', 'n', 'o', 'd', 'e', 's', 0};
const char cmdline_str_num_sh_frames[]  = {'n', 'u', 'm', '_', 's', 'h', '_', 'f', 'r', 'a', 'm', 'e', 's', 0};
const char cmdline_str_disable_iommu[]  = {'d', 'i', 's', 'a', 'b', 'l', 'e', '_', 'i', 'o', 'm', 'm', 'u', 0};

static int is_space(char c)
{
    return c <= ' ';
}

static int parse_opt(const char *cmdline, const char *opt, char *value, int bufsize)
{
    int len = -1;
    const char *optptr = NULL;

    while (true) {
        for (; is_space(*cmdline) && (*cmdline != 0); cmdline++);
        if (*cmdline == 0) {
            break;
        }

        for (optptr = opt; *optptr && *cmdline && (*cmdline != '=') && !is_space(*cmdline) && (*optptr == *cmdline); optptr++, cmdline++);

        if (*optptr == '\0' && *cmdline == '=') {
            cmdline++;

            for (len = 0; !is_space(*cmdline) && (len < bufsize - 1); cmdline++, len++) {
                value[len] = *cmdline;
            }
            if (bufsize) {
                value[len] = '\0';
            }
        }
        for (; !is_space(*cmdline); cmdline++);
    }

    return len;
}

#ifdef CONFIG_IOMMU
static int parse_bool(const char *cmdline, const char *opt)
{
    const char *optptr = NULL;

    while (1) {
        for (; is_space(*cmdline) && (*cmdline != 0); cmdline++);
        if (*cmdline == 0) {
            return 0;
        }

        for (optptr = opt; *optptr && *cmdline && !is_space(*cmdline) && (*optptr == *cmdline); optptr++, cmdline++);

        if (*optptr == '\0' && is_space(*cmdline)) {
            return 1;
        } else {
            for (; !is_space(*cmdline); cmdline++);
        }
    }
}
#endif

#ifdef DEBUG
static void parse_uint16_array(char* str, uint16_t* array, int array_size)
{
    char* last;
    int   i = 0;
    int   v;

    while (str && i < array_size) {
        for (last = str; *str && *str != ','; str++);
        if (*str == 0) {
            str = 0;
        } else {
            *str = 0;
            str++;
        }
        v = str_to_int(last);
        if (v == -1) {
            array[i] = 0;
        } else {
            array[i] = v;
        }
        i++;
    }
}
#endif

void cmdline_parse(const char *cmdline, cmdline_opt_t* cmdline_opt)
{
    int  i;

#ifdef DEBUG
    /* initialise to default */
    for (i = 0; i < CONFIG_MAX_NUM_NODES; i++) {
        cmdline_opt->console_port[i] = 0;
        cmdline_opt->debug_port[i] = 0;
    }
    cmdline_opt->console_port[0] = 0x3f8;
    cmdline_opt->debug_port[0] = 0x3f8;

    if (parse_opt(cmdline, "console_port", cmdline_val, MAX_CMDLINE_VAL_LEN) != -1) {
        parse_uint16_array(cmdline_val, cmdline_opt->console_port, CONFIG_MAX_NUM_NODES);
    }

    /* initialise console ports to enable debug output */
    for (i = 0; i < CONFIG_MAX_NUM_NODES; i++) {
        if (cmdline_opt->console_port[i]) {
            serial_init(cmdline_opt->console_port[i]);
        }
    }

    /* only start printing here after having parsed/set/initialised the console_port */
    printf("\nBoot config: parsing cmdline '%s'\n", cmdline);

    for (i = 0; i < CONFIG_MAX_NUM_NODES; i++)
        if (cmdline_opt->console_port[i]) {
            printf("Boot config: console_port of node #%d = 0x%x\n", i, cmdline_opt->console_port[i]);
        }

    if (parse_opt(cmdline, "debug_port", cmdline_val, MAX_CMDLINE_VAL_LEN) != -1) {
        parse_uint16_array(cmdline_val, cmdline_opt->debug_port, CONFIG_MAX_NUM_NODES);
    }

    /* initialise debug ports */
    for (i = 0; i < CONFIG_MAX_NUM_NODES; i++) {
        if (cmdline_opt->debug_port[i]) {
            serial_init(cmdline_opt->debug_port[i]);
            printf("Boot config: debug_port of node #%d = 0x%x\n", i, cmdline_opt->debug_port[i]);
        }
    }
#endif

#ifdef CONFIG_IOMMU
    cmdline_opt->disable_iommu = parse_bool(cmdline, cmdline_str_disable_iommu);
    printf("Boot config: disable_iommu = %s\n", cmdline_opt->disable_iommu ? "true" : "false");
#endif

    /* parse max_num_nodes option */
    cmdline_opt->max_num_nodes = 1; /* default */
    if (parse_opt(cmdline, cmdline_str_max_num_nodes, cmdline_val, MAX_CMDLINE_VAL_LEN) != -1) {
        i = str_to_int(cmdline_val);
        if (i > 0 && i <= CONFIG_MAX_NUM_NODES) {
            cmdline_opt->max_num_nodes = i;
        }
    }
    printf("Boot config: max_num_nodes = %d\n", cmdline_opt->max_num_nodes);

    /* parse num_sh_frames option */
    cmdline_opt->num_sh_frames = 0; /* default */
    if (parse_opt(cmdline, cmdline_str_num_sh_frames, cmdline_val, MAX_CMDLINE_VAL_LEN) != -1) {
        i = str_to_int(cmdline_val);
        if (i >= 0 && i < BIT(32 - PAGE_BITS)) {
            cmdline_opt->num_sh_frames = i;
        }
    }
    printf("Boot config: num_sh_frames = 0x%x\n", cmdline_opt->num_sh_frames);
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/elf.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <arch/kernel/elf.h>
#include <arch/linker.h>

/* minimal ELF functionality for loading GRUB boot module */

BOOT_CODE bool_t
elf32_checkFile(Elf32_Header_t* elfFile)
{
    return (
               elfFile->e_ident[0] == '\177' &&
               elfFile->e_ident[1] == 'E'    &&
               elfFile->e_ident[2] == 'L'    &&
               elfFile->e_ident[3] == 'F'    &&
               elfFile->e_ident[4] == 1
           );
}

BOOT_CODE v_region_t
elf32_getMemoryBounds(Elf32_Header_t* elfFile)
{
    Elf32_Phdr_t* phdr = (Elf32_Phdr_t*)((paddr_t)elfFile + elfFile->e_phoff);
    v_region_t elf_reg;
    vptr_t     sect_start;
    vptr_t     sect_end;
    uint32_t   i;

    elf_reg.start = 0xffffffff;
    elf_reg.end = 0;

    /* loop through all program headers (segments) and record start/end address */
    for (i = 0; i < elfFile->e_phnum; i++) {
        if (phdr[i].p_memsz > 0) {
            sect_start = phdr[i].p_vaddr;
            sect_end = sect_start + phdr[i].p_memsz;
            if (sect_start < elf_reg.start) {
                elf_reg.start = sect_start;
            }
            if (sect_end > elf_reg.end) {
                elf_reg.end = sect_end;
            }
        }
    }

    return elf_reg;
}

BOOT_CODE void
elf32_load(Elf32_Header_t* elfFile, int32_t offset)
{
    Elf32_Phdr_t* phdr = (Elf32_Phdr_t*)((paddr_t)elfFile + elfFile->e_phoff);
    paddr_t       src;
    paddr_t       dst;
    uint32_t      len;
    uint32_t      i;

    /* loop through all program headers (segments) and load them */
    for (i = 0; i < elfFile->e_phnum; i++) {
        src = (paddr_t)elfFile + phdr[i].p_offset;
        dst = phdr[i].p_vaddr + offset;
        len = phdr[i].p_filesz;
        memcpy((void*)dst, (char*)src, len);
        dst += len;
        memset((void*)dst, 0, phdr[i].p_memsz - len);
    }
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/lock.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#ifdef DEBUG

#include <arch/kernel/lock.h>
#include <arch/linker.h>

/* global spinlocks */
lock_t lock_debug DATA_GLOB;

#endif /* DEBUG */
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/thread.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <object.h>
#include <machine.h>
#include <arch/model/statedata.h>
#include <arch/kernel/vspace.h>
#include <arch/kernel/thread.h>
#include <arch/linker.h>

void
Arch_switchToThread(tcb_t* tcb)
{
    word_t base;

    /* set PD */
    setVMRoot(tcb);

    /* update the GDT_TLS entry with the thread's TLS_BASE address */
    base = getRegister(tcb, TLS_BASE);
    gdt_entry_gdt_data_ptr_set_base_low(ia32KSgdt + GDT_TLS, base);
    gdt_entry_gdt_data_ptr_set_base_mid(ia32KSgdt + GDT_TLS,  (base >> 16) & 0xFF);
    gdt_entry_gdt_data_ptr_set_base_high(ia32KSgdt + GDT_TLS, (base >> 24) & 0xFF);

    /* update the GDT_IPCBUF entry with the thread's IPC buffer address */
    base = tcb->tcbIPCBuffer;
    gdt_entry_gdt_data_ptr_set_base_low(ia32KSgdt + GDT_IPCBUF, base);
    gdt_entry_gdt_data_ptr_set_base_mid(ia32KSgdt + GDT_IPCBUF,  (base >> 16) & 0xFF);
    gdt_entry_gdt_data_ptr_set_base_high(ia32KSgdt + GDT_IPCBUF, (base >> 24) & 0xFF);
}

BOOT_CODE void
Arch_configureIdleThread(tcb_t* tcb)
{
    setRegister(tcb, EFLAGS, BIT(9) | BIT(1)); /* enable interrupts and set bit 1 which is always 1 */
    setRegister(tcb, NextEIP, (uint32_t)idleThreadStart);
    setRegister(tcb, CS, SEL_CS_0);
    setRegister(tcb, DS, SEL_DS_0);
    setRegister(tcb, ES, SEL_DS_0);
    setRegister(tcb, FS, SEL_DS_0);
    setRegister(tcb, GS, SEL_DS_0);
    setRegister(tcb, SS, SEL_DS_0);
}

void
Arch_switchToIdleThread(void)
{
    /* Don't need to do anything */
}

void CONST
Arch_activateIdleThread(tcb_t* tcb)
{
    /* Don't need to do anything */
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <api/syscall.h>
#include <config.h>
#include <machine/io.h>
#include <kernel/boot.h>
#include <kernel/cspace.h>
#include <kernel/thread.h>
#include <model/statedata.h>
#include <object/cnode.h>
#include <arch/api/invocation.h>
#include <arch/kernel/apic.h>
#include <arch/kernel/vspace.h>
#include <arch/linker.h>

struct findPDForASID_ret {
    exception_t status;
    pde_t *pd;
};
typedef struct findPDForASID_ret findPDForASID_ret_t;

struct lookupPTSlot_ret {
    exception_t status;
    pte_t*      ptSlot;
};
typedef struct lookupPTSlot_ret lookupPTSlot_ret_t;

/* 'gdt_idt_ptr' is declared globally because of a C-subset restriction.
 * It is only used in init_drts(), which therefore is non-reentrant.
 */
gdt_idt_ptr_t gdt_idt_ptr;

/* setup initial boot page directory */

/* need a fake array to get the pointer from the linker script */
extern pde_t _boot_pd[1];

/* This function is duplicated from pde_pde_4m_ptr_new, generated by the
 * bitfield tool in structures_gen.h. It is required by functions that need to
 * call it before the MMU is turned on. Any changes made to the bitfield
 * generation need to be replicated here.
 */
PHYS_CODE
static inline void
pde_pde_4m_ptr_new_phys(pde_t *pde_ptr, uint32_t page_base_address,
                        uint32_t pat, uint32_t avl, uint32_t global, uint32_t dirty,
                        uint32_t accessed, uint32_t cache_disabled, uint32_t write_through,
                        uint32_t super_user, uint32_t read_write, uint32_t present)
{
    pde_ptr->words[0] = 0;

    pde_ptr->words[0] |= (page_base_address & 0xffc00000) >> 0;
    pde_ptr->words[0] |= (pat & 0x1) << 12;
    pde_ptr->words[0] |= (avl & 0x7) << 9;
    pde_ptr->words[0] |= (global & 0x1) << 8;
    pde_ptr->words[0] |= (pde_pde_4m & 0x1) << 7;
    pde_ptr->words[0] |= (dirty & 0x1) << 6;
    pde_ptr->words[0] |= (accessed & 0x1) << 5;
    pde_ptr->words[0] |= (cache_disabled & 0x1) << 4;
    pde_ptr->words[0] |= (write_through & 0x1) << 3;
    pde_ptr->words[0] |= (super_user & 0x1) << 2;
    pde_ptr->words[0] |= (read_write & 0x1) << 1;
    pde_ptr->words[0] |= (present & 0x1) << 0;
}

PHYS_CODE VISIBLE void
init_boot_pd(void)
{
    unsigned int i;

    /* identity mapping from 0 up to PPTR_BASE (virtual address) */
    for (i = 0; i < (PPTR_BASE >> pageBitsForSize_phys(IA32_4M)); i++) {
        pde_pde_4m_ptr_new_phys(
            _boot_pd + i,
            i << pageBitsForSize_phys(IA32_4M), /* physical address */
            0, /* pat            */
            0, /* avl            */
            1, /* global         */
            0, /* dirty          */
            0, /* accessed       */
            0, /* cache_disabled */
            0, /* write_through  */
            0, /* super_user     */
            1, /* read_write     */
            1  /* present        */
        );
    }

    /* mapping of PPTR_BASE (virtual address) to PADDR_BASE up to end of virtual address space */
    for (i = 0; i < ((-PPTR_BASE) >> pageBitsForSize_phys(IA32_4M)); i++) {
        pde_pde_4m_ptr_new_phys(
            _boot_pd + i + (PPTR_BASE >> pageBitsForSize_phys(IA32_4M)),
            (i << pageBitsForSize_phys(IA32_4M)) + PADDR_BASE, /* physical address */
            0, /* pat            */
            0, /* avl            */
            1, /* global         */
            0, /* dirty          */
            0, /* accessed       */
            0, /* cache_disabled */
            0, /* write_through  */
            0, /* super_user     */
            1, /* read_write     */
            1  /* present        */
        );
    }
}

/* initialise the Task State Segment (TSS) */

BOOT_CODE static void
init_tss(tss_t* tss)
{
    tss_ptr_new(
        tss,
        0,              /* io_map_base  */
        0,              /* trap         */
        SEL_NULL,       /* sel_ldt      */
        SEL_NULL,       /* gs           */
        SEL_NULL,       /* fs           */
        SEL_NULL,       /* ds           */
        SEL_NULL,       /* ss           */
        SEL_NULL,       /* cs           */
        SEL_NULL,       /* es           */
        0,              /* edi          */
        0,              /* esi          */
        0,              /* ebp          */
        0,              /* esp          */
        0,              /* ebx          */
        0,              /* edx          */
        0,              /* ecx          */
        0,              /* eax          */
        0,              /* eflags       */
        0,              /* eip          */
        0,              /* cr3          */
        SEL_NULL,       /* ss2          */
        0,              /* esp2         */
        SEL_NULL,       /* ss1          */
        0,              /* esp1         */
        SEL_DS_0,       /* ss0          */
        0,              /* esp0         */
        0               /* prev_task    */
    );
}

/* initialise Global Descriptor Table (GDT) */

BOOT_CODE static void
init_gdt(gdt_entry_t* gdt, tss_t* tss)
{
    uint32_t tss_addr = (uint32_t)tss;

    /* Set the NULL descriptor */
    gdt[GDT_NULL] = gdt_entry_gdt_null_new();

    /* 4GB flat kernel code segment on ring 0 descriptor */
    gdt[GDT_CS_0] = gdt_entry_gdt_code_new(
                        0,      /* Base high 8 bits             */
                        1,      /* Granularity                  */
                        1,      /* Operation size               */
                        0,      /* Available                    */
                        0xf,    /* Segment limit high 4 bits    */
                        1,      /* Present                      */
                        0,      /* Descriptor privilege level   */
                        1,      /* readable                     */
                        1,      /* accessed                     */
                        0,      /* Base middle 8 bits           */
                        0,      /* Base low 16 bits             */
                        0xffff  /* Segment limit low 16 bits    */
                    );

    /* 4GB flat kernel data segment on ring 0 descriptor */
    gdt[GDT_DS_0] = gdt_entry_gdt_data_new(
                        0,      /* Base high 8 bits             */
                        1,      /* Granularity                  */
                        1,      /* Operation size               */
                        0,      /* Available                    */
                        0xf,    /* Segment limit high 4 bits    */
                        1,      /* Present                      */
                        0,      /* Descriptor privilege level   */
                        1,      /* writable                     */
                        1,      /* accessed                     */
                        0,      /* Base middle 8 bits           */
                        0,      /* Base low 16 bits             */
                        0xffff  /* Segment limit low 16 bits    */
                    );

    /* 4GB flat userland code segment on ring 3 descriptor */
    gdt[GDT_CS_3] = gdt_entry_gdt_code_new(
                        0,      /* Base high 8 bits             */
                        1,      /* Granularity                  */
                        1,      /* Operation size               */
                        0,      /* Available                    */
                        0xf,    /* Segment limit high 4 bits    */
                        1,      /* Present                      */
                        3,      /* Descriptor privilege level   */
                        1,      /* readable                     */
                        1,      /* accessed                     */
                        0,      /* Base middle 8 bits           */
                        0,      /* Base low 16 bits             */
                        0xffff  /* Segment limit low 16 bits    */
                    );

    /* 4GB flat userland data segment on ring 3 descriptor */
    gdt[GDT_DS_3] = gdt_entry_gdt_data_new(
                        0,      /* Base high 8 bits             */
                        1,      /* Granularity                  */
                        1,      /* Operation size               */
                        0,      /* Available                    */
                        0xf,    /* Segment limit high 4 bits    */
                        1,      /* Present                      */
                        3,      /* Descriptor privilege level   */
                        1,      /* writable                     */
                        1,      /* accessed                     */
                        0,      /* Base middle 8 bits           */
                        0,      /* Base low 16 bits             */
                        0xffff  /* Segment limit low 16 bits    */
                    );

    /* Task State Segment (TSS) descriptor */
    gdt[GDT_TSS] = gdt_entry_gdt_tss_new(
                       tss_addr >> 24,            /* base_high 8 bits     */
                       0,                           /* granularity          */
                       0,                           /* avl                  */
                       0,                           /* limit_high 4 bits    */
                       1,                           /* present              */
                       0,                           /* dpl                  */
                       0,                           /* busy                 */
                       1,                           /* always_true          */
                       (tss_addr >> 16) & 0xff,     /* base_mid 8 bits      */
                       (tss_addr & 0xffff),         /* base_low 16 bits     */
                       sizeof(tss_t) - 1            /* limit_low 16 bits    */
                   );

    /* pre-init the userland data segment used for TLS */
    gdt[GDT_TLS] = gdt_entry_gdt_data_new(
                       0,      /* Base high 8 bits             */
                       1,      /* Granularity                  */
                       1,      /* Operation size               */
                       0,      /* Available                    */
                       0xf,    /* Segment limit high 4 bits    */
                       1,      /* Present                      */
                       3,      /* Descriptor privilege level   */
                       1,      /* writable                     */
                       1,      /* accessed                     */
                       0,      /* Base middle 8 bits           */
                       0,      /* Base low 16 bits             */
                       0xffff  /* Segment limit low 16 bits    */
                   );

    /* pre-init the userland data segment used for the IPC buffer */
    gdt[GDT_IPCBUF] = gdt_entry_gdt_data_new(
                          0,      /* Base high 8 bits             */
                          1,      /* Granularity                  */
                          1,      /* Operation size               */
                          0,      /* Available                    */
                          0xf,    /* Segment limit high 4 bits    */
                          1,      /* Present                      */
                          3,      /* Descriptor privilege level   */
                          1,      /* writable                     */
                          1,      /* accessed                     */
                          0,      /* Base middle 8 bits           */
                          0,      /* Base low 16 bits             */
                          0xffff  /* Segment limit low 16 bits    */
                      );
}

/* initialise the Interrupt Descriptor Table (IDT) */

BOOT_CODE static void
init_idt_entry(idt_entry_t* idt, interrupt_t interrupt, void(*handler)(void))
{
    uint32_t handler_addr = (uint32_t)handler;
    uint32_t dpl = 3;

    if (interrupt < int_trap_min) {
        dpl = 0;
    }

    idt[interrupt] = idt_entry_interrupt_gate_new(
                         handler_addr >> 16,   /* offset_high  */
                         1,                    /* present      */
                         dpl,                  /* dpl          */
                         1,                    /* gate_size    */
                         SEL_CS_0,             /* seg_selector */
                         handler_addr & 0xffff /* offset_low   */
                     );
}

BOOT_CODE static void
init_idt(idt_entry_t* idt)
{
    init_idt_entry(idt, 0x00, int_00);
    init_idt_entry(idt, 0x01, int_01);
    init_idt_entry(idt, 0x02, int_02);
    init_idt_entry(idt, 0x03, int_03);
    init_idt_entry(idt, 0x04, int_04);
    init_idt_entry(idt, 0x05, int_05);
    init_idt_entry(idt, 0x06, int_06);
    init_idt_entry(idt, 0x07, int_07);
    init_idt_entry(idt, 0x08, int_08);
    init_idt_entry(idt, 0x09, int_09);
    init_idt_entry(idt, 0x0a, int_0a);
    init_idt_entry(idt, 0x0b, int_0b);
    init_idt_entry(idt, 0x0c, int_0c);
    init_idt_entry(idt, 0x0d, int_0d);
    init_idt_entry(idt, 0x0e, int_0e);
    init_idt_entry(idt, 0x0f, int_0f);

    init_idt_entry(idt, 0x10, int_10);
    init_idt_entry(idt, 0x11, int_11);
    init_idt_entry(idt, 0x12, int_12);
    init_idt_entry(idt, 0x13, int_13);
    init_idt_entry(idt, 0x14, int_14);
    init_idt_entry(idt, 0x15, int_15);
    init_idt_entry(idt, 0x16, int_16);
    init_idt_entry(idt, 0x17, int_17);
    init_idt_entry(idt, 0x18, int_18);
    init_idt_entry(idt, 0x19, int_19);
    init_idt_entry(idt, 0x1a, int_1a);
    init_idt_entry(idt, 0x1b, int_1b);
    init_idt_entry(idt, 0x1c, int_1c);
    init_idt_entry(idt, 0x1d, int_1d);
    init_idt_entry(idt, 0x1e, int_1e);
    init_idt_entry(idt, 0x1f, int_1f);

    init_idt_entry(idt, 0x20, int_20);
    init_idt_entry(idt, 0x21, int_21);
    init_idt_entry(idt, 0x22, int_22);
    init_idt_entry(idt, 0x23, int_23);
    init_idt_entry(idt, 0x24, int_24);
    init_idt_entry(idt, 0x25, int_25);
    init_idt_entry(idt, 0x26, int_26);
    init_idt_entry(idt, 0x27, int_27);
    init_idt_entry(idt, 0x28, int_28);
    init_idt_entry(idt, 0x29, int_29);
    init_idt_entry(idt, 0x2a, int_2a);
    init_idt_entry(idt, 0x2b, int_2b);
    init_idt_entry(idt, 0x2c, int_2c);
    init_idt_entry(idt, 0x2d, int_2d);
    init_idt_entry(idt, 0x2e, int_2e);
    init_idt_entry(idt, 0x2f, int_2f);

    init_idt_entry(idt, 0x30, int_30);
    init_idt_entry(idt, 0x31, int_31);
    init_idt_entry(idt, 0x32, int_32);
    init_idt_entry(idt, 0x33, int_33);
    init_idt_entry(idt, 0x34, int_34);
    init_idt_entry(idt, 0x35, int_35);
    init_idt_entry(idt, 0x36, int_36);
    init_idt_entry(idt, 0x37, int_37);
    init_idt_entry(idt, 0x38, int_38);
    init_idt_entry(idt, 0x39, int_39);
    init_idt_entry(idt, 0x3a, int_3a);
    init_idt_entry(idt, 0x3b, int_3b);
    init_idt_entry(idt, 0x3c, int_3c);
    init_idt_entry(idt, 0x3d, int_3d);
    init_idt_entry(idt, 0x3e, int_3e);
    init_idt_entry(idt, 0x3f, int_3f);

    init_idt_entry(idt, 0x40, int_40);
    init_idt_entry(idt, 0x41, int_41);
    init_idt_entry(idt, 0x42, int_42);
    init_idt_entry(idt, 0x43, int_43);
    init_idt_entry(idt, 0x44, int_44);
    init_idt_entry(idt, 0x45, int_45);
    init_idt_entry(idt, 0x46, int_46);
    init_idt_entry(idt, 0x47, int_47);
    init_idt_entry(idt, 0x48, int_48);
    init_idt_entry(idt, 0x49, int_49);
    init_idt_entry(idt, 0x4a, int_4a);
    init_idt_entry(idt, 0x4b, int_4b);
    init_idt_entry(idt, 0x4c, int_4c);
    init_idt_entry(idt, 0x4d, int_4d);
    init_idt_entry(idt, 0x4e, int_4e);
    init_idt_entry(idt, 0x4f, int_4f);

    init_idt_entry(idt, 0x50, int_50);
    init_idt_entry(idt, 0x51, int_51);
    init_idt_entry(idt, 0x52, int_52);
    init_idt_entry(idt, 0x53, int_53);
    init_idt_entry(idt, 0x54, int_54);
    init_idt_entry(idt, 0x55, int_55);
    init_idt_entry(idt, 0x56, int_56);
    init_idt_entry(idt, 0x57, int_57);
    init_idt_entry(idt, 0x58, int_58);
    init_idt_entry(idt, 0x59, int_59);
    init_idt_entry(idt, 0x5a, int_5a);
    init_idt_entry(idt, 0x5b, int_5b);
    init_idt_entry(idt, 0x5c, int_5c);
    init_idt_entry(idt, 0x5d, int_5d);
    init_idt_entry(idt, 0x5e, int_5e);
    init_idt_entry(idt, 0x5f, int_5f);

    init_idt_entry(idt, 0x60, int_60);
    init_idt_entry(idt, 0x61, int_61);
    init_idt_entry(idt, 0x62, int_62);
    init_idt_entry(idt, 0x63, int_63);
    init_idt_entry(idt, 0x64, int_64);
    init_idt_entry(idt, 0x65, int_65);
    init_idt_entry(idt, 0x66, int_66);
    init_idt_entry(idt, 0x67, int_67);
    init_idt_entry(idt, 0x68, int_68);
    init_idt_entry(idt, 0x69, int_69);
    init_idt_entry(idt, 0x6a, int_6a);
    init_idt_entry(idt, 0x6b, int_6b);
    init_idt_entry(idt, 0x6c, int_6c);
    init_idt_entry(idt, 0x6d, int_6d);
    init_idt_entry(idt, 0x6e, int_6e);
    init_idt_entry(idt, 0x6f, int_6f);

    init_idt_entry(idt, 0x70, int_70);
    init_idt_entry(idt, 0x71, int_71);
    init_idt_entry(idt, 0x72, int_72);
    init_idt_entry(idt, 0x73, int_73);
    init_idt_entry(idt, 0x74, int_74);
    init_idt_entry(idt, 0x75, int_75);
    init_idt_entry(idt, 0x76, int_76);
    init_idt_entry(idt, 0x77, int_77);
    init_idt_entry(idt, 0x78, int_78);
    init_idt_entry(idt, 0x79, int_79);
    init_idt_entry(idt, 0x7a, int_7a);
    init_idt_entry(idt, 0x7b, int_7b);
    init_idt_entry(idt, 0x7c, int_7c);
    init_idt_entry(idt, 0x7d, int_7d);
    init_idt_entry(idt, 0x7e, int_7e);
    init_idt_entry(idt, 0x7f, int_7f);

    init_idt_entry(idt, 0x80, int_80);
    init_idt_entry(idt, 0x81, int_81);
    init_idt_entry(idt, 0x82, int_82);
    init_idt_entry(idt, 0x83, int_83);
    init_idt_entry(idt, 0x84, int_84);
    init_idt_entry(idt, 0x85, int_85);
    init_idt_entry(idt, 0x86, int_86);
    init_idt_entry(idt, 0x87, int_87);
    init_idt_entry(idt, 0x88, int_88);
    init_idt_entry(idt, 0x89, int_89);
    init_idt_entry(idt, 0x8a, int_8a);
    init_idt_entry(idt, 0x8b, int_8b);
    init_idt_entry(idt, 0x8c, int_8c);
    init_idt_entry(idt, 0x8d, int_8d);
    init_idt_entry(idt, 0x8e, int_8e);
    init_idt_entry(idt, 0x8f, int_8f);

    init_idt_entry(idt, 0x90, int_90);
    init_idt_entry(idt, 0x91, int_91);
    init_idt_entry(idt, 0x92, int_92);
    init_idt_entry(idt, 0x93, int_93);
    init_idt_entry(idt, 0x94, int_94);
    init_idt_entry(idt, 0x95, int_95);
    init_idt_entry(idt, 0x96, int_96);
    init_idt_entry(idt, 0x97, int_97);
    init_idt_entry(idt, 0x98, int_98);
    init_idt_entry(idt, 0x99, int_99);
    init_idt_entry(idt, 0x9a, int_9a);
    init_idt_entry(idt, 0x9b, int_9b);
    init_idt_entry(idt, 0x9c, int_9c);
    init_idt_entry(idt, 0x9d, int_9d);
    init_idt_entry(idt, 0x9e, int_9e);
    init_idt_entry(idt, 0x9f, int_9f);

    init_idt_entry(idt, 0xa0, int_a0);
    init_idt_entry(idt, 0xa1, int_a1);
    init_idt_entry(idt, 0xa2, int_a2);
    init_idt_entry(idt, 0xa3, int_a3);
    init_idt_entry(idt, 0xa4, int_a4);
    init_idt_entry(idt, 0xa5, int_a5);
    init_idt_entry(idt, 0xa6, int_a6);
    init_idt_entry(idt, 0xa7, int_a7);
    init_idt_entry(idt, 0xa8, int_a8);
    init_idt_entry(idt, 0xa9, int_a9);
    init_idt_entry(idt, 0xaa, int_aa);
    init_idt_entry(idt, 0xab, int_ab);
    init_idt_entry(idt, 0xac, int_ac);
    init_idt_entry(idt, 0xad, int_ad);
    init_idt_entry(idt, 0xae, int_ae);
    init_idt_entry(idt, 0xaf, int_af);

    init_idt_entry(idt, 0xb0, int_b0);
    init_idt_entry(idt, 0xb1, int_b1);
    init_idt_entry(idt, 0xb2, int_b2);
    init_idt_entry(idt, 0xb3, int_b3);
    init_idt_entry(idt, 0xb4, int_b4);
    init_idt_entry(idt, 0xb5, int_b5);
    init_idt_entry(idt, 0xb6, int_b6);
    init_idt_entry(idt, 0xb7, int_b7);
    init_idt_entry(idt, 0xb8, int_b8);
    init_idt_entry(idt, 0xb9, int_b9);
    init_idt_entry(idt, 0xba, int_ba);
    init_idt_entry(idt, 0xbb, int_bb);
    init_idt_entry(idt, 0xbc, int_bc);
    init_idt_entry(idt, 0xbd, int_bd);
    init_idt_entry(idt, 0xbe, int_be);
    init_idt_entry(idt, 0xbf, int_bf);

    init_idt_entry(idt, 0xc0, int_c0);
    init_idt_entry(idt, 0xc1, int_c1);
    init_idt_entry(idt, 0xc2, int_c2);
    init_idt_entry(idt, 0xc3, int_c3);
    init_idt_entry(idt, 0xc4, int_c4);
    init_idt_entry(idt, 0xc5, int_c5);
    init_idt_entry(idt, 0xc6, int_c6);
    init_idt_entry(idt, 0xc7, int_c7);
    init_idt_entry(idt, 0xc8, int_c8);
    init_idt_entry(idt, 0xc9, int_c9);
    init_idt_entry(idt, 0xca, int_ca);
    init_idt_entry(idt, 0xcb, int_cb);
    init_idt_entry(idt, 0xcc, int_cc);
    init_idt_entry(idt, 0xcd, int_cd);
    init_idt_entry(idt, 0xce, int_ce);
    init_idt_entry(idt, 0xcf, int_cf);

    init_idt_entry(idt, 0xd0, int_d0);
    init_idt_entry(idt, 0xd1, int_d1);
    init_idt_entry(idt, 0xd2, int_d2);
    init_idt_entry(idt, 0xd3, int_d3);
    init_idt_entry(idt, 0xd4, int_d4);
    init_idt_entry(idt, 0xd5, int_d5);
    init_idt_entry(idt, 0xd6, int_d6);
    init_idt_entry(idt, 0xd7, int_d7);
    init_idt_entry(idt, 0xd8, int_d8);
    init_idt_entry(idt, 0xd9, int_d9);
    init_idt_entry(idt, 0xda, int_da);
    init_idt_entry(idt, 0xdb, int_db);
    init_idt_entry(idt, 0xdc, int_dc);
    init_idt_entry(idt, 0xdd, int_dd);
    init_idt_entry(idt, 0xde, int_de);
    init_idt_entry(idt, 0xdf, int_df);

    init_idt_entry(idt, 0xe0, int_e0);
    init_idt_entry(idt, 0xe1, int_e1);
    init_idt_entry(idt, 0xe2, int_e2);
    init_idt_entry(idt, 0xe3, int_e3);
    init_idt_entry(idt, 0xe4, int_e4);
    init_idt_entry(idt, 0xe5, int_e5);
    init_idt_entry(idt, 0xe6, int_e6);
    init_idt_entry(idt, 0xe7, int_e7);
    init_idt_entry(idt, 0xe8, int_e8);
    init_idt_entry(idt, 0xe9, int_e9);
    init_idt_entry(idt, 0xea, int_ea);
    init_idt_entry(idt, 0xeb, int_eb);
    init_idt_entry(idt, 0xec, int_ec);
    init_idt_entry(idt, 0xed, int_ed);
    init_idt_entry(idt, 0xee, int_ee);
    init_idt_entry(idt, 0xef, int_ef);

    init_idt_entry(idt, 0xf0, int_f0);
    init_idt_entry(idt, 0xf1, int_f1);
    init_idt_entry(idt, 0xf2, int_f2);
    init_idt_entry(idt, 0xf3, int_f3);
    init_idt_entry(idt, 0xf4, int_f4);
    init_idt_entry(idt, 0xf5, int_f5);
    init_idt_entry(idt, 0xf6, int_f6);
    init_idt_entry(idt, 0xf7, int_f7);
    init_idt_entry(idt, 0xf8, int_f8);
    init_idt_entry(idt, 0xf9, int_f9);
    init_idt_entry(idt, 0xfa, int_fa);
    init_idt_entry(idt, 0xfb, int_fb);
    init_idt_entry(idt, 0xfc, int_fc);
    init_idt_entry(idt, 0xfd, int_fd);
    init_idt_entry(idt, 0xfe, int_fe);
    init_idt_entry(idt, 0xff, int_ff);
}

BOOT_CODE bool_t
map_kernel_window(
    pde_t*     pd,
    pte_t*     pt,
    p_region_t ndks_p_reg
#ifdef CONFIG_IOMMU
    , uint32_t   num_drhu,
    paddr_t*   drhu_list
#endif
)
{
    paddr_t  phys;
    uint32_t idx;
    pde_t    pde;
    pte_t    pte;
#ifdef CONFIG_IOMMU
    unsigned int i;
#endif

    /* Mapping of PPTR_BASE (virtual address) to kernel's PADDR_BASE
     * up to end of virtual address space except for the last 4M.
     */
    phys = PADDR_BASE;
    idx = PPTR_BASE >> pageBitsForSize(IA32_4M);

#ifdef CONFIG_BENCHMARK
    /* steal the last 4MB for logging */
    while (idx < BIT(PD_BITS) - 2) {
#else
    while (idx < BIT(PD_BITS) - 1) {
#endif /* CONFIG_BENCHMARK */
        pde = pde_pde_4m_new(
                  phys,   /* page_base_address    */
                  0,      /* pat                  */
                  0,      /* avl                  */
                  1,      /* global               */
                  0,      /* dirty                */
                  0,      /* accessed             */
                  0,      /* cache_disabled       */
                  0,      /* write_through        */
                  0,      /* super_user           */
                  1,      /* read_write           */
                  1       /* present              */
              );
        pd[idx] = pde;
        phys += BIT(pageBitsForSize(IA32_4M));
        idx++;
    }

    /* crosscheck whether we have mapped correctly so far */
    assert(phys == PADDR_TOP);

#ifdef CONFIG_BENCHMARK
    /* mark the address of the log. We will map it
     * in later with the correct attributes, but we need
     * to wait until we can call alloc_region. */
    ksLog = (word_t *) paddr_to_pptr(phys);
    phys += BIT(pageBitsForSize(IA32_4M));
    assert(idx == IA32_KSLOG_IDX);
    idx++;
#endif /* CONFIG_BENCHMARK */

    /* map page table of last 4M of virtual address space to page directory */
    pde = pde_pde_4k_new(
              pptr_to_paddr(pt), /* pt_base_address  */
              0,                 /* avl              */
              0,                 /* accessed         */
              0,                 /* cache_disabled   */
              0,                 /* write_through    */
              1,                 /* super_user       */
              1,                 /* read_write       */
              1                  /* present          */
          );
    pd[idx] = pde;

    /* Start with an empty guard page preceding the stack. */
    idx = 0;
    pte = pte_new(
              0,      /* page_base_address    */
              0,      /* avl                  */
              0,      /* global               */
              0,      /* pat                  */
              0,      /* dirty                */
              0,      /* accessed             */
              0,      /* cache_disabled       */
              0,      /* write_through        */
              0,      /* super_user           */
              0,      /* read_write           */
              0       /* present              */
          );
    pt[idx] = pte;
    idx++;

    /* establish NDKS (node kernel state) mappings in page table */
    phys = ndks_p_reg.start;
    while (idx - 1 < (ndks_p_reg.end - ndks_p_reg.start) >> pageBitsForSize(IA32_4K)) {
        pte = pte_new(
                  phys,   /* page_base_address    */
                  0,      /* avl                  */
                  1,      /* global               */
                  0,      /* pat                  */
                  0,      /* dirty                */
                  0,      /* accessed             */
                  0,      /* cache_disabled       */
                  0,      /* write_through        */
                  0,      /* super_user           */
                  1,      /* read_write           */
                  1       /* present              */
              );
        pt[idx] = pte;
        phys += BIT(pageBitsForSize(IA32_4K));
        idx++;
    }

    /* null mappings up to PPTR_KDEV */

    while (idx < (PPTR_KDEV & MASK(pageBitsForSize(IA32_4M))) >> pageBitsForSize(IA32_4K)) {
        pte = pte_new(
                  0,      /* page_base_address    */
                  0,      /* avl                  */
                  0,      /* global               */
                  0,      /* pat                  */
                  0,      /* dirty                */
                  0,      /* accessed             */
                  0,      /* cache_disabled       */
                  0,      /* write_through        */
                  0,      /* super_user           */
                  0,      /* read_write           */
                  0       /* present              */
              );
        pt[idx] = pte;
        phys += BIT(pageBitsForSize(IA32_4K));
        idx++;
    }

    /* map kernel devices (devices only used by the kernel) */

    /* map kernel devices: APIC */
    phys = apic_get_base_paddr();
    if (!phys) {
        return false;
    }
    pte = pte_new(
              phys,   /* page_base_address    */
              0,      /* avl                  */
              1,      /* global               */
              0,      /* pat                  */
              0,      /* dirty                */
              0,      /* accessed             */
              1,      /* cache_disabled       */
              1,      /* write_through        */
              0,      /* super_user           */
              1,      /* read_write           */
              1       /* present              */
          );

    assert(idx == (PPTR_APIC & MASK(pageBitsForSize(IA32_4M))) >> pageBitsForSize(IA32_4K));
    pt[idx] = pte;
    idx++;


#ifdef CONFIG_IOMMU
    /* map kernel devices: IOMMUs */
    for (i = 0; i < num_drhu; i++) {
        phys = (paddr_t)drhu_list[i];
        pte = pte_new(
                  phys,   /* page_base_address    */
                  0,      /* avl                  */
                  1,      /* global               */
                  0,      /* pat                  */
                  0,      /* dirty                */
                  0,      /* accessed             */
                  1,      /* cache_disabled       */
                  1,      /* write_through        */
                  0,      /* super_user           */
                  1,      /* read_write           */
                  1       /* present              */
              );

        assert(idx == ((PPTR_DRHU_START + i * BIT(pageBitsForSize(IA32_4K))) & MASK(pageBitsForSize(IA32_4M))) >> pageBitsForSize(IA32_4K));
        pt[idx] = pte;
        idx++;
        if (idx == BIT(PT_BITS)) {
            return false;
        }
    }
#endif

    /* mark unused kernel-device pages as 'not present' */
    while (idx < BIT(PT_BITS)) {
        pte = pte_new(
                  0,      /* page_base_address    */
                  0,      /* avl                  */
                  0,      /* global               */
                  0,      /* pat                  */
                  0,      /* dirty                */
                  0,      /* accessed             */
                  0,      /* cache_disabled       */
                  0,      /* write_through        */
                  0,      /* super_user           */
                  0,      /* read_write           */
                  0       /* present              */
              );
        pt[idx] = pte;
        idx++;
    }

    /* Check we haven't added too many kernel-device mappings.*/
    assert(idx == BIT(PT_BITS));

    invalidatePageStructureCache();
    return true;
}

/* Note: this function will invalidate any pointers previously returned from this function */
BOOT_CODE void*
map_temp_boot_page(void* entry, uint32_t pages)
{
    void* replacement_vaddr;
    unsigned int i;
    unsigned int offset_in_page;

    unsigned int phys_pg_start = (unsigned int)(entry) & ~MASK(pageBitsForSize(IA32_4M));
    unsigned int virt_pd_start = (PPTR_BASE >> pageBitsForSize(IA32_4M)) - pages;
    unsigned int virt_pg_start = PPTR_BASE - (pages << pageBitsForSize(IA32_4M));

    for (i = 0; i < pages; ++i) {
        unsigned int pg_offset = i << pageBitsForSize(IA32_4M); // num pages since start * page size

        pde_pde_4m_ptr_new(_boot_pd + virt_pd_start + i,
                           phys_pg_start + pg_offset, /* physical address */
                           0, /* pat            */
                           0, /* avl            */
                           1, /* global         */
                           0, /* dirty          */
                           0, /* accessed       */
                           0, /* cache_disabled */
                           0, /* write_through  */
                           0, /* super_user     */
                           1, /* read_write     */
                           1  /* present        */
                          );
        invalidateTLBentry(virt_pg_start + pg_offset);
    }

    // assign replacement virtual addresses page
    offset_in_page = (unsigned int)(entry) & MASK(pageBitsForSize(IA32_4M));
    replacement_vaddr = (void*)(virt_pg_start + offset_in_page);

    invalidatePageStructureCache();

    return replacement_vaddr;
}

BOOT_CODE bool_t
init_vm_state(pde_t* kernel_pd, pte_t* kernel_pt)
{
    ia32KScacheLineSizeBits = getCacheLineSizeBits();
    if (!ia32KScacheLineSizeBits) {
        return false;
    }
    ia32KSkernelPD = kernel_pd;
    ia32KSkernelPT = kernel_pt;
    init_tss(&ia32KStss);
    init_gdt(ia32KSgdt, &ia32KStss);
    init_idt(ia32KSidt);
    return true;
}

/* initialise CPU's descriptor table registers (GDTR, IDTR, LDTR, TR) */

BOOT_CODE void
init_dtrs(void)
{
    /* setup the GDT pointer and limit and load into GDTR */
    gdt_idt_ptr.limit = (sizeof(gdt_entry_t) * GDT_ENTRIES) - 1;
    gdt_idt_ptr.basel = (uint32_t)ia32KSgdt;
    gdt_idt_ptr.baseh = (uint16_t)((uint32_t)ia32KSgdt >> 16);
    ia32_install_gdt(&gdt_idt_ptr);

    /* setup the IDT pointer and limit and load into IDTR */
    gdt_idt_ptr.limit = (sizeof(idt_entry_t) * (int_max + 1)) - 1;
    gdt_idt_ptr.basel = (uint32_t)ia32KSidt;
    gdt_idt_ptr.baseh = (uint16_t)((uint32_t)ia32KSidt >> 16);
    ia32_install_idt(&gdt_idt_ptr);

    /* load NULL LDT selector into LDTR */
    ia32_install_ldt(SEL_NULL);

    /* load TSS selector into Task Register (TR) */
    ia32_install_tss(SEL_TSS);
}

BOOT_CODE void
map_it_pt_cap(cap_t pd_cap, cap_t pt_cap)
{
    pde_t* pd   = PDE_PTR(pptr_of_cap(pd_cap));
    pte_t* pt   = PTE_PTR(cap_page_table_cap_get_capPTBasePtr(pt_cap));
    vptr_t vptr = cap_page_table_cap_get_capPTMappedAddress(pt_cap);

    assert(cap_page_table_cap_get_capPTIsMapped(pt_cap));
    pde_pde_4k_ptr_new(
        pd + (vptr >> pageBitsForSize(IA32_4M)),
        pptr_to_paddr(pt), /* pt_base_address */
        0,                 /* avl             */
        0,                 /* accessed        */
        0,                 /* cache_disabled  */
        0,                 /* write_through   */
        1,                 /* super_user      */
        1,                 /* read_write      */
        1                  /* present         */
    );
    invalidatePageStructureCache();
}

BOOT_CODE void
map_it_frame_cap(cap_t pd_cap, cap_t frame_cap)
{
    pte_t* pt;
    pde_t* pd    = PDE_PTR(pptr_of_cap(pd_cap));
    void*  frame = (void*)cap_frame_cap_get_capFBasePtr(frame_cap);
    vptr_t vptr  = cap_frame_cap_get_capFMappedAddress(frame_cap);

    assert(cap_frame_cap_get_capFMappedASID(frame_cap) != 0);
    pd += (vptr >> pageBitsForSize(IA32_4M));
    pt = paddr_to_pptr(pde_pde_4k_ptr_get_pt_base_address(pd));
    pte_ptr_new(
        pt + ((vptr & MASK(pageBitsForSize(IA32_4M))) >> pageBitsForSize(IA32_4K)),
        pptr_to_paddr(frame), /* page_base_address */
        0,                    /* avl               */
        0,                    /* global            */
        0,                    /* pat               */
        0,                    /* dirty             */
        0,                    /* accessed          */
        0,                    /* cache_disabled    */
        0,                    /* write_through     */
        1,                    /* super_user        */
        1,                    /* read_write        */
        1                     /* present           */
    );
    invalidatePageStructureCache();
}

BOOT_CODE void
write_it_asid_pool(cap_t it_ap_cap, cap_t it_pd_cap)
{
    asid_pool_t* ap = ASID_POOL_PTR(pptr_of_cap(it_ap_cap));
    ap->array[IT_ASID] = PDE_PTR(pptr_of_cap(it_pd_cap));
    ia32KSASIDTable[IT_ASID >> asidLowBits] = ap;
}

BOOT_CODE bool_t
init_pat_msr(void)
{
    ia32_pat_msr_t pat_msr;
    /* First verify PAT is supported by the machine.
       See section 11.12.1 of Volume 3 of the Intel manual */
    if ( (ia32_cpuid_edx(0x1, 0x0) & BIT(16)) == 0) {
        printf("PAT support not found\n");
        return false;
    }
    pat_msr.words[0] = ia32_rdmsr_low(IA32_PAT_MSR);
    pat_msr.words[1] = ia32_rdmsr_high(IA32_PAT_MSR);
    /* Set up the PAT MSR to the Intel defaults, just in case
     * they have been changed but a bootloader somewhere along the way */
    ia32_pat_msr_ptr_set_pa0(&pat_msr, IA32_PAT_MT_WRITE_BACK);
    ia32_pat_msr_ptr_set_pa1(&pat_msr, IA32_PAT_MT_WRITE_THROUGH);
    ia32_pat_msr_ptr_set_pa2(&pat_msr, IA32_PAT_MT_UNCACHED);
    ia32_pat_msr_ptr_set_pa3(&pat_msr, IA32_PAT_MT_UNCACHEABLE);
    /* Add the WriteCombining cache type to the PAT */
    ia32_pat_msr_ptr_set_pa4(&pat_msr, IA32_PAT_MT_WRITE_COMBINING);
    ia32_wrmsr(IA32_PAT_MSR, pat_msr.words[1], pat_msr.words[0]);
    return true;
}

/* ==================== BOOT CODE FINISHES HERE ==================== */

static uint32_t CONST WritableFromVMRights(vm_rights_t vm_rights)
{
    switch (vm_rights) {
    case VMReadOnly:
        return 0;

    case VMKernelOnly:
    case VMReadWrite:
        return 1;

    default:
        fail("Invalid VM rights");
    }
}

static uint32_t CONST SuperUserFromVMRights(vm_rights_t vm_rights)
{
    switch (vm_rights) {
    case VMKernelOnly:
        return 0;

    case VMReadOnly:
    case VMReadWrite:
        return 1;

    default:
        fail("Invalid VM rights");
    }
}

static pde_t CONST makeUserPDE(paddr_t paddr, vm_attributes_t vm_attr, vm_rights_t vm_rights)
{
    return pde_pde_4m_new(
               paddr,                                          /* page_base_address    */
               vm_attributes_get_ia32PATBit(vm_attr),          /* pat                  */
               0,                                              /* avl                  */
               0,                                              /* global               */
               0,                                              /* dirty                */
               0,                                              /* accessed             */
               vm_attributes_get_ia32PCDBit(vm_attr),          /* cache_disabled       */
               vm_attributes_get_ia32PWTBit(vm_attr),          /* write_through        */
               SuperUserFromVMRights(vm_rights),               /* super_user           */
               WritableFromVMRights(vm_rights),                /* read_write           */
               1                                               /* present              */
           );
}

static pte_t CONST makeUserPTE(paddr_t paddr, vm_attributes_t vm_attr, vm_rights_t vm_rights)
{
    return pte_new(
               paddr,                                          /* page_base_address    */
               0,                                              /* avl                  */
               0,                                              /* global               */
               vm_attributes_get_ia32PATBit(vm_attr),          /* pat                  */
               0,                                              /* dirty                */
               0,                                              /* accessed             */
               vm_attributes_get_ia32PCDBit(vm_attr),          /* cache_disabled       */
               vm_attributes_get_ia32PWTBit(vm_attr),          /* write_through        */
               SuperUserFromVMRights(vm_rights),               /* super_user           */
               WritableFromVMRights(vm_rights),                /* read_write           */
               1                                               /* present              */
           );
}

word_t* PURE lookupIPCBuffer(bool_t isReceiver, tcb_t *thread)
{
    word_t      w_bufferPtr;
    cap_t       bufferCap;
    vm_rights_t vm_rights;

    w_bufferPtr = thread->tcbIPCBuffer;
    bufferCap = TCB_PTR_CTE_PTR(thread, tcbBuffer)->cap;

    if (cap_get_capType(bufferCap) != cap_frame_cap) {
        return NULL;
    }

    vm_rights = cap_frame_cap_get_capFVMRights(bufferCap);
    if (vm_rights == VMReadWrite || (!isReceiver && vm_rights == VMReadOnly)) {
        word_t basePtr;
        unsigned int pageBits;

        basePtr = cap_frame_cap_get_capFBasePtr(bufferCap);
        pageBits = pageBitsForSize(cap_frame_cap_get_capFSize(bufferCap));
        return (word_t *)(basePtr + (w_bufferPtr & MASK(pageBits)));
    } else {
        return NULL;
    }
}

static pde_t* CONST lookupPDSlot(pde_t *pd, vptr_t vptr)
{
    unsigned int pdIndex;

    pdIndex = vptr >> (PAGE_BITS + PT_BITS);
    return pd + pdIndex;
}

static lookupPTSlot_ret_t lookupPTSlot(pde_t* pd, vptr_t vptr)
{
    lookupPTSlot_ret_t ret;
    pde_t* pdSlot;

    pdSlot = lookupPDSlot(pd, vptr);

    if ((pde_ptr_get_page_size(pdSlot) != pde_pde_4k) ||
            !pde_pde_4k_ptr_get_present(pdSlot)) {
        current_lookup_fault = lookup_fault_missing_capability_new(22);

        ret.ptSlot = NULL;
        ret.status = EXCEPTION_LOOKUP_FAULT;
        return ret;
    } else {
        pte_t* pt;
        pte_t* ptSlot;
        unsigned int ptIndex;

        pt = paddr_to_pptr(pde_pde_4k_ptr_get_pt_base_address(pdSlot));
        ptIndex = (vptr >> PAGE_BITS) & MASK(PT_BITS);
        ptSlot = pt + ptIndex;

        ret.ptSlot = ptSlot;
        ret.status = EXCEPTION_NONE;
        return ret;
    }
}

exception_t handleVMFault(tcb_t* thread, vm_fault_type_t vm_faultType)
{
    uint32_t addr;
    uint32_t fault;

    addr = getFaultAddr();
    fault = getRegister(thread, Error);

    switch (vm_faultType) {
    case IA32DataFault:
        current_fault = fault_vm_fault_new(addr, fault, false);
        return EXCEPTION_FAULT;

    case IA32InstructionFault:
        current_fault = fault_vm_fault_new(addr, fault, true);
        return EXCEPTION_FAULT;

    default:
        fail("Invalid VM fault type");
    }
}

bool_t CONST isValidVTableRoot(cap_t cap)
{
    return cap_get_capType(cap) == cap_page_directory_cap &&
           cap_page_directory_cap_get_capPDIsMapped(cap);
}

#define intSize (wordBits / 8)
#define wSize (capTransferDataSize + msgMaxLength + msgMaxExtraCaps + 2)
#define bSize (wSize * intSize)

exception_t checkValidIPCBuffer(vptr_t vptr, cap_t cap)
{
    if (cap_get_capType(cap) != cap_frame_cap) {
        userError("IPC Buffer is an invalid cap.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (!IS_ALIGNED(vptr, 9)) {
        userError("IPC Buffer vaddr 0x%x is not aligned.", (int)vptr);
        current_syscall_error.type = seL4_AlignmentError;
        return EXCEPTION_SYSCALL_ERROR;
    }

    return EXCEPTION_NONE;
}

vm_rights_t CONST maskVMRights(vm_rights_t vm_rights, cap_rights_t cap_rights_mask)
{
    if (vm_rights == VMReadOnly && cap_rights_get_capAllowRead(cap_rights_mask)) {
        return VMReadOnly;
    }
    if (vm_rights == VMReadWrite && cap_rights_get_capAllowRead(cap_rights_mask)) {
        if (!cap_rights_get_capAllowWrite(cap_rights_mask)) {
            return VMReadOnly;
        } else {
            return VMReadWrite;
        }
    }
    return VMKernelOnly;
}

static void flushTable(pde_t* pd, word_t vptr, pte_t* pt)
{
    unsigned int i;
    cap_t        threadRoot;

    assert(IS_ALIGNED(vptr, PT_BITS + PAGE_BITS));

    /* check if page table belongs to current address space */
    threadRoot = TCB_PTR_CTE_PTR(ksCurThread, tcbVTable)->cap;
    if (cap_get_capType(threadRoot) == cap_page_directory_cap &&
            cap_page_directory_cap_get_capPDIsMapped(threadRoot) &&
            PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(threadRoot)) == pd) {
        /* find valid mappings */
        for (i = 0; i < BIT(PT_BITS); i++) {
            if (pte_get_present(pt[i])) {
                invalidateTLBentry(vptr + (i << PAGE_BITS));
            }
        }
    }
}

static findPDForASID_ret_t findPDForASID(asid_t asid)
{
    findPDForASID_ret_t ret;
    asid_pool_t*        poolPtr;
    pde_t*              pd;

    poolPtr = ia32KSASIDTable[asid >> asidLowBits];
    if (!poolPtr) {
        current_lookup_fault = lookup_fault_invalid_root_new();

        ret.pd = NULL;
        ret.status = EXCEPTION_LOOKUP_FAULT;
        return ret;
    }

    pd = poolPtr->array[asid & MASK(asidLowBits)];
    if (!pd) {
        current_lookup_fault = lookup_fault_invalid_root_new();

        ret.pd = NULL;
        ret.status = EXCEPTION_LOOKUP_FAULT;
        return ret;
    }

    ret.pd = pd;
    ret.status = EXCEPTION_NONE;
    return ret;
}

void setVMRoot(tcb_t* tcb)
{
    cap_t               threadRoot;
    pde_t*              pd;
    asid_t              asid;
    findPDForASID_ret_t find_ret;

    threadRoot = TCB_PTR_CTE_PTR(tcb, tcbVTable)->cap;

    if (cap_get_capType(threadRoot) != cap_page_directory_cap ||
            !cap_page_directory_cap_get_capPDIsMapped(threadRoot)) {
        setCurrentPD(pptr_to_paddr(ia32KSkernelPD));
        return;
    }

    pd = PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(threadRoot));
    asid = cap_page_directory_cap_get_capPDMappedASID(threadRoot);
    find_ret = findPDForASID(asid);
    if (find_ret.status != EXCEPTION_NONE || find_ret.pd != pd) {
        setCurrentPD(pptr_to_paddr(ia32KSkernelPD));
        return;
    }

    /* only set PD if we change it, otherwise we flush the TLB needlessly */
    if (getCurrentPD() != pptr_to_paddr(pd)) {
        setCurrentPD(pptr_to_paddr(pd));
    }
}

void deleteASIDPool(asid_t asid_base, asid_pool_t* pool)
{
    /* Haskell error: "ASID pool's base must be aligned" */
    assert(IS_ALIGNED(asid_base, asidLowBits));

    if (ia32KSASIDTable[asid_base >> asidLowBits] == pool) {
        ia32KSASIDTable[asid_base >> asidLowBits] = NULL;
        setVMRoot(ksCurThread);
    }
}

void deleteASID(asid_t asid, pde_t* pd)
{
    asid_pool_t* poolPtr;

    poolPtr = ia32KSASIDTable[asid >> asidLowBits];

    if (poolPtr != NULL && poolPtr->array[asid & MASK(asidLowBits)] == pd) {
        poolPtr->array[asid & MASK(asidLowBits)] = NULL;
        setVMRoot(ksCurThread);
    }
}

void unmapPageTable(asid_t asid, vptr_t vaddr, pte_t* pt)
{
    findPDForASID_ret_t find_ret;
    pde_t*              pdSlot;
    unsigned int        pdIndex;

    find_ret = findPDForASID(asid);
    if (find_ret.status != EXCEPTION_NONE) {
        return;
    }

    pdIndex = vaddr >> (PAGE_BITS + PT_BITS);
    pdSlot = find_ret.pd + pdIndex;

    flushTable(find_ret.pd, vaddr, pt);

    *pdSlot = pde_pde_4k_new(
                  0,  /* pt_base_address  */
                  0,  /* avl              */
                  0,  /* accessed         */
                  0,  /* cache_disabled   */
                  0,  /* write_through    */
                  0,  /* super_user       */
                  0,  /* read_write       */
                  0   /* present          */
              );
    invalidatePageStructureCache();
}

void unmapPage(vm_page_size_t page_size, asid_t asid, vptr_t vptr, void *pptr)
{
    findPDForASID_ret_t find_ret;
    lookupPTSlot_ret_t  lu_ret;
    cap_t               threadRoot;
    pde_t               *pde;

    find_ret = findPDForASID(asid);
    if (find_ret.status != EXCEPTION_NONE) {
        return;
    }

    /* check if page belongs to current address space */
    threadRoot = TCB_PTR_CTE_PTR(ksCurThread, tcbVTable)->cap;
    if (cap_get_capType(threadRoot) == cap_page_directory_cap &&
            cap_page_directory_cap_get_capPDIsMapped(threadRoot) &&
            PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(threadRoot)) == find_ret.pd) {
        invalidateTLBentry(vptr);
    }

    switch (page_size) {
    case IA32_4K:
        lu_ret = lookupPTSlot(find_ret.pd, vptr);
        if (lu_ret.status != EXCEPTION_NONE) {
            return;
        }
        if (! (pte_ptr_get_present(lu_ret.ptSlot)
                && (pte_ptr_get_page_base_address(lu_ret.ptSlot)
                    == pptr_to_paddr(pptr)))) {
            return;
        }
        *lu_ret.ptSlot = pte_new(
                             0,      /* page_base_address    */
                             0,      /* avl                  */
                             0,      /* global               */
                             0,      /* pat                  */
                             0,      /* dirty                */
                             0,      /* accessed             */
                             0,      /* cache_disabled       */
                             0,      /* write_through        */
                             0,      /* super_user           */
                             0,      /* read_write           */
                             0       /* present              */
                         );
        break;

    case IA32_4M:
        pde = lookupPDSlot(find_ret.pd, vptr);
        if (! (pde_ptr_get_page_size(pde) == pde_pde_4m
                && pde_pde_4m_ptr_get_present(pde)
                && (pde_pde_4m_ptr_get_page_base_address(pde)
                    == pptr_to_paddr(pptr)))) {
            return;
        }
        *lookupPDSlot(find_ret.pd, vptr) = pde_pde_4m_new(
                                               0,      /* page_base_address    */
                                               0,      /* pat                  */
                                               0,      /* avl                  */
                                               0,      /* global               */
                                               0,      /* dirty                */
                                               0,      /* accessed             */
                                               0,      /* cache_disabled       */
                                               0,      /* write_through        */
                                               0,      /* super_user           */
                                               0,      /* read_write           */
                                               0       /* present              */
                                           );
        break;

    default:
        fail("Invalid page type");
    }
    invalidatePageStructureCache();
}

void copyGlobalMappings(pde_t* newPD)
{
    unsigned int i;

    for (i = PPTR_BASE >> pageBitsForSize(IA32_4M); i < BIT(PD_BITS); i++) {
        newPD[i] = ia32KSkernelPD[i];
    }
}

static exception_t performASIDControlInvocation(void* frame, cte_t* slot, cte_t* parent, asid_t asid_base)
{
    memzero(frame, 1 << pageBitsForSize(IA32_4K));
    cteInsert(
        cap_asid_pool_cap_new(
            asid_base,          /* capASIDBase  */
            WORD_REF(frame)     /* capASIDPool  */
        ),
        parent,
        slot
    );
    /* Haskell error: "ASID pool's base must be aligned" */
    assert((asid_base & MASK(asidLowBits)) == 0);
    ia32KSASIDTable[asid_base >> asidLowBits] = (asid_pool_t*)frame;

    return EXCEPTION_NONE;
}

static exception_t performASIDPoolInvocation(asid_t asid, asid_pool_t* poolPtr, cte_t* pdCapSlot)
{
    cap_page_directory_cap_ptr_set_capPDMappedASID(&pdCapSlot->cap, asid);
    cap_page_directory_cap_ptr_set_capPDIsMapped(&pdCapSlot->cap, 1);
    poolPtr->array[asid & MASK(asidLowBits)] = PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(pdCapSlot->cap));

    return EXCEPTION_NONE;
}

static exception_t
performPageGetAddress(void *vbase_ptr)
{
    paddr_t capFBasePtr;

    /* Get the physical address of this frame. */
    capFBasePtr = pptr_to_paddr(vbase_ptr);

    /* return it in the first message register */
    setRegister(ksCurThread, msgRegisters[0], capFBasePtr);
    setRegister(ksCurThread, msgInfoRegister,
                wordFromMessageInfo(message_info_new(0, 0, 0, 1)));

    return EXCEPTION_NONE;
}


static inline bool_t
checkVPAlignment(vm_page_size_t sz, word_t w)
{
    return IS_ALIGNED(w, pageBitsForSize(sz));
}

static exception_t
decodeIA32PageTableInvocation(
    word_t label,
    unsigned int length,
    cte_t* cte, cap_t cap,
    extra_caps_t extraCaps,
    word_t* buffer
)
{
    word_t          vaddr;
    vm_attributes_t attr;
    word_t          pdIndex;
    cap_t           pdCap;
    pde_t*          pd;
    pde_t*          pdSlot;
    pde_t           pde;
    paddr_t         paddr;
    asid_t          asid;

    if (label == IA32PageTableUnmap) {
        if (! isFinalCapability(cte)) {
            current_syscall_error.type = seL4_RevokeFirst;
            userError("IA32PageTable: Cannot unmap if more than one cap exists.");
            return EXCEPTION_SYSCALL_ERROR;
        }
        setThreadState(ksCurThread, ThreadState_Restart);

        if (cap_page_table_cap_get_capPTIsMapped(cap)) {
            pte_t *pt = PTE_PTR(cap_page_table_cap_get_capPTBasePtr(cap));
            unmapPageTable(
                cap_page_table_cap_get_capPTMappedASID(cap),
                cap_page_table_cap_get_capPTMappedAddress(cap),
                pt
            );
            clearMemory((void *)pt, cap_get_capSizeBits(cap));
        }
        cap_page_table_cap_ptr_set_capPTIsMapped(&(cte->cap), 0);

        return EXCEPTION_NONE;
    }

    if (label != IA32PageTableMap ) {
        userError("IA32PageTable: Illegal operation.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (length < 2 || extraCaps.excaprefs[0] == NULL) {
        userError("IA32PageTable: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (cap_page_table_cap_get_capPTIsMapped(cap)) {
        userError("IA32PageTable: Page table is already mapped to a page directory.");
        current_syscall_error.type =
            seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;

        return EXCEPTION_SYSCALL_ERROR;
    }

    vaddr = getSyscallArg(0, buffer);
    attr = vmAttributesFromWord(getSyscallArg(1, buffer));
    pdCap = extraCaps.excaprefs[0]->cap;

    if (cap_get_capType(pdCap) != cap_page_directory_cap ||
            !cap_page_directory_cap_get_capPDIsMapped(pdCap)) {
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 1;

        return EXCEPTION_SYSCALL_ERROR;
    }

    pd = PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(pdCap));
    asid = cap_page_directory_cap_get_capPDMappedASID(pdCap);

    if (vaddr >= PPTR_BASE) {
        userError("IA32PageTable: Mapping address too high.");
        current_syscall_error.type = seL4_InvalidArgument;
        current_syscall_error.invalidArgumentNumber = 0;

        return EXCEPTION_SYSCALL_ERROR;
    }

    {
        findPDForASID_ret_t find_ret;

        find_ret = findPDForASID(asid);
        if (find_ret.status != EXCEPTION_NONE) {
            current_syscall_error.type = seL4_FailedLookup;
            current_syscall_error.failedLookupWasSource = false;

            return EXCEPTION_SYSCALL_ERROR;
        }

        if (find_ret.pd != pd) {
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 1;

            return EXCEPTION_SYSCALL_ERROR;
        }
    }

    pdIndex = vaddr >> (PAGE_BITS + PT_BITS);
    pdSlot = &pd[pdIndex];

    if (((pde_ptr_get_page_size(pdSlot) == pde_pde_4k) && pde_pde_4k_ptr_get_present(pdSlot)) ||
            ((pde_ptr_get_page_size(pdSlot) == pde_pde_4m) && pde_pde_4m_ptr_get_present(pdSlot))) {
        current_syscall_error.type = seL4_DeleteFirst;

        return EXCEPTION_SYSCALL_ERROR;
    }

    paddr = pptr_to_paddr(PTE_PTR(cap_page_table_cap_get_capPTBasePtr(cap)));
    pde = pde_pde_4k_new(
              paddr,                                      /* pt_base_address  */
              0,                                          /* avl              */
              0,                                          /* accessed         */
              vm_attributes_get_ia32PCDBit(attr),      /* cache_disabled   */
              vm_attributes_get_ia32PWTBit(attr),      /* write_through    */
              1,                                          /* super_user       */
              1,                                          /* read_write       */
              1                                           /* present          */
          );

    cap = cap_page_table_cap_set_capPTIsMapped(cap, 1);
    cap = cap_page_table_cap_set_capPTMappedASID(cap, asid);
    cap = cap_page_table_cap_set_capPTMappedAddress(cap, vaddr);

    cte->cap = cap;
    *pdSlot = pde;

    setThreadState(ksCurThread, ThreadState_Restart);
    invalidatePageStructureCache();
    return EXCEPTION_NONE;
}

static exception_t
decodeIA32FrameInvocation(
    word_t label,
    unsigned int length,
    cte_t* cte,
    cap_t cap,
    extra_caps_t extraCaps,
    word_t* buffer
)
{
    switch (label) {
    case IA32PageMap: { /* Map */
        word_t          vaddr;
        word_t          vtop;
        word_t          w_rightsMask;
        paddr_t         paddr;
        cap_t           pdCap;
        pde_t*          pd;
        vm_rights_t     capVMRights;
        vm_rights_t     vmRights;
        vm_attributes_t vmAttr;
        vm_page_size_t  frameSize;
        asid_t          asid;

        if (length < 3 || extraCaps.excaprefs[0] == NULL) {
            current_syscall_error.type = seL4_TruncatedMessage;

            return EXCEPTION_SYSCALL_ERROR;
        }

        vaddr = getSyscallArg(0, buffer);
        w_rightsMask = getSyscallArg(1, buffer);
        vmAttr = vmAttributesFromWord(getSyscallArg(2, buffer));
        pdCap = extraCaps.excaprefs[0]->cap;

        frameSize = cap_frame_cap_get_capFSize(cap);
        capVMRights = cap_frame_cap_get_capFVMRights(cap);

        if (cap_frame_cap_get_capFMappedASID(cap) != asidInvalid) {
            userError("IA32Frame: Frame already mapped.");
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;

            return EXCEPTION_SYSCALL_ERROR;
        }

        if (cap_get_capType(pdCap) != cap_page_directory_cap ||
                !cap_page_directory_cap_get_capPDIsMapped(pdCap)) {
            if (cap_get_capType(pdCap) != cap_page_directory_cap) {
                userError("IA32Frame: Attempting to map frame into invalid page directory cap.");
            } else {
                userError("IA32Frame: Attempting to map frame into unmapped page directory cap.");
            }
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 1;

            return EXCEPTION_SYSCALL_ERROR;
        }
        pd = PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(pdCap));
        asid = cap_page_directory_cap_get_capPDMappedASID(pdCap);

        {
            findPDForASID_ret_t find_ret;

            find_ret = findPDForASID(asid);
            if (find_ret.status != EXCEPTION_NONE) {
                current_syscall_error.type = seL4_FailedLookup;
                current_syscall_error.failedLookupWasSource = false;

                return EXCEPTION_SYSCALL_ERROR;
            }

            if (find_ret.pd != pd) {
                current_syscall_error.type = seL4_InvalidCapability;
                current_syscall_error.invalidCapNumber = 1;

                return EXCEPTION_SYSCALL_ERROR;
            }
        }

        vtop = vaddr + BIT(pageBitsForSize(frameSize));

        if (vtop > PPTR_BASE) {
            current_syscall_error.type = seL4_InvalidArgument;
            current_syscall_error.invalidArgumentNumber = 0;

            return EXCEPTION_SYSCALL_ERROR;
        }

        vmRights = maskVMRights(capVMRights, rightsFromWord(w_rightsMask));

        if (!checkVPAlignment(frameSize, vaddr)) {
            current_syscall_error.type = seL4_AlignmentError;

            return EXCEPTION_SYSCALL_ERROR;
        }

        paddr = pptr_to_paddr((void*)cap_frame_cap_get_capFBasePtr(cap));

        cap = cap_frame_cap_set_capFMappedASID(cap, asid);
        cap = cap_frame_cap_set_capFMappedAddress(cap, vaddr);

        switch (frameSize) {
            /* PTE mappings */
        case IA32_4K: {
            pte_t              pte;
            lookupPTSlot_ret_t lu_ret;

            lu_ret = lookupPTSlot(pd, vaddr);
            if (lu_ret.status != EXCEPTION_NONE) {
                current_syscall_error.type = seL4_FailedLookup;
                current_syscall_error.failedLookupWasSource = false;
                /* current_lookup_fault will have been set by lookupPTSlot */
                return EXCEPTION_SYSCALL_ERROR;
            }

            pte = makeUserPTE(paddr, vmAttr, vmRights);
            cte->cap = cap;
            *lu_ret.ptSlot = pte;

            setThreadState(ksCurThread, ThreadState_Restart);
            return EXCEPTION_NONE;
        }

        /* PDE mappings */
        case IA32_4M: {
            pde_t* pdeSlot;

            pdeSlot = lookupPDSlot(pd, vaddr);

            if ((pde_ptr_get_page_size(pdeSlot) == pde_pde_4k) &&
                    (pde_pde_4k_ptr_get_present(pdeSlot))) {
                current_syscall_error.type = seL4_DeleteFirst;

                return EXCEPTION_SYSCALL_ERROR;
            }

            *pdeSlot = makeUserPDE(paddr, vmAttr, vmRights);
            cte->cap = cap;

            setThreadState(ksCurThread, ThreadState_Restart);
            return EXCEPTION_NONE;
        }

        default:
            fail("Invalid page type");
        }
        invalidatePageStructureCache();
        break;
    }

    case IA32PageRemap: { /* Remap */
        word_t              vaddr;
        word_t              w_rightsMask;
        paddr_t             paddr;
        vm_rights_t         capVMRights;
        vm_rights_t         vmRights;
        vm_attributes_t     vmAttr;
        vm_page_size_t      frameSize;
        asid_t              asid;
        cap_t               pdCap;
        pde_t*              pd;

#ifdef CONFIG_IOMMU
        if (cap_frame_cap_get_capFIsIOSpace(cap)) {
            current_syscall_error.type = seL4_IllegalOperation;

            return EXCEPTION_SYSCALL_ERROR;
        }
#endif

        if (length < 2 || extraCaps.excaprefs[0] == NULL) {
            current_syscall_error.type = seL4_TruncatedMessage;

            return EXCEPTION_SYSCALL_ERROR;
        }

        w_rightsMask = getSyscallArg(0, buffer);
        vmAttr = vmAttributesFromWord(getSyscallArg(1, buffer));
        pdCap = extraCaps.excaprefs[0]->cap;

        if (cap_get_capType(pdCap) != cap_page_directory_cap ||
                !cap_page_directory_cap_get_capPDIsMapped(pdCap)) {
            current_syscall_error.type =
                seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 1;

            return EXCEPTION_SYSCALL_ERROR;
        }
        pd = PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(
                         pdCap));
        asid = cap_page_directory_cap_get_capPDMappedASID(pdCap);

        if (cap_frame_cap_get_capFMappedASID(cap) == asidInvalid) {
            userError("IA32PageRemap: Frame must already have been mapped.");
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;

            return EXCEPTION_SYSCALL_ERROR;
        }

        vaddr       = cap_frame_cap_get_capFMappedAddress(cap);

        {
            findPDForASID_ret_t find_ret;

            find_ret = findPDForASID(asid);
            if (find_ret.status != EXCEPTION_NONE) {
                current_syscall_error.type = seL4_FailedLookup;
                current_syscall_error.failedLookupWasSource = false;

                return EXCEPTION_SYSCALL_ERROR;
            }

            if (find_ret.pd != pd || cap_frame_cap_get_capFMappedASID(cap) != asid) {
                current_syscall_error.type =
                    seL4_InvalidCapability;
                current_syscall_error.invalidCapNumber = 1;

                return EXCEPTION_SYSCALL_ERROR;
            }
        }

        frameSize   = cap_frame_cap_get_capFSize(cap);
        capVMRights = cap_frame_cap_get_capFVMRights(cap);
        paddr       = pptr_to_paddr((void*)cap_frame_cap_get_capFBasePtr(cap));

        vmRights = maskVMRights(capVMRights, rightsFromWord(w_rightsMask));

        if (!checkVPAlignment(frameSize, vaddr)) {
            current_syscall_error.type = seL4_AlignmentError;

            return EXCEPTION_SYSCALL_ERROR;
        }

        switch (frameSize) {
            /* PTE mappings */
        case IA32_4K: {
            pte_t              pte;
            lookupPTSlot_ret_t lu_ret;

            lu_ret = lookupPTSlot(pd, vaddr);
            if (lu_ret.status != EXCEPTION_NONE) {
                current_syscall_error.type = seL4_FailedLookup;
                current_syscall_error.failedLookupWasSource = false;
                /* current_lookup_fault will have been set by
                 * lookupPTSlot */
                return EXCEPTION_SYSCALL_ERROR;
            }
            pte = makeUserPTE(paddr, vmAttr, vmRights);
            *lu_ret.ptSlot = pte;

            setThreadState(ksCurThread, ThreadState_Restart);
            return EXCEPTION_NONE;
        }

        /* PDE mappings */
        case IA32_4M: {
            pde_t* pdeSlot;

            pdeSlot = lookupPDSlot(pd, vaddr);

            if ((pde_ptr_get_page_size(pdeSlot) == pde_pde_4k) &&
                    (pde_pde_4k_ptr_get_present(pdeSlot))) {
                current_syscall_error.type = seL4_DeleteFirst;

                return EXCEPTION_SYSCALL_ERROR;
            }
            *pdeSlot = makeUserPDE(paddr, vmAttr, vmRights);

            setThreadState(ksCurThread, ThreadState_Restart);
            return EXCEPTION_NONE;
        }

        default:
            fail("Invalid page type");
        }
        invalidatePageStructureCache();
        break;
    }

    case IA32PageUnmap: { /* Unmap */
        if (cap_frame_cap_get_capFMappedASID(cap) != asidInvalid) {
#ifdef CONFIG_IOMMU
            if (cap_frame_cap_get_capFIsIOSpace(cap)) {
                return decodeIA32IOUnMapInvocation(label, length, cte, cap, extraCaps);
            }
#endif
            unmapPage(
                cap_frame_cap_get_capFSize(cap),
                cap_frame_cap_get_capFMappedASID(cap),
                cap_frame_cap_get_capFMappedAddress(cap),
                (void *)cap_frame_cap_get_capFBasePtr(cap)
            );
        }
        cap_frame_cap_ptr_set_capFMappedAddress(&cte->cap, 0);
        cap_frame_cap_ptr_set_capFMappedASID(&cte->cap, asidInvalid);

        setThreadState(ksCurThread, ThreadState_Restart);
        return EXCEPTION_NONE;
    }
#ifdef CONFIG_IOMMU
    case IA32PageMapIO: { /* MapIO */
        return decodeIA32IOMapInvocation(label, length, cte, cap, extraCaps, buffer);
    }
#endif

    case IA32PageGetAddress: {
        /* Return it in the first message register. */
        assert(n_msgRegisters >= 1);

        setThreadState(ksCurThread, ThreadState_Restart);
        return performPageGetAddress((void*)cap_frame_cap_get_capFBasePtr(cap));
    }

    default:
        current_syscall_error.type = seL4_IllegalOperation;

        return EXCEPTION_SYSCALL_ERROR;
    }
}

exception_t
decodeIA32MMUInvocation(
    word_t label,
    unsigned int length,
    cptr_t cptr,
    cte_t* cte,
    cap_t cap,
    extra_caps_t extraCaps,
    word_t* buffer
)
{
    switch (cap_get_capType(cap)) {
    case cap_page_directory_cap:
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;

    case cap_page_table_cap:
        return decodeIA32PageTableInvocation(label, length, cte, cap, extraCaps, buffer);

    case cap_frame_cap:
        return decodeIA32FrameInvocation(label, length, cte, cap, extraCaps, buffer);

    case cap_asid_control_cap: {
        unsigned int     i;
        asid_t           asid_base;
        word_t           index;
        word_t           depth;
        cap_t            untyped;
        cap_t            root;
        cte_t*           parentSlot;
        cte_t*           destSlot;
        lookupSlot_ret_t lu_ret;
        void*            frame;
        exception_t      status;

        if (label != IA32ASIDControlMakePool) {
            current_syscall_error.type = seL4_IllegalOperation;

            return EXCEPTION_SYSCALL_ERROR;
        }

        if (length < 2 || extraCaps.excaprefs[0] == NULL
                || extraCaps.excaprefs[1] == NULL) {
            current_syscall_error.type = seL4_TruncatedMessage;

            return EXCEPTION_SYSCALL_ERROR;
        }

        index = getSyscallArg(0, buffer);
        depth = getSyscallArg(1, buffer);
        parentSlot = extraCaps.excaprefs[0];
        untyped = parentSlot->cap;
        root = extraCaps.excaprefs[1]->cap;

        /* Find first free pool */
        for (i = 0; i < nASIDPools && ia32KSASIDTable[i]; i++);

        if (i == nASIDPools) {
            /* no unallocated pool is found */
            current_syscall_error.type = seL4_DeleteFirst;

            return EXCEPTION_SYSCALL_ERROR;
        }

        asid_base = i << asidLowBits;

        if (cap_get_capType(untyped) != cap_untyped_cap ||
                cap_untyped_cap_get_capBlockSize(untyped) != ASID_POOL_SIZE_BITS) {
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 1;

            return EXCEPTION_SYSCALL_ERROR;
        }

        status = ensureNoChildren(parentSlot);
        if (status != EXCEPTION_NONE) {
            return status;
        }

        frame = WORD_PTR(cap_untyped_cap_get_capPtr(untyped));

        lu_ret = lookupTargetSlot(root, index, depth);
        if (lu_ret.status != EXCEPTION_NONE) {
            return lu_ret.status;
        }
        destSlot = lu_ret.slot;

        status = ensureEmptySlot(destSlot);
        if (status != EXCEPTION_NONE) {
            return status;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        return performASIDControlInvocation(frame, destSlot, parentSlot, asid_base);
    }

    case cap_asid_pool_cap: {
        cap_t        pdCap;
        cte_t*       pdCapSlot;
        asid_pool_t* pool;
        unsigned int i;
        asid_t       asid;

        if (label != IA32ASIDPoolAssign) {
            current_syscall_error.type = seL4_IllegalOperation;

            return EXCEPTION_SYSCALL_ERROR;
        }

        if (extraCaps.excaprefs[0] == NULL) {
            current_syscall_error.type = seL4_TruncatedMessage;

            return EXCEPTION_SYSCALL_ERROR;
        }

        pdCapSlot = extraCaps.excaprefs[0];
        pdCap = pdCapSlot->cap;

        if (cap_get_capType(pdCap) != cap_page_directory_cap ||
                cap_page_directory_cap_get_capPDMappedASID(pdCap) != asidInvalid) {
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 1;

            return EXCEPTION_SYSCALL_ERROR;
        }

        pool = ia32KSASIDTable[cap_asid_pool_cap_get_capASIDBase(cap) >> asidLowBits];
        if (!pool) {
            current_syscall_error.type = seL4_FailedLookup;
            current_syscall_error.failedLookupWasSource = false;
            current_lookup_fault = lookup_fault_invalid_root_new();
            return EXCEPTION_SYSCALL_ERROR;
        }

        if (pool != ASID_POOL_PTR(cap_asid_pool_cap_get_capASIDPool(cap))) {
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }

        /* Find first free ASID */
        asid = cap_asid_pool_cap_get_capASIDBase(cap);
        for (i = 0; i < BIT(asidLowBits) && (asid + i == 0 || pool->array[i]); i++);

        if (i == BIT(asidLowBits)) {
            current_syscall_error.type = seL4_DeleteFirst;

            return EXCEPTION_SYSCALL_ERROR;
        }

        asid += i;

        setThreadState(ksCurThread, ThreadState_Restart);
        return performASIDPoolInvocation(asid, pool, pdCapSlot);
    }

    default:
        fail("Invalid arch cap type");
    }
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/capdl.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>

#ifdef DEBUG

#include <object/structures.h>
#include <object/tcb.h>
#include <model/statedata.h>
#include <machine/capdl.h>
#include <arch/machine/capdl.h>
#include <plat/machine/debug_helpers.h>
#include <plat/machine/pci.h>

#define ARCH 0xe1

#define PD_READ_SIZE         BIT(PD_BITS)
#define PT_READ_SIZE         BIT(PT_BITS)
#define ASID_POOL_READ_SIZE  BIT(ASID_POOL_BITS)
#define IO_PT_READ_SIZE      BIT(VTD_PT_BITS)

static int getDecodedChar(unsigned char *result)
{
    unsigned char c;
    c = getDebugChar();
    if (c == START) {
        return 1;
    }
    if (c == ESCAPE) {
        c = getDebugChar();
        if (c == START) {
            return 1;
        }
        switch (c) {
        case ESCAPE_ESCAPE:
            *result = ESCAPE;
            break;
        case START_ESCAPE:
            *result = START;
            break;
        case END_ESCAPE:
            *result = END;
            break;
        default:
            if (c >= 20 && c < 40) {
                *result = c - 20;
            }
        }
        return 0;
    } else {
        *result = c;
        return 0;
    }
}

static void putEncodedChar(unsigned char c)
{
    switch (c) {
    case ESCAPE:
        putDebugChar(ESCAPE);
        putDebugChar(ESCAPE_ESCAPE);
        break;
    case START:
        putDebugChar(ESCAPE);
        putDebugChar(START_ESCAPE);
        break;
    case END:
        putDebugChar(ESCAPE);
        putDebugChar(END_ESCAPE);
        break;
    default:
        if (c < 20) {
            putDebugChar(ESCAPE);
            putDebugChar(c + 20);
        } else {
            putDebugChar(c);
        }
    }
}

static int getArg32(unsigned int *res)
{
    unsigned char b1 = 0;
    unsigned char b2 = 0;
    unsigned char b3 = 0;
    unsigned char b4 = 0;
    if (getDecodedChar(&b1)) {
        return 1;
    }
    if (getDecodedChar(&b2)) {
        return 1;
    }
    if (getDecodedChar(&b3)) {
        return 1;
    }
    if (getDecodedChar(&b4)) {
        return 1;
    }
    *res = (b1 << 24 ) | (b2 << 16) | (b3 << 8) | b4;
    return 0;
}

static void sendWord(unsigned int word)
{
    putEncodedChar(word & 0xff);
    putEncodedChar((word >> 8) & 0xff);
    putEncodedChar((word >> 16) & 0xff);
    putEncodedChar((word >> 24) & 0xff);
}

static cte_t *getMDBParent(cte_t *slot)
{
    cte_t *oldSlot = CTE_PTR(mdb_node_get_mdbPrev(slot->cteMDBNode));

    while (oldSlot != 0 && !isMDBParentOf(oldSlot, slot)) {
        oldSlot = CTE_PTR(mdb_node_get_mdbPrev(oldSlot->cteMDBNode));
    }

    return oldSlot;
}

static void sendPD(unsigned int address)
{
    unsigned int i;
    unsigned int exists;
    pde_t *start = (pde_t *)address;
    for (i = 0; i < PD_READ_SIZE; i++) {
        pde_t pde = start[i];
        exists = 1;
        if (pde_get_page_size(pde) == pde_pde_4k && (pde_pde_4k_get_pt_base_address(pde) == 0 ||
                                                     !pde_pde_4k_get_present(pde) || !pde_pde_4k_get_super_user(pde))) {
            exists = 0;
        } else if (pde_get_page_size(pde) == pde_pde_4m && (pde_pde_4m_get_page_base_address(pde) == 0 ||
                                                            !pde_pde_4m_get_present(pde) || !pde_pde_4m_get_super_user(pde))) {
            exists = 0;
        }
        if (exists != 0 && i < PPTR_BASE >> pageBitsForSize(IA32_4M)) {
            sendWord(i);
            sendWord(pde.words[0]);
        }
    }
}

static void sendPT(unsigned int address)
{
    unsigned int i;
    pte_t *start = (pte_t *)address;
    for (i = 0; i < PT_READ_SIZE; i++) {
        pte_t pte = start[i];
        if (pte_get_page_base_address(pte) != 0 && pte_get_present(pte) && pte_get_super_user(pte)) {
            sendWord(i);
            sendWord(pte.words[0]);
        }
    }
}

static void sendASIDPool(unsigned int address)
{
    unsigned int i;
    pde_t **start = (pde_t **)address;
    for (i = 0; i < ASID_POOL_READ_SIZE; i++) {
        pde_t *pde = start[i];
        if (pde != 0) {
            sendWord(i);
            sendWord((unsigned int)pde);
        }
    }
}

#ifdef CONFIG_IOMMU

static void sendIOPT(unsigned int address, unsigned int level)
{
    unsigned int i;
    vtd_pte_t *start = (vtd_pte_t *)address;
    for (i = 0; i < IO_PT_READ_SIZE; i++) {
        vtd_pte_t vtd_pte = start[i];
        if (vtd_pte_get_addr(vtd_pte) != 0) {
            sendWord(i);
            sendWord(vtd_pte.words[0]);
            sendWord(vtd_pte.words[1]);
            if (level == ia32KSnumIOPTLevels) {
                sendWord(1);
            } else {
                sendWord(0);
            }
        }
    }
}

static void sendIOSpace(uint32_t pci_request_id)
{
    uint32_t   vtd_root_index;
    uint32_t   vtd_context_index;
    vtd_rte_t* vtd_root_slot;
    vtd_cte_t* vtd_context;
    vtd_cte_t* vtd_context_slot;

    vtd_root_index = get_pci_bus(pci_request_id);
    vtd_root_slot = ia32KSvtdRootTable + vtd_root_index;

    vtd_context = (vtd_cte_t*)paddr_to_pptr(vtd_rte_ptr_get_ctp(vtd_root_slot));
    vtd_context_index = (get_pci_dev(pci_request_id) << 3) | get_pci_fun(pci_request_id);
    vtd_context_slot = &vtd_context[vtd_context_index];

    if (vtd_cte_ptr_get_present(vtd_context_slot)) {
        sendWord(vtd_cte_ptr_get_asr(vtd_context_slot));
    } else {
        sendWord(0);
    }
}

#endif

static void sendRunqueues(void)
{
    unsigned int i;
    sendWord((unsigned int)ksCurThread);
    for (i = 0; i < NUM_READY_QUEUES; i++) {
        tcb_t *current = ksReadyQueues[i].head;
        if (current != 0) {
            while (current != ksReadyQueues[i].end) {
                sendWord((unsigned int)current);
                current = current -> tcbSchedNext;
            }
            sendWord((unsigned int)current);
        }
    }
}

static void sendEPQueue(unsigned int epptr)
{
    tcb_t *current = (tcb_t *)endpoint_ptr_get_epQueue_head((endpoint_t *)epptr);
    tcb_t *tail = (tcb_t *)endpoint_ptr_get_epQueue_tail((endpoint_t *)epptr);
    if (current == 0) {
        return;
    }
    while (current != tail) {
        sendWord((unsigned int)current);
        current = current->tcbEPNext;
    }
    sendWord((unsigned int)current);
}

static void sendCNode(unsigned int address, unsigned int sizebits)
{
    unsigned int i;
    cte_t *start = (cte_t *)address;
    for (i = 0; i < (1 << sizebits); i++) {
        cap_t cap = start[i].cap;
        if (cap_get_capType(cap) != cap_null_cap) {
            cte_t *parent = getMDBParent(&start[i]);
            sendWord(i);
            sendWord(cap.words[0]);
            sendWord(cap.words[1]);
            sendWord((unsigned int)parent);
        }
    }
}

static void sendIRQNode(void)
{
    sendCNode((unsigned int)intStateIRQNode, 8);
}

static void sendVersion(void)
{
    sendWord(ARCH);
    sendWord(CAPDL_VERSION);
}

void capDL(void)
{
    int result;
    int done = 0;
    while (done == 0) {
        unsigned char c;
        do {
            c = getDebugChar();
        } while (c != START);
        do {
            result = getDecodedChar(&c);
            if (result) {
                continue;
            }
            switch (c) {
            case PD_COMMAND: {
                /*pgdir */
                unsigned int arg;
                result = getArg32(&arg);
                if (result) {
                    continue;
                }
                sendPD(arg);
                putDebugChar(END);
            }
            break;
            case PT_COMMAND: {
                /*pg table */
                unsigned int arg;
                result = getArg32(&arg);
                if (result) {
                    continue;
                }
                sendPT(arg);
                putDebugChar(END);
            }
            break;
            case ASID_POOL_COMMAND: {
                /*asid pool */
                unsigned int arg;
                result = getArg32(&arg);
                if (result) {
                    continue;
                }
                sendASIDPool(arg);
                putDebugChar(END);
            }
            break;
#ifdef CONFIG_IOMMU
            case IO_PT_COMMAND: {
                /*io pt table */
                unsigned int address, level;
                result = getArg32(&address);
                if (result) {
                    continue;
                }
                result = getArg32(&level);
                if (result) {
                    continue;
                }
                sendIOPT(address, level);
                putDebugChar(END);
            }
            break;
            case IO_SPACE_COMMAND: {
                /*io space */
                unsigned int arg;
                result = getArg32(&arg);
                if (result) {
                    continue;
                }
                sendIOSpace(arg);
                putDebugChar(END);
            }
            break;
#endif
            case RQ_COMMAND: {
                /*runqueues */
                sendRunqueues();
                putDebugChar(END);
                result = 0;
            }
            break;
            case EP_COMMAND: {
                /*endpoint waiters */
                unsigned int arg;
                result = getArg32(&arg);
                if (result) {
                    continue;
                }
                sendEPQueue(arg);
                putDebugChar(END);
            }
            break;
            case CN_COMMAND: {
                /*cnode */
                unsigned int address, sizebits;
                result = getArg32(&address);
                if (result) {
                    continue;
                }
                result = getArg32(&sizebits);
                if (result) {
                    continue;
                }

                sendCNode(address, sizebits);
                putDebugChar(END);
            }
            break;
            case IRQ_COMMAND: {
                sendIRQNode();
                putDebugChar(END);
                result = 0;
            }
            break;
            case VERSION_COMMAND: {
                sendVersion();
                putDebugChar(END);
            }
            break;
            case DONE: {
                done = 1;
                putDebugChar(END);
            }
            default:
                result = 0;
                break;
            }
        } while (result);
    }
}

#endif
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/fpu.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <api/failures.h>
#include <api/syscall.h>
#include <model/statedata.h>
#include <arch/machine/fpu.h>
#include <arch/machine/cpu_registers.h>
#include <arch/object/structures.h>
#include <arch/linker.h>

/*
 * Setup the FPU register state for a new thread.
 */
void
Arch_initFpuContext(user_context_t *context)
{
    context->fpuState = ia32KSnullFpuState;
}

/*
 * Switch the owner of the FPU to the given thread.
 */
static void
switchFpuOwner(tcb_t *new_owner)
{
    enableFpu();
    if (ia32KSfpuOwner) {
        saveFpuState(&ia32KSfpuOwner->tcbContext.fpuState);
    }
    if (new_owner) {
        loadFpuState(&new_owner->tcbContext.fpuState);
    } else {
        disableFpu();
    }
    ia32KSfpuOwner = new_owner;
}

/*
 * Handle a FPU fault.
 *
 * This CPU exception is thrown when userspace attempts to use the FPU while
 * it is disabled. We need to save the current state of the FPU, and hand
 * it over.
 */
VISIBLE exception_t
handleUnimplementedDevice(void)
{
    /*
     * If we have already given the FPU to the user, we should not reach here.
     *
     * This should only be able to occur on CPUs without an FPU at all, which
     * we presumably are happy to assume will not be running seL4.
     */
    assert(ksCurThread != ia32KSfpuOwner);

    /* Otherwise, lazily switch over the FPU. */
    switchFpuOwner(ksCurThread);

    return EXCEPTION_NONE;
}

/*
 * Prepare for the deletion of the given thread.
 */
void
Arch_fpuThreadDelete(tcb_t *thread)
{
    /*
     * If the thread being deleted currently owns the FPU, switch away from it
     * so that 'ia32KSfpuOwner' doesn't point to invalid memory.
     */
    if (ia32KSfpuOwner == thread) {
        switchFpuOwner(NULL);
    }
}

/*
 * Initialise the FPU for this machine.
 */
BOOT_CODE void
Arch_initFpu(void)
{
    /* Enable FPU / SSE / SSE2 / SSE3 / SSSE3 / SSE4 Extensions. */
    write_cr4(read_cr4() | CR4_OSFXSR);

    /* Enable the FPU in general. Although leave it in a state where it will
     * generate a fault if someone tries to use it as we implement lazy
     * switching */
    write_cr0((read_cr0() & ~CR0_EMULATION) | CR0_MONITOR_COPROC | CR0_NUMERIC_ERROR | CR0_TASK_SWITCH);
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/hardware.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <types.h>
#include <machine/registerset.h>
#include <model/statedata.h>
#include <object/structures.h>
#include <arch/machine.h>
#include <arch/machine/hardware.h>
#include <arch/machine/registerset.h>
#include <arch/linker.h>

/* initialises MSRs required to setup sysenter and sysexit */
BOOT_CODE void
init_sysenter_msrs(void)
{
    ia32_wrmsr(IA32_SYSENTER_CS_MSR,  0, (uint32_t)SEL_CS_0);
    ia32_wrmsr(IA32_SYSENTER_EIP_MSR, 0, (uint32_t)&handle_syscall);
    ia32_wrmsr(IA32_SYSENTER_ESP_MSR, 0, (uint32_t)&ia32KStss.words[1]);
}

word_t PURE getRestartPC(tcb_t *thread)
{
    return getRegister(thread, FaultEIP);
}

void setNextPC(tcb_t *thread, word_t v)
{
    setRegister(thread, NextEIP, v);
}

/* Returns the size of CPU's cacheline */
BOOT_CODE uint32_t CONST
getCacheLineSizeBits(void)
{
    uint32_t line_size;
    uint32_t n;

    line_size = getCacheLineSize();
    if (line_size == 0) {
        printf("Cacheline size must be >0\n");
        return 0;
    }

    /* determine size_bits */
    n = 0;
    while (!(line_size & 1)) {
        line_size >>= 1;
        n++;
    }

    if (line_size != 1) {
        printf("Cacheline size must be a power of two\n");
        return 0;
    }

    return n;
}

/* Flushes a specific memory range from the CPU cache */

void flushCacheRange(void* vaddr, uint32_t size_bits)
{
    uint32_t v;

    assert(size_bits < WORD_BITS);
    assert(IS_ALIGNED((uint32_t)vaddr, size_bits));

    ia32_mfence();

    for (v = ROUND_DOWN((uint32_t)vaddr, ia32KScacheLineSizeBits);
            v < (uint32_t)vaddr + BIT(size_bits);
            v += BIT(ia32KScacheLineSizeBits)) {
        flushCacheLine((void*)v);
    }
    ia32_mfence();
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/registerset.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <arch/machine/registerset.h>
#include <arch/machine/fpu.h>
#include <arch/object/structures.h>

const register_t msgRegisters[] = {
    EDI, EBP
};

const register_t frameRegisters[] = {
    FaultEIP, ESP, EFLAGS, EAX, EBX, ECX, EDX, ESI, EDI, EBP
};

const register_t gpRegisters[] = {
    TLS_BASE, FS, GS
};

const register_t exceptionMessage[] = {
    FaultEIP, ESP, EFLAGS
};

const register_t syscallMessage[] = {
    EAX, EBX, ECX, EDX, ESI, EDI, EBP, NextEIP, ESP, EFLAGS
};

void Arch_initContext(user_context_t* context)
{
    context->registers[EAX] = 0;
    context->registers[EBX] = 0;
    context->registers[ECX] = 0;
    context->registers[EDX] = 0;
    context->registers[ESI] = 0;
    context->registers[EDI] = 0;
    context->registers[EBP] = 0;
    context->registers[DS] = SEL_DS_3;
    context->registers[ES] = SEL_DS_3;
    context->registers[FS] = SEL_NULL;
    context->registers[GS] = SEL_NULL;
    context->registers[TLS_BASE] = 0;
    context->registers[Error] = 0;
    context->registers[FaultEIP] = 0;
    context->registers[NextEIP] = 0;            /* overwritten by setNextPC() later on */
    context->registers[CS] = SEL_CS_3;
    context->registers[EFLAGS] = BIT(9) | BIT(1); /* enable interrupts and set bit 1 which is always 1 */
    context->registers[ESP] = 0;                /* userland has to set it after entry */
    context->registers[SS] = SEL_DS_3;

    Arch_initFpuContext(context);
}

word_t sanitiseRegister(register_t reg, word_t v)
{
    if (reg == EFLAGS) {
        v |=  BIT(1);   /* reserved bit that must be set to 1 */
        v &= ~BIT(3);   /* reserved bit that must be set to 0 */
        v &= ~BIT(5);   /* reserved bit that must be set to 0 */
        v |=  BIT(9);   /* interrupts must be enabled in userland */
        v &=  MASK(12); /* bits 12:31 have to be 0 */
    }
    if (reg == FS || reg == GS) {
        if (v != SEL_TLS && v != SEL_IPCBUF) {
            v = 0;
        }
    }
    return v;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/model/statedata.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <util.h>
#include <api/types.h>
#include <arch/types.h>
#include <arch/model/statedata.h>
#include <arch/object/structures.h>

/* ==== read/write kernel state not preserved across kernel entries ==== */

/* Interrupt currently being handled */
interrupt_t ia32KScurInterrupt VISIBLE;

/* ==== proper read/write kernel state ==== */

/* Task State Segment (TSS), contains currently running TCB in ESP0 */
tss_t ia32KStss VISIBLE;

/* Global Descriptor Table (GDT) */
gdt_entry_t ia32KSgdt[GDT_ENTRIES];

/* The top level ASID table */
asid_pool_t* ia32KSASIDTable[BIT(asidHighBits)];

/*
 * Current thread whose state is installed in the FPU, or NULL if
 * the FPU is currently invalid.
 */
tcb_t *ia32KSfpuOwner VISIBLE;

/* ==== read-only kernel state (only written during bootstrapping) ==== */

/* The privileged kernel mapping PD & PT */
pde_t* ia32KSkernelPD;
pte_t* ia32KSkernelPT;

/* CPU Cache Line Size */
uint32_t ia32KScacheLineSizeBits;

/* Interrupt Descriptor Table (IDT) */
idt_entry_t ia32KSidt[IDT_ENTRIES];

/* A valid initial FPU state, copied to every new thread. */
user_fpu_state_t ia32KSnullFpuState ALIGN(MIN_FPU_ALIGNMENT);

/* Current active page directory. This is really just a shadow of CR3 */
paddr_t ia32KSCurrentPD VISIBLE;

#ifdef CONFIG_IOMMU
/* Number of IOMMUs (DMA Remapping Hardware Units) */
uint32_t ia32KSnumDrhu;

/* Intel VT-d Root Entry Table */
vtd_rte_t* ia32KSvtdRootTable;
uint32_t ia32KSnumIOPTLevels;
uint32_t ia32KSnumIODomainIDBits;
#endif

#ifdef DEBUG
uint16_t ia32KSconsolePort;
uint16_t ia32KSdebugPort;
#endif
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/interrupt.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <kernel/boot.h>
#include <model/statedata.h>
#include <arch/object/interrupt.h>
#include <arch/linker.h>

exception_t Arch_decodeInterruptControl(unsigned int length, extra_caps_t extraCaps)
{
    current_syscall_error.type = seL4_IllegalOperation;
    return EXCEPTION_SYSCALL_ERROR;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/ioport.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <kernel/thread.h>
#include <api/failures.h>
#include <api/syscall.h>
#include <machine/io.h>
#include <arch/object/ioport.h>
#include <arch/api/invocation.h>

static exception_t
ensurePortOperationAllowed(cap_t cap, uint32_t start_port, uint32_t size)
{
    uint32_t first_allowed = cap_io_port_cap_get_capIOPortFirstPort(cap);
    uint32_t last_allowed = cap_io_port_cap_get_capIOPortLastPort(cap);
    uint32_t end_port = start_port + size - 1;
    assert(first_allowed <= last_allowed);
    assert(start_port <= end_port);

    if ((start_port < first_allowed) || (end_port > last_allowed)) {
        userError("IOPort: Ports %d--%d fall outside permitted range %d--%d.",
                  (int)start_port, (int)end_port,
                  (int)first_allowed, (int)last_allowed);
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    return EXCEPTION_NONE;
}

exception_t
decodeIA32PortInvocation(
    word_t label,
    unsigned int length,
    cptr_t cptr,
    cte_t* slot,
    cap_t cap,
    extra_caps_t extraCaps,
    word_t* buffer
)
{
    uint32_t res;
    uint32_t len;
    uint16_t port;
    exception_t ret;

    /* Ensure user specified at very least a port. */
    if (length < 1) {
        userError("IOPort: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Get the port the user is trying to write to. */
    port = getSyscallArg(0, buffer) & 0xffff;

    switch (label) {
    case IA32IOPortIn8: { /* inport 8 bits */

        /* Check we are allowed to perform the operation. */
        ret = ensurePortOperationAllowed(cap, port, 1);
        if (ret != EXCEPTION_NONE) {
            return ret;
        }

        /* Perform the read. */
        res = in8(port);
        len = 1;
        break;
    }

    case IA32IOPortIn16: { /* inport 16 bits */

        /* Check we are allowed to perform the operation. */
        ret = ensurePortOperationAllowed(cap, port, 2);
        if (ret != EXCEPTION_NONE) {
            return ret;
        }

        /* Perform the read. */
        res = in16(port);
        len = 1;
        break;
    }

    case IA32IOPortIn32: { /* inport 32 bits */

        /* Check we are allowed to perform the operation. */
        ret = ensurePortOperationAllowed(cap, port, 4);
        if (ret != EXCEPTION_NONE) {
            return ret;
        }

        /* Perform the read. */
        res = in32(port);
        len = 1;
        break;
    }

    case IA32IOPortOut8: { /* outport 8 bits */
        uint8_t data;

        /* Check we are allowed to perform the operation. */
        ret = ensurePortOperationAllowed(cap, port, 1);
        if (ret != EXCEPTION_NONE) {
            return ret;
        }

        /* Perform the write. */
        data = (getSyscallArg(0, buffer) >> 16) & 0xff;
        out8(port, data);
        len = 0;
        break;
    }

    case IA32IOPortOut16: { /* outport 16 bits */
        uint16_t data;

        /* Check we are allowed to perform the operation. */
        ret = ensurePortOperationAllowed(cap, port, 2);
        if (ret != EXCEPTION_NONE) {
            return ret;
        }

        /* Perform the write. */
        data = (getSyscallArg(0, buffer) >> 16) & 0xffff;
        out16(port, data);
        len = 0;
        break;
    }

    case IA32IOPortOut32: { /* outport 32 bits */
        uint32_t data;

        /* Ensure the incoming message is long enough for the write. */
        if (length < 2) {
            userError("IOPort Out32: Truncated message.");
            current_syscall_error.type = seL4_TruncatedMessage;
            return EXCEPTION_SYSCALL_ERROR;
        }

        /* Check we are allowed to perform the operation. */
        ret = ensurePortOperationAllowed(cap, port, 4);
        if (ret != EXCEPTION_NONE) {
            return ret;
        }

        /* Perform the write. */
        data = getSyscallArg(1, buffer);
        out32(port, data);
        len = 0;
        break;
    }

    default:
        userError("IOPort: Unknown operation.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (len > 0) {
        /* return the value read from the port */
        setRegister(ksCurThread, badgeRegister, 0);
        if (n_msgRegisters < 1) {
            word_t* ipcBuffer;
            ipcBuffer = lookupIPCBuffer(true, ksCurThread);
            if (ipcBuffer != NULL) {
                ipcBuffer[1] = res;
                len = 1;
            } else {
                len = 0;
            }
        } else {
            setRegister(ksCurThread, msgRegisters[0], res);
            len = 1;
        }
    }
    setRegister(ksCurThread, msgInfoRegister,
                wordFromMessageInfo(message_info_new(0, 0, 0, len)));

    setThreadState(ksCurThread, ThreadState_Restart);
    return EXCEPTION_NONE;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/iospace.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>

#ifdef CONFIG_IOMMU

#include <api/syscall.h>
#include <machine/io.h>
#include <kernel/thread.h>
#include <arch/api/invocation.h>
#include <arch/object/iospace.h>
#include <arch/model/statedata.h>
#include <arch/linker.h>
#include <plat/machine/intel-vtd.h>
#include <plat/machine/pci.h>

BOOT_CODE cap_t
master_iospace_cap(void)
{
    if (ia32KSnumDrhu == 0) {
        return cap_null_cap_new();
    }

    return
        cap_io_space_cap_new(
            0,              /* capDomainID  */
            0              /* capPCIDevice */
        );
}

static vtd_cte_t* lookup_vtd_context_slot(cap_t cap)
{
    uint32_t   vtd_root_index;
    uint32_t   vtd_context_index;
    uint32_t   pci_request_id;
    vtd_rte_t* vtd_root_slot;
    vtd_cte_t* vtd_context;
    vtd_cte_t* vtd_context_slot;

    switch (cap_get_capType(cap)) {
    case cap_io_space_cap:
        pci_request_id = cap_io_space_cap_get_capPCIDevice(cap);
        break;

    case cap_io_page_table_cap:
        pci_request_id = cap_io_page_table_cap_get_capIOPTIOASID(cap);
        break;

    case cap_frame_cap:
        pci_request_id = cap_frame_cap_get_capFMappedASID(cap);
        break;

    default:
        fail("Invalid cap type");
    }

    vtd_root_index = get_pci_bus(pci_request_id);
    vtd_root_slot = ia32KSvtdRootTable + vtd_root_index;

    vtd_context = (vtd_cte_t*)paddr_to_pptr(vtd_rte_ptr_get_ctp(vtd_root_slot));
    vtd_context_index = (get_pci_dev(pci_request_id) << 3) | get_pci_fun(pci_request_id);
    vtd_context_slot = &vtd_context[vtd_context_index];

    return vtd_context_slot;
}

static lookupIOPTSlot_ret_t lookupIOPTSlot_helper(vtd_pte_t* iopt, word_t translation, word_t levels)
{
    lookupIOPTSlot_ret_t ret;
    uint32_t             iopt_index;
    vtd_pte_t*           vtd_pte_slot;
    vtd_pte_t*           vtd_next_level_iopt;

    if (VTD_PT_BITS * levels >= 32) {
        iopt_index = 0;
    } else {
        iopt_index = (translation >> (VTD_PT_BITS * levels)) & MASK(VTD_PT_BITS);
    }

    vtd_pte_slot = iopt + iopt_index;

    if (!vtd_pte_ptr_get_write(vtd_pte_slot) || levels == 0) {
        /* Slot is in this page table level */
        ret.ioptSlot = vtd_pte_slot;
        ret.level    = ia32KSnumIOPTLevels - levels;
        ret.status   = EXCEPTION_NONE;
        return ret;
    } else {
        vtd_next_level_iopt = (vtd_pte_t*)paddr_to_pptr(vtd_pte_ptr_get_addr(vtd_pte_slot));
        return lookupIOPTSlot_helper(vtd_next_level_iopt, translation, levels - 1);
    }
}

static inline lookupIOPTSlot_ret_t lookupIOPTSlot(vtd_pte_t* iopt, word_t io_address)
{
    lookupIOPTSlot_ret_t ret;

    if (iopt == 0) {
        ret.ioptSlot    = 0;
        ret.level       = 0;
        ret.status      = EXCEPTION_LOOKUP_FAULT;
        return ret;
    } else {
        return lookupIOPTSlot_helper(iopt, io_address >> PAGE_BITS, ia32KSnumIOPTLevels - 1);
    }
}

exception_t
decodeIA32IOPTInvocation(
    word_t       label,
    uint32_t     length,
    cte_t*       slot,
    cap_t        cap,
    extra_caps_t extraCaps,
    word_t*      buffer
)
{
    cap_t      io_space;
    paddr_t    paddr;
    uint32_t   pci_request_id;
    uint32_t   io_address;
    uint16_t   domain_id;
    vtd_cte_t* vtd_context_slot;
    vtd_pte_t* vtd_pte;

    if (extraCaps.excaprefs[0] == NULL || length < 1) {
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (label != IA32IOPageTableMap ) {
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    io_space     = extraCaps.excaprefs[0]->cap;
    io_address   = getSyscallArg(0, buffer) & ~MASK(PAGE_BITS);

    if (cap_io_page_table_cap_get_capIOPTIsMapped(cap)) {
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (cap_get_capType(io_space) != cap_io_space_cap) {
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;
    }

    pci_request_id = cap_io_space_cap_get_capPCIDevice(cap);
    domain_id = cap_io_space_cap_get_capDomainID(cap);
    if (pci_request_id == asidInvalid) {
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;

        return EXCEPTION_SYSCALL_ERROR;
    }

    paddr = pptr_to_paddr(VTD_PTE_PTR(cap_io_page_table_cap_get_capIOPTBasePtr(cap)));
    vtd_context_slot = lookup_vtd_context_slot(io_space);

    if (!vtd_cte_ptr_get_present(vtd_context_slot)) {
        /* 1st Level Page Table */
        vtd_cte_ptr_new(
            vtd_context_slot,
            domain_id,               /* Domain ID */
            ia32KSnumIOPTLevels - 2, /* Address Width (x = levels - 2)       */
            paddr,                   /* Address Space Root                   */
            0,                       /* Translation Type                     */
            true                     /* Present                              */
        );

        flushCacheRange(vtd_context_slot, VTD_CTE_SIZE_BITS);

        cap = cap_io_page_table_cap_set_capIOPTIsMapped(cap, 1);
        cap = cap_io_page_table_cap_set_capIOPTLevel(cap, 0);
        cap = cap_io_page_table_cap_set_capIOPTIOASID(cap, pci_request_id);
    } else {
        lookupIOPTSlot_ret_t lu_ret;

        vtd_pte = (vtd_pte_t*)paddr_to_pptr(vtd_cte_ptr_get_asr(vtd_context_slot));
        lu_ret  = lookupIOPTSlot(vtd_pte, io_address);

        if (lu_ret.status != EXCEPTION_NONE) {
            current_syscall_error.type = seL4_FailedLookup;
            current_syscall_error.failedLookupWasSource = false;
            return EXCEPTION_SYSCALL_ERROR;
        }

        vtd_pte_ptr_new(
            lu_ret.ioptSlot,
            paddr,  /* Physical Address         */
            1,      /* Read permission flag     */
            1       /* Write permission flag    */
        );

        flushCacheRange(lu_ret.ioptSlot, VTD_PTE_SIZE_BITS);

        cap = cap_io_page_table_cap_set_capIOPTIsMapped(cap, 1);
        cap = cap_io_page_table_cap_set_capIOPTLevel(cap, lu_ret.level);
        cap = cap_io_page_table_cap_set_capIOPTIOASID(cap, pci_request_id);
        cap = cap_io_page_table_cap_set_capIOPTMappedAddress(cap, io_address);
    }

    slot->cap = cap;

    setThreadState(ksCurThread, ThreadState_Restart);
    return EXCEPTION_NONE;
}

exception_t
decodeIA32IOMapInvocation(
    word_t       label,
    uint32_t     length,
    cte_t*       slot,
    cap_t        cap,
    extra_caps_t extraCaps,
    word_t*      buffer
)
{
    cap_t      io_space;
    uint32_t   io_address;
    uint32_t   pci_request_id;
    vtd_cte_t* vtd_context_slot;
    vtd_pte_t* vtd_pte;
    paddr_t    paddr;

    if (extraCaps.excaprefs[0] == NULL || length < 2) {
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (cap_frame_cap_get_capFSize(cap) != IA32_4K) {
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (cap_frame_cap_get_capFMappedASID(cap) != asidInvalid) {
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;
    }

    io_space    = extraCaps.excaprefs[0]->cap;
    io_address  = getSyscallArg(1, buffer) & ~MASK(PAGE_BITS);
    paddr       = pptr_to_paddr((void*)cap_frame_cap_get_capFBasePtr(cap));

    if (cap_get_capType(io_space) != cap_io_space_cap) {
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;
    }

    pci_request_id = cap_io_space_cap_get_capPCIDevice(io_space);

    if (pci_request_id == asidInvalid) {
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;
    }

    vtd_context_slot = lookup_vtd_context_slot(io_space);

    if (!vtd_cte_ptr_get_present(vtd_context_slot)) {
        /* 1st Level Page Table is not installed */
        current_syscall_error.type = seL4_FailedLookup;
        current_syscall_error.failedLookupWasSource = false;
        return EXCEPTION_SYSCALL_ERROR;
    } else {
        lookupIOPTSlot_ret_t lu_ret;
        vm_rights_t          frame_cap_rights;
        cap_rights_t         dma_cap_rights_mask;

        vtd_pte = (vtd_pte_t*)paddr_to_pptr(vtd_cte_ptr_get_asr(vtd_context_slot));
        lu_ret  = lookupIOPTSlot(vtd_pte, io_address);

        if (lu_ret.status != EXCEPTION_NONE || lu_ret.level != ia32KSnumIOPTLevels) {
            current_syscall_error.type = seL4_FailedLookup;
            current_syscall_error.failedLookupWasSource = false;
            return EXCEPTION_SYSCALL_ERROR;
        }

        dma_cap_rights_mask = rightsFromWord(getSyscallArg(0, buffer));
        frame_cap_rights    = cap_frame_cap_get_capFVMRights(cap);

        if ((frame_cap_rights == VMReadOnly) && cap_rights_get_capAllowRead(dma_cap_rights_mask)) {
            /* Read Only */
            vtd_pte_ptr_new(
                lu_ret.ioptSlot,
                paddr,  /* Physical Address */
                0,      /* Read permission  */
                1       /* Write permission */
            );
        } else if (frame_cap_rights == VMReadWrite) {
            if (cap_rights_get_capAllowRead(dma_cap_rights_mask) && !cap_rights_get_capAllowWrite(dma_cap_rights_mask)) {
                /* Read Only */
                vtd_pte_ptr_new(
                    lu_ret.ioptSlot,
                    paddr,  /* Physical Address */
                    0,      /* Read permission  */
                    1       /* Write permission */
                );
            } else if (!cap_rights_get_capAllowRead(dma_cap_rights_mask) && cap_rights_get_capAllowWrite(dma_cap_rights_mask)) {
                /* Write Only */
                vtd_pte_ptr_new(
                    lu_ret.ioptSlot,
                    paddr,  /* Physical Address */
                    1,      /* Read permission  */
                    0       /* Write permission */
                );

            } else if (cap_rights_get_capAllowRead(dma_cap_rights_mask) && cap_rights_get_capAllowWrite(dma_cap_rights_mask)) {
                /* Read Write */
                vtd_pte_ptr_new(
                    lu_ret.ioptSlot,
                    paddr,  /* Physical Address */
                    1,      /* Read permission  */
                    1       /* Write permission */
                );
            } else {
                current_syscall_error.type = seL4_InvalidArgument;
                current_syscall_error.invalidArgumentNumber = 0;
                return EXCEPTION_SYSCALL_ERROR;
            }
        } else {
            /* We are dealing with VMKernelOnly */
            current_syscall_error.type = seL4_InvalidArgument;
            current_syscall_error.invalidArgumentNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }
        cap = cap_frame_cap_set_capFIsIOSpace(cap, 1);
        cap = cap_frame_cap_set_capFMappedASID(cap, pci_request_id);
        cap = cap_frame_cap_set_capFMappedAddress(cap, io_address);

        flushCacheRange(lu_ret.ioptSlot, VTD_PTE_SIZE_BITS);
    }
    slot->cap = cap;

    setThreadState(ksCurThread, ThreadState_Restart);
    return EXCEPTION_NONE;
}

void deleteIOPageTable(cap_t io_pt_cap)
{
    lookupIOPTSlot_ret_t lu_ret;
    uint32_t             level;
    uint32_t             io_address;
    vtd_cte_t*           vtd_context_slot;
    vtd_pte_t*           vtd_pte;

    if (cap_io_page_table_cap_get_capIOPTIsMapped(io_pt_cap)) {
        io_pt_cap = cap_io_page_table_cap_set_capIOPTIsMapped(io_pt_cap, 0);
        level = cap_io_page_table_cap_get_capIOPTLevel(io_pt_cap);
        vtd_context_slot = lookup_vtd_context_slot(io_pt_cap);
        vtd_pte = (vtd_pte_t*)paddr_to_pptr(vtd_cte_ptr_get_asr(vtd_context_slot));
        if (level == 0) {
            /* if we have been overmapped or something */
            if (pptr_to_paddr(vtd_pte) != cap_io_page_table_cap_get_capIOPTBasePtr(io_pt_cap)) {
                return;
            }
            vtd_cte_ptr_new(
                vtd_context_slot,
                0,  /* Domain ID          */
                0,  /* Address Width      */
                0,  /* Address Space Root */
                0,  /* Translation Type   */
                0   /* Present            */
            );
            flushCacheRange(vtd_context_slot, VTD_CTE_SIZE_BITS);
        } else {
            io_address = cap_io_page_table_cap_get_capIOPTMappedAddress(io_pt_cap);
            lu_ret = lookupIOPTSlot_helper(vtd_pte, io_address >> PAGE_BITS, level - 1);
            /* if we have been overmapped or something */
            if (lu_ret.status != EXCEPTION_NONE || lu_ret.level + 1 != level) {
                return;
            }
            if (vtd_pte_ptr_get_addr(lu_ret.ioptSlot) != cap_io_page_table_cap_get_capIOPTBasePtr(io_pt_cap)) {
                return;
            }
            vtd_pte_ptr_new(
                lu_ret.ioptSlot,
                0,  /* Physical Address */
                0,  /* Read Permission  */
                0   /* Write Permission */
            );
            flushCacheRange(lu_ret.ioptSlot, VTD_PTE_SIZE_BITS);
        }
        invalidate_iotlb();
    }
}

void unmapIOPage(cap_t cap)
{
    lookupIOPTSlot_ret_t lu_ret;
    uint32_t             io_address;
    vtd_cte_t*           vtd_context_slot;
    vtd_pte_t*           vtd_pte;

    io_address  = cap_frame_cap_get_capFMappedAddress(cap);
    vtd_context_slot = lookup_vtd_context_slot(cap);
    vtd_pte = (vtd_pte_t*)paddr_to_pptr(vtd_cte_ptr_get_asr(vtd_context_slot));

    lu_ret  = lookupIOPTSlot(vtd_pte, io_address);
    if (lu_ret.status != EXCEPTION_NONE || lu_ret.level != ia32KSnumIOPTLevels) {
        return;
    }

    vtd_pte_ptr_new(
        lu_ret.ioptSlot,
        0,  /* Physical Address */
        0,  /* Read Permission  */
        0   /* Write Permission */
    );

    flushCacheRange(lu_ret.ioptSlot, VTD_PTE_SIZE_BITS);
    invalidate_iotlb();
}

exception_t
decodeIA32IOUnMapInvocation(
    word_t       label,
    uint32_t     length,
    cte_t*       slot,
    cap_t        cap,
    extra_caps_t extraCaps
)
{
    unmapIOPage(slot->cap);
    slot->cap = cap_frame_cap_set_capFMappedAddress(slot->cap, 0);
    slot->cap = cap_frame_cap_set_capFIsIOSpace(slot->cap, 0);
    slot->cap = cap_frame_cap_set_capFMappedASID(slot->cap, asidInvalid);

    setThreadState(ksCurThread, ThreadState_Restart);
    return EXCEPTION_NONE;
}

exception_t decodeIA32IOSpaceInvocation(word_t label, cap_t cap)
{
    vtd_cte_t *cte;
    if (label != IA32IOSpaceRemovePassthrough) {
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }
    cte = lookup_vtd_context_slot(cap);
    *cte = vtd_cte_set_translation_type(*cte, 0);
    flushCacheRange(cte, VTD_CTE_SIZE_BITS);
    invalidate_iotlb();
    setThreadState(ksCurThread, ThreadState_Restart);
    return EXCEPTION_NONE;
}

#endif
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <types.h>
#include <api/failures.h>
#include <kernel/vspace.h>
#include <object/structures.h>
#include <arch/machine.h>
#include <arch/model/statedata.h>
#include <arch/machine/fpu.h>
#include <arch/object/objecttype.h>
#include <arch/object/ioport.h>
#include <plat/machine/pci.h>

#ifdef CONFIG_IOMMU
#include <arch/object/iospace.h>
#include <plat/machine/intel-vtd.h>
#endif

deriveCap_ret_t Arch_deriveCap(cte_t* slot, cap_t cap)
{
    deriveCap_ret_t ret;

    switch (cap_get_capType(cap)) {
    case cap_page_table_cap:
        if (cap_page_table_cap_get_capPTIsMapped(cap)) {
            ret.cap = cap;
            ret.status = EXCEPTION_NONE;
        } else {
            userError("Deriving an unmapped PT cap");
            current_syscall_error.type = seL4_IllegalOperation;
            ret.cap = cap_null_cap_new();
            ret.status = EXCEPTION_SYSCALL_ERROR;
        }
        return ret;

    case cap_page_directory_cap:
        if (cap_page_directory_cap_get_capPDIsMapped(cap)) {
            ret.cap = cap;
            ret.status = EXCEPTION_NONE;
        } else {
            userError("Deriving a PD cap without an assigned ASID");
            current_syscall_error.type = seL4_IllegalOperation;
            ret.cap = cap_null_cap_new();
            ret.status = EXCEPTION_SYSCALL_ERROR;
        }
        return ret;

    case cap_frame_cap:
#ifdef CONFIG_IOMMU
        cap = cap_frame_cap_set_capFIsIOSpace(cap, 0);
#endif
        ret.cap = cap_frame_cap_set_capFMappedASID(cap, asidInvalid);
        ret.status = EXCEPTION_NONE;
        return ret;

    case cap_asid_control_cap:
    case cap_asid_pool_cap:
        ret.cap = cap;
        ret.status = EXCEPTION_NONE;
        return ret;
    case cap_io_port_cap:
        ret.cap = cap;
        ret.status = EXCEPTION_NONE;
        return ret;
#ifdef CONFIG_IOMMU
    case cap_io_space_cap:
        ret.cap = cap;
        ret.status = EXCEPTION_NONE;
        return ret;
    case cap_io_page_table_cap:
        if (cap_io_page_table_cap_get_capIOPTIsMapped(cap)) {
            ret.cap = cap;
            ret.status = EXCEPTION_NONE;
        } else {
            current_syscall_error.type = seL4_IllegalOperation;
            ret.cap = cap_null_cap_new();
            ret.status = EXCEPTION_SYSCALL_ERROR;
        }
        return ret;
#endif

    default:
        /* This assert has no equivalent in haskell,
         * as the options are restricted by type */
        fail("Invalid arch cap type");
    }
}

cap_t CONST Arch_updateCapData(bool_t preserve, word_t data, cap_t cap)
{
    switch (cap_get_capType(cap)) {
#ifdef CONFIG_IOMMU
    case cap_io_space_cap: {
        io_space_capdata_t w = { { data } };
        uint16_t PCIDevice = io_space_capdata_get_PCIDevice(w);
        uint16_t domainID = io_space_capdata_get_domainID(w);
        vtd_cte_t *vtd_context_table = (vtd_cte_t*)vtd_rte_get_ctp(ia32KSvtdRootTable[get_pci_bus(data)]);
        if (!preserve && cap_io_space_cap_get_capPCIDevice(cap) == 0 &&
                vtd_rte_get_present(ia32KSvtdRootTable[get_pci_bus(data)]) &&
                (!vtd_cte_get_present(vtd_context_table[PCIDevice & 0xff]) || vtd_cte_get_translation_type(vtd_context_table[PCIDevice & 0xff]) != 2) &&
                domainID <= MASK(ia32KSnumIODomainIDBits)) {
            return cap_io_space_cap_new(domainID, PCIDevice);
        } else {
            return cap_null_cap_new();
        }
    }
#endif
    case cap_io_port_cap: {
        io_port_capdata_t w = { .words = { data } };
        uint16_t firstPort = io_port_capdata_get_firstPort(w);
        uint16_t lastPort = io_port_capdata_get_lastPort(w);
        uint16_t capFirstPort = cap_io_port_cap_get_capIOPortFirstPort(cap);
        uint16_t capLastPort = cap_io_port_cap_get_capIOPortLastPort(cap);
        assert(capFirstPort <= capLastPort);

        /* Ensure input data is ordered correctly. */
        if (firstPort > lastPort) {
            return cap_null_cap_new();
        }

        /* Allow the update if the new cap has range no larger than the old
         * cap. */
        if ((firstPort >= capFirstPort) && (lastPort <= capLastPort)) {
            return cap_io_port_cap_new(firstPort, lastPort);
        } else {
            return cap_null_cap_new();
        }
    }

    default:
        return cap;
    }
}

cap_t CONST Arch_maskCapRights(cap_rights_t cap_rights_mask, cap_t cap)
{
    if (cap_get_capType(cap) == cap_frame_cap) {
        vm_rights_t vm_rights;

        vm_rights = vmRightsFromWord(cap_frame_cap_get_capFVMRights(cap));
        vm_rights = maskVMRights(vm_rights, cap_rights_mask);
        return cap_frame_cap_set_capFVMRights(cap, wordFromVMRights(vm_rights));
    } else {
        return cap;
    }
}

cap_t Arch_finaliseCap(cap_t cap, bool_t final)
{
    switch (cap_get_capType(cap)) {
    case cap_page_directory_cap:
        if (final && cap_page_directory_cap_get_capPDIsMapped(cap)) {
            deleteASID(
                cap_page_directory_cap_get_capPDMappedASID(cap),
                PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(cap))
            );
        }
        break;

    case cap_page_table_cap:
        if (final && cap_page_table_cap_get_capPTIsMapped(cap)) {
            unmapPageTable(
                cap_page_table_cap_get_capPTMappedASID(cap),
                cap_page_table_cap_get_capPTMappedAddress(cap),
                PT_PTR(cap_page_table_cap_get_capPTBasePtr(cap))
            );
        }
        break;

    case cap_frame_cap:
        if (cap_frame_cap_get_capFMappedASID(cap)) {
#ifdef CONFIG_IOMMU
            if (cap_frame_cap_get_capFIsIOSpace(cap)) {
                unmapIOPage(cap);
                break;
            }
#endif
            unmapPage(
                cap_frame_cap_get_capFSize(cap),
                cap_frame_cap_get_capFMappedASID(cap),
                cap_frame_cap_get_capFMappedAddress(cap),
                (void *)cap_frame_cap_get_capFBasePtr(cap)
            );
        }
        break;

    case cap_asid_pool_cap:
        if (final) {
            deleteASIDPool(
                cap_asid_pool_cap_get_capASIDBase(cap),
                ASID_POOL_PTR(cap_asid_pool_cap_get_capASIDPool(cap))
            );
        }
        break;
    case cap_asid_control_cap:
    case cap_io_port_cap:
        break;
#ifdef CONFIG_IOMMU
    case cap_io_page_table_cap:
        if (final && cap_io_page_table_cap_get_capIOPTIsMapped(cap)) {
            deleteIOPageTable(cap);
        }
        break;
#endif

    default:
        fail("Invalid arch cap type");
    }

    return cap_null_cap_new();
}

static cap_t CONST
resetMemMapping(cap_t cap)
{
    switch (cap_get_capType(cap)) {
    case cap_frame_cap:
        return cap_frame_cap_set_capFMappedASID(cap, asidInvalid);
    case cap_page_table_cap:
        /* We don't need to worry about clearing ASID and Address here, only whether it is mapped */
        return cap_page_table_cap_set_capPTIsMapped(cap, 0);
    case cap_page_directory_cap:
        /* We don't need to worry about clearing ASID and Address here, only whether it is mapped */
        return cap_page_directory_cap_set_capPDIsMapped(cap, 0);
    }

    return cap;
}

cap_t Arch_recycleCap(bool_t is_final, cap_t cap)
{
    asid_pool_t* ptr;
    pde_t* capPtr;
    word_t base;

    switch (cap_get_capType(cap)) {
    case cap_frame_cap:
        clearMemory((void *)cap_get_capPtr(cap), cap_get_capSizeBits(cap));
        Arch_finaliseCap(cap, is_final);
        return resetMemMapping(cap);

    case cap_page_table_cap:
        clearMemory((void *)cap_get_capPtr(cap), cap_get_capSizeBits(cap));
        if (cap_page_table_cap_get_capPTIsMapped(cap)) {
            unmapPageTable(
                cap_page_table_cap_get_capPTMappedASID(cap),
                cap_page_table_cap_get_capPTMappedAddress(cap),
                PT_PTR(cap_page_table_cap_get_capPTBasePtr(cap))
            );
        }
        Arch_finaliseCap(cap, is_final);
        if (is_final) {
            return resetMemMapping(cap);
        }
        return cap;

    case cap_page_directory_cap:
        capPtr = PDE_PTR(cap_page_directory_cap_get_capPDBasePtr(cap));
        memzero(capPtr, (PPTR_BASE >> IA32_4M_bits) << PDE_SIZE_BITS);
        Arch_finaliseCap(cap, is_final);
        if (is_final) {
            return resetMemMapping(cap);
        }
        return cap;

    case cap_asid_control_cap:
        return cap;

    case cap_asid_pool_cap:
        base = cap_asid_pool_cap_get_capASIDBase(cap);
        ptr = ASID_POOL_PTR(cap_asid_pool_cap_get_capASIDPool(cap));
        if (ia32KSASIDTable[base >> asidLowBits] == ptr) {
            deleteASIDPool(base, ptr);
            memzero(ptr, BIT(ASID_POOL_SIZE_BITS));
            ia32KSASIDTable[base >> asidLowBits] = ptr;
        }
        return cap;

    case cap_io_port_cap:
        return cap;
#ifdef CONFIG_IOMMU
    case cap_io_space_cap:
        return cap;

    case cap_io_page_table_cap:
        memzero(
            (void*)cap_io_page_table_cap_get_capIOPTBasePtr(cap),
            BIT(VTD_PT_SIZE_BITS)
        );
        return cap;
#endif
    default:
        fail("Invalid arch cap type");
    }
}


bool_t CONST
Arch_hasRecycleRights(cap_t cap)
{
    switch (cap_get_capType(cap)) {
    case cap_frame_cap:
        return cap_frame_cap_get_capFVMRights(cap) == VMReadWrite;

    default:
        return true;
    }
}


bool_t CONST Arch_sameRegionAs(cap_t cap_a, cap_t cap_b)
{
    switch (cap_get_capType(cap_a)) {
    case cap_frame_cap:
        if (cap_get_capType(cap_b) == cap_frame_cap) {
            word_t botA, botB, topA, topB;
            botA = cap_frame_cap_get_capFBasePtr(cap_a);
            botB = cap_frame_cap_get_capFBasePtr(cap_b);
            topA = botA + MASK (pageBitsForSize(cap_frame_cap_get_capFSize(cap_a)));
            topB = botB + MASK (pageBitsForSize(cap_frame_cap_get_capFSize(cap_b)));
            return ((botA <= botB) && (topA >= topB) && (botB <= topB));
        }
        break;

    case cap_page_table_cap:
        if (cap_get_capType(cap_b) == cap_page_table_cap) {
            return cap_page_table_cap_get_capPTBasePtr(cap_a) ==
                   cap_page_table_cap_get_capPTBasePtr(cap_b);
        }
        break;

    case cap_page_directory_cap:
        if (cap_get_capType(cap_b) == cap_page_directory_cap) {
            return cap_page_directory_cap_get_capPDBasePtr(cap_a) ==
                   cap_page_directory_cap_get_capPDBasePtr(cap_b);
        }
        break;

    case cap_asid_control_cap:
        if (cap_get_capType(cap_b) == cap_asid_control_cap) {
            return true;
        }
        break;

    case cap_asid_pool_cap:
        if (cap_get_capType(cap_b) == cap_asid_pool_cap) {
            return cap_asid_pool_cap_get_capASIDPool(cap_a) ==
                   cap_asid_pool_cap_get_capASIDPool(cap_b);
        }
        break;

    case cap_io_port_cap:
        if (cap_get_capType(cap_b) == cap_io_port_cap) {
            return true;
        }
        break;
#ifdef CONFIG_IOMMU
    case cap_io_space_cap:
        if (cap_get_capType(cap_b) == cap_io_space_cap) {
            return cap_io_space_cap_get_capPCIDevice(cap_a) ==
                   cap_io_space_cap_get_capPCIDevice(cap_b);
        }
        break;

    case cap_io_page_table_cap:
        if (cap_get_capType(cap_b) == cap_io_page_table_cap) {
            return cap_io_page_table_cap_get_capIOPTBasePtr(cap_a) ==
                   cap_io_page_table_cap_get_capIOPTBasePtr(cap_b);
        }
        break;
#endif
    }

    return false;
}

bool_t CONST Arch_sameObjectAs(cap_t cap_a, cap_t cap_b)
{
    if (cap_get_capType(cap_a) == cap_frame_cap) {
        if (cap_get_capType(cap_b) == cap_frame_cap) {
            return ((cap_frame_cap_get_capFBasePtr(cap_a) ==
                     cap_frame_cap_get_capFBasePtr(cap_b)) &&
                    (cap_frame_cap_get_capFSize(cap_a) ==
                     cap_frame_cap_get_capFSize(cap_b)));
        }
    }
    return Arch_sameRegionAs(cap_a, cap_b);
}

word_t
Arch_getObjectSize(word_t t)
{
    switch (t) {
    case seL4_IA32_4K:
        return pageBitsForSize(IA32_4K);
    case seL4_IA32_4M:
        return pageBitsForSize(IA32_4M);
    case seL4_IA32_PageTableObject:
        return PTE_SIZE_BITS + PT_BITS;
    case seL4_IA32_PageDirectoryObject:
        return PDE_SIZE_BITS + PD_BITS;
#ifdef CONFIG_IOMMU
    case seL4_IA32_IOPageTableObject:
        return VTD_PT_SIZE_BITS;
#endif
    default:
        fail("Invalid object type");
        return 0;
    }
}

cap_t
Arch_createObject(object_t t, void *regionBase, word_t userSize)
{
    switch (t) {
    case seL4_IA32_4K:
        memzero(regionBase, 1 << pageBitsForSize(IA32_4K));
        return cap_frame_cap_new(
                   IA32_4K,                /* capFSize             */
#ifdef CONFIG_IOMMU
                   0,                      /* capFIsIOSpace        */
#endif
                   ASID_LOW(asidInvalid),  /* capFMappedASIDLow    */
                   0,                      /* capFMappedAddress    */
                   ASID_HIGH(asidInvalid), /* capFMappedASIDHigh   */
                   VMReadWrite,            /* capFVMRights         */
                   (word_t)regionBase      /* capFBasePtr          */
               );

    case seL4_IA32_4M:
        memzero(regionBase, 1 << pageBitsForSize(IA32_4M));
        return cap_frame_cap_new(
                   IA32_4M,                /* capFSize             */
#ifdef CONFIG_IOMMU
                   0,                      /* capFIsIOSpace        */
#endif
                   ASID_LOW(asidInvalid),  /* capFMappedASIDLow    */
                   0,                      /* capFMappedAddress    */
                   ASID_HIGH(asidInvalid), /* capFMappedASIDHigh   */
                   VMReadWrite,            /* capFVMRights         */
                   (word_t)regionBase      /* capFBasePtr          */
               );

    case seL4_IA32_PageTableObject:
        memzero(regionBase, 1 << PT_SIZE_BITS);
        return cap_page_table_cap_new(
                   0,                  /* capPTIsMapped        */
                   asidInvalid,        /* capPTMappedASID      */
                   0,                  /* capPTMappedAddress   */
                   (word_t)regionBase  /* capPTBasePtr         */
               );

    case seL4_IA32_PageDirectoryObject:
        memzero(regionBase, 1 << PD_SIZE_BITS);
        copyGlobalMappings(regionBase);
        return cap_page_directory_cap_new(
                   0,                  /* capPTIsMapped    */
                   asidInvalid,        /* capPDMappedASID  */
                   (word_t)regionBase  /* capPTBasePtr     */
               );

#ifdef CONFIG_IOMMU
    case seL4_IA32_IOPageTableObject:
        memzero(regionBase, 1 << VTD_PT_SIZE_BITS);
        return cap_io_page_table_cap_new(
                   0,  /* capIOPTIsMapped      */
                   0,  /* capIOPTLevel         */
                   0,  /* capIOPTMappedAddress */
                   0,  /* capIOPTIOASID        */
                   (word_t)regionBase  /* capIOPTBasePtr */
               );
#endif

    default:
        /*
         * This is a conflation of the haskell error: "Arch.createNewCaps
         * got an API type" and the case where an invalid object type is
         * passed (which is impossible in haskell).
         */
        fail("Arch_createObject got an API type or invalid object type");
    }
}

exception_t
Arch_decodeInvocation(
    word_t label,
    unsigned int length,
    cptr_t cptr,
    cte_t* slot,
    cap_t cap,
    extra_caps_t extraCaps,
    word_t* buffer
)
{
    switch (cap_get_capType(cap)) {
    case cap_page_directory_cap:
    case cap_page_table_cap:
    case cap_frame_cap:
        return decodeIA32MMUInvocation(label, length, cptr, slot, cap, extraCaps, buffer);

    case cap_asid_control_cap:
    case cap_asid_pool_cap:
        return decodeIA32MMUInvocation(label, length, cptr, slot, cap, extraCaps, buffer);
    case cap_io_port_cap:
        return decodeIA32PortInvocation(label, length, cptr, slot, cap, extraCaps, buffer);
#ifdef CONFIG_IOMMU
    case cap_io_space_cap:
        return decodeIA32IOSpaceInvocation(label, cap);
    case cap_io_page_table_cap:
        return decodeIA32IOPTInvocation(label, length, slot, cap, extraCaps, buffer);
#endif

    default:
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;
    }
}

void
Arch_prepareThreadDelete(tcb_t *thread)
{
    /* Notify the lazy FPU module about this thread's deletion. */
    Arch_fpuThreadDelete(thread);
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/tcb.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <types.h>
#include <api/failures.h>
#include <machine/registerset.h>
#include <object/structures.h>
#include <arch/machine.h>
#include <arch/object/tcb.h>

/* NOTE: offset is either 1 or 3 */
static inline unsigned int
setMRs_lookup_failure(tcb_t *receiver, word_t* receiveIPCBuffer, lookup_fault_t luf, unsigned int offset)
{
    word_t lufType = lookup_fault_get_lufType(luf);

    assert(n_msgRegisters == 2);

    if (offset < n_msgRegisters) {
        setRegister(receiver, msgRegisters[offset], lufType + 1);
    }

    if (!receiveIPCBuffer) {
        return n_msgRegisters;
    }

    if (offset >= n_msgRegisters) {
        receiveIPCBuffer[offset + 1] = lufType + 1;
    }

    switch (lufType) {
    case lookup_fault_invalid_root:
        return offset + 1;

    case lookup_fault_missing_capability:
        receiveIPCBuffer[offset + 2] =
            lookup_fault_missing_capability_get_bitsLeft(luf);
        return offset + 2;

    case lookup_fault_depth_mismatch:
        receiveIPCBuffer[offset + 2] =
            lookup_fault_depth_mismatch_get_bitsLeft(luf);
        receiveIPCBuffer[offset + 3] =
            lookup_fault_depth_mismatch_get_bitsFound(luf);
        return offset + 3;

    case lookup_fault_guard_mismatch:
        receiveIPCBuffer[offset + 2] =
            lookup_fault_guard_mismatch_get_bitsLeft(luf);
        receiveIPCBuffer[offset + 3] =
            lookup_fault_guard_mismatch_get_guardFound(luf);
        receiveIPCBuffer[offset + 4] =
            lookup_fault_guard_mismatch_get_bitsFound(luf);
        return offset + 4;

    default:
        fail("Invalid lookup failure");
    }
}

unsigned int setMRs_fault(tcb_t *sender, tcb_t* receiver, word_t *receiveIPCBuffer)
{
    assert(n_msgRegisters == 2);

    switch (fault_get_faultType(sender->tcbFault)) {
    case fault_cap_fault:
        setRegister(receiver, msgRegisters[0], getRestartPC(sender));
        setRegister(receiver, msgRegisters[1],
                    fault_cap_fault_get_address(sender->tcbFault));
        if (!receiveIPCBuffer) {
            return n_msgRegisters;
        }
        receiveIPCBuffer[2 + 1] =
            fault_cap_fault_get_inReceivePhase(sender->tcbFault);
        return setMRs_lookup_failure(receiver, receiveIPCBuffer, sender->tcbLookupFailure, 3);

    case fault_vm_fault:
        setRegister(receiver, msgRegisters[0], getRestartPC(sender));
        setRegister(receiver, msgRegisters[1],
                    fault_vm_fault_get_address(sender->tcbFault));
        if (!receiveIPCBuffer) {
            return n_msgRegisters;
        }
        receiveIPCBuffer[2 + 1] =
            fault_vm_fault_get_instructionFault(sender->tcbFault);
        receiveIPCBuffer[3 + 1] = fault_vm_fault_get_FSR(sender->tcbFault);
        return 4;

    case fault_unknown_syscall: {
        unsigned int i;

        for (i = 0; i < n_msgRegisters; i++) {
            setRegister(receiver, msgRegisters[i],
                        getRegister(sender, syscallMessage[i]));
        }
        if (receiveIPCBuffer) {
            for (; i < n_syscallMessage; i++) {
                receiveIPCBuffer[i + 1] =
                    getRegister(sender, syscallMessage[i]);
            }

            receiveIPCBuffer[i + 1] =
                fault_unknown_syscall_get_syscallNumber(sender->tcbFault);
            return n_syscallMessage + 1;
        } else {
            return n_msgRegisters;
        }
    }

    case fault_user_exception: {
        unsigned int i;

        for (i = 0; i < n_msgRegisters; i++) {
            setRegister(receiver, msgRegisters[i],
                        getRegister(sender, exceptionMessage[i]));
        }
        if (receiveIPCBuffer) {
            for (; i < n_exceptionMessage; i++) {
                receiveIPCBuffer[i + 1] =
                    getRegister(sender, exceptionMessage[i]);
            }
            receiveIPCBuffer[n_exceptionMessage + 1] =
                fault_user_exception_get_number(sender->tcbFault);
            receiveIPCBuffer[n_exceptionMessage + 2] =
                fault_user_exception_get_code(sender->tcbFault);
            return n_exceptionMessage + 2;
        } else {
            return n_msgRegisters;
        }
    }

    default:
        fail("Invalid fault");
    }
}

unsigned int setMRs_syscall_error(tcb_t *thread, word_t *receiveIPCBuffer)
{
    assert(n_msgRegisters >= 2);

    switch (current_syscall_error.type) {
    case seL4_InvalidArgument:
        setRegister(thread, msgRegisters[0],
                    current_syscall_error.invalidArgumentNumber);
        return 1;

    case seL4_InvalidCapability:
        setRegister(thread, msgRegisters[0],
                    current_syscall_error.invalidCapNumber);
        return 1;

    case seL4_IllegalOperation:
        return 0;

    case seL4_RangeError:
        setRegister(thread, msgRegisters[0],
                    current_syscall_error.rangeErrorMin);
        setRegister(thread, msgRegisters[1],
                    current_syscall_error.rangeErrorMax);
        return 2;

    case seL4_AlignmentError:
        return 0;

    case seL4_FailedLookup:
        setRegister(thread, msgRegisters[0],
                    current_syscall_error.failedLookupWasSource ? 1 : 0);
        return setMRs_lookup_failure(thread, receiveIPCBuffer,
                                     current_lookup_fault, 1);

    case seL4_TruncatedMessage:
    case seL4_DeleteFirst:
    case seL4_RevokeFirst:
        return 0;
    case seL4_NotEnoughMemory:
        setRegister(thread, msgRegisters[0],
                    current_syscall_error.memoryLeft);
        return 0;
    default:
        fail("Invalid syscall error");
    }
}

word_t CONST Arch_decodeTransfer(word_t flags)
{
    return 0;
}

exception_t CONST Arch_performTransfer(word_t arch, tcb_t *tcb_src, tcb_t *tcb_dest)
{
    return EXCEPTION_NONE;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/assert.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <assert.h>
#include <machine/io.h>

#ifdef DEBUG

void _fail(
    const char*  s,
    const char*  file,
    unsigned int line,
    const char*  function)
{
    printf(
        "seL4 called fail at %s:%u in function %s, saying \"%s\"\n",
        file,
        line,
        function,
        s
    );
    halt();
}

void _assert_fail(
    const char*  assertion,
    const char*  file,
    unsigned int line,
    const char*  function)
{
    printf("seL4 failed assertion '%s' at %s:%u in function %s\n",
           assertion,
           file,
           line,
           function
          );
    halt();
}

#endif
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/inlines.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <types.h>
#include <api/failures.h>

lookup_fault_t current_lookup_fault;
fault_t current_fault;
syscall_error_t current_syscall_error;
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <assert.h>
#include <kernel/boot.h>
#include <kernel/thread.h>
#include <machine/io.h>
#include <machine/registerset.h>
#include <model/statedata.h>
#include <arch/machine.h>
#include <arch/kernel/boot.h>
#include <arch/kernel/vspace.h>
#include <arch/linker.h>
#include <plat/machine/hardware.h>

/* (node-local) state accessed only during bootstrapping */

ndks_boot_t ndks_boot BOOT_DATA;

BOOT_CODE bool_t
insert_region(region_t reg)
{
    unsigned int i;

    assert(reg.start <= reg.end);
    if (is_reg_empty(reg)) {
        return true;
    }
    for (i = 0; i < MAX_NUM_FREEMEM_REG; i++) {
        if (is_reg_empty(ndks_boot.freemem[i])) {
            ndks_boot.freemem[i] = reg;
            return true;
        }
    }
    return false;
}

BOOT_CODE static inline uint32_t
reg_size(region_t reg)
{
    return reg.end - reg.start;
}

BOOT_CODE pptr_t
alloc_region(uint32_t size_bits)
{
    unsigned int i;
    unsigned int reg_index = 0; /* gcc cannot work out that this will not be used uninitialized */
    region_t reg = REG_EMPTY;
    region_t rem_small = REG_EMPTY;
    region_t rem_large = REG_EMPTY;
    region_t new_reg;
    region_t new_rem_small;
    region_t new_rem_large;

    /* Search for a freemem region that will be the best fit for an allocation. We favour allocations
     * that are aligned to either end of the region. If an allocation must split a region we favour
     * an unbalanced split. In both cases we attempt to use the smallest region possible. In general
     * this means we aim to make the size of the smallest remaining region smaller (ideally zero)
     * followed by making the size of the largest remaining region smaller */

    for (i = 0; i < MAX_NUM_FREEMEM_REG; i++) {
        /* Determine whether placing the region at the start or the end will create a bigger left over region */
        if (ROUND_UP(ndks_boot.freemem[i].start, size_bits) - ndks_boot.freemem[i].start <
                ndks_boot.freemem[i].end - ROUND_DOWN(ndks_boot.freemem[i].end, size_bits)) {
            new_reg.start = ROUND_UP(ndks_boot.freemem[i].start, size_bits);
            new_reg.end = new_reg.start + BIT(size_bits);
        } else {
            new_reg.end = ROUND_DOWN(ndks_boot.freemem[i].end, size_bits);
            new_reg.start = new_reg.end - BIT(size_bits);
        }
        if (new_reg.end > new_reg.start &&
                new_reg.start >= ndks_boot.freemem[i].start &&
                new_reg.end <= ndks_boot.freemem[i].end) {
            if (new_reg.start - ndks_boot.freemem[i].start < ndks_boot.freemem[i].end - new_reg.end) {
                new_rem_small.start = ndks_boot.freemem[i].start;
                new_rem_small.end = new_reg.start;
                new_rem_large.start = new_reg.end;
                new_rem_large.end = ndks_boot.freemem[i].end;
            } else {
                new_rem_large.start = ndks_boot.freemem[i].start;
                new_rem_large.end = new_reg.start;
                new_rem_small.start = new_reg.end;
                new_rem_small.end = ndks_boot.freemem[i].end;
            }
            if ( is_reg_empty(reg) ||
                    (reg_size(new_rem_small) < reg_size(rem_small)) ||
                    (reg_size(new_rem_small) == reg_size(rem_small) && reg_size(new_rem_large) < reg_size(rem_large)) ) {
                reg = new_reg;
                rem_small = new_rem_small;
                rem_large = new_rem_large;
                reg_index = i;
            }
        }
    }
    if (is_reg_empty(reg)) {
        printf("Kernel init failing: not enough memory\n");
        return 0;
    }
    /* Remove the region in question */
    ndks_boot.freemem[reg_index] = REG_EMPTY;
    /* Add the remaining regions in largest to smallest order */
    insert_region(rem_large);
    if (!insert_region(rem_small)) {
        printf("alloc_region(): wasted 0x%x bytes due to alignment, try to increase MAX_NUM_FREEMEM_REG\n",
               (unsigned int)(rem_small.end - rem_small.start));
    }
    return reg.start;
}

BOOT_CODE void
write_slot(slot_ptr_t slot_ptr, cap_t cap)
{
    slot_ptr->cap = cap;

    slot_ptr->cteMDBNode = nullMDBNode;
    mdb_node_ptr_set_mdbRevocable  (&slot_ptr->cteMDBNode, true);
    mdb_node_ptr_set_mdbFirstBadged(&slot_ptr->cteMDBNode, true);
}

/* Our root CNode needs to be able to fit all the initial caps and not
 * cover all of memory.
 */
compile_assert(root_cnode_size_valid,
               CONFIG_ROOT_CNODE_SIZE_BITS < 32 - CTE_SIZE_BITS &&
               (1U << CONFIG_ROOT_CNODE_SIZE_BITS) >= BI_CAP_DYN_START)

BOOT_CODE cap_t
create_root_cnode(void)
{
    pptr_t  pptr;
    cap_t   cap;

    /* write the number of root CNode slots to global state */
    ndks_boot.slot_pos_max = BIT(CONFIG_ROOT_CNODE_SIZE_BITS);

    /* create an empty root CNode */
    pptr = alloc_region(CONFIG_ROOT_CNODE_SIZE_BITS + CTE_SIZE_BITS);
    if (!pptr) {
        printf("Kernel init failing: could not create root cnode\n");
        return cap_null_cap_new();
    }
    memzero(CTE_PTR(pptr), 1U << (CONFIG_ROOT_CNODE_SIZE_BITS + CTE_SIZE_BITS));
    cap =
        cap_cnode_cap_new(
            CONFIG_ROOT_CNODE_SIZE_BITS,      /* radix      */
            32 - CONFIG_ROOT_CNODE_SIZE_BITS, /* guard size */
            0,                                /* guard      */
            pptr                              /* pptr       */
        );

    /* write the root CNode cap into the root CNode */
    write_slot(SLOT_PTR(pptr, BI_CAP_IT_CNODE), cap);

    return cap;
}

compile_assert(irq_cnode_size, BIT(PAGE_BITS - CTE_SIZE_BITS) > maxIRQ)

BOOT_CODE bool_t
create_irq_cnode(void)
{
    pptr_t pptr;
    /* create an empty IRQ CNode */
    pptr = alloc_region(PAGE_BITS);
    if (!pptr) {
        printf("Kernel init failing: could not create irq cnode\n");
        return false;
    }
    memzero((void*)pptr, 1 << PAGE_BITS);
    intStateIRQNode = (cte_t*)pptr;
    return true;
}

/* Check domain scheduler assumptions. */
compile_assert(num_domains_valid,
               CONFIG_NUM_DOMAINS >= 1 && CONFIG_NUM_DOMAINS <= 256)
compile_assert(num_priorities_valid,
               CONFIG_NUM_PRIORITIES >= 1 && CONFIG_NUM_PRIORITIES <= 256)

BOOT_CODE void
create_domain_cap(cap_t root_cnode_cap)
{
    cap_t cap;
    unsigned int i;

    /* Check domain scheduler assumptions. */
    assert(ksDomScheduleLength > 0);
    for (i = 0; i < ksDomScheduleLength; i++) {
        assert(ksDomSchedule[i].domain < CONFIG_NUM_DOMAINS);
        assert(ksDomSchedule[i].length > 0);
    }

    cap = cap_domain_cap_new();
    write_slot(SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_DOM), cap);
}


BOOT_CODE cap_t
create_ipcbuf_frame(cap_t root_cnode_cap, cap_t pd_cap, vptr_t vptr)
{
    cap_t cap;
    pptr_t pptr;

    /* allocate the IPC buffer frame */
    pptr = alloc_region(PAGE_BITS);
    if (!pptr) {
        printf("Kernel init failing: could not create ipc buffer frame\n");
        return cap_null_cap_new();
    }
    clearMemory((void*)pptr, PAGE_BITS);

    /* create a cap of it and write it into the root CNode */
    cap = create_mapped_it_frame_cap(pd_cap, pptr, vptr, IT_ASID, false);
    write_slot(SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_IT_IPCBUF), cap);

    return cap;
}

BOOT_CODE void
create_bi_frame_cap(
    cap_t      root_cnode_cap,
    cap_t      pd_cap,
    pptr_t     pptr,
    vptr_t     vptr
)
{
    cap_t cap;

    /* create a cap of it and write it into the root CNode */
    cap = create_mapped_it_frame_cap(pd_cap, pptr, vptr, IT_ASID, false);
    write_slot(SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_BI_FRAME), cap);
}

BOOT_CODE pptr_t
allocate_bi_frame(
    node_id_t  node_id,
    uint32_t   num_nodes,
    vptr_t ipcbuf_vptr
)
{
    pptr_t pptr;

    /* create the bootinfo frame object */
    pptr = alloc_region(BI_FRAME_SIZE_BITS);
    if (!pptr) {
        printf("Kernel init failed: could not allocate bootinfo frame\n");
        return 0;
    }
    clearMemory((void*)pptr, PAGE_BITS);

    /* initialise bootinfo-related global state */
    ndks_boot.bi_frame = BI_PTR(pptr);
    ndks_boot.slot_pos_cur = BI_CAP_DYN_START;

    BI_PTR(pptr)->node_id = node_id;
    BI_PTR(pptr)->num_nodes = num_nodes;
    BI_PTR(pptr)->num_iopt_levels = 0;
    BI_PTR(pptr)->ipcbuf_vptr = ipcbuf_vptr;
    BI_PTR(pptr)->it_cnode_size_bits = CONFIG_ROOT_CNODE_SIZE_BITS;
    BI_PTR(pptr)->it_domain = (uint8_t)ksDomSchedule[ksDomScheduleIdx].domain;

    return pptr;
}

BOOT_CODE bool_t
provide_cap(cap_t root_cnode_cap, cap_t cap)
{
    if (ndks_boot.slot_pos_cur >= ndks_boot.slot_pos_max) {
        printf("Kernel init failed: ran out of cap slots\n");
        return false;
    }
    write_slot(SLOT_PTR(pptr_of_cap(root_cnode_cap), ndks_boot.slot_pos_cur), cap);
    ndks_boot.slot_pos_cur++;
    return true;
}

BOOT_CODE create_frames_of_region_ret_t
create_frames_of_region(
    cap_t    root_cnode_cap,
    cap_t    pd_cap,
    region_t reg,
    bool_t   do_map,
    int32_t  pv_offset
)
{
    pptr_t     f;
    cap_t      frame_cap;
    slot_pos_t slot_pos_before;
    slot_pos_t slot_pos_after;

    slot_pos_before = ndks_boot.slot_pos_cur;

    for (f = reg.start; f < reg.end; f += BIT(PAGE_BITS)) {
        if (do_map) {
            frame_cap = create_mapped_it_frame_cap(pd_cap, f, f - BASE_OFFSET - pv_offset, IT_ASID, false);
        } else {
            frame_cap = create_unmapped_it_frame_cap(f, false);
        }
        if (!provide_cap(root_cnode_cap, frame_cap))
            return (create_frames_of_region_ret_t) {
            S_REG_EMPTY, false
        };
    }

    slot_pos_after = ndks_boot.slot_pos_cur;

    return (create_frames_of_region_ret_t) {
        (slot_region_t) { slot_pos_before, slot_pos_after }, true
    };
}

BOOT_CODE cap_t
create_it_asid_pool(cap_t root_cnode_cap)
{
    pptr_t ap_pptr;
    cap_t  ap_cap;

    /* create ASID pool */
    ap_pptr = alloc_region(ASID_POOL_SIZE_BITS);
    if (!ap_pptr) {
        printf("Kernel init failed: failed to create initial thread asid pool\n");
        return cap_null_cap_new();
    }
    memzero(ASID_POOL_PTR(ap_pptr), 1 << ASID_POOL_SIZE_BITS);
    ap_cap = cap_asid_pool_cap_new(IT_ASID >> asidLowBits, ap_pptr);
    write_slot(SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_IT_ASID_POOL), ap_cap);

    /* create ASID control cap */
    write_slot(
        SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_ASID_CTRL),
        cap_asid_control_cap_new()
    );

    return ap_cap;
}

BOOT_CODE bool_t
create_idle_thread(void)
{
    pptr_t pptr;
    pptr = alloc_region(TCB_BLOCK_SIZE_BITS);
    if (!pptr) {
        printf("Kernel init failed: Unable to allocate tcb for idle thread\n");
        return false;
    }
    memzero((void *)pptr, 1 << TCB_BLOCK_SIZE_BITS);
    ksIdleThread = TCB_PTR(pptr + TCB_OFFSET);
    configureIdleThread(ksIdleThread);
    return true;
}

BOOT_CODE bool_t
create_initial_thread(
    cap_t  root_cnode_cap,
    cap_t  it_pd_cap,
    vptr_t ui_v_entry,
    vptr_t bi_frame_vptr,
    vptr_t ipcbuf_vptr,
    cap_t  ipcbuf_cap
)
{
    pptr_t pptr;
    cap_t  cap;
    tcb_t* tcb;

    /* allocate TCB */
    pptr = alloc_region(TCB_BLOCK_SIZE_BITS);
    if (!pptr) {
        printf("Kernel init failed: Unable to allocate tcb for initial thread\n");
        return false;
    }
    memzero((void*)pptr, 1 << TCB_BLOCK_SIZE_BITS);
    tcb = TCB_PTR(pptr + TCB_OFFSET);
    tcb->tcbTimeSlice = CONFIG_TIME_SLICE;
    Arch_initContext(&tcb->tcbContext);

    /* initialise TCB (corresponds directly to abstract specification) */
    cteInsert(
        root_cnode_cap,
        SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_IT_CNODE),
        SLOT_PTR(pptr, tcbCTable)
    );
    cteInsert(
        it_pd_cap,
        SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_IT_PD),
        SLOT_PTR(pptr, tcbVTable)
    );
    cteInsert(
        ipcbuf_cap,
        SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_IT_IPCBUF),
        SLOT_PTR(pptr, tcbBuffer)
    );
    tcb->tcbIPCBuffer = ipcbuf_vptr;
    setRegister(tcb, capRegister, bi_frame_vptr);
    setNextPC(tcb, ui_v_entry);

    /* initialise TCB */
    tcb->tcbPriority = seL4_MaxPrio;
    setupReplyMaster(tcb);
    setThreadState(tcb, ThreadState_Running);
    ksSchedulerAction = SchedulerAction_ResumeCurrentThread;
    ksCurThread = ksIdleThread;
    ksCurDomain = ksDomSchedule[ksDomScheduleIdx].domain;
    ksDomainTime = ksDomSchedule[ksDomScheduleIdx].length;
    assert(ksCurDomain < CONFIG_NUM_DOMAINS && ksDomainTime > 0);

    /* initialise current thread pointer */
    switchToThread(tcb); /* initialises ksCurThread */

    /* create initial thread's TCB cap */
    cap = cap_thread_cap_new(TCB_REF(tcb));
    write_slot(SLOT_PTR(pptr_of_cap(root_cnode_cap), BI_CAP_IT_TCB), cap);

    return true;
}

BOOT_CODE static bool_t
provide_untyped_cap(
    cap_t      root_cnode_cap,
    pptr_t     pptr,
    uint32_t   size_bits,
    slot_pos_t first_untyped_slot
)
{
    bool_t ret;
    unsigned int i = ndks_boot.slot_pos_cur - first_untyped_slot;
    if (i < CONFIG_MAX_NUM_BOOTINFO_UNTYPED_CAPS) {
        ndks_boot.bi_frame->ut_obj_paddr_list[i] = pptr_to_paddr((void*)pptr);
        ndks_boot.bi_frame->ut_obj_size_bits_list[i] = size_bits;
        ret = provide_cap(root_cnode_cap, cap_untyped_cap_new(0, size_bits, pptr));
    } else {
        printf("Kernel init: Too many untyped regions for boot info\n");
        ret = true;
    }
    return ret;
}

/**
  DONT_TRANSLATE
*/
BOOT_CODE static uint32_t boot_clz (uint32_t x)
{
    return CLZ (x);
}

/**
  DONT_TRANSLATE
*/
BOOT_CODE static uint32_t boot_ctz (uint32_t x)
{
    return CTZ (x);
}

BOOT_CODE static bool_t
create_untypeds_for_region(
    cap_t      root_cnode_cap,
    region_t   reg,
    slot_pos_t first_untyped_slot
)
{
    uint32_t align_bits;
    uint32_t size_bits;

    while (!is_reg_empty(reg)) {
        /* Determine the maximum size of the region */
        size_bits = WORD_BITS - 1 - boot_clz(reg.end - reg.start);

        /* Determine the alignment of the region */
        align_bits = boot_ctz(reg.start);

        /* Reduce size bits to align if needed */
        if (align_bits < size_bits) {
            size_bits = align_bits;
        }

        assert(size_bits >= WORD_BITS / 8);
        if (!provide_untyped_cap(root_cnode_cap, reg.start, size_bits, first_untyped_slot)) {
            return false;
        }
        reg.start += BIT(size_bits);
    }
    return true;
}

BOOT_CODE bool_t
create_untypeds(cap_t root_cnode_cap, region_t boot_mem_reuse_reg)
{
    slot_pos_t slot_pos_before;
    slot_pos_t slot_pos_after;
    uint32_t   i;
    region_t   reg;

    slot_pos_before = ndks_boot.slot_pos_cur;

    /* if boot_mem_reuse_reg is not empty, we can create UT objs from boot code/data frames */
    if (!create_untypeds_for_region(root_cnode_cap, boot_mem_reuse_reg, slot_pos_before)) {
        return false;
    }

    /* convert remaining freemem into UT objects and provide the caps */
    for (i = 0; i < MAX_NUM_FREEMEM_REG; i++) {
        reg = ndks_boot.freemem[i];
        ndks_boot.freemem[i] = REG_EMPTY;
        if (!create_untypeds_for_region(root_cnode_cap, reg, slot_pos_before)) {
            return false;
        }
    }

    slot_pos_after = ndks_boot.slot_pos_cur;
    ndks_boot.bi_frame->ut_obj_caps = (slot_region_t) {
        slot_pos_before, slot_pos_after
    };
    return true;
}

BOOT_CODE void
bi_finalise(void)
{
    slot_pos_t slot_pos_start = ndks_boot.slot_pos_cur;
    slot_pos_t slot_pos_end = ndks_boot.slot_pos_max;
    ndks_boot.bi_frame->null_caps = (slot_region_t) {
        slot_pos_start, slot_pos_end
    };
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/cspace.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <types.h>
#include <object.h>
#include <api/failures.h>
#include <kernel/thread.h>
#include <kernel/cspace.h>
#include <model/statedata.h>
#include <arch/machine.h>

lookupCap_ret_t
lookupCap(tcb_t *thread, cptr_t cPtr)
{
    lookupSlot_raw_ret_t lu_ret;
    lookupCap_ret_t ret;

    lu_ret = lookupSlot(thread, cPtr);
    if (unlikely(lu_ret.status != EXCEPTION_NONE)) {
        ret.status = lu_ret.status;
        ret.cap = cap_null_cap_new();
        return ret;
    }

    ret.status = EXCEPTION_NONE;
    ret.cap = lu_ret.slot->cap;
    return ret;
}

lookupCapAndSlot_ret_t
lookupCapAndSlot(tcb_t *thread, cptr_t cPtr)
{
    lookupSlot_raw_ret_t lu_ret;
    lookupCapAndSlot_ret_t ret;

    lu_ret = lookupSlot(thread, cPtr);
    if (unlikely(lu_ret.status != EXCEPTION_NONE)) {
        ret.status = lu_ret.status;
        ret.slot = NULL;
        ret.cap = cap_null_cap_new();
        return ret;
    }

    ret.status = EXCEPTION_NONE;
    ret.slot = lu_ret.slot;
    ret.cap = lu_ret.slot->cap;
    return ret;
}

lookupSlot_raw_ret_t
lookupSlot(tcb_t *thread, cptr_t capptr)
{
    cap_t threadRoot;
    resolveAddressBits_ret_t res_ret;
    lookupSlot_raw_ret_t ret;

    threadRoot = TCB_PTR_CTE_PTR(thread, tcbCTable)->cap;
    res_ret = resolveAddressBits(threadRoot, capptr, wordBits);

    ret.status = res_ret.status;
    ret.slot = res_ret.slot;
    return ret;
}

lookupSlot_ret_t
lookupSlotForCNodeOp(bool_t isSource, cap_t root, cptr_t capptr,
                     unsigned int depth)
{
    resolveAddressBits_ret_t res_ret;
    lookupSlot_ret_t ret;

    ret.slot = NULL;

    if (unlikely(cap_get_capType(root) != cap_cnode_cap)) {
        current_syscall_error.type = seL4_FailedLookup;
        current_syscall_error.failedLookupWasSource = isSource;
        current_lookup_fault = lookup_fault_invalid_root_new();
        ret.status = EXCEPTION_SYSCALL_ERROR;
        return ret;
    }

    if (unlikely(depth < 1 || depth > wordBits)) {
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 1;
        current_syscall_error.rangeErrorMax = wordBits;
        ret.status = EXCEPTION_SYSCALL_ERROR;
        return ret;
    }

    res_ret = resolveAddressBits(root, capptr, depth);
    if (unlikely(res_ret.status != EXCEPTION_NONE)) {
        current_syscall_error.type = seL4_FailedLookup;
        current_syscall_error.failedLookupWasSource = isSource;
        /* current_lookup_fault will have been set by resolveAddressBits */
        ret.status = EXCEPTION_SYSCALL_ERROR;
        return ret;
    }

    if (unlikely(res_ret.bitsRemaining != 0)) {
        current_syscall_error.type = seL4_FailedLookup;
        current_syscall_error.failedLookupWasSource = isSource;
        current_lookup_fault =
            lookup_fault_depth_mismatch_new(0, res_ret.bitsRemaining);
        ret.status = EXCEPTION_SYSCALL_ERROR;
        return ret;
    }

    ret.slot = res_ret.slot;
    ret.status = EXCEPTION_NONE;
    return ret;
}

lookupSlot_ret_t
lookupSourceSlot(cap_t root, cptr_t capptr, unsigned int depth)
{
    return lookupSlotForCNodeOp(true, root, capptr, depth);
}

lookupSlot_ret_t
lookupTargetSlot(cap_t root, cptr_t capptr, unsigned int depth)
{
    return lookupSlotForCNodeOp(false, root, capptr, depth);
}

lookupSlot_ret_t
lookupPivotSlot(cap_t root, cptr_t capptr, unsigned int depth)
{
    return lookupSlotForCNodeOp(true, root, capptr, depth);
}

resolveAddressBits_ret_t
resolveAddressBits(cap_t nodeCap, cptr_t capptr, unsigned int n_bits)
{
    resolveAddressBits_ret_t ret;
    unsigned int radixBits, guardBits, levelBits, offset;
    word_t guard, capGuard;
    cte_t *slot;

    ret.bitsRemaining = n_bits;
    ret.slot = NULL;

    if (unlikely(cap_get_capType(nodeCap) != cap_cnode_cap)) {
        current_lookup_fault = lookup_fault_invalid_root_new();
        ret.status = EXCEPTION_LOOKUP_FAULT;
        return ret;
    }

    while (1) {
        radixBits = cap_cnode_cap_get_capCNodeRadix(nodeCap);
        guardBits = cap_cnode_cap_get_capCNodeGuardSize(nodeCap);
        levelBits = radixBits + guardBits;

        /* Haskell error: "All CNodes must resolve bits" */
        assert(levelBits != 0);

        capGuard = cap_cnode_cap_get_capCNodeGuard(nodeCap);

        /* sjw --- the MASK(5) here is to avoid the case where n_bits = 32
           and guardBits = 0, as it violates the C spec to >> by more
           than 31 */
        guard = (capptr >> ((n_bits - guardBits) & MASK(5))) & MASK(guardBits);
        if (unlikely(guardBits > n_bits || guard != capGuard)) {
            current_lookup_fault =
                lookup_fault_guard_mismatch_new(capGuard, n_bits, guardBits);
            ret.status = EXCEPTION_LOOKUP_FAULT;
            return ret;
        }

        if (unlikely(levelBits > n_bits)) {
            current_lookup_fault =
                lookup_fault_depth_mismatch_new(levelBits, n_bits);
            ret.status = EXCEPTION_LOOKUP_FAULT;
            return ret;
        }

        offset = (capptr >> (n_bits - levelBits)) & MASK(radixBits);
        slot = CTE_PTR(cap_cnode_cap_get_capCNodePtr(nodeCap)) + offset;

        if (likely(n_bits <= levelBits)) {
            ret.status = EXCEPTION_NONE;
            ret.slot = slot;
            ret.bitsRemaining = 0;
            return ret;
        }

        n_bits -= levelBits;
        nodeCap = slot->cap;

        if (unlikely(cap_get_capType(nodeCap) != cap_cnode_cap)) {
            ret.status = EXCEPTION_NONE;
            ret.slot = slot;
            ret.bitsRemaining = n_bits;
            return ret;
        }
    }

    ret.status = EXCEPTION_NONE;
    return ret;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/faulthandler.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <api/failures.h>
#include <kernel/cspace.h>
#include <kernel/faulthandler.h>
#include <kernel/thread.h>
#include <machine/io.h>
#include <arch/machine.h>

void
handleFault(tcb_t *tptr)
{
    exception_t status;
    fault_t fault = current_fault;

    status = sendFaultIPC(tptr);
    if (status != EXCEPTION_NONE) {
        handleDoubleFault(tptr, fault);
    }
}

exception_t
sendFaultIPC(tcb_t *tptr)
{
    cptr_t handlerCPtr;
    cap_t  handlerCap;
    lookupCap_ret_t lu_ret;
    lookup_fault_t original_lookup_fault;

    original_lookup_fault = current_lookup_fault;

    handlerCPtr = tptr->tcbFaultHandler;
    lu_ret = lookupCap(tptr, handlerCPtr);
    if (lu_ret.status != EXCEPTION_NONE) {
        current_fault = fault_cap_fault_new(handlerCPtr, false);
        return EXCEPTION_FAULT;
    }
    handlerCap = lu_ret.cap;

    if (cap_get_capType(handlerCap) == cap_endpoint_cap &&
            cap_endpoint_cap_get_capCanSend(handlerCap) &&
            cap_endpoint_cap_get_capCanGrant(handlerCap)) {
        tptr->tcbFault = current_fault;
        if (fault_get_faultType(current_fault) == fault_cap_fault) {
            tptr->tcbLookupFailure = original_lookup_fault;
        }
        sendIPC(true, false,
                cap_endpoint_cap_get_capEPBadge(handlerCap),
                true, tptr,
                EP_PTR(cap_endpoint_cap_get_capEPPtr(handlerCap)));

        return EXCEPTION_NONE;
    } else {
        current_fault = fault_cap_fault_new(handlerCPtr, false);
        current_lookup_fault = lookup_fault_missing_capability_new(0);

        return EXCEPTION_FAULT;
    }
}

#ifdef DEBUG
static void
print_fault(fault_t f)
{
    switch (fault_get_faultType(f)) {
    case fault_null_fault:
        printf("null fault");
        break;
    case fault_cap_fault:
        printf("cap fault in %s phase at address 0x%x",
               fault_cap_fault_get_inReceivePhase(f) ? "receive" : "send",
               (unsigned int)fault_cap_fault_get_address(f));
        break;
    case fault_vm_fault:
        printf("vm fault on %s at address 0x%x with status 0x%x",
               fault_vm_fault_get_instructionFault(f) ? "code" : "data",
               (unsigned int)fault_vm_fault_get_address(f),
               (unsigned int)fault_vm_fault_get_FSR(f));
        break;
    case fault_unknown_syscall:
        printf("unknown syscall 0x%x",
               (unsigned int)fault_unknown_syscall_get_syscallNumber(f));
        break;
    case fault_user_exception:
        printf("user exception 0x%x code 0x%x",
               (unsigned int)fault_user_exception_get_number(f),
               (unsigned int)fault_user_exception_get_code(f));
        break;
    default:
        printf("unknown fault");
        break;
    }
}
#endif

/* The second fault, ex2, is stored in the global current_fault */
void
handleDoubleFault(tcb_t *tptr, fault_t ex1)
{
#ifdef DEBUG
    fault_t ex2 = current_fault;
    printf("Caught ");
    print_fault(ex2);
    printf("\nwhile trying to handle:\n");
    print_fault(ex1);
    printf("\nin thread 0x%x ", (unsigned int)tptr);
    printf("at address 0x%x\n", (unsigned int)getRestartPC(tptr));
#endif

    setThreadState(tptr, ThreadState_Inactive);
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <object.h>
#include <util.h>
#include <api/faults.h>
#include <api/types.h>
#include <kernel/cspace.h>
#include <kernel/thread.h>
#include <kernel/vspace.h>
#include <model/statedata.h>
#include <arch/machine.h>
#include <arch/kernel/thread.h>
#include <machine/registerset.h>
#include <arch/linker.h>

static message_info_t
transferCaps(message_info_t info, extra_caps_t caps,
             endpoint_t *endpoint, tcb_t *receiver,
             word_t *receiveBuffer, bool_t diminish);

static inline bool_t PURE
isBlocked(const tcb_t *thread)
{
    switch (thread_state_get_tsType(thread->tcbState)) {
    case ThreadState_Inactive:
    case ThreadState_BlockedOnReceive:
    case ThreadState_BlockedOnSend:
    case ThreadState_BlockedOnAsyncEvent:
    case ThreadState_BlockedOnReply:
        return true;

    default:
        return false;
    }
}

static inline bool_t PURE
isRunnable(const tcb_t *thread)
{
    switch (thread_state_get_tsType(thread->tcbState)) {
    case ThreadState_Running:
    case ThreadState_Restart:
        return true;

    default:
        return false;
    }
}

BOOT_CODE void
configureIdleThread(tcb_t *tcb)
{
    Arch_configureIdleThread(tcb);
    setThreadState(tcb, ThreadState_IdleThreadState);
}

void
activateThread(void)
{
    switch (thread_state_get_tsType(ksCurThread->tcbState)) {
    case ThreadState_Running:
        break;

    case ThreadState_Restart: {
        word_t pc;

        pc = getRestartPC(ksCurThread);
        setNextPC(ksCurThread, pc);
        setThreadState(ksCurThread, ThreadState_Running);
        break;
    }

    case ThreadState_IdleThreadState:
        Arch_activateIdleThread(ksCurThread);
        break;

    default:
        fail("Current thread is blocked");
    }
}

void
suspend(tcb_t *target)
{
    ipcCancel(target);
    setThreadState(target, ThreadState_Inactive);
    tcbSchedDequeue(target);
}

void
restart(tcb_t *target)
{
    if (isBlocked(target)) {
        ipcCancel(target);
        setupReplyMaster(target);
        setThreadState(target, ThreadState_Restart);
        tcbSchedEnqueue(target);
        switchIfRequiredTo(target);
    }
}

void
doIPCTransfer(tcb_t *sender, endpoint_t *endpoint, word_t badge,
              bool_t grant, tcb_t *receiver, bool_t diminish)
{
    void *receiveBuffer, *sendBuffer;

    receiveBuffer = lookupIPCBuffer(true, receiver);

    if (likely(!fault_get_faultType(sender->tcbFault) != fault_null_fault)) {
        sendBuffer = lookupIPCBuffer(false, sender);
        doNormalTransfer(sender, sendBuffer, endpoint, badge, grant,
                         receiver, receiveBuffer, diminish);
    } else {
        doFaultTransfer(badge, sender, receiver, receiveBuffer);
    }
}

void
doReplyTransfer(tcb_t *sender, tcb_t *receiver, cte_t *slot)
{
    assert(thread_state_get_tsType(receiver->tcbState) ==
           ThreadState_BlockedOnReply);

    if (likely(fault_get_faultType(receiver->tcbFault) == fault_null_fault)) {
        doIPCTransfer(sender, NULL, 0, true, receiver, false);
        cteDeleteOne(slot);
        setThreadState(receiver, ThreadState_Running);
        attemptSwitchTo(receiver);
    } else {
        bool_t restart;

        cteDeleteOne(slot);
        restart = handleFaultReply(receiver, sender);
        fault_null_fault_ptr_new(&receiver->tcbFault);
        if (restart) {
            setThreadState(receiver, ThreadState_Restart);
            attemptSwitchTo(receiver);
        } else {
            setThreadState(receiver, ThreadState_Inactive);
        }
    }
}

void
doNormalTransfer(tcb_t *sender, word_t *sendBuffer, endpoint_t *endpoint,
                 word_t badge, bool_t canGrant, tcb_t *receiver,
                 word_t *receiveBuffer, bool_t diminish)
{
    unsigned int msgTransferred;
    message_info_t tag;
    exception_t status;
    extra_caps_t caps;

    tag = messageInfoFromWord(getRegister(sender, msgInfoRegister));

    if (canGrant) {
        status = lookupExtraCaps(sender, sendBuffer, tag);
        caps = current_extra_caps;
        if (unlikely(status != EXCEPTION_NONE)) {
            caps.excaprefs[0] = NULL;
        }
    } else {
        caps = current_extra_caps;
        caps.excaprefs[0] = NULL;
    }

    msgTransferred = copyMRs(sender, sendBuffer, receiver, receiveBuffer,
                             message_info_get_msgLength(tag));

    tag = transferCaps(tag, caps, endpoint, receiver, receiveBuffer, diminish);

    tag = message_info_set_msgLength(tag, msgTransferred);
    setRegister(receiver, msgInfoRegister, wordFromMessageInfo(tag));
    setRegister(receiver, badgeRegister, badge);
}

void
doFaultTransfer(word_t badge, tcb_t *sender, tcb_t *receiver,
                word_t *receiverIPCBuffer)
{
    unsigned int sent;
    message_info_t msgInfo;

    sent = setMRs_fault(sender, receiver, receiverIPCBuffer);
    msgInfo = message_info_new(
                  fault_get_faultType(sender->tcbFault), 0, 0, sent);
    setRegister(receiver, msgInfoRegister, wordFromMessageInfo(msgInfo));
    setRegister(receiver, badgeRegister, badge);
}

/* Like getReceiveSlots, this is specialised for single-cap transfer. */
static message_info_t
transferCaps(message_info_t info, extra_caps_t caps,
             endpoint_t *endpoint, tcb_t *receiver,
             word_t *receiveBuffer, bool_t diminish)
{
    unsigned int i;
    cte_t* destSlot;

    info = message_info_set_msgExtraCaps(info, 0);
    info = message_info_set_msgCapsUnwrapped(info, 0);

    if (likely(!caps.excaprefs[0] || !receiveBuffer)) {
        return info;
    }

    destSlot = getReceiveSlots(receiver, receiveBuffer);

    for (i = 0; i < seL4_MsgMaxExtraCaps && caps.excaprefs[i] != NULL; i++) {
        cte_t *slot = caps.excaprefs[i];
        cap_t cap = slot->cap;

        if (cap_get_capType(cap) == cap_endpoint_cap &&
                EP_PTR(cap_endpoint_cap_get_capEPPtr(cap)) == endpoint) {
            /* If this is a cap to the endpoint on which the message was sent,
             * only transfer the badge, not the cap. */
            setExtraBadge(receiveBuffer,
                          cap_endpoint_cap_get_capEPBadge(cap), i);

            info = message_info_set_msgCapsUnwrapped(info,
                                                     message_info_get_msgCapsUnwrapped(info) | (1 << i));

        } else {
            deriveCap_ret_t dc_ret;

            if (!destSlot) {
                break;
            }

            if (diminish) {
                dc_ret = deriveCap(slot, maskCapRights(noWrite, cap));
            } else {
                dc_ret = deriveCap(slot, cap);
            }

            if (dc_ret.status != EXCEPTION_NONE) {
                break;
            }
            if (cap_get_capType(dc_ret.cap) == cap_null_cap) {
                break;
            }

            cteInsert(dc_ret.cap, slot, destSlot);

            destSlot = NULL;
        }
    }

    return message_info_set_msgExtraCaps(info, i);
}

void
doAsyncTransfer(word_t badge, word_t msgWord, tcb_t *thread)
{
    message_info_t msgInfo;
    unsigned int msgTransferred;

    if (n_msgRegisters < 1) {
        word_t *ipcBuffer;
        ipcBuffer = lookupIPCBuffer(true, thread);
        if (ipcBuffer != NULL) {
            ipcBuffer[1] = msgWord;
            msgTransferred = 1;
        } else {
            msgTransferred = 0;
        }
    } else {
        setRegister(thread, msgRegisters[0], msgWord);
        msgTransferred = 1;
    }
    setRegister(thread, badgeRegister, badge);
    msgInfo = message_info_new(0, 0, 0, msgTransferred);
    setRegister(thread, msgInfoRegister,
                wordFromMessageInfo(msgInfo));
}

static void
nextDomain(void)
{
    ksDomScheduleIdx++;
    if (ksDomScheduleIdx >= ksDomScheduleLength) {
        ksDomScheduleIdx = 0;
    }
    ksWorkUnitsCompleted = 0;
    ksCurDomain = ksDomSchedule[ksDomScheduleIdx].domain;
    ksDomainTime = ksDomSchedule[ksDomScheduleIdx].length;
}

void
schedule(void)
{
    word_t action;

    action = (word_t)ksSchedulerAction;
    if (action == (word_t)SchedulerAction_ChooseNewThread) {
        if (isRunnable(ksCurThread)) {
            tcbSchedEnqueue(ksCurThread);
        }
        if (ksDomainTime == 0) {
            nextDomain();
        }
        chooseThread();
        ksSchedulerAction = SchedulerAction_ResumeCurrentThread;
    } else if (action != (word_t)SchedulerAction_ResumeCurrentThread) {
        if (isRunnable(ksCurThread)) {
            tcbSchedEnqueue(ksCurThread);
        }
        /* SwitchToThread */
        switchToThread(ksSchedulerAction);
        ksSchedulerAction = SchedulerAction_ResumeCurrentThread;
    }
}

void
chooseThread(void)
{
    int p;
    tcb_t *thread;

    for (p = seL4_MaxPrio; p != -1; p--) {
        unsigned int domprio = ksCurDomain * CONFIG_NUM_PRIORITIES + p;
        thread = ksReadyQueues[domprio].head;
        if (thread != NULL) {
            assert(isRunnable(thread));
            switchToThread(thread);
            return;
        }
    }

    switchToIdleThread();
}

void
switchToThread(tcb_t *thread)
{
    Arch_switchToThread(thread);
    tcbSchedDequeue(thread);
    ksCurThread = thread;
}

void
switchToIdleThread(void)
{
    Arch_switchToIdleThread();
    ksCurThread = ksIdleThread;
}

void
setDomain(tcb_t *tptr, dom_t dom)
{
    tcbSchedDequeue(tptr);
    tptr->tcbDomain = dom;
    if (isRunnable(tptr)) {
        tcbSchedEnqueue(tptr);
    }
    if (tptr == ksCurThread) {
        rescheduleRequired();
    }
}

void
setPriority(tcb_t *tptr, prio_t prio)
{
    tcbSchedDequeue(tptr);
    tptr->tcbPriority = prio;
    if (isRunnable(tptr)) {
        tcbSchedEnqueue(tptr);
    }
    if (tptr == ksCurThread) {
        rescheduleRequired();
    }
}

static void
possibleSwitchTo(tcb_t* target, bool_t onSamePriority)
{
    dom_t curDom, targetDom;
    prio_t curPrio, targetPrio;
    tcb_t *action;

    curDom = ksCurDomain;
    curPrio = ksCurThread->tcbPriority;
    targetDom = target->tcbDomain;
    targetPrio = target->tcbPriority;
    action = ksSchedulerAction;
    if (targetDom != curDom) {
        tcbSchedEnqueue(target);
    } else {
        if ((targetPrio > curPrio || (targetPrio == curPrio && onSamePriority))
                && action == SchedulerAction_ResumeCurrentThread) {
            ksSchedulerAction = target;
        } else {
            tcbSchedEnqueue(target);
        }
        if (action != SchedulerAction_ResumeCurrentThread
                && action != SchedulerAction_ChooseNewThread) {
            rescheduleRequired();
        }
    }
}

void
attemptSwitchTo(tcb_t* target)
{
    possibleSwitchTo(target, true);
}

void
switchIfRequiredTo(tcb_t* target)
{
    possibleSwitchTo(target, false);
}

void
setThreadState(tcb_t *tptr, _thread_state_t ts)
{
    thread_state_ptr_set_tsType(&tptr->tcbState, ts);
    scheduleTCB(tptr);
}

void
scheduleTCB(tcb_t *tptr)
{
    if (tptr == ksCurThread &&
            ksSchedulerAction == SchedulerAction_ResumeCurrentThread &&
            !isRunnable(tptr)) {
        rescheduleRequired();
    }
}

void
timerTick(void)
{
    if (likely(thread_state_get_tsType(ksCurThread->tcbState) ==
               ThreadState_Running)) {
        if (ksCurThread->tcbTimeSlice > 1) {
            ksCurThread->tcbTimeSlice--;
        } else {
            ksCurThread->tcbTimeSlice = CONFIG_TIME_SLICE;
            tcbSchedAppend(ksCurThread);
            rescheduleRequired();
        }
    }

    if (CONFIG_NUM_DOMAINS > 1) {
        ksDomainTime--;
        if (ksDomainTime == 0) {
            rescheduleRequired();
        }
    }
}

void
rescheduleRequired(void)
{
    if (ksSchedulerAction != SchedulerAction_ResumeCurrentThread
            && ksSchedulerAction != SchedulerAction_ChooseNewThread) {
        tcbSchedEnqueue(ksSchedulerAction);
    }
    ksSchedulerAction = SchedulerAction_ChooseNewThread;
}

#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/machine/io.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <stdarg.h>
#include <machine/io.h>

#ifdef DEBUG

static unsigned int
print_string(const char *s)
{
    unsigned int n;

    for (n = 0; *s; s++, n++) {
        kernel_putchar(*s);
    }

    return n;
}

static unsigned long
xdiv(unsigned long x, unsigned int denom)
{
    switch (denom) {
    case 16:
        return x / 16;
    case 10:
        return x / 10;
    default:
        return 0;
    }
}

static unsigned long
xmod(unsigned long x, unsigned int denom)
{
    switch (denom) {
    case 16:
        return x % 16;
    case 10:
        return x % 10;
    default:
        return 0;
    }
}

unsigned int
print_unsigned_long(unsigned long x, unsigned int ui_base)
{
    char out[11];
    unsigned int i, j;
    unsigned int d;

    /*
     * Only base 10 and 16 supported for now. We want to avoid invoking the
     * compiler's support libraries through doing arbitrary divisions.
     */
    if (ui_base != 10 && ui_base != 16) {
        return 0;
    }

    if (x == 0) {
        kernel_putchar('0');
        return 1;
    }

    for (i = 0; x; x = xdiv(x, ui_base), i++) {
        d = xmod(x, ui_base);

        if (d >= 10) {
            out[i] = 'a' + d - 10;
        } else {
            out[i] = '0' + d;
        }
    }

    for (j = i; j > 0; j--) {
        kernel_putchar(out[j - 1]);
    }

    return i;
}


static unsigned int
print_unsigned_long_long(unsigned long long x, unsigned int ui_base)
{
    unsigned long upper, lower;
    unsigned int n = 0;
    unsigned int mask = 0xF0000000u;

    /* only implemented for hex, decimal is harder without 64 bit division */
    if (ui_base != 16) {
        return 0;
    }

    /* we can't do 64 bit division so break it up into two hex numbers */
    upper = (unsigned long) (x >> 32llu);
    lower = (unsigned long) x;

    /* print first 32 bits if they exist */
    if (upper > 0) {
        n += print_unsigned_long(upper, ui_base);

        /* print leading 0s */
        while (!(mask & lower)) {
            kernel_putchar('0');
            n++;
            mask = mask >> 4;
        }
    }

    /* print last 32 bits */
    n += print_unsigned_long(lower, ui_base);

    return n;
}


static int
vprintf(const char *format, va_list ap)
{
    unsigned int n;
    unsigned int formatting;

    if (!format) {
        return 0;
    }

    n = 0;
    formatting = 0;
    while (*format) {
        if (formatting) {
            switch (*format) {
            case '%':
                kernel_putchar('%');
                n++;
                format++;
                break;

            case 'd': {
                int x = va_arg(ap, int);

                if (x < 0) {
                    kernel_putchar('-');
                    n++;
                    x = -x;
                }

                n += print_unsigned_long((unsigned long)x, 10);
                format++;
                break;
            }

            case 'u':
                n += print_unsigned_long(va_arg(ap, unsigned long), 10);
                format++;
                break;

            case 'x':
                n += print_unsigned_long(va_arg(ap, unsigned long), 16);
                format++;
                break;

            case 'p': {
                unsigned long p = va_arg(ap, unsigned long);
                if (p == 0) {
                    n += print_string("(nil)");
                } else {
                    n += print_string("0x");
                    n += print_unsigned_long(p, 16);
                }
                format++;
                break;
            }

            case 's':
                n += print_string(va_arg(ap, char *));
                format++;
                break;

            case 'l':
                if (*(format + 1) == 'l' && *(format + 2) == 'x') {
                    uint64_t arg = va_arg(ap, unsigned long long);
                    n += print_unsigned_long_long(arg, 16);
                }
                format += 3;
                break;
            default:
                format++;
                break;
            }

            formatting = 0;
        } else {
            switch (*format) {
            case '%':
                formatting = 1;
                format++;
                break;

            default:
                kernel_putchar(*format);
                n++;
                format++;
                break;
            }
        }
    }

    return n;
}

unsigned int
printf(const char *format, ...)
{
    va_list args;
    unsigned int i;

    va_start(args, format);
    i = vprintf(format, args);
    va_end(args);
    return i;
}

unsigned int puts(const char *s)
{
    for (; *s; s++) {
        kernel_putchar(*s);
    }
    kernel_putchar('\n');
    return 0;
}

#endif
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/preemption.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <api/failures.h>
#include <model/preemption.h>
#include <model/statedata.h>
#include <plat/machine/hardware.h>
#include <config.h>

/*
 * Possibly preempt the current thread to allow an interrupt to be handled.
 */
exception_t
preemptionPoint(void)
{
    /* Record that we have performed some work. */
    ksWorkUnitsCompleted++;

    /*
     * If we have performed a non-trivial amount of work since last time we
     * checked for preemption, and there is an interrupt pending, handle the
     * interrupt.
     *
     * We avoid checking for pending IRQs every call, as our callers tend to
     * call us in a tight loop and checking for pending IRQs can be quite slow.
     */
    if (ksWorkUnitsCompleted >= CONFIG_MAX_NUM_WORK_UNITS_PER_PREEMPTION) {
        ksWorkUnitsCompleted = 0;
        if (isIRQPending()) {
            return EXCEPTION_PREEMPTED;
        }
    }

    return EXCEPTION_NONE;
}

#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/statedata.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <types.h>
#include <plat/machine.h>
#include <model/statedata.h>
#include <object/structures.h>
#include <object/tcb.h>

/* Pointer to the head of the scheduler queue for each priority */
tcb_queue_t ksReadyQueues[NUM_READY_QUEUES];

/* Current thread TCB pointer */
tcb_t *ksCurThread;

/* Idle thread TCB pointer */
tcb_t *ksIdleThread;

/* Values of 0 and ~0 encode ResumeCurrentThread and ChooseNewThread
 * respectively; other values encode SwitchToThread and must be valid
 * tcb pointers */
tcb_t *ksSchedulerAction;

/* Units of work we have completed since the last time we checked for
 * pending interrupts */
word_t ksWorkUnitsCompleted;

/* CNode containing interrupt handler endpoints */
irq_state_t intStateIRQTable[maxIRQ + 1];
cte_t *intStateIRQNode;

/* Currently active domain */
dom_t ksCurDomain;

/* Domain timeslice remaining */
word_t ksDomainTime;

/* An index into ksDomSchedule for active domain and length. */
uint32_t ksDomScheduleIdx;

#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/asyncendpoint.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <assert.h>

#include <types.h>
#include <kernel/thread.h>
#include <object/structures.h>
#include <object/tcb.h>
#include <model/statedata.h>

#include <object/asyncendpoint.h>

static inline tcb_queue_t PURE
aep_ptr_get_queue(async_endpoint_t *aepptr)
{
    tcb_queue_t aep_queue;

    aep_queue.head = (tcb_t*)async_endpoint_ptr_get_aepQueue_head(aepptr);
    aep_queue.end = (tcb_t*)async_endpoint_ptr_get_aepQueue_tail(aepptr);

    return aep_queue;
}

static inline void
aep_ptr_set_queue(async_endpoint_t *aepptr, tcb_queue_t aep_queue)
{
    async_endpoint_ptr_set_aepQueue_head(aepptr, (word_t)aep_queue.head);
    async_endpoint_ptr_set_aepQueue_tail(aepptr, (word_t)aep_queue.end);
}

void
sendAsyncIPC(async_endpoint_t *aepptr, word_t badge, word_t val)
{
    switch (async_endpoint_ptr_get_state(aepptr)) {
    case AEPState_Idle:
        async_endpoint_ptr_set_state(aepptr, AEPState_Active);
        async_endpoint_ptr_set_aepMsgIdentifier(aepptr, badge);
        async_endpoint_ptr_set_aepData(aepptr, val);
        break;

    case AEPState_Waiting: {
        tcb_queue_t aep_queue;
        tcb_t *dest;

        aep_queue = aep_ptr_get_queue(aepptr);
        dest = aep_queue.head;

        /* Haskell error "WaitingAEP AEP must have non-empty queue" */
        assert(dest);

        /* Dequeue TCB */
        aep_queue = tcbEPDequeue(dest, aep_queue);
        aep_ptr_set_queue(aepptr, aep_queue);

        if (!aep_queue.head) {
            async_endpoint_ptr_set_state(aepptr, AEPState_Idle);
        }

        setThreadState(dest, ThreadState_Running);
        doAsyncTransfer(badge, val, dest);
        switchIfRequiredTo(dest);
        break;
    }

    case AEPState_Active: {
        word_t badge2, val2;

        val2 = async_endpoint_ptr_get_aepData(aepptr);
        val2 |= val;

        badge2 = async_endpoint_ptr_get_aepMsgIdentifier(aepptr);
        badge2 |= badge;

        async_endpoint_ptr_set_aepMsgIdentifier(aepptr, badge2);
        async_endpoint_ptr_set_aepData(aepptr, val2);
        break;
    }
    }
}

void
receiveAsyncIPC(tcb_t *thread, cap_t cap)
{
    async_endpoint_t *aepptr;

    aepptr = AEP_PTR(cap_async_endpoint_cap_get_capAEPPtr(cap));

    switch (async_endpoint_ptr_get_state(aepptr)) {
    case AEPState_Idle:
    case AEPState_Waiting: {
        tcb_queue_t aep_queue;

        /* Block thread on endpoint */
        thread_state_ptr_set_tsType(&thread->tcbState,
                                    ThreadState_BlockedOnAsyncEvent);
        thread_state_ptr_set_blockingIPCEndpoint(&thread->tcbState,
                                                 AEP_REF(aepptr));
        scheduleTCB(thread);

        /* Enqueue TCB */
        aep_queue = aep_ptr_get_queue(aepptr);
        aep_queue = tcbEPAppend(thread, aep_queue);
        async_endpoint_ptr_set_state(aepptr, AEPState_Waiting);
        aep_ptr_set_queue(aepptr, aep_queue);
        break;
    }

    case AEPState_Active:
        doAsyncTransfer(
            async_endpoint_ptr_get_aepMsgIdentifier(aepptr),
            async_endpoint_ptr_get_aepData(aepptr), thread);
        async_endpoint_ptr_set_state(aepptr, AEPState_Idle);
        break;
    }
}

void
aepCancelAll(async_endpoint_t *aepptr)
{
    if (async_endpoint_ptr_get_state(aepptr) == AEPState_Waiting) {
        tcb_t *thread = TCB_PTR(async_endpoint_ptr_get_aepQueue_head(aepptr));

        async_endpoint_ptr_set_state(aepptr, AEPState_Idle);
        async_endpoint_ptr_set_aepQueue_head(aepptr, 0);
        async_endpoint_ptr_set_aepQueue_tail(aepptr, 0);

        /* Set all waiting threads to Restart */
        for (; thread; thread = thread->tcbEPNext) {
            setThreadState(thread, ThreadState_Restart);
            tcbSchedEnqueue(thread);
        }
        rescheduleRequired();
    }
}

void
asyncIPCCancel(tcb_t *threadPtr, async_endpoint_t *aepptr)
{
    tcb_queue_t aep_queue;

    /* Haskell error "asyncIPCCancel: async endpoint must be waiting" */
    assert(async_endpoint_ptr_get_state(aepptr) == AEPState_Waiting);

    /* Dequeue TCB */
    aep_queue = aep_ptr_get_queue(aepptr);
    aep_queue = tcbEPDequeue(threadPtr, aep_queue);
    aep_ptr_set_queue(aepptr, aep_queue);

    /* Make endpoint idle */
    if (!aep_queue.head) {
        async_endpoint_ptr_set_state(aepptr, AEPState_Idle);
    }

    /* Make thread inactive */
    setThreadState(threadPtr, ThreadState_Inactive);
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <assert.h>
#include <types.h>
#include <api/failures.h>
#include <api/invocation.h>
#include <api/syscall.h>
#include <api/types.h>
#include <machine/io.h>
#include <object/structures.h>
#include <object/objecttype.h>
#include <object/cnode.h>
#include <object/interrupt.h>
#include <object/untyped.h>
#include <kernel/cspace.h>
#include <kernel/thread.h>
#include <model/preemption.h>
#include <model/statedata.h>
#include <util.h>

struct finaliseSlot_ret {
    exception_t status;
    bool_t success;
    irq_t irq;
};
typedef struct finaliseSlot_ret finaliseSlot_ret_t;

static finaliseSlot_ret_t finaliseSlot(cte_t *slot, bool_t exposed);
static void emptySlot(cte_t *slot, irq_t irq);
static exception_t reduceZombie(cte_t* slot, bool_t exposed);

exception_t
decodeCNodeInvocation(word_t label, unsigned int length, cap_t cap,
                      extra_caps_t extraCaps, word_t *buffer)
{
    lookupSlot_ret_t lu_ret;
    cte_t *destSlot;
    word_t index, w_bits;
    exception_t status;

    /* Haskell error: "decodeCNodeInvocation: invalid cap" */
    assert(cap_get_capType(cap) == cap_cnode_cap);

    if (label < CNodeRevoke || label > CNodeSaveCaller) {
        userError("CNodeCap: Illegal Operation attempted.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (length < 2) {
        userError("CNode operation: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }
    index = getSyscallArg(0, buffer);
    w_bits = getSyscallArg(1, buffer);

    lu_ret = lookupTargetSlot(cap, index, w_bits);
    if (lu_ret.status != EXCEPTION_NONE) {
        userError("CNode operation: Target slot invalid.");
        return lu_ret.status;
    }
    destSlot = lu_ret.slot;

    if (label >= CNodeCopy && label <= CNodeMutate) {
        cte_t *srcSlot;
        word_t srcIndex, srcDepth, capData;
        bool_t isMove;
        cap_rights_t cap_rights;
        cap_t srcRoot, newCap;
        deriveCap_ret_t dc_ret;
        cap_t srcCap;

        if (length < 4 || extraCaps.excaprefs[0] == NULL) {
            userError("CNode Copy/Mint/Move/Mutate: Truncated message.");
            current_syscall_error.type = seL4_TruncatedMessage;
            return EXCEPTION_SYSCALL_ERROR;
        }
        srcIndex = getSyscallArg(2, buffer);
        srcDepth = getSyscallArg(3, buffer);

        srcRoot = extraCaps.excaprefs[0]->cap;

        status = ensureEmptySlot(destSlot);
        if (status != EXCEPTION_NONE) {
            userError("CNode Copy/Mint/Move/Mutate: Destination not empty.");
            return status;
        }

        lu_ret = lookupSourceSlot(srcRoot, srcIndex, srcDepth);
        if (lu_ret.status != EXCEPTION_NONE) {
            userError("CNode Copy/Mint/Move/Mutate: Invalid source slot.");
            return lu_ret.status;
        }
        srcSlot = lu_ret.slot;

        if (cap_get_capType(srcSlot->cap) == cap_null_cap) {
            userError("CNode Copy/Mint/Move/Mutate: Source slot invalid or empty.");
            current_syscall_error.type = seL4_FailedLookup;
            current_syscall_error.failedLookupWasSource = 1;
            current_lookup_fault =
                lookup_fault_missing_capability_new(srcDepth);
            return EXCEPTION_SYSCALL_ERROR;
        }

        switch (label) {
        case CNodeCopy:

            if (length < 5) {
                userError("Truncated message for CNode Copy operation.");
                current_syscall_error.type = seL4_TruncatedMessage;
                return EXCEPTION_SYSCALL_ERROR;
            }

            cap_rights = rightsFromWord(getSyscallArg(4, buffer));
            srcCap = maskCapRights(cap_rights, srcSlot->cap);
            dc_ret = deriveCap(srcSlot, srcCap);
            if (dc_ret.status != EXCEPTION_NONE) {
                userError("Error deriving cap for CNode Copy operation.");
                return dc_ret.status;
            }
            newCap = dc_ret.cap;
            isMove = false;

            break;

        case CNodeMint:
            if (length < 6) {
                userError("CNode Mint: Truncated message.");
                current_syscall_error.type = seL4_TruncatedMessage;
                return EXCEPTION_SYSCALL_ERROR;
            }

            cap_rights = rightsFromWord(getSyscallArg(4, buffer));
            capData = getSyscallArg(5, buffer);
            srcCap = maskCapRights(cap_rights, srcSlot->cap);
            dc_ret = deriveCap(srcSlot,
                               updateCapData(false, capData, srcCap));
            if (dc_ret.status != EXCEPTION_NONE) {
                userError("Error deriving cap for CNode Mint operation.");
                return dc_ret.status;
            }
            newCap = dc_ret.cap;
            isMove = false;

            break;

        case CNodeMove:
            newCap = srcSlot->cap;
            isMove = true;

            break;

        case CNodeMutate:
            if (length < 5) {
                userError("CNode Mutate: Truncated message.");
                current_syscall_error.type = seL4_TruncatedMessage;
                return EXCEPTION_SYSCALL_ERROR;
            }

            capData = getSyscallArg(4, buffer);
            newCap = updateCapData(true, capData, srcSlot->cap);
            isMove = true;

            break;

        default:
            assert (0);
            return EXCEPTION_NONE;
        }

        if (cap_get_capType(newCap) == cap_null_cap) {
            userError("CNode Copy/Mint/Move/Mutate: Mutated cap would be invalid.");
            current_syscall_error.type = seL4_IllegalOperation;
            return EXCEPTION_SYSCALL_ERROR;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        if (isMove) {
            return invokeCNodeMove(newCap, srcSlot, destSlot);
        } else {
            return invokeCNodeInsert(newCap, srcSlot, destSlot);
        }
    }

    if (label == CNodeRevoke) {
        setThreadState(ksCurThread, ThreadState_Restart);
        return invokeCNodeRevoke(destSlot);
    }

    if (label == CNodeDelete) {
        setThreadState(ksCurThread, ThreadState_Restart);
        return invokeCNodeDelete(destSlot);
    }

    if (label == CNodeSaveCaller) {
        status = ensureEmptySlot(destSlot);
        if (status != EXCEPTION_NONE) {
            userError("CNode SaveCaller: Destination slot not empty.");
            return status;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        return invokeCNodeSaveCaller(destSlot);
    }

    if (label == CNodeRecycle) {
        if (!hasRecycleRights(destSlot->cap)) {
            userError("CNode Recycle: Target cap invalid.");
            current_syscall_error.type = seL4_IllegalOperation;
            return EXCEPTION_SYSCALL_ERROR;
        }
        setThreadState(ksCurThread, ThreadState_Restart);
        return invokeCNodeRecycle(destSlot);
    }

    if (label == CNodeRotate) {
        word_t pivotNewData, pivotIndex, pivotDepth;
        word_t srcNewData, srcIndex, srcDepth;
        cte_t *pivotSlot, *srcSlot;
        cap_t pivotRoot, srcRoot, newSrcCap, newPivotCap;

        if (length < 8 || extraCaps.excaprefs[0] == NULL
                || extraCaps.excaprefs[1] == NULL) {
            current_syscall_error.type = seL4_TruncatedMessage;
            return EXCEPTION_SYSCALL_ERROR;
        }
        pivotNewData = getSyscallArg(2, buffer);
        pivotIndex   = getSyscallArg(3, buffer);
        pivotDepth   = getSyscallArg(4, buffer);
        srcNewData   = getSyscallArg(5, buffer);
        srcIndex     = getSyscallArg(6, buffer);
        srcDepth     = getSyscallArg(7, buffer);

        pivotRoot = extraCaps.excaprefs[0]->cap;
        srcRoot   = extraCaps.excaprefs[1]->cap;

        lu_ret = lookupSourceSlot(srcRoot, srcIndex, srcDepth);
        if (lu_ret.status != EXCEPTION_NONE) {
            return lu_ret.status;
        }
        srcSlot = lu_ret.slot;

        lu_ret = lookupPivotSlot(pivotRoot, pivotIndex, pivotDepth);
        if (lu_ret.status != EXCEPTION_NONE) {
            return lu_ret.status;
        }
        pivotSlot = lu_ret.slot;

        if (pivotSlot == srcSlot || pivotSlot == destSlot) {
            userError("CNode Rotate: Pivot slot the same as source or dest slot.");
            current_syscall_error.type = seL4_IllegalOperation;
            return EXCEPTION_SYSCALL_ERROR;
        }

        if (srcSlot != destSlot) {
            status = ensureEmptySlot(destSlot);
            if (status != EXCEPTION_NONE) {
                return status;
            }
        }

        if (cap_get_capType(srcSlot->cap) == cap_null_cap) {
            current_syscall_error.type = seL4_FailedLookup;
            current_syscall_error.failedLookupWasSource = 1;
            current_lookup_fault = lookup_fault_missing_capability_new(srcDepth);
            return EXCEPTION_SYSCALL_ERROR;
        }

        if (cap_get_capType(pivotSlot->cap) == cap_null_cap) {
            current_syscall_error.type = seL4_FailedLookup;
            current_syscall_error.failedLookupWasSource = 0;
            current_lookup_fault = lookup_fault_missing_capability_new(pivotDepth);
            return EXCEPTION_SYSCALL_ERROR;
        }

        newSrcCap = updateCapData(true, srcNewData, srcSlot->cap);
        newPivotCap = updateCapData(true, pivotNewData, pivotSlot->cap);

        if (cap_get_capType(newSrcCap) == cap_null_cap) {
            userError("CNode Rotate: Source cap invalid.");
            current_syscall_error.type = seL4_IllegalOperation;
            return EXCEPTION_SYSCALL_ERROR;
        }

        if (cap_get_capType(newPivotCap) == cap_null_cap) {
            userError("CNode Rotate: Pivot cap invalid.");
            current_syscall_error.type = seL4_IllegalOperation;
            return EXCEPTION_SYSCALL_ERROR;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        return invokeCNodeRotate(newSrcCap, newPivotCap,
                                 srcSlot, pivotSlot, destSlot);
    }

    return EXCEPTION_NONE;
}

exception_t
invokeCNodeRevoke(cte_t *destSlot)
{
    return cteRevoke(destSlot);
}

exception_t
invokeCNodeDelete(cte_t *destSlot)
{
    return cteDelete(destSlot, true);
}

exception_t
invokeCNodeRecycle(cte_t *destSlot)
{
    return cteRecycle(destSlot);
}

exception_t
invokeCNodeInsert(cap_t cap, cte_t *srcSlot, cte_t *destSlot)
{
    cteInsert(cap, srcSlot, destSlot);

    return EXCEPTION_NONE;
}

exception_t
invokeCNodeMove(cap_t cap, cte_t *srcSlot, cte_t *destSlot)
{
    cteMove(cap, srcSlot, destSlot);

    return EXCEPTION_NONE;
}

exception_t
invokeCNodeRotate(cap_t cap1, cap_t cap2, cte_t *slot1,
                  cte_t *slot2, cte_t *slot3)
{
    if (slot1 == slot3) {
        cteSwap(cap1, slot1, cap2, slot2);
    } else {
        cteMove(cap2, slot2, slot3);
        cteMove(cap1, slot1, slot2);
    }

    return EXCEPTION_NONE;
}

exception_t
invokeCNodeSaveCaller(cte_t *destSlot)
{
    cap_t cap;
    cte_t *srcSlot;

    srcSlot = TCB_PTR_CTE_PTR(ksCurThread, tcbCaller);
    cap = srcSlot->cap;

    switch (cap_get_capType(cap)) {
    case cap_null_cap:
        userError("CNode SaveCaller: Reply cap not present.");
        break;

    case cap_reply_cap:
        if (!cap_reply_cap_get_capReplyMaster(cap)) {
            cteMove(cap, srcSlot, destSlot);
        }
        break;

    default:
        fail("caller capability must be null or reply");
        break;
    }

    return EXCEPTION_NONE;
}

/*
 * If creating a child UntypedCap, don't allow new objects to be created in the
 * parent.
 */
static void
setUntypedCapAsFull(cap_t srcCap, cap_t newCap, cte_t *srcSlot)
{
    if ((cap_get_capType(srcCap) == cap_untyped_cap)
            && (cap_get_capType(newCap) == cap_untyped_cap)) {
        if ((cap_untyped_cap_get_capPtr(srcCap)
                == cap_untyped_cap_get_capPtr(newCap))
                && (cap_untyped_cap_get_capBlockSize(newCap)
                    == cap_untyped_cap_get_capBlockSize(srcCap))) {
            cap_untyped_cap_ptr_set_capFreeIndex(&(srcSlot->cap),
                                                 MAX_FREE_INDEX(cap_untyped_cap_get_capBlockSize(srcCap)));
        }
    }
}

void
cteInsert(cap_t newCap, cte_t *srcSlot, cte_t *destSlot)
{
    mdb_node_t srcMDB, newMDB;
    cap_t srcCap;
    bool_t newCapIsRevocable;

    srcMDB = srcSlot->cteMDBNode;
    srcCap = srcSlot->cap;

    switch (cap_get_capType(newCap)) {
    case cap_endpoint_cap:
        newCapIsRevocable = (cap_endpoint_cap_get_capEPBadge(newCap) !=
                             cap_endpoint_cap_get_capEPBadge(srcCap));
        break;

    case cap_async_endpoint_cap:
        newCapIsRevocable =
            (cap_async_endpoint_cap_get_capAEPBadge(newCap) !=
             cap_async_endpoint_cap_get_capAEPBadge(srcCap));
        break;

    case cap_irq_handler_cap:
        newCapIsRevocable = (cap_get_capType(srcCap) ==
                             cap_irq_control_cap);
        break;

    case cap_untyped_cap:
        newCapIsRevocable = true;
        break;

    default:
        newCapIsRevocable = false;
        break;
    }

    newMDB = mdb_node_set_mdbPrev(srcMDB, CTE_REF(srcSlot));
    newMDB = mdb_node_set_mdbRevocable(newMDB, newCapIsRevocable);
    newMDB = mdb_node_set_mdbFirstBadged(newMDB, newCapIsRevocable);

    /* Haskell error: "cteInsert to non-empty destination" */
    assert(cap_get_capType(destSlot->cap) == cap_null_cap);
    /* Haskell error: "cteInsert: mdb entry must be empty" */
    assert((cte_t*)mdb_node_get_mdbNext(destSlot->cteMDBNode) == NULL &&
           (cte_t*)mdb_node_get_mdbPrev(destSlot->cteMDBNode) == NULL);

    /* Prevent parent untyped cap from being used again if creating a child
     * untyped from it. */
    setUntypedCapAsFull(srcCap, newCap, srcSlot);

    destSlot->cap = newCap;
    destSlot->cteMDBNode = newMDB;
    mdb_node_ptr_set_mdbNext(&srcSlot->cteMDBNode, CTE_REF(destSlot));
    if (mdb_node_get_mdbNext(newMDB)) {
        mdb_node_ptr_set_mdbPrev(
            &CTE_PTR(mdb_node_get_mdbNext(newMDB))->cteMDBNode,
            CTE_REF(destSlot));
    }
}

void
cteMove(cap_t newCap, cte_t *srcSlot, cte_t *destSlot)
{
    mdb_node_t mdb;
    uint32_t prev_ptr, next_ptr;

    /* Haskell error: "cteMove to non-empty destination" */
    assert(cap_get_capType(destSlot->cap) == cap_null_cap);
    /* Haskell error: "cteMove: mdb entry must be empty" */
    assert((cte_t*)mdb_node_get_mdbNext(destSlot->cteMDBNode) == NULL &&
           (cte_t*)mdb_node_get_mdbPrev(destSlot->cteMDBNode) == NULL);

    mdb = srcSlot->cteMDBNode;
    destSlot->cap = newCap;
    srcSlot->cap = cap_null_cap_new();
    destSlot->cteMDBNode = mdb;
    srcSlot->cteMDBNode = nullMDBNode;

    prev_ptr = mdb_node_get_mdbPrev(mdb);
    if (prev_ptr)
        mdb_node_ptr_set_mdbNext(
            &CTE_PTR(prev_ptr)->cteMDBNode,
            CTE_REF(destSlot));

    next_ptr = mdb_node_get_mdbNext(mdb);
    if (next_ptr)
        mdb_node_ptr_set_mdbPrev(
            &CTE_PTR(next_ptr)->cteMDBNode,
            CTE_REF(destSlot));
}

void
capSwapForDelete(cte_t *slot1, cte_t *slot2)
{
    cap_t cap1, cap2;

    if (slot1 == slot2) {
        return;
    }

    cap1 = slot1->cap;
    cap2 = slot2->cap;

    cteSwap(cap1, slot1, cap2, slot2);
}

void
cteSwap(cap_t cap1, cte_t *slot1, cap_t cap2, cte_t *slot2)
{
    mdb_node_t mdb1, mdb2;
    uint32_t next_ptr, prev_ptr;

    slot1->cap = cap2;
    slot2->cap = cap1;

    mdb1 = slot1->cteMDBNode;

    prev_ptr = mdb_node_get_mdbPrev(mdb1);
    if (prev_ptr)
        mdb_node_ptr_set_mdbNext(
            &CTE_PTR(prev_ptr)->cteMDBNode,
            CTE_REF(slot2));

    next_ptr = mdb_node_get_mdbNext(mdb1);
    if (next_ptr)
        mdb_node_ptr_set_mdbPrev(
            &CTE_PTR(next_ptr)->cteMDBNode,
            CTE_REF(slot2));

    mdb2 = slot2->cteMDBNode;
    slot1->cteMDBNode = mdb2;
    slot2->cteMDBNode = mdb1;

    prev_ptr = mdb_node_get_mdbPrev(mdb2);
    if (prev_ptr)
        mdb_node_ptr_set_mdbNext(
            &CTE_PTR(prev_ptr)->cteMDBNode,
            CTE_REF(slot1));

    next_ptr = mdb_node_get_mdbNext(mdb2);
    if (next_ptr)
        mdb_node_ptr_set_mdbPrev(
            &CTE_PTR(next_ptr)->cteMDBNode,
            CTE_REF(slot1));
}

exception_t
cteRevoke(cte_t *slot)
{
    cte_t *nextPtr;
    exception_t status;

    /* there is no need to check for a NullCap as NullCaps are
       always accompanied by null mdb pointers */
    for (nextPtr = CTE_PTR(mdb_node_get_mdbNext(slot->cteMDBNode));
            nextPtr && isMDBParentOf(slot, nextPtr);
            nextPtr = CTE_PTR(mdb_node_get_mdbNext(slot->cteMDBNode))) {
        status = cteDelete(nextPtr, true);
        if (status != EXCEPTION_NONE) {
            return status;
        }

        status = preemptionPoint();
        if (status != EXCEPTION_NONE) {
            return status;
        }
    }

    return EXCEPTION_NONE;
}

exception_t
cteDelete(cte_t *slot, bool_t exposed)
{
    finaliseSlot_ret_t fs_ret;

    fs_ret = finaliseSlot(slot, exposed);
    if (fs_ret.status != EXCEPTION_NONE) {
        return fs_ret.status;
    }

    if (exposed || fs_ret.success) {
        emptySlot(slot, fs_ret.irq);
    }
    return EXCEPTION_NONE;
}

static void
emptySlot(cte_t *slot, irq_t irq)
{
    if (cap_get_capType(slot->cap) != cap_null_cap) {
        mdb_node_t mdbNode;
        cte_t *prev, *next;

        mdbNode = slot->cteMDBNode;
        prev = CTE_PTR(mdb_node_get_mdbPrev(mdbNode));
        next = CTE_PTR(mdb_node_get_mdbNext(mdbNode));

        if (prev) {
            mdb_node_ptr_set_mdbNext(&prev->cteMDBNode, CTE_REF(next));
        }
        if (next) {
            mdb_node_ptr_set_mdbPrev(&next->cteMDBNode, CTE_REF(prev));
        }
        if (next)
            mdb_node_ptr_set_mdbFirstBadged(&next->cteMDBNode,
                                            mdb_node_get_mdbFirstBadged(next->cteMDBNode) ||
                                            mdb_node_get_mdbFirstBadged(mdbNode));
        slot->cap = cap_null_cap_new();
        slot->cteMDBNode = nullMDBNode;

        if (irq != irqInvalid) {
            deletedIRQHandler(irq);
        }
    }
}

static inline bool_t CONST
capRemovable(cap_t cap, cte_t* slot)
{
    switch (cap_get_capType(cap)) {
    case cap_null_cap:
        return true;
    case cap_zombie_cap: {
        word_t n = cap_zombie_cap_get_capZombieNumber(cap);
        cte_t* z_slot = (cte_t*)cap_zombie_cap_get_capZombiePtr(cap);
        return (n == 0 || (n == 1 && slot == z_slot));
    }
    default:
        fail("finaliseCap should only return Zombie or NullCap");
    }
}

static inline bool_t CONST
capCyclicZombie(cap_t cap, cte_t *slot)
{
    return cap_get_capType(cap) == cap_zombie_cap &&
           CTE_PTR(cap_zombie_cap_get_capZombiePtr(cap)) == slot;
}

static finaliseSlot_ret_t
finaliseSlot(cte_t *slot, bool_t immediate)
{
    bool_t final;
    finaliseCap_ret_t fc_ret;
    exception_t status;
    finaliseSlot_ret_t ret;

    while (cap_get_capType(slot->cap) != cap_null_cap) {
        final = isFinalCapability(slot);
        fc_ret = finaliseCap(slot->cap, final, false);

        if (capRemovable(fc_ret.remainder, slot)) {
            ret.status = EXCEPTION_NONE;
            ret.success = true;
            ret.irq = fc_ret.irq;
            return ret;
        }

        slot->cap = fc_ret.remainder;

        if (!immediate && capCyclicZombie(fc_ret.remainder, slot)) {
            ret.status = EXCEPTION_NONE;
            ret.success = false;
            ret.irq = fc_ret.irq;
            return ret;
        }

        status = reduceZombie(slot, immediate);
        if (status != EXCEPTION_NONE) {
            ret.status = status;
            ret.success = false;
            ret.irq = irqInvalid;
            return ret;
        }

        status = preemptionPoint();
        if (status != EXCEPTION_NONE) {
            ret.status = status;
            ret.success = false;
            ret.irq = irqInvalid;
            return ret;
        }
    }
    ret.status = EXCEPTION_NONE;
    ret.success = true;
    ret.irq = irqInvalid;
    return ret;
}

static exception_t
reduceZombie(cte_t* slot, bool_t immediate)
{
    cte_t* ptr;
    word_t n, type;
    exception_t status;

    assert(cap_get_capType(slot->cap) == cap_zombie_cap);
    ptr = (cte_t*)cap_zombie_cap_get_capZombiePtr(slot->cap);
    n = cap_zombie_cap_get_capZombieNumber(slot->cap);
    type = cap_zombie_cap_get_capZombieType(slot->cap);

    /* Haskell error: "reduceZombie: expected unremovable zombie" */
    assert(n > 0);

    if (immediate) {
        cte_t* endSlot = &ptr[n - 1];

        status = cteDelete(endSlot, false);
        if (status != EXCEPTION_NONE) {
            return status;
        }

        switch (cap_get_capType(slot->cap)) {
        case cap_null_cap:
            break;

        case cap_zombie_cap: {
            cte_t* ptr2 =
                (cte_t*)cap_zombie_cap_get_capZombiePtr(slot->cap);

            if (ptr == ptr2 &&
                    cap_zombie_cap_get_capZombieNumber(slot->cap) == n &&
                    cap_zombie_cap_get_capZombieType(slot->cap) == type) {
                assert(cap_get_capType(endSlot->cap) == cap_null_cap);
                slot->cap =
                    cap_zombie_cap_set_capZombieNumber(slot->cap, n - 1);
            } else {
                /* Haskell error:
                 * "Expected new Zombie to be self-referential."
                 */
                assert(ptr2 == slot && ptr != slot);
            }
            break;
        }

        default:
            fail("Expected recursion to result in Zombie.");
        }
    } else {
        /* Haskell error: "Cyclic zombie passed to unexposed reduceZombie" */
        assert(ptr != slot);

        if (cap_get_capType(ptr->cap) == cap_zombie_cap) {
            /* Haskell error: "Moving self-referential Zombie aside." */
            assert(ptr != CTE_PTR(cap_zombie_cap_get_capZombiePtr(ptr->cap)));
        }

        capSwapForDelete(ptr, slot);
    }
    return EXCEPTION_NONE;
}

void
cteDeleteOne(cte_t* slot)
{
    if (cap_get_capType(slot->cap) != cap_null_cap) {
        bool_t final;
        finaliseCap_ret_t fc_ret UNUSED;

        final = isFinalCapability(slot);
        fc_ret = finaliseCap(slot->cap, final, true);
        /* Haskell error: "cteDeleteOne: cap should be removable" */
        assert(capRemovable(fc_ret.remainder, slot) &&
               fc_ret.irq == irqInvalid);
        emptySlot(slot, irqInvalid);
    }
}

exception_t
cteRecycle(cte_t* slot)
{
    exception_t status;
    finaliseSlot_ret_t fc_ret;

    status = cteRevoke(slot);
    if (status != EXCEPTION_NONE) {
        return status;
    }

    fc_ret = finaliseSlot(slot, true);
    if (fc_ret.status != EXCEPTION_NONE) {
        return fc_ret.status;
    }

    if (cap_get_capType(slot->cap) != cap_null_cap) {
        cap_t new_cap;
        bool_t is_final;

        is_final = isFinalCapability(slot);
        new_cap = recycleCap(is_final, slot->cap);
        slot->cap = new_cap;
    }

    return EXCEPTION_NONE;
}

void
insertNewCap(cte_t *parent, cte_t *slot, cap_t cap)
{
    cte_t *next;

    next = CTE_PTR(mdb_node_get_mdbNext(parent->cteMDBNode));
    slot->cap = cap;
    slot->cteMDBNode = mdb_node_new(CTE_REF(next), true, true, CTE_REF(parent));
    if (next) {
        mdb_node_ptr_set_mdbPrev(&next->cteMDBNode, CTE_REF(slot));
    }
    mdb_node_ptr_set_mdbNext(&parent->cteMDBNode, CTE_REF(slot));
}

void
setupReplyMaster(tcb_t *thread)
{
    cte_t *slot;

    slot = TCB_PTR_CTE_PTR(thread, tcbReply);
    if (cap_get_capType(slot->cap) == cap_null_cap) {
        /* Haskell asserts that no reply caps exist for this thread here. This
         * cannot be translated. */
        slot->cap = cap_reply_cap_new(true, TCB_REF(thread));
        slot->cteMDBNode = nullMDBNode;
        mdb_node_ptr_set_mdbRevocable(&slot->cteMDBNode, true);
        mdb_node_ptr_set_mdbFirstBadged(&slot->cteMDBNode, true);
    }
}

bool_t PURE
isMDBParentOf(cte_t *cte_a, cte_t *cte_b)
{
    if (!mdb_node_get_mdbRevocable(cte_a->cteMDBNode)) {
        return false;
    }
    if (!sameRegionAs(cte_a->cap, cte_b->cap)) {
        return false;
    }
    switch (cap_get_capType(cte_a->cap)) {
    case cap_endpoint_cap: {
        word_t badge;

        badge = cap_endpoint_cap_get_capEPBadge(cte_a->cap);
        if (badge == 0) {
            return true;
        }
        return (badge == cap_endpoint_cap_get_capEPBadge(cte_b->cap)) &&
               !mdb_node_get_mdbFirstBadged(cte_b->cteMDBNode);
        break;
    }

    case cap_async_endpoint_cap: {
        word_t badge;

        badge = cap_async_endpoint_cap_get_capAEPBadge(cte_a->cap);
        if (badge == 0) {
            return true;
        }
        return
            (badge == cap_async_endpoint_cap_get_capAEPBadge(cte_b->cap)) &&
            !mdb_node_get_mdbFirstBadged(cte_b->cteMDBNode);
        break;
    }

    default:
        return true;
        break;
    }
}

exception_t
ensureNoChildren(cte_t *slot)
{
    if (mdb_node_get_mdbNext(slot->cteMDBNode) != 0) {
        cte_t *next;

        next = CTE_PTR(mdb_node_get_mdbNext(slot->cteMDBNode));
        if (isMDBParentOf(slot, next)) {
            current_syscall_error.type = seL4_RevokeFirst;
            return EXCEPTION_SYSCALL_ERROR;
        }
    }

    return EXCEPTION_NONE;
}

exception_t
ensureEmptySlot(cte_t *slot)
{
    if (cap_get_capType(slot->cap) != cap_null_cap) {
        current_syscall_error.type = seL4_DeleteFirst;
        return EXCEPTION_SYSCALL_ERROR;
    }

    return EXCEPTION_NONE;
}

bool_t PURE
isFinalCapability(cte_t *cte)
{
    mdb_node_t mdb;
    bool_t prevIsSameObject;

    mdb = cte->cteMDBNode;

    if (mdb_node_get_mdbPrev(mdb) == 0) {
        prevIsSameObject = false;
    } else {
        cte_t *prev;

        prev = CTE_PTR(mdb_node_get_mdbPrev(mdb));
        prevIsSameObject = sameObjectAs(prev->cap, cte->cap);
    }

    if (prevIsSameObject) {
        return false;
    } else {
        if (mdb_node_get_mdbNext(mdb) == 0) {
            return true;
        } else {
            cte_t *next;

            next = CTE_PTR(mdb_node_get_mdbNext(mdb));
            return !sameObjectAs(cte->cap, next->cap);
        }
    }
}

bool_t PURE
slotCapLongRunningDelete(cte_t *slot)
{
    if (cap_get_capType(slot->cap) == cap_null_cap) {
        return false;
    } else if (! isFinalCapability(slot)) {
        return false;
    }
    switch (cap_get_capType(slot->cap)) {
    case cap_thread_cap:
    case cap_zombie_cap:
    case cap_cnode_cap:
        return true;
    default:
        return false;
    }
}

/* This implementation is specialised to the (current) limit
 * of one cap receive slot. */
cte_t *
getReceiveSlots(tcb_t *thread, word_t *buffer)
{
    cap_transfer_t ct;
    cptr_t cptr;
    lookupCap_ret_t luc_ret;
    lookupSlot_ret_t lus_ret;
    cte_t *slot;
    cap_t cnode;

    if (!buffer) {
        return NULL;
    }

    ct = loadCapTransfer(buffer);
    cptr = ct.ctReceiveRoot;

    luc_ret = lookupCap(thread, cptr);
    if (luc_ret.status != EXCEPTION_NONE) {
        return NULL;
    }
    cnode = luc_ret.cap;

    lus_ret = lookupTargetSlot(cnode, ct.ctReceiveIndex, ct.ctReceiveDepth);
    if (lus_ret.status != EXCEPTION_NONE) {
        return NULL;
    }
    slot = lus_ret.slot;

    if (cap_get_capType(slot->cap) != cap_null_cap) {
        return NULL;
    }

    return slot;
}

cap_transfer_t PURE
loadCapTransfer(word_t *buffer)
{
    const int offset = seL4_MsgMaxLength + seL4_MsgMaxExtraCaps + 2;
    return capTransferFromWords(buffer + offset);
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <types.h>
#include <kernel/thread.h>
#include <kernel/vspace.h>
#include <machine/registerset.h>
#include <model/statedata.h>
#include <object/asyncendpoint.h>
#include <object/cnode.h>
#include <object/endpoint.h>
#include <object/tcb.h>

static inline tcb_queue_t PURE
ep_ptr_get_queue(endpoint_t *epptr)
{
    tcb_queue_t queue;

    queue.head = (tcb_t*)endpoint_ptr_get_epQueue_head(epptr);
    queue.end = (tcb_t*)endpoint_ptr_get_epQueue_tail(epptr);

    return queue;
}

static inline void
ep_ptr_set_queue(endpoint_t *epptr, tcb_queue_t queue)
{
    endpoint_ptr_set_epQueue_head(epptr, (word_t)queue.head);
    endpoint_ptr_set_epQueue_tail(epptr, (word_t)queue.end);
}

void
sendIPC(bool_t blocking, bool_t do_call, word_t badge,
        bool_t canGrant, tcb_t *thread, endpoint_t *epptr)
{
    switch (endpoint_ptr_get_state(epptr)) {
    case EPState_Idle:
    case EPState_Send:
        if (blocking) {
            tcb_queue_t queue;

            /* Set thread state to BlockedOnSend */
            thread_state_ptr_set_tsType(&thread->tcbState,
                                        ThreadState_BlockedOnSend);
            thread_state_ptr_set_blockingIPCEndpoint(
                &thread->tcbState, EP_REF(epptr));
            thread_state_ptr_set_blockingIPCBadge(
                &thread->tcbState, badge);
            thread_state_ptr_set_blockingIPCCanGrant(
                &thread->tcbState, canGrant);
            thread_state_ptr_set_blockingIPCIsCall(
                &thread->tcbState, do_call);

            scheduleTCB(thread);

            /* Place calling thread in endpoint queue */
            queue = ep_ptr_get_queue(epptr);
            queue = tcbEPAppend(thread, queue);
            endpoint_ptr_set_state(epptr, EPState_Send);
            ep_ptr_set_queue(epptr, queue);
        }
        break;

    case EPState_Recv: {
        tcb_queue_t queue;
        tcb_t *dest;
        bool_t diminish;

        /* Get the head of the endpoint queue. */
        queue = ep_ptr_get_queue(epptr);
        dest = queue.head;

        /* Haskell error "Receive endpoint queue must not be empty" */
        assert(dest);

        /* Dequeue the first TCB */
        queue = tcbEPDequeue(dest, queue);
        ep_ptr_set_queue(epptr, queue);

        if (!queue.head) {
            endpoint_ptr_set_state(epptr, EPState_Idle);
        }

        /* Do the transfer */
        diminish =
            thread_state_get_blockingIPCDiminishCaps(dest->tcbState);
        doIPCTransfer(thread, epptr, badge, canGrant, dest, diminish);

        setThreadState(dest, ThreadState_Running);
        attemptSwitchTo(dest);

        if (do_call ||
                fault_ptr_get_faultType(&thread->tcbFault) != fault_null_fault) {
            if (canGrant && !diminish) {
                setupCallerCap(thread, dest);
            } else {
                setThreadState(thread, ThreadState_Inactive);
            }
        }

        break;
    }
    }
}

void
receiveIPC(tcb_t *thread, cap_t cap)
{
    endpoint_t *epptr;
    bool_t diminish;

    /* Haskell error "receiveIPC: invalid cap" */
    assert(cap_get_capType(cap) == cap_endpoint_cap);

    epptr = EP_PTR(cap_endpoint_cap_get_capEPPtr(cap));
    diminish = !cap_endpoint_cap_get_capCanSend(cap);

    switch (endpoint_ptr_get_state(epptr)) {
    case EPState_Idle:
    case EPState_Recv: {
        tcb_queue_t queue;

        /* Set thread state to BlockedOnReceive */
        thread_state_ptr_set_tsType(&thread->tcbState,
                                    ThreadState_BlockedOnReceive);
        thread_state_ptr_set_blockingIPCEndpoint(
            &thread->tcbState, EP_REF(epptr));
        thread_state_ptr_set_blockingIPCDiminishCaps(
            &thread->tcbState, diminish);

        scheduleTCB(thread);

        /* Place calling thread in endpoint queue */
        queue = ep_ptr_get_queue(epptr);
        queue = tcbEPAppend(thread, queue);
        endpoint_ptr_set_state(epptr, EPState_Recv);
        ep_ptr_set_queue(epptr, queue);
        break;
    }

    case EPState_Send: {
        tcb_queue_t queue;
        tcb_t *sender;
        word_t badge;
        bool_t canGrant;
        bool_t do_call;

        /* Get the head of the endpoint queue. */
        queue = ep_ptr_get_queue(epptr);
        sender = queue.head;

        /* Haskell error "Send endpoint queue must not be empty" */
        assert(sender);

        /* Dequeue the first TCB */
        queue = tcbEPDequeue(sender, queue);
        ep_ptr_set_queue(epptr, queue);

        if (!queue.head) {
            endpoint_ptr_set_state(epptr, EPState_Idle);
        }

        /* Get sender IPC details */
        badge = thread_state_ptr_get_blockingIPCBadge(&sender->tcbState);
        canGrant =
            thread_state_ptr_get_blockingIPCCanGrant(&sender->tcbState);

        /* Do the transfer */
        doIPCTransfer(sender, epptr, badge,
                      canGrant, thread, diminish);

        do_call = thread_state_ptr_get_blockingIPCIsCall(&sender->tcbState);

        if (do_call ||
                fault_get_faultType(sender->tcbFault) != fault_null_fault) {
            if (canGrant && !diminish) {
                setupCallerCap(sender, thread);
            } else {
                setThreadState(sender, ThreadState_Inactive);
            }
        } else {
            setThreadState(sender, ThreadState_Running);
            switchIfRequiredTo(sender);
        }

        break;
    }
    }
}

void
replyFromKernel_error(tcb_t *thread)
{
    unsigned int len;
    word_t *ipcBuffer;

    ipcBuffer = lookupIPCBuffer(true, thread);
    setRegister(thread, badgeRegister, 0);
    len = setMRs_syscall_error(thread, ipcBuffer);
    setRegister(thread, msgInfoRegister, wordFromMessageInfo(
                    message_info_new(current_syscall_error.type, 0, 0, len)));
}

void
replyFromKernel_success_empty(tcb_t *thread)
{
    setRegister(thread, badgeRegister, 0);
    setRegister(thread, msgInfoRegister, wordFromMessageInfo(
                    message_info_new(0, 0, 0, 0)));
}

void
ipcCancel(tcb_t *tptr)
{
    thread_state_t *state = &tptr->tcbState;

    switch (thread_state_ptr_get_tsType(state)) {
    case ThreadState_BlockedOnSend:
    case ThreadState_BlockedOnReceive: {
        /* blockedIPCCancel state */
        endpoint_t *epptr;
        tcb_queue_t queue;

        epptr = EP_PTR(thread_state_ptr_get_blockingIPCEndpoint(state));

        /* Haskell error "blockedIPCCancel: endpoint must not be idle" */
        assert(endpoint_ptr_get_state(epptr) != EPState_Idle);

        /* Dequeue TCB */
        queue = ep_ptr_get_queue(epptr);
        queue = tcbEPDequeue(tptr, queue);
        ep_ptr_set_queue(epptr, queue);

        if (!queue.head) {
            endpoint_ptr_set_state(epptr, EPState_Idle);
        }

        setThreadState(tptr, ThreadState_Inactive);
        break;
    }

    case ThreadState_BlockedOnAsyncEvent:
        asyncIPCCancel(tptr,
                       AEP_PTR(thread_state_ptr_get_blockingIPCEndpoint(state)));
        break;

    case ThreadState_BlockedOnReply: {
        cte_t *slot, *callerCap;

        fault_null_fault_ptr_new(&tptr->tcbFault);

        /* Get the reply cap slot */
        slot = TCB_PTR_CTE_PTR(tptr, tcbReply);

        callerCap = CTE_PTR(mdb_node_get_mdbNext(slot->cteMDBNode));
        if (callerCap) {
            cteDeleteOne(callerCap);
        }

        break;
    }
    }
}

void
epCancelAll(endpoint_t *epptr)
{
    switch (endpoint_ptr_get_state(epptr)) {
    case EPState_Idle:
        break;

    default: {
        tcb_t *thread = TCB_PTR(endpoint_ptr_get_epQueue_head(epptr));

        /* Make endpoint idle */
        endpoint_ptr_set_state(epptr, EPState_Idle);
        endpoint_ptr_set_epQueue_head(epptr, 0);
        endpoint_ptr_set_epQueue_tail(epptr, 0);

        /* Set all blocked threads to restart */
        for (; thread; thread = thread->tcbEPNext) {
            setThreadState (thread, ThreadState_Restart);
            tcbSchedEnqueue(thread);
        }

        rescheduleRequired();
        break;
    }
    }
}

void
epCancelBadgedSends(endpoint_t *epptr, word_t badge)
{
    switch (endpoint_ptr_get_state(epptr)) {
    case EPState_Idle:
    case EPState_Recv:
        break;

    case EPState_Send: {
        tcb_t *thread, *next;
        tcb_queue_t queue = ep_ptr_get_queue(epptr);

        /* this is a de-optimisation for verification
         * reasons. it allows the contents of the endpoint
         * queue to be ignored during the for loop. */
        endpoint_ptr_set_state(epptr, EPState_Idle);
        endpoint_ptr_set_epQueue_head(epptr, 0);
        endpoint_ptr_set_epQueue_tail(epptr, 0);

        for (thread = queue.head; thread; thread = next) {
            word_t b = thread_state_ptr_get_blockingIPCBadge(
                           &thread->tcbState);
            next = thread->tcbEPNext;
            if (b == badge) {
                setThreadState(thread, ThreadState_Restart);
                tcbSchedEnqueue(thread);
                queue = tcbEPDequeue(thread, queue);
            }
        }
        ep_ptr_set_queue(epptr, queue);

        if (queue.head) {
            endpoint_ptr_set_state(epptr, EPState_Send);
        }

        rescheduleRequired();

        break;
    }

    default:
        fail("invalid EP state");
    }
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <assert.h>
#include <types.h>
#include <api/failures.h>
#include <api/invocation.h>
#include <api/syscall.h>
#include <machine/io.h>
#include <object/structures.h>
#include <object/interrupt.h>
#include <object/cnode.h>
#include <object/asyncendpoint.h>
#include <kernel/cspace.h>
#include <kernel/thread.h>
#include <model/statedata.h>

exception_t
decodeIRQControlInvocation(word_t label, unsigned int length,
                           cte_t *srcSlot, extra_caps_t extraCaps,
                           word_t *buffer)
{
    if (label == IRQIssueIRQHandler) {
        word_t index, depth, irq_w;
        irq_t irq;
        cte_t *destSlot;
        cap_t cnodeCap;
        lookupSlot_ret_t lu_ret;
        exception_t status;

        if (length < 3 || extraCaps.excaprefs[0] == NULL) {
            current_syscall_error.type = seL4_TruncatedMessage;
            return EXCEPTION_SYSCALL_ERROR;
        }
        irq_w = getSyscallArg(0, buffer);
        irq = (irq_t) irq_w;
        index = getSyscallArg(1, buffer);
        depth = getSyscallArg(2, buffer);

        cnodeCap = extraCaps.excaprefs[0]->cap;

        if (irq_w > maxIRQ) {
            current_syscall_error.type = seL4_RangeError;
            current_syscall_error.rangeErrorMin = 0;
            current_syscall_error.rangeErrorMax = maxIRQ;
            return EXCEPTION_SYSCALL_ERROR;
        }

        if (isIRQActive(irq)) {
            current_syscall_error.type = seL4_RevokeFirst;
            return EXCEPTION_SYSCALL_ERROR;
        }

        lu_ret = lookupTargetSlot(cnodeCap, index, depth);
        if (lu_ret.status != EXCEPTION_NONE) {
            return lu_ret.status;
        }
        destSlot = lu_ret.slot;

        status = ensureEmptySlot(destSlot);
        if (status != EXCEPTION_NONE) {
            return status;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        return invokeIRQControl(irq, destSlot, srcSlot);
    } else if (label == IRQInterruptControl) {
        return Arch_decodeInterruptControl(length, extraCaps);
    } else {
        userError("IRQControl: Illegal operation.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }
}

exception_t
invokeIRQControl(irq_t irq, cte_t *handlerSlot, cte_t *controlSlot)
{
    setIRQState(IRQNotifyAEP, irq);
    cteInsert(cap_irq_handler_cap_new(irq), controlSlot, handlerSlot);

    return EXCEPTION_NONE;
}

exception_t
decodeIRQHandlerInvocation(word_t label, irq_t irq,
                           extra_caps_t extraCaps)
{
    switch (label) {
    case IRQAckIRQ:
        setThreadState(ksCurThread, ThreadState_Restart);
        invokeIRQHandler_AckIRQ(irq);
        return EXCEPTION_NONE;

    case IRQSetIRQHandler: {
        cap_t aepCap;
        cte_t *slot;

        if (extraCaps.excaprefs[0] == NULL) {
            current_syscall_error.type = seL4_TruncatedMessage;
            return EXCEPTION_SYSCALL_ERROR;
        }
        aepCap = extraCaps.excaprefs[0]->cap;
        slot = extraCaps.excaprefs[0];

        if (cap_get_capType(aepCap) != cap_async_endpoint_cap ||
                !cap_async_endpoint_cap_get_capAEPCanSend(aepCap)) {
            if (cap_get_capType(aepCap) != cap_async_endpoint_cap) {
                userError("IRQSetHandler: provided cap is not an async endpoint capablity.");
            } else {
                userError("IRQSetHandler: caller does not have send rights on the endpoint.");
            }
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        invokeIRQHandler_SetIRQHandler(irq, aepCap, slot);
        return EXCEPTION_NONE;
    }

    case IRQClearIRQHandler:
        setThreadState(ksCurThread, ThreadState_Restart);
        invokeIRQHandler_ClearIRQHandler(irq);
        return EXCEPTION_NONE;

    default:
        userError("IRQHandler: Illegal operation.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }
}

void
invokeIRQHandler_AckIRQ(irq_t irq)
{
    maskInterrupt(false, irq);
}

void
invokeIRQHandler_SetIRQHandler(irq_t irq, cap_t cap, cte_t *slot)
{
    cte_t *irqSlot;

    irqSlot = intStateIRQNode + irq;
    cteDeleteOne(irqSlot);
    cteInsert(cap, slot, irqSlot);
}

void
invokeIRQHandler_ClearIRQHandler(irq_t irq)
{
    cte_t *irqSlot;

    irqSlot = intStateIRQNode + irq;
    cteDeleteOne(irqSlot);
}

void
deletingIRQHandler(irq_t irq)
{
    cte_t *slot;

    slot = intStateIRQNode + irq;
    cteDeleteOne(slot);
}

void
deletedIRQHandler(irq_t irq)
{
    setIRQState(IRQInactive, irq);
}

void
handleInterrupt(irq_t irq)
{
    switch (intStateIRQTable[irq]) {
    case IRQNotifyAEP: {
        cap_t cap;

        cap = intStateIRQNode[irq].cap;

        if (cap_get_capType(cap) == cap_async_endpoint_cap &&
                cap_async_endpoint_cap_get_capAEPCanSend(cap)) {
            sendAsyncIPC(AEP_PTR(cap_async_endpoint_cap_get_capAEPPtr(cap)),
                         cap_async_endpoint_cap_get_capAEPBadge(cap),
                         (((uint32_t) 1) << (irq % WORD_BITS)));
        } else {
#ifdef CONFIG_IRQ_REPORTING
            printf("Undelivered IRQ: %d\n", (int)irq);
#endif
        }
        maskInterrupt(true, irq);
        break;
    }

    case IRQTimer:
        timerTick();
        resetTimer();
        break;

    case IRQReserved:
        handleReservedIRQ(irq);
        break;

    case IRQInactive:
        /*
         * This case shouldn't happen anyway unless the hardware or
         * platform code is broken. Hopefully masking it again should make
         * the interrupt go away.
         */
        maskInterrupt(true, irq);
#ifdef CONFIG_IRQ_REPORTING
        printf("Received disabled IRQ: %d\n", (int)irq);
#endif
        break;

    default:
        /* No corresponding haskell error */
        fail("Invalid IRQ state");
    }

    ackInterrupt(irq);
}

bool_t
isIRQActive(irq_t irq)
{
    return intStateIRQTable[irq] != IRQInactive;
}

void
setIRQState(irq_state_t irqState, irq_t irq)
{
    intStateIRQTable[irq] = irqState;
    maskInterrupt(irqState == IRQInactive, irq);
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <assert.h>
#include <config.h>
#include <types.h>
#include <api/failures.h>
#include <api/syscall.h>
#include <arch/object/objecttype.h>
#include <machine/io.h>
#include <object/objecttype.h>
#include <object/structures.h>
#include <object/asyncendpoint.h>
#include <object/endpoint.h>
#include <object/cnode.h>
#include <object/interrupt.h>
#include <object/tcb.h>
#include <object/untyped.h>
#include <model/preemption.h>
#include <model/statedata.h>
#include <kernel/thread.h>
#include <kernel/vspace.h>
#include <machine.h>
#include <util.h>

word_t getObjectSize(word_t t, word_t userObjSize)
{
    if (t >= seL4_NonArchObjectTypeCount) {
        return Arch_getObjectSize(t);
    } else {
        switch (t) {
        case seL4_TCBObject:
            return TCB_BLOCK_SIZE_BITS;
        case seL4_EndpointObject:
            return EP_SIZE_BITS;
        case seL4_AsyncEndpointObject:
            return AEP_SIZE_BITS;
        case seL4_CapTableObject:
            return CTE_SIZE_BITS + userObjSize;
        case seL4_UntypedObject:
            return userObjSize;
        default:
            fail("Invalid object type");
            return 0;
        }
    }
}

deriveCap_ret_t
deriveCap(cte_t *slot, cap_t cap)
{
    deriveCap_ret_t ret;

    if (isArchCap(cap)) {
        return Arch_deriveCap(slot, cap);
    }

    switch (cap_get_capType(cap)) {
    case cap_zombie_cap:
        ret.status = EXCEPTION_NONE;
        ret.cap = cap_null_cap_new();
        break;

    case cap_irq_control_cap:
        ret.status = EXCEPTION_NONE;
        ret.cap = cap_null_cap_new();
        break;

    case cap_untyped_cap:
        ret.status = ensureNoChildren(slot);
        if (ret.status != EXCEPTION_NONE) {
            ret.cap = cap_null_cap_new();
        } else {
            ret.cap = cap;
        }
        break;

    case cap_reply_cap:
        ret.status = EXCEPTION_NONE;
        ret.cap = cap_null_cap_new();
        break;

    default:
        ret.status = EXCEPTION_NONE;
        ret.cap = cap;
    }

    return ret;
}

finaliseCap_ret_t
finaliseCap(cap_t cap, bool_t final, bool_t exposed)
{
    finaliseCap_ret_t fc_ret;

    if (isArchCap(cap)) {
        fc_ret.remainder = Arch_finaliseCap(cap, final);
        fc_ret.irq = irqInvalid;
        return fc_ret;
    }

    switch (cap_get_capType(cap)) {
    case cap_endpoint_cap:
        if (final) {
            epCancelAll(EP_PTR(cap_endpoint_cap_get_capEPPtr(cap)));
        }

        fc_ret.remainder = cap_null_cap_new();
        fc_ret.irq = irqInvalid;
        return fc_ret;

    case cap_async_endpoint_cap:
        if (final) {
            aepCancelAll(AEP_PTR(
                             cap_async_endpoint_cap_get_capAEPPtr(cap)));
        }
        fc_ret.remainder = cap_null_cap_new();
        fc_ret.irq = irqInvalid;
        return fc_ret;

    case cap_reply_cap:
    case cap_null_cap:
    case cap_domain_cap:
        fc_ret.remainder = cap_null_cap_new();
        fc_ret.irq = irqInvalid;
        return fc_ret;
    }

    if (exposed) {
        fail("finaliseCap: failed to finalise immediately.");
    }

    switch (cap_get_capType(cap)) {
    case cap_cnode_cap: {
        if (final) {
            fc_ret.remainder =
                Zombie_new(
                    1 << cap_cnode_cap_get_capCNodeRadix(cap),
                    cap_cnode_cap_get_capCNodeRadix(cap),
                    cap_cnode_cap_get_capCNodePtr(cap)
                );
            fc_ret.irq = irqInvalid;
            return fc_ret;
        }
        break;
    }

    case cap_thread_cap: {
        if (final) {
            tcb_t *tcb;
            cte_t *cte_ptr;

            tcb = TCB_PTR(cap_thread_cap_get_capTCBPtr(cap));
            cte_ptr = TCB_PTR_CTE_PTR(tcb, tcbCTable);
            suspend(tcb);
            Arch_prepareThreadDelete(tcb);
            fc_ret.remainder =
                Zombie_new(
                    tcbCNodeEntries,
                    ZombieType_ZombieTCB,
                    CTE_REF(cte_ptr)
                );
            fc_ret.irq = irqInvalid;
            return fc_ret;
        }
        break;
    }

    case cap_zombie_cap:
        fc_ret.remainder = cap;
        fc_ret.irq = irqInvalid;
        return fc_ret;

    case cap_irq_handler_cap:
        if (final) {
            irq_t irq = cap_irq_handler_cap_get_capIRQ(cap);

            deletingIRQHandler(irq);

            fc_ret.remainder = cap_null_cap_new();
            fc_ret.irq = irq;
            return fc_ret;
        }
        break;
    }

    fc_ret.remainder = cap_null_cap_new();
    fc_ret.irq = irqInvalid;
    return fc_ret;
}

cap_t
recycleCap(bool_t is_final, cap_t cap)
{
    if (isArchCap(cap)) {
        return Arch_recycleCap(is_final, cap);
    }

    switch (cap_get_capType(cap)) {
    case cap_null_cap:
        fail("recycleCap: can't reconstruct Null");
        break;
    case cap_domain_cap:
        return cap;
    case cap_cnode_cap:
        return cap;
    case cap_thread_cap:
        return cap;
    case cap_zombie_cap: {
        word_t type;

        type = cap_zombie_cap_get_capZombieType(cap);
        if (type == ZombieType_ZombieTCB) {
            tcb_t *tcb;
            _thread_state_t ts UNUSED;

            tcb = TCB_PTR(cap_zombie_cap_get_capZombiePtr(cap)
                          + TCB_OFFSET);
            ts = thread_state_get_tsType(tcb->tcbState);
            /* Haskell error:
             * "Zombie cap should point at inactive thread" */
            assert(ts == ThreadState_Inactive ||
                   ts != ThreadState_IdleThreadState);
            /* Haskell error:
             * "Zombie cap should not point at queued thread" */
            assert(!thread_state_get_tcbQueued(tcb->tcbState));

            /* makeObject doesn't exist in C, objects are initialised by
             * zeroing. The effect of recycle in Haskell is to reinitialise
             * the TCB, with the exception of the TCB CTEs.  I achieve this
             * here by zeroing the TCB part of the structure, while leaving
             * the CNode alone. */
            memzero(tcb, sizeof (tcb_t));
            Arch_initContext(&tcb->tcbContext);
            tcb->tcbTimeSlice = CONFIG_TIME_SLICE;
            tcb->tcbDomain = ksCurDomain;

            return cap_thread_cap_new(TCB_REF(tcb));
        } else {
            return cap_cnode_cap_new(type, 0, 0,
                                     cap_zombie_cap_get_capZombiePtr(cap));
        }
    }
    case cap_endpoint_cap: {
        word_t badge = cap_endpoint_cap_get_capEPBadge(cap);
        if (badge) {
            endpoint_t* ep = (endpoint_t*)
                             cap_endpoint_cap_get_capEPPtr(cap);
            epCancelBadgedSends(ep, badge);
        }
        return cap;
    }
    default:
        return cap;
    }
}

bool_t CONST
hasRecycleRights(cap_t cap)
{
    switch (cap_get_capType(cap)) {
    case cap_null_cap:
    case cap_domain_cap:
        return false;

    case cap_endpoint_cap:
        return cap_endpoint_cap_get_capCanSend(cap) &&
               cap_endpoint_cap_get_capCanReceive(cap) &&
               cap_endpoint_cap_get_capCanGrant(cap);

    case cap_async_endpoint_cap:
        return cap_async_endpoint_cap_get_capAEPCanSend(cap) &&
               cap_async_endpoint_cap_get_capAEPCanReceive(cap);

    default:
        if (isArchCap(cap)) {
            return Arch_hasRecycleRights(cap);
        } else {
            return true;
        }
    }
}

bool_t CONST
sameRegionAs(cap_t cap_a, cap_t cap_b)
{
    switch (cap_get_capType(cap_a)) {
    case cap_untyped_cap: {
        word_t aBase, bBase, aTop, bTop;

        aBase = (word_t)WORD_PTR(cap_untyped_cap_get_capPtr(cap_a));
        bBase = (word_t)cap_get_capPtr(cap_b);

        aTop = aBase + MASK(cap_untyped_cap_get_capBlockSize(cap_a));
        bTop = bBase + MASK(cap_get_capSizeBits(cap_b));

        return ((bBase != 0) && (aBase <= bBase) &&
                (bTop <= aTop) && (bBase <= bTop));
    }

    case cap_endpoint_cap:
        if (cap_get_capType(cap_b) == cap_endpoint_cap) {
            return cap_endpoint_cap_get_capEPPtr(cap_a) ==
                   cap_endpoint_cap_get_capEPPtr(cap_b);
        }
        break;

    case cap_async_endpoint_cap:
        if (cap_get_capType(cap_b) == cap_async_endpoint_cap) {
            return cap_async_endpoint_cap_get_capAEPPtr(cap_a) ==
                   cap_async_endpoint_cap_get_capAEPPtr(cap_b);
        }
        break;

    case cap_cnode_cap:
        if (cap_get_capType(cap_b) == cap_cnode_cap) {
            return (cap_cnode_cap_get_capCNodePtr(cap_a) ==
                    cap_cnode_cap_get_capCNodePtr(cap_b)) &&
                   (cap_cnode_cap_get_capCNodeRadix(cap_a) ==
                    cap_cnode_cap_get_capCNodeRadix(cap_b));
        }
        break;

    case cap_thread_cap:
        if (cap_get_capType(cap_b) == cap_thread_cap) {
            return cap_thread_cap_get_capTCBPtr(cap_a) ==
                   cap_thread_cap_get_capTCBPtr(cap_b);
        }
        break;

    case cap_reply_cap:
        if (cap_get_capType(cap_b) == cap_reply_cap) {
            return cap_reply_cap_get_capTCBPtr(cap_a) ==
                   cap_reply_cap_get_capTCBPtr(cap_b);
        }
        break;

    case cap_domain_cap:
        if (cap_get_capType(cap_b) == cap_domain_cap) {
            return true;
        }
        break;

    case cap_irq_control_cap:
        if (cap_get_capType(cap_b) == cap_irq_control_cap ||
                cap_get_capType(cap_b) == cap_irq_handler_cap) {
            return true;
        }
        break;

    case cap_irq_handler_cap:
        if (cap_get_capType(cap_b) == cap_irq_handler_cap) {
            return (irq_t)cap_irq_handler_cap_get_capIRQ(cap_a) ==
                   (irq_t)cap_irq_handler_cap_get_capIRQ(cap_b);
        }
        break;

    default:
        if (isArchCap(cap_a) &&
                isArchCap(cap_b)) {
            return Arch_sameRegionAs(cap_a, cap_b);
        }
        break;
    }

    return false;
}

bool_t CONST
sameObjectAs(cap_t cap_a, cap_t cap_b)
{
    if (cap_get_capType(cap_a) == cap_untyped_cap) {
        return false;
    }
    if (cap_get_capType(cap_a) == cap_irq_control_cap &&
            cap_get_capType(cap_b) == cap_irq_handler_cap) {
        return false;
    }
    if (isArchCap(cap_a) && isArchCap(cap_b)) {
        return Arch_sameObjectAs(cap_a, cap_b);
    }
    return sameRegionAs(cap_a, cap_b);
}

cap_t CONST
updateCapData(bool_t preserve, word_t newData, cap_t cap)
{
    if (isArchCap(cap)) {
        return Arch_updateCapData(preserve, newData, cap);
    }

    switch (cap_get_capType(cap)) {
    case cap_endpoint_cap:
        if (!preserve && cap_endpoint_cap_get_capEPBadge(cap) == 0) {
            return cap_endpoint_cap_set_capEPBadge(cap, newData);
        } else {
            return cap_null_cap_new();
        }

    case cap_async_endpoint_cap:
        if (!preserve && cap_async_endpoint_cap_get_capAEPBadge(cap) == 0) {
            return cap_async_endpoint_cap_set_capAEPBadge(cap, newData);
        } else {
            return cap_null_cap_new();
        }

    case cap_cnode_cap: {
        word_t guard, guardSize;
        cnode_capdata_t w = { .words = { newData } };

        guardSize = cnode_capdata_get_guardSize(w);

        if (guardSize + cap_cnode_cap_get_capCNodeRadix(cap) > wordBits) {
            return cap_null_cap_new();
        } else {
            cap_t new_cap;

            guard = cnode_capdata_get_guard(w) & MASK(guardSize);
            new_cap = cap_cnode_cap_set_capCNodeGuard(cap, guard);
            new_cap = cap_cnode_cap_set_capCNodeGuardSize(new_cap,
                                                          guardSize);

            return new_cap;
        }
    }

    default:
        return cap;
    }
}

cap_t CONST
maskCapRights(cap_rights_t cap_rights, cap_t cap)
{
    if (isArchCap(cap)) {
        return Arch_maskCapRights(cap_rights, cap);
    }

    switch (cap_get_capType(cap)) {
    case cap_null_cap:
    case cap_domain_cap:
    case cap_cnode_cap:
    case cap_untyped_cap:
    case cap_reply_cap:
    case cap_irq_control_cap:
    case cap_irq_handler_cap:
    case cap_zombie_cap:
    case cap_thread_cap:
        return cap;

    case cap_endpoint_cap: {
        cap_t new_cap;

        new_cap = cap_endpoint_cap_set_capCanSend(
                      cap, cap_endpoint_cap_get_capCanSend(cap) &
                      cap_rights_get_capAllowWrite(cap_rights));
        new_cap = cap_endpoint_cap_set_capCanReceive(
                      new_cap, cap_endpoint_cap_get_capCanReceive(cap) &
                      cap_rights_get_capAllowRead(cap_rights));
        new_cap = cap_endpoint_cap_set_capCanGrant(
                      new_cap, cap_endpoint_cap_get_capCanGrant(cap) &
                      cap_rights_get_capAllowGrant(cap_rights));

        return new_cap;
    }

    case cap_async_endpoint_cap: {
        cap_t new_cap;

        new_cap = cap_async_endpoint_cap_set_capAEPCanSend(
                      cap, cap_async_endpoint_cap_get_capAEPCanSend(cap) &
                      cap_rights_get_capAllowWrite(cap_rights));
        new_cap = cap_async_endpoint_cap_set_capAEPCanReceive(new_cap,
                                                              cap_async_endpoint_cap_get_capAEPCanReceive(cap) &
                                                              cap_rights_get_capAllowRead(cap_rights));

        return new_cap;
    }

    default:
        fail("Invalid cap type"); /* Sentinel for invalid enums */
    }
}

cap_t
createObject(object_t t, void *regionBase, word_t userSize)
{
    /* Handle architecture-specific objects. */
    if (t >= (object_t) seL4_NonArchObjectTypeCount) {
        return Arch_createObject(t, regionBase, userSize);
    }

    /* Create objects. */
    switch ((api_object_t)t) {
    case seL4_TCBObject: {
        tcb_t *tcb;
        memzero(regionBase, 1UL << TCB_BLOCK_SIZE_BITS);
        tcb = TCB_PTR((word_t)regionBase + TCB_OFFSET);
        /** AUXUPD: "(True, ptr_retyps 5
          (Ptr ((ptr_val \<acute>tcb) - 0x100) :: cte_C ptr)
            o (ptr_retyp \<acute>tcb))" */

        /* Setup non-zero parts of the TCB. */

        Arch_initContext(&tcb->tcbContext);
        tcb->tcbTimeSlice = CONFIG_TIME_SLICE;
        tcb->tcbDomain = ksCurDomain;

        return cap_thread_cap_new(TCB_REF(tcb));
    }

    case seL4_EndpointObject:
        memzero(regionBase, 1UL << EP_SIZE_BITS);
        /** AUXUPD: "(True, ptr_retyp
          (Ptr (ptr_val \<acute>regionBase) :: endpoint_C ptr))" */
        return cap_endpoint_cap_new(0, true, true, true,
                                    EP_REF(regionBase));

    case seL4_AsyncEndpointObject:
        memzero(regionBase, 1UL << AEP_SIZE_BITS);
        /** AUXUPD: "(True, ptr_retyp
              (Ptr (ptr_val \<acute>regionBase) :: async_endpoint_C ptr))" */
        return cap_async_endpoint_cap_new(0, true, true,
                                          AEP_REF(regionBase));

    case seL4_CapTableObject:
        memzero(regionBase, 1UL << (CTE_SIZE_BITS + userSize));
        /** AUXUPD: "(True, ptr_retyps (2 ^ (unat \<acute>userSize))
          (Ptr (ptr_val \<acute>regionBase) :: cte_C ptr))" */
        /** GHOSTUPD: "(True, gs_new_cnodes (unat \<acute>userSize)
                                (ptr_val \<acute>regionBase)
                                (4 + unat \<acute>userSize))" */
        return cap_cnode_cap_new(userSize, 0, 0, CTE_REF(regionBase));

    case seL4_UntypedObject:
        /*
         * No objects need to be created; instead, just insert caps into
         * the destination slots.
         */
        return cap_untyped_cap_new(0, userSize, WORD_REF(regionBase));

    default:
        fail("Invalid object type");
    }
}

void
createNewObjects(object_t t, cte_t *parent, slot_range_t slots,
                 void *regionBase, word_t userSize)
{
    word_t objectSize;
    void *nextFreeArea;
    unsigned int i;

    /* Create the objects. */
    nextFreeArea = regionBase;
    objectSize = getObjectSize(t, userSize);
    for (i = 0; i < slots.length; i++) {
        /* Create the object. */
        /** AUXUPD: "(True, typ_region_bytes (ptr_val \<acute> nextFreeArea + ((\<acute> i) << unat (\<acute> objectSize))) (unat (\<acute> objectSize)))" */
        cap_t cap = createObject(t, (void *)((word_t)nextFreeArea + (i << objectSize)), userSize);

        /* Insert the cap into the user's cspace. */
        insertNewCap(parent, &slots.cnode[slots.offset + i], cap);

        /* Move along to the next region of memory. been merged into a formula of i */
    }
}

exception_t
decodeInvocation(word_t label, unsigned int length,
                 cptr_t capIndex, cte_t *slot, cap_t cap,
                 extra_caps_t extraCaps, bool_t block, bool_t call,
                 word_t *buffer)
{
    if (isArchCap(cap)) {
        return Arch_decodeInvocation(label, length, capIndex,
                                     slot, cap, extraCaps, buffer);
    }

    switch (cap_get_capType(cap)) {
    case cap_null_cap:
        userError("Attempted to invoke a null cap #%u.", capIndex);
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;

    case cap_zombie_cap:
        userError("Attempted to invoke a zombie cap #%u.", capIndex);
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;

    case cap_endpoint_cap:
        if (unlikely(!cap_endpoint_cap_get_capCanSend(cap))) {
            userError("Attempted to invoke a read-only endpoint cap #%u.",
                      capIndex);
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        return performInvocation_Endpoint(
                   EP_PTR(cap_endpoint_cap_get_capEPPtr(cap)),
                   cap_endpoint_cap_get_capEPBadge(cap),
                   cap_endpoint_cap_get_capCanGrant(cap), block, call);

    case cap_async_endpoint_cap: {
        word_t msg;

        if (unlikely(!cap_async_endpoint_cap_get_capAEPCanSend(cap))) {
            userError("Attempted to invoke a read-only async-endpoint cap #%u.",
                      capIndex);
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }

        if (length == 0) {
            msg = 0;
        } else {
            msg = getSyscallArg(0, buffer);
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        return performInvocation_AsyncEndpoint(
                   AEP_PTR(cap_async_endpoint_cap_get_capAEPPtr(cap)),
                   cap_async_endpoint_cap_get_capAEPBadge(cap), msg);
    }

    case cap_reply_cap:
        if (unlikely(cap_reply_cap_get_capReplyMaster(cap))) {
            userError("Attempted to invoke an invalid reply cap #%u.",
                      capIndex);
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        return performInvocation_Reply(
                   TCB_PTR(cap_reply_cap_get_capTCBPtr(cap)), slot);

    case cap_thread_cap:
        return decodeTCBInvocation(label, length, cap,
                                   slot, extraCaps, call, buffer);

    case cap_domain_cap:
        return decodeDomainInvocation(label, length, extraCaps, buffer);

    case cap_cnode_cap:
        return decodeCNodeInvocation(label, length, cap, extraCaps, buffer);

    case cap_untyped_cap:
        return decodeUntypedInvocation(label, length, slot, cap, extraCaps,
                                       call, buffer);

    case cap_irq_control_cap:
        return decodeIRQControlInvocation(label, length, slot,
                                          extraCaps, buffer);

    case cap_irq_handler_cap:
        return decodeIRQHandlerInvocation(label,
                                          cap_irq_handler_cap_get_capIRQ(cap), extraCaps);

    default:
        fail("Invalid cap type");
    }
}

exception_t
performInvocation_Endpoint(endpoint_t *ep, word_t badge,
                           bool_t canGrant, bool_t block,
                           bool_t call)
{
    sendIPC(block, call, badge, canGrant, ksCurThread, ep);

    return EXCEPTION_NONE;
}

exception_t
performInvocation_AsyncEndpoint(async_endpoint_t *aep, word_t badge,
                                word_t message)
{
    sendAsyncIPC(aep, badge, message);

    return EXCEPTION_NONE;
}

exception_t
performInvocation_Reply(tcb_t *thread, cte_t *slot)
{
    doReplyTransfer(ksCurThread, thread, slot);
    return EXCEPTION_NONE;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <types.h>
#include <api/failures.h>
#include <api/invocation.h>
#include <api/syscall.h>
#include <machine/io.h>
#include <object/structures.h>
#include <object/objecttype.h>
#include <object/cnode.h>
#include <object/tcb.h>
#include <kernel/cspace.h>
#include <kernel/thread.h>
#include <kernel/vspace.h>
#include <model/statedata.h>
#include <util.h>

static inline PURE
unsigned int
ready_queues_index(unsigned int dom, unsigned int prio)
{
    return dom * CONFIG_NUM_PRIORITIES + prio;
}

/* Add TCB to the head of a scheduler queue */
void
tcbSchedEnqueue(tcb_t *tcb)
{
    if (!thread_state_get_tcbQueued(tcb->tcbState)) {
        tcb_queue_t queue;
        dom_t dom;
        prio_t prio;
        unsigned int idx;

        dom = tcb->tcbDomain;
        prio = tcb->tcbPriority;
        idx = ready_queues_index(dom, prio);
        queue = ksReadyQueues[idx];

        if (!queue.end) { /* Empty list */
            queue.end = tcb;
        } else {
            queue.head->tcbSchedPrev = tcb;
        }
        tcb->tcbSchedPrev = NULL;
        tcb->tcbSchedNext = queue.head;
        queue.head = tcb;

        ksReadyQueues[idx] = queue;

        thread_state_ptr_set_tcbQueued(&tcb->tcbState, true);
    }
}

/* Add TCB to the end of a scheduler queue */
void
tcbSchedAppend(tcb_t *tcb)
{
    if (!thread_state_get_tcbQueued(tcb->tcbState)) {
        tcb_queue_t queue;
        dom_t dom;
        prio_t prio;
        unsigned int idx;

        dom = tcb->tcbDomain;
        prio = tcb->tcbPriority;
        idx = ready_queues_index(dom, prio);
        queue = ksReadyQueues[idx];

        if (!queue.head) { /* Empty list */
            queue.head = tcb;
        } else {
            queue.end->tcbSchedNext = tcb;
        }
        tcb->tcbSchedPrev = queue.end;
        tcb->tcbSchedNext = NULL;
        queue.end = tcb;

        ksReadyQueues[idx] = queue;

        thread_state_ptr_set_tcbQueued(&tcb->tcbState, true);
    }
}

/* Remove TCB from a scheduler queue */
void
tcbSchedDequeue(tcb_t *tcb)
{
    if (thread_state_get_tcbQueued(tcb->tcbState)) {
        tcb_queue_t queue;
        dom_t dom;
        prio_t prio;
        unsigned int idx;

        dom = tcb->tcbDomain;
        prio = tcb->tcbPriority;
        idx = ready_queues_index(dom, prio);
        queue = ksReadyQueues[idx];

        if (tcb->tcbSchedPrev) {
            tcb->tcbSchedPrev->tcbSchedNext = tcb->tcbSchedNext;
        } else {
            queue.head = tcb->tcbSchedNext;
        }

        if (tcb->tcbSchedNext) {
            tcb->tcbSchedNext->tcbSchedPrev = tcb->tcbSchedPrev;
        } else {
            queue.end = tcb->tcbSchedPrev;
        }

        ksReadyQueues[idx] = queue;

        thread_state_ptr_set_tcbQueued(&tcb->tcbState, false);
    }
}

/* Add TCB to the end of an endpoint queue */
tcb_queue_t
tcbEPAppend(tcb_t *tcb, tcb_queue_t queue)
{
    if (!queue.head) { /* Empty list */
        queue.head = tcb;
    } else {
        queue.end->tcbEPNext = tcb;
    }
    tcb->tcbEPPrev = queue.end;
    tcb->tcbEPNext = NULL;
    queue.end = tcb;

    return queue;
}

/* Remove TCB from an endpoint queue */
tcb_queue_t
tcbEPDequeue(tcb_t *tcb, tcb_queue_t queue)
{
    if (tcb->tcbEPPrev) {
        tcb->tcbEPPrev->tcbEPNext = tcb->tcbEPNext;
    } else {
        queue.head = tcb->tcbEPNext;
    }

    if (tcb->tcbEPNext) {
        tcb->tcbEPNext->tcbEPPrev = tcb->tcbEPPrev;
    } else {
        queue.end = tcb->tcbEPPrev;
    }

    return queue;
}

cptr_t PURE
getExtraCPtr(word_t *bufferPtr, unsigned int i)
{
    return (cptr_t)bufferPtr[seL4_MsgMaxLength + 2 + i];
}

void
setExtraBadge(word_t *bufferPtr, word_t badge,
              unsigned int i)
{
    bufferPtr[seL4_MsgMaxLength + 2 + i] = badge;
}

void
setupCallerCap(tcb_t *sender, tcb_t *receiver)
{
    cte_t *replySlot, *callerSlot;
    cap_t masterCap UNUSED, callerCap UNUSED;

    setThreadState(sender, ThreadState_BlockedOnReply);
    replySlot = TCB_PTR_CTE_PTR(sender, tcbReply);
    masterCap = replySlot->cap;
    /* Haskell error: "Sender must have a valid master reply cap" */
    assert(cap_get_capType(masterCap) == cap_reply_cap);
    assert(cap_reply_cap_get_capReplyMaster(masterCap));
    assert(TCB_PTR(cap_reply_cap_get_capTCBPtr(masterCap)) == sender);
    callerSlot = TCB_PTR_CTE_PTR(receiver, tcbCaller);
    callerCap = callerSlot->cap;
    /* Haskell error: "Caller cap must not already exist" */
    assert(cap_get_capType(callerCap) == cap_null_cap);
    cteInsert(cap_reply_cap_new(false, TCB_REF(sender)),
              replySlot, callerSlot);
}

void
deleteCallerCap(tcb_t *receiver)
{
    cte_t *callerSlot;

    callerSlot = TCB_PTR_CTE_PTR(receiver, tcbCaller);
    cteDeleteOne(callerSlot);
}

extra_caps_t current_extra_caps;

exception_t
lookupExtraCaps(tcb_t* thread, word_t *bufferPtr, message_info_t info)
{
    lookupSlot_raw_ret_t lu_ret;
    cptr_t cptr;
    unsigned int i, length;

    if (!bufferPtr) {
        current_extra_caps.excaprefs[0] = NULL;
        return EXCEPTION_NONE;
    }

    length = message_info_get_msgExtraCaps(info);

    for (i = 0; i < length; i++) {
        cptr = getExtraCPtr(bufferPtr, i);

        lu_ret = lookupSlot(thread, cptr);
        if (lu_ret.status != EXCEPTION_NONE) {
            current_fault = fault_cap_fault_new(cptr, false);
            return lu_ret.status;
        }

        current_extra_caps.excaprefs[i] = lu_ret.slot;
    }
    if (i < seL4_MsgMaxExtraCaps) {
        current_extra_caps.excaprefs[i] = NULL;
    }

    return EXCEPTION_NONE;
}

/* Copy IPC MRs from one thread to another */
unsigned int
copyMRs(tcb_t *sender, word_t *sendBuf, tcb_t *receiver,
        word_t *recvBuf, unsigned int n)
{
    unsigned int i;

    /* Copy inline words */
    for (i = 0; i < n && i < n_msgRegisters; i++) {
        setRegister(receiver, msgRegisters[i],
                    getRegister(sender, msgRegisters[i]));
    }

    if (!recvBuf || !sendBuf) {
        return i;
    }

    /* Copy out-of-line words */
    for (; i < n; i++) {
        recvBuf[i + 1] = sendBuf[i + 1];
    }

    return i;
}

/* The following functions sit in the syscall error monad, but include the
 * exception cases for the preemptible bottom end, as they call the invoke
 * functions directly.  This is a significant deviation from the Haskell
 * spec. */
exception_t
decodeTCBInvocation(word_t label, unsigned int length, cap_t cap,
                    cte_t* slot, extra_caps_t extraCaps, bool_t call,
                    word_t *buffer)
{
    switch (label) {
    case TCBReadRegisters:
        /* Second level of decoding */
        return decodeReadRegisters(cap, length, call, buffer);

    case TCBWriteRegisters:
        return decodeWriteRegisters(cap, length, buffer);

    case TCBCopyRegisters:
        return decodeCopyRegisters(cap, length, extraCaps, buffer);

    case TCBSuspend:
        /* Jump straight to the invoke */
        setThreadState(ksCurThread, ThreadState_Restart);
        return invokeTCB_Suspend(
                   TCB_PTR(cap_thread_cap_get_capTCBPtr(cap)));

    case TCBResume:
        setThreadState(ksCurThread, ThreadState_Restart);
        return invokeTCB_Resume(
                   TCB_PTR(cap_thread_cap_get_capTCBPtr(cap)));

    case TCBConfigure:
        return decodeTCBConfigure(cap, length, slot, extraCaps, buffer);

    case TCBSetPriority:
        return decodeSetPriority(cap, length, buffer);

    case TCBSetIPCBuffer:
        return decodeSetIPCBuffer(cap, length, slot, extraCaps, buffer);

    case TCBSetSpace:
        return decodeSetSpace(cap, length, slot, extraCaps, buffer);

    default:
        /* Haskell: "throw IllegalOperation" */
        userError("TCB: Illegal operation.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }
}

enum CopyRegistersFlags {
    CopyRegisters_suspendSource = 0,
    CopyRegisters_resumeTarget = 1,
    CopyRegisters_transferFrame = 2,
    CopyRegisters_transferInteger = 3
};

exception_t
decodeCopyRegisters(cap_t cap, unsigned int length,
                    extra_caps_t extraCaps, word_t *buffer)
{
    word_t transferArch;
    tcb_t *srcTCB;
    cap_t source_cap;
    word_t flags;

    if (length < 1 || extraCaps.excaprefs[0] == NULL) {
        userError("TCB CopyRegisters: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    flags = getSyscallArg(0, buffer);

    transferArch = Arch_decodeTransfer(flags >> 8);

    source_cap = extraCaps.excaprefs[0]->cap;

    if (cap_get_capType(source_cap) == cap_thread_cap) {
        srcTCB = TCB_PTR(cap_thread_cap_get_capTCBPtr(source_cap));
    } else {
        userError("TCB CopyRegisters: Invalid source TCB.");
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 1;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_CopyRegisters(
               TCB_PTR(cap_thread_cap_get_capTCBPtr(cap)), srcTCB,
               flags & BIT(CopyRegisters_suspendSource),
               flags & BIT(CopyRegisters_resumeTarget),
               flags & BIT(CopyRegisters_transferFrame),
               flags & BIT(CopyRegisters_transferInteger),
               transferArch);

}

enum ReadRegistersFlags {
    ReadRegisters_suspend = 0
};

exception_t
decodeReadRegisters(cap_t cap, unsigned int length, bool_t call,
                    word_t *buffer)
{
    word_t transferArch, flags, n;
    tcb_t* thread;

    if (length < 2) {
        userError("TCB ReadRegisters: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    flags = getSyscallArg(0, buffer);
    n     = getSyscallArg(1, buffer);

    if (n < 1 || n > n_frameRegisters + n_gpRegisters) {
        userError("TCB ReadRegisters: Attempted to read an invalid number of registers (%d).",
                  (int)n);
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 1;
        current_syscall_error.rangeErrorMax = n_frameRegisters +
                                              n_gpRegisters;
        return EXCEPTION_SYSCALL_ERROR;
    }

    transferArch = Arch_decodeTransfer(flags >> 8);

    thread = TCB_PTR(cap_thread_cap_get_capTCBPtr(cap));
    if (thread == ksCurThread) {
        userError("TCB ReadRegisters: Attempted to read our own registers.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_ReadRegisters(
               TCB_PTR(cap_thread_cap_get_capTCBPtr(cap)),
               flags & BIT(ReadRegisters_suspend),
               n, transferArch, call);
}

enum WriteRegistersFlags {
    WriteRegisters_resume = 0
};

exception_t
decodeWriteRegisters(cap_t cap, unsigned int length, word_t *buffer)
{
    word_t flags, w;
    word_t transferArch;
    tcb_t* thread;

    if (length < 2) {
        userError("TCB WriteRegisters: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    flags = getSyscallArg(0, buffer);
    w     = getSyscallArg(1, buffer);

    if (length - 2 < w) {
        userError("TCB WriteRegisters: Message too short for requested write size (%d/%d).",
                  (int)(length - 2), (int)w);
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    transferArch = Arch_decodeTransfer(flags >> 8);

    thread = TCB_PTR(cap_thread_cap_get_capTCBPtr(cap));
    if (thread == ksCurThread) {
        userError("TCB WriteRegisters: Attempted to write our own registers.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_WriteRegisters(thread,
                                    flags & BIT(WriteRegisters_resume),
                                    w, transferArch, buffer);
}

/* SetPriority, SetIPCParams and SetSpace are all
 * specialisations of TCBConfigure. */

exception_t
decodeTCBConfigure(cap_t cap, unsigned int length, cte_t* slot,
                   extra_caps_t rootCaps, word_t *buffer)
{
    cte_t *bufferSlot, *cRootSlot, *vRootSlot;
    cap_t bufferCap, cRootCap, vRootCap;
    deriveCap_ret_t dc_ret;
    cptr_t faultEP;
    unsigned int prio;
    word_t cRootData, vRootData, bufferAddr;

    if (length < 5 || rootCaps.excaprefs[0] == NULL
            || rootCaps.excaprefs[1] == NULL
            || rootCaps.excaprefs[2] == NULL) {
        userError("TCB Configure: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    faultEP    = getSyscallArg(0, buffer);
    prio       = getSyscallArg(1, buffer);
    cRootData  = getSyscallArg(2, buffer);
    vRootData  = getSyscallArg(3, buffer);
    bufferAddr = getSyscallArg(4, buffer);

    cRootSlot  = rootCaps.excaprefs[0];
    cRootCap   = rootCaps.excaprefs[0]->cap;
    vRootSlot  = rootCaps.excaprefs[1];
    vRootCap   = rootCaps.excaprefs[1]->cap;
    bufferSlot = rootCaps.excaprefs[2];
    bufferCap  = rootCaps.excaprefs[2]->cap;

    prio = prio & MASK(8);

    if (prio > ksCurThread->tcbPriority) {
        userError("TCB Configure: Requested priority %d too high (max %d).",
                  (int)prio, (int)(ksCurThread->tcbPriority));
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (bufferAddr == 0) {
        bufferSlot = NULL;
    } else {
        exception_t e;

        dc_ret = deriveCap(bufferSlot, bufferCap);
        if (dc_ret.status != EXCEPTION_NONE) {
            return dc_ret.status;
        }
        bufferCap = dc_ret.cap;
        e = checkValidIPCBuffer(bufferAddr, bufferCap);
        if (e != EXCEPTION_NONE) {
            return e;
        }
    }

    if (slotCapLongRunningDelete(
                TCB_PTR_CTE_PTR(cap_thread_cap_get_capTCBPtr(cap), tcbCTable)) ||
            slotCapLongRunningDelete(
                TCB_PTR_CTE_PTR(cap_thread_cap_get_capTCBPtr(cap), tcbVTable))) {
        userError("TCB Configure: CSpace or VSpace currently being deleted.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (cRootData != 0) {
        cRootCap = updateCapData(false, cRootData, cRootCap);
    }

    dc_ret = deriveCap(cRootSlot, cRootCap);
    if (dc_ret.status != EXCEPTION_NONE) {
        return dc_ret.status;
    }
    cRootCap = dc_ret.cap;

    if (cap_get_capType(cRootCap) != cap_cnode_cap) {
        userError("TCB Configure: CSpace cap is invalid.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (vRootData != 0) {
        vRootCap = updateCapData(false, vRootData, vRootCap);
    }

    dc_ret = deriveCap(vRootSlot, vRootCap);
    if (dc_ret.status != EXCEPTION_NONE) {
        return dc_ret.status;
    }
    vRootCap = dc_ret.cap;

    if (!isValidVTableRoot(vRootCap)) {
        userError("TCB Configure: VSpace cap is invalid.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_ThreadControl(
               TCB_PTR(cap_thread_cap_get_capTCBPtr(cap)), slot,
               faultEP, prio,
               cRootCap, cRootSlot,
               vRootCap, vRootSlot,
               bufferAddr, bufferCap,
               bufferSlot, thread_control_update_all);
}

exception_t
decodeSetPriority(cap_t cap, unsigned int length, word_t *buffer)
{
    prio_t newPrio;

    if (length < 1) {
        userError("TCB SetPriority: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    newPrio = getSyscallArg(0, buffer);

    /* assuming here seL4_MaxPrio is of form 2^n - 1 */
    newPrio = newPrio & MASK(8);

    if (newPrio > ksCurThread->tcbPriority) {
        userError("TCB SetPriority: Requested priority %d too high (max %d).",
                  (int)newPrio, (int)ksCurThread->tcbPriority);
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_ThreadControl(
               TCB_PTR(cap_thread_cap_get_capTCBPtr(cap)), NULL,
               0, newPrio,
               cap_null_cap_new(), NULL,
               cap_null_cap_new(), NULL,
               0, cap_null_cap_new(),
               NULL, thread_control_update_priority);
}

exception_t
decodeSetIPCBuffer(cap_t cap, unsigned int length, cte_t* slot,
                   extra_caps_t extraCaps, word_t *buffer)
{
    cptr_t cptr_bufferPtr;
    cap_t bufferCap;
    cte_t *bufferSlot;

    if (length < 1 || extraCaps.excaprefs[0] == NULL) {
        userError("TCB SetIPCBuffer: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    cptr_bufferPtr  = getSyscallArg(0, buffer);
    bufferSlot = extraCaps.excaprefs[0];
    bufferCap  = extraCaps.excaprefs[0]->cap;

    if (cptr_bufferPtr == 0) {
        bufferSlot = NULL;
    } else {
        exception_t e;
        deriveCap_ret_t dc_ret;

        dc_ret = deriveCap(bufferSlot, bufferCap);
        if (dc_ret.status != EXCEPTION_NONE) {
            return dc_ret.status;
        }
        bufferCap = dc_ret.cap;
        e = checkValidIPCBuffer(cptr_bufferPtr, bufferCap);
        if (e != EXCEPTION_NONE) {
            return e;
        }
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_ThreadControl(
               TCB_PTR(cap_thread_cap_get_capTCBPtr(cap)), slot,
               0,
               0, /* used to be prioInvalid, but it doesn't matter */
               cap_null_cap_new(), NULL,
               cap_null_cap_new(), NULL,
               cptr_bufferPtr, bufferCap,
               bufferSlot, thread_control_update_ipc_buffer);
}

exception_t
decodeSetSpace(cap_t cap, unsigned int length, cte_t* slot,
               extra_caps_t extraCaps, word_t *buffer)
{
    cptr_t faultEP;
    word_t cRootData, vRootData;
    cte_t *cRootSlot, *vRootSlot;
    cap_t cRootCap, vRootCap;
    deriveCap_ret_t dc_ret;

    if (length < 3 || extraCaps.excaprefs[0] == NULL
            || extraCaps.excaprefs[1] == NULL) {
        userError("TCB SetSpace: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    faultEP   = getSyscallArg(0, buffer);
    cRootData = getSyscallArg(1, buffer);
    vRootData = getSyscallArg(2, buffer);

    cRootSlot  = extraCaps.excaprefs[0];
    cRootCap   = extraCaps.excaprefs[0]->cap;
    vRootSlot  = extraCaps.excaprefs[1];
    vRootCap   = extraCaps.excaprefs[1]->cap;

    if (slotCapLongRunningDelete(
                TCB_PTR_CTE_PTR(cap_thread_cap_get_capTCBPtr(cap), tcbCTable)) ||
            slotCapLongRunningDelete(
                TCB_PTR_CTE_PTR(cap_thread_cap_get_capTCBPtr(cap), tcbVTable))) {
        userError("TCB SetSpace: CSpace or VSpace currently being deleted.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (cRootData != 0) {
        cRootCap = updateCapData(false, cRootData, cRootCap);
    }

    dc_ret = deriveCap(cRootSlot, cRootCap);
    if (dc_ret.status != EXCEPTION_NONE) {
        return dc_ret.status;
    }
    cRootCap = dc_ret.cap;

    if (cap_get_capType(cRootCap) != cap_cnode_cap) {
        userError("TCB SetSpace: Invalid CNode cap.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (vRootData != 0) {
        vRootCap = updateCapData(false, vRootData, vRootCap);
    }

    dc_ret = deriveCap(vRootSlot, vRootCap);
    if (dc_ret.status != EXCEPTION_NONE) {
        return dc_ret.status;
    }
    vRootCap = dc_ret.cap;

    if (!isValidVTableRoot(vRootCap)) {
        userError("TCB SetSpace: Invalid VSpace cap.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_ThreadControl(
               TCB_PTR(cap_thread_cap_get_capTCBPtr(cap)), slot,
               faultEP,
               0, /* used to be prioInvalid, but it doesn't matter */
               cRootCap, cRootSlot,
               vRootCap, vRootSlot,
               0, cap_null_cap_new(), NULL, thread_control_update_space);
}

exception_t
decodeDomainInvocation(word_t label, unsigned int length, extra_caps_t extraCaps, word_t *buffer)
{
    word_t domain;
    cap_t tcap;

    if (unlikely(label != DomainSetSet)) {
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (unlikely(length == 0)) {
        userError("Domain Configure: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    } else {
        domain = getSyscallArg(0, buffer);
        if (domain >= CONFIG_NUM_DOMAINS) {
            userError("Domain Configure: invalid domain (%d >= %d).",
                      (int)domain, CONFIG_NUM_DOMAINS);
            current_syscall_error.type = seL4_InvalidArgument;
            current_syscall_error.invalidArgumentNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }
    }

    if (unlikely(extraCaps.excaprefs[0] == NULL)) {
        userError("Domain Configure: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    tcap = extraCaps.excaprefs[0]->cap;
    if (unlikely(cap_get_capType(tcap) != cap_thread_cap)) {
        userError("Domain Configure: thread cap required.");
        current_syscall_error.type = seL4_InvalidArgument;
        current_syscall_error.invalidArgumentNumber = 1;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    setDomain(TCB_PTR(cap_thread_cap_get_capTCBPtr(tcap)), domain);
    return EXCEPTION_NONE;
}

/* The following functions sit in the preemption monad and implement the
 * preemptible, non-faulting bottom end of a TCB invocation. */
exception_t
invokeTCB_Suspend(tcb_t *thread)
{
    suspend(thread);
    return EXCEPTION_NONE;
}

exception_t
invokeTCB_Resume(tcb_t *thread)
{
    restart(thread);
    return EXCEPTION_NONE;
}

exception_t
invokeTCB_ThreadControl(tcb_t *target, cte_t* slot,
                        cptr_t faultep, prio_t priority,
                        cap_t cRoot_newCap, cte_t *cRoot_srcSlot,
                        cap_t vRoot_newCap, cte_t *vRoot_srcSlot,
                        word_t bufferAddr, cap_t bufferCap,
                        cte_t *bufferSrcSlot,
                        thread_control_flag_t updateFlags)
{
    exception_t e;
    cap_t tCap = cap_thread_cap_new((word_t)target);

    if (updateFlags & thread_control_update_space) {
        target->tcbFaultHandler = faultep;
    }

    if (updateFlags & thread_control_update_priority) {
        setPriority(target, priority);
    }

    if (updateFlags & thread_control_update_space) {
        cte_t *rootSlot;

        rootSlot = TCB_PTR_CTE_PTR(target, tcbCTable);
        e = cteDelete(rootSlot, true);
        if (e != EXCEPTION_NONE) {
            return e;
        }
        if (sameObjectAs(cRoot_newCap, cRoot_srcSlot->cap) &&
                sameObjectAs(tCap, slot->cap)) {
            cteInsert(cRoot_newCap, cRoot_srcSlot, rootSlot);
        }
    }

    if (updateFlags & thread_control_update_space) {
        cte_t *rootSlot;

        rootSlot = TCB_PTR_CTE_PTR(target, tcbVTable);
        e = cteDelete(rootSlot, true);
        if (e != EXCEPTION_NONE) {
            return e;
        }
        if (sameObjectAs(vRoot_newCap, vRoot_srcSlot->cap) &&
                sameObjectAs(tCap, slot->cap)) {
            cteInsert(vRoot_newCap, vRoot_srcSlot, rootSlot);
        }
    }

    if (updateFlags & thread_control_update_ipc_buffer) {
        cte_t *bufferSlot;

        bufferSlot = TCB_PTR_CTE_PTR(target, tcbBuffer);
        e = cteDelete(bufferSlot, true);
        if (e != EXCEPTION_NONE) {
            return e;
        }
        target->tcbIPCBuffer = bufferAddr;
        if (bufferSrcSlot && sameObjectAs(bufferCap, bufferSrcSlot->cap) &&
                sameObjectAs(tCap, slot->cap)) {
            cteInsert(bufferCap, bufferSrcSlot, bufferSlot);
        }
    }

    return EXCEPTION_NONE;
}

exception_t
invokeTCB_CopyRegisters(tcb_t *dest, tcb_t *tcb_src,
                        bool_t suspendSource, bool_t resumeTarget,
                        bool_t transferFrame, bool_t transferInteger,
                        word_t transferArch)
{
    if (suspendSource) {
        suspend(tcb_src);
    }

    if (resumeTarget) {
        restart(dest);
    }

    if (transferFrame) {
        unsigned int i;
        word_t v;
        word_t pc;

        for (i = 0; i < n_frameRegisters; i++) {
            v = getRegister(tcb_src, frameRegisters[i]);
            setRegister(dest, frameRegisters[i], v);
        }

        pc = getRestartPC(dest);
        setNextPC(dest, pc);
    }

    if (transferInteger) {
        unsigned int i;
        word_t v;

        for (i = 0; i < n_gpRegisters; i++) {
            v = getRegister(tcb_src, gpRegisters[i]);
            setRegister(dest, gpRegisters[i], v);
        }
    }

    return Arch_performTransfer(transferArch, tcb_src, dest);
}

/* ReadRegisters is a special case: replyFromKernel & setMRs are
 * unfolded here, in order to avoid passing the large reply message up
 * to the top level in a global (and double-copying). We prevent the
 * top-level replyFromKernel_success_empty() from running by setting the
 * thread state. Retype does this too.
 */
exception_t
invokeTCB_ReadRegisters(tcb_t *tcb_src, bool_t suspendSource,
                        unsigned int n, word_t arch, bool_t call)
{
    unsigned int i, j;
    exception_t e;
    tcb_t *thread;

    thread = ksCurThread;

    if (suspendSource) {
        suspend(tcb_src);
    }

    e = Arch_performTransfer(arch, tcb_src, ksCurThread);
    if (e != EXCEPTION_NONE) {
        return e;
    }

    if (call) {
        word_t *ipcBuffer;

        ipcBuffer = lookupIPCBuffer(true, thread);

        setRegister(thread, badgeRegister, 0);

        for (i = 0; i < n && i < n_frameRegisters && i < n_msgRegisters; i++) {
            setRegister(thread, msgRegisters[i],
                        getRegister(tcb_src, frameRegisters[i]));
        }

        if (ipcBuffer != NULL && i < n && i < n_frameRegisters) {
            for (; i < n && i < n_frameRegisters; i++) {
                ipcBuffer[i + 1] = getRegister(tcb_src, frameRegisters[i]);
            }
        }

        j = i;

        for (i = 0; i < n_gpRegisters && i + n_frameRegisters < n
                && i + n_frameRegisters < n_msgRegisters; i++) {
            setRegister(thread, msgRegisters[i + n_frameRegisters],
                        getRegister(tcb_src, gpRegisters[i]));
        }

        if (ipcBuffer != NULL && i < n_gpRegisters
                && i + n_frameRegisters < n) {
            for (; i < n_gpRegisters && i + n_frameRegisters < n; i++) {
                ipcBuffer[i + n_frameRegisters + 1] =
                    getRegister(tcb_src, gpRegisters[i]);
            }
        }

        setRegister(thread, msgInfoRegister, wordFromMessageInfo(
                        message_info_new(0, 0, 0, i + j)));
    }
    setThreadState(thread, ThreadState_Running);

    return EXCEPTION_NONE;
}

exception_t
invokeTCB_WriteRegisters(tcb_t *dest, bool_t resumeTarget,
                         unsigned int n, word_t arch, word_t *buffer)
{
    unsigned int i;
    word_t pc;
    exception_t e;

    e = Arch_performTransfer(arch, ksCurThread, dest);
    if (e != EXCEPTION_NONE) {
        return e;
    }

    if (n > n_frameRegisters + n_gpRegisters) {
        n = n_frameRegisters + n_gpRegisters;
    }

    for (i = 0; i < n_frameRegisters && i < n; i++) {
        /* Offset of 2 to get past the initial syscall arguments */
        setRegister(dest, frameRegisters[i],
                    sanitiseRegister(frameRegisters[i],
                                     getSyscallArg(i + 2, buffer)));
    }

    for (i = 0; i < n_gpRegisters && i + n_frameRegisters < n; i++) {
        setRegister(dest, gpRegisters[i],
                    sanitiseRegister(gpRegisters[i],
                                     getSyscallArg(i + n_frameRegisters + 2,
                                                   buffer)));
    }

    pc = getRestartPC(dest);
    setNextPC(dest, pc);

    if (resumeTarget) {
        restart(dest);
    }

    return EXCEPTION_NONE;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <types.h>
#include <api/failures.h>
#include <api/syscall.h>
#include <api/invocation.h>
#include <machine/io.h>
#include <object/structures.h>
#include <object/untyped.h>
#include <object/objecttype.h>
#include <object/cnode.h>
#include <kernel/cspace.h>
#include <kernel/thread.h>
#include <util.h>

static word_t
alignUp(word_t baseValue, unsigned int alignment)
{
    return (baseValue + (BIT(alignment) - 1)) & ~MASK(alignment);
}

exception_t
decodeUntypedInvocation(word_t label, unsigned int length, cte_t *slot,
                        cap_t cap, extra_caps_t extraCaps,
                        bool_t call, word_t *buffer)
{
    word_t newType, userObjSize, nodeIndex;
    word_t nodeDepth, nodeOffset, nodeWindow;
    cte_t *rootSlot UNUSED;
    exception_t status;
    cap_t nodeCap;
    lookupSlot_ret_t lu_ret;
    word_t nodeSize;
    unsigned int i;
    slot_range_t slots;
    word_t freeRef, alignedFreeRef, objectSize, untypedFreeBytes;
    word_t freeIndex;

    /* Ensure operation is valid. */
    if (label != UntypedRetype) {
        userError("Untyped cap: Illegal operation attempted.");
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Ensure message length valid. */
    if (length < 6 || extraCaps.excaprefs[0] == NULL) {
        userError("Untyped invocation: Truncated message.");
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Fetch arguments. */
    newType     = getSyscallArg(0, buffer);
    userObjSize = getSyscallArg(1, buffer);
    nodeIndex   = getSyscallArg(2, buffer);
    nodeDepth   = getSyscallArg(3, buffer);
    nodeOffset  = getSyscallArg(4, buffer);
    nodeWindow  = getSyscallArg(5, buffer);

    rootSlot = extraCaps.excaprefs[0];

    /* Is the requested object type valid? */
    if (newType >= seL4_ObjectTypeCount) {
        userError("Untyped Retype: Invalid object type.");
        current_syscall_error.type = seL4_InvalidArgument;
        current_syscall_error.invalidArgumentNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Is the requested object size valid? */
    if (userObjSize >= (wordBits - 1)) {
        userError("Untyped Retype: Invalid object size.");
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 0;
        current_syscall_error.rangeErrorMax = wordBits - 2;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* If the target object is a CNode, is it at least size 1? */
    if (newType == seL4_CapTableObject && userObjSize == 0) {
        userError("Untyped Retype: Requested CapTable size too small.");
        current_syscall_error.type = seL4_InvalidArgument;
        current_syscall_error.invalidArgumentNumber = 1;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* If the target object is a Untyped, is it at least size 4? */
    if (newType == seL4_UntypedObject && userObjSize < 4) {
        userError("Untyped Retype: Requested UntypedItem size too small.");
        current_syscall_error.type = seL4_InvalidArgument;
        current_syscall_error.invalidArgumentNumber = 1;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Lookup the destination CNode (where our caps will be placed in). */
    if (nodeDepth == 0) {
        nodeCap = extraCaps.excaprefs[0]->cap;
    } else {
        cap_t rootCap = extraCaps.excaprefs[0]->cap;
        lu_ret = lookupTargetSlot(rootCap, nodeIndex, nodeDepth);
        if (lu_ret.status != EXCEPTION_NONE) {
            userError("Untyped Retype: Invalid destination address.");
            return lu_ret.status;
        }
        nodeCap = lu_ret.slot->cap;
    }

    /* Is the destination actually a CNode? */
    if (cap_get_capType(nodeCap) != cap_cnode_cap) {
        userError("Untyped Retype: Destination cap invalid or read-only.");
        current_syscall_error.type = seL4_FailedLookup;
        current_syscall_error.failedLookupWasSource = 0;
        current_lookup_fault = lookup_fault_missing_capability_new(nodeDepth);
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Is the region where the user wants to put the caps valid? */
    nodeSize = 1 << cap_cnode_cap_get_capCNodeRadix(nodeCap);
    if (nodeOffset > nodeSize - 1) {
        userError("Untyped Retype: Destination node offset #%d too large.",
                  (int)nodeOffset);
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 0;
        current_syscall_error.rangeErrorMax = nodeSize - 1;
        return EXCEPTION_SYSCALL_ERROR;
    }
    if (nodeWindow < 1 || nodeWindow > CONFIG_RETYPE_FAN_OUT_LIMIT) {
        userError("Untyped Retype: Number of requested objects (%d) too small or large.",
                  (int)nodeWindow);
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 1;
        current_syscall_error.rangeErrorMax = CONFIG_RETYPE_FAN_OUT_LIMIT;
        return EXCEPTION_SYSCALL_ERROR;
    }
    if (nodeWindow > nodeSize - nodeOffset) {
        userError("Untyped Retype: Requested destination window overruns size of node.");
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 1;
        current_syscall_error.rangeErrorMax = nodeSize - nodeOffset;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Ensure that the destination slots are all empty. */
    slots.cnode = CTE_PTR(cap_cnode_cap_get_capCNodePtr(nodeCap));
    slots.offset = nodeOffset;
    slots.length = nodeWindow;
    for (i = nodeOffset; i < nodeOffset + nodeWindow; i++) {
        status = ensureEmptySlot(slots.cnode + i);
        if (status != EXCEPTION_NONE) {
            userError("Untyped Retype: Slot #%d in destination window non-empty.",
                      (int)i);
            return status;
        }
    }

    /*
     * Determine where in the Untyped region we should start allocating new
     * objects.
     *
     * If we have no children, we can start allocating from the beginning of
     * our untyped, regardless of what the "free" value in the cap states.
     * (This may happen if all of the objects beneath us got deleted).
     *
     * If we have children, we just keep allocating from the "free" value
     * recorded in the cap.
     */
    status = ensureNoChildren(slot);
    if (status != EXCEPTION_NONE) {
        freeIndex = cap_untyped_cap_get_capFreeIndex(cap);
    } else {
        freeIndex = 0;
    }
    freeRef = GET_FREE_REF(cap_untyped_cap_get_capPtr(cap), freeIndex);

    /*
     * Determine the maximum number of objects we can create, and return an
     * error if we don't have enough space.
     *
     * We don't need to worry about alignment in this case, because if anything
     * fits, it will also fit aligned up (by packing it on the right hand side
     * of the untyped).
     */
    objectSize = getObjectSize(newType, userObjSize);
    untypedFreeBytes = BIT(cap_untyped_cap_get_capBlockSize(cap)) -
                       FREE_INDEX_TO_OFFSET(freeIndex);
    if (objectSize >= wordBits || (untypedFreeBytes >> objectSize) < nodeWindow) {
        userError("Untyped Retype: Insufficient memory "
                  "(%u * %u bytes needed, %u bytes available).",
                  (unsigned int)nodeWindow,
                  (objectSize >= wordBits ? -1 : (1 << objectSize)),
                  (unsigned int)(untypedFreeBytes));
        current_syscall_error.type = seL4_NotEnoughMemory;
        current_syscall_error.memoryLeft = untypedFreeBytes;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Align up the free region so that it is aligned to the target object's
     * size. */
    alignedFreeRef = alignUp(freeRef, objectSize);

    /* Perform the retype. */
    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeUntyped_Retype(
               slot, WORD_PTR(cap_untyped_cap_get_capPtr(cap)),
               (void*)alignedFreeRef, newType, userObjSize, slots, call);
}

exception_t
invokeUntyped_Retype(cte_t *srcSlot, void* regionBase,
                     void* freeRegionBase,
                     object_t newType, word_t userSize,
                     slot_range_t destSlots, bool_t call)
{
    word_t size_ign UNUSED;
    word_t freeRef;
    word_t totalObjectSize;

    /*
     * If this is the first object we are creating in this untyped region, we
     * need to detype the old memory. At the concrete C level, this doesn't
     * have any effect, but updating this shadow state is important for the
     * verification process.
     */
    size_ign = cap_untyped_cap_ptr_get_capBlockSize(&(srcSlot->cap));
    /** AUXUPD: "(True,
        if (\<acute>freeRegionBase = \<acute>regionBase) then
          (typ_region_bytes (ptr_val \<acute>regionBase) (unat \<acute>size_ign))
        else
          id)" */
    /** GHOSTUPD: "(True,
        if (\<acute>freeRegionBase = \<acute>regionBase) then
          (gs_clear_region (ptr_val \<acute>regionBase) (unat \<acute>size_ign))
        else
          id)" */

    /* Update the amount of free space left in this untyped cap. */
    totalObjectSize = destSlots.length << getObjectSize(newType, userSize);
    freeRef = (word_t)freeRegionBase + totalObjectSize;
    cap_untyped_cap_ptr_set_capFreeIndex(&(srcSlot->cap),
                                         GET_FREE_INDEX(regionBase, freeRef));

    /* Create new objects and caps. */
    createNewObjects(newType, srcSlot, destSlots, freeRegionBase, userSize);

    return EXCEPTION_NONE;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <util.h>
#include <assert.h>
#include <machine/io.h>
#include <arch/linker.h>
#include <plat/machine.h>
#include <plat/machine/acpi.h>
#include <plat/machine/devices.h>
#include <plat/machine/pci.h>

enum acpi_type {
    ACPI_RSDP,
    ACPI_RSDT
};

/* Root System Descriptor Pointer */
typedef struct acpi_rsdp {
    char         signature[8];
    uint8_t      checksum;
    char         oem_id[6];
    uint8_t      revision;
    uint32_t     rsdt_address;
    uint32_t     length;
    uint32_t     xsdt_address[2];
    uint8_t      extended_checksum;
    char         reserved[3];
} acpi_rsdp_t;
compile_assert(acpi_rsdp_packed, sizeof(acpi_rsdp_t) == 36)

/* DMA Remapping Reporting Table */
typedef struct acpi_dmar {
    acpi_header_t header;
    uint8_t       host_addr_width;
    uint8_t       flags;
    uint8_t       reserved[10];
} acpi_dmar_t;
compile_assert(acpi_dmar_packed,
               sizeof(acpi_dmar_t) == sizeof(acpi_header_t) + 12)

/* DMA Remapping Structure Header */
typedef struct acpi_dmar_header {
    uint16_t type;
    uint16_t length;
} acpi_dmar_header_t;
compile_assert(acpi_dmar_header_packed, sizeof(acpi_dmar_header_t) == 4)

/* DMA Remapping Structure Types */
enum acpi_table_dmar_struct_type {
    DMAR_DRHD = 0,
    DMAR_RMRR = 1,
    DMAR_ATSR = 2,
};

/* DMA Remapping Hardware unit Definition */
typedef struct acpi_dmar_drhd {
    acpi_dmar_header_t header;
    uint8_t            flags;
    uint8_t            reserved;
    uint16_t           segment;
    uint32_t           reg_base[2];
} acpi_dmar_drhd_t;
compile_assert(acpi_dmar_drhd_packed,
               sizeof(acpi_dmar_drhd_t) == sizeof(acpi_dmar_header_t) + 12)

/* Reserved Memory Region Reporting structure Definition */
typedef struct acpi_dmar_devscope {
    uint8_t  type;
    uint8_t  length;
    uint16_t reserved;
    uint8_t  enum_id;
    uint8_t  start_bus;
    struct {
        uint8_t dev;
        uint8_t fun;
    } path_0;
} acpi_dmar_devscope_t;
compile_assert(acpi_dmar_devscope_packed, sizeof(acpi_dmar_devscope_t) == 8)

/* Reserved Memory Region Reporting structure Definition */
typedef struct acpi_dmar_rmrr {
    acpi_dmar_header_t   header;
    uint16_t             reserved;
    uint16_t             segment;
    uint32_t             reg_base[2];
    uint32_t             reg_limit[2];
    acpi_dmar_devscope_t devscope_0;
} acpi_dmar_rmrr_t;
compile_assert(acpi_dmar_rmrr_packed, sizeof(acpi_dmar_rmrr_t) ==
               sizeof(acpi_dmar_header_t) + 20 + sizeof(acpi_dmar_devscope_t))

/* Multiple APIC Description Table (MADT) */
typedef struct acpi_madt {
    acpi_header_t header;
    uint32_t      apic_addr;
    uint32_t      flags;
} acpi_madt_t;
compile_assert(acpi_madt_packed,
               sizeof(acpi_madt_t) == sizeof(acpi_header_t) + 8)

typedef struct acpi_madt_header {
    uint8_t type;
    uint8_t length;
} acpi_madt_header_t;
compile_assert(acpi_madt_header_packed, sizeof(acpi_madt_header_t) == 2)

enum acpi_table_madt_struct_type {
    MADT_APIC   = 0,
    MADT_IOAPIC = 1,
    MADT_ISO    = 2,
};

typedef struct acpi_madt_apic {
    acpi_madt_header_t header;
    uint8_t            cpu_id;
    uint8_t            apic_id;
    uint32_t           flags;
} acpi_madt_apic_t;
compile_assert(acpi_madt_apic_packed,
               sizeof(acpi_madt_apic_t) == sizeof(acpi_madt_header_t) + 6)

typedef struct acpi_madt_ioapic {
    acpi_madt_header_t header;
    uint8_t            ioapic_id;
    uint8_t            reserved[1];
    uint32_t           ioapic_addr;
    uint32_t           gsib;
} acpi_madt_ioapic_t;
compile_assert(acpi_madt_ioapic_packed,
               sizeof(acpi_madt_ioapic_t) == sizeof(acpi_madt_header_t) + 10)

typedef struct acpi_madt_iso {
    acpi_madt_header_t header;
    uint8_t            bus; /* always 0 (ISA) */
    uint8_t            source;
    uint32_t           gsi;
    uint16_t           flags;
} acpi_madt_iso_t;
/* We can't assert on the sizeof acpi_madt_iso because it contains trailing
 * padding.
 */
compile_assert(acpi_madt_iso_packed,
               OFFSETOF(acpi_madt_iso_t, flags) == sizeof(acpi_madt_header_t) + 6)

/* workaround because string literals are not supported by C parser */
const char acpi_str_rsd[]  = {'R', 'S', 'D', ' ', 'P', 'T', 'R', ' ', 0};
const char acpi_str_apic[] = {'A', 'P', 'I', 'C', 0};

BOOT_CODE static uint8_t
acpi_calc_checksum(char* start, uint32_t length)
{
    uint8_t checksum = 0;

    while (length > 0) {
        checksum += *start;
        start++;
        length--;
    }
    return checksum;
}

BOOT_CODE static acpi_rsdp_t*
acpi_get_rsdp(void)
{
    char* addr;

    for (addr = (char*)BIOS_PADDR_START; addr < (char*)BIOS_PADDR_END; addr += 16) {
        if (strncmp(addr, acpi_str_rsd, 8) == 0) {
            if (acpi_calc_checksum(addr, 20) == 0) {
                return (acpi_rsdp_t*)addr;
            }
        }
    }
    return NULL;
}

void* acpi_table_init(void* entry, enum acpi_type table_type);
BOOT_CODE void*
acpi_table_init(void* entry, enum acpi_type table_type)
{
    void* acpi_table;
    unsigned int pages_for_table;
    unsigned int pages_for_header = 1;

    /* if we need to map another page to read header */
    uint32_t offset_in_page = (uint32_t)entry & MASK(pageBitsForSize(IA32_4M));
    if (MASK(pageBitsForSize(IA32_4M)) - offset_in_page < sizeof(acpi_rsdp_t)) {
        pages_for_header++;
    }

    /* map in table's header */
    acpi_table = map_temp_boot_page(entry, pages_for_header);

    switch (table_type) {
    case ACPI_RSDP: {
        acpi_rsdp_t *rsdp_entry = (acpi_rsdp_t*)entry;
        pages_for_table = (rsdp_entry->length + offset_in_page) / MASK(pageBitsForSize(IA32_4M)) + 1;
        break;
    }
    case ACPI_RSDT: { // RSDT, MADT, DMAR etc.
        acpi_rsdt_t *rsdt_entry = (acpi_rsdt_t*)entry;
        pages_for_table = (rsdt_entry->header.length + offset_in_page) / MASK(pageBitsForSize(IA32_4M)) + 1;
        break;
    }
    default:
        printf("Error: Mapping unknown ACPI table type\n");
        assert(false);
        return NULL;
    }

    /* map in full table */
    acpi_table = map_temp_boot_page(entry, pages_for_table);

    return acpi_table;
}

BOOT_CODE acpi_rsdt_t*
acpi_init(void)
{
    acpi_rsdp_t* acpi_rsdp = acpi_get_rsdp();
    acpi_rsdt_t* acpi_rsdt;
    acpi_rsdt_t* acpi_rsdt_mapped;

    if (acpi_rsdp == NULL) {
        printf("BIOS: No ACPI support detected\n");
        return NULL;
    }
    printf("ACPI: RSDP paddr=0x%x\n", (unsigned int)acpi_rsdp);
    acpi_rsdp = acpi_table_init(acpi_rsdp, ACPI_RSDP);
    printf("ACPI: RSDP vaddr=0x%x\n", (unsigned int)acpi_rsdp);

    acpi_rsdt = (acpi_rsdt_t*)acpi_rsdp->rsdt_address;
    printf("ACPI: RSDT paddr=0x%x\n", (unsigned int)acpi_rsdt);
    acpi_rsdt_mapped = (acpi_rsdt_t*)acpi_table_init(acpi_rsdt, ACPI_RSDT);
    printf("ACPI: RSDT vaddr=0x%x\n", (unsigned int)acpi_rsdt_mapped);

    assert(acpi_rsdt_mapped->header.length > 0);
    if (acpi_calc_checksum((char*)acpi_rsdt_mapped, acpi_rsdt_mapped->header.length) != 0) {
        printf("ACPI: RSDT checksum failure\n");
        return NULL;
    }

    return acpi_rsdt;
}

BOOT_CODE uint32_t
acpi_madt_scan(
    acpi_rsdt_t* acpi_rsdt,
    cpu_id_t*    cpu_list,
    uint32_t     max_list_len
)
{
    unsigned int entries;
    uint32_t            num_cpu;
    uint32_t            count;
    acpi_madt_t*        acpi_madt;
    acpi_madt_header_t* acpi_madt_header;

    acpi_rsdt_t* acpi_rsdt_mapped;
    acpi_madt_t* acpi_madt_mapped;
    acpi_rsdt_mapped = (acpi_rsdt_t*)acpi_table_init(acpi_rsdt, ACPI_RSDT);

    num_cpu = 0;

    assert(acpi_rsdt_mapped->header.length >= sizeof(acpi_header_t));
    entries = (acpi_rsdt_mapped->header.length - sizeof(acpi_header_t)) / sizeof(acpi_header_t*);
    for (count = 0; count < entries; count++) {
        acpi_madt = (acpi_madt_t*)acpi_rsdt_mapped->entry[count];
        acpi_madt_mapped = (acpi_madt_t*)acpi_table_init(acpi_madt, ACPI_RSDT);

        if (strncmp(acpi_str_apic, acpi_madt_mapped->header.signature, 4) == 0) {
            printf("ACPI: MADT paddr=0x%x\n", (unsigned int)acpi_madt);
            printf("ACPI: MADT vaddr=0x%x\n", (unsigned int)acpi_madt_mapped);
            printf("ACPI: MADT apic_addr=0x%x\n", acpi_madt_mapped->apic_addr);
            printf("ACPI: MADT flags=0x%x\n", acpi_madt_mapped->flags);

            acpi_madt_header = (acpi_madt_header_t*)(acpi_madt_mapped + 1);

            while ((char*)acpi_madt_header < (char*)acpi_madt_mapped + acpi_madt_mapped->header.length) {
                switch (acpi_madt_header->type) {
                case MADT_APIC: {
                    /* what Intel calls apic_id is what is called cpu_id in seL4! */
                    uint8_t  cpu_id = ((acpi_madt_apic_t*)acpi_madt_header)->apic_id;
                    uint32_t flags  = ((acpi_madt_apic_t*)acpi_madt_header)->flags;
                    if (flags == 1) {
                        printf("ACPI: MADT_APIC apic_id=0x%x\n", cpu_id);
                        if (num_cpu < max_list_len) {
                            cpu_list[num_cpu] = cpu_id;
                        }
                        num_cpu++;
                    }
                    break;
                }
                case MADT_IOAPIC:
                    printf(
                        "ACPI: MADT_IOAPIC ioapic_id=%d ioapic_addr=0x%x gsib=%d\n",
                        ((acpi_madt_ioapic_t*)acpi_madt_header)->ioapic_id,
                        ((acpi_madt_ioapic_t*)acpi_madt_header)->ioapic_addr,
                        ((acpi_madt_ioapic_t*)acpi_madt_header)->gsib
                    );
                    break;
                default:
                    break;
                }
                acpi_madt_header = (acpi_madt_header_t*)((char*)acpi_madt_header + acpi_madt_header->length);
            }
        }
    }

    printf("ACPI: %d CPU(s) detected\n", num_cpu);

    return num_cpu;
}

#ifdef CONFIG_IOMMU

BOOT_CODE static bool_t
acpi_dev_in_list(dev_id_t* dev_list, uint32_t list_len, dev_id_t dev)
{
    unsigned int i = 0;

    while (i < list_len) {
        if (dev_list[i] == dev) {
            return true;
        }
        i++;
    }
    return false;
}

BOOT_CODE void
acpi_dmar_scan(
    acpi_rsdt_t* acpi_rsdt,
    paddr_t*     drhu_list,
    uint32_t*    num_drhu,
    uint32_t     max_drhu_list_len,
    dev_id_t*    passthrough_dev_list,
    uint32_t*    num_passthrough_dev,
    uint32_t     max_passthrough_dev_list_len
)
{
    unsigned int i;
    unsigned int entries;
    uint32_t count;
    uint32_t reg_basel, reg_baseh;
    dev_id_t dev_id;

    acpi_dmar_t*          acpi_dmar;
    acpi_dmar_header_t*   acpi_dmar_header;
    acpi_dmar_rmrr_t*     acpi_dmar_rmrr;
    acpi_dmar_devscope_t* acpi_dmar_devscope;

    acpi_rsdt_t* acpi_rsdt_mapped;
    acpi_dmar_t* acpi_dmar_mapped;

    acpi_rsdt_mapped = (acpi_rsdt_t*)acpi_table_init(acpi_rsdt, ACPI_RSDT);

    *num_drhu = 0;
    *num_passthrough_dev = 0;

    assert(acpi_rsdt->header.length >= sizeof(acpi_header_t));
    entries = (acpi_rsdt->header.length - sizeof(acpi_header_t)) / sizeof(acpi_header_t*);
    for (count = 0; count < entries; count++) {
        acpi_dmar = (acpi_dmar_t*)acpi_rsdt_mapped->entry[count];
        acpi_dmar_mapped = (acpi_dmar_t*)acpi_table_init(acpi_dmar, ACPI_RSDT);

        if (strncmp("DMAR", acpi_dmar_mapped->header.signature, 4) == 0) {
            printf("ACPI: DMAR paddr=0x%x\n", (unsigned int)acpi_dmar);
            printf("ACPI: DMAR vaddr=0x%x\n", (unsigned int)acpi_dmar_mapped);
            printf("ACPI: IOMMU host address width: %d\n", acpi_dmar_mapped->host_addr_width + 1);
            acpi_dmar_header = (acpi_dmar_header_t*)(acpi_dmar_mapped + 1);

            while ((char*)acpi_dmar_header < (char*)acpi_dmar_mapped + acpi_dmar_mapped->header.length) {
                switch (acpi_dmar_header->type) {

                case DMAR_DRHD:
                    if (*num_drhu == max_drhu_list_len) {
                        printf("ACPI: too many IOMMUs, disabling IOMMU support\n");
                        /* try to increase MAX_NUM_DRHU in config.h */
                        *num_drhu = 0; /* report zero IOMMUs */
                        return;
                    }
                    reg_basel = ((acpi_dmar_drhd_t*)acpi_dmar_header)->reg_base[0];
                    reg_baseh = ((acpi_dmar_drhd_t*)acpi_dmar_header)->reg_base[1];
                    /* check if value fits into uint32_t */
                    if (reg_baseh != 0) {
                        printf("ACPI: DMAR_DRHD reg_base exceeds 32 bit, disabling IOMMU support\n");
                        /* try to make BIOS map it below 4G */
                        *num_drhu = 0; /* report zero IOMMUs */
                        return;
                    }
                    drhu_list[*num_drhu] = (paddr_t)reg_basel;
                    (*num_drhu)++;
                    break;

                case DMAR_RMRR:
                    /* loop through all device scopes of this RMRR */
                    acpi_dmar_rmrr = (acpi_dmar_rmrr_t*)acpi_dmar_header;
                    if (acpi_dmar_rmrr->reg_base[1] != 0 ||
                            acpi_dmar_rmrr->reg_limit[1] != 0) {
                        printf("ACPI: RMRR device above 4GiB, disabling IOMMU support\n");
                        *num_drhu = 0;
                        return ;
                    }

                    /* Provide the region to user level */
                    insert_dev_p_reg((p_region_t) {
                        .start = acpi_dmar_rmrr->reg_base[0], .end = acpi_dmar_rmrr->reg_limit[0] + 2
                    });
                    printf("ACPI: RMRR providing region 0x%x-0x%x\n", acpi_dmar_rmrr->reg_base[0], acpi_dmar_rmrr->reg_limit[0]);

                    for (i = 0; i <= (acpi_dmar_header->length - sizeof(acpi_dmar_rmrr_t)) / sizeof(acpi_dmar_devscope_t); i++) {
                        acpi_dmar_devscope = &acpi_dmar_rmrr->devscope_0 + i;

                        if (acpi_dmar_devscope->type != 1) {
                            /* FIXME - bugzilla bug 170 */
                            printf("ACPI: RMRR device scope: non-PCI-Endpoint-Devices not supported yet, disabling IOMMU support\n");
                            *num_drhu = 0; /* report zero IOMMUs */
                            return;
                        }

                        if (acpi_dmar_devscope->length > sizeof(acpi_dmar_devscope_t)) {
                            /* FIXME - bugzilla bug 170 */
                            printf("ACPI: RMRR device scope: devices behind bridges not supported yet, disabling IOMMU support\n");
                            *num_drhu = 0; /* report zero IOMMUs */
                            return;
                        }

                        dev_id =
                            get_dev_id(
                                acpi_dmar_devscope->start_bus,
                                acpi_dmar_devscope->path_0.dev,
                                acpi_dmar_devscope->path_0.fun
                            );

                        if (!acpi_dev_in_list(passthrough_dev_list, *num_passthrough_dev, dev_id)) {
                            /* FIXME - bugzilla bug 171 */
                            printf("ACPI: registering device for IOMMU passthrough: bus=0x%x dev=0x%x fun=0x%x\n",
                                   acpi_dmar_devscope->start_bus,
                                   acpi_dmar_devscope->path_0.dev,
                                   acpi_dmar_devscope->path_0.fun
                                  );
                            if (*num_passthrough_dev == max_passthrough_dev_list_len) {
                                printf("ACPI: too many passthrough devices, disabling IOMMU support\n");
                                /* try to increase MAX_NUM_PASSTHROUGH_DEV in config.h */
                                *num_drhu = 0; /* report zero IOMMUs */
                                return;
                            }
                            passthrough_dev_list[*num_passthrough_dev] = dev_id;
                            (*num_passthrough_dev)++;
                        }
                    }
                    break;

                case DMAR_ATSR:
                    /* not implemented yet */
                    break;

                default:
                    printf("ACPI: Unknown DMA remapping structure type: %x\n", acpi_dmar_header->type);
                }
                acpi_dmar_header = (acpi_dmar_header_t*)((char*)acpi_dmar_header + acpi_dmar_header->length);
            }
        }
    }
    printf("ACPI: %d IOMMUs detected\n", *num_drhu);
}

#endif /* IOMMU */
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/debug_helpers.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#ifdef DEBUG

#include <arch/model/statedata.h>
#include <plat/machine/debug_helpers.h>
#include <plat/machine/io.h>

#define DEBUG_PORT ia32KSdebugPort

unsigned char getDebugChar(void)
{
    while ((in8(DEBUG_PORT + 5) & 1) == 0);
    return in8(DEBUG_PORT);
}

void putDebugChar(unsigned char a)
{
    while ((in8(DEBUG_PORT + 5) & 0x20) == 0);
    out8(DEBUG_PORT, a);
}

#endif
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/hardware.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>
#include <machine/io.h>
#include <arch/kernel/apic.h>
#include <arch/model/statedata.h>
#include <arch/linker.h>
#include <plat/machine/pic.h>
#include <plat/machine.h>

#ifdef CONFIG_IOMMU
#include <plat/machine/intel-vtd.h>
#endif

/* Device discovery. For the pc99 platform we assume a pci bus and the presence of the
 * standard bios regions */
void platAddDevices(void)
{
    /* discover PCI devices and their regions */
    /* pci_scan() calls insert_dev_p_reg() for each device region */
#ifdef CONFIG_IOMMU
    pci_scan(glks.pci_bus_used_bitmap);
#else
    pci_scan(NULL);
#endif
    /* Add the text mode (EGA) frame buffer. 1 frame is enough for the
     * standard 80x25 text mode. This whole thing is a bit of a hack */
    insert_dev_p_reg( (p_region_t) {
        BIOS_PADDR_VIDEO_RAM_TEXT_MODE_START, BIOS_PADDR_VIDEO_RAM_TEXT_MODE_START + 0x1000
    } );
}

/* ============================== interrupts/IRQs ============================== */

/* Enable or disable irq according to the 'mask' flag. */
void maskInterrupt(bool_t mask, irq_t irq)
{
    assert(irq >= irq_isa_min);
    assert(irq <= maxIRQ);

    if (irq <= irq_isa_max) {
        pic_mask_irq(mask, irq);
    } else {
        /* we can't mask/unmask specific APIC vectors (e.g. MSIs/IPIs) */
    }
}

/* Handle a platform-reserved IRQ. */
void handleReservedIRQ(irq_t irq)
{
#ifdef CONFIG_IOMMU
    if (irq == irq_iommu) {
        vtd_handle_fault();
        return;
    }
#endif
    printf("Received reserved IRQ: %d\n", (int)irq);
}

/* Get the IRQ number currently working on. */
irq_t getActiveIRQ(void)
{
    if (ia32KScurInterrupt == int_invalid) {
        return irqInvalid;
    } else {
        return ia32KScurInterrupt - IRQ_INT_OFFSET;
    }
}

/* Checks for pending IRQ */
bool_t isIRQPending(void)
{
    return apic_is_interrupt_pending() || pic_is_irq_pending();
}

void ackInterrupt(irq_t irq)
{
    if (irq <= irq_isa_max) {
        pic_ack_active_irq();
    } else {
        apic_ack_active_interrupt();
    }
}

void handleSpuriousIRQ(void)
{
    /* Do nothing */
}

/* ============================== timer ============================== */

void resetTimer(void)
{
    /* not necessary */
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/intel-vtd.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <config.h>

#ifdef CONFIG_IOMMU

#include <kernel/boot.h>
#include <machine/io.h>
#include <arch/kernel/apic.h>
#include <arch/model/statedata.h>
#include <arch/linker.h>
#include <plat/machine/acpi.h>
#include <plat/machine/intel-vtd.h>
#include <plat/machine/pci.h>
#include <util.h>

#define RTADDR_REG  0x20
#define GCMD_REG    0x18
#define GSTS_REG    0x1C
#define CCMD_REG    0x28
#define ECAP_REG    0x10
#define IOTLB_REG   0x08
#define FSTS_REG    0x34
#define FECTL_REG   0x38
#define FEDATA_REG  0x3C
#define FEADDR_REG  0x40
#define FEUADDR_REG 0x44
#define CAP_REG     0x08

/* Bit Positions within Registers */
#define SRTP        30  /* Set Root Table Pointer */
#define RTPS        30  /* Root Table Pointer Status */
#define TE          31  /* Translation Enable */
#define TES         31  /* Translation Enable Status */

/* ICC is 63rd bit in CCMD_REG, but since we will be
 * accessing this register as 4 byte word, ICC becomes
 * 31st bit in the upper 32bit word.
 */
#define ICC         31  /* Invalidate Context Cache */
#define CIRG        29  /* Context Invalidation Request Granularity */
#define CAIG        27  /* Context Actual Invalidation Granularity */
#define CAIG_MASK   0x3
#define IVO_MASK    0x3FF
#define IVT         31  /* Invalidate IOTLB */
#define IIRG        28  /* IOTLB Invalidation Request Granularity */
#define IAIG        25  /* IOTLB Actual Invalidation Granularity */
#define IAIG_MASK   0x7
#define IP          30  /* Interrupt Pending */
#define FRI         0x8 /* Fault Recording Index */
#define FRI_MASK    0xFF
#define FRO         24
#define FRO_MASK    0xFF
#define FI          12
#define SID_MASK    0xFFFF
#define FR_MASK     0xFF
#define FAULT_TYPE  30
#define FAULT       31
#define NFR         8   /* high word of CAP_REG */
#define NFR_MASK    0xff
#define PPF         1
#define PPF_MASK    1
#define PRESENT     1
#define WBF         27
#define WBFS        27
#define DID         8
#define RW          0x3

#define SAGAW         8
#define SAGAW_2_LEVEL 0x01
#define SAGAW_3_LEVEL 0x02
#define SAGAW_4_LEVEL 0x04
#define SAGAW_5_LEVEL 0x08
#define SAGAW_6_LEVEL 0x10

#define CONTEXT_GLOBAL_INVALIDATE 0x1
#define IOTLB_GLOBAL_INVALIDATE   0x1

#define DMA_TLB_READ_DRAIN  (1 << 17)
#define DMA_TLB_WRITE_DRAIN (1 << 16)

typedef uint32_t drhu_id_t;

static inline uint32_t vtd_read32(drhu_id_t drhu_id, uint32_t offset)
{
    return *(volatile uint32_t*)(PPTR_DRHU_START + (drhu_id << PAGE_BITS) + offset);
}

static inline void vtd_write32(drhu_id_t drhu_id, uint32_t offset, uint32_t value)
{
    *(volatile uint32_t*)(PPTR_DRHU_START + (drhu_id << PAGE_BITS) + offset) = value;
}

static inline uint32_t get_ivo(drhu_id_t drhu_id)
{
    return ((vtd_read32(drhu_id, ECAP_REG) >> 8) & IVO_MASK) * 16;
}

static inline int supports_passthrough(drhu_id_t drhu_id)
{
    return (vtd_read32(drhu_id, ECAP_REG) >> 6) & 1;
}

static uint32_t get_fro_offset(drhu_id_t drhu_id)
{
    uint32_t fro_offset;

    /* Get bits 31 to 24 from lower Capability Register */
    fro_offset = (vtd_read32(drhu_id, CAP_REG) >> FRO) & FRO_MASK;

    /* Get bits 33 to 32 from higher Capability Register */
    fro_offset |= (vtd_read32(drhu_id, CAP_REG + 4) & 0x3) << 8;

    return fro_offset << 4;
}

void invalidate_context_cache(void)
{
    /* FIXME - bugzilla bug 172
     * 1. Instead of assuming global invalidation, this function should
     *    accept a parameter to control the granularity of invalidation
     *    request.
     * 2. Instead of doing invalidation for all the IOMMUs, it should
     *    only do it for the IOMMU responsible for the requesting PCI
     *    device.
     */

    uint8_t   invalidate_command = CONTEXT_GLOBAL_INVALIDATE;
    uint32_t  ccmd_reg_upper;
    drhu_id_t i;

    for (i = 0; i < ia32KSnumDrhu; i++) {
        /* Wait till ICC bit is clear */
        while ((vtd_read32(i, CCMD_REG + 4) >> ICC) & 1);

        /* Program CIRG for Global Invalidation by setting bit 61 which
         * will be bit 29 in upper 32 bits of CCMD_REG
         */
        ccmd_reg_upper = invalidate_command << CIRG;

        /* Invalidate Context Cache */
        ccmd_reg_upper |= (1U << ICC);
        vtd_write32(i, CCMD_REG, 0);
        vtd_write32(i, CCMD_REG + 4, ccmd_reg_upper);

        /* Wait for the invalidation to complete */
        while ((vtd_read32(i, CCMD_REG + 4) >> ICC) & 1);
    }
}

void invalidate_iotlb(void)
{
    /* FIXME - bugzilla bug 172
     * 1. Instead of assuming global invalidation, this function should
     *    accept a parameter to control the granularity of invalidation
     *    request.
     * 2. Instead of doing invalidation for all the IOMMUs, it should
     *    only do it for the IOMMU responsible for the requesting PCI
     *    device.
     */

    uint8_t   invalidate_command = IOTLB_GLOBAL_INVALIDATE;
    uint32_t  iotlb_reg_upper;
    uint32_t  ivo_offset;
    drhu_id_t i;

    for (i = 0; i < ia32KSnumDrhu; i++) {
        ivo_offset = get_ivo(i);

        /* Wait till IVT bit is clear */
        while ((vtd_read32(i, ivo_offset + IOTLB_REG + 4) >> IVT) & 1);

        /* Program IIRG for Global Invalidation by setting bit 60 which
         * will be bit 28 in upper 32 bits of IOTLB_REG
         */
        iotlb_reg_upper = invalidate_command << IIRG;

        /* Invalidate IOTLB */
        iotlb_reg_upper |= (1U << IVT);
        iotlb_reg_upper |= DMA_TLB_READ_DRAIN | DMA_TLB_WRITE_DRAIN;

        vtd_write32(i, ivo_offset + IOTLB_REG, 0);
        vtd_write32(i, ivo_offset + IOTLB_REG + 4, iotlb_reg_upper);

        /* Wait for the invalidation to complete */
        while ((vtd_read32(i, ivo_offset + IOTLB_REG + 4) >> IVT) & 1);
    }
}

static void vtd_clear_fault(drhu_id_t i, word_t fr_reg)
{
    /* Clear the 'F' (Fault) bit to indicate that this fault is processed */
    vtd_write32(i, fr_reg + 12, BIT(FAULT));
}

static void vtd_process_faults(drhu_id_t i)
{
    /* Fault Recording register offset relative to the base register */
    uint32_t fro_offset;
    uint32_t source_id UNUSED;
    uint32_t fault_type UNUSED;
    uint32_t address[2] UNUSED;
    uint32_t reason UNUSED;
    uint32_t num_fault_regs;
    uint32_t fr_reg;
    uint32_t fault_status;
    uint32_t fault_record_index;

    /* Retrieves FRO by looking into Capability register bits 33 to 24 */
    fro_offset = get_fro_offset(i);
    fault_status = (vtd_read32(i, FSTS_REG) >> PPF) & PPF_MASK;

    if (fault_status) {
        num_fault_regs = ((vtd_read32(i, CAP_REG + 4) >> NFR) & NFR_MASK) + 1;
        fault_record_index = (vtd_read32(i, FSTS_REG) >> FRI) & FRI_MASK;
        fr_reg = fro_offset + 16 * fault_record_index;

        /* Traverse the fault register ring buffer */
        do {
            source_id = vtd_read32(i, fr_reg + 8) & SID_MASK;

            fault_type = (vtd_read32(i, fr_reg + 12) >> FAULT_TYPE) & 1;
            address[1] = vtd_read32(i, fr_reg + 4);
            address[0] = vtd_read32(i, fr_reg);
            reason = vtd_read32(i, fr_reg + 12) & FR_MASK;

            printf("IOMMU: DMA %s page fault ", fault_type ? "read" : "write");
            printf("from bus=0x%x dev=0x%x fun=0x%x ", get_pci_bus(source_id), get_pci_dev(source_id), get_pci_fun(source_id));
            printf("on address 0x%x:%x ", address[1], address[0]);
            printf("with reason code 0x%x\n", reason);

            vtd_clear_fault(i, fr_reg);

            fault_record_index = (fault_record_index + 1) % num_fault_regs;
            fr_reg = fro_offset + 16 * fault_record_index;
        } while ((vtd_read32(i, fr_reg + 12) >> FAULT) & 1);

        /* Check for Primary Fault Overflow */
        if (vtd_read32(i, FSTS_REG) & 1) {
            /* Clear PFO bit, so new faults will be generated again ! */
            vtd_write32(i, FSTS_REG, 1);
        }
    }
}

void vtd_handle_fault(void)
{
    drhu_id_t i;

    for (i = 0; i < ia32KSnumDrhu; i++) {
        vtd_process_faults(i);
    }
}

BOOT_CODE static void
vtd_create_root_table(void)
{
    ia32KSvtdRootTable = (void*)alloc_region(VTD_RT_SIZE_BITS);
    memzero((void*)ia32KSvtdRootTable, 1 << VTD_RT_SIZE_BITS);
}

BOOT_CODE static void
vtd_create_context_table(
    uint8_t   bus,
    uint32_t  max_num_iopt_levels,
    uint32_t  num_passthrough_dev,
    dev_id_t* passthrough_dev_list
)
{
    unsigned int i;
    vtd_cte_t* vtd_context_table = (vtd_cte_t*)alloc_region(VTD_CT_SIZE_BITS);

    printf("IOMMU: Create VTD context table for PCI bus 0x%x (pptr=0x%x)\n", bus, (uint32_t)vtd_context_table);
    memzero(vtd_context_table, 1 << VTD_CT_SIZE_BITS);

    ia32KSvtdRootTable[bus] =
        vtd_rte_new(
            pptr_to_paddr(vtd_context_table), /* Context Table Pointer */
            true                              /* Present               */
        );

    /* set passthrough bit on all devices marked for IOMMU passthrough */
    for (i = 0; i < num_passthrough_dev; i++) {
        if (get_pci_bus(passthrough_dev_list[i]) == bus) {
            vtd_cte_ptr_new(
                vtd_context_table + (passthrough_dev_list[i] & 0xff),
                0,                       /* Domain ID                          */
                max_num_iopt_levels - 2, /* Address Width                      */
                0,                       /* Address Space Root                 */
                2,                       /* Translation Type (2 = passthrough) */
                true                     /* Present                            */
            );
        }
    }
    flushCacheRange(vtd_context_table, VTD_CT_SIZE_BITS);
}

BOOT_CODE static bool_t
vtd_enable(cpu_id_t cpu_id)
{
    drhu_id_t i;

    for (i = 0; i < ia32KSnumDrhu; i++) {
        /* Set the Root Table Register */
        vtd_write32(i, RTADDR_REG, pptr_to_paddr((void*)ia32KSvtdRootTable));
        vtd_write32(i, RTADDR_REG + 4, 0);

        /* Set SRTP bit in GCMD_REG */
        vtd_write32(i, GCMD_REG, (1 << SRTP));

        /* Wait for SRTP operation to complete by polling
         * RTPS bit from GSTS_REG
         */
        while (!((vtd_read32(i, GSTS_REG) >> RTPS) & 1));
    }

    /* Globally invalidate context cache of all IOMMUs */
    invalidate_context_cache();

    /* Globally invalidate IOTLB of all IOMMUs */
    invalidate_iotlb();

    for (i = 0; i < ia32KSnumDrhu; i++) {
        uint32_t data, addr;

        data = int_iommu;
        addr = apic_get_base_paddr();
        if (!addr) {
            return false;
        }
        addr |= (cpu_id << 12);

        vtd_process_faults(i);
        vtd_write32(i, FECTL_REG, 0);
        vtd_write32(i, FEDATA_REG, data);
        vtd_write32(i, FEADDR_REG, addr);
        vtd_write32(i, FEUADDR_REG, 0);

        /*flush IOMMU write buffer */
        vtd_write32(i, GCMD_REG, BIT(WBF));
        while (((vtd_read32(i, GSTS_REG) >> WBFS) & 1));

        printf("IOMMU 0x%x: enabling...", i);

        /* Enable the DMA translation by setting TE bit in GCMD_REG */
        vtd_write32(i, GCMD_REG, (1U << TE));

        /* Wait for Translation Enable operation to complete by polling
         * TES bit from GSTS_REG
         */
        while (!((vtd_read32(i, GSTS_REG) >> TES) & 1));

        printf(" enabled\n");
    }
    return true;
}

BOOT_CODE bool_t
vtd_init(
    cpu_id_t  cpu_id,
    uint32_t  num_drhu,
    uint32_t* pci_bus_used_bitmap,
    uint32_t  num_passthrough_dev,
    dev_id_t* passthrough_dev_list
)
{
    drhu_id_t i;
    uint32_t  bus;
    uint32_t  aw_bitmask = 0xffffffff;
    uint32_t  max_num_iopt_levels;
    /* Start the number of domains at 16 bits */
    uint32_t  num_domain_id_bits = 16;

    ia32KSnumDrhu = num_drhu;

    if (ia32KSnumDrhu == 0) {
        return true;
    }

    for (i = 0; i < ia32KSnumDrhu; i++) {
        uint32_t bits_supported = 4 + 2 * (vtd_read32(i, CAP_REG) & 7);
        aw_bitmask &= vtd_read32(i, CAP_REG) >> SAGAW;
        printf("IOMMU 0x%x: %d-bit domain IDs supported\n", i, bits_supported);
        if (bits_supported < num_domain_id_bits) {
            num_domain_id_bits = bits_supported;
        }
        if (!supports_passthrough(i)) {
            printf("IOMMU: passthrough support required\n");
            return false;
        }
    }

    ia32KSnumIODomainIDBits = num_domain_id_bits;

    if (aw_bitmask & SAGAW_6_LEVEL) {
        max_num_iopt_levels = 6;
    } else if (aw_bitmask & SAGAW_5_LEVEL) {
        max_num_iopt_levels = 5;
    } else if (aw_bitmask & SAGAW_4_LEVEL) {
        max_num_iopt_levels = 4;
    } else if (aw_bitmask & SAGAW_3_LEVEL) {
        max_num_iopt_levels = 3;
    } else if (aw_bitmask & SAGAW_2_LEVEL) {
        max_num_iopt_levels = 2;
    } else {
        printf("IOMMU: mismatch of supported number of PT levels between IOMMUs\n");
        return false;
    }

    if (aw_bitmask & SAGAW_3_LEVEL) {
        ia32KSnumIOPTLevels = 3;
    } else if (aw_bitmask & SAGAW_4_LEVEL) {
        ia32KSnumIOPTLevels = 4;
    } else if (aw_bitmask & SAGAW_5_LEVEL) {
        ia32KSnumIOPTLevels = 5;
    } else if (aw_bitmask & SAGAW_6_LEVEL) {
        ia32KSnumIOPTLevels = 6;
    } else if (aw_bitmask & SAGAW_2_LEVEL) {
        ia32KSnumIOPTLevels = 2;
    } else {
        printf("IOMMU: mismatch of supported number of PT levels between IOMMUs\n");
        return false;
    }

    printf("IOMMU: Using %d page-table levels (max. supported: %d)\n", ia32KSnumIOPTLevels, max_num_iopt_levels);

    vtd_create_root_table();

    for (bus = 0; bus < 256; bus++) {
        if (pci_bus_used_bitmap[bus >> 5] & BIT(bus & MASK(5))) {
            vtd_create_context_table(
                bus,
                max_num_iopt_levels,
                num_passthrough_dev,
                passthrough_dev_list
            );
        }
    }

    flushCacheRange(ia32KSvtdRootTable, VTD_RT_SIZE_BITS);

    if (!vtd_enable(cpu_id)) {
        return false;
    }
    return true;
}

#endif
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/io.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <arch/kernel/boot_sys.h>
#include <arch/kernel/lock.h>
#include <arch/model/statedata.h>
#include <plat/machine/io.h>

#ifdef DEBUG

static uint16_t get_console_port(void)
{
    if (in_boot_phase()) {
        return console_port_of_node(node_of_cpu(cur_cpu_id()));
    } else {
        return ia32KSconsolePort;
    }
}

void serial_init(uint16_t port)
{
    while (!(in8(port + 5) & 0x60)); /* wait until not busy */

    out8(port + 1, 0x00); /* disable generating interrupts */
    out8(port + 3, 0x80); /* line control register: command: set divisor */
    out8(port,     0x01); /* set low byte of divisor to 0x01 = 115200 baud */
    out8(port + 1, 0x00); /* set high byte of divisor to 0x00 */
    out8(port + 3, 0x03); /* line control register: set 8 bit, no parity, 1 stop bit */
    out8(port + 4, 0x0b); /* modem control register: set DTR/RTS/OUT2 */

    in8(port);     /* clear recevier port */
    in8(port + 5); /* clear line status port */
    in8(port + 6); /* clear modem status port */
}

void console_putchar(char c)
{
    uint16_t port = get_console_port();

    lock_acquire(&lock_debug);

    if (port > 0) {
        while (!(in8(port + 5) & 0x60));
        out8(port, c);
        if (c == '\n') {
            while (!(in8(port + 5) & 0x60));
            out8(port, '\r');
        }
    }

    lock_release(&lock_debug);
}

#endif
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pci.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <machine/io.h>
#include <arch/kernel/boot_sys.h>
#include <arch/linker.h>
#include <plat/machine/pci.h>
#include <plat/machine/hardware.h>

#define PCI_CONF_PORT_ADDR     0x0CF8
#define PCI_CONF_PORT_DATA     0x0CFC

#define PCI_CONF_REG_VID       0x00
#define PCI_CONF_REG_DID       0x02
#define PCI_CONF_REG_HDR_TYPE  0x0E
#define PCI_CONF_REG_BAR       0x10

#define PCI_HDR_TYPE_NORMAL    0x00
#define PCI_HDR_TYPE_BRIDGE    0x01
#define PCI_HDR_TYPE_CARDBUS   0x02

BOOT_CODE static uint32_t
pci_read_reg32(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t reg)
{
    reg &= ~MASK(2);
    out32(PCI_CONF_PORT_ADDR, 0x80000000 | bus << 16 | dev << 11 | fun << 8 | reg);
    return in32(PCI_CONF_PORT_DATA);
}

BOOT_CODE static void
pci_write_reg32(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t reg, uint32_t val)
{
    reg &= ~MASK(2);
    out32(PCI_CONF_PORT_ADDR, 0x80000000 | bus << 16 | dev << 11 | fun << 8 | reg);
    out32(PCI_CONF_PORT_DATA, val);
}

BOOT_CODE static uint16_t
pci_read_reg16(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t reg)
{
    reg &= ~MASK(1);
    out32(PCI_CONF_PORT_ADDR, 0x80000000 | bus << 16 | dev << 11 | fun << 8 | (reg & ~MASK(2)));
    return in32(PCI_CONF_PORT_DATA) >> ((reg & MASK(2)) * 8);
}

/* Not used yet, avoid compiler warnings.
 *
BOOT_CODE static void
pci_write_reg16(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t reg, uint16_t val)
{
        reg &= ~MASK(1);
        out32(PCI_CONF_PORT_ADDR, 0x80000000 | bus << 16 | dev << 11 | fun << 8 | reg);
        out16(PCI_CONF_PORT_DATA, val);
}
*/

BOOT_CODE static uint8_t
pci_read_reg8(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t reg)
{
    out32(PCI_CONF_PORT_ADDR, 0x80000000 | bus << 16 | dev << 11 | fun << 8 | (reg & ~MASK(2)));
    return in32(PCI_CONF_PORT_DATA) >> ((reg & MASK(2)) * 8);
}

/* Not used yet, avoid compiler warnings.
 *
BOOT_CODE static void
pci_write_reg8(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t reg, uint8_t val)
{
        out32(PCI_CONF_PORT_ADDR, 0x80000000 | bus << 16 | dev << 11 | fun << 8 | reg);
        out8(PCI_CONF_PORT_DATA, val);
}
*/

BOOT_CODE static void
pci_scan_bars(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t count)
{
    pci_bar_t bar;
    pci_bar_t bar_save;
    paddr_t   map_base;
    uint32_t  map_size;
    uint32_t  map_size_bits;
    uint32_t  i;
    uint8_t   reg;

    for (i = 0; i < count; i++) {
        reg = PCI_CONF_REG_BAR + (i << 2);
        /* save base address written by BIOS */
        bar_save.words[0] = pci_read_reg32(bus, dev, fun, reg);
        /* write 0xffffffff in order to read size etc. */
        pci_write_reg32(bus, dev, fun, reg, 0xffffffff);
        bar.words[0] = pci_read_reg32(bus, dev, fun, reg);
        if (bar.words[0] != 0) {
            /* BAR is in use */
            printf("PCI:     BAR[%d] ", i);
            if (pci_bar_get_pci_space(bar) == pci_bar_pci_bar_mem) {
                map_size = ~(pci_bar_pci_bar_mem_get_base_address(bar) - 1);
                if (map_size < BIT(PAGE_BITS)) {
                    map_size = BIT(PAGE_BITS);
                }
                map_base = pci_bar_pci_bar_mem_get_base_address(bar_save);
                if (IS_ALIGNED(map_base, PAGE_BITS)) {
                    /* calculate map_size_bits */
                    map_size_bits = 0;
                    while ((map_size & BIT(map_size_bits)) == 0) {
                        map_size_bits++;
                    }
                    /* check whether map_size is a power of two */
                    if (map_size - BIT(map_size_bits) == 0) {
                        /* we have base/size, now do the mapping */
                        if (pci_bar_pci_bar_mem_get_above_4GB(bar)) {
                            if (pci_read_reg32(bus, dev, fun, reg + 4) != 0) {
                                printf("ignored: 64 bit BAR address above 4 GB\n");
                            } else {
                                printf("address=0x%x size=0x%x", map_base, map_size);
                                insert_dev_p_reg(
                                (p_region_t) {
                                    .start = map_base, .end = map_base + map_size
                                }
                                );
                            }
                            i++;
                        } else {
                            printf("address=0x%x size=0x%x",  map_base, map_size);
                            insert_dev_p_reg(
                            (p_region_t) {
                                .start = map_base, .end = map_base + map_size
                            }
                            );
                        }
                    } else {
                        printf("ignored: size corrupted (not a power of two): 0x%x\n", map_size);
                    }
                } else {
                    printf("ignored: address=0x%x not 4K aligned (size=0x%x)\n", map_base, map_size);
                }
            } else {
                /* pci_bar_pci_bar_io */
                printf("ignored: PCI IO space not supported\n");
            }
            /* write back address set by BIOS */
            pci_write_reg32(bus, dev, fun, reg, bar_save.words[0]);
        }
    }
}

BOOT_CODE static int
pci_scan_fun(uint8_t bus, uint8_t dev, uint8_t fun)
{
    uint16_t  did;
    uint8_t   type;
    uint16_t  vid;

    vid = pci_read_reg16(bus, dev, fun, PCI_CONF_REG_VID);
    if (vid != 0xffff) {

        did = pci_read_reg16(bus, dev, fun, PCI_CONF_REG_DID);
        type = pci_read_reg8(bus, dev, fun, PCI_CONF_REG_HDR_TYPE) & 0x7f;
        printf(
            "PCI: Detected device @ bus=0x%x dev=0x%x fun=0x%x: vid=0x%x did=0x%x type=",
            bus, dev, fun, vid, did
        );
        (void)did;
        switch (type) {
        case PCI_HDR_TYPE_NORMAL:
            printf("normal\n");
            pci_scan_bars(bus, dev, fun, 6);
            break;

        case PCI_HDR_TYPE_BRIDGE:
            printf("bridge\n");
            pci_scan_bars(bus, dev, fun, 2);
            break;

        case PCI_HDR_TYPE_CARDBUS:
            printf("cardbus\n");
            pci_scan_bars(bus, dev, fun, 1);
            break;

        default:
            printf("unknown (0x%x)\n", type);
            /* don't scan BARs */
            break;
        }
        return 1;
    }
    return 0;
}

BOOT_CODE void
pci_scan(uint32_t* bus_used_bitmap)
{
    bool_t    bus_used;
    uint16_t  bus;
    uint8_t   dev;
    uint8_t   fun;
    bool_t    multifunction;

    for (bus = 0; bus < 256; bus++) {
        bus_used = false;
        for (dev = 0; dev < 32; dev++) {
            if (pci_scan_fun(bus, dev, 0)) {
                multifunction = !!(pci_read_reg8(bus, dev, 0, PCI_CONF_REG_HDR_TYPE) & 0x80);
                bus_used = true;
                if (!multifunction) {
                    continue;
                }
            } else {
                continue;
            }

            for (fun = 1; fun < 8; fun++) {
                pci_scan_fun(bus, dev, fun);
            }
        }
        if (bus_used_bitmap && bus_used) {
            bus_used_bitmap[bus >> 5] |= BIT(bus & MASK(5));
        }
    }
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pic.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <arch/linker.h>
#include <plat/machine/io.h>
#include <plat/machine/hardware.h>
#include <plat/machine/pic.h>

/* PIC (i8259) base registers */
#define PIC1_BASE 0x20
#define PIC2_BASE 0xa0

/* Program PIC (i8259) to remap IRQs 0-15 to interrupt vectors starting at 'interrupt' */
BOOT_CODE void
pic_remap_irqs(interrupt_t interrupt)
{
    out8(PIC1_BASE, 0x11);
    out8(PIC2_BASE, 0x11);
    out8(PIC1_BASE + 1, interrupt);
    out8(PIC2_BASE + 1, interrupt + 8);
    out8(PIC1_BASE + 1, 0x04);
    out8(PIC2_BASE + 1, 0x02);
    out8(PIC1_BASE + 1, 0x01);
    out8(PIC2_BASE + 1, 0x01);
    out8(PIC1_BASE + 1, 0x0);
    out8(PIC2_BASE + 1, 0x0);
}

void pic_mask_irq(bool_t mask, irq_t irq)
{
    uint8_t  bit_mask;
    uint16_t pic_port;

    assert(irq >= irq_isa_min);
    assert(irq <= irq_isa_max);

    if (irq < 8) {
        bit_mask = BIT(irq);
        pic_port = PIC1_BASE + 1;
    } else {
        bit_mask = BIT(irq - 8);
        pic_port = PIC2_BASE + 1;
    }

    if (mask) {
        /* Disables the interrupt */
        out8(pic_port, (in8(pic_port) | bit_mask));
    } else {
        /* Enables the interrupt */
        out8(pic_port, (in8(pic_port) & ~bit_mask));
    }
}

bool_t pic_is_irq_pending(void)
{
    /* Interrupt Request Register (IRR) - holds pending IRQs */
    uint8_t irr;

    /* Send to PIC1's OCW3, in order to read IRR from next inb instruction */
    out8(PIC1_BASE, 0x0a);

    /* Read IRR */
    irr = in8(PIC1_BASE);

    /* Since slave PIC is connected to IRQ2 of master PIC,
     * there is no need to check IRR of slave PIC.
     */
    return irr != 0;
}

void pic_ack_active_irq(void)
{
    if (getActiveIRQ() >= irq_isa_min + 8) {
        /* ack slave PIC */
        out8(PIC2_BASE, 0x20);
    }
    /* ack master PIC */
    out8(PIC1_BASE, 0x20);
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pit.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <arch/linker.h>
#include <plat/machine/io.h>
#include <plat/machine/pit.h>

/* PIT (i8253) registers */
#define PIT_MODE 0x43
#define PIT_CH0  0x40

/* Count frequency in Hz */
#define PIT_HZ 1193180

PHYS_CODE void
pit_init(void)
{
    uint16_t divisor = (PIT_HZ * PIT_WRAPAROUND_MS) / 1000;

    out8_phys(PIT_MODE, 0x34);          /* Set mode 2 and wait for divisor bytes */
    out8_phys(PIT_CH0, divisor & 0xff); /* Set low byte of divisor */
    out8_phys(PIT_CH0, divisor >> 8);   /* Set high byte of divisor */
}

PHYS_CODE void
pit_wait_wraparound(void)
{
    uint16_t count;
    uint16_t count_old;

    out8_phys(PIT_MODE, 0x00);
    count = in8_phys(PIT_CH0);
    count |= (in8_phys(PIT_CH0) << 8);
    count_old = count;

    while (count <= count_old) {
        count_old = count;
        out8_phys(PIT_MODE, 0x00);
        count = in8_phys(PIT_CH0);
        count |= (in8_phys(PIT_CH0) << 8);
    }
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/util.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <assert.h>
#include <stdint.h>
#include <util.h>

/*
 * Zero 'n' bytes of memory starting from 's'.
 *
 * 'n' and 's' must be word aligned.
 */
void
memzero(void *s, unsigned int n)
{
    uint8_t *p = s;

    /* Ensure alignment constraints are met. */
    assert((unsigned int)s % 4 == 0);
    assert(n % 4 == 0);

    /* Write out words. */
    while (n != 0) {
        *(uint32_t *)p = 0;
        p += 4;
        n -= 4;
    }
}

void*
memset(void *s, unsigned int c, unsigned int n)
{
    uint8_t *p;

    /*
     * If we are only writing zeros and we are word aligned, we can
     * use the optimized 'memzero' function.
     */
    if (likely(c == 0 && ((uint32_t)s % 4) == 0 && (n % 4) == 0)) {
        memzero(s, n);
    } else {
        /* Otherwise, we use a slower, simple memset. */
        for (p = (uint8_t *)s; n > 0; n--, p++) {
            *p = (uint8_t)c;
        }
    }

    return s;
}

void*
memcpy(void* ptr_dst, const void* ptr_src, unsigned int n)
{
    uint8_t *p;
    const uint8_t *q;

    for (p = (uint8_t *)ptr_dst, q = (const uint8_t *)ptr_src; n; n--, p++, q++) {
        *p = *q;
    }

    return ptr_dst;
}

int
strncmp(const char* s1, const char* s2, int n)
{
    unsigned int i;
    int diff;

    for (i = 0; i < n; i++) {
        diff = ((unsigned char*)s1)[i] - ((unsigned char*)s2)[i];
        if (diff != 0 || s1[i] == '\0') {
            return diff;
        }
    }

    return 0;
}

int CONST
char_to_int(char c)
{
    if (c >= '0' && c <= '9') {
        return c - '0';
    } else if (c >= 'A' && c <= 'F') {
        return c - 'A' + 10;
    } else if (c >= 'a' && c <= 'f') {
        return c - 'a' + 10;
    }
    return -1;
}

int PURE
str_to_int(const char* str)
{
    unsigned int base;
    int res;
    int val = 0;
    char c;

    /*check for "0x" */
    if (*str == '0' && (*(str + 1) == 'x' || *(str + 1) == 'X')) {
        base = 16;
        str += 2;
    } else {
        base = 10;
    }

    if (!*str) {
        return -1;
    }

    c = *str;
    while (c != '\0') {
        res = char_to_int(c);
        if (res == -1 || res >= base) {
            return -1;
        }
        val = val * base + res;
        str++;
        c = *str;
    }

    return val;
}
#line 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/config/default_domain.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

#include <object/structures.h>
#include <model/statedata.h>

/* Default schedule. */
const dschedule_t ksDomSchedule[] = {
    { .domain = 0, .length = 1 },
};

const unsigned int ksDomScheduleLength = sizeof(ksDomSchedule) / sizeof(dschedule_t);

