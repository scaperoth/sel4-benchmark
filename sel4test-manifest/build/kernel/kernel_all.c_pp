# 1 "kernel_all.c"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
/* Copyright (C) 1991-2014 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */




/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */

/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
# 52 "/usr/include/stdc-predef.h" 3 4
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */


/* We do not support C11 <threads.h>.  */
# 1 "<command-line>" 2
# 1 "kernel_all.c"
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/stdint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/stdint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;

typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;
typedef signed long long int64_t;
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/stdint.h" 2
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




/* Compile-time configuration parameters. Might be set by the build system. */


# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/include/generated/autoconf.h" 1
/*
 * Automatically generated C config: don't edit
 * Project Configuration
 * Fri Sep 19 13:15:17 2014
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 2


/* size of the initial thread's root CNode (2^x slots, x >= 4) */




/* number of timer ticks until a thread is preempted  */




/* the number of scheduler domains */




/* number of priorities per domain */




/* maximum number of caps that can be created in one retype invocation */




/* maximum number of iterations until we preempt a delete/revoke invocation */




/* address range to flush per preemption work unit */




/* maximum number of device regions in bootinfo */
/* WARNING: must match value in libsel4! */




/* maximum number of untyped caps in bootinfo */
/* WARNING: must match value in libsel4! */
/* CONSTRAINT: (16 * CONFIG_MAX_NUM_BOOTINFO_DEVICE_REGIONS) + (5 * CONFIG_MAX_NUM_BOOTINFO_UNTYPED_CAPS) <= 4036 */




/* length of a timer tick in ms  */




/* Configuration parameters below are for IA-32 only. */

/* maximum number of nodes supported (if 1, a uniprocessor version is compiled) */




/* maximum number of PCI devices that can be marked as passthrough (IOMMU RMRR device scopes) */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/stdint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 43 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h"
/* Borrowed from linux/include/linux/compiler.h */







/* need that for compiling with c99 instead of gnu99 */


/* Evaluate a Kconfig-provided configuration setting at compile-time. */






/** MODIFIES:
    FNSPEC
        halt_spec: "\<Gamma> \<turnstile> {} Call halt_'proc {}"
*/
void halt(void) __attribute__((__noreturn__));
void memzero(void *s, unsigned int n);
void *memset(void *s, unsigned int c, unsigned int n);
void *memcpy(void* ptr_dst, const void* ptr_src, unsigned int n);
int strncmp(const char *s1, const char *s2, int n);
int __attribute__((__const__)) char_to_int(char c);
int __attribute__((__pure__)) str_to_int(const char* str);
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 2
# 1 "./api/types_gen.h" 1



# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 2
# 5 "./api/types_gen.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 6 "./api/types_gen.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/stdint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 7 "./api/types_gen.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 8 "./api/types_gen.h" 2
struct message_info {
    uint32_t words[1];
};
typedef struct message_info message_info_t;

static inline message_info_t __attribute__((__const__))
message_info_new(uint32_t msgLabel, uint32_t msgCapsUnwrapped, uint32_t msgExtraCaps, uint32_t msgLength) {
    message_info_t message_info;

    message_info.words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    message_info.words[0] |= (msgLabel & 0xfffff) << 12;
/* fail if user has passed bits that we will override */
    ;

    message_info.words[0] |= (msgCapsUnwrapped & 0x7) << 9;
/* fail if user has passed bits that we will override */
    ;

    message_info.words[0] |= (msgExtraCaps & 0x3) << 7;
/* fail if user has passed bits that we will override */
    ;

    message_info.words[0] |= (msgLength & 0x7f) << 0;

    return message_info;
}

static inline uint32_t __attribute__((__const__))
message_info_get_msgLabel(message_info_t message_info) {
    return (message_info.words[0] & 0xfffff000) >> 12;
}

static inline uint32_t __attribute__((__const__))
message_info_get_msgCapsUnwrapped(message_info_t message_info) {
    return (message_info.words[0] & 0xe00) >> 9;
}

static inline message_info_t __attribute__((__const__))
message_info_set_msgCapsUnwrapped(message_info_t message_info, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    message_info.words[0] &= ~0xe00;
    message_info.words[0] |= (v << 9) & 0xe00;
    return message_info;
}

static inline uint32_t __attribute__((__const__))
message_info_get_msgExtraCaps(message_info_t message_info) {
    return (message_info.words[0] & 0x180) >> 7;
}

static inline message_info_t __attribute__((__const__))
message_info_set_msgExtraCaps(message_info_t message_info, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    message_info.words[0] &= ~0x180;
    message_info.words[0] |= (v << 7) & 0x180;
    return message_info;
}

static inline uint32_t __attribute__((__const__))
message_info_get_msgLength(message_info_t message_info) {
    return (message_info.words[0] & 0x7f) >> 0;
}

static inline message_info_t __attribute__((__const__))
message_info_set_msgLength(message_info_t message_info, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    message_info.words[0] &= ~0x7f;
    message_info.words[0] |= (v << 0) & 0x7f;
    return message_info;
}

struct cap_rights {
    uint32_t words[1];
};
typedef struct cap_rights cap_rights_t;

static inline cap_rights_t __attribute__((__const__))
cap_rights_new(uint32_t capAllowGrant, uint32_t capAllowRead, uint32_t capAllowWrite) {
    cap_rights_t cap_rights;

    cap_rights.words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap_rights.words[0] |= (capAllowGrant & 0x1) << 2;
/* fail if user has passed bits that we will override */
    ;

    cap_rights.words[0] |= (capAllowRead & 0x1) << 1;
/* fail if user has passed bits that we will override */
    ;

    cap_rights.words[0] |= (capAllowWrite & 0x1) << 0;

    return cap_rights;
}

static inline uint32_t __attribute__((__const__))
cap_rights_get_capAllowGrant(cap_rights_t cap_rights) {
    return (cap_rights.words[0] & 0x4) >> 2;
}

static inline uint32_t __attribute__((__const__))
cap_rights_get_capAllowRead(cap_rights_t cap_rights) {
    return (cap_rights.words[0] & 0x2) >> 1;
}

static inline uint32_t __attribute__((__const__))
cap_rights_get_capAllowWrite(cap_rights_t cap_rights) {
    return (cap_rights.words[0] & 0x1) >> 0;
}
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




typedef enum api_object {
    seL4_UntypedObject,
    seL4_TCBObject,
    seL4_EndpointObject,
    seL4_AsyncEndpointObject,
    seL4_CapTableObject,
    seL4_NonArchObjectTypeCount,
} seL4_ObjectType;

typedef uint32_t api_object_t;
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/api/types.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/api/types.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/api/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




typedef enum _object {
    seL4_IA32_4K = seL4_NonArchObjectTypeCount,
    seL4_IA32_4M,
    seL4_IA32_PageTableObject,
    seL4_IA32_PageDirectoryObject,



    seL4_ObjectTypeCount
} seL4_ArchObjectType;
typedef uint32_t object_t;
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/api/types.h" 2



enum asidConstants {
    asidInvalid = 0
};



typedef uint32_t asid_t;
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/stdint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 2

typedef uint32_t word_t;
typedef uint32_t vptr_t;
typedef uint32_t paddr_t;
typedef uint32_t pptr_t;

typedef uint32_t dev_id_t;
typedef uint32_t cpu_id_t;
typedef uint32_t node_id_t;
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/constants.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */






enum priorityConstants {
    seL4_InvalidPrio = -1,
    seL4_MinPrio = 0,
    seL4_MaxPrio = 255
};

/* message_info_t defined in api/types.bf */

enum seL4_MsgLimits {
    seL4_MsgLengthBits = 7,
    seL4_MsgExtraCapBits = 2
};
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 2

/* cap_rights_t defined in api/types.bf */

typedef uint32_t prio_t;
typedef uint32_t dom_t;
typedef uint32_t cptr_t;

enum domainConstants {
    minDom = 0,
    maxDom = 1 - 1
};

struct cap_transfer {
    cptr_t ctReceiveRoot;
    cptr_t ctReceiveIndex;
    unsigned int ctReceiveDepth;
};
typedef struct cap_transfer cap_transfer_t;

enum ctLimits {
    capTransferDataSize = 3
};

static inline cap_rights_t __attribute__((__const__))
rightsFromWord(word_t w)
{
    cap_rights_t cap_rights;

    cap_rights.words[0] = w;
    return cap_rights;
}

static inline word_t __attribute__((__const__))
wordFromRights(cap_rights_t cap_rights)
{
    return cap_rights.words[0] & ((1ul<<(3))-1ul);
}

static inline cap_transfer_t __attribute__((__pure__))
capTransferFromWords(word_t *wptr)
{
    cap_transfer_t transfer;

    transfer.ctReceiveRoot = (cptr_t)wptr[0];
    transfer.ctReceiveIndex = (cptr_t)wptr[1];
    transfer.ctReceiveDepth = (unsigned int)wptr[2];
    return transfer;
}

static inline message_info_t __attribute__((__const__))
messageInfoFromWord_raw(word_t w)
{
    message_info_t mi;

    mi.words[0] = w;
    return mi;
}

static inline message_info_t __attribute__((__const__))
messageInfoFromWord(word_t w)
{
    message_info_t mi;
    word_t len;

    mi.words[0] = w;

    len = message_info_get_msgLength(mi);
    if (len > 120) {
        mi = message_info_set_msgLength(mi, 120);
    }

    return mi;
}

static inline word_t __attribute__((__const__))
wordFromMessageInfo(message_info_t mi)
{
    return mi.words[0];
}
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/stdint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 2

enum irq_state {
    IRQInactive = 0,
    IRQNotifyAEP = 1,
    IRQTimer = 2,
    IRQReserved = 3,
};
typedef uint32_t irq_state_t;

typedef struct dschedule {
    dom_t domain;
    uint32_t length;
} dschedule_t;

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 2
# 1 "./arch/object/structures_gen.h" 1



# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 5 "./arch/object/structures_gen.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 6 "./arch/object/structures_gen.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/stdint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 7 "./arch/object/structures_gen.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 8 "./arch/object/structures_gen.h" 2
struct io_port_capdata {
    uint32_t words[1];
};
typedef struct io_port_capdata io_port_capdata_t;

static inline uint32_t __attribute__((__const__))
io_port_capdata_get_firstPort(io_port_capdata_t io_port_capdata) {
    return (io_port_capdata.words[0] & 0xffff0000) >> 16;
}

static inline uint32_t __attribute__((__const__))
io_port_capdata_get_lastPort(io_port_capdata_t io_port_capdata) {
    return (io_port_capdata.words[0] & 0xffff) >> 0;
}

struct pte {
    uint32_t words[1];
};
typedef struct pte pte_t;

static inline pte_t __attribute__((__const__))
pte_new(uint32_t page_base_address, uint32_t avl, uint32_t global, uint32_t pat, uint32_t dirty, uint32_t accessed, uint32_t cache_disabled, uint32_t write_through, uint32_t super_user, uint32_t read_write, uint32_t present) {
    pte_t pte;

    pte.words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (page_base_address & 0xfffff000) >> 0;
/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (avl & 0x7) << 9;
/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (global & 0x1) << 8;
/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (pat & 0x1) << 7;
/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (dirty & 0x1) << 6;
/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (accessed & 0x1) << 5;
/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (cache_disabled & 0x1) << 4;
/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (write_through & 0x1) << 3;
/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (super_user & 0x1) << 2;
/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (read_write & 0x1) << 1;
/* fail if user has passed bits that we will override */
    ;

    pte.words[0] |= (present & 0x1) << 0;

    return pte;
}

static inline void
pte_ptr_new(pte_t *pte_ptr, uint32_t page_base_address, uint32_t avl, uint32_t global, uint32_t pat, uint32_t dirty, uint32_t accessed, uint32_t cache_disabled, uint32_t write_through, uint32_t super_user, uint32_t read_write, uint32_t present) {
    pte_ptr->words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (page_base_address & 0xfffff000) >> 0;
/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (avl & 0x7) << 9;
/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (global & 0x1) << 8;
/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (pat & 0x1) << 7;
/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (dirty & 0x1) << 6;
/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (accessed & 0x1) << 5;
/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (cache_disabled & 0x1) << 4;
/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (write_through & 0x1) << 3;
/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (super_user & 0x1) << 2;
/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (read_write & 0x1) << 1;
/* fail if user has passed bits that we will override */
    ;

    pte_ptr->words[0] |= (present & 0x1) << 0;
}

static inline uint32_t __attribute__((__pure__))
pte_ptr_get_page_base_address(pte_t *pte_ptr) {
    return (pte_ptr->words[0] & 0xfffff000) << 0;
}

static inline uint32_t __attribute__((__const__))
pte_get_present(pte_t pte) {
    return (pte.words[0] & 0x1) >> 0;
}

static inline uint32_t __attribute__((__pure__))
pte_ptr_get_present(pte_t *pte_ptr) {
    return (pte_ptr->words[0] & 0x1) >> 0;
}

struct async_endpoint {
    uint32_t words[4];
};
typedef struct async_endpoint async_endpoint_t;

static inline uint32_t __attribute__((__pure__))
async_endpoint_ptr_get_aepData(async_endpoint_t *async_endpoint_ptr) {
    return (async_endpoint_ptr->words[3] & 0xffffffff) >> 0;
}

static inline void
async_endpoint_ptr_set_aepData(async_endpoint_t *async_endpoint_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    async_endpoint_ptr->words[3] &= ~0xffffffff;
    async_endpoint_ptr->words[3] |= (v << 0) & 0xffffffff;
}

static inline uint32_t __attribute__((__pure__))
async_endpoint_ptr_get_aepMsgIdentifier(async_endpoint_t *async_endpoint_ptr) {
    return (async_endpoint_ptr->words[2] & 0xffffffff) >> 0;
}

static inline void
async_endpoint_ptr_set_aepMsgIdentifier(async_endpoint_t *async_endpoint_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    async_endpoint_ptr->words[2] &= ~0xffffffff;
    async_endpoint_ptr->words[2] |= (v << 0) & 0xffffffff;
}

static inline uint32_t __attribute__((__pure__))
async_endpoint_ptr_get_aepQueue_head(async_endpoint_t *async_endpoint_ptr) {
    return (async_endpoint_ptr->words[1] & 0xfffffff0) << 0;
}

static inline void
async_endpoint_ptr_set_aepQueue_head(async_endpoint_t *async_endpoint_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    async_endpoint_ptr->words[1] &= ~0xfffffff0;
    async_endpoint_ptr->words[1] |= (v >> 0) & 0xfffffff0;
}

static inline uint32_t __attribute__((__pure__))
async_endpoint_ptr_get_aepQueue_tail(async_endpoint_t *async_endpoint_ptr) {
    return (async_endpoint_ptr->words[0] & 0xfffffff0) << 0;
}

static inline void
async_endpoint_ptr_set_aepQueue_tail(async_endpoint_t *async_endpoint_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    async_endpoint_ptr->words[0] &= ~0xfffffff0;
    async_endpoint_ptr->words[0] |= (v >> 0) & 0xfffffff0;
}

static inline uint32_t __attribute__((__pure__))
async_endpoint_ptr_get_state(async_endpoint_t *async_endpoint_ptr) {
    return (async_endpoint_ptr->words[0] & 0x3) >> 0;
}

static inline void
async_endpoint_ptr_set_state(async_endpoint_t *async_endpoint_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    async_endpoint_ptr->words[0] &= ~0x3;
    async_endpoint_ptr->words[0] |= (v << 0) & 0x3;
}

struct apic_icr2 {
    uint32_t words[1];
};
typedef struct apic_icr2 apic_icr2_t;

static inline apic_icr2_t __attribute__((__const__))
apic_icr2_new(uint32_t dest) {
    apic_icr2_t apic_icr2;

    apic_icr2.words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    apic_icr2.words[0] |= (dest & 0xff) << 24;

    return apic_icr2;
}

struct apic_base_msr {
    uint32_t words[1];
};
typedef struct apic_base_msr apic_base_msr_t;

static inline uint32_t __attribute__((__const__))
apic_base_msr_get_base_addr(apic_base_msr_t apic_base_msr) {
    return (apic_base_msr.words[0] & 0xfffff000) << 0;
}

static inline uint32_t __attribute__((__const__))
apic_base_msr_get_enabled(apic_base_msr_t apic_base_msr) {
    return (apic_base_msr.words[0] & 0x800) >> 11;
}

struct tss {
    uint32_t words[26];
};
typedef struct tss tss_t;

static inline void
tss_ptr_new(tss_t *tss_ptr, uint32_t io_map_base, uint32_t trap, uint32_t sel_ldt, uint32_t gs, uint32_t fs, uint32_t ds, uint32_t ss, uint32_t cs, uint32_t es, uint32_t edi, uint32_t esi, uint32_t ebp, uint32_t esp, uint32_t ebx, uint32_t edx, uint32_t ecx, uint32_t eax, uint32_t eflags, uint32_t eip, uint32_t cr3, uint32_t ss2, uint32_t esp2, uint32_t ss1, uint32_t esp1, uint32_t ss0, uint32_t esp0, uint32_t prev_task) {
    tss_ptr->words[0] = 0;
    tss_ptr->words[1] = 0;
    tss_ptr->words[2] = 0;
    tss_ptr->words[3] = 0;
    tss_ptr->words[4] = 0;
    tss_ptr->words[5] = 0;
    tss_ptr->words[6] = 0;
    tss_ptr->words[7] = 0;
    tss_ptr->words[8] = 0;
    tss_ptr->words[9] = 0;
    tss_ptr->words[10] = 0;
    tss_ptr->words[11] = 0;
    tss_ptr->words[12] = 0;
    tss_ptr->words[13] = 0;
    tss_ptr->words[14] = 0;
    tss_ptr->words[15] = 0;
    tss_ptr->words[16] = 0;
    tss_ptr->words[17] = 0;
    tss_ptr->words[18] = 0;
    tss_ptr->words[19] = 0;
    tss_ptr->words[20] = 0;
    tss_ptr->words[21] = 0;
    tss_ptr->words[22] = 0;
    tss_ptr->words[23] = 0;
    tss_ptr->words[24] = 0;
    tss_ptr->words[25] = 0;

/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[25] |= (io_map_base & 0xffff) << 16;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[25] |= (trap & 0x1) << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[24] |= (sel_ldt & 0xffff) << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[23] |= (gs & 0xffff) << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[22] |= (fs & 0xffff) << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[21] |= (ds & 0xffff) << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[20] |= (ss & 0xffff) << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[19] |= (cs & 0xffff) << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[18] |= (es & 0xffff) << 0;
    tss_ptr->words[17] |= edi << 0;
    tss_ptr->words[16] |= esi << 0;
    tss_ptr->words[15] |= ebp << 0;
    tss_ptr->words[14] |= esp << 0;
    tss_ptr->words[13] |= ebx << 0;
    tss_ptr->words[12] |= edx << 0;
    tss_ptr->words[11] |= ecx << 0;
    tss_ptr->words[10] |= eax << 0;
    tss_ptr->words[9] |= eflags << 0;
    tss_ptr->words[8] |= eip << 0;
    tss_ptr->words[7] |= cr3 << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[6] |= (ss2 & 0xffff) << 0;
    tss_ptr->words[5] |= esp2 << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[4] |= (ss1 & 0xffff) << 0;
    tss_ptr->words[3] |= esp1 << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[2] |= (ss0 & 0xffff) << 0;
    tss_ptr->words[1] |= esp0 << 0;
/* fail if user has passed bits that we will override */
    ;

    tss_ptr->words[0] |= (prev_task & 0xffff) << 0;
}

static inline void
tss_ptr_set_esp0(tss_t *tss_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    tss_ptr->words[1] &= ~0xffffffff;
    tss_ptr->words[1] |= (v << 0) & 0xffffffff;
}

struct apic_lvt {
    uint32_t words[1];
};
typedef struct apic_lvt apic_lvt_t;

static inline apic_lvt_t __attribute__((__const__))
apic_lvt_new(uint32_t timer_mode, uint32_t masked, uint32_t trigger_mode, uint32_t remote_irr, uint32_t pin_polarity, uint32_t delivery_status, uint32_t delivery_mode, uint32_t vector) {
    apic_lvt_t apic_lvt;

    apic_lvt.words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    apic_lvt.words[0] |= (timer_mode & 0x3) << 17;
/* fail if user has passed bits that we will override */
    ;

    apic_lvt.words[0] |= (masked & 0x1) << 16;
/* fail if user has passed bits that we will override */
    ;

    apic_lvt.words[0] |= (trigger_mode & 0x1) << 15;
/* fail if user has passed bits that we will override */
    ;

    apic_lvt.words[0] |= (remote_irr & 0x1) << 14;
/* fail if user has passed bits that we will override */
    ;

    apic_lvt.words[0] |= (pin_polarity & 0x1) << 13;
/* fail if user has passed bits that we will override */
    ;

    apic_lvt.words[0] |= (delivery_status & 0x1) << 12;
/* fail if user has passed bits that we will override */
    ;

    apic_lvt.words[0] |= (delivery_mode & 0x7) << 8;
/* fail if user has passed bits that we will override */
    ;

    apic_lvt.words[0] |= (vector & 0xff) << 0;

    return apic_lvt;
}

struct endpoint {
    uint32_t words[4];
};
typedef struct endpoint endpoint_t;

static inline uint32_t __attribute__((__pure__))
endpoint_ptr_get_epQueue_head(endpoint_t *endpoint_ptr) {
    return (endpoint_ptr->words[1] & 0xfffffff0) << 0;
}

static inline void
endpoint_ptr_set_epQueue_head(endpoint_t *endpoint_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    endpoint_ptr->words[1] &= ~0xfffffff0;
    endpoint_ptr->words[1] |= (v >> 0) & 0xfffffff0;
}

static inline uint32_t __attribute__((__pure__))
endpoint_ptr_get_epQueue_tail(endpoint_t *endpoint_ptr) {
    return (endpoint_ptr->words[0] & 0xfffffff0) << 0;
}

static inline void
endpoint_ptr_set_epQueue_tail(endpoint_t *endpoint_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    endpoint_ptr->words[0] &= ~0xfffffff0;
    endpoint_ptr->words[0] |= (v >> 0) & 0xfffffff0;
}

static inline uint32_t __attribute__((__pure__))
endpoint_ptr_get_state(endpoint_t *endpoint_ptr) {
    return (endpoint_ptr->words[0] & 0x3) >> 0;
}

static inline void
endpoint_ptr_set_state(endpoint_t *endpoint_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    endpoint_ptr->words[0] &= ~0x3;
    endpoint_ptr->words[0] |= (v << 0) & 0x3;
}

struct vm_attributes {
    uint32_t words[1];
};
typedef struct vm_attributes vm_attributes_t;

static inline uint32_t __attribute__((__const__))
vm_attributes_get_ia32PATBit(vm_attributes_t vm_attributes) {
    return (vm_attributes.words[0] & 0x4) >> 2;
}

static inline uint32_t __attribute__((__const__))
vm_attributes_get_ia32PCDBit(vm_attributes_t vm_attributes) {
    return (vm_attributes.words[0] & 0x2) >> 1;
}

static inline uint32_t __attribute__((__const__))
vm_attributes_get_ia32PWTBit(vm_attributes_t vm_attributes) {
    return (vm_attributes.words[0] & 0x1) >> 0;
}

struct apic_svr {
    uint32_t words[1];
};
typedef struct apic_svr apic_svr_t;

static inline apic_svr_t __attribute__((__const__))
apic_svr_new(uint32_t focus_processor_chk, uint32_t enabled, uint32_t spurious_vector) {
    apic_svr_t apic_svr;

    apic_svr.words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    apic_svr.words[0] |= (focus_processor_chk & 0x1) << 9;
/* fail if user has passed bits that we will override */
    ;

    apic_svr.words[0] |= (enabled & 0x1) << 8;
/* fail if user has passed bits that we will override */
    ;

    apic_svr.words[0] |= (spurious_vector & 0xff) << 0;

    return apic_svr;
}

struct cnode_capdata {
    uint32_t words[1];
};
typedef struct cnode_capdata cnode_capdata_t;

static inline uint32_t __attribute__((__const__))
cnode_capdata_get_guard(cnode_capdata_t cnode_capdata) {
    return (cnode_capdata.words[0] & 0x3ffff00) >> 8;
}

static inline uint32_t __attribute__((__const__))
cnode_capdata_get_guardSize(cnode_capdata_t cnode_capdata) {
    return (cnode_capdata.words[0] & 0xf8) >> 3;
}

struct thread_state {
    uint32_t words[3];
};
typedef struct thread_state thread_state_t;

static inline uint32_t __attribute__((__pure__))
thread_state_ptr_get_blockingIPCBadge(thread_state_t *thread_state_ptr) {
    return (thread_state_ptr->words[2] & 0xfffffff8) >> 3;
}

static inline void
thread_state_ptr_set_blockingIPCBadge(thread_state_t *thread_state_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    thread_state_ptr->words[2] &= ~0xfffffff8;
    thread_state_ptr->words[2] |= (v << 3) & 0xfffffff8;
}

static inline uint32_t __attribute__((__pure__))
thread_state_ptr_get_blockingIPCCanGrant(thread_state_t *thread_state_ptr) {
    return (thread_state_ptr->words[2] & 0x4) >> 2;
}

static inline void
thread_state_ptr_set_blockingIPCCanGrant(thread_state_t *thread_state_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    thread_state_ptr->words[2] &= ~0x4;
    thread_state_ptr->words[2] |= (v << 2) & 0x4;
}

static inline uint32_t __attribute__((__pure__))
thread_state_ptr_get_blockingIPCIsCall(thread_state_t *thread_state_ptr) {
    return (thread_state_ptr->words[2] & 0x2) >> 1;
}

static inline void
thread_state_ptr_set_blockingIPCIsCall(thread_state_t *thread_state_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    thread_state_ptr->words[2] &= ~0x2;
    thread_state_ptr->words[2] |= (v << 1) & 0x2;
}

static inline uint32_t __attribute__((__const__))
thread_state_get_tcbQueued(thread_state_t thread_state) {
    return (thread_state.words[2] & 0x1) >> 0;
}

static inline void
thread_state_ptr_set_tcbQueued(thread_state_t *thread_state_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    thread_state_ptr->words[2] &= ~0x1;
    thread_state_ptr->words[2] |= (v << 0) & 0x1;
}

static inline uint32_t __attribute__((__const__))
thread_state_get_blockingIPCDiminishCaps(thread_state_t thread_state) {
    return (thread_state.words[1] & 0x1) >> 0;
}

static inline uint32_t __attribute__((__pure__))
thread_state_ptr_get_blockingIPCDiminishCaps(thread_state_t *thread_state_ptr) {
    return (thread_state_ptr->words[1] & 0x1) >> 0;
}

static inline void
thread_state_ptr_set_blockingIPCDiminishCaps(thread_state_t *thread_state_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    thread_state_ptr->words[1] &= ~0x1;
    thread_state_ptr->words[1] |= (v << 0) & 0x1;
}

static inline uint32_t __attribute__((__pure__))
thread_state_ptr_get_blockingIPCEndpoint(thread_state_t *thread_state_ptr) {
    return (thread_state_ptr->words[0] & 0xfffffff0) << 0;
}

static inline void
thread_state_ptr_set_blockingIPCEndpoint(thread_state_t *thread_state_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    thread_state_ptr->words[0] &= ~0xfffffff0;
    thread_state_ptr->words[0] |= (v >> 0) & 0xfffffff0;
}

static inline uint32_t __attribute__((__const__))
thread_state_get_tsType(thread_state_t thread_state) {
    return (thread_state.words[0] & 0xf) >> 0;
}

static inline uint32_t __attribute__((__pure__))
thread_state_ptr_get_tsType(thread_state_t *thread_state_ptr) {
    return (thread_state_ptr->words[0] & 0xf) >> 0;
}

static inline void
thread_state_ptr_set_tsType(thread_state_t *thread_state_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    thread_state_ptr->words[0] &= ~0xf;
    thread_state_ptr->words[0] |= (v << 0) & 0xf;
}

struct ia32_pat_msr {
    uint32_t words[2];
};
typedef struct ia32_pat_msr ia32_pat_msr_t;

static inline void
ia32_pat_msr_ptr_set_pa4(ia32_pat_msr_t *ia32_pat_msr_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    ia32_pat_msr_ptr->words[1] &= ~0x7;
    ia32_pat_msr_ptr->words[1] |= (v << 0) & 0x7;
}

static inline void
ia32_pat_msr_ptr_set_pa3(ia32_pat_msr_t *ia32_pat_msr_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    ia32_pat_msr_ptr->words[0] &= ~0x7000000;
    ia32_pat_msr_ptr->words[0] |= (v << 24) & 0x7000000;
}

static inline void
ia32_pat_msr_ptr_set_pa2(ia32_pat_msr_t *ia32_pat_msr_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    ia32_pat_msr_ptr->words[0] &= ~0x70000;
    ia32_pat_msr_ptr->words[0] |= (v << 16) & 0x70000;
}

static inline void
ia32_pat_msr_ptr_set_pa1(ia32_pat_msr_t *ia32_pat_msr_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    ia32_pat_msr_ptr->words[0] &= ~0x700;
    ia32_pat_msr_ptr->words[0] |= (v << 8) & 0x700;
}

static inline void
ia32_pat_msr_ptr_set_pa0(ia32_pat_msr_t *ia32_pat_msr_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    ia32_pat_msr_ptr->words[0] &= ~0x7;
    ia32_pat_msr_ptr->words[0] |= (v << 0) & 0x7;
}

struct apic_version {
    uint32_t words[1];
};
typedef struct apic_version apic_version_t;

static inline uint32_t __attribute__((__const__))
apic_version_get_max_lvt_entry(apic_version_t apic_version) {
    return (apic_version.words[0] & 0xff0000) >> 16;
}

static inline uint32_t __attribute__((__const__))
apic_version_get_version(apic_version_t apic_version) {
    return (apic_version.words[0] & 0xff) >> 0;
}

struct apic_icr1 {
    uint32_t words[1];
};
typedef struct apic_icr1 apic_icr1_t;

static inline apic_icr1_t __attribute__((__const__))
apic_icr1_new(uint32_t dest_shorthand, uint32_t trigger_mode, uint32_t level, uint32_t delivery_status, uint32_t dest_mode, uint32_t delivery_mode, uint32_t vector) {
    apic_icr1_t apic_icr1;

    apic_icr1.words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    apic_icr1.words[0] |= (dest_shorthand & 0x3) << 18;
/* fail if user has passed bits that we will override */
    ;

    apic_icr1.words[0] |= (trigger_mode & 0x1) << 15;
/* fail if user has passed bits that we will override */
    ;

    apic_icr1.words[0] |= (level & 0x1) << 14;
/* fail if user has passed bits that we will override */
    ;

    apic_icr1.words[0] |= (delivery_status & 0x1) << 12;
/* fail if user has passed bits that we will override */
    ;

    apic_icr1.words[0] |= (dest_mode & 0x1) << 11;
/* fail if user has passed bits that we will override */
    ;

    apic_icr1.words[0] |= (delivery_mode & 0x7) << 8;
/* fail if user has passed bits that we will override */
    ;

    apic_icr1.words[0] |= (vector & 0xff) << 0;

    return apic_icr1;
}

struct mdb_node {
    uint32_t words[2];
};
typedef struct mdb_node mdb_node_t;

static inline mdb_node_t __attribute__((__const__))
mdb_node_new(uint32_t mdbNext, uint32_t mdbRevocable, uint32_t mdbFirstBadged, uint32_t mdbPrev) {
    mdb_node_t mdb_node;

    mdb_node.words[0] = 0;
    mdb_node.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    mdb_node.words[1] |= (mdbNext & 0xfffffff8) >> 0;
/* fail if user has passed bits that we will override */
    ;

    mdb_node.words[1] |= (mdbRevocable & 0x1) << 1;
/* fail if user has passed bits that we will override */
    ;

    mdb_node.words[1] |= (mdbFirstBadged & 0x1) << 0;
/* fail if user has passed bits that we will override */
    ;

    mdb_node.words[0] |= (mdbPrev & 0xfffffff8) >> 0;

    return mdb_node;
}

static inline uint32_t __attribute__((__const__))
mdb_node_get_mdbNext(mdb_node_t mdb_node) {
    return (mdb_node.words[1] & 0xfffffff8) << 0;
}

static inline void
mdb_node_ptr_set_mdbNext(mdb_node_t *mdb_node_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    mdb_node_ptr->words[1] &= ~0xfffffff8;
    mdb_node_ptr->words[1] |= (v >> 0) & 0xfffffff8;
}

static inline uint32_t __attribute__((__const__))
mdb_node_get_mdbRevocable(mdb_node_t mdb_node) {
    return (mdb_node.words[1] & 0x2) >> 1;
}

static inline mdb_node_t __attribute__((__const__))
mdb_node_set_mdbRevocable(mdb_node_t mdb_node, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    mdb_node.words[1] &= ~0x2;
    mdb_node.words[1] |= (v << 1) & 0x2;
    return mdb_node;
}

static inline void
mdb_node_ptr_set_mdbRevocable(mdb_node_t *mdb_node_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    mdb_node_ptr->words[1] &= ~0x2;
    mdb_node_ptr->words[1] |= (v << 1) & 0x2;
}

static inline uint32_t __attribute__((__const__))
mdb_node_get_mdbFirstBadged(mdb_node_t mdb_node) {
    return (mdb_node.words[1] & 0x1) >> 0;
}

static inline mdb_node_t __attribute__((__const__))
mdb_node_set_mdbFirstBadged(mdb_node_t mdb_node, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    mdb_node.words[1] &= ~0x1;
    mdb_node.words[1] |= (v << 0) & 0x1;
    return mdb_node;
}

static inline void
mdb_node_ptr_set_mdbFirstBadged(mdb_node_t *mdb_node_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    mdb_node_ptr->words[1] &= ~0x1;
    mdb_node_ptr->words[1] |= (v << 0) & 0x1;
}

static inline uint32_t __attribute__((__const__))
mdb_node_get_mdbPrev(mdb_node_t mdb_node) {
    return (mdb_node.words[0] & 0xfffffff8) << 0;
}

static inline mdb_node_t __attribute__((__const__))
mdb_node_set_mdbPrev(mdb_node_t mdb_node, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    mdb_node.words[0] &= ~0xfffffff8;
    mdb_node.words[0] |= (v >> 0) & 0xfffffff8;
    return mdb_node;
}

static inline void
mdb_node_ptr_set_mdbPrev(mdb_node_t *mdb_node_ptr, uint32_t v) {
    /* fail if user has passed bits that we will override */
    ;
    mdb_node_ptr->words[0] &= ~0xfffffff8;
    mdb_node_ptr->words[0] |= (v >> 0) & 0xfffffff8;
}

struct cap {
    uint32_t words[2];
};
typedef struct cap cap_t;

enum cap_tag {
    cap_null_cap = 0,
    cap_untyped_cap = 2,
    cap_endpoint_cap = 4,
    cap_async_endpoint_cap = 6,
    cap_reply_cap = 8,
    cap_cnode_cap = 10,
    cap_thread_cap = 12,
    cap_frame_cap = 1,
    cap_page_table_cap = 3,
    cap_page_directory_cap = 5,
    cap_asid_control_cap = 7,
    cap_asid_pool_cap = 9,
    cap_io_port_cap = 11,
    cap_irq_control_cap = 14,
    cap_irq_handler_cap = 30,
    cap_zombie_cap = 46,
    cap_domain_cap = 62
};
typedef enum cap_tag cap_tag_t;

static inline uint32_t __attribute__((__const__))
cap_get_capType(cap_t cap) {
    if ((cap.words[0] & 0xe) != 0xe)
        return (cap.words[0] >> 0) & 0xf;
    return (cap.words[0] >> 0) & 0xff;
}

static inline int __attribute__((__const__))
cap_capType_equals(cap_t cap, uint32_t cap_type_tag) {
    if ((cap_type_tag & 0xe) != 0xe)
        return ((cap.words[0] >> 0) & 0xf) == cap_type_tag;
    return ((cap.words[0] >> 0) & 0xff) == cap_type_tag;
}

static inline cap_t __attribute__((__const__))
cap_null_cap_new(void) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_null_cap & 0xf) << 0;

    return cap;
}

static inline cap_t __attribute__((__const__))
cap_untyped_cap_new(uint32_t capFreeIndex, uint32_t capBlockSize, uint32_t capPtr) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capFreeIndex & 0x7ffffff) << 5;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capBlockSize & 0x1f) << 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capPtr & 0xfffffff0) >> 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_untyped_cap & 0xf) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_untyped_cap_get_capFreeIndex(cap_t cap) {
   
                           ;

    return (cap.words[1] & 0xffffffe0) >> 5;
}

static inline void
cap_untyped_cap_ptr_set_capFreeIndex(cap_t *cap_ptr,
                                      uint32_t v) {
   
                           ;

    /* fail if user has passed bits that we will override */
    ;

    cap_ptr->words[1] &= ~0xffffffe0;
    cap_ptr->words[1] |= (v << 5) & 0xffffffe0;
}

static inline uint32_t __attribute__((__const__))
cap_untyped_cap_get_capBlockSize(cap_t cap) {
   
                           ;

    return (cap.words[1] & 0x1f) >> 0;
}

static inline uint32_t __attribute__((__pure__))
cap_untyped_cap_ptr_get_capBlockSize(cap_t *cap_ptr) {
   
                           ;

    return (cap_ptr->words[1] & 0x1f) >> 0;
}

static inline uint32_t __attribute__((__const__))
cap_untyped_cap_get_capPtr(cap_t cap) {
   
                           ;

    return (cap.words[0] & 0xfffffff0) << 0;
}

static inline cap_t __attribute__((__const__))
cap_endpoint_cap_new(uint32_t capEPBadge, uint32_t capCanGrant, uint32_t capCanSend, uint32_t capCanReceive, uint32_t capEPPtr) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capEPBadge & 0x1fffffff) << 3;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capCanGrant & 0x1) << 2;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capCanSend & 0x1) << 1;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capCanReceive & 0x1) << 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capEPPtr & 0xfffffff0) >> 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_endpoint_cap & 0xf) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_endpoint_cap_get_capEPBadge(cap_t cap) {
   
                            ;

    return (cap.words[1] & 0xfffffff8) >> 3;
}

static inline cap_t __attribute__((__const__))
cap_endpoint_cap_set_capEPBadge(cap_t cap, uint32_t v) {
   
                            ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0xfffffff8;
    cap.words[1] |= (v << 3) & 0xfffffff8;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_endpoint_cap_get_capCanGrant(cap_t cap) {
   
                            ;

    return (cap.words[1] & 0x4) >> 2;
}

static inline cap_t __attribute__((__const__))
cap_endpoint_cap_set_capCanGrant(cap_t cap, uint32_t v) {
   
                            ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x4;
    cap.words[1] |= (v << 2) & 0x4;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_endpoint_cap_get_capCanSend(cap_t cap) {
   
                            ;

    return (cap.words[1] & 0x2) >> 1;
}

static inline cap_t __attribute__((__const__))
cap_endpoint_cap_set_capCanSend(cap_t cap, uint32_t v) {
   
                            ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x2;
    cap.words[1] |= (v << 1) & 0x2;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_endpoint_cap_get_capCanReceive(cap_t cap) {
   
                            ;

    return (cap.words[1] & 0x1) >> 0;
}

static inline cap_t __attribute__((__const__))
cap_endpoint_cap_set_capCanReceive(cap_t cap, uint32_t v) {
   
                            ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x1;
    cap.words[1] |= (v << 0) & 0x1;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_endpoint_cap_get_capEPPtr(cap_t cap) {
   
                            ;

    return (cap.words[0] & 0xfffffff0) << 0;
}

static inline cap_t __attribute__((__const__))
cap_async_endpoint_cap_new(uint32_t capAEPBadge, uint32_t capAEPCanSend, uint32_t capAEPCanReceive, uint32_t capAEPPtr) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capAEPBadge & 0x1fffffff) << 3;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capAEPCanSend & 0x1) << 1;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capAEPCanReceive & 0x1) << 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capAEPPtr & 0xfffffff0) >> 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_async_endpoint_cap & 0xf) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_async_endpoint_cap_get_capAEPBadge(cap_t cap) {
   
                                  ;

    return (cap.words[1] & 0xfffffff8) >> 3;
}

static inline cap_t __attribute__((__const__))
cap_async_endpoint_cap_set_capAEPBadge(cap_t cap, uint32_t v) {
   
                                  ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0xfffffff8;
    cap.words[1] |= (v << 3) & 0xfffffff8;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_async_endpoint_cap_get_capAEPCanSend(cap_t cap) {
   
                                  ;

    return (cap.words[1] & 0x2) >> 1;
}

static inline cap_t __attribute__((__const__))
cap_async_endpoint_cap_set_capAEPCanSend(cap_t cap, uint32_t v) {
   
                                  ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x2;
    cap.words[1] |= (v << 1) & 0x2;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_async_endpoint_cap_get_capAEPCanReceive(cap_t cap) {
   
                                  ;

    return (cap.words[1] & 0x1) >> 0;
}

static inline cap_t __attribute__((__const__))
cap_async_endpoint_cap_set_capAEPCanReceive(cap_t cap, uint32_t v) {
   
                                  ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x1;
    cap.words[1] |= (v << 0) & 0x1;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_async_endpoint_cap_get_capAEPPtr(cap_t cap) {
   
                                  ;

    return (cap.words[0] & 0xfffffff0) << 0;
}

static inline cap_t __attribute__((__const__))
cap_reply_cap_new(uint32_t capReplyMaster, uint32_t capTCBPtr) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capReplyMaster & 0x1) << 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capTCBPtr & 0xfffffff0) >> 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_reply_cap & 0xf) << 0;

    return cap;
}

static inline void
cap_reply_cap_ptr_new(cap_t *cap_ptr, uint32_t capReplyMaster, uint32_t capTCBPtr) {
    cap_ptr->words[0] = 0;
    cap_ptr->words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap_ptr->words[1] |= (capReplyMaster & 0x1) << 0;
/* fail if user has passed bits that we will override */
    ;

    cap_ptr->words[0] |= (capTCBPtr & 0xfffffff0) >> 0;
/* fail if user has passed bits that we will override */
    ;

    cap_ptr->words[0] |= (cap_reply_cap & 0xf) << 0;
}

static inline uint32_t __attribute__((__const__))
cap_reply_cap_get_capReplyMaster(cap_t cap) {
   
                         ;

    return (cap.words[1] & 0x1) >> 0;
}

static inline uint32_t __attribute__((__const__))
cap_reply_cap_get_capTCBPtr(cap_t cap) {
   
                         ;

    return (cap.words[0] & 0xfffffff0) << 0;
}

static inline cap_t __attribute__((__const__))
cap_cnode_cap_new(uint32_t capCNodeRadix, uint32_t capCNodeGuardSize, uint32_t capCNodeGuard, uint32_t capCNodePtr) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capCNodeRadix & 0x1f) << 23;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capCNodeGuardSize & 0x1f) << 18;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capCNodeGuard & 0x3ffff) << 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capCNodePtr & 0xffffffe0) >> 1;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_cnode_cap & 0xf) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_cnode_cap_get_capCNodeRadix(cap_t cap) {
   
                         ;

    return (cap.words[1] & 0xf800000) >> 23;
}

static inline uint32_t __attribute__((__const__))
cap_cnode_cap_get_capCNodeGuardSize(cap_t cap) {
   
                         ;

    return (cap.words[1] & 0x7c0000) >> 18;
}

static inline cap_t __attribute__((__const__))
cap_cnode_cap_set_capCNodeGuardSize(cap_t cap, uint32_t v) {
   
                         ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x7c0000;
    cap.words[1] |= (v << 18) & 0x7c0000;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_cnode_cap_get_capCNodeGuard(cap_t cap) {
   
                         ;

    return (cap.words[1] & 0x3ffff) >> 0;
}

static inline cap_t __attribute__((__const__))
cap_cnode_cap_set_capCNodeGuard(cap_t cap, uint32_t v) {
   
                         ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x3ffff;
    cap.words[1] |= (v << 0) & 0x3ffff;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_cnode_cap_get_capCNodePtr(cap_t cap) {
   
                         ;

    return (cap.words[0] & 0x7ffffff0) << 1;
}

static inline cap_t __attribute__((__const__))
cap_thread_cap_new(uint32_t capTCBPtr) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capTCBPtr & 0xfffffff0) >> 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_thread_cap & 0xf) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_thread_cap_get_capTCBPtr(cap_t cap) {
   
                          ;

    return (cap.words[0] & 0xfffffff0) << 0;
}

static inline cap_t __attribute__((__const__))
cap_frame_cap_new(uint32_t capFSize, uint32_t capFMappedASIDLow, uint32_t capFMappedAddress, uint32_t capFMappedASIDHigh, uint32_t capFVMRights, uint32_t capFBasePtr) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capFSize & 0x1) << 31;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capFMappedASIDLow & 0x3ff) << 20;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capFMappedAddress & 0xfffff000) >> 12;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capFMappedASIDHigh & 0x3f) << 26;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capFVMRights & 0x3) << 24;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capFBasePtr & 0xfffff000) >> 8;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_frame_cap & 0xf) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_frame_cap_get_capFSize(cap_t cap) {
   
                         ;

    return (cap.words[1] & 0x80000000) >> 31;
}

static inline uint32_t __attribute__((__const__))
cap_frame_cap_get_capFMappedASIDLow(cap_t cap) {
   
                         ;

    return (cap.words[1] & 0x3ff00000) >> 20;
}

static inline cap_t __attribute__((__const__))
cap_frame_cap_set_capFMappedASIDLow(cap_t cap, uint32_t v) {
   
                         ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x3ff00000;
    cap.words[1] |= (v << 20) & 0x3ff00000;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_frame_cap_get_capFMappedAddress(cap_t cap) {
   
                         ;

    return (cap.words[1] & 0xfffff) << 12;
}

static inline cap_t __attribute__((__const__))
cap_frame_cap_set_capFMappedAddress(cap_t cap, uint32_t v) {
   
                         ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0xfffff;
    cap.words[1] |= (v >> 12) & 0xfffff;
    return cap;
}

static inline void
cap_frame_cap_ptr_set_capFMappedAddress(cap_t *cap_ptr,
                                      uint32_t v) {
   
                         ;

    /* fail if user has passed bits that we will override */
    ;

    cap_ptr->words[1] &= ~0xfffff;
    cap_ptr->words[1] |= (v >> 12) & 0xfffff;
}

static inline uint32_t __attribute__((__const__))
cap_frame_cap_get_capFMappedASIDHigh(cap_t cap) {
   
                         ;

    return (cap.words[0] & 0xfc000000) >> 26;
}

static inline cap_t __attribute__((__const__))
cap_frame_cap_set_capFMappedASIDHigh(cap_t cap, uint32_t v) {
   
                         ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[0] &= ~0xfc000000;
    cap.words[0] |= (v << 26) & 0xfc000000;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_frame_cap_get_capFVMRights(cap_t cap) {
   
                         ;

    return (cap.words[0] & 0x3000000) >> 24;
}

static inline cap_t __attribute__((__const__))
cap_frame_cap_set_capFVMRights(cap_t cap, uint32_t v) {
   
                         ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[0] &= ~0x3000000;
    cap.words[0] |= (v << 24) & 0x3000000;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_frame_cap_get_capFBasePtr(cap_t cap) {
   
                         ;

    return (cap.words[0] & 0xfffff0) << 8;
}

static inline cap_t __attribute__((__const__))
cap_page_table_cap_new(uint32_t capPTIsMapped, uint32_t capPTMappedASID, uint32_t capPTMappedAddress, uint32_t capPTBasePtr) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capPTIsMapped & 0x1) << 26;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capPTMappedASID & 0xffff) << 10;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capPTMappedAddress & 0xffc00000) >> 22;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capPTBasePtr & 0xfffff000) >> 8;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_page_table_cap & 0xf) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_page_table_cap_get_capPTIsMapped(cap_t cap) {
   
                              ;

    return (cap.words[1] & 0x4000000) >> 26;
}

static inline cap_t __attribute__((__const__))
cap_page_table_cap_set_capPTIsMapped(cap_t cap, uint32_t v) {
   
                              ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x4000000;
    cap.words[1] |= (v << 26) & 0x4000000;
    return cap;
}

static inline void
cap_page_table_cap_ptr_set_capPTIsMapped(cap_t *cap_ptr,
                                      uint32_t v) {
   
                              ;

    /* fail if user has passed bits that we will override */
    ;

    cap_ptr->words[1] &= ~0x4000000;
    cap_ptr->words[1] |= (v << 26) & 0x4000000;
}

static inline uint32_t __attribute__((__const__))
cap_page_table_cap_get_capPTMappedASID(cap_t cap) {
   
                              ;

    return (cap.words[1] & 0x3fffc00) >> 10;
}

static inline cap_t __attribute__((__const__))
cap_page_table_cap_set_capPTMappedASID(cap_t cap, uint32_t v) {
   
                              ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x3fffc00;
    cap.words[1] |= (v << 10) & 0x3fffc00;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_page_table_cap_get_capPTMappedAddress(cap_t cap) {
   
                              ;

    return (cap.words[1] & 0x3ff) << 22;
}

static inline cap_t __attribute__((__const__))
cap_page_table_cap_set_capPTMappedAddress(cap_t cap, uint32_t v) {
   
                              ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x3ff;
    cap.words[1] |= (v >> 22) & 0x3ff;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_page_table_cap_get_capPTBasePtr(cap_t cap) {
   
                              ;

    return (cap.words[0] & 0xfffff0) << 8;
}

static inline cap_t __attribute__((__const__))
cap_page_directory_cap_new(uint32_t capPDIsMapped, uint32_t capPDMappedASID, uint32_t capPDBasePtr) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capPDIsMapped & 0x1) << 16;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capPDMappedASID & 0xffff) << 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capPDBasePtr & 0xfffff000) >> 8;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_page_directory_cap & 0xf) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_page_directory_cap_get_capPDIsMapped(cap_t cap) {
   
                                  ;

    return (cap.words[1] & 0x10000) >> 16;
}

static inline cap_t __attribute__((__const__))
cap_page_directory_cap_set_capPDIsMapped(cap_t cap, uint32_t v) {
   
                                  ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0x10000;
    cap.words[1] |= (v << 16) & 0x10000;
    return cap;
}

static inline void
cap_page_directory_cap_ptr_set_capPDIsMapped(cap_t *cap_ptr,
                                      uint32_t v) {
   
                                  ;

    /* fail if user has passed bits that we will override */
    ;

    cap_ptr->words[1] &= ~0x10000;
    cap_ptr->words[1] |= (v << 16) & 0x10000;
}

static inline uint32_t __attribute__((__const__))
cap_page_directory_cap_get_capPDMappedASID(cap_t cap) {
   
                                  ;

    return (cap.words[1] & 0xffff) >> 0;
}

static inline void
cap_page_directory_cap_ptr_set_capPDMappedASID(cap_t *cap_ptr,
                                      uint32_t v) {
   
                                  ;

    /* fail if user has passed bits that we will override */
    ;

    cap_ptr->words[1] &= ~0xffff;
    cap_ptr->words[1] |= (v << 0) & 0xffff;
}

static inline uint32_t __attribute__((__const__))
cap_page_directory_cap_get_capPDBasePtr(cap_t cap) {
   
                                  ;

    return (cap.words[0] & 0xfffff0) << 8;
}

static inline cap_t __attribute__((__const__))
cap_asid_control_cap_new(void) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_asid_control_cap & 0xf) << 0;

    return cap;
}

static inline cap_t __attribute__((__const__))
cap_asid_pool_cap_new(uint32_t capASIDBase, uint32_t capASIDPool) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capASIDBase & 0xffff) << 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capASIDPool & 0xfffff000) >> 8;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_asid_pool_cap & 0xf) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_asid_pool_cap_get_capASIDBase(cap_t cap) {
   
                             ;

    return (cap.words[1] & 0xffff) >> 0;
}

static inline uint32_t __attribute__((__const__))
cap_asid_pool_cap_get_capASIDPool(cap_t cap) {
   
                             ;

    return (cap.words[0] & 0xfffff0) << 8;
}

static inline cap_t __attribute__((__const__))
cap_io_port_cap_new(uint32_t capIOPortFirstPort, uint32_t capIOPortLastPort) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capIOPortFirstPort & 0xffff) << 16;
/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capIOPortLastPort & 0xffff) << 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_io_port_cap & 0xf) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_io_port_cap_get_capIOPortFirstPort(cap_t cap) {
   
                           ;

    return (cap.words[1] & 0xffff0000) >> 16;
}

static inline uint32_t __attribute__((__const__))
cap_io_port_cap_get_capIOPortLastPort(cap_t cap) {
   
                           ;

    return (cap.words[1] & 0xffff) >> 0;
}

static inline cap_t __attribute__((__const__))
cap_irq_control_cap_new(void) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_irq_control_cap & 0xff) << 0;

    return cap;
}

static inline cap_t __attribute__((__const__))
cap_irq_handler_cap_new(uint32_t capIRQ) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[1] |= (capIRQ & 0xff) << 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_irq_handler_cap & 0xff) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_irq_handler_cap_get_capIRQ(cap_t cap) {
   
                               ;

    return (cap.words[1] & 0xff) >> 0;
}

static inline cap_t __attribute__((__const__))
cap_zombie_cap_new(uint32_t capZombieID, uint32_t capZombieType) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

       cap.words[1] |= capZombieID << 0;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (capZombieType & 0x3f) << 8;
/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_zombie_cap & 0xff) << 0;

    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_zombie_cap_get_capZombieID(cap_t cap) {
   
                          ;

    return (cap.words[1] & 0xffffffff) >> 0;
}

static inline cap_t __attribute__((__const__))
cap_zombie_cap_set_capZombieID(cap_t cap, uint32_t v) {
   
                          ;
    /* fail if user has passed bits that we will override */
    ;

    cap.words[1] &= ~0xffffffff;
    cap.words[1] |= (v << 0) & 0xffffffff;
    return cap;
}

static inline uint32_t __attribute__((__const__))
cap_zombie_cap_get_capZombieType(cap_t cap) {
   
                          ;

    return (cap.words[0] & 0x3f00) >> 8;
}

static inline cap_t __attribute__((__const__))
cap_domain_cap_new(void) {
    cap_t cap;

    cap.words[0] = 0;
    cap.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    cap.words[0] |= (cap_domain_cap & 0xff) << 0;

    return cap;
}

struct fault {
    uint32_t words[2];
};
typedef struct fault fault_t;

enum fault_tag {
    fault_null_fault = 0,
    fault_cap_fault = 1,
    fault_vm_fault = 2,
    fault_unknown_syscall = 3,
    fault_user_exception = 4
};
typedef enum fault_tag fault_tag_t;

static inline uint32_t __attribute__((__const__))
fault_get_faultType(fault_t fault) {
    return (fault.words[0] >> 0) & 0x7;
}

static inline uint32_t __attribute__((__pure__))
fault_ptr_get_faultType(fault_t *fault_ptr) {
    return (fault_ptr->words[0] >> 0) & 0x7;
}

static inline void
fault_null_fault_ptr_new(fault_t *fault_ptr) {
    fault_ptr->words[0] = 0;
    fault_ptr->words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    fault_ptr->words[0] |= (fault_null_fault & 0x7) << 0;
}

static inline fault_t __attribute__((__const__))
fault_cap_fault_new(uint32_t address, uint32_t inReceivePhase) {
    fault_t fault;

    fault.words[0] = 0;
    fault.words[1] = 0;

       fault.words[1] |= address << 0;
/* fail if user has passed bits that we will override */
    ;

    fault.words[0] |= (inReceivePhase & 0x1) << 31;
/* fail if user has passed bits that we will override */
    ;

    fault.words[0] |= (fault_cap_fault & 0x7) << 0;

    return fault;
}

static inline uint32_t __attribute__((__const__))
fault_cap_fault_get_address(fault_t fault) {
   
                           ;

    return (fault.words[1] & 0xffffffff) >> 0;
}

static inline uint32_t __attribute__((__const__))
fault_cap_fault_get_inReceivePhase(fault_t fault) {
   
                           ;

    return (fault.words[0] & 0x80000000) >> 31;
}

static inline fault_t __attribute__((__const__))
fault_vm_fault_new(uint32_t address, uint32_t FSR, uint32_t instructionFault) {
    fault_t fault;

    fault.words[0] = 0;
    fault.words[1] = 0;

       fault.words[1] |= address << 0;
/* fail if user has passed bits that we will override */
    ;

    fault.words[0] |= (FSR & 0x1f) << 27;
/* fail if user has passed bits that we will override */
    ;

    fault.words[0] |= (instructionFault & 0x1) << 19;
/* fail if user has passed bits that we will override */
    ;

    fault.words[0] |= (fault_vm_fault & 0x7) << 0;

    return fault;
}

static inline uint32_t __attribute__((__const__))
fault_vm_fault_get_address(fault_t fault) {
   
                          ;

    return (fault.words[1] & 0xffffffff) >> 0;
}

static inline uint32_t __attribute__((__const__))
fault_vm_fault_get_FSR(fault_t fault) {
   
                          ;

    return (fault.words[0] & 0xf8000000) >> 27;
}

static inline uint32_t __attribute__((__const__))
fault_vm_fault_get_instructionFault(fault_t fault) {
   
                          ;

    return (fault.words[0] & 0x80000) >> 19;
}

static inline fault_t __attribute__((__const__))
fault_unknown_syscall_new(uint32_t syscallNumber) {
    fault_t fault;

    fault.words[0] = 0;
    fault.words[1] = 0;

       fault.words[1] |= syscallNumber << 0;
/* fail if user has passed bits that we will override */
    ;

    fault.words[0] |= (fault_unknown_syscall & 0x7) << 0;

    return fault;
}

static inline uint32_t __attribute__((__const__))
fault_unknown_syscall_get_syscallNumber(fault_t fault) {
   
                                 ;

    return (fault.words[1] & 0xffffffff) >> 0;
}

static inline fault_t __attribute__((__const__))
fault_user_exception_new(uint32_t number, uint32_t code) {
    fault_t fault;

    fault.words[0] = 0;
    fault.words[1] = 0;

       fault.words[1] |= number << 0;
/* fail if user has passed bits that we will override */
    ;

    fault.words[0] |= (code & 0x1fffffff) << 3;
/* fail if user has passed bits that we will override */
    ;

    fault.words[0] |= (fault_user_exception & 0x7) << 0;

    return fault;
}

static inline uint32_t __attribute__((__const__))
fault_user_exception_get_number(fault_t fault) {
   
                                ;

    return (fault.words[1] & 0xffffffff) >> 0;
}

static inline uint32_t __attribute__((__const__))
fault_user_exception_get_code(fault_t fault) {
   
                                ;

    return (fault.words[0] & 0xfffffff8) >> 3;
}

struct gdt_entry {
    uint32_t words[2];
};
typedef struct gdt_entry gdt_entry_t;

enum gdt_entry_tag {
    gdt_entry_gdt_null = 0,
    gdt_entry_gdt_tss = 2,
    gdt_entry_gdt_data = 4,
    gdt_entry_gdt_code = 6
};
typedef enum gdt_entry_tag gdt_entry_tag_t;

static inline gdt_entry_t __attribute__((__const__))
gdt_entry_gdt_null_new(void) {
    gdt_entry_t gdt_entry;

    gdt_entry.words[0] = 0;
    gdt_entry.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (gdt_entry_gdt_null & 0x7) << 10;

    return gdt_entry;
}

static inline gdt_entry_t __attribute__((__const__))
gdt_entry_gdt_tss_new(uint32_t base_high, uint32_t granularity, uint32_t avl, uint32_t limit_high, uint32_t present, uint32_t dpl, uint32_t busy, uint32_t always_1, uint32_t base_mid, uint32_t base_low, uint32_t limit_low) {
    gdt_entry_t gdt_entry;

    gdt_entry.words[0] = 0;
    gdt_entry.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (base_high & 0xff) << 24;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (granularity & 0x1) << 23;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (avl & 0x1) << 20;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (limit_high & 0xf) << 16;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (present & 0x1) << 15;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (dpl & 0x3) << 13;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (gdt_entry_gdt_tss & 0x7) << 10;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (busy & 0x1) << 9;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (always_1 & 0x1) << 8;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (base_mid & 0xff) << 0;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[0] |= (base_low & 0xffff) << 16;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[0] |= (limit_low & 0xffff) << 0;

    return gdt_entry;
}

static inline gdt_entry_t __attribute__((__const__))
gdt_entry_gdt_data_new(uint32_t base_high, uint32_t granularity, uint32_t operation_size, uint32_t avl, uint32_t seg_limit_high, uint32_t present, uint32_t dpl, uint32_t writable, uint32_t accessed, uint32_t base_mid, uint32_t base_low, uint32_t seg_limit_low) {
    gdt_entry_t gdt_entry;

    gdt_entry.words[0] = 0;
    gdt_entry.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (base_high & 0xff) << 24;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (granularity & 0x1) << 23;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (operation_size & 0x1) << 22;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (avl & 0x1) << 20;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (seg_limit_high & 0xf) << 16;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (present & 0x1) << 15;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (dpl & 0x3) << 13;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (gdt_entry_gdt_data & 0x7) << 10;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (writable & 0x1) << 9;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (accessed & 0x1) << 8;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (base_mid & 0xff) << 0;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[0] |= (base_low & 0xffff) << 16;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[0] |= (seg_limit_low & 0xffff) << 0;

    return gdt_entry;
}

static inline void
gdt_entry_gdt_data_ptr_set_base_high(gdt_entry_t *gdt_entry_ptr,
                                      uint32_t v) {
   
                              ;

    /* fail if user has passed bits that we will override */
    ;

    gdt_entry_ptr->words[1] &= ~0xff000000;
    gdt_entry_ptr->words[1] |= (v << 24) & 0xff000000;
}

static inline void
gdt_entry_gdt_data_ptr_set_base_mid(gdt_entry_t *gdt_entry_ptr,
                                      uint32_t v) {
   
                              ;

    /* fail if user has passed bits that we will override */
    ;

    gdt_entry_ptr->words[1] &= ~0xff;
    gdt_entry_ptr->words[1] |= (v << 0) & 0xff;
}

static inline void
gdt_entry_gdt_data_ptr_set_base_low(gdt_entry_t *gdt_entry_ptr,
                                      uint32_t v) {
   
                              ;

    /* fail if user has passed bits that we will override */
    ;

    gdt_entry_ptr->words[0] &= ~0xffff0000;
    gdt_entry_ptr->words[0] |= (v << 16) & 0xffff0000;
}

static inline gdt_entry_t __attribute__((__const__))
gdt_entry_gdt_code_new(uint32_t base_high, uint32_t granularity, uint32_t operation_size, uint32_t avl, uint32_t seg_limit_high, uint32_t present, uint32_t dpl, uint32_t readable, uint32_t accessed, uint32_t base_mid, uint32_t base_low, uint32_t seg_limit_low) {
    gdt_entry_t gdt_entry;

    gdt_entry.words[0] = 0;
    gdt_entry.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (base_high & 0xff) << 24;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (granularity & 0x1) << 23;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (operation_size & 0x1) << 22;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (avl & 0x1) << 20;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (seg_limit_high & 0xf) << 16;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (present & 0x1) << 15;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (dpl & 0x3) << 13;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (gdt_entry_gdt_code & 0x7) << 10;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (readable & 0x1) << 9;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (accessed & 0x1) << 8;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[1] |= (base_mid & 0xff) << 0;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[0] |= (base_low & 0xffff) << 16;
/* fail if user has passed bits that we will override */
    ;

    gdt_entry.words[0] |= (seg_limit_low & 0xffff) << 0;

    return gdt_entry;
}

struct lookup_fault {
    uint32_t words[2];
};
typedef struct lookup_fault lookup_fault_t;

enum lookup_fault_tag {
    lookup_fault_invalid_root = 0,
    lookup_fault_missing_capability = 1,
    lookup_fault_depth_mismatch = 2,
    lookup_fault_guard_mismatch = 3
};
typedef enum lookup_fault_tag lookup_fault_tag_t;

static inline uint32_t __attribute__((__const__))
lookup_fault_get_lufType(lookup_fault_t lookup_fault) {
    return (lookup_fault.words[0] >> 0) & 0x3;
}

static inline lookup_fault_t __attribute__((__const__))
lookup_fault_invalid_root_new(void) {
    lookup_fault_t lookup_fault;

    lookup_fault.words[0] = 0;
    lookup_fault.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    lookup_fault.words[0] |= (lookup_fault_invalid_root & 0x3) << 0;

    return lookup_fault;
}

static inline lookup_fault_t __attribute__((__const__))
lookup_fault_missing_capability_new(uint32_t bitsLeft) {
    lookup_fault_t lookup_fault;

    lookup_fault.words[0] = 0;
    lookup_fault.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    lookup_fault.words[0] |= (bitsLeft & 0x3f) << 2;
/* fail if user has passed bits that we will override */
    ;

    lookup_fault.words[0] |= (lookup_fault_missing_capability & 0x3) << 0;

    return lookup_fault;
}

static inline uint32_t __attribute__((__const__))
lookup_fault_missing_capability_get_bitsLeft(lookup_fault_t lookup_fault) {
   
                                           ;

    return (lookup_fault.words[0] & 0xfc) >> 2;
}

static inline lookup_fault_t __attribute__((__const__))
lookup_fault_depth_mismatch_new(uint32_t bitsFound, uint32_t bitsLeft) {
    lookup_fault_t lookup_fault;

    lookup_fault.words[0] = 0;
    lookup_fault.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    lookup_fault.words[0] |= (bitsFound & 0x3f) << 8;
/* fail if user has passed bits that we will override */
    ;

    lookup_fault.words[0] |= (bitsLeft & 0x3f) << 2;
/* fail if user has passed bits that we will override */
    ;

    lookup_fault.words[0] |= (lookup_fault_depth_mismatch & 0x3) << 0;

    return lookup_fault;
}

static inline uint32_t __attribute__((__const__))
lookup_fault_depth_mismatch_get_bitsFound(lookup_fault_t lookup_fault) {
   
                                       ;

    return (lookup_fault.words[0] & 0x3f00) >> 8;
}

static inline uint32_t __attribute__((__const__))
lookup_fault_depth_mismatch_get_bitsLeft(lookup_fault_t lookup_fault) {
   
                                       ;

    return (lookup_fault.words[0] & 0xfc) >> 2;
}

static inline lookup_fault_t __attribute__((__const__))
lookup_fault_guard_mismatch_new(uint32_t guardFound, uint32_t bitsLeft, uint32_t bitsFound) {
    lookup_fault_t lookup_fault;

    lookup_fault.words[0] = 0;
    lookup_fault.words[1] = 0;

       lookup_fault.words[1] |= guardFound << 0;
/* fail if user has passed bits that we will override */
    ;

    lookup_fault.words[0] |= (bitsLeft & 0x3f) << 8;
/* fail if user has passed bits that we will override */
    ;

    lookup_fault.words[0] |= (bitsFound & 0x3f) << 2;
/* fail if user has passed bits that we will override */
    ;

    lookup_fault.words[0] |= (lookup_fault_guard_mismatch & 0x3) << 0;

    return lookup_fault;
}

static inline uint32_t __attribute__((__const__))
lookup_fault_guard_mismatch_get_guardFound(lookup_fault_t lookup_fault) {
   
                                       ;

    return (lookup_fault.words[1] & 0xffffffff) >> 0;
}

static inline uint32_t __attribute__((__const__))
lookup_fault_guard_mismatch_get_bitsLeft(lookup_fault_t lookup_fault) {
   
                                       ;

    return (lookup_fault.words[0] & 0x3f00) >> 8;
}

static inline uint32_t __attribute__((__const__))
lookup_fault_guard_mismatch_get_bitsFound(lookup_fault_t lookup_fault) {
   
                                       ;

    return (lookup_fault.words[0] & 0xfc) >> 2;
}

struct idt_entry {
    uint32_t words[2];
};
typedef struct idt_entry idt_entry_t;

enum idt_entry_tag {
    idt_entry_task_gate = 5,
    idt_entry_interrupt_gate = 6,
    idt_entry_trap_gate = 7
};
typedef enum idt_entry_tag idt_entry_tag_t;

static inline idt_entry_t __attribute__((__const__))
idt_entry_interrupt_gate_new(uint32_t offset_high, uint32_t present, uint32_t dpl, uint32_t gate_size, uint32_t seg_selector, uint32_t offset_low) {
    idt_entry_t idt_entry;

    idt_entry.words[0] = 0;
    idt_entry.words[1] = 0;

/* fail if user has passed bits that we will override */
    ;

    idt_entry.words[1] |= (offset_high & 0xffff) << 16;
/* fail if user has passed bits that we will override */
    ;

    idt_entry.words[1] |= (present & 0x1) << 15;
/* fail if user has passed bits that we will override */
    ;

    idt_entry.words[1] |= (dpl & 0x3) << 13;
/* fail if user has passed bits that we will override */
    ;

    idt_entry.words[1] |= (gate_size & 0x1) << 11;
/* fail if user has passed bits that we will override */
    ;

    idt_entry.words[1] |= (idt_entry_interrupt_gate & 0x7) << 8;
/* fail if user has passed bits that we will override */
    ;

    idt_entry.words[0] |= (seg_selector & 0xffff) << 16;
/* fail if user has passed bits that we will override */
    ;

    idt_entry.words[0] |= (offset_low & 0xffff) << 0;

    return idt_entry;
}

struct pde {
    uint32_t words[1];
};
typedef struct pde pde_t;

enum pde_tag {
    pde_pde_4k = 0,
    pde_pde_4m = 1
};
typedef enum pde_tag pde_tag_t;

static inline uint32_t __attribute__((__pure__))
pde_ptr_get_page_size(pde_t *pde_ptr) {
    return (pde_ptr->words[0] >> 7) & 0x1;
}

static inline pde_t __attribute__((__const__))
pde_pde_4k_new(uint32_t pt_base_address, uint32_t avl, uint32_t accessed, uint32_t cache_disabled, uint32_t write_through, uint32_t super_user, uint32_t read_write, uint32_t present) {
    pde_t pde;

    pde.words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (pt_base_address & 0xfffff000) >> 0;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (avl & 0x7) << 9;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (pde_pde_4k & 0x1) << 7;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (accessed & 0x1) << 5;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (cache_disabled & 0x1) << 4;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (write_through & 0x1) << 3;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (super_user & 0x1) << 2;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (read_write & 0x1) << 1;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (present & 0x1) << 0;

    return pde;
}

static inline void
pde_pde_4k_ptr_new(pde_t *pde_ptr, uint32_t pt_base_address, uint32_t avl, uint32_t accessed, uint32_t cache_disabled, uint32_t write_through, uint32_t super_user, uint32_t read_write, uint32_t present) {
    pde_ptr->words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (pt_base_address & 0xfffff000) >> 0;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (avl & 0x7) << 9;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (pde_pde_4k & 0x1) << 7;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (accessed & 0x1) << 5;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (cache_disabled & 0x1) << 4;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (write_through & 0x1) << 3;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (super_user & 0x1) << 2;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (read_write & 0x1) << 1;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (present & 0x1) << 0;
}

static inline uint32_t __attribute__((__pure__))
pde_pde_4k_ptr_get_pt_base_address(pde_t *pde_ptr) {
   
                      ;

    return (pde_ptr->words[0] & 0xfffff000) << 0;
}

static inline uint32_t __attribute__((__pure__))
pde_pde_4k_ptr_get_present(pde_t *pde_ptr) {
   
                      ;

    return (pde_ptr->words[0] & 0x1) >> 0;
}

static inline pde_t __attribute__((__const__))
pde_pde_4m_new(uint32_t page_base_address, uint32_t pat, uint32_t avl, uint32_t global, uint32_t dirty, uint32_t accessed, uint32_t cache_disabled, uint32_t write_through, uint32_t super_user, uint32_t read_write, uint32_t present) {
    pde_t pde;

    pde.words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (page_base_address & 0xffc00000) >> 0;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (pat & 0x1) << 12;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (avl & 0x7) << 9;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (global & 0x1) << 8;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (pde_pde_4m & 0x1) << 7;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (dirty & 0x1) << 6;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (accessed & 0x1) << 5;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (cache_disabled & 0x1) << 4;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (write_through & 0x1) << 3;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (super_user & 0x1) << 2;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (read_write & 0x1) << 1;
/* fail if user has passed bits that we will override */
    ;

    pde.words[0] |= (present & 0x1) << 0;

    return pde;
}

static inline void
pde_pde_4m_ptr_new(pde_t *pde_ptr, uint32_t page_base_address, uint32_t pat, uint32_t avl, uint32_t global, uint32_t dirty, uint32_t accessed, uint32_t cache_disabled, uint32_t write_through, uint32_t super_user, uint32_t read_write, uint32_t present) {
    pde_ptr->words[0] = 0;

/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (page_base_address & 0xffc00000) >> 0;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (pat & 0x1) << 12;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (avl & 0x7) << 9;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (global & 0x1) << 8;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (pde_pde_4m & 0x1) << 7;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (dirty & 0x1) << 6;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (accessed & 0x1) << 5;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (cache_disabled & 0x1) << 4;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (write_through & 0x1) << 3;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (super_user & 0x1) << 2;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (read_write & 0x1) << 1;
/* fail if user has passed bits that we will override */
    ;

    pde_ptr->words[0] |= (present & 0x1) << 0;
}

static inline uint32_t __attribute__((__pure__))
pde_pde_4m_ptr_get_page_base_address(pde_t *pde_ptr) {
   
                      ;

    return (pde_ptr->words[0] & 0xffc00000) << 0;
}

static inline uint32_t __attribute__((__pure__))
pde_pde_4m_ptr_get_present(pde_t *pde_ptr) {
   
                      ;

    return (pde_ptr->words[0] & 0x1) >> 0;
}
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/hardware.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 2

/* code that is linked to physical addresses */


/* code that is only used during kernel bootstrapping */


/* node-local data that is only used during kernel bootstrapping */


/* global data (shared by all nodes) but only used during kernel bootstrapping */


/* global data (shared by all nodes) */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/hardware.h" 2

enum vm_fault_type {
    IA32DataFault = 0,
    IA32InstructionFault = 1
};
typedef uint32_t vm_fault_type_t;

enum vm_page_size {
    IA32_4K,
    IA32_4M
};
typedef uint32_t vm_page_size_t;

enum frameSizeConstants {
    IA32_4K_bits = 12,
    IA32_4M_bits = 22
};



/* Any changes to this function need to be replicated in pageBitsForSize_phys.
 */
static inline unsigned int __attribute__((__const__))
pageBitsForSize(vm_page_size_t pagesize)
{
    switch (pagesize) {
    case IA32_4K:
        return IA32_4K_bits;

    case IA32_4M:
        return IA32_4M_bits;

    default:
        halt();
    }
}

/* This function is a duplicate of pageBitsForSize, needed for calls that occur
 * before the MMU is turned on. Note that any changes to this function need to
 * be replicated in pageBitsForSize.
 */
__attribute__((__section__(".phys.text")))
static inline unsigned int __attribute__((__const__))
pageBitsForSize_phys(vm_page_size_t pagesize)
{
    switch (pagesize) {
    case IA32_4K:
        return IA32_4K_bits;

    case IA32_4M:
        return IA32_4M_bits;

    default:
        halt();
    }
}

/* Returns the size of CPU's cacheline */
uint32_t __attribute__((__const__)) getCacheLineSize(void);
uint32_t __attribute__((__const__)) getCacheLineSizeBits(void);

/* Flushes a specific memory range from the CPU cache */
void flushCacheLine(void* vaddr);
void flushCacheRange(void* vaddr, uint32_t size_bits);
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/registerset.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/registerset.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/registerset.h" 2

/* Number of bytes required to store FPU state. */


/* Minimum hardware-enforced alignment needed for FPU state. */


/* These are the indices of the registers in the
 * saved thread context. The values are determined
 * by the order in which they're saved in the trap
 * handler.
 *
 * BEWARE:
 * You will have to adapt traps.S extensively if
 * you change anything in this enum!
 */
enum _register {
    /* general purpose registers */

    /* 0x00 */ EAX = 0,
    /* 0x04 */ EBX = 1,
    capRegister = 1,
    badgeRegister = 1,
    /* 0x08 */ ECX = 2,
    /* 0x0C */ EDX = 3,
    /* 0x10 */ ESI = 4,
    msgInfoRegister = 4,
    /* 0x14 */ EDI = 5,
    /* 0x18 */ EBP = 6,

    /* segment registers */

    /* 0x1C */ DS = 7,
    /* 0x20 */ ES = 8,
    /* 0x24 */ FS = 9,
    /* 0x28 */ GS = 10,

    /* virtual registers (not actually present in hardware) */

    /* 0x2C */ FaultEIP = 11,
    /* 0x30 */ TLS_BASE = 12,

    /* values pushed by the CPU directly */

    /* 0x34 */ Error = 13,
    /* 0x38 */ NextEIP = 14,
    /* 0x3C */ CS = 15,
    /* 0x40 */ EFLAGS = 16,
    /* 0x44 */ ESP = 17,
    /* 0x48 */ SS = 18,

    /* 0x4C */ n_contextRegisters = 19
};

typedef uint32_t register_t;

enum messageSizes {
    n_msgRegisters = 2,
    n_frameRegisters = 10,
    n_gpRegisters = 3,
    n_exceptionMessage = 3,
    n_syscallMessage = 10
};

extern const register_t msgRegisters[];
extern const register_t frameRegisters[];
extern const register_t gpRegisters[];
extern const register_t exceptionMessage[];
extern const register_t syscallMessage[];

/* IA32 FPU context. */
struct user_fpu_state {
    uint8_t state[512];
};
typedef struct user_fpu_state user_fpu_state_t;

/* IA32 user-code context */
struct user_context {
    /* 76 bytes */
    word_t registers[n_contextRegisters];

    /*
     * Padding to 16-byte boundary, required by the IA32 FPU state saving
     * and restoring commands.
     */
    word_t padding;

    /* 512 bytes. */
    user_fpu_state_t fpuState;
};
typedef struct user_context user_context_t;

void Arch_initContext(user_context_t* context);
word_t sanitiseRegister(register_t reg, word_t v);

/* Ensure FPU state is aligned within user context. */

# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 2


/* Arch-independent object types */

enum endpoint_state {
    EPState_Idle = 0,
    EPState_Send = 1,
    EPState_Recv = 2
};
typedef uint32_t endpoint_state_t;





enum async_endpoint_state {
    AEPState_Idle = 0,
    AEPState_Waiting = 1,
    AEPState_Active = 2
};
typedef uint32_t async_endpoint_state_t;
# 61 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h"
/* Generate a tcb_t or cte_t pointer from a tcb block reference */




/* Generate a cte_t pointer from a tcb_t pointer */





static inline cap_t __attribute__((__const__))
Zombie_new(uint32_t number, uint32_t type, uint32_t ptr)
{
    uint32_t mask;

    if (type == (1ul<<(5))) {
        mask = ((1ul<<(4 + 1))-1ul);
    } else {
        mask = ((1ul<<(type + 1))-1ul);
    }

    return cap_zombie_cap_new((ptr & ~mask) | (number & mask), type);
}

static inline uint32_t __attribute__((__const__))
cap_zombie_cap_get_capZombieBits(cap_t cap)
{
    uint32_t type = cap_zombie_cap_get_capZombieType(cap);
    if (type == (1ul<<(5))) {
        return 3;
    }
    return type;
}

static inline uint32_t __attribute__((__const__))
cap_zombie_cap_get_capZombieNumber(cap_t cap)
{
    uint32_t radix = cap_zombie_cap_get_capZombieBits(cap);
    return cap_zombie_cap_get_capZombieID(cap) & ((1ul<<(radix + 1))-1ul);
}

static inline uint32_t __attribute__((__const__))
cap_zombie_cap_get_capZombiePtr(cap_t cap)
{
    uint32_t radix = cap_zombie_cap_get_capZombieBits(cap);
    return cap_zombie_cap_get_capZombieID(cap) & ~((1ul<<(radix + 1))-1ul);
}

static inline cap_t __attribute__((__const__))
cap_zombie_cap_set_capZombieNumber(cap_t cap, uint32_t n)
{
    uint32_t radix = cap_zombie_cap_get_capZombieBits(cap);
    uint32_t ptr = cap_zombie_cap_get_capZombieID(cap) & ~((1ul<<(radix + 1))-1ul);
    return cap_zombie_cap_set_capZombieID(cap, ptr | (n & ((1ul<<(radix + 1))-1ul)));
}

/* Capability table entry (CTE): size = 16 bytes */
struct cte {
    cap_t cap;
    mdb_node_t cteMDBNode;
};
typedef struct cte cte_t;



/* Thread state */
enum _thread_state {
    ThreadState_Inactive = 0,
    ThreadState_Running,
    ThreadState_Restart,
    ThreadState_BlockedOnReceive,
    ThreadState_BlockedOnSend,
    ThreadState_BlockedOnReply,
    ThreadState_BlockedOnAsyncEvent,
    ThreadState_IdleThreadState
};
typedef uint32_t _thread_state_t;

/* A TCB CNode and a TCB are always allocated together, and adjacently,
 * such that they fill a 1024-byte aligned block. The CNode comes first. */
enum tcb_cnode_index {
    /* CSpace root, 16 bytes */
    tcbCTable = 0,

    /* VSpace root, 16 bytes */
    tcbVTable = 1,

    /* Reply cap slot, 16 bytes */
    tcbReply = 2,

    /* TCB of most recent IPC sender, 16 bytes */
    tcbCaller = 3,

    /* IPC buffer cap slot, 16 bytes */
    tcbBuffer = 4,

    tcbCNodeEntries
};
typedef uint32_t tcb_cnode_index_t;

/* TCB CNode: size = 256 bytes */
/* typedef cte_t[16] tcb_cnode; */

/* TCB: size = 652 bytes, alignment = 256 bytes */
struct tcb {
    /* Saved user-level context of thread, 592 bytes */
    user_context_t tcbContext;

    /* Thread state, 12 bytes */
    thread_state_t tcbState;

    /* Current fault, 8 bytes */
    fault_t tcbFault;

    /* Current lookup failure, 8 bytes */
    lookup_fault_t tcbLookupFailure;

    /* Domain, 1 byte (packed to 4) */
    uint32_t tcbDomain;

    /* Priority, 1 byte (packed to 4) */
    uint32_t tcbPriority;

    /* Timeslice remaining, 4 bytes */
    word_t tcbTimeSlice;

    /* Capability pointer to thread fault handler, 4 bytes */
    cptr_t tcbFaultHandler;

    /* userland virtual address of thread IPC buffer, 4 bytes */
    word_t tcbIPCBuffer;

    /* Previous and next pointers for endpoint & scheduler queues, 16 bytes */
    struct tcb* tcbSchedNext;
    struct tcb* tcbSchedPrev;
    struct tcb* tcbEPNext;
    struct tcb* tcbEPPrev;
};
typedef struct tcb tcb_t;

/* Ensure TCB size is sane. */



/* IA32-specific object types */
# 264 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h"
/* helper structure for filling descriptor registers */
typedef struct gdt_idt_ptr {
    uint16_t limit;
    uint16_t basel;
    uint16_t baseh;
} gdt_idt_ptr_t;









enum vm_rights {
    VMKernelOnly = 1,
    VMReadOnly = 2,
    VMReadWrite = 3
};
typedef uint32_t vm_rights_t;

static inline word_t __attribute__((__const__))
wordFromVMRights(vm_rights_t vm_rights)
{
    return (word_t)vm_rights;
}

static inline vm_rights_t __attribute__((__const__))
vmRightsFromWord(word_t w)
{
    return (vm_rights_t)w;
}

enum asidSizeConstants {
    asidHighBits = 6,
    asidLowBits = 10
};

struct asid_pool {
    pde_t* array[(1ul<<(asidLowBits))];
};

typedef struct asid_pool asid_pool_t;
# 318 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h"
static inline asid_t __attribute__((__const__))
cap_frame_cap_get_capFMappedASID(cap_t cap)
{
    return
        (cap_frame_cap_get_capFMappedASIDHigh(cap) << asidLowBits) +
        cap_frame_cap_get_capFMappedASIDLow(cap);
}

static inline cap_t __attribute__((__const__))
cap_frame_cap_set_capFMappedASID(cap_t cap, word_t asid)
{
    cap = cap_frame_cap_set_capFMappedASIDLow(cap, (asid & ((1ul<<(asidLowBits))-1ul)));
    return cap_frame_cap_set_capFMappedASIDHigh(cap, ((asid >> asidLowBits) & ((1ul<<(asidHighBits))-1ul)));
}

static inline asid_t __attribute__((__pure__))
cap_frame_cap_ptr_get_capFMappedASID(cap_t* cap)
{
    return cap_frame_cap_get_capFMappedASID(*cap);
}

static inline void
cap_frame_cap_ptr_set_capFMappedASID(cap_t* cap, asid_t asid)
{
    *cap = cap_frame_cap_set_capFMappedASID(*cap, asid);
}


static inline unsigned int __attribute__((__const__))
cap_get_capSizeBits(cap_t cap)
{
    cap_tag_t ctag;
    uint32_t type;

    ctag = cap_get_capType(cap);

    switch (ctag) {
    case cap_untyped_cap:
        return cap_untyped_cap_get_capBlockSize(cap);

    case cap_endpoint_cap:
        return 4;

    case cap_async_endpoint_cap:
        return 4;

    case cap_cnode_cap:
        return cap_cnode_cap_get_capCNodeRadix(cap) + 4;

    case cap_thread_cap:
        return 10;

    case cap_frame_cap:
        return pageBitsForSize(cap_frame_cap_get_capFSize(cap));

    case cap_page_table_cap:
        return (10 + 2);

    case cap_page_directory_cap:
        return (10 + 2);

    case cap_zombie_cap:
        type = cap_zombie_cap_get_capZombieType(cap);
        if (type == (1ul<<(5))) {
            return 10;
        }
        return (type & ((1ul<<(5))-1ul)) + 4;

    case cap_null_cap:
        return 0;

    case cap_domain_cap:
        return 0;

    case cap_reply_cap:
        return 0;

    case cap_irq_control_cap:
        return 0;

    case cap_irq_handler_cap:
        return 0;

    case cap_io_port_cap:
        return 0;







    case cap_asid_control_cap:
        return 0;

    case cap_asid_pool_cap:
        return (asidLowBits + 2);

    default:
        halt();
    }
}

static inline void * __attribute__((__const__))
cap_get_capPtr(cap_t cap)
{
    cap_tag_t ctag;

    ctag = cap_get_capType(cap);

    switch (ctag) {
    case cap_untyped_cap:
        return ((word_t *)(cap_untyped_cap_get_capPtr(cap)));

    case cap_endpoint_cap:
        return ((endpoint_t *)cap_endpoint_cap_get_capEPPtr(cap));

    case cap_async_endpoint_cap:
        return ((async_endpoint_t *)cap_async_endpoint_cap_get_capAEPPtr(cap));

    case cap_cnode_cap:
        return ((cte_t *)(cap_cnode_cap_get_capCNodePtr(cap)));

    case cap_thread_cap:
        return (((cte_t *)((unsigned int)cap_thread_cap_get_capTCBPtr(cap)&~((1ul<<(10))-1ul)))+0);

    case cap_frame_cap:
        return (void *)(cap_frame_cap_get_capFBasePtr(cap));

    case cap_page_table_cap:
        return ((pde_t *)(cap_page_table_cap_get_capPTBasePtr(cap)));

    case cap_page_directory_cap:
        return ((pte_t *)cap_page_directory_cap_get_capPDBasePtr(cap));

    case cap_zombie_cap:
        return ((cte_t *)(cap_zombie_cap_get_capZombiePtr(cap)));

    case cap_null_cap:
        return ((void *)0);

    case cap_domain_cap:
        return ((void *)0);

    case cap_reply_cap:
        return ((void *)0);

    case cap_irq_control_cap:
        return ((void *)0);

    case cap_irq_handler_cap:
        return ((void *)0);

    case cap_io_port_cap:
        return ((void *)0);







    case cap_asid_control_cap:
        return ((void *)0);

    case cap_asid_pool_cap:
        return ((asid_pool_t*)cap_asid_pool_cap_get_capASIDPool(cap));

    default:
        halt();
    }
}

static inline vm_attributes_t __attribute__((__const__))
vmAttributesFromWord(word_t w)
{
    vm_attributes_t attr;

    attr.words[0] = w;
    return attr;
}

static inline word_t __attribute__((__const__))
isArchCap(cap_t cap)
{
    return (cap_get_capType(cap) % 2);
}
# 31 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 2
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 2

enum _bool {
    false = 0,
    true = 1
};
typedef uint32_t bool_t;

typedef struct region {
    pptr_t start;
    pptr_t end;
} region_t;

typedef struct p_region {
    paddr_t start;
    paddr_t end;
} p_region_t;

typedef struct v_region {
    vptr_t start;
    vptr_t end;
} v_region_t;




struct pde_range {
    pde_t *base;
    unsigned int length;
};
typedef struct pde_range pde_range_t;

struct pte_range {
    pte_t *base;
    unsigned int length;
};
typedef struct pte_range pte_range_t;

typedef cte_t *cte_ptr_t;

struct extra_caps {
    cte_ptr_t excaprefs[((1ul<<(seL4_MsgExtraCapBits))-1)];
};
typedef struct extra_caps extra_caps_t;
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/benchmark.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/benchmark.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/benchmark.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/io.h" 2

void out8(uint16_t port, uint8_t value);
void out16(uint16_t port, uint16_t value);
void out32(uint16_t port, uint32_t value);
uint8_t in8(uint16_t port);
uint16_t in16(uint16_t port);
uint32_t in32(uint16_t port);

/* these versions are linked to physical addresses */
void out8_phys(uint16_t port, uint8_t value);
uint8_t in8_phys(uint16_t port);
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 2
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/benchmark.h" 2
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/pat.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/cpu_registers.h"
/* We use a dummy variable to synchronize reads and writes to the control registers.
 * this allows us to write inline asm blocks that do not have enforced memory
 * clobbers for ordering. */
static uint32_t __control_reg_order;

static inline uint32_t read_cr3(void)
{
    uint32_t val;
    __asm__ volatile("movl %%cr3, %0" : "=r"(val), "=m"(__control_reg_order));
    return val;
}

static inline void write_cr3(uint32_t val)
{
    __asm__ volatile("movl %0, %%cr3" :: "r"(val), "m"(__control_reg_order));
}

static inline uint32_t read_cr0(void)
{
    uint32_t val;
    __asm__ volatile("movl %%cr0, %0" : "=r"(val), "=m"(__control_reg_order));
    return val;
}

static inline void write_cr0(uint32_t val)
{
    __asm__ volatile("movl %0, %%cr0" :: "r"(val), "m"(__control_reg_order));
}

uint32_t read_cr4(void);
void write_cr4(uint32_t value);
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/devices.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/devices.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




/* interrupt vectors (corresponds to IDT entries) */

typedef enum _interrupt_t {
    int_invalid = -1,
    int_unimpl_dev = 0x07,
    int_page_fault = 0x0e,
    int_irq_min = 0x20, /* First IRQ. */
    int_irq_isa_min = 0x20,
    int_irq_isa_max = 0x2f,
    int_irq_msi_min = 0x30,
    int_irq_msi_max = 0x3d,
    int_iommu = 0x3e,
    int_timer = 0x3f,
    int_irq_max = 0x3f, /* Last IRQ. */
    int_trap_min = 0x40,
    int_trap_max = 0xfe,
    int_spurious = 0xff,
    int_max = 0xff
} interrupt_t;



typedef enum _irq_t {
    irqInvalid = -1,
    irq_isa_min = int_irq_isa_min - 0x20, /* 0x00 */
    irq_isa_max = int_irq_isa_max - 0x20, /* 0x0f */
    irq_msi_min = int_irq_msi_min - 0x20, /* 0x10 */
    irq_msi_max = int_irq_msi_max - 0x20, /* 0x1d */
    irq_iommu = int_iommu - 0x20, /* 0x1e */
    irq_timer = int_timer - 0x20, /* 0x1f */
    maxIRQ = int_timer - 0x20 /* 0x1f */
} irq_t;





/* The text mode framebuffer exists part way into the video ram region */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h" 2
# 1 "./plat/machine/hardware_gen.h" 1



# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 5 "./plat/machine/hardware_gen.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 6 "./plat/machine/hardware_gen.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/stdint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 7 "./plat/machine/hardware_gen.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 8 "./plat/machine/hardware_gen.h" 2
struct pci_bar {
    uint32_t words[1];
};
typedef struct pci_bar pci_bar_t;

enum pci_bar_tag {
    pci_bar_pci_bar_mem = 0,
    pci_bar_pci_bar_io = 1
};
typedef enum pci_bar_tag pci_bar_tag_t;

static inline uint32_t __attribute__((__const__))
pci_bar_get_pci_space(pci_bar_t pci_bar) {
    return (pci_bar.words[0] >> 0) & 0x1;
}

static inline uint32_t __attribute__((__const__))
pci_bar_pci_bar_mem_get_base_address(pci_bar_t pci_bar) {
   
                               ;

    return (pci_bar.words[0] & 0xfffffff0) << 0;
}

static inline uint32_t __attribute__((__const__))
pci_bar_pci_bar_mem_get_above_4GB(pci_bar_t pci_bar) {
   
                               ;

    return (pci_bar.words[0] & 0x4) >> 2;
}
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h" 2

/* WARNING: some of these constants are also defined in linker.lds */
# 32 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h"
static inline void* __attribute__((__const__))
paddr_to_pptr(paddr_t paddr)
{
    return (void*)(paddr + (0xe0000000 - 0x00000000));
}

static inline paddr_t __attribute__((__const__))
pptr_to_paddr(void* pptr)
{
    return (paddr_t)pptr - (0xe0000000 - 0x00000000);
}

static inline region_t __attribute__((__const__))
paddr_to_pptr_reg(p_region_t p_reg)
{
    return (region_t) {
        p_reg.start + (0xe0000000 - 0x00000000), p_reg.end + (0xe0000000 - 0x00000000)
    };
}

static inline p_region_t __attribute__((__const__))
pptr_to_paddr_reg(region_t reg)
{
    return (p_region_t) {
        reg.start - (0xe0000000 - 0x00000000), reg.end - (0xe0000000 - 0x00000000)
    };
}

void handleReservedIRQ(irq_t irq);
void maskInterrupt(bool_t mask, irq_t irq);
void ackInterrupt(irq_t irq);
irq_t getActiveIRQ(void);
bool_t isIRQPending(void);
void resetTimer(void);
void platAddDevices(void);

void handleSpuriousIRQ(void);
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/devices.h" 2
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 2






extern interrupt_t ia32KScurInterrupt;
extern tss_t ia32KStss;
extern gdt_entry_t ia32KSgdt[];
extern asid_pool_t* ia32KSASIDTable[];
extern tcb_t *ia32KSfpuOwner;
extern pde_t* ia32KSkernelPD;
extern pte_t* ia32KSkernelPT;
extern uint32_t ia32KScacheLineSizeBits;
extern idt_entry_t ia32KSidt[];
extern user_fpu_state_t ia32KSnullFpuState __attribute__((__aligned__(16)));
extern paddr_t ia32KSCurrentPD;
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 2
# 28 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h"
word_t __attribute__((__pure__)) getRestartPC(tcb_t *thread);
void setNextPC(tcb_t *thread, word_t v);

/* Address space control */
static inline paddr_t getCurrentPD(void)
{
    return ia32KSCurrentPD;
}

static inline void setCurrentPD(paddr_t addr)
{
    ia32KSCurrentPD = addr;
    write_cr3(addr);
}

/* TLB control */
void invalidateTLB(void);
void invalidateTLBentry(vptr_t vptr);

/* Invalidates page structures cache */
void invalidatePageStructureCache(void);

/* Flushes entire CPU Cache */
void ia32_wbinvd(void);

/* GDT installation */
void ia32_install_gdt(gdt_idt_ptr_t* gdt_idt_ptr);

/* IDT installation */
void ia32_install_idt(gdt_idt_ptr_t* gdt_idt_ptr);

/* LDT installation */
void ia32_install_ldt(uint32_t ldt_sel);

/* TSS installation */
void ia32_install_tss(uint32_t tss_sel);

/* Get page fault address from CR2 register */
uint32_t getFaultAddr(void);

/* Get current stack pointer */
void* get_current_esp(void);

/* Cleaning memory before user-level access */
static inline void clearMemory(void* ptr, unsigned int bits)
{
    memzero(ptr, (1ul<<(bits)));
    /* no cleaning of caches necessary on IA-32 */
}

/* Initialises MSRs required to setup sysenter and sysexit */
void init_sysenter_msrs(void);

/* Read model specific register */
uint32_t ia32_rdmsr_low(const uint32_t reg);
uint32_t ia32_rdmsr_high(const uint32_t reg);

/* Write model specific register */
void ia32_wrmsr(const uint32_t reg, const uint32_t val_high, const uint32_t val_low);

/* Read different parts of CPUID */
uint32_t ia32_cpuid_edx(uint32_t eax, uint32_t ecx);

/* Read/write memory fence */
void ia32_mfence(void);

/* sysenter entry point */
void handle_syscall(void);

void int_00(void);
void int_01(void);
void int_02(void);
void int_03(void);
void int_04(void);
void int_05(void);
void int_06(void);
void int_07(void);
void int_08(void);
void int_09(void);
void int_0a(void);
void int_0b(void);
void int_0c(void);
void int_0d(void);
void int_0e(void);
void int_0f(void);

void int_10(void);
void int_11(void);
void int_12(void);
void int_13(void);
void int_14(void);
void int_15(void);
void int_16(void);
void int_17(void);
void int_18(void);
void int_19(void);
void int_1a(void);
void int_1b(void);
void int_1c(void);
void int_1d(void);
void int_1e(void);
void int_1f(void);

void int_20(void);
void int_21(void);
void int_22(void);
void int_23(void);
void int_24(void);
void int_25(void);
void int_26(void);
void int_27(void);
void int_28(void);
void int_29(void);
void int_2a(void);
void int_2b(void);
void int_2c(void);
void int_2d(void);
void int_2e(void);
void int_2f(void);

void int_30(void);
void int_31(void);
void int_32(void);
void int_33(void);
void int_34(void);
void int_35(void);
void int_36(void);
void int_37(void);
void int_38(void);
void int_39(void);
void int_3a(void);
void int_3b(void);
void int_3c(void);
void int_3d(void);
void int_3e(void);
void int_3f(void);

void int_40(void);
void int_41(void);
void int_42(void);
void int_43(void);
void int_44(void);
void int_45(void);
void int_46(void);
void int_47(void);
void int_48(void);
void int_49(void);
void int_4a(void);
void int_4b(void);
void int_4c(void);
void int_4d(void);
void int_4e(void);
void int_4f(void);

void int_50(void);
void int_51(void);
void int_52(void);
void int_53(void);
void int_54(void);
void int_55(void);
void int_56(void);
void int_57(void);
void int_58(void);
void int_59(void);
void int_5a(void);
void int_5b(void);
void int_5c(void);
void int_5d(void);
void int_5e(void);
void int_5f(void);

void int_60(void);
void int_61(void);
void int_62(void);
void int_63(void);
void int_64(void);
void int_65(void);
void int_66(void);
void int_67(void);
void int_68(void);
void int_69(void);
void int_6a(void);
void int_6b(void);
void int_6c(void);
void int_6d(void);
void int_6e(void);
void int_6f(void);

void int_70(void);
void int_71(void);
void int_72(void);
void int_73(void);
void int_74(void);
void int_75(void);
void int_76(void);
void int_77(void);
void int_78(void);
void int_79(void);
void int_7a(void);
void int_7b(void);
void int_7c(void);
void int_7d(void);
void int_7e(void);
void int_7f(void);

void int_80(void);
void int_81(void);
void int_82(void);
void int_83(void);
void int_84(void);
void int_85(void);
void int_86(void);
void int_87(void);
void int_88(void);
void int_89(void);
void int_8a(void);
void int_8b(void);
void int_8c(void);
void int_8d(void);
void int_8e(void);
void int_8f(void);

void int_90(void);
void int_91(void);
void int_92(void);
void int_93(void);
void int_94(void);
void int_95(void);
void int_96(void);
void int_97(void);
void int_98(void);
void int_99(void);
void int_9a(void);
void int_9b(void);
void int_9c(void);
void int_9d(void);
void int_9e(void);
void int_9f(void);

void int_a0(void);
void int_a1(void);
void int_a2(void);
void int_a3(void);
void int_a4(void);
void int_a5(void);
void int_a6(void);
void int_a7(void);
void int_a8(void);
void int_a9(void);
void int_aa(void);
void int_ab(void);
void int_ac(void);
void int_ad(void);
void int_ae(void);
void int_af(void);

void int_b0(void);
void int_b1(void);
void int_b2(void);
void int_b3(void);
void int_b4(void);
void int_b5(void);
void int_b6(void);
void int_b7(void);
void int_b8(void);
void int_b9(void);
void int_ba(void);
void int_bb(void);
void int_bc(void);
void int_bd(void);
void int_be(void);
void int_bf(void);

void int_c0(void);
void int_c1(void);
void int_c2(void);
void int_c3(void);
void int_c4(void);
void int_c5(void);
void int_c6(void);
void int_c7(void);
void int_c8(void);
void int_c9(void);
void int_ca(void);
void int_cb(void);
void int_cc(void);
void int_cd(void);
void int_ce(void);
void int_cf(void);

void int_d0(void);
void int_d1(void);
void int_d2(void);
void int_d3(void);
void int_d4(void);
void int_d5(void);
void int_d6(void);
void int_d7(void);
void int_d8(void);
void int_d9(void);
void int_da(void);
void int_db(void);
void int_dc(void);
void int_dd(void);
void int_de(void);
void int_df(void);

void int_e0(void);
void int_e1(void);
void int_e2(void);
void int_e3(void);
void int_e4(void);
void int_e5(void);
void int_e6(void);
void int_e7(void);
void int_e8(void);
void int_e9(void);
void int_ea(void);
void int_eb(void);
void int_ec(void);
void int_ed(void);
void int_ee(void);
void int_ef(void);

void int_f0(void);
void int_f1(void);
void int_f2(void);
void int_f3(void);
void int_f4(void);
void int_f5(void);
void int_f6(void);
void int_f7(void);
void int_f8(void);
void int_f9(void);
void int_fa(void);
void int_fb(void);
void int_fc(void);
void int_fd(void);
void int_fe(void);
void int_ff(void);
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 2

static inline void
setRegister(tcb_t *thread, register_t reg, word_t w)
{
    thread->tcbContext.registers[reg] = w;
}

static inline word_t __attribute__((__pure__))
getRegister(tcb_t *thread, register_t reg)
{
    return thread->tcbContext.registers[reg];
}
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/hardware.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/hardware.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/hardware.h" 2
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine.h" 2
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/errors.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




typedef enum {
    seL4_NoError = 0,
    seL4_InvalidArgument,
    seL4_InvalidCapability,
    seL4_IllegalOperation,
    seL4_RangeError,
    seL4_AlignmentError,
    seL4_FailedLookup,
    seL4_TruncatedMessage,
    seL4_DeleteFirst,
    seL4_RevokeFirst,
    seL4_NotEnoughMemory,
} seL4_Error;
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 2
/* These datatypes differ markedly from haskell, due to the
 * different implementation of the various fault monads */


enum exception {
    EXCEPTION_NONE,
    EXCEPTION_FAULT,
    EXCEPTION_LOOKUP_FAULT,
    EXCEPTION_SYSCALL_ERROR,
    EXCEPTION_PREEMPTED
};
typedef uint32_t exception_t;

typedef uint32_t syscall_error_type_t;

struct syscall_error {
    unsigned int invalidArgumentNumber;
    unsigned int invalidCapNumber;
    word_t rangeErrorMin;
    word_t rangeErrorMax;
    word_t memoryLeft;
    bool_t failedLookupWasSource;

    syscall_error_type_t type;
};
typedef struct syscall_error syscall_error_t;

extern lookup_fault_t current_lookup_fault;
extern fault_t current_fault;
extern syscall_error_t current_syscall_error;
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 2

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/tcb.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/tcb.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/tcb.h" 2

unsigned int setMRs_fault(tcb_t *sender, tcb_t* receiver, word_t *receiveIPCBuffer);
unsigned int setMRs_syscall_error(tcb_t *thread, word_t *receiveIPCBuffer);
word_t __attribute__((__const__)) Arch_decodeTransfer(word_t flags);
exception_t __attribute__((__const__)) Arch_performTransfer(word_t arch, tcb_t *tcb_src, tcb_t *tcb_dest);
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 2

struct slot_range {
    cte_t *cnode;
    unsigned int offset;
    unsigned int length;
};
typedef struct slot_range slot_range_t;

exception_t decodeCNodeInvocation(word_t label, unsigned int length,
                                  cap_t cap, extra_caps_t extraCaps,
                                  word_t *buffer);
exception_t invokeCNodeRevoke(cte_t *destSlot);
exception_t invokeCNodeDelete(cte_t *destSlot);
exception_t invokeCNodeRecycle(cte_t *destSlot);
exception_t invokeCNodeInsert(cap_t cap, cte_t *srcSlot, cte_t *destSlot);
exception_t invokeCNodeMove(cap_t cap, cte_t *srcSlot, cte_t *destSlot);
exception_t invokeCNodeRotate(cap_t cap1, cap_t cap2, cte_t *slot1,
                              cte_t *slot2, cte_t *slot3);
exception_t invokeCNodeSaveCaller(cte_t *destSlot);
void cteInsert(cap_t newCap, cte_t *srcSlot, cte_t *destSlot);
void cteMove(cap_t newCap, cte_t *srcSlot, cte_t *destSlot);
void capSwapForDelete(cte_t *slot1, cte_t *slot2);
void cteSwap(cap_t cap1, cte_t *slot1, cap_t cap2, cte_t *slot2);
exception_t cteRevoke(cte_t *slot);
exception_t cteDelete(cte_t *slot, bool_t exposed);
void cteDeleteOne(cte_t* slot);
exception_t cteRecycle(cte_t *slot);
void insertNewCap(cte_t *parent, cte_t *slot, cap_t cap);
void setupReplyMaster(tcb_t *thread);
bool_t __attribute__((__pure__)) isMDBParentOf(cte_t *cte_a, cte_t *cte_b);
exception_t ensureNoChildren(cte_t *slot);
exception_t ensureEmptySlot(cte_t *slot);
bool_t __attribute__((__pure__)) isFinalCapability(cte_t *cte);
bool_t __attribute__((__pure__)) slotCapLongRunningDelete(cte_t *slot);
cte_t *getReceiveSlots(tcb_t *thread, word_t *buffer);
cap_transfer_t __attribute__((__pure__)) loadCapTransfer(word_t *buffer);
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 2

struct tcb_queue {
    tcb_t *head;
    tcb_t *end;
};
typedef struct tcb_queue tcb_queue_t;

void tcbSchedEnqueue(tcb_t *tcb);
void tcbSchedAppend(tcb_t *tcb);
void tcbSchedDequeue(tcb_t *tcb);

tcb_queue_t tcbEPAppend(tcb_t *tcb, tcb_queue_t queue);
tcb_queue_t tcbEPDequeue(tcb_t *tcb, tcb_queue_t queue);

void setupCallerCap(tcb_t *sender, tcb_t *receiver);
void deleteCallerCap(tcb_t *receiver);

unsigned int copyMRs(tcb_t *sender, word_t *sendBuf, tcb_t *receiver,
                     word_t *recvBuf, unsigned int n);
exception_t decodeTCBInvocation(word_t label, unsigned int length, cap_t cap,
                                cte_t* slot, extra_caps_t extraCaps, bool_t call,
                                word_t *buffer);
exception_t decodeCopyRegisters(cap_t cap, unsigned int length,
                                extra_caps_t extraCaps, word_t *buffer);
exception_t decodeReadRegisters(cap_t cap, unsigned int length, bool_t call,
                                word_t *buffer);
exception_t decodeWriteRegisters(cap_t cap, unsigned int length, word_t *buffer);
exception_t decodeTCBConfigure(cap_t cap, unsigned int length,
                               cte_t* slot, extra_caps_t rootCaps, word_t *buffer);
exception_t decodeSetDomainAttributes(cap_t cap, unsigned int length, word_t *buffer);
exception_t decodeSetPriority(cap_t cap, unsigned int length, word_t *buffer);
exception_t decodeSetIPCBuffer(cap_t cap, unsigned int length,
                               cte_t* slot, extra_caps_t extraCaps, word_t *buffer);
exception_t decodeSetSpace(cap_t cap, unsigned int length,
                           cte_t* slot, extra_caps_t extraCaps, word_t *buffer);
exception_t decodeDomainInvocation(word_t label, unsigned int length,
                                   extra_caps_t extraCaps, word_t *buffer);

enum thread_control_flag {
    thread_control_update_priority = 0x1,
    thread_control_update_ipc_buffer = 0x2,
    thread_control_update_space = 0x4,
    thread_control_update_all = 0x7,
};

typedef uint32_t thread_control_flag_t;

exception_t invokeTCB_Suspend(tcb_t *thread);
exception_t invokeTCB_Resume(tcb_t *thread);
exception_t invokeTCB_ThreadControl(tcb_t *target, cte_t* slot, cptr_t faultep,
                                    prio_t priority, cap_t cRoot_newCap,
                                    cte_t *cRoot_srcSlot, cap_t vRoot_newCap,
                                    cte_t *vRoot_srcSlot, word_t bufferAddr,
                                    cap_t bufferCap, cte_t *bufferSrcSlot,
                                    thread_control_flag_t updateFlags);
exception_t invokeTCB_CopyRegisters(tcb_t *dest, tcb_t *src,
                                    bool_t suspendSource, bool_t resumeTarget,
                                    bool_t transferFrame, bool_t transferInteger,
                                    word_t transferArch);
exception_t invokeTCB_ReadRegisters(tcb_t *src, bool_t suspendSource,
                                    unsigned int n, word_t arch, bool_t call);
exception_t invokeTCB_WriteRegisters(tcb_t *dest, bool_t resumeTarget,
                                     unsigned int n, word_t arch, word_t *buffer);

cptr_t __attribute__((__pure__)) getExtraCPtr(word_t *bufferPtr, unsigned int i);
void setExtraBadge(word_t *bufferPtr, word_t badge, unsigned int i);

exception_t lookupExtraCaps(tcb_t* thread, word_t *bufferPtr, message_info_t info);
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 2

extern tcb_queue_t ksReadyQueues[] __attribute__((externally_visible));
extern tcb_t *ksCurThread __attribute__((externally_visible));
extern tcb_t *ksIdleThread __attribute__((externally_visible));
extern tcb_t *ksSchedulerAction __attribute__((externally_visible));
extern word_t ksWorkUnitsCompleted;
extern irq_state_t intStateIRQTable[] __attribute__((externally_visible));
extern cte_t *intStateIRQNode __attribute__((externally_visible));
extern const dschedule_t ksDomSchedule[];
extern const unsigned int ksDomScheduleLength;
extern uint32_t ksDomScheduleIdx;
extern dom_t ksCurDomain;
extern word_t ksDomainTime;
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/vspace.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/vspace.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/vspace.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/vspace.h" 2



void init_boot_pd(void);
void enable_paging(void);
bool_t map_kernel_window(
    pde_t* pd,
    pte_t* pt,
    p_region_t ndks_p_reg




);

void* map_temp_boot_page(void* entry, uint32_t pages);
bool_t init_vm_state(pde_t* kernel_pd, pte_t* kernel_pt);
void init_dtrs(void);
void map_it_pt_cap(cap_t pd_cap, cap_t pt_cap);
void map_it_frame_cap(cap_t pd_cap, cap_t frame_cap);
void write_it_asid_pool(cap_t it_ap_cap, cap_t it_pd_cap);
bool_t init_pat_msr(void);

/* ==================== BOOT CODE FINISHES HERE ==================== */

void idle_thread(void);


void copyGlobalMappings(pde_t* newPD);
word_t* __attribute__((__pure__)) lookupIPCBuffer(bool_t isReceiver, tcb_t *thread);
exception_t handleVMFault(tcb_t *thread, vm_fault_type_t vm_faultType);
void unmapPageTable(asid_t, vptr_t vaddr, pte_t* pt);
void deleteASIDPool(asid_t asid_base, asid_pool_t* pool);
void deleteASID(asid_t asid, pde_t* pd);
void unmapPage(vm_page_size_t page_size, asid_t asid, vptr_t vptr, void *pptr);
void setVMRoot(tcb_t *tcb);
bool_t __attribute__((__const__)) isValidVTableRoot(cap_t cap);
exception_t checkValidIPCBuffer(vptr_t vptr, cap_t cap);
vm_rights_t __attribute__((__const__)) maskVMRights(vm_rights_t vm_rights, cap_rights_t cap_rights_mask);
exception_t decodeIA32MMUInvocation(word_t label, unsigned int length, cptr_t cptr, cte_t *cte, cap_t cap, extra_caps_t extraCaps, word_t* buffer);
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/vspace.h" 2
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 2
# 1 "./arch/api/syscall.h" 1
/* @LICENSE(OKL_CORE) */

/* This header was generated by kernel/tools/syscall_header_gen.py.
 *
 * To add a system call number, edit kernel/include/api/syscall.xml
 *
 */
# 29 "./arch/api/syscall.h"
enum syscall {
    SysCall = -1,
    SysReplyWait = -2,
    SysSend = -3,
    SysNBSend = -4,
    SysWait = -5,
    SysReply = -6,
    SysYield = -7,
# 51 "./arch/api/syscall.h"
};
typedef uint32_t syscall_t;
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 2

exception_t handleSyscall(syscall_t syscall) __attribute__((externally_visible));
exception_t handleInterruptEntry(void) __attribute__((externally_visible));
exception_t handleUnknownSyscall(word_t w) __attribute__((externally_visible));
exception_t handleUserLevelFault(word_t w_a, word_t w_b) __attribute__((externally_visible));
exception_t handleVMFaultEvent(vm_fault_type_t vm_faultType) __attribute__((externally_visible));

static inline word_t __attribute__((__pure__))
getSyscallArg(unsigned int i, word_t* ipc_buffer)
{
    if (i < n_msgRegisters) {
        return getRegister(ksCurThread, msgRegisters[i]);
    }

    ;
    return ipc_buffer[i + 1];
}

extern extra_caps_t current_extra_caps;
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/faults.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/faults.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 2

struct deriveCap_ret {
    exception_t status;
    cap_t cap;
};
typedef struct deriveCap_ret deriveCap_ret_t;

struct finaliseCap_ret {
    cap_t remainder;
    irq_t irq;
};
typedef struct finaliseCap_ret finaliseCap_ret_t;

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/objecttype.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/objecttype.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/objecttype.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/objecttype.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/objecttype.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/objecttype.h" 2

deriveCap_ret_t Arch_deriveCap(cte_t *slot, cap_t cap);
cap_t __attribute__((__const__)) Arch_updateCapData(bool_t preserve, word_t data, cap_t cap);
cap_t __attribute__((__const__)) Arch_maskCapRights(cap_rights_t cap_rights_mask, cap_t cap);
cap_t Arch_finaliseCap(cap_t cap, bool_t final);
cap_t Arch_recycleCap(bool_t is_final, cap_t cap);
bool_t __attribute__((__const__)) Arch_hasRecycleRights(cap_t cap);
bool_t __attribute__((__const__)) Arch_sameRegionAs(cap_t cap_a, cap_t cap_b);
bool_t __attribute__((__const__)) Arch_sameObjectAs(cap_t cap_a, cap_t cap_b);
cap_t Arch_createObject(object_t t, void *regionBase, word_t userSize);
exception_t Arch_decodeInvocation(word_t label, unsigned int length, cptr_t cptr, cte_t *slot, cap_t cap, extra_caps_t extraCaps, word_t* buffer);
void Arch_prepareThreadDelete(tcb_t *thread);
word_t Arch_getObjectSize(word_t t);
# 33 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 2

deriveCap_ret_t deriveCap(cte_t *slot, cap_t cap);
finaliseCap_ret_t finaliseCap(cap_t cap, bool_t final, bool_t exposed);
cap_t recycleCap(bool_t is_final, cap_t cap);
bool_t __attribute__((__const__)) hasRecycleRights(cap_t cap);
bool_t __attribute__((__const__)) sameRegionAs(cap_t cap_a, cap_t cap_b);
bool_t __attribute__((__const__)) sameObjectAs(cap_t cap_a, cap_t cap_b);
cap_t __attribute__((__const__)) updateCapData(bool_t preserve, word_t newData, cap_t cap);
cap_t __attribute__((__const__)) maskCapRights(cap_rights_t cap_rights, cap_t cap);
cap_t createObject(object_t t, void *regionBase, word_t);
void createNewObjects(object_t t, cte_t *parent, slot_range_t slots,
                      void *regionBase, word_t userSize);
exception_t decodeInvocation(word_t label, unsigned int length,
                             cptr_t capIndex, cte_t *slot, cap_t cap,
                             extra_caps_t extraCaps, bool_t block, bool_t call,
                             word_t *buffer);
exception_t performInvocation_Endpoint(endpoint_t *ep, word_t badge,
                                       bool_t canGrant, bool_t block,
                                       bool_t call);
exception_t performInvocation_AsyncEndpoint(async_endpoint_t *aep,
                                            word_t badge, word_t message);
exception_t performInvocation_Reply(tcb_t *thread, cte_t *slot);
word_t getObjectSize(word_t t, word_t userObjSize);
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/asyncendpoint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/asyncendpoint.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/asyncendpoint.h" 2

void sendAsyncIPC(async_endpoint_t *aepptr, word_t badge, word_t val);
void receiveAsyncIPC(tcb_t *thread, cap_t cap);
void aepCancelAll(async_endpoint_t *aepptr);
void asyncIPCCancel(tcb_t *threadPtr, async_endpoint_t *aepptr);
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/endpoint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/endpoint.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/endpoint.h" 2

void sendIPC(bool_t blocking, bool_t do_call, word_t badge,
             bool_t canGrant, tcb_t *thread, endpoint_t *epptr);
void receiveIPC(tcb_t *thread, cap_t cap);
void ipcCancel(tcb_t *tptr);
void epCancelAll(endpoint_t *epptr);
void epCancelBadgedSends(endpoint_t *epptr, word_t badge);
void replyFromKernel_error(tcb_t *thread);
void replyFromKernel_success_empty(tcb_t *thread);
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/interrupt.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/interrupt.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/interrupt.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/interrupt.h" 2

exception_t Arch_decodeInterruptControl(unsigned int length, extra_caps_t extraCaps);
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 2

exception_t decodeIRQControlInvocation(word_t label, unsigned int length,
                                       cte_t *srcSlot, extra_caps_t extraCaps,
                                       word_t *buffer);
exception_t invokeIRQControl(irq_t irq, cte_t *handlerSlot, cte_t *controlSlot);
exception_t decodeIRQHandlerInvocation(word_t label, irq_t irq,
                                       extra_caps_t extraCaps);
void invokeIRQHandler_AckIRQ(irq_t irq);
void invokeIRQHandler_SetIRQHandler(irq_t irq, cap_t cap, cte_t *slot);
void invokeIRQHandler_ClearIRQHandler(irq_t irq);
void deletingIRQHandler(irq_t irq);
void deletedIRQHandler(irq_t irq);
void handleInterrupt(irq_t irq);
bool_t isIRQActive(irq_t irq);
void setIRQState(irq_state_t irqState, irq_t irq);
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/untyped.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/untyped.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/untyped.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/untyped.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/untyped.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/untyped.h" 2







exception_t decodeUntypedInvocation(word_t label, unsigned int length,
                                    cte_t *slot, cap_t cap,
                                    extra_caps_t extraCaps, bool_t call,
                                    word_t *buffer);
exception_t invokeUntyped_Retype(cte_t *srcSlot, void* base_ign,
                                 void* freeRegionBase, object_t newType,
                                 word_t userSize, slot_range_t destSlots,
                                 bool_t call);
# 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 2
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/faults.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/faults.h" 2

bool_t handleFaultReply(tcb_t *receiver, tcb_t *sender);
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 2

struct lookupCap_ret {
    exception_t status;
    cap_t cap;
};
typedef struct lookupCap_ret lookupCap_ret_t;

struct lookupCapAndSlot_ret {
    exception_t status;
    cap_t cap;
    cte_t *slot;
};
typedef struct lookupCapAndSlot_ret lookupCapAndSlot_ret_t;

struct lookupSlot_raw_ret {
    exception_t status;
    cte_t *slot;
};
typedef struct lookupSlot_raw_ret lookupSlot_raw_ret_t;

struct lookupSlot_ret {
    exception_t status;
    cte_t *slot;
};
typedef struct lookupSlot_ret lookupSlot_ret_t;

struct resolveAddressBits_ret {
    exception_t status;
    cte_t *slot;
    unsigned int bitsRemaining;
};
typedef struct resolveAddressBits_ret resolveAddressBits_ret_t;

lookupCap_ret_t lookupCap(tcb_t *thread, cptr_t cPtr);
lookupCapAndSlot_ret_t lookupCapAndSlot(tcb_t *thread, cptr_t cPtr);
lookupSlot_raw_ret_t lookupSlot(tcb_t *thread, cptr_t capptr);
lookupSlot_ret_t lookupSlotForCNodeOp(bool_t isSource,
                                      cap_t root, cptr_t capptr,
                                      unsigned int depth);
lookupSlot_ret_t lookupSourceSlot(cap_t root, cptr_t capptr,
                                  unsigned int depth);
lookupSlot_ret_t lookupTargetSlot(cap_t root, cptr_t capptr,
                                  unsigned int depth);
lookupSlot_ret_t lookupPivotSlot(cap_t root, cptr_t capptr,
                                 unsigned int depth);
resolveAddressBits_ret_t resolveAddressBits(cap_t nodeCap,
                                            cptr_t capptr,
                                            unsigned int n_bits);
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/faulthandler.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/faulthandler.h" 2

void handleFault(tcb_t *tptr);
exception_t sendFaultIPC(tcb_t *tptr);
void handleDoubleFault(tcb_t *tptr, fault_t ex1);
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 2

void configureIdleThread(tcb_t *tcb);
void activateThread(void) __attribute__((externally_visible));
void suspend(tcb_t *target);
void restart(tcb_t *target);
void doIPCTransfer(tcb_t *sender, endpoint_t *endpoint,
                   word_t badge, bool_t grant, tcb_t *receiver,
                   bool_t diminish);
void doReplyTransfer(tcb_t *sender, tcb_t *receiver, cte_t *slot);
void doNormalTransfer(tcb_t *sender, word_t *sendBuffer, endpoint_t *endpoint,
                      word_t badge, bool_t canGrant, tcb_t *receiver,
                      word_t *receiveBuffer, bool_t diminish);
void doFaultTransfer(word_t badge, tcb_t *sender, tcb_t *receiver,
                     word_t *receiverIPCBuffer);
void doAsyncTransfer(word_t badge, word_t msgWord, tcb_t *thread);
void schedule(void);
void chooseThread(void);
void switchToThread(tcb_t *thread) __attribute__((externally_visible));
void switchToIdleThread(void);
void setDomain(tcb_t *tptr, dom_t dom);
void setPriority(tcb_t *tptr, prio_t prio);
void scheduleTCB(tcb_t *tptr);
void attemptSwitchTo(tcb_t *tptr);
void switchIfRequiredTo(tcb_t *tptr);
void setThreadState(tcb_t *tptr, _thread_state_t ts) __attribute__((externally_visible));
void timerTick(void);
void rescheduleRequired(void);
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c" 2





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
        ((void)(0));
        handleSpuriousIRQ();
    }

    schedule();
    activateThread();

    return EXCEPTION_NONE;
}

exception_t
handleUnknownSyscall(word_t w)
{
# 132 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/api/syscall.c"
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

    if (__builtin_expect(!!(lu_ret.status != EXCEPTION_NONE), 0)) {
        ;
        current_fault = fault_cap_fault_new(cptr, false);

        if (isBlocking) {
            handleFault(thread);
        }

        return EXCEPTION_NONE;
    }

    buffer = lookupIPCBuffer(false, thread);

    status = lookupExtraCaps(thread, buffer, info);

    if (__builtin_expect(!!(status != EXCEPTION_NONE), 0)) {
        ;
        if (isBlocking) {
            handleFault(thread);
        }
        return EXCEPTION_NONE;
    }

    /* Syscall error/Preemptible section */
    length = message_info_get_msgLength(info);
    if (__builtin_expect(!!(length > n_msgRegisters && !buffer), 0)) {
        length = n_msgRegisters;
    }
    status = decodeInvocation(message_info_get_msgLabel(info), length,
                              cptr, lu_ret.slot, lu_ret.cap,
                              current_extra_caps, isBlocking, isCall,
                              buffer);

    if (__builtin_expect(!!(status == EXCEPTION_PREEMPTED), 0)) {
        return status;
    }

    if (__builtin_expect(!!(status == EXCEPTION_SYSCALL_ERROR), 0)) {
        if (isCall) {
            replyFromKernel_error(thread);
        }
        return EXCEPTION_NONE;
    }

    if (__builtin_expect(!!(thread_state_get_tsType(thread->tcbState) == ThreadState_Restart), 0)
                                                                                 ) {
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

    callerSlot = (((cte_t *)((unsigned int)ksCurThread&~((1ul<<(10))-1ul)))+tcbCaller);
    callerCap = callerSlot->cap;
    switch (cap_get_capType(callerCap)) {
    case cap_reply_cap: {
        tcb_t *caller;

        if (cap_reply_cap_get_capReplyMaster(callerCap)) {
            break;
        }
        caller = ((tcb_t *)(cap_reply_cap_get_capTCBPtr(callerCap)));
        /* Haskell error:
         * "handleReply: caller must not be the current thread" */
        ;
        doReplyTransfer(ksCurThread, caller, callerSlot);
        return;
    }

    case cap_null_cap:
        ;
        return;

    default:
        break;
    }

    halt();
}

static void
handleWait(void)
{
    word_t epCPtr;
    lookupCap_ret_t lu_ret;

    deleteCallerCap(ksCurThread);

    epCPtr = getRegister(ksCurThread, capRegister);

    lu_ret = lookupCap(ksCurThread, epCPtr);
    if (__builtin_expect(!!(lu_ret.status != EXCEPTION_NONE), 0)) {
        /* current_lookup_fault has been set by lookupCap */
        current_fault = fault_cap_fault_new(epCPtr, true);
        handleFault(ksCurThread);
        return;
    }

    switch (cap_get_capType(lu_ret.cap)) {
    case cap_endpoint_cap:
        if (__builtin_expect(!!(!cap_endpoint_cap_get_capCanReceive(lu_ret.cap)), 0)) {
            current_lookup_fault = lookup_fault_missing_capability_new(0);
            current_fault = fault_cap_fault_new(epCPtr, true);
            handleFault(ksCurThread);
            break;
        }

        receiveIPC(ksCurThread, lu_ret.cap);
        break;

    case cap_async_endpoint_cap:
        if (__builtin_expect(!!(!cap_async_endpoint_cap_get_capAEPCanReceive(lu_ret.cap)), 0)) {
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
        if (__builtin_expect(!!(ret != EXCEPTION_NONE), 0)) {
            irq = getActiveIRQ();
            if (irq != irqInvalid) {
                handleInterrupt(irq);
            }
        }
        break;

    case SysNBSend:
        ret = handleInvocation(false, false);
        if (__builtin_expect(!!(ret != EXCEPTION_NONE), 0)) {
            irq = getActiveIRQ();
            if (irq != irqInvalid) {
                handleInterrupt(irq);
            }
        }
        break;

    case SysCall:
        ret = handleInvocation(true, true);
        if (__builtin_expect(!!(ret != EXCEPTION_NONE), 0)) {
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
        halt();
    }

    schedule();
    activateThread();

    return EXCEPTION_NONE;
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/benchmark.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/faults.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/faults.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/faults.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/faults.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/faults.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/faults.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/faults.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/faults.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/api/faults.c" 2

bool_t handleFaultReply(tcb_t *receiver, tcb_t *sender)
{
    message_info_t tag;
    word_t label;
    fault_t fault;
    unsigned int length;

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
        register_t r;
        word_t v;
        word_t* sendBuf;

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
        register_t r;
        word_t v;
        word_t* sendBuf;

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
        halt();
    }
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/c_traps.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/c_traps.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/c_traps.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/lock.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/c_traps.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/fpu.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/fpu.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/fpu.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/fpu.h" 2

/* Initialise the FPU. */
void Arch_initFpu(void);

/* Initialise the FPU state of the given user context. */
void Arch_initFpuContext(user_context_t *context);

/* Perform any actions required for the deletion of the given thread. */
void Arch_fpuThreadDelete(tcb_t *thread);

/* Handle an FPU exception. */
exception_t handleUnimplementedDevice(void);

/* Store state in the FPU registers into memory. */
void saveFpuState(user_fpu_state_t *dest);

/* Load FPU state from memory into the FPU registers. */
void loadFpuState(user_fpu_state_t *src);

/* Reset the FPU registers into their initial blank state. */
void resetFpu(void);

/*
 * Enable the FPU to be used without faulting.
 * Required even if the kernel attempts to use the FPU.
 */
static inline void enableFpu(void)
{
    __asm__ volatile("clts" :: "m" (__control_reg_order));
}

/*
 * Disable the FPU so that usage of it causes a fault
 */
static inline void disableFpu(void)
{
    write_cr0(read_cr0() | (1ul<<(3)) /* Trap on any FPU usage, for lazy FPU. */);
}
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/c_traps.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/fastpath/fastpath.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/fastpath/fastpath.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/fastpath/fastpath.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/fastpath/fastpath.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/fastpath/fastpath.h" 2

void slowpath(syscall_t syscall)
__attribute__((__noreturn__));

void fastpath_call(word_t cptr, word_t r_msgInfo)
__attribute__((externally_visible)) __attribute__((fastcall)) __attribute__((__noreturn__));

void fastpath_reply_wait(word_t cptr, word_t r_msgInfo)
__attribute__((externally_visible)) __attribute__((fastcall)) __attribute__((__noreturn__));
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/c_traps.c" 2

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/c_traps.c" 2

void __attribute__((noreturn)) __attribute__((externally_visible)) restore_user_context(void);
void __attribute__((noreturn)) __attribute__((externally_visible)) restore_user_context(void)
{
    /* set the tss.esp0 */
    tss_ptr_set_esp0(&ia32KStss, ((uint32_t)ksCurThread) + 0x4c);
    if (__builtin_expect(!!(ksCurThread == ia32KSfpuOwner), 0)) {
        /* We are using the FPU, make sure it is enabled */
        enableFpu();
    } else if (__builtin_expect(!!(ia32KSfpuOwner), 0)) {
        /* Someone is using the FPU and it might be enabled */
        disableFpu();
    } else {
        /* No-one (including us) is using the FPU, so we assume it
         * is currently disabled */
    }
    /* see if we entered via syscall */
    if (__builtin_expect(!!(ksCurThread->tcbContext.registers[Error] == -1), 1)) {
        ksCurThread->tcbContext.registers[EFLAGS] &= ~0x200;
        __asm__ volatile(
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
        __asm__ volatile(
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
    } else if (__builtin_expect(!!(irq < int_trap_min), 1)) {
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
    if (__builtin_expect(!!(syscall < (-7) || syscall > (-1)), 0)) {
        handleUnknownSyscall(syscall);
    } else {
        handleSyscall(syscall);
    }
    restore_user_context();
}

void __attribute__((externally_visible)) c_handle_syscall(syscall_t syscall, word_t cptr, word_t msgInfo);
void __attribute__((externally_visible)) c_handle_syscall(syscall_t syscall, word_t cptr, word_t msgInfo)
{

    if (syscall == SysCall) {
        fastpath_call(cptr, msgInfo);
    } else if (syscall == SysReplyWait) {
        fastpath_reply_wait(cptr, msgInfo);
    }


    slowpath(syscall);
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/profiler.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

/*
 * Profiler Interface
 *
 * 2006 - 2007  David Greenaway
 * 2007 Ported to seL4 C kernel by Philip Derrin
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/profiler.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/profiler.h" 2
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/fastpath/fastpath.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/thread.h" 2

void Arch_switchToThread(tcb_t *tcb);
void Arch_switchToIdleThread(void);
void Arch_configureIdleThread(tcb_t *tcb);
void __attribute__((__const__)) Arch_activateIdleThread(tcb_t *tcb);
# 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/fpu.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 25 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c" 2

/* Fastpath cap lookup.  Returns a null_cap on failure. */
static inline cap_t
lookup_fp(cap_t cap, cptr_t cptr)
{
    word_t cptr2;
    cte_t *slot;
    word_t guardBits, radixBits, bits;
    word_t radix, capGuard;

    bits = 0;

    if (__builtin_expect(!!(!cap_capType_equals(cap, cap_cnode_cap)), 0)) {
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
        if (__builtin_expect(!!(guardBits && (cptr2 >> (32 - guardBits) != capGuard)), 0)) {
            return cap_null_cap_new();
        }

        radix = cptr2 << guardBits >> (32 - radixBits);
        slot = ((cte_t *)(cap_cnode_cap_get_capCNodePtr(cap))) + radix;

        cap = slot->cap;
        bits += guardBits + radixBits;

    } while (__builtin_expect(!!(bits < 32 && cap_capType_equals(cap, cap_cnode_cap)), 0));

    if (__builtin_expect(!!(bits > 32), 0)) {
        /* Depth mismatch. We've overshot 32 bits. The lookup we've done is
           safe, but wouldn't be allowed by the slowpath. */
        return cap_null_cap_new();
    }

    return cap;
}

static inline void __attribute__((fastcall))
switchToThread_fp(tcb_t *thread, pde_t *pd)
{
    word_t base;
    uint32_t new_pd = pptr_to_paddr(pd);

    if (__builtin_expect(!!(getCurrentPD() != new_pd), 1)) {
        setCurrentPD(new_pd);
    }

    /* Code equivalent to in Arch_switchToThread, see arch/object/structures.bf
     * for layout of gdt_data */
    /* update the GDT_TLS entry with the thread's TLS_BASE address */
    base = getRegister(thread, TLS_BASE);
    gdt_entry_gdt_data_ptr_set_base_low(ia32KSgdt + 6, base);
    gdt_entry_gdt_data_ptr_set_base_mid(ia32KSgdt + 6, (base >> 16) & 0xFF);
    gdt_entry_gdt_data_ptr_set_base_high(ia32KSgdt + 6, (base >> 24) & 0xFF);

    /* update the GDT_IPCBUF entry with the thread's IPC buffer address */
    base = thread->tcbIPCBuffer;
    gdt_entry_gdt_data_ptr_set_base_low(ia32KSgdt + 7, base);
    gdt_entry_gdt_data_ptr_set_base_mid(ia32KSgdt + 7, (base >> 16) & 0xFF);
    gdt_entry_gdt_data_ptr_set_base_high(ia32KSgdt + 7, (base >> 24) & 0xFF);

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
    ts_ptr->words[2] &= (1ul<<(0));
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
    cap_ptr->words[0] = ((unsigned int)capTCBPtr) | cap_reply_cap;
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

static inline int
fastpath_mi_check(word_t msgInfo)
{
    return (msgInfo & ((1ul<<(seL4_MsgLengthBits + seL4_MsgExtraCapBits))-1ul)) > 2;
}

static inline bool_t hasDefaultSelectors(tcb_t *thread)
{
    return thread->tcbContext.registers[DS] == ((4 << 3) | 3) &&
           thread->tcbContext.registers[ES] == ((4 << 3) | 3);
}

static inline void __attribute__((fastcall)) __attribute__((__noreturn__))
fastpath_restore(word_t badge, word_t msgInfo)
{
    if (__builtin_expect(!!(ksCurThread == ia32KSfpuOwner), 0)) {
        /* We are using the FPU, make sure it is enabled */
        enableFpu();
    } else if (__builtin_expect(!!(ia32KSfpuOwner), 0)) {
        /* Someone is using the FPU and it might be enabled */
        disableFpu();
    } else {
        /* No-one (including us) is using the FPU, so we assume it
         * is currently disabled */
    }
    tss_ptr_set_esp0(&ia32KStss, ((uint32_t)ksCurThread) + 0x4c);
    ksCurThread->tcbContext.registers[EFLAGS] &= ~0x200;
    if (__builtin_expect(!!(hasDefaultSelectors(ksCurThread)), 1)) {
        __asm__ volatile("                movl %%ecx, %%esp \n                popl %%edi \n                popl %%ebp \n                addl $8, %%esp \n                popl %%fs \n                popl %%gs \n                addl $20, %%esp \n                popfl \n                orl $0x200, 44(%%ecx) \n                movl 36(%%ecx), %%edx \n                pop %%ecx \n                sti \n                sysexit \n            "
# 225 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c"
                     :
                     : "c"(&ksCurThread->tcbContext.registers[EDI]),
                     "a" (ksCurThread->tcbContext.registers[EAX]),
                     "b" (badge),
                     "S" (msgInfo)
                     : "memory"
                    );
    } else {
        __asm__ volatile("                movl %%ecx, %%esp \n                popl %%edi \n                popl %%ebp \n                popl %%ds \n                popl %%es \n                popl %%fs \n                popl %%gs \n                addl $20, %%esp \n                popfl \n                orl $0x200, 44(%%ecx) \n                movl 36(%%ecx), %%edx \n                pop %%ecx \n                sti \n                sysexit \n            "
# 249 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/fastpath/fastpath.c"
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

void __attribute__((fastcall)) __attribute__((__noreturn__))
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
    if (__builtin_expect(!!(fastpath_mi_check(msgInfo) || fault_type != fault_null_fault), 0)
                                                ) {
        slowpath(SysCall);
    }

    /* Lookup the cap */
    ep_cap = lookup_fp((((cte_t *)((unsigned int)ksCurThread&~((1ul<<(10))-1ul)))+tcbCTable)->cap, cptr);

    /* Check it's an endpoint */
    if (__builtin_expect(!!(!cap_capType_equals(ep_cap, cap_endpoint_cap) || !cap_endpoint_cap_get_capCanSend(ep_cap)), 0)
                                                          ) {
        slowpath(SysCall);
    }

    /* Get the endpoint address */
    ep_ptr = ((endpoint_t *)cap_endpoint_cap_get_capEPPtr(ep_cap));

    /* Get the destination thread, which is only going to be valid
     * if the endpoint is valid. */
    dest = ((tcb_t *)(endpoint_ptr_get_epQueue_head(ep_ptr)));

    /* Check that there's a thread waiting to receive */
    if (__builtin_expect(!!(endpoint_ptr_get_state(ep_ptr) != EPState_Recv), 0)) {
        slowpath(SysCall);
    }

    /* Get destination thread.*/
    newVTable = (((cte_t *)((unsigned int)dest&~((1ul<<(10))-1ul)))+tcbVTable)->cap;

    /* Get Page Directory. */
    cap_pd = ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr(newVTable)));

    /* Ensure that the destination has a valid VTable. */
    if (__builtin_expect(!!(! isValidVTableRoot_fp(newVTable)), 0)) {
        slowpath(SysCall);
    }

    /* Ensure the destination has a higher/equal priority to us. */
    if (__builtin_expect(!!(dest->tcbPriority < ksCurThread->tcbPriority), 0)) {
        slowpath(SysCall);
    }

    /* Ensure that the endpoint has standard non-diminishing rights. */
    if (__builtin_expect(!!(!cap_endpoint_cap_get_capCanGrant(ep_cap) || thread_state_ptr_get_blockingIPCDiminishCaps(&dest->tcbState)), 0)
                                                                               ) {
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
    endpoint_ptr_set_epQueue_head_np(ep_ptr, ((unsigned int)dest->tcbEPNext));
    if (__builtin_expect(!!(dest->tcbEPNext), 0)) {
        dest->tcbEPNext->tcbEPPrev = ((void *)0);
    } else {
        endpoint_ptr_mset_epQueue_tail_state(ep_ptr, 0, EPState_Idle);
    }

    badge = cap_endpoint_cap_get_capEPBadge(ep_cap);

    /* Block sender */
    thread_state_ptr_set_tsType_np(&ksCurThread->tcbState,
                                   ThreadState_BlockedOnReply);

    /* Get sender reply slot */
    replySlot = (((cte_t *)((unsigned int)ksCurThread&~((1ul<<(10))-1ul)))+tcbReply);

    /* Get dest caller slot */
    callerSlot = (((cte_t *)((unsigned int)dest&~((1ul<<(10))-1ul)))+tcbCaller);

    /* Insert reply cap */
    cap_reply_cap_ptr_new_np(&callerSlot->cap, 0, ((unsigned int)ksCurThread));
    mdb_node_ptr_set_mdbPrev_np(&callerSlot->cteMDBNode, ((unsigned int)replySlot));
    mdb_node_ptr_mset_mdbNext_mdbRevocable_mdbFirstBadged(
        &replySlot->cteMDBNode, ((unsigned int)callerSlot), 1, 1);

    fastpath_copy_mrs (length, ksCurThread, dest);

    /* Dest thread is set Running, but not queued. */
    thread_state_ptr_set_tsType_np(&dest->tcbState,
                                   ThreadState_Running);
    switchToThread_fp(dest, cap_pd);

    msgInfo = wordFromMessageInfo(message_info_set_msgCapsUnwrapped(info, 0));
    fastpath_restore(badge, msgInfo);
}

void __attribute__((fastcall))
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
    if (__builtin_expect(!!(fastpath_mi_check(msgInfo) || fault_type != fault_null_fault), 0)
                                                ) {
        slowpath(SysReplyWait);
    }

    /* Lookup the cap */
    ep_cap = lookup_fp((((cte_t *)((unsigned int)ksCurThread&~((1ul<<(10))-1ul)))+tcbCTable)->cap,
                       cptr);

    /* Check it's an endpoint */
    if (__builtin_expect(!!(!cap_capType_equals(ep_cap, cap_endpoint_cap) || !cap_endpoint_cap_get_capCanReceive(ep_cap)), 0)
                                                             ) {
        slowpath(SysReplyWait);
    }

    /* Get the endpoint address */
    ep_ptr = ((endpoint_t *)cap_endpoint_cap_get_capEPPtr(ep_cap));

    /* Check that there's not a thread waiting to send */
    if (__builtin_expect(!!(endpoint_ptr_get_state(ep_ptr) == EPState_Send), 0)) {
        slowpath(SysReplyWait);
    }

    /* Only reply if the reply cap is valid. */
    callerSlot = (((cte_t *)((unsigned int)ksCurThread&~((1ul<<(10))-1ul)))+tcbCaller);
    callerCap = callerSlot->cap;
    if (__builtin_expect(!!(!cap_capType_equals(callerCap, cap_reply_cap)), 0)) {
        slowpath(SysReplyWait);
    }

    /* Determine who the caller is. */
    caller = ((tcb_t *)(cap_reply_cap_get_capTCBPtr(callerCap)));

    /* Check that the caller has not faulted, in which case a fault
       reply is generated instead. */
    fault_type = fault_get_faultType(caller->tcbFault);
    if (__builtin_expect(!!(fault_type != fault_null_fault), 0)) {
        slowpath(SysReplyWait);
    }

    /* Get destination thread.*/
    newVTable = (((cte_t *)((unsigned int)caller&~((1ul<<(10))-1ul)))+tcbVTable)->cap;

    /* Get Page Directory. */
    cap_pd = ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr(newVTable)));

    /* Ensure that the destination has a valid MMU. */
    if (__builtin_expect(!!(! isValidVTableRoot_fp (newVTable)), 0)) {
        slowpath(SysReplyWait);
    }

    /* Ensure the original caller can be scheduled directly. */
    if (__builtin_expect(!!(caller->tcbPriority < ksCurThread->tcbPriority), 0)) {
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
    endpointTail = ((tcb_t *)(endpoint_ptr_get_epQueue_tail(ep_ptr)));
    if (__builtin_expect(!!(!endpointTail), 1)) {
        ksCurThread->tcbEPPrev = ((void *)0);
        ksCurThread->tcbEPNext = ((void *)0);

        /* Set head/tail of queue and endpoint state. */
        endpoint_ptr_set_epQueue_head_np(ep_ptr, ((unsigned int)ksCurThread));
        endpoint_ptr_mset_epQueue_tail_state(ep_ptr, ((unsigned int)ksCurThread),
                                             EPState_Recv);
    } else {
        /* Append current thread onto the queue. */
        endpointTail->tcbEPNext = ksCurThread;
        ksCurThread->tcbEPPrev = endpointTail;
        ksCurThread->tcbEPNext = ((void *)0);

        /* Update tail of queue. */
        endpoint_ptr_mset_epQueue_tail_state(ep_ptr, ((unsigned int)ksCurThread),
                                             EPState_Recv);
    }

    /* Delete the reply cap. */
    mdb_node_ptr_mset_mdbNext_mdbRevocable_mdbFirstBadged(
        &((cte_t *)(mdb_node_get_mdbPrev(callerSlot->cteMDBNode)))->cteMDBNode,
        0, 1, 1);
    callerSlot->cap = cap_null_cap_new();
    callerSlot->cteMDBNode = mdb_node_new(0, false, false, 0);

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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/apic.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/apic.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/apic.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/apic.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/apic.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/apic.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/apic.h" 2

uint32_t apic_measure_freq(paddr_t paddr_apic);
paddr_t apic_get_base_paddr(void);
bool_t apic_init(uint32_t apic_khz, bool_t mask_legacy_irqs);

bool_t apic_is_interrupt_pending(void);
void apic_ack_active_interrupt(void);

void apic_send_init_ipi(cpu_id_t cpu_id);
void apic_send_startup_ipi(cpu_id_t cpu_id, paddr_t startup_addr);
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/apic.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/apic.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/devices.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/apic.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pit.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




/* ms after which a wraparound occurs (max. 54) */


void pit_init(void);
void pit_wait_wraparound(void);
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/apic.c" 2

typedef enum _apic_reg_t {
    APIC_ID = 0x020,
    APIC_VERSION = 0x030,
    APIC_TASK_PRIO = 0x080,
    APIC_ARBITR_PRIO = 0x090,
    APIC_PROC_PRIO = 0x0A0,
    APIC_EOI = 0x0B0,
    APIC_LOCAL_DEST = 0x0D0,
    APIC_DEST_FORMAT = 0x0E0,
    APIC_SVR = 0x0F0,
    APIC_ISR_BASE = 0x100,
    APIC_TMR_BASE = 0x180,
    APIC_IRR_BASE = 0x200,
    APIC_ERR_STATUS = 0x280,
    APIC_ICR1 = 0x300,
    APIC_ICR2 = 0x310,
    APIC_LVT_TIMER = 0x320,
    APIC_LVT_THERMAL = 0x330,
    APIC_LVT_PERF_CNTR = 0x340,
    APIC_LVT_LINT0 = 0x350,
    APIC_LVT_LINT1 = 0x360,
    APIC_LVT_ERROR = 0x370,
    APIC_TIMER_COUNT = 0x380,
    APIC_TIMER_CURRENT = 0x390,
    APIC_TIMER_DIVIDE = 0x3E0
} apic_reg_t;

__attribute__((__section__(".phys.text")))
static inline uint32_t __attribute__((always_inline))
apic_read_reg_(uint32_t addr, apic_reg_t reg)
{
    return *(volatile uint32_t*)(addr + reg);
}

__attribute__((__section__(".phys.text")))
static inline void __attribute__((always_inline))
apic_write_reg_(uint32_t addr, apic_reg_t reg, uint32_t val)
{
    *(volatile uint32_t*)(addr + reg) = val;
}

static inline uint32_t
apic_read_reg(apic_reg_t reg)
{
    return *(volatile uint32_t*)(0xffff0000 + reg);
}

static inline void
apic_write_reg(apic_reg_t reg, uint32_t val)
{
    *(volatile uint32_t*)(0xffff0000 + reg) = val;
}

__attribute__((__section__(".phys.text"))) __attribute__((externally_visible)) uint32_t
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
    return (0xffffffff - apic_read_reg_(paddr_apic, APIC_TIMER_CURRENT)) / 50;
}

__attribute__((__section__(".boot.text"))) paddr_t
apic_get_base_paddr(void)
{
    apic_base_msr_t apic_base_msr;

    apic_base_msr.words[0] = ia32_rdmsr_low(0x01B);
    if (!apic_base_msr_get_enabled(apic_base_msr)) {
        ((void)(0));
    }

    return apic_base_msr_get_base_addr(apic_base_msr);
}

__attribute__((__section__(".boot.text"))) bool_t
apic_init(uint32_t apic_khz, bool_t mask_legacy_irqs)
{
    apic_version_t apic_version;
    uint32_t num_lvt_entries;

    apic_version.words[0] = apic_read_reg(APIC_VERSION);

    /* check for correct version: 0x1X */
    if (apic_version_get_version(apic_version) >> 4 != 1) {
        ((void)(0));
        return false;
    }

    /* check for correct number of LVT entries */
    num_lvt_entries = apic_version_get_max_lvt_entry(apic_version) + 1;
    if (num_lvt_entries < 3) {
        ((void)(0));
        ((void)(0));
        return false;
    }

    /* initialise APIC timer */
    apic_write_reg(APIC_TIMER_DIVIDE, 0xb); /* divisor = 1 */
    apic_write_reg(APIC_TIMER_COUNT, apic_khz * 10);

    /* enable APIC using SVR register */
    apic_write_reg(
        APIC_SVR,
        apic_svr_new(
            0, /* focus_processor_chk */
            1, /* enabled             */
            int_spurious /* spurious_vector     */
        ).words[0]
    );

    /* mask/unmask LINT0 (used for legacy IRQ delivery) */
    apic_write_reg(
        APIC_LVT_LINT0,
        apic_lvt_new(
            0, /* timer_mode      */
            mask_legacy_irqs, /* masked          */
            0, /* trigger_mode    */
            0, /* remote_irr      */
            0, /* pin_polarity    */
            0, /* delivery_status */
            7, /* delivery_mode   */
            0 /* vector          */
        ).words[0]
    );

    /* mask LINT1 (used for NMI delivery) */
    apic_write_reg(
        APIC_LVT_LINT1,
        apic_lvt_new(
            0, /* timer_mode      */
            1, /* masked          */
            0, /* trigger_mode    */
            0, /* remote_irr      */
            0, /* pin_polarity    */
            0, /* delivery_status */
            0, /* delivery_mode   */
            0 /* vector          */
        ).words[0]
    );

    /* initialise timer */
    apic_write_reg(
        APIC_LVT_TIMER,
        apic_lvt_new(
            1, /* timer_mode      */
            0, /* masked          */
            0, /* trigger_mode    */
            0, /* remote_irr      */
            0, /* pin_polarity    */
            0, /* delivery_status */
            0, /* delivery_mode   */
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
    ;
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

__attribute__((__section__(".boot.text"))) void
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
            0, /* dest_shorthand  */
            1, /* trigger_mode    */
            1, /* level           */
            0, /* delivery_status */
            0, /* dest_mode       */
            5, /* delivery_mode   */
            0 /* vector          */
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
            0, /* dest_shorthand  */
            1, /* trigger_mode    */
            0, /* level           */
            0, /* delivery_status */
            0, /* dest_mode       */
            5, /* delivery_mode   */
            0 /* vector          */
        ).words[0]
    );
}

__attribute__((__section__(".boot.text"))) void
apic_send_startup_ipi(cpu_id_t cpu_id, paddr_t startup_addr)
{
    /* check if 4K aligned */
    ;
    /* check if startup_addr < 640K */
    ;
    startup_addr >>= 12;

    apic_write_reg(
        APIC_ICR2,
        apic_icr2_new(
            cpu_id /* dest */
        ).words[0]
    );
    apic_write_reg(
        APIC_ICR1,
        apic_icr1_new(
            0, /* dest_shorthand  */
            0, /* trigger_mode    */
            0, /* level           */
            0, /* delivery_status */
            0, /* dest_mode       */
            6, /* delivery_mode   */
            startup_addr /* vector          */
        ).words[0]
    );
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/boot.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/bootinfo.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/bootinfo.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/bootinfo.h" 2




/* bootinfo data structures (directly corresponding to abstract specification) */



/* fixed cap positions in root CNode */
# 39 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/bootinfo.h"
/* type definitions */

typedef uint32_t slot_pos_t;

typedef struct slot_region {
    slot_pos_t start;
    slot_pos_t end;
} slot_region_t;



typedef struct bi_dev_reg {
    paddr_t base_paddr; /* base physical address of device region */
    uint32_t frame_size_bits; /* size (2^n bytes) of a device-region frame */
    slot_region_t frame_caps; /* device-region frame caps */
} bi_dev_reg_t;

typedef struct bi {
    node_id_t node_id;
    uint32_t num_nodes;
    uint32_t num_iopt_levels; /* number of IOMMU PT levels (0 if no IOMMU support) */
    vptr_t ipcbuf_vptr; /* vptr to initial thread's IPC buffer */
    slot_region_t null_caps; /* null caps (empty slots) */
    slot_region_t sh_frame_caps; /* shared-frame caps */
    slot_region_t ui_frame_caps; /* userland-image frame caps */
    slot_region_t ui_pt_caps; /* userland-image PT caps */
    slot_region_t ut_obj_caps; /* untyped-object caps (UT caps) */
    paddr_t ut_obj_paddr_list [167]; /* physical address of each UT cap */
    uint8_t ut_obj_size_bits_list[167]; /* size (2^n) bytes of each UT cap */
    uint8_t it_cnode_size_bits; /* initial thread's root CNode size (2^n slots) */
    uint32_t num_dev_regs; /* number of device regions */
    bi_dev_reg_t dev_reg_list[199]; /* device regions */
    uint8_t it_domain; /* initial thread's domain ID */
} bi_t;

/* adjust constants in config.h if this assert fails */

# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/boot.h" 2



/*
 * Resolve naming differences between the abstract specifications
 * of the bootstrapping phase and the runtime phase of the kernel.
 */
typedef cte_t slot_t;
typedef cte_t* slot_ptr_t;



/* (node-local) state accessed only during bootstrapping */

typedef struct ndks_boot {
    region_t freemem[2];
    bi_t* bi_frame;
    slot_pos_t slot_pos_cur;
    slot_pos_t slot_pos_max;
} ndks_boot_t;

extern ndks_boot_t ndks_boot;

/* function prototypes */

static inline bool_t
is_reg_empty(region_t reg)
{
    return reg.start == reg.end;
}

pptr_t alloc_region(uint32_t size_bits);
bool_t insert_region(region_t reg);
void write_slot(slot_ptr_t slot_ptr, cap_t cap);
cap_t create_root_cnode(void);
bool_t provide_cap(cap_t root_cnode_cap, cap_t cap);
cap_t create_it_asid_pool(cap_t root_cnode_cap);
void write_it_pd_pts(cap_t root_cnode_cap, cap_t it_pd_cap);
bool_t create_idle_thread(void);
bool_t create_untypeds(cap_t root_cnode_cap, region_t boot_mem_reuse_reg);
void bi_finalise(void);
bool_t create_irq_cnode(void);
void create_domain_cap(cap_t root_cnode_cap);

cap_t create_ipcbuf_frame(cap_t root_cnode_cap, cap_t pd_cap, vptr_t vptr);

pptr_t allocate_bi_frame(node_id_t node_id, uint32_t num_nodes, vptr_t ipcbuf_vptr);

void create_bi_frame_cap(cap_t root_cnode_cap, cap_t pd_cap, pptr_t pptr, vptr_t vptr);

typedef struct create_frames_of_region_ret {
    slot_region_t region;
    bool_t success;
} create_frames_of_region_ret_t;

create_frames_of_region_ret_t
create_frames_of_region(
    cap_t root_cnode_cap,
    cap_t pd_cap,
    region_t reg,
    bool_t do_map,
    int32_t pv_offset
);

cap_t
create_it_pd_pts(
    cap_t root_cnode_cap,
    v_region_t ui_v_reg,
    vptr_t ipcbuf_vptr,
    vptr_t bi_frame_vptr
);

bool_t
create_initial_thread(
    cap_t root_cnode_cap,
    cap_t it_pd_cap,
    vptr_t ui_v_entry,
    vptr_t bi_frame_vptr,
    vptr_t ipcbuf_vptr,
    cap_t ipcbuf_cap
);
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/apic.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot.h" 2

typedef struct dev_p_regs {
    uint32_t count;
    p_region_t list[199];
} dev_p_regs_t;

typedef struct ui_info {
    p_region_t p_reg; /* region where the userland image lies in */
    int32_t pv_offset; /* UI virtual address + pv_offset = UI physical address */
    vptr_t v_entry; /* entry point (virtual address) of userland image */
} ui_info_t;

cap_t create_unmapped_it_frame_cap(pptr_t pptr, bool_t use_large);
cap_t create_mapped_it_frame_cap(cap_t pd_cap, pptr_t pptr, vptr_t vptr, asid_t asid, bool_t use_large);

bool_t init_node_state(
    p_region_t avail_p_reg,
    p_region_t sh_p_reg,
    dev_p_regs_t* dev_p_regs,
    ui_info_t ui_info,
    p_region_t boot_mem_reuse_p_reg,
    node_id_t node_id,
    uint32_t num_nodes,
    /* parameters below not modeled in abstract specification */
    pde_t* kernel_pd,
    pte_t* kernel_pt
# 50 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot.h"
);

bool_t init_node_cpu(
    uint32_t apic_khz,
    bool_t mask_legacy_irqs
);
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot_sys.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/multiboot.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




/* Adapted from the MultiBoot Specification:  */
/* www.gnu.org/software/grub/manual/multiboot */



# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/multiboot.h" 2

typedef struct multiboot_module {
    paddr_t start;
    paddr_t end;
    char* name;
    uint32_t reserved;
} multiboot_module_t;

typedef struct multiboot_info {
    uint32_t flags;
    uint32_t mem_lower;
    uint32_t mem_upper;
    uint32_t boot_device;
    char* cmdline;
    uint32_t mod_count;
    multiboot_module_t* mod_list;
    /* the multiboot spec includes more fields we don't need */
} multiboot_info_t;
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot_sys.h" 2

bool_t in_boot_phase(void);
cpu_id_t cur_cpu_id(void);
node_id_t node_of_cpu(cpu_id_t);
uint16_t console_port_of_node(node_id_t node_id);
uint16_t debug_port_of_node(node_id_t node_id);

void boot_sys(
    unsigned long multiboot_magic,
    multiboot_info_t* mbi,
    uint32_t apic_khz
);
void boot_node(void);
void insert_dev_p_reg(p_region_t reg);
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/fpu.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/ioport.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/ioport.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/ioport.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/ioport.h" 2



exception_t decodeIA32PortInvocation(word_t label, unsigned int length, cptr_t cptr, cte_t *slot, cap_t cap, extra_caps_t extraCaps, word_t* buffer);
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c" 2
# 34 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c"
/* functions exactly corresponding to abstract specification */

__attribute__((__section__(".boot.text"))) static void
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
    write_slot((((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (4 /* global IRQ controller cap */)), cap_irq_control_cap_new());
}

/* Create a frame cap for the initial thread. */

static __attribute__((__section__(".boot.text"))) cap_t
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
            frame_size, /* capFSize           */



            (asid & ((1ul<<(asidLowBits))-1ul)), /* capFMappedASIDLow  */
            vptr, /* capFMappedAddress  */
            ((asid >> asidLowBits) & ((1ul<<(asidHighBits))-1ul)), /* capFMappedASIDHigh */
            wordFromVMRights(VMReadWrite), /* capFVMRights       */
            pptr /* capFBasePtr        */
        );
}

__attribute__((__section__(".boot.text"))) cap_t
create_unmapped_it_frame_cap(pptr_t pptr, bool_t use_large)
{
    return create_it_frame_cap(pptr, 0, asidInvalid, use_large);
}

__attribute__((__section__(".boot.text"))) cap_t
create_mapped_it_frame_cap(cap_t pd_cap, pptr_t pptr, vptr_t vptr, asid_t asid, bool_t use_large)
{
    cap_t cap = create_it_frame_cap(pptr, vptr, asid, use_large);
    map_it_frame_cap(pd_cap, cap);
    return cap;
}

/* Create a page table for the initial thread */

static __attribute__((__section__(".boot.text"))) cap_t
create_it_page_table_cap(cap_t pd, pptr_t pptr, vptr_t vptr, asid_t asid)
{
    cap_t cap;
    cap = cap_page_table_cap_new(
              1, /* capPTIsMapped      */
              asid, /* capPTMappedASID    */
              vptr, /* capPTMappedAddress */
              pptr /* capPTBasePtr       */
          );
    if (asid != asidInvalid) {
        map_it_pt_cap(pd, cap);
    }
    return cap;
}

/* Create an address space for the initial thread.
 * This includes page directory and page tables */
__attribute__((__section__(".boot.text"))) static cap_t
create_it_address_space(cap_t root_cnode_cap, v_region_t it_v_reg)
{
    cap_t pd_cap;
    vptr_t pt_vptr;
    pptr_t pt_pptr;
    slot_pos_t slot_pos_before;
    slot_pos_t slot_pos_after;
    pptr_t pd_pptr;

    /* create PD obj and cap */
    pd_pptr = alloc_region((10 + 2));
    if (!pd_pptr) {
        return cap_null_cap_new();
    }
    memzero(((pde_t *)(pd_pptr)), 1 << (10 + 2));
    copyGlobalMappings(((pde_t *)(pd_pptr)));
    pd_cap =
        cap_page_directory_cap_new(
            true, /* capPDIsMapped   */
            1 /* initial thread's ASID */, /* capPDMappedASID */
            pd_pptr /* capPDBasePtr    */
        );
    write_slot((((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (3 /* initial thread's PD cap */)), pd_cap);

    /* create all PT objs and caps necessary to cover userland image */
    slot_pos_before = ndks_boot.slot_pos_cur;

    for (pt_vptr = (((it_v_reg.start) >> (10 + 12)) << (10 + 12));
            pt_vptr < it_v_reg.end;
            pt_vptr += (1ul<<(10 + 12))) {
        pt_pptr = alloc_region((10 + 2));
        if (!pt_pptr) {
            return cap_null_cap_new();
        }
        memzero(((pte_t *)pt_pptr), 1 << (10 + 2));
        if (!provide_cap(root_cnode_cap,
                         create_it_page_table_cap(pd_cap, pt_pptr, pt_vptr, 1 /* initial thread's ASID */))
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

__attribute__((__section__(".boot.text"))) static bool_t
create_device_frames(
    cap_t root_cnode_cap,
    dev_p_regs_t* dev_p_regs
)
{
    slot_pos_t slot_pos_before;
    slot_pos_t slot_pos_after;
    vm_page_size_t frame_size;
    region_t dev_reg;
    bi_dev_reg_t bi_dev_reg;
    cap_t frame_cap;
    uint32_t i;
    pptr_t f;

    for (i = 0; i < dev_p_regs->count; i++) {
        /* write the frame caps of this device region into the root CNode and update the bootinfo */
        dev_reg = paddr_to_pptr_reg(dev_p_regs->list[i]);
        /* use 4M frames if possible, otherwise use 4K frames */
        if ((!((dev_reg.start) & ((1ul<<(pageBitsForSize(IA32_4M)))-1ul))) &&
                (!((dev_reg.end) & ((1ul<<(pageBitsForSize(IA32_4M)))-1ul)))) {
            frame_size = IA32_4M;
        } else {
            frame_size = IA32_4K;
        }

        slot_pos_before = ndks_boot.slot_pos_cur;

        /* create/provide frame caps covering the region */
        for (f = dev_reg.start; f < dev_reg.end; f += (1ul<<(pageBitsForSize(frame_size)))) {
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

__attribute__((__section__(".boot.text"))) bool_t
init_node_state(
    p_region_t avail_p_reg,
    p_region_t sh_p_reg,
    dev_p_regs_t* dev_p_regs,
    ui_info_t ui_info,
    p_region_t boot_mem_reuse_p_reg,
    node_id_t node_id,
    uint32_t num_nodes,
    /* parameters below not modeled in abstract specification */
    pde_t* kernel_pd,
    pte_t* kernel_pt
# 249 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c"
)
{
    cap_t root_cnode_cap;
    vptr_t bi_frame_vptr;
    vptr_t ipcbuf_vptr;
    cap_t it_pd_cap;
    cap_t it_ap_cap;
    cap_t ipcbuf_cap;
    pptr_t bi_frame_pptr;
    create_frames_of_region_ret_t create_frames_ret;
    int i;






    /* convert from physical addresses to kernel pptrs */
    region_t avail_reg = paddr_to_pptr_reg(avail_p_reg);
    region_t ui_reg = paddr_to_pptr_reg(ui_info.p_reg);
    region_t sh_reg = paddr_to_pptr_reg(sh_p_reg);
    region_t boot_mem_reuse_reg = paddr_to_pptr_reg(boot_mem_reuse_p_reg);

    /* convert from physical addresses to userland vptrs */
    v_region_t ui_v_reg;
    v_region_t it_v_reg;
    ui_v_reg.start = ui_info.p_reg.start - ui_info.pv_offset;
    ui_v_reg.end = ui_info.p_reg.end - ui_info.pv_offset;

    ipcbuf_vptr = ui_v_reg.end;
    bi_frame_vptr = ipcbuf_vptr + (1ul<<(12));

    /* The region of the initial thread is the user image + ipcbuf and boot info */
    it_v_reg.start = ui_v_reg.start;
    it_v_reg.end = bi_frame_vptr + (1ul<<(12));

    /* make the free memory available to alloc_region() */
    ndks_boot.freemem[0] = avail_reg;
    for (i = 1; i < 2; i++) {
        ndks_boot.freemem[i] = (region_t){ .start = 0, .end = 0 };
    }

    /* initialise virtual-memory-related data structures (not in abstract spec) */
    if (!init_vm_state(kernel_pd, kernel_pt)) {
        return false;
    }
# 333 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c"
    /* create the root cnode */
    root_cnode_cap = create_root_cnode();

    /* create the IO port cap */
    write_slot(
        (((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (7 /* global IO port cap (null cap if not supported) */)),
        cap_io_port_cap_new(
            0, /* first port */
            (1ul<<(16)) - 1 /* last port  */
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
    ia32KSfpuOwner = ((void *)0);

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
# 443 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot.c"
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






    return true;
}

/* This function initialises the CPU. It does NOT initialise any kernel state. */

__attribute__((__section__(".boot.text"))) bool_t
init_node_cpu(
    uint32_t apic_khz,
    bool_t mask_legacy_irqs
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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/apic.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/cmdline.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/cmdline.h" 2

typedef struct cmdline_opt {







    uint32_t max_num_nodes;
    uint32_t num_sh_frames;
} cmdline_opt_t;

void cmdline_parse(const char *cmdline, cmdline_opt_t* cmdline_opt);
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot_sys.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/elf.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/elf.h" 2

/* minimal ELF structures needed for loading GRUB boot module */

typedef struct Elf32_Header {
    unsigned char e_ident[16];
    uint16_t e_type; /* Relocatable=1, Executable=2 (+ some more ..) */
    uint16_t e_machine; /* Target architecture: MIPS=8 */
    uint32_t e_version; /* Elf version (should be 1) */
    uint32_t e_entry; /* Code entry point */
    uint32_t e_phoff; /* Program header table */
    uint32_t e_shoff; /* Section header table */
    uint32_t e_flags; /* Flags */
    uint16_t e_ehsize; /* ELF header size */
    uint16_t e_phentsize; /* Size of one program segment header */
    uint16_t e_phnum; /* Number of program segment headers */
    uint16_t e_shentsize; /* Size of one section header */
    uint16_t e_shnum; /* Number of section headers */
    uint16_t e_shstrndx; /* Section header index of the string table for section header names */
} Elf32_Header_t;

typedef struct Elf32_Phdr {
    uint32_t p_type; /* Segment type: Loadable segment = 1 */
    uint32_t p_offset; /* Offset of segment in file */
    uint32_t p_vaddr; /* Reqd virtual address of segment when loading */
    uint32_t p_paddr; /* Reqd physical address of segment (ignore) */
    uint32_t p_filesz; /* How many bytes this segment occupies in file */
    uint32_t p_memsz; /* How many bytes this segment should occupy in memory */
    uint32_t p_flags; /* Flags: logical "or" of PF_ constants below */
    uint32_t p_align; /* Reqd alignment of segment in memory */
} Elf32_Phdr_t;

/* minimal ELF functionality for loading GRUB boot module */

bool_t elf32_checkFile(Elf32_Header_t* elfFile);
v_region_t elf32_getMemoryBounds(Elf32_Header_t* elfFile);
void elf32_load(Elf32_Header_t* elfFile, int32_t offset);
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/acpi.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/acpi.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/acpi.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/acpi.h" 2

/* Generic System Descriptor Table Header */
typedef struct acpi_header {
    char signature[4];
    uint32_t length;
    uint8_t revision;
    uint8_t checksum;
    char oem_id[6];
    char oem_table_id[8];
    uint32_t oem_revision;
    char creater_id[4];
    uint32_t creater_revision;
} acpi_header_t;


/* Root System Descriptor Table */
typedef struct acpi_rsdt {
    acpi_header_t header;
    acpi_header_t* entry[1];
} acpi_rsdt_t;



acpi_rsdt_t* acpi_init(void);

uint32_t acpi_madt_scan(
    acpi_rsdt_t* acpi_rsdt,
    cpu_id_t* cpu_list,
    uint32_t max_list_len
);
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/devices.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pci.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pci.h"
void pci_scan(uint32_t* bus_used_bitmap);
# 25 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pic.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pic.h" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pic.h" 2

void pic_remap_irqs(interrupt_t vector);
void pic_mask_irq(bool_t mask, irq_t irq);
bool_t pic_is_irq_pending(void);
void pic_ack_active_irq(void);
# 26 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c" 2

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
# 55 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c"
/* constants */






/* type definitions (directly corresponding to abstract specification) */

typedef struct glks {
    p_region_t avail_p_reg; /* region of available physical memory on platform */
    p_region_t ki_p_reg; /* region where the kernel image is in */
    p_region_t sh_p_reg; /* region shared between nodes */
    uint32_t num_nodes; /* number of nodes */
    cpu_id_t cpu_list [8]; /* CPUs assigned to nodes */
    ui_info_t ui_info_list [8]; /* info about userland images */
    dev_p_regs_t dev_p_regs; /* device memory regions */
    uint32_t apic_khz; /* frequency of APIC/bus */







} glks_t;

typedef char ndks_t[0x3000];

/* global variables (called var_glks, var_ndks_list in abstract specification) */

__attribute__((__section__(".boot.glob")))
glks_t glks;

__attribute__((__section__(".glob"))) __attribute__((__aligned__((1ul<<(12)))))
ndks_t ndks_list[8];

/* The kernel stack is actually allocated per-node as part of ndks_list, above.
 * The following definition, in conjunction with the linker script, tells the
 * linker to reserve space in virtual memory at the start of the NDKS section.
 */
__attribute__((__section__(".ndks.stack"))) __attribute__((__aligned__((1ul<<(12)))))
char kernel_stack_alloc[4096];

/* global variables (not covered by abstract specification) */

__attribute__((__section__(".boot.glob")))
cmdline_opt_t cmdline_opt;

/* the array type is uint32_t instead of pde_t due to a c-parser limitation */
__attribute__((__section__(".glob"))) __attribute__((__aligned__((1ul<<((10 + 2))))))
uint32_t kernel_pd_list[8][(1ul<<(10))];

/* the array type is uint32_t instead of pte_t due to a c-parser limitation */
__attribute__((__section__(".glob"))) __attribute__((__aligned__((1ul<<((10 + 2))))))
uint32_t kernel_pt_list[8][(1ul<<(10))];
# 139 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c"
/* functions not modeled in abstract specification */

__attribute__((__section__(".boot.text"))) static paddr_t
load_boot_module(node_id_t node, multiboot_module_t* boot_module, paddr_t load_paddr)
{
    Elf32_Header_t* elf_file = (Elf32_Header_t*)boot_module->start;
    v_region_t v_reg;

    if (!elf32_checkFile(elf_file)) {
        ((void)(0));
        return 0;
    }

    v_reg = elf32_getMemoryBounds(elf_file);

    if (v_reg.end == 0) {
        ((void)(0));
        return 0;
    }
    v_reg.end = (((((v_reg.end) - 1ul) >> (12)) + 1ul) << (12));

    ((void)(0))




           ;

    if (!(!((v_reg.start) & ((1ul<<(12))-1ul)))) {
        ((void)(0));
        return 0;
    }
    if (v_reg.end + 2 * (1ul<<(12)) > 0xe0000000) {
        /* for IPC buffer frame and bootinfo frame, need 2*4K of additional userland virtual memory */
        ((void)(0));
        return 0;
    }
    if ((elf_file->e_entry < v_reg.start) || (elf_file->e_entry >= v_reg.end)) {
        ((void)(0));
        return 0;
    }

    /* fill ui_info struct */
    glks.ui_info_list[node].pv_offset = load_paddr - v_reg.start;
    glks.ui_info_list[node].p_reg.start = load_paddr;
    load_paddr += v_reg.end - v_reg.start;
    glks.ui_info_list[node].p_reg.end = load_paddr;
    glks.ui_info_list[node].v_entry = elf_file->e_entry;

    ((void)(0))


           ;

    if (load_paddr > glks.avail_p_reg.end) {
        ((void)(0));
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

__attribute__((__section__(".boot.text"))) void
insert_dev_p_reg(p_region_t reg)
{
    if (glks.dev_p_regs.count < 199) {
        glks.dev_p_regs.list[glks.dev_p_regs.count] = reg;
        glks.dev_p_regs.count++;
        ((void)(0));
    } else {
        ((void)(0));
    }
}

/* functions directly corresponding to abstract specification */

__attribute__((__section__(".boot.text"))) cpu_id_t
cur_cpu_id(void)
{
    cpu_id_t cpu_id;
    paddr_t esp = pptr_to_paddr(get_current_esp());

    if (esp <= (paddr_t)_boot_stack_top && esp > (paddr_t)_boot_stack_bottom) {
        cpu_id = glks.cpu_list[0];
    } else {
        cpu_id = esp >> 11;
    }

    return cpu_id;
}

__attribute__((__section__(".boot.text"))) node_id_t
node_of_cpu(cpu_id_t cpu_id)
{
    node_id_t i;

    for (i = 0; i < glks.num_nodes; i++) {
        if (glks.cpu_list[i] == cpu_id) {
            return i;
        }
    }
    /* Is it even possible for this to happen? */
    halt();
}


__attribute__((__section__(".boot.text"))) static void
discover_devices(void)
{
    /* We do not add any ia32 specific devices. Just add any platform ones */
    platAddDevices();
}

/* split a region of physical memory into n mutually disjoint pieces */

__attribute__((__section__(".boot.text"))) static p_region_t
split_region(unsigned int i, unsigned int n, p_region_t reg)
{
    uint32_t offset;
    uint32_t total_frames = (reg.end - reg.start) >> 12;
    uint32_t frames_div = total_frames / n;
    uint32_t frames_mod = total_frames % n;

    if (i < frames_mod) {
        offset = (i * (frames_div + 1)) << 12;
        return (p_region_t) {
            .start = reg.start + offset,
             .end = reg.start + offset + ((frames_div + 1) << 12)
        };
    } else {
        offset = (frames_mod * (frames_div + 1) + (i - frames_mod) * frames_div) << 12;
        return (p_region_t) {
            .start = reg.start + offset,
             .end = reg.start + offset + (frames_div << 12)
        };
    }
}

__attribute__((__section__(".boot.text"))) static bool_t
lift_ndks(node_id_t node_id)
{
    p_region_t ndks_p_reg;

    ndks_p_reg.start = pptr_to_paddr(ndks_list[node_id]);
    ndks_p_reg.end = ndks_p_reg.start + 0x3000;

    if (!map_kernel_window(
                (pde_t*)kernel_pd_list[node_id],
                (pte_t*)kernel_pt_list[node_id],
                ndks_p_reg




            )) {
        return false;
    }
    write_cr3(pptr_to_paddr(kernel_pd_list[node_id]));
    /* Sync up the compilers view of the world here to force the PD to actually
     * be set *right now* instead of delayed */
    __asm__ volatile("" ::: "memory");
    return true;
}

static __attribute__((__section__(".boot.text"))) bool_t
try_boot_node(void)
{
    p_region_t boot_mem_reuse_p_reg;

    cpu_id_t cpu_id = cur_cpu_id();
    node_id_t node_id = node_of_cpu(cpu_id);

    uint32_t num_nodes = glks.num_nodes;
    ui_info_t ui_info = glks.ui_info_list[node_id];
    dev_p_regs_t* dev_p_regs = &glks.dev_p_regs;

    /* calculate this node's available physical memory */
    p_region_t this_avail_p_reg = split_region(node_id, num_nodes, glks.avail_p_reg);

    /* if we only boot up one node, we can reuse boot code/data memory */
    if (num_nodes == 1) {
        boot_mem_reuse_p_reg.start = 0x00100000;
        boot_mem_reuse_p_reg.end = (paddr_t)ki_boot_end - (0xe0000000 - 0x00000000);
    } else {
        boot_mem_reuse_p_reg = (p_region_t){ .start = 0, .end = 0 };
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
# 358 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c"
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
__attribute__((__section__(".boot.text"))) __attribute__((externally_visible)) void
boot_node(void)
{
    bool_t result;
    result = try_boot_node();
    if (!result) {
        halt();
    }
}

__attribute__((__section__(".boot.text"))) static void
start_cpu(cpu_id_t cpu_id, paddr_t boot_fun_paddr)
{
    /* memory fence needed before starting the other CPU */
    ia32_mfence();

    /* starting the other CPU */
    apic_send_init_ipi(cpu_id);
    apic_send_startup_ipi(cpu_id, boot_fun_paddr);
}

static __attribute__((__section__(".boot.text"))) bool_t
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

    if (multiboot_magic != 0x2BADB002) {
        ((void)(0));
        return false;
    }
    cmdline_parse(mbi->cmdline, &cmdline_opt);

    /* assert correct NDKS location and size */
    ;
    ;

    if ((mbi->flags & (1ul<<(0))) == 0) {
        ((void)(0));
        return false;
    }

    ;
    if ((mbi->mem_lower << 10) < 0x80000 + 0x400) {
        ((void)(0));
        return false;
    }

    /* copy CPU bootup code to lower memory */
    memcpy((void*)0x80000, _boot_cpu_start, _boot_cpu_end - _boot_cpu_start);

    /* calculate available physical memory (above 1M) */
    glks.avail_p_reg.start = 0x100000;
    glks.avail_p_reg.end = (((glks.avail_p_reg.start + (mbi->mem_upper << 10)) >> (12)) << (12));

    /* check maximum seL4 can use */
    if (glks.avail_p_reg.end > (0xffc00000 - (0xe0000000 - 0x00000000))) {
        glks.avail_p_reg.end = (0xffc00000 - (0xe0000000 - 0x00000000));
    }

    ((void)(0))



           ;

    glks.ki_p_reg.start = 0x00100000;
    glks.ki_p_reg.end = pptr_to_paddr(ki_end);

    ((void)(0))




           ;
    ((void)(0));

    glks.apic_khz = apic_khz;
    ((void)(0));

    /* remapping legacy IRQs to their correct vectors */
    pic_remap_irqs(0x20);

    /* Prepare for accepting device regions from here on */
    glks.dev_p_regs.count = 0;

    /* get ACPI root table */
    acpi_rsdt = acpi_init();
    if (!acpi_rsdt) {
        return false;
    }
# 494 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/boot_sys.c"
    /* query available CPUs from ACPI */
    glks.num_nodes = acpi_madt_scan(acpi_rsdt, glks.cpu_list, 8);
    if (glks.num_nodes == 0) {
        ((void)(0));
        return false;
    }

    if (glks.num_nodes > cmdline_opt.max_num_nodes) {
        glks.num_nodes = cmdline_opt.max_num_nodes;
    }
    ((void)(0));

    if (!(mbi->flags & (1ul<<(3)))) {
        ((void)(0));
        return false;
    }

    ((void)(0));
    mods_end_paddr = 0;

    for (i = 0; i < mbi->mod_count; i++) {
        ((void)(0))






         ;
        if ((int32_t)(mbi->mod_list[i].end - mbi->mod_list[i].start) <= 0) {
            ((void)(0));
            return false;
        }
        if (mods_end_paddr < mbi->mod_list[i].end) {
            mods_end_paddr = mbi->mod_list[i].end;
        }
    }
    mods_end_paddr = (((((mods_end_paddr) - 1ul) >> (12)) + 1ul) << (12));
    ;

    if (mbi->mod_count < 1) {
        ((void)(0));
        return false;
    }

    ((void)(0));
    load_paddr = mods_end_paddr;

    for (i = 0; i < mbi->mod_count && i < glks.num_nodes; i++) {
        ((void)(0));
        load_paddr = load_boot_module(i, mbi->mod_list + i, load_paddr);
        if (!load_paddr) {
            return false;
        }
    }

    for (i = mbi->mod_count; i < glks.num_nodes; i++) {
        ((void)(0));
        load_paddr = load_boot_module(i, mbi->mod_list + mbi->mod_count - 1, load_paddr);
        if (!load_paddr) {
            return false;
        }
    }

    /* calculate final location of userland images */
    ui_p_regs.start = glks.ki_p_reg.end;
    ui_p_regs.end = ui_p_regs.start + load_paddr - mods_end_paddr;

    ((void)(0))




     ;
    memcpy((void*)ui_p_regs.start, (void*)mods_end_paddr, ui_p_regs.end - ui_p_regs.start);

    for (i = 0; i < glks.num_nodes; i++) {
        /* adjust p_reg and pv_offset to final load address */
        glks.ui_info_list[i].p_reg.start -= mods_end_paddr - ui_p_regs.start;
        glks.ui_info_list[i].p_reg.end -= mods_end_paddr - ui_p_regs.start;
        glks.ui_info_list[i].pv_offset -= mods_end_paddr - ui_p_regs.start;
    }

    /* ==== following code corresponds to abstract specification after "select" ==== */

    /* exclude kernel image from available memory */
    ;
    glks.avail_p_reg.start = glks.ki_p_reg.end;

    /* exclude userland images from available memory */
    ;
    glks.avail_p_reg.start = ui_p_regs.end;

    /* choose shared region */
    glks.sh_p_reg.start = glks.avail_p_reg.start;
    glks.sh_p_reg.end = glks.sh_p_reg.start + (cmdline_opt.num_sh_frames << 12);
    if (glks.sh_p_reg.end > glks.avail_p_reg.end || glks.sh_p_reg.end < glks.sh_p_reg.start) {
        ((void)(0));
        return false;
    }

    /* exclude shared region from available memory */
    ;
    glks.avail_p_reg.start = glks.sh_p_reg.end;

    discover_devices();

    ((void)(0));
    if (!try_boot_node()) {
        return false;
    }

    /* start up other CPUs and initialise their nodes */
    for (i = 1; i < glks.num_nodes; i++) {
        ((void)(0));
        start_cpu(glks.cpu_list[i], 0x80000);
    }
    return true;
}

__attribute__((__section__(".boot.text"))) __attribute__((externally_visible)) void
boot_sys(
    unsigned long multiboot_magic,
    multiboot_info_t* mbi,
    uint32_t apic_khz)
{
    bool_t result;
    result = try_boot_sys(multiboot_magic, mbi, apic_khz);

    if (!result) {
        halt();
    }
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/cmdline.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/cmdline.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/cmdline.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/cmdline.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/cmdline.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/cmdline.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot_sys.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/cmdline.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/cmdline.c" 2

/* 'cmdline_val' is declared globally because of a C-subset restriction.
 * It is only used in cmdline_parse(), which therefore is non-reentrant.
 */

__attribute__((__section__(".boot.glob")))
char cmdline_val[1000];

/* workaround because string literals are not supported by C parser */
const char cmdline_str_max_num_nodes[] = {'m', 'a', 'x', '_', 'n', 'u', 'm', '_', 'n', 'o', 'd', 'e', 's', 0};
const char cmdline_str_num_sh_frames[] = {'n', 'u', 'm', '_', 's', 'h', '_', 'f', 'r', 'a', 'm', 'e', 's', 0};
const char cmdline_str_disable_iommu[] = {'d', 'i', 's', 'a', 'b', 'l', 'e', '_', 'i', 'o', 'm', 'm', 'u', 0};

static int is_space(char c)
{
    return c <= ' ';
}

static int parse_opt(const char *cmdline, const char *opt, char *value, int bufsize)
{
    int len = -1;
    const char *optptr = ((void *)0);

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
# 112 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/cmdline.c"
void cmdline_parse(const char *cmdline, cmdline_opt_t* cmdline_opt)
{
    int i;
# 162 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/cmdline.c"
    /* parse max_num_nodes option */
    cmdline_opt->max_num_nodes = 1; /* default */
    if (parse_opt(cmdline, cmdline_str_max_num_nodes, cmdline_val, 1000) != -1) {
        i = str_to_int(cmdline_val);
        if (i > 0 && i <= 8) {
            cmdline_opt->max_num_nodes = i;
        }
    }
    ((void)(0));

    /* parse num_sh_frames option */
    cmdline_opt->num_sh_frames = 0; /* default */
    if (parse_opt(cmdline, cmdline_str_num_sh_frames, cmdline_val, 1000) != -1) {
        i = str_to_int(cmdline_val);
        if (i >= 0 && i < (1ul<<(32 - 12))) {
            cmdline_opt->num_sh_frames = i;
        }
    }
    ((void)(0));
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/elf.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/elf.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/elf.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/elf.c" 2

/* minimal ELF functionality for loading GRUB boot module */

__attribute__((__section__(".boot.text"))) bool_t
elf32_checkFile(Elf32_Header_t* elfFile)
{
    return (
               elfFile->e_ident[0] == '\177' &&
               elfFile->e_ident[1] == 'E' &&
               elfFile->e_ident[2] == 'L' &&
               elfFile->e_ident[3] == 'F' &&
               elfFile->e_ident[4] == 1
           );
}

__attribute__((__section__(".boot.text"))) v_region_t
elf32_getMemoryBounds(Elf32_Header_t* elfFile)
{
    Elf32_Phdr_t* phdr = (Elf32_Phdr_t*)((paddr_t)elfFile + elfFile->e_phoff);
    v_region_t elf_reg;
    vptr_t sect_start;
    vptr_t sect_end;
    uint32_t i;

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

__attribute__((__section__(".boot.text"))) void
elf32_load(Elf32_Header_t* elfFile, int32_t offset)
{
    Elf32_Phdr_t* phdr = (Elf32_Phdr_t*)((paddr_t)elfFile + elfFile->e_phoff);
    paddr_t src;
    paddr_t dst;
    uint32_t len;
    uint32_t i;

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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/thread.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/thread.c" 2

void
Arch_switchToThread(tcb_t* tcb)
{
    word_t base;

    /* set PD */
    setVMRoot(tcb);

    /* update the GDT_TLS entry with the thread's TLS_BASE address */
    base = getRegister(tcb, TLS_BASE);
    gdt_entry_gdt_data_ptr_set_base_low(ia32KSgdt + 6, base);
    gdt_entry_gdt_data_ptr_set_base_mid(ia32KSgdt + 6, (base >> 16) & 0xFF);
    gdt_entry_gdt_data_ptr_set_base_high(ia32KSgdt + 6, (base >> 24) & 0xFF);

    /* update the GDT_IPCBUF entry with the thread's IPC buffer address */
    base = tcb->tcbIPCBuffer;
    gdt_entry_gdt_data_ptr_set_base_low(ia32KSgdt + 7, base);
    gdt_entry_gdt_data_ptr_set_base_mid(ia32KSgdt + 7, (base >> 16) & 0xFF);
    gdt_entry_gdt_data_ptr_set_base_high(ia32KSgdt + 7, (base >> 24) & 0xFF);
}

__attribute__((__section__(".boot.text"))) void
Arch_configureIdleThread(tcb_t* tcb)
{
    setRegister(tcb, EFLAGS, (1ul<<(9)) | (1ul<<(1))); /* enable interrupts and set bit 1 which is always 1 */
    setRegister(tcb, NextEIP, (uint32_t)(&idle_thread));
    setRegister(tcb, CS, (1 << 3));
    setRegister(tcb, DS, (2 << 3));
    setRegister(tcb, ES, (2 << 3));
    setRegister(tcb, FS, (2 << 3));
    setRegister(tcb, GS, (2 << 3));
    setRegister(tcb, SS, (2 << 3));
}

void
Arch_switchToIdleThread(void)
{
    /* Don't need to do anything */
}

void __attribute__((__const__))
Arch_activateIdleThread(tcb_t* tcb)
{
    /* Don't need to do anything */
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/boot.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "./arch/api/invocation.h" 1
/* @LICENSE(OKL_CORE) */

/* This header was generated by kernel/tools/invocation_header_gen.py.
 *
 * To add an invocation call number, edit libsel4/include/interfaces/sel4.xml.
 *
 */


# 1 "./api/invocation.h" 1
/* @LICENSE(OKL_CORE) */

/* This header was generated by kernel/tools/invocation_header_gen.py.
 *
 * To add an invocation call number, edit libsel4/include/interfaces/sel4.xml.
 *
 */



enum invocation_label {
    InvalidInvocation,
    UntypedRetype,
    TCBReadRegisters,
    TCBWriteRegisters,
    TCBCopyRegisters,
    TCBConfigure,
    TCBSetPriority,
    TCBSetIPCBuffer,
    TCBSetSpace,
    TCBSuspend,
    TCBResume,
    CNodeRevoke,
    CNodeDelete,
    CNodeRecycle,
    CNodeCopy,
    CNodeMint,
    CNodeMove,
    CNodeMutate,
    CNodeRotate,
    CNodeSaveCaller,
    IRQIssueIRQHandler,
    IRQInterruptControl,
    IRQAckIRQ,
    IRQSetIRQHandler,
    IRQClearIRQHandler,
    DomainSetSet,
    nInvocationLabels
};
# 11 "./arch/api/invocation.h" 2

enum arch_invocation_label {
    IA32PageTableMap = nInvocationLabels + 0,
    IA32PageTableUnmap = nInvocationLabels + 1,
    IA32IOPageTableMap = nInvocationLabels + 2,
    IA32PageMap = nInvocationLabels + 3,
    IA32PageRemap = nInvocationLabels + 4,
    IA32PageUnmap = nInvocationLabels + 5,
    IA32PageMapIO = nInvocationLabels + 6,
    IA32PageGetAddress = nInvocationLabels + 7,
    IA32ASIDControlMakePool = nInvocationLabels + 8,
    IA32ASIDPoolAssign = nInvocationLabels + 9,
    IA32IOPortIn8 = nInvocationLabels + 10,
    IA32IOPortIn16 = nInvocationLabels + 11,
    IA32IOPortIn32 = nInvocationLabels + 12,
    IA32IOPortOut8 = nInvocationLabels + 13,
    IA32IOPortOut16 = nInvocationLabels + 14,
    IA32IOPortOut32 = nInvocationLabels + 15,
    IA32IOSpaceRemovePassthrough = nInvocationLabels + 16,
    nArchInvocationLabels
};
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/apic.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c" 2

struct findPDForASID_ret {
    exception_t status;
    pde_t *pd;
};
typedef struct findPDForASID_ret findPDForASID_ret_t;

struct lookupPTSlot_ret {
    exception_t status;
    pte_t* ptSlot;
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
__attribute__((__section__(".phys.text")))
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

__attribute__((__section__(".phys.text"))) __attribute__((externally_visible)) void
init_boot_pd(void)
{
    unsigned int i;

    /* identity mapping from 0 up to PPTR_BASE (virtual address) */
    for (i = 0; i < (0xe0000000 >> pageBitsForSize_phys(IA32_4M)); i++) {
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
            1 /* present        */
        );
    }

    /* mapping of PPTR_BASE (virtual address) to PADDR_BASE up to end of virtual address space */
    for (i = 0; i < ((-0xe0000000) >> pageBitsForSize_phys(IA32_4M)); i++) {
        pde_pde_4m_ptr_new_phys(
            _boot_pd + i + (0xe0000000 >> pageBitsForSize_phys(IA32_4M)),
            (i << pageBitsForSize_phys(IA32_4M)) + 0x00000000, /* physical address */
            0, /* pat            */
            0, /* avl            */
            1, /* global         */
            0, /* dirty          */
            0, /* accessed       */
            0, /* cache_disabled */
            0, /* write_through  */
            0, /* super_user     */
            1, /* read_write     */
            1 /* present        */
        );
    }
}

/* initialise the Task State Segment (TSS) */

__attribute__((__section__(".boot.text"))) static void
init_tss(tss_t* tss)
{
    tss_ptr_new(
        tss,
        0, /* io_map_base  */
        0, /* trap         */
        0, /* sel_ldt      */
        0, /* gs           */
        0, /* fs           */
        0, /* ds           */
        0, /* ss           */
        0, /* cs           */
        0, /* es           */
        0, /* edi          */
        0, /* esi          */
        0, /* ebp          */
        0, /* esp          */
        0, /* ebx          */
        0, /* edx          */
        0, /* ecx          */
        0, /* eax          */
        0, /* eflags       */
        0, /* eip          */
        0, /* cr3          */
        0, /* ss2          */
        0, /* esp2         */
        0, /* ss1          */
        0, /* esp1         */
        (2 << 3), /* ss0          */
        0, /* esp0         */
        0 /* prev_task    */
    );
}

/* initialise Global Descriptor Table (GDT) */

__attribute__((__section__(".boot.text"))) static void
init_gdt(gdt_entry_t* gdt, tss_t* tss)
{
    uint32_t tss_addr = (uint32_t)tss;

    /* Set the NULL descriptor */
    gdt[0] = gdt_entry_gdt_null_new();

    /* 4GB flat kernel code segment on ring 0 descriptor */
    gdt[1] = gdt_entry_gdt_code_new(
                        0, /* Base high 8 bits             */
                        1, /* Granularity                  */
                        1, /* Operation size               */
                        0, /* Available                    */
                        0xf, /* Segment limit high 4 bits    */
                        1, /* Present                      */
                        0, /* Descriptor privilege level   */
                        1, /* readable                     */
                        1, /* accessed                     */
                        0, /* Base middle 8 bits           */
                        0, /* Base low 16 bits             */
                        0xffff /* Segment limit low 16 bits    */
                    );

    /* 4GB flat kernel data segment on ring 0 descriptor */
    gdt[2] = gdt_entry_gdt_data_new(
                        0, /* Base high 8 bits             */
                        1, /* Granularity                  */
                        1, /* Operation size               */
                        0, /* Available                    */
                        0xf, /* Segment limit high 4 bits    */
                        1, /* Present                      */
                        0, /* Descriptor privilege level   */
                        1, /* writable                     */
                        1, /* accessed                     */
                        0, /* Base middle 8 bits           */
                        0, /* Base low 16 bits             */
                        0xffff /* Segment limit low 16 bits    */
                    );

    /* 4GB flat userland code segment on ring 3 descriptor */
    gdt[3] = gdt_entry_gdt_code_new(
                        0, /* Base high 8 bits             */
                        1, /* Granularity                  */
                        1, /* Operation size               */
                        0, /* Available                    */
                        0xf, /* Segment limit high 4 bits    */
                        1, /* Present                      */
                        3, /* Descriptor privilege level   */
                        1, /* readable                     */
                        1, /* accessed                     */
                        0, /* Base middle 8 bits           */
                        0, /* Base low 16 bits             */
                        0xffff /* Segment limit low 16 bits    */
                    );

    /* 4GB flat userland data segment on ring 3 descriptor */
    gdt[4] = gdt_entry_gdt_data_new(
                        0, /* Base high 8 bits             */
                        1, /* Granularity                  */
                        1, /* Operation size               */
                        0, /* Available                    */
                        0xf, /* Segment limit high 4 bits    */
                        1, /* Present                      */
                        3, /* Descriptor privilege level   */
                        1, /* writable                     */
                        1, /* accessed                     */
                        0, /* Base middle 8 bits           */
                        0, /* Base low 16 bits             */
                        0xffff /* Segment limit low 16 bits    */
                    );

    /* Task State Segment (TSS) descriptor */
    gdt[5] = gdt_entry_gdt_tss_new(
                       tss_addr >> 24, /* base_high 8 bits     */
                       0, /* granularity          */
                       0, /* avl                  */
                       0, /* limit_high 4 bits    */
                       1, /* present              */
                       0, /* dpl                  */
                       0, /* busy                 */
                       1, /* always_true          */
                       (tss_addr >> 16) & 0xff, /* base_mid 8 bits      */
                       (tss_addr & 0xffff), /* base_low 16 bits     */
                       sizeof(tss_t) - 1 /* limit_low 16 bits    */
                   );

    /* pre-init the userland data segment used for TLS */
    gdt[6] = gdt_entry_gdt_data_new(
                       0, /* Base high 8 bits             */
                       1, /* Granularity                  */
                       1, /* Operation size               */
                       0, /* Available                    */
                       0xf, /* Segment limit high 4 bits    */
                       1, /* Present                      */
                       3, /* Descriptor privilege level   */
                       1, /* writable                     */
                       1, /* accessed                     */
                       0, /* Base middle 8 bits           */
                       0, /* Base low 16 bits             */
                       0xffff /* Segment limit low 16 bits    */
                   );

    /* pre-init the userland data segment used for the IPC buffer */
    gdt[7] = gdt_entry_gdt_data_new(
                          0, /* Base high 8 bits             */
                          1, /* Granularity                  */
                          1, /* Operation size               */
                          0, /* Available                    */
                          0xf, /* Segment limit high 4 bits    */
                          1, /* Present                      */
                          3, /* Descriptor privilege level   */
                          1, /* writable                     */
                          1, /* accessed                     */
                          0, /* Base middle 8 bits           */
                          0, /* Base low 16 bits             */
                          0xffff /* Segment limit low 16 bits    */
                      );
}

/* initialise the Interrupt Descriptor Table (IDT) */

__attribute__((__section__(".boot.text"))) static void
init_idt_entry(idt_entry_t* idt, interrupt_t interrupt, void(*handler)(void))
{
    uint32_t handler_addr = (uint32_t)handler;
    uint32_t dpl = 3;

    if (interrupt < int_trap_min) {
        dpl = 0;
    }

    idt[interrupt] = idt_entry_interrupt_gate_new(
                         handler_addr >> 16, /* offset_high  */
                         1, /* present      */
                         dpl, /* dpl          */
                         1, /* gate_size    */
                         (1 << 3), /* seg_selector */
                         handler_addr & 0xffff /* offset_low   */
                     );
}

__attribute__((__section__(".boot.text"))) static void
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

__attribute__((__section__(".boot.text"))) bool_t
map_kernel_window(
    pde_t* pd,
    pte_t* pt,
    p_region_t ndks_p_reg




)
{
    paddr_t phys;
    uint32_t idx;
    pde_t pde;
    pte_t pte;




    /* Mapping of PPTR_BASE (virtual address) to kernel's PADDR_BASE
     * up to end of virtual address space except for the last 4M.
     */
    phys = 0x00000000;
    idx = 0xe0000000 >> pageBitsForSize(IA32_4M);





    while (idx < (1ul<<(10)) - 1) {

        pde = pde_pde_4m_new(
                  phys, /* page_base_address    */
                  0, /* pat                  */
                  0, /* avl                  */
                  1, /* global               */
                  0, /* dirty                */
                  0, /* accessed             */
                  0, /* cache_disabled       */
                  0, /* write_through        */
                  0, /* super_user           */
                  1, /* read_write           */
                  1 /* present              */
              );
        pd[idx] = pde;
        phys += (1ul<<(pageBitsForSize(IA32_4M)));
        idx++;
    }

    /* crosscheck whether we have mapped correctly so far */
    ;
# 635 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c"
    /* map page table of last 4M of virtual address space to page directory */
    pde = pde_pde_4k_new(
              pptr_to_paddr(pt), /* pt_base_address  */
              0, /* avl              */
              0, /* accessed         */
              0, /* cache_disabled   */
              0, /* write_through    */
              1, /* super_user       */
              1, /* read_write       */
              1 /* present          */
          );
    pd[idx] = pde;

    /* Start with an empty guard page preceding the stack. */
    idx = 0;
    pte = pte_new(
              0, /* page_base_address    */
              0, /* avl                  */
              0, /* global               */
              0, /* pat                  */
              0, /* dirty                */
              0, /* accessed             */
              0, /* cache_disabled       */
              0, /* write_through        */
              0, /* super_user           */
              0, /* read_write           */
              0 /* present              */
          );
    pt[idx] = pte;
    idx++;

    /* establish NDKS (node kernel state) mappings in page table */
    phys = ndks_p_reg.start;
    while (idx - 1 < (ndks_p_reg.end - ndks_p_reg.start) >> pageBitsForSize(IA32_4K)) {
        pte = pte_new(
                  phys, /* page_base_address    */
                  0, /* avl                  */
                  1, /* global               */
                  0, /* pat                  */
                  0, /* dirty                */
                  0, /* accessed             */
                  0, /* cache_disabled       */
                  0, /* write_through        */
                  0, /* super_user           */
                  1, /* read_write           */
                  1 /* present              */
              );
        pt[idx] = pte;
        phys += (1ul<<(pageBitsForSize(IA32_4K)));
        idx++;
    }

    /* null mappings up to PPTR_KDEV */

    while (idx < (0xffff0000 & ((1ul<<(pageBitsForSize(IA32_4M)))-1ul)) >> pageBitsForSize(IA32_4K)) {
        pte = pte_new(
                  0, /* page_base_address    */
                  0, /* avl                  */
                  0, /* global               */
                  0, /* pat                  */
                  0, /* dirty                */
                  0, /* accessed             */
                  0, /* cache_disabled       */
                  0, /* write_through        */
                  0, /* super_user           */
                  0, /* read_write           */
                  0 /* present              */
              );
        pt[idx] = pte;
        phys += (1ul<<(pageBitsForSize(IA32_4K)));
        idx++;
    }

    /* map kernel devices (devices only used by the kernel) */

    /* map kernel devices: APIC */
    phys = apic_get_base_paddr();
    if (!phys) {
        return false;
    }
    pte = pte_new(
              phys, /* page_base_address    */
              0, /* avl                  */
              1, /* global               */
              0, /* pat                  */
              0, /* dirty                */
              0, /* accessed             */
              1, /* cache_disabled       */
              1, /* write_through        */
              0, /* super_user           */
              1, /* read_write           */
              1 /* present              */
          );

    ;
    pt[idx] = pte;
    idx++;
# 761 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c"
    /* mark unused kernel-device pages as 'not present' */
    while (idx < (1ul<<(10))) {
        pte = pte_new(
                  0, /* page_base_address    */
                  0, /* avl                  */
                  0, /* global               */
                  0, /* pat                  */
                  0, /* dirty                */
                  0, /* accessed             */
                  0, /* cache_disabled       */
                  0, /* write_through        */
                  0, /* super_user           */
                  0, /* read_write           */
                  0 /* present              */
              );
        pt[idx] = pte;
        idx++;
    }

    /* Check we haven't added too many kernel-device mappings.*/
    ;

    invalidatePageStructureCache();
    return true;
}

/* Note: this function will invalidate any pointers previously returned from this function */
__attribute__((__section__(".boot.text"))) void*
map_temp_boot_page(void* entry, uint32_t pages)
{
    void* replacement_vaddr;
    unsigned int i;
    unsigned int offset_in_page;

    unsigned int phys_pg_start = (unsigned int)(entry) & ~((1ul<<(pageBitsForSize(IA32_4M)))-1ul);
    unsigned int virt_pd_start = (0xe0000000 >> pageBitsForSize(IA32_4M)) - pages;
    unsigned int virt_pg_start = 0xe0000000 - (pages << pageBitsForSize(IA32_4M));

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
                           1 /* present        */
                          );
        invalidateTLBentry(virt_pg_start + pg_offset);
    }

    // assign replacement virtual addresses page
    offset_in_page = (unsigned int)(entry) & ((1ul<<(pageBitsForSize(IA32_4M)))-1ul);
    replacement_vaddr = (void*)(virt_pg_start + offset_in_page);

    invalidatePageStructureCache();

    return replacement_vaddr;
}

__attribute__((__section__(".boot.text"))) bool_t
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

__attribute__((__section__(".boot.text"))) void
init_dtrs(void)
{
    /* setup the GDT pointer and limit and load into GDTR */
    gdt_idt_ptr.limit = (sizeof(gdt_entry_t) * 8) - 1;
    gdt_idt_ptr.basel = (uint32_t)ia32KSgdt;
    gdt_idt_ptr.baseh = (uint16_t)((uint32_t)ia32KSgdt >> 16);
    ia32_install_gdt(&gdt_idt_ptr);

    /* setup the IDT pointer and limit and load into IDTR */
    gdt_idt_ptr.limit = (sizeof(idt_entry_t) * (int_max + 1)) - 1;
    gdt_idt_ptr.basel = (uint32_t)ia32KSidt;
    gdt_idt_ptr.baseh = (uint16_t)((uint32_t)ia32KSidt >> 16);
    ia32_install_idt(&gdt_idt_ptr);

    /* load NULL LDT selector into LDTR */
    ia32_install_ldt(0);

    /* load TSS selector into Task Register (TR) */
    ia32_install_tss((5 << 3));
}

__attribute__((__section__(".boot.text"))) void
map_it_pt_cap(cap_t pd_cap, cap_t pt_cap)
{
    pde_t* pd = ((pde_t *)((pptr_t)cap_get_capPtr(pd_cap)));
    pte_t* pt = ((pte_t *)cap_page_table_cap_get_capPTBasePtr(pt_cap));
    vptr_t vptr = cap_page_table_cap_get_capPTMappedAddress(pt_cap);

    ;
    pde_pde_4k_ptr_new(
        pd + (vptr >> pageBitsForSize(IA32_4M)),
        pptr_to_paddr(pt), /* pt_base_address */
        0, /* avl             */
        0, /* accessed        */
        0, /* cache_disabled  */
        0, /* write_through   */
        1, /* super_user      */
        1, /* read_write      */
        1 /* present         */
    );
    invalidatePageStructureCache();
}

__attribute__((__section__(".boot.text"))) void
map_it_frame_cap(cap_t pd_cap, cap_t frame_cap)
{
    pte_t* pt;
    pde_t* pd = ((pde_t *)((pptr_t)cap_get_capPtr(pd_cap)));
    void* frame = (void*)cap_frame_cap_get_capFBasePtr(frame_cap);
    vptr_t vptr = cap_frame_cap_get_capFMappedAddress(frame_cap);

    ;
    pd += (vptr >> pageBitsForSize(IA32_4M));
    pt = paddr_to_pptr(pde_pde_4k_ptr_get_pt_base_address(pd));
    pte_ptr_new(
        pt + ((vptr & ((1ul<<(pageBitsForSize(IA32_4M)))-1ul)) >> pageBitsForSize(IA32_4K)),
        pptr_to_paddr(frame), /* page_base_address */
        0, /* avl               */
        0, /* global            */
        0, /* pat               */
        0, /* dirty             */
        0, /* accessed          */
        0, /* cache_disabled    */
        0, /* write_through     */
        1, /* super_user        */
        1, /* read_write        */
        1 /* present           */
    );
    invalidatePageStructureCache();
}

__attribute__((__section__(".boot.text"))) void
write_it_asid_pool(cap_t it_ap_cap, cap_t it_pd_cap)
{
    asid_pool_t* ap = ((asid_pool_t*)(pptr_t)cap_get_capPtr(it_ap_cap));
    ap->array[1 /* initial thread's ASID */] = ((pde_t *)((pptr_t)cap_get_capPtr(it_pd_cap)));
    ia32KSASIDTable[1 /* initial thread's ASID */ >> asidLowBits] = ap;
}

__attribute__((__section__(".boot.text"))) bool_t
init_pat_msr(void)
{
    ia32_pat_msr_t pat_msr;
    /* First verify PAT is supported by the machine.
       See section 11.12.1 of Volume 3 of the Intel manual */
    if ( (ia32_cpuid_edx(0x1, 0x0) & (1ul<<(16))) == 0) {
        ((void)(0));
        return false;
    }
    pat_msr.words[0] = ia32_rdmsr_low(0x277);
    pat_msr.words[1] = ia32_rdmsr_high(0x277);
    /* Set up the PAT MSR to the Intel defaults, just in case
     * they have been changed but a bootloader somewhere along the way */
    ia32_pat_msr_ptr_set_pa0(&pat_msr, 0x06);
    ia32_pat_msr_ptr_set_pa1(&pat_msr, 0x04);
    ia32_pat_msr_ptr_set_pa2(&pat_msr, 0x07);
    ia32_pat_msr_ptr_set_pa3(&pat_msr, 0x00);
    /* Add the WriteCombining cache type to the PAT */
    ia32_pat_msr_ptr_set_pa4(&pat_msr, 0x01);
    ia32_wrmsr(0x277, pat_msr.words[1], pat_msr.words[0]);
    return true;
}

/* ==================== BOOT CODE FINISHES HERE ==================== */

static uint32_t __attribute__((__const__)) WritableFromVMRights(vm_rights_t vm_rights)
{
    switch (vm_rights) {
    case VMReadOnly:
        return 0;

    case VMKernelOnly:
    case VMReadWrite:
        return 1;

    default:
        halt();
    }
}

static uint32_t __attribute__((__const__)) SuperUserFromVMRights(vm_rights_t vm_rights)
{
    switch (vm_rights) {
    case VMKernelOnly:
        return 0;

    case VMReadOnly:
    case VMReadWrite:
        return 1;

    default:
        halt();
    }
}

static pde_t __attribute__((__const__)) makeUserPDE(paddr_t paddr, vm_attributes_t vm_attr, vm_rights_t vm_rights)
{
    return pde_pde_4m_new(
               paddr, /* page_base_address    */
               vm_attributes_get_ia32PATBit(vm_attr), /* pat                  */
               0, /* avl                  */
               0, /* global               */
               0, /* dirty                */
               0, /* accessed             */
               vm_attributes_get_ia32PCDBit(vm_attr), /* cache_disabled       */
               vm_attributes_get_ia32PWTBit(vm_attr), /* write_through        */
               SuperUserFromVMRights(vm_rights), /* super_user           */
               WritableFromVMRights(vm_rights), /* read_write           */
               1 /* present              */
           );
}

static pte_t __attribute__((__const__)) makeUserPTE(paddr_t paddr, vm_attributes_t vm_attr, vm_rights_t vm_rights)
{
    return pte_new(
               paddr, /* page_base_address    */
               0, /* avl                  */
               0, /* global               */
               vm_attributes_get_ia32PATBit(vm_attr), /* pat                  */
               0, /* dirty                */
               0, /* accessed             */
               vm_attributes_get_ia32PCDBit(vm_attr), /* cache_disabled       */
               vm_attributes_get_ia32PWTBit(vm_attr), /* write_through        */
               SuperUserFromVMRights(vm_rights), /* super_user           */
               WritableFromVMRights(vm_rights), /* read_write           */
               1 /* present              */
           );
}

word_t* __attribute__((__pure__)) lookupIPCBuffer(bool_t isReceiver, tcb_t *thread)
{
    word_t w_bufferPtr;
    cap_t bufferCap;
    vm_rights_t vm_rights;

    w_bufferPtr = thread->tcbIPCBuffer;
    bufferCap = (((cte_t *)((unsigned int)thread&~((1ul<<(10))-1ul)))+tcbBuffer)->cap;

    if (cap_get_capType(bufferCap) != cap_frame_cap) {
        return ((void *)0);
    }

    vm_rights = cap_frame_cap_get_capFVMRights(bufferCap);
    if (vm_rights == VMReadWrite || (!isReceiver && vm_rights == VMReadOnly)) {
        word_t basePtr;
        unsigned int pageBits;

        basePtr = cap_frame_cap_get_capFBasePtr(bufferCap);
        pageBits = pageBitsForSize(cap_frame_cap_get_capFSize(bufferCap));
        return (word_t *)(basePtr + (w_bufferPtr & ((1ul<<(pageBits))-1ul)));
    } else {
        return ((void *)0);
    }
}

static pde_t* __attribute__((__const__)) lookupPDSlot(pde_t *pd, vptr_t vptr)
{
    unsigned int pdIndex;

    pdIndex = vptr >> (12 + 10);
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

        ret.ptSlot = ((void *)0);
        ret.status = EXCEPTION_LOOKUP_FAULT;
        return ret;
    } else {
        pte_t* pt;
        pte_t* ptSlot;
        unsigned int ptIndex;

        pt = paddr_to_pptr(pde_pde_4k_ptr_get_pt_base_address(pdSlot));
        ptIndex = (vptr >> 12) & ((1ul<<(10))-1ul);
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
        halt();
    }
}

bool_t __attribute__((__const__)) isValidVTableRoot(cap_t cap)
{
    return cap_get_capType(cap) == cap_page_directory_cap &&
           cap_page_directory_cap_get_capPDIsMapped(cap);
}





exception_t checkValidIPCBuffer(vptr_t vptr, cap_t cap)
{
    if (cap_get_capType(cap) != cap_frame_cap) {
        ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (!(!((vptr) & ((1ul<<(9))-1ul)))) {
        ;
        current_syscall_error.type = seL4_AlignmentError;
        return EXCEPTION_SYSCALL_ERROR;
    }

    return EXCEPTION_NONE;
}

vm_rights_t __attribute__((__const__)) maskVMRights(vm_rights_t vm_rights, cap_rights_t cap_rights_mask)
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
    cap_t threadRoot;

    ;

    /* check if page table belongs to current address space */
    threadRoot = (((cte_t *)((unsigned int)ksCurThread&~((1ul<<(10))-1ul)))+tcbVTable)->cap;
    if (cap_get_capType(threadRoot) == cap_page_directory_cap &&
            cap_page_directory_cap_get_capPDIsMapped(threadRoot) &&
            ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr(threadRoot))) == pd) {
        /* find valid mappings */
        for (i = 0; i < (1ul<<(10)); i++) {
            if (pte_get_present(pt[i])) {
                invalidateTLBentry(vptr + (i << 12));
            }
        }
    }
}

static findPDForASID_ret_t findPDForASID(asid_t asid)
{
    findPDForASID_ret_t ret;
    asid_pool_t* poolPtr;
    pde_t* pd;

    poolPtr = ia32KSASIDTable[asid >> asidLowBits];
    if (!poolPtr) {
        current_lookup_fault = lookup_fault_invalid_root_new();

        ret.pd = ((void *)0);
        ret.status = EXCEPTION_LOOKUP_FAULT;
        return ret;
    }

    pd = poolPtr->array[asid & ((1ul<<(asidLowBits))-1ul)];
    if (!pd) {
        current_lookup_fault = lookup_fault_invalid_root_new();

        ret.pd = ((void *)0);
        ret.status = EXCEPTION_LOOKUP_FAULT;
        return ret;
    }

    ret.pd = pd;
    ret.status = EXCEPTION_NONE;
    return ret;
}

void setVMRoot(tcb_t* tcb)
{
    cap_t threadRoot;
    pde_t* pd;
    asid_t asid;
    findPDForASID_ret_t find_ret;

    threadRoot = (((cte_t *)((unsigned int)tcb&~((1ul<<(10))-1ul)))+tcbVTable)->cap;

    if (cap_get_capType(threadRoot) != cap_page_directory_cap ||
            !cap_page_directory_cap_get_capPDIsMapped(threadRoot)) {
        setCurrentPD(pptr_to_paddr(ia32KSkernelPD));
        return;
    }

    pd = ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr(threadRoot)));
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
    ;

    if (ia32KSASIDTable[asid_base >> asidLowBits] == pool) {
        ia32KSASIDTable[asid_base >> asidLowBits] = ((void *)0);
        setVMRoot(ksCurThread);
    }
}

void deleteASID(asid_t asid, pde_t* pd)
{
    asid_pool_t* poolPtr;

    poolPtr = ia32KSASIDTable[asid >> asidLowBits];

    if (poolPtr != ((void *)0) && poolPtr->array[asid & ((1ul<<(asidLowBits))-1ul)] == pd) {
        poolPtr->array[asid & ((1ul<<(asidLowBits))-1ul)] = ((void *)0);
        setVMRoot(ksCurThread);
    }
}

void unmapPageTable(asid_t asid, vptr_t vaddr, pte_t* pt)
{
    findPDForASID_ret_t find_ret;
    pde_t* pdSlot;
    unsigned int pdIndex;

    find_ret = findPDForASID(asid);
    if (find_ret.status != EXCEPTION_NONE) {
        return;
    }

    pdIndex = vaddr >> (12 + 10);
    pdSlot = find_ret.pd + pdIndex;

    flushTable(find_ret.pd, vaddr, pt);

    *pdSlot = pde_pde_4k_new(
                  0, /* pt_base_address  */
                  0, /* avl              */
                  0, /* accessed         */
                  0, /* cache_disabled   */
                  0, /* write_through    */
                  0, /* super_user       */
                  0, /* read_write       */
                  0 /* present          */
              );
    invalidatePageStructureCache();
}

void unmapPage(vm_page_size_t page_size, asid_t asid, vptr_t vptr, void *pptr)
{
    findPDForASID_ret_t find_ret;
    lookupPTSlot_ret_t lu_ret;
    cap_t threadRoot;
    pde_t *pde;

    find_ret = findPDForASID(asid);
    if (find_ret.status != EXCEPTION_NONE) {
        return;
    }

    /* check if page belongs to current address space */
    threadRoot = (((cte_t *)((unsigned int)ksCurThread&~((1ul<<(10))-1ul)))+tcbVTable)->cap;
    if (cap_get_capType(threadRoot) == cap_page_directory_cap &&
            cap_page_directory_cap_get_capPDIsMapped(threadRoot) &&
            ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr(threadRoot))) == find_ret.pd) {
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
                             0, /* page_base_address    */
                             0, /* avl                  */
                             0, /* global               */
                             0, /* pat                  */
                             0, /* dirty                */
                             0, /* accessed             */
                             0, /* cache_disabled       */
                             0, /* write_through        */
                             0, /* super_user           */
                             0, /* read_write           */
                             0 /* present              */
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
                                               0, /* page_base_address    */
                                               0, /* pat                  */
                                               0, /* avl                  */
                                               0, /* global               */
                                               0, /* dirty                */
                                               0, /* accessed             */
                                               0, /* cache_disabled       */
                                               0, /* write_through        */
                                               0, /* super_user           */
                                               0, /* read_write           */
                                               0 /* present              */
                                           );
        break;

    default:
        halt();
    }
    invalidatePageStructureCache();
}

void copyGlobalMappings(pde_t* newPD)
{
    unsigned int i;

    for (i = 0xe0000000 >> pageBitsForSize(IA32_4M); i < (1ul<<(10)); i++) {
        newPD[i] = ia32KSkernelPD[i];
    }
}

static exception_t performASIDControlInvocation(void* frame, cte_t* slot, cte_t* parent, asid_t asid_base)
{
    memzero(frame, 1 << pageBitsForSize(IA32_4K));
    cteInsert(
        cap_asid_pool_cap_new(
            asid_base, /* capASIDBase  */
            ((unsigned int)frame) /* capASIDPool  */
        ),
        parent,
        slot
    );
    /* Haskell error: "ASID pool's base must be aligned" */
    ;
    ia32KSASIDTable[asid_base >> asidLowBits] = (asid_pool_t*)frame;

    return EXCEPTION_NONE;
}

static exception_t performASIDPoolInvocation(asid_t asid, asid_pool_t* poolPtr, cte_t* pdCapSlot)
{
    cap_page_directory_cap_ptr_set_capPDMappedASID(&pdCapSlot->cap, asid);
    cap_page_directory_cap_ptr_set_capPDIsMapped(&pdCapSlot->cap, 1);
    poolPtr->array[asid & ((1ul<<(asidLowBits))-1ul)] = ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr(pdCapSlot->cap)));

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
    return (!((w) & ((1ul<<(pageBitsForSize(sz)))-1ul)));
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
    word_t vaddr;
    vm_attributes_t attr;
    word_t pdIndex;
    cap_t pdCap;
    pde_t* pd;
    pde_t* pdSlot;
    pde_t pde;
    paddr_t paddr;
    asid_t asid;

    if (label == IA32PageTableUnmap) {
        if (! isFinalCapability(cte)) {
            current_syscall_error.type = seL4_RevokeFirst;
            ;
            return EXCEPTION_SYSCALL_ERROR;
        }
        setThreadState(ksCurThread, ThreadState_Restart);

        if (cap_page_table_cap_get_capPTIsMapped(cap)) {
            pte_t *pt = ((pte_t *)cap_page_table_cap_get_capPTBasePtr(cap));
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
        ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (length < 2 || extraCaps.excaprefs[0] == ((void *)0)) {
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (cap_page_table_cap_get_capPTIsMapped(cap)) {
        ;
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

    pd = ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr(pdCap)));
    asid = cap_page_directory_cap_get_capPDMappedASID(pdCap);

    if (vaddr >= 0xe0000000) {
        ;
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

    pdIndex = vaddr >> (12 + 10);
    pdSlot = &pd[pdIndex];

    if (((pde_ptr_get_page_size(pdSlot) == pde_pde_4k) && pde_pde_4k_ptr_get_present(pdSlot)) ||
            ((pde_ptr_get_page_size(pdSlot) == pde_pde_4m) && pde_pde_4m_ptr_get_present(pdSlot))) {
        current_syscall_error.type = seL4_DeleteFirst;

        return EXCEPTION_SYSCALL_ERROR;
    }

    paddr = pptr_to_paddr(((pte_t *)cap_page_table_cap_get_capPTBasePtr(cap)));
    pde = pde_pde_4k_new(
              paddr, /* pt_base_address  */
              0, /* avl              */
              0, /* accessed         */
              vm_attributes_get_ia32PCDBit(attr), /* cache_disabled   */
              vm_attributes_get_ia32PWTBit(attr), /* write_through    */
              1, /* super_user       */
              1, /* read_write       */
              1 /* present          */
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
        word_t vaddr;
        word_t vtop;
        word_t w_rightsMask;
        paddr_t paddr;
        cap_t pdCap;
        pde_t* pd;
        vm_rights_t capVMRights;
        vm_rights_t vmRights;
        vm_attributes_t vmAttr;
        vm_page_size_t frameSize;
        asid_t asid;

        if (length < 3 || extraCaps.excaprefs[0] == ((void *)0)) {
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
            ;
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;

            return EXCEPTION_SYSCALL_ERROR;
        }

        if (cap_get_capType(pdCap) != cap_page_directory_cap ||
                !cap_page_directory_cap_get_capPDIsMapped(pdCap)) {
            if (cap_get_capType(pdCap) != cap_page_directory_cap) {
                ;
            } else {
                ;
            }
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 1;

            return EXCEPTION_SYSCALL_ERROR;
        }
        pd = ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr(pdCap)));
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

        vtop = vaddr + (1ul<<(pageBitsForSize(frameSize)));

        if (vtop > 0xe0000000) {
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
            pte_t pte;
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
            halt();
        }
        invalidatePageStructureCache();
        break;
    }

    case IA32PageRemap: { /* Remap */
        word_t vaddr;
        word_t w_rightsMask;
        paddr_t paddr;
        vm_rights_t capVMRights;
        vm_rights_t vmRights;
        vm_attributes_t vmAttr;
        vm_page_size_t frameSize;
        asid_t asid;
        cap_t pdCap;
        pde_t* pd;
# 1715 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/kernel/vspace.c"
        if (length < 2 || extraCaps.excaprefs[0] == ((void *)0)) {
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
        pd = ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr( pdCap)))
                                ;
        asid = cap_page_directory_cap_get_capPDMappedASID(pdCap);

        if (cap_frame_cap_get_capFMappedASID(cap) == asidInvalid) {
            ;
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;

            return EXCEPTION_SYSCALL_ERROR;
        }

        vaddr = cap_frame_cap_get_capFMappedAddress(cap);

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

        frameSize = cap_frame_cap_get_capFSize(cap);
        capVMRights = cap_frame_cap_get_capFVMRights(cap);
        paddr = pptr_to_paddr((void*)cap_frame_cap_get_capFBasePtr(cap));

        vmRights = maskVMRights(capVMRights, rightsFromWord(w_rightsMask));

        if (!checkVPAlignment(frameSize, vaddr)) {
            current_syscall_error.type = seL4_AlignmentError;

            return EXCEPTION_SYSCALL_ERROR;
        }

        switch (frameSize) {
            /* PTE mappings */
        case IA32_4K: {
            pte_t pte;
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
            halt();
        }
        invalidatePageStructureCache();
        break;
    }

    case IA32PageUnmap: { /* Unmap */
        if (cap_frame_cap_get_capFMappedASID(cap) != asidInvalid) {





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






    case IA32PageGetAddress: {
        /* Return it in the first message register. */
        ;

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
        unsigned int i;
        asid_t asid_base;
        word_t index;
        word_t depth;
        cap_t untyped;
        cap_t root;
        cte_t* parentSlot;
        cte_t* destSlot;
        lookupSlot_ret_t lu_ret;
        void* frame;
        exception_t status;

        if (label != IA32ASIDControlMakePool) {
            current_syscall_error.type = seL4_IllegalOperation;

            return EXCEPTION_SYSCALL_ERROR;
        }

        if (length < 2 || extraCaps.excaprefs[0] == ((void *)0)
                || extraCaps.excaprefs[1] == ((void *)0)) {
            current_syscall_error.type = seL4_TruncatedMessage;

            return EXCEPTION_SYSCALL_ERROR;
        }

        index = getSyscallArg(0, buffer);
        depth = getSyscallArg(1, buffer);
        parentSlot = extraCaps.excaprefs[0];
        untyped = parentSlot->cap;
        root = extraCaps.excaprefs[1]->cap;

        /* Find first free pool */
        for (i = 0; i < (1ul<<(asidHighBits)) && ia32KSASIDTable[i]; i++);

        if (i == (1ul<<(asidHighBits))) {
            /* no unallocated pool is found */
            current_syscall_error.type = seL4_DeleteFirst;

            return EXCEPTION_SYSCALL_ERROR;
        }

        asid_base = i << asidLowBits;

        if (cap_get_capType(untyped) != cap_untyped_cap ||
                cap_untyped_cap_get_capBlockSize(untyped) != (asidLowBits + 2)) {
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 1;

            return EXCEPTION_SYSCALL_ERROR;
        }

        status = ensureNoChildren(parentSlot);
        if (status != EXCEPTION_NONE) {
            return status;
        }

        frame = ((word_t *)(cap_untyped_cap_get_capPtr(untyped)));

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
        cap_t pdCap;
        cte_t* pdCapSlot;
        asid_pool_t* pool;
        unsigned int i;
        asid_t asid;

        if (label != IA32ASIDPoolAssign) {
            current_syscall_error.type = seL4_IllegalOperation;

            return EXCEPTION_SYSCALL_ERROR;
        }

        if (extraCaps.excaprefs[0] == ((void *)0)) {
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

        if (pool != ((asid_pool_t*)cap_asid_pool_cap_get_capASIDPool(cap))) {
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }

        /* Find first free ASID */
        asid = cap_asid_pool_cap_get_capASIDBase(cap);
        for (i = 0; i < (1ul<<(asidLowBits)) && (asid + i == 0 || pool->array[i]); i++);

        if (i == (1ul<<(asidLowBits))) {
            current_syscall_error.type = seL4_DeleteFirst;

            return EXCEPTION_SYSCALL_ERROR;
        }

        asid += i;

        setThreadState(ksCurThread, ThreadState_Restart);
        return performASIDPoolInvocation(asid, pool, pdCapSlot);
    }

    default:
        halt();
    }
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/fpu.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/fpu.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/fpu.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/fpu.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/fpu.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/fpu.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/fpu.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/fpu.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/fpu.c" 2

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
__attribute__((externally_visible)) exception_t
handleUnimplementedDevice(void)
{
    /*
     * If we have already given the FPU to the user, we should not reach here.
     *
     * This should only be able to occur on CPUs without an FPU at all, which
     * we presumably are happy to assume will not be running seL4.
     */
    ;

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
        switchFpuOwner(((void *)0));
    }
}

/*
 * Initialise the FPU for this machine.
 */
__attribute__((__section__(".boot.text"))) void
Arch_initFpu(void)
{
    /* Enable FPU / SSE / SSE2 / SSE3 / SSSE3 / SSE4 Extensions. */
    write_cr4(read_cr4() | (1ul<<(9)) /* Enable SSE et. al. features. */);

    /* Enable the FPU in general. Although leave it in a state where it will
     * generate a fault if someone tries to use it as we implement lazy
     * switching */
    write_cr0((read_cr0() & ~(1ul<<(2)) /* Enable OS emulation of FPU. */) | (1ul<<(1)) /* Trap on FPU "WAIT" commands. */ | (1ul<<(5)) /* Internally handle FPU problems. */ | (1ul<<(3)) /* Trap on any FPU usage, for lazy FPU. */);
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/hardware.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/hardware.c" 2

/* initialises MSRs required to setup sysenter and sysexit */
__attribute__((__section__(".boot.text"))) void
init_sysenter_msrs(void)
{
    ia32_wrmsr(0x174, 0, (uint32_t)(1 << 3));
    ia32_wrmsr(0x176, 0, (uint32_t)&handle_syscall);
    ia32_wrmsr(0x175, 0, (uint32_t)&ia32KStss.words[1]);
}

word_t __attribute__((__pure__)) getRestartPC(tcb_t *thread)
{
    return getRegister(thread, FaultEIP);
}

void setNextPC(tcb_t *thread, word_t v)
{
    setRegister(thread, NextEIP, v);
}

/* Returns the size of CPU's cacheline */
__attribute__((__section__(".boot.text"))) uint32_t __attribute__((__const__))
getCacheLineSizeBits(void)
{
    uint32_t line_size;
    uint32_t n;

    line_size = getCacheLineSize();
    if (line_size == 0) {
        ((void)(0));
        return 0;
    }

    /* determine size_bits */
    n = 0;
    while (!(line_size & 1)) {
        line_size >>= 1;
        n++;
    }

    if (line_size != 1) {
        ((void)(0));
        return 0;
    }

    return n;
}

/* Flushes a specific memory range from the CPU cache */

void flushCacheRange(void* vaddr, uint32_t size_bits)
{
    uint32_t v;

    ;
    ;

    ia32_mfence();

    for (v = ((((uint32_t)vaddr) >> (ia32KScacheLineSizeBits)) << (ia32KScacheLineSizeBits));
            v < (uint32_t)vaddr + (1ul<<(size_bits));
            v += (1ul<<(ia32KScacheLineSizeBits))) {
        flushCacheLine((void*)v);
    }
    ia32_mfence();
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/registerset.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/registerset.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/fpu.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/registerset.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/machine/registerset.c" 2

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
    context->registers[DS] = ((4 << 3) | 3);
    context->registers[ES] = ((4 << 3) | 3);
    context->registers[FS] = 0;
    context->registers[GS] = 0;
    context->registers[TLS_BASE] = 0;
    context->registers[Error] = 0;
    context->registers[FaultEIP] = 0;
    context->registers[NextEIP] = 0; /* overwritten by setNextPC() later on */
    context->registers[CS] = ((3 << 3) | 3);
    context->registers[EFLAGS] = (1ul<<(9)) | (1ul<<(1)); /* enable interrupts and set bit 1 which is always 1 */
    context->registers[ESP] = 0; /* userland has to set it after entry */
    context->registers[SS] = ((4 << 3) | 3);

    Arch_initFpuContext(context);
}

word_t sanitiseRegister(register_t reg, word_t v)
{
    if (reg == EFLAGS) {
        v |= (1ul<<(1)); /* reserved bit that must be set to 1 */
        v &= ~(1ul<<(3)); /* reserved bit that must be set to 0 */
        v &= ~(1ul<<(5)); /* reserved bit that must be set to 0 */
        v |= (1ul<<(9)); /* interrupts must be enabled in userland */
        v &= ((1ul<<(12))-1ul); /* bits 12:31 have to be 0 */
    }
    if (reg == FS || reg == GS) {
        if (v != ((6 << 3) | 3) && v != ((7 << 3) | 3)) {
            v = 0;
        }
    }
    return v;
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/model/statedata.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/model/statedata.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/model/statedata.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/model/statedata.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/model/statedata.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/model/statedata.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/model/statedata.c" 2

/* ==== read/write kernel state not preserved across kernel entries ==== */

/* Interrupt currently being handled */
interrupt_t ia32KScurInterrupt __attribute__((externally_visible));

/* ==== proper read/write kernel state ==== */

/* Task State Segment (TSS), contains currently running TCB in ESP0 */
tss_t ia32KStss __attribute__((externally_visible));

/* Global Descriptor Table (GDT) */
gdt_entry_t ia32KSgdt[8];

/* The top level ASID table */
asid_pool_t* ia32KSASIDTable[(1ul<<(asidHighBits))];

/*
 * Current thread whose state is installed in the FPU, or NULL if
 * the FPU is currently invalid.
 */
tcb_t *ia32KSfpuOwner __attribute__((externally_visible));

/* ==== read-only kernel state (only written during bootstrapping) ==== */

/* The privileged kernel mapping PD & PT */
pde_t* ia32KSkernelPD;
pte_t* ia32KSkernelPT;

/* CPU Cache Line Size */
uint32_t ia32KScacheLineSizeBits;

/* Interrupt Descriptor Table (IDT) */
idt_entry_t ia32KSidt[256];

/* A valid initial FPU state, copied to every new thread. */
user_fpu_state_t ia32KSnullFpuState __attribute__((__aligned__(16)));

/* Current active page directory. This is really just a shadow of CR3 */
paddr_t ia32KSCurrentPD __attribute__((externally_visible));
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/interrupt.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/boot.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/interrupt.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/interrupt.c" 2

exception_t Arch_decodeInterruptControl(unsigned int length, extra_caps_t extraCaps)
{
    current_syscall_error.type = seL4_IllegalOperation;
    return EXCEPTION_SYSCALL_ERROR;
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/ioport.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/ioport.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/ioport.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/ioport.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/ioport.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/ioport.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/ioport.c" 2
# 1 "./arch/api/invocation.h" 1
/* @LICENSE(OKL_CORE) */

/* This header was generated by kernel/tools/invocation_header_gen.py.
 *
 * To add an invocation call number, edit libsel4/include/interfaces/sel4.xml.
 *
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/ioport.c" 2

static exception_t
ensurePortOperationAllowed(cap_t cap, uint32_t start_port, uint32_t size)
{
    uint32_t first_allowed = cap_io_port_cap_get_capIOPortFirstPort(cap);
    uint32_t last_allowed = cap_io_port_cap_get_capIOPortLastPort(cap);
    uint32_t end_port = start_port + size - 1;
    ;
    ;

    if ((start_port < first_allowed) || (end_port > last_allowed)) {
       

                                                        ;
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
        ;
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
            ;
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
        ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (len > 0) {
        /* return the value read from the port */
        setRegister(ksCurThread, badgeRegister, 0);
        if (n_msgRegisters < 1) {
            word_t* ipcBuffer;
            ipcBuffer = lookupIPCBuffer(true, ksCurThread);
            if (ipcBuffer != ((void *)0)) {
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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/iospace.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/iospace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine/fpu.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/ioport.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pci.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c" 2






deriveCap_ret_t Arch_deriveCap(cte_t* slot, cap_t cap)
{
    deriveCap_ret_t ret;

    switch (cap_get_capType(cap)) {
    case cap_page_table_cap:
        if (cap_page_table_cap_get_capPTIsMapped(cap)) {
            ret.cap = cap;
            ret.status = EXCEPTION_NONE;
        } else {
            ;
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
            ;
            current_syscall_error.type = seL4_IllegalOperation;
            ret.cap = cap_null_cap_new();
            ret.status = EXCEPTION_SYSCALL_ERROR;
        }
        return ret;

    case cap_frame_cap:



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
# 91 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c"
    default:
        /* This assert has no equivalent in haskell,
         * as the options are restricted by type */
        halt();
    }
}

cap_t __attribute__((__const__)) Arch_updateCapData(bool_t preserve, word_t data, cap_t cap)
{
    switch (cap_get_capType(cap)) {
# 117 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c"
    case cap_io_port_cap: {
        io_port_capdata_t w = { .words = { data } };
        uint16_t firstPort = io_port_capdata_get_firstPort(w);
        uint16_t lastPort = io_port_capdata_get_lastPort(w);
        uint16_t capFirstPort = cap_io_port_cap_get_capIOPortFirstPort(cap);
        uint16_t capLastPort = cap_io_port_cap_get_capIOPortLastPort(cap);
        ;

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

cap_t __attribute__((__const__)) Arch_maskCapRights(cap_rights_t cap_rights_mask, cap_t cap)
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
                ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr(cap)))
            );
        }
        break;

    case cap_page_table_cap:
        if (final && cap_page_table_cap_get_capPTIsMapped(cap)) {
            unmapPageTable(
                cap_page_table_cap_get_capPTMappedASID(cap),
                cap_page_table_cap_get_capPTMappedAddress(cap),
                ((pte_t *)cap_page_table_cap_get_capPTBasePtr(cap))
            );
        }
        break;

    case cap_frame_cap:
        if (cap_frame_cap_get_capFMappedASID(cap)) {






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
                ((asid_pool_t*)cap_asid_pool_cap_get_capASIDPool(cap))
            );
        }
        break;
    case cap_asid_control_cap:
    case cap_io_port_cap:
        break;
# 215 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c"
    default:
        halt();
    }

    return cap_null_cap_new();
}

static cap_t __attribute__((__const__))
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
                ((pte_t *)cap_page_table_cap_get_capPTBasePtr(cap))
            );
        }
        Arch_finaliseCap(cap, is_final);
        if (is_final) {
            return resetMemMapping(cap);
        }
        return cap;

    case cap_page_directory_cap:
        capPtr = ((pde_t *)(cap_page_directory_cap_get_capPDBasePtr(cap)));
        memzero(capPtr, (0xe0000000 >> IA32_4M_bits) << 2);
        Arch_finaliseCap(cap, is_final);
        if (is_final) {
            return resetMemMapping(cap);
        }
        return cap;

    case cap_asid_control_cap:
        return cap;

    case cap_asid_pool_cap:
        base = cap_asid_pool_cap_get_capASIDBase(cap);
        ptr = ((asid_pool_t*)cap_asid_pool_cap_get_capASIDPool(cap));
        if (ia32KSASIDTable[base >> asidLowBits] == ptr) {
            deleteASIDPool(base, ptr);
            memzero(ptr, (1ul<<((asidLowBits + 2))));
            ia32KSASIDTable[base >> asidLowBits] = ptr;
        }
        return cap;

    case cap_io_port_cap:
        return cap;
# 301 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c"
    default:
        halt();
    }
}


bool_t __attribute__((__const__))
Arch_hasRecycleRights(cap_t cap)
{
    switch (cap_get_capType(cap)) {
    case cap_frame_cap:
        return cap_frame_cap_get_capFVMRights(cap) == VMReadWrite;

    default:
        return true;
    }
}


bool_t __attribute__((__const__)) Arch_sameRegionAs(cap_t cap_a, cap_t cap_b)
{
    switch (cap_get_capType(cap_a)) {
    case cap_frame_cap:
        if (cap_get_capType(cap_b) == cap_frame_cap) {
            word_t botA, botB, topA, topB;
            botA = cap_frame_cap_get_capFBasePtr(cap_a);
            botB = cap_frame_cap_get_capFBasePtr(cap_b);
            topA = botA + ((1ul<<(pageBitsForSize(cap_frame_cap_get_capFSize(cap_a))))-1ul);
            topB = botB + ((1ul<<(pageBitsForSize(cap_frame_cap_get_capFSize(cap_b))))-1ul);
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
# 381 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c"
    }

    return false;
}

bool_t __attribute__((__const__)) Arch_sameObjectAs(cap_t cap_a, cap_t cap_b)
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
        return 2 + 10;
    case seL4_IA32_PageDirectoryObject:
        return 2 + 10;




    default:
        halt();
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
                   IA32_4K, /* capFSize             */



                   (asidInvalid & ((1ul<<(asidLowBits))-1ul)), /* capFMappedASIDLow    */
                   0, /* capFMappedAddress    */
                   ((asidInvalid >> asidLowBits) & ((1ul<<(asidHighBits))-1ul)), /* capFMappedASIDHigh   */
                   VMReadWrite, /* capFVMRights         */
                   (word_t)regionBase /* capFBasePtr          */
               );

    case seL4_IA32_4M:
        memzero(regionBase, 1 << pageBitsForSize(IA32_4M));
        return cap_frame_cap_new(
                   IA32_4M, /* capFSize             */



                   (asidInvalid & ((1ul<<(asidLowBits))-1ul)), /* capFMappedASIDLow    */
                   0, /* capFMappedAddress    */
                   ((asidInvalid >> asidLowBits) & ((1ul<<(asidHighBits))-1ul)), /* capFMappedASIDHigh   */
                   VMReadWrite, /* capFVMRights         */
                   (word_t)regionBase /* capFBasePtr          */
               );

    case seL4_IA32_PageTableObject:
        memzero(regionBase, 1 << (10 + 2));
        return cap_page_table_cap_new(
                   0, /* capPTIsMapped        */
                   asidInvalid, /* capPTMappedASID      */
                   0, /* capPTMappedAddress   */
                   (word_t)regionBase /* capPTBasePtr         */
               );

    case seL4_IA32_PageDirectoryObject:
        memzero(regionBase, 1 << (10 + 2));
        copyGlobalMappings(regionBase);
        return cap_page_directory_cap_new(
                   0, /* capPTIsMapped    */
                   asidInvalid, /* capPDMappedASID  */
                   (word_t)regionBase /* capPTBasePtr     */
               );
# 483 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/objecttype.c"
    default:
        /*
         * This is a conflation of the haskell error: "Arch.createNewCaps
         * got an API type" and the case where an invalid object type is
         * passed (which is impossible in haskell).
         */
        halt();
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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/tcb.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/tcb.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/arch/ia32/object/tcb.c" 2

/* NOTE: offset is either 1 or 3 */
static inline unsigned int
setMRs_lookup_failure(tcb_t *receiver, word_t* receiveIPCBuffer, lookup_fault_t luf, unsigned int offset)
{
    word_t lufType = lookup_fault_get_lufType(luf);

    ;

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
        halt();
    }
}

unsigned int setMRs_fault(tcb_t *sender, tcb_t* receiver, word_t *receiveIPCBuffer)
{
    ;

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
        halt();
    }
}

unsigned int setMRs_syscall_error(tcb_t *thread, word_t *receiveIPCBuffer)
{
    ;

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
        halt();
    }
}

word_t __attribute__((__const__)) Arch_decodeTransfer(word_t flags)
{
    return 0;
}

exception_t __attribute__((__const__)) Arch_performTransfer(word_t arch, tcb_t *tcb_src, tcb_t *tcb_dest)
{
    return EXCEPTION_NONE;
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/assert.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/assert.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/assert.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/inlines.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/inlines.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/inlines.c" 2

lookup_fault_t current_lookup_fault;
fault_t current_fault;
syscall_error_t current_syscall_error;
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/boot.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/boot.c" 2

/* (node-local) state accessed only during bootstrapping */

ndks_boot_t ndks_boot __attribute__((__section__(".boot.node")));

__attribute__((__section__(".boot.text"))) bool_t
insert_region(region_t reg)
{
    unsigned int i;

    ;
    if (is_reg_empty(reg)) {
        return true;
    }
    for (i = 0; i < 2; i++) {
        if (is_reg_empty(ndks_boot.freemem[i])) {
            ndks_boot.freemem[i] = reg;
            return true;
        }
    }
    return false;
}

__attribute__((__section__(".boot.text"))) static inline uint32_t
reg_size(region_t reg)
{
    return reg.end - reg.start;
}

__attribute__((__section__(".boot.text"))) pptr_t
alloc_region(uint32_t size_bits)
{
    unsigned int i;
    unsigned int reg_index = 0; /* gcc cannot work out that this will not be used uninitialized */
    region_t reg = (region_t){ .start = 0, .end = 0 };
    region_t rem_small = (region_t){ .start = 0, .end = 0 };
    region_t rem_large = (region_t){ .start = 0, .end = 0 };
    region_t new_reg;
    region_t new_rem_small;
    region_t new_rem_large;

    /* Search for a freemem region that will be the best fit for an allocation. We favour allocations
     * that are aligned to either end of the region. If an allocation must split a region we favour
     * an unbalanced split. In both cases we attempt to use the smallest region possible. In general
     * this means we aim to make the size of the smallest remaining region smaller (ideally zero)
     * followed by making the size of the largest remaining region smaller */

    for (i = 0; i < 2; i++) {
        /* Determine whether placing the region at the start or the end will create a bigger left over region */
        if ((((((ndks_boot.freemem[i].start) - 1ul) >> (size_bits)) + 1ul) << (size_bits)) - ndks_boot.freemem[i].start <
                ndks_boot.freemem[i].end - (((ndks_boot.freemem[i].end) >> (size_bits)) << (size_bits))) {
            new_reg.start = (((((ndks_boot.freemem[i].start) - 1ul) >> (size_bits)) + 1ul) << (size_bits));
            new_reg.end = new_reg.start + (1ul<<(size_bits));
        } else {
            new_reg.end = (((ndks_boot.freemem[i].end) >> (size_bits)) << (size_bits));
            new_reg.start = new_reg.end - (1ul<<(size_bits));
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
        ((void)(0));
        return 0;
    }
    /* Remove the region in question */
    ndks_boot.freemem[reg_index] = (region_t){ .start = 0, .end = 0 };
    /* Add the remaining regions in largest to smallest order */
    insert_region(rem_large);
    if (!insert_region(rem_small)) {
        ((void)(0))
                                                               ;
    }
    return reg.start;
}

__attribute__((__section__(".boot.text"))) void
write_slot(slot_ptr_t slot_ptr, cap_t cap)
{
    slot_ptr->cap = cap;

    slot_ptr->cteMDBNode = mdb_node_new(0, false, false, 0);
    mdb_node_ptr_set_mdbRevocable (&slot_ptr->cteMDBNode, true);
    mdb_node_ptr_set_mdbFirstBadged(&slot_ptr->cteMDBNode, true);
}

/* Our root CNode needs to be able to fit all the initial caps and not
 * cover all of memory.
 */




__attribute__((__section__(".boot.text"))) cap_t
create_root_cnode(void)
{
    pptr_t pptr;
    cap_t cap;

    /* write the number of root CNode slots to global state */
    ndks_boot.slot_pos_max = (1ul<<(16));

    /* create an empty root CNode */
    pptr = alloc_region(16 + 4);
    if (!pptr) {
        ((void)(0));
        return cap_null_cap_new();
    }
    memzero(((cte_t *)(pptr)), 1U << (16 + 4));
    cap =
        cap_cnode_cap_new(
            16, /* radix      */
            32 - 16, /* guard size */
            0, /* guard      */
            pptr /* pptr       */
        );

    /* write the root CNode cap into the root CNode */
    write_slot((((slot_ptr_t)(pptr)) + (2 /* initial thread's root CNode cap */)), cap);

    return cap;
}



__attribute__((__section__(".boot.text"))) bool_t
create_irq_cnode(void)
{
    pptr_t pptr;
    /* create an empty IRQ CNode */
    pptr = alloc_region(12);
    if (!pptr) {
        ((void)(0));
        return false;
    }
    memzero((void*)pptr, 1 << 12);
    intStateIRQNode = (cte_t*)pptr;
    return true;
}

/* Check domain scheduler assumptions. */





__attribute__((__section__(".boot.text"))) void
create_domain_cap(cap_t root_cnode_cap)
{
    cap_t cap;
    unsigned int i;

    /* Check domain scheduler assumptions. */
    ;
    for (i = 0; i < ksDomScheduleLength; i++) {
        ;
        ;
    }

    cap = cap_domain_cap_new();
    write_slot((((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (11 /* domain cap */)), cap);
}


__attribute__((__section__(".boot.text"))) cap_t
create_ipcbuf_frame(cap_t root_cnode_cap, cap_t pd_cap, vptr_t vptr)
{
    cap_t cap;
    pptr_t pptr;

    /* allocate the IPC buffer frame */
    pptr = alloc_region(12);
    if (!pptr) {
        ((void)(0));
        return cap_null_cap_new();
    }
    clearMemory((void*)pptr, 12);

    /* create a cap of it and write it into the root CNode */
    cap = create_mapped_it_frame_cap(pd_cap, pptr, vptr, 1 /* initial thread's ASID */, false);
    write_slot((((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (10 /* initial thread's IPC buffer frame cap */)), cap);

    return cap;
}

__attribute__((__section__(".boot.text"))) void
create_bi_frame_cap(
    cap_t root_cnode_cap,
    cap_t pd_cap,
    pptr_t pptr,
    vptr_t vptr
)
{
    cap_t cap;

    /* create a cap of it and write it into the root CNode */
    cap = create_mapped_it_frame_cap(pd_cap, pptr, vptr, 1 /* initial thread's ASID */, false);
    write_slot((((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (9 /* bootinfo frame cap */)), cap);
}

__attribute__((__section__(".boot.text"))) pptr_t
allocate_bi_frame(
    node_id_t node_id,
    uint32_t num_nodes,
    vptr_t ipcbuf_vptr
)
{
    pptr_t pptr;

    /* create the bootinfo frame object */
    pptr = alloc_region(12);
    if (!pptr) {
        ((void)(0));
        return 0;
    }
    clearMemory((void*)pptr, 12);

    /* initialise bootinfo-related global state */
    ndks_boot.bi_frame = ((bi_t*)(pptr));
    ndks_boot.slot_pos_cur = 12 /* slot where dynamically allocated caps start */;

    ((bi_t*)(pptr))->node_id = node_id;
    ((bi_t*)(pptr))->num_nodes = num_nodes;
    ((bi_t*)(pptr))->num_iopt_levels = 0;
    ((bi_t*)(pptr))->ipcbuf_vptr = ipcbuf_vptr;
    ((bi_t*)(pptr))->it_cnode_size_bits = 16;
    ((bi_t*)(pptr))->it_domain = (uint8_t)ksDomSchedule[ksDomScheduleIdx].domain;

    return pptr;
}

__attribute__((__section__(".boot.text"))) bool_t
provide_cap(cap_t root_cnode_cap, cap_t cap)
{
    if (ndks_boot.slot_pos_cur >= ndks_boot.slot_pos_max) {
        ((void)(0));
        return false;
    }
    write_slot((((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (ndks_boot.slot_pos_cur)), cap);
    ndks_boot.slot_pos_cur++;
    return true;
}

__attribute__((__section__(".boot.text"))) create_frames_of_region_ret_t
create_frames_of_region(
    cap_t root_cnode_cap,
    cap_t pd_cap,
    region_t reg,
    bool_t do_map,
    int32_t pv_offset
)
{
    pptr_t f;
    cap_t frame_cap;
    slot_pos_t slot_pos_before;
    slot_pos_t slot_pos_after;

    slot_pos_before = ndks_boot.slot_pos_cur;

    for (f = reg.start; f < reg.end; f += (1ul<<(12))) {
        if (do_map) {
            frame_cap = create_mapped_it_frame_cap(pd_cap, f, f - (0xe0000000 - 0x00000000) - pv_offset, 1 /* initial thread's ASID */, false);
        } else {
            frame_cap = create_unmapped_it_frame_cap(f, false);
        }
        if (!provide_cap(root_cnode_cap, frame_cap))
            return (create_frames_of_region_ret_t) {
            (slot_region_t){ .start = 0, .end = 0 }, false
        };
    }

    slot_pos_after = ndks_boot.slot_pos_cur;

    return (create_frames_of_region_ret_t) {
        (slot_region_t) { slot_pos_before, slot_pos_after }, true
    };
}

__attribute__((__section__(".boot.text"))) cap_t
create_it_asid_pool(cap_t root_cnode_cap)
{
    pptr_t ap_pptr;
    cap_t ap_cap;

    /* create ASID pool */
    ap_pptr = alloc_region((asidLowBits + 2));
    if (!ap_pptr) {
        ((void)(0));
        return cap_null_cap_new();
    }
    memzero(((asid_pool_t*)ap_pptr), 1 << (asidLowBits + 2));
    ap_cap = cap_asid_pool_cap_new(1 /* initial thread's ASID */ >> asidLowBits, ap_pptr);
    write_slot((((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (6 /* initial thread's ASID pool cap */)), ap_cap);

    /* create ASID control cap */
    write_slot(
        (((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (5 /* global ASID controller cap */)),
        cap_asid_control_cap_new()
    );

    return ap_cap;
}

__attribute__((__section__(".boot.text"))) bool_t
create_idle_thread(void)
{
    pptr_t pptr;
    pptr = alloc_region(10);
    if (!pptr) {
        ((void)(0));
        return false;
    }
    memzero((void *)pptr, 1 << 10);
    ksIdleThread = ((tcb_t *)(pptr + (1 << (4 + 4))));
    configureIdleThread(ksIdleThread);
    return true;
}

__attribute__((__section__(".boot.text"))) bool_t
create_initial_thread(
    cap_t root_cnode_cap,
    cap_t it_pd_cap,
    vptr_t ui_v_entry,
    vptr_t bi_frame_vptr,
    vptr_t ipcbuf_vptr,
    cap_t ipcbuf_cap
)
{
    pptr_t pptr;
    cap_t cap;
    tcb_t* tcb;

    /* allocate TCB */
    pptr = alloc_region(10);
    if (!pptr) {
        ((void)(0));
        return false;
    }
    memzero((void*)pptr, 1 << 10);
    tcb = ((tcb_t *)(pptr + (1 << (4 + 4))));
    tcb->tcbTimeSlice = 1;
    Arch_initContext(&tcb->tcbContext);

    /* initialise TCB (corresponds directly to abstract specification) */
    cteInsert(
        root_cnode_cap,
        (((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (2 /* initial thread's root CNode cap */)),
        (((slot_ptr_t)(pptr)) + (tcbCTable))
    );
    cteInsert(
        it_pd_cap,
        (((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (3 /* initial thread's PD cap */)),
        (((slot_ptr_t)(pptr)) + (tcbVTable))
    );
    cteInsert(
        ipcbuf_cap,
        (((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (10 /* initial thread's IPC buffer frame cap */)),
        (((slot_ptr_t)(pptr)) + (tcbBuffer))
    );
    tcb->tcbIPCBuffer = ipcbuf_vptr;
    setRegister(tcb, capRegister, bi_frame_vptr);
    setNextPC(tcb, ui_v_entry);

    /* initialise TCB */
    tcb->tcbPriority = seL4_MaxPrio;
    setupReplyMaster(tcb);
    setThreadState(tcb, ThreadState_Running);
    ksSchedulerAction = ((tcb_t*)0);
    ksCurThread = ksIdleThread;
    ksCurDomain = ksDomSchedule[ksDomScheduleIdx].domain;
    ksDomainTime = ksDomSchedule[ksDomScheduleIdx].length;
    ;

    /* initialise current thread pointer */
    switchToThread(tcb); /* initialises ksCurThread */

    /* create initial thread's TCB cap */
    cap = cap_thread_cap_new(((unsigned int)tcb));
    write_slot((((slot_ptr_t)((pptr_t)cap_get_capPtr(root_cnode_cap))) + (1 /* initial thread's TCB cap */)), cap);

    return true;
}

__attribute__((__section__(".boot.text"))) static bool_t
provide_untyped_cap(
    cap_t root_cnode_cap,
    pptr_t pptr,
    uint32_t size_bits,
    slot_pos_t first_untyped_slot
)
{
    bool_t ret;
    unsigned int i = ndks_boot.slot_pos_cur - first_untyped_slot;
    if (i < 167) {
        ndks_boot.bi_frame->ut_obj_paddr_list[i] = pptr_to_paddr((void*)pptr);
        ndks_boot.bi_frame->ut_obj_size_bits_list[i] = size_bits;
        ret = provide_cap(root_cnode_cap, cap_untyped_cap_new(0, size_bits, pptr));
    } else {
        ((void)(0));
        ret = true;
    }
    return ret;
}

/**
  DONT_TRANSLATE
*/
__attribute__((__section__(".boot.text"))) static uint32_t boot_clz (uint32_t x)
{
    return __builtin_clz(x);
}

/**
  DONT_TRANSLATE
*/
__attribute__((__section__(".boot.text"))) static uint32_t boot_ctz (uint32_t x)
{
    return __builtin_ctz(x);
}

__attribute__((__section__(".boot.text"))) static bool_t
create_untypeds_for_region(
    cap_t root_cnode_cap,
    region_t reg,
    slot_pos_t first_untyped_slot
)
{
    uint32_t align_bits;
    uint32_t size_bits;

    while (!is_reg_empty(reg)) {
        /* Determine the maximum size of the region */
        size_bits = (8 * sizeof(word_t)) - 1 - boot_clz(reg.end - reg.start);

        /* Determine the alignment of the region */
        align_bits = boot_ctz(reg.start);

        /* Reduce size bits to align if needed */
        if (align_bits < size_bits) {
            size_bits = align_bits;
        }

        ;
        if (!provide_untyped_cap(root_cnode_cap, reg.start, size_bits, first_untyped_slot)) {
            return false;
        }
        reg.start += (1ul<<(size_bits));
    }
    return true;
}

__attribute__((__section__(".boot.text"))) bool_t
create_untypeds(cap_t root_cnode_cap, region_t boot_mem_reuse_reg)
{
    slot_pos_t slot_pos_before;
    slot_pos_t slot_pos_after;
    uint32_t i;
    region_t reg;

    slot_pos_before = ndks_boot.slot_pos_cur;

    /* if boot_mem_reuse_reg is not empty, we can create UT objs from boot code/data frames */
    if (!create_untypeds_for_region(root_cnode_cap, boot_mem_reuse_reg, slot_pos_before)) {
        return false;
    }

    /* convert remaining freemem into UT objects and provide the caps */
    for (i = 0; i < 2; i++) {
        reg = ndks_boot.freemem[i];
        ndks_boot.freemem[i] = (region_t){ .start = 0, .end = 0 };
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

__attribute__((__section__(".boot.text"))) void
bi_finalise(void)
{
    slot_pos_t slot_pos_start = ndks_boot.slot_pos_cur;
    slot_pos_t slot_pos_end = ndks_boot.slot_pos_max;
    ndks_boot.bi_frame->null_caps = (slot_region_t) {
        slot_pos_start, slot_pos_end
    };
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/cspace.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/cspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/cspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/cspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/cspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/cspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/cspace.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/cspace.c" 2

lookupCap_ret_t
lookupCap(tcb_t *thread, cptr_t cPtr)
{
    lookupSlot_raw_ret_t lu_ret;
    lookupCap_ret_t ret;

    lu_ret = lookupSlot(thread, cPtr);
    if (__builtin_expect(!!(lu_ret.status != EXCEPTION_NONE), 0)) {
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
    if (__builtin_expect(!!(lu_ret.status != EXCEPTION_NONE), 0)) {
        ret.status = lu_ret.status;
        ret.slot = ((void *)0);
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

    threadRoot = (((cte_t *)((unsigned int)thread&~((1ul<<(10))-1ul)))+tcbCTable)->cap;
    res_ret = resolveAddressBits(threadRoot, capptr, 32);

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

    ret.slot = ((void *)0);

    if (__builtin_expect(!!(cap_get_capType(root) != cap_cnode_cap), 0)) {
        current_syscall_error.type = seL4_FailedLookup;
        current_syscall_error.failedLookupWasSource = isSource;
        current_lookup_fault = lookup_fault_invalid_root_new();
        ret.status = EXCEPTION_SYSCALL_ERROR;
        return ret;
    }

    if (__builtin_expect(!!(depth < 1 || depth > 32), 0)) {
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 1;
        current_syscall_error.rangeErrorMax = 32;
        ret.status = EXCEPTION_SYSCALL_ERROR;
        return ret;
    }

    res_ret = resolveAddressBits(root, capptr, depth);
    if (__builtin_expect(!!(res_ret.status != EXCEPTION_NONE), 0)) {
        current_syscall_error.type = seL4_FailedLookup;
        current_syscall_error.failedLookupWasSource = isSource;
        /* current_lookup_fault will have been set by resolveAddressBits */
        ret.status = EXCEPTION_SYSCALL_ERROR;
        return ret;
    }

    if (__builtin_expect(!!(res_ret.bitsRemaining != 0), 0)) {
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
    ret.slot = ((void *)0);

    if (__builtin_expect(!!(cap_get_capType(nodeCap) != cap_cnode_cap), 0)) {
        current_lookup_fault = lookup_fault_invalid_root_new();
        ret.status = EXCEPTION_LOOKUP_FAULT;
        return ret;
    }

    while (1) {
        radixBits = cap_cnode_cap_get_capCNodeRadix(nodeCap);
        guardBits = cap_cnode_cap_get_capCNodeGuardSize(nodeCap);
        levelBits = radixBits + guardBits;

        /* Haskell error: "All CNodes must resolve bits" */
        ;

        capGuard = cap_cnode_cap_get_capCNodeGuard(nodeCap);

        /* sjw --- the MASK(5) here is to avoid the case where n_bits = 32
           and guardBits = 0, as it violates the C spec to >> by more
           than 31 */
        guard = (capptr >> ((n_bits - guardBits) & ((1ul<<(5))-1ul))) & ((1ul<<(guardBits))-1ul);
        if (__builtin_expect(!!(guardBits > n_bits || guard != capGuard), 0)) {
            current_lookup_fault =
                lookup_fault_guard_mismatch_new(capGuard, n_bits, guardBits);
            ret.status = EXCEPTION_LOOKUP_FAULT;
            return ret;
        }

        if (__builtin_expect(!!(levelBits > n_bits), 0)) {
            current_lookup_fault =
                lookup_fault_depth_mismatch_new(levelBits, n_bits);
            ret.status = EXCEPTION_LOOKUP_FAULT;
            return ret;
        }

        offset = (capptr >> (n_bits - levelBits)) & ((1ul<<(radixBits))-1ul);
        slot = ((cte_t *)(cap_cnode_cap_get_capCNodePtr(nodeCap))) + offset;

        if (__builtin_expect(!!(n_bits <= levelBits), 1)) {
            ret.status = EXCEPTION_NONE;
            ret.slot = slot;
            ret.bitsRemaining = 0;
            return ret;
        }

        n_bits -= levelBits;
        nodeCap = slot->cap;

        if (__builtin_expect(!!(cap_get_capType(nodeCap) != cap_cnode_cap), 0)) {
            ret.status = EXCEPTION_NONE;
            ret.slot = slot;
            ret.bitsRemaining = n_bits;
            return ret;
        }
    }

    ret.status = EXCEPTION_NONE;
    return ret;
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/faulthandler.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/faulthandler.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/faulthandler.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/faulthandler.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/faulthandler.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/faulthandler.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/faulthandler.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/faulthandler.c" 2

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
    cap_t handlerCap;
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
                ((endpoint_t *)cap_endpoint_cap_get_capEPPtr(handlerCap)));

        return EXCEPTION_NONE;
    } else {
        current_fault = fault_cap_fault_new(handlerCPtr, false);
        current_lookup_fault = lookup_fault_missing_capability_new(0);

        return EXCEPTION_FAULT;
    }
}
# 104 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/faulthandler.c"
/* The second fault, ex2, is stored in the global current_fault */
void
handleDoubleFault(tcb_t *tptr, fault_t ex1)
{
# 118 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/faulthandler.c"
    setThreadState(tptr, ThreadState_Inactive);
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/faults.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/kernel/thread.c" 2

static message_info_t
transferCaps(message_info_t info, extra_caps_t caps,
             endpoint_t *endpoint, tcb_t *receiver,
             word_t *receiveBuffer, bool_t diminish);

static inline bool_t __attribute__((__pure__))
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

static inline bool_t __attribute__((__pure__))
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

__attribute__((__section__(".boot.text"))) void
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
        halt();
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

    if (__builtin_expect(!!(!fault_get_faultType(sender->tcbFault) != fault_null_fault), 1)) {
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
   
                                      ;

    if (__builtin_expect(!!(fault_get_faultType(receiver->tcbFault) == fault_null_fault), 1)) {
        doIPCTransfer(sender, ((void *)0), 0, true, receiver, false);
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
        if (__builtin_expect(!!(status != EXCEPTION_NONE), 0)) {
            caps.excaprefs[0] = ((void *)0);
        }
    } else {
        caps = current_extra_caps;
        caps.excaprefs[0] = ((void *)0);
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

    if (__builtin_expect(!!(!caps.excaprefs[0] || !receiveBuffer), 1)) {
        return info;
    }

    destSlot = getReceiveSlots(receiver, receiveBuffer);

    for (i = 0; i < ((1ul<<(seL4_MsgExtraCapBits))-1) && caps.excaprefs[i] != ((void *)0); i++) {
        cte_t *slot = caps.excaprefs[i];
        cap_t cap = slot->cap;

        if (cap_get_capType(cap) == cap_endpoint_cap &&
                ((endpoint_t *)cap_endpoint_cap_get_capEPPtr(cap)) == endpoint) {
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
                dc_ret = deriveCap(slot, maskCapRights(cap_rights_new(true, true, false), cap));
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

            destSlot = ((void *)0);
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
        if (ipcBuffer != ((void *)0)) {
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
    if (action == (word_t)((tcb_t*)~0)) {
        if (isRunnable(ksCurThread)) {
            tcbSchedEnqueue(ksCurThread);
        }
        if (ksDomainTime == 0) {
            nextDomain();
        }
        chooseThread();
        ksSchedulerAction = ((tcb_t*)0);
    } else if (action != (word_t)((tcb_t*)0)) {
        if (isRunnable(ksCurThread)) {
            tcbSchedEnqueue(ksCurThread);
        }
        /* SwitchToThread */
        switchToThread(ksSchedulerAction);
        ksSchedulerAction = ((tcb_t*)0);
    }
}

void
chooseThread(void)
{
    int p;
    tcb_t *thread;

    for (p = seL4_MaxPrio; p != -1; p--) {
        unsigned int domprio = ksCurDomain * 256 + p;
        thread = ksReadyQueues[domprio].head;
        if (thread != ((void *)0)) {
            ;
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
                && action == ((tcb_t*)0)) {
            ksSchedulerAction = target;
        } else {
            tcbSchedEnqueue(target);
        }
        if (action != ((tcb_t*)0)
                && action != ((tcb_t*)~0)) {
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
            ksSchedulerAction == ((tcb_t*)0) &&
            !isRunnable(tptr)) {
        rescheduleRequired();
    }
}

void
timerTick(void)
{
    if (__builtin_expect(!!(thread_state_get_tsType(ksCurThread->tcbState) == ThreadState_Running), 1)
                                   ) {
        if (ksCurThread->tcbTimeSlice > 1) {
            ksCurThread->tcbTimeSlice--;
        } else {
            ksCurThread->tcbTimeSlice = 1;
            tcbSchedAppend(ksCurThread);
            rescheduleRequired();
        }
    }

    if (1 > 1) {
        ksDomainTime--;
        if (ksDomainTime == 0) {
            rescheduleRequired();
        }
    }
}

void
rescheduleRequired(void)
{
    if (ksSchedulerAction != ((tcb_t*)0)
            && ksSchedulerAction != ((tcb_t*)~0)) {
        tcbSchedEnqueue(ksSchedulerAction);
    }
    ksSchedulerAction = ((tcb_t*)~0);
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/preemption.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/preemption.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/preemption.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */




# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/preemption.h" 2

exception_t preemptionPoint(void);
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/preemption.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/preemption.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/preemption.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/preemption.c" 2

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
    if (ksWorkUnitsCompleted >= 100) {
        ksWorkUnitsCompleted = 0;
        if (isIRQPending()) {
            return EXCEPTION_PREEMPTED;
        }
    }

    return EXCEPTION_NONE;
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/statedata.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/statedata.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/statedata.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/statedata.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/statedata.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/model/statedata.c" 2

/* Pointer to the head of the scheduler queue for each priority */
tcb_queue_t ksReadyQueues[(1 * 256)];

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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/asyncendpoint.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/asyncendpoint.c" 2

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/asyncendpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/asyncendpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/asyncendpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/asyncendpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/asyncendpoint.c" 2

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/asyncendpoint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/asyncendpoint.c" 2

static inline tcb_queue_t __attribute__((__pure__))
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
        ;

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

    aepptr = ((async_endpoint_t *)cap_async_endpoint_cap_get_capAEPPtr(cap));

    switch (async_endpoint_ptr_get_state(aepptr)) {
    case AEPState_Idle:
    case AEPState_Waiting: {
        tcb_queue_t aep_queue;

        /* Block thread on endpoint */
        thread_state_ptr_set_tsType(&thread->tcbState,
                                    ThreadState_BlockedOnAsyncEvent);
        thread_state_ptr_set_blockingIPCEndpoint(&thread->tcbState,
                                                 ((unsigned int)aepptr));
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
        tcb_t *thread = ((tcb_t *)(async_endpoint_ptr_get_aepQueue_head(aepptr)));

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
    ;

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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "./api/invocation.h" 1
/* @LICENSE(OKL_CORE) */

/* This header was generated by kernel/tools/invocation_header_gen.py.
 *
 * To add an invocation call number, edit libsel4/include/interfaces/sel4.xml.
 *
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/untyped.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 25 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/preemption.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 26 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 27 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 28 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/cnode.c" 2

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
    ;

    if (label < CNodeRevoke || label > CNodeSaveCaller) {
        ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (length < 2) {
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }
    index = getSyscallArg(0, buffer);
    w_bits = getSyscallArg(1, buffer);

    lu_ret = lookupTargetSlot(cap, index, w_bits);
    if (lu_ret.status != EXCEPTION_NONE) {
        ;
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

        if (length < 4 || extraCaps.excaprefs[0] == ((void *)0)) {
            ;
            current_syscall_error.type = seL4_TruncatedMessage;
            return EXCEPTION_SYSCALL_ERROR;
        }
        srcIndex = getSyscallArg(2, buffer);
        srcDepth = getSyscallArg(3, buffer);

        srcRoot = extraCaps.excaprefs[0]->cap;

        status = ensureEmptySlot(destSlot);
        if (status != EXCEPTION_NONE) {
            ;
            return status;
        }

        lu_ret = lookupSourceSlot(srcRoot, srcIndex, srcDepth);
        if (lu_ret.status != EXCEPTION_NONE) {
            ;
            return lu_ret.status;
        }
        srcSlot = lu_ret.slot;

        if (cap_get_capType(srcSlot->cap) == cap_null_cap) {
            ;
            current_syscall_error.type = seL4_FailedLookup;
            current_syscall_error.failedLookupWasSource = 1;
            current_lookup_fault =
                lookup_fault_missing_capability_new(srcDepth);
            return EXCEPTION_SYSCALL_ERROR;
        }

        switch (label) {
        case CNodeCopy:

            if (length < 5) {
                ;
                current_syscall_error.type = seL4_TruncatedMessage;
                return EXCEPTION_SYSCALL_ERROR;
            }

            cap_rights = rightsFromWord(getSyscallArg(4, buffer));
            srcCap = maskCapRights(cap_rights, srcSlot->cap);
            dc_ret = deriveCap(srcSlot, srcCap);
            if (dc_ret.status != EXCEPTION_NONE) {
                ;
                return dc_ret.status;
            }
            newCap = dc_ret.cap;
            isMove = false;

            break;

        case CNodeMint:
            if (length < 6) {
                ;
                current_syscall_error.type = seL4_TruncatedMessage;
                return EXCEPTION_SYSCALL_ERROR;
            }

            cap_rights = rightsFromWord(getSyscallArg(4, buffer));
            capData = getSyscallArg(5, buffer);
            srcCap = maskCapRights(cap_rights, srcSlot->cap);
            dc_ret = deriveCap(srcSlot,
                               updateCapData(false, capData, srcCap));
            if (dc_ret.status != EXCEPTION_NONE) {
                ;
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
                ;
                current_syscall_error.type = seL4_TruncatedMessage;
                return EXCEPTION_SYSCALL_ERROR;
            }

            capData = getSyscallArg(4, buffer);
            newCap = updateCapData(true, capData, srcSlot->cap);
            isMove = true;

            break;

        default:
            ;
            return EXCEPTION_NONE;
        }

        if (cap_get_capType(newCap) == cap_null_cap) {
            ;
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
            ;
            return status;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        return invokeCNodeSaveCaller(destSlot);
    }

    if (label == CNodeRecycle) {
        if (!hasRecycleRights(destSlot->cap)) {
            ;
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

        if (length < 8 || extraCaps.excaprefs[0] == ((void *)0)
                || extraCaps.excaprefs[1] == ((void *)0)) {
            current_syscall_error.type = seL4_TruncatedMessage;
            return EXCEPTION_SYSCALL_ERROR;
        }
        pivotNewData = getSyscallArg(2, buffer);
        pivotIndex = getSyscallArg(3, buffer);
        pivotDepth = getSyscallArg(4, buffer);
        srcNewData = getSyscallArg(5, buffer);
        srcIndex = getSyscallArg(6, buffer);
        srcDepth = getSyscallArg(7, buffer);

        pivotRoot = extraCaps.excaprefs[0]->cap;
        srcRoot = extraCaps.excaprefs[1]->cap;

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
            ;
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
            ;
            current_syscall_error.type = seL4_IllegalOperation;
            return EXCEPTION_SYSCALL_ERROR;
        }

        if (cap_get_capType(newPivotCap) == cap_null_cap) {
            ;
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

    srcSlot = (((cte_t *)((unsigned int)ksCurThread&~((1ul<<(10))-1ul)))+tcbCaller);
    cap = srcSlot->cap;

    switch (cap_get_capType(cap)) {
    case cap_null_cap:
        ;
        break;

    case cap_reply_cap:
        if (!cap_reply_cap_get_capReplyMaster(cap)) {
            cteMove(cap, srcSlot, destSlot);
        }
        break;

    default:
        halt();
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
                                                 ((1ul<<((cap_untyped_cap_get_capBlockSize(srcCap)) - 4))));
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

    newMDB = mdb_node_set_mdbPrev(srcMDB, ((unsigned int)srcSlot));
    newMDB = mdb_node_set_mdbRevocable(newMDB, newCapIsRevocable);
    newMDB = mdb_node_set_mdbFirstBadged(newMDB, newCapIsRevocable);

    /* Haskell error: "cteInsert to non-empty destination" */
    ;
    /* Haskell error: "cteInsert: mdb entry must be empty" */
   
                                                                      ;

    /* Prevent parent untyped cap from being used again if creating a child
     * untyped from it. */
    setUntypedCapAsFull(srcCap, newCap, srcSlot);

    destSlot->cap = newCap;
    destSlot->cteMDBNode = newMDB;
    mdb_node_ptr_set_mdbNext(&srcSlot->cteMDBNode, ((unsigned int)destSlot));
    if (mdb_node_get_mdbNext(newMDB)) {
        mdb_node_ptr_set_mdbPrev(
            &((cte_t *)(mdb_node_get_mdbNext(newMDB)))->cteMDBNode,
            ((unsigned int)destSlot));
    }
}

void
cteMove(cap_t newCap, cte_t *srcSlot, cte_t *destSlot)
{
    mdb_node_t mdb;
    uint32_t prev_ptr, next_ptr;

    /* Haskell error: "cteMove to non-empty destination" */
    ;
    /* Haskell error: "cteMove: mdb entry must be empty" */
   
                                                                      ;

    mdb = srcSlot->cteMDBNode;
    destSlot->cap = newCap;
    srcSlot->cap = cap_null_cap_new();
    destSlot->cteMDBNode = mdb;
    srcSlot->cteMDBNode = mdb_node_new(0, false, false, 0);

    prev_ptr = mdb_node_get_mdbPrev(mdb);
    if (prev_ptr)
        mdb_node_ptr_set_mdbNext(
            &((cte_t *)(prev_ptr))->cteMDBNode,
            ((unsigned int)destSlot));

    next_ptr = mdb_node_get_mdbNext(mdb);
    if (next_ptr)
        mdb_node_ptr_set_mdbPrev(
            &((cte_t *)(next_ptr))->cteMDBNode,
            ((unsigned int)destSlot));
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
            &((cte_t *)(prev_ptr))->cteMDBNode,
            ((unsigned int)slot2));

    next_ptr = mdb_node_get_mdbNext(mdb1);
    if (next_ptr)
        mdb_node_ptr_set_mdbPrev(
            &((cte_t *)(next_ptr))->cteMDBNode,
            ((unsigned int)slot2));

    mdb2 = slot2->cteMDBNode;
    slot1->cteMDBNode = mdb2;
    slot2->cteMDBNode = mdb1;

    prev_ptr = mdb_node_get_mdbPrev(mdb2);
    if (prev_ptr)
        mdb_node_ptr_set_mdbNext(
            &((cte_t *)(prev_ptr))->cteMDBNode,
            ((unsigned int)slot1));

    next_ptr = mdb_node_get_mdbNext(mdb2);
    if (next_ptr)
        mdb_node_ptr_set_mdbPrev(
            &((cte_t *)(next_ptr))->cteMDBNode,
            ((unsigned int)slot1));
}

exception_t
cteRevoke(cte_t *slot)
{
    cte_t *nextPtr;
    exception_t status;

    /* there is no need to check for a NullCap as NullCaps are
       always accompanied by null mdb pointers */
    for (nextPtr = ((cte_t *)(mdb_node_get_mdbNext(slot->cteMDBNode)));
            nextPtr && isMDBParentOf(slot, nextPtr);
            nextPtr = ((cte_t *)(mdb_node_get_mdbNext(slot->cteMDBNode)))) {
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
        prev = ((cte_t *)(mdb_node_get_mdbPrev(mdbNode)));
        next = ((cte_t *)(mdb_node_get_mdbNext(mdbNode)));

        if (prev) {
            mdb_node_ptr_set_mdbNext(&prev->cteMDBNode, ((unsigned int)next));
        }
        if (next) {
            mdb_node_ptr_set_mdbPrev(&next->cteMDBNode, ((unsigned int)prev));
        }
        if (next)
            mdb_node_ptr_set_mdbFirstBadged(&next->cteMDBNode,
                                            mdb_node_get_mdbFirstBadged(next->cteMDBNode) ||
                                            mdb_node_get_mdbFirstBadged(mdbNode));
        slot->cap = cap_null_cap_new();
        slot->cteMDBNode = mdb_node_new(0, false, false, 0);

        if (irq != irqInvalid) {
            deletedIRQHandler(irq);
        }
    }
}

static inline bool_t __attribute__((__const__))
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
        halt();
    }
}

static inline bool_t __attribute__((__const__))
capCyclicZombie(cap_t cap, cte_t *slot)
{
    return cap_get_capType(cap) == cap_zombie_cap &&
           ((cte_t *)(cap_zombie_cap_get_capZombiePtr(cap))) == slot;
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

    ;
    ptr = (cte_t*)cap_zombie_cap_get_capZombiePtr(slot->cap);
    n = cap_zombie_cap_get_capZombieNumber(slot->cap);
    type = cap_zombie_cap_get_capZombieType(slot->cap);

    /* Haskell error: "reduceZombie: expected unremovable zombie" */
    ;

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
                ;
                slot->cap =
                    cap_zombie_cap_set_capZombieNumber(slot->cap, n - 1);
            } else {
                /* Haskell error:
                 * "Expected new Zombie to be self-referential."
                 */
                ;
            }
            break;
        }

        default:
            halt();
        }
    } else {
        /* Haskell error: "Cyclic zombie passed to unexposed reduceZombie" */
        ;

        if (cap_get_capType(ptr->cap) == cap_zombie_cap) {
            /* Haskell error: "Moving self-referential Zombie aside." */
            ;
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
        finaliseCap_ret_t fc_ret __attribute__((unused));

        final = isFinalCapability(slot);
        fc_ret = finaliseCap(slot->cap, final, true);
        /* Haskell error: "cteDeleteOne: cap should be removable" */
       
                                        ;
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

    next = ((cte_t *)(mdb_node_get_mdbNext(parent->cteMDBNode)));
    slot->cap = cap;
    slot->cteMDBNode = mdb_node_new(((unsigned int)next), true, true, ((unsigned int)parent));
    if (next) {
        mdb_node_ptr_set_mdbPrev(&next->cteMDBNode, ((unsigned int)slot));
    }
    mdb_node_ptr_set_mdbNext(&parent->cteMDBNode, ((unsigned int)slot));
}

void
setupReplyMaster(tcb_t *thread)
{
    cte_t *slot;

    slot = (((cte_t *)((unsigned int)thread&~((1ul<<(10))-1ul)))+tcbReply);
    if (cap_get_capType(slot->cap) == cap_null_cap) {
        /* Haskell asserts that no reply caps exist for this thread here. This
         * cannot be translated. */
        slot->cap = cap_reply_cap_new(true, ((unsigned int)thread));
        slot->cteMDBNode = mdb_node_new(0, false, false, 0);
        mdb_node_ptr_set_mdbRevocable(&slot->cteMDBNode, true);
        mdb_node_ptr_set_mdbFirstBadged(&slot->cteMDBNode, true);
    }
}

bool_t __attribute__((__pure__))
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

        next = ((cte_t *)(mdb_node_get_mdbNext(slot->cteMDBNode)));
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

bool_t __attribute__((__pure__))
isFinalCapability(cte_t *cte)
{
    mdb_node_t mdb;
    bool_t prevIsSameObject;

    mdb = cte->cteMDBNode;

    if (mdb_node_get_mdbPrev(mdb) == 0) {
        prevIsSameObject = false;
    } else {
        cte_t *prev;

        prev = ((cte_t *)(mdb_node_get_mdbPrev(mdb)));
        prevIsSameObject = sameObjectAs(prev->cap, cte->cap);
    }

    if (prevIsSameObject) {
        return false;
    } else {
        if (mdb_node_get_mdbNext(mdb) == 0) {
            return true;
        } else {
            cte_t *next;

            next = ((cte_t *)(mdb_node_get_mdbNext(mdb)));
            return !sameObjectAs(cte->cap, next->cap);
        }
    }
}

bool_t __attribute__((__pure__))
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
        return ((void *)0);
    }

    ct = loadCapTransfer(buffer);
    cptr = ct.ctReceiveRoot;

    luc_ret = lookupCap(thread, cptr);
    if (luc_ret.status != EXCEPTION_NONE) {
        return ((void *)0);
    }
    cnode = luc_ret.cap;

    lus_ret = lookupTargetSlot(cnode, ct.ctReceiveIndex, ct.ctReceiveDepth);
    if (lus_ret.status != EXCEPTION_NONE) {
        return ((void *)0);
    }
    slot = lus_ret.slot;

    if (cap_get_capType(slot->cap) != cap_null_cap) {
        return ((void *)0);
    }

    return slot;
}

cap_transfer_t __attribute__((__pure__))
loadCapTransfer(word_t *buffer)
{
    const int offset = 120 + ((1ul<<(seL4_MsgExtraCapBits))-1) + 2;
    return capTransferFromWords(buffer + offset);
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/registerset.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/asyncendpoint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/endpoint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/endpoint.c" 2

static inline tcb_queue_t __attribute__((__pure__))
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
                &thread->tcbState, ((unsigned int)epptr));
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
        ;

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
    ;

    epptr = ((endpoint_t *)cap_endpoint_cap_get_capEPPtr(cap));
    diminish = !cap_endpoint_cap_get_capCanSend(cap);

    switch (endpoint_ptr_get_state(epptr)) {
    case EPState_Idle:
    case EPState_Recv: {
        tcb_queue_t queue;

        /* Set thread state to BlockedOnReceive */
        thread_state_ptr_set_tsType(&thread->tcbState,
                                    ThreadState_BlockedOnReceive);
        thread_state_ptr_set_blockingIPCEndpoint(
            &thread->tcbState, ((unsigned int)epptr));
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
        ;

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

        epptr = ((endpoint_t *)thread_state_ptr_get_blockingIPCEndpoint(state));

        /* Haskell error "blockedIPCCancel: endpoint must not be idle" */
        ;

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
                       ((async_endpoint_t *)thread_state_ptr_get_blockingIPCEndpoint(state)));
        break;

    case ThreadState_BlockedOnReply: {
        cte_t *slot, *callerCap;

        fault_null_fault_ptr_new(&tptr->tcbFault);

        /* Get the reply cap slot */
        slot = (((cte_t *)((unsigned int)tptr&~((1ul<<(10))-1ul)))+tcbReply);

        callerCap = ((cte_t *)(mdb_node_get_mdbNext(slot->cteMDBNode)));
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
        tcb_t *thread = ((tcb_t *)(endpoint_ptr_get_epQueue_head(epptr)));

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
        halt();
    }
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "./api/invocation.h" 1
/* @LICENSE(OKL_CORE) */

/* This header was generated by kernel/tools/invocation_header_gen.py.
 *
 * To add an invocation call number, edit libsel4/include/interfaces/sel4.xml.
 *
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/asyncendpoint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/interrupt.c" 2

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

        if (length < 3 || extraCaps.excaprefs[0] == ((void *)0)) {
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
        ;
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

        if (extraCaps.excaprefs[0] == ((void *)0)) {
            current_syscall_error.type = seL4_TruncatedMessage;
            return EXCEPTION_SYSCALL_ERROR;
        }
        aepCap = extraCaps.excaprefs[0]->cap;
        slot = extraCaps.excaprefs[0];

        if (cap_get_capType(aepCap) != cap_async_endpoint_cap ||
                !cap_async_endpoint_cap_get_capAEPCanSend(aepCap)) {
            if (cap_get_capType(aepCap) != cap_async_endpoint_cap) {
                ;
            } else {
                ;
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
        ;
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
            sendAsyncIPC(((async_endpoint_t *)cap_async_endpoint_cap_get_capAEPPtr(cap)),
                         cap_async_endpoint_cap_get_capAEPBadge(cap),
                         (((uint32_t) 1) << (irq % (8 * sizeof(word_t)))));
        } else {



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



        break;

    default:
        /* No corresponding haskell error */
        halt();
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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/object/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/asyncendpoint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/endpoint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/interrupt.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 25 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/untyped.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 26 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/preemption.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 27 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 28 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 29 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 30 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 31 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 32 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/objecttype.c" 2

word_t getObjectSize(word_t t, word_t userObjSize)
{
    if (t >= seL4_NonArchObjectTypeCount) {
        return Arch_getObjectSize(t);
    } else {
        switch (t) {
        case seL4_TCBObject:
            return 10;
        case seL4_EndpointObject:
            return 4;
        case seL4_AsyncEndpointObject:
            return 4;
        case seL4_CapTableObject:
            return 4 + userObjSize;
        case seL4_UntypedObject:
            return userObjSize;
        default:
            halt();
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
            epCancelAll(((endpoint_t *)cap_endpoint_cap_get_capEPPtr(cap)));
        }

        fc_ret.remainder = cap_null_cap_new();
        fc_ret.irq = irqInvalid;
        return fc_ret;

    case cap_async_endpoint_cap:
        if (final) {
            aepCancelAll(((async_endpoint_t *)cap_async_endpoint_cap_get_capAEPPtr(cap))
                                                                       );
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
        halt();
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

            tcb = ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap)));
            cte_ptr = (((cte_t *)((unsigned int)tcb&~((1ul<<(10))-1ul)))+tcbCTable);
            suspend(tcb);
            Arch_prepareThreadDelete(tcb);
            fc_ret.remainder =
                Zombie_new(
                    tcbCNodeEntries,
                    (1ul<<(5)),
                    ((unsigned int)cte_ptr)
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
        halt();
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
        if (type == (1ul<<(5))) {
            tcb_t *tcb;
            _thread_state_t ts __attribute__((unused));

            tcb = ((tcb_t *)(cap_zombie_cap_get_capZombiePtr(cap) + (1 << (4 + 4))))
                                       ;
            ts = thread_state_get_tsType(tcb->tcbState);
            /* Haskell error:
             * "Zombie cap should point at inactive thread" */
           
                                                     ;
            /* Haskell error:
             * "Zombie cap should not point at queued thread" */
            ;

            /* makeObject doesn't exist in C, objects are initialised by
             * zeroing. The effect of recycle in Haskell is to reinitialise
             * the TCB, with the exception of the TCB CTEs.  I achieve this
             * here by zeroing the TCB part of the structure, while leaving
             * the CNode alone. */
            memzero(tcb, sizeof (tcb_t));
            Arch_initContext(&tcb->tcbContext);
            tcb->tcbTimeSlice = 1;
            tcb->tcbDomain = ksCurDomain;

            return cap_thread_cap_new(((unsigned int)tcb));
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

bool_t __attribute__((__const__))
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

bool_t __attribute__((__const__))
sameRegionAs(cap_t cap_a, cap_t cap_b)
{
    switch (cap_get_capType(cap_a)) {
    case cap_untyped_cap: {
        word_t aBase, bBase, aTop, bTop;

        aBase = (word_t)((word_t *)(cap_untyped_cap_get_capPtr(cap_a)));
        bBase = (word_t)cap_get_capPtr(cap_b);

        aTop = aBase + ((1ul<<(cap_untyped_cap_get_capBlockSize(cap_a)))-1ul);
        bTop = bBase + ((1ul<<(cap_get_capSizeBits(cap_b)))-1ul);

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

bool_t __attribute__((__const__))
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

cap_t __attribute__((__const__))
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

        if (guardSize + cap_cnode_cap_get_capCNodeRadix(cap) > 32) {
            return cap_null_cap_new();
        } else {
            cap_t new_cap;

            guard = cnode_capdata_get_guard(w) & ((1ul<<(guardSize))-1ul);
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

cap_t __attribute__((__const__))
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
        halt(); /* Sentinel for invalid enums */
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
        memzero(regionBase, 1UL << 10);
        tcb = ((tcb_t *)((word_t)regionBase + (1 << (4 + 4))));
        /** AUXUPD: "(True, ptr_retyps 5
          (Ptr ((ptr_val \<acute>tcb) - 0x100) :: cte_C ptr)
            o (ptr_retyp \<acute>tcb))" */

        /* Setup non-zero parts of the TCB. */

        Arch_initContext(&tcb->tcbContext);
        tcb->tcbTimeSlice = 1;
        tcb->tcbDomain = ksCurDomain;

        return cap_thread_cap_new(((unsigned int)tcb));
    }

    case seL4_EndpointObject:
        memzero(regionBase, 1UL << 4);
        /** AUXUPD: "(True, ptr_retyp
          (Ptr (ptr_val \<acute>regionBase) :: endpoint_C ptr))" */
        return cap_endpoint_cap_new(0, true, true, true,
                                    ((unsigned int)regionBase));

    case seL4_AsyncEndpointObject:
        memzero(regionBase, 1UL << 4);
        /** AUXUPD: "(True, ptr_retyp
              (Ptr (ptr_val \<acute>regionBase) :: async_endpoint_C ptr))" */
        return cap_async_endpoint_cap_new(0, true, true,
                                          ((unsigned int)regionBase));

    case seL4_CapTableObject:
        memzero(regionBase, 1UL << (4 + userSize));
        /** AUXUPD: "(True, ptr_retyps (2 ^ (unat \<acute>userSize))
          (Ptr (ptr_val \<acute>regionBase) :: cte_C ptr))" */
        /** GHOSTUPD: "(True, gs_new_cnodes (unat \<acute>userSize)
                                (ptr_val \<acute>regionBase)
                                (4 + unat \<acute>userSize))" */
        return cap_cnode_cap_new(userSize, 0, 0, ((unsigned int)regionBase));

    case seL4_UntypedObject:
        /*
         * No objects need to be created; instead, just insert caps into
         * the destination slots.
         */
        return cap_untyped_cap_new(0, userSize, ((unsigned int)regionBase));

    default:
        halt();
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
        ;
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;

    case cap_zombie_cap:
        ;
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;

    case cap_endpoint_cap:
        if (__builtin_expect(!!(!cap_endpoint_cap_get_capCanSend(cap)), 0)) {
           
                               ;
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        return performInvocation_Endpoint(
                   ((endpoint_t *)cap_endpoint_cap_get_capEPPtr(cap)),
                   cap_endpoint_cap_get_capEPBadge(cap),
                   cap_endpoint_cap_get_capCanGrant(cap), block, call);

    case cap_async_endpoint_cap: {
        word_t msg;

        if (__builtin_expect(!!(!cap_async_endpoint_cap_get_capAEPCanSend(cap)), 0)) {
           
                               ;
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
                   ((async_endpoint_t *)cap_async_endpoint_cap_get_capAEPPtr(cap)),
                   cap_async_endpoint_cap_get_capAEPBadge(cap), msg);
    }

    case cap_reply_cap:
        if (__builtin_expect(!!(cap_reply_cap_get_capReplyMaster(cap)), 0)) {
           
                               ;
            current_syscall_error.type = seL4_InvalidCapability;
            current_syscall_error.invalidCapNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }

        setThreadState(ksCurThread, ThreadState_Restart);
        return performInvocation_Reply(
                   ((tcb_t *)(cap_reply_cap_get_capTCBPtr(cap))), slot);

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
        halt();
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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "./api/invocation.h" 1
/* @LICENSE(OKL_CORE) */

/* This header was generated by kernel/tools/invocation_header_gen.py.
 *
 * To add an invocation call number, edit libsel4/include/interfaces/sel4.xml.
 *
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/tcb.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/vspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 25 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/tcb.c" 2

static inline __attribute__((__pure__))
unsigned int
ready_queues_index(unsigned int dom, unsigned int prio)
{
    return dom * 256 + prio;
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
        tcb->tcbSchedPrev = ((void *)0);
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
        tcb->tcbSchedNext = ((void *)0);
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
    tcb->tcbEPNext = ((void *)0);
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

cptr_t __attribute__((__pure__))
getExtraCPtr(word_t *bufferPtr, unsigned int i)
{
    return (cptr_t)bufferPtr[120 + 2 + i];
}

void
setExtraBadge(word_t *bufferPtr, word_t badge,
              unsigned int i)
{
    bufferPtr[120 + 2 + i] = badge;
}

void
setupCallerCap(tcb_t *sender, tcb_t *receiver)
{
    cte_t *replySlot, *callerSlot;
    cap_t masterCap __attribute__((unused)), callerCap __attribute__((unused));

    setThreadState(sender, ThreadState_BlockedOnReply);
    replySlot = (((cte_t *)((unsigned int)sender&~((1ul<<(10))-1ul)))+tcbReply);
    masterCap = replySlot->cap;
    /* Haskell error: "Sender must have a valid master reply cap" */
    ;
    ;
    ;
    callerSlot = (((cte_t *)((unsigned int)receiver&~((1ul<<(10))-1ul)))+tcbCaller);
    callerCap = callerSlot->cap;
    /* Haskell error: "Caller cap must not already exist" */
    ;
    cteInsert(cap_reply_cap_new(false, ((unsigned int)sender)),
              replySlot, callerSlot);
}

void
deleteCallerCap(tcb_t *receiver)
{
    cte_t *callerSlot;

    callerSlot = (((cte_t *)((unsigned int)receiver&~((1ul<<(10))-1ul)))+tcbCaller);
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
        current_extra_caps.excaprefs[0] = ((void *)0);
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
    if (i < ((1ul<<(seL4_MsgExtraCapBits))-1)) {
        current_extra_caps.excaprefs[i] = ((void *)0);
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
                   ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap))));

    case TCBResume:
        setThreadState(ksCurThread, ThreadState_Restart);
        return invokeTCB_Resume(
                   ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap))));

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
        ;
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

    if (length < 1 || extraCaps.excaprefs[0] == ((void *)0)) {
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    flags = getSyscallArg(0, buffer);

    transferArch = Arch_decodeTransfer(flags >> 8);

    source_cap = extraCaps.excaprefs[0]->cap;

    if (cap_get_capType(source_cap) == cap_thread_cap) {
        srcTCB = ((tcb_t *)(cap_thread_cap_get_capTCBPtr(source_cap)));
    } else {
        ;
        current_syscall_error.type = seL4_InvalidCapability;
        current_syscall_error.invalidCapNumber = 1;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_CopyRegisters(
               ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap))), srcTCB,
               flags & (1ul<<(CopyRegisters_suspendSource)),
               flags & (1ul<<(CopyRegisters_resumeTarget)),
               flags & (1ul<<(CopyRegisters_transferFrame)),
               flags & (1ul<<(CopyRegisters_transferInteger)),
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
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    flags = getSyscallArg(0, buffer);
    n = getSyscallArg(1, buffer);

    if (n < 1 || n > n_frameRegisters + n_gpRegisters) {
       
                         ;
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 1;
        current_syscall_error.rangeErrorMax = n_frameRegisters +
                                              n_gpRegisters;
        return EXCEPTION_SYSCALL_ERROR;
    }

    transferArch = Arch_decodeTransfer(flags >> 8);

    thread = ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap)));
    if (thread == ksCurThread) {
        ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_ReadRegisters(
               ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap))),
               flags & (1ul<<(ReadRegisters_suspend)),
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
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    flags = getSyscallArg(0, buffer);
    w = getSyscallArg(1, buffer);

    if (length - 2 < w) {
       
                                            ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    transferArch = Arch_decodeTransfer(flags >> 8);

    thread = ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap)));
    if (thread == ksCurThread) {
        ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_WriteRegisters(thread,
                                    flags & (1ul<<(WriteRegisters_resume)),
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

    if (length < 5 || rootCaps.excaprefs[0] == ((void *)0)
            || rootCaps.excaprefs[1] == ((void *)0)
            || rootCaps.excaprefs[2] == ((void *)0)) {
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    faultEP = getSyscallArg(0, buffer);
    prio = getSyscallArg(1, buffer);
    cRootData = getSyscallArg(2, buffer);
    vRootData = getSyscallArg(3, buffer);
    bufferAddr = getSyscallArg(4, buffer);

    cRootSlot = rootCaps.excaprefs[0];
    cRootCap = rootCaps.excaprefs[0]->cap;
    vRootSlot = rootCaps.excaprefs[1];
    vRootCap = rootCaps.excaprefs[1]->cap;
    bufferSlot = rootCaps.excaprefs[2];
    bufferCap = rootCaps.excaprefs[2]->cap;

    prio = prio & ((1ul<<(8))-1ul);

    if (prio > ksCurThread->tcbPriority) {
       
                                                             ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (bufferAddr == 0) {
        bufferSlot = ((void *)0);
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
                (((cte_t *)((unsigned int)cap_thread_cap_get_capTCBPtr(cap)&~((1ul<<(10))-1ul)))+tcbCTable)) ||
            slotCapLongRunningDelete(
                (((cte_t *)((unsigned int)cap_thread_cap_get_capTCBPtr(cap)&~((1ul<<(10))-1ul)))+tcbVTable))) {
        ;
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
        ;
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
        ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_ThreadControl(
               ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap))), slot,
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
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    newPrio = getSyscallArg(0, buffer);

    /* assuming here seL4_MaxPrio is of form 2^n - 1 */
    newPrio = newPrio & ((1ul<<(8))-1ul);

    if (newPrio > ksCurThread->tcbPriority) {
       
                                                              ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_ThreadControl(
               ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap))), ((void *)0),
               0, newPrio,
               cap_null_cap_new(), ((void *)0),
               cap_null_cap_new(), ((void *)0),
               0, cap_null_cap_new(),
               ((void *)0), thread_control_update_priority);
}

exception_t
decodeSetIPCBuffer(cap_t cap, unsigned int length, cte_t* slot,
                   extra_caps_t extraCaps, word_t *buffer)
{
    cptr_t cptr_bufferPtr;
    cap_t bufferCap;
    cte_t *bufferSlot;

    if (length < 1 || extraCaps.excaprefs[0] == ((void *)0)) {
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    cptr_bufferPtr = getSyscallArg(0, buffer);
    bufferSlot = extraCaps.excaprefs[0];
    bufferCap = extraCaps.excaprefs[0]->cap;

    if (cptr_bufferPtr == 0) {
        bufferSlot = ((void *)0);
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
               ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap))), slot,
               0,
               0, /* used to be prioInvalid, but it doesn't matter */
               cap_null_cap_new(), ((void *)0),
               cap_null_cap_new(), ((void *)0),
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

    if (length < 3 || extraCaps.excaprefs[0] == ((void *)0)
            || extraCaps.excaprefs[1] == ((void *)0)) {
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    faultEP = getSyscallArg(0, buffer);
    cRootData = getSyscallArg(1, buffer);
    vRootData = getSyscallArg(2, buffer);

    cRootSlot = extraCaps.excaprefs[0];
    cRootCap = extraCaps.excaprefs[0]->cap;
    vRootSlot = extraCaps.excaprefs[1];
    vRootCap = extraCaps.excaprefs[1]->cap;

    if (slotCapLongRunningDelete(
                (((cte_t *)((unsigned int)cap_thread_cap_get_capTCBPtr(cap)&~((1ul<<(10))-1ul)))+tcbCTable)) ||
            slotCapLongRunningDelete(
                (((cte_t *)((unsigned int)cap_thread_cap_get_capTCBPtr(cap)&~((1ul<<(10))-1ul)))+tcbVTable))) {
        ;
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
        ;
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
        ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    return invokeTCB_ThreadControl(
               ((tcb_t *)(cap_thread_cap_get_capTCBPtr(cap))), slot,
               faultEP,
               0, /* used to be prioInvalid, but it doesn't matter */
               cRootCap, cRootSlot,
               vRootCap, vRootSlot,
               0, cap_null_cap_new(), ((void *)0), thread_control_update_space);
}

exception_t
decodeDomainInvocation(word_t label, unsigned int length, extra_caps_t extraCaps, word_t *buffer)
{
    word_t domain;
    cap_t tcap;

    if (__builtin_expect(!!(label != DomainSetSet), 0)) {
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    if (__builtin_expect(!!(length == 0), 0)) {
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    } else {
        domain = getSyscallArg(0, buffer);
        if (domain >= 1) {
           
                                                      ;
            current_syscall_error.type = seL4_InvalidArgument;
            current_syscall_error.invalidArgumentNumber = 0;
            return EXCEPTION_SYSCALL_ERROR;
        }
    }

    if (__builtin_expect(!!(extraCaps.excaprefs[0] == ((void *)0)), 0)) {
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    tcap = extraCaps.excaprefs[0]->cap;
    if (__builtin_expect(!!(cap_get_capType(tcap) != cap_thread_cap), 0)) {
        ;
        current_syscall_error.type = seL4_InvalidArgument;
        current_syscall_error.invalidArgumentNumber = 1;
        return EXCEPTION_SYSCALL_ERROR;
    }

    setThreadState(ksCurThread, ThreadState_Restart);
    setDomain(((tcb_t *)(cap_thread_cap_get_capTCBPtr(tcap))), domain);
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

        rootSlot = (((cte_t *)((unsigned int)target&~((1ul<<(10))-1ul)))+tcbCTable);
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

        rootSlot = (((cte_t *)((unsigned int)target&~((1ul<<(10))-1ul)))+tcbVTable);
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

        bufferSlot = (((cte_t *)((unsigned int)target&~((1ul<<(10))-1ul)))+tcbBuffer);
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

        if (ipcBuffer != ((void *)0) && i < n && i < n_frameRegisters) {
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

        if (ipcBuffer != ((void *)0) && i < n_gpRegisters
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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/types.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/failures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/api/syscall.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "./api/invocation.h" 1
/* @LICENSE(OKL_CORE) */

/* This header was generated by kernel/tools/invocation_header_gen.py.
 *
 * To add an invocation call number, edit libsel4/include/interfaces/sel4.xml.
 *
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/untyped.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/objecttype.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/cnode.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/cspace.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/kernel/thread.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/object/untyped.c" 2

static word_t
alignUp(word_t baseValue, unsigned int alignment)
{
    return (baseValue + ((1ul<<(alignment)) - 1)) & ~((1ul<<(alignment))-1ul);
}

exception_t
decodeUntypedInvocation(word_t label, unsigned int length, cte_t *slot,
                        cap_t cap, extra_caps_t extraCaps,
                        bool_t call, word_t *buffer)
{
    word_t newType, userObjSize, nodeIndex;
    word_t nodeDepth, nodeOffset, nodeWindow;
    cte_t *rootSlot __attribute__((unused));
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
        ;
        current_syscall_error.type = seL4_IllegalOperation;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Ensure message length valid. */
    if (length < 6 || extraCaps.excaprefs[0] == ((void *)0)) {
        ;
        current_syscall_error.type = seL4_TruncatedMessage;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Fetch arguments. */
    newType = getSyscallArg(0, buffer);
    userObjSize = getSyscallArg(1, buffer);
    nodeIndex = getSyscallArg(2, buffer);
    nodeDepth = getSyscallArg(3, buffer);
    nodeOffset = getSyscallArg(4, buffer);
    nodeWindow = getSyscallArg(5, buffer);

    rootSlot = extraCaps.excaprefs[0];

    /* Is the requested object type valid? */
    if (newType >= seL4_ObjectTypeCount) {
        ;
        current_syscall_error.type = seL4_InvalidArgument;
        current_syscall_error.invalidArgumentNumber = 0;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Is the requested object size valid? */
    if (userObjSize >= (32 - 1)) {
        ;
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 0;
        current_syscall_error.rangeErrorMax = 32 - 2;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* If the target object is a CNode, is it at least size 1? */
    if (newType == seL4_CapTableObject && userObjSize == 0) {
        ;
        current_syscall_error.type = seL4_InvalidArgument;
        current_syscall_error.invalidArgumentNumber = 1;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* If the target object is a Untyped, is it at least size 4? */
    if (newType == seL4_UntypedObject && userObjSize < 4) {
        ;
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
            ;
            return lu_ret.status;
        }
        nodeCap = lu_ret.slot->cap;
    }

    /* Is the destination actually a CNode? */
    if (cap_get_capType(nodeCap) != cap_cnode_cap) {
        ;
        current_syscall_error.type = seL4_FailedLookup;
        current_syscall_error.failedLookupWasSource = 0;
        current_lookup_fault = lookup_fault_missing_capability_new(nodeDepth);
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Is the region where the user wants to put the caps valid? */
    nodeSize = 1 << cap_cnode_cap_get_capCNodeRadix(nodeCap);
    if (nodeOffset > nodeSize - 1) {
       
                                  ;
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 0;
        current_syscall_error.rangeErrorMax = nodeSize - 1;
        return EXCEPTION_SYSCALL_ERROR;
    }
    if (nodeWindow < 1 || nodeWindow > 256) {
       
                                  ;
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 1;
        current_syscall_error.rangeErrorMax = 256;
        return EXCEPTION_SYSCALL_ERROR;
    }
    if (nodeWindow > nodeSize - nodeOffset) {
        ;
        current_syscall_error.type = seL4_RangeError;
        current_syscall_error.rangeErrorMin = 1;
        current_syscall_error.rangeErrorMax = nodeSize - nodeOffset;
        return EXCEPTION_SYSCALL_ERROR;
    }

    /* Ensure that the destination slots are all empty. */
    slots.cnode = ((cte_t *)(cap_cnode_cap_get_capCNodePtr(nodeCap)));
    slots.offset = nodeOffset;
    slots.length = nodeWindow;
    for (i = nodeOffset; i < nodeOffset + nodeWindow; i++) {
        status = ensureEmptySlot(slots.cnode + i);
        if (status != EXCEPTION_NONE) {
           
                             ;
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
    freeRef = ((word_t)(((word_t)(cap_untyped_cap_get_capPtr(cap))) + ((freeIndex)<<4)));

    /*
     * Determine the maximum number of objects we can create, and return an
     * error if we don't have enough space.
     *
     * We don't need to worry about alignment in this case, because if anything
     * fits, it will also fit aligned up (by packing it on the right hand side
     * of the untyped).
     */
    objectSize = getObjectSize(newType, userObjSize);
    untypedFreeBytes = (1ul<<(cap_untyped_cap_get_capBlockSize(cap))) -
                       ((freeIndex)<<4);
    if (objectSize >= 32 || (untypedFreeBytes >> objectSize) < nodeWindow) {
       



                                                   ;
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
               slot, ((word_t *)(cap_untyped_cap_get_capPtr(cap))),
               (void*)alignedFreeRef, newType, userObjSize, slots, call);
}

exception_t
invokeUntyped_Retype(cte_t *srcSlot, void* regionBase,
                     void* freeRegionBase,
                     object_t newType, word_t userSize,
                     slot_range_t destSlots, bool_t call)
{
    word_t size_ign __attribute__((unused));
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
                                         (((word_t)(freeRef) - (word_t)(regionBase))>>4));

    /* Create new objects and caps. */
    createNewObjects(newType, srcSlot, destSlots, freeRegionBase, userSize);

    return EXCEPTION_NONE;
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/acpi.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/devices.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pci.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/acpi.c" 2

enum acpi_type {
    ACPI_RSDP,
    ACPI_RSDT
};

/* Root System Descriptor Pointer */
typedef struct acpi_rsdp {
    char signature[8];
    uint8_t checksum;
    char oem_id[6];
    uint8_t revision;
    uint32_t rsdt_address;
    uint32_t length;
    uint32_t xsdt_address[2];
    uint8_t extended_checksum;
    char reserved[3];
} acpi_rsdp_t;


/* DMA Remapping Reporting Table */
typedef struct acpi_dmar {
    acpi_header_t header;
    uint8_t host_addr_width;
    uint8_t flags;
    uint8_t reserved[10];
} acpi_dmar_t;



/* DMA Remapping Structure Header */
typedef struct acpi_dmar_header {
    uint16_t type;
    uint16_t length;
} acpi_dmar_header_t;


/* DMA Remapping Structure Types */
enum acpi_table_dmar_struct_type {
    DMAR_DRHD = 0,
    DMAR_RMRR = 1,
    DMAR_ATSR = 2,
};

/* DMA Remapping Hardware unit Definition */
typedef struct acpi_dmar_drhd {
    acpi_dmar_header_t header;
    uint8_t flags;
    uint8_t reserved;
    uint16_t segment;
    uint32_t reg_base[2];
} acpi_dmar_drhd_t;



/* Reserved Memory Region Reporting structure Definition */
typedef struct acpi_dmar_devscope {
    uint8_t type;
    uint8_t length;
    uint16_t reserved;
    uint8_t enum_id;
    uint8_t start_bus;
    struct {
        uint8_t dev;
        uint8_t fun;
    } path_0;
} acpi_dmar_devscope_t;


/* Reserved Memory Region Reporting structure Definition */
typedef struct acpi_dmar_rmrr {
    acpi_dmar_header_t header;
    uint16_t reserved;
    uint16_t segment;
    uint32_t reg_base[2];
    uint32_t reg_limit[2];
    acpi_dmar_devscope_t devscope_0;
} acpi_dmar_rmrr_t;



/* Multiple APIC Description Table (MADT) */
typedef struct acpi_madt {
    acpi_header_t header;
    uint32_t apic_addr;
    uint32_t flags;
} acpi_madt_t;



typedef struct acpi_madt_header {
    uint8_t type;
    uint8_t length;
} acpi_madt_header_t;


enum acpi_table_madt_struct_type {
    MADT_APIC = 0,
    MADT_IOAPIC = 1,
    MADT_ISO = 2,
};

typedef struct acpi_madt_apic {
    acpi_madt_header_t header;
    uint8_t cpu_id;
    uint8_t apic_id;
    uint32_t flags;
} acpi_madt_apic_t;



typedef struct acpi_madt_ioapic {
    acpi_madt_header_t header;
    uint8_t ioapic_id;
    uint8_t reserved[1];
    uint32_t ioapic_addr;
    uint32_t gsib;
} acpi_madt_ioapic_t;



typedef struct acpi_madt_iso {
    acpi_madt_header_t header;
    uint8_t bus; /* always 0 (ISA) */
    uint8_t source;
    uint32_t gsi;
    uint16_t flags;
} acpi_madt_iso_t;
/* We can't assert on the sizeof acpi_madt_iso because it contains trailing
 * padding.
 */



/* workaround because string literals are not supported by C parser */
const char acpi_str_rsd[] = {'R', 'S', 'D', ' ', 'P', 'T', 'R', ' ', 0};
const char acpi_str_apic[] = {'A', 'P', 'I', 'C', 0};

__attribute__((__section__(".boot.text"))) static uint8_t
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

__attribute__((__section__(".boot.text"))) static acpi_rsdp_t*
acpi_get_rsdp(void)
{
    char* addr;

    for (addr = (char*)0x0e0000; addr < (char*)0x100000; addr += 16) {
        if (strncmp(addr, acpi_str_rsd, 8) == 0) {
            if (acpi_calc_checksum(addr, 20) == 0) {
                return (acpi_rsdp_t*)addr;
            }
        }
    }
    return ((void *)0);
}

void* acpi_table_init(void* entry, enum acpi_type table_type);
__attribute__((__section__(".boot.text"))) void*
acpi_table_init(void* entry, enum acpi_type table_type)
{
    void* acpi_table;
    unsigned int pages_for_table;
    unsigned int pages_for_header = 1;

    /* if we need to map another page to read header */
    uint32_t offset_in_page = (uint32_t)entry & ((1ul<<(pageBitsForSize(IA32_4M)))-1ul);
    if (((1ul<<(pageBitsForSize(IA32_4M)))-1ul) - offset_in_page < sizeof(acpi_rsdp_t)) {
        pages_for_header++;
    }

    /* map in table's header */
    acpi_table = map_temp_boot_page(entry, pages_for_header);

    switch (table_type) {
    case ACPI_RSDP: {
        acpi_rsdp_t *rsdp_entry = (acpi_rsdp_t*)entry;
        pages_for_table = (rsdp_entry->length + offset_in_page) / ((1ul<<(pageBitsForSize(IA32_4M)))-1ul) + 1;
        break;
    }
    case ACPI_RSDT: { // RSDT, MADT, DMAR etc.
        acpi_rsdt_t *rsdt_entry = (acpi_rsdt_t*)entry;
        pages_for_table = (rsdt_entry->header.length + offset_in_page) / ((1ul<<(pageBitsForSize(IA32_4M)))-1ul) + 1;
        break;
    }
    default:
        ((void)(0));
        ;
        return ((void *)0);
    }

    /* map in full table */
    acpi_table = map_temp_boot_page(entry, pages_for_table);

    return acpi_table;
}

__attribute__((__section__(".boot.text"))) acpi_rsdt_t*
acpi_init(void)
{
    acpi_rsdp_t* acpi_rsdp = acpi_get_rsdp();
    acpi_rsdt_t* acpi_rsdt;
    acpi_rsdt_t* acpi_rsdt_mapped;

    if (acpi_rsdp == ((void *)0)) {
        ((void)(0));
        return ((void *)0);
    }
    ((void)(0));
    acpi_rsdp = acpi_table_init(acpi_rsdp, ACPI_RSDP);
    ((void)(0));

    acpi_rsdt = (acpi_rsdt_t*)acpi_rsdp->rsdt_address;
    ((void)(0));
    acpi_rsdt_mapped = (acpi_rsdt_t*)acpi_table_init(acpi_rsdt, ACPI_RSDT);
    ((void)(0));

    ;
    if (acpi_calc_checksum((char*)acpi_rsdt_mapped, acpi_rsdt_mapped->header.length) != 0) {
        ((void)(0));
        return ((void *)0);
    }

    return acpi_rsdt;
}

__attribute__((__section__(".boot.text"))) uint32_t
acpi_madt_scan(
    acpi_rsdt_t* acpi_rsdt,
    cpu_id_t* cpu_list,
    uint32_t max_list_len
)
{
    unsigned int entries;
    uint32_t num_cpu;
    uint32_t count;
    acpi_madt_t* acpi_madt;
    acpi_madt_header_t* acpi_madt_header;

    acpi_rsdt_t* acpi_rsdt_mapped;
    acpi_madt_t* acpi_madt_mapped;
    acpi_rsdt_mapped = (acpi_rsdt_t*)acpi_table_init(acpi_rsdt, ACPI_RSDT);

    num_cpu = 0;

    ;
    entries = (acpi_rsdt_mapped->header.length - sizeof(acpi_header_t)) / sizeof(acpi_header_t*);
    for (count = 0; count < entries; count++) {
        acpi_madt = (acpi_madt_t*)acpi_rsdt_mapped->entry[count];
        acpi_madt_mapped = (acpi_madt_t*)acpi_table_init(acpi_madt, ACPI_RSDT);

        if (strncmp(acpi_str_apic, acpi_madt_mapped->header.signature, 4) == 0) {
            ((void)(0));
            ((void)(0));
            ((void)(0));
            ((void)(0));

            acpi_madt_header = (acpi_madt_header_t*)(acpi_madt_mapped + 1);

            while ((char*)acpi_madt_header < (char*)acpi_madt_mapped + acpi_madt_mapped->header.length) {
                switch (acpi_madt_header->type) {
                case MADT_APIC: {
                    /* what Intel calls apic_id is what is called cpu_id in seL4! */
                    uint8_t cpu_id = ((acpi_madt_apic_t*)acpi_madt_header)->apic_id;
                    uint32_t flags = ((acpi_madt_apic_t*)acpi_madt_header)->flags;
                    if (flags == 1) {
                        ((void)(0));
                        if (num_cpu < max_list_len) {
                            cpu_list[num_cpu] = cpu_id;
                        }
                        num_cpu++;
                    }
                    break;
                }
                case MADT_IOAPIC:
                    ((void)(0))




                     ;
                    break;
                default:
                    break;
                }
                acpi_madt_header = (acpi_madt_header_t*)((char*)acpi_madt_header + acpi_madt_header->length);
            }
        }
    }

    ((void)(0));

    return num_cpu;
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/hardware.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/apic.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pic.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/hardware.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/hardware.c" 2





/* Device discovery. For the pc99 platform we assume a pci bus and the presence of the
 * standard bios regions */
void platAddDevices(void)
{
    /* discover PCI devices and their regions */
    /* pci_scan() calls insert_dev_p_reg() for each device region */



    pci_scan(((void *)0));

    /* Add the text mode (EGA) frame buffer. 1 frame is enough for the
     * standard 80x25 text mode. This whole thing is a bit of a hack */
    insert_dev_p_reg( (p_region_t) {
        0x000B8000, 0x000B8000 + 0x1000
    } );
}

/* ============================== interrupts/IRQs ============================== */

/* Enable or disable irq according to the 'mask' flag. */
void maskInterrupt(bool_t mask, irq_t irq)
{
    ;
    ;

    if (irq <= irq_isa_max) {
        pic_mask_irq(mask, irq);
    } else {
        /* we can't mask/unmask specific APIC vectors (e.g. MSIs/IPIs) */
    }
}

/* Handle a platform-reserved IRQ. */
void handleReservedIRQ(irq_t irq)
{






    ((void)(0));
}

/* Get the IRQ number currently working on. */
irq_t getActiveIRQ(void)
{
    if (ia32KScurInterrupt == int_invalid) {
        return irqInvalid;
    } else {
        return ia32KScurInterrupt - 0x20;
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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/intel-vtd.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/config.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/intel-vtd.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/io.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot_sys.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/io.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/lock.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/io.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/io.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/io.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pci.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pci.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/kernel/boot_sys.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pci.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pci.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pci.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pci.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pci.c" 2
# 29 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pci.c"
__attribute__((__section__(".boot.text"))) static uint32_t
pci_read_reg32(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t reg)
{
    reg &= ~((1ul<<(2))-1ul);
    out32(0x0CF8, 0x80000000 | bus << 16 | dev << 11 | fun << 8 | reg);
    return in32(0x0CFC);
}

__attribute__((__section__(".boot.text"))) static void
pci_write_reg32(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t reg, uint32_t val)
{
    reg &= ~((1ul<<(2))-1ul);
    out32(0x0CF8, 0x80000000 | bus << 16 | dev << 11 | fun << 8 | reg);
    out32(0x0CFC, val);
}

__attribute__((__section__(".boot.text"))) static uint16_t
pci_read_reg16(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t reg)
{
    reg &= ~((1ul<<(1))-1ul);
    out32(0x0CF8, 0x80000000 | bus << 16 | dev << 11 | fun << 8 | (reg & ~((1ul<<(2))-1ul)));
    return in32(0x0CFC) >> ((reg & ((1ul<<(2))-1ul)) * 8);
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

__attribute__((__section__(".boot.text"))) static uint8_t
pci_read_reg8(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t reg)
{
    out32(0x0CF8, 0x80000000 | bus << 16 | dev << 11 | fun << 8 | (reg & ~((1ul<<(2))-1ul)));
    return in32(0x0CFC) >> ((reg & ((1ul<<(2))-1ul)) * 8);
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

__attribute__((__section__(".boot.text"))) static void
pci_scan_bars(uint8_t bus, uint8_t dev, uint8_t fun, uint8_t count)
{
    pci_bar_t bar;
    pci_bar_t bar_save;
    paddr_t map_base;
    uint32_t map_size;
    uint32_t map_size_bits;
    uint32_t i;
    uint8_t reg;

    for (i = 0; i < count; i++) {
        reg = 0x10 + (i << 2);
        /* save base address written by BIOS */
        bar_save.words[0] = pci_read_reg32(bus, dev, fun, reg);
        /* write 0xffffffff in order to read size etc. */
        pci_write_reg32(bus, dev, fun, reg, 0xffffffff);
        bar.words[0] = pci_read_reg32(bus, dev, fun, reg);
        if (bar.words[0] != 0) {
            /* BAR is in use */
            ((void)(0));
            if (pci_bar_get_pci_space(bar) == pci_bar_pci_bar_mem) {
                map_size = ~(pci_bar_pci_bar_mem_get_base_address(bar) - 1);
                if (map_size < (1ul<<(12))) {
                    map_size = (1ul<<(12));
                }
                map_base = pci_bar_pci_bar_mem_get_base_address(bar_save);
                if ((!((map_base) & ((1ul<<(12))-1ul)))) {
                    /* calculate map_size_bits */
                    map_size_bits = 0;
                    while ((map_size & (1ul<<(map_size_bits))) == 0) {
                        map_size_bits++;
                    }
                    /* check whether map_size is a power of two */
                    if (map_size - (1ul<<(map_size_bits)) == 0) {
                        /* we have base/size, now do the mapping */
                        if (pci_bar_pci_bar_mem_get_above_4GB(bar)) {
                            if (pci_read_reg32(bus, dev, fun, reg + 4) != 0) {
                                ((void)(0));
                            } else {
                                ((void)(0));
                                insert_dev_p_reg(
                                (p_region_t) {
                                    .start = map_base, .end = map_base + map_size
                                }
                                );
                            }
                            i++;
                        } else {
                            ((void)(0));
                            insert_dev_p_reg(
                            (p_region_t) {
                                .start = map_base, .end = map_base + map_size
                            }
                            );
                        }
                    } else {
                        ((void)(0));
                    }
                } else {
                    ((void)(0));
                }
            } else {
                /* pci_bar_pci_bar_io */
                ((void)(0));
            }
            /* write back address set by BIOS */
            pci_write_reg32(bus, dev, fun, reg, bar_save.words[0]);
        }
    }
}

__attribute__((__section__(".boot.text"))) static int
pci_scan_fun(uint8_t bus, uint8_t dev, uint8_t fun)
{
    uint16_t did;
    uint8_t type;
    uint16_t vid;

    vid = pci_read_reg16(bus, dev, fun, 0x00);
    if (vid != 0xffff) {

        did = pci_read_reg16(bus, dev, fun, 0x02);
        type = pci_read_reg8(bus, dev, fun, 0x0E) & 0x7f;
        ((void)(0))


         ;
        (void)did;
        switch (type) {
        case 0x00:
            ((void)(0));
            pci_scan_bars(bus, dev, fun, 6);
            break;

        case 0x01:
            ((void)(0));
            pci_scan_bars(bus, dev, fun, 2);
            break;

        case 0x02:
            ((void)(0));
            pci_scan_bars(bus, dev, fun, 1);
            break;

        default:
            ((void)(0));
            /* don't scan BARs */
            break;
        }
        return 1;
    }
    return 0;
}

__attribute__((__section__(".boot.text"))) void
pci_scan(uint32_t* bus_used_bitmap)
{
    bool_t bus_used;
    uint16_t bus;
    uint8_t dev;
    uint8_t fun;
    bool_t multifunction;

    for (bus = 0; bus < 256; bus++) {
        bus_used = false;
        for (dev = 0; dev < 32; dev++) {
            if (pci_scan_fun(bus, dev, 0)) {
                multifunction = !!(pci_read_reg8(bus, dev, 0, 0x0E) & 0x80);
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
            bus_used_bitmap[bus >> 5] |= (1ul<<(bus & ((1ul<<(5))-1ul)));
        }
    }
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pic.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pic.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pic.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/hardware.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pic.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pic.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pic.c" 2

/* PIC (i8259) base registers */



/* Program PIC (i8259) to remap IRQs 0-15 to interrupt vectors starting at 'interrupt' */
__attribute__((__section__(".boot.text"))) void
pic_remap_irqs(interrupt_t interrupt)
{
    out8(0x20, 0x11);
    out8(0xa0, 0x11);
    out8(0x20 + 1, interrupt);
    out8(0xa0 + 1, interrupt + 8);
    out8(0x20 + 1, 0x04);
    out8(0xa0 + 1, 0x02);
    out8(0x20 + 1, 0x01);
    out8(0xa0 + 1, 0x01);
    out8(0x20 + 1, 0x0);
    out8(0xa0 + 1, 0x0);
}

void pic_mask_irq(bool_t mask, irq_t irq)
{
    uint8_t bit_mask;
    uint16_t pic_port;

    ;
    ;

    if (irq < 8) {
        bit_mask = (1ul<<(irq));
        pic_port = 0x20 + 1;
    } else {
        bit_mask = (1ul<<(irq - 8));
        pic_port = 0xa0 + 1;
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
    out8(0x20, 0x0a);

    /* Read IRR */
    irr = in8(0x20);

    /* Since slave PIC is connected to IRQ2 of master PIC,
     * there is no need to check IRR of slave PIC.
     */
    return irr != 0;
}

void pic_ack_active_irq(void)
{
    if (getActiveIRQ() >= irq_isa_min + 8) {
        /* ack slave PIC */
        out8(0xa0, 0x20);
    }
    /* ack master PIC */
    out8(0x20, 0x20);
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pit.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/arch/ia32/arch/linker.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pit.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/io.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pit.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/plat/pc99/plat/machine/pit.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/plat/pc99/machine/pit.c" 2

/* PIT (i8253) registers */



/* Count frequency in Hz */


__attribute__((__section__(".phys.text"))) void
pit_init(void)
{
    uint16_t divisor = (1193180 * 50) / 1000;

    out8_phys(0x43, 0x34); /* Set mode 2 and wait for divisor bytes */
    out8_phys(0x40, divisor & 0xff); /* Set low byte of divisor */
    out8_phys(0x40, divisor >> 8); /* Set high byte of divisor */
}

__attribute__((__section__(".phys.text"))) void
pit_wait_wraparound(void)
{
    uint16_t count;
    uint16_t count_old;

    out8_phys(0x43, 0x00);
    count = in8_phys(0x40);
    count |= (in8_phys(0x40) << 8);
    count_old = count;

    while (count <= count_old) {
        count_old = count;
        out8_phys(0x43, 0x00);
        count = in8_phys(0x40);
        count |= (in8_phys(0x40) << 8);
    }
}
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/util.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/assert.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/util.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/stdint.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/util.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/util.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 14 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/util.c" 2

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
    ;
    ;

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
    if (__builtin_expect(!!(c == 0 && ((uint32_t)s % 4) == 0 && (n % 4) == 0), 1)) {
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

int __attribute__((__const__))
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

int __attribute__((__pure__))
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
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/config/default_domain.c"
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */

# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/object/structures.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/config/default_domain.c" 2
# 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/include/model/statedata.h" 1
/*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 */
# 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test-manifest/kernel/src/config/default_domain.c" 2

/* Default schedule. */
const dschedule_t ksDomSchedule[] = {
    { .domain = 0, .length = 1 },
};

const unsigned int ksDomScheduleLength = sizeof(ksDomSchedule) / sizeof(dschedule_t);
