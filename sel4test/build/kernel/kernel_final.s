	.file	"kernel_final.c"
	.text
.Ltext0:
	.p2align 4,,15
	.type	fastpath_restore, @function
fastpath_restore:
.LFB291:
	.file 1 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/fastpath/fastpath.c"
	.loc 1 196 0
	.cfi_startproc
.LVL0:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	.loc 1 197 0
	movl	ksCurThread, %eax
	.loc 1 196 0
	movl	%edx, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	.loc 1 196 0
	movl	%ecx, %ebx
	.loc 1 197 0
	movl	ia32KSfpuOwner, %ecx
.LVL1:
	cmpl	%ecx, %eax
	je	.L12
	.loc 1 200 0
	testl	%ecx, %ecx
	jne	.L13
.L3:
.LVL2:
	.loc 1 208 0
	andl	$-513, 64(%eax)
.LVL3:
.LBB3404:
.LBB3405:
	.loc 1 190 0
	cmpl	$35, 28(%eax)
.LBE3405:
.LBE3404:
	.loc 1 207 0
	leal	76(%eax), %ecx
.LVL4:
	movl	%ecx, ia32KStss+4
.LBB3408:
.LBB3406:
	.loc 1 190 0
	je	.L14
.L4:
.LBE3406:
.LBE3408:
	.loc 1 250 0
	leal	20(%eax), %ecx
.LVL5:
	.loc 1 233 0
	movl	(%eax), %eax
.LVL6:
#APP
# 233 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/fastpath/fastpath.c" 1
	                movl %ecx, %esp 
                popl %edi 
                popl %ebp 
                popl %ds 
                popl %es 
                popl %fs 
                popl %gs 
                addl $20, %esp 
                popfl 
                orl $0x200, 44(%ecx) 
                movl 36(%ecx), %edx 
                pop %ecx 
                sti 
                sysexit 
            
# 0 "" 2
#NO_APP
.L8:
.L7:
	jmp	.L7
.LVL7:
.L14:
.LBB3409:
.LBB3407:
	.loc 1 190 0
	cmpl	$35, 32(%eax)
	jne	.L4
.LBE3407:
.LBE3409:
	.loc 1 226 0
	leal	20(%eax), %ecx
.LVL8:
	.loc 1 210 0
	movl	(%eax), %eax
.LVL9:
#APP
# 210 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/fastpath/fastpath.c" 1
	                movl %ecx, %esp 
                popl %edi 
                popl %ebp 
                addl $8, %esp 
                popl %fs 
                popl %gs 
                addl $20, %esp 
                popfl 
                orl $0x200, 44(%ecx) 
                movl 36(%ecx), %edx 
                pop %ecx 
                sti 
                sysexit 
            
# 0 "" 2
#NO_APP
	jmp	.L8
.LVL10:
.L13:
.LBB3410:
.LBB3411:
.LBB3412:
.LBB3413:
	.file 2 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h"
	.loc 2 41 0
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %ecx
# 0 "" 2
.LVL11:
#NO_APP
.LBE3413:
.LBE3412:
	.file 3 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/fpu.h"
	.loc 3 53 0
	orl	$8, %ecx
.LVL12:
.LBB3414:
.LBB3415:
	.loc 2 47 0
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %ecx, %cr0
# 0 "" 2
#NO_APP
	jmp	.L3
.LVL13:
.L12:
.LBE3415:
.LBE3414:
.LBE3411:
.LBE3410:
.LBB3416:
.LBB3417:
	.loc 3 45 0
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
	.p2align 4,,3
	jmp	.L3
.LBE3417:
.LBE3416:
	.cfi_endproc
.LFE291:
	.size	fastpath_restore, .-fastpath_restore
	.p2align 4,,15
	.type	findPDForASID, @function
findPDForASID:
.LFB367:
	.file 4 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/kernel/vspace.c"
	.loc 4 1208 0
	.cfi_startproc
.LVL14:
	.loc 4 1213 0
	movl	%edx, %ecx
	shrl	$10, %ecx
	movl	ia32KSASIDTable(,%ecx,4), %ecx
.LVL15:
	.loc 4 1214 0
	testl	%ecx, %ecx
	je	.L18
	.loc 4 1222 0
	andl	$1023, %edx
.LVL16:
	movl	(%ecx,%edx,4), %edx
.LVL17:
	.loc 4 1223 0
	testl	%edx, %edx
	je	.L18
.LVL18:
	.loc 4 1233 0
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	.loc 4 1234 0
	ret
.LVL19:
	.p2align 4,,7
	.p2align 3
.L18:
	.loc 4 1215 0
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL20:
	.loc 4 1219 0
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	ret
	.cfi_endproc
.LFE367:
	.size	findPDForASID, .-findPDForASID
	.p2align 4,,15
	.type	parse_opt.constprop.219, @function
parse_opt.constprop.219:
.LFB938:
	.file 5 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/kernel/cmdline.c"
	.loc 5 35 0
	.cfi_startproc
.LVL21:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	movl	%eax, %ecx
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	movl	%edx, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movzbl	(%eax), %ebx
	.loc 5 37 0
	movl	$-1, %eax
.LVL22:
	.p2align 4,,7
	.p2align 3
.L23:
	.loc 5 41 0
	cmpb	$32, %bl
	jg	.L51
	testb	%bl, %bl
	jne	.L28
	.loc 5 62 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL23:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL24:
	.p2align 4,,7
	.p2align 3
.L51:
	.cfi_restore_state
	.loc 5 46 0
	movzbl	(%esi), %edx
	testb	%dl, %dl
	.p2align 4,,2
	je	.L25
	cmpb	$61, %bl
	je	.L39
.LVL25:
	cmpb	%bl, %dl
	jne	.L39
	movl	%esi, %ebx
	.p2align 4,,4
	jmp	.L31
.LVL26:
	.p2align 4,,7
	.p2align 3
.L30:
	movzbl	1(%ecx), %ecx
	cmpb	$61, %cl
	je	.L40
.LVL27:
	cmpb	$32, %cl
	jle	.L42
	cmpb	%cl, %dl
	jne	.L42
	movl	%edi, %ecx
.LVL28:
.L31:
	addl	$1, %ebx
.LVL29:
	movzbl	(%ebx), %edx
	leal	1(%ecx), %edi
.LVL30:
	testb	%dl, %dl
	jne	.L30
.LVL31:
	movzbl	1(%ecx), %ebx
.LVL32:
	movl	%edi, %ecx
.LVL33:
.L25:
	.loc 5 48 0
	cmpb	$61, %bl
	je	.L52
.LVL34:
	.p2align 4,,7
	.p2align 3
.L37:
	.loc 5 58 0
	cmpb	$32, %bl
	jle	.L23
.LVL35:
	.p2align 4,,7
	.p2align 3
.L36:
	addl	$1, %ecx
.LVL36:
	movzbl	(%ecx), %ebx
.LVL37:
	cmpb	$32, %bl
	jg	.L36
	jmp	.L23
.LVL38:
	.p2align 4,,7
	.p2align 3
.L28:
	movzbl	1(%ecx), %ebx
	.loc 5 41 0
	addl	$1, %ecx
.LVL39:
	jmp	.L23
.LVL40:
	.p2align 4,,7
	.p2align 3
.L42:
	.loc 5 46 0
	movl	%ecx, %ebx
.LVL41:
	.loc 5 51 0
	movl	%edi, %ecx
.LVL42:
	jmp	.L37
.LVL43:
	.p2align 4,,7
	.p2align 3
.L40:
	.loc 5 46 0
	movl	$61, %ebx
.LVL44:
	.loc 5 51 0
	movl	%edi, %ecx
	jmp	.L37
.LVL45:
.L52:
	.loc 5 49 0
	leal	1(%ecx), %edx
.LVL46:
	.loc 5 51 0
	movzbl	1(%ecx), %ecx
.LVL47:
	cmpb	$32, %cl
	jle	.L43
	xorl	%eax, %eax
	jmp	.L34
.LVL48:
	.p2align 4,,7
	.p2align 3
.L33:
	cmpl	$999, %eax
	je	.L53
.LVL49:
.L34:
	addl	$1, %edx
.LVL50:
	addl	$1, %eax
.LVL51:
	.loc 5 52 0
	movb	%cl, cmdline_val-1(%eax)
.LVL52:
	.loc 5 51 0
	movzbl	(%edx), %ecx
.LVL53:
	cmpb	$32, %cl
	jg	.L33
	leal	cmdline_val(%eax), %ecx
.LVL54:
.L32:
	.loc 5 55 0
	movb	$0, (%ecx)
.LVL55:
	movl	%edx, %ecx
	movzbl	(%edx), %ebx
	jmp	.L37
.LVL56:
.L53:
	.loc 5 51 0
	movl	$cmdline_val+999, %ecx
.LVL57:
	jmp	.L32
.LVL58:
.L39:
	.loc 5 46 0
	movl	%ecx, %edi
	.loc 5 51 0
	movl	%edi, %ecx
	jmp	.L37
.LVL59:
.L43:
	movl	$cmdline_val, %ecx
.LVL60:
	xorl	%eax, %eax
	jmp	.L32
	.cfi_endproc
.LFE938:
	.size	parse_opt.constprop.219, .-parse_opt.constprop.219
	.p2align 4,,15
	.type	putDebugChar.constprop.247, @function
putDebugChar.constprop.247:
.LFB910:
	.file 6 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/machine/debug_helpers.c"
	.loc 6 25 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.p2align 4,,7
	.p2align 3
.L56:
	.loc 6 27 0
	movzwl	ia32KSdebugPort, %eax
	addl	$5, %eax
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	call	in8
.LVL61:
	testb	$32, %al
	je	.L56
	.loc 6 28 0
	movzwl	ia32KSdebugPort, %eax
	movl	$187, 4(%esp)
	movl	%eax, (%esp)
	call	out8
.LVL62:
	.loc 6 29 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE910:
	.size	putDebugChar.constprop.247, .-putDebugChar.constprop.247
	.p2align 4,,15
	.globl	restore_user_context
	.type	restore_user_context, @function
restore_user_context:
.LFB273:
	.file 7 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/c_traps.c"
	.loc 7 21 0
	.cfi_startproc
	.loc 7 23 0
	movl	ksCurThread, %eax
.LVL63:
	leal	76(%eax), %edx
.LVL64:
	movl	%edx, ia32KStss+4
	.loc 7 24 0
	movl	ia32KSfpuOwner, %edx
.LVL65:
	cmpl	%edx, %eax
	je	.L66
	.loc 7 27 0
	testl	%edx, %edx
	jne	.L67
.L60:
	.loc 7 35 0
	cmpl	$-1, 52(%eax)
	jne	.L61
	.loc 7 36 0
	andl	$-513, 64(%eax)
	.loc 7 37 0
#APP
# 37 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/c_traps.c" 1
	movl %eax, %esp
popl %eax
popl %ebx
addl $8, %esp
popl %esi
popl %edi
popl %ebp
cmpl $0x23, (%esp)
je 1f
popl %ds
jmp 2f
1: addl $4, %esp
2:
cmpl $0x23, (%esp)
je 1f
popl %es
jmp 2f
1: addl $4, %esp
2:
popl %fs
popl %gs
addl $12, %esp
popl %edx
addl $4,  %esp
popfl
orl $0x200, -4(%esp)
pop %ecx
sti
sysexit

# 0 "" 2
#NO_APP
.L63:
.L62:
	jmp	.L62
.L61:
	.loc 7 89 0
#APP
# 89 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/c_traps.c" 1
	movl %eax, %esp
popl %eax
popl %ebx
popl %ecx
popl %edx
popl %esi
popl %edi
popl %ebp
popl %ds
popl %es
popl %fs
popl %gs
addl $12, %esp
iret

# 0 "" 2
#NO_APP
	jmp	.L63
.L67:
.LBB3424:
.LBB3425:
.LBB3426:
.LBB3427:
	.loc 2 41 0
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %edx
# 0 "" 2
.LVL66:
#NO_APP
.LBE3427:
.LBE3426:
	.loc 3 53 0
	orl	$8, %edx
.LVL67:
.LBB3428:
.LBB3429:
	.loc 2 47 0
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %edx, %cr0
# 0 "" 2
#NO_APP
	jmp	.L60
.LVL68:
.L66:
.LBE3429:
.LBE3428:
.LBE3425:
.LBE3424:
.LBB3430:
.LBB3431:
	.loc 3 45 0
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
	.p2align 4,,8
	jmp	.L60
.LBE3431:
.LBE3430:
	.cfi_endproc
.LFE273:
	.size	restore_user_context, .-restore_user_context
	.p2align 4,,15
	.globl	apic_is_interrupt_pending
	.type	apic_is_interrupt_pending, @function
apic_is_interrupt_pending:
.LFB301:
	.file 8 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/kernel/apic.c"
	.loc 8 198 0
	.cfi_startproc
.LVL69:
.LBB3432:
.LBB3433:
	.loc 8 63 0
	movl	-65008, %eax
.LBE3433:
.LBE3432:
	.loc 8 204 0
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	.loc 8 209 0
	ret
	.cfi_endproc
.LFE301:
	.size	apic_is_interrupt_pending, .-apic_is_interrupt_pending
	.p2align 4,,15
	.globl	apic_ack_active_interrupt
	.type	apic_ack_active_interrupt, @function
apic_ack_active_interrupt:
.LFB302:
	.loc 8 212 0
	.cfi_startproc
.LVL70:
.LBB3434:
.LBB3435:
	.loc 8 69 0
	movl	$0, -65360
	ret
.LBE3435:
.LBE3434:
	.cfi_endproc
.LFE302:
	.size	apic_ack_active_interrupt, .-apic_ack_active_interrupt
	.p2align 4,,15
	.globl	in_boot_phase
	.type	in_boot_phase, @function
in_boot_phase:
.LFB315:
	.file 9 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/kernel/boot_sys.c"
	.loc 9 122 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 9 123 0
	call	get_current_esp
.LVL71:
.LBB3438:
.LBB3439:
	.file 10 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/plat/pc99/plat/machine/hardware.h"
	.loc 10 41 0
	leal	536870912(%eax), %edx
.LBE3439:
.LBE3438:
	movl	$1, %eax
.LVL72:
	.loc 9 125 0
	cmpl	$524288, %edx
	jbe	.L71
	xorb	%al, %al
	.loc 9 125 0 is_stmt 0 discriminator 2
	cmpl	$_boot_stack_top, %edx
	ja	.L71
	.loc 9 126 0 is_stmt 1
	xorl	%eax, %eax
	cmpl	$_boot_stack_bottom, %edx
	seta	%al
.L71:
	.loc 9 127 0 discriminator 4
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE315:
	.size	in_boot_phase, .-in_boot_phase
	.section	.boot.text,"ax",@progbits
	.p2align 4,,15
	.globl	console_port_of_node
	.type	console_port_of_node, @function
console_port_of_node:
.LFB316:
	.loc 9 131 0
	.cfi_startproc
.LVL73:
	.loc 9 132 0
	movl	4(%esp), %eax
	movzwl	cmdline_opt(%eax,%eax), %eax
	.loc 9 133 0
	ret
	.cfi_endproc
.LFE316:
	.size	console_port_of_node, .-console_port_of_node
	.p2align 4,,15
	.globl	debug_port_of_node
	.type	debug_port_of_node, @function
debug_port_of_node:
.LFB317:
	.loc 9 137 0
	.cfi_startproc
.LVL74:
	.loc 9 138 0
	movl	4(%esp), %eax
	movzwl	cmdline_opt+16(%eax,%eax), %eax
	.loc 9 139 0
	ret
	.cfi_endproc
.LFE317:
	.size	debug_port_of_node, .-debug_port_of_node
	.p2align 4,,15
	.globl	cur_cpu_id
	.type	cur_cpu_id, @function
cur_cpu_id:
.LFB320:
	.loc 9 227 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 9 229 0
	call	get_current_esp
.LVL75:
.LBB3442:
.LBB3443:
	.loc 10 41 0
	addl	$536870912, %eax
.LVL76:
.LBE3443:
.LBE3442:
	.loc 9 231 0
	cmpl	$_boot_stack_top, %eax
	ja	.L78
	.loc 9 231 0 is_stmt 0 discriminator 1
	cmpl	$_boot_stack_bottom, %eax
	ja	.L81
.L78:
	.loc 9 234 0 is_stmt 1
	shrl	$11, %eax
.LVL77:
	.loc 9 238 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL78:
	.p2align 4,,7
	.p2align 3
.L81:
	.cfi_restore_state
	.loc 9 232 0
	movl	glks+28, %eax
.LVL79:
	.loc 9 238 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE320:
	.size	cur_cpu_id, .-cur_cpu_id
	.p2align 4,,15
	.globl	elf32_checkFile
	.type	elf32_checkFile, @function
elf32_checkFile:
.LFB334:
	.file 11 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/kernel/elf.c"
	.loc 11 18 0
	.cfi_startproc
.LVL80:
	.loc 11 18 0
	movl	4(%esp), %edx
	xorl	%eax, %eax
	.loc 11 23 0
	cmpl	$1179403647, (%edx)
	je	.L85
	.loc 11 26 0
	rep ret
	.p2align 4,,7
	.p2align 3
.L85:
	.loc 11 23 0 discriminator 1
	xorl	%eax, %eax
	cmpb	$1, 4(%edx)
	sete	%al
	.loc 11 26 0 discriminator 1
	ret
	.cfi_endproc
.LFE334:
	.size	elf32_checkFile, .-elf32_checkFile
	.p2align 4,,15
	.globl	elf32_getMemoryBounds
	.type	elf32_getMemoryBounds, @function
elf32_getMemoryBounds:
.LFB335:
	.loc 11 30 0
	.cfi_startproc
.LVL81:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 11 30 0
	movl	24(%esp), %edx
	movl	20(%esp), %eax
	.loc 11 31 0
	movl	28(%edx), %ebx
	.loc 11 41 0
	movzwl	44(%edx), %ecx
	.loc 11 31 0
	addl	%edx, %ebx
.LVL82:
	.loc 11 41 0
	testw	%cx, %cx
	je	.L90
	sall	$5, %ecx
	.loc 11 37 0
	movl	$-1, %edi
	leal	20(%ebx), %edx
	.loc 11 38 0
	xorl	%esi, %esi
	leal	20(%ebx,%ecx), %ebp
.LVL83:
	.p2align 4,,7
	.p2align 3
.L89:
	.loc 11 42 0
	movl	(%edx), %ecx
	testl	%ecx, %ecx
	je	.L88
	.loc 11 43 0
	movl	-12(%edx), %ebx
.LVL84:
	.loc 11 44 0
	addl	%ebx, %ecx
.LVL85:
	cmpl	%ebx, %edi
	cmova	%ebx, %edi
.LVL86:
	cmpl	%ecx, %esi
	cmovb	%ecx, %esi
.LVL87:
.L88:
	addl	$32, %edx
	.loc 11 41 0
	cmpl	%ebp, %edx
	jne	.L89
.LVL88:
.L87:
	.loc 11 54 0
	movl	%edi, (%eax)
	movl	%esi, 4(%eax)
	.loc 11 55 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL89:
.L90:
	.cfi_restore_state
	.loc 11 37 0
	movl	$-1, %edi
	.loc 11 38 0
	xorl	%esi, %esi
	jmp	.L87
	.cfi_endproc
.LFE335:
	.size	elf32_getMemoryBounds, .-elf32_getMemoryBounds
	.p2align 4,,15
	.globl	Arch_configureIdleThread
	.type	Arch_configureIdleThread, @function
Arch_configureIdleThread:
.LFB338:
	.file 12 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/kernel/thread.c"
	.loc 12 41 0
	.cfi_startproc
.LVL90:
	.loc 12 41 0
	movl	4(%esp), %eax
.LVL91:
.LBB3444:
.LBB3445:
	.file 13 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/machine/registerset.h"
	.loc 13 21 0
	movl	$514, 64(%eax)
.LVL92:
.LBE3445:
.LBE3444:
.LBB3446:
.LBB3447:
	movl	$idle_thread, 56(%eax)
.LVL93:
.LBE3447:
.LBE3446:
.LBB3448:
.LBB3449:
	movl	$8, 60(%eax)
.LVL94:
.LBE3449:
.LBE3448:
.LBB3450:
.LBB3451:
	movl	$16, 28(%eax)
.LVL95:
.LBE3451:
.LBE3450:
.LBB3452:
.LBB3453:
	movl	$16, 32(%eax)
.LVL96:
.LBE3453:
.LBE3452:
.LBB3454:
.LBB3455:
	movl	$16, 36(%eax)
.LVL97:
.LBE3455:
.LBE3454:
.LBB3456:
.LBB3457:
	movl	$16, 40(%eax)
.LVL98:
.LBE3457:
.LBE3456:
.LBB3458:
.LBB3459:
	movl	$16, 72(%eax)
	ret
.LBE3459:
.LBE3458:
	.cfi_endproc
.LFE338:
	.size	Arch_configureIdleThread, .-Arch_configureIdleThread
	.text
	.p2align 4,,15
	.globl	Arch_switchToIdleThread
	.type	Arch_switchToIdleThread, @function
Arch_switchToIdleThread:
.LFB339:
	.loc 12 54 0
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE339:
	.size	Arch_switchToIdleThread, .-Arch_switchToIdleThread
	.p2align 4,,15
	.globl	Arch_activateIdleThread
	.type	Arch_activateIdleThread, @function
Arch_activateIdleThread:
.LFB340:
	.loc 12 60 0
	.cfi_startproc
.LVL99:
	rep ret
	.cfi_endproc
.LFE340:
	.size	Arch_activateIdleThread, .-Arch_activateIdleThread
	.section	.phys.text,"ax",@progbits
	.p2align 4,,15
	.globl	init_boot_pd
	.type	init_boot_pd, @function
init_boot_pd:
.LFB342:
	.loc 4 76 0
	.cfi_startproc
.LVL100:
	.loc 4 80 0
	xorl	%eax, %eax
.LVL101:
	.p2align 4,,7
	.p2align 3
.L100:
	.loc 4 81 0
	movl	%eax, %edx
	sall	$22, %edx
.LVL102:
.LBB3464:
.LBB3465:
	.loc 4 71 0
	orl	$387, %edx
.LVL103:
	movl	%edx, _boot_pd(,%eax,4)
.LBE3465:
.LBE3464:
	.loc 4 80 0
	addl	$1, %eax
.LVL104:
	cmpl	$896, %eax
	jne	.L100
	xorw	%ax, %ax
.LVL105:
	.p2align 4,,7
	.p2align 3
.L102:
	.loc 4 99 0
	movl	%eax, %edx
	sall	$22, %edx
.LVL106:
.LBB3466:
.LBB3467:
	.loc 4 71 0
	orl	$387, %edx
.LVL107:
	movl	%edx, _boot_pd+3584(,%eax,4)
.LBE3467:
.LBE3466:
	.loc 4 98 0
	addl	$1, %eax
.LVL108:
	cmpl	$128, %eax
	jne	.L102
	.loc 4 114 0
	rep ret
	.cfi_endproc
.LFE342:
	.size	init_boot_pd, .-init_boot_pd
	.section	.boot.text
	.p2align 4,,15
	.globl	init_dtrs
	.type	init_dtrs, @function
init_dtrs:
.LFB350:
	.loc 4 891 0
	.cfi_startproc
	.loc 4 893 0
	movl	$63, %eax
	.loc 4 891 0
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 4 893 0
	movw	%ax, gdt_idt_ptr
	.loc 4 894 0
	movl	$ia32KSgdt, %eax
	movw	%ax, gdt_idt_ptr+2
	.loc 4 895 0
	shrl	$16, %eax
	.loc 4 896 0
	movl	$gdt_idt_ptr, (%esp)
	.loc 4 895 0
	movw	%ax, gdt_idt_ptr+4
	.loc 4 896 0
	call	ia32_install_gdt
.LVL109:
	.loc 4 900 0
	movl	$ia32KSidt, %eax
	.loc 4 899 0
	movl	$2047, %edx
	.loc 4 900 0
	movw	%ax, gdt_idt_ptr+2
	.loc 4 901 0
	shrl	$16, %eax
	.loc 4 902 0
	movl	$gdt_idt_ptr, (%esp)
	.loc 4 899 0
	movw	%dx, gdt_idt_ptr
	.loc 4 901 0
	movw	%ax, gdt_idt_ptr+4
	.loc 4 902 0
	call	ia32_install_idt
.LVL110:
	.loc 4 905 0
	movl	$0, (%esp)
	call	ia32_install_ldt
.LVL111:
	.loc 4 908 0
	movl	$40, (%esp)
	call	ia32_install_tss
.LVL112:
	.loc 4 909 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE350:
	.size	init_dtrs, .-init_dtrs
	.text
	.p2align 4,,15
	.globl	maskVMRights
	.type	maskVMRights, @function
maskVMRights:
.LFB365:
	.loc 4 1172 0
	.cfi_startproc
.LVL113:
	.loc 4 1172 0
	movl	4(%esp), %edx
	.loc 4 1173 0
	cmpl	$2, %edx
	je	.L113
	.loc 4 1176 0
	cmpl	$3, %edx
	.loc 4 1183 0
	movl	$1, %eax
	.loc 4 1176 0
	je	.L114
.LVL114:
.L107:
	.loc 4 1184 0
	rep ret
	.p2align 4,,7
	.p2align 3
.L114:
.LVL115:
	.loc 4 1176 0 discriminator 1
	testb	$2, 8(%esp)
	je	.L107
.LVL116:
.LBB3468:
.LBB3469:
	.file 14 "./api/types_gen.h"
	.loc 14 125 0
	movl	8(%esp), %eax
	andl	$1, %eax
.LBE3469:
.LBE3468:
	.loc 4 1180 0
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$3, %eax
	.loc 4 1184 0
	ret
.LVL117:
	.p2align 4,,7
	.p2align 3
.L113:
.LBB3470:
.LBB3471:
	.loc 14 120 0 discriminator 1
	movl	8(%esp), %eax
	andl	$2, %eax
	shrl	%eax
.LBE3471:
.LBE3470:
	.loc 4 1174 0 discriminator 1
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$2, %eax
	ret
	.cfi_endproc
.LFE365:
	.size	maskVMRights, .-maskVMRights
	.p2align 4,,15
	.globl	copyGlobalMappings
	.type	copyGlobalMappings, @function
copyGlobalMappings:
.LFB373:
	.loc 4 1393 0
	.cfi_startproc
.LVL118:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	ia32KSkernelPD, %ecx
	.loc 4 1396 0
	movl	$896, %eax
	.loc 4 1393 0
	movl	8(%esp), %ebx
.LVL119:
	.p2align 4,,7
	.p2align 3
.L117:
	.loc 4 1397 0 discriminator 2
	movl	(%ecx,%eax,4), %edx
	movl	%edx, (%ebx,%eax,4)
	.loc 4 1396 0 discriminator 2
	addl	$1, %eax
.LVL120:
	cmpl	$1024, %eax
	jne	.L117
	.loc 4 1399 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE373:
	.size	copyGlobalMappings, .-copyGlobalMappings
	.p2align 4,,15
	.globl	Arch_initFpuContext
	.type	Arch_initFpuContext, @function
Arch_initFpuContext:
.LFB395:
	.file 15 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/machine/fpu.c"
	.loc 15 24 0
	.cfi_startproc
.LVL121:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.loc 15 25 0
	movl	$128, %ecx
	.loc 15 24 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	.loc 15 25 0
	movl	12(%esp), %eax
	movl	$ia32KSnullFpuState, %esi
	leal	80(%eax), %edi
	rep movsl
	.loc 15 26 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE395:
	.size	Arch_initFpuContext, .-Arch_initFpuContext
	.p2align 4,,15
	.globl	Arch_fpuThreadDelete
	.type	Arch_fpuThreadDelete, @function
Arch_fpuThreadDelete:
.LFB398:
	.loc 15 75 0
	.cfi_startproc
.LVL122:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 15 80 0
	movl	ia32KSfpuOwner, %eax
	cmpl	32(%esp), %eax
	je	.L128
	.loc 15 83 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L128:
	.cfi_restore_state
.LVL123:
.LBB3482:
.LBB3483:
.LBB3484:
.LBB3485:
	.loc 3 45 0
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.LBE3485:
.LBE3484:
	.loc 15 35 0
	testl	%eax, %eax
	je	.L123
	.loc 15 36 0
	addl	$80, %eax
	movl	%eax, (%esp)
	call	saveFpuState
.LVL124:
.L123:
.LBB3486:
.LBB3487:
.LBB3488:
.LBB3489:
	.loc 2 41 0
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
.LVL125:
#NO_APP
.LBE3489:
.LBE3488:
	.loc 3 53 0
	orl	$8, %eax
.LVL126:
.LBB3490:
.LBB3491:
	.loc 2 47 0
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
.LBE3491:
.LBE3490:
.LBE3487:
.LBE3486:
	.loc 15 43 0
	movl	$0, ia32KSfpuOwner
.LBE3483:
.LBE3482:
	.loc 15 83 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE398:
	.size	Arch_fpuThreadDelete, .-Arch_fpuThreadDelete
	.section	.boot.text
	.p2align 4,,15
	.globl	Arch_initFpu
	.type	Arch_initFpu, @function
Arch_initFpu:
.LFB399:
	.loc 15 90 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 15 92 0
	call	read_cr4
.LVL127:
	orb	$2, %ah
	movl	%eax, (%esp)
	call	write_cr4
.LVL128:
.LBB3496:
.LBB3497:
	.loc 2 41 0
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
.LVL129:
#NO_APP
.LBE3497:
.LBE3496:
	.loc 15 97 0
	andl	$-47, %eax
.LVL130:
	orl	$42, %eax
.LVL131:
.LBB3498:
.LBB3499:
	.loc 2 47 0
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
.LBE3499:
.LBE3498:
	.loc 15 98 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE399:
	.size	Arch_initFpu, .-Arch_initFpu
	.p2align 4,,15
	.globl	init_sysenter_msrs
	.type	init_sysenter_msrs, @function
init_sysenter_msrs:
.LFB400:
	.file 16 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/machine/hardware.c"
	.loc 16 23 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 16 24 0
	movl	$8, 8(%esp)
	movl	$0, 4(%esp)
	movl	$372, (%esp)
	call	ia32_wrmsr
.LVL132:
	.loc 16 25 0
	movl	$handle_syscall, 8(%esp)
	movl	$0, 4(%esp)
	movl	$374, (%esp)
	call	ia32_wrmsr
.LVL133:
	.loc 16 26 0
	movl	$ia32KStss+4, 8(%esp)
	movl	$0, 4(%esp)
	movl	$373, (%esp)
	call	ia32_wrmsr
.LVL134:
	.loc 16 27 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE400:
	.size	init_sysenter_msrs, .-init_sysenter_msrs
	.text
	.p2align 4,,15
	.globl	getRestartPC
	.type	getRestartPC, @function
getRestartPC:
.LFB401:
	.loc 16 30 0
	.cfi_startproc
.LVL135:
	.loc 16 31 0
	movl	4(%esp), %eax
	movl	44(%eax), %eax
	.loc 16 32 0
	ret
	.cfi_endproc
.LFE401:
	.size	getRestartPC, .-getRestartPC
	.p2align 4,,15
	.globl	setNextPC
	.type	setNextPC, @function
setNextPC:
.LFB402:
	.loc 16 35 0
	.cfi_startproc
.LVL136:
.LBB3500:
.LBB3501:
	.loc 13 21 0
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	movl	%edx, 56(%eax)
	ret
.LBE3501:
.LBE3500:
	.cfi_endproc
.LFE402:
	.size	setNextPC, .-setNextPC
	.p2align 4,,15
	.globl	Arch_initContext
	.type	Arch_initContext, @function
Arch_initContext:
.LFB405:
	.file 17 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/machine/registerset.c"
	.loc 17 36 0
	.cfi_startproc
.LVL137:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
.LBB3504:
.LBB3505:
	.loc 15 25 0
	movl	$128, %ecx
.LBE3505:
.LBE3504:
	.loc 17 36 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	.loc 17 36 0
	movl	12(%esp), %edi
.LBB3509:
.LBB3506:
	.loc 15 25 0
	movl	$ia32KSnullFpuState, %esi
.LBE3506:
.LBE3509:
	.loc 17 37 0
	movl	$0, (%edi)
.LBB3510:
.LBB3507:
	.loc 15 25 0
	addl	$80, %edi
.LBE3507:
.LBE3510:
	.loc 17 38 0
	movl	$0, -76(%edi)
	.loc 17 39 0
	movl	$0, -72(%edi)
	.loc 17 40 0
	movl	$0, -68(%edi)
	.loc 17 41 0
	movl	$0, -64(%edi)
	.loc 17 42 0
	movl	$0, -60(%edi)
	.loc 17 43 0
	movl	$0, -56(%edi)
	.loc 17 44 0
	movl	$35, -52(%edi)
	.loc 17 45 0
	movl	$35, -48(%edi)
	.loc 17 46 0
	movl	$0, -44(%edi)
	.loc 17 47 0
	movl	$0, -40(%edi)
	.loc 17 48 0
	movl	$0, -32(%edi)
	.loc 17 49 0
	movl	$0, -28(%edi)
	.loc 17 50 0
	movl	$0, -36(%edi)
	.loc 17 51 0
	movl	$0, -24(%edi)
	.loc 17 52 0
	movl	$27, -20(%edi)
	.loc 17 53 0
	movl	$514, -16(%edi)
	.loc 17 54 0
	movl	$0, -12(%edi)
	.loc 17 55 0
	movl	$35, -8(%edi)
.LBB3511:
.LBB3508:
	.loc 15 25 0
	rep movsl
.LBE3508:
.LBE3511:
	.loc 17 58 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE405:
	.size	Arch_initContext, .-Arch_initContext
	.p2align 4,,15
	.globl	sanitiseRegister
	.type	sanitiseRegister, @function
sanitiseRegister:
.LFB406:
	.loc 17 61 0
	.cfi_startproc
.LVL138:
	.loc 17 61 0
	movl	4(%esp), %edx
	movl	8(%esp), %eax
	.loc 17 62 0
	cmpl	$16, %edx
	je	.L141
	.loc 17 69 0
	subl	$9, %edx
	cmpl	$1, %edx
	ja	.L139
	.loc 17 70 0
	movl	%eax, %edx
	andl	$-9, %edx
	.loc 17 71 0
	cmpl	$51, %edx
	movl	$0, %edx
	cmovne	%edx, %eax
.L139:
.LVL139:
	.loc 17 75 0
	rep ret
.LVL140:
	.p2align 4,,7
	.p2align 3
.L141:
	.loc 17 67 0
	andl	$4055, %eax
.LVL141:
	orl	$514, %eax
.LVL142:
	ret
	.cfi_endproc
.LFE406:
	.size	sanitiseRegister, .-sanitiseRegister
	.p2align 4,,15
	.globl	Arch_decodeInterruptControl
	.type	Arch_decodeInterruptControl, @function
Arch_decodeInterruptControl:
.LFB407:
	.file 18 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/object/interrupt.c"
	.loc 18 17 0
	.cfi_startproc
.LVL143:
	.loc 18 18 0
	movl	$3, current_syscall_error+24
	.loc 18 20 0
	movl	$3, %eax
	ret
	.cfi_endproc
.LFE407:
	.size	Arch_decodeInterruptControl, .-Arch_decodeInterruptControl
	.p2align 4,,15
	.globl	Arch_prepareThreadDelete
	.type	Arch_prepareThreadDelete, @function
Arch_prepareThreadDelete:
.LFB422:
	.file 19 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/object/objecttype.c"
	.loc 19 531 0
	.cfi_startproc
.LVL144:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 19 531 0
	movl	32(%esp), %eax
.LVL145:
.LBB3524:
.LBB3525:
	.loc 15 80 0
	cmpl	ia32KSfpuOwner, %eax
	je	.L150
.LBE3525:
.LBE3524:
	.loc 19 534 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L150:
	.cfi_restore_state
.LVL146:
.LBB3537:
.LBB3536:
.LBB3526:
.LBB3527:
.LBB3528:
.LBB3529:
	.loc 3 45 0
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.LBE3529:
.LBE3528:
	.loc 15 35 0
	testl	%eax, %eax
	je	.L145
	.loc 15 36 0
	addl	$80, %eax
.LVL147:
	movl	%eax, (%esp)
	call	saveFpuState
.LVL148:
.L145:
.LBB3530:
.LBB3531:
.LBB3532:
.LBB3533:
	.loc 2 41 0
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
.LVL149:
#NO_APP
.LBE3533:
.LBE3532:
	.loc 3 53 0
	orl	$8, %eax
.LVL150:
.LBB3534:
.LBB3535:
	.loc 2 47 0
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
.LBE3535:
.LBE3534:
.LBE3531:
.LBE3530:
	.loc 15 43 0
	movl	$0, ia32KSfpuOwner
.LBE3527:
.LBE3526:
.LBE3536:
.LBE3537:
	.loc 19 534 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE422:
	.size	Arch_prepareThreadDelete, .-Arch_prepareThreadDelete
	.p2align 4,,15
	.globl	Arch_decodeTransfer
	.type	Arch_decodeTransfer, @function
Arch_decodeTransfer:
.LFB426:
	.file 20 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/object/tcb.c"
	.loc 20 192 0
	.cfi_startproc
.LVL151:
	.loc 20 194 0
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE426:
	.size	Arch_decodeTransfer, .-Arch_decodeTransfer
	.p2align 4,,15
	.globl	Arch_performTransfer
	.type	Arch_performTransfer, @function
Arch_performTransfer:
.LFB427:
	.loc 20 197 0
	.cfi_startproc
.LVL152:
	.loc 20 199 0
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE427:
	.size	Arch_performTransfer, .-Arch_performTransfer
	.section	.boot.text
	.p2align 4,,15
	.globl	bi_finalise
	.type	bi_finalise, @function
bi_finalise:
.LFB450:
	.file 21 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/kernel/boot.c"
	.loc 21 526 0
	.cfi_startproc
.LVL153:
	.loc 21 528 0
	movl	ndks_boot+24, %edx
.LVL154:
	.loc 21 529 0
	movl	ndks_boot+16, %eax
	movl	ndks_boot+20, %ecx
	movl	%edx, 20(%eax)
.LVL155:
	movl	%ecx, 16(%eax)
	ret
	.cfi_endproc
.LFE450:
	.size	bi_finalise, .-bi_finalise
	.text
	.p2align 4,,15
	.globl	switchToIdleThread
	.type	switchToIdleThread, @function
switchToIdleThread:
.LFB479:
	.file 22 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/kernel/thread.c"
	.loc 22 353 0
	.cfi_startproc
	.loc 22 355 0
	movl	ksIdleThread, %eax
	movl	%eax, ksCurThread
	ret
	.cfi_endproc
.LFE479:
	.size	switchToIdleThread, .-switchToIdleThread
	.p2align 4,,15
	.globl	preemptionPoint
	.type	preemptionPoint, @function
preemptionPoint:
.LFB497:
	.file 23 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/model/preemption.c"
	.loc 23 22 0
	.cfi_startproc
	.loc 23 24 0
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	.loc 23 34 0
	cmpl	$99, %eax
	ja	.L156
	.loc 23 24 0
	movl	%eax, ksWorkUnitsCompleted
	.loc 23 41 0
	xorl	%eax, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L156:
.LBB3548:
	.loc 23 35 0
	movl	$0, ksWorkUnitsCompleted
.LVL156:
.LBB3549:
.LBB3550:
.LBB3551:
.LBB3552:
.LBB3553:
.LBB3554:
	.loc 8 63 0
	movl	-65008, %eax
.LBE3554:
.LBE3553:
	.loc 8 204 0
	testl	%eax, %eax
	jne	.L165
.LVL157:
.LBE3552:
.LBE3551:
.LBE3550:
.LBE3549:
.LBE3548:
	.loc 23 22 0
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB3559:
.LBB3558:
.LBB3557:
.LBB3555:
.LBB3556:
	.file 24 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/machine/pic.c"
	.loc 24 77 0
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
.LVL158:
	.loc 24 80 0
	movl	$32, (%esp)
	call	in8
.LVL159:
.LBE3556:
.LBE3555:
	.file 25 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/machine/hardware.c"
	.loc 25 105 0
	testb	%al, %al
	jne	.L159
.LBE3557:
.LBE3558:
	.loc 23 41 0
	xorl	%eax, %eax
.LVL160:
.LBE3559:
	.loc 23 42 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL161:
	.p2align 4,,7
	.p2align 3
.L159:
	.cfi_restore_state
.LBB3560:
	.loc 23 37 0
	movl	$4, %eax
.LVL162:
.LBE3560:
	.loc 23 42 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
.LVL163:
	.p2align 4,,7
	.p2align 3
.L165:
.LBB3561:
	.loc 23 37 0
	movl	$4, %eax
.LBE3561:
	.loc 23 42 0
	ret
	.cfi_endproc
.LFE497:
	.size	preemptionPoint, .-preemptionPoint
	.p2align 4,,15
	.globl	ensureEmptySlot
	.type	ensureEmptySlot, @function
ensureEmptySlot:
.LFB530:
	.file 26 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/cnode.c"
	.loc 26 889 0
	.cfi_startproc
.LVL164:
	.loc 26 890 0
	movl	4(%esp), %eax
	movl	(%eax), %eax
.LVL165:
.LBB3562:
.LBB3563:
	.file 27 "./arch/object/structures_gen.h"
	.loc 27 872 0
	movl	%eax, %ecx
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %eax
.LVL166:
	cmpl	$14, %ecx
	cmove	%eax, %edx
.LBE3563:
.LBE3562:
	.loc 26 895 0
	xorl	%eax, %eax
	.loc 26 890 0
	testl	%edx, %edx
	je	.L169
	.loc 26 891 0
	movl	$8, current_syscall_error+24
	.loc 26 892 0
	movb	$3, %al
.L169:
	.loc 26 896 0
	rep ret
	.cfi_endproc
.LFE530:
	.size	ensureEmptySlot, .-ensureEmptySlot
	.p2align 4,,15
	.globl	loadCapTransfer
	.type	loadCapTransfer, @function
loadCapTransfer:
.LFB534:
	.loc 26 987 0
	.cfi_startproc
.LVL167:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.loc 26 987 0
	movl	12(%esp), %edx
.LVL168:
	movl	8(%esp), %eax
.LBB3564:
.LBB3565:
	.file 28 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/api/types.h"
	.loc 28 65 0
	movl	504(%edx), %ecx
	movl	%ecx, %ebx
.LVL169:
	.loc 28 66 0
	movl	508(%edx), %ecx
.LVL170:
	.loc 28 67 0
	movl	500(%edx), %edx
	movl	%ebx, 4(%eax)
	movl	%ecx, 8(%eax)
	movl	%edx, (%eax)
.LBE3565:
.LBE3564:
	.loc 26 990 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL171:
	ret	$4
	.cfi_endproc
.LFE534:
	.size	loadCapTransfer, .-loadCapTransfer
	.p2align 4,,15
	.globl	invokeIRQHandler_SetMode
	.type	invokeIRQHandler_SetMode, @function
invokeIRQHandler_SetMode:
.LFB548:
	.file 29 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/interrupt.c"
	.loc 29 164 0
	.cfi_startproc
.LVL172:
	rep ret
	.cfi_endproc
.LFE548:
	.size	invokeIRQHandler_SetMode, .-invokeIRQHandler_SetMode
	.p2align 4,,15
	.globl	isIRQActive
	.type	isIRQActive, @function
isIRQActive:
.LFB554:
	.loc 29 256 0
	.cfi_startproc
.LVL173:
	.loc 29 257 0
	movl	4(%esp), %eax
	movl	intStateIRQTable(,%eax,4), %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	.loc 29 258 0
	ret
	.cfi_endproc
.LFE554:
	.size	isIRQActive, .-isIRQActive
	.p2align 4,,15
	.globl	tcbEPAppend
	.type	tcbEPAppend, @function
tcbEPAppend:
.LFB575:
	.file 30 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/tcb.c"
	.loc 30 129 0
	.cfi_startproc
.LVL174:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	16(%esp), %ecx
.LVL175:
	.loc 30 129 0
	movl	8(%esp), %eax
	movl	12(%esp), %edx
.LVL176:
	movl	20(%esp), %ebx
.LVL177:
	.loc 30 130 0
	testl	%ecx, %ecx
	je	.L178
	.loc 30 133 0
	movl	%edx, 648(%ebx)
.LVL178:
.L177:
	.loc 30 135 0
	movl	%ebx, 652(%edx)
	.loc 30 136 0
	movl	$0, 648(%edx)
.LVL179:
	.loc 30 139 0
	movl	%ecx, (%eax)
	movl	%edx, 4(%eax)
	.loc 30 140 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
.LVL180:
	.p2align 4,,7
	.p2align 3
.L178:
	.cfi_restore_state
	movl	%edx, %ecx
.LVL181:
	jmp	.L177
	.cfi_endproc
.LFE575:
	.size	tcbEPAppend, .-tcbEPAppend
	.p2align 4,,15
	.globl	tcbEPDequeue
	.type	tcbEPDequeue, @function
tcbEPDequeue:
.LFB576:
	.loc 30 145 0
	.cfi_startproc
.LVL182:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 30 145 0
	movl	20(%esp), %edx
	movl	16(%esp), %eax
	movl	24(%esp), %ebx
.LVL183:
	movl	28(%esp), %esi
.LVL184:
	.loc 30 146 0
	movl	652(%edx), %ecx
	testl	%ecx, %ecx
	je	.L181
	.loc 30 147 0
	movl	648(%edx), %edi
	movl	%edi, 648(%ecx)
	movl	648(%edx), %edx
.LVL185:
	.loc 30 152 0
	testl	%edx, %edx
	je	.L184
.L186:
	.loc 30 153 0
	movl	%ecx, 652(%edx)
	.loc 30 158 0
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
	.loc 30 159 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL186:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL187:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL188:
	.p2align 4,,7
	.p2align 3
.L181:
	.cfi_restore_state
	.loc 30 149 0
	movl	648(%edx), %ebx
.LVL189:
	movl	%ebx, %edx
.LVL190:
	.loc 30 152 0
	testl	%edx, %edx
	jne	.L186
	.p2align 4,,7
	.p2align 3
.L184:
	.loc 30 146 0
	movl	%ecx, %esi
.LVL191:
	.loc 30 158 0
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
	.loc 30 159 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL192:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL193:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE576:
	.size	tcbEPDequeue, .-tcbEPDequeue
	.p2align 4,,15
	.globl	getExtraCPtr
	.type	getExtraCPtr, @function
getExtraCPtr:
.LFB577:
	.loc 30 163 0
	.cfi_startproc
.LVL194:
	.loc 30 164 0
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	movl	488(%eax,%edx,4), %eax
	.loc 30 165 0
	ret
	.cfi_endproc
.LFE577:
	.size	getExtraCPtr, .-getExtraCPtr
	.p2align 4,,15
	.globl	setExtraBadge
	.type	setExtraBadge, @function
setExtraBadge:
.LFB578:
	.loc 30 170 0
	.cfi_startproc
.LVL195:
	.loc 30 171 0
	movl	12(%esp), %edx
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movl	%ecx, 488(%eax,%edx,4)
	ret
	.cfi_endproc
.LFE578:
	.size	setExtraBadge, .-setExtraBadge
	.p2align 4,,15
	.globl	copyMRs
	.type	copyMRs, @function
copyMRs:
.LFB582:
	.loc 30 242 0
	.cfi_startproc
.LVL196:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 30 242 0
	movl	32(%esp), %eax
	movl	16(%esp), %ecx
	movl	20(%esp), %esi
	movl	24(%esp), %edx
	.loc 30 246 0
	testl	%eax, %eax
	.loc 30 242 0
	movl	28(%esp), %ebx
	.loc 30 246 0
	je	.L197
.LVL197:
.LBB3570:
.LBB3571:
	.loc 13 21 0
	movl	20(%ecx), %edi
.LBE3571:
.LBE3570:
	.loc 30 246 0
	cmpl	$1, %eax
.LBB3574:
.LBB3572:
	.loc 13 21 0
	movl	%edi, 20(%edx)
.LVL198:
.LBE3572:
.LBE3574:
	.loc 30 246 0
	jbe	.L193
.LVL199:
.LBB3575:
.LBB3576:
	.loc 13 27 0
	movl	24(%ecx), %ecx
.LVL200:
.LBE3576:
.LBE3575:
	.loc 30 251 0
	testl	%ebx, %ebx
.LBB3577:
.LBB3573:
	.loc 13 21 0
	movl	%ecx, 24(%edx)
.LVL201:
.LBE3573:
.LBE3577:
	.loc 30 251 0
	je	.L195
	testl	%esi, %esi
	je	.L195
	.loc 30 256 0 discriminator 1
	cmpl	$2, %eax
	jbe	.L195
	.loc 30 246 0
	movl	$2, %edx
.LVL202:
	.p2align 4,,7
	.p2align 3
.L192:
	.loc 30 257 0 discriminator 2
	addl	$1, %edx
.LVL203:
	movl	(%esi,%edx,4), %ecx
	.loc 30 256 0 discriminator 2
	cmpl	%eax, %edx
	.loc 30 257 0 discriminator 2
	movl	%ecx, (%ebx,%edx,4)
.LVL204:
	.loc 30 256 0 discriminator 2
	jne	.L192
.LVL205:
.L197:
	.loc 30 261 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL206:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL207:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL208:
	.p2align 4,,7
	.p2align 3
.L195:
	.cfi_restore_state
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL209:
	.loc 30 246 0
	movl	$2, %eax
.LVL210:
	.loc 30 261 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL211:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL212:
	.p2align 4,,7
	.p2align 3
.L193:
	.cfi_restore_state
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL213:
	.loc 30 246 0
	movl	$1, %eax
.LVL214:
	.loc 30 261 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL215:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL216:
	ret
	.cfi_endproc
.LFE582:
	.size	copyMRs, .-copyMRs
	.p2align 4,,15
	.globl	getDebugChar
	.type	getDebugChar, @function
getDebugChar:
.LFB606:
	.loc 6 20 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.p2align 4,,7
	.p2align 3
.L203:
	.loc 6 21 0 discriminator 1
	movzwl	ia32KSdebugPort, %eax
	addl	$5, %eax
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	call	in8
.LVL217:
	testb	$1, %al
	je	.L203
	.loc 6 22 0
	movzwl	ia32KSdebugPort, %eax
	movl	%eax, (%esp)
	call	in8
.LVL218:
	.loc 6 23 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE606:
	.size	getDebugChar, .-getDebugChar
	.p2align 4,,15
	.type	getDecodedChar, @function
getDecodedChar:
.LFB381:
	.file 31 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/machine/capdl.c"
	.loc 31 31 0
	.cfi_startproc
.LVL219:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	%eax, %ebx
	subl	$24, %esp
	.cfi_def_cfa_offset 32
.LVL220:
	.p2align 4,,7
	.p2align 3
.L207:
.LBB3582:
.LBB3583:
	.loc 6 21 0
	movzwl	ia32KSdebugPort, %eax
	leal	5(%eax), %edx
	movzwl	%dx, %edx
	movl	%edx, (%esp)
	call	in8
.LVL221:
	testb	$1, %al
	je	.L207
	.loc 6 22 0
	movzwl	ia32KSdebugPort, %eax
	movl	%eax, (%esp)
	call	in8
.LVL222:
.LBE3583:
.LBE3582:
	.loc 31 34 0
	cmpb	$-1, %al
	je	.L215
	.loc 31 37 0
	cmpb	$-86, %al
	je	.L220
	.loc 31 59 0
	movb	%al, (%ebx)
	.loc 31 60 0
	xorl	%eax, %eax
.L208:
	.loc 31 62 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL223:
	ret
.LVL224:
	.p2align 4,,7
	.p2align 3
.L215:
	.cfi_restore_state
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.loc 31 35 0
	movl	$1, %eax
	.loc 31 62 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL225:
	ret
.LVL226:
.L220:
	.cfi_restore_state
.LBB3584:
.LBB3585:
	.loc 31 38 0
	call	getDebugChar
.LVL227:
	.loc 31 39 0
	cmpb	$-1, %al
	je	.L215
	.loc 31 42 0
	cmpb	$-95, %al
	.p2align 4,,4
	je	.L212
	cmpb	$-94, %al
	.p2align 4,,5
	je	.L213
	cmpb	$-96, %al
	.p2align 4,,5
	je	.L221
	.loc 31 53 0
	leal	-20(%eax), %edx
	.loc 31 57 0
	xorl	%eax, %eax
.LVL228:
	.loc 31 53 0
	cmpb	$19, %dl
	ja	.L208
	.loc 31 54 0
	movb	%dl, (%ebx)
	jmp	.L208
.LVL229:
.L213:
	.loc 31 50 0
	movb	$-69, (%ebx)
	.loc 31 57 0
	xorl	%eax, %eax
.LVL230:
	jmp	.L208
.LVL231:
.L212:
	.loc 31 44 0
	movb	$-86, (%ebx)
	.loc 31 57 0
	xorl	%eax, %eax
.LVL232:
	jmp	.L208
.LVL233:
.L221:
	.loc 31 47 0
	movb	$-1, (%ebx)
	.loc 31 57 0
	xorl	%eax, %eax
.LVL234:
	jmp	.L208
.LBE3585:
.LBE3584:
	.cfi_endproc
.LFE381:
	.size	getDecodedChar, .-getDecodedChar
	.p2align 4,,15
	.type	getArg32, @function
getArg32:
.LFB383:
	.loc 31 90 0
	.cfi_startproc
.LVL235:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%eax, %ebx
	subl	$32, %esp
	.cfi_def_cfa_offset 48
	.loc 31 93 0
	movb	$0, 24(%esp)
	.loc 31 94 0
	movb	$0, 28(%esp)
.LVL236:
	.p2align 4,,7
	.p2align 3
.L224:
.LBB3598:
.LBB3599:
.LBB3600:
.LBB3601:
	.loc 6 21 0
	movzwl	ia32KSdebugPort, %eax
	leal	5(%eax), %edx
	movzwl	%dx, %edx
	movl	%edx, (%esp)
	call	in8
.LVL237:
	testb	$1, %al
	je	.L224
	.loc 6 22 0
	movzwl	ia32KSdebugPort, %eax
	movl	%eax, (%esp)
	call	in8
.LVL238:
.LBE3601:
.LBE3600:
	.loc 31 34 0
	cmpb	$-1, %al
.LBB3603:
.LBB3602:
	.loc 6 22 0
	movl	%eax, %esi
.LBE3602:
.LBE3603:
	.loc 31 34 0
	je	.L228
	.loc 31 37 0
	movl	%esi, %eax
	cmpb	$-86, %al
	je	.L263
.LVL239:
	.p2align 4,,7
	.p2align 3
.L233:
.LBE3599:
.LBE3598:
.LBB3607:
.LBB3608:
.LBB3609:
.LBB3610:
	.loc 6 21 0
	movzwl	ia32KSdebugPort, %eax
	leal	5(%eax), %edx
	movzwl	%dx, %edx
	movl	%edx, (%esp)
	call	in8
.LVL240:
	testb	$1, %al
	je	.L233
	.loc 6 22 0
	movzwl	ia32KSdebugPort, %eax
	movl	%eax, (%esp)
	call	in8
.LVL241:
.LBE3610:
.LBE3609:
	.loc 31 34 0
	cmpb	$-1, %al
.LBB3612:
.LBB3611:
	.loc 6 22 0
	movl	%eax, %edi
.LBE3611:
.LBE3612:
	.loc 31 34 0
	je	.L228
	.loc 31 37 0
	cmpb	$-86, %al
	je	.L264
.L234:
.LVL242:
.LBE3608:
.LBE3607:
	.loc 31 101 0
	leal	24(%esp), %eax
	call	getDecodedChar
.LVL243:
	testl	%eax, %eax
	je	.L265
.LVL244:
.L228:
	.loc 31 96 0
	movl	$1, %eax
.L261:
	.loc 31 109 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL245:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL246:
.L265:
	.cfi_restore_state
	.loc 31 104 0
	leal	28(%esp), %eax
	call	getDecodedChar
.LVL247:
	testl	%eax, %eax
	jne	.L228
	.loc 31 107 0
	movzbl	24(%esp), %edx
	sall	$24, %esi
	movzbl	28(%esp), %ecx
	sall	$8, %edx
	orl	%ecx, %edx
	movl	%edi, %ecx
	movzbl	%cl, %edi
.LVL248:
	orl	%esi, %edx
	sall	$16, %edi
	orl	%edi, %edx
	movl	%edx, (%ebx)
	.loc 31 108 0
	jmp	.L261
.LVL249:
.L263:
.LBB3616:
.LBB3606:
.LBB3604:
.LBB3605:
	.loc 31 38 0
	call	getDebugChar
.LVL250:
	.loc 31 39 0
	cmpb	$-1, %al
	je	.L228
	.loc 31 42 0
	cmpb	$-95, %al
	.p2align 4,,4
	je	.L233
	cmpb	$-94, %al
	.loc 31 50 0
	movl	$-69, %esi
	.loc 31 42 0
	je	.L233
	cmpb	$-96, %al
	.loc 31 47 0
	movl	$-1, %esi
	.loc 31 42 0
	je	.L233
	.loc 31 53 0
	leal	-20(%eax), %esi
.LBE3605:
.LBE3604:
.LBE3606:
.LBE3616:
	.loc 31 91 0
	movl	%esi, %eax
.LVL251:
	cmpb	$20, %al
	movl	$0, %eax
	cmovae	%eax, %esi
.LVL252:
	jmp	.L233
.LVL253:
.L264:
.LBB3617:
.LBB3615:
.LBB3613:
.LBB3614:
	.loc 31 38 0
	call	getDebugChar
.LVL254:
	.loc 31 39 0
	cmpb	$-1, %al
	je	.L228
	.loc 31 42 0
	cmpb	$-95, %al
	.p2align 4,,4
	je	.L234
	cmpb	$-94, %al
	.loc 31 50 0
	movl	$-69, %edi
	.loc 31 42 0
	je	.L234
	cmpb	$-96, %al
	.loc 31 47 0
	movl	$-1, %edi
	.loc 31 42 0
	je	.L234
	.loc 31 53 0
	leal	-20(%eax), %edi
.LBE3614:
.LBE3613:
.LBE3615:
.LBE3617:
	.loc 31 92 0
	movl	%edi, %eax
.LVL255:
	cmpb	$20, %al
	movl	$0, %eax
	cmovae	%eax, %edi
	jmp	.L234
	.cfi_endproc
.LFE383:
	.size	getArg32, .-getArg32
	.p2align 4,,15
	.globl	putDebugChar
	.type	putDebugChar, @function
putDebugChar:
.LFB607:
	.loc 6 26 0
	.cfi_startproc
.LVL256:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	.p2align 4,,7
	.p2align 3
.L268:
	.loc 6 27 0 discriminator 1
	movzwl	ia32KSdebugPort, %eax
	addl	$5, %eax
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	call	in8
.LVL257:
	testb	$32, %al
	je	.L268
	.loc 6 28 0
	movzwl	ia32KSdebugPort, %eax
	movzbl	%bl, %ebx
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	out8
.LVL258:
	.loc 6 29 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE607:
	.size	putDebugChar, .-putDebugChar
	.p2align 4,,15
	.type	putEncodedChar, @function
putEncodedChar:
.LFB382:
	.loc 31 65 0
	.cfi_startproc
.LVL259:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 31 66 0
	cmpb	$-69, %al
	je	.L272
	cmpb	$-1, %al
	je	.L279
	cmpb	$-86, %al
	je	.L276
	.loc 31 80 0
	cmpb	$19, %al
	.p2align 4,,5
	jbe	.L283
	.loc 31 84 0
	movl	%eax, (%esp)
	call	putDebugChar
.LVL260:
	.loc 31 87 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L279:
	.cfi_restore_state
.LBB3624:
.LBB3625:
	.loc 6 27 0
	movzwl	ia32KSdebugPort, %eax
	addl	$5, %eax
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	call	in8
.LVL261:
	testb	$32, %al
	je	.L279
	.loc 6 28 0
	movzwl	ia32KSdebugPort, %eax
	movl	$170, 4(%esp)
	movl	%eax, (%esp)
	call	out8
.LVL262:
.LBE3625:
.LBE3624:
	.loc 31 73 0
	movl	$160, (%esp)
	call	putDebugChar
.LVL263:
	.loc 31 87 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L276:
	.cfi_restore_state
.LBB3626:
.LBB3627:
	.loc 6 27 0
	movzwl	ia32KSdebugPort, %eax
	addl	$5, %eax
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	call	in8
.LVL264:
	testb	$32, %al
	je	.L276
	.loc 6 28 0
	movzwl	ia32KSdebugPort, %eax
	movl	$170, 4(%esp)
	movl	%eax, (%esp)
	call	out8
.LVL265:
.LBE3627:
.LBE3626:
	.loc 31 69 0
	movl	$161, (%esp)
	call	putDebugChar
.LVL266:
.L270:
	.loc 31 87 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL267:
	.p2align 4,,7
	.p2align 3
.L272:
	.cfi_restore_state
	.loc 31 76 0
	movl	$170, (%esp)
	call	putDebugChar
.LVL268:
	.loc 31 77 0
	movl	$162, (%esp)
	call	putDebugChar
.LVL269:
	.loc 31 87 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL270:
	.p2align 4,,7
	.p2align 3
.L283:
	.cfi_restore_state
.LBB3628:
.LBB3629:
	.loc 31 81 0
	movl	$170, (%esp)
	movl	%eax, 12(%esp)
.LVL271:
	call	putDebugChar
.LVL272:
	.loc 31 82 0
	movl	12(%esp), %eax
	addl	$20, %eax
	movzbl	%al, %eax
	movl	%eax, (%esp)
	call	putDebugChar
.LVL273:
	jmp	.L270
.LBE3629:
.LBE3628:
	.cfi_endproc
.LFE382:
	.size	putEncodedChar, .-putEncodedChar
	.p2align 4,,15
	.type	sendWord, @function
sendWord:
.LFB384:
	.loc 31 112 0
	.cfi_startproc
.LVL274:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	%eax, %ebx
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movzbl	%al, %eax
.LVL275:
	.loc 31 113 0
	call	putEncodedChar
.LVL276:
	movzbl	%bh, %eax
	.loc 31 114 0
	call	putEncodedChar
.LVL277:
	.loc 31 115 0
	movl	%ebx, %eax
	shrl	$16, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL278:
	.loc 31 117 0
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	.loc 31 116 0
	movl	%ebx, %eax
	.loc 31 117 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL279:
	.loc 31 116 0
	shrl	$24, %eax
.LVL280:
	jmp	putEncodedChar
.LVL281:
	.cfi_endproc
.LFE384:
	.size	sendWord, .-sendWord
	.p2align 4,,15
	.globl	setInterruptMode
	.type	setInterruptMode, @function
setInterruptMode:
.LFB610:
	.loc 25 63 0
	.cfi_startproc
.LVL282:
	rep ret
	.cfi_endproc
.LFE610:
	.size	setInterruptMode, .-setInterruptMode
	.p2align 4,,15
	.globl	getActiveIRQ
	.type	getActiveIRQ, @function
getActiveIRQ:
.LFB612:
	.loc 25 90 0
	.cfi_startproc
	.loc 25 91 0
	movl	ia32KScurInterrupt, %eax
	cmpl	$-1, %eax
	je	.L289
	.loc 25 94 0
	subl	$32, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L289:
	.loc 25 92 0
	movl	$-1, %eax
	.loc 25 96 0
	ret
	.cfi_endproc
.LFE612:
	.size	getActiveIRQ, .-getActiveIRQ
	.p2align 4,,15
	.globl	isIRQPending
	.type	isIRQPending, @function
isIRQPending:
.LFB613:
	.loc 25 100 0
	.cfi_startproc
.LVL283:
.LBB3640:
.LBB3641:
.LBB3642:
.LBB3643:
	.loc 8 63 0
	movl	-65008, %eax
.LBE3643:
.LBE3642:
	.loc 8 204 0
	testl	%eax, %eax
	jne	.L295
.LVL284:
.LBE3641:
.LBE3640:
	.loc 25 100 0
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB3644:
.LBB3645:
	.loc 24 77 0
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
.LVL285:
	.loc 24 80 0
	movl	$32, (%esp)
	call	in8
.LVL286:
.LBE3645:
.LBE3644:
	.loc 25 105 0
	testb	%al, %al
	setne	%al
.LVL287:
	.loc 25 110 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	.loc 25 105 0
	movzbl	%al, %eax
	.loc 25 110 0
	ret
.LVL288:
	.p2align 4,,7
	.p2align 3
.L295:
	.loc 25 102 0
	movl	$1, %eax
	.loc 25 110 0
	ret
	.cfi_endproc
.LFE613:
	.size	isIRQPending, .-isIRQPending
	.p2align 4,,15
	.globl	ackInterrupt
	.type	ackInterrupt, @function
ackInterrupt:
.LFB614:
	.loc 25 113 0
	.cfi_startproc
.LVL289:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 25 115 0
	cmpl	$15, 32(%esp)
	jle	.L301
.LVL290:
.LBB3653:
.LBB3654:
.LBB3655:
	.loc 8 69 0
	movl	$0, -65360
.LBE3655:
.LBE3654:
.LBE3653:
	.loc 25 122 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL291:
	.p2align 4,,7
	.p2align 3
.L301:
	.cfi_restore_state
.LBB3656:
.LBB3657:
	.loc 24 90 0
	cmpl	$39, ia32KScurInterrupt
	jle	.L298
	.loc 24 92 0
	movl	$32, 4(%esp)
	movl	$160, (%esp)
	call	out8
.LVL292:
.L298:
	.loc 24 95 0
	movl	$32, 4(%esp)
	movl	$32, (%esp)
	call	out8
.LVL293:
.LBE3657:
.LBE3656:
	.loc 25 122 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE614:
	.size	ackInterrupt, .-ackInterrupt
	.p2align 4,,15
	.globl	handleSpuriousIRQ
	.type	handleSpuriousIRQ, @function
handleSpuriousIRQ:
.LFB615:
	.loc 25 125 0
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE615:
	.size	handleSpuriousIRQ, .-handleSpuriousIRQ
	.p2align 4,,15
	.globl	resetTimer
	.type	resetTimer, @function
resetTimer:
.LFB616:
	.loc 25 132 0
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE616:
	.size	resetTimer, .-resetTimer
	.p2align 4,,15
	.globl	serial_init
	.type	serial_init, @function
serial_init:
.LFB618:
	.file 32 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/machine/io.c"
	.loc 32 28 0
	.cfi_startproc
.LVL294:
	.loc 32 28 0
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 32 28 0
	movl	48(%esp), %esi
	leal	5(%esi), %ebx
	movzwl	%bx, %ebx
	.p2align 4,,7
	.p2align 3
.L306:
	.loc 32 29 0 discriminator 1
	movl	%ebx, (%esp)
	call	in8
.LVL295:
	testb	$96, %al
	je	.L306
	.loc 32 31 0
	leal	1(%esi), %eax
	.loc 32 33 0
	movzwl	%si, %edi
	.loc 32 31 0
	movzwl	%ax, %eax
	.loc 32 32 0
	leal	3(%esi), %ebp
	.loc 32 31 0
	movl	%eax, (%esp)
	.loc 32 32 0
	movzwl	%bp, %ebp
	.loc 32 31 0
	movl	$0, 4(%esp)
	movl	%eax, 12(%esp)
	call	out8
.LVL296:
	.loc 32 32 0
	movl	%ebp, (%esp)
	movl	$128, 4(%esp)
	call	out8
.LVL297:
	.loc 32 33 0
	movl	%edi, (%esp)
	movl	$1, 4(%esp)
	call	out8
.LVL298:
	.loc 32 34 0
	movl	12(%esp), %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	out8
.LVL299:
	.loc 32 35 0
	movl	%ebp, (%esp)
	movl	$3, 4(%esp)
	call	out8
.LVL300:
	.loc 32 36 0
	leal	4(%esi), %eax
	.loc 32 40 0
	addl	$6, %esi
	.loc 32 36 0
	movzwl	%ax, %eax
	.loc 32 40 0
	movzwl	%si, %esi
	.loc 32 36 0
	movl	%eax, (%esp)
	movl	$11, 4(%esp)
	call	out8
.LVL301:
	.loc 32 38 0
	movl	%edi, (%esp)
	call	in8
.LVL302:
	.loc 32 39 0
	movl	%ebx, (%esp)
	call	in8
.LVL303:
	.loc 32 40 0
	movl	%esi, 48(%esp)
	.loc 32 41 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 32 40 0
	jmp	in8
.LVL304:
	.cfi_endproc
.LFE618:
	.size	serial_init, .-serial_init
	.p2align 4,,15
	.globl	console_putchar
	.type	console_putchar, @function
console_putchar:
.LFB619:
	.loc 32 44 0
	.cfi_startproc
.LVL305:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 32 44 0
	movl	32(%esp), %edi
	.loc 32 45 0
	call	get_console_port
.LVL306:
.LBB3658:
.LBB3659:
	.file 33 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/kernel/lock.h"
	.loc 33 28 0
	movl	$lock_debug, %edx
.LBE3659:
.LBE3658:
	.loc 32 45 0
	movzwl	%ax, %esi
.LVL307:
.LBB3661:
.LBB3660:
	.loc 33 28 0
#APP
# 28 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/kernel/lock.h" 1
	1:                 
movl  $1,    %eax 
xchgl (%edx),  %eax 
testl %eax, %eax 
jnz   1b           

# 0 "" 2
#NO_APP
	leal	5(%esi), %ebx
.LBE3660:
.LBE3661:
	.loc 32 49 0
	testw	%si, %si
	movzwl	%bx, %ebx
	je	.L310
	.p2align 4,,7
	.p2align 3
.L316:
	.loc 32 50 0 discriminator 1
	movl	%ebx, (%esp)
	call	in8
.LVL308:
	testb	$96, %al
	je	.L316
	.loc 32 51 0
	movl	%edi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	out8
.LVL309:
	.loc 32 52 0
	movl	%edi, %eax
	cmpb	$10, %al
	je	.L315
.L310:
.LVL310:
.LBB3662:
.LBB3663:
	.loc 33 42 0
	movl	$0, lock_debug
.LBE3663:
.LBE3662:
	.loc 32 59 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL311:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL312:
	.p2align 4,,7
	.p2align 3
.L315:
	.cfi_restore_state
	.loc 32 53 0 discriminator 1
	movl	%ebx, (%esp)
	call	in8
.LVL313:
	testb	$96, %al
	je	.L315
	.loc 32 54 0
	movl	$13, 4(%esp)
	movl	%esi, (%esp)
	call	out8
.LVL314:
	jmp	.L310
	.cfi_endproc
.LFE619:
	.size	console_putchar, .-console_putchar
	.p2align 4,,15
	.globl	puts
	.type	puts, @function
puts:
.LFB496:
	.file 34 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/machine/io.c"
	.loc 34 234 0
	.cfi_startproc
.LVL315:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 34 234 0
	movl	32(%esp), %ebx
.LVL316:
	.loc 34 235 0
	movsbl	(%ebx), %eax
	testb	%al, %al
	je	.L320
	.p2align 4,,7
	.p2align 3
.L324:
	.loc 34 236 0 discriminator 2
	movl	%eax, (%esp)
	.loc 34 235 0 discriminator 2
	addl	$1, %ebx
.LVL317:
	.loc 34 236 0 discriminator 2
	call	console_putchar
.LVL318:
	.loc 34 235 0 discriminator 2
	movsbl	(%ebx), %eax
	testb	%al, %al
	jne	.L324
.L320:
	.loc 34 238 0
	movl	$10, (%esp)
	call	console_putchar
.LVL319:
	.loc 34 240 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL320:
	ret
	.cfi_endproc
.LFE496:
	.size	puts, .-puts
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"(nil)"
.LC1:
	.string	"0x"
	.text
	.p2align 4,,15
	.globl	printf
	.type	printf, @function
printf:
.LFB495:
	.loc 34 223 0
	.cfi_startproc
.LVL321:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 34 223 0
	movl	64(%esp), %ebx
	.loc 34 227 0
	leal	68(%esp), %esi
.LVL322:
.LBB3699:
.LBB3700:
	.loc 34 133 0
	testl	%ebx, %ebx
	je	.L370
	xorl	%edi, %edi
	movl	$0, 8(%esp)
.LVL323:
	.p2align 4,,7
	.p2align 3
.L330:
	.loc 34 139 0
	movsbl	(%ebx), %eax
	testb	%al, %al
	je	.L402
.L369:
	.loc 34 140 0
	testl	%edi, %edi
	je	.L331
	.loc 34 141 0
	cmpb	$112, %al
	je	.L333
	.p2align 4,,7
	jg	.L334
	cmpb	$100, %al
	.p2align 4,,7
	je	.L335
	cmpb	$108, %al
	.p2align 4,,7
	je	.L336
	cmpb	$37, %al
	.p2align 4,,5
	je	.L403
.L332:
	.loc 34 197 0
	addl	$1, %ebx
.LVL324:
	.loc 34 139 0
	movsbl	(%ebx), %eax
	.loc 34 201 0
	xorl	%edi, %edi
.LVL325:
	.loc 34 139 0
	testb	%al, %al
	jne	.L369
	.p2align 4,,7
	.p2align 3
.L402:
	movl	8(%esp), %eax
.LVL326:
.LBE3700:
.LBE3699:
	.loc 34 231 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL327:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL328:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL329:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL330:
	.p2align 4,,7
	.p2align 3
.L331:
	.cfi_restore_state
.LBB3810:
.LBB3807:
	.loc 34 203 0
	cmpb	$37, %al
	jne	.L398
.LVL331:
	.loc 34 206 0
	addl	$1, %ebx
.LVL332:
	.loc 34 205 0
	movl	$1, %edi
	jmp	.L330
.LVL333:
	.p2align 4,,7
	.p2align 3
.L334:
	.loc 34 141 0
	cmpb	$117, %al
	je	.L338
	cmpb	$120, %al
	je	.L339
	cmpb	$115, %al
	.p2align 4,,5
	jne	.L332
	.loc 34 185 0
	movl	(%esi), %edi
.LVL334:
	leal	4(%esi), %ebp
.LVL335:
.LBB3701:
.LBB3702:
	.loc 34 21 0
	xorl	%esi, %esi
	movsbl	(%edi), %eax
	testb	%al, %al
	je	.L362
.LVL336:
	.p2align 4,,7
	.p2align 3
.L363:
	.loc 34 22 0
	movl	%eax, (%esp)
	.loc 34 21 0
	addl	$1, %esi
.LVL337:
	.loc 34 22 0
	call	console_putchar
.LVL338:
	.loc 34 21 0
	movsbl	(%edi,%esi), %eax
	testb	%al, %al
	jne	.L363
.LVL339:
.L362:
.LBE3702:
.LBE3701:
	.loc 34 185 0
	addl	%esi, 8(%esp)
	.loc 34 186 0
	addl	$1, %ebx
.LVL340:
	.loc 34 185 0
	movl	%ebp, %esi
	.loc 34 201 0
	xorl	%edi, %edi
	jmp	.L330
.LVL341:
	.p2align 4,,7
	.p2align 3
.L398:
	.loc 34 210 0
	movl	%eax, (%esp)
	.loc 34 212 0
	addl	$1, %ebx
.LVL342:
	.loc 34 210 0
	call	console_putchar
.LVL343:
	.loc 34 211 0
	addl	$1, 8(%esp)
.LVL344:
	jmp	.L330
	.p2align 4,,7
	.p2align 3
.L338:
	.loc 34 163 0
	leal	4(%esi), %edi
.LVL345:
	movl	(%esi), %esi
.LVL346:
.LBB3703:
.LBB3704:
	.loc 34 69 0
	testl	%esi, %esi
	je	.L351
.LVL347:
.LBB3705:
.LBB3706:
.LBB3707:
.LBB3708:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%esi
	movl	%edx, %ecx
	shrl	$3, %ecx
	leal	(%ecx,%ecx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
.LVL348:
.LBE3708:
.LBE3707:
	.loc 34 74 0
	testl	%ecx, %ecx
	.loc 34 80 0
	leal	48(%esi), %eax
	movb	%al, 20(%esp)
.LVL349:
	.loc 34 74 0
	je	.L380
.LVL350:
.LBB3719:
.LBB3709:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%ecx
	movl	%edx, %esi
	shrl	$3, %esi
	leal	(%esi,%esi,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LVL351:
.LBE3709:
.LBE3719:
	.loc 34 80 0
	addl	$48, %ecx
	.loc 34 74 0
	testl	%esi, %esi
	.loc 34 80 0
	movb	%cl, 21(%esp)
.LVL352:
	.loc 34 74 0
	je	.L381
.LVL353:
.LBB3720:
.LBB3710:
	.loc 34 48 0
	movl	$-858993459, %eax
.LVL354:
	mull	%esi
.LVL355:
	movl	%edx, %ecx
	shrl	$3, %ecx
	leal	(%ecx,%ecx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
.LVL356:
.LBE3710:
.LBE3720:
	.loc 34 74 0
	testl	%ecx, %ecx
	.loc 34 80 0
	leal	48(%esi), %eax
	movb	%al, 22(%esp)
.LVL357:
	.loc 34 74 0
	je	.L382
.LVL358:
.LBB3721:
.LBB3711:
	.loc 34 48 0
	movl	$-858993459, %eax
.LVL359:
	mull	%ecx
.LVL360:
	movl	%edx, %esi
	shrl	$3, %esi
	leal	(%esi,%esi,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LVL361:
.LBE3711:
.LBE3721:
	.loc 34 80 0
	addl	$48, %ecx
	.loc 34 74 0
	testl	%esi, %esi
	.loc 34 80 0
	movb	%cl, 23(%esp)
.LVL362:
	.loc 34 74 0
	je	.L383
.LVL363:
.LBB3722:
.LBB3712:
	.loc 34 48 0
	movl	$-858993459, %eax
.LVL364:
	mull	%esi
.LVL365:
	movl	%edx, %ecx
	shrl	$3, %ecx
	leal	(%ecx,%ecx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
.LVL366:
.LBE3712:
.LBE3722:
	.loc 34 74 0
	testl	%ecx, %ecx
	.loc 34 80 0
	leal	48(%esi), %eax
	movb	%al, 24(%esp)
.LVL367:
	.loc 34 74 0
	je	.L384
.LVL368:
.LBB3723:
.LBB3713:
	.loc 34 48 0
	movl	$-858993459, %eax
.LVL369:
	mull	%ecx
.LVL370:
	movl	%edx, %esi
	shrl	$3, %esi
	leal	(%esi,%esi,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LVL371:
.LBE3713:
.LBE3723:
	.loc 34 80 0
	addl	$48, %ecx
	.loc 34 74 0
	testl	%esi, %esi
	.loc 34 80 0
	movb	%cl, 25(%esp)
.LVL372:
	.loc 34 74 0
	je	.L385
.LVL373:
.LBB3724:
.LBB3714:
	.loc 34 48 0
	movl	$-858993459, %eax
.LVL374:
	mull	%esi
.LVL375:
	movl	%edx, %ecx
	shrl	$3, %ecx
	leal	(%ecx,%ecx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
.LVL376:
.LBE3714:
.LBE3724:
	.loc 34 74 0
	testl	%ecx, %ecx
	.loc 34 80 0
	leal	48(%esi), %eax
	movb	%al, 26(%esp)
.LVL377:
	.loc 34 74 0
	je	.L386
.LVL378:
.LBB3725:
.LBB3715:
	.loc 34 48 0
	movl	$-858993459, %eax
.LVL379:
	mull	%ecx
.LVL380:
	movl	%edx, %esi
	shrl	$3, %esi
	leal	(%esi,%esi,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LVL381:
.LBE3715:
.LBE3725:
	.loc 34 80 0
	addl	$48, %ecx
	.loc 34 74 0
	testl	%esi, %esi
	.loc 34 80 0
	movb	%cl, 27(%esp)
.LVL382:
	.loc 34 74 0
	je	.L387
.LVL383:
.LBB3726:
.LBB3716:
	.loc 34 48 0
	movl	$-858993459, %eax
.LVL384:
	mull	%esi
.LVL385:
	movl	%edx, %ecx
	shrl	$3, %ecx
	leal	(%ecx,%ecx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
.LVL386:
.LBE3716:
.LBE3726:
	.loc 34 74 0
	testl	%ecx, %ecx
	.loc 34 80 0
	leal	48(%esi), %eax
	movb	%al, 28(%esp)
.LVL387:
	.loc 34 74 0
	je	.L388
.LVL388:
.LBB3727:
.LBB3717:
	.loc 34 48 0
	movl	$-858993459, %eax
.LVL389:
	mull	%ecx
.LVL390:
.LBE3717:
.LBE3727:
	.loc 34 74 0
	movl	$10, 12(%esp)
.LBB3728:
.LBB3718:
	.loc 34 48 0
	shrl	$3, %edx
	leal	(%edx,%edx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LBE3718:
.LBE3728:
	.loc 34 80 0
	addl	$48, %ecx
	movb	%cl, 29(%esp)
.LVL391:
.L352:
	.loc 34 74 0
	movl	12(%esp), %ebp
	leal	20(%esp), %esi
.LVL392:
	.p2align 4,,7
	.p2align 3
.L354:
	.loc 34 85 0
	subl	$1, %ebp
.LVL393:
	movsbl	(%esi,%ebp), %eax
	movl	%eax, (%esp)
	call	console_putchar
.LVL394:
	.loc 34 84 0
	testl	%ebp, %ebp
	jne	.L354
.LVL395:
.L401:
	movl	12(%esp), %ebp
.L355:
.LBE3706:
.LBE3705:
.LBE3704:
.LBE3703:
	.loc 34 163 0
	movl	%edi, %esi
	.loc 34 164 0
	addl	$1, %ebx
.LVL396:
	.loc 34 163 0
	addl	%ebp, 8(%esp)
.LVL397:
	.loc 34 201 0
	xorl	%edi, %edi
.LVL398:
	jmp	.L330
.LVL399:
	.p2align 4,,7
	.p2align 3
.L333:
.LBB3739:
	.loc 34 173 0
	movl	(%esi), %ebp
	leal	4(%esi), %eax
	.loc 34 174 0
	xorl	%esi, %esi
.LVL400:
	.loc 34 173 0
	movl	%eax, 12(%esp)
.LVL401:
	.loc 34 174 0
	testl	%ebp, %ebp
	jne	.L356
	movl	$.LC0, %ebp
.LVL402:
.LBB3740:
.LBB3741:
	.loc 34 21 0
	movl	$40, %eax
.LVL403:
	.p2align 4,,7
	.p2align 3
.L358:
	.loc 34 22 0
	movl	%eax, (%esp)
	.loc 34 21 0
	addl	$1, %ebp
.LVL404:
	addl	$1, %esi
.LVL405:
	.loc 34 22 0
	call	console_putchar
.LVL406:
	.loc 34 21 0
	movsbl	0(%ebp), %eax
	testb	%al, %al
	jne	.L358
.LBE3741:
.LBE3740:
	.loc 34 178 0
	addl	%esi, 8(%esp)
	.loc 34 180 0
	addl	$1, %ebx
.LVL407:
	.loc 34 173 0
	movl	12(%esp), %esi
.LVL408:
.LBE3739:
	.loc 34 201 0
	xorl	%edi, %edi
.LVL409:
	jmp	.L330
.LVL410:
	.p2align 4,,7
	.p2align 3
.L339:
	.loc 34 168 0
	movl	(%esi), %eax
	leal	4(%esi), %edi
.LVL411:
	.loc 34 169 0
	addl	$1, %ebx
.LVL412:
	.loc 34 168 0
	movl	%edi, %esi
	.loc 34 201 0
	xorl	%edi, %edi
.LVL413:
	.loc 34 168 0
	call	print_unsigned_long.constprop.298
.LVL414:
	addl	%eax, 8(%esp)
.LVL415:
	jmp	.L330
.LVL416:
	.p2align 4,,7
	.p2align 3
.L335:
.LBB3744:
	.loc 34 149 0
	leal	4(%esi), %edi
.LVL417:
	movl	(%esi), %esi
.LVL418:
	.loc 34 151 0
	testl	%esi, %esi
	js	.L404
.L345:
.LVL419:
.LBB3745:
.LBB3746:
	.loc 34 69 0
	testl	%esi, %esi
	je	.L351
.LVL420:
.LBB3747:
.LBB3748:
.LBB3749:
.LBB3750:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%esi
	movl	%edx, %ecx
	shrl	$3, %ecx
	leal	(%ecx,%ecx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
.LVL421:
.LBE3750:
.LBE3749:
	.loc 34 74 0
	testl	%ecx, %ecx
	.loc 34 80 0
	leal	48(%esi), %eax
	movb	%al, 20(%esp)
.LVL422:
	.loc 34 74 0
	je	.L371
.LVL423:
.LBB3761:
.LBB3751:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%ecx
	movl	%edx, %esi
	shrl	$3, %esi
	leal	(%esi,%esi,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LVL424:
.LBE3751:
.LBE3761:
	.loc 34 80 0
	addl	$48, %ecx
	.loc 34 74 0
	testl	%esi, %esi
	.loc 34 80 0
	movb	%cl, 21(%esp)
.LVL425:
	.loc 34 74 0
	je	.L372
.LVL426:
.LBB3762:
.LBB3752:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%esi
	movl	%edx, %ecx
	shrl	$3, %ecx
	leal	(%ecx,%ecx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
.LVL427:
.LBE3752:
.LBE3762:
	.loc 34 74 0
	testl	%ecx, %ecx
	.loc 34 80 0
	leal	48(%esi), %eax
	movb	%al, 22(%esp)
.LVL428:
	.loc 34 74 0
	je	.L373
.LVL429:
.LBB3763:
.LBB3753:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%ecx
	movl	%edx, %esi
	shrl	$3, %esi
	leal	(%esi,%esi,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LVL430:
.LBE3753:
.LBE3763:
	.loc 34 80 0
	addl	$48, %ecx
	.loc 34 74 0
	testl	%esi, %esi
	.loc 34 80 0
	movb	%cl, 23(%esp)
.LVL431:
	.loc 34 74 0
	je	.L374
.LVL432:
.LBB3764:
.LBB3754:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%esi
	movl	%edx, %ecx
	shrl	$3, %ecx
	leal	(%ecx,%ecx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
.LVL433:
.LBE3754:
.LBE3764:
	.loc 34 74 0
	testl	%ecx, %ecx
	.loc 34 80 0
	leal	48(%esi), %eax
	movb	%al, 24(%esp)
.LVL434:
	.loc 34 74 0
	je	.L375
.LVL435:
.LBB3765:
.LBB3755:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%ecx
	movl	%edx, %esi
	shrl	$3, %esi
	leal	(%esi,%esi,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LVL436:
.LBE3755:
.LBE3765:
	.loc 34 80 0
	addl	$48, %ecx
	.loc 34 74 0
	testl	%esi, %esi
	.loc 34 80 0
	movb	%cl, 25(%esp)
.LVL437:
	.loc 34 74 0
	je	.L376
.LVL438:
.LBB3766:
.LBB3756:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%esi
	movl	%edx, %ecx
	shrl	$3, %ecx
	leal	(%ecx,%ecx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
.LVL439:
.LBE3756:
.LBE3766:
	.loc 34 74 0
	testl	%ecx, %ecx
	.loc 34 80 0
	leal	48(%esi), %eax
	movb	%al, 26(%esp)
.LVL440:
	.loc 34 74 0
	je	.L377
.LVL441:
.LBB3767:
.LBB3757:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%ecx
	movl	%edx, %esi
	shrl	$3, %esi
	leal	(%esi,%esi,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LVL442:
.LBE3757:
.LBE3767:
	.loc 34 80 0
	addl	$48, %ecx
	.loc 34 74 0
	testl	%esi, %esi
	.loc 34 80 0
	movb	%cl, 27(%esp)
.LVL443:
	.loc 34 74 0
	je	.L378
.LVL444:
.LBB3768:
.LBB3758:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%esi
	movl	%edx, %ecx
	shrl	$3, %ecx
	leal	(%ecx,%ecx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
.LVL445:
.LBE3758:
.LBE3768:
	.loc 34 74 0
	testl	%ecx, %ecx
	.loc 34 80 0
	leal	48(%esi), %eax
	movb	%al, 28(%esp)
.LVL446:
	.loc 34 74 0
	je	.L379
.LVL447:
.LBB3769:
.LBB3759:
	.loc 34 48 0
	movl	$-858993459, %eax
	mull	%ecx
.LVL448:
.LBE3759:
.LBE3769:
	.loc 34 74 0
	movl	$10, 12(%esp)
.LBB3770:
.LBB3760:
	.loc 34 48 0
	shrl	$3, %edx
	leal	(%edx,%edx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LBE3760:
.LBE3770:
	.loc 34 80 0
	addl	$48, %ecx
	movb	%cl, 29(%esp)
.LVL449:
.L347:
	.loc 34 74 0
	movl	12(%esp), %ebp
	leal	20(%esp), %esi
.LVL450:
	.p2align 4,,7
	.p2align 3
.L349:
	.loc 34 85 0
	subl	$1, %ebp
.LVL451:
	movsbl	(%esi,%ebp), %eax
	movl	%eax, (%esp)
	call	console_putchar
.LVL452:
	.loc 34 84 0
	testl	%ebp, %ebp
	jne	.L349
	jmp	.L401
.LVL453:
	.p2align 4,,7
	.p2align 3
.L403:
.LBE3748:
.LBE3747:
.LBE3746:
.LBE3745:
.LBE3744:
.LBB3783:
.LBB3784:
	.loc 32 45 0
	.p2align 4,,9
	call	get_console_port
.LVL454:
.LBB3785:
.LBB3786:
	.loc 33 28 0
	movl	$lock_debug, %edx
.LBE3786:
.LBE3785:
	.loc 32 45 0
	movzwl	%ax, %ebp
.LVL455:
.LBB3788:
.LBB3787:
	.loc 33 28 0
#APP
# 28 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/kernel/lock.h" 1
	1:                 
movl  $1,    %eax 
xchgl (%edx),  %eax 
testl %eax, %eax 
jnz   1b           

# 0 "" 2
#NO_APP
.LBE3787:
.LBE3788:
	.loc 32 49 0
	testw	%bp, %bp
	je	.L341
	leal	5(%ebp), %edi
.LVL456:
	movzwl	%di, %edi
	.p2align 4,,7
	.p2align 3
.L343:
	.loc 32 50 0
	movl	%edi, (%esp)
	call	in8
.LVL457:
	testb	$96, %al
	je	.L343
	.loc 32 51 0
	movl	$37, 4(%esp)
	movl	%ebp, (%esp)
	call	out8
.LVL458:
.L341:
.LBB3789:
.LBB3790:
	.loc 33 42 0
	movl	$0, lock_debug
.LBE3790:
.LBE3789:
.LBE3784:
.LBE3783:
	.loc 34 145 0
	addl	$1, %ebx
.LVL459:
	.loc 34 201 0
	xorl	%edi, %edi
	.loc 34 144 0
	addl	$1, 8(%esp)
.LVL460:
	jmp	.L330
.LVL461:
	.p2align 4,,7
	.p2align 3
.L336:
	.loc 34 190 0
	cmpb	$108, 1(%ebx)
	je	.L405
.LVL462:
.L364:
	.loc 34 194 0
	addl	$3, %ebx
.LVL463:
	.loc 34 201 0
	xorl	%edi, %edi
	jmp	.L330
.LVL464:
	.p2align 4,,7
	.p2align 3
.L356:
.LBB3791:
	.loc 34 174 0
	movl	$.LC1, %edi
.LVL465:
.LBB3742:
.LBB3743:
	.loc 34 21 0
	movl	$48, %eax
.LVL466:
	.p2align 4,,7
	.p2align 3
.L361:
	.loc 34 22 0
	movl	%eax, (%esp)
	.loc 34 21 0
	addl	$1, %edi
.LVL467:
	addl	$1, %esi
.LVL468:
	.loc 34 22 0
	call	console_putchar
.LVL469:
	.loc 34 21 0
	movsbl	(%edi), %eax
	testb	%al, %al
	jne	.L361
.LVL470:
.LBE3743:
.LBE3742:
	.loc 34 178 0
	movl	%ebp, %eax
	.loc 34 180 0
	addl	$1, %ebx
.LVL471:
	.loc 34 178 0
	call	print_unsigned_long.constprop.298
.LVL472:
.LBE3791:
	.loc 34 201 0
	xorl	%edi, %edi
.LVL473:
.LBB3792:
	.loc 34 177 0
	addl	%eax, %esi
.LVL474:
	.loc 34 178 0
	addl	%esi, 8(%esp)
.LVL475:
	.loc 34 173 0
	movl	12(%esp), %esi
	jmp	.L330
.LVL476:
	.p2align 4,,7
	.p2align 3
.L405:
.LBE3792:
	.loc 34 190 0
	cmpb	$120, 2(%ebx)
	jne	.L364
.LBB3793:
	.loc 34 191 0
	leal	8(%esi), %eax
	movl	(%esi), %edi
.LVL477:
	movl	%eax, 12(%esp)
.LVL478:
	movl	4(%esi), %eax
.LVL479:
.LBB3794:
.LBB3795:
	.loc 34 96 0
	xorl	%esi, %esi
	.loc 34 109 0
	testl	%eax, %eax
	jne	.L406
.LVL480:
.L365:
	.loc 34 121 0
	movl	%edi, %eax
	call	print_unsigned_long.constprop.298
.LVL481:
	addl	%eax, %esi
.LVL482:
.LBE3795:
.LBE3794:
	.loc 34 192 0
	addl	%esi, 8(%esp)
	.loc 34 191 0
	movl	12(%esp), %esi
.LVL483:
	jmp	.L364
.LVL484:
	.p2align 4,,7
	.p2align 3
.L351:
.LBE3793:
.LBB3798:
.LBB3735:
	.loc 34 70 0
	call	console_putchar.constprop.295
.LVL485:
	.loc 34 71 0
	movl	$1, %ebp
	jmp	.L355
.LVL486:
.L404:
.LBE3735:
.LBE3798:
.LBB3799:
	.loc 34 152 0
	movl	$45, (%esp)
	.loc 34 154 0
	negl	%esi
.LVL487:
	.loc 34 152 0
	call	console_putchar
.LVL488:
	.loc 34 153 0
	addl	$1, 8(%esp)
.LVL489:
	jmp	.L345
.LVL490:
	.p2align 4,,7
	.p2align 3
.L370:
.LBE3799:
.LBE3807:
.LBE3810:
	.loc 34 231 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LBB3811:
.LBB3808:
	.loc 34 133 0
	xorl	%eax, %eax
.LVL491:
.LBE3808:
.LBE3811:
	.loc 34 231 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL492:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL493:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL494:
.L376:
	.cfi_restore_state
.LBB3812:
.LBB3809:
.LBB3800:
.LBB3780:
.LBB3777:
.LBB3774:
.LBB3771:
	.loc 34 74 0
	movl	$6, 12(%esp)
	jmp	.L347
.LVL495:
.L377:
	movl	$7, 12(%esp)
	jmp	.L347
.LVL496:
.L378:
	movl	$8, 12(%esp)
	jmp	.L347
.LVL497:
.L379:
	movl	$9, 12(%esp)
	jmp	.L347
.LVL498:
.L380:
.LBE3771:
.LBE3774:
.LBE3777:
.LBE3780:
.LBE3800:
.LBB3801:
.LBB3736:
.LBB3732:
.LBB3729:
	movl	$1, 12(%esp)
	jmp	.L352
.LVL499:
.L381:
	movl	$2, 12(%esp)
	jmp	.L352
.LVL500:
.L382:
	movl	$3, 12(%esp)
	jmp	.L352
.LVL501:
.L383:
	movl	$4, 12(%esp)
	jmp	.L352
.LVL502:
.L372:
.LBE3729:
.LBE3732:
.LBE3736:
.LBE3801:
.LBB3802:
.LBB3781:
.LBB3778:
.LBB3775:
.LBB3772:
	movl	$2, 12(%esp)
	jmp	.L347
.LVL503:
.L373:
	movl	$3, 12(%esp)
	jmp	.L347
.LVL504:
.L374:
	movl	$4, 12(%esp)
	jmp	.L347
.LVL505:
.L375:
	movl	$5, 12(%esp)
	jmp	.L347
.LVL506:
.L384:
.LBE3772:
.LBE3775:
.LBE3778:
.LBE3781:
.LBE3802:
.LBB3803:
.LBB3737:
.LBB3733:
.LBB3730:
	movl	$5, 12(%esp)
	jmp	.L352
.LVL507:
.L385:
	movl	$6, 12(%esp)
	jmp	.L352
.LVL508:
.L386:
	movl	$7, 12(%esp)
	jmp	.L352
.LVL509:
.L387:
	movl	$8, 12(%esp)
	jmp	.L352
.LVL510:
.L371:
.LBE3730:
.LBE3733:
.LBE3737:
.LBE3803:
.LBB3804:
.LBB3782:
.LBB3779:
.LBB3776:
.LBB3773:
	movl	$1, 12(%esp)
	jmp	.L347
.LVL511:
.L388:
.LBE3773:
.LBE3776:
.LBE3779:
.LBE3782:
.LBE3804:
.LBB3805:
.LBB3738:
.LBB3734:
.LBB3731:
	movl	$9, 12(%esp)
	jmp	.L352
.LVL512:
.L406:
.LBE3731:
.LBE3734:
.LBE3738:
.LBE3805:
.LBB3806:
.LBB3797:
.LBB3796:
	.loc 34 110 0
	call	print_unsigned_long.constprop.298
.LVL513:
	.loc 34 113 0
	testl	$-268435456, %edi
	.loc 34 110 0
	movl	%eax, %esi
.LVL514:
	.loc 34 113 0
	jne	.L365
	.loc 34 97 0
	movl	$-268435456, %ebp
.LVL515:
.L366:
	.loc 34 116 0
	shrl	$4, %ebp
.LVL516:
	.loc 34 115 0
	addl	$1, %esi
.LVL517:
	.loc 34 114 0
	call	console_putchar.constprop.295
.LVL518:
	.loc 34 113 0
	testl	%ebp, %edi
	je	.L366
	jmp	.L365
.LBE3796:
.LBE3797:
.LBE3806:
.LBE3809:
.LBE3812:
	.cfi_endproc
.LFE495:
	.size	printf, .-printf
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC2:
	.string	"\n========== KERNEL EXCEPTION ==========\n"
	.section	.rodata.str1.1
.LC3:
	.string	"Vector:  0x%x\n"
.LC4:
	.string	"ErrCode: 0x%x\n"
.LC5:
	.string	"EIP:     0x%x\n"
.LC6:
	.string	"ESP:     0x%x\n"
.LC7:
	.string	"EFLAGS:  0x%x\n"
.LC8:
	.string	"CR0:     0x%x\n"
	.section	.rodata.str1.4
	.align 4
.LC9:
	.string	"CR2:     0x%x (page-fault address)\n"
	.align 4
.LC10:
	.string	"CR3:     0x%x (page-directory physical address)\n"
	.section	.rodata.str1.1
.LC11:
	.string	"CR4:     0x%x\n"
.LC12:
	.string	"\nStack Dump:\n"
.LC13:
	.string	"*0x%x == 0x%x\n"
.LC14:
	.string	"\nHalting...\n"
	.text
	.p2align 4,,15
	.globl	handleKernelException
	.type	handleKernelException, @function
handleKernelException:
.LFB268:
	.file 35 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/api/faults.c"
	.loc 35 123 0
	.cfi_startproc
.LVL519:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 35 123 0
	movl	64(%esp), %ecx
	movl	68(%esp), %edx
	movl	84(%esp), %eax
	.loc 35 126 0
	movl	$.LC2, (%esp)
	.loc 35 123 0
	movl	96(%esp), %esi
	movl	%ecx, 28(%esp)
	movl	92(%esp), %ecx
	movl	%edx, 24(%esp)
	movl	88(%esp), %edx
	movl	72(%esp), %ebp
	movl	76(%esp), %ebx
	movl	80(%esp), %edi
	movl	%edx, 16(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 12(%esp)
	.loc 35 126 0
	call	printf
.LVL520:
	.loc 35 127 0
	movl	28(%esp), %ecx
	movl	$.LC3, (%esp)
	movl	%ecx, 4(%esp)
	call	printf
.LVL521:
	.loc 35 128 0
	movl	24(%esp), %edx
	movl	$.LC4, (%esp)
	movl	%edx, 4(%esp)
	call	printf
.LVL522:
	.loc 35 129 0
	movl	%ebp, 4(%esp)
	movl	$.LC5, (%esp)
	call	printf
.LVL523:
	.loc 35 130 0
	movl	%ebx, 4(%esp)
	movl	$.LC6, (%esp)
	call	printf
.LVL524:
	.loc 35 131 0
	movl	%edi, 4(%esp)
	movl	$.LC7, (%esp)
	call	printf
.LVL525:
	.loc 35 132 0
	movl	12(%esp), %eax
	movl	$.LC8, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL526:
	.loc 35 133 0
	movl	16(%esp), %edx
	movl	$.LC9, (%esp)
	movl	%edx, 4(%esp)
	call	printf
.LVL527:
	.loc 35 134 0
	movl	20(%esp), %ecx
	movl	$.LC10, (%esp)
	movl	%ecx, 4(%esp)
	call	printf
.LVL528:
	.loc 35 135 0
	movl	%esi, 4(%esp)
	.loc 35 137 0
	xorl	%esi, %esi
	.loc 35 135 0
	movl	$.LC11, (%esp)
	call	printf
.LVL529:
	.loc 35 136 0
	movl	$.LC12, (%esp)
	call	printf
.LVL530:
	.p2align 4,,7
	.p2align 3
.L409:
	.loc 35 138 0 discriminator 2
	movl	(%ebx), %eax
	.loc 35 137 0 discriminator 2
	addl	$1, %esi
.LVL531:
	.loc 35 138 0 discriminator 2
	movl	%ebx, 4(%esp)
	addl	$4, %ebx
	movl	$.LC13, (%esp)
	movl	%eax, 8(%esp)
	call	printf
.LVL532:
	.loc 35 137 0 discriminator 2
	cmpl	$20, %esi
	jne	.L409
	.loc 35 140 0
	movl	$.LC14, 64(%esp)
	.loc 35 141 0
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL533:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 35 140 0
	jmp	printf
.LVL534:
	.cfi_endproc
.LFE268:
	.size	handleKernelException, .-handleKernelException
	.section	.rodata.str1.1
.LC15:
	.string	"APIC: Enabled bit not set\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	apic_get_base_paddr
	.type	apic_get_base_paddr, @function
apic_get_base_paddr:
.LFB299:
	.loc 8 92 0
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 8 95 0
	movl	$27, (%esp)
	call	ia32_rdmsr_low
.LVL535:
	.loc 8 96 0
	testb	$8, %ah
	.loc 8 95 0
	movl	%eax, %ebx
.LVL536:
	.loc 8 96 0
	jne	.L412
	.loc 8 97 0
	movl	$.LC15, (%esp)
	call	printf
.LVL537:
.L412:
.LBB3817:
.LBB3818:
	.loc 27 253 0
	movl	%ebx, %eax
.LBE3818:
.LBE3817:
	.loc 8 101 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
.LBB3820:
.LBB3819:
	.loc 27 253 0
	andl	$-4096, %eax
.LBE3819:
.LBE3820:
	.loc 8 101 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL538:
	ret
	.cfi_endproc
.LFE299:
	.size	apic_get_base_paddr, .-apic_get_base_paddr
	.section	.rodata.str1.1
.LC16:
	.string	"\n"
.LC17:
	.string	" -> IGNORED! (too many)\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	insert_dev_p_reg
	.type	insert_dev_p_reg, @function
insert_dev_p_reg:
.LFB319:
	.loc 9 213 0
	.cfi_startproc
.LVL539:
	.loc 9 214 0
	movl	glks+188, %ecx
	.loc 9 213 0
	movl	4(%esp), %eax
	movl	8(%esp), %edx
	.loc 9 214 0
	cmpl	$198, %ecx
	jbe	.L416
	.loc 9 219 0
	movl	$.LC17, 4(%esp)
	jmp	printf
.LVL540:
	.p2align 4,,7
	.p2align 3
.L416:
	.loc 9 215 0
	movl	%eax, glks+192(,%ecx,8)
	movl	%edx, glks+196(,%ecx,8)
	.loc 9 216 0
	addl	$1, %ecx
	movl	%ecx, glks+188
	.loc 9 217 0
	movl	$.LC16, 4(%esp)
	jmp	printf
.LVL541:
	.cfi_endproc
.LFE319:
	.size	insert_dev_p_reg, .-insert_dev_p_reg
	.section	.rodata.str1.4
	.align 4
.LC18:
	.string	"\033[0m\033[30;1m<<\033[0m\033[32mseL4\033[0m\033[30;1m [%s/%d T%x @%x]: "
	.section	.rodata.str1.1
.LC19:
	.string	"IPC Buffer is an invalid cap."
.LC20:
	.string	">>\033[0m\n"
	.section	.rodata.str1.4
	.align 4
.LC21:
	.string	"IPC Buffer vaddr 0x%x is not aligned."
	.text
	.p2align 4,,15
	.globl	checkValidIPCBuffer
	.type	checkValidIPCBuffer, @function
checkValidIPCBuffer:
.LFB364:
	.loc 4 1155 0
	.cfi_startproc
.LVL542:
	subl	$44, %esp
	.cfi_def_cfa_offset 48
	.loc 4 1155 0
	movl	52(%esp), %edx
.LVL543:
.LBB3836:
.LBB3837:
	.loc 27 872 0
	movl	%edx, %ecx
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL544:
	cmpl	$14, %ecx
	cmove	%edx, %eax
.LVL545:
.LBE3837:
.LBE3836:
	.loc 4 1156 0
	cmpl	$1, %eax
	je	.L420
	.loc 4 1157 0
	movl	ksCurThread, %eax
.LVL546:
	movl	44(%eax), %edx
.LVL547:
	movl	%eax, 12(%esp)
	movl	$1157, 8(%esp)
	movl	$__func__.5180, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL548:
	movl	$.LC19, (%esp)
	call	printf
.LVL549:
	movl	$.LC20, (%esp)
	call	printf
.LVL550:
	.loc 4 1159 0
	movl	$3, %eax
	.loc 4 1158 0
	movl	$3, current_syscall_error+24
.LVL551:
.L421:
	.loc 4 1169 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L420:
	.cfi_restore_state
	.loc 4 1168 0
	xorl	%eax, %eax
	.loc 4 1162 0
	testl	$511, 48(%esp)
	je	.L421
.LVL552:
.LBB3838:
.LBB3839:
	.loc 4 1163 0
	movl	ksCurThread, %eax
.LVL553:
	movl	44(%eax), %edx
.LVL554:
	movl	%eax, 12(%esp)
	movl	$1163, 8(%esp)
	movl	$__func__.5180, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL555:
	movl	48(%esp), %eax
	movl	$.LC21, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL556:
	movl	$.LC20, (%esp)
	call	printf
.LVL557:
	.loc 4 1164 0
	movl	$3, %eax
	movl	$5, current_syscall_error+24
.LBE3839:
.LBE3838:
	.loc 4 1169 0
	addl	$44, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE364:
	.size	checkValidIPCBuffer, .-checkValidIPCBuffer
	.section	.rodata.str1.1
.LC22:
	.string	"Cacheline size must be >0\n"
	.section	.rodata.str1.4
	.align 4
.LC23:
	.string	"Cacheline size must be a power of two\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	getCacheLineSizeBits
	.type	getCacheLineSizeBits, @function
getCacheLineSizeBits:
.LFB403:
	.loc 16 42 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 16 46 0
	call	getCacheLineSize
.LVL558:
	.loc 16 47 0
	testl	%eax, %eax
	.loc 16 46 0
	movl	%eax, %edx
.LVL559:
	.loc 16 47 0
	je	.L426
.LVL560:
	.loc 16 54 0 discriminator 1
	xorl	%eax, %eax
.LVL561:
	testb	$1, %dl
	jne	.L428
.LVL562:
	.p2align 4,,7
	.p2align 3
.L432:
	.loc 16 55 0
	shrl	%edx
.LVL563:
	.loc 16 56 0
	addl	$1, %eax
.LVL564:
	.loc 16 54 0
	testb	$1, %dl
	je	.L432
.LVL565:
.L428:
	.loc 16 59 0
	cmpl	$1, %edx
	je	.L429
	.loc 16 60 0
	movl	$.LC23, (%esp)
	call	printf
.LVL566:
	.loc 16 61 0
	xorl	%eax, %eax
.L429:
	.loc 16 65 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL567:
	.p2align 4,,7
	.p2align 3
.L426:
	.cfi_restore_state
	.loc 16 48 0
	movl	$.LC22, (%esp)
	call	printf
.LVL568:
	.loc 16 49 0
	xorl	%eax, %eax
	.loc 16 65 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE403:
	.size	getCacheLineSizeBits, .-getCacheLineSizeBits
	.section	.rodata.str1.4
	.align 4
.LC24:
	.string	"seL4 called fail at %s:%u in function %s, saying \"%s\"\n"
	.text
	.p2align 4,,15
	.globl	_fail
	.type	_fail, @function
_fail:
.LFB428:
	.file 36 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/assert.c"
	.loc 36 21 0
	.cfi_startproc
.LVL569:
	subl	$44, %esp
	.cfi_def_cfa_offset 48
	.loc 36 22 0
	movl	48(%esp), %eax
	movl	$.LC24, (%esp)
	movl	%eax, 16(%esp)
	movl	60(%esp), %eax
	movl	%eax, 12(%esp)
	movl	56(%esp), %eax
	movl	%eax, 8(%esp)
	movl	52(%esp), %eax
	movl	%eax, 4(%esp)
	call	printf
.LVL570:
	.loc 36 29 0
	call	halt
.LVL571:
	.cfi_endproc
.LFE428:
	.size	_fail, .-_fail
	.section	.rodata.str1.4
	.align 4
.LC25:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/hardware.h"
	.section	.rodata.str1.1
.LC26:
	.string	"Invalid page size"
	.text
	.p2align 4,,15
	.type	pageBitsForSize.part.45, @function
pageBitsForSize.part.45:
.LFB685:
	.file 37 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/hardware.h"
	.loc 37 39 0
	.cfi_startproc
.LVL572:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 37 49 0
	movl	$__func__.2276, 12(%esp)
	movl	$49, 8(%esp)
	movl	$.LC25, 4(%esp)
	movl	$.LC26, (%esp)
	call	_fail
.LVL573:
	.cfi_endproc
.LFE685:
	.size	pageBitsForSize.part.45, .-pageBitsForSize.part.45
	.section	.rodata.str1.4
	.align 4
.LC27:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/kernel/boot_sys.c"
	.section	.rodata.str1.1
.LC28:
	.string	"Couldn't find node of CPU"
	.section	.boot.text
	.p2align 4,,15
	.type	node_of_cpu.part.46, @function
node_of_cpu.part.46:
.LFB686:
	.loc 9 241 0
	.cfi_startproc
.LVL574:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 9 251 0
	movl	$__func__.4771, 12(%esp)
	movl	$251, 8(%esp)
	movl	$.LC27, 4(%esp)
	movl	$.LC28, (%esp)
	call	_fail
.LVL575:
	.cfi_endproc
.LFE686:
	.size	node_of_cpu.part.46, .-node_of_cpu.part.46
	.p2align 4,,15
	.globl	node_of_cpu
	.type	node_of_cpu, @function
node_of_cpu:
.LFB321:
	.loc 9 242 0
	.cfi_startproc
.LVL576:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LVL577:
	.loc 9 245 0
	movl	glks+24, %edx
	.loc 9 242 0
	movl	16(%esp), %eax
	.loc 9 245 0
	testl	%edx, %edx
	je	.L443
	.loc 9 246 0
	cmpl	%eax, glks+28
	je	.L461
.LVL578:
	.loc 9 245 0
	cmpl	$1, %edx
	jbe	.L443
	.loc 9 246 0
	cmpl	%eax, glks+32
	je	.L448
.LVL579:
	.loc 9 245 0
	cmpl	$2, %edx
	jbe	.L443
	.loc 9 246 0
	cmpl	%eax, glks+36
	je	.L449
.LVL580:
	.loc 9 245 0
	cmpl	$3, %edx
	jbe	.L443
	.loc 9 246 0
	cmpl	%eax, glks+40
	je	.L450
.LVL581:
	.loc 9 245 0
	cmpl	$4, %edx
	jbe	.L443
	.loc 9 246 0
	cmpl	%eax, glks+44
	je	.L451
.LVL582:
	.loc 9 245 0
	cmpl	$5, %edx
	jbe	.L443
	.loc 9 246 0
	cmpl	%eax, glks+48
	je	.L452
.LVL583:
	.loc 9 245 0
	cmpl	$6, %edx
	jbe	.L443
	.loc 9 246 0
	cmpl	%eax, glks+52
	je	.L453
.LVL584:
	.loc 9 245 0
	cmpl	$7, %edx
	jbe	.L443
	.loc 9 246 0
	cmpl	%eax, glks+56
	je	.L454
.LVL585:
.L443:
	call	node_of_cpu.part.46
.LVL586:
	.p2align 4,,7
	.p2align 3
.L461:
	.loc 9 245 0
	xorl	%eax, %eax
.LVL587:
	.p2align 4,,7
	.p2align 3
.L459:
	.loc 9 252 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL588:
	.p2align 4,,7
	.p2align 3
.L448:
	.cfi_restore_state
	.loc 9 246 0
	movl	$1, %eax
	jmp	.L459
.LVL589:
	.p2align 4,,7
	.p2align 3
.L450:
	movl	$3, %eax
	jmp	.L459
.LVL590:
	.p2align 4,,7
	.p2align 3
.L449:
	movl	$2, %eax
	jmp	.L459
.LVL591:
	.p2align 4,,7
	.p2align 3
.L454:
	movl	$7, %eax
	jmp	.L459
.LVL592:
	.p2align 4,,7
	.p2align 3
.L453:
	movl	$6, %eax
	jmp	.L459
.LVL593:
	.p2align 4,,7
	.p2align 3
.L452:
	movl	$5, %eax
	jmp	.L459
.LVL594:
	.p2align 4,,7
	.p2align 3
.L451:
	movl	$4, %eax
	jmp	.L459
	.cfi_endproc
.LFE321:
	.size	node_of_cpu, .-node_of_cpu
	.text
	.p2align 4,,15
	.type	get_console_port, @function
get_console_port:
.LFB617:
	.loc 32 19 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LBB3852:
.LBB3853:
	.loc 9 123 0
	call	get_current_esp
.LVL595:
.LBB3854:
.LBB3855:
	.loc 10 41 0
	addl	$536870912, %eax
.LVL596:
.LBE3855:
.LBE3854:
	.loc 9 125 0
	cmpl	$524288, %eax
	jbe	.L463
	cmpl	$_boot_stack_top, %eax
	jbe	.L487
.L464:
.LBE3853:
.LBE3852:
	.loc 32 23 0
	movzwl	ia32KSconsolePort, %eax
.LVL597:
	.loc 32 25 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL598:
	.p2align 4,,7
	.p2align 3
.L487:
	.cfi_restore_state
.LBB3857:
.LBB3856:
	.loc 9 126 0
	cmpl	$_boot_stack_bottom, %eax
	jbe	.L464
.L463:
.LBE3856:
.LBE3857:
.LBB3858:
.LBB3859:
	.loc 9 229 0
	call	get_current_esp
.LVL599:
.LBB3860:
.LBB3861:
	.loc 10 41 0
	addl	$536870912, %eax
.LVL600:
.LBE3861:
.LBE3860:
	.loc 9 231 0
	cmpl	$_boot_stack_top, %eax
	jbe	.L472
.L465:
	.loc 9 234 0
	shrl	$11, %eax
.LVL601:
.L466:
.LBE3859:
.LBE3858:
.LBB3863:
.LBB3864:
	.loc 9 245 0
	movl	glks+24, %edx
	testl	%edx, %edx
	je	.L467
	.loc 9 246 0
	cmpl	%eax, glks+28
	je	.L488
.LVL602:
	.loc 9 245 0
	cmpl	$1, %edx
	jbe	.L467
	.loc 9 246 0
	cmpl	%eax, glks+32
	je	.L474
.LVL603:
	.loc 9 245 0
	cmpl	$2, %edx
	jbe	.L467
	.loc 9 246 0
	cmpl	%eax, glks+36
	je	.L475
.LVL604:
	.loc 9 245 0
	cmpl	$3, %edx
	jbe	.L467
	.loc 9 246 0
	cmpl	%eax, glks+40
	je	.L476
.LVL605:
	.loc 9 245 0
	cmpl	$4, %edx
	jbe	.L467
	.loc 9 246 0
	cmpl	%eax, glks+44
	je	.L477
.LVL606:
	.loc 9 245 0
	cmpl	$5, %edx
	jbe	.L467
	.loc 9 246 0
	cmpl	%eax, glks+48
	je	.L478
.LVL607:
	.loc 9 245 0
	cmpl	$6, %edx
	jbe	.L467
	.loc 9 246 0
	cmpl	%eax, glks+52
	je	.L479
.LVL608:
	.loc 9 245 0
	cmpl	$7, %edx
	jbe	.L467
	.loc 9 246 0
	cmpl	%eax, glks+56
	je	.L480
.LVL609:
.L467:
	call	node_of_cpu.part.46
.LVL610:
	.p2align 4,,7
	.p2align 3
.L472:
.LBE3864:
.LBE3863:
.LBB3867:
.LBB3862:
	.loc 9 231 0
	cmpl	$_boot_stack_bottom, %eax
	jbe	.L465
	.loc 9 232 0
	movl	glks+28, %eax
.LVL611:
	jmp	.L466
.LVL612:
	.p2align 4,,7
	.p2align 3
.L488:
.LBE3862:
.LBE3867:
.LBB3868:
.LBB3865:
	.loc 9 245 0
	xorl	%eax, %eax
.LVL613:
	.p2align 4,,7
	.p2align 3
.L468:
.LBE3865:
.LBE3868:
.LBB3869:
.LBB3870:
	.loc 9 132 0
	movzwl	cmdline_opt(%eax,%eax), %eax
.LVL614:
.LBE3870:
.LBE3869:
	.loc 32 25 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL615:
	.p2align 4,,7
	.p2align 3
.L477:
	.cfi_restore_state
.LBB3871:
.LBB3866:
	.loc 9 246 0
	movl	$4, %eax
.LVL616:
	jmp	.L468
.LVL617:
	.p2align 4,,7
	.p2align 3
.L478:
	movl	$5, %eax
.LVL618:
	jmp	.L468
.LVL619:
	.p2align 4,,7
	.p2align 3
.L479:
	movl	$6, %eax
.LVL620:
	jmp	.L468
.LVL621:
	.p2align 4,,7
	.p2align 3
.L480:
	movl	$7, %eax
.LVL622:
	jmp	.L468
.LVL623:
	.p2align 4,,7
	.p2align 3
.L475:
	movl	$2, %eax
.LVL624:
	jmp	.L468
.LVL625:
	.p2align 4,,7
	.p2align 3
.L476:
	movl	$3, %eax
.LVL626:
	jmp	.L468
.LVL627:
	.p2align 4,,7
	.p2align 3
.L474:
	movl	$1, %eax
.LVL628:
	jmp	.L468
.LBE3866:
.LBE3871:
	.cfi_endproc
.LFE617:
	.size	get_console_port, .-get_console_port
	.p2align 4,,15
	.type	console_putchar.constprop.295, @function
console_putchar.constprop.295:
.LFB862:
	.loc 32 43 0
	.cfi_startproc
.LVL629:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 32 45 0
	call	get_console_port
.LVL630:
.LBB3872:
.LBB3873:
	.loc 33 28 0
	movl	$lock_debug, %edx
.LBE3873:
.LBE3872:
	.loc 32 45 0
	movzwl	%ax, %esi
.LVL631:
.LBB3875:
.LBB3874:
	.loc 33 28 0
#APP
# 28 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/kernel/lock.h" 1
	1:                 
movl  $1,    %eax 
xchgl (%edx),  %eax 
testl %eax, %eax 
jnz   1b           

# 0 "" 2
#NO_APP
.LBE3874:
.LBE3875:
	.loc 32 49 0
	testw	%si, %si
	je	.L490
	leal	5(%esi), %ebx
	movzwl	%bx, %ebx
	.p2align 4,,7
	.p2align 3
.L492:
	.loc 32 50 0
	movl	%ebx, (%esp)
	call	in8
.LVL632:
	testb	$96, %al
	je	.L492
	.loc 32 51 0
	movl	$48, 4(%esp)
	movl	%esi, (%esp)
	call	out8
.LVL633:
.L490:
.LBB3876:
.LBB3877:
	.loc 33 42 0
	movl	$0, lock_debug
.LBE3877:
.LBE3876:
	.loc 32 59 0
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL634:
	ret
	.cfi_endproc
.LFE862:
	.size	console_putchar.constprop.295, .-console_putchar.constprop.295
	.p2align 4,,15
	.globl	print_unsigned_long
	.type	print_unsigned_long, @function
print_unsigned_long:
.LFB492:
	.loc 34 56 0
	.cfi_startproc
.LVL635:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$36, %esp
	.cfi_def_cfa_offset 48
	.loc 34 56 0
	movl	52(%esp), %edx
	movl	48(%esp), %ecx
	.loc 34 65 0
	cmpl	$16, %edx
	jne	.L547
	.loc 34 69 0
	testl	%ecx, %ecx
	je	.L500
.L550:
	xorl	%esi, %esi
	cmpl	$10, %edx
.LBB3884:
.LBB3885:
.LBB3886:
.LBB3887:
	.loc 34 35 0
	movl	$-858993459, %ebx
	je	.L510
	cmpl	$16, %edx
	jne	.L545
.L534:
.LVL636:
.LBE3887:
.LBE3886:
.LBB3892:
.LBB3893:
	.loc 34 46 0
	movl	%ecx, %eax
	andl	$15, %eax
.LBE3893:
.LBE3892:
	.loc 34 77 0
	cmpl	$9, %eax
	jbe	.L548
	.loc 34 78 0
	addl	$87, %eax
	movb	%al, 21(%esp,%esi)
.LVL637:
.L526:
.LBB3895:
.LBB3888:
	.loc 34 33 0
	shrl	$4, %ecx
.LVL638:
.LBE3888:
.LBE3895:
	.loc 34 74 0
	addl	$1, %esi
.LVL639:
	testl	%ecx, %ecx
	jne	.L534
.LVL640:
	.p2align 4,,7
	.p2align 3
.L509:
.LBE3885:
.LBE3884:
	.loc 34 69 0
	movl	%esi, %ebx
.LVL641:
	.p2align 4,,7
	.p2align 3
.L511:
.LBB3902:
.LBB3900:
	.loc 34 85 0
	subl	$1, %ebx
.LVL642:
	movsbl	21(%esp,%ebx), %eax
	movl	%eax, (%esp)
	call	console_putchar
.LVL643:
	.loc 34 84 0
	testl	%ebx, %ebx
	jne	.L511
	.loc 34 74 0
	movl	%esi, %eax
.LVL644:
.L523:
.LBE3900:
.LBE3902:
	.loc 34 89 0
	addl	$36, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L510:
	.cfi_restore_state
.LVL645:
.LBB3903:
.LBB3901:
.LBB3896:
.LBB3894:
	.loc 34 48 0
	movl	%ecx, %eax
	mull	%ebx
	shrl	$3, %edx
	leal	(%edx,%edx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
.LVL646:
	addl	$48, %ecx
	movb	%cl, 21(%esp,%esi)
.LVL647:
.LBE3894:
.LBE3896:
	.loc 34 74 0
	addl	$1, %esi
.LVL648:
	testl	%edx, %edx
.LBB3897:
.LBB3889:
	.loc 34 35 0
	movl	%edx, %ecx
.LVL649:
.LBE3889:
.LBE3897:
	.loc 34 74 0
	jne	.L510
	jmp	.L509
.LVL650:
	.p2align 4,,7
	.p2align 3
.L549:
.LBB3898:
.LBB3890:
	.loc 34 33 0
	shrl	$4, %ecx
.LVL651:
.LBE3890:
.LBE3898:
	.loc 34 74 0
	addl	$1, %esi
.LVL652:
	testl	%ecx, %ecx
	je	.L509
.LVL653:
.L545:
.LBB3899:
.LBB3891:
	.loc 34 31 0
	cmpl	$16, %edx
	movb	$48, 21(%esp,%esi)
.LVL654:
	je	.L549
.LVL655:
.LBE3891:
.LBE3899:
	.loc 34 74 0
	addl	$1, %esi
.LVL656:
	jmp	.L509
.LVL657:
	.p2align 4,,7
	.p2align 3
.L547:
.LBE3901:
.LBE3903:
	.loc 34 66 0
	xorl	%eax, %eax
	.loc 34 65 0
	cmpl	$10, %edx
	jne	.L523
	.loc 34 69 0
	testl	%ecx, %ecx
	jne	.L550
.L500:
	.loc 34 70 0
	call	console_putchar.constprop.295
.LVL658:
	.loc 34 89 0
	addl	$36, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 34 71 0
	movl	$1, %eax
	.loc 34 89 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL659:
.L548:
	.cfi_restore_state
	addl	$48, %eax
	movb	%al, 21(%esp,%esi)
.LVL660:
	jmp	.L526
	.cfi_endproc
.LFE492:
	.size	print_unsigned_long, .-print_unsigned_long
	.p2align 4,,15
	.type	print_unsigned_long.constprop.298, @function
print_unsigned_long.constprop.298:
.LFB859:
	.loc 34 55 0
	.cfi_startproc
.LVL661:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$36, %esp
	.cfi_def_cfa_offset 48
	.loc 34 69 0
	testl	%eax, %eax
	je	.L552
.LBB3910:
.LBB3911:
.LBB3912:
.LBB3913:
	.loc 34 46 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$9, %ecx
.LBE3913:
.LBE3912:
	.loc 34 78 0
	leal	87(%ecx), %ebx
	.loc 34 80 0
	leal	48(%ecx), %edx
.LBB3920:
.LBB3921:
	.loc 34 33 0
	movl	%eax, %ecx
	cmova	%ebx, %edx
	shrl	$4, %ecx
.LBE3921:
.LBE3920:
	.loc 34 74 0
	testl	%ecx, %ecx
	movb	%dl, 21(%esp)
.LVL662:
	je	.L557
.LVL663:
.LBB3928:
.LBB3914:
	.loc 34 46 0
	andl	$15, %ecx
	cmpl	$9, %ecx
.LBE3914:
.LBE3928:
	.loc 34 78 0
	leal	87(%ecx), %ebx
	.loc 34 80 0
	leal	48(%ecx), %edx
.LBB3929:
.LBB3922:
	.loc 34 33 0
	movl	%eax, %ecx
	cmova	%ebx, %edx
	shrl	$8, %ecx
.LBE3922:
.LBE3929:
	.loc 34 74 0
	testl	%ecx, %ecx
	movb	%dl, 22(%esp)
.LVL664:
	je	.L558
.LVL665:
.LBB3930:
.LBB3915:
	.loc 34 46 0
	andl	$15, %ecx
	cmpl	$9, %ecx
.LBE3915:
.LBE3930:
	.loc 34 78 0
	leal	87(%ecx), %ebx
	.loc 34 80 0
	leal	48(%ecx), %edx
.LBB3931:
.LBB3923:
	.loc 34 33 0
	movl	%eax, %ecx
	cmova	%ebx, %edx
	shrl	$12, %ecx
.LBE3923:
.LBE3931:
	.loc 34 74 0
	testl	%ecx, %ecx
	movb	%dl, 23(%esp)
.LVL666:
	je	.L559
.LVL667:
.LBB3932:
.LBB3916:
	.loc 34 46 0
	andl	$15, %ecx
	cmpl	$9, %ecx
.LBE3916:
.LBE3932:
	.loc 34 78 0
	leal	87(%ecx), %ebx
	.loc 34 80 0
	leal	48(%ecx), %edx
.LBB3933:
.LBB3924:
	.loc 34 33 0
	movl	%eax, %ecx
	cmova	%ebx, %edx
	shrl	$16, %ecx
.LBE3924:
.LBE3933:
	.loc 34 74 0
	testl	%ecx, %ecx
	movb	%dl, 24(%esp)
.LVL668:
	je	.L560
.LVL669:
.LBB3934:
.LBB3917:
	.loc 34 46 0
	andl	$15, %ecx
	cmpl	$9, %ecx
.LBE3917:
.LBE3934:
	.loc 34 78 0
	leal	87(%ecx), %ebx
	.loc 34 80 0
	leal	48(%ecx), %edx
.LBB3935:
.LBB3925:
	.loc 34 33 0
	movl	%eax, %ecx
	cmova	%ebx, %edx
	shrl	$20, %ecx
.LBE3925:
.LBE3935:
	.loc 34 74 0
	testl	%ecx, %ecx
	movb	%dl, 25(%esp)
.LVL670:
	je	.L561
.LVL671:
.LBB3936:
.LBB3918:
	.loc 34 46 0
	andl	$15, %ecx
	cmpl	$9, %ecx
.LBE3918:
.LBE3936:
	.loc 34 78 0
	leal	87(%ecx), %ebx
	.loc 34 80 0
	leal	48(%ecx), %edx
.LBB3937:
.LBB3926:
	.loc 34 33 0
	movl	%eax, %ecx
	cmova	%ebx, %edx
	shrl	$24, %ecx
.LBE3926:
.LBE3937:
	.loc 34 74 0
	testl	%ecx, %ecx
	movb	%dl, 26(%esp)
.LVL672:
	je	.L562
.LVL673:
.LBB3938:
.LBB3919:
	.loc 34 46 0
	andl	$15, %ecx
	cmpl	$9, %ecx
.LBE3919:
.LBE3938:
	.loc 34 78 0
	leal	87(%ecx), %ebx
	.loc 34 80 0
	leal	48(%ecx), %edx
	cmova	%ebx, %edx
.LBB3939:
.LBB3927:
	.loc 34 33 0
	shrl	$28, %eax
.LVL674:
.LBE3927:
.LBE3939:
	.loc 34 74 0
	testl	%eax, %eax
	movb	%dl, 27(%esp)
.LVL675:
	je	.L563
.LVL676:
	.loc 34 78 0
	leal	87(%eax), %ecx
	cmpl	$9, %eax
	.loc 34 80 0
	leal	48(%eax), %edx
	.loc 34 74 0
	movl	$8, %esi
	cmova	%ecx, %edx
	movb	%dl, 28(%esp)
.LVL677:
.L553:
	movl	%esi, %ebx
.LVL678:
	.p2align 4,,7
	.p2align 3
.L554:
	.loc 34 85 0
	subl	$1, %ebx
.LVL679:
	movsbl	21(%esp,%ebx), %edx
	movl	%edx, (%esp)
	call	console_putchar
.LVL680:
	.loc 34 84 0
	testl	%ebx, %ebx
	jne	.L554
.LBE3911:
.LBE3910:
	.loc 34 89 0
	addl	$36, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB3942:
.LBB3940:
	movl	%esi, %eax
.LBE3940:
.LBE3942:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL681:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL682:
	.p2align 4,,7
	.p2align 3
.L552:
	.cfi_restore_state
	.loc 34 70 0
	call	console_putchar.constprop.295
.LVL683:
	.loc 34 89 0
	addl	$36, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 34 71 0
	movl	$1, %eax
	.loc 34 89 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL684:
	.p2align 4,,7
	.p2align 3
.L560:
	.cfi_restore_state
.LBB3943:
.LBB3941:
	.loc 34 74 0
	movl	$4, %esi
	jmp	.L553
.LVL685:
	.p2align 4,,7
	.p2align 3
.L561:
	movl	$5, %esi
	jmp	.L553
.LVL686:
	.p2align 4,,7
	.p2align 3
.L562:
	movl	$6, %esi
	jmp	.L553
.LVL687:
	.p2align 4,,7
	.p2align 3
.L563:
	movl	$7, %esi
	jmp	.L553
.LVL688:
	.p2align 4,,7
	.p2align 3
.L558:
	movl	$2, %esi
	jmp	.L553
.LVL689:
	.p2align 4,,7
	.p2align 3
.L559:
	movl	$3, %esi
	jmp	.L553
.LVL690:
	.p2align 4,,7
	.p2align 3
.L557:
	movl	$1, %esi
	jmp	.L553
.LBE3941:
.LBE3943:
	.cfi_endproc
.LFE859:
	.size	print_unsigned_long.constprop.298, .-print_unsigned_long.constprop.298
	.section	.rodata.str1.4
	.align 4
.LC29:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/kernel/vspace.c"
	.section	.rodata.str1.1
.LC30:
	.string	"Invalid VM rights"
	.section	.text.unlikely,"ax",@progbits
	.type	WritableFromVMRights, @function
WritableFromVMRights:
.LFB355:
	.loc 4 996 0
	.cfi_startproc
.LVL691:
	.loc 4 997 0
	cmpl	$2, %eax
	je	.L567
	.loc 4 997 0
	cmpl	$3, %eax
	je	.L569
	decl	%eax
.LVL692:
	je	.L569
.LVL693:
	.loc 4 996 0
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB3946:
.LBB3947:
	.loc 4 1006 0
	movl	$__func__.5121, 12(%esp)
	movl	$1006, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC30, (%esp)
	call	_fail
.LVL694:
.L567:
	.cfi_def_cfa_offset 4
.LBE3947:
.LBE3946:
	.loc 4 999 0
	xorl	%eax, %eax
.LVL695:
	ret
.LVL696:
.L569:
	.loc 4 1003 0
	movl	$1, %eax
	.loc 4 1008 0
	ret
	.cfi_endproc
.LFE355:
	.size	WritableFromVMRights, .-WritableFromVMRights
	.type	SuperUserFromVMRights.part.49, @function
SuperUserFromVMRights.part.49:
.LFB689:
	.loc 4 1010 0
	.cfi_startproc
.LVL697:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 4 1021 0
	movl	$__func__.5129, 12(%esp)
	movl	$1021, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC30, (%esp)
	call	_fail
.LVL698:
	.cfi_endproc
.LFE689:
	.size	SuperUserFromVMRights.part.49, .-SuperUserFromVMRights.part.49
	.section	.rodata.str1.4
	.align 4
.LC31:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/object/objecttype.c"
	.section	.rodata.str1.1
.LC32:
	.string	"Invalid object type"
	.text
	.p2align 4,,15
	.globl	Arch_getObjectSize
	.type	Arch_getObjectSize, @function
Arch_getObjectSize:
.LFB419:
	.loc 19 401 0
	.cfi_startproc
.LVL699:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 19 401 0
	movl	32(%esp), %eax
	.loc 19 402 0
	cmpl	$6, %eax
	je	.L584
	ja	.L582
	cmpl	$5, %eax
	jne	.L580
.L583:
	.loc 19 404 0
	movl	$12, %eax
	.loc 19 419 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L582:
	.cfi_restore_state
	.loc 19 402 0
	cmpl	$8, %eax
	jbe	.L583
.L580:
	.loc 19 416 0
	movl	$__func__.5716, 12(%esp)
	movl	$416, 8(%esp)
	movl	$.LC31, 4(%esp)
	movl	$.LC32, (%esp)
	call	_fail
.LVL700:
	.p2align 4,,7
	.p2align 3
.L584:
	.loc 19 406 0
	movl	$22, %eax
	.loc 19 419 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE419:
	.size	Arch_getObjectSize, .-Arch_getObjectSize
	.p2align 4,,15
	.globl	getObjectSize
	.type	getObjectSize, @function
getObjectSize:
.LFB556:
	.file 38 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/objecttype.c"
	.loc 38 34 0
	.cfi_startproc
.LVL701:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 38 34 0
	movl	32(%esp), %edx
	.loc 38 35 0
	cmpl	$4, %edx
	ja	.L608
	.loc 38 38 0
	cmpl	$3, %edx
	ja	.L597
	cmpl	$2, %edx
	.loc 38 42 0
	movl	$4, %eax
	.loc 38 38 0
	jae	.L595
	cmpl	$1, %edx
	.loc 38 40 0
	movb	$10, %al
	.loc 38 38 0
	jne	.L596
.L595:
	.loc 38 54 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L597:
	.cfi_restore_state
	.loc 38 46 0
	movl	36(%esp), %eax
	addl	$4, %eax
	.loc 38 38 0
	cmpl	$4, %edx
	je	.L595
.L596:
	.loc 38 48 0
	movl	36(%esp), %eax
	.loc 38 54 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L608:
	.cfi_restore_state
.LVL702:
.LBB3952:
.LBB3953:
	.loc 19 402 0
	cmpl	$6, %edx
	je	.L600
	.p2align 4,,2
	ja	.L593
	cmpl	$5, %edx
	.p2align 4,,5
	jne	.L591
.L594:
	.loc 19 404 0
	movl	$12, %eax
	.p2align 4,,3
	jmp	.L595
	.p2align 4,,7
	.p2align 3
.L600:
	.loc 19 406 0
	movl	$22, %eax
.LBE3953:
.LBE3952:
	.loc 38 36 0
	jmp	.L595
	.p2align 4,,7
	.p2align 3
.L593:
.LBB3955:
.LBB3954:
	.loc 19 402 0
	cmpl	$8, %edx
	jbe	.L594
.L591:
	.loc 19 416 0
	movl	$__func__.5716, 12(%esp)
	movl	$416, 8(%esp)
	movl	$.LC31, 4(%esp)
	movl	$.LC32, (%esp)
	call	_fail
.LVL703:
.LBE3954:
.LBE3955:
	.cfi_endproc
.LFE556:
	.size	getObjectSize, .-getObjectSize
	.section	.rodata.str1.4
	.align 4
.LC33:
	.string	"seL4 failed assertion '%s' at %s:%u in function %s\n"
	.text
	.p2align 4,,15
	.globl	_assert_fail
	.type	_assert_fail, @function
_assert_fail:
.LFB429:
	.loc 36 37 0
	.cfi_startproc
.LVL704:
	subl	$44, %esp
	.cfi_def_cfa_offset 48
	.loc 36 38 0
	movl	60(%esp), %eax
	movl	$.LC33, (%esp)
	movl	%eax, 16(%esp)
	movl	56(%esp), %eax
	movl	%eax, 12(%esp)
	movl	52(%esp), %eax
	movl	%eax, 8(%esp)
	movl	48(%esp), %eax
	movl	%eax, 4(%esp)
	call	printf
.LVL705:
	.loc 36 44 0
	call	halt
.LVL706:
	.cfi_endproc
.LFE429:
	.size	_assert_fail, .-_assert_fail
	.section	.rodata.str1.4
	.align 4
.LC34:
	.string	"./arch/object/structures_gen.h"
	.align 4
.LC35:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_reply_cap"
	.section	.text.unlikely
	.type	cap_reply_cap_get_capReplyMaster.part.53, @function
cap_reply_cap_get_capReplyMaster.part.53:
.LFB693:
	.loc 27 1236 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1237 0
	movl	$__FUNCTION__.1667, 12(%esp)
	movl	$1238, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC35, (%esp)
	call	_assert_fail
.LVL707:
	.cfi_endproc
.LFE693:
	.size	cap_reply_cap_get_capReplyMaster.part.53, .-cap_reply_cap_get_capReplyMaster.part.53
	.text
	.p2align 4,,15
	.type	cap_reply_cap_get_capTCBPtr.isra.54.part.55, @function
cap_reply_cap_get_capTCBPtr.isra.54.part.55:
.LFB695:
	.loc 27 1244 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1245 0
	movl	$__FUNCTION__.1671, 12(%esp)
	movl	$1246, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC35, (%esp)
	call	_assert_fail
.LVL708:
	.cfi_endproc
.LFE695:
	.size	cap_reply_cap_get_capTCBPtr.isra.54.part.55, .-cap_reply_cap_get_capTCBPtr.isra.54.part.55
	.section	.rodata.str1.4
	.align 4
.LC36:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_endpoint_cap"
	.text
	.p2align 4,,15
	.type	cap_endpoint_cap_get_capCanReceive.part.56, @function
cap_endpoint_cap_get_capCanReceive.part.56:
.LFB696:
	.loc 27 1067 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1068 0
	movl	$__FUNCTION__.1603, 12(%esp)
	movl	$1069, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC36, (%esp)
	call	_assert_fail
.LVL709:
	.cfi_endproc
.LFE696:
	.size	cap_endpoint_cap_get_capCanReceive.part.56, .-cap_endpoint_cap_get_capCanReceive.part.56
	.section	.rodata.str1.4
	.align 4
.LC37:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_async_endpoint_cap"
	.section	.text.unlikely
	.type	cap_async_endpoint_cap_get_capAEPCanReceive.part.57, @function
cap_async_endpoint_cap_get_capAEPCanReceive.part.57:
.LFB697:
	.loc 27 1166 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1167 0
	movl	$__FUNCTION__.1642, 12(%esp)
	movl	$1168, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC37, (%esp)
	call	_assert_fail
.LVL710:
	.cfi_endproc
.LFE697:
	.size	cap_async_endpoint_cap_get_capAEPCanReceive.part.57, .-cap_async_endpoint_cap_get_capAEPCanReceive.part.57
	.section	.rodata.str1.1
.LC38:
	.string	"(bitsLeft & ~0x3f) == 0"
	.section	.text.unlikely
	.type	lookup_fault_missing_capability_new.part.58, @function
lookup_fault_missing_capability_new.part.58:
.LFB698:
	.loc 27 2377 0
	.cfi_startproc
.LVL711:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2384 0
	movl	$__FUNCTION__.2096, 12(%esp)
	movl	$2384, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC38, (%esp)
	call	_assert_fail
.LVL712:
	.cfi_endproc
.LFE698:
	.size	lookup_fault_missing_capability_new.part.58, .-lookup_fault_missing_capability_new.part.58
	.section	.rodata.str1.4
	.align 4
.LC39:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_cnode_cap"
	.section	.text.unlikely
	.type	cap_cnode_cap_get_capCNodeGuardSize.part.59, @function
cap_cnode_cap_get_capCNodeGuardSize.part.59:
.LFB699:
	.loc 27 1291 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1292 0
	movl	$__FUNCTION__.1687, 12(%esp)
	movl	$1293, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC39, (%esp)
	call	_assert_fail
.LVL713:
	.cfi_endproc
.LFE699:
	.size	cap_cnode_cap_get_capCNodeGuardSize.part.59, .-cap_cnode_cap_get_capCNodeGuardSize.part.59
	.type	cap_cnode_cap_get_capCNodeRadix.part.60, @function
cap_cnode_cap_get_capCNodeRadix.part.60:
.LFB700:
	.loc 27 1283 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1284 0
	movl	$__FUNCTION__.1683, 12(%esp)
	movl	$1285, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC39, (%esp)
	call	_assert_fail
.LVL714:
	.cfi_endproc
.LFE700:
	.size	cap_cnode_cap_get_capCNodeRadix.part.60, .-cap_cnode_cap_get_capCNodeRadix.part.60
	.type	cap_cnode_cap_get_capCNodeGuard.part.61, @function
cap_cnode_cap_get_capCNodeGuard.part.61:
.LFB701:
	.loc 27 1311 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1312 0
	movl	$__FUNCTION__.1696, 12(%esp)
	movl	$1313, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC39, (%esp)
	call	_assert_fail
.LVL715:
	.cfi_endproc
.LFE701:
	.size	cap_cnode_cap_get_capCNodeGuard.part.61, .-cap_cnode_cap_get_capCNodeGuard.part.61
	.type	cap_cnode_cap_get_capCNodePtr.isra.62.part.63, @function
cap_cnode_cap_get_capCNodePtr.isra.62.part.63:
.LFB703:
	.loc 27 1331 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1332 0
	movl	$__FUNCTION__.1705, 12(%esp)
	movl	$1333, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC39, (%esp)
	call	_assert_fail
.LVL716:
	.cfi_endproc
.LFE703:
	.size	cap_cnode_cap_get_capCNodePtr.isra.62.part.63, .-cap_cnode_cap_get_capCNodePtr.isra.62.part.63
	.text
	.p2align 4,,15
	.type	lookup_fp, @function
lookup_fp:
.LFB277:
	.loc 1 29 0
	.cfi_startproc
.LVL717:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	%edx, %edi
.LVL718:
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
.LBB3956:
.LBB3957:
	.loc 27 880 0
	andl	$15, %edx
.LVL719:
.LBE3957:
.LBE3956:
	.loc 1 29 0
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	.loc 1 37 0
	cmpl	$10, %edx
	jne	.L634
	movl	%ecx, %esi
	xorl	%ebx, %ebx
	.loc 1 52 0
	movl	%eax, 4(%esp)
.LVL720:
.L632:
	.loc 1 44 0
	movl	28(%esp), %eax
.LBB3958:
.LBB3959:
	.loc 27 1295 0
	movl	%esi, %edx
.LBE3959:
.LBE3958:
.LBB3962:
.LBB3963:
	.loc 27 1287 0
	movl	%esi, %ebp
.LBE3963:
.LBE3962:
.LBB3966:
.LBB3960:
	.loc 27 1295 0
	andl	$8126464, %edx
.LBE3960:
.LBE3966:
.LBB3967:
.LBB3964:
	.loc 27 1287 0
	andl	$260046848, %ebp
.LBE3964:
.LBE3967:
.LBB3968:
.LBB3961:
	.loc 27 1295 0
	shrl	$18, %edx
.LVL721:
.LBE3961:
.LBE3968:
	.loc 1 44 0
	movl	%ebx, %ecx
.LVL722:
.LBB3969:
.LBB3965:
	.loc 27 1287 0
	shrl	$23, %ebp
.LBE3965:
.LBE3969:
	.loc 1 44 0
	sall	%cl, %eax
	.loc 1 52 0
	testl	%edx, %edx
	.loc 1 44 0
	movl	%eax, (%esp)
.LVL723:
	.loc 1 52 0
	jne	.L645
.LVL724:
.L633:
	.loc 1 56 0
	movl	(%esp), %esi
	movl	%edx, %ecx
	.loc 1 60 0
	addl	%ebp, %edx
.LVL725:
.LBB3970:
.LBB3971:
	.loc 27 1335 0
	andl	$2147483632, %edi
.LVL726:
.LBE3971:
.LBE3970:
	.loc 1 60 0
	addl	%edx, %ebx
.LVL727:
	.loc 1 56 0
	sall	%cl, %esi
	movl	$32, %ecx
	subl	%ebp, %ecx
	shrl	%cl, %esi
	.loc 1 57 0
	sall	$4, %esi
	.loc 1 62 0
	cmpl	$31, %ebx
	.loc 1 57 0
	leal	(%esi,%edi,2), %ecx
.LVL728:
	.loc 1 59 0
	movl	(%ecx), %edi
.LVL729:
	movl	4(%ecx), %esi
.LVL730:
	.loc 1 62 0
	jbe	.L646
	.loc 1 64 0
	cmpl	$32, %ebx
	movl	4(%esp), %eax
	jne	.L634
.L637:
	.loc 1 70 0
	movl	%edi, (%eax)
	movl	%esi, 4(%eax)
.LVL731:
.L629:
	.loc 1 71 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL732:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL733:
.L645:
	.cfi_restore_state
	.loc 1 52 0 discriminator 1
	movl	$32, %ecx
.LBB3972:
.LBB3973:
	.loc 27 1315 0 discriminator 1
	andl	$262143, %esi
.LVL734:
.LBE3973:
.LBE3972:
	.loc 1 52 0 discriminator 1
	subl	%edx, %ecx
	shrl	%cl, %eax
.LVL735:
	cmpl	%esi, %eax
	je	.L633
	movl	4(%esp), %eax
.LVL736:
.L634:
.LBB3974:
.LBB3975:
	.loc 27 896 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	jmp	.L629
.LVL737:
.L646:
.LBE3975:
.LBE3974:
.LBB3976:
.LBB3977:
	.loc 27 880 0 discriminator 1
	movl	%edi, %edx
	andl	$15, %edx
.LBE3977:
.LBE3976:
	.loc 1 62 0 discriminator 1
	cmpl	$10, %edx
	je	.L632
	movl	4(%esp), %eax
	jmp	.L637
	.cfi_endproc
.LFE277:
	.size	lookup_fp, .-lookup_fp
	.p2align 4,,15
	.type	cap_endpoint_cap_get_capCanSend.part.64, @function
cap_endpoint_cap_get_capCanSend.part.64:
.LFB704:
	.loc 27 1047 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1048 0
	movl	$__FUNCTION__.1594, 12(%esp)
	movl	$1049, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC36, (%esp)
	call	_assert_fail
.LVL738:
	.cfi_endproc
.LFE704:
	.size	cap_endpoint_cap_get_capCanSend.part.64, .-cap_endpoint_cap_get_capCanSend.part.64
	.p2align 4,,15
	.type	cap_endpoint_cap_get_capEPPtr.isra.65.part.66, @function
cap_endpoint_cap_get_capEPPtr.isra.65.part.66:
.LFB706:
	.loc 27 1087 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1088 0
	movl	$__FUNCTION__.1612, 12(%esp)
	movl	$1089, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC36, (%esp)
	call	_assert_fail
.LVL739:
	.cfi_endproc
.LFE706:
	.size	cap_endpoint_cap_get_capEPPtr.isra.65.part.66, .-cap_endpoint_cap_get_capEPPtr.isra.65.part.66
	.section	.rodata.str1.4
	.align 4
.LC40:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_page_directory_cap"
	.text
	.p2align 4,,15
	.type	cap_page_directory_cap_get_capPDBasePtr.isra.67.part.68, @function
cap_page_directory_cap_get_capPDBasePtr.isra.67.part.68:
.LFB708:
	.loc 27 1707 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1708 0
	movl	$__FUNCTION__.1851, 12(%esp)
	movl	$1709, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC40, (%esp)
	call	_assert_fail
.LVL740:
	.cfi_endproc
.LFE708:
	.size	cap_page_directory_cap_get_capPDBasePtr.isra.67.part.68, .-cap_page_directory_cap_get_capPDBasePtr.isra.67.part.68
	.section	.text.unlikely
	.type	cap_page_directory_cap_get_capPDIsMapped.part.69, @function
cap_page_directory_cap_get_capPDIsMapped.part.69:
.LFB709:
	.loc 27 1653 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1654 0
	movl	$__FUNCTION__.1828, 12(%esp)
	movl	$1655, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC40, (%esp)
	call	_assert_fail
.LVL741:
	.cfi_endproc
.LFE709:
	.size	cap_page_directory_cap_get_capPDIsMapped.part.69, .-cap_page_directory_cap_get_capPDIsMapped.part.69
	.text
	.p2align 4,,15
	.globl	isValidVTableRoot
	.type	isValidVTableRoot, @function
isValidVTableRoot:
.LFB363:
	.loc 4 1145 0
	.cfi_startproc
.LVL742:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 4 1145 0
	movl	16(%esp), %eax
.LVL743:
	movl	20(%esp), %ebx
.LVL744:
.LBB3978:
.LBB3979:
	.loc 27 872 0
	movl	%eax, %ecx
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %eax
.LVL745:
	cmpl	$14, %ecx
	cmovne	%edx, %eax
	movl	%eax, %ecx
.LBE3979:
.LBE3978:
	xorl	%eax, %eax
	.loc 4 1146 0
	cmpl	$5, %ecx
	je	.L662
	.loc 4 1148 0 discriminator 4
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L662:
	.cfi_restore_state
.LVL746:
.LBB3980:
.LBB3981:
	.loc 27 1654 0 discriminator 1
	cmpl	$5, %edx
	jne	.L663
	.loc 27 1657 0
	movl	%ebx, %eax
.LBE3981:
.LBE3980:
	.loc 4 1148 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
.LBB3984:
.LBB3982:
	.loc 27 1657 0
	andl	$65536, %eax
	shrl	$16, %eax
.LBE3982:
.LBE3984:
	.loc 4 1148 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL747:
	ret
.LVL748:
.L663:
	.cfi_restore_state
.LBB3985:
.LBB3983:
	call	cap_page_directory_cap_get_capPDIsMapped.part.69
.LVL749:
.LBE3983:
.LBE3985:
	.cfi_endproc
.LFE363:
	.size	isValidVTableRoot, .-isValidVTableRoot
	.p2align 4,,15
	.type	cap_endpoint_cap_get_capCanGrant.part.70, @function
cap_endpoint_cap_get_capCanGrant.part.70:
.LFB710:
	.loc 27 1027 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1028 0
	movl	$__FUNCTION__.1585, 12(%esp)
	movl	$1029, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC36, (%esp)
	call	_assert_fail
.LVL750:
	.cfi_endproc
.LFE710:
	.size	cap_endpoint_cap_get_capCanGrant.part.70, .-cap_endpoint_cap_get_capCanGrant.part.70
	.p2align 4,,15
	.type	cap_endpoint_cap_get_capEPBadge.part.71, @function
cap_endpoint_cap_get_capEPBadge.part.71:
.LFB711:
	.loc 27 1007 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1008 0
	movl	$__FUNCTION__.1576, 12(%esp)
	movl	$1009, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC36, (%esp)
	call	_assert_fail
.LVL751:
	.cfi_endproc
.LFE711:
	.size	cap_endpoint_cap_get_capEPBadge.part.71, .-cap_endpoint_cap_get_capEPBadge.part.71
	.section	.rodata.str1.4
	.align 4
.LC41:
	.string	"((gdt_entry_ptr->words[1] >> 10) & 0x7) == gdt_entry_gdt_data"
	.section	.text.unlikely
	.type	gdt_entry_gdt_data_ptr_set_base_low.part.72, @function
gdt_entry_gdt_data_ptr_set_base_low.part.72:
.LFB712:
	.loc 27 2268 0
	.cfi_startproc
.LVL752:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2270 0
	movl	$__FUNCTION__.2058, 12(%esp)
	movl	$2271, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC41, (%esp)
	call	_assert_fail
.LVL753:
	.cfi_endproc
.LFE712:
	.size	gdt_entry_gdt_data_ptr_set_base_low.part.72, .-gdt_entry_gdt_data_ptr_set_base_low.part.72
	.type	gdt_entry_gdt_data_ptr_set_base_mid.isra.73.part.74, @function
gdt_entry_gdt_data_ptr_set_base_mid.isra.73.part.74:
.LFB714:
	.loc 27 2255 0
	.cfi_startproc
.LVL754:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2257 0
	movl	$__FUNCTION__.2053, 12(%esp)
	movl	$2258, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC41, (%esp)
	call	_assert_fail
.LVL755:
	.cfi_endproc
.LFE714:
	.size	gdt_entry_gdt_data_ptr_set_base_mid.isra.73.part.74, .-gdt_entry_gdt_data_ptr_set_base_mid.isra.73.part.74
	.section	.rodata.str1.1
.LC42:
	.string	"((~0xff >> 0) & v) == 0"
	.text
	.p2align 4,,15
	.type	gdt_entry_gdt_data_ptr_set_base_mid.isra.73, @function
gdt_entry_gdt_data_ptr_set_base_mid.isra.73:
.LFB713:
	.loc 27 2255 0
	.cfi_startproc
.LVL756:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2257 0
	movl	(%eax), %ebx
	movl	%ebx, %ecx
	shrl	$10, %ecx
	andl	$7, %ecx
	cmpl	$4, %ecx
	jne	.L676
	.loc 27 2261 0
	testl	$-256, %edx
	jne	.L677
	.loc 27 2263 0
	xorb	%bl, %bl
	movl	%ebx, %ecx
	.loc 27 2264 0
	orl	%edx, %ecx
	movl	%ecx, (%eax)
	.loc 27 2265 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.L676:
	.cfi_restore_state
	call	gdt_entry_gdt_data_ptr_set_base_mid.isra.73.part.74
.LVL757:
.L677:
	.loc 27 2261 0
	movl	$__FUNCTION__.2053, 12(%esp)
	movl	$2261, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC42, (%esp)
	call	_assert_fail
.LVL758:
	.cfi_endproc
.LFE713:
	.size	gdt_entry_gdt_data_ptr_set_base_mid.isra.73, .-gdt_entry_gdt_data_ptr_set_base_mid.isra.73
	.section	.text.unlikely
	.type	gdt_entry_gdt_data_ptr_set_base_high.isra.75.part.76, @function
gdt_entry_gdt_data_ptr_set_base_high.isra.75.part.76:
.LFB716:
	.loc 27 2242 0
	.cfi_startproc
.LVL759:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2244 0
	movl	$__FUNCTION__.2048, 12(%esp)
	movl	$2245, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC41, (%esp)
	call	_assert_fail
.LVL760:
	.cfi_endproc
.LFE716:
	.size	gdt_entry_gdt_data_ptr_set_base_high.isra.75.part.76, .-gdt_entry_gdt_data_ptr_set_base_high.isra.75.part.76
	.text
	.p2align 4,,15
	.type	switchToThread_fp, @function
switchToThread_fp:
.LFB278:
	.loc 1 75 0
	.cfi_startproc
.LVL761:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
.LBB4004:
.LBB4005:
	.loc 10 41 0
	addl	$536870912, %edx
.LVL762:
.LBE4005:
.LBE4004:
	.loc 1 75 0
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	%ecx, %ebx
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 1 79 0
	cmpl	ia32KSCurrentPD, %edx
	je	.L681
.LVL763:
.LBB4006:
.LBB4007:
	.file 39 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine.h"
	.loc 39 39 0
	movl	%edx, ia32KSCurrentPD
.LVL764:
.LBB4008:
.LBB4009:
	.loc 2 35 0
#APP
# 35 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %edx, %cr3
# 0 "" 2
.LVL765:
#NO_APP
.L681:
.LBE4009:
.LBE4008:
.LBE4007:
.LBE4006:
.LBB4010:
.LBB4011:
	.loc 27 2270 0
	movl	ia32KSgdt+52, %eax
.LBE4011:
.LBE4010:
.LBB4015:
.LBB4016:
	.loc 13 27 0
	movl	48(%ebx), %esi
.LVL766:
.LBE4016:
.LBE4015:
.LBB4017:
.LBB4012:
	.loc 27 2270 0
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L684
.LBE4012:
.LBE4017:
	.loc 1 88 0
	movl	%esi, %edx
.LVL767:
	movl	$ia32KSgdt+52, %eax
	shrl	$16, %edx
	movzbl	%dl, %edx
.LBB4018:
.LBB4013:
	.loc 27 2277 0
	movw	%si, ia32KSgdt+50
.LBE4013:
.LBE4018:
	.loc 1 89 0
	shrl	$24, %esi
.LVL768:
	.loc 1 88 0
	call	gdt_entry_gdt_data_ptr_set_base_mid.isra.73
.LVL769:
.LBB4019:
.LBB4020:
	.loc 27 2244 0
	movl	ia32KSgdt+52, %edx
	movl	%edx, %eax
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L685
.LBE4020:
.LBE4019:
.LBB4023:
.LBB4024:
	.loc 27 2270 0
	movl	ia32KSgdt+60, %eax
.LBE4024:
.LBE4023:
.LBB4027:
.LBB4021:
	.loc 27 2251 0
	sall	$24, %esi
	.loc 27 2250 0
	andl	$16777215, %edx
	.loc 27 2251 0
	orl	%edx, %esi
	movl	%esi, ia32KSgdt+52
.LBE4021:
.LBE4027:
	.loc 1 92 0
	movl	636(%ebx), %esi
.LVL770:
.LBB4028:
.LBB4025:
	.loc 27 2270 0
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L684
.LBE4025:
.LBE4028:
	.loc 1 94 0
	movl	%esi, %edx
	movl	$ia32KSgdt+60, %eax
	shrl	$16, %edx
	movzbl	%dl, %edx
.LBB4029:
.LBB4026:
	.loc 27 2277 0
	movw	%si, ia32KSgdt+58
.LBE4026:
.LBE4029:
	.loc 1 95 0
	shrl	$24, %esi
.LVL771:
	.loc 1 94 0
	call	gdt_entry_gdt_data_ptr_set_base_mid.isra.73
.LVL772:
.LBB4030:
.LBB4031:
	.loc 27 2244 0
	movl	ia32KSgdt+60, %edx
	movl	%edx, %eax
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L685
	.loc 27 2251 0
	sall	$24, %esi
.LVL773:
	.loc 27 2250 0
	andl	$16777215, %edx
	.loc 27 2251 0
	orl	%edx, %esi
	movl	%esi, ia32KSgdt+60
.LBE4031:
.LBE4030:
	.loc 1 97 0
	movl	%ebx, ksCurThread
	.loc 1 98 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL774:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL775:
.L684:
	.cfi_restore_state
.LBB4032:
.LBB4014:
	call	gdt_entry_gdt_data_ptr_set_base_low.part.72
.LVL776:
.L685:
.LBE4014:
.LBE4032:
.LBB4033:
.LBB4022:
	call	gdt_entry_gdt_data_ptr_set_base_high.isra.75.part.76
.LVL777:
.LBE4022:
.LBE4033:
	.cfi_endproc
.LFE278:
	.size	switchToThread_fp, .-switchToThread_fp
	.section	.rodata.str1.1
.LC43:
	.string	"(mdbNext & ~0xfffffff8) == 0"
	.section	.text.unlikely
	.type	mdb_node_new.part.78, @function
mdb_node_new.part.78:
.LFB718:
	.loc 27 739 0
	.cfi_startproc
.LVL778:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 746 0
	movl	$__FUNCTION__.1454, 12(%esp)
	movl	$746, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC43, (%esp)
	call	_assert_fail
.LVL779:
	.cfi_endproc
.LFE718:
	.size	mdb_node_new.part.78, .-mdb_node_new.part.78
	.section	.rodata.str1.1
.LC44:
	.string	"(timer_mode & ~0x3) == 0"
	.section	.text.unlikely
	.type	apic_lvt_new.part.79, @function
apic_lvt_new.part.79:
.LFB719:
	.loc 27 377 0
	.cfi_startproc
.LVL780:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 383 0
	movl	$__FUNCTION__.1269, 12(%esp)
	movl	$383, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC44, (%esp)
	call	_assert_fail
.LVL781:
	.cfi_endproc
.LFE719:
	.size	apic_lvt_new.part.79, .-apic_lvt_new.part.79
	.section	.rodata.str1.1
.LC45:
	.string	"(dest & ~0xff) == 0"
	.section	.text.unlikely
	.type	apic_icr2_new.part.80, @function
apic_icr2_new.part.80:
.LFB720:
	.loc 27 233 0
	.cfi_startproc
.LVL782:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 239 0
	movl	$__FUNCTION__.1206, 12(%esp)
	movl	$239, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC45, (%esp)
	call	_assert_fail
.LVL783:
	.cfi_endproc
.LFE720:
	.size	apic_icr2_new.part.80, .-apic_icr2_new.part.80
	.section	.rodata.str1.1
.LC46:
	.string	"(dest_shorthand & ~0x3) == 0"
	.section	.text.unlikely
	.type	apic_icr1_new.part.81, @function
apic_icr1_new.part.81:
.LFB721:
	.loc 27 696 0
	.cfi_startproc
.LVL784:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 702 0
	movl	$__FUNCTION__.1443, 12(%esp)
	movl	$702, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC46, (%esp)
	call	_assert_fail
.LVL785:
	.cfi_endproc
.LFE721:
	.size	apic_icr1_new.part.81, .-apic_icr1_new.part.81
	.section	.rodata.str1.1
.LC47:
	.string	"(capFSize & ~0x1) == 0"
	.section	.text.unlikely
	.type	cap_frame_cap_new.part.82, @function
cap_frame_cap_new.part.82:
.LFB722:
	.loc 27 1366 0
	.cfi_startproc
.LVL786:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1373 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1373, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC47, (%esp)
	call	_assert_fail
.LVL787:
	.cfi_endproc
.LFE722:
	.size	cap_frame_cap_new.part.82, .-cap_frame_cap_new.part.82
	.section	.rodata.str1.4
	.align 4
.LC48:
	.string	"(capIOPortFirstPort & ~0xffff) == 0"
	.section	.text.unlikely
	.type	cap_io_port_cap_new.part.83, @function
cap_io_port_cap_new.part.83:
.LFB723:
	.loc 27 1769 0
	.cfi_startproc
.LVL788:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1776 0
	movl	$__FUNCTION__.1876, 12(%esp)
	movl	$1776, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC48, (%esp)
	call	_assert_fail
.LVL789:
	.cfi_endproc
.LFE723:
	.size	cap_io_port_cap_new.part.83, .-cap_io_port_cap_new.part.83
	.section	.rodata.str1.4
	.align 4
.LC49:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_untyped_cap"
	.section	.text.unlikely
	.type	cap_untyped_cap_get_capPtr.isra.84.part.85, @function
cap_untyped_cap_get_capPtr.isra.84.part.85:
.LFB725:
	.loc 27 964 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 965 0
	movl	$__FUNCTION__.1563, 12(%esp)
	movl	$966, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC49, (%esp)
	call	_assert_fail
.LVL790:
	.cfi_endproc
.LFE725:
	.size	cap_untyped_cap_get_capPtr.isra.84.part.85, .-cap_untyped_cap_get_capPtr.isra.84.part.85
	.type	cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87, @function
cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87:
.LFB727:
	.loc 27 1186 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1187 0
	movl	$__FUNCTION__.1651, 12(%esp)
	movl	$1188, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC37, (%esp)
	call	_assert_fail
.LVL791:
	.cfi_endproc
.LFE727:
	.size	cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87, .-cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87
	.section	.rodata.str1.4
	.align 4
.LC50:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_thread_cap"
	.section	.text.unlikely
	.type	cap_thread_cap_get_capTCBPtr.isra.88.part.89, @function
cap_thread_cap_get_capTCBPtr.isra.88.part.89:
.LFB729:
	.loc 27 1358 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1359 0
	movl	$__FUNCTION__.1714, 12(%esp)
	movl	$1360, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC50, (%esp)
	call	_assert_fail
.LVL792:
	.cfi_endproc
.LFE729:
	.size	cap_thread_cap_get_capTCBPtr.isra.88.part.89, .-cap_thread_cap_get_capTCBPtr.isra.88.part.89
	.section	.rodata.str1.4
	.align 4
.LC51:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_frame_cap"
	.section	.text.unlikely
	.type	cap_frame_cap_get_capFBasePtr.isra.90.part.91, @function
cap_frame_cap_get_capFBasePtr.isra.90.part.91:
.LFB731:
	.loc 27 1506 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1507 0
	movl	$__FUNCTION__.1773, 12(%esp)
	movl	$1508, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC51, (%esp)
	call	_assert_fail
.LVL793:
	.cfi_endproc
.LFE731:
	.size	cap_frame_cap_get_capFBasePtr.isra.90.part.91, .-cap_frame_cap_get_capFBasePtr.isra.90.part.91
	.section	.rodata.str1.4
	.align 4
.LC52:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_page_table_cap"
	.section	.text.unlikely
	.type	cap_page_table_cap_get_capPTBasePtr.isra.92.part.93, @function
cap_page_table_cap_get_capPTBasePtr.isra.92.part.93:
.LFB733:
	.loc 27 1618 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1619 0
	movl	$__FUNCTION__.1817, 12(%esp)
	movl	$1620, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC52, (%esp)
	call	_assert_fail
.LVL794:
	.cfi_endproc
.LFE733:
	.size	cap_page_table_cap_get_capPTBasePtr.isra.92.part.93, .-cap_page_table_cap_get_capPTBasePtr.isra.92.part.93
	.section	.rodata.str1.4
	.align 4
.LC53:
	.string	"((cap.words[0] >> 0) & 0xff) == cap_zombie_cap"
	.section	.text.unlikely
	.type	cap_zombie_cap_get_capZombieType.isra.94.part.95, @function
cap_zombie_cap_get_capZombieType.isra.94.part.95:
.LFB735:
	.loc 27 1890 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1891 0
	movl	$__FUNCTION__.1917, 12(%esp)
	movl	$1892, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC53, (%esp)
	call	_assert_fail
.LVL795:
	.cfi_endproc
.LFE735:
	.size	cap_zombie_cap_get_capZombieType.isra.94.part.95, .-cap_zombie_cap_get_capZombieType.isra.94.part.95
	.type	cap_zombie_cap_get_capZombieID.part.97, @function
cap_zombie_cap_get_capZombieID.part.97:
.LFB737:
	.loc 27 1870 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1871 0
	movl	$__FUNCTION__.1908, 12(%esp)
	movl	$1872, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC53, (%esp)
	call	_assert_fail
.LVL796:
	.cfi_endproc
.LFE737:
	.size	cap_zombie_cap_get_capZombieID.part.97, .-cap_zombie_cap_get_capZombieID.part.97
	.section	.rodata.str1.4
	.align 4
.LC54:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_asid_pool_cap"
	.section	.text.unlikely
	.type	cap_asid_pool_cap_get_capASIDPool.isra.99.part.100, @function
cap_asid_pool_cap_get_capASIDPool.isra.99.part.100:
.LFB740:
	.loc 27 1761 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1762 0
	movl	$__FUNCTION__.1870, 12(%esp)
	movl	$1763, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC54, (%esp)
	call	_assert_fail
.LVL797:
	.cfi_endproc
.LFE740:
	.size	cap_asid_pool_cap_get_capASIDPool.isra.99.part.100, .-cap_asid_pool_cap_get_capASIDPool.isra.99.part.100
	.section	.rodata.str1.4
	.align 4
.LC55:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/object/structures.h"
	.section	.rodata.str1.1
.LC56:
	.string	"Invalid arch cap type"
	.text
	.p2align 4,,15
	.type	cap_get_capPtr, @function
cap_get_capPtr:
.LFB238:
	.file 40 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/object/structures.h"
	.loc 40 423 0
	.cfi_startproc
.LVL798:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
.LBB4104:
.LBB4105:
	.loc 27 872 0
	movl	%eax, %esi
.LBE4105:
.LBE4104:
	.loc 40 423 0
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
.LBB4108:
.LBB4106:
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	movl	%eax, %ecx
.LBE4106:
.LBE4108:
	.loc 40 423 0
	subl	$20, %esp
	.cfi_def_cfa_offset 32
.LBB4109:
.LBB4107:
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%al, %ebx
.LVL799:
	cmpl	$14, %esi
	cmove	%ebx, %ecx
.LVL800:
.LBE4107:
.LBE4109:
	.loc 40 428 0
	cmpl	$62, %ecx
	ja	.L718
	jmp	*.L720(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L720:
	.long	.L742
	.long	.L721
	.long	.L722
	.long	.L723
	.long	.L724
	.long	.L725
	.long	.L726
	.long	.L742
	.long	.L742
	.long	.L727
	.long	.L728
	.long	.L742
	.long	.L729
	.long	.L718
	.long	.L742
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L742
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L730
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L718
	.long	.L742
	.text
	.p2align 4,,7
	.p2align 3
.L742:
	.loc 40 457 0
	xorl	%eax, %eax
.LVL801:
.L719:
	.loc 40 489 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL802:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL803:
	.p2align 4,,7
	.p2align 3
.L721:
	.cfi_restore_state
.LBB4110:
.LBB4111:
	.loc 27 1507 0
	movl	%eax, %edx
.LVL804:
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L746
.LVL805:
.L741:
.LBE4111:
.LBE4110:
	.loc 40 489 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB4113:
.LBB4114:
	.loc 27 1765 0
	andl	$16777200, %eax
.LVL806:
	sall	$8, %eax
.LBE4114:
.LBE4113:
	.loc 40 489 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL807:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL808:
	.p2align 4,,7
	.p2align 3
.L722:
	.cfi_restore_state
.LBB4116:
.LBB4117:
	.loc 27 965 0
	movl	%eax, %edx
.LVL809:
	andl	$15, %edx
	cmpl	$2, %edx
	jne	.L747
.LVL810:
.L733:
.LBE4117:
.LBE4116:
	.loc 40 489 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB4119:
.LBB4120:
	.loc 27 1190 0
	andl	$-16, %eax
.LVL811:
.LBE4120:
.LBE4119:
	.loc 40 489 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL812:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL813:
	.p2align 4,,7
	.p2align 3
.L723:
	.cfi_restore_state
.LBB4122:
.LBB4123:
	.loc 27 1619 0
	movl	%eax, %edx
.LVL814:
	andl	$15, %edx
	cmpl	$3, %edx
	je	.L741
	call	cap_page_table_cap_get_capPTBasePtr.isra.92.part.93
.LVL815:
	.p2align 4,,7
	.p2align 3
.L724:
.LBE4123:
.LBE4122:
.LBB4124:
.LBB4125:
	.loc 27 1088 0
	movl	%eax, %edx
.LVL816:
	andl	$15, %edx
	cmpl	$4, %edx
	je	.L733
	call	cap_endpoint_cap_get_capEPPtr.isra.65.part.66
.LVL817:
	.p2align 4,,7
	.p2align 3
.L725:
.LBE4125:
.LBE4124:
.LBB4126:
.LBB4127:
	.loc 27 1708 0
	movl	%eax, %edx
.LVL818:
	andl	$15, %edx
	cmpl	$5, %edx
	je	.L741
	call	cap_page_directory_cap_get_capPDBasePtr.isra.67.part.68
.LVL819:
	.p2align 4,,7
	.p2align 3
.L726:
.LBE4127:
.LBE4126:
.LBB4128:
.LBB4121:
	.loc 27 1187 0
	movl	%eax, %edx
.LVL820:
	andl	$15, %edx
	cmpl	$6, %edx
	je	.L733
	call	cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87
.LVL821:
	.p2align 4,,7
	.p2align 3
.L729:
.LBE4121:
.LBE4128:
.LBB4129:
.LBB4130:
	.loc 27 1359 0
	movl	%eax, %edx
.LVL822:
	andl	$15, %edx
	cmpl	$12, %edx
	jne	.L748
.LBE4130:
.LBE4129:
	.loc 40 442 0
	andl	$-1024, %eax
.LVL823:
	jmp	.L719
.LVL824:
	.p2align 4,,7
	.p2align 3
.L730:
.LBB4132:
.LBB4133:
.LBB4134:
.LBB4135:
.LBB4136:
.LBB4137:
	.loc 27 1891 0
	cmpb	$46, %al
	jne	.L749
	.loc 27 1894 0
	andl	$16128, %eax
.LVL825:
	movl	%eax, %ecx
.LBE4137:
.LBE4136:
	.loc 40 90 0
	movl	$-16, %eax
.LBB4140:
.LBB4138:
	.loc 27 1894 0
	shrl	$8, %ecx
.LBE4138:
.LBE4140:
	.loc 40 90 0
	cmpl	$32, %ecx
	je	.L740
	addl	$1, %ecx
	movb	$-1, %al
	sall	%cl, %eax
.L740:
.LVL826:
.LBE4135:
.LBE4134:
	.loc 40 107 0
	andl	%edx, %eax
.LBE4133:
.LBE4132:
	.loc 40 454 0
	jmp	.L719
.LVL827:
	.p2align 4,,7
	.p2align 3
.L727:
.LBB4145:
.LBB4115:
	.loc 27 1762 0
	movl	%eax, %edx
.LVL828:
	andl	$15, %edx
	cmpl	$9, %edx
	je	.L741
	call	cap_asid_pool_cap_get_capASIDPool.isra.99.part.100
.LVL829:
	.p2align 4,,7
	.p2align 3
.L728:
.LBE4115:
.LBE4145:
.LBB4146:
.LBB4147:
	.loc 27 1332 0
	movl	%eax, %edx
.LVL830:
	andl	$15, %edx
	cmpl	$10, %edx
	jne	.L750
	.loc 27 1335 0
	andl	$2147483632, %eax
.LVL831:
	addl	%eax, %eax
.LBE4147:
.LBE4146:
	.loc 40 439 0
	jmp	.L719
.LVL832:
	.p2align 4,,7
	.p2align 3
.L718:
.LBB4149:
.LBB4150:
	.loc 40 487 0
	movl	$__func__.2498, 12(%esp)
	movl	$487, 8(%esp)
	movl	$.LC55, 4(%esp)
	movl	$.LC56, (%esp)
	call	_fail
.LVL833:
.L746:
.LBE4150:
.LBE4149:
.LBB4151:
.LBB4112:
	call	cap_frame_cap_get_capFBasePtr.isra.90.part.91
.LVL834:
.L750:
.LBE4112:
.LBE4151:
.LBB4152:
.LBB4148:
	call	cap_cnode_cap_get_capCNodePtr.isra.62.part.63
.LVL835:
.L749:
.LBE4148:
.LBE4152:
.LBB4153:
.LBB4144:
.LBB4143:
.LBB4142:
.LBB4141:
.LBB4139:
	.p2align 4,,5
	call	cap_zombie_cap_get_capZombieType.isra.94.part.95
.LVL836:
.L748:
.LBE4139:
.LBE4141:
.LBE4142:
.LBE4143:
.LBE4144:
.LBE4153:
.LBB4154:
.LBB4131:
	.p2align 4,,5
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL837:
.L747:
.LBE4131:
.LBE4154:
.LBB4155:
.LBB4118:
	.p2align 4,,5
	call	cap_untyped_cap_get_capPtr.isra.84.part.85
.LVL838:
.LBE4118:
.LBE4155:
	.cfi_endproc
.LFE238:
	.size	cap_get_capPtr, .-cap_get_capPtr
	.section	.boot.text
	.p2align 4,,15
	.globl	write_it_asid_pool
	.type	write_it_asid_pool, @function
write_it_asid_pool:
.LFB353:
	.loc 4 963 0
	.cfi_startproc
.LVL839:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 4 963 0
	movl	48(%esp), %eax
	movl	52(%esp), %edi
.LVL840:
	movl	56(%esp), %edx
	movl	60(%esp), %ebx
.LBB4260:
.LBB4261:
.LBB4262:
.LBB4263:
	.loc 27 872 0
	movl	%eax, %ebp
	.loc 27 873 0
	movl	%eax, %ecx
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%al, %esi
.LVL841:
	cmpl	$14, %ebp
	cmove	%esi, %ecx
.LVL842:
.LBE4263:
.LBE4262:
	.loc 40 428 0
	cmpl	$62, %ecx
	ja	.L780
	jmp	*.L756(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L756:
	.long	.L804
	.long	.L757
	.long	.L758
	.long	.L759
	.long	.L760
	.long	.L761
	.long	.L762
	.long	.L804
	.long	.L804
	.long	.L763
	.long	.L764
	.long	.L804
	.long	.L765
	.long	.L780
	.long	.L804
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L804
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L766
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L804
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L804:
	.loc 40 457 0
	xorl	%eax, %eax
.LVL843:
	.p2align 4,,7
	.p2align 3
.L755:
.LBE4261:
.LBE4260:
.LBB4312:
.LBB4313:
.LBB4314:
.LBB4315:
	.loc 27 872 0
	movl	%edx, %edi
	.loc 27 873 0
	movl	%edx, %ecx
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%dl, %esi
.LVL844:
	cmpl	$14, %edi
	cmove	%esi, %ecx
.LVL845:
.LBE4315:
.LBE4314:
	.loc 40 428 0
	cmpl	$62, %ecx
	ja	.L780
	jmp	*.L782(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L782:
	.long	.L806
	.long	.L783
	.long	.L784
	.long	.L785
	.long	.L786
	.long	.L787
	.long	.L788
	.long	.L806
	.long	.L806
	.long	.L789
	.long	.L790
	.long	.L806
	.long	.L791
	.long	.L780
	.long	.L806
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L806
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L792
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L780
	.long	.L806
	.section	.boot.text
.LVL846:
	.p2align 4,,7
	.p2align 3
.L757:
.LBE4313:
.LBE4312:
.LBB4350:
.LBB4308:
.LBB4264:
.LBB4265:
	.loc 27 1507 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	jne	.L798
.LVL847:
.L777:
.LBE4265:
.LBE4264:
.LBB4267:
.LBB4268:
	.loc 27 1765 0
	andl	$16777200, %eax
.LVL848:
	sall	$8, %eax
	jmp	.L755
.LVL849:
	.p2align 4,,7
	.p2align 3
.L758:
.LBE4268:
.LBE4267:
.LBB4270:
.LBB4271:
	.loc 27 965 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$2, %ecx
	jne	.L793
.LVL850:
.L769:
.LBE4271:
.LBE4270:
.LBB4273:
.LBB4274:
	.loc 27 1190 0
	andl	$-16, %eax
.LVL851:
	jmp	.L755
.LVL852:
	.p2align 4,,7
	.p2align 3
.L759:
.LBE4274:
.LBE4273:
.LBB4276:
.LBB4277:
	.loc 27 1619 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$3, %ecx
	je	.L777
.LVL853:
.L799:
	call	cap_page_table_cap_get_capPTBasePtr.isra.92.part.93
.LVL854:
	.p2align 4,,7
	.p2align 3
.L760:
.LBE4277:
.LBE4276:
.LBB4278:
.LBB4279:
	.loc 27 1088 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$4, %ecx
	je	.L769
.LVL855:
.L794:
	call	cap_endpoint_cap_get_capEPPtr.isra.65.part.66
.LVL856:
	.p2align 4,,7
	.p2align 3
.L761:
.LBE4279:
.LBE4278:
.LBB4280:
.LBB4281:
	.loc 27 1708 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L777
.LVL857:
.L800:
	call	cap_page_directory_cap_get_capPDBasePtr.isra.67.part.68
.LVL858:
	.p2align 4,,7
	.p2align 3
.L762:
.LBE4281:
.LBE4280:
.LBB4282:
.LBB4275:
	.loc 27 1187 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	je	.L769
.LVL859:
.L795:
	call	cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87
.LVL860:
	.p2align 4,,7
	.p2align 3
.L765:
.LBE4275:
.LBE4282:
.LBB4283:
.LBB4284:
	.loc 27 1359 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$12, %ecx
	jne	.L797
.LBE4284:
.LBE4283:
	.loc 40 442 0
	andl	$-1024, %eax
.LVL861:
	jmp	.L755
.LVL862:
	.p2align 4,,7
	.p2align 3
.L766:
.LBB4286:
.LBB4287:
.LBB4288:
.LBB4289:
.LBB4290:
.LBB4291:
	.loc 27 1891 0
	cmpb	$46, %al
	jne	.L801
	.loc 27 1894 0
	andl	$16128, %eax
.LVL863:
	movl	%eax, %ecx
.LBE4291:
.LBE4290:
	.loc 40 90 0
	movl	$-16, %eax
.LBB4294:
.LBB4292:
	.loc 27 1894 0
	shrl	$8, %ecx
.LBE4292:
.LBE4294:
	.loc 40 90 0
	cmpl	$32, %ecx
	je	.L776
	addl	$1, %ecx
	movb	$-1, %al
	sall	%cl, %eax
.L776:
.LVL864:
.LBE4289:
.LBE4288:
	.loc 40 107 0
	andl	%edi, %eax
	jmp	.L755
.LVL865:
	.p2align 4,,7
	.p2align 3
.L763:
.LBE4287:
.LBE4286:
.LBB4299:
.LBB4269:
	.loc 27 1762 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$9, %ecx
	je	.L777
.LVL866:
.L803:
	call	cap_asid_pool_cap_get_capASIDPool.isra.99.part.100
.LVL867:
	.p2align 4,,7
	.p2align 3
.L764:
.LBE4269:
.LBE4299:
.LBB4300:
.LBB4301:
	.loc 27 1332 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$10, %ecx
	jne	.L796
	.loc 27 1335 0
	andl	$2147483632, %eax
.LVL868:
	addl	%eax, %eax
	jmp	.L755
.LVL869:
	.p2align 4,,7
	.p2align 3
.L806:
.LBE4301:
.LBE4300:
.LBE4308:
.LBE4350:
.LBB4351:
.LBB4344:
	.loc 40 457 0
	xorl	%edx, %edx
.LVL870:
.L781:
.LBE4344:
.LBE4351:
	.loc 4 965 0
	movl	%edx, 4(%eax)
	.loc 4 966 0
	movl	%eax, ia32KSASIDTable
	.loc 4 967 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL871:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL872:
	.p2align 4,,7
	.p2align 3
.L790:
	.cfi_restore_state
.LBB4352:
.LBB4345:
.LBB4316:
.LBB4317:
	.loc 27 1332 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$10, %ecx
	jne	.L796
	.loc 27 1335 0
	andl	$2147483632, %edx
.LVL873:
	addl	%edx, %edx
	jmp	.L781
.LVL874:
	.p2align 4,,7
	.p2align 3
.L789:
.LBE4317:
.LBE4316:
.LBB4318:
.LBB4319:
	.loc 27 1762 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$9, %ecx
	jne	.L803
.LVL875:
.L813:
	.loc 27 1765 0
	andl	$16777200, %edx
.LVL876:
	sall	$8, %edx
.LBE4319:
.LBE4318:
.LBE4345:
.LBE4352:
	.loc 4 965 0
	movl	%edx, 4(%eax)
	.loc 4 966 0
	movl	%eax, ia32KSASIDTable
	.loc 4 967 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL877:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL878:
	.p2align 4,,7
	.p2align 3
.L792:
	.cfi_restore_state
.LBB4353:
.LBB4346:
.LBB4320:
.LBB4321:
.LBB4322:
.LBB4323:
.LBB4324:
.LBB4325:
	.loc 27 1891 0
	cmpb	$46, %dl
	jne	.L801
	.loc 27 1894 0
	andl	$16128, %edx
.LVL879:
	movl	%edx, %ecx
.LBE4325:
.LBE4324:
	.loc 40 90 0
	movl	$-16, %edx
.LBB4327:
.LBB4326:
	.loc 27 1894 0
	shrl	$8, %ecx
.LBE4326:
.LBE4327:
	.loc 40 90 0
	cmpl	$32, %ecx
	je	.L802
	addl	$1, %ecx
	movb	$-1, %dl
	sall	%cl, %edx
.L802:
.LVL880:
.LBE4323:
.LBE4322:
	.loc 40 107 0
	andl	%ebx, %edx
	jmp	.L781
.LVL881:
	.p2align 4,,7
	.p2align 3
.L783:
.LBE4321:
.LBE4320:
.LBB4328:
.LBB4329:
	.loc 27 1507 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	je	.L813
.LVL882:
.L798:
.LBE4329:
.LBE4328:
.LBE4346:
.LBE4353:
.LBB4354:
.LBB4309:
.LBB4303:
.LBB4266:
	call	cap_frame_cap_get_capFBasePtr.isra.90.part.91
.LVL883:
	.p2align 4,,7
	.p2align 3
.L791:
.LBE4266:
.LBE4303:
.LBE4309:
.LBE4354:
.LBB4355:
.LBB4347:
.LBB4330:
.LBB4331:
	.loc 27 1359 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$12, %ecx
	jne	.L797
.LBE4331:
.LBE4330:
	.loc 40 442 0
	andl	$-1024, %edx
.LVL884:
	jmp	.L781
.LVL885:
	.p2align 4,,7
	.p2align 3
.L788:
.LBB4332:
.LBB4333:
	.loc 27 1187 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	jne	.L795
.LVL886:
.L812:
	.loc 27 1190 0
	andl	$-16, %edx
.LVL887:
.LBE4333:
.LBE4332:
.LBE4347:
.LBE4355:
	.loc 4 965 0
	movl	%edx, 4(%eax)
	.loc 4 966 0
	movl	%eax, ia32KSASIDTable
	.loc 4 967 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL888:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL889:
	.p2align 4,,7
	.p2align 3
.L787:
	.cfi_restore_state
.LBB4356:
.LBB4348:
.LBB4334:
.LBB4335:
	.loc 27 1708 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L813
	jmp	.L800
.LVL890:
	.p2align 4,,7
	.p2align 3
.L786:
.LBE4335:
.LBE4334:
.LBB4336:
.LBB4337:
	.loc 27 1088 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$4, %ecx
	je	.L812
	.p2align 4,,3
	jmp	.L794
.LVL891:
	.p2align 4,,7
	.p2align 3
.L785:
.LBE4337:
.LBE4336:
.LBB4338:
.LBB4339:
	.loc 27 1619 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$3, %ecx
	je	.L813
	.p2align 4,,3
	jmp	.L799
.LVL892:
	.p2align 4,,7
	.p2align 3
.L784:
.LBE4339:
.LBE4338:
.LBB4340:
.LBB4341:
	.loc 27 965 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$2, %ecx
	je	.L812
.LVL893:
.L793:
.LBE4341:
.LBE4340:
.LBE4348:
.LBE4356:
.LBB4357:
.LBB4310:
.LBB4304:
.LBB4272:
	call	cap_untyped_cap_get_capPtr.isra.84.part.85
.LVL894:
	.p2align 4,,7
	.p2align 3
.L780:
.LBE4272:
.LBE4304:
.LBE4310:
.LBE4357:
.LBB4358:
.LBB4349:
.LBB4342:
.LBB4343:
	.loc 40 487 0
	movl	$__func__.2498, 12(%esp)
	movl	$487, 8(%esp)
	movl	$.LC55, 4(%esp)
	movl	$.LC56, (%esp)
	call	_fail
.LVL895:
.L796:
.LBE4343:
.LBE4342:
.LBE4349:
.LBE4358:
.LBB4359:
.LBB4311:
.LBB4305:
.LBB4302:
	call	cap_cnode_cap_get_capCNodePtr.isra.62.part.63
.LVL896:
.L801:
.LBE4302:
.LBE4305:
.LBB4306:
.LBB4298:
.LBB4297:
.LBB4296:
.LBB4295:
.LBB4293:
	call	cap_zombie_cap_get_capZombieType.isra.94.part.95
.LVL897:
.L797:
.LBE4293:
.LBE4295:
.LBE4296:
.LBE4297:
.LBE4298:
.LBE4306:
.LBB4307:
.LBB4285:
	.p2align 4,,5
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL898:
.LBE4285:
.LBE4307:
.LBE4311:
.LBE4359:
	.cfi_endproc
.LFE353:
	.size	write_it_asid_pool, .-write_it_asid_pool
	.section	.rodata.str1.1
.LC57:
	.string	"(capPDIsMapped & ~0x1) == 0"
	.section	.text.unlikely
	.type	cap_page_directory_cap_new.part.102, @function
cap_page_directory_cap_new.part.102:
.LFB742:
	.loc 27 1626 0
	.cfi_startproc
.LVL899:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1633 0
	movl	$__FUNCTION__.1824, 12(%esp)
	movl	$1633, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC57, (%esp)
	call	_assert_fail
.LVL900:
	.cfi_endproc
.LFE742:
	.size	cap_page_directory_cap_new.part.102, .-cap_page_directory_cap_new.part.102
	.section	.rodata.str1.1
.LC58:
	.string	"(capPTIsMapped & ~0x1) == 0"
	.section	.text.unlikely
	.type	cap_page_table_cap_new.part.103, @function
cap_page_table_cap_new.part.103:
.LFB743:
	.loc 27 1514 0
	.cfi_startproc
.LVL901:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1521 0
	movl	$__FUNCTION__.1781, 12(%esp)
	movl	$1521, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC58, (%esp)
	call	_assert_fail
.LVL902:
	.cfi_endproc
.LFE743:
	.size	cap_page_table_cap_new.part.103, .-cap_page_table_cap_new.part.103
	.section	.rodata.str1.4
	.align 4
.LC59:
	.string	"(page_base_address & ~0xffc00000) == 0"
	.section	.text.unlikely
	.type	pde_pde_4m_new.part.104, @function
pde_pde_4m_new.part.104:
.LFB744:
	.loc 27 2691 0
	.cfi_startproc
.LVL903:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2697 0
	movl	$__FUNCTION__.2223, 12(%esp)
	movl	$2697, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC59, (%esp)
	call	_assert_fail
.LVL904:
	.cfi_endproc
.LFE744:
	.size	pde_pde_4m_new.part.104, .-pde_pde_4m_new.part.104
	.section	.rodata.str1.4
	.align 4
.LC60:
	.string	"(pt_base_address & ~0xfffff000) == 0"
	.section	.text.unlikely
	.type	pde_pde_4k_new.part.105, @function
pde_pde_4k_new.part.105:
.LFB745:
	.loc 27 2563 0
	.cfi_startproc
.LVL905:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2569 0
	movl	$__FUNCTION__.2176, 12(%esp)
	movl	$2569, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC60, (%esp)
	call	_assert_fail
.LVL906:
	.cfi_endproc
.LFE745:
	.size	pde_pde_4k_new.part.105, .-pde_pde_4k_new.part.105
	.section	.rodata.str1.4
	.align 4
.LC61:
	.string	"(page_base_address & ~0xfffff000) == 0"
	.section	.text.unlikely
	.type	pte_new.part.106, @function
pte_new.part.106:
.LFB746:
	.loc 27 29 0
	.cfi_startproc
.LVL907:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 35 0
	movl	$__FUNCTION__.1125, 12(%esp)
	movl	$35, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC61, (%esp)
	call	_assert_fail
.LVL908:
	.cfi_endproc
.LFE746:
	.size	pte_new.part.106, .-pte_new.part.106
	.section	.rodata.str1.1
.LC62:
	.string	"(base_high & ~0xff) == 0"
	.section	.text.unlikely
	.type	gdt_entry_gdt_code_new.part.107, @function
gdt_entry_gdt_code_new.part.107:
.LFB747:
	.loc 27 2281 0
	.cfi_startproc
.LVL909:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2288 0
	movl	$__FUNCTION__.2074, 12(%esp)
	movl	$2288, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC62, (%esp)
	call	_assert_fail
.LVL910:
	.cfi_endproc
.LFE747:
	.size	gdt_entry_gdt_code_new.part.107, .-gdt_entry_gdt_code_new.part.107
	.type	gdt_entry_gdt_data_new.part.108, @function
gdt_entry_gdt_data_new.part.108:
.LFB748:
	.loc 27 2179 0
	.cfi_startproc
.LVL911:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2186 0
	movl	$__FUNCTION__.2043, 12(%esp)
	movl	$2186, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC62, (%esp)
	call	_assert_fail
.LVL912:
	.cfi_endproc
.LFE748:
	.size	gdt_entry_gdt_data_new.part.108, .-gdt_entry_gdt_data_new.part.108
	.type	cap_page_table_cap_get_capPTMappedAddress.part.109, @function
cap_page_table_cap_get_capPTMappedAddress.part.109:
.LFB749:
	.loc 27 1598 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1599 0
	movl	$__FUNCTION__.1808, 12(%esp)
	movl	$1600, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC52, (%esp)
	call	_assert_fail
.LVL913:
	.cfi_endproc
.LFE749:
	.size	cap_page_table_cap_get_capPTMappedAddress.part.109, .-cap_page_table_cap_get_capPTMappedAddress.part.109
	.type	cap_page_table_cap_get_capPTIsMapped.part.110, @function
cap_page_table_cap_get_capPTIsMapped.part.110:
.LFB750:
	.loc 27 1545 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1546 0
	movl	$__FUNCTION__.1785, 12(%esp)
	movl	$1547, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC52, (%esp)
	call	_assert_fail
.LVL914:
	.cfi_endproc
.LFE750:
	.size	cap_page_table_cap_get_capPTIsMapped.part.110, .-cap_page_table_cap_get_capPTIsMapped.part.110
	.type	cap_frame_cap_get_capFMappedAddress.part.111, @function
cap_frame_cap_get_capFMappedAddress.part.111:
.LFB751:
	.loc 27 1433 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1434 0
	movl	$__FUNCTION__.1741, 12(%esp)
	movl	$1435, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC51, (%esp)
	call	_assert_fail
.LVL915:
	.cfi_endproc
.LFE751:
	.size	cap_frame_cap_get_capFMappedAddress.part.111, .-cap_frame_cap_get_capFMappedAddress.part.111
	.text
	.p2align 4,,15
	.type	cap_frame_cap_get_capFMappedASID, @function
cap_frame_cap_get_capFMappedASID:
.LFB233:
	.loc 40 320 0
	.cfi_startproc
.LVL916:
.LBB4364:
.LBB4365:
	.loc 27 1467 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	jne	.L837
.LVL917:
.LBE4365:
.LBE4364:
.LBB4368:
.LBB4369:
	.loc 27 1417 0
	andl	$1072693248, %edx
.LVL918:
.LBE4369:
.LBE4368:
.LBB4371:
.LBB4366:
	.loc 27 1470 0
	shrl	$26, %eax
.LVL919:
.LBE4366:
.LBE4371:
.LBB4372:
.LBB4370:
	.loc 27 1417 0
	shrl	$20, %edx
.LBE4370:
.LBE4372:
	.loc 40 322 0
	sall	$10, %eax
	.loc 40 321 0
	addl	%edx, %eax
	.loc 40 324 0
	ret
.LVL920:
.L837:
	.loc 40 320 0
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB4373:
.LBB4367:
	.loc 27 1467 0
	movl	$__FUNCTION__.1755, 12(%esp)
	movl	$1468, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC51, (%esp)
	call	_assert_fail
.LVL921:
.LBE4367:
.LBE4373:
	.cfi_endproc
.LFE233:
	.size	cap_frame_cap_get_capFMappedASID, .-cap_frame_cap_get_capFMappedASID
	.section	.rodata.str1.4
	.align 4
.LC63:
	.string	"((pde_ptr->words[0] >> 7) & 0x1) == pde_pde_4k"
	.section	.text.unlikely
	.type	pde_pde_4k_ptr_get_pt_base_address.part.113, @function
pde_pde_4k_ptr_get_pt_base_address.part.113:
.LFB753:
	.loc 27 2659 0
	.cfi_startproc
.LVL922:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2660 0
	movl	$__FUNCTION__.2196, 12(%esp)
	movl	$2661, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC63, (%esp)
	call	_assert_fail
.LVL923:
	.cfi_endproc
.LFE753:
	.size	pde_pde_4k_ptr_get_pt_base_address.part.113, .-pde_pde_4k_ptr_get_pt_base_address.part.113
	.type	cap_frame_cap_get_capFVMRights.isra.119.part.120, @function
cap_frame_cap_get_capFVMRights.isra.119.part.120:
.LFB760:
	.loc 27 1486 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1487 0
	movl	$__FUNCTION__.1764, 12(%esp)
	movl	$1488, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC51, (%esp)
	call	_assert_fail
.LVL924:
	.cfi_endproc
.LFE760:
	.size	cap_frame_cap_get_capFVMRights.isra.119.part.120, .-cap_frame_cap_get_capFVMRights.isra.119.part.120
	.text
	.p2align 4,,15
	.globl	Arch_hasRecycleRights
	.type	Arch_hasRecycleRights, @function
Arch_hasRecycleRights:
.LFB416:
	.loc 19 309 0
	.cfi_startproc
.LVL925:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 19 309 0
	movl	16(%esp), %eax
.LVL926:
.LBB4378:
.LBB4379:
	.loc 27 872 0
	movl	%eax, %ebx
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ebx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %ebx
	cmovne	%edx, %ecx
.LBE4379:
.LBE4378:
	.loc 19 310 0
	cmpl	$1, %ecx
	jne	.L849
.LVL927:
.LBB4380:
.LBB4381:
	.loc 27 1487 0
	cmpl	$1, %edx
	jne	.L851
	.loc 27 1490 0
	andl	$50331648, %eax
.LVL928:
.LBE4381:
.LBE4380:
	.loc 19 312 0
	cmpl	$50331648, %eax
	sete	%al
	.loc 19 317 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.loc 19 312 0
	movzbl	%al, %eax
	.loc 19 317 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL929:
	.p2align 4,,7
	.p2align 3
.L849:
	.cfi_restore_state
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.loc 19 315 0
	movl	$1, %eax
.LVL930:
	.loc 19 317 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL931:
.L851:
	.cfi_restore_state
.LBB4383:
.LBB4382:
	call	cap_frame_cap_get_capFVMRights.isra.119.part.120
.LVL932:
.LBE4382:
.LBE4383:
	.cfi_endproc
.LFE416:
	.size	Arch_hasRecycleRights, .-Arch_hasRecycleRights
	.section	.text.unlikely
	.type	cap_frame_cap_get_capFSize.part.121, @function
cap_frame_cap_get_capFSize.part.121:
.LFB761:
	.loc 27 1405 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1406 0
	movl	$__FUNCTION__.1728, 12(%esp)
	movl	$1407, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC51, (%esp)
	call	_assert_fail
.LVL933:
	.cfi_endproc
.LFE761:
	.size	cap_frame_cap_get_capFSize.part.121, .-cap_frame_cap_get_capFSize.part.121
	.text
	.p2align 4,,15
	.globl	lookupIPCBuffer
	.type	lookupIPCBuffer, @function
lookupIPCBuffer:
.LFB359:
	.loc 4 1060 0
	.cfi_startproc
.LVL934:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 4 1060 0
	movl	36(%esp), %eax
	.loc 4 1065 0
	movl	636(%eax), %ebx
.LVL935:
	.loc 4 1066 0
	andl	$-1024, %eax
	movl	64(%eax), %edx
	movl	68(%eax), %esi
.LVL936:
.LBB4397:
.LBB4398:
	.loc 27 872 0
	movl	%edx, %edi
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %ecx
	cmpl	$14, %edi
	cmovne	%eax, %ecx
.LBE4398:
.LBE4397:
	.loc 4 1068 0
	cmpl	$1, %ecx
	jne	.L864
.LVL937:
.LBB4399:
.LBB4400:
	.loc 27 1487 0
	cmpl	$1, %eax
	jne	.L876
	.loc 27 1490 0
	movl	%edx, %eax
	andl	$50331648, %eax
	shrl	$24, %eax
.LBE4400:
.LBE4399:
	.loc 4 1073 0
	cmpl	$3, %eax
	je	.L859
	.loc 4 1073 0 is_stmt 0 discriminator 1
	cmpl	$2, %eax
	jne	.L864
	movl	32(%esp), %eax
	testl	%eax, %eax
	jne	.L864
.L859:
.LVL938:
.LBB4402:
.LBB4403:
.LBB4404:
	.loc 27 1409 0 is_stmt 1
	shrl	$31, %esi
.LVL939:
.LBE4404:
.LBE4403:
.LBB4405:
.LBB4406:
	.loc 37 41 0
	testl	%esi, %esi
	je	.L861
	cmpl	$1, %esi
	je	.L865
.LVL940:
.LBB4407:
.LBB4408:
	.loc 37 49 0
	movl	$__func__.2276, 12(%esp)
.LVL941:
	movl	$49, 8(%esp)
	movl	$.LC25, 4(%esp)
	movl	$.LC26, (%esp)
	call	_fail
.LVL942:
	.p2align 4,,7
	.p2align 3
.L861:
.LBE4408:
.LBE4407:
	.loc 37 41 0
	movl	$4095, %eax
.L862:
.LBE4406:
.LBE4405:
.LBB4410:
.LBB4411:
	.loc 27 1510 0
	andl	$16777200, %edx
.LVL943:
.LBE4411:
.LBE4410:
.LBE4402:
	.loc 4 1083 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
.LBB4415:
	.loc 4 1079 0
	andl	%eax, %ebx
.LVL944:
.LBB4413:
.LBB4412:
	.loc 27 1510 0
	sall	$8, %edx
.LBE4412:
.LBE4413:
	.loc 4 1079 0
	leal	(%ebx,%edx), %eax
.LBE4415:
	.loc 4 1083 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL945:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL946:
	.p2align 4,,7
	.p2align 3
.L864:
	.cfi_restore_state
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	.loc 4 1069 0
	xorl	%eax, %eax
	.loc 4 1083 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL947:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL948:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL949:
	.p2align 4,,7
	.p2align 3
.L865:
	.cfi_restore_state
.LBB4416:
.LBB4414:
.LBB4409:
	.loc 37 41 0
	movl	$4194303, %eax
	jmp	.L862
.LVL950:
.L876:
.LBE4409:
.LBE4414:
.LBE4416:
.LBB4417:
.LBB4401:
	call	cap_frame_cap_get_capFVMRights.isra.119.part.120
.LVL951:
.LBE4401:
.LBE4417:
	.cfi_endproc
.LFE359:
	.size	lookupIPCBuffer, .-lookupIPCBuffer
	.section	.rodata.str1.4
	.align 4
.LC64:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/api/faults.c"
	.section	.rodata.str1.1
.LC65:
	.string	"Invalid fault"
	.text
	.p2align 4,,15
	.globl	handleFaultReply
	.type	handleFaultReply, @function
handleFaultReply:
.LFB267:
	.loc 35 20 0
	.cfi_startproc
.LVL952:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 35 20 0
	movl	68(%esp), %ebx
.LVL953:
	movl	64(%esp), %edi
.LBB4418:
.LBB4419:
	.loc 13 27 0
	movl	16(%ebx), %eax
.LVL954:
.LBE4419:
.LBE4418:
.LBB4420:
.LBB4421:
.LBB4422:
.LBB4423:
	.loc 14 74 0
	movl	%eax, %esi
	andl	$127, %esi
.LBE4423:
.LBE4422:
	.loc 28 88 0
	cmpl	$120, %esi
	jbe	.L878
.LVL955:
.LBB4424:
.LBB4425:
	.loc 14 81 0
	andl	$-128, %eax
.LVL956:
	movl	$120, %esi
.LVL957:
	.loc 14 83 0
	orl	$120, %eax
.LVL958:
.L878:
.LBE4425:
.LBE4424:
.LBE4421:
.LBE4420:
.LBB4426:
.LBB4427:
	.loc 14 41 0
	shrl	$12, %eax
.LVL959:
	movl	%eax, 24(%esp)
.LVL960:
.LBE4427:
.LBE4426:
.LBB4428:
.LBB4429:
	.loc 27 1928 0
	movl	604(%edi), %eax
	andl	$7, %eax
.LBE4429:
.LBE4428:
	.loc 35 32 0
	cmpl	$3, %eax
	je	.L880
	ja	.L881
	cmpl	$1, %eax
	jb	.L879
	.loc 35 95 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 35 34 0
	movl	$1, %eax
	.loc 35 95 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL961:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL962:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL963:
	.p2align 4,,7
	.p2align 3
.L881:
	.cfi_restore_state
	.loc 35 32 0
	cmpl	$4, %eax
	jne	.L879
.LBB4430:
	.loc 35 73 0
	movl	%ebx, 4(%esp)
.LVL964:
	movl	$0, (%esp)
	call	lookupIPCBuffer
.LVL965:
	.loc 35 76 0
	xorl	%ecx, %ecx
	testl	%esi, %esi
	je	.L891
.LVL966:
.LBB4431:
.LBB4432:
	.loc 13 21 0
	movl	20(%ebx), %edx
.LBE4432:
.LBE4431:
	.loc 35 76 0
	cmpl	$1, %esi
	movb	$1, %cl
.LBB4436:
.LBB4433:
	.loc 13 21 0
	movl	%edx, 44(%edi)
.LVL967:
.LBE4433:
.LBE4436:
	.loc 35 76 0
	jbe	.L891
.LVL968:
.LBB4437:
.LBB4434:
	.loc 13 21 0 discriminator 2
	movl	24(%ebx), %edx
.LBE4434:
.LBE4437:
	.loc 35 76 0 discriminator 2
	movb	$2, %cl
.LBB4438:
.LBB4435:
	.loc 13 21 0 discriminator 2
	movl	%edx, 68(%edi)
.LVL969:
.L891:
.LBE4435:
.LBE4438:
	.loc 35 82 0
	testl	%eax, %eax
	je	.L894
.LVL970:
	.loc 35 83 0 discriminator 1
	cmpl	%esi, %ecx
	jae	.L894
	.loc 35 84 0
	movl	exceptionMessage(,%ecx,4), %ebx
.LVL971:
	.loc 35 85 0
	leal	1(%ecx), %edx
	movl	(%eax,%edx,4), %ebp
.LBB4439:
.LBB4440:
	.loc 17 62 0
	cmpl	$16, %ebx
.LBE4440:
.LBE4439:
	.loc 35 85 0
	movl	%ebp, 28(%esp)
.LVL972:
.LBB4445:
.LBB4441:
	.loc 17 62 0
	je	.L895
	.loc 17 69 0
	leal	-9(%ebx), %ebp
.LVL973:
	cmpl	$1, %ebp
	ja	.L896
	.loc 17 70 0
	movl	28(%esp), %ebp
	andl	$-9, %ebp
	.loc 17 71 0
	cmpl	$51, %ebp
	movl	$0, %ebp
	cmove	28(%esp), %ebp
	movl	%ebp, 28(%esp)
.LVL974:
.L896:
.LBE4441:
.LBE4445:
.LBB4446:
.LBB4447:
	.loc 13 21 0
	movl	28(%esp), %ebp
.LBE4447:
.LBE4446:
	.loc 35 83 0
	cmpl	%esi, %edx
.LBB4450:
.LBB4448:
	.loc 13 21 0
	movl	%ebp, (%edi,%ebx,4)
.LVL975:
.LBE4448:
.LBE4450:
	.loc 35 83 0
	jae	.L894
	cmpl	$2, %edx
	ja	.L894
	.loc 35 84 0
	movl	exceptionMessage(,%edx,4), %ebx
.LVL976:
	.loc 35 85 0
	addl	$2, %ecx
.LVL977:
	movl	(%eax,%ecx,4), %edx
.LVL978:
.LBB4451:
.LBB4442:
	.loc 17 62 0
	cmpl	$16, %ebx
	je	.L897
	.loc 17 69 0
	leal	-9(%ebx), %ebp
	cmpl	$1, %ebp
	ja	.L898
	.loc 17 70 0
	movl	%edx, %ebp
	andl	$-9, %ebp
	.loc 17 71 0
	cmpl	$51, %ebp
	movl	$0, %ebp
	cmovne	%ebp, %edx
.LVL979:
.L898:
.LBE4442:
.LBE4451:
	.loc 35 83 0
	cmpl	%esi, %ecx
.LBB4452:
.LBB4449:
	.loc 13 21 0
	movl	%edx, (%edi,%ebx,4)
.LVL980:
.LBE4449:
.LBE4452:
	.loc 35 83 0
	jae	.L894
	cmpl	$2, %ecx
	ja	.L894
.LVL981:
.LBB4453:
.LBB4443:
	.loc 17 67 0 discriminator 2
	movl	12(%eax), %eax
.LVL982:
	andl	$4055, %eax
.LVL983:
	orl	$514, %eax
.LVL984:
	movl	%eax, 64(%edi)
.LVL985:
.L894:
.LBE4443:
.LBE4453:
.LBE4430:
	.loc 35 90 0
	movl	24(%esp), %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	sete	%al
	.loc 35 95 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL986:
	.p2align 4,,7
	.p2align 3
.L880:
	.cfi_restore_state
.LBB4455:
	.loc 35 45 0
	movl	%ebx, 4(%esp)
.LVL987:
	movl	$0, (%esp)
	call	lookupIPCBuffer
.LVL988:
	.loc 35 48 0
	xorl	%edx, %edx
	testl	%esi, %esi
	je	.L884
.LVL989:
.LBB4456:
.LBB4457:
	.loc 13 21 0
	movl	20(%ebx), %edx
.LBE4457:
.LBE4456:
	.loc 35 48 0
	cmpl	$1, %esi
.LBB4460:
.LBB4458:
	.loc 13 21 0
	movl	%edx, (%edi)
.LVL990:
.LBE4458:
.LBE4460:
	.loc 35 48 0
	movl	$1, %edx
.LVL991:
	jbe	.L884
.LVL992:
.LBB4461:
.LBB4459:
	.loc 13 21 0 discriminator 2
	movl	24(%ebx), %edx
	movl	%edx, 4(%edi)
.LVL993:
.LBE4459:
.LBE4461:
	.loc 35 48 0 discriminator 2
	movl	$2, %edx
.LVL994:
.L884:
	.loc 35 54 0
	testl	%eax, %eax
	jne	.L886
	jmp	.L887
.LVL995:
	.p2align 4,,7
	.p2align 3
.L888:
.LBB4462:
.LBB4463:
	.loc 17 69 0
	leal	-9(%ebx), %ebp
	cmpl	$1, %ebp
	ja	.L889
	.loc 17 70 0
	movl	%ecx, %ebp
	andl	$-9, %ebp
	.loc 17 71 0
	cmpl	$51, %ebp
	movl	$0, %ebp
	cmovne	%ebp, %ecx
.LVL996:
.L889:
.LBE4463:
.LBE4462:
	.loc 35 55 0
	cmpl	$9, %edx
.LBB4465:
.LBB4466:
	.loc 13 21 0
	movl	%ecx, (%edi,%ebx,4)
.LVL997:
.LBE4466:
.LBE4465:
	.loc 35 55 0
	ja	.L887
.LVL998:
.L886:
	.loc 35 55 0 is_stmt 0 discriminator 1
	cmpl	%esi, %edx
	jae	.L887
	.loc 35 56 0 is_stmt 1 discriminator 2
	movl	syscallMessage(,%edx,4), %ebx
.LVL999:
	.loc 35 57 0 discriminator 2
	addl	$1, %edx
.LVL1000:
	movl	(%eax,%edx,4), %ecx
.LVL1001:
.LBB4468:
.LBB4464:
	.loc 17 62 0 discriminator 2
	cmpl	$16, %ebx
	jne	.L888
.LVL1002:
	.loc 17 67 0
	andl	$4055, %ecx
.LVL1003:
	orl	$514, %ecx
.LVL1004:
.LBE4464:
.LBE4468:
	.loc 35 55 0
	cmpl	$9, %edx
.LBB4469:
.LBB4467:
	.loc 13 21 0
	movl	%ecx, (%edi,%ebx,4)
.LVL1005:
.LBE4467:
.LBE4469:
	.loc 35 55 0
	jbe	.L886
.LVL1006:
	.p2align 4,,7
	.p2align 3
.L887:
.LBB4470:
.LBB4471:
	.loc 13 21 0
	movl	56(%edi), %eax
.LVL1007:
.LBE4471:
.LBE4470:
.LBE4455:
	.loc 35 65 0
	movl	24(%esp), %ecx
.LBB4474:
.LBB4473:
.LBB4472:
	.loc 13 21 0
	movl	%eax, 44(%edi)
.LBE4472:
.LBE4473:
.LBE4474:
	.loc 35 65 0
	xorl	%eax, %eax
	testl	%ecx, %ecx
	sete	%al
	.loc 35 95 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1008:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1009:
	.p2align 4,,7
	.p2align 3
.L879:
	.cfi_restore_state
	.loc 35 93 0
	movl	$__func__.4055, 12(%esp)
.LVL1010:
	movl	$93, 8(%esp)
	movl	$.LC64, 4(%esp)
	movl	$.LC65, (%esp)
	call	_fail
.LVL1011:
	.p2align 4,,7
	.p2align 3
.L897:
.LBB4475:
.LBB4454:
.LBB4444:
	.loc 17 67 0
	andl	$4055, %edx
.LVL1012:
	orl	$514, %edx
.LVL1013:
	jmp	.L898
.LVL1014:
	.p2align 4,,7
	.p2align 3
.L895:
	andl	$4055, 28(%esp)
.LVL1015:
	orl	$514, 28(%esp)
.LVL1016:
	jmp	.L896
.LBE4444:
.LBE4454:
.LBE4475:
	.cfi_endproc
.LFE267:
	.size	handleFaultReply, .-handleFaultReply
	.p2align 4,,15
	.globl	Arch_sameRegionAs
	.type	Arch_sameRegionAs, @function
Arch_sameRegionAs:
.LFB417:
	.loc 19 321 0
	.cfi_startproc
.LVL1017:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 19 321 0
	movl	32(%esp), %edx
	movl	36(%esp), %esi
	movl	40(%esp), %ecx
.LVL1018:
	movl	44(%esp), %edi
.LBB4476:
.LBB4477:
	.loc 27 872 0
	movl	%edx, %ebp
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %ebx
.LVL1019:
	cmpl	$14, %ebp
	cmove	%ebx, %eax
.LVL1020:
.LBE4477:
.LBE4476:
	.loc 19 322 0
	cmpl	$11, %eax
	ja	.L968
	jmp	*.L935(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L935:
	.long	.L968
	.long	.L934
	.long	.L968
	.long	.L936
	.long	.L968
	.long	.L937
	.long	.L968
	.long	.L938
	.long	.L968
	.long	.L939
	.long	.L968
	.long	.L940
	.text
	.p2align 4,,7
	.p2align 3
.L940:
.LVL1021:
.LBB4478:
.LBB4479:
	.loc 27 872 0
	movl	%ecx, %edx
.LVL1022:
	.loc 27 873 0
	movl	%ecx, %eax
	.loc 27 872 0
	andl	$14, %edx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%cl, %ecx
.LVL1023:
	cmpl	$14, %edx
	cmove	%ecx, %eax
.LVL1024:
.LBE4479:
.LBE4478:
	.loc 19 362 0
	cmpl	$11, %eax
	sete	%al
	movzbl	%al, %eax
.LVL1025:
.L933:
	.loc 19 384 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1026:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1027:
	.p2align 4,,7
	.p2align 3
.L934:
	.cfi_restore_state
.LBB4480:
.LBB4481:
	.loc 27 872 0
	movl	%ecx, %eax
	.loc 27 873 0
	movl	%ecx, %ebx
.LVL1028:
	.loc 27 872 0
	andl	$14, %eax
	.loc 27 873 0
	andl	$15, %ebx
	movzbl	%cl, %ebp
.LVL1029:
	cmpl	$14, %eax
	cmovne	%ebx, %ebp
.LVL1030:
.LBE4481:
.LBE4480:
	.loc 19 383 0
	xorl	%eax, %eax
	.loc 19 324 0
	cmpl	$1, %ebp
	jne	.L933
.LVL1031:
.LBB4482:
.LBB4483:
.LBB4484:
	.loc 27 1507 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L944
.LVL1032:
.LBE4484:
.LBE4483:
.LBB4488:
.LBB4489:
	cmpl	$1, %ebx
	jne	.L944
.LVL1033:
.LBE4489:
.LBE4488:
.LBB4492:
.LBB4493:
	.loc 27 1409 0
	shrl	$31, %esi
.LVL1034:
.LBE4493:
.LBE4492:
.LBB4494:
.LBB4495:
	.loc 37 41 0
	testl	%esi, %esi
	je	.L946
	cmpl	$1, %esi
	jne	.L984
	movl	$4194304, %eax
.L947:
.LVL1035:
.LBE4495:
.LBE4494:
.LBB4497:
.LBB4498:
	.loc 27 1409 0
	shrl	$31, %edi
.LVL1036:
.LBE4498:
.LBE4497:
.LBB4499:
.LBB4500:
	.loc 37 41 0
	testl	%edi, %edi
	je	.L949
	cmpl	$1, %edi
	jne	.L984
	movl	$4194304, %ebx
.L950:
.LBE4500:
.LBE4499:
.LBB4503:
.LBB4485:
	.loc 27 1510 0
	andl	$16777200, %edx
.LVL1037:
.LBE4485:
.LBE4503:
.LBB4504:
.LBB4490:
	andl	$16777200, %ecx
.LVL1038:
.LBE4490:
.LBE4504:
.LBB4505:
.LBB4486:
	sall	$8, %edx
.LBE4486:
.LBE4505:
.LBB4506:
.LBB4491:
	sall	$8, %ecx
.LBE4491:
.LBE4506:
	.loc 19 329 0
	leal	-1(%ecx,%ebx), %ebx
.LVL1039:
	.loc 19 328 0
	leal	-1(%edx,%eax), %eax
.LVL1040:
	.loc 19 330 0
	cmpl	%ebx, %eax
	jb	.L968
	cmpl	%ecx, %edx
	ja	.L968
	.loc 19 330 0 is_stmt 0 discriminator 1
	xorl	%eax, %eax
	cmpl	%ecx, %ebx
	setae	%al
	jmp	.L933
.LVL1041:
	.p2align 4,,7
	.p2align 3
.L936:
.LBE4482:
.LBB4511:
.LBB4512:
	.loc 27 872 0 is_stmt 1
	movl	%ecx, %eax
	.loc 27 873 0
	movl	%ecx, %ebx
.LVL1042:
	.loc 27 872 0
	andl	$14, %eax
	.loc 27 873 0
	andl	$15, %ebx
	movzbl	%cl, %esi
.LVL1043:
	cmpl	$14, %eax
	cmovne	%ebx, %esi
.LVL1044:
.LBE4512:
.LBE4511:
	.loc 19 383 0
	xorl	%eax, %eax
	.loc 19 335 0
	cmpl	$3, %esi
	jne	.L933
.LVL1045:
.LBB4513:
.LBB4514:
	.loc 27 1619 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$3, %eax
	jne	.L955
	.loc 27 1622 0
	andl	$16777200, %edx
.LVL1046:
	sall	$8, %edx
.LVL1047:
.LBE4514:
.LBE4513:
.LBB4516:
.LBB4517:
	.loc 27 1619 0
	cmpl	$3, %ebx
	je	.L983
.LVL1048:
.L955:
.LBE4517:
.LBE4516:
.LBB4518:
.LBB4515:
	call	cap_page_table_cap_get_capPTBasePtr.isra.92.part.93
.LVL1049:
	.p2align 4,,7
	.p2align 3
.L937:
.LBE4515:
.LBE4518:
.LBB4519:
.LBB4520:
	.loc 27 872 0
	movl	%ecx, %eax
	.loc 27 873 0
	movl	%ecx, %ebx
.LVL1050:
	.loc 27 872 0
	andl	$14, %eax
	.loc 27 873 0
	andl	$15, %ebx
	movzbl	%cl, %esi
.LVL1051:
	cmpl	$14, %eax
	cmovne	%ebx, %esi
.LVL1052:
.LBE4520:
.LBE4519:
	.loc 19 383 0
	xorl	%eax, %eax
	.loc 19 342 0
	cmpl	$5, %esi
	jne	.L933
.LVL1053:
.LBB4521:
.LBB4522:
	.loc 27 1708 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$5, %eax
	jne	.L959
	.loc 27 1711 0
	andl	$16777200, %edx
.LVL1054:
	sall	$8, %edx
.LVL1055:
.LBE4522:
.LBE4521:
.LBB4524:
.LBB4525:
	.loc 27 1708 0
	cmpl	$5, %ebx
	je	.L983
.LVL1056:
.L959:
.LBE4525:
.LBE4524:
.LBB4526:
.LBB4523:
	call	cap_page_directory_cap_get_capPDBasePtr.isra.67.part.68
.LVL1057:
	.p2align 4,,7
	.p2align 3
.L938:
.LBE4523:
.LBE4526:
.LBB4527:
.LBB4528:
	.loc 27 872 0
	movl	%ecx, %edx
.LVL1058:
	.loc 27 873 0
	movl	%ecx, %eax
	.loc 27 872 0
	andl	$14, %edx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%cl, %ecx
.LVL1059:
	cmpl	$14, %edx
	cmove	%ecx, %eax
.LVL1060:
.LBE4528:
.LBE4527:
	.loc 19 349 0
	cmpl	$7, %eax
	sete	%al
	.loc 19 384 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1061:
	.loc 19 349 0
	movzbl	%al, %eax
	.loc 19 384 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1062:
	.p2align 4,,7
	.p2align 3
.L939:
	.cfi_restore_state
.LBB4529:
.LBB4530:
	.loc 27 872 0
	movl	%ecx, %eax
	.loc 27 873 0
	movl	%ecx, %ebx
.LVL1063:
	.loc 27 872 0
	andl	$14, %eax
	.loc 27 873 0
	andl	$15, %ebx
	movzbl	%cl, %esi
.LVL1064:
	cmpl	$14, %eax
	cmovne	%ebx, %esi
.LVL1065:
.LBE4530:
.LBE4529:
	.loc 19 383 0
	xorl	%eax, %eax
	.loc 19 355 0
	cmpl	$9, %esi
	jne	.L933
.LVL1066:
.LBB4531:
.LBB4532:
	.loc 27 1762 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$9, %eax
	jne	.L965
	.loc 27 1765 0
	andl	$16777200, %edx
.LVL1067:
	sall	$8, %edx
.LVL1068:
.LBE4532:
.LBE4531:
.LBB4534:
.LBB4535:
	.loc 27 1762 0
	cmpl	$9, %ebx
	jne	.L965
.LVL1069:
.L983:
	.loc 27 1765 0
	andl	$16777200, %ecx
.LVL1070:
.LBE4535:
.LBE4534:
	.loc 19 356 0
	xorl	%eax, %eax
.LBB4537:
.LBB4536:
	.loc 27 1765 0
	sall	$8, %ecx
.LBE4536:
.LBE4537:
	.loc 19 356 0
	cmpl	%ecx, %edx
	sete	%al
	.loc 19 384 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1071:
	.p2align 4,,7
	.p2align 3
.L968:
	.cfi_restore_state
	.loc 19 383 0
	xorl	%eax, %eax
	jmp	.L933
.LVL1072:
	.p2align 4,,7
	.p2align 3
.L984:
.LBB4538:
.LBB4507:
.LBB4501:
	call	pageBitsForSize.part.45
.LVL1073:
	.p2align 4,,7
	.p2align 3
.L946:
.LBE4501:
.LBE4507:
.LBB4508:
.LBB4496:
	.loc 37 41 0
	movl	$4096, %eax
	jmp	.L947
.LVL1074:
.L949:
.LBE4496:
.LBE4508:
.LBB4509:
.LBB4502:
	movl	$4096, %ebx
	jmp	.L950
.LVL1075:
.L944:
.LBE4502:
.LBE4509:
.LBB4510:
.LBB4487:
	call	cap_frame_cap_get_capFBasePtr.isra.90.part.91
.LVL1076:
.L965:
.LBE4487:
.LBE4510:
.LBE4538:
.LBB4539:
.LBB4533:
	call	cap_asid_pool_cap_get_capASIDPool.isra.99.part.100
.LVL1077:
.LBE4533:
.LBE4539:
	.cfi_endproc
.LFE417:
	.size	Arch_sameRegionAs, .-Arch_sameRegionAs
	.p2align 4,,15
	.globl	Arch_sameObjectAs
	.type	Arch_sameObjectAs, @function
Arch_sameObjectAs:
.LFB418:
	.loc 19 387 0
	.cfi_startproc
.LVL1078:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 19 387 0
	movl	48(%esp), %eax
	movl	52(%esp), %ebx
.LVL1079:
	movl	56(%esp), %edx
.LVL1080:
	movl	60(%esp), %esi
.LBB4552:
.LBB4553:
	.loc 27 872 0
	movl	%eax, %ebp
	.loc 27 873 0
	movl	%eax, %ecx
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%al, %edi
.LVL1081:
	cmpl	$14, %ebp
	cmovne	%ecx, %edi
.LVL1082:
.LBE4553:
.LBE4552:
	.loc 19 388 0
	cmpl	$1, %edi
	je	.L997
.L988:
	.loc 19 396 0
	movl	%esi, 60(%esp)
	movl	%ebx, 52(%esp)
	movl	%edx, 56(%esp)
.LVL1083:
	movl	%eax, 48(%esp)
	.loc 19 397 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1084:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 19 396 0
	jmp	Arch_sameRegionAs
.LVL1085:
	.p2align 4,,7
	.p2align 3
.L997:
	.cfi_restore_state
.LBB4554:
.LBB4555:
	.loc 27 872 0
	movl	%edx, %edi
	.loc 27 873 0
	movzbl	%dl, %ebp
.LVL1086:
	.loc 27 872 0
	andl	$14, %edi
	movl	%edi, 12(%esp)
	.loc 27 873 0
	movl	%edx, %edi
.LVL1087:
	andl	$15, %edi
	cmpl	$14, 12(%esp)
	cmovne	%edi, %ebp
.LBE4555:
.LBE4554:
	.loc 19 389 0
	cmpl	$1, %ebp
	jne	.L988
.LVL1088:
.LBB4556:
.LBB4557:
	.loc 27 1507 0
	cmpl	$1, %ecx
	jne	.L992
	.loc 27 1510 0
	andl	$16777200, %eax
.LVL1089:
	movl	%eax, %ecx
	sall	$8, %ecx
.LVL1090:
.LBE4557:
.LBE4556:
.LBB4559:
.LBB4560:
	.loc 27 1507 0
	cmpl	$1, %edi
	jne	.L992
	.loc 27 1510 0
	andl	$16777200, %edx
.LVL1091:
.LBE4560:
.LBE4559:
	xorl	%eax, %eax
.LBB4562:
.LBB4561:
	sall	$8, %edx
.LBE4561:
.LBE4562:
	.loc 19 391 0
	cmpl	%edx, %ecx
	je	.L998
.L994:
	.loc 19 397 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1092:
	.p2align 4,,7
	.p2align 3
.L998:
	.cfi_restore_state
.LBB4563:
.LBB4564:
	.loc 27 1409 0 discriminator 1
	shrl	$31, %ebx
.LVL1093:
.LBE4564:
.LBE4563:
	.loc 19 391 0 discriminator 1
	xorl	%eax, %eax
.LBB4565:
.LBB4566:
	.loc 27 1409 0 discriminator 1
	shrl	$31, %esi
.LVL1094:
.LBE4566:
.LBE4565:
	.loc 19 391 0 discriminator 1
	cmpl	%esi, %ebx
	sete	%al
	jmp	.L994
.LVL1095:
.L992:
.LBB4567:
.LBB4558:
	call	cap_frame_cap_get_capFBasePtr.isra.90.part.91
.LVL1096:
.LBE4558:
.LBE4567:
	.cfi_endproc
.LFE418:
	.size	Arch_sameObjectAs, .-Arch_sameObjectAs
	.section	.rodata.str1.1
.LC66:
	.string	"(FSR & ~0x1f) == 0"
	.section	.text.unlikely
	.type	fault_vm_fault_new.part.122, @function
fault_vm_fault_new.part.122:
.LFB762:
	.loc 27 1984 0
	.cfi_startproc
.LVL1097:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1992 0
	movl	$__FUNCTION__.1963, 12(%esp)
	movl	$1992, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC66, (%esp)
	call	_assert_fail
.LVL1098:
	.cfi_endproc
.LFE762:
	.size	fault_vm_fault_new.part.122, .-fault_vm_fault_new.part.122
	.type	cap_page_directory_cap_get_capPDMappedASID.part.123, @function
cap_page_directory_cap_get_capPDMappedASID.part.123:
.LFB763:
	.loc 27 1686 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1687 0
	movl	$__FUNCTION__.1842, 12(%esp)
	movl	$1688, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC40, (%esp)
	call	_assert_fail
.LVL1099:
	.cfi_endproc
.LFE763:
	.size	cap_page_directory_cap_get_capPDMappedASID.part.123, .-cap_page_directory_cap_get_capPDMappedASID.part.123
	.text
	.p2align 4,,15
	.globl	setVMRoot
	.type	setVMRoot, @function
setVMRoot:
.LFB368:
	.loc 4 1237 0
	.cfi_startproc
.LVL1100:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 4 1237 0
	movl	16(%esp), %eax
	.loc 4 1243 0
	andl	$-1024, %eax
	movl	20(%eax), %esi
.LVL1101:
	movl	16(%eax), %eax
.LVL1102:
.LBB4604:
.LBB4605:
	.loc 27 872 0
	movl	%eax, %ebx
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ebx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %ebx
	cmovne	%edx, %ecx
.LBE4605:
.LBE4604:
	.loc 4 1245 0
	cmpl	$5, %ecx
	je	.L1020
.LVL1103:
.L1011:
.LBB4606:
.LBB4607:
	.loc 10 41 0
	movl	ia32KSkernelPD, %eax
	addl	$536870912, %eax
.LVL1104:
.LBE4607:
.LBE4606:
.LBB4608:
.LBB4609:
	.loc 39 39 0
	movl	%eax, ia32KSCurrentPD
.LVL1105:
.LBB4610:
.LBB4611:
	.loc 2 35 0
#APP
# 35 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr3
# 0 "" 2
.LVL1106:
#NO_APP
.L1003:
.LBE4611:
.LBE4610:
.LBE4609:
.LBE4608:
	.loc 4 1263 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1107:
	.p2align 4,,7
	.p2align 3
.L1020:
	.cfi_restore_state
.LBB4612:
.LBB4613:
	.loc 27 1654 0 discriminator 1
	cmpl	$5, %edx
	jne	.L1021
.LBE4613:
.LBE4612:
	.loc 4 1245 0
	testl	$65536, %esi
	je	.L1011
.LVL1108:
.LBB4615:
.LBB4616:
	.loc 27 1690 0
	movzwl	%si, %edx
.LBE4616:
.LBE4615:
.LBB4617:
.LBB4618:
	.loc 27 1711 0
	andl	$16777200, %eax
.LVL1109:
.LBE4618:
.LBE4617:
.LBB4620:
.LBB4621:
	.loc 4 1213 0
	shrl	$10, %edx
	movl	ia32KSASIDTable(,%edx,4), %edx
.LBE4621:
.LBE4620:
.LBB4624:
.LBB4619:
	.loc 27 1711 0
	sall	$8, %eax
.LVL1110:
.LBE4619:
.LBE4624:
.LBB4625:
.LBB4622:
	.loc 4 1214 0
	testl	%edx, %edx
	je	.L1012
	.loc 4 1222 0
	andl	$1023, %esi
.LVL1111:
	movl	(%edx,%esi,4), %edx
.LVL1112:
	.loc 4 1223 0
	testl	%edx, %edx
	je	.L1012
.LVL1113:
.LBE4622:
.LBE4625:
	.loc 4 1254 0
	cmpl	%edx, %eax
	jne	.L1011
.LVL1114:
.LBB4626:
.LBB4627:
	.loc 10 41 0
	addl	$536870912, %eax
.LVL1115:
.LBE4627:
.LBE4626:
	.loc 4 1260 0
	cmpl	%eax, ia32KSCurrentPD
	je	.L1003
.LVL1116:
.LBB4628:
.LBB4629:
	.loc 39 39 0
	movl	%eax, ia32KSCurrentPD
.LVL1117:
.LBB4630:
.LBB4631:
	.loc 2 35 0
#APP
# 35 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr3
# 0 "" 2
#NO_APP
	jmp	.L1003
.LVL1118:
	.p2align 4,,7
	.p2align 3
.L1012:
.LBE4631:
.LBE4630:
.LBE4629:
.LBE4628:
.LBB4632:
.LBB4623:
	.loc 4 1215 0
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL1119:
	jmp	.L1011
.LVL1120:
.L1021:
.LBE4623:
.LBE4632:
.LBB4633:
.LBB4614:
	call	cap_page_directory_cap_get_capPDIsMapped.part.69
.LVL1121:
.LBE4614:
.LBE4633:
	.cfi_endproc
.LFE368:
	.size	setVMRoot, .-setVMRoot
	.p2align 4,,15
	.globl	deleteASID
	.type	deleteASID, @function
deleteASID:
.LFB370:
	.loc 4 1277 0
	.cfi_startproc
.LVL1122:
	.loc 4 1277 0
	movl	4(%esp), %edx
	movl	8(%esp), %ecx
	.loc 4 1280 0
	movl	%edx, %eax
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
.LVL1123:
	.loc 4 1282 0
	testl	%eax, %eax
	je	.L1022
	.loc 4 1282 0 is_stmt 0 discriminator 1
	andl	$1023, %edx
	leal	(%eax,%edx,4), %eax
.LVL1124:
	cmpl	%ecx, (%eax)
	je	.L1027
.L1022:
	rep ret
	.p2align 4,,7
	.p2align 3
.L1027:
	.loc 4 1283 0 is_stmt 1
	movl	$0, (%eax)
	.loc 4 1284 0
	movl	ksCurThread, %eax
	movl	%eax, 4(%esp)
.LVL1125:
	jmp	setVMRoot
.LVL1126:
	.cfi_endproc
.LFE370:
	.size	deleteASID, .-deleteASID
	.section	.rodata.str1.4
	.align 4
.LC67:
	.string	"IS_ALIGNED(asid_base, asidLowBits)"
	.section	.text.unlikely
	.type	deleteASIDPool.part.124, @function
deleteASIDPool.part.124:
.LFB764:
	.loc 4 1265 0
	.cfi_startproc
.LVL1127:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 4 1268 0
	movl	$__FUNCTION__.5213, 12(%esp)
	movl	$1268, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC67, (%esp)
	call	_assert_fail
.LVL1128:
	.cfi_endproc
.LFE764:
	.size	deleteASIDPool.part.124, .-deleteASIDPool.part.124
	.text
	.p2align 4,,15
	.globl	deleteASIDPool
	.type	deleteASIDPool, @function
deleteASIDPool:
.LFB369:
	.loc 4 1266 0
	.cfi_startproc
.LVL1129:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 4 1266 0
	movl	16(%esp), %eax
	movl	20(%esp), %edx
	.loc 4 1268 0
	testl	$1023, %eax
	jne	.L1034
	.loc 4 1270 0
	shrl	$10, %eax
	cmpl	%edx, ia32KSASIDTable(,%eax,4)
	je	.L1035
	.loc 4 1274 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1035:
	.cfi_restore_state
	.loc 4 1271 0
	movl	$0, ia32KSASIDTable(,%eax,4)
	.loc 4 1272 0
	movl	ksCurThread, %eax
	movl	%eax, 16(%esp)
.LVL1130:
	.loc 4 1274 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	.loc 4 1272 0
	jmp	setVMRoot
.LVL1131:
.L1034:
	.cfi_restore_state
	call	deleteASIDPool.part.124
.LVL1132:
	.cfi_endproc
.LFE369:
	.size	deleteASIDPool, .-deleteASIDPool
	.section	.text.unlikely
	.type	pde_pde_4k_ptr_get_present.part.125, @function
pde_pde_4k_ptr_get_present.part.125:
.LFB765:
	.loc 27 2683 0
	.cfi_startproc
.LVL1133:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2684 0
	movl	$__FUNCTION__.2208, 12(%esp)
	movl	$2685, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC63, (%esp)
	call	_assert_fail
.LVL1134:
	.cfi_endproc
.LFE765:
	.size	pde_pde_4k_ptr_get_present.part.125, .-pde_pde_4k_ptr_get_present.part.125
	.text
	.p2align 4,,15
	.type	lookupPTSlot, @function
lookupPTSlot:
.LFB361:
	.loc 4 1094 0
	.cfi_startproc
.LVL1135:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
.LBB4671:
.LBB4672:
	.loc 4 1089 0
	movl	%ecx, %ebx
	shrl	$22, %ebx
.LBE4672:
.LBE4671:
	.loc 4 1094 0
	subl	$8, %esp
	.cfi_def_cfa_offset 16
.LBB4673:
.LBB4674:
	.loc 27 2559 0
	movl	(%edx,%ebx,4), %edx
.LVL1136:
.LBE4674:
.LBE4673:
	.loc 4 1100 0
	testb	$-128, %dl
	jne	.L1039
.LVL1137:
.LBB4675:
.LBB4676:
	.loc 27 2684 0
	jne	.L1044
.LBE4676:
.LBE4675:
	.loc 4 1100 0
	testb	$1, %dl
	je	.L1039
.LVL1138:
.LBB4678:
	.loc 4 1113 0
	shrl	$10, %ecx
.LVL1139:
.LBB4679:
.LBB4680:
	.loc 27 2663 0
	andl	$-4096, %edx
.LVL1140:
.LBE4680:
.LBE4679:
	.loc 4 1114 0
	andl	$4092, %ecx
.LVL1141:
	.loc 4 1118 0
	leal	-536870912(%edx,%ecx), %ecx
.LVL1142:
	xorl	%edx, %edx
.LVL1143:
	movl	%ecx, 4(%eax)
	movl	%edx, (%eax)
.LBE4678:
	.loc 4 1120 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL1144:
	ret
.LVL1145:
	.p2align 4,,7
	.p2align 3
.L1039:
	.cfi_restore_state
.LBB4681:
.LBB4682:
	.loc 4 1106 0
	xorl	%ecx, %ecx
.LVL1146:
	movl	$2, %edx
	.loc 4 1102 0
	movl	$89, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL1147:
	movl	%ecx, 4(%eax)
	movl	%edx, (%eax)
.LBE4682:
.LBE4681:
	.loc 4 1120 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL1148:
.L1044:
	.cfi_restore_state
.LBB4683:
.LBB4677:
	call	pde_pde_4k_ptr_get_present.part.125
.LVL1149:
.LBE4677:
.LBE4683:
	.cfi_endproc
.LFE361:
	.size	lookupPTSlot, .-lookupPTSlot
	.section	.rodata.str1.4
	.align 4
.LC68:
	.string	"((pde_ptr->words[0] >> 7) & 0x1) == pde_pde_4m"
	.section	.text.unlikely
	.type	pde_pde_4m_ptr_get_present.part.127, @function
pde_pde_4m_ptr_get_present.part.127:
.LFB767:
	.loc 27 2835 0
	.cfi_startproc
.LVL1150:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2836 0
	movl	$__FUNCTION__.2258, 12(%esp)
	movl	$2837, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC68, (%esp)
	call	_assert_fail
.LVL1151:
	.cfi_endproc
.LFE767:
	.size	pde_pde_4m_ptr_get_present.part.127, .-pde_pde_4m_ptr_get_present.part.127
	.type	cap_page_table_cap_get_capPTMappedASID.part.128, @function
cap_page_table_cap_get_capPTMappedASID.part.128:
.LFB768:
	.loc 27 1578 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1579 0
	movl	$__FUNCTION__.1799, 12(%esp)
	movl	$1580, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC52, (%esp)
	call	_assert_fail
.LVL1152:
	.cfi_endproc
.LFE768:
	.size	cap_page_table_cap_get_capPTMappedASID.part.128, .-cap_page_table_cap_get_capPTMappedASID.part.128
	.type	cap_page_table_cap_set_capPTIsMapped.part.129, @function
cap_page_table_cap_set_capPTIsMapped.part.129:
.LFB769:
	.loc 27 1553 0
	.cfi_startproc
.LVL1153:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1554 0
	movl	$__FUNCTION__.1790, 12(%esp)
	movl	$1555, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC52, (%esp)
	call	_assert_fail
.LVL1154:
	.cfi_endproc
.LFE769:
	.size	cap_page_table_cap_set_capPTIsMapped.part.129, .-cap_page_table_cap_set_capPTIsMapped.part.129
	.section	.rodata.str1.1
.LC69:
	.string	"./api/types_gen.h"
.LC70:
	.string	"(msgLabel & ~0xfffff) == 0"
	.section	.text.unlikely
	.type	message_info_new.part.130, @function
message_info_new.part.130:
.LFB770:
	.loc 14 14 0
	.cfi_startproc
.LVL1155:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 14 20 0
	movl	$__FUNCTION__.972, 12(%esp)
	movl	$20, 8(%esp)
	movl	$.LC69, 4(%esp)
	movl	$.LC70, (%esp)
	call	_assert_fail
.LVL1156:
	.cfi_endproc
.LFE770:
	.size	message_info_new.part.130, .-message_info_new.part.130
	.section	.rodata.str1.4
	.align 4
.LC71:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/api/syscall.h"
	.section	.rodata.str1.1
.LC72:
	.string	"ipc_buffer != NULL"
	.section	.text.unlikely
	.type	getSyscallArg.part.131, @function
getSyscallArg.part.131:
.LFB771:
	.file 41 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/api/syscall.h"
	.loc 41 27 0
	.cfi_startproc
.LVL1157:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 41 33 0
	movl	$__FUNCTION__.3623, 12(%esp)
	movl	$33, 8(%esp)
	movl	$.LC71, 4(%esp)
	movl	$.LC72, (%esp)
	call	_assert_fail
.LVL1158:
	.cfi_endproc
.LFE771:
	.size	getSyscallArg.part.131, .-getSyscallArg.part.131
	.type	cap_untyped_cap_get_capBlockSize.part.132, @function
cap_untyped_cap_get_capBlockSize.part.132:
.LFB772:
	.loc 27 948 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 949 0
	movl	$__FUNCTION__.1555, 12(%esp)
	movl	$950, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC49, (%esp)
	call	_assert_fail
.LVL1159:
	.cfi_endproc
.LFE772:
	.size	cap_untyped_cap_get_capBlockSize.part.132, .-cap_untyped_cap_get_capBlockSize.part.132
	.section	.rodata.str1.1
.LC73:
	.string	"(capASIDBase & ~0xffff) == 0"
	.section	.text.unlikely
	.type	cap_asid_pool_cap_new.part.134, @function
cap_asid_pool_cap_new.part.134:
.LFB774:
	.loc 27 1730 0
	.cfi_startproc
.LVL1160:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1737 0
	movl	$__FUNCTION__.1862, 12(%esp)
	movl	$1737, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC73, (%esp)
	call	_assert_fail
.LVL1161:
	.cfi_endproc
.LFE774:
	.size	cap_asid_pool_cap_new.part.134, .-cap_asid_pool_cap_new.part.134
	.type	cap_asid_pool_cap_get_capASIDBase.part.135, @function
cap_asid_pool_cap_get_capASIDBase.part.135:
.LFB775:
	.loc 27 1753 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1754 0
	movl	$__FUNCTION__.1866, 12(%esp)
	movl	$1755, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC54, (%esp)
	call	_assert_fail
.LVL1162:
	.cfi_endproc
.LFE775:
	.size	cap_asid_pool_cap_get_capASIDBase.part.135, .-cap_asid_pool_cap_get_capASIDBase.part.135
	.section	.rodata.str1.4
	.align 4
.LC74:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/machine/fpu.c"
	.section	.rodata.str1.1
.LC75:
	.string	"ksCurThread != ia32KSfpuOwner"
	.text
	.p2align 4,,15
	.globl	handleUnimplementedDevice
	.type	handleUnimplementedDevice, @function
handleUnimplementedDevice:
.LFB397:
	.loc 15 55 0
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 15 62 0
	movl	ksCurThread, %ebx
	movl	ia32KSfpuOwner, %eax
	cmpl	%eax, %ebx
	je	.L1070
.LVL1163:
.LBB4694:
.LBB4695:
.LBB4696:
.LBB4697:
	.loc 3 45 0
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.LBE4697:
.LBE4696:
	.loc 15 35 0
	testl	%eax, %eax
	je	.L1063
	.loc 15 36 0
	addl	$80, %eax
	movl	%eax, (%esp)
	call	saveFpuState
.LVL1164:
.L1063:
	.loc 15 38 0
	testl	%ebx, %ebx
	je	.L1064
	.loc 15 39 0
	leal	80(%ebx), %eax
	movl	%eax, (%esp)
	call	loadFpuState
.LVL1165:
.LBE4695:
.LBE4694:
	.loc 15 68 0
	xorl	%eax, %eax
.LBB4706:
.LBB4704:
	.loc 15 43 0
	movl	%ebx, ia32KSfpuOwner
.LBE4704:
.LBE4706:
	.loc 15 68 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL1166:
	ret
.LVL1167:
	.p2align 4,,7
	.p2align 3
.L1064:
	.cfi_restore_state
.LBB4707:
.LBB4705:
.LBB4698:
.LBB4699:
.LBB4700:
.LBB4701:
	.loc 2 41 0
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
.LVL1168:
#NO_APP
.LBE4701:
.LBE4700:
	.loc 3 53 0
	orl	$8, %eax
.LVL1169:
.LBB4702:
.LBB4703:
	.loc 2 47 0
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
.LBE4703:
.LBE4702:
.LBE4699:
.LBE4698:
	.loc 15 43 0
	movl	%ebx, ia32KSfpuOwner
.LBE4705:
.LBE4707:
	.loc 15 68 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
.LVL1170:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL1171:
	ret
.LVL1172:
.L1070:
	.cfi_restore_state
	.loc 15 62 0 discriminator 1
	movl	$__FUNCTION__.5520, 12(%esp)
	movl	$62, 8(%esp)
	movl	$.LC74, 4(%esp)
	movl	$.LC75, (%esp)
	call	_assert_fail
.LVL1173:
	.cfi_endproc
.LFE397:
	.size	handleUnimplementedDevice, .-handleUnimplementedDevice
	.section	.rodata.str1.4
	.align 4
.LC76:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/machine/hardware.c"
	.section	.rodata.str1.1
.LC77:
	.string	"size_bits < WORD_BITS"
	.section	.rodata.str1.4
	.align 4
.LC78:
	.string	"IS_ALIGNED((uint32_t)vaddr, size_bits)"
	.text
	.p2align 4,,15
	.globl	flushCacheRange
	.type	flushCacheRange, @function
flushCacheRange:
.LFB404:
	.loc 16 70 0
	.cfi_startproc
.LVL1174:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 16 70 0
	movl	36(%esp), %ecx
	movl	32(%esp), %edi
	.loc 16 73 0
	cmpl	$31, %ecx
	ja	.L1079
	.loc 16 74 0
	movl	$1, %esi
	sall	%cl, %esi
	leal	-1(%esi), %eax
	testl	%eax, %edi
	jne	.L1080
	.loc 16 76 0
	call	ia32_mfence
.LVL1175:
	.loc 16 78 0
	movl	ia32KScacheLineSizeBits, %ecx
	movl	%edi, %ebx
	.loc 16 79 0
	addl	%edi, %esi
	.loc 16 80 0
	movl	$1, %edi
	.loc 16 78 0
	shrl	%cl, %ebx
	sall	%cl, %ebx
.LVL1176:
	cmpl	%esi, %ebx
	jae	.L1075
	.p2align 4,,7
	.p2align 3
.L1077:
	.loc 16 81 0
	movl	%ebx, (%esp)
	call	flushCacheLine
.LVL1177:
	.loc 16 80 0
	movl	ia32KScacheLineSizeBits, %ecx
	movl	%edi, %eax
	sall	%cl, %eax
	addl	%eax, %ebx
.LVL1178:
	.loc 16 78 0
	cmpl	%esi, %ebx
	jb	.L1077
.L1075:
	.loc 16 84 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1179:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	.loc 16 83 0
	jmp	ia32_mfence
.LVL1180:
.L1079:
	.cfi_restore_state
	.loc 16 73 0 discriminator 1
	movl	$__FUNCTION__.5550, 12(%esp)
	movl	$73, 8(%esp)
	movl	$.LC76, 4(%esp)
	movl	$.LC77, (%esp)
	call	_assert_fail
.LVL1181:
.L1080:
	.loc 16 74 0 discriminator 1
	movl	$__FUNCTION__.5550, 12(%esp)
	movl	$74, 8(%esp)
	movl	$.LC76, 4(%esp)
	movl	$.LC78, (%esp)
	call	_assert_fail
.LVL1182:
	.cfi_endproc
.LFE404:
	.size	flushCacheRange, .-flushCacheRange
	.section	.rodata.str1.4
	.align 4
.LC79:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_io_port_cap"
	.section	.text.unlikely
	.type	cap_io_port_cap_get_capIOPortFirstPort.part.136, @function
cap_io_port_cap_get_capIOPortFirstPort.part.136:
.LFB776:
	.loc 27 1792 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1793 0
	movl	$__FUNCTION__.1880, 12(%esp)
	movl	$1794, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC79, (%esp)
	call	_assert_fail
.LVL1183:
	.cfi_endproc
.LFE776:
	.size	cap_io_port_cap_get_capIOPortFirstPort.part.136, .-cap_io_port_cap_get_capIOPortFirstPort.part.136
	.type	cap_io_port_cap_get_capIOPortLastPort.part.137, @function
cap_io_port_cap_get_capIOPortLastPort.part.137:
.LFB777:
	.loc 27 1800 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1801 0
	movl	$__FUNCTION__.1884, 12(%esp)
	movl	$1802, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC79, (%esp)
	call	_assert_fail
.LVL1184:
	.cfi_endproc
.LFE777:
	.size	cap_io_port_cap_get_capIOPortLastPort.part.137, .-cap_io_port_cap_get_capIOPortLastPort.part.137
	.section	.rodata.str1.1
.LC80:
	.string	"capFirstPort <= capLastPort"
	.text
	.p2align 4,,15
	.globl	Arch_updateCapData
	.type	Arch_updateCapData, @function
Arch_updateCapData:
.LFB411:
	.loc 19 99 0
	.cfi_startproc
.LVL1185:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 19 99 0
	movl	44(%esp), %edx
	movl	32(%esp), %eax
.LVL1186:
	movl	48(%esp), %ebx
.LVL1187:
.LBB4740:
.LBB4741:
	.loc 27 872 0
	movl	%edx, %edi
	.loc 27 873 0
	movl	%edx, %ecx
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%dl, %esi
.LVL1188:
	cmpl	$14, %edi
	cmovne	%ecx, %esi
.LVL1189:
.LBE4741:
.LBE4740:
	.loc 19 100 0
	cmpl	$11, %esi
	jne	.L1101
.LVL1190:
.LBB4742:
.LBB4743:
.LBB4744:
	.loc 27 15 0
	movl	40(%esp), %esi
.LBE4744:
.LBE4743:
.LBB4746:
.LBB4747:
	.loc 27 20 0
	movzwl	40(%esp), %edx
.LVL1191:
.LBE4747:
.LBE4746:
.LBB4748:
.LBB4745:
	.loc 27 15 0
	shrl	$16, %esi
.LVL1192:
.LBE4745:
.LBE4748:
.LBB4749:
.LBB4750:
	.loc 27 1793 0
	cmpl	$11, %ecx
	jne	.L1103
	.loc 27 1796 0
	movl	%ebx, %ecx
.LBE4750:
.LBE4749:
.LBB4753:
.LBB4754:
	.loc 27 1804 0
	movzwl	%bx, %ebx
.LVL1193:
.LBE4754:
.LBE4753:
.LBB4755:
.LBB4751:
	.loc 27 1796 0
	shrl	$16, %ecx
.LVL1194:
.LBE4751:
.LBE4755:
	.loc 19 123 0
	cmpw	%bx, %cx
	ja	.L1104
	.loc 19 126 0
	cmpw	%dx, %si
	ja	.L1094
	.loc 19 132 0
	cmpw	%bx, %dx
	ja	.L1094
	cmpw	%cx, %si
	.p2align 4,,2
	jb	.L1094
.LVL1195:
.LBB4756:
.LBB4757:
	.loc 27 1778 0
	sall	$16, %esi
.LVL1196:
	.loc 27 1782 0
	orl	%edx, %esi
.LVL1197:
	.loc 27 1788 0
	movl	$11, (%eax)
	.loc 27 1782 0
	movl	%esi, 4(%eax)
.LBE4757:
.LBE4756:
.LBE4742:
	.loc 19 142 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1198:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL1199:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1200:
	.p2align 4,,7
	.p2align 3
.L1101:
	.cfi_restore_state
	.loc 19 140 0
	movl	%edx, (%eax)
	movl	%ebx, 4(%eax)
	.loc 19 142 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1201:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1202:
	.p2align 4,,7
	.p2align 3
.L1094:
	.cfi_restore_state
.LBB4761:
.LBB4758:
.LBB4759:
	.loc 27 896 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
.LBE4759:
.LBE4758:
.LBE4761:
	.loc 19 142 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1203:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL1204:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1205:
.L1103:
	.cfi_restore_state
.LBB4762:
.LBB4760:
.LBB4752:
	call	cap_io_port_cap_get_capIOPortFirstPort.part.136
.LVL1206:
.L1104:
.LBE4752:
.LBE4760:
	.loc 19 123 0 discriminator 1
	movl	$__FUNCTION__.5643, 12(%esp)
	movl	$123, 8(%esp)
	movl	$.LC31, 4(%esp)
	movl	$.LC80, (%esp)
	call	_assert_fail
.LVL1207:
.LBE4762:
	.cfi_endproc
.LFE411:
	.size	Arch_updateCapData, .-Arch_updateCapData
	.p2align 4,,15
	.globl	Arch_maskCapRights
	.type	Arch_maskCapRights, @function
Arch_maskCapRights:
.LFB412:
	.loc 19 145 0
	.cfi_startproc
.LVL1208:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LVL1209:
	.loc 19 145 0
	movl	24(%esp), %edx
	movl	16(%esp), %eax
.LVL1210:
	movl	28(%esp), %edi
.LVL1211:
.LBB4791:
.LBB4792:
	.loc 27 872 0
	movl	%edx, %esi
	.loc 27 873 0
	movl	%edx, %ecx
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%dl, %ebx
.LVL1212:
	cmpl	$14, %esi
	cmovne	%ecx, %ebx
.LVL1213:
.LBE4792:
.LBE4791:
	.loc 19 146 0
	cmpl	$1, %ebx
	je	.L1121
.LBB4793:
.LBB4794:
.LBB4795:
	.loc 27 1502 0
	movl	%edx, (%eax)
	movl	%edi, 4(%eax)
.LBE4795:
.LBE4794:
.LBE4793:
	.loc 19 155 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1214:
	.p2align 4,,7
	.p2align 3
.L1121:
	.cfi_restore_state
.LBB4810:
.LBB4797:
.LBB4798:
	.loc 27 1487 0
	cmpl	$1, %ecx
	jne	.L1122
.LVL1215:
	.loc 27 1490 0
	movl	%edx, %ecx
	andl	$50331648, %ecx
	shrl	$24, %ecx
.LVL1216:
.LBE4798:
.LBE4797:
.LBB4800:
.LBB4801:
	.loc 4 1173 0
	cmpl	$2, %ecx
	je	.L1123
	.loc 4 1176 0
	cmpl	$3, %ecx
	movl	$16777216, %ebx
	je	.L1124
.LVL1217:
.L1111:
.LBE4801:
.LBE4800:
.LBB4807:
.LBB4796:
	.loc 27 1500 0
	andl	$-50331649, %edx
.LVL1218:
	.loc 27 1501 0
	orl	%ebx, %edx
.LVL1219:
	.loc 27 1502 0
	movl	%edx, (%eax)
	movl	%edi, 4(%eax)
.LBE4796:
.LBE4807:
.LBE4810:
	.loc 19 155 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL1220:
	ret	$4
.LVL1221:
	.p2align 4,,7
	.p2align 3
.L1124:
	.cfi_restore_state
.LBB4811:
.LBB4808:
.LBB4806:
	.loc 4 1176 0
	testb	$2, 20(%esp)
	je	.L1111
.LVL1222:
.LBB4802:
.LBB4803:
	.loc 14 125 0
	movl	20(%esp), %ecx
.LVL1223:
	andl	$1, %ecx
.LBE4803:
.LBE4802:
	.loc 4 1177 0
	cmpl	$1, %ecx
	sbbl	%ebx, %ebx
	andl	$-16777216, %ebx
	addl	$50331648, %ebx
	jmp	.L1111
.LVL1224:
	.p2align 4,,7
	.p2align 3
.L1123:
.LBB4804:
.LBB4805:
	.loc 14 120 0
	movl	20(%esp), %ecx
.LVL1225:
	andl	$2, %ecx
	shrl	%ecx
.LBE4805:
.LBE4804:
	.loc 4 1173 0
	cmpl	$1, %ecx
	sbbl	%ebx, %ebx
	andl	$-16777216, %ebx
	addl	$33554432, %ebx
	jmp	.L1111
.LVL1226:
.L1122:
.LBE4806:
.LBE4808:
.LBB4809:
.LBB4799:
	call	cap_frame_cap_get_capFVMRights.isra.119.part.120
.LVL1227:
.LBE4799:
.LBE4809:
.LBE4811:
	.cfi_endproc
.LFE412:
	.size	Arch_maskCapRights, .-Arch_maskCapRights
	.section	.rodata.str1.4
	.align 4
.LC81:
	.string	"((fault.words[0] >> 0) & 0x7) == fault_cap_fault"
	.section	.text.unlikely
	.type	fault_cap_fault_get_address.part.138, @function
fault_cap_fault_get_address.part.138:
.LFB778:
	.loc 27 1968 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1969 0
	movl	$__FUNCTION__.1952, 12(%esp)
	movl	$1970, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC81, (%esp)
	call	_assert_fail
.LVL1228:
	.cfi_endproc
.LFE778:
	.size	fault_cap_fault_get_address.part.138, .-fault_cap_fault_get_address.part.138
	.type	fault_cap_fault_get_inReceivePhase.isra.139.part.140, @function
fault_cap_fault_get_inReceivePhase.isra.139.part.140:
.LFB780:
	.loc 27 1976 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1977 0
	movl	$__FUNCTION__.1956, 12(%esp)
	movl	$1978, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC81, (%esp)
	call	_assert_fail
.LVL1229:
	.cfi_endproc
.LFE780:
	.size	fault_cap_fault_get_inReceivePhase.isra.139.part.140, .-fault_cap_fault_get_inReceivePhase.isra.139.part.140
	.section	.rodata.str1.4
	.align 4
.LC82:
	.string	"((lookup_fault.words[0] >> 0) & 0x3) == lookup_fault_guard_mismatch"
	.section	.text.unlikely
	.type	setMRs_lookup_failure.part.146, @function
setMRs_lookup_failure.part.146:
.LFB786:
	.loc 20 20 0
	.cfi_startproc
.LVL1230:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB4812:
.LBB4813:
	.loc 27 2468 0
	movl	$__FUNCTION__.2125, 12(%esp)
	movl	$2469, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC82, (%esp)
	call	_assert_fail
.LVL1231:
.LBE4813:
.LBE4812:
	.cfi_endproc
.LFE786:
	.size	setMRs_lookup_failure.part.146, .-setMRs_lookup_failure.part.146
	.section	.rodata.str1.4
	.align 4
.LC83:
	.string	"((fault.words[0] >> 0) & 0x7) == fault_vm_fault"
	.section	.text.unlikely
	.type	fault_vm_fault_get_address.part.147, @function
fault_vm_fault_get_address.part.147:
.LFB787:
	.loc 27 2008 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2009 0
	movl	$__FUNCTION__.1967, 12(%esp)
	movl	$2010, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC83, (%esp)
	call	_assert_fail
.LVL1232:
	.cfi_endproc
.LFE787:
	.size	fault_vm_fault_get_address.part.147, .-fault_vm_fault_get_address.part.147
	.type	fault_vm_fault_get_instructionFault.isra.148.part.149, @function
fault_vm_fault_get_instructionFault.isra.148.part.149:
.LFB789:
	.loc 27 2024 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2025 0
	movl	$__FUNCTION__.1975, 12(%esp)
	movl	$2026, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC83, (%esp)
	call	_assert_fail
.LVL1233:
	.cfi_endproc
.LFE789:
	.size	fault_vm_fault_get_instructionFault.isra.148.part.149, .-fault_vm_fault_get_instructionFault.isra.148.part.149
	.type	fault_vm_fault_get_FSR.isra.150.part.151, @function
fault_vm_fault_get_FSR.isra.150.part.151:
.LFB791:
	.loc 27 2016 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2017 0
	movl	$__FUNCTION__.1971, 12(%esp)
	movl	$2018, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC83, (%esp)
	call	_assert_fail
.LVL1234:
	.cfi_endproc
.LFE791:
	.size	fault_vm_fault_get_FSR.isra.150.part.151, .-fault_vm_fault_get_FSR.isra.150.part.151
	.section	.rodata.str1.4
	.align 4
.LC84:
	.string	"((fault.words[0] >> 0) & 0x7) == fault_unknown_syscall"
	.section	.text.unlikely
	.type	fault_unknown_syscall_get_syscallNumber.part.152, @function
fault_unknown_syscall_get_syscallNumber.part.152:
.LFB792:
	.loc 27 2048 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2049 0
	movl	$__FUNCTION__.1984, 12(%esp)
	movl	$2050, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC84, (%esp)
	call	_assert_fail
.LVL1235:
	.cfi_endproc
.LFE792:
	.size	fault_unknown_syscall_get_syscallNumber.part.152, .-fault_unknown_syscall_get_syscallNumber.part.152
	.section	.rodata.str1.4
	.align 4
.LC85:
	.string	"((fault.words[0] >> 0) & 0x7) == fault_user_exception"
	.section	.text.unlikely
	.type	fault_user_exception_get_number.part.153, @function
fault_user_exception_get_number.part.153:
.LFB793:
	.loc 27 2076 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2077 0
	movl	$__FUNCTION__.1994, 12(%esp)
	movl	$2078, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC85, (%esp)
	call	_assert_fail
.LVL1236:
	.cfi_endproc
.LFE793:
	.size	fault_user_exception_get_number.part.153, .-fault_user_exception_get_number.part.153
	.type	fault_user_exception_get_code.isra.154.part.155, @function
fault_user_exception_get_code.isra.154.part.155:
.LFB795:
	.loc 27 2084 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2085 0
	movl	$__FUNCTION__.1998, 12(%esp)
	movl	$2086, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC85, (%esp)
	call	_assert_fail
.LVL1237:
	.cfi_endproc
.LFE795:
	.size	fault_user_exception_get_code.isra.154.part.155, .-fault_user_exception_get_code.isra.154.part.155
	.section	.rodata.str1.4
	.align 4
.LC86:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/object/tcb.c"
	.text
	.p2align 4,,15
	.globl	setMRs_fault
	.type	setMRs_fault, @function
setMRs_fault:
.LFB424:
	.loc 20 69 0
	.cfi_startproc
.LVL1238:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 20 69 0
	movl	32(%esp), %eax
	movl	36(%esp), %ebx
	movl	40(%esp), %ecx
.LBB4878:
.LBB4879:
	.loc 27 1928 0
	movl	604(%eax), %edx
	andl	$7, %edx
.LBE4879:
.LBE4878:
	.loc 20 72 0
	cmpl	$2, %edx
	je	.L1145
	jbe	.L1176
	cmpl	$3, %edx
	je	.L1148
	cmpl	$4, %edx
	.p2align 4,,5
	jne	.L1144
.LVL1239:
.LBB4880:
.LBB4881:
.LBB4882:
	.loc 13 21 0 discriminator 1
	movl	44(%eax), %edx
.LBE4882:
.LBE4881:
	.loc 20 124 0 discriminator 1
	testl	%ecx, %ecx
.LBB4884:
.LBB4883:
	.loc 13 21 0 discriminator 1
	movl	%edx, 20(%ebx)
.LVL1240:
	movl	68(%eax), %edx
	movl	%edx, 24(%ebx)
.LVL1241:
.LBE4883:
.LBE4884:
	.loc 20 124 0 discriminator 1
	je	.L1151
.LVL1242:
.LBB4885:
.LBB4886:
	.loc 13 27 0
	movl	64(%eax), %edx
.LVL1243:
.LBE4886:
.LBE4885:
	.loc 20 126 0
	movl	%edx, 12(%ecx)
.LVL1244:
.LBB4887:
.LBB4888:
	.loc 27 2077 0
	movl	604(%eax), %edx
	movl	608(%eax), %ebx
.LVL1245:
	andl	$7, %edx
	cmpl	$4, %edx
	jne	.L1177
.LBE4888:
.LBE4887:
	.loc 20 129 0
	movl	%ebx, 16(%ecx)
.LVL1246:
	.loc 20 132 0
	movl	604(%eax), %eax
.LVL1247:
.LBB4890:
.LBB4891:
	.loc 27 2085 0
	movl	%eax, %edx
	andl	$7, %edx
	cmpl	$4, %edx
	jne	.L1178
	.loc 27 2088 0
	shrl	$3, %eax
.LVL1248:
	movl	%eax, 20(%ecx)
.LVL1249:
.LBE4891:
.LBE4890:
.LBE4880:
	.loc 20 142 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB4895:
	.loc 20 133 0
	movl	$5, %eax
.LBE4895:
	.loc 20 142 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL1250:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1251:
	.p2align 4,,7
	.p2align 3
.L1148:
	.cfi_restore_state
.LBB4896:
.LBB4897:
.LBB4898:
	.loc 13 21 0 discriminator 1
	movl	(%eax), %edx
.LBE4898:
.LBE4897:
	.loc 20 103 0 discriminator 1
	testl	%ecx, %ecx
.LBB4900:
.LBB4899:
	.loc 13 21 0 discriminator 1
	movl	%edx, 20(%ebx)
.LVL1252:
	movl	4(%eax), %edx
	movl	%edx, 24(%ebx)
.LVL1253:
.LBE4899:
.LBE4900:
	.loc 20 103 0 discriminator 1
	je	.L1151
.LVL1254:
.LBB4901:
.LBB4902:
	.loc 13 27 0
	movl	8(%eax), %edx
.LVL1255:
.LBE4902:
.LBE4901:
	.loc 20 105 0
	movl	%edx, 12(%ecx)
.LVL1256:
.LBB4910:
.LBB4903:
	.loc 13 27 0
	movl	12(%eax), %edx
.LBE4903:
.LBE4910:
	.loc 20 105 0
	movl	%edx, 16(%ecx)
.LVL1257:
.LBB4911:
.LBB4904:
	.loc 13 27 0
	movl	16(%eax), %edx
.LBE4904:
.LBE4911:
	.loc 20 105 0
	movl	%edx, 20(%ecx)
.LVL1258:
.LBB4912:
.LBB4905:
	.loc 13 27 0
	movl	20(%eax), %edx
.LBE4905:
.LBE4912:
	.loc 20 105 0
	movl	%edx, 24(%ecx)
.LVL1259:
.LBB4913:
.LBB4906:
	.loc 13 27 0
	movl	24(%eax), %edx
.LBE4906:
.LBE4913:
	.loc 20 105 0
	movl	%edx, 28(%ecx)
.LVL1260:
.LBB4914:
.LBB4907:
	.loc 13 27 0
	movl	56(%eax), %edx
.LBE4907:
.LBE4914:
	.loc 20 105 0
	movl	%edx, 32(%ecx)
.LVL1261:
.LBB4915:
.LBB4908:
	.loc 13 27 0
	movl	68(%eax), %edx
.LBE4908:
.LBE4915:
	.loc 20 105 0
	movl	%edx, 36(%ecx)
.LVL1262:
.LBB4916:
.LBB4909:
	.loc 13 27 0
	movl	64(%eax), %edx
.LBE4909:
.LBE4916:
	.loc 20 105 0
	movl	%edx, 40(%ecx)
.LVL1263:
	movl	608(%eax), %edx
.LVL1264:
.LBB4917:
.LBB4918:
	.loc 27 2049 0
	movl	604(%eax), %eax
.LVL1265:
	andl	$7, %eax
.LVL1266:
	cmpl	$3, %eax
	jne	.L1179
.LBE4918:
.LBE4917:
	.loc 20 109 0
	movl	%edx, 44(%ecx)
.LVL1267:
.LBE4896:
	.loc 20 142 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB4921:
	.loc 20 111 0
	movl	$11, %eax
.LBE4921:
	.loc 20 142 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL1268:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1269:
	.p2align 4,,7
	.p2align 3
.L1151:
	.cfi_restore_state
.LBB4922:
	.loc 20 135 0
	movl	$2, %eax
.L1159:
.LBE4922:
	.loc 20 142 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1176:
	.cfi_restore_state
	.loc 20 72 0
	cmpl	$1, %edx
	jne	.L1144
.LVL1270:
.LBB4923:
.LBB4924:
	.loc 13 21 0
	movl	44(%eax), %edx
	movl	%edx, 20(%ebx)
.LVL1271:
.LBE4924:
.LBE4923:
.LBB4925:
.LBB4926:
	.loc 27 1969 0
	movl	604(%eax), %edx
.LVL1272:
	movl	608(%eax), %esi
.LVL1273:
	andl	$7, %edx
	cmpl	$1, %edx
	jne	.L1180
.LVL1274:
.LBE4926:
.LBE4925:
	.loc 20 77 0
	testl	%ecx, %ecx
.LBB4928:
.LBB4929:
	.loc 13 21 0
	movl	%esi, 24(%ebx)
.LVL1275:
.LBE4929:
.LBE4928:
	.loc 20 77 0
	je	.L1151
	.loc 20 81 0
	movl	604(%eax), %edx
.LVL1276:
.LBB4930:
.LBB4931:
	.loc 27 1977 0
	movl	%edx, %ebx
.LVL1277:
	andl	$7, %ebx
	cmpl	$1, %ebx
	jne	.L1181
	.loc 27 1980 0
	shrl	$31, %edx
.LVL1278:
	movl	%edx, 12(%ecx)
.LVL1279:
	movl	612(%eax), %edx
.LVL1280:
	movl	616(%eax), %esi
.LVL1281:
.LBE4931:
.LBE4930:
.LBB4933:
.LBB4934:
.LBB4935:
.LBB4936:
	.loc 27 2358 0
	movl	%edx, %eax
.LVL1282:
	andl	$3, %eax
.LBE4936:
.LBE4935:
	.loc 20 35 0
	leal	1(%eax), %ebx
	.loc 20 38 0
	cmpl	$2, %eax
	.loc 20 35 0
	movl	%ebx, 16(%ecx)
	.loc 20 38 0
	je	.L1156
	cmpl	$3, %eax
	je	.L1157
	cmpl	$1, %eax
	jne	.L1175
.LVL1283:
.LBB4937:
.LBB4938:
	.loc 27 2400 0
	andl	$252, %edx
.LVL1284:
.LBE4938:
.LBE4937:
	.loc 20 45 0
	movb	$5, %al
.LBB4940:
.LBB4939:
	.loc 27 2400 0
	shrl	$2, %edx
	movl	%edx, 20(%ecx)
	jmp	.L1159
.LVL1285:
	.p2align 4,,7
	.p2align 3
.L1144:
.LBE4939:
.LBE4940:
.LBE4934:
.LBE4933:
	.loc 20 140 0
	movl	$__func__.5786, 12(%esp)
	movl	$140, 8(%esp)
	movl	$.LC86, 4(%esp)
	movl	$.LC65, (%esp)
	call	_fail
.LVL1286:
	.p2align 4,,7
	.p2align 3
.L1145:
.LBB4966:
.LBB4967:
	.loc 13 21 0
	movl	44(%eax), %edx
	movl	%edx, 20(%ebx)
.LVL1287:
.LBE4967:
.LBE4966:
.LBB4968:
.LBB4969:
	.loc 27 2009 0
	movl	604(%eax), %edx
.LVL1288:
	movl	608(%eax), %esi
.LVL1289:
	andl	$7, %edx
	cmpl	$2, %edx
	jne	.L1182
.LVL1290:
.LBE4969:
.LBE4968:
	.loc 20 88 0
	testl	%ecx, %ecx
.LBB4971:
.LBB4972:
	.loc 13 21 0
	movl	%esi, 24(%ebx)
.LVL1291:
.LBE4972:
.LBE4971:
	.loc 20 88 0
	je	.L1151
	.loc 20 92 0
	movl	604(%eax), %edx
.LVL1292:
.LBB4973:
.LBB4974:
	.loc 27 2025 0
	movl	%edx, %ebx
.LVL1293:
	andl	$7, %ebx
	cmpl	$2, %ebx
	jne	.L1183
	.loc 27 2028 0
	andl	$524288, %edx
.LVL1294:
	shrl	$19, %edx
	movl	%edx, 12(%ecx)
.LVL1295:
.LBE4974:
.LBE4973:
	.loc 20 93 0
	movl	604(%eax), %eax
.LVL1296:
.LBB4976:
.LBB4977:
	.loc 27 2017 0
	movl	%eax, %edx
	andl	$7, %edx
	cmpl	$2, %edx
	jne	.L1184
	.loc 27 2020 0
	shrl	$27, %eax
.LVL1297:
	movl	%eax, 16(%ecx)
.LVL1298:
.L1175:
.LBE4977:
.LBE4976:
	.loc 20 142 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 20 94 0
	movl	$4, %eax
	.loc 20 142 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1299:
.L1180:
	.cfi_restore_state
.LBB4979:
.LBB4927:
	call	fault_cap_fault_get_address.part.138
.LVL1300:
.L1182:
.LBE4927:
.LBE4979:
.LBB4980:
.LBB4970:
	call	fault_vm_fault_get_address.part.147
.LVL1301:
	.p2align 4,,7
	.p2align 3
.L1157:
.LBE4970:
.LBE4980:
.LBB4981:
.LBB4965:
.LBB4941:
.LBB4942:
	.loc 27 2479 0
	movl	%edx, %eax
.LBE4942:
.LBE4941:
.LBB4945:
.LBB4946:
	.loc 27 2487 0
	andl	$252, %edx
.LVL1302:
.LBE4946:
.LBE4945:
.LBB4949:
.LBB4943:
	.loc 27 2479 0
	andl	$16128, %eax
.LVL1303:
	shrl	$8, %eax
.LBE4943:
.LBE4949:
.LBB4950:
.LBB4947:
	.loc 27 2487 0
	shrl	$2, %edx
.LBE4947:
.LBE4950:
.LBB4951:
.LBB4944:
	.loc 27 2479 0
	movl	%eax, 20(%ecx)
.LVL1304:
.LBE4944:
.LBE4951:
	.loc 20 61 0
	movl	$7, %eax
	.loc 20 57 0
	movl	%esi, 24(%ecx)
.LBB4952:
.LBB4948:
	.loc 27 2487 0
	movl	%edx, 28(%ecx)
	jmp	.L1159
.LVL1305:
	.p2align 4,,7
	.p2align 3
.L1156:
.LBE4948:
.LBE4952:
.LBB4953:
.LBB4954:
	.loc 27 2439 0
	movl	%edx, %eax
.LBE4954:
.LBE4953:
.LBB4957:
.LBB4958:
	.loc 27 2431 0
	andl	$16128, %edx
.LVL1306:
.LBE4958:
.LBE4957:
.LBB4961:
.LBB4955:
	.loc 27 2439 0
	andl	$252, %eax
.LVL1307:
	shrl	$2, %eax
.LBE4955:
.LBE4961:
.LBB4962:
.LBB4959:
	.loc 27 2431 0
	shrl	$8, %edx
.LBE4959:
.LBE4962:
.LBB4963:
.LBB4956:
	.loc 27 2439 0
	movl	%eax, 20(%ecx)
.LBE4956:
.LBE4963:
	.loc 20 52 0
	movl	$6, %eax
.LBB4964:
.LBB4960:
	.loc 27 2431 0
	movl	%edx, 24(%ecx)
	jmp	.L1159
.LVL1308:
.L1181:
.LBE4960:
.LBE4964:
.LBE4965:
.LBE4981:
.LBB4982:
.LBB4932:
	call	fault_cap_fault_get_inReceivePhase.isra.139.part.140
.LVL1309:
.L1184:
.LBE4932:
.LBE4982:
.LBB4983:
.LBB4978:
	call	fault_vm_fault_get_FSR.isra.150.part.151
.LVL1310:
.L1183:
.LBE4978:
.LBE4983:
.LBB4984:
.LBB4975:
	.p2align 4,,5
	call	fault_vm_fault_get_instructionFault.isra.148.part.149
.LVL1311:
.L1178:
.LBE4975:
.LBE4984:
.LBB4985:
.LBB4893:
.LBB4892:
	.p2align 4,,5
	call	fault_user_exception_get_code.isra.154.part.155
.LVL1312:
.L1177:
.LBE4892:
.LBE4893:
.LBB4894:
.LBB4889:
	.p2align 4,,5
	call	fault_user_exception_get_number.part.153
.LVL1313:
.L1179:
.LBE4889:
.LBE4894:
.LBE4985:
.LBB4986:
.LBB4920:
.LBB4919:
	.p2align 4,,5
	call	fault_unknown_syscall_get_syscallNumber.part.152
.LVL1314:
.LBE4919:
.LBE4920:
.LBE4986:
	.cfi_endproc
.LFE424:
	.size	setMRs_fault, .-setMRs_fault
	.section	.rodata.str1.4
	.align 4
.LC87:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/kernel/boot.c"
	.section	.rodata.str1.1
.LC88:
	.string	"reg.start <= reg.end"
	.section	.boot.text
	.type	insert_region.part.156, @function
insert_region.part.156:
.LFB796:
	.loc 21 28 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 21 32 0
	movl	$__FUNCTION__.5832, 12(%esp)
	movl	$32, 8(%esp)
	movl	$.LC87, 4(%esp)
	movl	$.LC88, (%esp)
	call	_assert_fail
.LVL1315:
	.cfi_endproc
.LFE796:
	.size	insert_region.part.156, .-insert_region.part.156
	.p2align 4,,15
	.globl	insert_region
	.type	insert_region, @function
insert_region:
.LFB430:
	.loc 21 29 0
	.cfi_startproc
.LVL1316:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 21 29 0
	movl	16(%esp), %ecx
.LVL1317:
	movl	20(%esp), %edx
.LVL1318:
	.loc 21 32 0
	cmpl	%ecx, %edx
	jb	.L1195
.LVL1319:
	.loc 21 33 0
	je	.L1191
.LVL1320:
	.loc 21 37 0 discriminator 1
	movl	ndks_boot, %eax
	cmpl	%eax, ndks_boot+4
	je	.L1192
.LVL1321:
	.loc 21 37 0 is_stmt 0
	movl	ndks_boot+8, %ebx
	.loc 21 42 0 is_stmt 1
	xorl	%eax, %eax
	.loc 21 37 0
	cmpl	%ebx, ndks_boot+12
	je	.L1196
.LVL1322:
.L1189:
	.loc 21 43 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1191:
	.cfi_restore_state
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.loc 21 34 0
	movl	$1, %eax
	.loc 21 43 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL1323:
	.p2align 4,,7
	.p2align 3
.L1192:
	.cfi_restore_state
	.loc 21 37 0
	movl	$ndks_boot, %eax
.LVL1324:
.L1190:
	.loc 21 38 0
	movl	%ecx, (%eax)
	movl	%edx, 4(%eax)
	.loc 21 39 0
	movl	$1, %eax
	jmp	.L1189
.LVL1325:
	.p2align 4,,7
	.p2align 3
.L1196:
	.loc 21 37 0
	movl	$ndks_boot+8, %eax
	jmp	.L1190
.LVL1326:
.L1195:
	call	insert_region.part.156
.LVL1327:
	.cfi_endproc
.LFE430:
	.size	insert_region, .-insert_region
	.section	.rodata.str1.1
.LC89:
	.string	"((~0x2 >> 1) & v) == 0"
	.section	.text.unlikely
	.type	mdb_node_ptr_set_mdbRevocable.isra.157.part.158, @function
mdb_node_ptr_set_mdbRevocable.isra.157.part.158:
.LFB798:
	.loc 27 793 0
	.cfi_startproc
.LVL1328:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 795 0
	movl	$__FUNCTION__.1475, 12(%esp)
	movl	$795, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC89, (%esp)
	call	_assert_fail
.LVL1329:
	.cfi_endproc
.LFE798:
	.size	mdb_node_ptr_set_mdbRevocable.isra.157.part.158, .-mdb_node_ptr_set_mdbRevocable.isra.157.part.158
	.section	.rodata.str1.1
.LC90:
	.string	"((~0x1 >> 0) & v) == 0"
	.section	.text.unlikely
	.type	mdb_node_ptr_set_mdbFirstBadged.isra.159.part.160, @function
mdb_node_ptr_set_mdbFirstBadged.isra.159.part.160:
.LFB800:
	.loc 27 815 0
	.cfi_startproc
.LVL1330:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 817 0
	movl	$__FUNCTION__.1488, 12(%esp)
	movl	$817, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC90, (%esp)
	call	_assert_fail
.LVL1331:
	.cfi_endproc
.LFE800:
	.size	mdb_node_ptr_set_mdbFirstBadged.isra.159.part.160, .-mdb_node_ptr_set_mdbFirstBadged.isra.159.part.160
	.section	.rodata.str1.1
.LC91:
	.string	"(capCNodeRadix & ~0x1f) == 0"
	.section	.text.unlikely
	.type	cap_cnode_cap_new.part.161, @function
cap_cnode_cap_new.part.161:
.LFB801:
	.loc 27 1252 0
	.cfi_startproc
.LVL1332:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1259 0
	movl	$__FUNCTION__.1679, 12(%esp)
	movl	$1259, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC91, (%esp)
	call	_assert_fail
.LVL1333:
	.cfi_endproc
.LFE801:
	.size	cap_cnode_cap_new.part.161, .-cap_cnode_cap_new.part.161
	.section	.rodata.str1.4
	.align 4
.LC92:
	.string	"(capTCBPtr & ~0xfffffff0) == 0"
	.section	.text.unlikely
	.type	cap_thread_cap_new.part.162, @function
cap_thread_cap_new.part.162:
.LFB802:
	.loc 27 1339 0
	.cfi_startproc
.LVL1334:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1346 0
	movl	$__FUNCTION__.1710, 12(%esp)
	movl	$1346, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC92, (%esp)
	call	_assert_fail
.LVL1335:
	.cfi_endproc
.LFE802:
	.size	cap_thread_cap_new.part.162, .-cap_thread_cap_new.part.162
	.section	.rodata.str1.4
	.align 4
.LC93:
	.string	"(capFreeIndex & ~0x7ffffff) == 0"
	.section	.text.unlikely
	.type	cap_untyped_cap_new.part.163, @function
cap_untyped_cap_new.part.163:
.LFB803:
	.loc 27 900 0
	.cfi_startproc
.LVL1336:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 907 0
	movl	$__FUNCTION__.1542, 12(%esp)
	movl	$907, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC93, (%esp)
	call	_assert_fail
.LVL1337:
	.cfi_endproc
.LFE803:
	.size	cap_untyped_cap_new.part.163, .-cap_untyped_cap_new.part.163
	.section	.rodata.str1.1
.LC94:
	.string	"(bitsFound & ~0x3f) == 0"
	.section	.text.unlikely
	.type	lookup_fault_depth_mismatch_new, @function
lookup_fault_depth_mismatch_new:
.LFB200:
	.loc 27 2404 0
	.cfi_startproc
.LVL1338:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 2411 0
	testl	$-64, %edx
	je	.L1208
.LVL1339:
.LBB4989:
.LBB4990:
	movl	$__FUNCTION__.2106, 12(%esp)
	movl	$2411, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC94, (%esp)
	call	_assert_fail
.LVL1340:
.L1208:
.LBE4990:
.LBE4989:
	.loc 27 2413 0
	sall	$8, %edx
.LVL1341:
	.loc 27 2415 0
	testl	$-64, %ecx
	je	.L1209
	.loc 27 2415 0 is_stmt 0 discriminator 1
	movl	$__FUNCTION__.2106, 12(%esp)
	movl	$2415, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC38, (%esp)
	call	_assert_fail
.LVL1342:
.L1209:
	.loc 27 2417 0 is_stmt 1
	leal	2(,%ecx,4), %ecx
.LVL1343:
	.loc 27 2421 0
	orl	%edx, %ecx
	movl	%ecx, (%eax)
	.loc 27 2423 0
	movl	$0, 4(%eax)
	.loc 27 2424 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE200:
	.size	lookup_fault_depth_mismatch_new, .-lookup_fault_depth_mismatch_new
	.section	.rodata.str1.4
	.align 4
.LC95:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/kernel/cspace.c"
	.section	.rodata.str1.1
.LC96:
	.string	"levelBits != 0"
	.text
	.p2align 4,,15
	.globl	resolveAddressBits
	.type	resolveAddressBits, @function
resolveAddressBits:
.LFB458:
	.file 42 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/kernel/cspace.c"
	.loc 42 140 0
	.cfi_startproc
.LVL1344:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	68(%esp), %edx
.LVL1345:
	movl	72(%esp), %ecx
.LVL1346:
.LBB5005:
.LBB5006:
	.loc 27 872 0
	movl	%edx, %esi
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %ebx
.LVL1347:
	cmpl	$14, %esi
	cmove	%ebx, %eax
.LVL1348:
.LBE5006:
.LBE5005:
	.loc 42 149 0
	cmpl	$10, %eax
	jne	.L1230
	movl	80(%esp), %esi
	movl	%edx, %eax
	.loc 42 168 0
	movl	%edx, 24(%esp)
.LVL1349:
.L1226:
.LBB5007:
.LBB5008:
	.loc 27 1284 0
	andl	$15, %eax
	cmpl	$10, %eax
	jne	.L1231
.LBE5008:
.LBE5007:
.LBB5013:
.LBB5014:
	.loc 27 1295 0
	movl	%ecx, %eax
.LBE5014:
.LBE5013:
.LBB5017:
.LBB5009:
	.loc 27 1287 0
	movl	%ecx, %edx
.LBE5009:
.LBE5017:
.LBB5018:
.LBB5015:
	.loc 27 1295 0
	andl	$8126464, %eax
.LBE5015:
.LBE5018:
.LBB5019:
.LBB5010:
	.loc 27 1287 0
	andl	$260046848, %edx
.LBE5010:
.LBE5019:
.LBB5020:
.LBB5016:
	.loc 27 1295 0
	shrl	$18, %eax
.LBE5016:
.LBE5020:
.LBB5021:
.LBB5011:
	.loc 27 1287 0
	shrl	$23, %edx
.LVL1350:
.LBE5011:
.LBE5021:
	.loc 42 161 0
	movl	%eax, %edi
	addl	%edx, %edi
.LVL1351:
	je	.L1232
.LVL1352:
	.loc 42 168 0
	movl	%esi, %ebx
.LVL1353:
.LBB5022:
.LBB5023:
	.loc 27 1315 0
	andl	$262143, %ecx
.LVL1354:
.LBE5023:
.LBE5022:
	.loc 42 168 0
	subl	%eax, %ebx
	movl	$1, %ebp
.LBB5025:
.LBB5024:
	.loc 27 1315 0
	movl	%ecx, 28(%esp)
.LBE5024:
.LBE5025:
	.loc 42 168 0
	movl	%ebx, %ecx
	movl	76(%esp), %ebx
	shrl	%cl, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebp
	movl	%ebp, %ecx
	subl	$1, %ecx
	andl	%ecx, %ebx
	.loc 42 169 0
	cmpl	28(%esp), %ebx
	jne	.L1227
	cmpl	%eax, %esi
	jb	.L1227
	.loc 42 176 0
	cmpl	%edi, %esi
	jb	.L1233
	.loc 42 183 0
	movl	76(%esp), %eax
.LVL1355:
	movl	%esi, %ebx
	movl	$1, %ebp
	subl	%edi, %ebx
.LVL1356:
	movl	%ebx, %ecx
	shrl	%cl, %eax
	movl	%edx, %ecx
	sall	%cl, %ebp
	movl	%ebp, %edx
.LVL1357:
	subl	$1, %edx
	andl	%edx, %eax
.LBB5026:
.LBB5027:
	.loc 27 1335 0
	movl	24(%esp), %edx
.LBE5027:
.LBE5026:
	.loc 42 184 0
	sall	$4, %eax
.LBB5029:
.LBB5028:
	.loc 27 1335 0
	andl	$2147483632, %edx
.LBE5028:
.LBE5029:
	.loc 42 186 0
	cmpl	%edi, %esi
	.loc 42 184 0
	leal	(%eax,%edx,2), %eax
.LVL1358:
	.loc 42 186 0
	ja	.L1222
.LVL1359:
	.loc 42 190 0
	movl	64(%esp), %edi
.LVL1360:
	movl	%eax, 4(%edi)
	movl	%edi, %eax
.LVL1361:
	movl	$0, (%edi)
	movl	$0, 8(%edi)
.LVL1362:
.L1211:
	.loc 42 206 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1363:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1364:
.L1230:
	.cfi_restore_state
	.loc 42 150 0
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL1365:
.L1229:
	.loc 42 180 0
	movl	64(%esp), %eax
	movl	80(%esp), %edi
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	movl	%edi, 8(%eax)
	jmp	.L1211
.LVL1366:
.L1222:
	.loc 42 194 0
	movl	(%eax), %edi
.LVL1367:
	movl	4(%eax), %ecx
.LBB5030:
.LBB5031:
	.loc 27 872 0
	movl	%edi, %edx
	andl	$14, %edx
	cmpl	$14, %edx
.LBE5031:
.LBE5030:
	.loc 42 194 0
	movl	%edi, 24(%esp)
.LVL1368:
.LBB5034:
.LBB5032:
	.loc 27 872 0
	je	.L1223
	.loc 27 873 0
	movl	%edi, %edx
	andl	$15, %edx
.L1224:
.LBE5032:
.LBE5034:
	.loc 42 196 0
	cmpl	$10, %edx
	jne	.L1225
	.loc 42 183 0
	movl	%ebx, %esi
	movl	24(%esp), %eax
.LVL1369:
	jmp	.L1226
.LVL1370:
.L1233:
	.loc 42 177 0
	movl	%esi, %ecx
	movl	%edi, %edx
	movl	$current_lookup_fault, %eax
.LVL1371:
	call	lookup_fault_depth_mismatch_new
.LVL1372:
	jmp	.L1229
.LVL1373:
.L1227:
.LBB5035:
.LBB5036:
	.loc 27 2451 0
	testl	$-64, %esi
	jne	.L1234
.LVL1374:
	.loc 27 2457 0
	sall	$2, %eax
.LVL1375:
	.loc 27 2453 0
	sall	$8, %esi
.LVL1376:
	.loc 27 2457 0
	orl	%eax, %esi
.LBE5036:
.LBE5035:
	.loc 42 170 0
	movl	28(%esp), %eax
.LBB5039:
.LBB5037:
	.loc 27 2461 0
	orl	$3, %esi
.LVL1377:
	movl	%esi, current_lookup_fault
.LBE5037:
.LBE5039:
	.loc 42 170 0
	movl	%eax, current_lookup_fault+4
.LVL1378:
	jmp	.L1229
.LVL1379:
.L1232:
	.loc 42 161 0 discriminator 1
	movl	$__FUNCTION__.6045, 12(%esp)
	movl	$161, 8(%esp)
	movl	$.LC95, 4(%esp)
	movl	$.LC96, (%esp)
	call	_assert_fail
.LVL1380:
.L1231:
.LBB5040:
.LBB5012:
	call	cap_cnode_cap_get_capCNodeRadix.part.60
.LVL1381:
.L1223:
.LBE5012:
.LBE5040:
.LBB5041:
.LBB5033:
	.loc 27 874 0
	movzbl	24(%esp), %edx
	jmp	.L1224
.LVL1382:
.L1234:
.LBE5033:
.LBE5041:
.LBB5042:
.LBB5038:
	.loc 27 2451 0
	movl	$__FUNCTION__.2121, 12(%esp)
	movl	$2451, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC38, (%esp)
	call	_assert_fail
.LVL1383:
.L1225:
.LBE5038:
.LBE5042:
	.loc 42 200 0
	movl	64(%esp), %edi
.LVL1384:
	movl	%eax, 4(%edi)
	movl	%edi, %eax
.LVL1385:
	movl	%ebx, 8(%eax)
	movl	%edi, %eax
	movl	$0, (%edi)
	jmp	.L1211
	.cfi_endproc
.LFE458:
	.size	resolveAddressBits, .-resolveAddressBits
	.p2align 4,,15
	.globl	lookupSlot
	.type	lookupSlot, @function
lookupSlot:
.LFB453:
	.loc 42 59 0
	.cfi_startproc
.LVL1386:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 42 59 0
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	.loc 42 64 0
	andl	$-1024, %eax
	movl	4(%eax), %edx
.LVL1387:
	movl	(%eax), %eax
	.loc 42 65 0
	movl	$32, 16(%esp)
	.loc 42 64 0
	movl	%edx, %edi
	.loc 42 65 0
	movl	16(%ebp), %edx
	.loc 42 64 0
	movl	%eax, %esi
	.loc 42 65 0
	leal	-36(%ebp), %eax
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
.LVL1388:
	movl	%eax, (%esp)
	movl	%edx, 12(%esp)
	call	resolveAddressBits
.LVL1389:
	.loc 42 69 0
	movl	-36(%ebp), %eax
	movl	%eax, (%ebx)
	movl	-32(%ebp), %eax
	.loc 42 65 0
	subl	$4, %esp
.LVL1390:
	.loc 42 69 0
	movl	%eax, 4(%ebx)
	.loc 42 70 0
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
.LVL1391:
	popl	%ebx
	.cfi_restore 3
.LVL1392:
	popl	%esi
	.cfi_restore 6
.LVL1393:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE453:
	.size	lookupSlot, .-lookupSlot
	.p2align 4,,15
	.globl	lookupSlotForCNodeOp
	.type	lookupSlotForCNodeOp, @function
lookupSlotForCNodeOp:
.LFB454:
	.loc 42 75 0
	.cfi_startproc
.LVL1394:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 42 75 0
	movl	16(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	20(%ebp), %edi
.LVL1395:
.LBB5043:
.LBB5044:
	.loc 27 872 0
	movl	%eax, %esi
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %ecx
.LVL1396:
	cmpl	$14, %esi
	cmove	%ecx, %edx
.LVL1397:
.LBE5044:
.LBE5043:
	.loc 42 81 0
	cmpl	$10, %edx
	jne	.L1246
	.loc 42 89 0
	movl	28(%ebp), %esi
	leal	-1(%esi), %edx
	cmpl	$31, %edx
	ja	.L1247
	.loc 42 97 0
	movl	24(%ebp), %ecx
.LVL1398:
	leal	-36(%ebp), %edx
	movl	%eax, 4(%esp)
.LVL1399:
	movl	%esi, 16(%esp)
	movl	%edi, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%edx, (%esp)
	call	resolveAddressBits
.LVL1400:
	.loc 42 98 0
	movl	-36(%ebp), %eax
	.loc 42 97 0
	movl	-28(%ebp), %ecx
.LVL1401:
	subl	$4, %esp
	.loc 42 98 0
	testl	%eax, %eax
	jne	.L1248
	.loc 42 106 0
	testl	%ecx, %ecx
	jne	.L1249
.LVL1402:
	.loc 42 117 0
	movl	-32(%ebp), %eax
	movl	$0, (%ebx)
	movl	%eax, 4(%ebx)
.LVL1403:
.L1237:
	.loc 42 118 0
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
.LVL1404:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
.LVL1405:
.L1246:
	.cfi_restore_state
	.loc 42 83 0
	movl	12(%ebp), %eax
.LVL1406:
	.loc 42 82 0
	movl	$6, current_syscall_error+24
	.loc 42 84 0
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
	.loc 42 83 0
	movl	%eax, current_syscall_error+20
.LVL1407:
	.loc 42 86 0
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	jmp	.L1237
.LVL1408:
.L1249:
	.loc 42 108 0
	movl	12(%ebp), %eax
	.loc 42 109 0
	xorl	%edx, %edx
	.loc 42 107 0
	movl	$6, current_syscall_error+24
	.loc 42 108 0
	movl	%eax, current_syscall_error+20
	.loc 42 109 0
	movl	$current_lookup_fault, %eax
	call	lookup_fault_depth_mismatch_new
.LVL1409:
	.loc 42 112 0
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	jmp	.L1237
.LVL1410:
.L1248:
	.loc 42 100 0
	movl	12(%ebp), %eax
	.loc 42 99 0
	movl	$6, current_syscall_error+24
	.loc 42 103 0
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	.loc 42 100 0
	movl	%eax, current_syscall_error+20
.LVL1411:
	.loc 42 103 0
	jmp	.L1237
.LVL1412:
.L1247:
	.loc 42 90 0
	movl	$4, current_syscall_error+24
	.loc 42 91 0
	movl	$1, current_syscall_error+8
	.loc 42 92 0
	movl	$32, current_syscall_error+12
.LVL1413:
	.loc 42 94 0
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	jmp	.L1237
	.cfi_endproc
.LFE454:
	.size	lookupSlotForCNodeOp, .-lookupSlotForCNodeOp
	.p2align 4,,15
	.globl	lookupSourceSlot
	.type	lookupSourceSlot, @function
lookupSourceSlot:
.LFB455:
	.loc 42 122 0
	.cfi_startproc
.LVL1414:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 42 123 0
	movl	24(%ebp), %eax
	.loc 42 122 0
	movl	8(%ebp), %ebx
	.loc 42 123 0
	movl	16(%ebp), %edx
	movl	$1, 4(%esp)
	movl	%eax, 20(%esp)
	movl	20(%ebp), %eax
	movl	%ebx, (%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	call	lookupSlotForCNodeOp
.LVL1415:
	.loc 42 124 0
	movl	%ebx, %eax
	movl	-4(%ebp), %ebx
	.loc 42 123 0
	subl	$4, %esp
	.loc 42 124 0
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE455:
	.size	lookupSourceSlot, .-lookupSourceSlot
	.p2align 4,,15
	.globl	lookupTargetSlot
	.type	lookupTargetSlot, @function
lookupTargetSlot:
.LFB456:
	.loc 42 128 0
	.cfi_startproc
.LVL1416:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 42 129 0
	movl	24(%ebp), %eax
	.loc 42 128 0
	movl	8(%ebp), %ebx
	.loc 42 129 0
	movl	16(%ebp), %edx
	movl	$0, 4(%esp)
	movl	%eax, 20(%esp)
	movl	20(%ebp), %eax
	movl	%ebx, (%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	call	lookupSlotForCNodeOp
.LVL1417:
	.loc 42 130 0
	movl	%ebx, %eax
	movl	-4(%ebp), %ebx
	.loc 42 129 0
	subl	$4, %esp
	.loc 42 130 0
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE456:
	.size	lookupTargetSlot, .-lookupTargetSlot
	.p2align 4,,15
	.globl	lookupPivotSlot
	.type	lookupPivotSlot, @function
lookupPivotSlot:
.LFB457:
	.loc 42 134 0
	.cfi_startproc
.LVL1418:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 42 135 0
	movl	24(%ebp), %eax
	.loc 42 134 0
	movl	8(%ebp), %ebx
	.loc 42 135 0
	movl	16(%ebp), %edx
	movl	$1, 4(%esp)
	movl	%eax, 20(%esp)
	movl	20(%ebp), %eax
	movl	%ebx, (%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	call	lookupSlotForCNodeOp
.LVL1419:
	.loc 42 136 0
	movl	%ebx, %eax
	movl	-4(%ebp), %ebx
	.loc 42 135 0
	subl	$4, %esp
	.loc 42 136 0
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE457:
	.size	lookupPivotSlot, .-lookupPivotSlot
	.p2align 4,,15
	.globl	lookupExtraCaps
	.type	lookupExtraCaps, @function
lookupExtraCaps:
.LFB581:
	.loc 30 208 0
	.cfi_startproc
.LVL1420:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 30 213 0
	movl	12(%ebp), %edx
	testl	%edx, %edx
	je	.L1267
.LVL1421:
.LBB5055:
.LBB5056:
	.loc 14 60 0
	movl	16(%ebp), %eax
	andl	$384, %eax
	movl	%eax, -44(%ebp)
	shrl	$7, -44(%ebp)
.LVL1422:
.LBE5056:
.LBE5055:
	.loc 30 220 0
	movl	-44(%ebp), %eax
	testl	%eax, %eax
	je	.L1263
	movl	8(%ebp), %esi
	xorl	%ebx, %ebx
	andl	$-1024, %esi
	jmp	.L1262
.LVL1423:
	.p2align 4,,7
	.p2align 3
.L1260:
	.loc 30 229 0
	movl	%edx, current_extra_caps(,%ebx,4)
	.loc 30 220 0
	addl	$1, %ebx
.LVL1424:
	cmpl	-44(%ebp), %ebx
	je	.L1268
.LVL1425:
.L1262:
.LBB5057:
.LBB5058:
	.loc 30 164 0
	movl	12(%ebp), %eax
.LBE5058:
.LBE5057:
.LBB5060:
.LBB5061:
	.loc 42 64 0
	movl	4(%esi), %edx
.LVL1426:
.LBE5061:
.LBE5060:
.LBB5063:
.LBB5059:
	.loc 30 164 0
	movl	488(%eax,%ebx,4), %edi
.LVL1427:
.LBE5059:
.LBE5063:
.LBB5064:
.LBB5062:
	.loc 42 64 0
	movl	(%esi), %eax
	.loc 42 65 0
	movl	%edx, 8(%esp)
.LVL1428:
	movl	$32, 16(%esp)
	movl	%edi, 12(%esp)
	movl	%eax, 4(%esp)
.LVL1429:
	leal	-36(%ebp), %eax
.LVL1430:
	movl	%eax, (%esp)
	call	resolveAddressBits
.LVL1431:
	.loc 42 67 0
	movl	-36(%ebp), %eax
.LVL1432:
	.loc 42 68 0
	movl	-32(%ebp), %edx
.LVL1433:
	.loc 42 65 0
	subl	$4, %esp
.LBE5062:
.LBE5064:
	.loc 30 224 0
	testl	%eax, %eax
	je	.L1260
.LVL1434:
	.loc 30 225 0
	movl	$1, current_fault
	movl	%edi, current_fault+4
.LVL1435:
.L1258:
	.loc 30 236 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL1436:
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
.LVL1437:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL1438:
	.p2align 4,,7
	.p2align 3
.L1268:
	.cfi_restore_state
	.loc 30 235 0
	xorl	%eax, %eax
.LVL1439:
	.loc 30 231 0
	cmpl	$3, %ebx
	je	.L1258
.LVL1440:
.L1259:
	.loc 30 232 0
	movl	$0, current_extra_caps(,%ebx,4)
	.loc 30 236 0
	leal	-12(%ebp), %esp
	.loc 30 235 0
	xorl	%eax, %eax
	.loc 30 236 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.p2align 4,,7
	.p2align 3
.L1267:
	.cfi_restore_state
	.loc 30 214 0
	movl	$0, current_extra_caps
	.loc 30 236 0
	leal	-12(%ebp), %esp
	.loc 30 215 0
	xorl	%eax, %eax
	.loc 30 236 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL1441:
.L1263:
	.cfi_restore_state
	.loc 30 220 0
	xorl	%ebx, %ebx
	jmp	.L1259
	.cfi_endproc
.LFE581:
	.size	lookupExtraCaps, .-lookupExtraCaps
	.p2align 4,,15
	.globl	lookupCap
	.type	lookupCap, @function
lookupCap:
.LFB451:
	.loc 42 21 0
	.cfi_startproc
.LVL1442:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 42 21 0
	movl	12(%ebp), %eax
.LVL1443:
	movl	8(%ebp), %ebx
.LBB5067:
.LBB5068:
	.loc 42 64 0
	andl	$-1024, %eax
.LVL1444:
	movl	4(%eax), %edx
.LVL1445:
	movl	(%eax), %eax
	.loc 42 65 0
	movl	$32, 16(%esp)
	.loc 42 64 0
	movl	%edx, %edi
	.loc 42 65 0
	movl	16(%ebp), %edx
	.loc 42 64 0
	movl	%eax, %esi
	.loc 42 65 0
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
.LVL1446:
	call	resolveAddressBits
.LVL1447:
	.loc 42 67 0
	movl	-36(%ebp), %edx
.LVL1448:
	.loc 42 68 0
	movl	-32(%ebp), %eax
.LVL1449:
	.loc 42 65 0
	subl	$4, %esp
.LBE5068:
.LBE5067:
	.loc 42 26 0
	testl	%edx, %edx
	jne	.L1273
.LVL1450:
	.loc 42 33 0
	movl	(%eax), %edx
.LVL1451:
	movl	4(%eax), %eax
.LVL1452:
	.loc 42 34 0
	movl	$0, (%ebx)
	movl	%edx, 4(%ebx)
	movl	%eax, 8(%ebx)
.LVL1453:
.L1269:
	.loc 42 35 0
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
.LVL1454:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
.LVL1455:
.L1273:
	.cfi_restore_state
	.loc 42 29 0
	movl	%edx, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	jmp	.L1269
	.cfi_endproc
.LFE451:
	.size	lookupCap, .-lookupCap
	.p2align 4,,15
	.globl	lookupCapAndSlot
	.type	lookupCapAndSlot, @function
lookupCapAndSlot:
.LFB452:
	.loc 42 39 0
	.cfi_startproc
.LVL1456:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 42 39 0
	movl	12(%ebp), %eax
.LVL1457:
	movl	8(%ebp), %ebx
.LBB5071:
.LBB5072:
	.loc 42 64 0
	andl	$-1024, %eax
.LVL1458:
	movl	4(%eax), %edx
.LVL1459:
	movl	(%eax), %eax
	.loc 42 65 0
	movl	$32, 16(%esp)
	.loc 42 64 0
	movl	%edx, %edi
	.loc 42 65 0
	movl	16(%ebp), %edx
	.loc 42 64 0
	movl	%eax, %esi
	.loc 42 65 0
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
.LVL1460:
	call	resolveAddressBits
.LVL1461:
	.loc 42 67 0
	movl	-36(%ebp), %edx
.LVL1462:
	.loc 42 68 0
	movl	-32(%ebp), %eax
.LVL1463:
	.loc 42 65 0
	subl	$4, %esp
.LBE5072:
.LBE5071:
	.loc 42 44 0
	testl	%edx, %edx
	jne	.L1278
.LVL1464:
	.loc 42 53 0
	movl	(%eax), %ecx
.LVL1465:
	movl	4(%eax), %edx
.LVL1466:
	.loc 42 54 0
	movl	$0, (%ebx)
	movl	%eax, 12(%ebx)
	movl	%ecx, 4(%ebx)
	movl	%edx, 8(%ebx)
.LVL1467:
.L1274:
	.loc 42 55 0
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
.LVL1468:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
.LVL1469:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
.LVL1470:
.L1278:
	.cfi_restore_state
	.loc 42 48 0
	movl	%edx, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	jmp	.L1274
	.cfi_endproc
.LFE452:
	.size	lookupCapAndSlot, .-lookupCapAndSlot
	.p2align 4,,15
	.globl	getReceiveSlots
	.type	getReceiveSlots, @function
getReceiveSlots:
.LFB533:
	.loc 26 951 0
	.cfi_startproc
.LVL1471:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 26 951 0
	movl	12(%ebp), %eax
	.loc 26 959 0
	testl	%eax, %eax
	je	.L1287
.LVL1472:
.LBB5085:
.LBB5086:
.LBB5087:
.LBB5088:
	.loc 28 64 0
	movl	500(%eax), %ecx
.LVL1473:
.LBE5088:
.LBE5087:
.LBE5086:
.LBE5085:
.LBB5092:
.LBB5093:
.LBB5094:
.LBB5095:
	.loc 42 65 0
	leal	-36(%ebp), %edi
.LBE5095:
.LBE5094:
.LBE5093:
.LBE5092:
.LBB5101:
.LBB5091:
.LBB5090:
.LBB5089:
	.loc 28 65 0
	movl	504(%eax), %ebx
.LVL1474:
	.loc 28 66 0
	movl	508(%eax), %esi
.LVL1475:
.LBE5089:
.LBE5090:
.LBE5091:
.LBE5101:
.LBB5102:
.LBB5100:
.LBB5098:
.LBB5096:
	.loc 42 64 0
	movl	8(%ebp), %eax
.LVL1476:
	andl	$-1024, %eax
	movl	4(%eax), %edx
.LVL1477:
	movl	(%eax), %eax
	.loc 42 65 0
	movl	%ecx, 12(%esp)
	movl	$32, 16(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
.LVL1478:
	movl	%edi, (%esp)
	call	resolveAddressBits
.LVL1479:
.LBE5096:
.LBE5098:
	.loc 42 26 0
	movl	-36(%ebp), %ecx
.LBB5099:
.LBB5097:
	.loc 42 68 0
	movl	-32(%ebp), %eax
	.loc 42 65 0
	subl	$4, %esp
.LVL1480:
.LBE5097:
.LBE5099:
	.loc 42 26 0
	testl	%ecx, %ecx
	jne	.L1287
.LVL1481:
	.loc 42 33 0
	movl	4(%eax), %edx
.LVL1482:
	movl	(%eax), %ecx
.LVL1483:
.LBE5100:
.LBE5102:
.LBB5103:
.LBB5104:
	.loc 42 129 0
	leal	-48(%ebp), %eax
.LVL1484:
	movl	%eax, (%esp)
	movl	%esi, 20(%esp)
	movl	%edx, 12(%esp)
	movl	%ebx, 16(%esp)
	movl	%ecx, 8(%esp)
	movl	$0, 4(%esp)
	call	lookupSlotForCNodeOp
.LVL1485:
.LBE5104:
.LBE5103:
	.loc 26 973 0
	movl	-48(%ebp), %edx
.LBB5106:
.LBB5105:
	.loc 42 129 0
	movl	-44(%ebp), %eax
.LVL1486:
	subl	$4, %esp
.LBE5105:
.LBE5106:
	.loc 26 973 0
	testl	%edx, %edx
	jne	.L1287
.LVL1487:
	.loc 26 978 0
	movl	(%eax), %ecx
.LVL1488:
.LBB5107:
.LBB5108:
	.loc 27 872 0
	movl	%ecx, %ebx
.LVL1489:
	.loc 27 873 0
	movl	%ecx, %edx
	.loc 27 872 0
	andl	$14, %ebx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%cl, %ecx
.LVL1490:
	cmpl	$14, %ebx
	cmove	%ecx, %edx
.LBE5108:
.LBE5107:
	.loc 26 978 0
	testl	%edx, %edx
	jne	.L1287
	.loc 26 983 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
.LVL1491:
	popl	%edi
	.cfi_restore 7
.LVL1492:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL1493:
	.p2align 4,,7
	.p2align 3
.L1287:
	.cfi_restore_state
	leal	-12(%ebp), %esp
	.loc 26 968 0
	xorl	%eax, %eax
	.loc 26 983 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE533:
	.size	getReceiveSlots, .-getReceiveSlots
	.section	.rodata.str1.1
.LC97:
	.string	"((~0xf >> 0) & v) == 0"
	.section	.text.unlikely
	.type	thread_state_ptr_set_tsType.isra.166.part.167, @function
thread_state_ptr_set_tsType.isra.166.part.167:
.LFB807:
	.loc 27 623 0
	.cfi_startproc
.LVL1494:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 625 0
	movl	$__FUNCTION__.1392, 12(%esp)
	movl	$625, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC97, (%esp)
	call	_assert_fail
.LVL1495:
	.cfi_endproc
.LFE807:
	.size	thread_state_ptr_set_tsType.isra.166.part.167, .-thread_state_ptr_set_tsType.isra.166.part.167
	.text
	.p2align 4,,15
	.type	thread_state_ptr_set_tsType.isra.166.constprop.286, @function
thread_state_ptr_set_tsType.isra.166.constprop.286:
.LFB871:
	.loc 27 623 0
	.cfi_startproc
.LVL1496:
	.loc 27 626 0
	movl	(%eax), %edx
	andl	$-16, %edx
	.loc 27 627 0
	orl	$2, %edx
	movl	%edx, (%eax)
	ret
	.cfi_endproc
.LFE871:
	.size	thread_state_ptr_set_tsType.isra.166.constprop.286, .-thread_state_ptr_set_tsType.isra.166.constprop.286
	.section	.rodata.str1.1
.LC98:
	.string	"((~0xfffffff0 << 0) & v) == 0"
	.section	.text.unlikely
	.type	async_endpoint_ptr_set_aepQueue_head.isra.168.part.169, @function
async_endpoint_ptr_set_aepQueue_head.isra.168.part.169:
.LFB809:
	.loc 27 194 0
	.cfi_startproc
.LVL1497:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 196 0
	movl	$__FUNCTION__.1182, 12(%esp)
	movl	$196, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC98, (%esp)
	call	_assert_fail
.LVL1498:
	.cfi_endproc
.LFE809:
	.size	async_endpoint_ptr_set_aepQueue_head.isra.168.part.169, .-async_endpoint_ptr_set_aepQueue_head.isra.168.part.169
	.type	async_endpoint_ptr_set_aepQueue_tail.isra.170.part.171, @function
async_endpoint_ptr_set_aepQueue_tail.isra.170.part.171:
.LFB811:
	.loc 27 207 0
	.cfi_startproc
.LVL1499:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 209 0
	movl	$__FUNCTION__.1190, 12(%esp)
	movl	$209, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC98, (%esp)
	call	_assert_fail
.LVL1500:
	.cfi_endproc
.LFE811:
	.size	async_endpoint_ptr_set_aepQueue_tail.isra.170.part.171, .-async_endpoint_ptr_set_aepQueue_tail.isra.170.part.171
	.section	.rodata.str1.1
.LC99:
	.string	"((~0x3 >> 0) & v) == 0"
	.section	.text.unlikely
	.type	async_endpoint_ptr_set_state.isra.172.part.173, @function
async_endpoint_ptr_set_state.isra.172.part.173:
.LFB813:
	.loc 27 220 0
	.cfi_startproc
.LVL1501:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 222 0
	movl	$__FUNCTION__.1198, 12(%esp)
	movl	$222, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC99, (%esp)
	call	_assert_fail
.LVL1502:
	.cfi_endproc
.LFE813:
	.size	async_endpoint_ptr_set_state.isra.172.part.173, .-async_endpoint_ptr_set_state.isra.172.part.173
	.type	thread_state_ptr_set_blockingIPCEndpoint.isra.174.part.175, @function
thread_state_ptr_set_blockingIPCEndpoint.isra.174.part.175:
.LFB815:
	.loc 27 605 0
	.cfi_startproc
.LVL1503:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 607 0
	movl	$__FUNCTION__.1381, 12(%esp)
	movl	$607, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC98, (%esp)
	call	_assert_fail
.LVL1504:
	.cfi_endproc
.LFE815:
	.size	thread_state_ptr_set_blockingIPCEndpoint.isra.174.part.175, .-thread_state_ptr_set_blockingIPCEndpoint.isra.174.part.175
	.type	cap_async_endpoint_cap_get_capAEPBadge.part.176, @function
cap_async_endpoint_cap_get_capAEPBadge.part.176:
.LFB816:
	.loc 27 1126 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1127 0
	movl	$__FUNCTION__.1624, 12(%esp)
	movl	$1128, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC37, (%esp)
	call	_assert_fail
.LVL1505:
	.cfi_endproc
.LFE816:
	.size	cap_async_endpoint_cap_get_capAEPBadge.part.176, .-cap_async_endpoint_cap_get_capAEPBadge.part.176
	.section	.rodata.str1.4
	.align 4
.LC100:
	.string	"((cap_ptr->words[0] >> 0) & 0xf) == cap_untyped_cap"
	.section	.text.unlikely
	.type	cap_untyped_cap_ptr_set_capFreeIndex.part.177, @function
cap_untyped_cap_ptr_set_capFreeIndex.part.177:
.LFB817:
	.loc 27 935 0
	.cfi_startproc
.LVL1506:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 937 0
	movl	$__FUNCTION__.1551, 12(%esp)
	movl	$938, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC100, (%esp)
	call	_assert_fail
.LVL1507:
	.cfi_endproc
.LFE817:
	.size	cap_untyped_cap_ptr_set_capFreeIndex.part.177, .-cap_untyped_cap_ptr_set_capFreeIndex.part.177
	.section	.rodata.str1.1
.LC101:
	.string	"((~0xfffffff8 << 0) & v) == 0"
	.section	.text.unlikely
	.type	mdb_node_ptr_set_mdbNext.isra.178.part.179, @function
mdb_node_ptr_set_mdbNext.isra.178.part.179:
.LFB819:
	.loc 27 771 0
	.cfi_startproc
.LVL1508:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 773 0
	movl	$__FUNCTION__.1462, 12(%esp)
	movl	$773, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC101, (%esp)
	call	_assert_fail
.LVL1509:
	.cfi_endproc
.LFE819:
	.size	mdb_node_ptr_set_mdbNext.isra.178.part.179, .-mdb_node_ptr_set_mdbNext.isra.178.part.179
	.type	mdb_node_ptr_set_mdbPrev.isra.180.part.181, @function
mdb_node_ptr_set_mdbPrev.isra.180.part.181:
.LFB821:
	.loc 27 837 0
	.cfi_startproc
.LVL1510:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 839 0
	movl	$__FUNCTION__.1501, 12(%esp)
	movl	$839, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC101, (%esp)
	call	_assert_fail
.LVL1511:
	.cfi_endproc
.LFE821:
	.size	mdb_node_ptr_set_mdbPrev.isra.180.part.181, .-mdb_node_ptr_set_mdbPrev.isra.180.part.181
	.section	.rodata.str1.1
.LC102:
	.string	"(mdbPrev & ~0xfffffff8) == 0"
	.text
	.p2align 4,,15
	.globl	insertNewCap
	.type	insertNewCap, @function
insertNewCap:
.LFB526:
	.loc 26 802 0
	.cfi_startproc
.LVL1512:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 26 802 0
	movl	32(%esp), %ebx
	movl	36(%esp), %esi
	.loc 26 806 0
	movl	40(%esp), %eax
	movl	44(%esp), %edx
.LBB5119:
.LBB5120:
	.loc 27 767 0
	movl	12(%ebx), %ecx
.LBE5120:
.LBE5119:
	.loc 26 806 0
	movl	%eax, (%esi)
	movl	%edx, 4(%esi)
.LBB5122:
.LBB5121:
	.loc 27 767 0
	andl	$-8, %ecx
.LVL1513:
.LBE5121:
.LBE5122:
.LBB5123:
.LBB5124:
	.loc 27 756 0
	movl	%ecx, %eax
	orl	$3, %eax
.LVL1514:
	.loc 27 758 0
	testb	$7, %bl
	jne	.L1314
.LVL1515:
	.loc 27 760 0
	movl	%ebx, %edx
	andl	$-8, %edx
.LVL1516:
.LBE5124:
.LBE5123:
	.loc 26 808 0
	testl	%ecx, %ecx
.LBB5127:
.LBB5125:
	.loc 27 760 0
	movl	%edx, 8(%esi)
.LBE5125:
.LBE5127:
	.loc 26 807 0
	movl	%eax, 12(%esi)
	.loc 26 808 0
	je	.L1309
.LVL1517:
.LBB5128:
.LBB5129:
	.loc 27 839 0
	testl	$7, %esi
	jne	.L1315
	.loc 27 840 0
	movl	8(%ecx), %eax
.LVL1518:
	.loc 27 841 0
	andl	$-8, %esi
.LVL1519:
	.loc 27 840 0
	andl	$7, %eax
	.loc 27 841 0
	orl	%esi, %eax
	movl	%eax, 8(%ecx)
.LVL1520:
.L1311:
.LBE5129:
.LBE5128:
.LBB5131:
.LBB5132:
	.loc 27 774 0
	movl	12(%ebx), %eax
	andl	$7, %eax
	.loc 27 775 0
	orl	%esi, %eax
	movl	%eax, 12(%ebx)
.LBE5132:
.LBE5131:
	.loc 26 812 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL1521:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1522:
	.p2align 4,,7
	.p2align 3
.L1309:
	.cfi_restore_state
.LBB5134:
.LBB5133:
	.loc 27 773 0
	testl	$7, %esi
	jne	.L1316
	andl	$-8, %esi
.LVL1523:
	jmp	.L1311
.LVL1524:
.L1316:
	call	mdb_node_ptr_set_mdbNext.isra.178.part.179
.LVL1525:
.L1314:
.LBE5133:
.LBE5134:
.LBB5135:
.LBB5126:
	.loc 27 758 0
	movl	$__FUNCTION__.1454, 12(%esp)
	movl	$758, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC102, (%esp)
	call	_assert_fail
.LVL1526:
.L1315:
.LBE5126:
.LBE5135:
.LBB5136:
.LBB5130:
	call	mdb_node_ptr_set_mdbPrev.isra.180.part.181
.LVL1527:
.LBE5130:
.LBE5136:
	.cfi_endproc
.LFE526:
	.size	insertNewCap, .-insertNewCap
	.p2align 4,,15
	.globl	cteSwap
	.type	cteSwap, @function
cteSwap:
.LFB516:
	.loc 26 511 0
	.cfi_startproc
.LVL1528:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 26 511 0
	movl	40(%esp), %ecx
	.loc 26 515 0
	movl	44(%esp), %eax
	movl	48(%esp), %edx
	.loc 26 511 0
	movl	52(%esp), %ebx
	.loc 26 515 0
	movl	%eax, (%ecx)
	.loc 26 516 0
	movl	32(%esp), %eax
	.loc 26 515 0
	movl	%edx, 4(%ecx)
	.loc 26 516 0
	movl	36(%esp), %edx
	movl	%eax, (%ebx)
	movl	%edx, 4(%ebx)
	.loc 26 518 0
	movl	8(%ecx), %eax
.LVL1529:
	movl	12(%ecx), %edx
.LVL1530:
	.loc 26 521 0
	movl	%eax, %edi
	andl	$-8, %edi
	jne	.L1339
.L1318:
	.loc 26 527 0
	movl	%edx, %edi
	andl	$-8, %edi
	jne	.L1340
.L1320:
	.loc 26 532 0
	movl	8(%ebx), %edi
.LVL1531:
	movl	12(%ebx), %esi
.LVL1532:
	.loc 26 533 0
	movl	%edi, 8(%ecx)
	.loc 26 537 0
	andl	$-8, %edi
.LVL1533:
	.loc 26 533 0
	movl	%esi, 12(%ecx)
	.loc 26 534 0
	movl	%eax, 8(%ebx)
.LVL1534:
	movl	%edx, 12(%ebx)
	.loc 26 537 0
	jne	.L1341
.LVL1535:
.L1322:
	.loc 26 543 0
	andl	$-8, %esi
.LVL1536:
	jne	.L1342
	.loc 26 547 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1342:
	.cfi_restore_state
.LVL1537:
.LBB5161:
.LBB5162:
	.loc 27 839 0
	testb	$7, %cl
	jne	.L1325
	.loc 27 840 0
	movl	8(%esi), %eax
	.loc 27 841 0
	andl	$-8, %ecx
.LVL1538:
	.loc 27 840 0
	andl	$7, %eax
	.loc 27 841 0
	orl	%ecx, %eax
	movl	%eax, 8(%esi)
.LBE5162:
.LBE5161:
	.loc 26 547 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1539:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1540:
	.p2align 4,,7
	.p2align 3
.L1340:
	.cfi_restore_state
.LBB5163:
.LBB5164:
	.loc 27 839 0
	testb	$7, %bl
	jne	.L1325
	.loc 27 840 0
	movl	8(%edi), %esi
	.loc 27 841 0
	movl	%ebx, %ebp
	andl	$-8, %ebp
	.loc 27 840 0
	andl	$7, %esi
	.loc 27 841 0
	orl	%ebp, %esi
	movl	%esi, 8(%edi)
	jmp	.L1320
.LVL1541:
	.p2align 4,,7
	.p2align 3
.L1339:
.LBE5164:
.LBE5163:
.LBB5166:
.LBB5167:
	.loc 27 773 0
	testb	$7, %bl
	jne	.L1323
	.loc 27 774 0
	movl	12(%edi), %esi
	.loc 27 775 0
	movl	%ebx, %ebp
	andl	$-8, %ebp
	.loc 27 774 0
	andl	$7, %esi
	.loc 27 775 0
	orl	%ebp, %esi
	movl	%esi, 12(%edi)
	jmp	.L1318
.LVL1542:
	.p2align 4,,7
	.p2align 3
.L1341:
.LBE5167:
.LBE5166:
.LBB5169:
.LBB5170:
	.loc 27 773 0
	testb	$7, %cl
	jne	.L1323
	.loc 27 774 0
	movl	12(%edi), %eax
.LVL1543:
	.loc 27 775 0
	movl	%ecx, %edx
.LVL1544:
	andl	$-8, %edx
	.loc 27 774 0
	andl	$7, %eax
	.loc 27 775 0
	orl	%edx, %eax
	movl	%eax, 12(%edi)
.LVL1545:
	jmp	.L1322
.LVL1546:
.L1325:
.LBE5170:
.LBE5169:
.LBB5171:
.LBB5165:
	call	mdb_node_ptr_set_mdbPrev.isra.180.part.181
.LVL1547:
.L1323:
.LBE5165:
.LBE5171:
.LBB5172:
.LBB5168:
	call	mdb_node_ptr_set_mdbNext.isra.178.part.179
.LVL1548:
.LBE5168:
.LBE5172:
	.cfi_endproc
.LFE516:
	.size	cteSwap, .-cteSwap
	.p2align 4,,15
	.globl	capSwapForDelete
	.type	capSwapForDelete, @function
capSwapForDelete:
.LFB515:
	.loc 26 496 0
	.cfi_startproc
.LVL1549:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 26 496 0
	movl	32(%esp), %esi
	movl	36(%esp), %edi
	.loc 26 499 0
	cmpl	%edi, %esi
	je	.L1343
	.loc 26 503 0
	movl	(%esi), %ecx
.LVL1550:
	movl	4(%esi), %ebx
	.loc 26 504 0
	movl	4(%edi), %edx
.LVL1551:
	movl	(%edi), %eax
.LBB5191:
.LBB5192:
	.loc 26 515 0
	movl	%edx, 4(%esi)
	movl	%eax, (%esi)
.LVL1552:
	.loc 26 516 0
	movl	%ecx, (%edi)
	movl	%ebx, 4(%edi)
.LVL1553:
	.loc 26 518 0
	movl	8(%esi), %ebx
.LVL1554:
	movl	12(%esi), %ecx
.LVL1555:
	.loc 26 521 0
	movl	%ebx, %edx
.LVL1556:
	andl	$-8, %edx
	jne	.L1367
	.loc 26 527 0
	movl	%ecx, %edx
	andl	$-8, %edx
	jne	.L1368
.L1347:
	.loc 26 532 0
	movl	8(%edi), %edx
.LVL1557:
	movl	12(%edi), %eax
.LVL1558:
	.loc 26 533 0
	movl	%edx, 8(%esi)
	.loc 26 537 0
	andl	$-8, %edx
.LVL1559:
	.loc 26 533 0
	movl	%eax, 12(%esi)
	.loc 26 534 0
	movl	%ebx, 8(%edi)
.LVL1560:
	movl	%ecx, 12(%edi)
	.loc 26 537 0
	jne	.L1369
	.loc 26 543 0
	andl	$-8, %eax
.LVL1561:
	jne	.L1370
.LVL1562:
.L1343:
.LBE5192:
.LBE5191:
	.loc 26 507 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1563:
	.p2align 4,,7
	.p2align 3
.L1370:
	.cfi_restore_state
.LBB5209:
.LBB5207:
.LBB5193:
.LBB5194:
	.loc 27 839 0
	testl	$7, %esi
	jne	.L1352
	.loc 27 840 0
	movl	8(%eax), %edx
	.loc 27 841 0
	andl	$-8, %esi
.LVL1564:
	.loc 27 840 0
	andl	$7, %edx
	.loc 27 841 0
	orl	%esi, %edx
	movl	%edx, 8(%eax)
.LBE5194:
.LBE5193:
.LBE5207:
.LBE5209:
	.loc 26 507 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1565:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1566:
	.p2align 4,,7
	.p2align 3
.L1367:
	.cfi_restore_state
.LBB5210:
.LBB5208:
.LBB5195:
.LBB5196:
	.loc 27 773 0
	testl	$7, %edi
	jne	.L1350
	.loc 27 774 0
	movl	12(%edx), %eax
	.loc 27 775 0
	movl	%edi, %ebp
	andl	$-8, %ebp
	.loc 27 774 0
	andl	$7, %eax
	.loc 27 775 0
	orl	%ebp, %eax
	movl	%eax, 12(%edx)
.LBE5196:
.LBE5195:
	.loc 26 527 0
	movl	%ecx, %edx
.LVL1567:
	andl	$-8, %edx
	je	.L1347
.LVL1568:
.L1368:
.LBB5198:
.LBB5199:
	.loc 27 839 0
	testl	$7, %edi
	jne	.L1352
	.loc 27 840 0
	movl	8(%edx), %eax
	.loc 27 841 0
	movl	%edi, %ebp
	andl	$-8, %ebp
	.loc 27 840 0
	andl	$7, %eax
	.loc 27 841 0
	orl	%ebp, %eax
	movl	%eax, 8(%edx)
	jmp	.L1347
.LVL1569:
	.p2align 4,,7
	.p2align 3
.L1369:
.LBE5199:
.LBE5198:
.LBB5201:
.LBB5202:
	.loc 27 773 0
	testl	$7, %esi
	jne	.L1350
	.loc 27 774 0
	movl	12(%edx), %ecx
.LVL1570:
	.loc 27 775 0
	movl	%esi, %ebx
.LVL1571:
	andl	$-8, %ebx
	.loc 27 774 0
	andl	$7, %ecx
	.loc 27 775 0
	orl	%ebx, %ecx
.LBE5202:
.LBE5201:
	.loc 26 543 0
	andl	$-8, %eax
.LVL1572:
.LBB5204:
.LBB5203:
	.loc 27 775 0
	movl	%ecx, 12(%edx)
.LVL1573:
.LBE5203:
.LBE5204:
	.loc 26 543 0
	je	.L1343
	jmp	.L1370
.LVL1574:
.L1350:
.LBB5205:
.LBB5197:
	call	mdb_node_ptr_set_mdbNext.isra.178.part.179
.LVL1575:
.L1352:
.LBE5197:
.LBE5205:
.LBB5206:
.LBB5200:
	.p2align 4,,8
	call	mdb_node_ptr_set_mdbPrev.isra.180.part.181
.LVL1576:
.LBE5200:
.LBE5206:
.LBE5208:
.LBE5210:
	.cfi_endproc
.LFE515:
	.size	capSwapForDelete, .-capSwapForDelete
	.section	.rodata.str1.4
	.align 4
.LC103:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/cnode.c"
	.align 4
.LC104:
	.string	"cap_get_capType(destSlot->cap) == cap_null_cap"
	.align 4
.LC105:
	.string	"(cte_t*)mdb_node_get_mdbNext(destSlot->cteMDBNode) == NULL && (cte_t*)mdb_node_get_mdbPrev(destSlot->cteMDBNode) == NULL"
	.text
	.p2align 4,,15
	.globl	cteInsert
	.type	cteInsert, @function
cteInsert:
.LFB513:
	.loc 26 405 0
	.cfi_startproc
.LVL1577:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 26 405 0
	movl	88(%esp), %edx
	movl	80(%esp), %edi
	movl	84(%esp), %eax
	.loc 26 411 0
	movl	(%edx), %ebx
	.loc 26 410 0
	movl	12(%edx), %ecx
.LVL1578:
	.loc 26 411 0
	movl	4(%edx), %esi
	.loc 26 405 0
	movl	%eax, 32(%esp)
.LVL1579:
	.loc 26 410 0
	movl	8(%edx), %ebp
	.loc 26 411 0
	movl	%ebx, 28(%esp)
.LBB5259:
.LBB5260:
	.loc 27 872 0
	movl	%edi, %ebx
.LBE5260:
.LBE5259:
	.loc 26 405 0
	movl	92(%esp), %eax
.LVL1580:
.LBB5264:
.LBB5261:
	.loc 27 872 0
	andl	$14, %ebx
.LBE5261:
.LBE5264:
	.loc 26 410 0
	movl	%ecx, 36(%esp)
.LVL1581:
.LBB5265:
.LBB5262:
	.loc 27 873 0
	movl	%edi, %ecx
.LBE5262:
.LBE5265:
	.loc 26 411 0
	movl	%esi, 40(%esp)
.LVL1582:
.LBB5266:
.LBB5263:
	.loc 27 872 0
	movl	%ebx, %esi
.LVL1583:
	.loc 27 873 0
	andl	$15, %ecx
	.loc 27 872 0
	movl	%ebx, 44(%esp)
	.loc 27 873 0
	movl	%edi, %ebx
	cmpl	$14, %esi
	movzbl	%bl, %ebx
.LVL1584:
	cmovne	%ecx, %ebx
.LVL1585:
.LBE5263:
.LBE5266:
	.loc 26 413 0
	cmpl	$4, %ebx
	je	.L1375
	jbe	.L1408
	cmpl	$6, %ebx
	je	.L1378
	cmpl	$30, %ebx
	.p2align 4,,5
	jne	.L1401
.LVL1586:
.LBB5267:
.LBB5268:
	.loc 27 872 0
	movl	28(%esp), %ebx
	movl	%ebx, %esi
	.loc 27 873 0
	movl	%ebx, %ecx
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%bl, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %ecx
.LBE5268:
.LBE5267:
	.loc 26 426 0
	cmpl	$14, %ecx
	sete	%cl
	movzbl	%cl, %ecx
.LVL1587:
.L1374:
.LBB5269:
.LBB5270:
	.loc 27 830 0
	testb	$7, %dl
	jne	.L1409
.LVL1588:
	.loc 27 832 0
	movl	%edx, %ebx
	.loc 27 831 0
	andl	$7, %ebp
.LVL1589:
	.loc 27 832 0
	andl	$-8, %ebx
	movl	%ebx, 24(%esp)
.LBE5270:
.LBE5269:
.LBB5273:
.LBB5274:
	.loc 27 788 0
	movl	36(%esp), %ebx
	leal	(%ecx,%ecx), %esi
.LBE5274:
.LBE5273:
.LBB5276:
.LBB5271:
	.loc 27 832 0
	orl	%ebp, 24(%esp)
.LVL1590:
.LBE5271:
.LBE5276:
.LBB5277:
.LBB5275:
	.loc 27 788 0
	andl	$-4, %ebx
.LVL1591:
.LBE5275:
.LBE5277:
.LBB5278:
.LBB5279:
	.loc 27 809 0
	orl	%esi, %ebx
.LBE5279:
.LBE5278:
	.loc 26 444 0
	movl	(%eax), %esi
.LBB5281:
.LBB5280:
	.loc 27 810 0
	orl	%ecx, %ebx
.LVL1592:
.LBE5280:
.LBE5281:
.LBB5282:
.LBB5283:
	.loc 27 873 0
	movl	%esi, %ecx
.LVL1593:
	.loc 27 872 0
	movl	%esi, %ebp
	.loc 27 873 0
	andl	$15, %ecx
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	movl	%ecx, 36(%esp)
	movl	%esi, %ecx
	cmpl	$14, %ebp
	movzbl	%cl, %esi
.LVL1594:
	cmovne	36(%esp), %esi
.LBE5283:
.LBE5282:
	.loc 26 444 0
	testl	%esi, %esi
	jne	.L1410
	.loc 26 446 0
	testl	$-8, 12(%eax)
	jne	.L1390
	.loc 26 446 0 is_stmt 0 discriminator 2
	testl	$-8, 8(%eax)
	jne	.L1390
.LVL1595:
.LBB5284:
.LBB5285:
.LBB5286:
.LBB5287:
	.loc 27 872 0 is_stmt 1
	movl	28(%esp), %esi
	.loc 27 873 0
	movl	%esi, %ecx
	.loc 27 872 0
	movl	%esi, %ebp
	.loc 27 873 0
	andl	$15, %ecx
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	movl	%ecx, 36(%esp)
	movl	%esi, %ecx
	cmpl	$14, %ebp
	movzbl	%cl, %esi
	cmovne	36(%esp), %esi
.LBE5287:
.LBE5286:
	.loc 26 391 0
	cmpl	$2, %esi
	je	.L1411
.LVL1596:
.L1394:
.LBE5285:
.LBE5284:
	.loc 26 453 0
	movl	%edi, (%eax)
.LVL1597:
	movl	32(%esp), %edi
.LVL1598:
.LBB5308:
.LBB5309:
	.loc 27 773 0
	testb	$7, %al
.LBE5309:
.LBE5308:
	.loc 26 454 0
	movl	%ebx, 12(%eax)
.LVL1599:
	.loc 26 453 0
	movl	%edi, 4(%eax)
.LVL1600:
	.loc 26 454 0
	movl	24(%esp), %edi
	movl	%edi, 8(%eax)
.LBB5313:
.LBB5310:
	.loc 27 773 0
	jne	.L1412
.LVL1601:
	.loc 27 774 0
	movl	12(%edx), %ecx
	.loc 27 775 0
	andl	$-8, %eax
.LVL1602:
	.loc 27 774 0
	andl	$7, %ecx
	.loc 27 775 0
	orl	%eax, %ecx
.LBE5310:
.LBE5313:
	.loc 26 456 0
	andl	$-8, %ebx
.LVL1603:
.LBB5314:
.LBB5311:
	.loc 27 775 0
	movl	%ecx, 12(%edx)
.LVL1604:
.LBE5311:
.LBE5314:
	.loc 26 456 0
	je	.L1371
.LVL1605:
.LBB5315:
.LBB5316:
	.loc 27 840 0
	movl	8(%ebx), %edx
.LVL1606:
	andl	$7, %edx
	.loc 27 841 0
	orl	%eax, %edx
	movl	%edx, 8(%ebx)
.LVL1607:
.L1371:
.LBE5316:
.LBE5315:
	.loc 26 461 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1608:
	.p2align 4,,7
	.p2align 3
.L1378:
	.cfi_restore_state
.LBB5317:
.LBB5318:
	.loc 27 1127 0
	cmpl	$6, %ecx
	jne	.L1383
.LBE5318:
.LBE5317:
.LBB5322:
.LBB5323:
	movl	28(%esp), %ecx
.LBE5323:
.LBE5322:
.LBB5327:
.LBB5319:
	.loc 27 1130 0
	movl	32(%esp), %ebx
.LBE5319:
.LBE5327:
.LBB5328:
.LBB5324:
	.loc 27 1127 0
	andl	$15, %ecx
.LBE5324:
.LBE5328:
.LBB5329:
.LBB5320:
	.loc 27 1130 0
	shrl	$3, %ebx
.LVL1609:
.LBE5320:
.LBE5329:
.LBB5330:
.LBB5325:
	.loc 27 1127 0
	cmpl	$6, %ecx
	je	.L1407
.LVL1610:
.L1383:
.LBE5325:
.LBE5330:
.LBB5331:
.LBB5321:
	call	cap_async_endpoint_cap_get_capAEPBadge.part.176
.LVL1611:
	.p2align 4,,7
	.p2align 3
.L1411:
.LBE5321:
.LBE5331:
.LBB5332:
.LBB5306:
.LBB5288:
.LBB5289:
	.loc 27 873 0
	movl	%edi, %esi
	movl	%edi, %ecx
	andl	$15, %esi
	movzbl	%cl, %ebp
.LVL1612:
	cmpl	$14, 44(%esp)
	cmovne	%esi, %ebp
.LVL1613:
.LBE5289:
.LBE5288:
	.loc 26 392 0
	cmpl	$2, %ebp
	jne	.L1394
.LVL1614:
.LBB5290:
.LBB5291:
	.loc 27 965 0
	cmpl	$2, 36(%esp)
	jne	.L1398
	.loc 27 968 0
	movl	28(%esp), %ecx
	andl	$-16, %ecx
.LVL1615:
.LBE5291:
.LBE5290:
.LBB5293:
.LBB5294:
	.loc 27 965 0
	cmpl	$2, %esi
	jne	.L1398
	.loc 27 968 0
	movl	%edi, %esi
	andl	$-16, %esi
.LBE5294:
.LBE5293:
	.loc 26 393 0
	cmpl	%esi, %ecx
	jne	.L1394
.LVL1616:
.LBB5295:
.LBB5296:
	.loc 27 952 0
	movl	32(%esp), %ebp
.LBE5296:
.LBE5295:
.LBB5298:
.LBB5299:
	movl	40(%esp), %ecx
.LBE5299:
.LBE5298:
.LBB5301:
.LBB5297:
	andl	$31, %ebp
.LVL1617:
.LBE5297:
.LBE5301:
.LBB5302:
.LBB5300:
	andl	$31, %ecx
.LBE5300:
.LBE5302:
	.loc 26 395 0
	cmpl	%ecx, %ebp
	jne	.L1394
.LVL1618:
	.loc 26 398 0
	leal	-4(%ebp), %ecx
	movl	$32, %esi
.LBB5303:
.LBB5304:
	.loc 27 944 0
	sall	%cl, %esi
	orl	%ebp, %esi
	movl	%esi, 4(%edx)
.LVL1619:
	jmp	.L1394
.LVL1620:
	.p2align 4,,7
	.p2align 3
.L1408:
.LBE5304:
.LBE5303:
.LBE5306:
.LBE5332:
	.loc 26 413 0
	cmpl	$2, %ebx
	.loc 26 431 0
	movl	$1, %ecx
	.loc 26 413 0
	je	.L1374
.L1401:
	.loc 26 435 0
	xorl	%ecx, %ecx
	jmp	.L1374
	.p2align 4,,7
	.p2align 3
.L1375:
.LVL1621:
.LBB5333:
.LBB5334:
	.loc 27 1008 0
	cmpl	$4, %ecx
	jne	.L1381
.LBE5334:
.LBE5333:
.LBB5338:
.LBB5339:
	movl	28(%esp), %ecx
.LBE5339:
.LBE5338:
.LBB5342:
.LBB5335:
	.loc 27 1011 0
	movl	32(%esp), %ebx
.LBE5335:
.LBE5342:
.LBB5343:
.LBB5340:
	.loc 27 1008 0
	andl	$15, %ecx
.LBE5340:
.LBE5343:
.LBB5344:
.LBB5336:
	.loc 27 1011 0
	shrl	$3, %ebx
.LVL1622:
.LBE5336:
.LBE5344:
.LBB5345:
.LBB5341:
	.loc 27 1008 0
	cmpl	$4, %ecx
	jne	.L1381
.LVL1623:
.L1407:
.LBE5341:
.LBE5345:
.LBB5346:
.LBB5326:
	.loc 27 1130 0
	movl	40(%esp), %ecx
	shrl	$3, %ecx
.LBE5326:
.LBE5346:
	.loc 26 421 0
	cmpl	%ecx, %ebx
	setne	%cl
	movzbl	%cl, %ecx
.LVL1624:
	.loc 26 423 0
	jmp	.L1374
.LVL1625:
.L1381:
.LBB5347:
.LBB5337:
	call	cap_endpoint_cap_get_capEPBadge.part.71
.LVL1626:
.L1390:
.LBE5337:
.LBE5347:
	.loc 26 446 0 discriminator 1
	movl	$__FUNCTION__.6491, 12(%esp)
.LVL1627:
	movl	$447, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC105, (%esp)
	call	_assert_fail
.LVL1628:
.L1412:
.LBB5348:
.LBB5312:
	call	mdb_node_ptr_set_mdbNext.isra.178.part.179
.LVL1629:
.L1409:
.LBE5312:
.LBE5348:
.LBB5349:
.LBB5272:
	.loc 27 830 0
	movl	$__FUNCTION__.1496, 12(%esp)
.LVL1630:
	movl	$830, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC101, (%esp)
	call	_assert_fail
.LVL1631:
.L1410:
.LBE5272:
.LBE5349:
	.loc 26 444 0 discriminator 1
	movl	$__FUNCTION__.6491, 12(%esp)
.LVL1632:
	movl	$444, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC104, (%esp)
	call	_assert_fail
.LVL1633:
.L1398:
.LBB5350:
.LBB5307:
.LBB5305:
.LBB5292:
	call	cap_untyped_cap_get_capPtr.isra.84.part.85
.LVL1634:
.LBE5292:
.LBE5305:
.LBE5307:
.LBE5350:
	.cfi_endproc
.LFE513:
	.size	cteInsert, .-cteInsert
	.p2align 4,,15
	.globl	invokeCNodeInsert
	.type	invokeCNodeInsert, @function
invokeCNodeInsert:
.LFB508:
	.loc 26 328 0
	.cfi_startproc
.LVL1635:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 26 329 0
	movl	44(%esp), %eax
	movl	36(%esp), %edx
	movl	%eax, 12(%esp)
	movl	40(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, 8(%esp)
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	cteInsert
.LVL1636:
	.loc 26 332 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE508:
	.size	invokeCNodeInsert, .-invokeCNodeInsert
	.section	.text.unlikely
	.type	cap_zombie_cap_set_capZombieNumber, @function
cap_zombie_cap_set_capZombieNumber:
.LFB230:
	.loc 40 112 0
	.cfi_startproc
.LVL1637:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
.LVL1638:
.LBB5359:
.LBB5360:
.LBB5361:
.LBB5362:
	.loc 27 1891 0
	cmpb	$46, %dl
.LBE5362:
.LBE5361:
.LBE5360:
.LBE5359:
	.loc 40 112 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LBB5369:
.LBB5367:
.LBB5365:
.LBB5363:
	.loc 27 1891 0
	je	.L1416
	call	cap_zombie_cap_get_capZombieType.isra.94.part.95
.LVL1639:
.L1416:
	.loc 27 1894 0
	movl	%edx, %ebx
.LVL1640:
	movl	%ecx, %edi
.LVL1641:
	andl	$16128, %ebx
.LBE5363:
.LBE5365:
	.loc 40 91 0
	movl	$3, %ecx
.LVL1642:
.LBB5366:
.LBB5364:
	.loc 27 1894 0
	shrl	$8, %ebx
.LBE5364:
.LBE5366:
.LBE5367:
.LBE5369:
	.loc 40 114 0
	movl	$1, %esi
.LBB5370:
.LBB5368:
	.loc 40 91 0
	cmpl	$32, %ebx
	cmove	%ecx, %ebx
.LVL1643:
.LBE5368:
.LBE5370:
	.loc 40 114 0
	leal	1(%ebx), %ecx
	sall	%cl, %esi
	movl	%esi, %ebx
.LBB5371:
.LBB5372:
	.loc 27 1886 0
	movl	%edx, (%eax)
.LVL1644:
.LBE5372:
.LBE5371:
	.loc 40 115 0
	leal	-1(%esi), %edx
.LVL1645:
	.loc 40 114 0
	negl	%ebx
	.loc 40 115 0
	andl	16(%esp), %edx
	.loc 40 114 0
	andl	%edi, %ebx
.LVL1646:
	.loc 40 115 0
	orl	%ebx, %edx
.LVL1647:
	movl	%edx, 4(%eax)
	.loc 40 116 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1648:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL1649:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL1650:
	ret
	.cfi_endproc
.LFE230:
	.size	cap_zombie_cap_set_capZombieNumber, .-cap_zombie_cap_set_capZombieNumber
	.section	.rodata.str1.1
.LC106:
	.string	"(capReplyMaster & ~0x1) == 0"
	.section	.text.unlikely
	.type	cap_reply_cap_new.part.182, @function
cap_reply_cap_new.part.182:
.LFB822:
	.loc 27 1194 0
	.cfi_startproc
.LVL1651:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1201 0
	movl	$__FUNCTION__.1657, 12(%esp)
	movl	$1201, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC106, (%esp)
	call	_assert_fail
.LVL1652:
	.cfi_endproc
.LFE822:
	.size	cap_reply_cap_new.part.182, .-cap_reply_cap_new.part.182
	.type	endpoint_ptr_set_epQueue_head.isra.185.part.186, @function
endpoint_ptr_set_epQueue_head.isra.185.part.186:
.LFB826:
	.loc 27 429 0
	.cfi_startproc
.LVL1653:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 431 0
	movl	$__FUNCTION__.1280, 12(%esp)
	movl	$431, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC98, (%esp)
	call	_assert_fail
.LVL1654:
	.cfi_endproc
.LFE826:
	.size	endpoint_ptr_set_epQueue_head.isra.185.part.186, .-endpoint_ptr_set_epQueue_head.isra.185.part.186
	.type	endpoint_ptr_set_epQueue_tail.isra.187.part.188, @function
endpoint_ptr_set_epQueue_tail.isra.187.part.188:
.LFB828:
	.loc 27 442 0
	.cfi_startproc
.LVL1655:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 444 0
	movl	$__FUNCTION__.1288, 12(%esp)
	movl	$444, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC98, (%esp)
	call	_assert_fail
.LVL1656:
	.cfi_endproc
.LFE828:
	.size	endpoint_ptr_set_epQueue_tail.isra.187.part.188, .-endpoint_ptr_set_epQueue_tail.isra.187.part.188
	.type	endpoint_ptr_set_state.isra.189.part.190, @function
endpoint_ptr_set_state.isra.189.part.190:
.LFB830:
	.loc 27 455 0
	.cfi_startproc
.LVL1657:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 457 0
	movl	$__FUNCTION__.1296, 12(%esp)
	movl	$457, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC99, (%esp)
	call	_assert_fail
.LVL1658:
	.cfi_endproc
.LFE830:
	.size	endpoint_ptr_set_state.isra.189.part.190, .-endpoint_ptr_set_state.isra.189.part.190
	.type	cap_async_endpoint_cap_get_capAEPCanSend.part.192, @function
cap_async_endpoint_cap_get_capAEPCanSend.part.192:
.LFB832:
	.loc 27 1146 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1147 0
	movl	$__FUNCTION__.1633, 12(%esp)
	movl	$1148, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC37, (%esp)
	call	_assert_fail
.LVL1659:
	.cfi_endproc
.LFE832:
	.size	cap_async_endpoint_cap_get_capAEPCanSend.part.192, .-cap_async_endpoint_cap_get_capAEPCanSend.part.192
	.text
	.p2align 4,,15
	.globl	hasRecycleRights
	.type	hasRecycleRights, @function
hasRecycleRights:
.LFB560:
	.loc 38 267 0
	.cfi_startproc
.LVL1660:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 38 267 0
	movl	16(%esp), %eax
.LVL1661:
	movl	20(%esp), %esi
.LVL1662:
.LBB5395:
.LBB5396:
	.loc 27 872 0
	movl	%eax, %ebx
	.loc 27 873 0
	movl	%eax, %ecx
	.loc 27 872 0
	andl	$14, %ebx
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%al, %edx
.LVL1663:
	cmpl	$14, %ebx
	cmovne	%ecx, %edx
.LVL1664:
.LBE5396:
.LBE5395:
	.loc 38 268 0
	cmpl	$4, %edx
	je	.L1433
	jbe	.L1463
	cmpl	$6, %edx
	jne	.L1464
.LVL1665:
.LBB5397:
.LBB5398:
	.loc 27 1147 0
	cmpl	$6, %ecx
	.p2align 4,,5
	jne	.L1465
.LBE5398:
.LBE5397:
.LBB5400:
.LBB5401:
	.loc 27 1170 0
	movl	%esi, %edx
	xorl	%eax, %eax
.LVL1666:
	andl	$1, %edx
	andl	$2, %esi
.LVL1667:
	cmovne	%edx, %eax
.LVL1668:
.L1435:
.LBE5401:
.LBE5400:
	.loc 38 289 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1669:
	.p2align 4,,7
	.p2align 3
.L1464:
	.cfi_restore_state
	.loc 38 268 0
	cmpl	$62, %edx
	jne	.L1432
.L1448:
	.loc 38 289 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 38 271 0
	xorl	%eax, %eax
.LVL1670:
	.loc 38 289 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL1671:
	ret
.LVL1672:
	.p2align 4,,7
	.p2align 3
.L1463:
	.cfi_restore_state
	.loc 38 268 0
	testl	%edx, %edx
	je	.L1448
.L1432:
.LVL1673:
.LBB5402:
.LBB5403:
.LBB5404:
.LBB5405:
	.loc 27 872 0
	cmpl	$14, %ebx
	je	.L1441
.LVL1674:
.LBE5405:
.LBE5404:
.LBE5403:
.LBE5402:
.LBB5406:
.LBB5407:
.LBB5408:
.LBB5409:
	.loc 27 873 0
	movl	%eax, %edx
	andl	$15, %edx
.LBE5409:
.LBE5408:
.LBE5407:
.LBE5406:
	.loc 38 283 0
	testb	$1, %al
	je	.L1461
.LVL1675:
.L1444:
.LBB5420:
.LBB5416:
	.loc 19 310 0
	cmpl	$1, %edx
	jne	.L1461
.LVL1676:
.LBB5411:
.LBB5412:
	.loc 27 1487 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L1466
	.loc 27 1490 0
	andl	$50331648, %eax
.LVL1677:
.LBE5412:
.LBE5411:
	.loc 19 312 0
	cmpl	$50331648, %eax
	sete	%al
	movzbl	%al, %eax
	jmp	.L1435
.LVL1678:
	.p2align 4,,7
	.p2align 3
.L1433:
.LBE5416:
.LBE5420:
.LBB5421:
.LBB5422:
	.loc 27 1048 0
	cmpl	$4, %ecx
	jne	.L1467
.LBE5422:
.LBE5421:
	xorl	%eax, %eax
.LVL1679:
	.loc 38 275 0
	testl	$2, %esi
	je	.L1435
.LVL1680:
	.loc 38 274 0
	testl	$1, %esi
	je	.L1435
.LVL1681:
.LBB5424:
.LBB5425:
	.loc 27 1031 0
	movl	%esi, %eax
	andl	$4, %eax
	shrl	$2, %eax
.LBE5425:
.LBE5424:
	jmp	.L1435
.LVL1682:
	.p2align 4,,7
	.p2align 3
.L1441:
	.loc 38 283 0
	testb	$1, %al
.LBB5426:
.LBB5417:
.LBB5414:
.LBB5410:
	.loc 27 874 0
	movzbl	%al, %edx
.LBE5410:
.LBE5414:
.LBE5417:
.LBE5426:
	.loc 38 283 0
	jne	.L1444
	.p2align 4,,7
	.p2align 3
.L1461:
	.loc 38 289 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB5427:
.LBB5418:
	.loc 19 315 0
	movl	$1, %eax
.LVL1683:
.LBE5418:
.LBE5427:
	.loc 38 289 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL1684:
	ret
.LVL1685:
.L1467:
	.cfi_restore_state
.LBB5428:
.LBB5423:
	call	cap_endpoint_cap_get_capCanSend.part.64
.LVL1686:
.L1465:
.LBE5423:
.LBE5428:
.LBB5429:
.LBB5399:
	call	cap_async_endpoint_cap_get_capAEPCanSend.part.192
.LVL1687:
.L1466:
.LBE5399:
.LBE5429:
.LBB5430:
.LBB5419:
.LBB5415:
.LBB5413:
	.p2align 4,,5
	call	cap_frame_cap_get_capFVMRights.isra.119.part.120
.LVL1688:
.LBE5413:
.LBE5415:
.LBE5419:
.LBE5430:
	.cfi_endproc
.LFE560:
	.size	hasRecycleRights, .-hasRecycleRights
	.section	.rodata.str1.4
	.align 4
.LC107:
	.string	"((cap.words[0] >> 0) & 0xff) == cap_irq_handler_cap"
	.section	.text.unlikely
	.type	cap_irq_handler_cap_get_capIRQ.part.193, @function
cap_irq_handler_cap_get_capIRQ.part.193:
.LFB833:
	.loc 27 1842 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 1843 0
	movl	$__FUNCTION__.1898, 12(%esp)
	movl	$1844, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC107, (%esp)
	call	_assert_fail
.LVL1689:
	.cfi_endproc
.LFE833:
	.size	cap_irq_handler_cap_get_capIRQ.part.193, .-cap_irq_handler_cap_get_capIRQ.part.193
	.text
	.p2align 4,,15
	.globl	sameRegionAs
	.type	sameRegionAs, @function
sameRegionAs:
.LFB561:
	.loc 38 293 0
	.cfi_startproc
.LVL1690:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 38 293 0
	movl	64(%esp), %edx
	movl	68(%esp), %edi
	movl	72(%esp), %ebx
.LVL1691:
	movl	76(%esp), %esi
.LVL1692:
.LBB5518:
.LBB5519:
	.loc 27 872 0
	movl	%edx, %ebp
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %ecx
.LVL1693:
	cmpl	$14, %ebp
	cmove	%ecx, %eax
.LVL1694:
.LBE5519:
.LBE5518:
	.loc 38 294 0
	cmpl	$62, %eax
	ja	.L1473
	jmp	*.L1475(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1475:
	.long	.L1473
	.long	.L1473
	.long	.L1474
	.long	.L1473
	.long	.L1476
	.long	.L1473
	.long	.L1477
	.long	.L1473
	.long	.L1478
	.long	.L1473
	.long	.L1479
	.long	.L1473
	.long	.L1480
	.long	.L1473
	.long	.L1481
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1482
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1473
	.long	.L1483
	.text
	.p2align 4,,7
	.p2align 3
.L1483:
.LVL1695:
.LBB5520:
.LBB5521:
	.loc 27 872 0
	movl	%ebx, %edx
.LVL1696:
.LBE5521:
.LBE5520:
	.loc 38 373 0
	xorl	%eax, %eax
.LBB5523:
.LBB5522:
	.loc 27 872 0
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L1568
.LVL1697:
	.p2align 4,,7
	.p2align 3
.L1512:
.LBE5522:
.LBE5523:
	.loc 38 374 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1698:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1699:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1700:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1701:
	.p2align 4,,7
	.p2align 3
.L1474:
	.cfi_restore_state
.LBB5524:
.LBB5525:
.LBB5526:
	.loc 27 965 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$2, %eax
	jne	.L1569
	.loc 27 968 0
	andl	$-16, %edx
.LVL1702:
.LBE5526:
.LBE5525:
	.loc 38 299 0
	movl	%ebx, %eax
.LBB5529:
.LBB5527:
	.loc 27 968 0
	movl	%edx, %ebp
.LBE5527:
.LBE5529:
	.loc 38 299 0
	movl	%esi, %edx
	call	cap_get_capPtr
.LVL1703:
.LBB5530:
.LBB5531:
.LBB5532:
.LBB5533:
	.loc 27 872 0
	movl	%ebx, %ecx
	.loc 27 873 0
	movl	%ebx, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %edx
	.loc 27 872 0
	movl	%ecx, 28(%esp)
	.loc 27 873 0
	movzbl	%bl, %ecx
.LVL1704:
	cmpl	$14, 28(%esp)
	cmove	%ecx, %edx
.LVL1705:
.LBE5533:
.LBE5532:
	.loc 40 354 0
	cmpl	$62, %edx
	ja	.L1487
	jmp	*.L1489(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L1489:
	.long	.L1495
	.long	.L1490
	.long	.L1491
	.long	.L1497
	.long	.L1493
	.long	.L1497
	.long	.L1493
	.long	.L1495
	.long	.L1495
	.long	.L1497
	.long	.L1498
	.long	.L1495
	.long	.L1541
	.long	.L1487
	.long	.L1495
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1495
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1503
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1487
	.long	.L1495
	.text
.LVL1706:
	.p2align 4,,7
	.p2align 3
.L1476:
.LBE5531:
.LBE5530:
.LBE5524:
.LBB5569:
.LBB5570:
	.loc 27 872 0
	movl	%ebx, %eax
	.loc 27 873 0
	movl	%ebx, %ecx
.LVL1707:
	.loc 27 872 0
	andl	$14, %eax
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%bl, %esi
.LVL1708:
	cmpl	$14, %eax
	cmovne	%ecx, %esi
.LVL1709:
.LBE5570:
.LBE5569:
	.loc 38 373 0
	xorl	%eax, %eax
	.loc 38 309 0
	cmpl	$4, %esi
	jne	.L1512
.LVL1710:
.LBB5571:
.LBB5572:
	.loc 27 1088 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$4, %eax
	jne	.L1516
	.loc 27 1091 0
	andl	$-16, %edx
.LVL1711:
.LBE5572:
.LBE5571:
.LBB5574:
.LBB5575:
	.loc 27 1088 0
	cmpl	$4, %ecx
	je	.L1567
.LVL1712:
.L1516:
.LBE5575:
.LBE5574:
.LBB5576:
.LBB5573:
	call	cap_endpoint_cap_get_capEPPtr.isra.65.part.66
.LVL1713:
	.p2align 4,,7
	.p2align 3
.L1477:
.LBE5573:
.LBE5576:
.LBB5577:
.LBB5578:
	.loc 27 872 0
	movl	%ebx, %eax
	.loc 27 873 0
	movl	%ebx, %ecx
.LVL1714:
	.loc 27 872 0
	andl	$14, %eax
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%bl, %esi
.LVL1715:
	cmpl	$14, %eax
	cmovne	%ecx, %esi
.LVL1716:
.LBE5578:
.LBE5577:
	.loc 38 373 0
	xorl	%eax, %eax
	.loc 38 316 0
	cmpl	$6, %esi
	jne	.L1512
.LVL1717:
.LBB5579:
.LBB5580:
	.loc 27 1187 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$6, %eax
	jne	.L1520
	.loc 27 1190 0
	andl	$-16, %edx
.LVL1718:
.LBE5580:
.LBE5579:
.LBB5582:
.LBB5583:
	.loc 27 1187 0
	cmpl	$6, %ecx
	je	.L1567
.LVL1719:
.L1520:
.LBE5583:
.LBE5582:
.LBB5584:
.LBB5581:
	call	cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87
.LVL1720:
	.p2align 4,,7
	.p2align 3
.L1478:
.LBE5581:
.LBE5584:
.LBB5585:
.LBB5586:
	.loc 27 872 0
	movl	%ebx, %eax
	.loc 27 873 0
	movl	%ebx, %ecx
.LVL1721:
	.loc 27 872 0
	andl	$14, %eax
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%bl, %esi
.LVL1722:
	cmpl	$14, %eax
	cmovne	%ecx, %esi
.LVL1723:
.LBE5586:
.LBE5585:
	.loc 38 373 0
	xorl	%eax, %eax
	.loc 38 339 0
	cmpl	$8, %esi
	jne	.L1512
.LVL1724:
.LBB5587:
.LBB5588:
	.loc 27 1245 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$8, %eax
	jne	.L1533
	.loc 27 1248 0
	andl	$-16, %edx
.LVL1725:
.LBE5588:
.LBE5587:
.LBB5590:
.LBB5591:
	.loc 27 1245 0
	cmpl	$8, %ecx
	je	.L1567
.LVL1726:
.L1533:
.LBE5591:
.LBE5590:
.LBB5593:
.LBB5589:
	call	cap_reply_cap_get_capTCBPtr.isra.54.part.55
.LVL1727:
	.p2align 4,,7
	.p2align 3
.L1479:
.LBE5589:
.LBE5593:
.LBB5594:
.LBB5595:
	.loc 27 872 0
	movl	%ebx, %eax
	.loc 27 873 0
	movl	%ebx, %ecx
.LVL1728:
	.loc 27 872 0
	andl	$14, %eax
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%bl, %ebp
.LVL1729:
	cmpl	$14, %eax
	cmovne	%ecx, %ebp
.LVL1730:
.LBE5595:
.LBE5594:
	.loc 38 373 0
	xorl	%eax, %eax
	.loc 38 323 0
	cmpl	$10, %ebp
	jne	.L1512
.LVL1731:
.LBB5596:
.LBB5597:
	.loc 27 1332 0
	movl	%edx, %ebp
	andl	$15, %ebp
	cmpl	$10, %ebp
	jne	.L1524
	.loc 27 1335 0
	andl	$2147483632, %edx
.LVL1732:
	addl	%edx, %edx
.LVL1733:
.LBE5597:
.LBE5596:
.LBB5599:
.LBB5600:
	.loc 27 1332 0
	cmpl	$10, %ecx
	jne	.L1524
	.loc 27 1335 0
	andl	$2147483632, %ebx
.LVL1734:
	addl	%ebx, %ebx
.LBE5600:
.LBE5599:
	.loc 38 325 0
	cmpl	%ebx, %edx
	jne	.L1512
.LVL1735:
.LBB5601:
.LBB5602:
	.loc 27 1287 0 discriminator 1
	andl	$260046848, %edi
.LVL1736:
.LBE5602:
.LBE5601:
.LBB5603:
.LBB5604:
	andl	$260046848, %esi
.LVL1737:
.LBE5604:
.LBE5603:
	.loc 38 325 0 discriminator 1
	xorl	%eax, %eax
	cmpl	%edi, %esi
	sete	%al
	jmp	.L1512
.LVL1738:
	.p2align 4,,7
	.p2align 3
.L1480:
.LBB5605:
.LBB5606:
	.loc 27 872 0
	movl	%ebx, %eax
	.loc 27 873 0
	movl	%ebx, %ecx
.LVL1739:
	.loc 27 872 0
	andl	$14, %eax
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%bl, %esi
.LVL1740:
	cmpl	$14, %eax
	cmovne	%ecx, %esi
.LVL1741:
.LBE5606:
.LBE5605:
	.loc 38 373 0
	xorl	%eax, %eax
	.loc 38 332 0
	cmpl	$12, %esi
	jne	.L1512
.LVL1742:
.LBB5607:
.LBB5608:
	.loc 27 1359 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$12, %eax
	jne	.L1529
	.loc 27 1362 0
	andl	$-16, %edx
.LVL1743:
.LBE5608:
.LBE5607:
.LBB5610:
.LBB5611:
	.loc 27 1359 0
	cmpl	$12, %ecx
	jne	.L1529
.LVL1744:
.L1567:
.LBE5611:
.LBE5610:
.LBB5612:
.LBB5592:
	.loc 27 1248 0
	andl	$-16, %ebx
.LVL1745:
.LBE5592:
.LBE5612:
	.loc 38 340 0
	xorl	%eax, %eax
	cmpl	%ebx, %edx
	sete	%al
	.loc 38 374 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1746:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1747:
	.p2align 4,,7
	.p2align 3
.L1481:
	.cfi_restore_state
.LBB5613:
.LBB5614:
	.loc 27 872 0
	movl	%ebx, %edx
.LVL1748:
	.loc 27 873 0
	movl	%ebx, %eax
	.loc 27 872 0
	andl	$14, %edx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%bl, %ebx
.LVL1749:
	cmpl	$14, %edx
	cmove	%ebx, %eax
.LVL1750:
.LBE5614:
.LBE5613:
	.loc 38 352 0
	andl	$-17, %eax
	cmpl	$14, %eax
	sete	%al
	.loc 38 374 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1751:
	.loc 38 352 0
	movzbl	%al, %eax
	.loc 38 374 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1752:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1753:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1754:
	.p2align 4,,7
	.p2align 3
.L1482:
	.cfi_restore_state
.LBB5615:
.LBB5616:
	.loc 27 872 0
	movl	%ebx, %ecx
.LVL1755:
.LBE5616:
.LBE5615:
	.loc 38 373 0
	xorl	%eax, %eax
.LBB5618:
.LBB5617:
	.loc 27 872 0
	andl	$14, %ecx
	cmpl	$14, %ecx
	jne	.L1512
.LBE5617:
.LBE5618:
	.loc 38 359 0
	cmpb	$30, %bl
	jne	.L1512
.LVL1756:
.LBB5619:
.LBB5620:
	.loc 27 1843 0
	cmpb	$30, %dl
	jne	.L1570
.LVL1757:
.LBE5620:
.LBE5619:
	.loc 38 360 0
	movl	%esi, %eax
	movl	%edi, %ecx
	cmpb	%cl, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L1512
.LVL1758:
	.p2align 4,,7
	.p2align 3
.L1473:
	.loc 38 373 0
	xorl	%eax, %eax
	.loc 38 366 0
	testb	$1, %dl
	je	.L1512
.LVL1759:
	.loc 38 366 0 is_stmt 0 discriminator 1
	testb	$1, %bl
	je	.L1512
	.loc 38 368 0 is_stmt 1
	movl	%ebx, 72(%esp)
	movl	%esi, 76(%esp)
	movl	%edi, 68(%esp)
	movl	%edx, 64(%esp)
	.loc 38 374 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1760:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1761:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1762:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 38 368 0
	jmp	Arch_sameRegionAs
.LVL1763:
	.p2align 4,,7
	.p2align 3
.L1495:
	.cfi_restore_state
.LBB5622:
.LBB5563:
.LBB5558:
	movl	$1, %edx
.LVL1764:
.L1500:
.LBE5558:
.LBE5563:
	.loc 38 305 0
	cmpl	%ebp, %eax
	jb	.L1544
	testl	%eax, %eax
	je	.L1544
	.loc 38 302 0 discriminator 1
	leal	-1(%eax,%edx), %edx
.LVL1765:
	.loc 38 301 0 discriminator 1
	movl	%edi, %ecx
.LVL1766:
	.loc 38 305 0 discriminator 1
	cmpl	%edx, %eax
	.loc 38 301 0 discriminator 1
	movl	$1, %eax
.LVL1767:
	.loc 38 305 0 discriminator 1
	setbe	%bl
	.loc 38 301 0 discriminator 1
	sall	%cl, %eax
	leal	-1(%ebp,%eax), %eax
	.loc 38 305 0 discriminator 1
	cmpl	%eax, %edx
	setbe	%al
	movzbl	%al, %eax
	andl	%ebx, %eax
	jmp	.L1512
.LVL1768:
	.p2align 4,,7
	.p2align 3
.L1497:
.LBB5564:
.LBB5559:
	movl	$4096, %edx
	jmp	.L1500
.LVL1769:
.L1541:
	.loc 40 354 0
	movl	$1024, %edx
	jmp	.L1500
.L1491:
.LVL1770:
.LBB5534:
.LBB5535:
	.loc 27 949 0
	andl	$15, %ebx
.LVL1771:
	cmpl	$2, %ebx
	jne	.L1571
	movl	$1, %edx
	movl	%esi, %ecx
.LVL1772:
	sall	%cl, %edx
	jmp	.L1500
.LVL1773:
.L1498:
.LBE5535:
.LBE5534:
.LBB5537:
.LBB5538:
	.loc 27 1284 0
	andl	$15, %ebx
.LVL1774:
	cmpl	$10, %ebx
	jne	.L1572
	.loc 27 1287 0
	andl	$260046848, %esi
.LVL1775:
	movl	$1, %edx
	shrl	$23, %esi
.LBE5538:
.LBE5537:
	.loc 40 365 0
	leal	4(%esi), %ecx
.LVL1776:
	sall	%cl, %edx
	jmp	.L1500
.LVL1777:
.L1493:
	.loc 40 354 0
	movl	$16, %edx
	jmp	.L1500
.L1490:
.LVL1778:
.LBB5540:
.LBB5541:
	.loc 27 1406 0
	andl	$15, %ebx
.LVL1779:
	cmpl	$1, %ebx
	jne	.L1573
.LVL1780:
	.loc 27 1409 0
	shrl	$31, %esi
.LVL1781:
.LBE5541:
.LBE5540:
.LBB5543:
.LBB5544:
	.loc 37 41 0
	testl	%esi, %esi
	je	.L1497
	cmpl	$1, %esi
	je	.L1542
	call	pageBitsForSize.part.45
.LVL1782:
.L1503:
.LBE5544:
.LBE5543:
.LBB5546:
.LBB5547:
	.loc 27 1891 0
	cmpb	$46, %bl
	.p2align 4,,2
	jne	.L1574
	.loc 27 1894 0
	andl	$16128, %ebx
.LVL1783:
.LBE5547:
.LBE5546:
	.loc 40 381 0
	movl	$1024, %edx
.LBB5550:
.LBB5548:
	.loc 27 1894 0
	shrl	$8, %ebx
.LBE5548:
.LBE5550:
	.loc 40 381 0
	cmpl	$32, %ebx
	je	.L1500
	.loc 40 384 0
	andl	$31, %ebx
	movw	$1, %dx
	movl	%ebx, %ecx
.LVL1784:
	addl	$4, %ecx
	sall	%cl, %edx
	jmp	.L1500
.LVL1785:
.L1487:
.LBB5551:
.LBB5552:
	.loc 40 417 0
	movl	$__func__.2475, 12(%esp)
	movl	$417, 8(%esp)
	movl	$.LC55, 4(%esp)
	movl	$.LC56, (%esp)
	call	_fail
.LVL1786:
	.p2align 4,,7
	.p2align 3
.L1544:
.LBE5552:
.LBE5551:
.LBE5559:
.LBE5564:
	xorl	%eax, %eax
.LVL1787:
	.loc 38 304 0
	jmp	.L1512
.LVL1788:
	.p2align 4,,7
	.p2align 3
.L1568:
.LBE5622:
	.loc 38 346 0
	xorl	%eax, %eax
	cmpb	$62, %bl
	sete	%al
	jmp	.L1512
.LVL1789:
.L1542:
.LBB5623:
.LBB5565:
.LBB5560:
.LBB5553:
.LBB5545:
	.loc 37 41 0
	movl	$4194304, %edx
	jmp	.L1500
.LVL1790:
.L1529:
.LBE5545:
.LBE5553:
.LBE5560:
.LBE5565:
.LBE5623:
.LBB5624:
.LBB5609:
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL1791:
.L1573:
.LBE5609:
.LBE5624:
.LBB5625:
.LBB5566:
.LBB5561:
.LBB5554:
.LBB5542:
	call	cap_frame_cap_get_capFSize.part.121
.LVL1792:
.L1569:
.LBE5542:
.LBE5554:
.LBE5561:
.LBE5566:
.LBB5567:
.LBB5528:
	.p2align 4,,5
	call	cap_untyped_cap_get_capPtr.isra.84.part.85
.LVL1793:
.L1574:
.LBE5528:
.LBE5567:
.LBB5568:
.LBB5562:
.LBB5555:
.LBB5549:
	.p2align 4,,5
	call	cap_zombie_cap_get_capZombieType.isra.94.part.95
.LVL1794:
.L1571:
.LBE5549:
.LBE5555:
.LBB5556:
.LBB5536:
	.p2align 4,,5
	call	cap_untyped_cap_get_capBlockSize.part.132
.LVL1795:
.L1572:
.LBE5536:
.LBE5556:
.LBB5557:
.LBB5539:
	.p2align 4,,5
	call	cap_cnode_cap_get_capCNodeRadix.part.60
.LVL1796:
.L1570:
.LBE5539:
.LBE5557:
.LBE5562:
.LBE5568:
.LBE5625:
.LBB5626:
.LBB5621:
	.p2align 4,,5
	call	cap_irq_handler_cap_get_capIRQ.part.193
.LVL1797:
.L1524:
.LBE5621:
.LBE5626:
.LBB5627:
.LBB5598:
	.p2align 4,,5
	call	cap_cnode_cap_get_capCNodePtr.isra.62.part.63
.LVL1798:
.LBE5598:
.LBE5627:
	.cfi_endproc
.LFE561:
	.size	sameRegionAs, .-sameRegionAs
	.p2align 4,,15
	.globl	isMDBParentOf
	.type	isMDBParentOf, @function
isMDBParentOf:
.LFB528:
	.loc 26 832 0
	.cfi_startproc
.LVL1799:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 26 832 0
	movl	32(%esp), %esi
	movl	36(%esp), %ebx
	.loc 26 833 0
	testb	$2, 12(%esi)
	je	.L1589
	.loc 26 836 0
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameRegionAs
.LVL1800:
	testl	%eax, %eax
	je	.L1589
.LVL1801:
.LBB5652:
.LBB5653:
	.loc 26 839 0
	movl	(%esi), %eax
.LVL1802:
.LBB5654:
.LBB5655:
	.loc 27 872 0
	movl	%eax, %ecx
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %eax
.LVL1803:
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LBE5655:
.LBE5654:
	.loc 26 839 0
	cmpl	$4, %eax
	je	.L1580
	cmpl	$6, %eax
	jne	.L1593
.LBB5656:
.LBB5657:
.LBB5658:
	.loc 27 1127 0
	cmpl	$6, %edx
	movl	4(%esi), %eax
.LVL1804:
	jne	.L1586
	.loc 27 1130 0
	shrl	$3, %eax
.LVL1805:
.LBE5658:
.LBE5657:
	.loc 26 856 0
	testl	%eax, %eax
.LBB5661:
.LBB5659:
	.loc 27 1130 0
	movl	%eax, %edx
.LBE5659:
.LBE5661:
	.loc 26 856 0
	je	.L1593
.LVL1806:
.LBB5662:
.LBB5663:
	.loc 27 1127 0
	movl	(%ebx), %eax
	movl	4(%ebx), %ecx
.LVL1807:
	andl	$15, %eax
	cmpl	$6, %eax
	jne	.L1586
.LVL1808:
.L1599:
	.loc 27 1130 0
	shrl	$3, %ecx
.LBE5663:
.LBE5662:
	.loc 26 860 0
	xorb	%al, %al
	cmpl	%ecx, %edx
	jne	.L1576
	movl	12(%ebx), %eax
	xorl	$1, %eax
	andl	$1, %eax
	jmp	.L1576
.LVL1809:
	.p2align 4,,7
	.p2align 3
.L1589:
.LBE5656:
.LBE5653:
.LBE5652:
	.loc 26 834 0
	xorl	%eax, %eax
.L1576:
	.loc 26 869 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1810:
	.p2align 4,,7
	.p2align 3
.L1593:
	.cfi_restore_state
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB5678:
.LBB5676:
.LBB5665:
	.loc 26 845 0
	movl	$1, %eax
.LBE5665:
.LBE5676:
.LBE5678:
	.loc 26 869 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL1811:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL1812:
	ret
.LVL1813:
	.p2align 4,,7
	.p2align 3
.L1580:
	.cfi_restore_state
.LBB5679:
.LBB5677:
.LBB5674:
.LBB5666:
.LBB5667:
	.loc 27 1008 0
	cmpl	$4, %edx
	movl	4(%esi), %eax
.LVL1814:
	jne	.L1583
	.loc 27 1011 0
	shrl	$3, %eax
.LVL1815:
.LBE5667:
.LBE5666:
	.loc 26 844 0
	testl	%eax, %eax
.LBB5670:
.LBB5668:
	.loc 27 1011 0
	movl	%eax, %edx
.LBE5668:
.LBE5670:
	.loc 26 844 0
	je	.L1593
.LVL1816:
.LBB5671:
.LBB5672:
	.loc 27 1008 0
	movl	(%ebx), %eax
	movl	4(%ebx), %ecx
.LVL1817:
	andl	$15, %eax
	cmpl	$4, %eax
	je	.L1599
.LVL1818:
.L1583:
.LBE5672:
.LBE5671:
.LBB5673:
.LBB5669:
	call	cap_endpoint_cap_get_capEPBadge.part.71
.LVL1819:
.L1586:
.LBE5669:
.LBE5673:
.LBE5674:
.LBB5675:
.LBB5664:
.LBB5660:
	call	cap_async_endpoint_cap_get_capAEPBadge.part.176
.LVL1820:
.LBE5660:
.LBE5664:
.LBE5675:
.LBE5677:
.LBE5679:
	.cfi_endproc
.LFE528:
	.size	isMDBParentOf, .-isMDBParentOf
	.p2align 4,,15
	.globl	sameObjectAs
	.type	sameObjectAs, @function
sameObjectAs:
.LFB562:
	.loc 38 378 0
	.cfi_startproc
.LVL1821:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 38 378 0
	movl	64(%esp), %edx
.LVL1822:
	movl	68(%esp), %esi
	movl	72(%esp), %ecx
.LVL1823:
	movl	76(%esp), %edi
.LBB5708:
.LBB5709:
	.loc 27 872 0
	movl	%edx, %ebx
	andl	$14, %ebx
	cmpl	$14, %ebx
	je	.L1601
	.loc 27 873 0
	movl	%edx, %eax
	andl	$15, %eax
.LBE5709:
.LBE5708:
	.loc 38 379 0
	cmpl	$2, %eax
	je	.L1620
.L1603:
	.loc 38 382 0
	cmpl	$14, %eax
	je	.L1631
.LVL1824:
.L1604:
.LBB5711:
.LBB5712:
.LBB5713:
.LBB5714:
	.loc 27 873 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$14, %ebx
	movl	%eax, %ebp
	movl	%eax, 16(%esp)
	movzbl	%dl, %eax
.LVL1825:
	cmove	%eax, %ebp
.LVL1826:
.LBE5714:
.LBE5713:
.LBE5712:
.LBE5711:
	.loc 38 386 0
	andl	$1, %ebp
.LBB5718:
.LBB5717:
.LBB5716:
.LBB5715:
	.loc 27 873 0
	movl	%eax, 20(%esp)
.LBE5715:
.LBE5716:
.LBE5717:
.LBE5718:
	.loc 38 386 0
	je	.L1607
.LVL1827:
.LBB5719:
.LBB5720:
.LBB5721:
.LBB5722:
	.loc 27 872 0 discriminator 1
	movl	%ecx, %eax
.LVL1828:
	.loc 27 873 0 discriminator 1
	movl	%ecx, %ebp
	.loc 27 872 0 discriminator 1
	andl	$14, %eax
	.loc 27 873 0 discriminator 1
	andl	$15, %ebp
	.loc 27 872 0 discriminator 1
	movl	%eax, 24(%esp)
	.loc 27 873 0 discriminator 1
	movl	%ebp, %eax
	cmpl	$14, 24(%esp)
	movl	%ebp, 28(%esp)
	movzbl	%cl, %ebp
.LVL1829:
	cmove	%ebp, %eax
.LVL1830:
.LBE5722:
.LBE5721:
.LBE5720:
.LBE5719:
	.loc 38 386 0 discriminator 1
	testb	$1, %al
	jne	.L1632
.LVL1831:
.L1607:
	.loc 38 389 0
	movl	%edi, 76(%esp)
	movl	%esi, 68(%esp)
	movl	%ecx, 72(%esp)
	movl	%edx, 64(%esp)
	.loc 38 390 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1832:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1833:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 38 389 0
	jmp	sameRegionAs
.LVL1834:
	.p2align 4,,7
	.p2align 3
.L1601:
	.cfi_restore_state
.LBB5723:
.LBB5710:
	.loc 27 874 0
	movzbl	%dl, %eax
.LBE5710:
.LBE5723:
	.loc 38 379 0
	cmpl	$2, %eax
	jne	.L1603
.L1620:
	.loc 38 390 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 38 380 0
	xorl	%eax, %eax
	.loc 38 390 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1835:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1836:
	.p2align 4,,7
	.p2align 3
.L1631:
	.cfi_restore_state
.LBB5724:
.LBB5725:
	.loc 27 872 0 discriminator 1
	movl	%ecx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	jne	.L1604
.LBE5725:
.LBE5724:
	.loc 38 380 0
	xorb	%al, %al
	.loc 38 382 0
	cmpb	$30, %cl
	je	.L1602
	jmp	.L1604
.LVL1837:
	.p2align 4,,7
	.p2align 3
.L1632:
.LBB5726:
.LBB5727:
.LBB5728:
.LBB5729:
	.loc 27 873 0
	movl	20(%esp), %eax
	cmpl	$14, %ebx
	cmovne	16(%esp), %eax
.LBE5729:
.LBE5728:
	.loc 19 388 0
	cmpl	$1, %eax
	je	.L1633
.L1612:
	.loc 19 396 0
	movl	%ecx, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%edx, (%esp)
	movl	%esi, 4(%esp)
	call	Arch_sameRegionAs
.LVL1838:
.L1602:
.LBE5727:
.LBE5726:
	.loc 38 390 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL1839:
	ret
.LVL1840:
	.p2align 4,,7
	.p2align 3
.L1633:
	.cfi_restore_state
.LBB5745:
.LBB5744:
.LBB5730:
.LBB5731:
	.loc 27 873 0
	cmpl	$14, 24(%esp)
	movl	%ebp, %eax
	cmovne	28(%esp), %eax
.LBE5731:
.LBE5730:
	.loc 19 389 0
	cmpl	$1, %eax
	jne	.L1612
.LVL1841:
.LBB5732:
.LBB5733:
	.loc 27 1507 0
	cmpl	$1, 16(%esp)
	jne	.L1616
	.loc 27 1510 0
	andl	$16777200, %edx
.LVL1842:
	sall	$8, %edx
.LVL1843:
.LBE5733:
.LBE5732:
.LBB5735:
.LBB5736:
	.loc 27 1507 0
	cmpl	$1, 28(%esp)
	jne	.L1616
.LVL1844:
	.loc 27 1510 0
	andl	$16777200, %ecx
.LVL1845:
.LBE5736:
.LBE5735:
	.loc 19 391 0
	xorl	%eax, %eax
.LBB5738:
.LBB5737:
	.loc 27 1510 0
	sall	$8, %ecx
.LBE5737:
.LBE5738:
	.loc 19 391 0
	cmpl	%ecx, %edx
	jne	.L1602
.LVL1846:
.LBB5739:
.LBB5740:
	.loc 27 1409 0
	shrl	$31, %esi
.LVL1847:
.LBE5740:
.LBE5739:
	.loc 19 391 0
	xorl	%eax, %eax
.LBB5741:
.LBB5742:
	.loc 27 1409 0
	shrl	$31, %edi
.LVL1848:
.LBE5742:
.LBE5741:
	.loc 19 391 0
	cmpl	%edi, %esi
	sete	%al
	jmp	.L1602
.LVL1849:
.L1616:
.LBB5743:
.LBB5734:
	call	cap_frame_cap_get_capFBasePtr.isra.90.part.91
.LVL1850:
.LBE5734:
.LBE5743:
.LBE5744:
.LBE5745:
	.cfi_endproc
.LFE562:
	.size	sameObjectAs, .-sameObjectAs
	.p2align 4,,15
	.globl	isFinalCapability
	.type	isFinalCapability, @function
isFinalCapability:
.LFB531:
	.loc 26 900 0
	.cfi_startproc
.LVL1851:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 26 900 0
	movl	32(%esp), %ebx
.LVL1852:
	.loc 26 906 0
	movl	8(%ebx), %ecx
	.loc 26 904 0
	movl	12(%ebx), %esi
.LVL1853:
	.loc 26 906 0
	andl	$-8, %ecx
	je	.L1635
.LVL1854:
.LBB5752:
	.loc 26 912 0
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, 8(%esp)
.LVL1855:
	movl	%edx, 12(%esp)
	movl	4(%ecx), %edx
	movl	(%ecx), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
.LVL1856:
	movl	%eax, %edx
.LVL1857:
.LBE5752:
	.loc 26 916 0
	xorl	%eax, %eax
.LVL1858:
	.loc 26 915 0
	testl	%edx, %edx
	je	.L1635
.LVL1859:
.L1636:
	.loc 26 927 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1860:
	.p2align 4,,7
	.p2align 3
.L1635:
	.cfi_restore_state
	.loc 26 918 0
	andl	$-8, %esi
.LVL1861:
	.loc 26 919 0
	movl	$1, %eax
	.loc 26 918 0
	je	.L1636
.LVL1862:
.LBB5753:
	.loc 26 924 0
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameObjectAs
.LVL1863:
	testl	%eax, %eax
	sete	%al
.LBE5753:
	.loc 26 927 0
	addl	$20, %esp
	.cfi_def_cfa_offset 12
.LBB5754:
	.loc 26 924 0
	movzbl	%al, %eax
.LBE5754:
	.loc 26 927 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL1864:
	ret
	.cfi_endproc
.LFE531:
	.size	isFinalCapability, .-isFinalCapability
	.p2align 4,,15
	.globl	slotCapLongRunningDelete
	.type	slotCapLongRunningDelete, @function
slotCapLongRunningDelete:
.LFB532:
	.loc 26 931 0
	.cfi_startproc
.LVL1865:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 26 931 0
	movl	64(%esp), %esi
	.loc 26 932 0
	movl	(%esi), %ebx
.LVL1866:
.LBB5767:
.LBB5768:
	.loc 27 872 0
	movl	%ebx, %ebp
	.loc 27 873 0
	movl	%ebx, %eax
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%bl, %edx
	cmpl	$14, %ebp
	cmove	%edx, %eax
.LBE5768:
.LBE5767:
	.loc 26 933 0
	xorl	%edi, %edi
	.loc 26 932 0
	testl	%eax, %eax
	je	.L1647
.LVL1867:
.LBB5769:
.LBB5770:
	.loc 26 906 0
	movl	8(%esi), %eax
	.loc 26 904 0
	movl	12(%esi), %edx
.LVL1868:
	.loc 26 906 0
	andl	$-8, %eax
	jne	.L1676
.LVL1869:
.L1648:
	.loc 26 918 0
	andl	$-8, %edx
.LVL1870:
	je	.L1649
.LVL1871:
.LBB5771:
	.loc 26 924 0
	movl	(%edx), %eax
	movl	4(%edx), %edx
.LVL1872:
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameObjectAs
.LVL1873:
.LBE5771:
.LBE5770:
.LBE5769:
	.loc 26 934 0
	testl	%eax, %eax
	jne	.L1673
.L1649:
.LVL1874:
.LBB5774:
.LBB5775:
	.loc 27 873 0
	movl	%ebx, %eax
	movzbl	%bl, %ebx
.LVL1875:
	andl	$15, %eax
.LVL1876:
	cmpl	$14, %ebp
	cmove	%ebx, %eax
.LBE5775:
.LBE5774:
	.loc 26 937 0
	cmpl	$12, %eax
	je	.L1652
	cmpl	$46, %eax
	je	.L1652
	cmpl	$10, %eax
	je	.L1652
.L1673:
	.loc 26 943 0
	xorl	%edi, %edi
.LVL1877:
.L1647:
	.loc 26 945 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%edi, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1878:
	.p2align 4,,7
	.p2align 3
.L1676:
	.cfi_restore_state
.LBB5776:
.LBB5773:
.LBB5772:
	.loc 26 912 0
	movl	4(%esi), %ecx
	movl	%edx, 28(%esp)
.LVL1879:
	movl	(%esi), %edx
.LVL1880:
	movl	%ecx, 12(%esp)
.LVL1881:
	movl	%edx, 8(%esp)
	movl	4(%eax), %edx
	movl	(%eax), %eax
.LVL1882:
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
.LVL1883:
.LBE5772:
	.loc 26 915 0
	movl	28(%esp), %edx
	testl	%eax, %eax
	je	.L1648
.LVL1884:
.LBE5773:
.LBE5776:
	.loc 26 945 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%edi, %eax
.LVL1885:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1886:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1887:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1888:
	.p2align 4,,7
	.p2align 3
.L1652:
	.cfi_restore_state
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	.loc 26 941 0
	movl	$1, %edi
	.loc 26 945 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	movl	%edi, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1889:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE532:
	.size	slotCapLongRunningDelete, .-slotCapLongRunningDelete
	.p2align 4,,15
	.globl	ensureNoChildren
	.type	ensureNoChildren, @function
ensureNoChildren:
.LFB529:
	.loc 26 873 0
	.cfi_startproc
.LVL1890:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 26 873 0
	movl	32(%esp), %ebx
	.loc 26 874 0
	movl	12(%ebx), %eax
	movl	%eax, %esi
	andl	$-8, %esi
	je	.L1696
.LVL1891:
.LBB5807:
.LBB5808:
.LBB5809:
	.loc 26 833 0
	testb	$2, %al
	je	.L1696
	.loc 26 836 0
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameRegionAs
.LVL1892:
	testl	%eax, %eax
	je	.L1696
.LVL1893:
.LBB5810:
.LBB5811:
	.loc 26 839 0
	movl	(%ebx), %eax
.LVL1894:
.LBB5812:
.LBB5813:
	.loc 27 872 0
	movl	%eax, %ecx
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %eax
.LVL1895:
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LBE5813:
.LBE5812:
	.loc 26 839 0
	cmpl	$4, %eax
	je	.L1682
	cmpl	$6, %eax
	jne	.L1681
.LBB5814:
.LBB5815:
.LBB5816:
	.loc 27 1127 0
	cmpl	$6, %edx
	movl	4(%ebx), %eax
.LVL1896:
	jne	.L1689
	.loc 27 1130 0
	shrl	$3, %eax
.LVL1897:
.LBE5816:
.LBE5815:
	.loc 26 856 0
	testl	%eax, %eax
	je	.L1681
.LVL1898:
.LBB5818:
.LBB5819:
	.loc 27 1127 0
	movl	(%esi), %edx
	movl	4(%esi), %ecx
.LVL1899:
	andl	$15, %edx
	cmpl	$6, %edx
	je	.L1708
.LVL1900:
.L1689:
.LBE5819:
.LBE5818:
.LBB5821:
.LBB5817:
	call	cap_async_endpoint_cap_get_capAEPBadge.part.176
.LVL1901:
	.p2align 4,,7
	.p2align 3
.L1682:
.LBE5817:
.LBE5821:
.LBE5814:
.LBB5823:
.LBB5824:
.LBB5825:
	.loc 27 1008 0
	cmpl	$4, %edx
	movl	4(%ebx), %eax
.LVL1902:
	jne	.L1685
	.loc 27 1011 0
	shrl	$3, %eax
.LVL1903:
.LBE5825:
.LBE5824:
	.loc 26 844 0
	testl	%eax, %eax
	je	.L1681
.LVL1904:
.LBB5827:
.LBB5828:
	.loc 27 1008 0
	movl	(%esi), %edx
	movl	4(%esi), %ecx
.LVL1905:
	andl	$15, %edx
	cmpl	$4, %edx
	jne	.L1685
.LVL1906:
.L1708:
.LBE5828:
.LBE5827:
.LBE5823:
.LBB5830:
.LBB5822:
.LBB5820:
	.loc 27 1130 0
	shrl	$3, %ecx
.LBE5820:
.LBE5822:
	.loc 26 860 0
	cmpl	%ecx, %eax
	jne	.L1696
	movl	12(%esi), %eax
	xorl	$1, %eax
	andl	$1, %eax
.LBE5830:
.LBE5811:
.LBE5810:
.LBE5809:
.LBE5808:
	.loc 26 878 0
	testl	%eax, %eax
	jne	.L1681
.LVL1907:
	.p2align 4,,7
	.p2align 3
.L1696:
.LBE5807:
	.loc 26 885 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 26 884 0
	xorl	%eax, %eax
	.loc 26 885 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1908:
	.p2align 4,,7
	.p2align 3
.L1681:
	.cfi_restore_state
.LBB5836:
	.loc 26 879 0
	movl	$9, current_syscall_error+24
.LBE5836:
	.loc 26 885 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB5837:
	.loc 26 880 0
	movl	$3, %eax
.LBE5837:
	.loc 26 885 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL1909:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL1910:
	ret
.LVL1911:
.L1685:
	.cfi_restore_state
.LBB5838:
.LBB5835:
.LBB5834:
.LBB5833:
.LBB5832:
.LBB5831:
.LBB5829:
.LBB5826:
	call	cap_endpoint_cap_get_capEPBadge.part.71
.LVL1912:
.LBE5826:
.LBE5829:
.LBE5831:
.LBE5832:
.LBE5833:
.LBE5834:
.LBE5835:
.LBE5838:
	.cfi_endproc
.LFE529:
	.size	ensureNoChildren, .-ensureNoChildren
	.p2align 4,,15
	.globl	capDL
	.type	capDL, @function
capDL:
.LFB394:
	.loc 31 281 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.p2align 4,,7
	.p2align 3
.L1711:
.LBB5949:
.LBB5950:
.LBB5951:
	.loc 6 21 0
	movzwl	ia32KSdebugPort, %eax
	addl	$5, %eax
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	call	in8
.LVL1913:
	testb	$1, %al
	je	.L1711
	.loc 6 22 0
	movzwl	ia32KSdebugPort, %eax
	movl	%eax, (%esp)
	call	in8
.LVL1914:
.LBE5951:
.LBE5950:
	.loc 31 288 0
	cmpb	$-1, %al
	jne	.L1711
	movl	$-1, %esi
.LVL1915:
	.p2align 4,,7
	.p2align 3
.L1715:
.LBB5952:
.LBB5953:
.LBB5954:
.LBB5955:
	.loc 6 21 0
	movzwl	ia32KSdebugPort, %eax
	addl	$5, %eax
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	call	in8
.LVL1916:
	testb	$1, %al
	je	.L1715
	.loc 6 22 0
	movzwl	ia32KSdebugPort, %eax
	movl	%eax, (%esp)
	call	in8
.LVL1917:
.LBE5955:
.LBE5954:
	.loc 31 34 0
	cmpb	$-1, %al
.LBB5957:
.LBB5956:
	.loc 6 22 0
	movl	%eax, %ebx
.LBE5956:
.LBE5957:
	.loc 31 34 0
	je	.L1715
	.loc 31 37 0
	cmpb	$-86, %al
	je	.L1877
.L1717:
.LVL1918:
.LBE5953:
.LBE5952:
	.loc 31 294 0
	leal	16(%ebx), %eax
	cmpb	$10, %al
	ja	.L1711
	movzbl	%al, %eax
	jmp	*.L1723(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1723:
	.long	.L1722
	.long	.L1724
	.long	.L1725
	.long	.L1726
	.long	.L1727
	.long	.L1728
	.long	.L1729
	.long	.L1711
	.long	.L1711
	.long	.L1730
	.long	.L1731
	.text
.L1731:
.LVL1919:
	.loc 31 403 0
	call	putDebugChar.constprop.247
.LVL1920:
.LBE5949:
	.loc 31 411 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1921:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1922:
.L1730:
	.cfi_restore_state
.LBB6091:
.LBB5961:
.LBB5962:
.LBB5963:
	.loc 31 113 0
	movl	$225, %eax
	call	putEncodedChar
.LVL1923:
	.loc 31 114 0
	xorl	%eax, %eax
	call	putEncodedChar
.LVL1924:
	.loc 31 115 0
	xorl	%eax, %eax
	call	putEncodedChar
.LVL1925:
	.loc 31 116 0
	xorl	%eax, %eax
	call	putEncodedChar
.LVL1926:
.LBE5963:
.LBE5962:
.LBB5964:
.LBB5965:
	.loc 31 113 0
	xorl	%eax, %eax
	call	putEncodedChar
.LVL1927:
	.loc 31 114 0
	xorl	%eax, %eax
	call	putEncodedChar
.LVL1928:
	.loc 31 115 0
	xorl	%eax, %eax
	call	putEncodedChar
.LVL1929:
	.loc 31 116 0
	xorl	%eax, %eax
	call	putEncodedChar
.LVL1930:
.L1873:
.LBE5965:
.LBE5964:
.LBE5961:
	.loc 31 398 0
	call	putDebugChar.constprop.247
.LVL1931:
	.loc 31 400 0
	.p2align 4,,3
	jmp	.L1711
.LVL1932:
.L1729:
.LBB5966:
	.loc 31 320 0
	leal	44(%esp), %eax
	call	getArg32
.LVL1933:
	.loc 31 321 0
	testl	%eax, %eax
	.p2align 4,,2
	je	.L1742
.L1755:
.LVL1934:
.LBE5966:
.LBB5970:
	.loc 31 379 0
	movl	%ebx, %esi
.LVL1935:
	jmp	.L1715
.LVL1936:
.L1728:
.LBE5970:
.LBB6042:
	.loc 31 309 0
	leal	44(%esp), %eax
	call	getArg32
.LVL1937:
	.loc 31 310 0
	testl	%eax, %eax
	jne	.L1755
	.loc 31 313 0
	movl	44(%esp), %edi
.LVL1938:
.LBB6043:
.LBB6044:
	.loc 31 156 0
	xorl	%ebx, %ebx
.LVL1939:
	jmp	.L1741
.LVL1940:
	.p2align 4,,7
	.p2align 3
.L1739:
	addl	$1, %ebx
.LVL1941:
	cmpl	$1024, %ebx
	je	.L1873
.LVL1942:
.L1741:
.LBB6045:
	.loc 31 157 0
	movl	(%edi,%ebx,4), %esi
.LVL1943:
	.loc 31 158 0
	testl	$-4096, %esi
	je	.L1739
.LVL1944:
	testl	$1, %esi
	je	.L1739
.LVL1945:
	testl	$4, %esi
	je	.L1739
	.loc 31 159 0
	movl	%ebx, %eax
	call	sendWord
.LVL1946:
	.loc 31 160 0
	movl	%esi, %eax
	call	sendWord
.LVL1947:
	jmp	.L1739
.LVL1948:
.L1727:
	movl	intStateIRQNode, %ebp
.LBE6045:
.LBE6044:
.LBE6043:
.LBE6042:
.LBB6046:
.LBB6047:
.LBB6048:
.LBB6049:
	.loc 31 257 0
	xorl	%edi, %edi
	jmp	.L1785
.LVL1949:
	.p2align 4,,7
	.p2align 3
.L1781:
	addl	$1, %edi
.LVL1950:
	addl	$16, %ebp
	cmpl	$256, %edi
	je	.L1873
.LVL1951:
.L1785:
.LBB6050:
	.loc 31 258 0
	movl	0(%ebp), %esi
.LVL1952:
	movl	4(%ebp), %eax
.LBB6051:
.LBB6052:
	.loc 27 872 0
	movl	%esi, %ebx
	.loc 27 873 0
	movl	%esi, %edx
.LBE6052:
.LBE6051:
	.loc 31 258 0
	movl	%eax, 16(%esp)
.LVL1953:
.LBB6054:
.LBB6053:
	.loc 27 872 0
	andl	$14, %ebx
	.loc 27 873 0
	movl	%esi, %eax
.LVL1954:
	andl	$15, %eax
	movzbl	%dl, %ecx
	cmpl	$14, %ebx
	cmove	%ecx, %eax
.LBE6053:
.LBE6054:
	.loc 31 259 0
	testl	%eax, %eax
	je	.L1781
.LVL1955:
.LBB6055:
.LBB6056:
.LBB6057:
	.loc 31 123 0
	movl	8(%ebp), %ebx
	andl	$-8, %ebx
.LVL1956:
	jne	.L1783
	jmp	.L1880
.LVL1957:
	.p2align 4,,7
	.p2align 3
.L1784:
.LBB6058:
.LBB6059:
	.loc 27 824 0
	movl	8(%ebx), %ebx
.LVL1958:
.LBE6059:
.LBE6058:
	.loc 31 123 0
	andl	$-8, %ebx
.LVL1959:
	je	.L1782
.L1783:
	movl	%ebp, 4(%esp)
	movl	%ebx, (%esp)
	call	isMDBParentOf
.LVL1960:
	testl	%eax, %eax
	movl	%eax, %ecx
	je	.L1784
	movl	%ebx, %ecx
.L1782:
.LBE6057:
.LBE6056:
	.loc 31 261 0
	movl	%edi, %eax
	movl	%ecx, 20(%esp)
	call	sendWord
.LVL1961:
	.loc 31 262 0
	movl	%esi, %eax
	call	sendWord
.LVL1962:
	.loc 31 263 0
	movl	16(%esp), %eax
	call	sendWord
.LVL1963:
	.loc 31 264 0
	movl	20(%esp), %ecx
	movl	%ecx, %eax
	call	sendWord
.LVL1964:
	jmp	.L1781
.LVL1965:
.L1725:
.LBE6055:
.LBE6050:
.LBE6049:
.LBE6048:
.LBE6047:
.LBE6046:
.LBB6067:
	.loc 31 366 0
	leal	44(%esp), %eax
	call	getArg32
.LVL1966:
	.loc 31 367 0
	testl	%eax, %eax
	.p2align 4,,2
	jne	.L1755
.LVL1967:
.LBB6068:
.LBB6069:
	.loc 31 241 0
	movl	44(%esp), %eax
.LVL1968:
.LBB6070:
.LBB6071:
	.loc 27 425 0
	movl	4(%eax), %ebx
.LVL1969:
.LBE6071:
.LBE6070:
.LBB6072:
.LBB6073:
	.loc 27 438 0
	movl	(%eax), %esi
	andl	$-16, %esi
.LVL1970:
.LBE6073:
.LBE6072:
	.loc 31 243 0
	andl	$-16, %ebx
.LVL1971:
	je	.L1873
	.loc 31 246 0
	cmpl	%esi, %ebx
	je	.L1753
.LVL1972:
.L1754:
	.loc 31 247 0
	movl	%ebx, %eax
	call	sendWord
.LVL1973:
	.loc 31 248 0
	movl	648(%ebx), %ebx
.LVL1974:
	.loc 31 246 0
	cmpl	%ebx, %esi
	jne	.L1754
.L1753:
	.loc 31 250 0
	movl	%ebx, %eax
	call	sendWord
.LVL1975:
	jmp	.L1873
.LVL1976:
.L1724:
.LBE6069:
.LBE6068:
.LBE6067:
.LBB6074:
.LBB6075:
	.loc 31 226 0
	movl	ksCurThread, %ebx
.LVL1977:
	.loc 31 227 0
	xorl	%esi, %esi
	movzbl	%bl, %eax
.LBB6076:
.LBB6077:
	.loc 31 113 0
	call	putEncodedChar
.LVL1978:
	movzbl	%bh, %eax
	.loc 31 114 0
	call	putEncodedChar
.LVL1979:
	.loc 31 115 0
	movl	%ebx, %eax
	shrl	$16, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL1980:
	.loc 31 116 0
	movl	%ebx, %eax
	shrl	$24, %eax
	call	putEncodedChar
.LVL1981:
	.p2align 4,,7
	.p2align 3
.L1750:
.LBE6077:
.LBE6076:
.LBB6078:
	.loc 31 228 0
	movl	ksReadyQueues(,%esi,8), %ebx
.LVL1982:
	.loc 31 229 0
	testl	%ebx, %ebx
	je	.L1746
	.loc 31 230 0
	cmpl	%ebx, ksReadyQueues+4(,%esi,8)
	je	.L1747
	.p2align 4,,7
	.p2align 3
.L1748:
	.loc 31 231 0
	movl	%ebx, %eax
	call	sendWord
.LVL1983:
	.loc 31 232 0
	movl	640(%ebx), %ebx
.LVL1984:
	.loc 31 230 0
	cmpl	ksReadyQueues+4(,%esi,8), %ebx
	jne	.L1748
.L1747:
	.loc 31 234 0
	movl	%ebx, %eax
	call	sendWord
.LVL1985:
.L1746:
.LBE6078:
	.loc 31 227 0
	addl	$1, %esi
.LVL1986:
	cmpl	$256, %esi
	jne	.L1750
	jmp	.L1873
.LVL1987:
.L1726:
.LBE6075:
.LBE6074:
.LBB6079:
	.loc 31 377 0
	leal	40(%esp), %eax
	call	getArg32
.LVL1988:
	.loc 31 378 0
	testl	%eax, %eax
	.p2align 4,,2
	jne	.L1755
	.loc 31 381 0
	leal	44(%esp), %eax
.LVL1989:
	call	getArg32
.LVL1990:
	.loc 31 382 0
	testl	%eax, %eax
	jne	.L1755
.LVL1991:
.LBB5971:
.LBB5972:
	.loc 31 257 0
	movl	44(%esp), %ecx
	movl	$1, %ebp
	xorl	%edi, %edi
	movl	40(%esp), %esi
	sall	%cl, %ebp
	testl	%ebp, %ebp
	je	.L1873
	movl	%ebp, 28(%esp)
	jmp	.L1843
.LVL1992:
.L1759:
	addl	$1, %edi
.LVL1993:
	addl	$16, %esi
	cmpl	28(%esp), %edi
	je	.L1873
.LVL1994:
.L1843:
.LBB5973:
	.loc 31 258 0
	movl	(%esi), %ebp
.LVL1995:
	movl	4(%esi), %eax
.LBB5974:
.LBB5975:
	.loc 27 872 0
	movl	%ebp, %ecx
	.loc 27 873 0
	movl	%ebp, %edx
.LBE5975:
.LBE5974:
	.loc 31 258 0
	movl	%eax, 16(%esp)
.LVL1996:
.LBB5977:
.LBB5976:
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	movl	%ebp, %eax
.LVL1997:
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmovne	%eax, %edx
.LBE5976:
.LBE5977:
	.loc 31 259 0
	testl	%edx, %edx
	je	.L1759
.LVL1998:
.LBB5978:
.LBB5979:
.LBB5980:
	.loc 31 123 0
	movl	8(%esi), %ebx
	andl	$-8, %ebx
.LVL1999:
	je	.L1793
.LBB5981:
.LBB5982:
.LBB5983:
.LBB5984:
.LBB5985:
.LBB5986:
.LBB5987:
	.loc 27 1008 0
	movl	%eax, 20(%esp)
	.loc 27 1011 0
	movl	16(%esp), %eax
	shrl	$3, %eax
	movl	%eax, 24(%esp)
.L1761:
.LVL2000:
.LBE5987:
.LBE5986:
.LBE5985:
.LBE5984:
.LBE5983:
	.loc 26 833 0
	testb	$2, 12(%ebx)
	je	.L1762
	.loc 26 836 0
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameRegionAs
.LVL2001:
	testl	%eax, %eax
	je	.L1762
.LVL2002:
.LBB6010:
.LBB6006:
	.loc 26 839 0
	movl	(%ebx), %edx
.LVL2003:
.LBB5994:
.LBB5995:
	.loc 27 872 0
	movl	%edx, %ecx
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL2004:
	cmpl	$14, %ecx
	cmovne	%eax, %edx
.LBE5995:
.LBE5994:
	.loc 26 839 0
	cmpl	$4, %edx
	je	.L1766
	cmpl	$6, %edx
	je	.L1767
.LVL2005:
.L1760:
.LBE6006:
.LBE6010:
.LBE5982:
.LBE5981:
.LBE5980:
.LBE5979:
	.loc 31 261 0
	movl	%edi, %eax
	call	sendWord
.LVL2006:
	.loc 31 262 0
	movl	%ebp, %eax
	call	sendWord
.LVL2007:
	.loc 31 263 0
	movl	16(%esp), %eax
	call	sendWord
.LVL2008:
	.loc 31 264 0
	movl	%ebx, %eax
	call	sendWord
.LVL2009:
	jmp	.L1759
.LVL2010:
.L1722:
.LBE5978:
.LBE5973:
.LBE5972:
.LBE5971:
.LBE6079:
.LBB6080:
	.loc 31 298 0
	leal	44(%esp), %eax
	call	getArg32
.LVL2011:
	.loc 31 299 0
	testl	%eax, %eax
	.p2align 4,,2
	jne	.L1755
	.loc 31 302 0
	movl	44(%esp), %edi
.LVL2012:
.LBB6081:
.LBB6082:
	.loc 31 135 0
	xorl	%ebx, %ebx
.LVL2013:
	jmp	.L1737
.LVL2014:
	.p2align 4,,7
	.p2align 3
.L1879:
.LBB6083:
	.loc 31 138 0
	testl	$-4096, %esi
	je	.L1734
.LVL2015:
.L1870:
	.loc 31 141 0
	testl	$1, %esi
	je	.L1734
.LVL2016:
	.loc 31 142 0
	testl	$4, %esi
	je	.L1734
.LVL2017:
	.loc 31 145 0
	cmpl	$895, %ebx
	ja	.L1734
	.loc 31 146 0
	movl	%ebx, %eax
	call	sendWord
.LVL2018:
	.loc 31 147 0
	movl	%esi, %eax
	call	sendWord
.LVL2019:
.L1734:
.LBE6083:
	.loc 31 135 0
	addl	$1, %ebx
.LVL2020:
	cmpl	$1024, %ebx
	je	.L1873
.LVL2021:
.L1737:
.LBB6084:
	.loc 31 136 0
	movl	(%edi,%ebx,4), %esi
.LVL2022:
	.loc 31 138 0
	testl	$128, %esi
	je	.L1879
.LVL2023:
	.loc 31 141 0
	testl	$-4194304, %esi
	je	.L1734
	jmp	.L1870
.LVL2024:
.L1742:
.LBE6084:
.LBE6082:
.LBE6081:
.LBE6080:
.LBB6085:
	.loc 31 324 0
	movl	44(%esp), %edi
.LVL2025:
.LBB5967:
.LBB5968:
	.loc 31 169 0
	xorl	%ebx, %ebx
.LVL2026:
	.p2align 4,,7
	.p2align 3
.L1745:
.LBB5969:
	.loc 31 170 0
	movl	(%edi,%ebx,4), %esi
.LVL2027:
	.loc 31 171 0
	testl	%esi, %esi
	je	.L1743
	.loc 31 172 0
	movl	%ebx, %eax
	call	sendWord
.LVL2028:
	.loc 31 173 0
	movl	%esi, %eax
	call	sendWord
.LVL2029:
.L1743:
.LBE5969:
	.loc 31 169 0
	addl	$1, %ebx
.LVL2030:
	cmpl	$1024, %ebx
	jne	.L1745
	jmp	.L1873
.LVL2031:
.L1767:
.LBE5968:
.LBE5967:
.LBE6085:
.LBB6086:
.LBB6039:
.LBB6036:
.LBB6033:
.LBB6030:
.LBB6027:
.LBB6024:
.LBB6017:
.LBB6014:
.LBB6011:
.LBB6007:
.LBB5996:
.LBB5997:
.LBB5998:
	.loc 27 1127 0
	cmpl	$6, %eax
	movl	4(%ebx), %edx
.LVL2032:
	jne	.L1775
	.loc 27 1130 0
	movl	%edx, %eax
	shrl	$3, %eax
.LBE5998:
.LBE5997:
	.loc 26 856 0
	testl	%eax, %eax
	je	.L1760
.LVL2033:
.LBB6000:
.LBB6001:
	.loc 27 1127 0
	cmpl	$6, 20(%esp)
	jne	.L1775
.LBE6001:
.LBE6000:
	.loc 26 860 0
	cmpl	%eax, 24(%esp)
	jne	.L1762
.LVL2034:
.L1875:
	movl	12(%esi), %eax
	xorl	$1, %eax
	andl	$1, %eax
.LBE5996:
.LBE6007:
.LBE6011:
.LBE6014:
.LBE6017:
	.loc 31 123 0
	testl	%eax, %eax
	jne	.L1760
.LVL2035:
.L1762:
.LBB6018:
.LBB6019:
	.loc 27 824 0
	movl	8(%ebx), %ebx
.LVL2036:
.LBE6019:
.LBE6018:
	.loc 31 123 0
	andl	$-8, %ebx
.LVL2037:
	jne	.L1761
.LVL2038:
.L1793:
	xorl	%ebx, %ebx
.LVL2039:
	jmp	.L1760
.LVL2040:
	.p2align 4,,7
	.p2align 3
.L1877:
.LBE6024:
.LBE6027:
.LBE6030:
.LBE6033:
.LBE6036:
.LBE6039:
.LBE6086:
.LBB6087:
.LBB5960:
.LBB5958:
.LBB5959:
	.loc 31 38 0
	call	getDebugChar
.LVL2041:
	.loc 31 39 0
	cmpb	$-1, %al
	.p2align 4,,4
	je	.L1715
	.loc 31 42 0
	cmpb	$-95, %al
	.p2align 4,,4
	je	.L1711
	cmpb	$-94, %al
	.loc 31 50 0
	movl	$-69, %ebx
	.loc 31 42 0
	je	.L1717
	cmpb	$-96, %al
	.loc 31 47 0
	movl	$-1, %ebx
	.loc 31 42 0
	je	.L1717
	.loc 31 53 0
	leal	-20(%eax), %ebx
	cmpb	$20, %bl
	cmovae	%esi, %ebx
	jmp	.L1717
.LVL2042:
.L1766:
.LBE5959:
.LBE5958:
.LBE5960:
.LBE6087:
.LBB6088:
.LBB6040:
.LBB6037:
.LBB6034:
.LBB6031:
.LBB6028:
.LBB6025:
.LBB6021:
.LBB6015:
.LBB6012:
.LBB6008:
.LBB6003:
.LBB5989:
.LBB5990:
	.loc 27 1008 0
	cmpl	$4, %eax
	movl	4(%ebx), %edx
.LVL2043:
	jne	.L1770
	.loc 27 1011 0
	movl	%edx, %eax
	shrl	$3, %eax
.LBE5990:
.LBE5989:
	.loc 26 844 0
	testl	%eax, %eax
	je	.L1760
.LVL2044:
.LBB5992:
.LBB5988:
	.loc 27 1008 0
	cmpl	$4, 20(%esp)
	jne	.L1770
.LBE5988:
.LBE5992:
	.loc 26 847 0
	cmpl	24(%esp), %eax
	je	.L1875
.LBE6003:
.LBE6008:
.LBE6012:
.LBE6015:
.LBE6021:
.LBB6022:
.LBB6020:
	.loc 27 824 0
	movl	8(%ebx), %ebx
.LVL2045:
.LBE6020:
.LBE6022:
	.loc 31 123 0
	andl	$-8, %ebx
.LVL2046:
	jne	.L1761
	jmp	.L1793
.LVL2047:
.L1880:
.LBE6025:
.LBE6028:
.LBE6031:
.LBE6034:
.LBE6037:
.LBE6040:
.LBE6088:
.LBB6089:
.LBB6066:
.LBB6065:
.LBB6064:
.LBB6063:
.LBB6062:
.LBB6061:
.LBB6060:
	xorl	%ecx, %ecx
	.p2align 4,,3
	jmp	.L1782
.LVL2048:
.L1775:
.LBE6060:
.LBE6061:
.LBE6062:
.LBE6063:
.LBE6064:
.LBE6065:
.LBE6066:
.LBE6089:
.LBB6090:
.LBB6041:
.LBB6038:
.LBB6035:
.LBB6032:
.LBB6029:
.LBB6026:
.LBB6023:
.LBB6016:
.LBB6013:
.LBB6009:
.LBB6004:
.LBB6002:
.LBB5999:
	.p2align 4,,9
	call	cap_async_endpoint_cap_get_capAEPBadge.part.176
.LVL2049:
.L1770:
.LBE5999:
.LBE6002:
.LBE6004:
.LBB6005:
.LBB5993:
.LBB5991:
	.p2align 4,,6
	call	cap_endpoint_cap_get_capEPBadge.part.71
.LVL2050:
.LBE5991:
.LBE5993:
.LBE6005:
.LBE6009:
.LBE6013:
.LBE6016:
.LBE6023:
.LBE6026:
.LBE6029:
.LBE6032:
.LBE6035:
.LBE6038:
.LBE6041:
.LBE6090:
.LBE6091:
	.cfi_endproc
.LFE394:
	.size	capDL, .-capDL
	.section	.text.unlikely
	.type	thread_state_ptr_set_tcbQueued.isra.195.part.196, @function
thread_state_ptr_set_tcbQueued.isra.195.part.196:
.LFB836:
	.loc 27 574 0
	.cfi_startproc
.LVL2051:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 27 576 0
	movl	$__FUNCTION__.1362, 12(%esp)
	movl	$576, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC90, (%esp)
	call	_assert_fail
.LVL2052:
	.cfi_endproc
.LFE836:
	.size	thread_state_ptr_set_tcbQueued.isra.195.part.196, .-thread_state_ptr_set_tcbQueued.isra.195.part.196
	.text
	.p2align 4,,15
	.type	tcbSchedDequeue.part.202, @function
tcbSchedDequeue.part.202:
.LFB842:
	.loc 30 95 0
	.cfi_startproc
.LVL2053:
.LBB6104:
.LBB6105:
.LBB6106:
	.loc 30 30 0
	movl	620(%eax), %edx
.LBE6106:
.LBE6105:
	.loc 30 108 0
	movl	644(%eax), %ecx
.LBE6104:
	.loc 30 95 0
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
.LVL2054:
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
.LBB6111:
.LBB6108:
.LBB6107:
	.loc 30 30 0
	sall	$8, %edx
.LVL2055:
	addl	624(%eax), %edx
.LBE6107:
.LBE6108:
	.loc 30 108 0
	testl	%ecx, %ecx
.LBE6111:
	.loc 30 95 0
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
.LBB6112:
	.loc 30 106 0
	leal	ksReadyQueues(,%edx,8), %ebx
	movl	ksReadyQueues(,%edx,8), %edi
.LVL2056:
	movl	4(%ebx), %ebp
.LVL2057:
	.loc 30 108 0
	je	.L1884
	.loc 30 109 0
	movl	640(%eax), %esi
	movl	%esi, 640(%ecx)
	movl	640(%eax), %esi
	.loc 30 114 0
	testl	%esi, %esi
	je	.L1887
.L1889:
	.loc 30 115 0
	movl	%ecx, 644(%esi)
.LVL2058:
.L1886:
	.loc 30 120 0
	movl	%edi, ksReadyQueues(,%edx,8)
	movl	%ebp, 4(%ebx)
.LVL2059:
.LBE6112:
	.loc 30 124 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LBB6113:
.LBB6109:
.LBB6110:
	.loc 27 577 0
	andl	$-2, 600(%eax)
.LBE6110:
.LBE6109:
.LBE6113:
	.loc 30 124 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL2060:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL2061:
	ret
.LVL2062:
	.p2align 4,,7
	.p2align 3
.L1884:
	.cfi_restore_state
.LBB6114:
	.loc 30 111 0
	movl	640(%eax), %edi
.LVL2063:
	movl	%edi, %esi
	.loc 30 114 0
	testl	%esi, %esi
	jne	.L1889
	.p2align 4,,7
	.p2align 3
.L1887:
	.loc 30 108 0
	movl	%ecx, %ebp
.LVL2064:
	jmp	.L1886
.LBE6114:
	.cfi_endproc
.LFE842:
	.size	tcbSchedDequeue.part.202, .-tcbSchedDequeue.part.202
	.p2align 4,,15
	.type	tcbSchedEnqueue.part.197, @function
tcbSchedEnqueue.part.197:
.LFB837:
	.loc 30 35 0
	.cfi_startproc
.LVL2065:
.LBB6127:
.LBB6128:
.LBB6129:
	.loc 30 30 0
	movl	620(%eax), %edx
.LBE6129:
.LBE6128:
.LBE6127:
	.loc 30 35 0
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
.LVL2066:
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
.LBB6134:
.LBB6131:
.LBB6130:
	.loc 30 30 0
	sall	$8, %edx
.LVL2067:
	addl	624(%eax), %edx
.LBE6130:
.LBE6131:
	.loc 30 46 0
	leal	ksReadyQueues(,%edx,8), %ebx
	movl	ksReadyQueues(,%edx,8), %esi
.LVL2068:
	movl	4(%ebx), %ecx
.LVL2069:
	.loc 30 48 0
	testl	%ecx, %ecx
	je	.L1892
	.loc 30 51 0
	movl	%eax, 644(%esi)
.LVL2070:
.L1891:
	.loc 30 54 0
	movl	%esi, 640(%eax)
.LVL2071:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ecx, 4(%ebx)
.LVL2072:
.LBE6134:
	.loc 30 61 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LBB6135:
.LBB6132:
.LBB6133:
	.loc 27 578 0
	orl	$1, 600(%eax)
.LBE6133:
.LBE6132:
.LBE6135:
	.loc 30 61 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL2073:
	.p2align 4,,7
	.p2align 3
.L1892:
	.cfi_restore_state
.LBB6136:
	.loc 30 48 0
	movl	%eax, %ecx
.LVL2074:
	jmp	.L1891
.LBE6136:
	.cfi_endproc
.LFE837:
	.size	tcbSchedEnqueue.part.197, .-tcbSchedEnqueue.part.197
	.p2align 4,,15
	.globl	tcbSchedAppend
	.type	tcbSchedAppend, @function
tcbSchedAppend:
.LFB573:
	.loc 30 66 0
	.cfi_startproc
.LVL2075:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 30 66 0
	movl	16(%esp), %eax
	.loc 30 67 0
	movl	600(%eax), %ecx
	testb	$1, %cl
	jne	.L1894
.LVL2076:
.LBB6148:
.LBB6149:
.LBB6150:
.LBB6151:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE6151:
.LBE6150:
	.loc 30 76 0
	movl	ksReadyQueues(,%edx,8), %ebx
.LVL2077:
	leal	ksReadyQueues(,%edx,8), %esi
	movl	4(%esi), %edi
.LVL2078:
	.loc 30 78 0
	testl	%ebx, %ebx
	je	.L1897
	.loc 30 81 0
	movl	%eax, 640(%edi)
.LVL2079:
.L1896:
.LBB6152:
.LBB6153:
	.loc 27 578 0
	orl	$1, %ecx
.LBE6153:
.LBE6152:
	.loc 30 83 0
	movl	%edi, 644(%eax)
	.loc 30 84 0
	movl	$0, 640(%eax)
.LVL2080:
	.loc 30 87 0
	movl	%ebx, ksReadyQueues(,%edx,8)
.LVL2081:
	movl	%eax, 4(%esi)
.LVL2082:
.LBB6155:
.LBB6154:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
.LVL2083:
.L1894:
.LBE6154:
.LBE6155:
.LBE6149:
.LBE6148:
	.loc 30 91 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2084:
	.p2align 4,,7
	.p2align 3
.L1897:
	.cfi_restore_state
.LBB6157:
.LBB6156:
	.loc 30 78 0
	movl	%eax, %ebx
.LVL2085:
	jmp	.L1896
.LBE6156:
.LBE6157:
	.cfi_endproc
.LFE573:
	.size	tcbSchedAppend, .-tcbSchedAppend
	.p2align 4,,15
	.globl	tcbSchedDequeue
	.type	tcbSchedDequeue, @function
tcbSchedDequeue:
.LFB574:
	.loc 30 96 0
	.cfi_startproc
.LVL2086:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	.loc 30 96 0
	movl	24(%esp), %eax
	.loc 30 97 0
	movl	600(%eax), %ecx
	testb	$1, %cl
	je	.L1899
.LVL2087:
.LBB6169:
.LBB6170:
.LBB6171:
.LBB6172:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE6172:
.LBE6171:
	.loc 30 106 0
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %ebp
.LVL2088:
	movl	4(%esi), %ebx
	movl	%ebx, (%esp)
.LVL2089:
	.loc 30 108 0
	movl	644(%eax), %ebx
.LVL2090:
	testl	%ebx, %ebx
	je	.L1901
	.loc 30 109 0
	movl	640(%eax), %edi
	movl	%edi, 640(%ebx)
	movl	640(%eax), %edi
.L1902:
	.loc 30 114 0
	testl	%edi, %edi
	je	.L1904
	.loc 30 115 0
	movl	%ebx, 644(%edi)
	movl	(%esp), %edi
.LVL2091:
.L1903:
.LBB6173:
.LBB6174:
	.loc 27 577 0
	andl	$-2, %ecx
.LBE6174:
.LBE6173:
	.loc 30 120 0
	movl	%ebp, ksReadyQueues(,%edx,8)
.LVL2092:
	movl	%edi, 4(%esi)
.LVL2093:
.LBB6176:
.LBB6175:
	.loc 27 577 0
	movl	%ecx, 600(%eax)
.LVL2094:
.L1899:
.LBE6175:
.LBE6176:
.LBE6170:
.LBE6169:
	.loc 30 124 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2095:
	.p2align 4,,7
	.p2align 3
.L1901:
	.cfi_restore_state
.LBB6178:
.LBB6177:
	.loc 30 111 0
	movl	640(%eax), %ebp
.LVL2096:
	movl	%ebp, %edi
	jmp	.L1902
	.p2align 4,,7
	.p2align 3
.L1904:
	.loc 30 108 0
	movl	%ebx, (%esp)
.LVL2097:
	movl	%ebx, %edi
	jmp	.L1903
.LBE6177:
.LBE6178:
	.cfi_endproc
.LFE574:
	.size	tcbSchedDequeue, .-tcbSchedDequeue
	.p2align 4,,15
	.globl	tcbSchedEnqueue
	.type	tcbSchedEnqueue, @function
tcbSchedEnqueue:
.LFB572:
	.loc 30 36 0
	.cfi_startproc
.LVL2098:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 30 36 0
	movl	16(%esp), %eax
	.loc 30 37 0
	movl	600(%eax), %ecx
	testb	$1, %cl
	jne	.L1909
.LVL2099:
.LBB6190:
.LBB6191:
.LBB6192:
.LBB6193:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE6193:
.LBE6192:
	.loc 30 46 0
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
.LVL2100:
	movl	4(%esi), %ebx
.LVL2101:
	.loc 30 48 0
	testl	%ebx, %ebx
	je	.L1912
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2102:
.L1911:
.LBB6194:
.LBB6195:
	.loc 27 578 0
	orl	$1, %ecx
.LBE6195:
.LBE6194:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2103:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%edx,8)
.LVL2104:
	movl	%ebx, 4(%esi)
.LVL2105:
.LBB6197:
.LBB6196:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
.LVL2106:
.L1909:
.LBE6196:
.LBE6197:
.LBE6191:
.LBE6190:
	.loc 30 61 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2107:
	.p2align 4,,7
	.p2align 3
.L1912:
	.cfi_restore_state
.LBB6199:
.LBB6198:
	.loc 30 48 0
	movl	%eax, %ebx
.LVL2108:
	jmp	.L1911
.LBE6198:
.LBE6199:
	.cfi_endproc
.LFE572:
	.size	tcbSchedEnqueue, .-tcbSchedEnqueue
	.p2align 4,,15
	.globl	rescheduleRequired
	.type	rescheduleRequired, @function
rescheduleRequired:
.LFB488:
	.loc 22 465 0
	.cfi_startproc
	.loc 22 467 0
	movl	ksSchedulerAction, %eax
	leal	-1(%eax), %edx
	.loc 22 466 0
	cmpl	$-3, %edx
	ja	.L1919
.LBB6217:
.LBB6218:
	.loc 30 37 0
	movl	600(%eax), %ecx
	testb	$1, %cl
	je	.L1920
.L1919:
.LBE6218:
.LBE6217:
	.loc 22 470 0
	movl	$-1, ksSchedulerAction
	ret
	.p2align 4,,7
	.p2align 3
.L1920:
	.loc 22 465 0
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LBB6234:
.LBB6231:
.LBB6219:
.LBB6220:
.LBB6221:
.LBB6222:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE6222:
.LBE6221:
	.loc 30 46 0
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
	movl	4(%esi), %ebx
	.loc 30 48 0
	testl	%ebx, %ebx
	je	.L1917
	.loc 30 51 0
	movl	%eax, 644(%edi)
.L1916:
.LBB6223:
.LBB6224:
	.loc 27 578 0
	orl	$1, %ecx
.LBE6224:
.LBE6223:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LBE6220:
.LBE6219:
.LBE6231:
.LBE6234:
	.loc 22 470 0
	movl	$-1, ksSchedulerAction
.LBB6235:
.LBB6232:
.LBB6229:
.LBB6227:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ebx, 4(%esi)
.LBB6226:
.LBB6225:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
.LBE6225:
.LBE6226:
.LBE6227:
.LBE6229:
.LBE6232:
.LBE6235:
	.loc 22 471 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1917:
	.cfi_restore_state
.LBB6236:
.LBB6233:
.LBB6230:
.LBB6228:
	.loc 30 48 0
	movl	%eax, %ebx
	jmp	.L1916
.LBE6228:
.LBE6230:
.LBE6233:
.LBE6236:
	.cfi_endproc
.LFE488:
	.size	rescheduleRequired, .-rescheduleRequired
	.p2align 4,,15
	.globl	scheduleTCB
	.type	scheduleTCB, @function
scheduleTCB:
.LFB486:
	.loc 22 433 0
	.cfi_startproc
.LVL2109:
	.loc 22 433 0
	movl	4(%esp), %eax
	.loc 22 434 0
	cmpl	ksCurThread, %eax
	je	.L1924
.L1921:
	rep ret
.LVL2110:
	.p2align 4,,7
	.p2align 3
.L1924:
	.loc 22 434 0 is_stmt 0 discriminator 1
	movl	ksSchedulerAction, %edx
	testl	%edx, %edx
	jne	.L1921
.LVL2111:
.LBB6243:
.LBB6244:
.LBB6245:
.LBB6246:
.LBB6247:
.LBB6248:
	.loc 27 614 0 is_stmt 1
	movl	592(%eax), %eax
.LVL2112:
	andl	$15, %eax
.LBE6248:
.LBE6247:
	.loc 22 49 0
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L1921
.LBE6246:
.LBE6245:
	.loc 22 437 0
	jmp	rescheduleRequired
.LVL2113:
.LBE6244:
.LBE6243:
	.cfi_endproc
.LFE486:
	.size	scheduleTCB, .-scheduleTCB
	.p2align 4,,15
	.globl	setThreadState
	.type	setThreadState, @function
setThreadState:
.LFB485:
	.loc 22 426 0
	.cfi_startproc
.LVL2114:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 22 426 0
	movl	20(%esp), %ecx
	movl	16(%esp), %edx
.LVL2115:
.LBB6259:
.LBB6260:
	.loc 27 625 0
	testl	$-16, %ecx
	jne	.L1930
	.loc 27 626 0
	movl	592(%edx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	%ecx, %eax
.LBE6260:
.LBE6259:
.LBB6263:
.LBB6264:
	.loc 22 434 0
	cmpl	ksCurThread, %edx
.LBE6264:
.LBE6263:
.LBB6276:
.LBB6261:
	.loc 27 627 0
	movl	%eax, 592(%edx)
.LVL2116:
.LBE6261:
.LBE6276:
.LBB6277:
.LBB6273:
	.loc 22 434 0
	je	.L1931
.LVL2117:
.L1925:
.LBE6273:
.LBE6277:
	.loc 22 429 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL2118:
	.p2align 4,,7
	.p2align 3
.L1931:
	.cfi_restore_state
.LBB6278:
.LBB6274:
	.loc 22 434 0
	movl	ksSchedulerAction, %edx
.LVL2119:
	testl	%edx, %edx
	jne	.L1925
.LVL2120:
.LBB6265:
.LBB6266:
.LBB6267:
.LBB6268:
.LBB6269:
.LBB6270:
	.loc 27 614 0
	andl	$15, %eax
.LBE6270:
.LBE6269:
	.loc 22 49 0
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L1925
.LBE6268:
.LBE6267:
.LBE6266:
.LBE6265:
.LBE6274:
.LBE6278:
	.loc 22 429 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
.LBB6279:
.LBB6275:
.LBB6272:
.LBB6271:
	.loc 22 437 0
	jmp	rescheduleRequired
.LVL2121:
.L1930:
	.cfi_restore_state
.LBE6271:
.LBE6272:
.LBE6275:
.LBE6279:
.LBB6280:
.LBB6262:
	call	thread_state_ptr_set_tsType.isra.166.part.167
.LVL2122:
.LBE6262:
.LBE6280:
	.cfi_endproc
.LFE485:
	.size	setThreadState, .-setThreadState
	.section	.boot.text
	.p2align 4,,15
	.globl	configureIdleThread
	.type	configureIdleThread, @function
configureIdleThread:
.LFB465:
	.loc 22 61 0
	.cfi_startproc
.LVL2123:
	.loc 22 61 0
	movl	4(%esp), %eax
.LBB6331:
.LBB6332:
.LBB6333:
	.loc 27 626 0
	movl	592(%eax), %edx
.LBE6333:
.LBE6332:
.LBE6331:
.LBB6344:
.LBB6345:
.LBB6346:
.LBB6347:
	.loc 13 21 0
	movl	$514, 64(%eax)
.LVL2124:
.LBE6347:
.LBE6346:
.LBB6348:
.LBB6349:
	movl	$idle_thread, 56(%eax)
.LVL2125:
.LBE6349:
.LBE6348:
.LBB6350:
.LBB6351:
	movl	$8, 60(%eax)
.LVL2126:
.LBE6351:
.LBE6350:
.LBE6345:
.LBE6344:
.LBB6363:
.LBB6336:
.LBB6334:
	.loc 27 626 0
	andl	$-16, %edx
	.loc 27 627 0
	orl	$7, %edx
.LBE6334:
.LBE6336:
.LBB6337:
.LBB6338:
	.loc 22 434 0
	cmpl	ksCurThread, %eax
.LBE6338:
.LBE6337:
.LBE6363:
.LBB6364:
.LBB6362:
.LBB6352:
.LBB6353:
	.loc 13 21 0
	movl	$16, 28(%eax)
.LVL2127:
.LBE6353:
.LBE6352:
.LBB6354:
.LBB6355:
	movl	$16, 32(%eax)
.LVL2128:
.LBE6355:
.LBE6354:
.LBB6356:
.LBB6357:
	movl	$16, 36(%eax)
.LVL2129:
.LBE6357:
.LBE6356:
.LBB6358:
.LBB6359:
	movl	$16, 40(%eax)
.LVL2130:
.LBE6359:
.LBE6358:
.LBB6360:
.LBB6361:
	movl	$16, 72(%eax)
.LVL2131:
.LBE6361:
.LBE6360:
.LBE6362:
.LBE6364:
.LBB6365:
.LBB6342:
.LBB6335:
	.loc 27 627 0
	movl	%edx, 592(%eax)
.LVL2132:
.LBE6335:
.LBE6342:
.LBB6343:
.LBB6341:
	.loc 22 434 0
	je	.L1935
.L1932:
	rep ret
.LVL2133:
	.p2align 4,,7
	.p2align 3
.L1935:
	movl	ksSchedulerAction, %eax
.LVL2134:
	testl	%eax, %eax
	jne	.L1932
.LVL2135:
.LBB6339:
.LBB6340:
	.loc 22 437 0
	jmp	rescheduleRequired
.LVL2136:
.LBE6340:
.LBE6339:
.LBE6341:
.LBE6343:
.LBE6365:
	.cfi_endproc
.LFE465:
	.size	configureIdleThread, .-configureIdleThread
	.section	.rodata.str1.4
	.align 4
.LC108:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/kernel/thread.c"
	.section	.rodata.str1.1
.LC109:
	.string	"Current thread is blocked"
	.text
	.p2align 4,,15
	.globl	activateThread
	.type	activateThread, @function
activateThread:
.LFB466:
	.loc 22 68 0
	.cfi_startproc
	.loc 22 69 0
	movl	ksCurThread, %edx
	movl	592(%edx), %ecx
.LBB6411:
.LBB6412:
	.loc 27 614 0
	movl	%ecx, %eax
	andl	$15, %eax
.LBE6412:
.LBE6411:
	.loc 22 69 0
	cmpl	$2, %eax
	je	.L1938
	.loc 22 69 0
	cmpl	$7, %eax
	je	.L1948
	cmpl	$1, %eax
	je	.L1949
	.loc 22 68 0
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB6413:
.LBB6414:
	.loc 22 87 0
	movl	$__func__.6108, 12(%esp)
	movl	$87, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$.LC109, (%esp)
	call	_fail
.LVL2137:
	.p2align 4,,7
	.p2align 3
.L1948:
	.cfi_def_cfa_offset 4
	rep ret
	.p2align 4,,7
	.p2align 3
.L1938:
.LVL2138:
.LBE6414:
.LBE6413:
.LBB6415:
.LBB6416:
.LBB6417:
.LBB6418:
	.loc 13 21 0
	movl	44(%edx), %eax
.LBE6418:
.LBE6417:
.LBE6416:
.LBB6421:
.LBB6422:
.LBB6423:
	.loc 27 626 0
	andl	$-16, %ecx
	.loc 27 627 0
	orl	$1, %ecx
	movl	%ecx, 592(%edx)
.LVL2139:
.LBE6423:
.LBE6422:
.LBE6421:
.LBB6424:
.LBB6420:
.LBB6419:
	.loc 13 21 0
	movl	%eax, 56(%edx)
.LVL2140:
	ret
.LVL2141:
	.p2align 4,,7
	.p2align 3
.L1949:
	rep ret
.LBE6419:
.LBE6420:
.LBE6424:
.LBE6415:
	.cfi_endproc
.LFE466:
	.size	activateThread, .-activateThread
	.p2align 4,,15
	.globl	setDomain
	.type	setDomain, @function
setDomain:
.LFB480:
	.loc 22 360 0
	.cfi_startproc
.LVL2142:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	.loc 22 360 0
	movl	28(%esp), %eax
.LVL2143:
	movl	32(%esp), %ebx
.LBB6467:
.LBB6468:
	.loc 30 97 0
	movl	600(%eax), %edx
	testb	$1, %dl
	movl	%edx, %esi
	jne	.L1966
.L1951:
.LBE6468:
.LBE6467:
.LBB6483:
.LBB6484:
.LBB6485:
.LBB6486:
	.loc 27 614 0
	movl	592(%eax), %ecx
.LBE6486:
.LBE6485:
.LBE6484:
.LBE6483:
	.loc 22 362 0
	movl	%ebx, 620(%eax)
.LVL2144:
.LBB6490:
.LBB6489:
.LBB6488:
.LBB6487:
	.loc 27 614 0
	andl	$15, %ecx
.LBE6487:
.LBE6488:
	.loc 22 49 0
	subl	$1, %ecx
	cmpl	$1, %ecx
	ja	.L1955
.LVL2145:
.LBE6489:
.LBE6490:
.LBB6491:
.LBB6492:
	.loc 30 37 0
	testl	$1, %esi
	je	.L1967
.LVL2146:
.L1955:
.LBE6492:
.LBE6491:
	.loc 22 366 0
	cmpl	ksCurThread, %eax
	je	.L1968
.L1950:
	.loc 22 369 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2147:
	.p2align 4,,7
	.p2align 3
.L1966:
	.cfi_restore_state
.LBB6508:
.LBB6481:
.LBB6469:
.LBB6470:
.LBB6471:
.LBB6472:
	.loc 30 30 0
	movl	620(%eax), %ecx
.LBE6472:
.LBE6471:
	.loc 30 109 0
	movl	640(%eax), %ebp
.LBB6474:
.LBB6473:
	.loc 30 30 0
	sall	$8, %ecx
	addl	624(%eax), %ecx
.LBE6473:
.LBE6474:
	.loc 30 106 0
	movl	ksReadyQueues(,%ecx,8), %esi
	leal	ksReadyQueues(,%ecx,8), %edi
	movl	%esi, (%esp)
.LVL2148:
	movl	4(%edi), %esi
.LVL2149:
	movl	%esi, 4(%esp)
.LVL2150:
	.loc 30 108 0
	movl	644(%eax), %esi
.LVL2151:
	testl	%esi, %esi
	je	.L1952
	.loc 30 109 0
	movl	%ebp, 640(%esi)
	movl	640(%eax), %ebp
.L1953:
	.loc 30 114 0
	testl	%ebp, %ebp
	je	.L1961
	.loc 30 115 0
	movl	%esi, 644(%ebp)
.LVL2152:
.L1954:
	.loc 30 120 0
	movl	(%esp), %esi
.LBB6475:
.LBB6476:
	.loc 27 577 0
	andl	$-2, %edx
.LBE6476:
.LBE6475:
	.loc 30 120 0
	movl	%esi, ksReadyQueues(,%ecx,8)
.LVL2153:
	movl	4(%esp), %esi
	movl	%esi, 4(%edi)
.LVL2154:
.LBB6478:
.LBB6477:
	.loc 27 577 0
	movl	%edx, %esi
	movl	%edx, 600(%eax)
	jmp	.L1951
.LVL2155:
	.p2align 4,,7
	.p2align 3
.L1967:
.LBE6477:
.LBE6478:
.LBE6470:
.LBE6469:
.LBE6481:
.LBE6508:
.LBB6509:
.LBB6505:
.LBB6493:
.LBB6494:
.LBB6495:
.LBB6496:
	.loc 30 30 0
	sall	$8, %ebx
.LVL2156:
	addl	624(%eax), %ebx
.LBE6496:
.LBE6495:
	.loc 30 46 0
	leal	ksReadyQueues(,%ebx,8), %ecx
	movl	ksReadyQueues(,%ebx,8), %edi
.LVL2157:
	movl	4(%ecx), %edx
.LVL2158:
	.loc 30 48 0
	testl	%edx, %edx
	je	.L1962
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2159:
.L1957:
.LBB6497:
.LBB6498:
	.loc 27 578 0
	orl	$1, %esi
.LBE6498:
.LBE6497:
.LBE6494:
.LBE6493:
.LBE6505:
.LBE6509:
	.loc 22 366 0
	cmpl	ksCurThread, %eax
.LBB6510:
.LBB6506:
.LBB6503:
.LBB6501:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2160:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%ebx,8)
.LVL2161:
	movl	%edx, 4(%ecx)
.LVL2162:
.LBB6500:
.LBB6499:
	.loc 27 578 0
	movl	%esi, 600(%eax)
.LBE6499:
.LBE6500:
.LBE6501:
.LBE6503:
.LBE6506:
.LBE6510:
	.loc 22 366 0
	jne	.L1950
.LVL2163:
	.p2align 4,,7
	.p2align 3
.L1968:
	.loc 22 369 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 22 367 0
	jmp	rescheduleRequired
.LVL2164:
	.p2align 4,,7
	.p2align 3
.L1961:
	.cfi_restore_state
.LBB6511:
.LBB6482:
.LBB6480:
.LBB6479:
	.loc 30 108 0
	movl	%esi, 4(%esp)
.LVL2165:
	jmp	.L1954
.LVL2166:
	.p2align 4,,7
	.p2align 3
.L1952:
	.loc 30 111 0
	movl	%ebp, (%esp)
.LVL2167:
	jmp	.L1953
.LVL2168:
	.p2align 4,,7
	.p2align 3
.L1962:
.LBE6479:
.LBE6480:
.LBE6482:
.LBE6511:
.LBB6512:
.LBB6507:
.LBB6504:
.LBB6502:
	.loc 30 48 0
	movl	%eax, %edx
.LVL2169:
	jmp	.L1957
.LBE6502:
.LBE6504:
.LBE6507:
.LBE6512:
	.cfi_endproc
.LFE480:
	.size	setDomain, .-setDomain
	.p2align 4,,15
	.globl	setPriority
	.type	setPriority, @function
setPriority:
.LFB481:
	.loc 22 373 0
	.cfi_startproc
.LVL2170:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	.loc 22 373 0
	movl	28(%esp), %eax
.LVL2171:
	movl	32(%esp), %ebx
.LBB6555:
.LBB6556:
	.loc 30 97 0
	movl	600(%eax), %edx
	testb	$1, %dl
	movl	%edx, %esi
	jne	.L1985
.L1970:
.LBE6556:
.LBE6555:
.LBB6571:
.LBB6572:
.LBB6573:
.LBB6574:
	.loc 27 614 0
	movl	592(%eax), %ecx
.LBE6574:
.LBE6573:
.LBE6572:
.LBE6571:
	.loc 22 375 0
	movl	%ebx, 624(%eax)
.LVL2172:
.LBB6578:
.LBB6577:
.LBB6576:
.LBB6575:
	.loc 27 614 0
	andl	$15, %ecx
.LBE6575:
.LBE6576:
	.loc 22 49 0
	subl	$1, %ecx
	cmpl	$1, %ecx
	ja	.L1974
.LVL2173:
.LBE6577:
.LBE6578:
.LBB6579:
.LBB6580:
	.loc 30 37 0
	testl	$1, %esi
	je	.L1986
.LVL2174:
.L1974:
.LBE6580:
.LBE6579:
	.loc 22 379 0
	cmpl	ksCurThread, %eax
	je	.L1987
.L1969:
	.loc 22 382 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2175:
	.p2align 4,,7
	.p2align 3
.L1985:
	.cfi_restore_state
.LBB6596:
.LBB6569:
.LBB6557:
.LBB6558:
.LBB6559:
.LBB6560:
	.loc 30 30 0
	movl	620(%eax), %ecx
.LBE6560:
.LBE6559:
	.loc 30 109 0
	movl	640(%eax), %ebp
.LBB6562:
.LBB6561:
	.loc 30 30 0
	sall	$8, %ecx
	addl	624(%eax), %ecx
.LBE6561:
.LBE6562:
	.loc 30 106 0
	movl	ksReadyQueues(,%ecx,8), %esi
	leal	ksReadyQueues(,%ecx,8), %edi
	movl	%esi, (%esp)
.LVL2176:
	movl	4(%edi), %esi
.LVL2177:
	movl	%esi, 4(%esp)
.LVL2178:
	.loc 30 108 0
	movl	644(%eax), %esi
.LVL2179:
	testl	%esi, %esi
	je	.L1971
	.loc 30 109 0
	movl	%ebp, 640(%esi)
	movl	640(%eax), %ebp
.L1972:
	.loc 30 114 0
	testl	%ebp, %ebp
	je	.L1980
	.loc 30 115 0
	movl	%esi, 644(%ebp)
.LVL2180:
.L1973:
	.loc 30 120 0
	movl	(%esp), %esi
.LBB6563:
.LBB6564:
	.loc 27 577 0
	andl	$-2, %edx
.LBE6564:
.LBE6563:
	.loc 30 120 0
	movl	%esi, ksReadyQueues(,%ecx,8)
.LVL2181:
	movl	4(%esp), %esi
	movl	%esi, 4(%edi)
.LVL2182:
.LBB6566:
.LBB6565:
	.loc 27 577 0
	movl	%edx, %esi
	movl	%edx, 600(%eax)
	jmp	.L1970
.LVL2183:
	.p2align 4,,7
	.p2align 3
.L1986:
.LBE6565:
.LBE6566:
.LBE6558:
.LBE6557:
.LBE6569:
.LBE6596:
.LBB6597:
.LBB6593:
.LBB6581:
.LBB6582:
.LBB6583:
.LBB6584:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	%edx, %ebx
.LVL2184:
.LBE6584:
.LBE6583:
	.loc 30 46 0
	leal	ksReadyQueues(,%ebx,8), %ecx
	movl	ksReadyQueues(,%ebx,8), %edi
.LVL2185:
	movl	4(%ecx), %edx
.LVL2186:
	.loc 30 48 0
	testl	%edx, %edx
	je	.L1981
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2187:
.L1976:
.LBB6585:
.LBB6586:
	.loc 27 578 0
	orl	$1, %esi
.LBE6586:
.LBE6585:
.LBE6582:
.LBE6581:
.LBE6593:
.LBE6597:
	.loc 22 379 0
	cmpl	ksCurThread, %eax
.LBB6598:
.LBB6594:
.LBB6591:
.LBB6589:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2188:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%ebx,8)
.LVL2189:
	movl	%edx, 4(%ecx)
.LVL2190:
.LBB6588:
.LBB6587:
	.loc 27 578 0
	movl	%esi, 600(%eax)
.LBE6587:
.LBE6588:
.LBE6589:
.LBE6591:
.LBE6594:
.LBE6598:
	.loc 22 379 0
	jne	.L1969
.LVL2191:
	.p2align 4,,7
	.p2align 3
.L1987:
	.loc 22 382 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 22 380 0
	jmp	rescheduleRequired
.LVL2192:
	.p2align 4,,7
	.p2align 3
.L1980:
	.cfi_restore_state
.LBB6599:
.LBB6570:
.LBB6568:
.LBB6567:
	.loc 30 108 0
	movl	%esi, 4(%esp)
.LVL2193:
	jmp	.L1973
.LVL2194:
	.p2align 4,,7
	.p2align 3
.L1971:
	.loc 30 111 0
	movl	%ebp, (%esp)
.LVL2195:
	jmp	.L1972
.LVL2196:
	.p2align 4,,7
	.p2align 3
.L1981:
.LBE6567:
.LBE6568:
.LBE6570:
.LBE6599:
.LBB6600:
.LBB6595:
.LBB6592:
.LBB6590:
	.loc 30 48 0
	movl	%eax, %edx
.LVL2197:
	jmp	.L1976
.LBE6590:
.LBE6592:
.LBE6595:
.LBE6600:
	.cfi_endproc
.LFE481:
	.size	setPriority, .-setPriority
	.p2align 4,,15
	.globl	timerTick
	.type	timerTick, @function
timerTick:
.LFB487:
	.loc 22 443 0
	.cfi_startproc
	.loc 22 444 0
	movl	ksCurThread, %eax
.LBB6631:
.LBB6632:
	.loc 27 614 0
	movl	592(%eax), %edx
	andl	$15, %edx
.LBE6632:
.LBE6631:
	.loc 22 444 0
	cmpl	$1, %edx
	jne	.L1999
	.loc 22 446 0
	movl	628(%eax), %edx
	cmpl	$1, %edx
	jbe	.L1990
	.loc 22 447 0
	subl	$1, %edx
	movl	%edx, 628(%eax)
	ret
	.p2align 4,,7
	.p2align 3
.L1990:
	.loc 22 443 0
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LBB6633:
.LBB6634:
	.loc 30 67 0
	movl	600(%eax), %ecx
.LBE6634:
.LBE6633:
	.loc 22 449 0
	movl	$1, 628(%eax)
.LBB6645:
.LBB6643:
	.loc 30 67 0
	testb	$1, %cl
	je	.L2000
.L1991:
.LBE6643:
.LBE6645:
.LBB6646:
.LBB6647:
	.loc 22 467 0
	movl	ksSchedulerAction, %eax
	leal	-1(%eax), %edx
	.loc 22 466 0
	cmpl	$-3, %edx
	ja	.L1993
.LBB6648:
.LBB6649:
	.loc 30 37 0
	movl	600(%eax), %ecx
	testb	$1, %cl
	jne	.L1993
.LBB6650:
.LBB6651:
.LBB6652:
.LBB6653:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE6653:
.LBE6652:
	.loc 30 46 0
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
	movl	4(%esi), %ebx
	.loc 30 48 0
	testl	%ebx, %ebx
	je	.L1996
	.loc 30 51 0
	movl	%eax, 644(%edi)
.L1994:
.LBB6654:
.LBB6655:
	.loc 27 578 0
	orl	$1, %ecx
.LBE6655:
.LBE6654:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ebx, 4(%esi)
.LBB6657:
.LBB6656:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
.L1993:
.LBE6656:
.LBE6657:
.LBE6651:
.LBE6650:
.LBE6649:
.LBE6648:
.LBE6647:
.LBE6646:
	.loc 22 461 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LBB6664:
.LBB6662:
	.loc 22 470 0
	movl	$-1, ksSchedulerAction
.L1999:
.LBE6662:
.LBE6664:
	.loc 22 461 0
	rep ret
	.p2align 4,,7
	.p2align 3
.L2000:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
.LBB6665:
.LBB6644:
.LBB6635:
.LBB6636:
.LBB6637:
.LBB6638:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE6638:
.LBE6637:
	.loc 30 76 0
	movl	ksReadyQueues(,%edx,8), %ebx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	4(%esi), %edi
	.loc 30 78 0
	testl	%ebx, %ebx
	je	.L1995
	.loc 30 81 0
	movl	%eax, 640(%edi)
.L1992:
.LBB6639:
.LBB6640:
	.loc 27 578 0
	orl	$1, %ecx
.LBE6640:
.LBE6639:
	.loc 30 83 0
	movl	%edi, 644(%eax)
	.loc 30 84 0
	movl	$0, 640(%eax)
	.loc 30 87 0
	movl	%ebx, ksReadyQueues(,%edx,8)
	movl	%eax, 4(%esi)
.LBB6642:
.LBB6641:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
	jmp	.L1991
	.p2align 4,,7
	.p2align 3
.L1995:
.LBE6641:
.LBE6642:
	.loc 30 78 0
	movl	%eax, %ebx
	jmp	.L1992
	.p2align 4,,7
	.p2align 3
.L1996:
.LBE6636:
.LBE6635:
.LBE6644:
.LBE6665:
.LBB6666:
.LBB6663:
.LBB6661:
.LBB6660:
.LBB6659:
.LBB6658:
	.loc 30 48 0
	movl	%eax, %ebx
	jmp	.L1994
.LBE6658:
.LBE6659:
.LBE6660:
.LBE6661:
.LBE6663:
.LBE6666:
	.cfi_endproc
.LFE487:
	.size	timerTick, .-timerTick
	.p2align 4,,15
	.globl	aepCancelAll
	.type	aepCancelAll, @function
aepCancelAll:
.LFB502:
	.file 43 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/asyncendpoint.c"
	.loc 43 127 0
	.cfi_startproc
.LVL2198:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 43 127 0
	movl	16(%esp), %edx
	.loc 43 126 0
	movl	(%edx), %ecx
.LVL2199:
.LBB6718:
.LBB6719:
	.loc 27 216 0
	movl	%ecx, %eax
	andl	$3, %eax
.LBE6719:
.LBE6718:
	.loc 43 128 0
	cmpl	$1, %eax
	je	.L2018
	.loc 43 142 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2018:
	.cfi_restore_state
	.loc 43 126 0
	movl	4(%edx), %eax
.LVL2200:
.LBB6720:
.LBB6721:
.LBB6722:
	.loc 27 210 0
	andl	$12, %ecx
	movl	%ecx, (%edx)
.LBE6722:
.LBE6721:
.LBB6723:
.LBB6724:
	.loc 27 197 0
	movl	%eax, %ebx
	andl	$15, %ebx
.LBE6724:
.LBE6723:
	.loc 43 136 0
	andl	$-16, %eax
.LVL2201:
.LBB6726:
.LBB6725:
	.loc 27 197 0
	movl	%ebx, 4(%edx)
.LVL2202:
.LBE6725:
.LBE6726:
	.loc 43 136 0
	jne	.L2015
	jmp	.L2008
.LVL2203:
	.p2align 4,,7
	.p2align 3
.L2006:
	.loc 43 136 0 is_stmt 0 discriminator 2
	movl	648(%eax), %eax
.LVL2204:
	testl	%eax, %eax
	je	.L2008
.LVL2205:
.L2015:
.LBB6727:
.LBB6728:
.LBB6729:
	.loc 27 626 0 is_stmt 1
	movl	592(%eax), %edx
.LBE6729:
.LBE6728:
.LBE6727:
.LBB6734:
.LBB6735:
	.loc 30 37 0
	movl	600(%eax), %ecx
.LBE6735:
.LBE6734:
.LBB6749:
.LBB6732:
.LBB6730:
	.loc 27 626 0
	andl	$-16, %edx
	.loc 27 627 0
	orl	$2, %edx
.LBE6730:
.LBE6732:
.LBE6749:
.LBB6750:
.LBB6746:
	.loc 30 37 0
	testb	$1, %cl
.LBE6746:
.LBE6750:
.LBB6751:
.LBB6733:
.LBB6731:
	.loc 27 627 0
	movl	%edx, 592(%eax)
.LVL2206:
.LBE6731:
.LBE6733:
.LBE6751:
.LBB6752:
.LBB6747:
	.loc 30 37 0
	jne	.L2006
.LVL2207:
.LBB6736:
.LBB6737:
.LBB6738:
.LBB6739:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE6739:
.LBE6738:
	.loc 30 46 0
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
.LVL2208:
	movl	4(%esi), %ebx
.LVL2209:
	.loc 30 48 0
	testl	%ebx, %ebx
	je	.L2011
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2210:
.L2007:
.LBB6740:
.LBB6741:
	.loc 27 578 0
	orl	$1, %ecx
.LBE6741:
.LBE6740:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2211:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%edx,8)
.LVL2212:
	movl	%ebx, 4(%esi)
.LVL2213:
.LBB6743:
.LBB6742:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
.LBE6742:
.LBE6743:
.LBE6737:
.LBE6736:
.LBE6747:
.LBE6752:
	.loc 43 136 0
	movl	648(%eax), %eax
.LVL2214:
	testl	%eax, %eax
	jne	.L2015
.LVL2215:
.L2008:
.LBB6753:
.LBB6754:
	.loc 22 467 0
	movl	ksSchedulerAction, %eax
	leal	-1(%eax), %edx
	.loc 22 466 0
	cmpl	$-3, %edx
	ja	.L2005
.LVL2216:
.LBB6755:
.LBB6756:
	.loc 30 37 0
	movl	600(%eax), %ecx
	testb	$1, %cl
	je	.L2019
.LVL2217:
.L2005:
.LBE6756:
.LBE6755:
.LBE6754:
.LBE6753:
.LBE6720:
	.loc 43 142 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LBB6772:
.LBB6769:
.LBB6767:
	.loc 22 470 0
	movl	$-1, ksSchedulerAction
.LBE6767:
.LBE6769:
.LBE6772:
	.loc 43 142 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2218:
	.p2align 4,,7
	.p2align 3
.L2011:
	.cfi_restore_state
.LBB6773:
.LBB6770:
.LBB6748:
.LBB6745:
.LBB6744:
	.loc 30 48 0
	movl	%eax, %ebx
.LVL2219:
	jmp	.L2007
.LVL2220:
	.p2align 4,,7
	.p2align 3
.L2019:
.LBE6744:
.LBE6745:
.LBE6748:
.LBE6770:
.LBB6771:
.LBB6768:
.LBB6766:
.LBB6765:
.LBB6757:
.LBB6758:
.LBB6759:
.LBB6760:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE6760:
.LBE6759:
	.loc 30 46 0
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
.LVL2221:
	movl	4(%esi), %ebx
.LVL2222:
	.loc 30 48 0
	testl	%ebx, %ebx
	je	.L2012
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2223:
.L2010:
.LBB6761:
.LBB6762:
	.loc 27 578 0
	orl	$1, %ecx
.LBE6762:
.LBE6761:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2224:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%edx,8)
.LVL2225:
	movl	%ebx, 4(%esi)
.LVL2226:
.LBB6764:
.LBB6763:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
	jmp	.L2005
.LVL2227:
.L2012:
.LBE6763:
.LBE6764:
	.loc 30 48 0
	movl	%eax, %ebx
.LVL2228:
	jmp	.L2010
.LBE6758:
.LBE6757:
.LBE6765:
.LBE6766:
.LBE6768:
.LBE6771:
.LBE6773:
	.cfi_endproc
.LFE502:
	.size	aepCancelAll, .-aepCancelAll
	.section	.rodata.str1.4
	.align 4
.LC110:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/endpoint.c"
	.section	.rodata.str1.1
.LC111:
	.string	"invalid EP state"
	.text
	.p2align 4,,15
	.globl	epCancelBadgedSends
	.type	epCancelBadgedSends, @function
epCancelBadgedSends:
.LFB543:
	.file 44 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/endpoint.c"
	.loc 44 301 0
	.cfi_startproc
.LVL2229:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 44 301 0
	movl	64(%esp), %edx
	movl	68(%esp), %edi
	.loc 44 300 0
	movl	(%edx), %eax
.LVL2230:
.LBB6825:
.LBB6826:
	.loc 27 451 0
	movl	%eax, %ecx
	andl	$3, %ecx
.LBE6826:
.LBE6825:
	.loc 44 302 0
	cmpl	$1, %ecx
	je	.L2022
	jb	.L2020
	cmpl	$2, %ecx
	je	.L2020
	.loc 44 340 0
	movl	$__func__.6735, 12(%esp)
	movl	$340, 8(%esp)
	movl	$.LC110, 4(%esp)
	movl	$.LC111, (%esp)
	call	_fail
.LVL2231:
	.p2align 4,,7
	.p2align 3
.L2029:
	movl	%esi, %ecx
	movl	28(%esp), %ebp
.LVL2232:
.LBB6827:
.LBB6828:
.LBB6829:
	.loc 44 35 0
	movl	%esi, %eax
.LBB6830:
.LBB6831:
	.loc 27 431 0
	testb	$15, %cl
	movl	64(%esp), %edx
.LVL2233:
	jne	.L2031
	movl	4(%edx), %ebx
.LVL2234:
.L2024:
	.loc 27 433 0
	andl	$-16, %eax
	.loc 27 432 0
	andl	$15, %ebx
	.loc 27 433 0
	orl	%ebx, %eax
.LBE6831:
.LBE6830:
.LBB6834:
.LBB6835:
	.loc 27 444 0
	testl	$15, %ebp
.LBE6835:
.LBE6834:
.LBB6838:
.LBB6832:
	.loc 27 433 0
	movl	%eax, 4(%edx)
.LVL2235:
.LBE6832:
.LBE6838:
.LBB6839:
.LBB6836:
	.loc 27 444 0
	jne	.L2046
	.loc 27 445 0
	movl	(%edx), %eax
	.loc 27 446 0
	andl	$-16, %ebp
.LVL2236:
	.loc 27 445 0
	andl	$15, %eax
	.loc 27 446 0
	orl	%eax, %ebp
.LBE6836:
.LBE6839:
.LBE6829:
.LBE6828:
	.loc 44 330 0
	testl	%ecx, %ecx
	je	.L2045
.LVL2237:
.LBB6844:
.LBB6845:
	.loc 27 458 0
	andl	$-4, %ebp
	.loc 27 459 0
	orl	$1, %ebp
.LVL2238:
.L2045:
.LBE6845:
.LBE6844:
.LBB6847:
.LBB6848:
	.loc 22 467 0
	movl	ksSchedulerAction, %eax
.LBE6848:
.LBE6847:
.LBB6865:
.LBB6846:
	.loc 27 459 0
	movl	%ebp, (%edx)
.LBE6846:
.LBE6865:
.LBB6866:
.LBB6863:
	.loc 22 467 0
	leal	-1(%eax), %edx
	.loc 22 466 0
	cmpl	$-3, %edx
	ja	.L2035
.LVL2239:
.LBB6849:
.LBB6850:
	.loc 30 37 0
	movl	600(%eax), %ecx
.LVL2240:
	testb	$1, %cl
	jne	.L2035
.LVL2241:
.LBB6851:
.LBB6852:
.LBB6853:
.LBB6854:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE6854:
.LBE6853:
	.loc 30 46 0
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
.LVL2242:
	movl	4(%esi), %ebx
.LVL2243:
	.loc 30 48 0
	testl	%ebx, %ebx
	je	.L2039
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2244:
.L2036:
.LBB6855:
.LBB6856:
	.loc 27 578 0
	orl	$1, %ecx
.LBE6856:
.LBE6855:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2245:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%edx,8)
.LVL2246:
	movl	%ebx, 4(%esi)
.LVL2247:
.LBB6858:
.LBB6857:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
.LVL2248:
.L2035:
.LBE6857:
.LBE6858:
.LBE6852:
.LBE6851:
.LBE6850:
.LBE6849:
	.loc 22 470 0
	movl	$-1, ksSchedulerAction
.LVL2249:
.L2020:
.LBE6863:
.LBE6866:
.LBE6827:
	.loc 44 342 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2250:
	.p2align 4,,7
	.p2align 3
.L2022:
	.cfi_restore_state
	.loc 44 22 0
	movl	4(%edx), %ebx
.LVL2251:
.LBB6903:
.LBB6867:
.LBB6868:
.LBB6869:
.LBB6870:
	.loc 27 438 0
	movl	%eax, %ebp
.LBE6870:
.LBE6869:
.LBE6868:
.LBE6867:
.LBB6874:
.LBB6875:
	.loc 27 445 0
	andl	$12, %eax
.LBE6875:
.LBE6874:
.LBB6877:
.LBB6873:
.LBB6872:
.LBB6871:
	.loc 27 438 0
	andl	$-16, %ebp
.LVL2252:
.LBE6871:
.LBE6872:
.LBE6873:
.LBE6877:
.LBB6878:
.LBB6876:
	.loc 27 445 0
	movl	%eax, (%edx)
.LBE6876:
.LBE6878:
.LBB6879:
.LBB6880:
	.loc 27 432 0
	movl	%ebx, %ecx
	andl	$15, %ecx
.LBE6880:
.LBE6879:
	.loc 44 318 0
	andl	$-16, %ebx
.LVL2253:
.LBB6882:
.LBB6881:
	.loc 27 432 0
	movl	%ecx, 4(%edx)
.LVL2254:
.LBE6881:
.LBE6882:
	.loc 44 318 0
	je	.L2037
	movl	%ebp, 28(%esp)
	movl	%ebx, %esi
	movl	%edx, 64(%esp)
.LVL2255:
	jmp	.L2030
.LVL2256:
	.p2align 4,,7
	.p2align 3
.L2025:
	.loc 44 318 0 is_stmt 0 discriminator 1
	testl	%ebp, %ebp
	je	.L2029
	.loc 44 318 0
	movl	%ebp, %ebx
.LVL2257:
.L2030:
.LBB6883:
.LBB6884:
.LBB6885:
	.loc 27 531 0 is_stmt 1
	movl	600(%ebx), %eax
.LBE6885:
.LBE6884:
	.loc 44 321 0
	movl	648(%ebx), %ebp
.LVL2258:
.LBB6887:
.LBB6886:
	.loc 27 531 0
	shrl	$3, %eax
.LBE6886:
.LBE6887:
	.loc 44 322 0
	cmpl	%eax, %edi
	jne	.L2025
.LVL2259:
.LBB6888:
.LBB6889:
.LBB6890:
.LBB6891:
	.loc 27 626 0
	movl	592(%ebx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%ebx)
.LBE6891:
.LBE6890:
	.loc 22 428 0
	movl	%ebx, (%esp)
	call	scheduleTCB
.LVL2260:
.LBE6889:
.LBE6888:
.LBB6892:
.LBB6893:
	.loc 30 37 0
	testb	$1, 600(%ebx)
	je	.L2047
.L2026:
.LVL2261:
.LBE6893:
.LBE6892:
.LBB6895:
.LBB6896:
	.loc 30 146 0
	movl	652(%ebx), %eax
	testl	%eax, %eax
	je	.L2027
	.loc 30 147 0
	movl	648(%ebx), %edx
	movl	%edx, 648(%eax)
	movl	648(%ebx), %ebx
.LVL2262:
.L2028:
	.loc 30 152 0
	testl	%ebx, %ebx
	je	.L2038
	.loc 30 153 0
	movl	%eax, 652(%ebx)
	jmp	.L2025
.LVL2263:
	.p2align 4,,7
	.p2align 3
.L2047:
.LBE6896:
.LBE6895:
.LBB6898:
.LBB6894:
	movl	%ebx, %eax
	call	tcbSchedEnqueue.part.197
.LVL2264:
	jmp	.L2026
.LVL2265:
	.p2align 4,,7
	.p2align 3
.L2038:
.LBE6894:
.LBE6898:
.LBB6899:
.LBB6897:
	.loc 30 146 0
	movl	%eax, 28(%esp)
	jmp	.L2025
.LVL2266:
	.p2align 4,,7
	.p2align 3
.L2027:
	.loc 30 149 0
	movl	648(%ebx), %esi
.LVL2267:
	movl	%esi, %ebx
.LVL2268:
	jmp	.L2028
.LVL2269:
.L2037:
.LBE6897:
.LBE6899:
.LBE6883:
	.loc 44 318 0
	movl	%ecx, %ebx
.LVL2270:
.LBB6900:
.LBB6842:
	.loc 44 35 0
	xorl	%eax, %eax
.LBE6842:
.LBE6900:
	.loc 44 318 0
	xorl	%ecx, %ecx
	jmp	.L2024
.LVL2271:
.L2039:
.LBB6901:
.LBB6864:
.LBB6862:
.LBB6861:
.LBB6860:
.LBB6859:
	.loc 30 48 0
	movl	%eax, %ebx
.LVL2272:
	jmp	.L2036
.LVL2273:
.L2031:
.LBE6859:
.LBE6860:
.LBE6861:
.LBE6862:
.LBE6864:
.LBE6901:
.LBB6902:
.LBB6843:
.LBB6840:
.LBB6833:
	call	endpoint_ptr_set_epQueue_head.isra.185.part.186
.LVL2274:
.L2046:
.LBE6833:
.LBE6840:
.LBB6841:
.LBB6837:
	.p2align 4,,6
	call	endpoint_ptr_set_epQueue_tail.isra.187.part.188
.LVL2275:
.LBE6837:
.LBE6841:
.LBE6843:
.LBE6902:
.LBE6903:
	.cfi_endproc
.LFE543:
	.size	epCancelBadgedSends, .-epCancelBadgedSends
	.p2align 4,,15
	.type	possibleSwitchTo, @function
possibleSwitchTo:
.LFB482:
	.loc 22 386 0
	.cfi_startproc
.LVL2276:
	.loc 22 392 0
	movl	ksCurThread, %ecx
	.loc 22 386 0
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	.loc 22 395 0
	movl	ksSchedulerAction, %esi
	.loc 22 386 0
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 22 392 0
	movl	624(%ecx), %edi
.LVL2277:
	.loc 22 393 0
	movl	620(%eax), %ecx
.LVL2278:
	.loc 22 396 0
	cmpl	ksCurDomain, %ecx
	.loc 22 394 0
	movl	624(%eax), %ebx
.LVL2279:
	.loc 22 396 0
	je	.L2049
.LVL2280:
.LBB6938:
.LBB6939:
	.loc 30 37 0
	movl	600(%eax), %edx
.LVL2281:
	testb	$1, %dl
	je	.L2067
.LVL2282:
.L2048:
.LBE6939:
.LBE6938:
	.loc 22 410 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2283:
	.p2align 4,,7
	.p2align 3
.L2049:
	.cfi_restore_state
	.loc 22 399 0
	cmpl	%ebx, %edi
	jb	.L2053
	.loc 22 399 0 is_stmt 0 discriminator 1
	testl	%edx, %edx
	.p2align 4,,4
	je	.L2054
	cmpl	%edi, %ebx
	.p2align 4,,5
	jne	.L2054
.L2053:
	.loc 22 400 0 is_stmt 1
	testl	%esi, %esi
	.p2align 4,,5
	je	.L2068
.L2054:
.LVL2284:
.LBB6952:
.LBB6953:
	.loc 30 37 0
	movl	600(%eax), %edx
.LVL2285:
	testb	$1, %dl
	je	.L2069
.LVL2286:
.L2055:
.LBE6953:
.LBE6952:
	.loc 22 406 0
	subl	$1, %esi
.LVL2287:
	.loc 22 405 0
	cmpl	$-3, %esi
	ja	.L2048
	.loc 22 410 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 22 407 0
	jmp	rescheduleRequired
.LVL2288:
	.p2align 4,,7
	.p2align 3
.L2067:
	.cfi_restore_state
.LBB6966:
.LBB6950:
.LBB6940:
.LBB6941:
.LBB6942:
.LBB6943:
	.loc 30 30 0
	sall	$8, %ecx
.LVL2289:
	addl	%ecx, %ebx
.LVL2290:
.LBE6943:
.LBE6942:
	.loc 30 46 0
	leal	ksReadyQueues(,%ebx,8), %esi
.LVL2291:
	movl	ksReadyQueues(,%ebx,8), %edi
.LVL2292:
	movl	4(%esi), %ecx
.LVL2293:
	.loc 30 48 0
	testl	%ecx, %ecx
	je	.L2058
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2294:
.L2052:
.LBB6944:
.LBB6945:
	.loc 27 578 0
	orl	$1, %edx
.LBE6945:
.LBE6944:
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2295:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%ebx,8)
	movl	%ecx, 4(%esi)
.LVL2296:
.LBB6947:
.LBB6946:
	.loc 27 578 0
	movl	%edx, 600(%eax)
.LVL2297:
.LBE6946:
.LBE6947:
.LBE6941:
.LBE6940:
.LBE6950:
.LBE6966:
	.loc 22 410 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2298:
	.p2align 4,,7
	.p2align 3
.L2069:
	.cfi_restore_state
.LBB6967:
.LBB6964:
.LBB6954:
.LBB6955:
.LBB6956:
.LBB6957:
	.loc 30 30 0
	sall	$8, %ecx
.LVL2299:
	addl	%ecx, %ebx
.LVL2300:
.LBE6957:
.LBE6956:
	.loc 30 46 0
	leal	ksReadyQueues(,%ebx,8), %edi
.LVL2301:
	movl	ksReadyQueues(,%ebx,8), %ebp
.LVL2302:
	movl	4(%edi), %ecx
.LVL2303:
	.loc 30 48 0
	testl	%ecx, %ecx
	je	.L2059
	.loc 30 51 0
	movl	%eax, 644(%ebp)
.LVL2304:
.L2056:
.LBB6958:
.LBB6959:
	.loc 27 578 0
	orl	$1, %edx
.LBE6959:
.LBE6958:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%ebp, 640(%eax)
.LVL2305:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%ebx,8)
	movl	%ecx, 4(%edi)
.LVL2306:
.LBB6961:
.LBB6960:
	.loc 27 578 0
	movl	%edx, 600(%eax)
.LVL2307:
	jmp	.L2055
.LVL2308:
	.p2align 4,,7
	.p2align 3
.L2068:
.LBE6960:
.LBE6961:
.LBE6955:
.LBE6954:
.LBE6964:
.LBE6967:
	.loc 22 401 0
	movl	%eax, ksSchedulerAction
	jmp	.L2048
.LVL2309:
	.p2align 4,,7
	.p2align 3
.L2058:
.LBB6968:
.LBB6951:
.LBB6949:
.LBB6948:
	.loc 30 48 0
	movl	%eax, %ecx
.LVL2310:
	jmp	.L2052
.LVL2311:
	.p2align 4,,7
	.p2align 3
.L2059:
.LBE6948:
.LBE6949:
.LBE6951:
.LBE6968:
.LBB6969:
.LBB6965:
.LBB6963:
.LBB6962:
	movl	%eax, %ecx
.LVL2312:
	jmp	.L2056
.LBE6962:
.LBE6963:
.LBE6965:
.LBE6969:
	.cfi_endproc
.LFE482:
	.size	possibleSwitchTo, .-possibleSwitchTo
	.p2align 4,,15
	.globl	epCancelAll
	.type	epCancelAll, @function
epCancelAll:
.LFB542:
	.loc 44 274 0
	.cfi_startproc
.LVL2313:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 44 274 0
	movl	16(%esp), %edx
	.loc 44 273 0
	movl	(%edx), %ecx
.LVL2314:
	.loc 44 275 0
	testb	$3, %cl
	jne	.L2091
	.loc 44 297 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2091:
	.cfi_restore_state
	.loc 44 273 0
	movl	4(%edx), %eax
.LVL2315:
.LBB7021:
.LBB7022:
.LBB7023:
	.loc 27 445 0
	andl	$12, %ecx
	movl	%ecx, (%edx)
.LBE7023:
.LBE7022:
.LBB7024:
.LBB7025:
	.loc 27 432 0
	movl	%eax, %ebx
	andl	$15, %ebx
.LBE7025:
.LBE7024:
	.loc 44 288 0
	andl	$-16, %eax
.LVL2316:
.LBB7027:
.LBB7026:
	.loc 27 432 0
	movl	%ebx, 4(%edx)
.LVL2317:
.LBE7026:
.LBE7027:
	.loc 44 288 0
	jne	.L2087
	jmp	.L2078
.LVL2318:
	.p2align 4,,7
	.p2align 3
.L2076:
	.loc 44 288 0 is_stmt 0 discriminator 2
	movl	648(%eax), %eax
.LVL2319:
	testl	%eax, %eax
	je	.L2078
.LVL2320:
.L2087:
.LBB7028:
.LBB7029:
.LBB7030:
	.loc 27 626 0 is_stmt 1
	movl	592(%eax), %edx
.LBE7030:
.LBE7029:
.LBE7028:
.LBB7035:
.LBB7036:
	.loc 30 37 0
	movl	600(%eax), %ecx
.LBE7036:
.LBE7035:
.LBB7050:
.LBB7033:
.LBB7031:
	.loc 27 626 0
	andl	$-16, %edx
	.loc 27 627 0
	orl	$2, %edx
.LBE7031:
.LBE7033:
.LBE7050:
.LBB7051:
.LBB7047:
	.loc 30 37 0
	testb	$1, %cl
.LBE7047:
.LBE7051:
.LBB7052:
.LBB7034:
.LBB7032:
	.loc 27 627 0
	movl	%edx, 592(%eax)
.LVL2321:
.LBE7032:
.LBE7034:
.LBE7052:
.LBB7053:
.LBB7048:
	.loc 30 37 0
	jne	.L2076
.LVL2322:
.LBB7037:
.LBB7038:
.LBB7039:
.LBB7040:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE7040:
.LBE7039:
	.loc 30 46 0
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
.LVL2323:
	movl	4(%esi), %ebx
.LVL2324:
	.loc 30 48 0
	testl	%ebx, %ebx
	je	.L2081
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2325:
.L2077:
.LBB7041:
.LBB7042:
	.loc 27 578 0
	orl	$1, %ecx
.LBE7042:
.LBE7041:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2326:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%edx,8)
.LVL2327:
	movl	%ebx, 4(%esi)
.LVL2328:
.LBB7044:
.LBB7043:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
.LBE7043:
.LBE7044:
.LBE7038:
.LBE7037:
.LBE7048:
.LBE7053:
	.loc 44 288 0
	movl	648(%eax), %eax
.LVL2329:
	testl	%eax, %eax
	jne	.L2087
.LVL2330:
.L2078:
.LBB7054:
.LBB7055:
	.loc 22 467 0
	movl	ksSchedulerAction, %eax
	leal	-1(%eax), %edx
	.loc 22 466 0
	cmpl	$-3, %edx
	ja	.L2075
.LVL2331:
.LBB7056:
.LBB7057:
	.loc 30 37 0
	movl	600(%eax), %ecx
	testb	$1, %cl
	je	.L2092
.LVL2332:
.L2075:
.LBE7057:
.LBE7056:
.LBE7055:
.LBE7054:
.LBE7021:
	.loc 44 297 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LBB7079:
.LBB7075:
.LBB7072:
	.loc 22 470 0
	movl	$-1, ksSchedulerAction
.LBE7072:
.LBE7075:
.LBE7079:
	.loc 44 297 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2333:
	.p2align 4,,7
	.p2align 3
.L2092:
	.cfi_restore_state
.LBB7080:
.LBB7076:
.LBB7073:
.LBB7070:
.LBB7068:
.LBB7058:
.LBB7059:
.LBB7060:
.LBB7061:
	.loc 30 30 0
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
.LBE7061:
.LBE7060:
	.loc 30 46 0
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
.LVL2334:
	movl	4(%esi), %ebx
.LVL2335:
	.loc 30 48 0
	testl	%ebx, %ebx
	je	.L2082
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2336:
.L2080:
.LBB7062:
.LBB7063:
	.loc 27 578 0
	orl	$1, %ecx
.LBE7063:
.LBE7062:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2337:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%edx,8)
.LVL2338:
	movl	%ebx, 4(%esi)
.LVL2339:
.LBB7065:
.LBB7064:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
	jmp	.L2075
.LVL2340:
	.p2align 4,,7
	.p2align 3
.L2081:
.LBE7064:
.LBE7065:
.LBE7059:
.LBE7058:
.LBE7068:
.LBE7070:
.LBE7073:
.LBE7076:
.LBB7077:
.LBB7049:
.LBB7046:
.LBB7045:
	.loc 30 48 0
	movl	%eax, %ebx
.LVL2341:
	jmp	.L2077
.LVL2342:
.L2082:
.LBE7045:
.LBE7046:
.LBE7049:
.LBE7077:
.LBB7078:
.LBB7074:
.LBB7071:
.LBB7069:
.LBB7067:
.LBB7066:
	movl	%eax, %ebx
.LVL2343:
	jmp	.L2080
.LBE7066:
.LBE7067:
.LBE7069:
.LBE7071:
.LBE7074:
.LBE7078:
.LBE7080:
	.cfi_endproc
.LFE542:
	.size	epCancelAll, .-epCancelAll
	.p2align 4,,15
	.globl	attemptSwitchTo
	.type	attemptSwitchTo, @function
attemptSwitchTo:
.LFB483:
	.loc 22 414 0
	.cfi_startproc
.LVL2344:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
.LBB7124:
.LBB7125:
	.loc 22 392 0
	movl	ksCurThread, %edx
.LBE7125:
.LBE7124:
	.loc 22 414 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
.LBB7188:
.LBB7182:
	.loc 22 391 0
	movl	ksCurDomain, %ecx
.LBE7182:
.LBE7188:
	.loc 22 414 0
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 22 414 0
	movl	20(%esp), %eax
.LVL2345:
.LBB7189:
.LBB7183:
	.loc 22 392 0
	movl	624(%edx), %edi
.LVL2346:
	.loc 22 395 0
	movl	ksSchedulerAction, %ebx
	.loc 22 393 0
	movl	620(%eax), %edx
.LVL2347:
	.loc 22 394 0
	movl	624(%eax), %esi
.LVL2348:
	.loc 22 396 0
	cmpl	%edx, %ecx
	je	.L2094
.LVL2349:
.LBB7126:
.LBB7127:
	.loc 30 37 0
	movl	600(%eax), %ecx
.LVL2350:
	testb	$1, %cl
	je	.L2110
.LVL2351:
.L2093:
.LBE7127:
.LBE7126:
.LBE7183:
.LBE7189:
	.loc 22 416 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL2352:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2353:
	.p2align 4,,7
	.p2align 3
.L2110:
	.cfi_restore_state
.LBB7190:
.LBB7184:
.LBB7140:
.LBB7138:
.LBB7128:
.LBB7129:
.LBB7130:
.LBB7131:
	.loc 30 30 0
	sall	$8, %edx
.LVL2354:
	addl	%edx, %esi
.LVL2355:
.LBE7131:
.LBE7130:
	.loc 30 46 0
	leal	ksReadyQueues(,%esi,8), %ebx
.LVL2356:
	movl	ksReadyQueues(,%esi,8), %edi
.LVL2357:
	movl	4(%ebx), %edx
.LVL2358:
	.loc 30 48 0
	testl	%edx, %edx
	je	.L2105
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2359:
.L2097:
.LBB7132:
.LBB7133:
	.loc 27 578 0
	orl	$1, %ecx
.LBE7133:
.LBE7132:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2360:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%esi,8)
	movl	%edx, 4(%ebx)
.LVL2361:
.LBB7135:
.LBB7134:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
.LVL2362:
.LBE7134:
.LBE7135:
.LBE7129:
.LBE7128:
.LBE7138:
.LBE7140:
.LBE7184:
.LBE7190:
	.loc 22 416 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2363:
	.p2align 4,,7
	.p2align 3
.L2094:
	.cfi_restore_state
.LBB7191:
.LBB7185:
	.loc 22 399 0
	cmpl	%esi, %edi
	ja	.L2098
	.loc 22 400 0
	testl	%ebx, %ebx
	je	.L2111
.L2098:
.LVL2364:
.LBB7141:
.LBB7142:
	.loc 30 37 0
	movl	600(%eax), %edx
.LVL2365:
	testb	$1, %dl
	je	.L2112
.LVL2366:
.L2109:
.LBE7142:
.LBE7141:
	.loc 22 406 0
	leal	-1(%ebx), %eax
.LVL2367:
	.loc 22 405 0
	cmpl	$-3, %eax
	ja	.L2093
.LVL2368:
.LBB7155:
.LBB7156:
.LBB7157:
.LBB7158:
	.loc 30 37 0
	movl	600(%ebx), %edx
	testb	$1, %dl
	je	.L2113
.LVL2369:
.L2102:
.LBE7158:
.LBE7157:
.LBE7156:
.LBE7155:
.LBE7185:
.LBE7191:
	.loc 22 416 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL2370:
.LBB7192:
.LBB7186:
.LBB7176:
.LBB7173:
	.loc 22 470 0
	movl	$-1, ksSchedulerAction
.LVL2371:
.LBE7173:
.LBE7176:
.LBE7186:
.LBE7192:
	.loc 22 416 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2372:
	.p2align 4,,7
	.p2align 3
.L2112:
	.cfi_restore_state
.LBB7193:
.LBB7187:
.LBB7177:
.LBB7153:
.LBB7143:
.LBB7144:
.LBB7145:
.LBB7146:
	.loc 30 30 0
	sall	$8, %ecx
.LVL2373:
	addl	%ecx, %esi
.LVL2374:
.LBE7146:
.LBE7145:
	.loc 30 46 0
	leal	ksReadyQueues(,%esi,8), %edi
.LVL2375:
	movl	ksReadyQueues(,%esi,8), %ebp
.LVL2376:
	movl	4(%edi), %ecx
.LVL2377:
	.loc 30 48 0
	testl	%ecx, %ecx
	je	.L2106
	.loc 30 51 0
	movl	%eax, 644(%ebp)
.LVL2378:
.L2100:
.LBB7147:
.LBB7148:
	.loc 27 578 0
	orl	$1, %edx
.LBE7148:
.LBE7147:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%ebp, 640(%eax)
.LVL2379:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%esi,8)
	movl	%ecx, 4(%edi)
.LVL2380:
.LBB7150:
.LBB7149:
	.loc 27 578 0
	movl	%edx, 600(%eax)
.LVL2381:
	jmp	.L2109
.LVL2382:
	.p2align 4,,7
	.p2align 3
.L2105:
.LBE7149:
.LBE7150:
.LBE7144:
.LBE7143:
.LBE7153:
.LBE7177:
.LBB7178:
.LBB7139:
.LBB7137:
.LBB7136:
	.loc 30 48 0
	movl	%eax, %edx
.LVL2383:
	jmp	.L2097
.LVL2384:
	.p2align 4,,7
	.p2align 3
.L2113:
.LBE7136:
.LBE7137:
.LBE7139:
.LBE7178:
.LBB7179:
.LBB7174:
.LBB7171:
.LBB7169:
.LBB7159:
.LBB7160:
.LBB7161:
.LBB7162:
	.loc 30 30 0
	movl	620(%ebx), %eax
	sall	$8, %eax
	addl	624(%ebx), %eax
.LBE7162:
.LBE7161:
	.loc 30 46 0
	leal	ksReadyQueues(,%eax,8), %esi
	movl	ksReadyQueues(,%eax,8), %edi
.LVL2385:
	movl	4(%esi), %ecx
.LVL2386:
	.loc 30 48 0
	testl	%ecx, %ecx
	je	.L2107
	.loc 30 51 0
	movl	%ebx, 644(%edi)
.LVL2387:
.L2103:
.LBB7163:
.LBB7164:
	.loc 27 578 0
	orl	$1, %edx
.LBE7164:
.LBE7163:
	.loc 30 53 0
	movl	$0, 644(%ebx)
	.loc 30 54 0
	movl	%edi, 640(%ebx)
.LVL2388:
	.loc 30 57 0
	movl	%ebx, ksReadyQueues(,%eax,8)
.LVL2389:
	movl	%ecx, 4(%esi)
.LVL2390:
.LBB7166:
.LBB7165:
	.loc 27 578 0
	movl	%edx, 600(%ebx)
.LVL2391:
	jmp	.L2102
.LVL2392:
	.p2align 4,,7
	.p2align 3
.L2111:
.LBE7165:
.LBE7166:
.LBE7160:
.LBE7159:
.LBE7169:
.LBE7171:
.LBE7174:
.LBE7179:
	.loc 22 401 0
	movl	%eax, ksSchedulerAction
	jmp	.L2093
.LVL2393:
	.p2align 4,,7
	.p2align 3
.L2106:
.LBB7180:
.LBB7154:
.LBB7152:
.LBB7151:
	.loc 30 48 0
	movl	%eax, %ecx
.LVL2394:
	jmp	.L2100
.LVL2395:
.L2107:
.LBE7151:
.LBE7152:
.LBE7154:
.LBE7180:
.LBB7181:
.LBB7175:
.LBB7172:
.LBB7170:
.LBB7168:
.LBB7167:
	movl	%ebx, %ecx
.LVL2396:
	.p2align 4,,2
	jmp	.L2103
.LBE7167:
.LBE7168:
.LBE7170:
.LBE7172:
.LBE7175:
.LBE7181:
.LBE7187:
.LBE7193:
	.cfi_endproc
.LFE483:
	.size	attemptSwitchTo, .-attemptSwitchTo
	.p2align 4,,15
	.globl	switchIfRequiredTo
	.type	switchIfRequiredTo, @function
switchIfRequiredTo:
.LFB484:
	.loc 22 420 0
	.cfi_startproc
.LVL2397:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
.LBB7237:
.LBB7238:
	.loc 22 392 0
	movl	ksCurThread, %edx
.LBE7238:
.LBE7237:
	.loc 22 420 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
.LBB7302:
.LBB7295:
	.loc 22 391 0
	movl	ksCurDomain, %ecx
.LBE7295:
.LBE7302:
	.loc 22 420 0
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
.LBB7303:
.LBB7296:
	.loc 22 395 0
	movl	ksSchedulerAction, %esi
.LBE7296:
.LBE7303:
	.loc 22 420 0
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 22 420 0
	movl	20(%esp), %eax
.LVL2398:
.LBB7304:
.LBB7297:
	.loc 22 392 0
	movl	624(%edx), %edi
.LVL2399:
	.loc 22 393 0
	movl	620(%eax), %edx
.LVL2400:
	.loc 22 394 0
	movl	624(%eax), %ebx
.LVL2401:
	.loc 22 396 0
	cmpl	%edx, %ecx
	je	.L2115
.LVL2402:
.LBB7239:
.LBB7240:
	.loc 30 37 0
	movl	600(%eax), %ecx
.LVL2403:
	testb	$1, %cl
	je	.L2131
.LVL2404:
.L2114:
.LBE7240:
.LBE7239:
.LBE7297:
.LBE7304:
	.loc 22 422 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL2405:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2406:
	.p2align 4,,7
	.p2align 3
.L2115:
	.cfi_restore_state
.LBB7305:
.LBB7298:
	.loc 22 399 0
	cmpl	%ebx, %edi
	jae	.L2119
	.loc 22 400 0
	testl	%esi, %esi
	.p2align 4,,4
	je	.L2132
.L2119:
.LVL2407:
.LBB7253:
.LBB7254:
	.loc 30 37 0
	movl	600(%eax), %edx
.LVL2408:
	testb	$1, %dl
	je	.L2133
.LVL2409:
.L2130:
.LBE7254:
.LBE7253:
	.loc 22 406 0
	leal	-1(%esi), %eax
.LVL2410:
	.loc 22 405 0
	cmpl	$-3, %eax
	ja	.L2114
.LVL2411:
.LBB7267:
.LBB7268:
.LBB7269:
.LBB7270:
	.loc 30 37 0
	movl	600(%esi), %edx
	testb	$1, %dl
	je	.L2134
.LVL2412:
.L2123:
.LBE7270:
.LBE7269:
.LBE7268:
.LBE7267:
.LBE7298:
.LBE7305:
	.loc 22 422 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LBB7306:
.LBB7299:
.LBB7288:
.LBB7285:
	.loc 22 470 0
	movl	$-1, ksSchedulerAction
.LBE7285:
.LBE7288:
.LBE7299:
.LBE7306:
	.loc 22 422 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL2413:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2414:
	.p2align 4,,7
	.p2align 3
.L2131:
	.cfi_restore_state
.LBB7307:
.LBB7300:
.LBB7289:
.LBB7251:
.LBB7241:
.LBB7242:
.LBB7243:
.LBB7244:
	.loc 30 30 0
	sall	$8, %edx
.LVL2415:
	addl	%edx, %ebx
.LVL2416:
.LBE7244:
.LBE7243:
	.loc 30 46 0
	leal	ksReadyQueues(,%ebx,8), %esi
.LVL2417:
	movl	ksReadyQueues(,%ebx,8), %edi
.LVL2418:
	movl	4(%esi), %edx
.LVL2419:
	.loc 30 48 0
	testl	%edx, %edx
	je	.L2126
	.loc 30 51 0
	movl	%eax, 644(%edi)
.LVL2420:
.L2118:
.LBB7245:
.LBB7246:
	.loc 27 578 0
	orl	$1, %ecx
.LBE7246:
.LBE7245:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%edi, 640(%eax)
.LVL2421:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%ebx,8)
	movl	%edx, 4(%esi)
.LVL2422:
.LBB7248:
.LBB7247:
	.loc 27 578 0
	movl	%ecx, 600(%eax)
.LVL2423:
.LBE7247:
.LBE7248:
.LBE7242:
.LBE7241:
.LBE7251:
.LBE7289:
.LBE7300:
.LBE7307:
	.loc 22 422 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2424:
	.p2align 4,,7
	.p2align 3
.L2133:
	.cfi_restore_state
.LBB7308:
.LBB7301:
.LBB7290:
.LBB7265:
.LBB7255:
.LBB7256:
.LBB7257:
.LBB7258:
	.loc 30 30 0
	sall	$8, %ecx
.LVL2425:
	addl	%ecx, %ebx
.LVL2426:
.LBE7258:
.LBE7257:
	.loc 30 46 0
	leal	ksReadyQueues(,%ebx,8), %edi
.LVL2427:
	movl	ksReadyQueues(,%ebx,8), %ebp
.LVL2428:
	movl	4(%edi), %ecx
.LVL2429:
	.loc 30 48 0
	testl	%ecx, %ecx
	je	.L2127
	.loc 30 51 0
	movl	%eax, 644(%ebp)
.LVL2430:
.L2121:
.LBB7259:
.LBB7260:
	.loc 27 578 0
	orl	$1, %edx
.LBE7260:
.LBE7259:
	.loc 30 53 0
	movl	$0, 644(%eax)
	.loc 30 54 0
	movl	%ebp, 640(%eax)
.LVL2431:
	.loc 30 57 0
	movl	%eax, ksReadyQueues(,%ebx,8)
	movl	%ecx, 4(%edi)
.LVL2432:
.LBB7262:
.LBB7261:
	.loc 27 578 0
	movl	%edx, 600(%eax)
.LVL2433:
	jmp	.L2130
.LVL2434:
	.p2align 4,,7
	.p2align 3
.L2132:
.LBE7261:
.LBE7262:
.LBE7256:
.LBE7255:
.LBE7265:
.LBE7290:
	.loc 22 401 0
	movl	%eax, ksSchedulerAction
	jmp	.L2114
.LVL2435:
	.p2align 4,,7
	.p2align 3
.L2126:
.LBB7291:
.LBB7252:
.LBB7250:
.LBB7249:
	.loc 30 48 0
	movl	%eax, %edx
.LVL2436:
	jmp	.L2118
.LVL2437:
	.p2align 4,,7
	.p2align 3
.L2134:
.LBE7249:
.LBE7250:
.LBE7252:
.LBE7291:
.LBB7292:
.LBB7286:
.LBB7283:
.LBB7281:
.LBB7271:
.LBB7272:
.LBB7273:
.LBB7274:
	.loc 30 30 0
	movl	620(%esi), %eax
	sall	$8, %eax
	addl	624(%esi), %eax
.LBE7274:
.LBE7273:
	.loc 30 46 0
	leal	ksReadyQueues(,%eax,8), %ebx
	movl	ksReadyQueues(,%eax,8), %edi
.LVL2438:
	movl	4(%ebx), %ecx
.LVL2439:
	.loc 30 48 0
	testl	%ecx, %ecx
	je	.L2128
	.loc 30 51 0
	movl	%esi, 644(%edi)
.LVL2440:
.L2124:
.LBB7275:
.LBB7276:
	.loc 27 578 0
	orl	$1, %edx
.LBE7276:
.LBE7275:
	.loc 30 53 0
	movl	$0, 644(%esi)
	.loc 30 54 0
	movl	%edi, 640(%esi)
.LVL2441:
	.loc 30 57 0
	movl	%esi, ksReadyQueues(,%eax,8)
.LVL2442:
	movl	%ecx, 4(%ebx)
.LVL2443:
.LBB7278:
.LBB7277:
	.loc 27 578 0
	movl	%edx, 600(%esi)
.LVL2444:
	jmp	.L2123
.LVL2445:
	.p2align 4,,7
	.p2align 3
.L2127:
.LBE7277:
.LBE7278:
.LBE7272:
.LBE7271:
.LBE7281:
.LBE7283:
.LBE7286:
.LBE7292:
.LBB7293:
.LBB7266:
.LBB7264:
.LBB7263:
	.loc 30 48 0
	movl	%eax, %ecx
.LVL2446:
	jmp	.L2121
.LVL2447:
.L2128:
.LBE7263:
.LBE7264:
.LBE7266:
.LBE7293:
.LBB7294:
.LBB7287:
.LBB7284:
.LBB7282:
.LBB7280:
.LBB7279:
	movl	%esi, %ecx
.LVL2448:
	jmp	.L2124
.LBE7279:
.LBE7280:
.LBE7282:
.LBE7284:
.LBE7287:
.LBE7294:
.LBE7301:
.LBE7308:
	.cfi_endproc
.LFE484:
	.size	switchIfRequiredTo, .-switchIfRequiredTo
	.section	.rodata.str1.4
	.align 4
.LC112:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/asyncendpoint.c"
	.align 4
.LC113:
	.string	"async_endpoint_ptr_get_state(aepptr) == AEPState_Waiting"
	.text
	.p2align 4,,15
	.globl	asyncIPCCancel
	.type	asyncIPCCancel, @function
asyncIPCCancel:
.LFB503:
	.loc 43 146 0
	.cfi_startproc
.LVL2449:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 43 146 0
	movl	68(%esp), %edx
	movl	64(%esp), %eax
	.loc 43 145 0
	movl	(%edx), %ebx
.LVL2450:
.LBB7339:
.LBB7340:
	.loc 27 216 0
	movl	%ebx, %ecx
	andl	$3, %ecx
.LBE7340:
.LBE7339:
	.loc 43 150 0
	cmpl	$1, %ecx
	jne	.L2146
.LVL2451:
.LBB7341:
.LBB7342:
.LBB7343:
.LBB7344:
	.loc 27 203 0
	movl	%ebx, %esi
.LBE7344:
.LBE7343:
.LBE7342:
.LBE7341:
	.loc 43 22 0
	movl	4(%edx), %edi
.LVL2452:
.LBB7351:
.LBB7349:
.LBB7346:
.LBB7345:
	.loc 27 203 0
	andl	$-16, %esi
	movl	%esi, 28(%esp)
.LBE7345:
.LBE7346:
.LBE7349:
.LBE7351:
.LBB7352:
.LBB7353:
	.loc 30 146 0
	movl	652(%eax), %esi
.LBE7353:
.LBE7352:
.LBB7356:
.LBB7350:
.LBB7347:
.LBB7348:
	.loc 27 190 0
	movl	%edi, %ecx
	andl	$-16, %ecx
.LVL2453:
.LBE7348:
.LBE7347:
.LBE7350:
.LBE7356:
.LBB7357:
.LBB7354:
	.loc 30 146 0
	testl	%esi, %esi
	je	.L2137
	.loc 30 147 0
	movl	648(%eax), %ebp
	movl	%ebp, 648(%esi)
	movl	648(%eax), %ebp
	.loc 30 152 0
	testl	%ebp, %ebp
	je	.L2144
.LVL2454:
.L2151:
	.loc 30 153 0
	movl	%esi, 652(%ebp)
.LVL2455:
.L2139:
.LBE7354:
.LBE7357:
.LBB7358:
.LBB7359:
.LBB7360:
.LBB7361:
	.loc 27 196 0
	testb	$15, %cl
	jne	.L2147
	.loc 27 198 0
	movl	%ecx, %esi
	.loc 27 197 0
	andl	$15, %edi
.LVL2456:
	.loc 27 198 0
	andl	$-16, %esi
	orl	%edi, %esi
.LBE7361:
.LBE7360:
.LBB7364:
.LBB7365:
	.loc 27 209 0
	testb	$15, 28(%esp)
.LBE7365:
.LBE7364:
.LBB7369:
.LBB7362:
	.loc 27 198 0
	movl	%esi, 4(%edx)
.LVL2457:
.LBE7362:
.LBE7369:
.LBB7370:
.LBB7366:
	.loc 27 209 0
	jne	.L2148
	.loc 27 211 0
	movl	28(%esp), %esi
	.loc 27 210 0
	andl	$15, %ebx
.LVL2458:
	.loc 27 211 0
	andl	$-16, %esi
	orl	%ebx, %esi
.LBE7366:
.LBE7370:
.LBE7359:
.LBE7358:
	.loc 43 158 0
	testl	%ecx, %ecx
.LBB7377:
.LBB7374:
.LBB7371:
.LBB7367:
	.loc 27 211 0
	movl	%esi, (%edx)
.LVL2459:
.LBE7367:
.LBE7371:
.LBE7374:
.LBE7377:
	.loc 43 158 0
	je	.L2149
.LVL2460:
.L2142:
.LBB7378:
.LBB7379:
.LBB7380:
	.loc 27 626 0
	andl	$-16, 592(%eax)
.LVL2461:
.LBE7380:
.LBE7379:
.LBB7381:
.LBB7382:
	.loc 22 434 0
	cmpl	ksCurThread, %eax
	je	.L2150
.LVL2462:
.L2135:
.LBE7382:
.LBE7381:
.LBE7378:
	.loc 43 164 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2463:
	.p2align 4,,7
	.p2align 3
.L2150:
	.cfi_restore_state
.LBB7389:
.LBB7387:
.LBB7385:
	.loc 22 434 0
	movl	ksSchedulerAction, %eax
.LVL2464:
	testl	%eax, %eax
	jne	.L2135
.LVL2465:
.LBE7385:
.LBE7387:
.LBE7389:
	.loc 43 164 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LBB7390:
.LBB7388:
.LBB7386:
.LBB7383:
.LBB7384:
	.loc 22 437 0
	jmp	rescheduleRequired
.LVL2466:
	.p2align 4,,7
	.p2align 3
.L2137:
	.cfi_restore_state
.LBE7384:
.LBE7383:
.LBE7386:
.LBE7388:
.LBE7390:
.LBB7391:
.LBB7355:
	.loc 30 149 0
	movl	648(%eax), %ecx
.LVL2467:
	movl	%ecx, %ebp
	.loc 30 152 0
	testl	%ebp, %ebp
	jne	.L2151
	.p2align 4,,7
	.p2align 3
.L2144:
	.loc 30 146 0
	movl	%esi, 28(%esp)
.LVL2468:
	jmp	.L2139
.LVL2469:
	.p2align 4,,7
	.p2align 3
.L2149:
.LBE7355:
.LBE7391:
.LBB7392:
.LBB7393:
	.loc 27 223 0
	andl	$-4, %esi
	movl	%esi, (%edx)
	jmp	.L2142
.LVL2470:
.L2147:
.LBE7393:
.LBE7392:
.LBB7394:
.LBB7375:
.LBB7372:
.LBB7363:
	call	async_endpoint_ptr_set_aepQueue_head.isra.168.part.169
.LVL2471:
.L2146:
.LBE7363:
.LBE7372:
.LBE7375:
.LBE7394:
	.loc 43 150 0 discriminator 1
	movl	$__FUNCTION__.6378, 12(%esp)
	movl	$150, 8(%esp)
	movl	$.LC112, 4(%esp)
	movl	$.LC113, (%esp)
	call	_assert_fail
.LVL2472:
.L2148:
.LBB7395:
.LBB7376:
.LBB7373:
.LBB7368:
	call	async_endpoint_ptr_set_aepQueue_tail.isra.170.part.171
.LVL2473:
.LBE7368:
.LBE7373:
.LBE7376:
.LBE7395:
	.cfi_endproc
.LFE503:
	.size	asyncIPCCancel, .-asyncIPCCancel
	.section	.rodata.str1.4
	.align 4
.LC114:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/machine/hardware.c"
	.section	.rodata.str1.1
.LC115:
	.string	"irq >= irq_controller_min"
	.section	.text.unlikely
	.type	maskInterrupt.part.208, @function
maskInterrupt.part.208:
.LFB848:
	.loc 25 45 0
	.cfi_startproc
.LVL2474:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 25 47 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$47, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC115, (%esp)
	call	_assert_fail
.LVL2475:
	.cfi_endproc
.LFE848:
	.size	maskInterrupt.part.208, .-maskInterrupt.part.208
	.section	.rodata.str1.4
	.align 4
.LC116:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/util.c"
	.section	.rodata.str1.1
.LC117:
	.string	"(unsigned int)s % 4 == 0"
	.section	.text.unlikely
	.type	memzero.part.214, @function
memzero.part.214:
.LFB854:
	.file 45 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/util.c"
	.loc 45 21 0
	.cfi_startproc
.LVL2476:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 45 26 0
	movl	$__FUNCTION__.7695, 12(%esp)
	movl	$26, 8(%esp)
	movl	$.LC116, 4(%esp)
	movl	$.LC117, (%esp)
	call	_assert_fail
.LVL2477:
	.cfi_endproc
.LFE854:
	.size	memzero.part.214, .-memzero.part.214
	.section	.boot.text
	.p2align 4,,15
	.globl	map_temp_boot_page
	.type	map_temp_boot_page, @function
map_temp_boot_page:
.LFB348:
	.loc 4 835 0
	.cfi_startproc
.LVL2478:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	.loc 4 841 0
	movl	$896, %edi
	.loc 4 835 0
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	.loc 4 842 0
	movl	$-536870912, %esi
	.loc 4 835 0
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 4 844 0
	xorl	%ebx, %ebx
	.loc 4 835 0
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 4 842 0
	movl	52(%esp), %eax
	.loc 4 840 0
	movl	48(%esp), %ebp
	.loc 4 841 0
	subl	52(%esp), %edi
	.loc 4 842 0
	sall	$22, %eax
	subl	%eax, %esi
	.loc 4 844 0
	movl	52(%esp), %eax
	.loc 4 840 0
	andl	$-4194304, %ebp
.LVL2479:
	.loc 4 844 0
	testl	%eax, %eax
	je	.L2158
.LVL2480:
	.p2align 4,,7
	.p2align 3
.L2160:
.LBB7399:
	.loc 4 845 0
	movl	%ebx, %edx
	sall	$22, %edx
.LVL2481:
.LBB7400:
.LBB7401:
	.loc 27 2755 0
	leal	(%edx,%ebp), %eax
.LVL2482:
.LBE7401:
.LBE7400:
	.loc 4 860 0
	addl	%esi, %edx
.LVL2483:
	leal	(%ebx,%edi), %ecx
.LBB7404:
.LBB7402:
	.loc 27 2799 0
	orl	$387, %eax
.LVL2484:
.LBE7402:
.LBE7404:
	.loc 4 860 0
	movl	%edx, (%esp)
.LBE7399:
	.loc 4 844 0
	addl	$1, %ebx
.LVL2485:
.LBB7406:
.LBB7405:
.LBB7403:
	.loc 27 2799 0
	movl	%eax, _boot_pd(,%ecx,4)
.LBE7403:
.LBE7405:
	.loc 4 860 0
	call	invalidateTLBentry
.LVL2486:
.LBE7406:
	.loc 4 844 0
	cmpl	52(%esp), %ebx
	jne	.L2160
.LVL2487:
.L2158:
	.loc 4 867 0
	call	invalidatePageStructureCache
.LVL2488:
	.loc 4 864 0
	movl	48(%esp), %eax
	.loc 4 870 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	.loc 4 864 0
	andl	$4194303, %eax
	.loc 4 865 0
	addl	%esi, %eax
	.loc 4 870 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL2489:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL2490:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL2491:
	ret
	.cfi_endproc
.LFE348:
	.size	map_temp_boot_page, .-map_temp_boot_page
	.section	.rodata.str1.4
	.align 4
.LC118:
	.string	"cap_page_table_cap_get_capPTIsMapped(pt_cap)"
	.section	.boot.text
	.p2align 4,,15
	.globl	map_it_pt_cap
	.type	map_it_pt_cap, @function
map_it_pt_cap:
.LFB351:
	.loc 4 913 0
	.cfi_startproc
.LVL2492:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 4 914 0
	movl	36(%esp), %edx
	.loc 4 913 0
	movl	40(%esp), %ebx
.LVL2493:
	.loc 4 914 0
	movl	32(%esp), %eax
.LVL2494:
	.loc 4 913 0
	movl	44(%esp), %esi
	.loc 4 914 0
	call	cap_get_capPtr
.LVL2495:
.LBB7417:
.LBB7418:
	.loc 27 1619 0
	movl	%ebx, %edx
	andl	$15, %edx
	cmpl	$3, %edx
	jne	.L2168
	.loc 27 1622 0
	andl	$16777200, %ebx
.LVL2496:
.LBE7418:
.LBE7417:
.LBB7421:
.LBB7422:
	.loc 27 1602 0
	movl	%esi, %ecx
.LBE7422:
.LBE7421:
.LBB7424:
.LBB7419:
	.loc 27 1622 0
	movl	%ebx, %edx
	sall	$8, %edx
.LVL2497:
.LBE7419:
.LBE7424:
.LBB7425:
.LBB7423:
	.loc 27 1602 0
	sall	$22, %ecx
.LVL2498:
.LBE7423:
.LBE7425:
	.loc 4 918 0
	andl	$67108864, %esi
.LVL2499:
	je	.L2169
.LVL2500:
.LBB7426:
.LBB7427:
	.loc 27 2615 0
	addl	$536870912, %edx
.LVL2501:
.LBE7427:
.LBE7426:
	.loc 4 920 0
	shrl	$22, %ecx
.LVL2502:
.LBB7429:
.LBB7428:
	.loc 27 2647 0
	orl	$7, %edx
.LVL2503:
	movl	%edx, (%eax,%ecx,4)
.LBE7428:
.LBE7429:
	.loc 4 931 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL2504:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.loc 4 930 0
	jmp	invalidatePageStructureCache
.LVL2505:
.L2168:
	.cfi_restore_state
.LBB7430:
.LBB7420:
	call	cap_page_table_cap_get_capPTBasePtr.isra.92.part.93
.LVL2506:
.L2169:
.LBE7420:
.LBE7430:
	.loc 4 918 0 discriminator 1
	movl	$__FUNCTION__.5095, 12(%esp)
	movl	$918, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC118, (%esp)
	call	_assert_fail
.LVL2507:
	.cfi_endproc
.LFE351:
	.size	map_it_pt_cap, .-map_it_pt_cap
	.p2align 4,,15
	.type	init_idt_entry.constprop.236, @function
init_idt_entry.constprop.236:
.LFB921:
	.loc 4 278 0
	.cfi_startproc
.LVL2508:
	.loc 4 283 0
	cmpl	$64, %eax
	movl	$24576, %ecx
	.loc 4 278 0
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.loc 4 283 0
	movl	$0, %ebx
	cmovl	%ebx, %ecx
.LVL2509:
.LBB7433:
.LBB7434:
	.loc 27 2536 0
	movzwl	%dx, %ebx
	.loc 27 2512 0
	xorw	%dx, %dx
.LVL2510:
	.loc 27 2536 0
	orl	$524288, %ebx
	.loc 27 2520 0
	orb	$142, %dh
	.loc 27 2528 0
	orl	%ecx, %edx
	.loc 27 2536 0
	movl	%ebx, ia32KSidt(,%eax,8)
	.loc 27 2528 0
	movl	%edx, ia32KSidt+4(,%eax,8)
.LBE7434:
.LBE7433:
	.loc 4 295 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE921:
	.size	init_idt_entry.constprop.236, .-init_idt_entry.constprop.236
	.section	.rodata.str1.4
	.align 4
.LC119:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/kernel/apic.c"
	.align 4
.LC120:
	.string	"IS_ALIGNED(startup_addr, PAGE_BITS)"
	.section	.rodata.str1.1
.LC121:
	.string	"startup_addr < 0xa0000"
	.section	.boot.text
	.p2align 4,,15
	.globl	apic_send_startup_ipi
	.type	apic_send_startup_ipi, @function
apic_send_startup_ipi:
.LFB304:
	.loc 8 260 0
	.cfi_startproc
.LVL2511:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 8 260 0
	movl	36(%esp), %eax
	movl	32(%esp), %edx
	.loc 8 262 0
	testl	$4095, %eax
	jne	.L2179
	.loc 8 264 0
	cmpl	$655359, %eax
	ja	.L2180
	.loc 8 265 0
	shrl	$12, %eax
.LVL2512:
.LBB7443:
.LBB7444:
	.loc 27 239 0
	testl	$-256, %edx
	jne	.L2181
	.loc 27 241 0
	sall	$24, %edx
.LVL2513:
.LBE7444:
.LBE7443:
.LBB7446:
.LBB7447:
	.loc 27 728 0
	orb	$6, %ah
.LVL2514:
.LBE7447:
.LBE7446:
.LBB7448:
.LBB7449:
	.loc 8 69 0
	movl	%edx, -64752
.LVL2515:
.LBE7449:
.LBE7448:
.LBB7450:
.LBB7451:
	movl	%eax, -64768
.LBE7451:
.LBE7450:
	.loc 8 285 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL2516:
.L2179:
	.cfi_restore_state
	.loc 8 262 0 discriminator 1
	movl	$__FUNCTION__.4351, 12(%esp)
	movl	$262, 8(%esp)
	movl	$.LC119, 4(%esp)
	movl	$.LC120, (%esp)
	call	_assert_fail
.LVL2517:
.L2181:
.LBB7452:
.LBB7445:
	call	apic_icr2_new.part.80
.LVL2518:
.L2180:
.LBE7445:
.LBE7452:
	.loc 8 264 0 discriminator 1
	movl	$__FUNCTION__.4351, 12(%esp)
	movl	$264, 8(%esp)
	movl	$.LC119, 4(%esp)
	movl	$.LC121, (%esp)
	call	_assert_fail
.LVL2519:
	.cfi_endproc
.LFE304:
	.size	apic_send_startup_ipi, .-apic_send_startup_ipi
	.text
	.p2align 4,,15
	.type	memzero.constprop.274, @function
memzero.constprop.274:
.LFB883:
	.loc 45 21 0
	.cfi_startproc
.LVL2520:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 45 26 0
	testb	$3, %al
	jne	.L2201
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %edx
	jne	.L2202
	testl	$2, %edi
	jne	.L2203
.L2185:
	movl	%edx, %ecx
	xorl	%eax, %eax
.LVL2521:
	shrl	$2, %ecx
	testb	$2, %dl
	rep stosl
	je	.L2186
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
.L2186:
	andl	$1, %edx
	je	.L2182
	movb	$0, (%edi)
.L2182:
	.loc 45 35 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2522:
	.p2align 4,,7
	.p2align 3
.L2202:
	.cfi_restore_state
	addl	$1, %edi
	movw	$4095, %dx
	testl	$2, %edi
	movb	$0, (%eax)
	je	.L2185
	.p2align 4,,7
	.p2align 3
.L2203:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %edx
	jmp	.L2185
.L2201:
	call	memzero.part.214
.LVL2523:
	.cfi_endproc
.LFE883:
	.size	memzero.constprop.274, .-memzero.constprop.274
	.section	.rodata.str1.1
.LC122:
	.string	"(read_write & ~0x1) == 0"
	.section	.text.unlikely
	.type	makeUserPTE, @function
makeUserPTE:
.LFB358:
	.loc 4 1043 0
	.cfi_startproc
.LVL2524:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%edx, %ebp
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	%eax, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%ecx, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 4 1043 0
	movl	48(%esp), %ebx
	.loc 4 1044 0
	movl	%ebx, %eax
.LVL2525:
	call	WritableFromVMRights
.LVL2526:
.LBB7463:
.LBB7464:
	.loc 4 1012 0
	cmpl	$1, %ebx
.LBE7464:
.LBE7463:
	.loc 4 1044 0
	movl	%eax, %ecx
.LVL2527:
.LBB7466:
.LBB7465:
	.loc 4 1012 0
	je	.L2206
	jb	.L2205
	cmpl	$3, %ebx
	jbe	.L2211
.L2205:
	call	SuperUserFromVMRights.part.49
.LVL2528:
.L2206:
	.loc 4 1014 0
	xorl	%ebx, %ebx
.LVL2529:
	jmp	.L2207
.LVL2530:
.L2211:
	.loc 4 1018 0
	movl	$1, %ebx
.LVL2531:
.L2207:
.LBE7465:
.LBE7466:
.LBB7467:
.LBB7468:
	.loc 27 474 0
	movl	%esi, %eax
.LBE7468:
.LBE7467:
.LBB7471:
.LBB7472:
	.loc 27 469 0
	movl	%esi, %edx
.LBE7472:
.LBE7471:
.LBB7475:
.LBB7469:
	.loc 27 474 0
	andl	$2, %eax
.LBE7469:
.LBE7475:
.LBB7476:
.LBB7473:
	.loc 27 469 0
	andl	$4, %edx
.LBE7473:
.LBE7476:
.LBB7477:
.LBB7470:
	.loc 27 474 0
	shrl	%eax
.LVL2532:
.LBE7470:
.LBE7477:
.LBB7478:
.LBB7474:
	.loc 27 469 0
	shrl	$2, %edx
.LVL2533:
.LBE7474:
.LBE7478:
.LBB7479:
.LBB7480:
	.loc 27 35 0
	testl	$4095, %ebp
	je	.L2208
	call	pte_new.part.106
.LVL2534:
.L2208:
	.loc 27 65 0
	andl	$1, %esi
.LVL2535:
	.loc 27 37 0
	andl	$-4096, %ebp
.LVL2536:
	.loc 27 49 0
	sall	$7, %edx
.LVL2537:
	.loc 27 61 0
	sall	$4, %eax
.LVL2538:
	.loc 27 65 0
	sall	$3, %esi
.LVL2539:
	.loc 27 69 0
	sall	$2, %ebx
.LVL2540:
	.loc 27 71 0
	testl	$-2, %ecx
	je	.L2209
	movl	$__FUNCTION__.1125, 12(%esp)
	movl	$71, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC122, (%esp)
	call	_assert_fail
.LVL2541:
.L2209:
	.loc 27 49 0
	orl	$1, %esi
.LVL2542:
	.loc 27 73 0
	addl	%ecx, %ecx
.LVL2543:
	.loc 27 61 0
	orl	%ebp, %esi
	.loc 27 65 0
	orl	%edx, %esi
	.loc 27 69 0
	orl	%eax, %esi
.LBE7480:
.LBE7479:
	.loc 4 1057 0
	movl	%edi, %eax
.LBB7482:
.LBB7481:
	.loc 27 73 0
	orl	%ecx, %esi
	.loc 27 77 0
	orl	%ebx, %esi
	movl	%esi, (%edi)
.LBE7481:
.LBE7482:
	.loc 4 1057 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL2544:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE358:
	.size	makeUserPTE, .-makeUserPTE
	.section	.rodata.str1.1
.LC123:
	.string	"Invalid page type"
	.text
	.p2align 4,,15
	.globl	unmapPage
	.type	unmapPage, @function
unmapPage:
.LFB372:
	.loc 4 1318 0
	.cfi_startproc
.LVL2545:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 4 1318 0
	movl	76(%esp), %eax
	movl	68(%esp), %edx
.LVL2546:
	movl	64(%esp), %esi
	movl	72(%esp), %ebp
	movl	%eax, 24(%esp)
.LBB7545:
.LBB7546:
	.loc 4 1213 0
	movl	%edx, %eax
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
.LVL2547:
	.loc 4 1214 0
	testl	%eax, %eax
	je	.L2216
	.loc 4 1222 0
	andl	$1023, %edx
.LVL2548:
	movl	(%eax,%edx,4), %ebx
.LVL2549:
	.loc 4 1223 0
	testl	%ebx, %ebx
	je	.L2216
.LVL2550:
.LBE7546:
.LBE7545:
	.loc 4 1330 0
	movl	ksCurThread, %eax
.LVL2551:
	andl	$-1024, %eax
	movl	20(%eax), %ecx
	movl	16(%eax), %eax
	movl	%ecx, 28(%esp)
.LVL2552:
.LBB7548:
.LBB7549:
	.loc 27 872 0
	movl	%eax, %edi
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %ecx
.LVL2553:
	cmpl	$14, %edi
	cmovne	%edx, %ecx
.LBE7549:
.LBE7548:
	.loc 4 1331 0
	cmpl	$5, %ecx
	je	.L2243
.LVL2554:
.L2219:
	.loc 4 1337 0
	testl	%esi, %esi
	je	.L2222
	cmpl	$1, %esi
	jne	.L2244
.LVL2555:
.LBB7550:
.LBB7551:
	.loc 4 1089 0
	shrl	$22, %ebp
.LVL2556:
	.loc 4 1090 0
	leal	(%ebx,%ebp,4), %edx
.LVL2557:
.LBE7551:
.LBE7550:
.LBB7552:
.LBB7553:
	.loc 27 2559 0
	movl	(%edx), %eax
.LBE7553:
.LBE7552:
	.loc 4 1365 0
	testb	$-128, %al
	jne	.L2245
.LVL2558:
.L2213:
	.loc 4 1390 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL2559:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2560:
	.p2align 4,,7
	.p2align 3
.L2244:
	.cfi_restore_state
	.loc 4 1387 0
	movl	$__func__.5241, 12(%esp)
	movl	$1387, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC123, (%esp)
	call	_fail
.LVL2561:
	.p2align 4,,7
	.p2align 3
.L2222:
.LBB7554:
.LBB7555:
.LBB7556:
.LBB7557:
	.loc 4 1089 0
	movl	%ebp, %eax
	shrl	$22, %eax
.LBE7557:
.LBE7556:
.LBB7558:
.LBB7559:
	.loc 27 2559 0
	movl	(%ebx,%eax,4), %eax
.LBE7559:
.LBE7558:
	.loc 4 1100 0
	testb	$-128, %al
	jne	.L2224
.LVL2562:
.LBB7560:
.LBB7561:
	.loc 27 2684 0
	jne	.L2246
.LBE7561:
.LBE7560:
	.loc 4 1100 0
	testb	$1, %al
	je	.L2224
.LVL2563:
.LBB7563:
	.loc 4 1113 0
	shrl	$10, %ebp
.LVL2564:
.LBB7564:
.LBB7565:
	.loc 27 2663 0
	andl	$-4096, %eax
.LVL2565:
.LBE7565:
.LBE7564:
	.loc 4 1114 0
	andl	$4092, %ebp
	leal	-536870912(%eax,%ebp), %edx
.LVL2566:
.LBE7563:
.LBE7555:
.LBE7554:
.LBB7571:
.LBB7572:
	.loc 27 154 0
	movl	(%edx), %eax
.LVL2567:
.LBE7572:
.LBE7571:
	.loc 4 1343 0
	testb	$1, %al
	je	.L2213
.LVL2568:
.LBB7573:
.LBB7574:
	.loc 10 41 0 discriminator 1
	movl	24(%esp), %ecx
.LBE7574:
.LBE7573:
.LBB7576:
.LBB7577:
	.loc 27 139 0 discriminator 1
	andl	$-4096, %eax
.LBE7577:
.LBE7576:
.LBB7578:
.LBB7575:
	.loc 10 41 0 discriminator 1
	addl	$536870912, %ecx
.LBE7575:
.LBE7578:
	.loc 4 1343 0 discriminator 1
	cmpl	%ecx, %eax
	jne	.L2213
.LVL2569:
	.loc 4 1348 0
	movl	$0, (%edx)
.LVL2570:
.L2227:
	.loc 4 1390 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL2571:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 4 1389 0
	jmp	invalidatePageStructureCache
.LVL2572:
	.p2align 4,,7
	.p2align 3
.L2216:
	.cfi_restore_state
.LBB7579:
.LBB7547:
	.loc 4 1215 0
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL2573:
.LBE7547:
.LBE7579:
	.loc 4 1390 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2574:
	.p2align 4,,7
	.p2align 3
.L2243:
	.cfi_restore_state
.LBB7580:
.LBB7581:
	.loc 27 1654 0 discriminator 1
	cmpl	$5, %edx
	jne	.L2247
.LBE7581:
.LBE7580:
	.loc 4 1331 0
	testl	$65536, 28(%esp)
	je	.L2219
.LVL2575:
.LBB7583:
.LBB7584:
	.loc 27 1711 0
	andl	$16777200, %eax
.LVL2576:
	sall	$8, %eax
.LBE7584:
.LBE7583:
	.loc 4 1332 0
	cmpl	%eax, %ebx
	jne	.L2219
	.loc 4 1334 0
	movl	%ebp, (%esp)
.LVL2577:
	call	invalidateTLBentry
.LVL2578:
	jmp	.L2219
.LVL2579:
	.p2align 4,,7
	.p2align 3
.L2224:
.LBB7585:
.LBB7569:
.LBB7566:
.LBB7567:
	.loc 4 1102 0
	movl	$89, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL2580:
.LBE7567:
.LBE7566:
.LBE7569:
.LBE7585:
	.loc 4 1390 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL2581:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL2582:
	ret
.LVL2583:
	.p2align 4,,7
	.p2align 3
.L2245:
	.cfi_restore_state
.LBB7586:
.LBB7587:
	.loc 27 2836 0
	je	.L2248
.LBE7587:
.LBE7586:
	.loc 4 1366 0
	testb	$1, %al
	je	.L2213
.LVL2584:
.LBB7589:
.LBB7590:
	.loc 10 41 0
	movl	24(%esp), %ecx
.LBE7590:
.LBE7589:
.LBB7592:
.LBB7593:
	.loc 27 2815 0
	andl	$-4194304, %eax
.LBE7593:
.LBE7592:
.LBB7594:
.LBB7591:
	.loc 10 41 0
	addl	$536870912, %ecx
.LBE7591:
.LBE7594:
	.loc 4 1365 0
	cmpl	%eax, %ecx
	jne	.L2213
.LVL2585:
	.loc 4 1371 0
	movl	$128, (%edx)
	.loc 4 1384 0
	jmp	.L2227
.LVL2586:
.L2247:
.LBB7595:
.LBB7582:
	call	cap_page_directory_cap_get_capPDIsMapped.part.69
.LVL2587:
.L2246:
.LBE7582:
.LBE7595:
.LBB7596:
.LBB7570:
.LBB7568:
.LBB7562:
	call	pde_pde_4k_ptr_get_present.part.125
.LVL2588:
.L2248:
.LBE7562:
.LBE7568:
.LBE7570:
.LBE7596:
.LBB7597:
.LBB7588:
	.p2align 4,,5
	call	pde_pde_4m_ptr_get_present.part.127
.LVL2589:
.LBE7588:
.LBE7597:
	.cfi_endproc
.LFE372:
	.size	unmapPage, .-unmapPage
	.section	.text.unlikely
	.type	makeUserPDE, @function
makeUserPDE:
.LFB357:
	.loc 4 1026 0
	.cfi_startproc
.LVL2590:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%edx, %ebp
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	%eax, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%ecx, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 4 1026 0
	movl	48(%esp), %ebx
	.loc 4 1027 0
	movl	%ebx, %eax
.LVL2591:
	call	WritableFromVMRights
.LVL2592:
.LBB7608:
.LBB7609:
	.loc 4 1012 0
	cmpl	$1, %ebx
.LBE7609:
.LBE7608:
	.loc 4 1027 0
	movl	%eax, %ecx
.LVL2593:
.LBB7611:
.LBB7610:
	.loc 4 1012 0
	je	.L2251
	jb	.L2250
	cmpl	$3, %ebx
	jbe	.L2256
.L2250:
	call	SuperUserFromVMRights.part.49
.LVL2594:
.L2251:
	.loc 4 1014 0
	xorl	%ebx, %ebx
.LVL2595:
	jmp	.L2252
.LVL2596:
.L2256:
	.loc 4 1018 0
	movl	$1, %ebx
.LVL2597:
.L2252:
.LBE7610:
.LBE7611:
.LBB7612:
.LBB7613:
	.loc 27 474 0
	movl	%esi, %eax
.LBE7613:
.LBE7612:
.LBB7616:
.LBB7617:
	.loc 27 469 0
	movl	%esi, %edx
.LBE7617:
.LBE7616:
.LBB7620:
.LBB7614:
	.loc 27 474 0
	andl	$2, %eax
.LBE7614:
.LBE7620:
.LBB7621:
.LBB7618:
	.loc 27 469 0
	andl	$4, %edx
.LBE7618:
.LBE7621:
.LBB7622:
.LBB7615:
	.loc 27 474 0
	shrl	%eax
.LVL2598:
.LBE7615:
.LBE7622:
.LBB7623:
.LBB7619:
	.loc 27 469 0
	shrl	$2, %edx
.LVL2599:
.LBE7619:
.LBE7623:
.LBB7624:
.LBB7625:
	.loc 27 2697 0
	testl	$4194303, %ebp
	je	.L2253
	call	pde_pde_4m_new.part.104
.LVL2600:
.L2253:
	.loc 27 2731 0
	andl	$1, %esi
.LVL2601:
	.loc 27 2699 0
	andl	$-4194304, %ebp
.LVL2602:
	.loc 27 2703 0
	sall	$12, %edx
.LVL2603:
	.loc 27 2727 0
	sall	$4, %eax
.LVL2604:
	.loc 27 2731 0
	sall	$3, %esi
.LVL2605:
	.loc 27 2735 0
	sall	$2, %ebx
.LVL2606:
	.loc 27 2737 0
	testl	$-2, %ecx
	je	.L2254
	movl	$__FUNCTION__.2223, 12(%esp)
	movl	$2737, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC122, (%esp)
	call	_assert_fail
.LVL2607:
.L2254:
	.loc 27 2715 0
	orl	$129, %esi
.LVL2608:
	.loc 27 2739 0
	addl	%ecx, %ecx
.LVL2609:
	.loc 27 2727 0
	orl	%ebp, %esi
	.loc 27 2731 0
	orl	%edx, %esi
	.loc 27 2735 0
	orl	%eax, %esi
.LBE7625:
.LBE7624:
	.loc 4 1040 0
	movl	%edi, %eax
.LBB7627:
.LBB7626:
	.loc 27 2739 0
	orl	%ecx, %esi
	.loc 27 2743 0
	orl	%ebx, %esi
	movl	%esi, (%edi)
.LBE7626:
.LBE7627:
	.loc 4 1040 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL2610:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE357:
	.size	makeUserPDE, .-makeUserPDE
	.section	.rodata.str1.1
.LC124:
	.string	"Invalid VM fault type"
	.text
	.p2align 4,,15
	.globl	handleVMFault
	.type	handleVMFault, @function
handleVMFault:
.LFB362:
	.loc 4 1123 0
	.cfi_startproc
.LVL2611:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 4 1123 0
	movl	36(%esp), %ebx
	.loc 4 1127 0
	call	getFaultAddr
.LVL2612:
.LBB7636:
.LBB7637:
	.loc 13 27 0
	movl	32(%esp), %edx
.LBE7637:
.LBE7636:
	.loc 4 1130 0
	testl	%ebx, %ebx
.LBB7639:
.LBB7638:
	.loc 13 27 0
	movl	52(%edx), %edx
.LBE7638:
.LBE7639:
	.loc 4 1130 0
	je	.L2260
	cmpl	$1, %ebx
	jne	.L2267
.LVL2613:
.LBB7640:
.LBB7641:
	.loc 27 1992 0
	testl	$-32, %edx
	jne	.L2264
.LVL2614:
	.loc 27 1994 0
	sall	$27, %edx
.LVL2615:
	.loc 27 2002 0
	orl	$524290, %edx
.LBE7641:
.LBE7640:
	.loc 4 1136 0
	movl	%eax, current_fault+4
	.loc 4 1142 0
	movl	$1, %eax
.LVL2616:
.LBB7643:
.LBB7642:
	.loc 27 2002 0
	movl	%edx, current_fault
.LBE7642:
.LBE7643:
	.loc 4 1142 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL2617:
	.p2align 4,,7
	.p2align 3
.L2267:
	.cfi_restore_state
	.loc 4 1140 0
	movl	$__func__.5172, 12(%esp)
	movl	$1140, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC124, (%esp)
	call	_fail
.LVL2618:
	.p2align 4,,7
	.p2align 3
.L2260:
.LBB7644:
.LBB7645:
	.loc 27 1992 0
	testl	$-32, %edx
	jne	.L2264
.LVL2619:
	.loc 27 1994 0
	sall	$27, %edx
.LVL2620:
	.loc 27 2002 0
	orl	$2, %edx
.LBE7645:
.LBE7644:
	.loc 4 1132 0
	movl	%eax, current_fault+4
	.loc 4 1142 0
	movl	$1, %eax
.LVL2621:
.LBB7648:
.LBB7646:
	.loc 27 2002 0
	movl	%edx, current_fault
.LBE7646:
.LBE7648:
	.loc 4 1142 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL2622:
.L2264:
	.cfi_restore_state
.LBB7649:
.LBB7647:
	call	fault_vm_fault_new.part.122
.LVL2623:
.LBE7647:
.LBE7649:
	.cfi_endproc
.LFE362:
	.size	handleVMFault, .-handleVMFault
	.section	.rodata.str1.4
	.align 4
.LC125:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/tcb.c"
	.align 4
.LC126:
	.string	"cap_get_capType(masterCap) == cap_reply_cap"
	.align 4
.LC127:
	.string	"cap_reply_cap_get_capReplyMaster(masterCap)"
	.align 4
.LC128:
	.string	"TCB_PTR(cap_reply_cap_get_capTCBPtr(masterCap)) == sender"
	.align 4
.LC129:
	.string	"cap_get_capType(callerCap) == cap_null_cap"
	.text
	.p2align 4,,15
	.globl	setupCallerCap
	.type	setupCallerCap, @function
setupCallerCap:
.LFB579:
	.loc 30 176 0
	.cfi_startproc
.LVL2624:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 30 176 0
	movl	48(%esp), %ebx
.LVL2625:
.LBB7672:
.LBB7673:
.LBB7674:
	.loc 27 626 0
	movl	592(%ebx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$5, %eax
.LBE7674:
.LBE7673:
.LBB7676:
.LBB7677:
	.loc 22 434 0
	cmpl	ksCurThread, %ebx
.LBE7677:
.LBE7676:
.LBB7682:
.LBB7675:
	.loc 27 627 0
	movl	%eax, 592(%ebx)
.LVL2626:
.LBE7675:
.LBE7682:
.LBB7683:
.LBB7680:
	.loc 22 434 0
	je	.L2283
.L2269:
.LBE7680:
.LBE7683:
.LBE7672:
	.loc 30 181 0
	movl	%ebx, %eax
	andl	$-1024, %eax
	leal	32(%eax), %ecx
.LVL2627:
	.loc 30 182 0
	movl	32(%eax), %eax
	movl	4(%ecx), %edi
.LVL2628:
.LBB7685:
.LBB7686:
	.loc 27 872 0
	movl	%eax, %ebp
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %esi
	cmpl	$14, %ebp
	cmovne	%edx, %esi
.LBE7686:
.LBE7685:
	.loc 30 184 0
	cmpl	$8, %esi
	jne	.L2284
.LVL2629:
.LBB7687:
.LBB7688:
	.loc 27 1237 0
	cmpl	$8, %edx
	jne	.L2285
.LBE7688:
.LBE7687:
	.loc 30 185 0
	andl	$1, %edi
.LVL2630:
	je	.L2286
.LVL2631:
.LBB7690:
.LBB7691:
	.loc 27 1248 0
	andl	$-16, %eax
.LVL2632:
.LBE7691:
.LBE7690:
	.loc 30 186 0
	cmpl	%eax, %ebx
	jne	.L2287
	.loc 30 187 0
	movl	52(%esp), %eax
	andl	$-1024, %eax
	.loc 30 188 0
	movl	48(%eax), %edx
	.loc 30 187 0
	leal	48(%eax), %esi
.LVL2633:
.LBB7692:
.LBB7693:
	.loc 27 872 0
	movl	%edx, %edi
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL2634:
	cmpl	$14, %edi
	cmove	%edx, %eax
.LBE7693:
.LBE7692:
	.loc 30 190 0
	testl	%eax, %eax
	jne	.L2288
.LVL2635:
.LBB7694:
.LBB7695:
	.loc 27 1211 0
	orl	$8, %ebx
.LVL2636:
.LBE7695:
.LBE7694:
	.loc 30 191 0
	movl	%esi, 12(%esp)
.LVL2637:
	movl	%ebx, (%esp)
	movl	%ecx, 8(%esp)
	movl	$0, 4(%esp)
	call	cteInsert
.LVL2638:
	.loc 30 193 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL2639:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2640:
	.p2align 4,,7
	.p2align 3
.L2283:
	.cfi_restore_state
.LBB7696:
.LBB7684:
.LBB7681:
	.loc 22 434 0
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L2269
.LVL2641:
.LBB7678:
.LBB7679:
	.loc 22 437 0
	call	rescheduleRequired
.LVL2642:
	jmp	.L2269
.LVL2643:
.L2288:
.LBE7679:
.LBE7678:
.LBE7681:
.LBE7684:
.LBE7696:
	.loc 30 190 0 discriminator 1
	movl	$__FUNCTION__.7058, 12(%esp)
.LVL2644:
	movl	$190, 8(%esp)
	movl	$.LC125, 4(%esp)
	movl	$.LC129, (%esp)
	call	_assert_fail
.LVL2645:
.L2287:
	.loc 30 186 0 discriminator 1
	movl	$__FUNCTION__.7058, 12(%esp)
.LVL2646:
	movl	$186, 8(%esp)
	movl	$.LC125, 4(%esp)
	movl	$.LC128, (%esp)
	call	_assert_fail
.LVL2647:
.L2286:
	.loc 30 185 0 discriminator 1
	movl	$__FUNCTION__.7058, 12(%esp)
.LVL2648:
	movl	$185, 8(%esp)
	movl	$.LC125, 4(%esp)
	movl	$.LC127, (%esp)
	call	_assert_fail
.LVL2649:
.L2285:
.LBB7697:
.LBB7689:
	call	cap_reply_cap_get_capReplyMaster.part.53
.LVL2650:
.L2284:
.LBE7689:
.LBE7697:
	.loc 30 184 0 discriminator 1
	movl	$__FUNCTION__.7058, 12(%esp)
	movl	$184, 8(%esp)
	movl	$.LC125, 4(%esp)
	movl	$.LC126, (%esp)
	call	_assert_fail
.LVL2651:
	.cfi_endproc
.LFE579:
	.size	setupCallerCap, .-setupCallerCap
	.section	.boot.text
	.p2align 4,,15
	.globl	write_slot
	.type	write_slot, @function
write_slot:
.LFB433:
	.loc 21 120 0
	.cfi_startproc
.LVL2652:
	.loc 21 120 0
	movl	4(%esp), %ecx
	.loc 21 121 0
	movl	8(%esp), %eax
	movl	12(%esp), %edx
	.loc 21 123 0
	movl	$0, 8(%ecx)
	.loc 21 121 0
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
.LVL2653:
.LBB7704:
.LBB7705:
	.loc 27 819 0
	movl	$3, 12(%ecx)
	ret
.LBE7705:
.LBE7704:
	.cfi_endproc
.LFE433:
	.size	write_slot, .-write_slot
	.p2align 4,,15
	.globl	apic_send_init_ipi
	.type	apic_send_init_ipi, @function
apic_send_init_ipi:
.LFB303:
	.loc 8 218 0
	.cfi_startproc
.LVL2654:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LVL2655:
	.loc 8 218 0
	movl	16(%esp), %eax
.LBB7722:
.LBB7723:
	.loc 27 239 0
	testl	$-256, %eax
	jne	.L2293
	.loc 27 241 0
	sall	$24, %eax
.LVL2656:
.LBE7723:
.LBE7722:
.LBB7725:
.LBB7726:
	.loc 8 69 0
	movl	%eax, -64752
.LVL2657:
.LBE7726:
.LBE7725:
.LBB7727:
.LBB7728:
	movl	$50432, -64768
.LVL2658:
.LBE7728:
.LBE7727:
.LBB7729:
.LBB7730:
	movl	%eax, -64752
.LVL2659:
.LBE7730:
.LBE7729:
.LBB7731:
.LBB7732:
	movl	$34048, -64768
.LBE7732:
.LBE7731:
	.loc 8 256 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL2660:
.L2293:
	.cfi_restore_state
.LBB7733:
.LBB7724:
	call	apic_icr2_new.part.80
.LVL2661:
.LBE7724:
.LBE7733:
	.cfi_endproc
.LFE303:
	.size	apic_send_init_ipi, .-apic_send_init_ipi
	.section	.rodata.str1.1
.LC130:
	.string	"(msgLength & ~0x7f) == 0"
	.text
	.p2align 4,,15
	.globl	doFaultTransfer
	.type	doFaultTransfer, @function
doFaultTransfer:
.LFB472:
	.loc 22 190 0
	.cfi_startproc
.LVL2662:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 22 190 0
	movl	36(%esp), %esi
	movl	40(%esp), %ebx
	.loc 22 194 0
	movl	44(%esp), %eax
	movl	%esi, (%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, 8(%esp)
	call	setMRs_fault
.LVL2663:
.LBB7742:
.LBB7743:
	.loc 27 1928 0
	movl	604(%esi), %edx
	andl	$7, %edx
.LVL2664:
.LBE7743:
.LBE7742:
.LBB7744:
.LBB7745:
	.loc 14 22 0
	sall	$12, %edx
.LVL2665:
	.loc 14 32 0
	testl	$-128, %eax
	jne	.L2297
.LVL2666:
	.loc 14 34 0
	orl	%eax, %edx
.LVL2667:
.LBE7745:
.LBE7744:
.LBB7748:
.LBB7749:
	.loc 13 21 0
	movl	32(%esp), %eax
.LVL2668:
.LBE7749:
.LBE7748:
.LBB7751:
.LBB7746:
	.loc 14 34 0
	movl	%edx, 16(%ebx)
.LVL2669:
.LBE7746:
.LBE7751:
.LBB7752:
.LBB7750:
	.loc 13 21 0
	movl	%eax, 4(%ebx)
.LBE7750:
.LBE7752:
	.loc 22 199 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL2670:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL2671:
.L2297:
	.cfi_restore_state
.LBB7753:
.LBB7747:
	.loc 14 32 0
	movl	$__FUNCTION__.972, 12(%esp)
.LVL2672:
	movl	$32, 8(%esp)
	movl	$.LC69, 4(%esp)
	movl	$.LC130, (%esp)
	call	_assert_fail
.LVL2673:
.LBE7747:
.LBE7753:
	.cfi_endproc
.LFE472:
	.size	doFaultTransfer, .-doFaultTransfer
	.p2align 4,,15
	.globl	replyFromKernel_success_empty
	.type	replyFromKernel_success_empty, @function
replyFromKernel_success_empty:
.LFB540:
	.loc 44 213 0
	.cfi_startproc
.LVL2674:
	.loc 44 213 0
	movl	4(%esp), %eax
.LVL2675:
.LBB7760:
.LBB7761:
	.loc 13 21 0
	movl	$0, 4(%eax)
.LVL2676:
.LBE7761:
.LBE7760:
.LBB7762:
.LBB7763:
	movl	$0, 16(%eax)
	ret
.LBE7763:
.LBE7762:
	.cfi_endproc
.LFE540:
	.size	replyFromKernel_success_empty, .-replyFromKernel_success_empty
	.p2align 4,,15
	.globl	doAsyncTransfer
	.type	doAsyncTransfer, @function
doAsyncTransfer:
.LFB474:
	.loc 22 264 0
	.cfi_startproc
.LVL2677:
	.loc 22 264 0
	movl	12(%esp), %eax
.LVL2678:
.LBB7772:
.LBB7773:
	.loc 13 21 0
	movl	8(%esp), %edx
.LBE7773:
.LBE7772:
.LBB7775:
.LBB7776:
	movl	$1, 16(%eax)
.LBE7776:
.LBE7775:
.LBB7778:
.LBB7774:
	movl	%edx, 20(%eax)
.LVL2679:
.LBE7774:
.LBE7778:
.LBB7779:
.LBB7780:
	movl	4(%esp), %edx
	movl	%edx, 4(%eax)
.LVL2680:
.LBE7780:
.LBE7779:
.LBB7781:
.LBB7777:
	ret
.LBE7777:
.LBE7781:
	.cfi_endproc
.LFE474:
	.size	doAsyncTransfer, .-doAsyncTransfer
	.p2align 4,,15
	.globl	cteMove
	.type	cteMove, @function
cteMove:
.LFB514:
	.loc 26 465 0
	.cfi_startproc
.LVL2681:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 26 465 0
	movl	44(%esp), %ecx
	movl	40(%esp), %ebx
	.loc 26 470 0
	movl	(%ecx), %edx
.LVL2682:
.LBB7808:
.LBB7809:
	.loc 27 872 0
	movl	%edx, %esi
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL2683:
	cmpl	$14, %esi
	cmove	%edx, %eax
.LBE7809:
.LBE7808:
	.loc 26 470 0
	testl	%eax, %eax
	jne	.L2317
	.loc 26 472 0
	testl	$-8, 12(%ecx)
	jne	.L2304
	.loc 26 472 0 is_stmt 0 discriminator 2
	testl	$-8, 8(%ecx)
	jne	.L2304
	.loc 26 475 0 is_stmt 1
	movl	8(%ebx), %esi
.LVL2684:
	.loc 26 476 0
	movl	32(%esp), %eax
	movl	36(%esp), %edx
	.loc 26 475 0
	movl	12(%ebx), %edi
.LVL2685:
	.loc 26 476 0
	movl	%eax, (%ecx)
.LVL2686:
	movl	%edx, 4(%ecx)
.LVL2687:
	.loc 26 477 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	.loc 26 478 0
	movl	%esi, 8(%ecx)
	.loc 26 482 0
	andl	$-8, %esi
.LVL2688:
	.loc 26 478 0
	movl	%edi, 12(%ecx)
.LVL2689:
	.loc 26 479 0
	movl	$0, 8(%ebx)
.LVL2690:
	movl	$0, 12(%ebx)
	.loc 26 482 0
	jne	.L2318
.L2306:
	.loc 26 488 0
	andl	$-8, %edi
.LVL2691:
	jne	.L2319
	.loc 26 492 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2319:
	.cfi_restore_state
.LVL2692:
.LBB7810:
.LBB7811:
	.loc 27 839 0
	testb	$7, %cl
	jne	.L2320
	.loc 27 840 0
	movl	8(%edi), %eax
	.loc 27 841 0
	andl	$-8, %ecx
.LVL2693:
	.loc 27 840 0
	andl	$7, %eax
	.loc 27 841 0
	orl	%ecx, %eax
	movl	%eax, 8(%edi)
.LBE7811:
.LBE7810:
	.loc 26 492 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL2694:
	ret
.LVL2695:
	.p2align 4,,7
	.p2align 3
.L2318:
	.cfi_restore_state
.LBB7813:
.LBB7814:
	.loc 27 773 0
	testb	$7, %cl
	jne	.L2321
	.loc 27 774 0
	movl	12(%esi), %eax
.LVL2696:
	.loc 27 775 0
	movl	%ecx, %edx
.LVL2697:
	andl	$-8, %edx
	.loc 27 774 0
	andl	$7, %eax
	.loc 27 775 0
	orl	%edx, %eax
	movl	%eax, 12(%esi)
	jmp	.L2306
.LVL2698:
.L2304:
.LBE7814:
.LBE7813:
	.loc 26 472 0 discriminator 1
	movl	$__FUNCTION__.6500, 12(%esp)
.LVL2699:
	movl	$473, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC105, (%esp)
	call	_assert_fail
.LVL2700:
.L2317:
	.loc 26 470 0 discriminator 1
	movl	$__FUNCTION__.6500, 12(%esp)
.LVL2701:
	movl	$470, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC104, (%esp)
	call	_assert_fail
.LVL2702:
.L2320:
.LBB7816:
.LBB7812:
	call	mdb_node_ptr_set_mdbPrev.isra.180.part.181
.LVL2703:
.L2321:
.LBE7812:
.LBE7816:
.LBB7817:
.LBB7815:
	call	mdb_node_ptr_set_mdbNext.isra.178.part.179
.LVL2704:
.LBE7815:
.LBE7817:
	.cfi_endproc
.LFE514:
	.size	cteMove, .-cteMove
	.p2align 4,,15
	.globl	invokeCNodeRotate
	.type	invokeCNodeRotate, @function
invokeCNodeRotate:
.LFB510:
	.loc 26 345 0
	.cfi_startproc
.LVL2705:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$36, %esp
	.cfi_def_cfa_offset 48
	.loc 26 345 0
	movl	64(%esp), %ebx
	movl	72(%esp), %eax
	movl	68(%esp), %esi
	.loc 26 346 0
	cmpl	%eax, %ebx
	je	.L2326
	.loc 26 349 0
	movl	60(%esp), %edx
	movl	%eax, 12(%esp)
	movl	56(%esp), %eax
	movl	%esi, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteMove
.LVL2706:
	.loc 26 350 0
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	cteMove
.LVL2707:
	.loc 26 354 0
	addl	$36, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2326:
	.cfi_restore_state
	.loc 26 347 0
	movl	56(%esp), %eax
	movl	60(%esp), %edx
	movl	%esi, 20(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 12(%esp)
	movl	48(%esp), %eax
	movl	%edx, 16(%esp)
	movl	52(%esp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	cteSwap
.LVL2708:
	.loc 26 354 0
	addl	$36, %esp
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE510:
	.size	invokeCNodeRotate, .-invokeCNodeRotate
	.p2align 4,,15
	.globl	setupReplyMaster
	.type	setupReplyMaster, @function
setupReplyMaster:
.LFB527:
	.loc 26 816 0
	.cfi_startproc
.LVL2709:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 26 816 0
	movl	32(%esp), %ebx
	.loc 26 819 0
	movl	%ebx, %ecx
	andl	$-1024, %ecx
	.loc 26 820 0
	movl	32(%ecx), %edx
	.loc 26 819 0
	leal	32(%ecx), %esi
.LVL2710:
.LBB7830:
.LBB7831:
	.loc 27 872 0
	movl	%edx, %edi
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL2711:
	cmpl	$14, %edi
	cmove	%edx, %eax
.LBE7831:
.LBE7830:
	.loc 26 820 0
	testl	%eax, %eax
	je	.L2333
	.loc 26 828 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL2712:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2713:
	.p2align 4,,7
	.p2align 3
.L2333:
	.cfi_restore_state
.LBB7832:
.LBB7833:
	.loc 27 1205 0
	testb	$15, %bl
	jne	.L2334
.LVL2714:
	.loc 27 1207 0
	andl	$-16, %ebx
.LVL2715:
	.loc 27 1211 0
	orl	$8, %ebx
.LVL2716:
	movl	%ebx, 32(%ecx)
.LVL2717:
.LBE7833:
.LBE7832:
	.loc 26 823 0
	movl	$1, 4(%esi)
.LVL2718:
	.loc 26 824 0
	movl	$0, 8(%esi)
.LVL2719:
.LBB7835:
.LBB7836:
	.loc 27 819 0
	movl	$3, 12(%esi)
.LBE7836:
.LBE7835:
	.loc 26 828 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL2720:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL2721:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2722:
.L2334:
	.cfi_restore_state
.LBB7837:
.LBB7834:
	.loc 27 1205 0
	movl	$__FUNCTION__.1657, 12(%esp)
.LVL2723:
	movl	$1205, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC92, (%esp)
	call	_assert_fail
.LVL2724:
.LBE7834:
.LBE7837:
	.cfi_endproc
.LFE527:
	.size	setupReplyMaster, .-setupReplyMaster
	.p2align 4,,15
	.type	resetMemMapping, @function
resetMemMapping:
.LFB414:
	.loc 19 224 0
	.cfi_startproc
.LVL2725:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
.LBB7850:
.LBB7851:
	.loc 27 872 0
	movl	%edx, %edi
.LBE7851:
.LBE7850:
	.loc 19 224 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
.LBB7855:
.LBB7852:
	.loc 27 872 0
	andl	$14, %edi
.LBE7852:
.LBE7855:
	.loc 19 224 0
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LBB7856:
.LBB7853:
	.loc 27 873 0
	movl	%edx, %esi
	andl	$15, %esi
.LBE7853:
.LBE7856:
	.loc 19 224 0
	subl	$16, %esp
	.cfi_def_cfa_offset 32
.LBB7857:
.LBB7854:
	.loc 27 873 0
	movzbl	%dl, %ebx
.LVL2726:
	cmpl	$14, %edi
	cmovne	%esi, %ebx
.LVL2727:
.LBE7854:
.LBE7857:
	.loc 19 225 0
	cmpl	$3, %ebx
	je	.L2339
	cmpl	$5, %ebx
	je	.L2340
	cmpl	$1, %ebx
	je	.L2348
	.loc 19 236 0
	movl	%edx, (%eax)
.LVL2728:
	movl	%ecx, 4(%eax)
	.loc 19 237 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2729:
	.p2align 4,,7
	.p2align 3
.L2348:
	.cfi_restore_state
.LBB7858:
.LBB7859:
.LBB7860:
	.loc 27 1422 0
	cmpl	$1, %esi
	jne	.L2349
.LVL2730:
.LBE7860:
.LBE7859:
.LBB7864:
.LBB7865:
	.loc 27 1480 0
	andl	$67108863, %edx
.LVL2731:
.LBE7865:
.LBE7864:
.LBB7867:
.LBB7861:
	.loc 27 1427 0
	andl	$-1072693249, %ecx
.LVL2732:
.LBE7861:
.LBE7867:
.LBB7868:
.LBB7866:
	.loc 27 1480 0
	movl	%edx, (%eax)
.LBE7866:
.LBE7868:
.LBB7869:
.LBB7862:
	.loc 27 1427 0
	movl	%ecx, 4(%eax)
.LBE7862:
.LBE7869:
.LBE7858:
	.loc 19 237 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2733:
	.p2align 4,,7
	.p2align 3
.L2340:
	.cfi_restore_state
.LBB7871:
.LBB7872:
	.loc 27 1662 0
	cmpl	$5, %esi
	jne	.L2350
.LVL2734:
	.loc 27 1667 0
	andl	$-65537, %ecx
.LVL2735:
	.loc 27 1669 0
	movl	%edx, (%eax)
	.loc 27 1667 0
	movl	%ecx, 4(%eax)
.LBE7872:
.LBE7871:
	.loc 19 237 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2736:
	.p2align 4,,7
	.p2align 3
.L2339:
	.cfi_restore_state
.LBB7874:
.LBB7875:
	.loc 27 1554 0
	cmpl	$3, %esi
	jne	.L2351
.LVL2737:
	.loc 27 1559 0
	andl	$-67108865, %ecx
.LVL2738:
	.loc 27 1561 0
	movl	%edx, (%eax)
	.loc 27 1559 0
	movl	%ecx, 4(%eax)
.LBE7875:
.LBE7874:
	.loc 19 237 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2739:
.L2349:
	.cfi_restore_state
.LBB7877:
.LBB7870:
.LBB7863:
	.loc 27 1422 0
	movl	$__FUNCTION__.1737, 12(%esp)
	movl	$1423, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC51, (%esp)
	call	_assert_fail
.LVL2740:
.L2350:
.LBE7863:
.LBE7870:
.LBE7877:
.LBB7878:
.LBB7873:
	.loc 27 1662 0
	movl	$__FUNCTION__.1833, 12(%esp)
	movl	$1663, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC40, (%esp)
	call	_assert_fail
.LVL2741:
.L2351:
.LBE7873:
.LBE7878:
.LBB7879:
.LBB7876:
	call	cap_page_table_cap_set_capPTIsMapped.part.129
.LVL2742:
.LBE7876:
.LBE7879:
	.cfi_endproc
.LFE414:
	.size	resetMemMapping, .-resetMemMapping
	.p2align 4,,15
	.globl	Arch_switchToThread
	.type	Arch_switchToThread, @function
Arch_switchToThread:
.LFB337:
	.loc 12 20 0
	.cfi_startproc
.LVL2743:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 12 20 0
	movl	32(%esp), %ebx
	.loc 12 24 0
	movl	%ebx, (%esp)
	call	setVMRoot
.LVL2744:
.LBB7896:
.LBB7897:
	.loc 27 2270 0
	movl	ia32KSgdt+52, %ecx
.LBE7897:
.LBE7896:
.LBB7901:
.LBB7902:
	.loc 13 27 0
	movl	48(%ebx), %edx
.LVL2745:
.LBE7902:
.LBE7901:
.LBB7903:
.LBB7898:
	.loc 27 2270 0
	movl	%ecx, %eax
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L2355
.LBE7898:
.LBE7903:
	.loc 12 29 0
	movl	%edx, %eax
.LBB7904:
.LBB7905:
	.loc 27 2263 0
	xorb	%cl, %cl
.LBE7905:
.LBE7904:
	.loc 12 29 0
	shrl	$16, %eax
.LBB7908:
.LBB7906:
	.loc 27 2264 0
	movzbl	%al, %eax
	orl	%ecx, %eax
.LBE7906:
.LBE7908:
.LBB7909:
.LBB7910:
	.loc 27 2244 0
	movl	%eax, %ecx
	shrl	$10, %ecx
	andl	$7, %ecx
.LBE7910:
.LBE7909:
.LBB7915:
.LBB7899:
	.loc 27 2277 0
	movw	%dx, ia32KSgdt+50
.LVL2746:
.LBE7899:
.LBE7915:
	.loc 12 30 0
	shrl	$24, %edx
.LVL2747:
.LBB7916:
.LBB7911:
	.loc 27 2244 0
	cmpl	$4, %ecx
	jne	.L2359
.LBE7911:
.LBE7916:
.LBB7917:
.LBB7918:
	.loc 27 2270 0
	movl	ia32KSgdt+60, %ecx
.LBE7918:
.LBE7917:
.LBB7921:
.LBB7912:
	.loc 27 2251 0
	sall	$24, %edx
.LVL2748:
	.loc 27 2250 0
	andl	$16777215, %eax
	.loc 27 2251 0
	orl	%edx, %eax
.LBE7912:
.LBE7921:
	.loc 12 33 0
	movl	636(%ebx), %edx
.LVL2749:
.LBB7922:
.LBB7913:
	.loc 27 2251 0
	movl	%eax, ia32KSgdt+52
.LBE7913:
.LBE7922:
.LBB7923:
.LBB7919:
	.loc 27 2270 0
	movl	%ecx, %eax
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L2355
.LBE7919:
.LBE7923:
	.loc 12 35 0
	movl	%edx, %eax
.LBB7924:
.LBB7925:
	.loc 27 2263 0
	xorb	%cl, %cl
.LBE7925:
.LBE7924:
	.loc 12 35 0
	shrl	$16, %eax
.LBB7928:
.LBB7926:
	.loc 27 2264 0
	movzbl	%al, %eax
	orl	%ecx, %eax
.LBE7926:
.LBE7928:
.LBB7929:
.LBB7920:
	.loc 27 2277 0
	movw	%dx, ia32KSgdt+58
.LVL2750:
.LBE7920:
.LBE7929:
	.loc 12 36 0
	shrl	$24, %edx
.LVL2751:
	movl	%edx, %ecx
.LVL2752:
.LBB7930:
.LBB7931:
	.loc 27 2244 0
	movl	%eax, %edx
.LVL2753:
	shrl	$10, %edx
	andl	$7, %edx
	cmpl	$4, %edx
	jne	.L2360
	.loc 27 2250 0
	andl	$16777215, %eax
	.loc 27 2251 0
	sall	$24, %ecx
.LVL2754:
	orl	%ecx, %eax
	movl	%eax, ia32KSgdt+60
.LBE7931:
.LBE7930:
	.loc 12 37 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL2755:
	ret
.LVL2756:
.L2355:
	.cfi_restore_state
.LBB7932:
.LBB7900:
	call	gdt_entry_gdt_data_ptr_set_base_low.part.72
.LVL2757:
.L2360:
.LBE7900:
.LBE7932:
.LBB7933:
.LBB7927:
	.loc 27 2264 0
	movl	%eax, ia32KSgdt+60
.LVL2758:
.L2357:
.LBE7927:
.LBE7933:
.LBB7934:
.LBB7914:
	call	gdt_entry_gdt_data_ptr_set_base_high.isra.75.part.76
.LVL2759:
.L2359:
.LBE7914:
.LBE7934:
.LBB7935:
.LBB7907:
	movl	%eax, ia32KSgdt+52
	jmp	.L2357
.LBE7907:
.LBE7935:
	.cfi_endproc
.LFE337:
	.size	Arch_switchToThread, .-Arch_switchToThread
	.section	.rodata.str1.1
.LC131:
	.string	"isRunnable(thread)"
	.text
	.p2align 4,,15
	.globl	chooseThread
	.type	chooseThread, @function
chooseThread:
.LFB477:
	.loc 22 326 0
	.cfi_startproc
.LVL2760:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.loc 22 330 0
	movl	$255, %edx
	.loc 22 326 0
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	ksCurDomain, %ecx
	sall	$8, %ecx
	jmp	.L2367
.LVL2761:
	.p2align 4,,7
	.p2align 3
.L2362:
	.loc 22 330 0
	subl	$1, %edx
.LVL2762:
	cmpl	$-1, %edx
	je	.L2372
.LVL2763:
.L2367:
	leal	(%edx,%ecx), %eax
.LVL2764:
.LBB7956:
	.loc 22 332 0
	movl	ksReadyQueues(,%eax,8), %ebx
.LVL2765:
	.loc 22 333 0
	testl	%ebx, %ebx
	je	.L2362
.LVL2766:
.LBB7957:
.LBB7958:
.LBB7959:
.LBB7960:
	.loc 27 614 0
	movl	592(%ebx), %eax
.LVL2767:
	andl	$15, %eax
.LBE7960:
.LBE7959:
	.loc 22 49 0
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L2363
.LVL2768:
.LBE7958:
.LBE7957:
.LBB7961:
.LBB7962:
	.loc 22 346 0
	movl	%ebx, (%esp)
	call	Arch_switchToThread
.LVL2769:
.LBB7963:
.LBB7964:
	.loc 30 97 0
	testb	$1, 600(%ebx)
	je	.L2369
	movl	%ebx, %eax
	call	tcbSchedDequeue.part.202
.LVL2770:
.L2369:
.LBE7964:
.LBE7963:
	.loc 22 348 0
	movl	%ebx, ksCurThread
.LBE7962:
.LBE7961:
.LBE7956:
	.loc 22 341 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL2771:
	ret
.LVL2772:
	.p2align 4,,7
	.p2align 3
.L2363:
	.cfi_restore_state
.LBB7965:
	.loc 22 334 0
	movl	$__FUNCTION__.6191, 12(%esp)
	movl	$334, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$.LC131, (%esp)
	call	_assert_fail
.LVL2773:
	.p2align 4,,7
	.p2align 3
.L2372:
.LBE7965:
.LBB7966:
.LBB7967:
	.loc 22 355 0
	movl	ksIdleThread, %eax
.LVL2774:
	movl	%eax, ksCurThread
.LBE7967:
.LBE7966:
	.loc 22 341 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL2775:
	ret
	.cfi_endproc
.LFE477:
	.size	chooseThread, .-chooseThread
	.section	.rodata.str1.4
	.align 4
.LC132:
	.string	"cap_frame_cap_get_capFMappedASID(frame_cap) != 0"
	.section	.boot.text
	.p2align 4,,15
	.globl	map_it_frame_cap
	.type	map_it_frame_cap, @function
map_it_frame_cap:
.LFB352:
	.loc 4 935 0
	.cfi_startproc
.LVL2776:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 4 937 0
	movl	36(%esp), %edx
	.loc 4 935 0
	movl	40(%esp), %ebx
	.loc 4 937 0
	movl	32(%esp), %eax
	.loc 4 935 0
	movl	44(%esp), %esi
.LVL2777:
	.loc 4 937 0
	call	cap_get_capPtr
.LVL2778:
.LBB7986:
.LBB7987:
	.loc 27 1507 0
	movl	%ebx, %edx
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L2378
.LBE7987:
.LBE7986:
.LBB7992:
.LBB7993:
	.loc 27 1437 0
	movl	%esi, %edi
.LBE7993:
.LBE7992:
.LBB7995:
.LBB7996:
.LBB7997:
.LBB7998:
	.loc 27 1417 0
	andl	$1072693248, %esi
.LVL2779:
.LBE7998:
.LBE7997:
.LBE7996:
.LBE7995:
.LBB8007:
.LBB7988:
	.loc 27 1510 0
	movl	%ebx, %ecx
.LBE7988:
.LBE8007:
.LBB8008:
.LBB8005:
.LBB8001:
.LBB7999:
	.loc 27 1417 0
	movl	%esi, %edx
.LBE7999:
.LBE8001:
.LBB8002:
.LBB8003:
	.loc 27 1470 0
	shrl	$26, %ebx
.LVL2780:
.LBE8003:
.LBE8002:
.LBE8005:
.LBE8008:
.LBB8009:
.LBB7989:
	.loc 27 1510 0
	andl	$16777200, %ecx
.LVL2781:
.LBE7989:
.LBE8009:
.LBB8010:
.LBB8006:
.LBB8004:
.LBB8000:
	.loc 27 1417 0
	shrl	$20, %edx
.LBE8000:
.LBE8004:
	.loc 40 321 0
	sall	$10, %ebx
.LBE8006:
.LBE8010:
.LBB8011:
.LBB7990:
	.loc 27 1510 0
	sall	$8, %ecx
.LVL2782:
.LBE7990:
.LBE8011:
.LBB8012:
.LBB7994:
	.loc 27 1437 0
	sall	$12, %edi
.LVL2783:
.LBE7994:
.LBE8012:
	.loc 4 941 0
	addl	%ebx, %edx
	je	.L2379
.LVL2784:
	.loc 4 942 0
	movl	%edi, %edx
	shrl	$22, %edx
.LBB8013:
.LBB8014:
	.loc 27 2660 0
	movl	(%eax,%edx,4), %eax
.LVL2785:
	testb	$-128, %al
	jne	.L2380
.LVL2786:
	.loc 27 2663 0
	andl	$-4096, %eax
.LVL2787:
.LBE8014:
.LBE8013:
.LBB8017:
.LBB8018:
	.loc 27 89 0
	addl	$536870912, %ecx
.LVL2788:
.LBE8018:
.LBE8017:
.LBB8021:
.LBB8015:
	.loc 27 2663 0
	movl	%eax, %edx
.LBE8015:
.LBE8021:
	.loc 4 945 0
	movl	%edi, %eax
.LVL2789:
	andl	$4194303, %eax
.LBB8022:
.LBB8019:
	.loc 27 129 0
	orl	$7, %ecx
.LVL2790:
.LBE8019:
.LBE8022:
	.loc 4 945 0
	shrl	$12, %eax
.LBB8023:
.LBB8020:
	.loc 27 129 0
	movl	%ecx, -536870912(%edx,%eax,4)
.LBE8020:
.LBE8023:
	.loc 4 959 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	.loc 4 958 0
	jmp	invalidatePageStructureCache
.LVL2791:
.L2378:
	.cfi_restore_state
.LBB8024:
.LBB7991:
	call	cap_frame_cap_get_capFBasePtr.isra.90.part.91
.LVL2792:
.L2380:
.LBE7991:
.LBE8024:
.LBB8025:
.LBB8016:
	call	pde_pde_4k_ptr_get_pt_base_address.part.113
.LVL2793:
.L2379:
.LBE8016:
.LBE8025:
	.loc 4 941 0 discriminator 1
	movl	$__FUNCTION__.5104, 12(%esp)
	movl	$941, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC132, (%esp)
	call	_assert_fail
.LVL2794:
	.cfi_endproc
.LFE352:
	.size	map_it_frame_cap, .-map_it_frame_cap
	.section	.rodata.str1.1
.LC133:
	.string	"Invalid syscall error"
	.text
	.p2align 4,,15
	.globl	setMRs_syscall_error
	.type	setMRs_syscall_error, @function
setMRs_syscall_error:
.LFB425:
	.loc 20 145 0
	.cfi_startproc
.LVL2795:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 20 148 0
	movl	current_syscall_error+24, %eax
	cmpl	$10, %eax
	ja	.L2382
	jmp	*.L2384(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L2384:
	.long	.L2382
	.long	.L2383
	.long	.L2385
	.long	.L2394
	.long	.L2387
	.long	.L2394
	.long	.L2388
	.long	.L2394
	.long	.L2394
	.long	.L2394
	.long	.L2389
	.text
	.p2align 4,,7
	.p2align 3
.L2394:
	.loc 20 160 0
	xorl	%eax, %eax
.L2386:
	.loc 20 189 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2387:
	.cfi_restore_state
.LVL2796:
.LBB8068:
.LBB8069:
	.loc 13 21 0
	movl	current_syscall_error+8, %eax
	movl	32(%esp), %ecx
	movl	%eax, 20(%ecx)
.LVL2797:
.LBE8069:
.LBE8068:
.LBB8070:
.LBB8071:
	movl	current_syscall_error+12, %eax
	movl	%eax, 24(%ecx)
.LBE8071:
.LBE8070:
	.loc 20 189 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 20 167 0
	movl	$2, %eax
	.loc 20 189 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL2798:
	.p2align 4,,7
	.p2align 3
.L2389:
	.cfi_restore_state
.LBB8072:
.LBB8073:
	.loc 13 21 0
	movl	current_syscall_error+16, %eax
	movl	32(%esp), %esi
	movl	%eax, 20(%esi)
.LBE8073:
.LBE8072:
	.loc 20 189 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 20 185 0
	xorl	%eax, %eax
	.loc 20 189 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL2799:
	.p2align 4,,7
	.p2align 3
.L2388:
	.cfi_restore_state
	.loc 20 173 0
	movl	current_syscall_error+20, %edx
	xorl	%eax, %eax
.LBB8074:
.LBB8075:
	.loc 13 21 0
	movl	32(%esp), %ecx
.LBE8075:
.LBE8074:
.LBB8077:
.LBB8078:
	.loc 20 27 0
	movl	32(%esp), %esi
	movl	current_lookup_fault+4, %ebx
.LBE8078:
.LBE8077:
	.loc 20 173 0
	testl	%edx, %edx
	setne	%al
.LBB8109:
.LBB8076:
	.loc 13 21 0
	movl	%eax, 20(%ecx)
.LVL2800:
	movl	current_lookup_fault, %ecx
.LVL2801:
.LBE8076:
.LBE8109:
.LBB8110:
.LBB8107:
.LBB8079:
.LBB8080:
	.loc 27 2358 0
	movl	%ecx, %edx
.LVL2802:
	andl	$3, %edx
.LVL2803:
.LBE8080:
.LBE8079:
	.loc 20 27 0
	leal	1(%edx), %eax
.LVL2804:
	movl	%eax, 24(%esi)
	.loc 20 30 0
	movl	36(%esp), %esi
	.loc 20 31 0
	movl	$2, %eax
.LVL2805:
	.loc 20 30 0
	testl	%esi, %esi
	je	.L2386
	.loc 20 38 0
	cmpl	$2, %edx
	je	.L2391
	cmpl	$3, %edx
	je	.L2392
	cmpl	$1, %edx
	.p2align 4,,2
	jne	.L2386
.LVL2806:
.LBB8081:
.LBB8082:
	.loc 27 2400 0
	movl	36(%esp), %eax
	andl	$252, %ecx
.LVL2807:
	shrl	$2, %ecx
	movl	%ecx, 12(%eax)
.LVL2808:
.LBE8082:
.LBE8081:
	.loc 20 45 0
	movl	$3, %eax
	jmp	.L2386
.LVL2809:
	.p2align 4,,7
	.p2align 3
.L2383:
.LBE8107:
.LBE8110:
.LBB8111:
.LBB8112:
	.loc 13 21 0
	movl	32(%esp), %ebx
	movl	current_syscall_error, %edx
	movl	%edx, 20(%ebx)
.LBE8112:
.LBE8111:
	.loc 20 189 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL2810:
	.p2align 4,,7
	.p2align 3
.L2385:
	.cfi_restore_state
.LBB8113:
.LBB8114:
	.loc 13 21 0
	movl	current_syscall_error+4, %eax
	movl	32(%esp), %ebx
	movl	%eax, 20(%ebx)
.LBE8114:
.LBE8113:
	.loc 20 189 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 20 157 0
	movl	$1, %eax
	.loc 20 189 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL2811:
	.p2align 4,,7
	.p2align 3
.L2382:
	.cfi_restore_state
	.loc 20 187 0
	movl	$__func__.5803, 12(%esp)
	movl	$187, 8(%esp)
	movl	$.LC86, 4(%esp)
	movl	$.LC133, (%esp)
	call	_fail
.LVL2812:
	.p2align 4,,7
	.p2align 3
.L2392:
.LBB8115:
.LBB8108:
.LBB8083:
.LBB8084:
	.loc 27 2479 0
	movl	36(%esp), %esi
.LVL2813:
	movl	%ecx, %eax
.LBE8084:
.LBE8083:
.LBB8087:
.LBB8088:
	.loc 27 2487 0
	andl	$252, %ecx
.LVL2814:
.LBE8088:
.LBE8087:
.LBB8091:
.LBB8085:
	.loc 27 2479 0
	andl	$16128, %eax
.LVL2815:
	shrl	$8, %eax
.LBE8085:
.LBE8091:
.LBB8092:
.LBB8089:
	.loc 27 2487 0
	shrl	$2, %ecx
.LBE8089:
.LBE8092:
.LBB8093:
.LBB8086:
	.loc 27 2479 0
	movl	%eax, 12(%esi)
.LVL2816:
.LBE8086:
.LBE8093:
	.loc 20 61 0
	movl	$5, %eax
	.loc 20 57 0
	movl	%ebx, 16(%esi)
.LBB8094:
.LBB8090:
	.loc 27 2487 0
	movl	%ecx, 20(%esi)
	jmp	.L2386
.LVL2817:
	.p2align 4,,7
	.p2align 3
.L2391:
.LBE8090:
.LBE8094:
.LBB8095:
.LBB8096:
	.loc 27 2439 0
	movl	36(%esp), %esi
.LVL2818:
	movl	%ecx, %eax
.LBE8096:
.LBE8095:
.LBB8099:
.LBB8100:
	.loc 27 2431 0
	andl	$16128, %ecx
.LVL2819:
.LBE8100:
.LBE8099:
.LBB8103:
.LBB8097:
	.loc 27 2439 0
	andl	$252, %eax
.LVL2820:
	shrl	$2, %eax
.LBE8097:
.LBE8103:
.LBB8104:
.LBB8101:
	.loc 27 2431 0
	shrl	$8, %ecx
.LBE8101:
.LBE8104:
.LBB8105:
.LBB8098:
	.loc 27 2439 0
	movl	%eax, 12(%esi)
.LVL2821:
.LBE8098:
.LBE8105:
	.loc 20 52 0
	movl	$4, %eax
.LBB8106:
.LBB8102:
	.loc 27 2431 0
	movl	%ecx, 16(%esi)
	jmp	.L2386
.LBE8102:
.LBE8106:
.LBE8108:
.LBE8115:
	.cfi_endproc
.LFE425:
	.size	setMRs_syscall_error, .-setMRs_syscall_error
	.p2align 4,,15
	.globl	receiveAsyncIPC
	.type	receiveAsyncIPC, @function
receiveAsyncIPC:
.LFB501:
	.loc 43 91 0
	.cfi_startproc
.LVL2822:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 43 91 0
	movl	36(%esp), %ebx
.LVL2823:
	movl	32(%esp), %esi
.LBB8153:
.LBB8154:
	.loc 27 1187 0
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$6, %eax
	jne	.L2409
	.loc 27 1190 0
	andl	$-16, %ebx
.LVL2824:
.LBE8154:
.LBE8153:
.LBB8156:
.LBB8157:
	.loc 27 216 0
	movl	(%ebx), %eax
	andl	$3, %eax
.LBE8157:
.LBE8156:
	.loc 43 96 0
	cmpl	$1, %eax
	jbe	.L2402
	cmpl	$2, %eax
	jne	.L2399
	.loc 43 92 0
	movl	12(%ebx), %edx
.LVL2825:
	movl	8(%ebx), %eax
.LVL2826:
.LBB8158:
.LBB8159:
.LBB8160:
.LBB8161:
	.loc 13 21 0
	movl	$1, 16(%esi)
.LBE8161:
.LBE8160:
.LBB8162:
.LBB8163:
	movl	%edx, 20(%esi)
.LVL2827:
.LBE8163:
.LBE8162:
.LBB8164:
.LBB8165:
	movl	%eax, 4(%esi)
.LVL2828:
.LBE8165:
.LBE8164:
.LBE8159:
.LBE8158:
.LBB8166:
.LBB8167:
	.loc 27 223 0
	andl	$-4, (%ebx)
.LVL2829:
.L2399:
.LBE8167:
.LBE8166:
	.loc 43 123 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL2830:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2831:
	.p2align 4,,7
	.p2align 3
.L2402:
	.cfi_restore_state
.LBB8168:
.LBB8169:
.LBB8170:
	.loc 27 609 0
	movl	%ebx, %eax
	orl	$6, %eax
	movl	%eax, 592(%esi)
.LBE8170:
.LBE8169:
	.loc 43 106 0
	movl	%esi, (%esp)
	call	scheduleTCB
.LVL2832:
.LBE8168:
	.loc 43 22 0
	movl	4(%ebx), %eax
.LVL2833:
	movl	(%ebx), %edx
.LVL2834:
.LBB8207:
.LBB8171:
.LBB8172:
	.loc 30 130 0
	movl	%eax, %ecx
.LBE8172:
.LBE8171:
.LBB8176:
.LBB8177:
.LBB8178:
.LBB8179:
	.loc 27 203 0
	movl	%edx, %edi
	andl	$-16, %edi
.LVL2835:
.LBE8179:
.LBE8178:
.LBE8177:
.LBE8176:
.LBB8180:
.LBB8173:
	.loc 30 130 0
	andl	$-16, %ecx
.LVL2836:
	je	.L2407
	.loc 30 133 0
	movl	%esi, 648(%edi)
.LVL2837:
.L2404:
	.loc 30 135 0
	movl	%edi, 652(%esi)
.LBE8173:
.LBE8180:
.LBB8181:
.LBB8182:
	.loc 27 223 0
	movl	%edx, %edi
.LVL2838:
	andl	$-4, %edi
	.loc 27 224 0
	orl	$1, %edi
.LBE8182:
.LBE8181:
.LBB8184:
.LBB8185:
.LBB8186:
.LBB8187:
	.loc 27 196 0
	testb	$15, %cl
.LBE8187:
.LBE8186:
.LBE8185:
.LBE8184:
.LBB8202:
.LBB8174:
	.loc 30 136 0
	movl	$0, 648(%esi)
.LVL2839:
.LBE8174:
.LBE8202:
.LBB8203:
.LBB8183:
	.loc 27 224 0
	movl	%edi, (%ebx)
.LVL2840:
.LBE8183:
.LBE8203:
.LBB8204:
.LBB8200:
.LBB8191:
.LBB8188:
	.loc 27 196 0
	jne	.L2410
.LVL2841:
	.loc 27 198 0
	andl	$-16, %ecx
.LVL2842:
	.loc 27 197 0
	andl	$15, %eax
.LVL2843:
	.loc 27 198 0
	orl	%eax, %ecx
.LBE8188:
.LBE8191:
.LBB8192:
.LBB8193:
	.loc 27 209 0
	testl	$15, %esi
.LBE8193:
.LBE8192:
.LBB8196:
.LBB8189:
	.loc 27 198 0
	movl	%ecx, 4(%ebx)
.LVL2844:
.LBE8189:
.LBE8196:
.LBB8197:
.LBB8194:
	.loc 27 209 0
	jne	.L2411
	.loc 27 211 0
	andl	$-16, %esi
.LVL2845:
	.loc 27 210 0
	andl	$12, %edx
	orl	%edx, %esi
	.loc 27 211 0
	orl	$1, %esi
	movl	%esi, (%ebx)
.LBE8194:
.LBE8197:
.LBE8200:
.LBE8204:
.LBE8207:
	.loc 43 123 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL2846:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2847:
	.p2align 4,,7
	.p2align 3
.L2407:
	.cfi_restore_state
.LBB8208:
.LBB8205:
.LBB8175:
	.loc 30 130 0
	movl	%esi, %ecx
.LVL2848:
	jmp	.L2404
.LVL2849:
.L2409:
.LBE8175:
.LBE8205:
.LBE8208:
.LBB8209:
.LBB8155:
	call	cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87
.LVL2850:
.L2410:
.LBE8155:
.LBE8209:
.LBB8210:
.LBB8206:
.LBB8201:
.LBB8198:
.LBB8190:
	.p2align 4,,6
	call	async_endpoint_ptr_set_aepQueue_head.isra.168.part.169
.LVL2851:
.L2411:
.LBE8190:
.LBE8198:
.LBB8199:
.LBB8195:
	.p2align 4,,5
	call	async_endpoint_ptr_set_aepQueue_tail.isra.170.part.171
.LVL2852:
.LBE8195:
.LBE8199:
.LBE8201:
.LBE8206:
.LBE8210:
	.cfi_endproc
.LFE501:
	.size	receiveAsyncIPC, .-receiveAsyncIPC
	.section	.rodata.str1.1
.LC134:
	.string	"dest"
	.text
	.p2align 4,,15
	.globl	sendAsyncIPC
	.type	sendAsyncIPC, @function
sendAsyncIPC:
.LFB500:
	.loc 43 41 0
	.cfi_startproc
.LVL2853:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 43 41 0
	movl	64(%esp), %edx
	movl	68(%esp), %esi
	movl	72(%esp), %edi
	.loc 43 40 0
	movl	(%edx), %eax
.LVL2854:
.LBB8291:
.LBB8292:
	.loc 27 216 0
	movl	%eax, %ecx
	andl	$3, %ecx
.LBE8292:
.LBE8291:
	.loc 43 42 0
	cmpl	$1, %ecx
	je	.L2414
	jb	.L2415
	cmpl	$2, %ecx
	jne	.L2412
.LVL2855:
.LBB8293:
	.loc 43 77 0
	orl	12(%edx), %edi
.LVL2856:
	.loc 43 80 0
	orl	%esi, 8(%edx)
.LVL2857:
.LBB8294:
.LBB8295:
	.loc 27 172 0
	movl	%edi, 12(%edx)
.LVL2858:
.L2412:
.LBE8295:
.LBE8294:
.LBE8293:
	.loc 43 87 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2414:
	.cfi_restore_state
.LVL2859:
	.loc 43 22 0
	movl	4(%edx), %ebx
.LBB8296:
.LBB8297:
.LBB8298:
.LBB8299:
.LBB8300:
	.loc 27 203 0
	movl	%eax, %ecx
	andl	$-16, %ecx
	movl	%ecx, 24(%esp)
.LBE8300:
.LBE8299:
.LBE8298:
.LBE8297:
.LBE8296:
	.loc 43 22 0
	movl	%ebx, 28(%esp)
.LVL2860:
.LBB8345:
	.loc 43 57 0
	andl	$-16, %ebx
.LVL2861:
	je	.L2426
.LVL2862:
.LBB8301:
.LBB8302:
	.loc 30 146 0
	movl	652(%ebx), %ecx
.LVL2863:
	.loc 30 147 0
	movl	648(%ebx), %ebp
	.loc 30 146 0
	testl	%ecx, %ecx
	je	.L2418
	.loc 30 147 0
	movl	%ebp, 648(%ecx)
	movl	648(%ebx), %ebp
	movl	%ebx, 20(%esp)
.LVL2864:
.L2419:
	.loc 30 152 0
	testl	%ebp, %ebp
	je	.L2424
	.loc 30 153 0
	movl	%ecx, 652(%ebp)
.LVL2865:
.L2420:
.LBE8302:
.LBE8301:
.LBB8304:
.LBB8305:
.LBB8306:
.LBB8307:
	.loc 27 196 0
	testb	$15, 20(%esp)
	jne	.L2427
	.loc 27 198 0
	movl	20(%esp), %ecx
	.loc 27 197 0
	movl	28(%esp), %ebp
	.loc 27 198 0
	andl	$-16, %ecx
	.loc 27 197 0
	andl	$15, %ebp
	.loc 27 198 0
	orl	%ebp, %ecx
.LBE8307:
.LBE8306:
.LBB8310:
.LBB8311:
	.loc 27 209 0
	testb	$15, 24(%esp)
.LBE8311:
.LBE8310:
.LBB8315:
.LBB8308:
	.loc 27 198 0
	movl	%ecx, 4(%edx)
.LVL2866:
.LBE8308:
.LBE8315:
.LBB8316:
.LBB8312:
	.loc 27 209 0
	jne	.L2428
	.loc 27 211 0
	movl	24(%esp), %ecx
	.loc 27 210 0
	andl	$15, %eax
.LVL2867:
	.loc 27 211 0
	andl	$-16, %ecx
	orl	%eax, %ecx
.LBE8312:
.LBE8316:
.LBE8305:
.LBE8304:
	.loc 43 63 0
	movl	20(%esp), %eax
.LBB8323:
.LBB8320:
.LBB8317:
.LBB8313:
	.loc 27 211 0
	movl	%ecx, (%edx)
.LVL2868:
.LBE8313:
.LBE8317:
.LBE8320:
.LBE8323:
	.loc 43 63 0
	testl	%eax, %eax
	je	.L2429
.L2423:
.LVL2869:
.LBB8324:
.LBB8325:
.LBB8326:
.LBB8327:
	.loc 27 626 0
	movl	592(%ebx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$1, %eax
	movl	%eax, 592(%ebx)
.LBE8327:
.LBE8326:
	.loc 22 428 0
	movl	%ebx, (%esp)
	call	scheduleTCB
.LVL2870:
.LBE8325:
.LBE8324:
.LBB8328:
.LBB8329:
	.loc 22 421 0
	movl	%ebx, %eax
	xorl	%edx, %edx
.LBE8329:
.LBE8328:
.LBB8331:
.LBB8332:
.LBB8333:
.LBB8334:
	.loc 13 21 0
	movl	%edi, 20(%ebx)
.LVL2871:
.LBE8334:
.LBE8333:
.LBB8335:
.LBB8336:
	movl	%esi, 4(%ebx)
.LVL2872:
.LBE8336:
.LBE8335:
.LBB8337:
.LBB8338:
	movl	$1, 16(%ebx)
.LVL2873:
.LBE8338:
.LBE8337:
.LBE8332:
.LBE8331:
.LBE8345:
	.loc 43 87 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL2874:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL2875:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL2876:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LBB8346:
.LBB8339:
.LBB8330:
	.loc 22 421 0
	jmp	possibleSwitchTo
.LVL2877:
	.p2align 4,,7
	.p2align 3
.L2415:
	.cfi_restore_state
.LBE8330:
.LBE8339:
.LBE8346:
.LBB8347:
.LBB8348:
	.loc 27 223 0
	andl	$-4, %eax
	.loc 27 224 0
	orl	$2, %eax
	movl	%eax, (%edx)
.LVL2878:
.LBE8348:
.LBE8347:
.LBB8349:
.LBB8350:
	.loc 27 185 0
	movl	%esi, 8(%edx)
.LVL2879:
.LBE8350:
.LBE8349:
.LBB8351:
.LBB8352:
	.loc 27 172 0
	movl	%edi, 12(%edx)
.LBE8352:
.LBE8351:
	.loc 43 87 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL2880:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL2881:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2882:
	.p2align 4,,7
	.p2align 3
.L2418:
	.cfi_restore_state
.LBB8353:
.LBB8340:
.LBB8303:
	.loc 30 149 0
	movl	%ebp, 20(%esp)
.LVL2883:
	jmp	.L2419
	.p2align 4,,7
	.p2align 3
.L2424:
	.loc 30 146 0
	movl	%ecx, 24(%esp)
.LVL2884:
	jmp	.L2420
.LVL2885:
	.p2align 4,,7
	.p2align 3
.L2429:
.LBE8303:
.LBE8340:
.LBB8341:
.LBB8342:
	.loc 27 223 0
	andl	$-4, %ecx
	movl	%ecx, (%edx)
	jmp	.L2423
.LVL2886:
.L2427:
.LBE8342:
.LBE8341:
.LBB8343:
.LBB8321:
.LBB8318:
.LBB8309:
	call	async_endpoint_ptr_set_aepQueue_head.isra.168.part.169
.LVL2887:
.L2426:
.LBE8309:
.LBE8318:
.LBE8321:
.LBE8343:
	.loc 43 57 0 discriminator 1
	movl	$__FUNCTION__.6352, 12(%esp)
	movl	$57, 8(%esp)
	movl	$.LC112, 4(%esp)
	movl	$.LC134, (%esp)
	call	_assert_fail
.LVL2888:
.L2428:
.LBB8344:
.LBB8322:
.LBB8319:
.LBB8314:
	call	async_endpoint_ptr_set_aepQueue_tail.isra.170.part.171
.LVL2889:
.LBE8314:
.LBE8319:
.LBE8322:
.LBE8344:
.LBE8353:
	.cfi_endproc
.LFE500:
	.size	sendAsyncIPC, .-sendAsyncIPC
	.section	.rodata.str1.4
	.align 4
.LC135:
	.string	"(capFBasePtr & ~0xfffff000) == 0"
	.section	.boot.text
	.p2align 4,,15
	.globl	create_unmapped_it_frame_cap
	.type	create_unmapped_it_frame_cap, @function
create_unmapped_it_frame_cap:
.LFB308:
	.file 46 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/kernel/boot.c"
	.loc 46 98 0
	.cfi_startproc
.LVL2890:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB8358:
.LBB8359:
	.loc 46 76 0
	xorl	%ecx, %ecx
.LBE8359:
.LBE8358:
	.loc 46 98 0
	movl	36(%esp), %edx
.LVL2891:
.LBB8367:
.LBB8364:
	.loc 46 76 0
	cmpl	$0, 40(%esp)
.LBE8364:
.LBE8367:
	.loc 46 98 0
	movl	32(%esp), %eax
.LBB8368:
.LBB8365:
	.loc 46 76 0
	setne	%cl
.LBB8360:
.LBB8361:
	.loc 27 1375 0
	sall	$31, %ecx
.LVL2892:
	.loc 27 1393 0
	testl	$4095, %edx
	jne	.L2433
.LVL2893:
	.loc 27 1395 0
	andl	$-4096, %edx
.LVL2894:
	shrl	$8, %edx
	.loc 27 1399 0
	orl	$50331649, %edx
.LVL2895:
	movl	%edx, (%eax)
	.loc 27 1401 0
	movl	%ecx, 4(%eax)
.LBE8361:
.LBE8360:
.LBE8365:
.LBE8368:
	.loc 46 100 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2896:
.L2433:
	.cfi_restore_state
.LBB8369:
.LBB8366:
.LBB8363:
.LBB8362:
	.loc 27 1393 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1393, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC135, (%esp)
	call	_assert_fail
.LVL2897:
.LBE8362:
.LBE8363:
.LBE8366:
.LBE8369:
	.cfi_endproc
.LFE308:
	.size	create_unmapped_it_frame_cap, .-create_unmapped_it_frame_cap
	.section	.rodata.str1.4
	.align 4
.LC136:
	.string	"IS_ALIGNED(vptr, PT_BITS + PAGE_BITS)"
	.text
	.p2align 4,,15
	.globl	unmapPageTable
	.type	unmapPageTable, @function
unmapPageTable:
.LFB371:
	.loc 4 1289 0
	.cfi_startproc
.LVL2898:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 4 1289 0
	movl	64(%esp), %edx
.LVL2899:
	movl	68(%esp), %ebx
	movl	72(%esp), %edi
.LBB8390:
.LBB8391:
	.loc 4 1213 0
	movl	%edx, %eax
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
.LVL2900:
	.loc 4 1214 0
	testl	%eax, %eax
	je	.L2437
	.loc 4 1222 0
	andl	$1023, %edx
.LVL2901:
	movl	(%eax,%edx,4), %esi
.LVL2902:
	.loc 4 1223 0
	testl	%esi, %esi
	je	.L2437
.LVL2903:
.LBE8391:
.LBE8390:
.LBB8393:
.LBB8394:
	.loc 4 1191 0
	testl	$4194303, %ebx
	jne	.L2460
	.loc 4 1194 0
	movl	ksCurThread, %eax
.LVL2904:
	andl	$-1024, %eax
	movl	20(%eax), %ecx
	movl	16(%eax), %eax
	movl	%ecx, 28(%esp)
.LVL2905:
.LBB8395:
.LBB8396:
	.loc 27 872 0
	movl	%eax, %ebp
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %ecx
.LVL2906:
	cmpl	$14, %ebp
	cmovne	%edx, %ecx
.LBE8396:
.LBE8395:
	.loc 4 1195 0
	cmpl	$5, %ecx
	je	.L2441
.LVL2907:
.L2443:
.LBE8394:
.LBE8393:
	.loc 4 1299 0
	shrl	$22, %ebx
.LVL2908:
	.loc 4 1304 0
	movl	$0, (%esi,%ebx,4)
	.loc 4 1315 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL2909:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL2910:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 4 1314 0
	jmp	invalidatePageStructureCache
.LVL2911:
	.p2align 4,,7
	.p2align 3
.L2441:
	.cfi_restore_state
.LBB8405:
.LBB8403:
.LBB8397:
.LBB8398:
	.loc 27 1654 0
	cmpl	$5, %edx
	jne	.L2461
.LBE8398:
.LBE8397:
	.loc 4 1195 0
	testl	$65536, 28(%esp)
	je	.L2443
.LVL2912:
.LBB8400:
.LBB8401:
	.loc 27 1711 0
	andl	$16777200, %eax
.LVL2913:
	sall	$8, %eax
.LBE8401:
.LBE8400:
	.loc 4 1196 0
	cmpl	%eax, %esi
	jne	.L2443
	xorl	%ebp, %ebp
	jmp	.L2445
.LVL2914:
	.p2align 4,,7
	.p2align 3
.L2444:
	.loc 4 1199 0
	addl	$1, %ebp
.LVL2915:
	cmpl	$1024, %ebp
	je	.L2443
.LVL2916:
.L2445:
	.loc 4 1200 0
	testb	$1, (%edi,%ebp,4)
	je	.L2444
	.loc 4 1201 0
	movl	%ebp, %eax
	sall	$12, %eax
	addl	%ebx, %eax
	movl	%eax, (%esp)
.LVL2917:
	call	invalidateTLBentry
.LVL2918:
	jmp	.L2444
.LVL2919:
	.p2align 4,,7
	.p2align 3
.L2437:
.LBE8403:
.LBE8405:
.LBB8406:
.LBB8392:
	.loc 4 1215 0
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL2920:
.LBE8392:
.LBE8406:
	.loc 4 1315 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL2921:
.L2460:
	.cfi_restore_state
.LBB8407:
.LBB8404:
	.loc 4 1191 0
	movl	$__FUNCTION__.5192, 12(%esp)
	movl	$1191, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC136, (%esp)
	call	_assert_fail
.LVL2922:
.L2461:
.LBB8402:
.LBB8399:
	call	cap_page_directory_cap_get_capPDIsMapped.part.69
.LVL2923:
.LBE8399:
.LBE8402:
.LBE8404:
.LBE8407:
	.cfi_endproc
.LFE371:
	.size	unmapPageTable, .-unmapPageTable
	.section	.rodata.str1.4
	.align 4
.LC137:
	.string	"(capFMappedAddress & ~0xfffff000) == 0"
	.section	.boot.text
	.p2align 4,,15
	.globl	create_mapped_it_frame_cap
	.type	create_mapped_it_frame_cap, @function
create_mapped_it_frame_cap:
.LFB309:
	.loc 46 104 0
	.cfi_startproc
.LVL2924:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
.LBB8412:
.LBB8413:
	.loc 46 76 0
	xorl	%eax, %eax
.LBE8413:
.LBE8412:
	.loc 46 104 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 46 104 0
	movl	52(%esp), %edx
	movl	48(%esp), %ebx
	movl	32(%esp), %esi
	movl	44(%esp), %ecx
.LVL2925:
.LBB8427:
.LBB8424:
	.loc 46 90 0
	movl	%edx, %edi
.LBB8414:
.LBB8415:
	.loc 27 1379 0
	andl	$1023, %edx
.LVL2926:
.LBE8415:
.LBE8414:
	.loc 46 90 0
	shrl	$10, %edi
.LVL2927:
.LBB8420:
.LBB8416:
	.loc 27 1379 0
	sall	$20, %edx
.LBE8416:
.LBE8420:
	.loc 46 83 0
	andl	$63, %edi
.LVL2928:
	.loc 46 76 0
	cmpl	$0, 56(%esp)
	setne	%al
.LBB8421:
.LBB8417:
	.loc 27 1375 0
	sall	$31, %eax
	.loc 27 1379 0
	orl	%eax, %edx
.LVL2929:
	.loc 27 1381 0
	testl	$4095, %ebx
	jne	.L2466
	.loc 27 1383 0
	shrl	$12, %ebx
.LVL2930:
	orl	%edx, %ebx
.LVL2931:
	.loc 27 1387 0
	sall	$26, %edi
.LVL2932:
	.loc 27 1393 0
	testl	$4095, %ecx
	jne	.L2467
.LVL2933:
	.loc 27 1395 0
	movl	%ecx, %eax
	orl	$50331649, %edi
.LVL2934:
.LBE8417:
.LBE8421:
.LBE8424:
.LBE8427:
	.loc 46 106 0
	movl	40(%esp), %edx
.LBB8428:
.LBB8425:
.LBB8422:
.LBB8418:
	.loc 27 1395 0
	andl	$-4096, %eax
	shrl	$8, %eax
	.loc 27 1399 0
	orl	%eax, %edi
.LVL2935:
.LBE8418:
.LBE8422:
.LBE8425:
.LBE8428:
	.loc 46 106 0
	movl	36(%esp), %eax
	movl	%edi, 8(%esp)
	movl	%ebx, 12(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	map_it_frame_cap
.LVL2936:
	.loc 46 108 0
	movl	%esi, %eax
	.loc 46 107 0
	movl	%edi, (%esi)
	movl	%ebx, 4(%esi)
	.loc 46 108 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL2937:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL2938:
	ret	$4
.LVL2939:
.L2466:
	.cfi_restore_state
.LBB8429:
.LBB8426:
.LBB8423:
.LBB8419:
	.loc 27 1381 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1381, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC137, (%esp)
	call	_assert_fail
.LVL2940:
.L2467:
	.loc 27 1393 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1393, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC135, (%esp)
	call	_assert_fail
.LVL2941:
.LBE8419:
.LBE8423:
.LBE8426:
.LBE8429:
	.cfi_endproc
.LFE309:
	.size	create_mapped_it_frame_cap, .-create_mapped_it_frame_cap
	.text
	.p2align 4,,15
	.globl	Arch_finaliseCap
	.type	Arch_finaliseCap, @function
Arch_finaliseCap:
.LFB413:
	.loc 19 158 0
	.cfi_startproc
.LVL2942:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$32, %esp
	.cfi_def_cfa_offset 48
	.loc 19 158 0
	movl	52(%esp), %edx
	movl	48(%esp), %eax
.LVL2943:
	movl	56(%esp), %ebx
.LVL2944:
.LBB8474:
.LBB8475:
	.loc 27 872 0
	movl	%edx, %edi
	.loc 27 873 0
	movl	%edx, %ecx
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%dl, %esi
.LVL2945:
	cmpl	$14, %edi
	cmove	%esi, %ecx
.LVL2946:
.LBE8475:
.LBE8474:
	.loc 19 159 0
	cmpl	$11, %ecx
	ja	.L2471
	jmp	*.L2473(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2473:
	.long	.L2471
	.long	.L2472
	.long	.L2471
	.long	.L2474
	.long	.L2471
	.long	.L2475
	.long	.L2471
	.long	.L2476
	.long	.L2471
	.long	.L2477
	.long	.L2471
	.long	.L2476
	.text
	.p2align 4,,7
	.p2align 3
.L2474:
	.loc 19 170 0
	movl	60(%esp), %esi
.LVL2947:
	testl	%esi, %esi
	je	.L2476
.LVL2948:
.LBB8476:
.LBB8477:
	.loc 27 1546 0 discriminator 1
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$3, %ecx
	jne	.L2505
.LBE8477:
.LBE8476:
	.loc 19 170 0
	testl	$67108864, %ebx
	je	.L2476
.LBB8479:
.LBB8480:
	.loc 27 1622 0
	andl	$16777200, %edx
.LVL2949:
	sall	$8, %edx
.LBE8480:
.LBE8479:
	.loc 19 171 0
	movl	%edx, 8(%esp)
.LBB8481:
.LBB8482:
	.loc 27 1602 0
	movl	%ebx, %edx
.LBE8482:
.LBE8481:
.LBB8484:
.LBB8485:
	.loc 27 1582 0
	andl	$67107840, %ebx
.LVL2950:
.LBE8485:
.LBE8484:
.LBB8487:
.LBB8483:
	.loc 27 1602 0
	sall	$22, %edx
.LVL2951:
.LBE8483:
.LBE8487:
.LBB8488:
.LBB8486:
	.loc 27 1582 0
	shrl	$10, %ebx
.LBE8486:
.LBE8488:
	.loc 19 171 0
	movl	%edx, 4(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 28(%esp)
.LVL2952:
	call	unmapPageTable
.LVL2953:
	movl	28(%esp), %eax
.LVL2954:
	.p2align 4,,7
	.p2align 3
.L2476:
.LBB8489:
.LBB8490:
	.loc 27 896 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
.LBE8490:
.LBE8489:
	.loc 19 220 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL2955:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2956:
	.p2align 4,,7
	.p2align 3
.L2477:
	.cfi_restore_state
	.loc 19 197 0
	movl	60(%esp), %ecx
	testl	%ecx, %ecx
	je	.L2476
.LVL2957:
.LBB8491:
.LBB8492:
	.loc 27 1762 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$9, %ecx
	jne	.L2506
	.loc 27 1765 0
	andl	$16777200, %edx
.LVL2958:
.LBE8492:
.LBE8491:
.LBB8495:
.LBB8496:
	.loc 27 1757 0
	movzwl	%bx, %ecx
.LBE8496:
.LBE8495:
.LBB8497:
.LBB8493:
	.loc 27 1765 0
	sall	$8, %edx
.LVL2959:
.LBE8493:
.LBE8497:
.LBB8498:
.LBB8499:
	.loc 4 1268 0
	andl	$1023, %ebx
.LVL2960:
	jne	.L2507
	.loc 4 1270 0
	shrl	$10, %ecx
.LVL2961:
	cmpl	ia32KSASIDTable(,%ecx,4), %edx
	jne	.L2476
	.loc 4 1272 0
	movl	ksCurThread, %edx
.LVL2962:
	movl	%eax, 28(%esp)
	.loc 4 1271 0
	movl	$0, ia32KSASIDTable(,%ecx,4)
	.loc 4 1272 0
	movl	%edx, (%esp)
	call	setVMRoot
.LVL2963:
	movl	28(%esp), %eax
	jmp	.L2476
.LVL2964:
	.p2align 4,,7
	.p2align 3
.L2472:
.LBE8499:
.LBE8498:
.LBB8501:
.LBB8502:
.LBB8503:
.LBB8504:
	.loc 27 1467 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	jne	.L2508
.LVL2965:
.LBE8504:
.LBE8503:
.LBB8508:
.LBB8509:
	.loc 27 1417 0
	movl	%ebx, %esi
.LBE8509:
.LBE8508:
.LBB8512:
.LBB8505:
	.loc 27 1470 0
	movl	%edx, %ecx
.LBE8505:
.LBE8512:
.LBB8513:
.LBB8510:
	.loc 27 1417 0
	andl	$1072693248, %esi
.LBE8510:
.LBE8513:
.LBB8514:
.LBB8506:
	.loc 27 1470 0
	shrl	$26, %ecx
.LBE8506:
.LBE8514:
.LBB8515:
.LBB8511:
	.loc 27 1417 0
	shrl	$20, %esi
.LBE8511:
.LBE8515:
	.loc 40 322 0
	sall	$10, %ecx
.LBE8502:
.LBE8501:
	.loc 19 180 0
	addl	%esi, %ecx
	je	.L2476
.LBB8518:
.LBB8519:
	.loc 27 1510 0
	andl	$16777200, %edx
.LVL2966:
	sall	$8, %edx
.LBE8519:
.LBE8518:
	.loc 19 187 0
	movl	%edx, 12(%esp)
.LBB8520:
.LBB8521:
	.loc 27 1437 0
	movl	%ebx, %edx
	sall	$12, %edx
.LBE8521:
.LBE8520:
.LBB8522:
.LBB8523:
	.loc 27 1409 0
	shrl	$31, %ebx
.LVL2967:
.LBE8523:
.LBE8522:
	.loc 19 187 0
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 28(%esp)
.LVL2968:
	call	unmapPage
.LVL2969:
	movl	28(%esp), %eax
	jmp	.L2476
.LVL2970:
	.p2align 4,,7
	.p2align 3
.L2475:
	.loc 19 161 0
	movl	60(%esp), %edi
	testl	%edi, %edi
	je	.L2476
.LVL2971:
.LBB8524:
.LBB8525:
	.loc 27 1654 0 discriminator 1
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	jne	.L2509
.LBE8525:
.LBE8524:
	.loc 19 161 0
	testl	$65536, %ebx
	je	.L2476
.LVL2972:
.LBB8527:
.LBB8528:
	.loc 27 1690 0
	movzwl	%bx, %ecx
.LBE8528:
.LBE8527:
.LBB8529:
.LBB8530:
	.loc 27 1711 0
	andl	$16777200, %edx
.LVL2973:
.LBE8530:
.LBE8529:
.LBB8532:
.LBB8533:
	.loc 4 1280 0
	shrl	$10, %ecx
	movl	ia32KSASIDTable(,%ecx,4), %ecx
.LBE8533:
.LBE8532:
.LBB8535:
.LBB8531:
	.loc 27 1711 0
	sall	$8, %edx
.LVL2974:
.LBE8531:
.LBE8535:
.LBB8536:
.LBB8534:
	.loc 4 1282 0
	testl	%ecx, %ecx
	je	.L2476
	andl	$1023, %ebx
.LVL2975:
	leal	(%ecx,%ebx,4), %ecx
.LVL2976:
	cmpl	(%ecx), %edx
	jne	.L2476
	.loc 4 1284 0
	movl	ksCurThread, %edx
.LVL2977:
	.loc 4 1283 0
	movl	$0, (%ecx)
	movl	%eax, 28(%esp)
	.loc 4 1284 0
	movl	%edx, (%esp)
	call	setVMRoot
.LVL2978:
	movl	28(%esp), %eax
	jmp	.L2476
.LVL2979:
	.p2align 4,,7
	.p2align 3
.L2471:
.LBE8534:
.LBE8536:
	.loc 19 216 0
	movl	$__func__.5662, 12(%esp)
	movl	$216, 8(%esp)
	movl	$.LC31, 4(%esp)
	movl	$.LC56, (%esp)
	call	_fail
.LVL2980:
.L2508:
.LBB8537:
.LBB8517:
.LBB8516:
.LBB8507:
	.loc 27 1467 0
	movl	$__FUNCTION__.1755, 12(%esp)
	movl	$1468, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC51, (%esp)
	call	_assert_fail
.LVL2981:
.L2509:
.LBE8507:
.LBE8516:
.LBE8517:
.LBE8537:
.LBB8538:
.LBB8526:
	call	cap_page_directory_cap_get_capPDIsMapped.part.69
.LVL2982:
.L2505:
.LBE8526:
.LBE8538:
.LBB8539:
.LBB8478:
	call	cap_page_table_cap_get_capPTIsMapped.part.110
.LVL2983:
.L2507:
.LBE8478:
.LBE8539:
.LBB8540:
.LBB8500:
	.p2align 4,,5
	call	deleteASIDPool.part.124
.LVL2984:
.L2506:
.LBE8500:
.LBE8540:
.LBB8541:
.LBB8494:
	.p2align 4,,5
	call	cap_asid_pool_cap_get_capASIDPool.isra.99.part.100
.LVL2985:
.LBE8494:
.LBE8541:
	.cfi_endproc
.LFE413:
	.size	Arch_finaliseCap, .-Arch_finaliseCap
	.section	.rodata.str1.1
.LC138:
	.string	"irq <= maxIRQ"
	.text
	.p2align 4,,15
	.globl	deletedIRQHandler
	.type	deletedIRQHandler, @function
deletedIRQHandler:
.LFB552:
	.loc 29 198 0
	.cfi_startproc
.LVL2986:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
.LVL2987:
	.loc 29 198 0
	movl	32(%esp), %ecx
.LBB8548:
.LBB8549:
.LBB8550:
.LBB8551:
	.loc 25 47 0
	testl	%ecx, %ecx
.LBE8551:
.LBE8550:
	.loc 29 263 0
	movl	$0, intStateIRQTable(,%ecx,4)
.LVL2988:
.LBB8559:
.LBB8556:
	.loc 25 47 0
	js	.L2517
	.loc 25 48 0
	cmpl	$31, %ecx
	jg	.L2518
	.loc 25 50 0
	cmpl	$15, %ecx
	jle	.L2519
.LBE8556:
.LBE8559:
.LBE8549:
.LBE8548:
	.loc 29 200 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2519:
	.cfi_restore_state
.LVL2989:
.LBB8564:
.LBB8562:
.LBB8560:
.LBB8557:
.LBB8552:
.LBB8553:
	.loc 24 54 0
	cmpl	$7, %ecx
	jle	.L2520
	.loc 24 58 0
	subl	$8, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %ebx
	movl	%eax, %esi
.LVL2990:
.L2515:
	.loc 24 64 0
	movl	%ebx, (%esp)
	call	in8
.LVL2991:
	movl	%ebx, (%esp)
	orl	%esi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
.LVL2992:
.LBE8553:
.LBE8552:
.LBE8557:
.LBE8560:
.LBE8562:
.LBE8564:
	.loc 29 200 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL2993:
	ret
.LVL2994:
	.p2align 4,,7
	.p2align 3
.L2520:
	.cfi_restore_state
.LBB8565:
.LBB8563:
.LBB8561:
.LBB8558:
.LBB8555:
.LBB8554:
	.loc 24 55 0
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
.LVL2995:
	jmp	.L2515
.LVL2996:
.L2517:
.LBE8554:
.LBE8555:
	call	maskInterrupt.part.208
.LVL2997:
.L2518:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL2998:
.LBE8558:
.LBE8561:
.LBE8563:
.LBE8565:
	.cfi_endproc
.LFE552:
	.size	deletedIRQHandler, .-deletedIRQHandler
	.p2align 4,,15
	.globl	invokeIRQHandler_AckIRQ
	.type	invokeIRQHandler_AckIRQ, @function
invokeIRQHandler_AckIRQ:
.LFB547:
	.loc 29 159 0
	.cfi_startproc
.LVL2999:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
.LVL3000:
	.loc 29 159 0
	movl	32(%esp), %ecx
.LBB8570:
.LBB8571:
	.loc 25 47 0
	testl	%ecx, %ecx
	js	.L2528
	.loc 25 48 0
	cmpl	$31, %ecx
	jg	.L2529
	.loc 25 50 0
	cmpl	$15, %ecx
	jle	.L2530
.LBE8571:
.LBE8570:
	.loc 29 161 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2530:
	.cfi_restore_state
.LVL3001:
.LBB8578:
.LBB8576:
.LBB8572:
.LBB8573:
	.loc 24 54 0
	cmpl	$7, %ecx
	jle	.L2531
	.loc 24 58 0
	subl	$8, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %ebx
	movl	%eax, %esi
.LVL3002:
.L2526:
	.loc 24 67 0
	movl	%ebx, (%esp)
	call	in8
.LVL3003:
	movl	%esi, %ecx
	notl	%ecx
	movl	%ebx, (%esp)
	andl	%eax, %ecx
	movzbl	%cl, %ecx
	movl	%ecx, 4(%esp)
	call	out8
.LVL3004:
.LBE8573:
.LBE8572:
.LBE8576:
.LBE8578:
	.loc 29 161 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL3005:
	ret
.LVL3006:
	.p2align 4,,7
	.p2align 3
.L2531:
	.cfi_restore_state
.LBB8579:
.LBB8577:
.LBB8575:
.LBB8574:
	.loc 24 55 0
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
.LVL3007:
	jmp	.L2526
.LVL3008:
.L2528:
.LBE8574:
.LBE8575:
	call	maskInterrupt.part.208
.LVL3009:
.L2529:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL3010:
.LBE8577:
.LBE8579:
	.cfi_endproc
.LFE547:
	.size	invokeIRQHandler_AckIRQ, .-invokeIRQHandler_AckIRQ
	.p2align 4,,15
	.type	maskInterrupt.constprop.256, @function
maskInterrupt.constprop.256:
.LFB901:
	.loc 25 45 0
	.cfi_startproc
.LVL3011:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 25 47 0
	testl	%eax, %eax
	js	.L2539
	.loc 25 48 0
	cmpl	$31, %eax
	jg	.L2540
	.loc 25 50 0
	cmpl	$15, %eax
	jle	.L2541
	.loc 25 59 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2541:
	.cfi_restore_state
.LVL3012:
.LBB8582:
.LBB8583:
	.loc 24 54 0
	cmpl	$7, %eax
	jle	.L2542
	.loc 24 58 0
	leal	-8(%eax), %ecx
	movl	$1, %edx
	sall	%cl, %edx
	movl	$161, %ebx
	movl	%edx, %esi
.LVL3013:
.L2537:
	.loc 24 67 0
	movl	%ebx, (%esp)
	call	in8
.LVL3014:
	movl	%esi, %ecx
	notl	%ecx
	movl	%ebx, (%esp)
	andl	%eax, %ecx
	movzbl	%cl, %ecx
	movl	%ecx, 4(%esp)
	call	out8
.LVL3015:
.LBE8583:
.LBE8582:
	.loc 25 59 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL3016:
	ret
.LVL3017:
	.p2align 4,,7
	.p2align 3
.L2542:
	.cfi_restore_state
.LBB8585:
.LBB8584:
	.loc 24 55 0
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
.LVL3018:
	movl	$33, %ebx
	jmp	.L2537
.LVL3019:
.L2539:
.LBE8584:
.LBE8585:
	call	maskInterrupt.part.208
.LVL3020:
.L2540:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL3021:
	.cfi_endproc
.LFE901:
	.size	maskInterrupt.constprop.256, .-maskInterrupt.constprop.256
	.p2align 4,,15
	.globl	updateCapData
	.type	updateCapData, @function
updateCapData:
.LFB563:
	.loc 38 394 0
	.cfi_startproc
.LVL3022:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 38 394 0
	movl	44(%esp), %edx
	movl	32(%esp), %eax
.LVL3023:
	movl	48(%esp), %ebx
.LVL3024:
.LBB8637:
.LBB8638:
.LBB8639:
.LBB8640:
	.loc 27 872 0
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L2544
.LBE8640:
.LBE8639:
.LBE8638:
.LBE8637:
.LBB8641:
.LBB8642:
	.loc 27 873 0
	movl	%edx, %ecx
	andl	$15, %ecx
.LBE8642:
.LBE8641:
	.loc 38 395 0
	testb	$1, %dl
	jne	.L2578
.L2557:
	.loc 38 399 0
	cmpl	$6, %ecx
	je	.L2559
	cmpl	$10, %ecx
	je	.L2560
	cmpl	$4, %ecx
	.p2align 4,,2
	je	.L2579
.L2574:
	.loc 38 435 0
	movl	%edx, (%eax)
	movl	%ebx, 4(%eax)
.LVL3025:
.L2543:
	.loc 38 437 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
.LVL3026:
	.p2align 4,,7
	.p2align 3
.L2578:
	.cfi_restore_state
.LBB8644:
.LBB8645:
.LBB8646:
.LBB8647:
	.loc 27 873 0
	movl	%edx, %ecx
	andl	$15, %ecx
.LVL3027:
.L2549:
.LBE8647:
.LBE8646:
	.loc 19 100 0
	cmpl	$11, %ecx
	jne	.L2574
.LVL3028:
.LBB8649:
.LBB8650:
.LBB8651:
	.loc 27 15 0
	movl	40(%esp), %esi
.LBE8651:
.LBE8650:
.LBB8653:
.LBB8654:
	.loc 27 1793 0
	andl	$15, %edx
.LVL3029:
.LBE8654:
.LBE8653:
.LBB8658:
.LBB8659:
	.loc 27 20 0
	movzwl	40(%esp), %ecx
.LBE8659:
.LBE8658:
.LBB8660:
.LBB8652:
	.loc 27 15 0
	shrl	$16, %esi
.LVL3030:
.LBE8652:
.LBE8660:
.LBB8661:
.LBB8655:
	.loc 27 1793 0
	cmpl	$11, %edx
	jne	.L2580
	.loc 27 1796 0
	movl	%ebx, %edx
.LBE8655:
.LBE8661:
.LBB8662:
.LBB8663:
	.loc 27 1804 0
	movzwl	%bx, %ebx
.LVL3031:
.LBE8663:
.LBE8662:
.LBB8664:
.LBB8656:
	.loc 27 1796 0
	shrl	$16, %edx
.LVL3032:
.LBE8656:
.LBE8664:
	.loc 19 123 0
	cmpw	%bx, %dx
	ja	.L2581
	.loc 19 126 0
	cmpw	%cx, %si
	ja	.L2556
	.loc 19 132 0
	cmpw	%bx, %cx
	ja	.L2556
	cmpw	%dx, %si
	.p2align 4,,2
	jb	.L2556
.LVL3033:
.LBB8665:
.LBB8666:
	.loc 27 1778 0
	sall	$16, %esi
.LVL3034:
	.loc 27 1782 0
	orl	%ecx, %esi
.LVL3035:
	.loc 27 1788 0
	movl	$11, (%eax)
	.loc 27 1782 0
	movl	%esi, 4(%eax)
	jmp	.L2543
.LVL3036:
	.p2align 4,,7
	.p2align 3
.L2544:
.LBE8666:
.LBE8665:
.LBE8649:
.LBE8645:
.LBE8644:
	.loc 38 395 0
	testb	$1, %dl
.LBB8678:
.LBB8643:
	.loc 27 874 0
	movzbl	%dl, %ecx
.LBE8643:
.LBE8678:
	.loc 38 395 0
	je	.L2557
.LVL3037:
.LBB8679:
.LBB8674:
.LBB8670:
.LBB8648:
	.loc 27 874 0
	movzbl	%dl, %ecx
	jmp	.L2549
.LVL3038:
	.p2align 4,,7
	.p2align 3
.L2559:
.LBE8648:
.LBE8670:
.LBE8674:
.LBE8679:
	.loc 38 408 0
	movl	36(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L2556
.LVL3039:
.LBB8680:
.LBB8681:
	.loc 27 1127 0 discriminator 1
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	jne	.L2582
.LVL3040:
.L2563:
	.loc 27 1130 0
	movl	%ebx, %ecx
	shrl	$3, %ecx
.LBE8681:
.LBE8680:
	.loc 38 408 0
	testl	%ecx, %ecx
	jne	.L2556
.LVL3041:
.LBB8683:
.LBB8684:
	.loc 27 1141 0
	movl	40(%esp), %esi
	.loc 27 1142 0
	movl	%edx, (%eax)
	.loc 27 1141 0
	leal	0(,%esi,8), %edx
.LVL3042:
	orl	%ebx, %edx
	movl	%edx, 4(%eax)
	jmp	.L2543
.LVL3043:
	.p2align 4,,7
	.p2align 3
.L2556:
.LBE8684:
.LBE8683:
.LBB8685:
.LBB8675:
.LBB8671:
.LBB8667:
.LBB8668:
	.loc 27 896 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
.LBE8668:
.LBE8667:
.LBE8671:
.LBE8675:
.LBE8685:
	.loc 38 437 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL3044:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
.LVL3045:
	.p2align 4,,7
	.p2align 3
.L2579:
	.cfi_restore_state
	.loc 38 401 0
	movl	36(%esp), %esi
	testl	%esi, %esi
	jne	.L2556
.LVL3046:
.LBB8686:
.LBB8687:
	.loc 27 1008 0 discriminator 1
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$4, %ecx
	je	.L2563
	call	cap_endpoint_cap_get_capEPBadge.part.71
.LVL3047:
	.p2align 4,,7
	.p2align 3
.L2560:
.LBE8687:
.LBE8686:
.LBB8688:
.LBB8689:
.LBB8690:
	.loc 27 521 0
	movl	40(%esp), %ecx
.LBE8690:
.LBE8689:
.LBB8692:
.LBB8693:
	.loc 27 1284 0
	movl	%edx, %esi
	andl	$15, %esi
.LBE8693:
.LBE8692:
.LBB8696:
.LBB8691:
	.loc 27 521 0
	andl	$248, %ecx
	shrl	$3, %ecx
.LVL3048:
.LBE8691:
.LBE8696:
.LBB8697:
.LBB8694:
	.loc 27 1284 0
	cmpl	$10, %esi
	jne	.L2583
	.loc 27 1287 0
	movl	%ebx, %esi
	andl	$260046848, %esi
	shrl	$23, %esi
.LBE8694:
.LBE8697:
	.loc 38 420 0
	addl	%ecx, %esi
	cmpl	$32, %esi
	ja	.L2556
.LVL3049:
.LBB8698:
.LBB8699:
.LBB8700:
	.loc 27 516 0
	movl	40(%esp), %esi
.LBE8700:
.LBE8699:
.LBB8702:
.LBB8703:
	.loc 27 1326 0
	andl	$-8388608, %ebx
.LVL3050:
.LBE8703:
.LBE8702:
	.loc 38 430 0
	movl	%edx, (%eax)
	.loc 38 425 0
	movl	$1, %edx
.LVL3051:
	sall	%cl, %edx
	subl	$1, %edx
.LBB8704:
.LBB8701:
	.loc 27 516 0
	andl	$67108608, %esi
	shrl	$8, %esi
.LBE8701:
.LBE8704:
	.loc 38 425 0
	andl	%esi, %edx
.LBB8705:
.LBB8706:
	.loc 27 1305 0
	orl	%edx, %ebx
	.loc 27 1306 0
	sall	$18, %ecx
.LVL3052:
	orl	%ecx, %ebx
	movl	%ebx, 4(%eax)
	jmp	.L2543
.LVL3053:
.L2580:
.LBE8706:
.LBE8705:
.LBE8698:
.LBE8688:
.LBB8708:
.LBB8676:
.LBB8672:
.LBB8669:
.LBB8657:
	call	cap_io_port_cap_get_capIOPortFirstPort.part.136
.LVL3054:
.L2583:
.LBE8657:
.LBE8669:
.LBE8672:
.LBE8676:
.LBE8708:
.LBB8709:
.LBB8707:
.LBB8695:
	call	cap_cnode_cap_get_capCNodeRadix.part.60
.LVL3055:
.L2581:
.LBE8695:
.LBE8707:
.LBE8709:
.LBB8710:
.LBB8677:
.LBB8673:
	.loc 19 123 0
	movl	$__FUNCTION__.5643, 12(%esp)
	movl	$123, 8(%esp)
	movl	$.LC31, 4(%esp)
	movl	$.LC80, (%esp)
	call	_assert_fail
.LVL3056:
.L2582:
.LBE8673:
.LBE8677:
.LBE8710:
.LBB8711:
.LBB8682:
	call	cap_async_endpoint_cap_get_capAEPBadge.part.176
.LVL3057:
.LBE8682:
.LBE8711:
	.cfi_endproc
.LFE563:
	.size	updateCapData, .-updateCapData
	.section	.rodata.str1.4
	.align 4
.LC139:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/objecttype.c"
	.section	.rodata.str1.1
.LC140:
	.string	"Invalid cap type"
	.text
	.p2align 4,,15
	.globl	maskCapRights
	.type	maskCapRights, @function
maskCapRights:
.LFB564:
	.loc 38 441 0
	.cfi_startproc
.LVL3058:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 38 441 0
	movl	40(%esp), %edx
.LVL3059:
	movl	32(%esp), %eax
	movl	44(%esp), %ecx
.LVL3060:
.LBB8767:
.LBB8768:
.LBB8769:
.LBB8770:
	.loc 27 872 0
	movl	%edx, %ebx
	andl	$14, %ebx
	cmpl	$14, %ebx
	je	.L2585
.LBE8770:
.LBE8769:
.LBE8768:
.LBE8767:
.LBB8771:
.LBB8772:
	.loc 27 873 0
	movl	%edx, %ebx
	andl	$15, %ebx
.LBE8772:
.LBE8771:
	.loc 38 442 0
	testb	$1, %dl
	jne	.L2614
.L2597:
	.loc 38 446 0
	cmpl	$62, %ebx
	ja	.L2598
	jmp	*.L2600(,%ebx,4)
	.section	.rodata
	.align 4
	.align 4
.L2600:
	.long	.L2613
	.long	.L2598
	.long	.L2613
	.long	.L2598
	.long	.L2601
	.long	.L2598
	.long	.L2602
	.long	.L2598
	.long	.L2613
	.long	.L2598
	.long	.L2613
	.long	.L2598
	.long	.L2613
	.long	.L2598
	.long	.L2613
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2613
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2613
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2598
	.long	.L2613
	.text
	.p2align 4,,7
	.p2align 3
.L2614:
.LVL3061:
.LBB8774:
.LBB8775:
.LBB8776:
.LBB8777:
	.loc 27 873 0
	movl	%edx, %ebx
	andl	$15, %ebx
.L2590:
.LBE8777:
.LBE8776:
	.loc 19 146 0
	cmpl	$1, %ebx
	jne	.L2613
.LVL3062:
.LBB8779:
.LBB8780:
.LBB8781:
	.loc 27 1487 0
	movl	%edx, %ebx
	andl	$15, %ebx
	cmpl	$1, %ebx
	jne	.L2615
	.loc 27 1490 0
	movl	%edx, %ebx
	andl	$50331648, %ebx
	shrl	$24, %ebx
.LVL3063:
.LBE8781:
.LBE8780:
.LBB8783:
.LBB8784:
	.loc 4 1173 0
	cmpl	$2, %ebx
	je	.L2616
	.loc 4 1176 0
	cmpl	$3, %ebx
	movl	$16777216, %esi
	jne	.L2594
.LVL3064:
	testb	$2, 36(%esp)
	je	.L2594
.LVL3065:
.LBB8785:
.LBB8786:
	.loc 14 125 0
	movl	36(%esp), %ebx
.LVL3066:
	andl	$1, %ebx
.LBE8786:
.LBE8785:
	.loc 4 1177 0
	cmpl	$1, %ebx
	sbbl	%esi, %esi
	andl	$-16777216, %esi
	addl	$50331648, %esi
.LVL3067:
.L2594:
.LBE8784:
.LBE8783:
.LBB8790:
.LBB8791:
	.loc 27 1500 0
	andl	$-50331649, %edx
.LVL3068:
	.loc 27 1501 0
	orl	%esi, %edx
.LVL3069:
.L2613:
	movl	%edx, (%eax)
	.loc 27 1502 0
	movl	%ecx, 4(%eax)
.LBE8791:
.LBE8790:
.LBE8779:
.LBE8775:
.LBE8774:
	.loc 38 490 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
.LVL3070:
	.p2align 4,,7
	.p2align 3
.L2585:
	.cfi_restore_state
	.loc 38 442 0
	testb	$1, %dl
.LBB8800:
.LBB8773:
	.loc 27 874 0
	movzbl	%dl, %ebx
.LBE8773:
.LBE8800:
	.loc 38 442 0
	je	.L2597
.LVL3071:
.LBB8801:
.LBB8797:
.LBB8794:
.LBB8778:
	.loc 27 874 0
	movzbl	%dl, %ebx
	jmp	.L2590
.LVL3072:
	.p2align 4,,7
	.p2align 3
.L2602:
.LBE8778:
.LBE8794:
.LBE8797:
.LBE8801:
.LBB8802:
.LBB8803:
.LBB8804:
	.loc 27 1147 0
	movl	%edx, %ebx
	andl	$15, %ebx
	cmpl	$6, %ebx
	jne	.L2617
.LVL3073:
.LBE8804:
.LBE8803:
	.loc 38 484 0
	movl	%edx, (%eax)
.LBB8807:
.LBB8805:
	.loc 27 1150 0
	movl	%ecx, %edx
.LVL3074:
	andl	$2, %edx
.LVL3075:
	shrl	%edx
.LVL3076:
.LBE8805:
.LBE8807:
	.loc 38 477 0
	andl	36(%esp), %edx
.LVL3077:
.LBB8808:
.LBB8809:
	.loc 27 1161 0
	leal	(%edx,%edx), %ebx
	movl	%ecx, %edx
.LVL3078:
	andl	$-4, %edx
.LBE8809:
.LBE8808:
.LBB8810:
.LBB8811:
	.loc 27 1180 0
	orl	%ebx, %edx
.LBE8811:
.LBE8810:
.LBB8813:
.LBB8814:
	.loc 14 120 0
	movl	36(%esp), %ebx
	andl	$2, %ebx
	shrl	%ebx
.LBE8814:
.LBE8813:
	.loc 38 480 0
	andl	%ecx, %ebx
.LVL3079:
.LBB8815:
.LBB8812:
	.loc 27 1181 0
	orl	%ebx, %edx
	movl	%edx, 4(%eax)
.LBE8812:
.LBE8815:
.LBE8802:
	.loc 38 490 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL3080:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
.LVL3081:
	.p2align 4,,7
	.p2align 3
.L2601:
	.cfi_restore_state
.LBB8817:
.LBB8818:
.LBB8819:
	.loc 27 1048 0
	movl	%edx, %ebx
	andl	$15, %ebx
	cmpl	$4, %ebx
	jne	.L2618
.LVL3082:
.LBE8819:
.LBE8818:
	.loc 38 471 0
	movl	%edx, (%eax)
.LBB8822:
.LBB8820:
	.loc 27 1051 0
	movl	%ecx, %edx
.LVL3083:
	andl	$2, %edx
.LVL3084:
	shrl	%edx
.LVL3085:
.LBE8820:
.LBE8822:
	.loc 38 461 0
	andl	36(%esp), %edx
.LVL3086:
.LBB8823:
.LBB8824:
	.loc 27 1062 0
	leal	(%edx,%edx), %ebx
	movl	%ecx, %edx
.LVL3087:
	andl	$-4, %edx
.LBE8824:
.LBE8823:
.LBB8825:
.LBB8826:
	.loc 27 1081 0
	orl	%ebx, %edx
.LBE8826:
.LBE8825:
.LBB8828:
.LBB8829:
	.loc 14 120 0
	movl	36(%esp), %ebx
	andl	$2, %ebx
	shrl	%ebx
.LVL3088:
.LBE8829:
.LBE8828:
	.loc 38 464 0
	andl	%ecx, %ebx
.LVL3089:
.LBB8830:
.LBB8831:
	.loc 27 1031 0
	andl	$4, %ecx
.LVL3090:
.LBE8831:
.LBE8830:
.LBB8832:
.LBB8833:
	.loc 27 1042 0
	andl	36(%esp), %ecx
.LVL3091:
.LBE8833:
.LBE8832:
.LBB8835:
.LBB8827:
	.loc 27 1082 0
	orl	%ebx, %edx
.LBE8827:
.LBE8835:
.LBB8836:
.LBB8834:
	.loc 27 1041 0
	andl	$-5, %edx
	.loc 27 1042 0
	orl	%ecx, %edx
	movl	%edx, 4(%eax)
.LBE8834:
.LBE8836:
.LBE8817:
	.loc 38 490 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL3092:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
.LVL3093:
	.p2align 4,,7
	.p2align 3
.L2598:
	.cfi_restore_state
	.loc 38 488 0
	movl	$__func__.6939, 12(%esp)
	movl	$488, 8(%esp)
	movl	$.LC139, 4(%esp)
	movl	$.LC140, (%esp)
	call	_fail
.LVL3094:
	.p2align 4,,7
	.p2align 3
.L2616:
.LBB8838:
.LBB8798:
.LBB8795:
.LBB8792:
.LBB8789:
.LBB8787:
.LBB8788:
	.loc 14 120 0
	movl	36(%esp), %ebx
.LVL3095:
	andl	$2, %ebx
	shrl	%ebx
.LBE8788:
.LBE8787:
	.loc 4 1173 0
	cmpl	$1, %ebx
	sbbl	%esi, %esi
	andl	$-16777216, %esi
	addl	$33554432, %esi
	jmp	.L2594
.LVL3096:
.L2618:
.LBE8789:
.LBE8792:
.LBE8795:
.LBE8798:
.LBE8838:
.LBB8839:
.LBB8837:
.LBB8821:
	call	cap_endpoint_cap_get_capCanSend.part.64
.LVL3097:
.L2617:
.LBE8821:
.LBE8837:
.LBE8839:
.LBB8840:
.LBB8816:
.LBB8806:
	call	cap_async_endpoint_cap_get_capAEPCanSend.part.192
.LVL3098:
.L2615:
.LBE8806:
.LBE8816:
.LBE8840:
.LBB8841:
.LBB8799:
.LBB8796:
.LBB8793:
.LBB8782:
	.p2align 4,,5
	call	cap_frame_cap_get_capFVMRights.isra.119.part.120
.LVL3099:
.LBE8782:
.LBE8793:
.LBE8796:
.LBE8799:
.LBE8841:
	.cfi_endproc
.LFE564:
	.size	maskCapRights, .-maskCapRights
	.p2align 4,,15
	.globl	invokeIRQControl
	.type	invokeIRQControl, @function
invokeIRQControl:
.LFB545:
	.loc 29 85 0
	.cfi_startproc
.LVL3100:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
.LVL3101:
	.loc 29 85 0
	movl	32(%esp), %ebx
.LBB8850:
.LBB8851:
.LBB8852:
.LBB8853:
	.loc 25 47 0
	testl	%ebx, %ebx
.LBE8853:
.LBE8852:
	.loc 29 263 0
	movl	$1, intStateIRQTable(,%ebx,4)
.LVL3102:
.LBB8858:
.LBB8856:
	.loc 25 47 0
	js	.L2626
	.loc 25 48 0
	cmpl	$31, %ebx
	jg	.L2627
	.loc 25 50 0
	cmpl	$15, %ebx
	jle	.L2628
.L2622:
.LVL3103:
.LBE8856:
.LBE8858:
.LBE8851:
.LBE8850:
	.loc 29 87 0
	movl	36(%esp), %eax
	movl	%ebx, 4(%esp)
	movl	$30, (%esp)
	movl	%eax, 12(%esp)
	movl	40(%esp), %eax
	movl	%eax, 8(%esp)
	call	cteInsert
.LVL3104:
	.loc 29 90 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3105:
	.p2align 4,,7
	.p2align 3
.L2628:
	.cfi_restore_state
.LBB8861:
.LBB8860:
.LBB8859:
.LBB8857:
.LBB8854:
.LBB8855:
	.loc 24 54 0
	cmpl	$7, %ebx
	jle	.L2629
	.loc 24 58 0
	leal	-8(%ebx), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %esi
	movl	%eax, %edi
.LVL3106:
.L2624:
	.loc 24 67 0
	movl	%esi, (%esp)
	call	in8
.LVL3107:
	movl	%edi, %ecx
	notl	%ecx
	movl	%esi, (%esp)
	andl	%eax, %ecx
	movzbl	%cl, %ecx
	movl	%ecx, 4(%esp)
	call	out8
.LVL3108:
	jmp	.L2622
.LVL3109:
	.p2align 4,,7
	.p2align 3
.L2629:
	.loc 24 55 0
	movl	$1, %edi
	movl	%ebx, %ecx
	sall	%cl, %edi
.LVL3110:
	movl	$33, %esi
	jmp	.L2624
.LVL3111:
.L2626:
.LBE8855:
.LBE8854:
	call	maskInterrupt.part.208
.LVL3112:
.L2627:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL3113:
.LBE8857:
.LBE8859:
.LBE8860:
.LBE8861:
	.cfi_endproc
.LFE545:
	.size	invokeIRQControl, .-invokeIRQControl
	.section	.boot.text
	.p2align 4,,15
	.globl	create_domain_cap
	.type	create_domain_cap, @function
create_domain_cap:
.LFB436:
	.loc 21 190 0
	.cfi_startproc
.LVL3114:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 21 190 0
	movl	32(%esp), %eax
.LVL3115:
	movl	36(%esp), %esi
.LVL3116:
.LBB8924:
.LBB8925:
.LBB8926:
.LBB8927:
	.loc 27 872 0
	movl	%eax, %ebx
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ebx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %ecx
.LVL3117:
	cmpl	$14, %ebx
	cmove	%ecx, %edx
.LVL3118:
.LBE8927:
.LBE8926:
	.loc 40 428 0
	cmpl	$62, %edx
	ja	.L2633
	jmp	*.L2635(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L2635:
	.long	.L2657
	.long	.L2636
	.long	.L2637
	.long	.L2638
	.long	.L2639
	.long	.L2640
	.long	.L2641
	.long	.L2657
	.long	.L2657
	.long	.L2642
	.long	.L2643
	.long	.L2657
	.long	.L2644
	.long	.L2633
	.long	.L2657
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2657
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2645
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2633
	.long	.L2657
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L2657:
	.loc 40 457 0
	xorl	%eax, %eax
.LVL3119:
	.p2align 4,,7
	.p2align 3
.L2634:
.LBE8925:
.LBE8924:
.LBB8975:
.LBB8976:
	.loc 21 121 0
	movl	$62, 176(%eax)
	movl	$0, 180(%eax)
.LVL3120:
	.loc 21 123 0
	movl	$0, 184(%eax)
.LVL3121:
.LBB8977:
.LBB8978:
	.loc 27 819 0
	movl	$3, 188(%eax)
.LBE8978:
.LBE8977:
.LBE8976:
.LBE8975:
	.loc 21 203 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL3122:
	.p2align 4,,7
	.p2align 3
.L2636:
	.cfi_restore_state
.LBB8979:
.LBB8974:
.LBB8928:
.LBB8929:
	.loc 27 1507 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L2661
.LVL3123:
.L2656:
.LBE8929:
.LBE8928:
.LBB8931:
.LBB8932:
	.loc 27 1765 0
	andl	$16777200, %eax
.LVL3124:
	sall	$8, %eax
	jmp	.L2634
.LVL3125:
	.p2align 4,,7
	.p2align 3
.L2637:
.LBE8932:
.LBE8931:
.LBB8934:
.LBB8935:
	.loc 27 965 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	jne	.L2662
.LVL3126:
.L2648:
.LBE8935:
.LBE8934:
.LBB8937:
.LBB8938:
	.loc 27 1190 0
	andl	$-16, %eax
.LVL3127:
	jmp	.L2634
.LVL3128:
	.p2align 4,,7
	.p2align 3
.L2638:
.LBE8938:
.LBE8937:
.LBB8940:
.LBB8941:
	.loc 27 1619 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$3, %edx
	je	.L2656
	call	cap_page_table_cap_get_capPTBasePtr.isra.92.part.93
.LVL3129:
	.p2align 4,,7
	.p2align 3
.L2639:
.LBE8941:
.LBE8940:
.LBB8942:
.LBB8943:
	.loc 27 1088 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$4, %edx
	je	.L2648
	call	cap_endpoint_cap_get_capEPPtr.isra.65.part.66
.LVL3130:
	.p2align 4,,7
	.p2align 3
.L2640:
.LBE8943:
.LBE8942:
.LBB8944:
.LBB8945:
	.loc 27 1708 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$5, %edx
	je	.L2656
	call	cap_page_directory_cap_get_capPDBasePtr.isra.67.part.68
.LVL3131:
	.p2align 4,,7
	.p2align 3
.L2641:
.LBE8945:
.LBE8944:
.LBB8946:
.LBB8939:
	.loc 27 1187 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$6, %edx
	je	.L2648
	call	cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87
.LVL3132:
	.p2align 4,,7
	.p2align 3
.L2644:
.LBE8939:
.LBE8946:
.LBB8947:
.LBB8948:
	.loc 27 1359 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$12, %edx
	jne	.L2663
.LBE8948:
.LBE8947:
	.loc 40 442 0
	andl	$-1024, %eax
.LVL3133:
	jmp	.L2634
.LVL3134:
	.p2align 4,,7
	.p2align 3
.L2645:
.LBB8950:
.LBB8951:
.LBB8952:
.LBB8953:
.LBB8954:
.LBB8955:
	.loc 27 1891 0
	cmpb	$46, %al
	jne	.L2664
	.loc 27 1894 0
	andl	$16128, %eax
.LVL3135:
	movl	%eax, %ecx
.LVL3136:
.LBE8955:
.LBE8954:
	.loc 40 90 0
	movl	$-16, %eax
.LBB8958:
.LBB8956:
	.loc 27 1894 0
	shrl	$8, %ecx
.LBE8956:
.LBE8958:
	.loc 40 90 0
	cmpl	$32, %ecx
	je	.L2655
	addl	$1, %ecx
	movb	$-1, %al
	sall	%cl, %eax
.L2655:
.LVL3137:
.LBE8953:
.LBE8952:
	.loc 40 107 0
	andl	%esi, %eax
	jmp	.L2634
.LVL3138:
	.p2align 4,,7
	.p2align 3
.L2642:
.LBE8951:
.LBE8950:
.LBB8963:
.LBB8933:
	.loc 27 1762 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$9, %edx
	je	.L2656
	call	cap_asid_pool_cap_get_capASIDPool.isra.99.part.100
.LVL3139:
	.p2align 4,,7
	.p2align 3
.L2643:
.LBE8933:
.LBE8963:
.LBB8964:
.LBB8965:
	.loc 27 1332 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$10, %edx
	jne	.L2665
	.loc 27 1335 0
	andl	$2147483632, %eax
.LVL3140:
	addl	%eax, %eax
	jmp	.L2634
.LVL3141:
	.p2align 4,,7
	.p2align 3
.L2633:
.LBE8965:
.LBE8964:
.LBB8967:
.LBB8968:
	.loc 40 487 0
	movl	$__func__.2498, 12(%esp)
	movl	$487, 8(%esp)
	movl	$.LC55, 4(%esp)
	movl	$.LC56, (%esp)
	call	_fail
.LVL3142:
.L2661:
.LBE8968:
.LBE8967:
.LBB8969:
.LBB8930:
	call	cap_frame_cap_get_capFBasePtr.isra.90.part.91
.LVL3143:
.L2665:
.LBE8930:
.LBE8969:
.LBB8970:
.LBB8966:
	call	cap_cnode_cap_get_capCNodePtr.isra.62.part.63
.LVL3144:
.L2664:
.LBE8966:
.LBE8970:
.LBB8971:
.LBB8962:
.LBB8961:
.LBB8960:
.LBB8959:
.LBB8957:
	.p2align 4,,5
	call	cap_zombie_cap_get_capZombieType.isra.94.part.95
.LVL3145:
.L2663:
.LBE8957:
.LBE8959:
.LBE8960:
.LBE8961:
.LBE8962:
.LBE8971:
.LBB8972:
.LBB8949:
	.p2align 4,,5
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL3146:
.L2662:
.LBE8949:
.LBE8972:
.LBB8973:
.LBB8936:
	.p2align 4,,5
	call	cap_untyped_cap_get_capPtr.isra.84.part.85
.LVL3147:
.LBE8936:
.LBE8973:
.LBE8974:
.LBE8979:
	.cfi_endproc
.LFE436:
	.size	create_domain_cap, .-create_domain_cap
	.text
	.p2align 4,,15
	.globl	switchToThread
	.type	switchToThread, @function
switchToThread:
.LFB478:
	.loc 22 345 0
	.cfi_startproc
.LVL3148:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 22 345 0
	movl	48(%esp), %ebx
.LVL3149:
.LBB9013:
.LBB9014:
	.loc 12 24 0
	movl	%ebx, (%esp)
	call	setVMRoot
.LVL3150:
.LBB9015:
.LBB9016:
	.loc 27 2270 0
	movl	ia32KSgdt+52, %ecx
.LBE9016:
.LBE9015:
.LBB9020:
.LBB9021:
	.loc 13 27 0
	movl	48(%ebx), %edx
.LVL3151:
.LBE9021:
.LBE9020:
.LBB9022:
.LBB9017:
	.loc 27 2270 0
	movl	%ecx, %eax
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L2669
.LBE9017:
.LBE9022:
	.loc 12 29 0
	movl	%edx, %eax
.LBB9023:
.LBB9024:
	.loc 27 2263 0
	xorb	%cl, %cl
.LBE9024:
.LBE9023:
	.loc 12 29 0
	shrl	$16, %eax
.LBB9027:
.LBB9025:
	.loc 27 2264 0
	movzbl	%al, %eax
	orl	%ecx, %eax
.LBE9025:
.LBE9027:
.LBB9028:
.LBB9029:
	.loc 27 2244 0
	movl	%eax, %ecx
	shrl	$10, %ecx
	andl	$7, %ecx
.LBE9029:
.LBE9028:
.LBB9034:
.LBB9018:
	.loc 27 2277 0
	movw	%dx, ia32KSgdt+50
.LVL3152:
.LBE9018:
.LBE9034:
	.loc 12 30 0
	shrl	$24, %edx
.LVL3153:
.LBB9035:
.LBB9030:
	.loc 27 2244 0
	cmpl	$4, %ecx
	jne	.L2681
.LBE9030:
.LBE9035:
.LBB9036:
.LBB9037:
	.loc 27 2270 0
	movl	ia32KSgdt+60, %ecx
.LBE9037:
.LBE9036:
.LBB9040:
.LBB9031:
	.loc 27 2251 0
	sall	$24, %edx
.LVL3154:
	.loc 27 2250 0
	andl	$16777215, %eax
	.loc 27 2251 0
	orl	%edx, %eax
.LBE9031:
.LBE9040:
	.loc 12 33 0
	movl	636(%ebx), %edx
.LVL3155:
.LBB9041:
.LBB9032:
	.loc 27 2251 0
	movl	%eax, ia32KSgdt+52
.LBE9032:
.LBE9041:
.LBB9042:
.LBB9038:
	.loc 27 2270 0
	movl	%ecx, %eax
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L2669
.LBE9038:
.LBE9042:
	.loc 12 35 0
	movl	%edx, %eax
.LBB9043:
.LBB9044:
	.loc 27 2263 0
	xorb	%cl, %cl
.LBE9044:
.LBE9043:
	.loc 12 35 0
	shrl	$16, %eax
.LBB9047:
.LBB9045:
	.loc 27 2264 0
	movzbl	%al, %eax
	orl	%ecx, %eax
.LBE9045:
.LBE9047:
.LBB9048:
.LBB9039:
	.loc 27 2277 0
	movw	%dx, ia32KSgdt+58
.LVL3156:
.LBE9039:
.LBE9048:
	.loc 12 36 0
	shrl	$24, %edx
.LVL3157:
	movl	%edx, %ecx
.LVL3158:
.LBB9049:
.LBB9050:
	.loc 27 2244 0
	movl	%eax, %edx
.LVL3159:
	shrl	$10, %edx
	andl	$7, %edx
	cmpl	$4, %edx
	jne	.L2682
.LBE9050:
.LBE9049:
.LBE9014:
.LBE9013:
.LBB9059:
.LBB9060:
	.loc 30 97 0
	movl	600(%ebx), %edx
.LBE9060:
.LBE9059:
.LBB9079:
.LBB9057:
.LBB9052:
.LBB9051:
	.loc 27 2250 0
	andl	$16777215, %eax
	.loc 27 2251 0
	sall	$24, %ecx
.LVL3160:
	orl	%ecx, %eax
	movl	%eax, ia32KSgdt+60
.LVL3161:
.LBE9051:
.LBE9052:
.LBE9057:
.LBE9079:
.LBB9080:
.LBB9075:
	.loc 30 97 0
	testb	$1, %dl
	jne	.L2683
.LBE9075:
.LBE9080:
	.loc 22 348 0
	movl	%ebx, ksCurThread
	.loc 22 349 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3162:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3163:
	.p2align 4,,7
	.p2align 3
.L2683:
	.cfi_restore_state
.LBB9081:
.LBB9076:
.LBB9061:
.LBB9062:
.LBB9063:
.LBB9064:
	.loc 30 30 0
	movl	620(%ebx), %eax
.LBE9064:
.LBE9063:
	.loc 30 108 0
	movl	644(%ebx), %ecx
.LBB9066:
.LBB9065:
	.loc 30 30 0
	sall	$8, %eax
	addl	624(%ebx), %eax
.LBE9065:
.LBE9066:
	.loc 30 108 0
	testl	%ecx, %ecx
	.loc 30 106 0
	leal	ksReadyQueues(,%eax,8), %esi
	movl	ksReadyQueues(,%eax,8), %ebp
.LVL3164:
	movl	4(%esi), %edi
	movl	%edi, 12(%esp)
.LVL3165:
	.loc 30 108 0
	je	.L2673
	.loc 30 109 0
	movl	640(%ebx), %edi
.LVL3166:
	movl	%edi, 640(%ecx)
.LVL3167:
	movl	640(%ebx), %edi
.L2674:
	.loc 30 114 0
	testl	%edi, %edi
	je	.L2676
	.loc 30 115 0
	movl	%ecx, 644(%edi)
.LVL3168:
.L2675:
	.loc 30 120 0
	movl	%ebp, ksReadyQueues(,%eax,8)
.LVL3169:
	movl	12(%esp), %eax
.LBB9067:
.LBB9068:
	.loc 27 577 0
	andl	$-2, %edx
.LBE9068:
.LBE9067:
.LBE9062:
.LBE9061:
.LBE9076:
.LBE9081:
	.loc 22 348 0
	movl	%ebx, ksCurThread
.LBB9082:
.LBB9077:
.LBB9073:
.LBB9071:
	.loc 30 120 0
	movl	%eax, 4(%esi)
.LVL3170:
.LBB9070:
.LBB9069:
	.loc 27 577 0
	movl	%edx, 600(%ebx)
.LBE9069:
.LBE9070:
.LBE9071:
.LBE9073:
.LBE9077:
.LBE9082:
	.loc 22 349 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3171:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3172:
	ret
.LVL3173:
	.p2align 4,,7
	.p2align 3
.L2673:
	.cfi_restore_state
.LBB9083:
.LBB9078:
.LBB9074:
.LBB9072:
	.loc 30 111 0
	movl	640(%ebx), %ebp
.LVL3174:
	movl	%ebp, %edi
.LVL3175:
	jmp	.L2674
.LVL3176:
	.p2align 4,,7
	.p2align 3
.L2676:
	.loc 30 108 0
	movl	%ecx, 12(%esp)
.LVL3177:
	jmp	.L2675
.LVL3178:
.L2669:
.LBE9072:
.LBE9074:
.LBE9078:
.LBE9083:
.LBB9084:
.LBB9058:
.LBB9053:
.LBB9019:
	call	gdt_entry_gdt_data_ptr_set_base_low.part.72
.LVL3179:
.L2682:
.LBE9019:
.LBE9053:
.LBB9054:
.LBB9046:
	.loc 27 2264 0
	movl	%eax, ia32KSgdt+60
.LVL3180:
.L2671:
.LBE9046:
.LBE9054:
.LBB9055:
.LBB9033:
	call	gdt_entry_gdt_data_ptr_set_base_high.isra.75.part.76
.LVL3181:
.L2681:
.LBE9033:
.LBE9055:
.LBB9056:
.LBB9026:
	movl	%eax, ia32KSgdt+52
	jmp	.L2671
.LBE9026:
.LBE9056:
.LBE9058:
.LBE9084:
	.cfi_endproc
.LFE478:
	.size	switchToThread, .-switchToThread
	.p2align 4,,15
	.type	emptySlot, @function
emptySlot:
.LFB519:
	.loc 26 592 0
	.cfi_startproc
.LVL3182:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 26 593 0
	movl	(%eax), %ecx
.LVL3183:
.LBB9119:
.LBB9120:
	.loc 27 872 0
	movl	%ecx, %esi
	.loc 27 873 0
	movl	%ecx, %ebx
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %ebx
	movzbl	%cl, %ecx
.LVL3184:
	cmpl	$14, %esi
	cmove	%ecx, %ebx
.LBE9120:
.LBE9119:
	.loc 26 593 0
	testl	%ebx, %ebx
	je	.L2684
.LVL3185:
.LBB9121:
.LBB9122:
	.loc 26 597 0
	movl	12(%eax), %edi
.LVL3186:
	.loc 26 601 0
	movl	8(%eax), %esi
.LBB9123:
.LBB9124:
	.loc 27 767 0
	movl	%edi, %ecx
	andl	$-8, %ecx
.LVL3187:
.LBE9124:
.LBE9123:
	.loc 26 601 0
	andl	$-8, %esi
.LVL3188:
	je	.L2689
.LVL3189:
.LBB9125:
.LBB9126:
	.loc 27 774 0
	movl	12(%esi), %ebx
	andl	$7, %ebx
	.loc 27 775 0
	orl	%ecx, %ebx
	movl	%ebx, 12(%esi)
.LVL3190:
.L2689:
.LBE9126:
.LBE9125:
	.loc 26 604 0
	testl	%ecx, %ecx
	je	.L2690
.LVL3191:
.LBB9127:
.LBB9128:
	.loc 27 840 0
	movl	8(%ecx), %ebx
.LBE9128:
.LBE9127:
.LBB9131:
.LBB9132:
	.loc 27 802 0
	andl	$1, %edi
.LVL3192:
.LBE9132:
.LBE9131:
.LBB9134:
.LBB9129:
	.loc 27 840 0
	andl	$7, %ebx
	.loc 27 841 0
	orl	%esi, %ebx
.LBE9129:
.LBE9134:
	.loc 26 609 0
	movl	12(%ecx), %esi
.LVL3193:
.LBB9135:
.LBB9130:
	.loc 27 841 0
	movl	%ebx, 8(%ecx)
.LBE9130:
.LBE9135:
.LBB9136:
.LBB9133:
	.loc 27 802 0
	movl	$1, %ebx
	testl	$1, %esi
	cmove	%edi, %ebx
.LVL3194:
.LBE9133:
.LBE9136:
.LBB9137:
.LBB9138:
	.loc 27 818 0
	andl	$-2, %esi
	.loc 27 819 0
	orl	%esi, %ebx
.LVL3195:
	movl	%ebx, 12(%ecx)
.LVL3196:
.L2690:
.LBE9138:
.LBE9137:
	.loc 26 614 0
	cmpl	$-1, %edx
	.loc 26 611 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
.LVL3197:
	.loc 26 612 0
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	.loc 26 614 0
	je	.L2684
.LVL3198:
.LBB9139:
.LBB9140:
.LBB9141:
.LBB9142:
.LBB9143:
	.loc 25 47 0
	testl	%edx, %edx
.LBE9143:
.LBE9142:
	.loc 29 263 0
	movl	$0, intStateIRQTable(,%edx,4)
.LVL3199:
.LBB9151:
.LBB9148:
	.loc 25 47 0
	js	.L2708
	.loc 25 48 0
	cmpl	$31, %edx
	jg	.L2709
	.loc 25 50 0
	cmpl	$15, %edx
	jle	.L2710
.LVL3200:
.L2684:
.LBE9148:
.LBE9151:
.LBE9141:
.LBE9140:
.LBE9139:
.LBE9122:
.LBE9121:
	.loc 26 618 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3201:
	.p2align 4,,7
	.p2align 3
.L2710:
	.cfi_restore_state
.LBB9162:
.LBB9160:
.LBB9158:
.LBB9156:
.LBB9154:
.LBB9152:
.LBB9149:
.LBB9144:
.LBB9145:
	.loc 24 54 0
	cmpl	$7, %edx
	jg	.L2695
	.loc 24 55 0
	movl	$1, %esi
	movl	%edx, %ecx
.LVL3202:
	sall	%cl, %esi
.LVL3203:
	movl	$33, %ebx
.LVL3204:
.L2696:
	.loc 24 64 0
	movl	%ebx, (%esp)
	call	in8
.LVL3205:
	movl	%ebx, (%esp)
	orl	%esi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
.LVL3206:
.LBE9145:
.LBE9144:
.LBE9149:
.LBE9152:
.LBE9154:
.LBE9156:
.LBE9158:
.LBE9160:
.LBE9162:
	.loc 26 618 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL3207:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3208:
	.p2align 4,,7
	.p2align 3
.L2695:
	.cfi_restore_state
.LBB9163:
.LBB9161:
.LBB9159:
.LBB9157:
.LBB9155:
.LBB9153:
.LBB9150:
.LBB9147:
.LBB9146:
	.loc 24 58 0
	leal	-8(%edx), %ecx
.LVL3209:
	movl	$1, %eax
.LVL3210:
	sall	%cl, %eax
	movl	$161, %ebx
	movl	%eax, %esi
.LVL3211:
	jmp	.L2696
.LVL3212:
.L2709:
.LBE9146:
.LBE9147:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL3213:
.L2708:
	call	maskInterrupt.part.208
.LVL3214:
.LBE9150:
.LBE9153:
.LBE9155:
.LBE9157:
.LBE9159:
.LBE9161:
.LBE9163:
	.cfi_endproc
.LFE519:
	.size	emptySlot, .-emptySlot
	.p2align 4,,15
	.globl	maskInterrupt
	.type	maskInterrupt, @function
maskInterrupt:
.LFB609:
	.loc 25 46 0
	.cfi_startproc
.LVL3215:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 25 46 0
	movl	36(%esp), %ecx
	movl	32(%esp), %eax
	.loc 25 47 0
	testl	%ecx, %ecx
	js	.L2720
	.loc 25 48 0
	cmpl	$31, %ecx
	jg	.L2721
	.loc 25 50 0
	cmpl	$15, %ecx
	jle	.L2722
	.loc 25 59 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2722:
	.cfi_restore_state
.LVL3216:
.LBB9166:
.LBB9167:
	.loc 24 54 0
	cmpl	$7, %ecx
	jle	.L2723
	.loc 24 58 0
	subl	$8, %ecx
.LVL3217:
	movl	$1, %edx
	sall	%cl, %edx
	movl	$161, %ebx
	.loc 24 62 0
	testl	%eax, %eax
	.loc 24 58 0
	movl	%edx, %esi
.LVL3218:
	.loc 24 64 0
	movl	%ebx, (%esp)
	.loc 24 62 0
	jne	.L2724
.L2717:
	.loc 24 67 0
	call	in8
.LVL3219:
	notl	%esi
.LVL3220:
	andl	%esi, %eax
.L2719:
	movzbl	%al, %eax
	movl	%ebx, 32(%esp)
.LVL3221:
	movl	%eax, 36(%esp)
.LVL3222:
.LBE9167:
.LBE9166:
	.loc 25 59 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LBB9169:
.LBB9168:
	.loc 24 67 0
	jmp	out8
.LVL3223:
	.p2align 4,,7
	.p2align 3
.L2723:
	.cfi_restore_state
	.loc 24 55 0
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
.LVL3224:
	.loc 24 62 0
	testl	%eax, %eax
	.loc 24 64 0
	movl	%ebx, (%esp)
	.loc 24 62 0
	je	.L2717
.LVL3225:
.L2724:
	.loc 24 64 0
	call	in8
.LVL3226:
	orl	%esi, %eax
	jmp	.L2719
.LVL3227:
.L2720:
.LBE9168:
.LBE9169:
	.p2align 4,,6
	call	maskInterrupt.part.208
.LVL3228:
.L2721:
	.loc 25 48 0 discriminator 1
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL3229:
	.cfi_endproc
.LFE609:
	.size	maskInterrupt, .-maskInterrupt
	.p2align 4,,15
	.globl	setIRQState
	.type	setIRQState, @function
setIRQState:
.LFB555:
	.loc 29 262 0
	.cfi_startproc
.LVL3230:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 29 262 0
	movl	36(%esp), %ecx
	movl	32(%esp), %eax
.LBB9174:
.LBB9175:
	.loc 25 47 0
	testl	%ecx, %ecx
.LBE9175:
.LBE9174:
	.loc 29 263 0
	movl	%eax, intStateIRQTable(,%ecx,4)
.LVL3231:
.LBB9183:
.LBB9180:
	.loc 25 47 0
	js	.L2734
	.loc 25 48 0
	cmpl	$31, %ecx
	jg	.L2735
	.loc 25 50 0
	cmpl	$15, %ecx
	jle	.L2736
.LBE9180:
.LBE9183:
	.loc 29 265 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2736:
	.cfi_restore_state
.LVL3232:
.LBB9184:
.LBB9181:
.LBB9176:
.LBB9177:
	.loc 24 54 0
	cmpl	$7, %ecx
	jle	.L2737
	.loc 24 58 0
	subl	$8, %ecx
.LVL3233:
	movl	$1, %edx
	sall	%cl, %edx
	movl	$161, %ebx
	.loc 24 62 0
	testl	%eax, %eax
	.loc 24 58 0
	movl	%edx, %esi
.LVL3234:
	.loc 24 64 0
	movl	%ebx, (%esp)
	.loc 24 62 0
	je	.L2738
.L2731:
	.loc 24 67 0
	call	in8
.LVL3235:
	notl	%esi
.LVL3236:
	andl	%esi, %eax
.L2733:
	movzbl	%al, %eax
	movl	%ebx, 32(%esp)
.LVL3237:
	movl	%eax, 36(%esp)
.LVL3238:
.LBE9177:
.LBE9176:
.LBE9181:
.LBE9184:
	.loc 29 265 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LBB9185:
.LBB9182:
.LBB9179:
.LBB9178:
	.loc 24 67 0
	jmp	out8
.LVL3239:
	.p2align 4,,7
	.p2align 3
.L2737:
	.cfi_restore_state
	.loc 24 55 0
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
.LVL3240:
	.loc 24 62 0
	testl	%eax, %eax
	.loc 24 64 0
	movl	%ebx, (%esp)
	.loc 24 62 0
	jne	.L2731
.LVL3241:
.L2738:
	.loc 24 64 0
	call	in8
.LVL3242:
	orl	%esi, %eax
	jmp	.L2733
.LVL3243:
.L2734:
.LBE9178:
.LBE9179:
	.p2align 4,,6
	call	maskInterrupt.part.208
.LVL3244:
.L2735:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL3245:
.LBE9182:
.LBE9185:
	.cfi_endproc
.LFE555:
	.size	setIRQState, .-setIRQState
	.section	.boot.text
	.p2align 4,,15
	.globl	create_bi_frame_cap
	.type	create_bi_frame_cap, @function
create_bi_frame_cap:
.LFB438:
	.loc 21 234 0
	.cfi_startproc
.LVL3246:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 21 234 0
	movl	52(%esp), %esi
	movl	48(%esp), %ebx
.LVL3247:
.LBB9200:
.LBB9201:
.LBB9202:
.LBB9203:
.LBB9204:
.LBB9205:
	.loc 27 1381 0
	testl	$4095, %esi
	jne	.L2743
	.loc 27 1383 0
	shrl	$12, %esi
.LVL3248:
	orl	$1048576, %esi
.LVL3249:
	.loc 27 1393 0
	testl	$4095, %ebx
	jne	.L2744
.LVL3250:
.LBE9205:
.LBE9204:
.LBE9203:
.LBE9202:
	.loc 46 106 0
	movl	40(%esp), %eax
.LBB9215:
.LBB9212:
.LBB9209:
.LBB9206:
	.loc 27 1395 0
	andl	$-4096, %ebx
.LVL3251:
.LBE9206:
.LBE9209:
.LBE9212:
.LBE9215:
	.loc 46 106 0
	movl	44(%esp), %edx
.LBB9216:
.LBB9213:
.LBB9210:
.LBB9207:
	.loc 27 1395 0
	shrl	$8, %ebx
	.loc 27 1399 0
	orl	$50331649, %ebx
.LVL3252:
.LBE9207:
.LBE9210:
.LBE9213:
.LBE9216:
	.loc 46 106 0
	movl	%ebx, 8(%esp)
	movl	%esi, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	map_it_frame_cap
.LVL3253:
.LBE9201:
.LBE9200:
	.loc 21 239 0
	movl	32(%esp), %eax
	movl	36(%esp), %edx
	call	cap_get_capPtr
.LVL3254:
.LBB9219:
.LBB9220:
	.loc 21 121 0
	movl	%ebx, 144(%eax)
	movl	%esi, 148(%eax)
.LVL3255:
	.loc 21 123 0
	movl	$0, 152(%eax)
.LVL3256:
.LBB9221:
.LBB9222:
	.loc 27 819 0
	movl	$3, 156(%eax)
.LBE9222:
.LBE9221:
.LBE9220:
.LBE9219:
	.loc 21 240 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL3257:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL3258:
	ret
.LVL3259:
.L2743:
	.cfi_restore_state
.LBB9223:
.LBB9218:
.LBB9217:
.LBB9214:
.LBB9211:
.LBB9208:
	.loc 27 1381 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1381, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC137, (%esp)
	call	_assert_fail
.LVL3260:
.L2744:
	.loc 27 1393 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1393, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC135, (%esp)
	call	_assert_fail
.LVL3261:
.LBE9208:
.LBE9211:
.LBE9214:
.LBE9217:
.LBE9218:
.LBE9223:
	.cfi_endproc
.LFE438:
	.size	create_bi_frame_cap, .-create_bi_frame_cap
	.text
	.p2align 4,,15
	.globl	replyFromKernel_error
	.type	replyFromKernel_error, @function
replyFromKernel_error:
.LFB539:
	.loc 44 200 0
	.cfi_startproc
.LVL3262:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 44 200 0
	movl	32(%esp), %ebx
	.loc 44 204 0
	movl	$1, (%esp)
	movl	%ebx, 4(%esp)
	call	lookupIPCBuffer
.LVL3263:
.LBB9262:
.LBB9263:
	.loc 20 148 0
	movl	current_syscall_error+24, %edx
.LBE9263:
.LBE9262:
.LBB9322:
.LBB9323:
	.loc 13 21 0
	movl	$0, 4(%ebx)
.LVL3264:
.LBE9323:
.LBE9322:
.LBB9324:
.LBB9316:
	.loc 20 148 0
	cmpl	$10, %edx
	ja	.L2746
	jmp	*.L2748(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L2748:
	.long	.L2746
	.long	.L2747
	.long	.L2749
	.long	.L2760
	.long	.L2751
	.long	.L2760
	.long	.L2752
	.long	.L2760
	.long	.L2760
	.long	.L2760
	.long	.L2753
	.text
	.p2align 4,,7
	.p2align 3
.L2760:
	movl	%edx, %eax
.LVL3265:
	.loc 20 160 0
	xorl	%edx, %edx
.L2750:
.LVL3266:
.LBE9316:
.LBE9324:
.LBB9325:
.LBB9326:
	.loc 14 20 0
	testl	$-1048576, %eax
	jne	.L2768
.LVL3267:
	.loc 14 22 0
	sall	$12, %eax
	.loc 14 34 0
	orl	%edx, %eax
	movl	%eax, 16(%ebx)
.LBE9326:
.LBE9325:
	.loc 44 209 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3268:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3269:
	.p2align 4,,7
	.p2align 3
.L2751:
	.cfi_restore_state
.LBB9332:
.LBB9317:
.LBB9264:
.LBB9265:
	.loc 13 21 0
	movl	current_syscall_error+8, %eax
.LVL3270:
.LBE9265:
.LBE9264:
	.loc 20 167 0
	movl	$2, %edx
.LBB9267:
.LBB9266:
	.loc 13 21 0
	movl	%eax, 20(%ebx)
.LVL3271:
.LBE9266:
.LBE9267:
.LBB9268:
.LBB9269:
	movl	current_syscall_error+12, %eax
	movl	%eax, 24(%ebx)
	movl	$4, %eax
.LVL3272:
.LBE9269:
.LBE9268:
.LBE9317:
.LBE9332:
.LBB9333:
.LBB9327:
	.loc 14 22 0
	sall	$12, %eax
	.loc 14 34 0
	orl	%edx, %eax
	movl	%eax, 16(%ebx)
.LBE9327:
.LBE9333:
	.loc 44 209 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3273:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3274:
	.p2align 4,,7
	.p2align 3
.L2753:
	.cfi_restore_state
.LBB9334:
.LBB9318:
.LBB9270:
.LBB9271:
	.loc 13 21 0
	movl	current_syscall_error+16, %eax
.LVL3275:
.LBE9271:
.LBE9270:
	.loc 20 185 0
	xorl	%edx, %edx
.LBB9273:
.LBB9272:
	.loc 13 21 0
	movl	%eax, 20(%ebx)
	movl	$10, %eax
.LVL3276:
.LBE9272:
.LBE9273:
.LBE9318:
.LBE9334:
.LBB9335:
.LBB9328:
	.loc 14 22 0
	sall	$12, %eax
	.loc 14 34 0
	orl	%edx, %eax
	movl	%eax, 16(%ebx)
.LVL3277:
.LBE9328:
.LBE9335:
	.loc 44 209 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3278:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3279:
	.p2align 4,,7
	.p2align 3
.L2752:
	.cfi_restore_state
.LBB9336:
.LBB9319:
	.loc 20 173 0
	movl	current_syscall_error+20, %ecx
	xorl	%edx, %edx
	movl	current_lookup_fault+4, %edi
	testl	%ecx, %ecx
	movl	current_lookup_fault, %ecx
	setne	%dl
.LBB9274:
.LBB9275:
	.loc 13 21 0
	movl	%edx, 20(%ebx)
.LVL3280:
.LBE9275:
.LBE9274:
.LBB9276:
.LBB9277:
.LBB9278:
.LBB9279:
	.loc 27 2358 0
	movl	%ecx, %edx
	andl	$3, %edx
.LVL3281:
.LBE9279:
.LBE9278:
	.loc 20 30 0
	testl	%eax, %eax
	.loc 20 27 0
	leal	1(%edx), %esi
.LVL3282:
	movl	%esi, 24(%ebx)
	.loc 20 30 0
	je	.L2766
	.loc 20 38 0
	cmpl	$2, %edx
	je	.L2756
	cmpl	$3, %edx
	je	.L2757
	cmpl	$1, %edx
	.p2align 4,,2
	je	.L2769
.L2766:
	movl	$6, %eax
.LVL3283:
	.loc 20 40 0
	movl	$2, %edx
	jmp	.L2750
.LVL3284:
	.p2align 4,,7
	.p2align 3
.L2747:
.LBE9277:
.LBE9276:
.LBB9309:
.LBB9310:
	.loc 13 21 0
	movl	current_syscall_error, %eax
.LVL3285:
	movl	%eax, 20(%ebx)
	movl	$1, %eax
.LVL3286:
.LBE9310:
.LBE9309:
.LBE9319:
.LBE9336:
.LBB9337:
.LBB9329:
	.loc 14 22 0
	sall	$12, %eax
	.loc 14 34 0
	orl	%edx, %eax
	movl	%eax, 16(%ebx)
.LBE9329:
.LBE9337:
	.loc 44 209 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3287:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3288:
	.p2align 4,,7
	.p2align 3
.L2749:
	.cfi_restore_state
.LBB9338:
.LBB9320:
.LBB9311:
.LBB9312:
	.loc 13 21 0
	movl	current_syscall_error+4, %eax
.LVL3289:
.LBE9312:
.LBE9311:
	.loc 20 157 0
	movl	$1, %edx
.LBB9314:
.LBB9313:
	.loc 13 21 0
	movl	%eax, 20(%ebx)
	movl	$2, %eax
.LVL3290:
.LBE9313:
.LBE9314:
.LBE9320:
.LBE9338:
.LBB9339:
.LBB9330:
	.loc 14 22 0
	sall	$12, %eax
	.loc 14 34 0
	orl	%edx, %eax
	movl	%eax, 16(%ebx)
.LBE9330:
.LBE9339:
	.loc 44 209 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3291:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3292:
	.p2align 4,,7
	.p2align 3
.L2746:
	.cfi_restore_state
.LBB9340:
.LBB9321:
	.loc 20 187 0
	movl	$__func__.5803, 12(%esp)
	movl	$187, 8(%esp)
	movl	$.LC86, 4(%esp)
	movl	$.LC133, (%esp)
	call	_fail
.LVL3293:
	.p2align 4,,7
	.p2align 3
.L2769:
.LBB9315:
.LBB9308:
.LBB9280:
.LBB9281:
	.loc 27 2400 0
	andl	$252, %ecx
.LVL3294:
.LBE9281:
.LBE9280:
	.loc 20 45 0
	movb	$3, %dl
.LBB9283:
.LBB9282:
	.loc 27 2400 0
	shrl	$2, %ecx
	movl	%ecx, 12(%eax)
	movl	current_syscall_error+24, %eax
.LVL3295:
	jmp	.L2750
.LVL3296:
	.p2align 4,,7
	.p2align 3
.L2757:
.LBE9282:
.LBE9283:
.LBB9284:
.LBB9285:
	.loc 27 2479 0
	movl	%ecx, %edx
.LBE9285:
.LBE9284:
.LBB9288:
.LBB9289:
	.loc 27 2487 0
	andl	$252, %ecx
.LVL3297:
.LBE9289:
.LBE9288:
.LBB9292:
.LBB9286:
	.loc 27 2479 0
	andl	$16128, %edx
.LVL3298:
	shrl	$8, %edx
.LBE9286:
.LBE9292:
.LBB9293:
.LBB9290:
	.loc 27 2487 0
	shrl	$2, %ecx
.LBE9290:
.LBE9293:
.LBB9294:
.LBB9287:
	.loc 27 2479 0
	movl	%edx, 12(%eax)
.LVL3299:
.LBE9287:
.LBE9294:
	.loc 20 61 0
	movl	$5, %edx
	.loc 20 57 0
	movl	%edi, 16(%eax)
.LBB9295:
.LBB9291:
	.loc 27 2487 0
	movl	%ecx, 20(%eax)
	movl	current_syscall_error+24, %eax
.LVL3300:
	jmp	.L2750
.LVL3301:
	.p2align 4,,7
	.p2align 3
.L2756:
.LBE9291:
.LBE9295:
.LBB9296:
.LBB9297:
	.loc 27 2439 0
	movl	%ecx, %edx
.LBE9297:
.LBE9296:
.LBB9300:
.LBB9301:
	.loc 27 2431 0
	andl	$16128, %ecx
.LVL3302:
.LBE9301:
.LBE9300:
.LBB9304:
.LBB9298:
	.loc 27 2439 0
	andl	$252, %edx
.LVL3303:
	shrl	$2, %edx
.LBE9298:
.LBE9304:
.LBB9305:
.LBB9302:
	.loc 27 2431 0
	shrl	$8, %ecx
.LBE9302:
.LBE9305:
.LBB9306:
.LBB9299:
	.loc 27 2439 0
	movl	%edx, 12(%eax)
.LBE9299:
.LBE9306:
	.loc 20 52 0
	movl	$4, %edx
.LBB9307:
.LBB9303:
	.loc 27 2431 0
	movl	%ecx, 16(%eax)
	movl	current_syscall_error+24, %eax
.LVL3304:
	jmp	.L2750
.LVL3305:
.L2768:
.LBE9303:
.LBE9307:
.LBE9308:
.LBE9315:
.LBE9321:
.LBE9340:
.LBB9341:
.LBB9331:
	call	message_info_new.part.130
.LVL3306:
.LBE9331:
.LBE9341:
	.cfi_endproc
.LFE539:
	.size	replyFromKernel_error, .-replyFromKernel_error
	.p2align 4,,15
	.globl	schedule
	.type	schedule, @function
schedule:
.LFB476:
	.loc 22 301 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 22 304 0
	movl	ksSchedulerAction, %ebx
.LVL3307:
	.loc 22 305 0
	cmpl	$-1, %ebx
	je	.L2813
	.loc 22 314 0
	testl	%ebx, %ebx
	je	.L2770
	.loc 22 315 0
	movl	ksCurThread, %eax
.LVL3308:
.LBB9416:
.LBB9417:
.LBB9418:
.LBB9419:
	.loc 27 614 0
	movl	592(%eax), %edx
	andl	$15, %edx
.LBE9419:
.LBE9418:
	.loc 22 49 0
	subl	$1, %edx
	cmpl	$1, %edx
	ja	.L2785
.LVL3309:
.LBE9417:
.LBE9416:
.LBB9420:
.LBB9421:
	.loc 30 37 0
	testb	$1, 600(%eax)
	je	.L2814
.LVL3310:
.L2785:
.LBE9421:
.LBE9420:
.LBB9423:
.LBB9424:
.LBB9425:
.LBB9426:
	.loc 12 24 0
	movl	%ebx, (%esp)
	call	setVMRoot
.LVL3311:
.LBB9427:
.LBB9428:
	.loc 27 2270 0
	movl	ia32KSgdt+52, %ecx
.LBE9428:
.LBE9427:
.LBB9432:
.LBB9433:
	.loc 13 27 0
	movl	48(%ebx), %edx
.LVL3312:
.LBE9433:
.LBE9432:
.LBB9434:
.LBB9429:
	.loc 27 2270 0
	movl	%ecx, %eax
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L2789
.LBE9429:
.LBE9434:
	.loc 12 29 0
	movl	%edx, %eax
.LBB9435:
.LBB9436:
	.loc 27 2263 0
	xorb	%cl, %cl
.LBE9436:
.LBE9435:
	.loc 12 29 0
	shrl	$16, %eax
.LBB9439:
.LBB9437:
	.loc 27 2264 0
	movzbl	%al, %eax
	orl	%ecx, %eax
.LBE9437:
.LBE9439:
	.loc 12 30 0
	movl	%edx, %ecx
.LBB9440:
.LBB9430:
	.loc 27 2277 0
	movw	%dx, ia32KSgdt+50
.LVL3313:
.LBE9430:
.LBE9440:
.LBB9441:
.LBB9442:
	.loc 27 2244 0
	movl	%eax, %edx
.LVL3314:
	shrl	$10, %edx
	andl	$7, %edx
.LBE9442:
.LBE9441:
	.loc 12 30 0
	shrl	$24, %ecx
.LVL3315:
.LBB9447:
.LBB9443:
	.loc 27 2244 0
	cmpl	$4, %edx
	jne	.L2815
	.loc 27 2251 0
	sall	$24, %ecx
.LVL3316:
	.loc 27 2250 0
	andl	$16777215, %eax
.LBE9443:
.LBE9447:
	.loc 12 33 0
	movl	636(%ebx), %edx
.LVL3317:
.LBB9448:
.LBB9444:
	.loc 27 2251 0
	orl	%ecx, %eax
.LBE9444:
.LBE9448:
.LBB9449:
.LBB9450:
	.loc 27 2270 0
	movl	ia32KSgdt+60, %ecx
.LBE9450:
.LBE9449:
.LBB9453:
.LBB9445:
	.loc 27 2251 0
	movl	%eax, ia32KSgdt+52
.LBE9445:
.LBE9453:
.LBB9454:
.LBB9451:
	.loc 27 2270 0
	movl	%ecx, %eax
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L2789
.LBE9451:
.LBE9454:
	.loc 12 35 0
	movl	%edx, %eax
.LBB9455:
.LBB9456:
	.loc 27 2263 0
	xorb	%cl, %cl
.LBE9456:
.LBE9455:
	.loc 12 35 0
	shrl	$16, %eax
.LBB9459:
.LBB9457:
	.loc 27 2264 0
	movzbl	%al, %eax
	orl	%ecx, %eax
.LBE9457:
.LBE9459:
	.loc 12 36 0
	movl	%edx, %ecx
.LBB9460:
.LBB9452:
	.loc 27 2277 0
	movw	%dx, ia32KSgdt+58
.LVL3318:
.LBE9452:
.LBE9460:
.LBB9461:
.LBB9462:
	.loc 27 2244 0
	movl	%eax, %edx
.LVL3319:
	shrl	$10, %edx
	andl	$7, %edx
.LBE9462:
.LBE9461:
	.loc 12 36 0
	shrl	$24, %ecx
.LVL3320:
.LBB9465:
.LBB9463:
	.loc 27 2244 0
	cmpl	$4, %edx
	jne	.L2816
.LBE9463:
.LBE9465:
.LBE9426:
.LBE9425:
.LBB9473:
.LBB9474:
	.loc 30 97 0
	movl	600(%ebx), %edx
.LBE9474:
.LBE9473:
.LBB9490:
.LBB9471:
.LBB9466:
.LBB9464:
	.loc 27 2250 0
	andl	$16777215, %eax
	.loc 27 2251 0
	sall	$24, %ecx
.LVL3321:
	orl	%ecx, %eax
	movl	%eax, ia32KSgdt+60
.LVL3322:
.LBE9464:
.LBE9466:
.LBE9471:
.LBE9490:
.LBB9491:
.LBB9487:
	.loc 30 97 0
	testb	$1, %dl
	jne	.L2817
.LVL3323:
.L2792:
.LBE9487:
.LBE9491:
	.loc 22 348 0
	movl	%ebx, ksCurThread
.L2812:
.LBE9424:
.LBE9423:
	.loc 22 320 0
	movl	$0, ksSchedulerAction
.L2770:
	.loc 22 322 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3324:
	.p2align 4,,7
	.p2align 3
.L2813:
	.cfi_restore_state
.LBB9497:
	.loc 22 306 0
	movl	ksCurThread, %eax
.LVL3325:
.LBB9498:
.LBB9499:
.LBB9500:
.LBB9501:
	.loc 27 614 0
	movl	592(%eax), %edx
	andl	$15, %edx
.LBE9501:
.LBE9500:
	.loc 22 49 0
	subl	$1, %edx
	cmpl	$1, %edx
	jbe	.L2818
.LVL3326:
.L2772:
.LBE9499:
.LBE9498:
	.loc 22 309 0
	movl	ksDomainTime, %eax
	movl	ksCurDomain, %ecx
	testl	%eax, %eax
	jne	.L2775
.LBB9502:
.LBB9503:
	.loc 22 292 0
	movl	$0, ksDomScheduleIdx
	.loc 22 296 0
	xorl	%ecx, %ecx
	.loc 22 294 0
	movl	$0, ksWorkUnitsCompleted
	.loc 22 295 0
	movl	$0, ksCurDomain
	.loc 22 296 0
	movl	$1, ksDomainTime
.L2775:
.LVL3327:
	sall	$8, %ecx
	movl	$255, %edx
	jmp	.L2783
.LVL3328:
	.p2align 4,,7
	.p2align 3
.L2778:
.LBE9503:
.LBE9502:
.LBB9504:
.LBB9505:
	.loc 22 330 0
	subl	$1, %edx
.LVL3329:
	cmpl	$-1, %edx
	je	.L2819
.LVL3330:
.L2783:
	leal	(%edx,%ecx), %eax
.LVL3331:
.LBB9506:
	.loc 22 332 0
	movl	ksReadyQueues(,%eax,8), %ebx
.LVL3332:
	.loc 22 333 0
	testl	%ebx, %ebx
	je	.L2778
.LVL3333:
.LBB9507:
.LBB9508:
.LBB9509:
.LBB9510:
	.loc 27 614 0
	movl	592(%ebx), %eax
.LVL3334:
	andl	$15, %eax
.LBE9510:
.LBE9509:
	.loc 22 49 0
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L2820
.LBE9508:
.LBE9507:
	.loc 22 334 0
	movl	$__FUNCTION__.6191, 12(%esp)
	movl	$334, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$.LC131, (%esp)
	call	_assert_fail
.LVL3335:
	.p2align 4,,7
	.p2align 3
.L2818:
.LBE9506:
.LBE9505:
.LBE9504:
.LBB9520:
.LBB9521:
	.loc 30 37 0
	testb	$1, 600(%eax)
	jne	.L2772
	call	tcbSchedEnqueue.part.197
.LVL3336:
	jmp	.L2772
.LVL3337:
	.p2align 4,,7
	.p2align 3
.L2820:
.LBE9521:
.LBE9520:
.LBB9522:
.LBB9518:
.LBB9515:
.LBB9511:
.LBB9512:
	.loc 22 346 0
	movl	%ebx, (%esp)
	.p2align 4,,5
	call	Arch_switchToThread
.LVL3338:
.LBB9513:
.LBB9514:
	.loc 30 97 0
	testb	$1, 600(%ebx)
	je	.L2792
	movl	%ebx, %eax
	call	tcbSchedDequeue.part.202
.LVL3339:
	jmp	.L2792
.LVL3340:
	.p2align 4,,7
	.p2align 3
.L2814:
.LBE9514:
.LBE9513:
.LBE9512:
.LBE9511:
.LBE9515:
.LBE9518:
.LBE9522:
.LBE9497:
.LBB9524:
.LBB9422:
	call	tcbSchedEnqueue.part.197
.LVL3341:
	movl	ksSchedulerAction, %ebx
.LVL3342:
	.p2align 4,,2
	jmp	.L2785
.LVL3343:
	.p2align 4,,7
	.p2align 3
.L2817:
.LBE9422:
.LBE9524:
.LBB9525:
.LBB9495:
.LBB9492:
.LBB9488:
.LBB9475:
.LBB9476:
.LBB9477:
.LBB9478:
	.loc 30 30 0
	movl	620(%ebx), %eax
.LBE9478:
.LBE9477:
	.loc 30 108 0
	movl	644(%ebx), %ecx
.LBB9480:
.LBB9479:
	.loc 30 30 0
	sall	$8, %eax
	addl	624(%ebx), %eax
.LBE9479:
.LBE9480:
	.loc 30 108 0
	testl	%ecx, %ecx
	.loc 30 106 0
	leal	ksReadyQueues(,%eax,8), %esi
	movl	ksReadyQueues(,%eax,8), %ebp
.LVL3344:
	movl	4(%esi), %edi
	movl	%edi, 28(%esp)
.LVL3345:
	.loc 30 108 0
	je	.L2793
	.loc 30 109 0
	movl	640(%ebx), %edi
.LVL3346:
	movl	%edi, 640(%ecx)
.LVL3347:
	movl	640(%ebx), %edi
.L2794:
	.loc 30 114 0
	testl	%edi, %edi
	je	.L2801
	.loc 30 115 0
	movl	%ecx, 644(%edi)
.LVL3348:
.L2795:
	.loc 30 120 0
	movl	%ebp, ksReadyQueues(,%eax,8)
.LVL3349:
	movl	28(%esp), %eax
.LBB9481:
.LBB9482:
	.loc 27 577 0
	andl	$-2, %edx
.LBE9482:
.LBE9481:
	.loc 30 120 0
	movl	%eax, 4(%esi)
.LVL3350:
.LBB9484:
.LBB9483:
	.loc 27 577 0
	movl	%edx, 600(%ebx)
	jmp	.L2792
.LVL3351:
	.p2align 4,,7
	.p2align 3
.L2819:
.LBE9483:
.LBE9484:
.LBE9476:
.LBE9475:
.LBE9488:
.LBE9492:
.LBE9495:
.LBE9525:
.LBB9526:
.LBB9523:
.LBB9519:
.LBB9516:
.LBB9517:
	.loc 22 355 0
	movl	ksIdleThread, %eax
.LVL3352:
	movl	%eax, ksCurThread
	jmp	.L2812
.LVL3353:
.L2801:
.LBE9517:
.LBE9516:
.LBE9519:
.LBE9523:
.LBE9526:
.LBB9527:
.LBB9496:
.LBB9493:
.LBB9489:
.LBB9486:
.LBB9485:
	.loc 30 108 0
	movl	%ecx, 28(%esp)
.LVL3354:
	jmp	.L2795
.LVL3355:
.L2793:
	.loc 30 111 0
	movl	640(%ebx), %ebp
.LVL3356:
	movl	%ebp, %edi
.LVL3357:
	jmp	.L2794
.LVL3358:
.L2789:
.LBE9485:
.LBE9486:
.LBE9489:
.LBE9493:
.LBB9494:
.LBB9472:
.LBB9467:
.LBB9431:
	call	gdt_entry_gdt_data_ptr_set_base_low.part.72
.LVL3359:
.L2815:
.LBE9431:
.LBE9467:
.LBB9468:
.LBB9438:
	.loc 27 2264 0
	movl	%eax, ia32KSgdt+52
.LVL3360:
.L2791:
.LBE9438:
.LBE9468:
.LBB9469:
.LBB9446:
	call	gdt_entry_gdt_data_ptr_set_base_high.isra.75.part.76
.LVL3361:
.L2816:
.LBE9446:
.LBE9469:
.LBB9470:
.LBB9458:
	movl	%eax, ia32KSgdt+60
	jmp	.L2791
.LBE9458:
.LBE9470:
.LBE9472:
.LBE9494:
.LBE9496:
.LBE9527:
	.cfi_endproc
.LFE476:
	.size	schedule, .-schedule
	.p2align 4,,15
	.globl	invokeCNodeMove
	.type	invokeCNodeMove, @function
invokeCNodeMove:
.LFB509:
	.loc 26 336 0
	.cfi_startproc
.LVL3362:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 26 336 0
	movl	44(%esp), %ecx
	movl	40(%esp), %ebx
.LVL3363:
.LBB9546:
.LBB9547:
	.loc 26 470 0
	movl	(%ecx), %edx
.LVL3364:
.LBB9548:
.LBB9549:
	.loc 27 872 0
	movl	%edx, %esi
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL3365:
	cmpl	$14, %esi
	cmove	%edx, %eax
.LBE9549:
.LBE9548:
	.loc 26 470 0
	testl	%eax, %eax
	jne	.L2838
	.loc 26 472 0
	testl	$-8, 12(%ecx)
	jne	.L2825
	testl	$-8, 8(%ecx)
	jne	.L2825
	.loc 26 475 0
	movl	8(%ebx), %esi
.LVL3366:
	.loc 26 476 0
	movl	32(%esp), %eax
	movl	36(%esp), %edx
	.loc 26 475 0
	movl	12(%ebx), %edi
.LVL3367:
	.loc 26 476 0
	movl	%eax, (%ecx)
.LVL3368:
	movl	%edx, 4(%ecx)
.LVL3369:
	.loc 26 477 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	.loc 26 478 0
	movl	%esi, 8(%ecx)
	.loc 26 482 0
	andl	$-8, %esi
.LVL3370:
	.loc 26 478 0
	movl	%edi, 12(%ecx)
.LVL3371:
	.loc 26 479 0
	movl	$0, 8(%ebx)
.LVL3372:
	movl	$0, 12(%ebx)
	.loc 26 482 0
	jne	.L2839
.L2827:
	.loc 26 488 0
	andl	$-8, %edi
.LVL3373:
	jne	.L2840
.LBE9547:
.LBE9546:
	.loc 26 340 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3374:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3375:
	.p2align 4,,7
	.p2align 3
.L2840:
	.cfi_restore_state
.LBB9560:
.LBB9558:
.LBB9550:
.LBB9551:
	.loc 27 839 0
	testb	$7, %cl
	jne	.L2841
	.loc 27 840 0
	movl	8(%edi), %eax
	.loc 27 841 0
	andl	$-8, %ecx
.LVL3376:
	.loc 27 840 0
	andl	$7, %eax
	.loc 27 841 0
	orl	%ecx, %eax
	movl	%eax, 8(%edi)
.LBE9551:
.LBE9550:
.LBE9558:
.LBE9560:
	.loc 26 340 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3377:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL3378:
	ret
.LVL3379:
	.p2align 4,,7
	.p2align 3
.L2839:
	.cfi_restore_state
.LBB9561:
.LBB9559:
.LBB9553:
.LBB9554:
	.loc 27 773 0
	testb	$7, %cl
	jne	.L2842
	.loc 27 774 0
	movl	12(%esi), %eax
.LVL3380:
	.loc 27 775 0
	movl	%ecx, %edx
.LVL3381:
	andl	$-8, %edx
	.loc 27 774 0
	andl	$7, %eax
	.loc 27 775 0
	orl	%edx, %eax
	movl	%eax, 12(%esi)
	jmp	.L2827
.LVL3382:
.L2825:
.LBE9554:
.LBE9553:
	.loc 26 472 0
	movl	$__FUNCTION__.6500, 12(%esp)
.LVL3383:
	movl	$473, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC105, (%esp)
	call	_assert_fail
.LVL3384:
.L2838:
	.loc 26 470 0
	movl	$__FUNCTION__.6500, 12(%esp)
.LVL3385:
	movl	$470, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC104, (%esp)
	call	_assert_fail
.LVL3386:
.L2841:
.LBB9556:
.LBB9552:
	call	mdb_node_ptr_set_mdbPrev.isra.180.part.181
.LVL3387:
.L2842:
.LBE9552:
.LBE9556:
.LBB9557:
.LBB9555:
	call	mdb_node_ptr_set_mdbNext.isra.178.part.179
.LVL3388:
.LBE9555:
.LBE9557:
.LBE9559:
.LBE9561:
	.cfi_endproc
.LFE509:
	.size	invokeCNodeMove, .-invokeCNodeMove
	.p2align 4,,15
	.globl	performInvocation_AsyncEndpoint
	.type	performInvocation_AsyncEndpoint, @function
performInvocation_AsyncEndpoint:
.LFB569:
	.loc 38 692 0
	.cfi_startproc
.LVL3389:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
.LVL3390:
	.loc 38 692 0
	movl	64(%esp), %edx
	.loc 43 40 0
	movl	(%edx), %ecx
.LVL3391:
.LBB9618:
.LBB9619:
.LBB9620:
.LBB9621:
	.loc 27 216 0
	movl	%ecx, %eax
	andl	$3, %eax
.LBE9621:
.LBE9620:
	.loc 43 42 0
	cmpl	$1, %eax
	je	.L2845
	jb	.L2846
	cmpl	$2, %eax
	jne	.L2844
.LVL3392:
.LBB9622:
	.loc 43 77 0
	movl	72(%esp), %eax
	.loc 43 80 0
	movl	68(%esp), %ebx
	.loc 43 77 0
	orl	12(%edx), %eax
.LVL3393:
	.loc 43 80 0
	orl	%ebx, 8(%edx)
.LVL3394:
.LBB9623:
.LBB9624:
	.loc 27 172 0
	movl	%eax, 12(%edx)
.LVL3395:
.L2844:
.LBE9624:
.LBE9623:
.LBE9622:
.LBE9619:
.LBE9618:
	.loc 38 696 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2845:
	.cfi_restore_state
.LVL3396:
	.loc 43 22 0
	movl	4(%edx), %esi
.LVL3397:
.LBB9694:
.LBB9691:
.LBB9625:
.LBB9626:
.LBB9627:
.LBB9628:
.LBB9629:
	.loc 27 203 0
	movl	%ecx, %eax
	andl	$-16, %eax
	movl	%eax, 28(%esp)
.LVL3398:
.LBE9629:
.LBE9628:
.LBE9627:
.LBE9626:
	.loc 43 57 0
	movl	%esi, %eax
.LVL3399:
	andl	$-16, %eax
.LVL3400:
	je	.L2857
.LVL3401:
.LBB9630:
.LBB9631:
	.loc 30 146 0
	movl	652(%eax), %edi
	.loc 30 147 0
	movl	648(%eax), %ebx
	.loc 30 146 0
	testl	%edi, %edi
	je	.L2849
	.loc 30 147 0
	movl	%ebx, 648(%edi)
	movl	648(%eax), %ebp
	movl	%eax, %ebx
.LVL3402:
.L2850:
	.loc 30 152 0
	testl	%ebp, %ebp
	je	.L2855
	.loc 30 153 0
	movl	%edi, 652(%ebp)
.LVL3403:
.L2851:
.LBE9631:
.LBE9630:
.LBB9633:
.LBB9634:
.LBB9635:
.LBB9636:
	.loc 27 196 0
	testb	$15, %bl
	jne	.L2858
	.loc 27 198 0
	movl	%ebx, %edi
	.loc 27 197 0
	andl	$15, %esi
	.loc 27 198 0
	andl	$-16, %edi
	orl	%esi, %edi
.LBE9636:
.LBE9635:
.LBB9639:
.LBB9640:
	.loc 27 209 0
	testb	$15, 28(%esp)
.LBE9640:
.LBE9639:
.LBB9644:
.LBB9637:
	.loc 27 198 0
	movl	%edi, 4(%edx)
.LVL3404:
.LBE9637:
.LBE9644:
.LBB9645:
.LBB9641:
	.loc 27 209 0
	jne	.L2859
	.loc 27 211 0
	movl	28(%esp), %esi
	.loc 27 210 0
	andl	$15, %ecx
.LVL3405:
	.loc 27 211 0
	andl	$-16, %esi
	orl	%ecx, %esi
.LBE9641:
.LBE9645:
.LBE9634:
.LBE9633:
	.loc 43 63 0
	testl	%ebx, %ebx
.LBB9652:
.LBB9649:
.LBB9646:
.LBB9642:
	.loc 27 211 0
	movl	%esi, (%edx)
.LVL3406:
.LBE9642:
.LBE9646:
.LBE9649:
.LBE9652:
	.loc 43 63 0
	je	.L2860
.L2854:
.LVL3407:
.LBB9653:
.LBB9654:
.LBB9655:
	.loc 27 626 0
	movl	592(%eax), %edx
.LBE9655:
.LBE9654:
.LBE9653:
.LBB9658:
.LBB9659:
.LBB9660:
.LBB9661:
	.loc 13 21 0
	movl	72(%esp), %ebx
.LVL3408:
.LBE9661:
.LBE9660:
.LBB9663:
.LBB9664:
	movl	68(%esp), %edi
.LBE9664:
.LBE9663:
.LBB9666:
.LBB9667:
	movl	$1, 16(%eax)
.LBE9667:
.LBE9666:
.LBE9659:
.LBE9658:
.LBB9671:
.LBB9657:
.LBB9656:
	.loc 27 626 0
	andl	$-16, %edx
	.loc 27 627 0
	orl	$1, %edx
	movl	%edx, 592(%eax)
.LVL3409:
.LBE9656:
.LBE9657:
.LBE9671:
.LBB9672:
.LBB9673:
	.loc 22 421 0
	xorl	%edx, %edx
.LBE9673:
.LBE9672:
.LBB9675:
.LBB9670:
.LBB9668:
.LBB9662:
	.loc 13 21 0
	movl	%ebx, 20(%eax)
.LVL3410:
.LBE9662:
.LBE9668:
.LBB9669:
.LBB9665:
	movl	%edi, 4(%eax)
.LVL3411:
.LBE9665:
.LBE9669:
.LBE9670:
.LBE9675:
.LBB9676:
.LBB9674:
	.loc 22 421 0
	call	possibleSwitchTo
.LVL3412:
.LBE9674:
.LBE9676:
.LBE9625:
.LBE9691:
.LBE9694:
	.loc 38 696 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3413:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3414:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3415:
	.p2align 4,,7
	.p2align 3
.L2846:
	.cfi_restore_state
.LBB9695:
.LBB9692:
.LBB9682:
.LBB9683:
	.loc 27 185 0
	movl	68(%esp), %eax
.LBE9683:
.LBE9682:
.LBB9685:
.LBB9686:
	.loc 27 223 0
	andl	$-4, %ecx
	.loc 27 224 0
	orl	$2, %ecx
	movl	%ecx, (%edx)
.LVL3416:
.LBE9686:
.LBE9685:
.LBB9687:
.LBB9684:
	.loc 27 185 0
	movl	%eax, 8(%edx)
.LVL3417:
.LBE9684:
.LBE9687:
.LBB9688:
.LBB9689:
	.loc 27 172 0
	movl	72(%esp), %eax
.LVL3418:
	movl	%eax, 12(%edx)
.LBE9689:
.LBE9688:
.LBE9692:
.LBE9695:
	.loc 38 696 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3419:
	.p2align 4,,7
	.p2align 3
.L2849:
	.cfi_restore_state
.LBB9696:
.LBB9693:
.LBB9690:
.LBB9677:
.LBB9632:
	.loc 30 149 0
	movl	%ebx, %ebp
	jmp	.L2850
	.p2align 4,,7
	.p2align 3
.L2855:
	.loc 30 146 0
	movl	%edi, 28(%esp)
.LVL3420:
	jmp	.L2851
.LVL3421:
	.p2align 4,,7
	.p2align 3
.L2860:
.LBE9632:
.LBE9677:
.LBB9678:
.LBB9679:
	.loc 27 223 0
	andl	$-4, %esi
	movl	%esi, (%edx)
	jmp	.L2854
.LVL3422:
.L2858:
.LBE9679:
.LBE9678:
.LBB9680:
.LBB9650:
.LBB9647:
.LBB9638:
	call	async_endpoint_ptr_set_aepQueue_head.isra.168.part.169
.LVL3423:
.L2857:
.LBE9638:
.LBE9647:
.LBE9650:
.LBE9680:
	.loc 43 57 0
	movl	$__FUNCTION__.6352, 12(%esp)
	movl	$57, 8(%esp)
	movl	$.LC112, 4(%esp)
	movl	$.LC134, (%esp)
	call	_assert_fail
.LVL3424:
.L2859:
.LBB9681:
.LBB9651:
.LBB9648:
.LBB9643:
	call	async_endpoint_ptr_set_aepQueue_tail.isra.170.part.171
.LVL3425:
.LBE9643:
.LBE9648:
.LBE9651:
.LBE9681:
.LBE9690:
.LBE9693:
.LBE9696:
	.cfi_endproc
.LFE569:
	.size	performInvocation_AsyncEndpoint, .-performInvocation_AsyncEndpoint
	.section	.rodata.str1.4
	.align 4
.LC141:
	.string	"APIC: apic_version must be 0x1X\n"
	.align 4
.LC142:
	.string	"APIC: number of LVT entries: %d\n"
	.align 4
.LC143:
	.string	"APIC: number of LVT entries must be >= 3\n"
	.section	.rodata.str1.1
.LC144:
	.string	"(masked & ~0x1) == 0"
	.section	.boot.text
	.p2align 4,,15
	.globl	apic_init
	.type	apic_init, @function
apic_init:
.LFB300:
	.loc 8 105 0
	.cfi_startproc
.LVL3426:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB9723:
.LBB9724:
	.loc 8 63 0
	movl	-65488, %edx
.LVL3427:
.LBE9724:
.LBE9723:
.LBB9725:
.LBB9726:
	.loc 27 687 0
	movzbl	%dl, %eax
.LBE9726:
.LBE9725:
	.loc 8 112 0
	shrl	$4, %eax
	cmpl	$1, %eax
	jne	.L2867
.LVL3428:
.LBB9727:
.LBB9728:
	.loc 27 682 0
	andl	$16711680, %edx
.LVL3429:
	shrl	$16, %edx
.LBE9728:
.LBE9727:
	.loc 8 118 0
	addl	$1, %edx
.LVL3430:
	.loc 8 119 0
	cmpl	$2, %edx
	jbe	.L2868
.LVL3431:
.LBB9729:
.LBB9730:
	.loc 8 69 0
	movl	$11, -64544
.LVL3432:
.LBE9730:
.LBE9729:
	.loc 8 127 0
	movl	32(%esp), %eax
	leal	(%eax,%eax,4), %eax
	addl	%eax, %eax
.LVL3433:
.LBB9731:
.LBB9732:
	.loc 8 69 0
	movl	%eax, -64640
.LVL3434:
.LBE9732:
.LBE9731:
.LBB9733:
.LBB9734:
	movl	$511, -65296
.LVL3435:
.LBE9734:
.LBE9733:
.LBB9735:
.LBB9736:
	.loc 27 387 0
	testl	$-2, 36(%esp)
	jne	.L2869
.LVL3436:
	.loc 27 389 0
	movl	36(%esp), %eax
.LVL3437:
	sall	$16, %eax
.LVL3438:
	.loc 27 409 0
	orb	$7, %ah
.LVL3439:
.LBE9736:
.LBE9735:
.LBB9738:
.LBB9739:
	.loc 8 69 0
	movl	%eax, -64688
.LVL3440:
.LBE9739:
.LBE9738:
	.loc 8 194 0
	movl	$1, %eax
.LVL3441:
.LBB9740:
.LBB9741:
	.loc 8 69 0
	movl	$65536, -64672
.LVL3442:
.LBE9741:
.LBE9740:
.LBB9742:
.LBB9743:
	movl	$131135, -64736
.LBE9743:
.LBE9742:
	.loc 8 195 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL3443:
	.p2align 4,,7
	.p2align 3
.L2867:
	.cfi_restore_state
	.loc 8 113 0
	movl	$.LC141, (%esp)
	call	printf
.LVL3444:
	.loc 8 114 0
	xorl	%eax, %eax
	.loc 8 195 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL3445:
	.p2align 4,,7
	.p2align 3
.L2868:
	.cfi_restore_state
	.loc 8 120 0
	movl	%edx, 4(%esp)
	movl	$.LC142, (%esp)
	call	printf
.LVL3446:
	.loc 8 121 0
	movl	$.LC143, (%esp)
	call	printf
.LVL3447:
	.loc 8 122 0
	xorl	%eax, %eax
	.loc 8 195 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL3448:
.L2869:
	.cfi_restore_state
.LBB9744:
.LBB9737:
	.loc 27 387 0
	movl	$__FUNCTION__.1269, 12(%esp)
	movl	$387, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC144, (%esp)
	call	_assert_fail
.LVL3449:
.LBE9737:
.LBE9744:
	.cfi_endproc
.LFE300:
	.size	apic_init, .-apic_init
	.section	.rodata.str1.1
.LC145:
	.string	"PAT support not found\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	init_pat_msr
	.type	init_pat_msr, @function
init_pat_msr:
.LFB354:
	.loc 4 971 0
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 4 975 0
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	ia32_cpuid_edx
.LVL3450:
	testl	$65536, %eax
	je	.L2874
	.loc 4 979 0
	movl	$631, (%esp)
	call	ia32_rdmsr_low
.LVL3451:
	.loc 4 980 0
	movl	$631, (%esp)
	.loc 4 979 0
	movl	%eax, %ebx
	.loc 4 980 0
	call	ia32_rdmsr_high
.LVL3452:
	.loc 4 989 0
	movl	$631, (%esp)
	.loc 4 980 0
	movl	%eax, %edx
.LVL3453:
.LBB9755:
.LBB9756:
	.loc 27 647 0
	movl	%ebx, %eax
	andl	$-117901064, %eax
.LBE9756:
.LBE9755:
.LBB9758:
.LBB9759:
	.loc 27 639 0
	andl	$-8, %edx
.LBE9759:
.LBE9758:
.LBB9761:
.LBB9757:
	.loc 27 647 0
	orl	$459782, %eax
.LBE9757:
.LBE9761:
.LBB9762:
.LBB9760:
	.loc 27 640 0
	orl	$1, %edx
.LBE9760:
.LBE9762:
	.loc 4 989 0
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	call	ia32_wrmsr
.LVL3454:
	.loc 4 991 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.loc 4 990 0
	movl	$1, %eax
	.loc 4 991 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL3455:
	.p2align 4,,7
	.p2align 3
.L2874:
	.cfi_restore_state
	.loc 4 976 0
	movl	$.LC145, (%esp)
	call	printf
.LVL3456:
	.loc 4 991 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	.loc 4 977 0
	xorl	%eax, %eax
	.loc 4 991 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE354:
	.size	init_pat_msr, .-init_pat_msr
	.p2align 4,,15
	.globl	init_node_cpu
	.type	init_node_cpu, @function
init_node_cpu:
.LFB314:
	.loc 46 491 0
	.cfi_startproc
.LVL3457:
.LBB9773:
.LBB9774:
	.loc 4 893 0
	movl	$63, %eax
.LBE9774:
.LBE9773:
	.loc 46 491 0
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB9776:
.LBB9775:
	.loc 4 893 0
	movw	%ax, gdt_idt_ptr
	.loc 4 894 0
	movl	$ia32KSgdt, %eax
	movw	%ax, gdt_idt_ptr+2
	.loc 4 895 0
	shrl	$16, %eax
	.loc 4 896 0
	movl	$gdt_idt_ptr, (%esp)
	.loc 4 895 0
	movw	%ax, gdt_idt_ptr+4
	.loc 4 896 0
	call	ia32_install_gdt
.LVL3458:
	.loc 4 900 0
	movl	$ia32KSidt, %eax
	.loc 4 899 0
	movl	$2047, %edx
	.loc 4 900 0
	movw	%ax, gdt_idt_ptr+2
	.loc 4 901 0
	shrl	$16, %eax
	.loc 4 902 0
	movl	$gdt_idt_ptr, (%esp)
	.loc 4 899 0
	movw	%dx, gdt_idt_ptr
	.loc 4 901 0
	movw	%ax, gdt_idt_ptr+4
	.loc 4 902 0
	call	ia32_install_idt
.LVL3459:
	.loc 4 905 0
	movl	$0, (%esp)
	call	ia32_install_ldt
.LVL3460:
	.loc 4 908 0
	movl	$40, (%esp)
	call	ia32_install_tss
.LVL3461:
.LBE9775:
.LBE9776:
.LBB9777:
.LBB9778:
	.loc 16 24 0
	movl	$8, 8(%esp)
	movl	$0, 4(%esp)
	movl	$372, (%esp)
	call	ia32_wrmsr
.LVL3462:
	.loc 16 25 0
	movl	$handle_syscall, 8(%esp)
	movl	$0, 4(%esp)
	movl	$374, (%esp)
	call	ia32_wrmsr
.LVL3463:
	.loc 16 26 0
	movl	$ia32KStss+4, 8(%esp)
	movl	$0, 4(%esp)
	movl	$373, (%esp)
	call	ia32_wrmsr
.LVL3464:
.LBE9778:
.LBE9777:
	.loc 46 499 0
	call	init_pat_msr
.LVL3465:
	.loc 46 500 0
	xorl	%edx, %edx
	.loc 46 499 0
	testl	%eax, %eax
	je	.L2876
.LBB9779:
.LBB9780:
	.loc 15 92 0
	call	read_cr4
.LVL3466:
	orb	$2, %ah
	movl	%eax, (%esp)
	call	write_cr4
.LVL3467:
.LBB9781:
.LBB9782:
	.loc 2 41 0
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
.LVL3468:
#NO_APP
.LBE9782:
.LBE9781:
	.loc 15 97 0
	andl	$-47, %eax
.LVL3469:
	orl	$42, %eax
.LVL3470:
.LBB9783:
.LBB9784:
	.loc 2 47 0
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
.LBE9784:
.LBE9783:
.LBE9780:
.LBE9779:
	.loc 46 507 0
	movl	36(%esp), %eax
.LVL3471:
	movl	%eax, 4(%esp)
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	apic_init
.LVL3472:
	xorl	%edx, %edx
	testl	%eax, %eax
	setne	%dl
.L2876:
	.loc 46 512 0
	movl	%edx, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE314:
	.size	init_node_cpu, .-init_node_cpu
	.section	.rodata.str1.1
.LC146:
	.string	"Deriving an unmapped PT cap"
	.section	.rodata.str1.4
	.align 4
.LC147:
	.string	"Deriving a PD cap without an assigned ASID"
	.text
	.p2align 4,,15
	.globl	Arch_deriveCap
	.type	Arch_deriveCap, @function
Arch_deriveCap:
.LFB410:
	.loc 19 29 0
	.cfi_startproc
.LVL3473:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 19 29 0
	movl	72(%esp), %edx
	movl	76(%esp), %ecx
.LVL3474:
	movl	64(%esp), %ebx
.LBB9807:
.LBB9808:
	.loc 27 872 0
	movl	%edx, %edi
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %esi
.LVL3475:
	cmpl	$14, %edi
	cmove	%esi, %eax
.LVL3476:
.LBE9808:
.LBE9807:
	.loc 19 32 0
	cmpl	$11, %eax
	movl	%ecx, 28(%esp)
.LVL3477:
	ja	.L2883
	movl	%edx, %ebp
	jmp	*.L2885(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L2885:
	.long	.L2883
	.long	.L2884
	.long	.L2883
	.long	.L2886
	.long	.L2883
	.long	.L2887
	.long	.L2883
	.long	.L2889
	.long	.L2883
	.long	.L2889
	.long	.L2883
	.long	.L2889
	.text
	.p2align 4,,7
	.p2align 3
.L2889:
.LVL3478:
	.loc 19 73 0
	movl	$0, (%ebx)
	.loc 19 96 0
	movl	%ebx, %eax
	.loc 19 73 0
	movl	%edx, 4(%ebx)
	movl	%ecx, 8(%ebx)
	.loc 19 96 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL3479:
	.p2align 4,,7
	.p2align 3
.L2887:
	.cfi_restore_state
.LBB9809:
.LBB9810:
	.loc 27 1654 0
	andl	$15, %edx
.LVL3480:
	cmpl	$5, %edx
	jne	.L2900
.LBE9810:
.LBE9809:
	.loc 19 48 0
	xorl	%eax, %eax
	.loc 19 46 0
	andl	$65536, %ecx
.LVL3481:
	je	.L2901
.LVL3482:
.L2894:
	.loc 19 55 0
	movl	%eax, (%ebx)
	movl	28(%esp), %eax
.LVL3483:
	movl	%ebp, 4(%ebx)
	movl	%eax, 8(%ebx)
	.loc 19 96 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3484:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3485:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3486:
	ret	$4
.LVL3487:
	.p2align 4,,7
	.p2align 3
.L2884:
	.cfi_restore_state
.LBB9812:
.LBB9813:
.LBB9814:
	.loc 27 1422 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L2902
.LVL3488:
.LBE9814:
.LBE9813:
.LBB9818:
.LBB9819:
	.loc 27 1480 0
	andl	$67108863, %edx
.LVL3489:
.LBE9819:
.LBE9818:
.LBB9821:
.LBB9815:
	.loc 27 1427 0
	andl	$-1072693249, %ecx
.LVL3490:
.LBE9815:
.LBE9821:
.LBE9812:
	.loc 19 63 0
	movl	$0, (%ebx)
	.loc 19 96 0
	movl	%ebx, %eax
.LBB9825:
.LBB9822:
.LBB9820:
	.loc 27 1480 0
	movl	%edx, 4(%ebx)
.LBE9820:
.LBE9822:
.LBB9823:
.LBB9816:
	.loc 27 1427 0
	movl	%ecx, 8(%ebx)
.LBE9816:
.LBE9823:
.LBE9825:
	.loc 19 96 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3491:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3492:
	ret	$4
.LVL3493:
	.p2align 4,,7
	.p2align 3
.L2886:
	.cfi_restore_state
.LBB9826:
.LBB9827:
	.loc 27 1546 0
	andl	$15, %edx
.LVL3494:
	cmpl	$3, %edx
	jne	.L2903
.LBE9827:
.LBE9826:
	.loc 19 36 0
	xorl	%eax, %eax
	.loc 19 34 0
	andl	$67108864, %ecx
.LVL3495:
	jne	.L2894
	.loc 19 38 0
	movl	ksCurThread, %eax
.LVL3496:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$38, 8(%esp)
	movl	$__func__.5625, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL3497:
	movl	$.LC146, (%esp)
.LVL3498:
.L2899:
	.loc 19 50 0
	call	printf
.LVL3499:
.LBB9829:
.LBB9830:
	.loc 27 896 0
	xorl	%ebp, %ebp
.LVL3500:
.LBE9830:
.LBE9829:
	.loc 19 50 0
	movl	$.LC20, (%esp)
	call	printf
.LVL3501:
	.loc 19 53 0
	movl	$3, %eax
	.loc 19 51 0
	movl	$3, current_syscall_error+24
.LVL3502:
.LBB9832:
.LBB9831:
	.loc 27 896 0
	movl	$0, 28(%esp)
	jmp	.L2894
.LVL3503:
	.p2align 4,,7
	.p2align 3
.L2883:
.LBE9831:
.LBE9832:
	.loc 19 94 0
	movl	$__func__.5625, 12(%esp)
	movl	$94, 8(%esp)
	movl	$.LC31, 4(%esp)
	movl	$.LC56, (%esp)
	call	_fail
.LVL3504:
	.p2align 4,,7
	.p2align 3
.L2901:
	.loc 19 50 0
	movl	ksCurThread, %eax
.LVL3505:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$50, 8(%esp)
	movl	$__func__.5625, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL3506:
	movl	$.LC147, (%esp)
	jmp	.L2899
.LVL3507:
.L2900:
.LBB9833:
.LBB9811:
	call	cap_page_directory_cap_get_capPDIsMapped.part.69
.LVL3508:
.L2903:
.LBE9811:
.LBE9833:
.LBB9834:
.LBB9828:
	call	cap_page_table_cap_get_capPTIsMapped.part.110
.LVL3509:
.L2902:
.LBE9828:
.LBE9834:
.LBB9835:
.LBB9824:
.LBB9817:
	.loc 27 1422 0
	movl	$__FUNCTION__.1737, 12(%esp)
	movl	$1423, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC51, (%esp)
	call	_assert_fail
.LVL3510:
.LBE9817:
.LBE9824:
.LBE9835:
	.cfi_endproc
.LFE410:
	.size	Arch_deriveCap, .-Arch_deriveCap
	.p2align 4,,15
	.globl	deriveCap
	.type	deriveCap, @function
deriveCap:
.LFB557:
	.loc 38 58 0
	.cfi_startproc
.LVL3511:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 38 58 0
	movl	16(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	20(%ebp), %edi
.LVL3512:
.LBB9851:
.LBB9852:
.LBB9853:
.LBB9854:
	.loc 27 872 0
	movl	%eax, %edx
	movl	%eax, %esi
.LVL3513:
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L2905
.LBE9854:
.LBE9853:
.LBE9852:
.LBE9851:
.LBB9855:
.LBB9856:
	.loc 27 873 0
	movl	%eax, %edx
	andl	$15, %edx
.LBE9856:
.LBE9855:
	.loc 38 61 0
	testb	$1, %al
	jne	.L2906
.L2910:
	.loc 38 65 0
	cmpl	$8, %edx
	je	.L2912
	ja	.L2913
	cmpl	$2, %edx
	.p2align 4,,5
	jne	.L2915
.LVL3514:
.LBB9858:
.LBB9859:
.LBB9860:
.LBB9861:
	.loc 27 767 0
	movl	12(%ebp), %eax
.LVL3515:
.LBE9861:
.LBE9860:
	.loc 26 874 0
	xorl	%edx, %edx
.LBB9863:
.LBB9862:
	.loc 27 767 0
	movl	12(%eax), %eax
	movl	%eax, -28(%ebp)
.LBE9862:
.LBE9863:
	.loc 26 874 0
	andl	$-8, %eax
	je	.L2911
.LBB9864:
	.loc 26 878 0
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%edx, -28(%ebp)
	movl	%eax, (%esp)
	call	isMDBParentOf
.LVL3516:
	movl	$0, %edx
	testl	%eax, %eax
	je	.L2911
	.loc 26 879 0
	movl	$9, current_syscall_error+24
.LBE9864:
.LBE9859:
.LBE9858:
.LBB9867:
.LBB9868:
	.loc 27 896 0
	xorl	%edi, %edi
.LVL3517:
	xorl	%esi, %esi
.LVL3518:
.LBE9868:
.LBE9867:
.LBB9869:
.LBB9866:
.LBB9865:
	.loc 26 880 0
	movb	$3, %dl
	jmp	.L2911
.LVL3519:
	.p2align 4,,7
	.p2align 3
.L2913:
.LBE9865:
.LBE9866:
.LBE9869:
	.loc 38 65 0
	cmpl	$14, %edx
	je	.L2912
	cmpl	$46, %edx
	je	.L2912
.L2915:
	.loc 38 91 0
	xorl	%edx, %edx
.LVL3520:
.L2911:
	.loc 38 95 0
	movl	%edx, (%ebx)
	.loc 38 96 0
	movl	%ebx, %eax
	.loc 38 95 0
	movl	%esi, 4(%ebx)
	movl	%edi, 8(%ebx)
	.loc 38 96 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
.LVL3521:
	popl	%edi
	.cfi_restore 7
.LVL3522:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
.LVL3523:
	.p2align 4,,7
	.p2align 3
.L2912:
	.cfi_restore_state
.LBB9870:
.LBB9871:
	.loc 27 896 0
	xorl	%edi, %edi
.LVL3524:
	xorl	%esi, %esi
.LBE9871:
.LBE9870:
	.loc 38 67 0
	xorl	%edx, %edx
	jmp	.L2911
.LVL3525:
	.p2align 4,,7
	.p2align 3
.L2905:
	.loc 38 61 0
	testb	$1, %al
.LBB9872:
.LBB9857:
	.loc 27 874 0
	movzbl	%al, %edx
.LBE9857:
.LBE9872:
	.loc 38 61 0
	je	.L2910
.L2906:
	.loc 38 62 0
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
.LVL3526:
	movl	%edi, 12(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	Arch_deriveCap
.LVL3527:
	.loc 38 96 0
	movl	%ebx, %eax
	.loc 38 62 0
	subl	$4, %esp
	.loc 38 96 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
.LVL3528:
	popl	%edi
	.cfi_restore 7
.LVL3529:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE557:
	.size	deriveCap, .-deriveCap
	.section	.rodata.str1.1
.LC148:
	.string	"((~0x180 >> 7) & v) == 0"
	.text
	.p2align 4,,15
	.globl	doNormalTransfer
	.type	doNormalTransfer, @function
doNormalTransfer:
.LFB471:
	.loc 22 158 0
	.cfi_startproc
.LVL3530:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
.LVL3531:
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$108, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
.LBB9927:
.LBB9928:
	.loc 13 27 0
	movl	8(%ebp), %eax
.LBE9928:
.LBE9927:
	.loc 22 158 0
	movl	32(%ebp), %edx
.LBB9930:
.LBB9929:
	.loc 13 27 0
	movl	16(%eax), %edi
.LVL3532:
.LBE9929:
.LBE9930:
.LBB9931:
.LBB9932:
	.loc 28 88 0
	movl	%edi, %ebx
	andl	$127, %ebx
	cmpl	$120, %ebx
	jbe	.L2933
.LVL3533:
.LBB9933:
.LBB9934:
	.loc 14 81 0
	andl	$-128, %edi
.LVL3534:
	.loc 14 82 0
	movl	$120, %ebx
	.loc 14 83 0
	orl	$120, %edi
.LVL3535:
.L2933:
.LBE9934:
.LBE9933:
.LBE9932:
.LBE9931:
	.loc 22 166 0
	movl	24(%ebp), %eax
.LVL3536:
	testl	%eax, %eax
	jne	.L2979
	.loc 22 173 0
	movl	current_extra_caps+4, %eax
	.loc 22 174 0
	xorl	%ecx, %ecx
.LBB9935:
.LBB9936:
	.loc 30 246 0
	testl	%ebx, %ebx
.LBE9936:
.LBE9935:
	.loc 22 173 0
	movl	%eax, -56(%ebp)
	movl	current_extra_caps+8, %eax
	movl	%eax, -52(%ebp)
.LVL3537:
.LBB9954:
.LBB9951:
	.loc 30 246 0
	je	.L2936
.LVL3538:
.L2981:
.LBB9937:
.LBB9938:
	.loc 13 27 0
	movl	8(%ebp), %eax
.LBE9938:
.LBE9937:
	.loc 30 246 0
	cmpl	$1, %ebx
.LBB9942:
.LBB9943:
	.loc 13 21 0
	movl	28(%ebp), %esi
.LBE9943:
.LBE9942:
.LBB9946:
.LBB9939:
	.loc 13 27 0
	movl	20(%eax), %eax
.LVL3539:
.LBE9939:
.LBE9946:
.LBB9947:
.LBB9944:
	.loc 13 21 0
	movl	%eax, 20(%esi)
.LVL3540:
.LBE9944:
.LBE9947:
	.loc 30 246 0
	je	.L2936
.LVL3541:
.LBB9948:
.LBB9940:
	.loc 13 27 0
	movl	8(%ebp), %eax
.LVL3542:
.LBE9940:
.LBE9948:
	.loc 30 251 0
	testl	%edx, %edx
	sete	-88(%ebp)
.LBB9949:
.LBB9941:
	.loc 13 27 0
	movl	24(%eax), %eax
.LVL3543:
.LBE9941:
.LBE9949:
.LBB9950:
.LBB9945:
	.loc 13 21 0
	movl	%eax, 24(%esi)
.LVL3544:
.LBE9945:
.LBE9950:
	.loc 30 251 0
	je	.L2957
	movl	12(%ebp), %esi
.LVL3545:
	testl	%esi, %esi
	je	.L2957
	.loc 30 256 0
	cmpl	$2, %ebx
	jbe	.L2957
	.loc 30 246 0
	movl	12(%ebp), %esi
	movl	$2, %eax
.LVL3546:
	movl	%ecx, -84(%ebp)
.LVL3547:
	.p2align 4,,7
	.p2align 3
.L2938:
	.loc 30 257 0
	addl	$1, %eax
.LVL3548:
	movl	(%esi,%eax,4), %ecx
	.loc 30 256 0
	cmpl	%ebx, %eax
	.loc 30 257 0
	movl	%ecx, (%edx,%eax,4)
.LVL3549:
	.loc 30 256 0
	jne	.L2938
	movl	-84(%ebp), %ecx
.LVL3550:
.L2937:
	movl	-56(%ebp), %eax
.LBE9951:
.LBE9954:
.LBB9955:
.LBB9956:
.LBB9957:
.LBB9958:
	.loc 14 53 0
	andl	$-3969, %edi
.LVL3551:
.LBE9958:
.LBE9957:
	.loc 22 213 0
	testl	%ecx, %ecx
	movl	%ecx, -60(%ebp)
	movl	%ecx, -48(%ebp)
	movl	%eax, -44(%ebp)
	movl	-52(%ebp), %eax
	movl	%eax, -40(%ebp)
.LVL3552:
	jne	.L2980
.LVL3553:
.L2939:
.LBE9956:
.LBE9955:
.LBB9997:
.LBB9998:
	.loc 14 82 0
	movl	28(%ebp), %eax
	.loc 14 81 0
	andl	$-128, %edi
.LVL3554:
	.loc 14 82 0
	orl	%ebx, %edi
.LVL3555:
.LBE9998:
.LBE9997:
.LBB10000:
.LBB10001:
	.loc 13 21 0
	movl	28(%ebp), %esi
.LBE10001:
.LBE10000:
.LBB10003:
.LBB9999:
	.loc 14 82 0
	movl	%edi, 16(%eax)
.LVL3556:
.LBE9999:
.LBE10003:
.LBB10004:
.LBB10002:
	.loc 13 21 0
	movl	20(%ebp), %eax
	movl	%eax, 4(%esi)
.LBE10002:
.LBE10004:
	.loc 22 185 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
.LVL3557:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL3558:
	.p2align 4,,7
	.p2align 3
.L2957:
	.cfi_restore_state
.LBB10005:
.LBB9952:
	.loc 30 246 0
	movl	$2, %ebx
.LVL3559:
	jmp	.L2937
.LVL3560:
	.p2align 4,,7
	.p2align 3
.L2979:
.LBE9952:
.LBE10005:
	.loc 22 167 0
	movl	12(%ebp), %eax
	movl	%edi, 8(%esp)
.LVL3561:
	movl	%edx, -84(%ebp)
.LVL3562:
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	lookupExtraCaps
.LVL3563:
	.loc 22 168 0
	movl	current_extra_caps+4, %ecx
	movl	-84(%ebp), %edx
	movl	%ecx, -56(%ebp)
	movl	current_extra_caps+8, %ecx
	movl	%ecx, -52(%ebp)
.LVL3564:
	.loc 22 170 0
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmove	current_extra_caps, %ecx
.LVL3565:
.LBB10006:
.LBB9953:
	.loc 30 246 0
	testl	%ebx, %ebx
	jne	.L2981
.LVL3566:
.L2936:
	.loc 30 251 0
	testl	%edx, %edx
	sete	-88(%ebp)
	jmp	.L2937
.LVL3567:
	.p2align 4,,7
	.p2align 3
.L2980:
.LBE9953:
.LBE10006:
.LBB10007:
.LBB9996:
	.loc 22 213 0
	cmpb	$0, -88(%ebp)
	jne	.L2939
	.loc 22 217 0
	movl	28(%ebp), %eax
	.loc 22 219 0
	xorl	%esi, %esi
	.loc 22 217 0
	movl	%edx, 4(%esp)
	movl	%edx, -92(%ebp)
	movl	%eax, (%esp)
	call	getReceiveSlots
.LVL3568:
	movl	-92(%ebp), %edx
	movl	%ebx, -88(%ebp)
	movl	%esi, %ebx
	movl	%edx, 32(%ebp)
	movl	%eax, -84(%ebp)
.LVL3569:
.L2940:
	.loc 22 219 0
	movl	-48(%ebp,%ebx,4), %esi
	testl	%esi, %esi
	je	.L2951
.LVL3570:
.LBB9959:
	.loc 22 221 0
	movl	(%esi), %eax
	movl	4(%esi), %ecx
.LVL3571:
.LBB9960:
.LBB9961:
	.loc 27 872 0
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L2941
	.loc 27 873 0
	movl	%eax, %edx
	andl	$15, %edx
.L2942:
.LBE9961:
.LBE9960:
	.loc 22 223 0
	cmpl	$4, %edx
	je	.L2982
.L2943:
.LBB9963:
	.loc 22 236 0
	cmpl	$0, -84(%ebp)
	je	.L2951
	.loc 22 240 0
	cmpl	$0, 36(%ebp)
	.loc 22 241 0
	movl	%eax, 8(%esp)
.LVL3572:
	movl	%ecx, 12(%esp)
	.loc 22 240 0
	je	.L2947
.LVL3573:
	.loc 22 241 0
	leal	-80(%ebp), %eax
.LVL3574:
	movl	%eax, (%esp)
	movl	$6, 4(%esp)
	call	maskCapRights
.LVL3575:
	movl	-80(%ebp), %eax
	pushl	%edx
	movl	-76(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
.LVL3576:
.L2947:
	.loc 22 243 0
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	%esi, 4(%esp)
	call	deriveCap
.LVL3577:
	.loc 22 246 0
	cmpl	$0, -36(%ebp)
	.loc 22 243 0
	pushl	%eax
	.loc 22 246 0
	jne	.L2951
	.loc 22 249 0
	movl	-32(%ebp), %eax
.LVL3578:
.LBB9964:
.LBB9965:
	.loc 27 872 0
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L2949
	.loc 27 873 0
	andl	$15, %eax
.LVL3579:
.L2950:
.LBE9965:
.LBE9964:
	.loc 22 249 0
	testl	%eax, %eax
	je	.L2951
	.loc 22 253 0
	movl	-84(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%esi, 8(%esp)
.LVL3580:
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
.LVL3581:
	.loc 22 255 0
	movl	$0, -84(%ebp)
.LVL3582:
.L2945:
.LBE9963:
.LBE9959:
	.loc 22 219 0
	addl	$1, %ebx
.LVL3583:
	cmpl	$3, %ebx
	jne	.L2940
	movl	%ebx, %esi
.LVL3584:
	movl	-88(%ebp), %ebx
.LVL3585:
.L2952:
.LBB9988:
.LBB9989:
	.loc 14 68 0
	sall	$7, %esi
.LVL3586:
	.loc 14 67 0
	movl	%edi, %eax
	.loc 14 68 0
	movl	%esi, %edi
.LVL3587:
	.loc 14 67 0
	andl	$-385, %eax
.LVL3588:
	.loc 14 68 0
	andl	$384, %edi
	orl	%eax, %edi
.LVL3589:
	jmp	.L2939
.LVL3590:
.L2982:
.LBE9989:
.LBE9988:
.LBB9993:
.LBB9968:
.LBB9969:
	.loc 27 1088 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$4, %edx
	jne	.L2983
	.loc 27 1091 0
	movl	%eax, %edx
	andl	$-16, %edx
.LBE9969:
.LBE9968:
	.loc 22 223 0
	cmpl	%edx, 16(%ebp)
	jne	.L2943
.LVL3591:
.LBB9971:
.LBB9972:
	.loc 27 1011 0
	movl	32(%ebp), %edx
	movl	%ecx, %eax
.LVL3592:
.LBE9972:
.LBE9971:
	.loc 22 231 0
	movl	%ebx, %ecx
.LVL3593:
.LBB9974:
.LBB9973:
	.loc 27 1011 0
	shrl	$3, %eax
.LVL3594:
	movl	%eax, 488(%edx,%ebx,4)
.LVL3595:
.LBE9973:
.LBE9974:
.LBB9975:
.LBB9976:
	.loc 14 53 0
	movl	%edi, %edx
.LBE9976:
.LBE9975:
	.loc 22 231 0
	movl	$1, %eax
.LVL3596:
.LBB9979:
.LBB9980:
	.loc 14 46 0
	andl	$3584, %edi
.LVL3597:
.LBE9980:
.LBE9979:
.LBB9982:
.LBB9977:
	.loc 14 53 0
	andb	$241, %dh
.LVL3598:
.LBE9977:
.LBE9982:
	.loc 22 231 0
	sall	%cl, %eax
.LBB9983:
.LBB9981:
	.loc 14 46 0
	shrl	$9, %edi
.LBE9981:
.LBE9983:
	.loc 22 230 0
	orl	%eax, %edi
.LBB9984:
.LBB9978:
	.loc 14 54 0
	sall	$9, %edi
	andl	$3584, %edi
	orl	%edx, %edi
.LVL3599:
	jmp	.L2945
.LVL3600:
.L2941:
.LBE9978:
.LBE9984:
.LBB9985:
.LBB9962:
	.loc 27 874 0
	movzbl	%al, %edx
	jmp	.L2942
.LVL3601:
.L2951:
	movl	%ebx, %esi
	movl	-88(%ebp), %ebx
.LVL3602:
.LBE9962:
.LBE9985:
.LBE9993:
.LBB9994:
.LBB9992:
	.loc 14 66 0
	testl	$-4, %esi
	je	.L2952
.LVL3603:
.LBB9990:
.LBB9991:
	movl	$__FUNCTION__.991, 12(%esp)
	movl	$66, 8(%esp)
	movl	$.LC69, 4(%esp)
	movl	$.LC148, (%esp)
	call	_assert_fail
.LVL3604:
.L2949:
.LBE9991:
.LBE9990:
.LBE9992:
.LBE9994:
.LBB9995:
.LBB9986:
.LBB9967:
.LBB9966:
	.loc 27 874 0
	movzbl	%al, %eax
.LVL3605:
	jmp	.L2950
.LVL3606:
.L2983:
.LBE9966:
.LBE9967:
.LBE9986:
.LBB9987:
.LBB9970:
	call	cap_endpoint_cap_get_capEPPtr.isra.65.part.66
.LVL3607:
.LBE9970:
.LBE9987:
.LBE9995:
.LBE9996:
.LBE10007:
	.cfi_endproc
.LFE471:
	.size	doNormalTransfer, .-doNormalTransfer
	.p2align 4,,15
	.globl	doIPCTransfer
	.type	doIPCTransfer, @function
doIPCTransfer:
.LFB469:
	.loc 22 114 0
	.cfi_startproc
.LVL3608:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 22 114 0
	movl	92(%esp), %ebx
	movl	84(%esp), %eax
	movl	80(%esp), %edi
	.loc 22 117 0
	movl	$1, (%esp)
	.loc 22 114 0
	movl	88(%esp), %esi
	movl	%ebx, 40(%esp)
	movl	96(%esp), %ebx
	movl	%eax, 36(%esp)
	movl	100(%esp), %ebp
	.loc 22 117 0
	movl	%ebx, 4(%esp)
	call	lookupIPCBuffer
.LVL3609:
	.loc 22 119 0
	testb	$7, 604(%edi)
	jne	.L2985
	.loc 22 120 0
	movl	%edi, 4(%esp)
	movl	$0, (%esp)
	movl	%eax, 44(%esp)
	call	lookupIPCBuffer
.LVL3610:
	.loc 22 121 0
	movl	44(%esp), %ecx
	movl	%ebx, 20(%esp)
	movl	36(%esp), %edx
	movl	40(%esp), %ebx
	movl	%ebp, 28(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, (%esp)
	movl	%ebx, 16(%esp)
	movl	%ecx, 24(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	call	doNormalTransfer
.LVL3611:
	.loc 22 126 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3612:
.L2985:
	.cfi_restore_state
	.loc 22 124 0
	movl	%ebx, 88(%esp)
	movl	%edi, 84(%esp)
	movl	%esi, 80(%esp)
	movl	%eax, 92(%esp)
	.loc 22 126 0
	addl	$60, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 22 124 0
	jmp	doFaultTransfer
.LVL3613:
	.cfi_endproc
.LFE469:
	.size	doIPCTransfer, .-doIPCTransfer
	.section	.rodata.str1.1
.LC149:
	.string	"((~0x4 >> 2) & v) == 0"
	.text
	.p2align 4,,15
	.globl	sendIPC
	.type	sendIPC, @function
sendIPC:
.LFB537:
	.loc 44 42 0
	.cfi_startproc
.LVL3614:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	.loc 44 42 0
	movl	100(%esp), %eax
	movl	116(%esp), %esi
	movl	96(%esp), %ecx
	movl	112(%esp), %ebx
	movl	%eax, 48(%esp)
	movl	104(%esp), %eax
	movl	%eax, 52(%esp)
	movl	108(%esp), %eax
	movl	%eax, 44(%esp)
	.loc 44 41 0
	movl	(%esi), %eax
.LVL3615:
.LBB10074:
.LBB10075:
	.loc 27 451 0
	movl	%eax, %edx
	andl	$3, %edx
.LBE10075:
.LBE10074:
	.loc 44 43 0
	cmpl	$1, %edx
	jbe	.L2991
	cmpl	$2, %edx
	jne	.L2989
.LVL3616:
	.loc 44 22 0
	movl	4(%esi), %edi
.LBB10076:
.LBB10077:
.LBB10078:
.LBB10079:
.LBB10080:
	.loc 27 438 0
	movl	%eax, %ecx
	andl	$-16, %ecx
	movl	%ecx, 56(%esp)
.LBE10080:
.LBE10079:
.LBE10078:
.LBE10077:
.LBE10076:
	.loc 44 22 0
	movl	%edi, 60(%esp)
.LVL3617:
.LBB10119:
	.loc 44 81 0
	andl	$-16, %edi
.LVL3618:
	je	.L3024
.LVL3619:
.LBB10081:
.LBB10082:
	.loc 30 146 0
	movl	652(%edi), %ecx
.LVL3620:
	.loc 30 147 0
	movl	648(%edi), %edx
	.loc 30 146 0
	testl	%ecx, %ecx
	je	.L3001
	.loc 30 147 0
	movl	%edx, 648(%ecx)
	movl	648(%edi), %ebp
	movl	%edi, %edx
.LVL3621:
.L3002:
	.loc 30 152 0
	testl	%ebp, %ebp
	je	.L3013
	.loc 30 153 0
	movl	%ecx, 652(%ebp)
.LVL3622:
.L3003:
.LBE10082:
.LBE10081:
.LBB10084:
.LBB10085:
.LBB10086:
.LBB10087:
	.loc 27 431 0
	testb	$15, %dl
	jne	.L3004
	.loc 27 432 0
	movl	60(%esp), %ebp
	.loc 27 433 0
	movl	%edx, %ecx
	andl	$-16, %ecx
	.loc 27 432 0
	andl	$15, %ebp
	.loc 27 433 0
	orl	%ebp, %ecx
	movl	%ecx, 4(%esi)
.LVL3623:
.LBE10087:
.LBE10086:
.LBB10088:
.LBB10089:
	.loc 27 444 0
	movl	56(%esp), %ecx
	testb	$15, %cl
	jne	.L3005
	.loc 27 446 0
	andl	$-16, %ecx
	.loc 27 445 0
	andl	$15, %eax
.LVL3624:
	.loc 27 446 0
	orl	%eax, %ecx
.LBE10089:
.LBE10088:
.LBE10085:
.LBE10084:
	.loc 44 87 0
	testl	%edx, %edx
.LBB10093:
.LBB10092:
.LBB10091:
.LBB10090:
	.loc 27 446 0
	movl	%ecx, (%esi)
.LVL3625:
.LBE10090:
.LBE10091:
.LBE10092:
.LBE10093:
	.loc 44 87 0
	je	.L3025
.L3006:
.LBB10094:
.LBB10095:
	.loc 27 583 0
	movl	596(%edi), %ebp
.LBE10095:
.LBE10094:
.LBB10097:
.LBB10098:
	.loc 22 117 0
	movl	%edi, 4(%esp)
	movl	$1, (%esp)
	call	lookupIPCBuffer
.LVL3626:
.LBE10098:
.LBE10097:
.LBB10101:
.LBB10096:
	.loc 27 583 0
	andl	$1, %ebp
.LVL3627:
.LBE10096:
.LBE10101:
.LBB10102:
.LBB10099:
	.loc 22 119 0
	testb	$7, 604(%ebx)
	jne	.L3007
	.loc 22 120 0
	movl	%ebx, 4(%esp)
	movl	$0, (%esp)
	movl	%eax, 56(%esp)
.LVL3628:
	call	lookupIPCBuffer
.LVL3629:
	.loc 22 121 0
	movl	44(%esp), %ecx
	movl	56(%esp), %edx
	movl	%ebp, 28(%esp)
	movl	%edi, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	52(%esp), %ecx
	movl	%edx, 24(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, 12(%esp)
	movl	%ebx, (%esp)
	call	doNormalTransfer
.LVL3630:
.L3008:
.LBE10099:
.LBE10102:
.LBB10103:
.LBB10104:
.LBB10105:
.LBB10106:
	.loc 27 626 0
	movl	592(%edi), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$1, %eax
	movl	%eax, 592(%edi)
.LBE10106:
.LBE10105:
	.loc 22 428 0
	movl	%edi, (%esp)
	call	scheduleTCB
.LVL3631:
.LBE10104:
.LBE10103:
.LBB10107:
.LBB10108:
	.loc 22 415 0
	movl	$1, %edx
	movl	%edi, %eax
	call	possibleSwitchTo
.LVL3632:
.LBE10108:
.LBE10107:
	.loc 44 99 0
	movl	48(%esp), %edx
	testl	%edx, %edx
	je	.L3026
	.loc 44 101 0
	testl	%ebp, %ebp
	je	.L3027
.L3011:
.LVL3633:
.LBB10109:
.LBB10110:
.LBB10111:
.LBB10112:
	.loc 27 626 0
	andl	$-16, 592(%ebx)
.LBE10112:
.LBE10111:
	.loc 22 428 0
	movl	%ebx, 96(%esp)
.LBE10110:
.LBE10109:
.LBE10119:
	.loc 44 111 0
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3634:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3635:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3636:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3637:
.LBB10120:
.LBB10114:
.LBB10113:
	.loc 22 428 0
	jmp	scheduleTCB
.LVL3638:
	.p2align 4,,7
	.p2align 3
.L2991:
	.cfi_restore_state
.LBE10113:
.LBE10114:
.LBE10120:
	.loc 44 46 0
	testl	%ecx, %ecx
	je	.L2989
.LVL3639:
.LBB10121:
.LBB10122:
.LBB10123:
	.loc 27 626 0
	movl	592(%ebx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$4, %eax
.LBE10123:
.LBE10122:
.LBB10125:
.LBB10126:
	.loc 27 607 0
	testl	$15, %esi
.LBE10126:
.LBE10125:
.LBB10130:
.LBB10124:
	.loc 27 627 0
	movl	%eax, 592(%ebx)
.LVL3640:
.LBE10124:
.LBE10130:
.LBB10131:
.LBB10127:
	.loc 27 607 0
	jne	.L3028
	.loc 27 609 0
	movl	%esi, %eax
.LBE10127:
.LBE10131:
.LBB10132:
.LBB10133:
	.loc 27 539 0
	movl	52(%esp), %edx
.LBE10133:
.LBE10132:
.LBB10136:
.LBB10128:
	.loc 27 609 0
	andl	$-16, %eax
	orl	$4, %eax
	movl	%eax, 592(%ebx)
.LVL3641:
.LBE10128:
.LBE10136:
.LBB10137:
.LBB10134:
	.loc 27 538 0
	movl	600(%ebx), %eax
	.loc 27 539 0
	sall	$3, %edx
.LVL3642:
	.loc 27 538 0
	andl	$7, %eax
	.loc 27 539 0
	orl	%edx, %eax
.LBE10134:
.LBE10137:
.LBB10138:
.LBB10139:
	.loc 27 550 0
	testl	$-2, 44(%esp)
.LBE10139:
.LBE10138:
.LBB10143:
.LBB10135:
	.loc 27 539 0
	movl	%eax, 600(%ebx)
.LVL3643:
.LBE10135:
.LBE10143:
.LBB10144:
.LBB10140:
	.loc 27 550 0
	jne	.L3029
	.loc 27 552 0
	movl	44(%esp), %edx
	.loc 27 551 0
	andl	$-5, %eax
	.loc 27 552 0
	sall	$2, %edx
	andl	$4, %edx
	orl	%edx, %eax
.LBE10140:
.LBE10144:
.LBB10145:
.LBB10146:
	.loc 27 563 0
	testl	$-2, 48(%esp)
.LBE10146:
.LBE10145:
.LBB10149:
.LBB10141:
	.loc 27 552 0
	movl	%eax, 600(%ebx)
.LVL3644:
.LBE10141:
.LBE10149:
.LBB10150:
.LBB10147:
	.loc 27 563 0
	jne	.L3030
	.loc 27 565 0
	movl	48(%esp), %edx
	.loc 27 564 0
	andl	$-3, %eax
	.loc 27 565 0
	addl	%edx, %edx
	andl	$2, %edx
	orl	%edx, %eax
	movl	%eax, 600(%ebx)
.LBE10147:
.LBE10150:
	.loc 44 61 0
	movl	%ebx, (%esp)
	call	scheduleTCB
.LVL3645:
.LBE10121:
	.loc 44 22 0
	movl	4(%esi), %ecx
.LVL3646:
	movl	(%esi), %eax
.LVL3647:
.LBB10190:
.LBB10151:
.LBB10152:
	.loc 30 130 0
	movl	%ecx, %edx
.LBE10152:
.LBE10151:
.LBB10156:
.LBB10157:
.LBB10158:
.LBB10159:
	.loc 27 438 0
	movl	%eax, %edi
	andl	$-16, %edi
.LVL3648:
.LBE10159:
.LBE10158:
.LBE10157:
.LBE10156:
.LBB10160:
.LBB10153:
	.loc 30 130 0
	andl	$-16, %edx
.LVL3649:
	je	.L3012
	.loc 30 133 0
	movl	%ebx, 648(%edi)
.LVL3650:
.L2997:
	.loc 30 135 0
	movl	%edi, 652(%ebx)
.LBE10153:
.LBE10160:
.LBB10161:
.LBB10162:
	.loc 27 458 0
	movl	%eax, %edi
.LVL3651:
	andl	$-4, %edi
	.loc 27 459 0
	orl	$1, %edi
.LBE10162:
.LBE10161:
.LBB10164:
.LBB10165:
.LBB10166:
.LBB10167:
	.loc 27 431 0
	testb	$15, %dl
.LBE10167:
.LBE10166:
.LBE10165:
.LBE10164:
.LBB10182:
.LBB10154:
	.loc 30 136 0
	movl	$0, 648(%ebx)
.LVL3652:
.LBE10154:
.LBE10182:
.LBB10183:
.LBB10163:
	.loc 27 459 0
	movl	%edi, (%esi)
.LVL3653:
.LBE10163:
.LBE10183:
.LBB10184:
.LBB10180:
.LBB10171:
.LBB10168:
	.loc 27 431 0
	jne	.L3004
.LVL3654:
	.loc 27 433 0
	andl	$-16, %edx
.LVL3655:
	.loc 27 432 0
	andl	$15, %ecx
.LVL3656:
	.loc 27 433 0
	orl	%ecx, %edx
.LBE10168:
.LBE10171:
.LBB10172:
.LBB10173:
	.loc 27 444 0
	testb	$15, %bl
.LBE10173:
.LBE10172:
.LBB10176:
.LBB10169:
	.loc 27 433 0
	movl	%edx, 4(%esi)
.LVL3657:
.LBE10169:
.LBE10176:
.LBB10177:
.LBB10174:
	.loc 27 444 0
	jne	.L3005
	.loc 27 446 0
	andl	$-16, %ebx
.LVL3658:
	.loc 27 445 0
	andl	$12, %eax
	orl	$1, %ebx
	.loc 27 446 0
	orl	%eax, %ebx
	movl	%ebx, (%esi)
.LVL3659:
	.p2align 4,,7
	.p2align 3
.L2989:
.LBE10174:
.LBE10177:
.LBE10180:
.LBE10184:
.LBE10190:
	.loc 44 111 0
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3660:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3661:
	.p2align 4,,7
	.p2align 3
.L3026:
	.cfi_restore_state
.LBB10191:
	.loc 44 99 0 discriminator 1
	testb	$7, 604(%ebx)
	je	.L2989
	.loc 44 101 0
	testl	%ebp, %ebp
	jne	.L3011
.LVL3662:
.L3027:
	movl	44(%esp), %eax
	testl	%eax, %eax
	je	.L3011
	.loc 44 102 0
	movl	%edi, 100(%esp)
	movl	%ebx, 96(%esp)
.LBE10191:
	.loc 44 111 0
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3663:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3664:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3665:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3666:
.LBB10192:
	.loc 44 102 0
	jmp	setupCallerCap
.LVL3667:
	.p2align 4,,7
	.p2align 3
.L3013:
	.cfi_restore_state
.LBB10115:
.LBB10083:
	.loc 30 146 0
	movl	%ecx, 56(%esp)
.LVL3668:
	jmp	.L3003
.LVL3669:
	.p2align 4,,7
	.p2align 3
.L3001:
	.loc 30 149 0
	movl	%edx, %ebp
	jmp	.L3002
.LVL3670:
	.p2align 4,,7
	.p2align 3
.L3025:
.LBE10083:
.LBE10115:
.LBB10116:
.LBB10117:
	.loc 27 458 0
	andl	$-4, %ecx
	movl	%ecx, (%esi)
	jmp	.L3006
.LVL3671:
	.p2align 4,,7
	.p2align 3
.L3012:
.LBE10117:
.LBE10116:
.LBE10192:
.LBB10193:
.LBB10185:
.LBB10155:
	.loc 30 130 0
	movl	%ebx, %edx
.LVL3672:
	jmp	.L2997
.LVL3673:
.L3004:
.LBE10155:
.LBE10185:
.LBB10186:
.LBB10181:
.LBB10178:
.LBB10170:
	call	endpoint_ptr_set_epQueue_head.isra.185.part.186
.LVL3674:
.L3005:
.LBE10170:
.LBE10178:
.LBB10179:
.LBB10175:
	.p2align 4,,6
	call	endpoint_ptr_set_epQueue_tail.isra.187.part.188
.LVL3675:
.L3030:
.LBE10175:
.LBE10179:
.LBE10181:
.LBE10186:
.LBB10187:
.LBB10148:
	.loc 27 563 0
	movl	$__FUNCTION__.1354, 12(%esp)
	movl	$563, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC89, (%esp)
	call	_assert_fail
.LVL3676:
.L3029:
.LBE10148:
.LBE10187:
.LBB10188:
.LBB10142:
	.loc 27 550 0
	movl	$__FUNCTION__.1346, 12(%esp)
	movl	$550, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC149, (%esp)
	call	_assert_fail
.LVL3677:
.L3028:
.LBE10142:
.LBE10188:
.LBB10189:
.LBB10129:
	call	thread_state_ptr_set_blockingIPCEndpoint.isra.174.part.175
.LVL3678:
.L3007:
.LBE10129:
.LBE10189:
.LBE10193:
.LBB10194:
.LBB10118:
.LBB10100:
	.loc 22 124 0
	movl	%eax, 12(%esp)
	movl	52(%esp), %eax
.LVL3679:
	movl	%edi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	doFaultTransfer
.LVL3680:
	jmp	.L3008
.LVL3681:
.L3024:
.LBE10100:
.LBE10118:
	.loc 44 81 0 discriminator 1
	movl	$__FUNCTION__.6669, 12(%esp)
	movl	$81, 8(%esp)
	movl	$.LC110, 4(%esp)
	movl	$.LC134, (%esp)
	call	_assert_fail
.LVL3682:
.LBE10194:
	.cfi_endproc
.LFE537:
	.size	sendIPC, .-sendIPC
	.p2align 4,,15
	.globl	sendFaultIPC
	.type	sendFaultIPC, @function
sendFaultIPC:
.LFB460:
	.file 47 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/kernel/faulthandler.c"
	.loc 47 32 0
	.cfi_startproc
.LVL3683:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 47 38 0
	movl	current_lookup_fault, %eax
.LVL3684:
	movl	current_lookup_fault+4, %edx
	movl	%eax, -48(%ebp)
	.loc 47 40 0
	movl	8(%ebp), %eax
	.loc 47 38 0
	movl	%edx, -44(%ebp)
	.loc 47 40 0
	movl	632(%eax), %ebx
.LVL3685:
.LBB10211:
.LBB10212:
.LBB10213:
.LBB10214:
	.loc 42 64 0
	andl	$-1024, %eax
.LVL3686:
	movl	(%eax), %esi
.LVL3687:
	movl	4(%eax), %edi
	.loc 42 65 0
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	$32, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
.LVL3688:
	call	resolveAddressBits
.LVL3689:
.LBE10214:
.LBE10213:
	.loc 42 26 0
	movl	-36(%ebp), %eax
.LBB10216:
.LBB10215:
	.loc 42 68 0
	movl	-32(%ebp), %edx
	.loc 42 65 0
	subl	$4, %esp
.LVL3690:
.LBE10215:
.LBE10216:
	.loc 42 26 0
	testl	%eax, %eax
	jne	.L3046
.LVL3691:
	.loc 42 33 0
	movl	(%edx), %eax
.LVL3692:
	movl	4(%edx), %edi
.LVL3693:
.LBE10212:
.LBE10211:
.LBB10217:
.LBB10218:
	.loc 27 872 0
	movl	%eax, %esi
	.loc 27 873 0
	movl	%eax, %edx
.LVL3694:
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %esi
	cmovne	%edx, %ecx
.LBE10218:
.LBE10217:
	.loc 47 48 0
	cmpl	$4, %ecx
	je	.L3047
.L3036:
.LVL3695:
	.loc 47 62 0
	movl	$1, current_fault
	.loc 47 65 0
	movl	$1, %eax
.LVL3696:
	.loc 47 62 0
	movl	%ebx, current_fault+4
.LVL3697:
	.loc 47 63 0
	movl	$1, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL3698:
.L3033:
	.loc 47 67 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL3699:
	popl	%esi
	.cfi_restore 6
.LVL3700:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL3701:
	.p2align 4,,7
	.p2align 3
.L3047:
	.cfi_restore_state
.LBB10219:
.LBB10220:
	.loc 27 1048 0 discriminator 1
	cmpl	$4, %edx
	jne	.L3048
.LBE10220:
.LBE10219:
	.loc 47 48 0
	testl	$2, %edi
	je	.L3036
.LVL3702:
	.loc 47 49 0
	testl	$4, %edi
	je	.L3036
.LBB10222:
.LBB10223:
	.loc 27 1928 0
	movl	current_fault, %edx
.LBE10223:
.LBE10222:
	.loc 47 51 0
	movl	8(%ebp), %esi
	movl	current_fault, %ecx
	movl	current_fault+4, %ebx
.LVL3703:
.LBB10225:
.LBB10224:
	.loc 27 1928 0
	andl	$7, %edx
.LBE10224:
.LBE10225:
	.loc 47 52 0
	cmpl	$1, %edx
	.loc 47 51 0
	movl	%ecx, 604(%esi)
	movl	%ebx, 608(%esi)
	.loc 47 52 0
	je	.L3049
.LVL3704:
.L3038:
.LBB10226:
.LBB10227:
	.loc 27 1091 0
	andl	$-16, %eax
.LVL3705:
.LBE10227:
.LBE10226:
	.loc 47 55 0
	movl	%eax, 20(%esp)
.LVL3706:
	movl	8(%ebp), %eax
.LBB10228:
.LBB10229:
	.loc 27 1011 0
	shrl	$3, %edi
.LVL3707:
.LBE10229:
.LBE10228:
	.loc 47 55 0
	movl	$1, 12(%esp)
	movl	%edi, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, 16(%esp)
	movl	$1, (%esp)
	call	sendIPC
.LVL3708:
	.loc 47 60 0
	xorl	%eax, %eax
	jmp	.L3033
.LVL3709:
	.p2align 4,,7
	.p2align 3
.L3049:
	.loc 47 53 0
	movl	%esi, %ecx
	movl	-48(%ebp), %ebx
	movl	-44(%ebp), %esi
	movl	%ebx, 612(%ecx)
	movl	%esi, 616(%ecx)
.LVL3710:
	jmp	.L3038
.LVL3711:
.L3046:
	.loc 47 43 0
	movl	$1, current_fault
	.loc 47 44 0
	movl	$1, %eax
.LVL3712:
	.loc 47 43 0
	movl	%ebx, current_fault+4
	.loc 47 44 0
	jmp	.L3033
.LVL3713:
.L3048:
.LBB10230:
.LBB10221:
	call	cap_endpoint_cap_get_capCanSend.part.64
.LVL3714:
.LBE10221:
.LBE10230:
	.cfi_endproc
.LFE460:
	.size	sendFaultIPC, .-sendFaultIPC
	.p2align 4,,15
	.globl	performInvocation_Endpoint
	.type	performInvocation_Endpoint, @function
performInvocation_Endpoint:
.LFB568:
	.loc 38 683 0
	.cfi_startproc
.LVL3715:
	subl	$44, %esp
	.cfi_def_cfa_offset 48
	.loc 38 684 0
	movl	48(%esp), %eax
	movl	%eax, 20(%esp)
	movl	ksCurThread, %eax
	movl	%eax, 16(%esp)
	movl	56(%esp), %eax
	movl	%eax, 12(%esp)
	movl	52(%esp), %eax
	movl	%eax, 8(%esp)
	movl	64(%esp), %eax
	movl	%eax, 4(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	call	sendIPC
.LVL3716:
	.loc 38 687 0
	xorl	%eax, %eax
	addl	$44, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE568:
	.size	performInvocation_Endpoint, .-performInvocation_Endpoint
	.section	.rodata.str1.4
	.align 4
.LC150:
	.string	"cap_get_capType(cap) == cap_endpoint_cap"
	.section	.rodata.str1.1
.LC151:
	.string	"sender"
	.text
	.p2align 4,,15
	.globl	receiveIPC
	.type	receiveIPC, @function
receiveIPC:
.LFB538:
	.loc 44 115 0
	.cfi_startproc
.LVL3717:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 44 115 0
	movl	84(%esp), %ebx
	movl	80(%esp), %esi
.LVL3718:
	movl	88(%esp), %edi
.LVL3719:
.LBB10301:
.LBB10302:
	.loc 27 872 0
	movl	%ebx, %ecx
	.loc 27 873 0
	movl	%ebx, %eax
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%bl, %edx
.LVL3720:
	cmpl	$14, %ecx
	cmovne	%eax, %edx
.LVL3721:
.LBE10302:
.LBE10301:
	.loc 44 120 0
	cmpl	$4, %edx
	jne	.L3081
.LVL3722:
.LBB10303:
.LBB10304:
	.loc 27 1088 0
	cmpl	$4, %eax
	jne	.L3082
.LBE10304:
.LBE10303:
.LBB10307:
.LBB10308:
	.loc 27 1051 0
	andl	$2, %edi
.LBE10308:
.LBE10307:
.LBB10310:
.LBB10305:
	.loc 27 1091 0
	andl	$-16, %ebx
.LVL3723:
.LBE10305:
.LBE10310:
.LBB10311:
.LBB10309:
	.loc 27 1051 0
	shrl	%edi
	movl	%edi, %eax
	xorl	$1, %eax
	movl	%eax, 32(%esp)
.LVL3724:
.LBE10309:
.LBE10311:
	.loc 44 116 0
	movl	(%ebx), %eax
.LVL3725:
.LBB10312:
.LBB10313:
	.loc 27 451 0
	movl	%eax, %edx
	andl	$3, %edx
.LBE10313:
.LBE10312:
	.loc 44 125 0
	cmpl	$1, %edx
	je	.L3058
	jb	.L3059
	cmpl	$2, %edx
	je	.L3059
	.loc 44 196 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3726:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.p2align 4,,1
	ret
.LVL3727:
	.p2align 4,,7
	.p2align 3
.L3059:
	.cfi_restore_state
.LBB10314:
.LBB10315:
.LBB10316:
	.loc 27 609 0
	movl	%ebx, %eax
	orl	$3, %eax
	movl	%eax, 592(%esi)
.LVL3728:
.LBE10316:
.LBE10315:
.LBB10317:
.LBB10318:
	.loc 27 595 0
	movl	596(%esi), %eax
	andl	$-2, %eax
	.loc 27 596 0
	orl	32(%esp), %eax
	movl	%eax, 596(%esi)
.LBE10318:
.LBE10317:
	.loc 44 138 0
	movl	%esi, (%esp)
	call	scheduleTCB
.LVL3729:
.LBE10314:
	.loc 44 22 0
	movl	4(%ebx), %ecx
.LVL3730:
	movl	(%ebx), %eax
.LVL3731:
.LBB10355:
.LBB10319:
.LBB10320:
	.loc 30 130 0
	movl	%ecx, %edx
.LBE10320:
.LBE10319:
.LBB10324:
.LBB10325:
.LBB10326:
.LBB10327:
	.loc 27 438 0
	movl	%eax, %edi
	andl	$-16, %edi
.LVL3732:
.LBE10327:
.LBE10326:
.LBE10325:
.LBE10324:
.LBB10328:
.LBB10321:
	.loc 30 130 0
	andl	$-16, %edx
.LVL3733:
	je	.L3075
	.loc 30 133 0
	movl	%esi, 648(%edi)
.LVL3734:
.L3060:
	.loc 30 135 0
	movl	%edi, 652(%esi)
.LBE10321:
.LBE10328:
.LBB10329:
.LBB10330:
	.loc 27 458 0
	movl	%eax, %edi
.LVL3735:
	andl	$-4, %edi
	.loc 27 459 0
	orl	$2, %edi
.LBE10330:
.LBE10329:
.LBB10332:
.LBB10333:
.LBB10334:
.LBB10335:
	.loc 27 431 0
	testb	$15, %dl
.LBE10335:
.LBE10334:
.LBE10333:
.LBE10332:
.LBB10350:
.LBB10322:
	.loc 30 136 0
	movl	$0, 648(%esi)
.LVL3736:
.LBE10322:
.LBE10350:
.LBB10351:
.LBB10331:
	.loc 27 459 0
	movl	%edi, (%ebx)
.LVL3737:
.LBE10331:
.LBE10351:
.LBB10352:
.LBB10348:
.LBB10339:
.LBB10336:
	.loc 27 431 0
	jne	.L3067
.LVL3738:
	.loc 27 433 0
	andl	$-16, %edx
.LVL3739:
	.loc 27 432 0
	andl	$15, %ecx
.LVL3740:
	.loc 27 433 0
	orl	%ecx, %edx
.LBE10336:
.LBE10339:
.LBB10340:
.LBB10341:
	.loc 27 444 0
	testl	$15, %esi
.LBE10341:
.LBE10340:
.LBB10344:
.LBB10337:
	.loc 27 433 0
	movl	%edx, 4(%ebx)
.LVL3741:
.LBE10337:
.LBE10344:
.LBB10345:
.LBB10342:
	.loc 27 444 0
	jne	.L3068
	.loc 27 446 0
	andl	$-16, %esi
.LVL3742:
	.loc 27 445 0
	andl	$12, %eax
	orl	%eax, %esi
	.loc 27 446 0
	orl	$2, %esi
	movl	%esi, (%ebx)
.LBE10342:
.LBE10345:
.LBE10348:
.LBE10352:
.LBE10355:
	.loc 44 196 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3743:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3744:
	.p2align 4,,7
	.p2align 3
.L3058:
	.cfi_restore_state
	.loc 44 22 0
	movl	4(%ebx), %ecx
.LBB10356:
.LBB10357:
.LBB10358:
.LBB10359:
.LBB10360:
	.loc 27 438 0
	movl	%eax, %edx
	andl	$-16, %edx
	movl	%edx, 40(%esp)
.LBE10360:
.LBE10359:
.LBE10358:
.LBE10357:
.LBE10356:
	.loc 44 22 0
	movl	%ecx, 44(%esp)
.LVL3745:
.LBB10413:
	.loc 44 160 0
	andl	$-16, %ecx
.LVL3746:
	je	.L3083
.LVL3747:
.LBB10361:
.LBB10362:
	.loc 30 146 0
	movl	652(%ecx), %edx
.LVL3748:
	.loc 30 147 0
	movl	648(%ecx), %ebp
	.loc 30 146 0
	testl	%edx, %edx
	je	.L3064
	.loc 30 147 0
	movl	%ebp, 648(%edx)
	movl	648(%ecx), %ebp
	movl	%ecx, 36(%esp)
.LVL3749:
.L3065:
	.loc 30 152 0
	testl	%ebp, %ebp
	je	.L3076
	.loc 30 153 0
	movl	%edx, 652(%ebp)
.LVL3750:
.L3066:
.LBE10362:
.LBE10361:
.LBB10364:
.LBB10365:
.LBB10366:
.LBB10367:
	.loc 27 431 0
	movl	36(%esp), %edx
	testb	$15, %dl
	jne	.L3067
	.loc 27 432 0
	movl	44(%esp), %ebp
	.loc 27 433 0
	andl	$-16, %edx
	.loc 27 432 0
	andl	$15, %ebp
	.loc 27 433 0
	orl	%ebp, %edx
.LBE10367:
.LBE10366:
.LBB10369:
.LBB10370:
	.loc 27 444 0
	movl	40(%esp), %ebp
.LBE10370:
.LBE10369:
.LBB10373:
.LBB10368:
	.loc 27 433 0
	movl	%edx, 4(%ebx)
.LVL3751:
.LBE10368:
.LBE10373:
.LBB10374:
.LBB10371:
	.loc 27 444 0
	testl	$15, %ebp
	jne	.L3068
	.loc 27 446 0
	andl	$-16, %ebp
	.loc 27 445 0
	andl	$15, %eax
.LVL3752:
	.loc 27 446 0
	movl	%ebp, %edx
	orl	%eax, %edx
.LBE10371:
.LBE10374:
.LBE10365:
.LBE10364:
	.loc 44 166 0
	movl	36(%esp), %eax
.LBB10377:
.LBB10376:
.LBB10375:
.LBB10372:
	.loc 27 446 0
	movl	%edx, (%ebx)
.LVL3753:
.LBE10372:
.LBE10375:
.LBE10376:
.LBE10377:
	.loc 44 166 0
	testl	%eax, %eax
	je	.L3084
.L3069:
.LBE10413:
	.loc 44 171 0
	movl	600(%ecx), %ebp
.LBB10414:
.LBB10378:
.LBB10379:
	.loc 22 117 0
	movl	%esi, 4(%esp)
	movl	$1, (%esp)
.LBE10379:
.LBE10378:
.LBE10414:
	.loc 44 171 0
	movl	%ecx, 40(%esp)
.LVL3754:
.LBB10415:
.LBB10382:
.LBB10383:
	.loc 27 531 0
	movl	%ebp, %eax
.LBE10383:
.LBE10382:
.LBB10385:
.LBB10386:
	.loc 27 544 0
	andl	$4, %ebp
.LBE10386:
.LBE10385:
.LBB10388:
.LBB10384:
	.loc 27 531 0
	shrl	$3, %eax
	movl	%eax, 36(%esp)
.LVL3755:
.LBE10384:
.LBE10388:
.LBB10389:
.LBB10387:
	.loc 27 544 0
	shrl	$2, %ebp
.LVL3756:
.LBE10387:
.LBE10389:
.LBB10390:
.LBB10380:
	.loc 22 117 0
	call	lookupIPCBuffer
.LVL3757:
	.loc 22 119 0
	movl	40(%esp), %ecx
	testb	$7, 604(%ecx)
	jne	.L3070
.LVL3758:
	.loc 22 120 0
	movl	%ecx, 4(%esp)
	movl	$0, (%esp)
	movl	%eax, 44(%esp)
	call	lookupIPCBuffer
.LVL3759:
	.loc 22 121 0
	movl	32(%esp), %edx
	movl	36(%esp), %ecx
	movl	%esi, 20(%esp)
	movl	%ebp, 16(%esp)
	movl	%edx, 28(%esp)
	movl	44(%esp), %edx
	movl	%ecx, 12(%esp)
	movl	40(%esp), %ecx
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 24(%esp)
	movl	%ecx, (%esp)
	movl	%ecx, 32(%esp)
.LVL3760:
	call	doNormalTransfer
.LVL3761:
	movl	32(%esp), %ecx
.LVL3762:
.L3071:
.LBE10380:
.LBE10390:
	.loc 44 181 0
	testb	$2, 600(%ecx)
	je	.L3085
.L3072:
	.loc 44 183 0
	movl	%ebp, %eax
	movl	%edi, %ebx
.LVL3763:
	testb	%bl, %al
	je	.L3074
	.loc 44 184 0
	movl	%esi, 84(%esp)
.LVL3764:
	movl	%ecx, 80(%esp)
.LBE10415:
	.loc 44 196 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3765:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3766:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3767:
.LBB10416:
	.loc 44 184 0
	jmp	setupCallerCap
.LVL3768:
	.p2align 4,,7
	.p2align 3
.L3085:
	.cfi_restore_state
	.loc 44 181 0 discriminator 1
	testb	$7, 604(%ecx)
	jne	.L3072
.LVL3769:
.LBB10391:
.LBB10392:
.LBB10393:
.LBB10394:
	.loc 27 626 0
	movl	592(%ecx), %eax
.LBE10394:
.LBE10393:
	.loc 22 428 0
	movl	%ecx, 32(%esp)
.LVL3770:
.LBB10396:
.LBB10395:
	.loc 27 626 0
	andl	$-16, %eax
	.loc 27 627 0
	orl	$1, %eax
	movl	%eax, 592(%ecx)
.LBE10395:
.LBE10396:
	.loc 22 428 0
	movl	%ecx, (%esp)
	call	scheduleTCB
.LVL3771:
.LBE10392:
.LBE10391:
.LBB10397:
.LBB10398:
	.loc 22 421 0
	movl	32(%esp), %ecx
.LBE10398:
.LBE10397:
.LBE10416:
	.loc 44 196 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3772:
.LBB10417:
.LBB10401:
.LBB10399:
	.loc 22 421 0
	xorl	%edx, %edx
.LBE10399:
.LBE10401:
.LBE10417:
	.loc 44 196 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3773:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3774:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3775:
.LBB10418:
.LBB10402:
.LBB10400:
	.loc 22 421 0
	movl	%ecx, %eax
	jmp	possibleSwitchTo
.LVL3776:
	.p2align 4,,7
	.p2align 3
.L3074:
	.cfi_restore_state
.LBE10400:
.LBE10402:
.LBB10403:
.LBB10404:
.LBB10405:
.LBB10406:
	.loc 27 626 0
	andl	$-16, 592(%ecx)
.LBE10406:
.LBE10405:
	.loc 22 428 0
	movl	%ecx, 80(%esp)
.LBE10404:
.LBE10403:
.LBE10418:
	.loc 44 196 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3777:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3778:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3779:
.LBB10419:
.LBB10408:
.LBB10407:
	.loc 22 428 0
	jmp	scheduleTCB
.LVL3780:
	.p2align 4,,7
	.p2align 3
.L3064:
	.cfi_restore_state
.LBE10407:
.LBE10408:
.LBB10409:
.LBB10363:
	.loc 30 149 0
	movl	%ebp, 36(%esp)
.LVL3781:
	jmp	.L3065
	.p2align 4,,7
	.p2align 3
.L3076:
	.loc 30 146 0
	movl	%edx, 40(%esp)
.LVL3782:
	jmp	.L3066
.LVL3783:
	.p2align 4,,7
	.p2align 3
.L3075:
.LBE10363:
.LBE10409:
.LBE10419:
.LBB10420:
.LBB10353:
.LBB10323:
	.loc 30 130 0
	movl	%esi, %edx
.LVL3784:
	jmp	.L3060
.LVL3785:
	.p2align 4,,7
	.p2align 3
.L3084:
.LBE10323:
.LBE10353:
.LBE10420:
.LBB10421:
.LBB10410:
.LBB10411:
	.loc 27 458 0
	andl	$-4, %edx
	movl	%edx, (%ebx)
	jmp	.L3069
.LVL3786:
.L3082:
.LBE10411:
.LBE10410:
.LBE10421:
.LBB10422:
.LBB10306:
	call	cap_endpoint_cap_get_capEPPtr.isra.65.part.66
.LVL3787:
.L3081:
.LBE10306:
.LBE10422:
	.loc 44 120 0 discriminator 1
	movl	$__FUNCTION__.6676, 12(%esp)
	movl	$120, 8(%esp)
	movl	$.LC110, 4(%esp)
	movl	$.LC150, (%esp)
	call	_assert_fail
.LVL3788:
.L3067:
.LBB10423:
.LBB10354:
.LBB10349:
.LBB10346:
.LBB10338:
	call	endpoint_ptr_set_epQueue_head.isra.185.part.186
.LVL3789:
.L3068:
.LBE10338:
.LBE10346:
.LBB10347:
.LBB10343:
	call	endpoint_ptr_set_epQueue_tail.isra.187.part.188
.LVL3790:
.L3070:
.LBE10343:
.LBE10347:
.LBE10349:
.LBE10354:
.LBE10423:
.LBB10424:
.LBB10412:
.LBB10381:
	.loc 22 124 0
	movl	%eax, 12(%esp)
	movl	36(%esp), %eax
.LVL3791:
	movl	%ecx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%ecx, 32(%esp)
.LVL3792:
	movl	%eax, (%esp)
	call	doFaultTransfer
.LVL3793:
	movl	32(%esp), %ecx
	jmp	.L3071
.LVL3794:
.L3083:
.LBE10381:
.LBE10412:
	.loc 44 160 0 discriminator 1
	movl	$__FUNCTION__.6676, 12(%esp)
	movl	$160, 8(%esp)
	movl	$.LC110, 4(%esp)
	movl	$.LC151, (%esp)
	call	_assert_fail
.LVL3795:
.LBE10424:
	.cfi_endproc
.LFE538:
	.size	receiveIPC, .-receiveIPC
	.section	.rodata.str1.4
	.align 4
.LC152:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/object/ioport.c"
	.section	.rodata.str1.1
.LC153:
	.string	"first_allowed <= last_allowed"
.LC154:
	.string	"start_port <= end_port"
	.section	.rodata.str1.4
	.align 4
.LC155:
	.string	"IOPort: Ports %d--%d fall outside permitted range %d--%d."
	.text
	.p2align 4,,15
	.type	ensurePortOperationAllowed, @function
ensurePortOperationAllowed:
.LFB408:
	.file 48 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/arch/ia32/object/ioport.c"
	.loc 48 20 0
	.cfi_startproc
.LVL3796:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
.LBB10425:
.LBB10426:
	.loc 27 1793 0
	andl	$15, %eax
.LVL3797:
.LBE10426:
.LBE10425:
	.loc 48 20 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
.LBB10431:
.LBB10427:
	.loc 27 1793 0
	cmpl	$11, %eax
	jne	.L3096
.LBE10427:
.LBE10431:
	.loc 48 23 0
	movl	64(%esp), %eax
.LBB10432:
.LBB10428:
	.loc 27 1796 0
	movl	%edx, %ebp
.LBE10428:
.LBE10432:
.LBB10433:
.LBB10434:
	.loc 27 1804 0
	movzwl	%dx, %esi
.LBE10434:
.LBE10433:
.LBB10435:
.LBB10429:
	.loc 27 1796 0
	shrl	$16, %ebp
.LVL3798:
	movl	%ecx, %ebx
.LBE10429:
.LBE10435:
	.loc 48 24 0
	cmpl	%esi, %ebp
	.loc 48 23 0
	leal	-1(%ecx,%eax), %edi
.LVL3799:
	.loc 48 24 0
	ja	.L3097
	.loc 48 25 0
	cmpl	%edi, %ecx
	ja	.L3098
	.loc 48 27 0
	cmpl	%esi, %edi
	ja	.L3093
	.loc 48 35 0
	xorl	%eax, %eax
	.loc 48 27 0
	cmpl	%ebp, %ecx
	.p2align 4,,3
	jb	.L3093
	.loc 48 36 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3800:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3801:
	.p2align 4,,7
	.p2align 3
.L3093:
	.cfi_restore_state
	.loc 48 28 0
	movl	ksCurThread, %eax
.LVL3802:
	.loc 48 28 0
	movl	44(%eax), %edx
.LVL3803:
	movl	%eax, 12(%esp)
	movl	$30, 8(%esp)
	movl	$__func__.5592, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL3804:
	.loc 48 28 0
	movl	%esi, 16(%esp)
	movl	%ebp, 12(%esp)
	movl	%edi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	$.LC155, (%esp)
	call	printf
.LVL3805:
	movl	$.LC20, (%esp)
	call	printf
.LVL3806:
	.loc 48 32 0
	movl	$3, %eax
	.loc 48 31 0
	movl	$3, current_syscall_error+24
	.loc 48 36 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3807:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3808:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3809:
.L3098:
	.cfi_restore_state
	.loc 48 25 0 discriminator 1
	movl	$__FUNCTION__.5591, 12(%esp)
	movl	$25, 8(%esp)
	movl	$.LC152, 4(%esp)
	movl	$.LC154, (%esp)
	call	_assert_fail
.LVL3810:
.L3097:
	.loc 48 24 0 discriminator 1
	movl	$__FUNCTION__.5591, 12(%esp)
	movl	$24, 8(%esp)
	movl	$.LC152, 4(%esp)
	movl	$.LC153, (%esp)
	call	_assert_fail
.LVL3811:
.L3096:
.LBB10436:
.LBB10430:
	call	cap_io_port_cap_get_capIOPortFirstPort.part.136
.LVL3812:
.LBE10430:
.LBE10436:
	.cfi_endproc
.LFE408:
	.size	ensurePortOperationAllowed, .-ensurePortOperationAllowed
	.section	.rodata.str1.1
.LC156:
	.string	"IOPort: Truncated message."
	.section	.rodata.str1.4
	.align 4
.LC157:
	.string	"IOPort Out32: Truncated message."
	.section	.rodata.str1.1
.LC158:
	.string	"IOPort: Unknown operation."
	.text
	.p2align 4,,15
	.globl	decodeIA32PortInvocation
	.type	decodeIA32PortInvocation, @function
decodeIA32PortInvocation:
.LFB409:
	.loc 48 48 0
	.cfi_startproc
.LVL3813:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$40, %esp
	.cfi_def_cfa_offset 48
	.loc 48 48 0
	movl	52(%esp), %eax
	.loc 48 55 0
	testl	%eax, %eax
	je	.L3123
.LVL3814:
	.loc 48 64 0
	movl	48(%esp), %edx
.LBB10477:
.LBB10478:
	.loc 41 30 0
	movl	ksCurThread, %ecx
.LVL3815:
.LBE10478:
.LBE10477:
	.loc 48 64 0
	subl	$37, %edx
	cmpl	$5, %edx
.LBB10482:
.LBB10481:
.LBB10479:
.LBB10480:
	.loc 13 27 0
	movl	20(%ecx), %ebx
.LBE10480:
.LBE10479:
.LBE10481:
.LBE10482:
	.loc 48 64 0
	ja	.L3102
	jmp	*.L3104(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L3104:
	.long	.L3103
	.long	.L3105
	.long	.L3106
	.long	.L3107
	.long	.L3108
	.long	.L3109
	.text
.LVL3816:
	.p2align 4,,7
	.p2align 3
.L3123:
	.loc 48 56 0
	movl	ksCurThread, %eax
.LVL3817:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$56, 8(%esp)
	movl	$__func__.5606, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL3818:
	movl	$.LC156, (%esp)
.LVL3819:
.L3122:
.LBB10483:
	.loc 48 144 0
	call	printf
.LVL3820:
	movl	$.LC20, (%esp)
	call	printf
.LVL3821:
	.loc 48 146 0
	movl	$3, %eax
	.loc 48 145 0
	movl	$7, current_syscall_error+24
.L3120:
.LBE10483:
	.loc 48 190 0
	addl	$40, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL3822:
	.p2align 4,,7
	.p2align 3
.L3108:
	.cfi_restore_state
.LBB10488:
	.loc 48 127 0
	movl	64(%esp), %eax
	movzwl	%bx, %ebx
	movl	68(%esp), %edx
	movl	%ebx, %ecx
.LVL3823:
	movl	$2, (%esp)
	call	ensurePortOperationAllowed
.LVL3824:
	.loc 48 128 0
	testl	%eax, %eax
	jne	.L3120
.LVL3825:
	.loc 48 133 0
	movl	ksCurThread, %eax
.LVL3826:
	movzwl	22(%eax), %eax
	.loc 48 134 0
	movl	%ebx, (%esp)
.LVL3827:
	movl	%eax, 4(%esp)
	call	out16
.LVL3828:
	.loc 48 136 0
	jmp	.L3111
.LVL3829:
	.p2align 4,,7
	.p2align 3
.L3107:
.LBE10488:
.LBB10489:
	.loc 48 111 0
	movl	64(%esp), %eax
	movzwl	%bx, %ebx
	movl	68(%esp), %edx
	movl	%ebx, %ecx
.LVL3830:
	movl	$1, (%esp)
	call	ensurePortOperationAllowed
.LVL3831:
	.loc 48 112 0
	testl	%eax, %eax
	jne	.L3120
.LVL3832:
	movl	ksCurThread, %eax
.LVL3833:
	movzbl	22(%eax), %eax
	.loc 48 118 0
	movl	%ebx, (%esp)
.LVL3834:
	movl	%eax, 4(%esp)
	call	out8
.LVL3835:
	.loc 48 120 0
	jmp	.L3111
.LVL3836:
	.p2align 4,,7
	.p2align 3
.L3106:
.LBE10489:
	.loc 48 96 0
	movl	64(%esp), %eax
	movzwl	%bx, %ebx
	movl	68(%esp), %edx
	movl	%ebx, %ecx
.LVL3837:
	movl	$4, (%esp)
	call	ensurePortOperationAllowed
.LVL3838:
	.loc 48 97 0
	testl	%eax, %eax
	jne	.L3120
	.loc 48 102 0
	movl	%ebx, (%esp)
	call	in32
.LVL3839:
	.loc 48 104 0
	.p2align 4,,3
	jmp	.L3110
.LVL3840:
	.p2align 4,,7
	.p2align 3
.L3105:
	.loc 48 82 0
	movl	64(%esp), %eax
	movzwl	%bx, %ebx
	movl	68(%esp), %edx
	movl	%ebx, %ecx
.LVL3841:
	movl	$2, (%esp)
	call	ensurePortOperationAllowed
.LVL3842:
	.loc 48 83 0
	testl	%eax, %eax
	jne	.L3120
	.loc 48 88 0
	movl	%ebx, (%esp)
	call	in16
.LVL3843:
	movzwl	%ax, %eax
.LVL3844:
	.loc 48 90 0
	jmp	.L3110
.LVL3845:
	.p2align 4,,7
	.p2align 3
.L3103:
	.loc 48 68 0
	movl	64(%esp), %eax
	movzwl	%bx, %ebx
	movl	68(%esp), %edx
	movl	%ebx, %ecx
.LVL3846:
	movl	$1, (%esp)
	call	ensurePortOperationAllowed
.LVL3847:
	.loc 48 69 0
	testl	%eax, %eax
	jne	.L3120
	.loc 48 74 0
	movl	%ebx, (%esp)
	call	in8
.LVL3848:
	movzbl	%al, %eax
.LVL3849:
.L3110:
	.loc 48 170 0
	movl	ksCurThread, %edx
.LVL3850:
.LBB10490:
.LBB10491:
	.loc 13 21 0
	movl	%eax, 20(%edx)
.LBE10491:
.LBE10490:
	.loc 48 182 0
	movl	$1, %eax
.LVL3851:
.LBB10492:
.LBB10493:
	.loc 13 21 0
	movl	$0, 4(%edx)
.LVL3852:
	jmp	.L3113
.LVL3853:
	.p2align 4,,7
	.p2align 3
.L3109:
.LBE10493:
.LBE10492:
.LBB10494:
	.loc 48 143 0
	cmpl	$1, %eax
	jbe	.L3124
	.loc 48 150 0
	movl	64(%esp), %eax
	movzwl	%bx, %ebx
	movl	68(%esp), %edx
	movl	%ebx, %ecx
.LVL3854:
	movl	$4, (%esp)
	call	ensurePortOperationAllowed
.LVL3855:
	.loc 48 151 0
	testl	%eax, %eax
	jne	.L3120
.LVL3856:
.LBB10484:
.LBB10485:
.LBB10486:
.LBB10487:
	.loc 13 27 0
	movl	ksCurThread, %eax
.LVL3857:
.LBE10487:
.LBE10486:
.LBE10485:
.LBE10484:
	.loc 48 157 0
	movl	24(%eax), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	out32
.LVL3858:
.L3111:
	movl	ksCurThread, %edx
.LBE10494:
	.loc 48 48 0
	xorl	%eax, %eax
.LVL3859:
.L3113:
.LBB10495:
.LBB10496:
	.loc 13 21 0
	movl	%eax, 16(%edx)
.LVL3860:
.LBE10496:
.LBE10495:
.LBB10497:
.LBB10498:
.LBB10499:
.LBB10500:
	.loc 27 626 0
	movl	592(%edx), %eax
.LVL3861:
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%edx)
.LBE10500:
.LBE10499:
	.loc 22 428 0
	movl	%edx, (%esp)
.LVL3862:
	call	scheduleTCB
.LVL3863:
.LBE10498:
.LBE10497:
	.loc 48 190 0
	addl	$40, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.loc 48 189 0
	xorl	%eax, %eax
	.loc 48 190 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL3864:
	.p2align 4,,7
	.p2align 3
.L3102:
	.cfi_restore_state
	.loc 48 163 0
	movl	44(%ecx), %eax
	movl	%ecx, 12(%esp)
	movl	$163, 8(%esp)
	movl	$__func__.5606, 4(%esp)
	movl	%eax, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL3865:
	movl	$.LC158, (%esp)
	call	printf
.LVL3866:
	movl	$.LC20, (%esp)
	call	printf
.LVL3867:
	.loc 48 165 0
	movl	$3, %eax
	.loc 48 164 0
	movl	$3, current_syscall_error+24
	.loc 48 165 0
	jmp	.L3120
.LVL3868:
	.p2align 4,,7
	.p2align 3
.L3124:
.LBB10501:
	.loc 48 144 0
	movl	44(%ecx), %eax
	movl	%ecx, 12(%esp)
	movl	$144, 8(%esp)
	movl	$__func__.5606, 4(%esp)
	movl	%eax, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL3869:
	movl	$.LC157, (%esp)
	jmp	.L3122
.LBE10501:
	.cfi_endproc
.LFE409:
	.size	decodeIA32PortInvocation, .-decodeIA32PortInvocation
	.section	.rodata.str1.4
	.align 4
.LC159:
	.string	"Kernel init failing: not enough memory\n"
	.align 4
.LC160:
	.string	"alloc_region(): wasted 0x%x bytes due to alignment, try to increase MAX_NUM_FREEMEM_REG\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	alloc_region
	.type	alloc_region, @function
alloc_region:
.LFB432:
	.loc 21 53 0
	.cfi_startproc
.LVL3870:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	$1, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 21 71 0
	movl	ndks_boot, %ebp
	.loc 21 53 0
	movl	80(%esp), %ecx
	.loc 21 72 0
	movl	ndks_boot+4, %eax
	.loc 21 71 0
	leal	-1(%ebp), %ebx
	shrl	%cl, %ebx
	addl	$1, %ebx
	.loc 21 72 0
	movl	%eax, %edx
	.loc 21 71 0
	sall	%cl, %ebx
	.loc 21 72 0
	movl	%eax, 28(%esp)
	shrl	%cl, %eax
	.loc 21 71 0
	movl	%ebx, %esi
	.loc 21 72 0
	sall	%cl, %eax
	.loc 21 71 0
	subl	%ebp, %esi
	.loc 21 72 0
	subl	%eax, %edx
	sall	%cl, %edi
	.loc 21 71 0
	cmpl	%edx, %esi
	jb	.L3126
.LVL3871:
	.loc 21 77 0
	movl	%eax, %ebx
	subl	%edi, %ebx
.LVL3872:
.L3127:
	.loc 21 79 0
	cmpl	%eax, %ebx
	jae	.L3145
	cmpl	%ebx, %ebp
	jbe	.L3160
.L3145:
	.loc 21 58 0
	movl	$0, 28(%esp)
	.loc 21 57 0
	xorl	%ebp, %ebp
	.loc 21 56 0
	xorl	%eax, %eax
.LVL3873:
	.loc 21 58 0
	movl	$0, 40(%esp)
	.loc 21 56 0
	xorl	%ebx, %ebx
.LVL3874:
	.loc 21 57 0
	movl	$0, 32(%esp)
.L3128:
.LVL3875:
	.loc 21 71 0
	movl	ndks_boot+8, %esi
	movl	%esi, 20(%esp)
	leal	-1(%esi), %edx
	.loc 21 72 0
	movl	ndks_boot+12, %esi
	.loc 21 71 0
	shrl	%cl, %edx
	addl	$1, %edx
	sall	%cl, %edx
	.loc 21 72 0
	movl	%esi, 24(%esp)
	shrl	%cl, %esi
	sall	%cl, %esi
	.loc 21 71 0
	movl	%edx, %ecx
	subl	20(%esp), %ecx
	movl	%ecx, 36(%esp)
	.loc 21 72 0
	movl	24(%esp), %ecx
	subl	%esi, %ecx
	.loc 21 71 0
	cmpl	%ecx, 36(%esp)
	jae	.L3130
.LVL3876:
	.loc 21 74 0
	leal	(%edx,%edi), %esi
.LVL3877:
.L3131:
	.loc 21 79 0
	cmpl	%edx, %esi
	jbe	.L3149
	.loc 21 79 0 is_stmt 0 discriminator 1
	cmpl	%edx, 20(%esp)
	jbe	.L3161
.L3149:
	xorl	%ecx, %ecx
.LVL3878:
.L3132:
	.loc 21 103 0 is_stmt 1
	cmpl	%ebx, %eax
	je	.L3162
.LVL3879:
.L3134:
.LBB10514:
.LBB10515:
	.loc 21 32 0
	movl	28(%esp), %eax
	cmpl	%eax, 40(%esp)
.LBE10515:
.LBE10514:
	.loc 21 108 0
	movl	$0, ndks_boot(,%ecx,8)
	movl	$0, ndks_boot+4(,%ecx,8)
.LVL3880:
.LBB10519:
.LBB10516:
	.loc 21 32 0
	ja	.L3139
.LVL3881:
	.loc 21 33 0
	je	.L3137
.LVL3882:
	.loc 21 37 0
	movl	ndks_boot+4, %eax
	cmpl	%eax, ndks_boot
	je	.L3155
.LVL3883:
	movl	ndks_boot+12, %eax
	cmpl	%eax, ndks_boot+8
	je	.L3163
.LVL3884:
.L3137:
.LBE10516:
.LBE10519:
.LBB10520:
.LBB10521:
	.loc 21 32 0
	cmpl	32(%esp), %ebp
	ja	.L3139
.LVL3885:
	.loc 21 33 0
	je	.L3159
.LVL3886:
	.loc 21 37 0
	movl	ndks_boot+4, %eax
	cmpl	%eax, ndks_boot
	je	.L3156
.LVL3887:
	movl	ndks_boot+12, %eax
	cmpl	%eax, ndks_boot+8
	je	.L3164
.LBE10521:
.LBE10520:
	.loc 21 112 0
	movl	32(%esp), %eax
	movl	$.LC160, (%esp)
	subl	%ebp, %eax
	movl	%eax, 4(%esp)
	call	printf
.LVL3888:
.L3159:
	.loc 21 116 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 21 112 0
	movl	%ebx, %eax
	.loc 21 116 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3889:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3890:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3891:
	ret
.LVL3892:
	.p2align 4,,7
	.p2align 3
.L3130:
	.cfi_restore_state
	.loc 21 77 0
	movl	%esi, %edx
	subl	%edi, %edx
.LVL3893:
	jmp	.L3131
.LVL3894:
	.p2align 4,,7
	.p2align 3
.L3126:
	.loc 21 74 0
	leal	(%ebx,%edi), %eax
.LVL3895:
	jmp	.L3127
.LVL3896:
	.p2align 4,,7
	.p2align 3
.L3161:
	.loc 21 80 0
	cmpl	%esi, 24(%esp)
	jb	.L3149
	.loc 21 82 0
	movl	24(%esp), %ecx
	movl	%edx, %edi
	subl	20(%esp), %edi
	subl	%esi, %ecx
	cmpl	%ecx, %edi
	jb	.L3150
	movl	%edi, 44(%esp)
	movl	20(%esp), %edi
	movl	%esi, 20(%esp)
	movl	%edi, 36(%esp)
	movl	24(%esp), %edi
	movl	%edx, 24(%esp)
.L3133:
.LVL3897:
	.loc 21 93 0
	cmpl	%ebx, %eax
	je	.L3152
.LVL3898:
.LBB10523:
.LBB10524:
	.loc 21 48 0 discriminator 1
	movl	32(%esp), %eax
.LVL3899:
	subl	%ebp, %eax
.LBE10524:
.LBE10523:
	.loc 21 93 0 discriminator 1
	cmpl	%eax, %ecx
	jb	.L3152
.LVL3900:
	movl	$0, %ecx
	.loc 21 94 0
	jne	.L3134
.LVL3901:
.LBB10525:
.LBB10526:
	.loc 21 48 0
	movl	28(%esp), %eax
	subl	40(%esp), %eax
.LBE10526:
.LBE10525:
	.loc 21 95 0
	cmpl	%eax, 44(%esp)
	jae	.L3134
	movl	24(%esp), %eax
	movl	%edx, %ebx
.LVL3902:
	.loc 21 69 0
	movb	$1, %cl
	movl	%edi, 32(%esp)
.LVL3903:
	movl	20(%esp), %ebp
.LVL3904:
	movl	%eax, 28(%esp)
.LVL3905:
	movl	36(%esp), %eax
	movl	%eax, 40(%esp)
.LVL3906:
	movl	%esi, %eax
	jmp	.L3132
.LVL3907:
	.p2align 4,,7
	.p2align 3
.L3160:
	.loc 21 80 0
	cmpl	28(%esp), %eax
	ja	.L3145
	.loc 21 82 0
	movl	28(%esp), %esi
	movl	%ebx, %edx
	subl	%ebp, %edx
	subl	%eax, %esi
	cmpl	%edx, %esi
	ja	.L3146
	movl	28(%esp), %edx
	movl	%ebp, 40(%esp)
	movl	%eax, %ebp
	movl	%ebx, 28(%esp)
	movl	%edx, 32(%esp)
	jmp	.L3128
.LVL3908:
	.p2align 4,,7
	.p2align 3
.L3152:
	movl	24(%esp), %eax
	movl	%edx, %ebx
.LVL3909:
	.loc 21 69 0
	movl	$1, %ecx
	movl	%edi, 32(%esp)
.LVL3910:
	movl	20(%esp), %ebp
.LVL3911:
	movl	%eax, 28(%esp)
.LVL3912:
	movl	36(%esp), %eax
	movl	%eax, 40(%esp)
.LVL3913:
	movl	%esi, %eax
	jmp	.L3132
.LVL3914:
	.p2align 4,,7
	.p2align 3
.L3162:
	.loc 21 104 0
	movl	$.LC159, (%esp)
	call	printf
.LVL3915:
	.loc 21 116 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 21 105 0
	xorl	%eax, %eax
	.loc 21 116 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3916:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3917:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3918:
	ret
.LVL3919:
	.p2align 4,,7
	.p2align 3
.L3150:
	.cfi_restore_state
	movl	%ecx, 44(%esp)
	movl	%edi, %ecx
	movl	%edx, %edi
	movl	%esi, 36(%esp)
	jmp	.L3133
.LVL3920:
	.p2align 4,,7
	.p2align 3
.L3146:
	.loc 21 82 0
	movl	%eax, 40(%esp)
	movl	%ebx, 32(%esp)
.LVL3921:
	jmp	.L3128
.LVL3922:
	.p2align 4,,7
	.p2align 3
.L3155:
.LBB10527:
.LBB10517:
	.loc 21 37 0
	movl	$ndks_boot, %eax
.LVL3923:
.L3138:
	.loc 21 38 0
	movl	40(%esp), %edi
	movl	%edi, (%eax)
	movl	28(%esp), %edi
	movl	%edi, 4(%eax)
	jmp	.L3137
.LVL3924:
	.p2align 4,,7
	.p2align 3
.L3156:
.LBE10517:
.LBE10527:
.LBB10528:
.LBB10522:
	.loc 21 37 0
	movl	$ndks_boot, %eax
.LVL3925:
.L3141:
	.loc 21 38 0
	movl	32(%esp), %edi
	movl	%ebp, (%eax)
	movl	%edi, 4(%eax)
	jmp	.L3159
.LVL3926:
	.p2align 4,,7
	.p2align 3
.L3164:
	.loc 21 37 0
	movl	$ndks_boot+8, %eax
.LVL3927:
	jmp	.L3141
.LVL3928:
	.p2align 4,,7
	.p2align 3
.L3163:
.LBE10522:
.LBE10528:
.LBB10529:
.LBB10518:
	movl	$ndks_boot+8, %eax
.LVL3929:
	jmp	.L3138
.LVL3930:
.L3139:
	call	insert_region.part.156
.LVL3931:
.LBE10518:
.LBE10529:
	.cfi_endproc
.LFE432:
	.size	alloc_region, .-alloc_region
	.section	.rodata.str1.4
	.align 4
.LC161:
	.string	"Kernel init failed: ran out of cap slots\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	provide_cap
	.type	provide_cap, @function
provide_cap:
.LFB440:
	.loc 21 275 0
	.cfi_startproc
.LVL3932:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 21 276 0
	movl	ndks_boot+20, %ebx
	cmpl	ndks_boot+24, %ebx
	.loc 21 275 0
	movl	32(%esp), %eax
	movl	36(%esp), %esi
	.loc 21 276 0
	jae	.L3198
.LVL3933:
.LBB10590:
.LBB10591:
.LBB10592:
.LBB10593:
	.loc 27 872 0
	movl	%eax, %edi
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %ecx
.LVL3934:
	cmpl	$14, %edi
	cmove	%ecx, %edx
.LVL3935:
.LBE10593:
.LBE10592:
	.loc 40 428 0
	cmpl	$62, %edx
	ja	.L3170
	jmp	*.L3172(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L3172:
	.long	.L3194
	.long	.L3173
	.long	.L3174
	.long	.L3175
	.long	.L3176
	.long	.L3177
	.long	.L3178
	.long	.L3194
	.long	.L3194
	.long	.L3179
	.long	.L3180
	.long	.L3194
	.long	.L3181
	.long	.L3170
	.long	.L3194
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3194
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3182
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3170
	.long	.L3194
	.section	.boot.text
.LVL3936:
	.p2align 4,,7
	.p2align 3
.L3198:
.LBE10591:
.LBE10590:
	.loc 21 277 0
	movl	$.LC161, (%esp)
	call	printf
.LVL3937:
	.loc 21 283 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	.loc 21 278 0
	xorl	%eax, %eax
	.loc 21 283 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3938:
	.p2align 4,,7
	.p2align 3
.L3194:
	.cfi_restore_state
.LBB10642:
.LBB10640:
	.loc 40 457 0
	xorl	%eax, %eax
.LVL3939:
	.p2align 4,,7
	.p2align 3
.L3171:
.LBE10640:
.LBE10642:
	.loc 21 280 0
	sall	$4, %ebx
.LBB10643:
.LBB10644:
	.loc 21 121 0
	movl	44(%esp), %edx
.LBE10644:
.LBE10643:
	.loc 21 280 0
	addl	%eax, %ebx
.LVL3940:
.LBB10648:
.LBB10647:
	.loc 21 121 0
	movl	40(%esp), %eax
	.loc 21 123 0
	movl	$0, 8(%ebx)
.LBB10645:
.LBB10646:
	.loc 27 819 0
	movl	$3, 12(%ebx)
.LBE10646:
.LBE10645:
	.loc 21 121 0
	movl	%edx, 4(%ebx)
.LVL3941:
	movl	%eax, (%ebx)
.LBE10647:
.LBE10648:
	.loc 21 282 0
	movl	$1, %eax
	.loc 21 281 0
	addl	$1, ndks_boot+20
	.loc 21 283 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3942:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3943:
	.p2align 4,,7
	.p2align 3
.L3173:
	.cfi_restore_state
.LBB10649:
.LBB10641:
.LBB10594:
.LBB10595:
	.loc 27 1507 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L3199
.LVL3944:
.L3193:
.LBE10595:
.LBE10594:
.LBB10597:
.LBB10598:
	.loc 27 1765 0
	andl	$16777200, %eax
.LVL3945:
	sall	$8, %eax
	jmp	.L3171
.LVL3946:
	.p2align 4,,7
	.p2align 3
.L3174:
.LBE10598:
.LBE10597:
.LBB10600:
.LBB10601:
	.loc 27 965 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	jne	.L3200
.LVL3947:
.L3185:
.LBE10601:
.LBE10600:
.LBB10603:
.LBB10604:
	.loc 27 1190 0
	andl	$-16, %eax
.LVL3948:
	jmp	.L3171
.LVL3949:
	.p2align 4,,7
	.p2align 3
.L3175:
.LBE10604:
.LBE10603:
.LBB10606:
.LBB10607:
	.loc 27 1619 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$3, %edx
	je	.L3193
	call	cap_page_table_cap_get_capPTBasePtr.isra.92.part.93
.LVL3950:
	.p2align 4,,7
	.p2align 3
.L3176:
.LBE10607:
.LBE10606:
.LBB10608:
.LBB10609:
	.loc 27 1088 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$4, %edx
	je	.L3185
	call	cap_endpoint_cap_get_capEPPtr.isra.65.part.66
.LVL3951:
	.p2align 4,,7
	.p2align 3
.L3177:
.LBE10609:
.LBE10608:
.LBB10610:
.LBB10611:
	.loc 27 1708 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$5, %edx
	je	.L3193
	call	cap_page_directory_cap_get_capPDBasePtr.isra.67.part.68
.LVL3952:
	.p2align 4,,7
	.p2align 3
.L3178:
.LBE10611:
.LBE10610:
.LBB10612:
.LBB10605:
	.loc 27 1187 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$6, %edx
	je	.L3185
	call	cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87
.LVL3953:
	.p2align 4,,7
	.p2align 3
.L3181:
.LBE10605:
.LBE10612:
.LBB10613:
.LBB10614:
	.loc 27 1359 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$12, %edx
	jne	.L3201
.LBE10614:
.LBE10613:
	.loc 40 442 0
	andl	$-1024, %eax
.LVL3954:
	jmp	.L3171
.LVL3955:
	.p2align 4,,7
	.p2align 3
.L3182:
.LBB10616:
.LBB10617:
.LBB10618:
.LBB10619:
.LBB10620:
.LBB10621:
	.loc 27 1891 0
	cmpb	$46, %al
	jne	.L3202
	.loc 27 1894 0
	andl	$16128, %eax
.LVL3956:
	movl	%eax, %ecx
.LVL3957:
.LBE10621:
.LBE10620:
	.loc 40 90 0
	movl	$-16, %eax
.LBB10624:
.LBB10622:
	.loc 27 1894 0
	shrl	$8, %ecx
.LBE10622:
.LBE10624:
	.loc 40 90 0
	cmpl	$32, %ecx
	je	.L3192
	addl	$1, %ecx
	movb	$-1, %al
	sall	%cl, %eax
.L3192:
.LVL3958:
.LBE10619:
.LBE10618:
	.loc 40 107 0
	andl	%esi, %eax
	jmp	.L3171
.LVL3959:
	.p2align 4,,7
	.p2align 3
.L3179:
.LBE10617:
.LBE10616:
.LBB10629:
.LBB10599:
	.loc 27 1762 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$9, %edx
	je	.L3193
	call	cap_asid_pool_cap_get_capASIDPool.isra.99.part.100
.LVL3960:
	.p2align 4,,7
	.p2align 3
.L3180:
.LBE10599:
.LBE10629:
.LBB10630:
.LBB10631:
	.loc 27 1332 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$10, %edx
	jne	.L3203
	.loc 27 1335 0
	andl	$2147483632, %eax
.LVL3961:
	addl	%eax, %eax
	jmp	.L3171
.LVL3962:
	.p2align 4,,7
	.p2align 3
.L3170:
.LBE10631:
.LBE10630:
.LBB10633:
.LBB10634:
	.loc 40 487 0
	movl	$__func__.2498, 12(%esp)
	movl	$487, 8(%esp)
	movl	$.LC55, 4(%esp)
	movl	$.LC56, (%esp)
	call	_fail
.LVL3963:
.L3202:
.LBE10634:
.LBE10633:
.LBB10635:
.LBB10628:
.LBB10627:
.LBB10626:
.LBB10625:
.LBB10623:
	call	cap_zombie_cap_get_capZombieType.isra.94.part.95
.LVL3964:
.L3201:
.LBE10623:
.LBE10625:
.LBE10626:
.LBE10627:
.LBE10628:
.LBE10635:
.LBB10636:
.LBB10615:
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL3965:
.L3200:
.LBE10615:
.LBE10636:
.LBB10637:
.LBB10602:
	.p2align 4,,5
	call	cap_untyped_cap_get_capPtr.isra.84.part.85
.LVL3966:
.L3199:
.LBE10602:
.LBE10637:
.LBB10638:
.LBB10596:
	.p2align 4,,5
	call	cap_frame_cap_get_capFBasePtr.isra.90.part.91
.LVL3967:
.L3203:
.LBE10596:
.LBE10638:
.LBB10639:
.LBB10632:
	.p2align 4,,5
	call	cap_cnode_cap_get_capCNodePtr.isra.62.part.63
.LVL3968:
.LBE10632:
.LBE10639:
.LBE10641:
.LBE10649:
	.cfi_endproc
.LFE440:
	.size	provide_cap, .-provide_cap
	.section	.rodata.str1.1
.LC162:
	.string	"receive"
.LC163:
	.string	"send"
.LC164:
	.string	"code"
.LC165:
	.string	"data"
.LC166:
	.string	"null fault"
	.section	.rodata.str1.4
	.align 4
.LC167:
	.string	"cap fault in %s phase at address 0x%x"
	.align 4
.LC168:
	.string	"vm fault on %s at address 0x%x with status 0x%x"
	.section	.rodata.str1.1
.LC169:
	.string	"unknown syscall 0x%x"
.LC170:
	.string	"user exception 0x%x code 0x%x"
.LC171:
	.string	"unknown fault"
	.text
	.p2align 4,,15
	.type	print_fault, @function
print_fault:
.LFB461:
	.loc 47 72 0
	.cfi_startproc
.LVL3969:
.LBB10668:
.LBB10669:
	.loc 27 1928 0
	movl	%eax, %ecx
.LBE10669:
.LBE10668:
	.loc 47 72 0
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
.LBB10671:
.LBB10670:
	.loc 27 1928 0
	andl	$7, %ecx
.LBE10670:
.LBE10671:
	.loc 47 72 0
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 47 73 0
	cmpl	$4, %ecx
	ja	.L3205
	jmp	*.L3207(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L3207:
	.long	.L3206
	.long	.L3208
	.long	.L3209
	.long	.L3210
	.long	.L3211
	.text
	.p2align 4,,7
	.p2align 3
.L3210:
.LVL3970:
	.loc 47 89 0
	movl	%edx, 4(%esp)
	movl	$.LC169, (%esp)
	call	printf
.LVL3971:
	.loc 47 101 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL3972:
	.p2align 4,,7
	.p2align 3
.L3206:
	.cfi_restore_state
	.loc 47 75 0
	movl	$.LC166, (%esp)
	call	printf
.LVL3973:
	.loc 47 101 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL3974:
	.p2align 4,,7
	.p2align 3
.L3208:
	.cfi_restore_state
	.loc 47 78 0
	testl	%eax, %eax
	movl	$.LC162, %ecx
	movl	$.LC163, %eax
.LVL3975:
	cmovns	%eax, %ecx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	$.LC167, (%esp)
	call	printf
.LVL3976:
	.loc 47 101 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL3977:
	.p2align 4,,7
	.p2align 3
.L3211:
	.cfi_restore_state
.LBB10672:
.LBB10673:
	.loc 27 2088 0
	shrl	$3, %eax
.LVL3978:
.LBE10673:
.LBE10672:
	.loc 47 93 0
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$.LC170, (%esp)
	call	printf
.LVL3979:
	.loc 47 101 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL3980:
	.p2align 4,,7
	.p2align 3
.L3209:
	.cfi_restore_state
.LBB10674:
.LBB10675:
	.loc 27 2020 0
	movl	%eax, %ebx
.LBE10675:
.LBE10674:
	.loc 47 83 0
	movl	$.LC164, %ecx
.LBB10677:
.LBB10676:
	.loc 27 2020 0
	shrl	$27, %ebx
.LVL3981:
.LBE10676:
.LBE10677:
	.loc 47 83 0
	testl	$524288, %eax
	movl	$.LC165, %eax
.LVL3982:
	cmove	%eax, %ecx
	movl	%ebx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	$.LC168, (%esp)
	call	printf
.LVL3983:
	.loc 47 101 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL3984:
	.p2align 4,,7
	.p2align 3
.L3205:
	.cfi_restore_state
	.loc 47 98 0
	movl	$.LC171, (%esp)
	call	printf
.LVL3985:
	.loc 47 101 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE461:
	.size	print_fault, .-print_fault
	.section	.rodata.str1.4
	.align 4
.LC172:
	.string	"CNode SaveCaller: Reply cap not present."
	.align 4
.LC173:
	.string	"caller capability must be null or reply"
	.text
	.p2align 4,,15
	.globl	invokeCNodeSaveCaller
	.type	invokeCNodeSaveCaller, @function
invokeCNodeSaveCaller:
.LFB511:
	.loc 26 358 0
	.cfi_startproc
.LVL3986:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 26 362 0
	movl	ksCurThread, %edx
	movl	%edx, %eax
	andl	$-1024, %eax
	leal	48(%eax), %esi
.LVL3987:
	.loc 26 363 0
	movl	48(%eax), %eax
	movl	4(%esi), %edi
.LVL3988:
.LBB10678:
.LBB10679:
	.loc 27 872 0
	movl	%eax, %ebp
	.loc 27 873 0
	movl	%eax, %ebx
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %ebx
	movzbl	%al, %ecx
	cmpl	$14, %ebp
	cmovne	%ebx, %ecx
.LBE10679:
.LBE10678:
	.loc 26 365 0
	testl	%ecx, %ecx
	je	.L3222
	cmpl	$8, %ecx
	jne	.L3228
.LVL3989:
.LBB10680:
.LBB10681:
	.loc 27 1237 0
	cmpl	$8, %ebx
	jne	.L3229
.LBE10681:
.LBE10680:
	.loc 26 371 0
	testl	$1, %edi
	je	.L3230
.LVL3990:
.L3224:
	.loc 26 382 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3991:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3992:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3993:
	.p2align 4,,7
	.p2align 3
.L3228:
	.cfi_restore_state
	.loc 26 377 0
	movl	$__func__.6467, 12(%esp)
	movl	$377, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC173, (%esp)
	call	_fail
.LVL3994:
	.p2align 4,,7
	.p2align 3
.L3222:
	.loc 26 367 0
	movl	44(%edx), %eax
.LVL3995:
	movl	%edx, 12(%esp)
.LVL3996:
	movl	$367, 8(%esp)
	movl	$__func__.6467, 4(%esp)
	movl	%eax, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL3997:
	movl	$.LC172, (%esp)
	call	printf
.LVL3998:
	movl	$.LC20, (%esp)
	call	printf
.LVL3999:
	.loc 26 382 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4000:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4001:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4002:
	.p2align 4,,7
	.p2align 3
.L3230:
	.cfi_restore_state
	.loc 26 372 0
	movl	64(%esp), %edx
	movl	%esi, 8(%esp)
	movl	%eax, (%esp)
	movl	%edi, 4(%esp)
	movl	%edx, 12(%esp)
	call	cteMove
.LVL4003:
	jmp	.L3224
.LVL4004:
.L3229:
.LBB10683:
.LBB10682:
	call	cap_reply_cap_get_capReplyMaster.part.53
.LVL4005:
.LBE10682:
.LBE10683:
	.cfi_endproc
.LFE511:
	.size	invokeCNodeSaveCaller, .-invokeCNodeSaveCaller
	.section	.rodata.str1.4
	.align 4
.LC174:
	.string	"Domain Configure: Truncated message."
	.align 4
.LC175:
	.string	"Domain Configure: invalid domain (%d >= %d)."
	.align 4
.LC176:
	.string	"Domain Configure: thread cap required."
	.text
	.p2align 4,,15
	.globl	decodeDomainInvocation
	.type	decodeDomainInvocation, @function
decodeDomainInvocation:
.LFB591:
	.loc 30 719 0
	.cfi_startproc
.LVL4006:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 30 723 0
	cmpl	$26, 64(%esp)
	movl	72(%esp), %edx
.LVL4007:
	jne	.L3256
	.loc 30 728 0
	movl	68(%esp), %ecx
	.loc 30 729 0
	movl	ksCurThread, %eax
	.loc 30 728 0
	testl	%ecx, %ecx
	je	.L3257
.LVL4008:
.LBB10731:
.LBB10732:
.LBB10733:
.LBB10734:
	.loc 13 27 0
	movl	20(%eax), %ebx
.LBE10734:
.LBE10733:
.LBE10732:
.LBE10731:
	.loc 30 734 0
	testl	%ebx, %ebx
	jne	.L3258
	.loc 30 743 0
	testl	%edx, %edx
	je	.L3259
	.loc 30 749 0
	movl	(%edx), %ebx
.LVL4009:
.LBB10735:
.LBB10736:
	.loc 27 872 0
	movl	%ebx, %ecx
	.loc 27 873 0
	movl	%ebx, %esi
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %esi
	movzbl	%bl, %edx
.LVL4010:
	cmpl	$14, %ecx
	cmovne	%esi, %edx
.LBE10736:
.LBE10735:
	.loc 30 750 0
	cmpl	$12, %edx
	jne	.L3260
.LVL4011:
.LBB10737:
.LBB10738:
.LBB10739:
.LBB10740:
	.loc 27 626 0
	movl	592(%eax), %edx
	andl	$-16, %edx
	.loc 27 627 0
	orl	$2, %edx
	movl	%edx, 592(%eax)
.LBE10740:
.LBE10739:
	.loc 22 428 0
	movl	%eax, (%esp)
	call	scheduleTCB
.LVL4012:
.LBE10738:
.LBE10737:
.LBB10741:
.LBB10742:
	.loc 27 1359 0
	cmpl	$12, %esi
	jne	.L3261
	.loc 27 1362 0
	andl	$-16, %ebx
.LVL4013:
.LBE10742:
.LBE10741:
.LBB10744:
.LBB10745:
.LBB10746:
.LBB10747:
	.loc 30 97 0
	movl	600(%ebx), %eax
	testb	$1, %al
	movl	%eax, %ecx
	jne	.L3262
.L3241:
.LBE10747:
.LBE10746:
.LBB10764:
.LBB10765:
.LBB10766:
.LBB10767:
	.loc 27 614 0
	movl	592(%ebx), %edx
.LBE10767:
.LBE10766:
.LBE10765:
.LBE10764:
	.loc 22 362 0
	movl	$0, 620(%ebx)
.LVL4014:
.LBB10771:
.LBB10770:
.LBB10769:
.LBB10768:
	.loc 27 614 0
	andl	$15, %edx
.LBE10768:
.LBE10769:
	.loc 22 49 0
	subl	$1, %edx
	cmpl	$1, %edx
	jbe	.L3263
.L3245:
.LBE10770:
.LBE10771:
.LBE10745:
.LBE10744:
	.loc 30 759 0
	xorl	%eax, %eax
.LBB10779:
.LBB10776:
	.loc 22 366 0
	cmpl	ksCurThread, %ebx
	je	.L3264
.LVL4015:
.L3251:
.LBE10776:
.LBE10779:
	.loc 30 760 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4016:
	.p2align 4,,7
	.p2align 3
.L3263:
	.cfi_restore_state
.LBB10780:
.LBB10777:
.LBB10772:
.LBB10773:
	.loc 30 37 0
	andl	$1, %ecx
	jne	.L3245
	movl	%ebx, %eax
	call	tcbSchedEnqueue.part.197
.LVL4017:
	.p2align 4,,3
	jmp	.L3245
.LVL4018:
	.p2align 4,,7
	.p2align 3
.L3258:
.LBE10773:
.LBE10772:
.LBE10777:
.LBE10780:
	.loc 30 735 0
	movl	44(%eax), %edx
.LVL4019:
	movl	%eax, 12(%esp)
	movl	$736, 8(%esp)
	movl	$__func__.7216, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL4020:
	.loc 30 735 0
	movl	%ebx, 4(%esp)
	movl	$1, 8(%esp)
	movl	$.LC175, (%esp)
	call	printf
.LVL4021:
	movl	$.LC20, (%esp)
	call	printf
.LVL4022:
	.loc 30 739 0
	movl	$3, %eax
	.loc 30 737 0
	movl	$1, current_syscall_error+24
	.loc 30 738 0
	movl	$0, current_syscall_error
	.loc 30 760 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4023:
	.p2align 4,,7
	.p2align 3
.L3262:
	.cfi_restore_state
.LBB10781:
.LBB10778:
.LBB10774:
.LBB10762:
.LBB10748:
.LBB10749:
.LBB10750:
.LBB10751:
	.loc 30 30 0
	movl	620(%ebx), %edx
.LBE10751:
.LBE10750:
	.loc 30 108 0
	movl	644(%ebx), %ecx
.LBB10753:
.LBB10752:
	.loc 30 30 0
	sall	$8, %edx
	addl	624(%ebx), %edx
.LBE10752:
.LBE10753:
	.loc 30 108 0
	testl	%ecx, %ecx
	.loc 30 106 0
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %ebp
.LVL4024:
	movl	4(%esi), %edi
	movl	%edi, 28(%esp)
.LVL4025:
	.loc 30 108 0
	je	.L3242
	.loc 30 109 0
	movl	640(%ebx), %edi
.LVL4026:
	movl	%edi, 640(%ecx)
.LVL4027:
	movl	640(%ebx), %edi
.L3243:
	.loc 30 114 0
	testl	%edi, %edi
	je	.L3249
	.loc 30 115 0
	movl	%ecx, 644(%edi)
	movl	28(%esp), %edi
.LVL4028:
.L3244:
.LBB10754:
.LBB10755:
	.loc 27 577 0
	andl	$-2, %eax
.LBE10755:
.LBE10754:
	.loc 30 120 0
	movl	%ebp, ksReadyQueues(,%edx,8)
.LVL4029:
.LBB10758:
.LBB10756:
	.loc 27 577 0
	movl	%eax, %ecx
.LBE10756:
.LBE10758:
	.loc 30 120 0
	movl	%edi, 4(%esi)
.LVL4030:
.LBB10759:
.LBB10757:
	.loc 27 577 0
	movl	%eax, 600(%ebx)
	jmp	.L3241
.LVL4031:
	.p2align 4,,7
	.p2align 3
.L3264:
	movl	%eax, 28(%esp)
.LBE10757:
.LBE10759:
.LBE10749:
.LBE10748:
.LBE10762:
.LBE10774:
	.loc 22 367 0
	call	rescheduleRequired
.LVL4032:
	movl	28(%esp), %eax
	jmp	.L3251
.LVL4033:
	.p2align 4,,7
	.p2align 3
.L3242:
.LBB10775:
.LBB10763:
.LBB10761:
.LBB10760:
	.loc 30 111 0
	movl	640(%ebx), %ebp
.LVL4034:
	movl	%ebp, %edi
.LVL4035:
	jmp	.L3243
.LVL4036:
	.p2align 4,,7
	.p2align 3
.L3249:
	.loc 30 108 0
	movl	%ecx, 28(%esp)
.LVL4037:
	movl	%ecx, %edi
	jmp	.L3244
.LVL4038:
.L3257:
.LBE10760:
.LBE10761:
.LBE10763:
.LBE10775:
.LBE10778:
.LBE10781:
	.loc 30 729 0
	movl	44(%eax), %edx
.LVL4039:
	movl	%eax, 12(%esp)
	movl	$729, 8(%esp)
	movl	%edx, 16(%esp)
.LVL4040:
.L3255:
	.loc 30 744 0
	movl	$__func__.7216, 4(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL4041:
	movl	$.LC174, (%esp)
	call	printf
.LVL4042:
	movl	$.LC20, (%esp)
	call	printf
.LVL4043:
	.loc 30 746 0
	movl	$3, %eax
	.loc 30 745 0
	movl	$7, current_syscall_error+24
	.loc 30 746 0
	jmp	.L3251
.LVL4044:
.L3256:
	.loc 30 724 0
	movl	$3, current_syscall_error+24
	.loc 30 725 0
	movl	$3, %eax
	jmp	.L3251
.LVL4045:
.L3261:
.LBB10782:
.LBB10743:
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL4046:
.L3260:
.LBE10743:
.LBE10782:
	.loc 30 751 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$751, 8(%esp)
	movl	$__func__.7216, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL4047:
	movl	$.LC176, (%esp)
	call	printf
.LVL4048:
	movl	$.LC20, (%esp)
	call	printf
.LVL4049:
	.loc 30 754 0
	movl	$3, %eax
	.loc 30 752 0
	movl	$1, current_syscall_error+24
	.loc 30 753 0
	movl	$1, current_syscall_error
	.loc 30 754 0
	jmp	.L3251
.LVL4050:
.L3259:
	.loc 30 744 0
	movl	44(%eax), %edx
.LVL4051:
	movl	%eax, 12(%esp)
	movl	$744, 8(%esp)
	movl	%edx, 16(%esp)
	jmp	.L3255
	.cfi_endproc
.LFE591:
	.size	decodeDomainInvocation, .-decodeDomainInvocation
	.section	.rodata.str1.4
	.align 4
.LC177:
	.string	"Error: Mapping unknown ACPI table type\n"
	.align 4
.LC178:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/machine/acpi.c"
	.section	.rodata.str1.1
.LC179:
	.string	"false"
	.section	.boot.text
	.p2align 4,,15
	.globl	acpi_table_init
	.type	acpi_table_init, @function
acpi_table_init:
.LFB603:
	.file 49 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/machine/acpi.c"
	.loc 49 189 0
	.cfi_startproc
.LVL4052:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.loc 49 196 0
	movl	$4194303, %edx
	.loc 49 189 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 49 189 0
	movl	32(%esp), %ebx
.LVL4053:
	movl	36(%esp), %edi
	.loc 49 195 0
	movl	%ebx, %esi
	andl	$4194303, %esi
.LVL4054:
	.loc 49 196 0
	subl	%esi, %edx
	.loc 49 192 0
	cmpl	$36, %edx
	sbbl	%edx, %edx
	notl	%edx
	addl	$2, %edx
.LVL4055:
	.loc 49 201 0
	movl	%edx, 4(%esp)
	movl	%ebx, (%esp)
	call	map_temp_boot_page
.LVL4056:
	.loc 49 203 0
	testl	%edi, %edi
	je	.L3268
	cmpl	$1, %edi
	jne	.L3275
.LVL4057:
.LBB10791:
	.loc 49 211 0
	addl	4(%ebx), %esi
.LVL4058:
.L3274:
	movl	%esi, %eax
	movl	$1025, %edx
	mull	%edx
.LBE10791:
	.loc 49 221 0
	movl	%ebx, 32(%esp)
.LBB10792:
	.loc 49 211 0
	subl	%edx, %esi
	shrl	%esi
	addl	%edx, %esi
	shrl	$21, %esi
	addl	$1, %esi
.LVL4059:
.LBE10792:
	.loc 49 221 0
	movl	%esi, 36(%esp)
	.loc 49 224 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL4060:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL4061:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	.loc 49 221 0
	jmp	map_temp_boot_page
.LVL4062:
	.p2align 4,,7
	.p2align 3
.L3275:
	.cfi_restore_state
.LBB10793:
.LBB10794:
	.loc 49 215 0
	movl	$.LC177, (%esp)
	call	printf
.LVL4063:
	.loc 49 216 0
	movl	$__FUNCTION__.7482, 12(%esp)
	movl	$216, 8(%esp)
	movl	$.LC178, 4(%esp)
	movl	$.LC179, (%esp)
	call	_assert_fail
.LVL4064:
	.p2align 4,,7
	.p2align 3
.L3268:
.LBE10794:
.LBE10793:
.LBB10795:
	.loc 49 206 0
	addl	20(%ebx), %esi
.LVL4065:
	jmp	.L3274
.LBE10795:
	.cfi_endproc
.LFE603:
	.size	acpi_table_init, .-acpi_table_init
	.section	.rodata.str1.1
.LC180:
	.string	"Received reserved IRQ: %d\n"
	.text
	.p2align 4,,15
	.globl	handleReservedIRQ
	.type	handleReservedIRQ, @function
handleReservedIRQ:
.LFB611:
	.loc 25 78 0
	.cfi_startproc
.LVL4066:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 25 85 0
	movl	32(%esp), %eax
	movl	$.LC180, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL4067:
	.loc 25 86 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE611:
	.size	handleReservedIRQ, .-handleReservedIRQ
	.section	.rodata.str1.1
.LC181:
	.string	"PCI:     BAR[%d] "
.LC182:
	.string	"./plat/machine/hardware_gen.h"
	.section	.rodata.str1.4
	.align 4
.LC183:
	.string	"((pci_bar.words[0] >> 0) & 0x1) == pci_bar_pci_bar_mem"
	.align 4
.LC184:
	.string	"ignored: 64 bit BAR address above 4 GB\n"
	.section	.rodata.str1.1
.LC185:
	.string	"address=0x%x size=0x%x"
	.section	.rodata.str1.4
	.align 4
.LC186:
	.string	"ignored: size corrupted (not a power of two): 0x%x\n"
	.align 4
.LC187:
	.string	"ignored: address=0x%x not 4K aligned (size=0x%x)\n"
	.align 4
.LC188:
	.string	"ignored: PCI IO space not supported\n"
	.section	.boot.text
	.p2align 4,,15
	.type	pci_scan_bars, @function
pci_scan_bars:
.LFB624:
	.file 50 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/machine/pci.c"
	.loc 50 83 0
	.cfi_startproc
.LVL4068:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 50 92 0
	movzbl	64(%esp), %edi
	testl	%edi, %edi
	movl	%edi, 24(%esp)
	je	.L3278
	sall	$16, %eax
.LVL4069:
	xorl	%ebp, %ebp
	movl	%eax, 20(%esp)
	sall	$11, %edx
.LVL4070:
	orl	$-2147483648, 20(%esp)
	orl	%edx, 20(%esp)
	sall	$8, %ecx
.LVL4071:
	orl	%ecx, 20(%esp)
	jmp	.L3293
.LVL4072:
	.p2align 4,,7
	.p2align 3
.L3280:
	addl	$1, %ebp
.LVL4073:
	cmpl	%ebp, 24(%esp)
	jbe	.L3278
.LVL4074:
.L3293:
	.loc 50 93 0
	leal	0(,%ebp,4), %edi
.LVL4075:
.LBB10818:
.LBB10819:
	.loc 50 32 0
	leal	16(%edi), %ebx
	.loc 50 33 0
	movzbl	%bl, %ebx
	orl	20(%esp), %ebx
	movl	$3320, (%esp)
	movl	%ebx, 4(%esp)
	call	out32
.LVL4076:
	.loc 50 34 0
	movl	$3324, (%esp)
	call	in32
.LVL4077:
.LBE10819:
.LBE10818:
.LBB10821:
.LBB10822:
	.loc 50 41 0
	movl	%ebx, 4(%esp)
	movl	$3320, (%esp)
.LBE10822:
.LBE10821:
.LBB10824:
.LBB10820:
	.loc 50 34 0
	movl	%eax, 16(%esp)
.LVL4078:
.LBE10820:
.LBE10824:
.LBB10825:
.LBB10823:
	.loc 50 41 0
	call	out32
.LVL4079:
	.loc 50 42 0
	movl	$-1, 4(%esp)
	movl	$3324, (%esp)
	call	out32
.LVL4080:
.LBE10823:
.LBE10825:
.LBB10826:
.LBB10827:
	.loc 50 33 0
	movl	%ebx, 4(%esp)
	movl	$3320, (%esp)
	call	out32
.LVL4081:
	.loc 50 34 0
	movl	$3324, (%esp)
	call	in32
.LVL4082:
.LBE10827:
.LBE10826:
	.loc 50 99 0
	testl	%eax, %eax
	je	.L3280
	.loc 50 101 0
	movl	%ebp, 4(%esp)
	movl	$.LC181, (%esp)
	movl	%eax, 28(%esp)
	call	printf
.LVL4083:
	.loc 50 102 0
	movl	28(%esp), %edx
	testb	$1, %dl
	jne	.L3281
.LBB10828:
.LBB10829:
	.file 51 "./plat/machine/hardware_gen.h"
	.loc 51 29 0
	movl	%edx, %esi
.LBE10829:
.LBE10828:
	.loc 50 105 0
	movl	$4096, %eax
.LBB10831:
.LBB10830:
	.loc 51 29 0
	andl	$-16, %esi
.LBE10830:
.LBE10831:
	.loc 50 103 0
	negl	%esi
.LVL4084:
	.loc 50 105 0
	cmpl	$4095, %esi
	cmovbe	%eax, %esi
.LVL4085:
.LBB10832:
.LBB10833:
	.loc 51 26 0
	testb	$1, 16(%esp)
	jne	.L3299
	.loc 51 29 0
	movl	16(%esp), %ecx
	movl	%ecx, %eax
	andl	$-16, %eax
.LBE10833:
.LBE10832:
	.loc 50 108 0
	andl	$4080, %ecx
.LBB10838:
.LBB10836:
	.loc 51 29 0
	movl	%eax, 28(%esp)
.LBE10836:
.LBE10838:
	.loc 50 108 0
	jne	.L3284
	xorl	%ecx, %ecx
	.p2align 4,,7
	.p2align 3
.L3286:
.LVL4086:
	.loc 50 112 0
	addl	$1, %ecx
.LVL4087:
	.loc 50 111 0
	btl	%ecx, %esi
	jnc	.L3286
	.loc 50 115 0
	movl	$1, %eax
	sall	%cl, %eax
	cmpl	%esi, %eax
	jne	.L3287
.LVL4088:
	.loc 50 117 0
	andl	$4, %edx
.LVL4089:
	je	.L3288
.LVL4090:
.LBB10839:
.LBB10840:
	.loc 50 32 0
	leal	20(%edi), %eax
	.loc 50 33 0
	movzbl	%al, %edi
.LVL4091:
	orl	20(%esp), %edi
	movl	$3320, (%esp)
	movl	%edi, 4(%esp)
	call	out32
.LVL4092:
	.loc 50 34 0
	movl	$3324, (%esp)
	call	in32
.LVL4093:
.LBE10840:
.LBE10839:
	.loc 50 118 0
	testl	%eax, %eax
	je	.L3289
	.loc 50 119 0
	movl	$.LC184, (%esp)
	call	printf
.LVL4094:
.L3290:
	.loc 50 128 0 discriminator 1
	addl	$1, %ebp
.LVL4095:
	.p2align 4,,7
	.p2align 3
.L3291:
.LBB10841:
.LBB10842:
	.loc 50 41 0
	movl	%ebx, 4(%esp)
.LBE10842:
.LBE10841:
	.loc 50 92 0
	addl	$1, %ebp
.LVL4096:
.LBB10844:
.LBB10843:
	.loc 50 41 0
	movl	$3320, (%esp)
	call	out32
.LVL4097:
	.loc 50 42 0
	movl	16(%esp), %eax
	movl	$3324, (%esp)
	movl	%eax, 4(%esp)
	call	out32
.LVL4098:
.LBE10843:
.LBE10844:
	.loc 50 92 0
	cmpl	%ebp, 24(%esp)
	ja	.L3293
.LVL4099:
.L3278:
	.loc 50 151 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4100:
	.p2align 4,,7
	.p2align 3
.L3281:
	.cfi_restore_state
	.loc 50 145 0
	movl	$.LC188, (%esp)
	call	printf
.LVL4101:
	jmp	.L3291
.LVL4102:
	.p2align 4,,7
	.p2align 3
.L3287:
	.loc 50 138 0
	movl	%esi, 4(%esp)
	movl	$.LC186, (%esp)
	call	printf
.LVL4103:
	jmp	.L3291
	.p2align 4,,7
	.p2align 3
.L3284:
	.loc 50 141 0
	movl	%esi, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC187, (%esp)
	call	printf
.LVL4104:
	jmp	.L3291
.LVL4105:
	.p2align 4,,7
	.p2align 3
.L3288:
	.loc 50 130 0
	movl	28(%esp), %edi
.LVL4106:
	movl	%esi, 8(%esp)
	movl	$.LC185, (%esp)
	movl	%edi, 4(%esp)
	.loc 50 133 0
	addl	%edi, %esi
.LVL4107:
	.loc 50 130 0
	call	printf
.LVL4108:
	.loc 50 131 0
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	call	insert_dev_p_reg
.LVL4109:
	jmp	.L3291
.LVL4110:
	.p2align 4,,7
	.p2align 3
.L3289:
	.loc 50 121 0
	movl	28(%esp), %edi
	movl	%esi, 8(%esp)
	movl	$.LC185, (%esp)
	movl	%edi, 4(%esp)
	.loc 50 124 0
	addl	%edi, %esi
.LVL4111:
	.loc 50 121 0
	call	printf
.LVL4112:
	.loc 50 122 0
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	call	insert_dev_p_reg
.LVL4113:
	jmp	.L3290
.LVL4114:
.L3299:
.LBB10845:
.LBB10837:
.LBB10834:
.LBB10835:
	.loc 51 26 0
	movl	$__FUNCTION__.2627, 12(%esp)
	movl	$27, 8(%esp)
	movl	$.LC182, 4(%esp)
	movl	$.LC183, (%esp)
	call	_assert_fail
.LVL4115:
.LBE10835:
.LBE10834:
.LBE10837:
.LBE10845:
	.cfi_endproc
.LFE624:
	.size	pci_scan_bars, .-pci_scan_bars
	.section	.rodata.str1.4
	.align 4
.LC189:
	.string	"PCI: Detected device @ bus=0x%x dev=0x%x fun=0x%x: vid=0x%x did=0x%x type="
	.section	.rodata.str1.1
.LC190:
	.string	"normal\n"
.LC191:
	.string	"bridge\n"
.LC192:
	.string	"cardbus\n"
.LC193:
	.string	"unknown (0x%x)\n"
	.section	.boot.text
	.p2align 4,,15
	.type	pci_scan_fun, @function
pci_scan_fun:
.LFB625:
	.loc 50 155 0
	.cfi_startproc
.LVL4116:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	.loc 50 160 0
	movzbl	%al, %eax
	.loc 50 155 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	.loc 50 160 0
	movzbl	%cl, %edi
	.loc 50 155 0
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	.loc 50 160 0
	movzbl	%dl, %esi
	.loc 50 155 0
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
.LBB10852:
.LBB10853:
	.loc 50 49 0
	movl	%esi, %ebx
.LBE10853:
.LBE10852:
	.loc 50 155 0
	subl	$60, %esp
	.cfi_def_cfa_offset 80
.LBB10856:
.LBB10854:
	.loc 50 49 0
	movl	%edi, %ecx
.LBE10854:
.LBE10856:
	.loc 50 160 0
	movl	%eax, 36(%esp)
.LVL4117:
.LBB10857:
.LBB10855:
	.loc 50 49 0
	sall	$11, %ebx
	sall	$16, %eax
.LVL4118:
	sall	$8, %ecx
.LVL4119:
	orl	%eax, %ebx
	orl	%ecx, %ebx
	movl	%ebx, %ebp
	orl	$-2147483648, %ebp
	movl	%ebp, 4(%esp)
	movl	$3320, (%esp)
	call	out32
.LVL4120:
	.loc 50 50 0
	movl	$3324, (%esp)
	call	in32
.LVL4121:
	movl	%eax, %ecx
.LBE10855:
.LBE10857:
	.loc 50 193 0
	xorl	%eax, %eax
	.loc 50 161 0
	cmpw	$-1, %cx
	movl	%ecx, 40(%esp)
	je	.L3301
.LVL4122:
.LBB10858:
.LBB10859:
	.loc 50 49 0
	movl	%ebp, 4(%esp)
.LBE10859:
.LBE10858:
.LBB10863:
.LBB10864:
	.loc 50 67 0
	orl	$-2147483636, %ebx
.LBE10864:
.LBE10863:
.LBB10869:
.LBB10860:
	.loc 50 49 0
	movl	$3320, (%esp)
	call	out32
.LVL4123:
	.loc 50 50 0
	movl	$3324, (%esp)
	call	in32
.LVL4124:
.LBE10860:
.LBE10869:
.LBB10870:
.LBB10865:
	.loc 50 67 0
	movl	%ebx, 4(%esp)
	movl	$3320, (%esp)
.LBE10865:
.LBE10870:
.LBB10871:
.LBB10861:
	.loc 50 50 0
	movl	%eax, %ebp
.LVL4125:
.LBE10861:
.LBE10871:
.LBB10872:
.LBB10866:
	.loc 50 67 0
	call	out32
.LVL4126:
.LBE10866:
.LBE10872:
.LBB10873:
.LBB10862:
	.loc 50 50 0
	shrl	$16, %ebp
.LBE10862:
.LBE10873:
.LBB10874:
.LBB10867:
	.loc 50 68 0
	movl	$3324, (%esp)
	call	in32
.LVL4127:
	movl	40(%esp), %ecx
.LBE10867:
.LBE10874:
	.loc 50 165 0
	movl	%ebp, 20(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 8(%esp)
	movzwl	%cx, %ecx
	movl	%ecx, 16(%esp)
.LBB10875:
.LBB10868:
	.loc 50 68 0
	shrl	$16, %eax
.LBE10868:
.LBE10875:
	.loc 50 164 0
	movl	%eax, %edx
	.loc 50 165 0
	movl	36(%esp), %eax
	.loc 50 164 0
	andl	$127, %edx
	.loc 50 165 0
	movl	$.LC189, (%esp)
	.loc 50 164 0
	movl	%edx, 44(%esp)
.LVL4128:
	.loc 50 165 0
	movl	%eax, 4(%esp)
	call	printf
.LVL4129:
	.loc 50 170 0
	movl	44(%esp), %edx
	cmpb	$1, %dl
	je	.L3303
	jb	.L3304
	cmpb	$2, %dl
	jne	.L3310
	.loc 50 182 0
	movl	$.LC192, (%esp)
	call	printf
.LVL4130:
	.loc 50 183 0
	movl	$1, (%esp)
.L3309:
	movl	36(%esp), %eax
	movl	%edi, %ecx
	movl	%esi, %edx
	call	pci_scan_bars
.LVL4131:
	.loc 50 191 0
	movl	$1, %eax
.LVL4132:
.L3301:
	.loc 50 194 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4133:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4134:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4135:
	.p2align 4,,7
	.p2align 3
.L3310:
	.cfi_restore_state
	.loc 50 187 0
	movzbl	%dl, %edx
	movl	%edx, 4(%esp)
	movl	$.LC193, (%esp)
	call	printf
.LVL4136:
	.loc 50 194 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 50 191 0
	movl	$1, %eax
	.loc 50 194 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3303:
	.cfi_restore_state
	.loc 50 177 0
	movl	$.LC191, (%esp)
	call	printf
.LVL4137:
	.loc 50 178 0
	movl	$2, (%esp)
	jmp	.L3309
	.p2align 4,,7
	.p2align 3
.L3304:
	.loc 50 172 0
	movl	$.LC190, (%esp)
	call	printf
.LVL4138:
	.loc 50 173 0
	movl	$6, (%esp)
	jmp	.L3309
	.cfi_endproc
.LFE625:
	.size	pci_scan_fun, .-pci_scan_fun
	.section	.rodata.str1.4
	.align 4
.LC194:
	.string	"IRQControl: Illegal operation."
	.text
	.p2align 4,,15
	.globl	decodeIRQControlInvocation
	.type	decodeIRQControlInvocation, @function
decodeIRQControlInvocation:
.LFB544:
	.loc 29 29 0
	.cfi_startproc
.LVL4139:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 29 29 0
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	16(%ebp), %ebx
	movl	32(%ebp), %edi
	.loc 29 30 0
	cmpl	$20, %eax
	movl	20(%ebp), %edx
.LVL4140:
	je	.L3327
	.loc 29 74 0
	cmpl	$21, %eax
	je	.L3328
	.loc 29 77 0
	movl	ksCurThread, %eax
.LVL4141:
	movl	44(%eax), %edx
.LVL4142:
	movl	%eax, 12(%esp)
	movl	$77, 8(%esp)
	movl	$__func__.6751, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL4143:
	movl	$.LC194, (%esp)
	call	printf
.LVL4144:
	movl	$.LC20, (%esp)
	call	printf
.LVL4145:
	.loc 29 79 0
	movl	$3, %eax
	.loc 29 78 0
	movl	$3, current_syscall_error+24
.LVL4146:
.L3325:
	.loc 29 81 0
	leal	-12(%ebp), %esp
.LVL4147:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL4148:
	.p2align 4,,7
	.p2align 3
.L3328:
	.cfi_restore_state
.LBB10904:
.LBB10905:
	.loc 18 18 0
	movl	$3, current_syscall_error+24
.LBE10905:
.LBE10904:
	.loc 29 81 0
	leal	-12(%ebp), %esp
	.loc 29 75 0
	movb	$3, %al
	.loc 29 81 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL4149:
	.p2align 4,,7
	.p2align 3
.L3327:
	.cfi_restore_state
.LBB10906:
	.loc 29 38 0
	cmpl	$2, %ecx
	jbe	.L3313
	.loc 29 38 0 is_stmt 0 discriminator 1
	testl	%edx, %edx
	je	.L3313
.LVL4150:
.LBB10907:
.LBB10908:
	.loc 41 30 0 is_stmt 1
	movl	ksCurThread, %eax
.LVL4151:
.LBE10908:
.LBE10907:
.LBB10912:
.LBB10913:
	.loc 41 33 0
	testl	%edi, %edi
.LBE10913:
.LBE10912:
.LBB10917:
.LBB10911:
.LBB10909:
.LBB10910:
	.loc 13 27 0
	movl	20(%eax), %esi
.LVL4152:
.LBE10910:
.LBE10909:
.LBE10911:
.LBE10917:
.LBB10918:
.LBB10919:
.LBB10920:
.LBB10921:
	movl	24(%eax), %ecx
.LVL4153:
.LBE10921:
.LBE10920:
.LBE10919:
.LBE10918:
.LBB10922:
.LBB10914:
	.loc 41 33 0
	je	.L3329
.LBE10914:
.LBE10922:
	.loc 29 49 0
	cmpl	$31, %esi
	.loc 29 47 0
	movl	(%edx), %eax
.LVL4154:
.LBB10923:
.LBB10915:
	.loc 41 34 0
	movl	12(%edi), %edi
.LVL4155:
.LBE10915:
.LBE10923:
	.loc 29 47 0
	movl	4(%edx), %edx
.LVL4156:
	.loc 29 49 0
	jbe	.L3317
	.loc 29 50 0
	movl	$4, current_syscall_error+24
	.loc 29 53 0
	movl	$3, %eax
	.loc 29 51 0
	movl	$0, current_syscall_error+8
	.loc 29 52 0
	movl	$31, current_syscall_error+12
	.loc 29 53 0
	jmp	.L3325
.LVL4157:
	.p2align 4,,7
	.p2align 3
.L3313:
	.loc 29 39 0
	movl	$7, current_syscall_error+24
.LBE10906:
	.loc 29 81 0
	leal	-12(%ebp), %esp
.LBB10933:
	.loc 29 40 0
	movl	$3, %eax
.LBE10933:
	.loc 29 81 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL4158:
	.p2align 4,,7
	.p2align 3
.L3317:
	.cfi_restore_state
.LBB10934:
	.loc 29 56 0
	cmpl	$0, intStateIRQTable(,%esi,4)
	je	.L3318
	.loc 29 57 0
	movl	$9, current_syscall_error+24
	.loc 29 58 0
	movl	$3, %eax
	jmp	.L3325
	.p2align 4,,7
	.p2align 3
.L3318:
.LBB10924:
.LBB10925:
	.loc 42 129 0
	movl	%eax, 8(%esp)
	leal	-32(%ebp), %eax
	movl	%edi, 20(%esp)
	movl	%eax, (%esp)
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	$0, 4(%esp)
	call	lookupSlotForCNodeOp
.LVL4159:
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edi
.LVL4160:
	subl	$4, %esp
.LBE10925:
.LBE10924:
	.loc 29 62 0
	testl	%eax, %eax
	jne	.L3325
.LVL4161:
.LBB10926:
.LBB10927:
	.loc 26 890 0
	movl	(%edi), %edx
.LVL4162:
.LBB10928:
.LBB10929:
	.loc 27 872 0
	movl	%edx, %ecx
	.loc 27 873 0
	movl	%edx, %eax
.LVL4163:
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL4164:
	cmpl	$14, %ecx
	cmove	%edx, %eax
.LBE10929:
.LBE10928:
	.loc 26 890 0
	testl	%eax, %eax
	je	.L3321
	.loc 26 891 0
	movl	$8, current_syscall_error+24
	.loc 26 892 0
	movl	$3, %eax
	jmp	.L3325
.L3321:
.LBE10927:
.LBE10926:
	.loc 29 72 0
	movl	ksCurThread, %edx
.LVL4165:
.LBB10930:
.LBB10931:
	.loc 22 427 0
	leal	592(%edx), %eax
	movl	%edx, -36(%ebp)
	call	thread_state_ptr_set_tsType.isra.166.constprop.286
.LVL4166:
	.loc 22 428 0
	movl	-36(%ebp), %edx
	movl	%edx, (%esp)
	call	scheduleTCB
.LVL4167:
.LBE10931:
.LBE10930:
	.loc 29 73 0
	movl	%ebx, 16(%ebp)
	movl	%edi, 12(%ebp)
	movl	%esi, 8(%ebp)
.LBE10934:
	.loc 29 81 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
.LVL4168:
	popl	%edi
	.cfi_restore 7
.LVL4169:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LBB10935:
	.loc 29 73 0
	jmp	invokeIRQControl
.LVL4170:
.L3329:
	.cfi_restore_state
.LBB10932:
.LBB10916:
	call	getSyscallArg.part.131
.LVL4171:
.LBE10916:
.LBE10932:
.LBE10935:
	.cfi_endproc
.LFE544:
	.size	decodeIRQControlInvocation, .-decodeIRQControlInvocation
	.section	.rodata.str1.4
	.align 4
.LC195:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/object/interrupt.c"
	.section	.rodata.str1.1
.LC196:
	.string	"Invalid IRQ state"
	.text
	.p2align 4,,15
	.globl	handleInterrupt
	.type	handleInterrupt, @function
handleInterrupt:
.LFB553:
	.loc 29 204 0
	.cfi_startproc
.LVL4172:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 29 204 0
	movl	48(%esp), %ebx
	.loc 29 205 0
	movl	intStateIRQTable(,%ebx,4), %eax
	cmpl	$1, %eax
	je	.L3332
	jb	.L3333
	cmpl	$2, %eax
	je	.L3334
	cmpl	$3, %eax
	.p2align 4,,5
	jne	.L3359
.LVL4173:
.LBB10964:
.LBB10965:
	.loc 25 85 0
	movl	%ebx, 4(%esp)
	movl	$.LC180, (%esp)
	call	printf
.LVL4174:
.L3345:
.LBE10965:
.LBE10964:
.LBB10966:
.LBB10967:
	.loc 25 115 0
	cmpl	$15, %ebx
	jle	.L3351
.LVL4175:
.L3348:
.LBB10968:
.LBB10969:
.LBB10970:
	.loc 8 69 0
	movl	$0, -65360
.LBE10970:
.LBE10969:
.LBE10968:
.LBE10967:
.LBE10966:
	.loc 29 252 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4176:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4177:
	.p2align 4,,7
	.p2align 3
.L3334:
	.cfi_restore_state
	.loc 29 226 0
	call	timerTick
.LVL4178:
	jmp	.L3345
	.p2align 4,,7
	.p2align 3
.L3359:
	.loc 29 248 0
	movl	$__func__.6809, 12(%esp)
	movl	$248, 8(%esp)
	movl	$.LC195, 4(%esp)
	movl	$.LC196, (%esp)
	call	_fail
.LVL4179:
	.p2align 4,,7
	.p2align 3
.L3333:
.LBB10974:
.LBB10975:
	.loc 25 47 0
	testl	%ebx, %ebx
	js	.L3346
	.loc 25 48 0
	cmpl	$31, %ebx
	jg	.L3347
	.loc 25 50 0
	cmpl	$15, %ebx
	.p2align 4,,3
	jg	.L3348
.LVL4180:
.LBB10976:
.LBB10977:
	.loc 24 54 0
	cmpl	$7, %ebx
	.p2align 4,,2
	jle	.L3360
	.loc 24 58 0
	leal	-8(%ebx), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %esi
	movl	%eax, %ebx
.LVL4181:
.L3350:
	.loc 24 64 0
	movl	%esi, (%esp)
	call	in8
.LVL4182:
	movl	%esi, (%esp)
	orl	%ebx, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
.LVL4183:
.L3351:
.LBE10977:
.LBE10976:
.LBE10975:
.LBE10974:
.LBB10981:
.LBB10973:
.LBB10971:
.LBB10972:
	.loc 24 90 0
	cmpl	$39, ia32KScurInterrupt
	jle	.L3352
	.loc 24 92 0
	movl	$32, 4(%esp)
	movl	$160, (%esp)
	call	out8
.LVL4184:
.L3352:
	.loc 24 95 0
	movl	$32, 4(%esp)
	movl	$32, (%esp)
	call	out8
.LVL4185:
.LBE10972:
.LBE10971:
.LBE10973:
.LBE10981:
	.loc 29 252 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4186:
	.p2align 4,,7
	.p2align 3
.L3332:
	.cfi_restore_state
.LBB10982:
	.loc 29 209 0
	movl	%ebx, %edx
	sall	$4, %edx
	addl	intStateIRQNode, %edx
	movl	4(%edx), %esi
.LVL4187:
	movl	(%edx), %edx
.LVL4188:
.LBB10983:
.LBB10984:
	.loc 27 872 0
	movl	%edx, %ebp
	.loc 27 873 0
	movl	%edx, %ecx
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %ecx
	movzbl	%dl, %edi
	cmpl	$14, %ebp
	cmovne	%ecx, %edi
.LBE10984:
.LBE10983:
	.loc 29 211 0
	cmpl	$6, %edi
	je	.L3361
.LVL4189:
.L3338:
.LBB10985:
.LBB10986:
	.loc 25 47 0
	testl	%ebx, %ebx
	js	.L3346
	.loc 25 48 0
	cmpl	$31, %ebx
	jg	.L3347
	.loc 25 50 0
	cmpl	$15, %ebx
	.p2align 4,,3
	jg	.L3348
.LVL4190:
.LBB10987:
.LBB10988:
	.loc 24 54 0
	cmpl	$7, %ebx
	.p2align 4,,2
	jle	.L3362
	.loc 24 58 0
	leal	-8(%ebx), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %esi
	movl	%eax, %edi
.LVL4191:
.L3344:
	.loc 24 64 0
	movl	%esi, (%esp)
	call	in8
.LVL4192:
	movl	%esi, (%esp)
	orl	%edi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
.LVL4193:
	jmp	.L3345
.LVL4194:
	.p2align 4,,7
	.p2align 3
.L3361:
.LBE10988:
.LBE10987:
.LBE10986:
.LBE10985:
.LBB10993:
.LBB10994:
	.loc 27 1147 0 discriminator 1
	cmpl	$6, %ecx
	jne	.L3363
.LBE10994:
.LBE10993:
	.loc 29 211 0
	testl	$2, %esi
	.p2align 4,,2
	je	.L3338
.LVL4195:
	.loc 29 213 0
	movl	%ebx, %ecx
.LBB10996:
.LBB10997:
	.loc 27 1190 0
	andl	$-16, %edx
.LVL4196:
.LBE10997:
.LBE10996:
	.loc 29 213 0
	sall	%cl, %eax
.LBB10998:
.LBB10999:
	.loc 27 1130 0
	shrl	$3, %esi
.LVL4197:
.LBE10999:
.LBE10998:
	.loc 29 213 0
	movl	%eax, 8(%esp)
.LVL4198:
	movl	%esi, 4(%esp)
	movl	%edx, (%esp)
	call	sendAsyncIPC
.LVL4199:
	jmp	.L3338
.LVL4200:
	.p2align 4,,7
	.p2align 3
.L3362:
.LBB11000:
.LBB10991:
.LBB10990:
.LBB10989:
	.loc 24 55 0
	movl	$1, %edi
	movl	%ebx, %ecx
	sall	%cl, %edi
.LVL4201:
	movl	$33, %esi
	jmp	.L3344
.LVL4202:
	.p2align 4,,7
	.p2align 3
.L3360:
.LBE10989:
.LBE10990:
.LBE10991:
.LBE11000:
.LBE10982:
.LBB11003:
.LBB10980:
.LBB10979:
.LBB10978:
	movl	%ebx, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$33, %esi
	movl	%eax, %ebx
.LVL4203:
	jmp	.L3350
.LVL4204:
.L3346:
.LBE10978:
.LBE10979:
.LBE10980:
.LBE11003:
.LBB11004:
.LBB11001:
.LBB10992:
	call	maskInterrupt.part.208
.LVL4205:
.L3347:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL4206:
.L3363:
.LBE10992:
.LBE11001:
.LBB11002:
.LBB10995:
	call	cap_async_endpoint_cap_get_capAEPCanSend.part.192
.LVL4207:
.LBE10995:
.LBE11002:
.LBE11004:
	.cfi_endproc
.LFE553:
	.size	handleInterrupt, .-handleInterrupt
	.section	.rodata.str1.1
.LC197:
	.string	"Spurious interrupt\n"
	.text
	.p2align 4,,15
	.globl	handleInterruptEntry
	.type	handleInterruptEntry, @function
handleInterruptEntry:
.LFB258:
	.file 52 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/api/syscall.c"
	.loc 52 33 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB11035:
.LBB11036:
	.loc 25 91 0
	movl	ia32KScurInterrupt, %eax
	cmpl	$-1, %eax
	je	.L3365
	.loc 25 94 0
	subl	$32, %eax
.LBE11036:
.LBE11035:
	.loc 52 37 0
	cmpl	$-1, %eax
	je	.L3365
	.loc 52 38 0
	movl	%eax, (%esp)
	call	handleInterrupt
.LVL4208:
.L3366:
	.loc 52 44 0
	call	schedule
.LVL4209:
.LBB11037:
.LBB11038:
	.loc 22 69 0
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
.LBB11039:
.LBB11040:
	.loc 27 614 0
	movl	%ecx, %edx
	andl	$15, %edx
.LBE11040:
.LBE11039:
	.loc 22 69 0
	cmpl	$2, %edx
	je	.L3368
	cmpl	$7, %edx
	je	.L3369
	cmpl	$1, %edx
	je	.L3369
.LBB11041:
.LBB11042:
	.loc 22 87 0
	movl	$__func__.6108, 12(%esp)
	movl	$87, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$.LC109, (%esp)
	call	_fail
.LVL4210:
	.p2align 4,,7
	.p2align 3
.L3368:
.LBE11042:
.LBE11041:
.LBB11043:
.LBB11044:
.LBB11045:
.LBB11046:
	.loc 13 21 0
	movl	44(%eax), %edx
.LBE11046:
.LBE11045:
.LBE11044:
.LBB11049:
.LBB11050:
.LBB11051:
.LBB11052:
	.loc 27 626 0
	andl	$-16, %ecx
	.loc 27 627 0
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
.LBE11052:
.LBE11051:
.LBE11050:
.LBE11049:
.LBB11054:
.LBB11048:
.LBB11047:
	.loc 13 21 0
	movl	%edx, 56(%eax)
.LVL4211:
.LBE11047:
.LBE11048:
.LBE11054:
.LBB11055:
.LBB11053:
	.loc 22 428 0
	movl	%eax, (%esp)
.LVL4212:
	call	scheduleTCB
.LVL4213:
.L3369:
.LBE11053:
.LBE11055:
.LBE11043:
.LBE11038:
.LBE11037:
	.loc 52 48 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3365:
	.cfi_restore_state
	.loc 52 40 0
	movl	$.LC197, (%esp)
	call	printf
.LVL4214:
	jmp	.L3366
	.cfi_endproc
.LFE258:
	.size	handleInterruptEntry, .-handleInterruptEntry
	.section	.rodata.str1.4
	.align 4
.LC198:
	.string	"Kernel init failing: could not create ipc buffer frame\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	create_ipcbuf_frame
	.type	create_ipcbuf_frame, @function
create_ipcbuf_frame:
.LFB437:
	.loc 21 208 0
	.cfi_startproc
.LVL4215:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 21 213 0
	movl	$12, (%esp)
	.loc 21 208 0
	movl	32(%esp), %ebx
	.loc 21 213 0
	call	alloc_region
.LVL4216:
	.loc 21 214 0
	testl	%eax, %eax
	.loc 21 213 0
	movl	%eax, %edx
.LVL4217:
	.loc 21 214 0
	je	.L3407
.LVL4218:
.LBB11076:
.LBB11077:
.LBB11078:
	.loc 45 26 0
	testb	$3, %al
	jne	.L3408
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %esi
	jne	.L3409
.L3388:
	testl	$2, %edi
	jne	.L3410
.L3389:
	movl	%esi, %ecx
	xorl	%eax, %eax
.LVL4219:
	shrl	$2, %ecx
	testl	$2, %esi
	rep stosl
	jne	.L3411
	andl	$1, %esi
	jne	.L3412
.L3391:
.LVL4220:
.LBE11078:
.LBE11077:
.LBE11076:
.LBB11081:
.LBB11082:
.LBB11083:
.LBB11084:
.LBB11085:
.LBB11086:
	.loc 27 1381 0
	testl	$4095, 52(%esp)
	jne	.L3413
	.loc 27 1383 0
	movl	52(%esp), %esi
	shrl	$12, %esi
	orl	$1048576, %esi
.LVL4221:
	.loc 27 1393 0
	testl	$4095, %edx
	jne	.L3414
.LVL4222:
	.loc 27 1395 0
	andl	$-4096, %edx
.LVL4223:
.LBE11086:
.LBE11085:
.LBE11084:
.LBE11083:
	.loc 46 106 0
	movl	44(%esp), %eax
.LBB11096:
.LBB11093:
.LBB11090:
.LBB11087:
	.loc 27 1395 0
	movl	%edx, %edi
.LBE11087:
.LBE11090:
.LBE11093:
.LBE11096:
	.loc 46 106 0
	movl	48(%esp), %edx
.LBB11097:
.LBB11094:
.LBB11091:
.LBB11088:
	.loc 27 1395 0
	shrl	$8, %edi
	.loc 27 1399 0
	orl	$50331649, %edi
.LVL4224:
.LBE11088:
.LBE11091:
.LBE11094:
.LBE11097:
	.loc 46 106 0
	movl	%edi, 8(%esp)
	movl	%esi, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	map_it_frame_cap
.LVL4225:
.LBE11082:
.LBE11081:
	.loc 21 222 0
	movl	36(%esp), %eax
	movl	40(%esp), %edx
	call	cap_get_capPtr
.LVL4226:
	.loc 21 224 0
	movl	%edi, (%ebx)
	movl	%esi, 4(%ebx)
.LBB11100:
.LBB11101:
	.loc 21 121 0
	movl	%edi, 160(%eax)
	movl	%esi, 164(%eax)
.LVL4227:
	.loc 21 123 0
	movl	$0, 168(%eax)
.LVL4228:
.LBB11102:
.LBB11103:
	.loc 27 819 0
	movl	$3, 172(%eax)
.LBE11103:
.LBE11102:
.LBE11101:
.LBE11100:
	.loc 21 225 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	%ebx, %eax
.LVL4229:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL4230:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL4231:
	ret	$4
.LVL4232:
	.p2align 4,,7
	.p2align 3
.L3412:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L3391
	.p2align 4,,7
	.p2align 3
.L3411:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %esi
	je	.L3391
	jmp	.L3412
.LVL4233:
	.p2align 4,,7
	.p2align 3
.L3407:
	.loc 21 215 0
	movl	$.LC198, (%esp)
	call	printf
.LVL4234:
	.loc 21 225 0
	movl	%ebx, %eax
.LBB11104:
.LBB11105:
	.loc 27 896 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
.LBE11105:
.LBE11104:
	.loc 21 225 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL4235:
	.p2align 4,,7
	.p2align 3
.L3410:
	.cfi_restore_state
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %esi
	jmp	.L3389
	.p2align 4,,7
	.p2align 3
.L3409:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$4095, %si
	jmp	.L3388
.L3408:
.LBB11106:
.LBB11080:
.LBB11079:
	call	memzero.part.214
.LVL4236:
.L3414:
.LBE11079:
.LBE11080:
.LBE11106:
.LBB11107:
.LBB11099:
.LBB11098:
.LBB11095:
.LBB11092:
.LBB11089:
	.loc 27 1393 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1393, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC135, (%esp)
	call	_assert_fail
.LVL4237:
.L3413:
	.loc 27 1381 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1381, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC137, (%esp)
	call	_assert_fail
.LVL4238:
.LBE11089:
.LBE11092:
.LBE11095:
.LBE11098:
.LBE11099:
.LBE11107:
	.cfi_endproc
.LFE437:
	.size	create_ipcbuf_frame, .-create_ipcbuf_frame
	.section	.rodata.str1.4
	.align 4
.LC199:
	.string	"Kernel init failed: could not allocate bootinfo frame\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	allocate_bi_frame
	.type	allocate_bi_frame, @function
allocate_bi_frame:
.LFB439:
	.loc 21 248 0
	.cfi_startproc
.LVL4239:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 21 252 0
	movl	$12, (%esp)
	call	alloc_region
.LVL4240:
	.loc 21 253 0
	testl	%eax, %eax
	.loc 21 252 0
	movl	%eax, %edx
.LVL4241:
	.loc 21 253 0
	je	.L3436
.LVL4242:
.LBB11114:
.LBB11115:
.LBB11116:
	.loc 45 26 0
	testb	$3, %al
	jne	.L3437
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %ebx
	jne	.L3438
.L3419:
	testl	$2, %edi
	jne	.L3439
.L3420:
	movl	%ebx, %ecx
	xorl	%eax, %eax
.LVL4243:
	shrl	$2, %ecx
	testb	$2, %bl
	rep stosl
	jne	.L3440
	andl	$1, %ebx
	jne	.L3441
.L3422:
.LBE11116:
.LBE11115:
.LBE11114:
	.loc 21 263 0
	movl	32(%esp), %eax
	.loc 21 260 0
	movl	%edx, ndks_boot+16
	.loc 21 261 0
	movl	$12, ndks_boot+20
	.loc 21 267 0
	movb	$16, 891(%edx)
	.loc 21 263 0
	movl	%eax, (%edx)
	.loc 21 264 0
	movl	36(%esp), %eax
	.loc 21 265 0
	movl	$0, 8(%edx)
	.loc 21 264 0
	movl	%eax, 4(%edx)
	.loc 21 266 0
	movl	40(%esp), %eax
	movl	%eax, 12(%edx)
	.loc 21 268 0
	movl	ksDomScheduleIdx, %eax
	movl	ksDomSchedule(,%eax,8), %eax
	movb	%al, 4080(%edx)
	.loc 21 271 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 21 270 0
	movl	%edx, %eax
	.loc 21 271 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3441:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L3422
	.p2align 4,,7
	.p2align 3
.L3440:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %ebx
	je	.L3422
	jmp	.L3441
.LVL4244:
	.p2align 4,,7
	.p2align 3
.L3436:
	.loc 21 254 0
	movl	$.LC199, (%esp)
	call	printf
.LVL4245:
	.loc 21 271 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 21 255 0
	xorl	%eax, %eax
	.loc 21 271 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL4246:
	.p2align 4,,7
	.p2align 3
.L3439:
	.cfi_restore_state
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %ebx
	jmp	.L3420
	.p2align 4,,7
	.p2align 3
.L3438:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$4095, %bx
	jmp	.L3419
.L3437:
.LBB11119:
.LBB11118:
.LBB11117:
	call	memzero.part.214
.LVL4247:
.LBE11117:
.LBE11118:
.LBE11119:
	.cfi_endproc
.LFE439:
	.size	allocate_bi_frame, .-allocate_bi_frame
	.section	.rodata.str1.4
	.align 4
.LC200:
	.string	"Kernel init failing: could not create root cnode\n"
	.align 4
.LC201:
	.string	"(capCNodePtr & ~0xffffffe0) == 0"
	.section	.boot.text
	.p2align 4,,15
	.globl	create_root_cnode
	.type	create_root_cnode, @function
create_root_cnode:
.LFB434:
	.loc 21 137 0
	.cfi_startproc
.LVL4248:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 21 145 0
	movl	$20, (%esp)
	.loc 21 137 0
	movl	32(%esp), %esi
	.loc 21 142 0
	movl	$65536, ndks_boot+24
	.loc 21 145 0
	call	alloc_region
.LVL4249:
	.loc 21 146 0
	testl	%eax, %eax
	.loc 21 145 0
	movl	%eax, %ebx
.LVL4250:
	.loc 21 146 0
	je	.L3448
.LVL4251:
.LBB11134:
.LBB11135:
	.loc 45 26 0
	testb	$3, %al
	jne	.L3449
	movl	$1048576, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	memset
.LVL4252:
.LBE11135:
.LBE11134:
.LBB11137:
.LBB11138:
	.loc 27 1271 0
	testb	$31, %bl
	jne	.L3450
.LVL4253:
	.loc 27 1273 0
	movl	%ebx, %eax
	andl	$-32, %eax
	shrl	%eax
.LVL4254:
	.loc 27 1277 0
	orl	$10, %eax
.LVL4255:
.LBE11138:
.LBE11137:
.LBB11140:
.LBB11141:
	.loc 21 121 0
	movl	%eax, 32(%ebx)
.LBE11141:
.LBE11140:
	.loc 21 162 0
	movl	%eax, (%esi)
	.loc 21 163 0
	movl	%esi, %eax
.LVL4256:
.LBB11145:
.LBB11144:
	.loc 21 121 0
	movl	$138412032, 36(%ebx)
.LVL4257:
	.loc 21 123 0
	movl	$0, 40(%ebx)
.LVL4258:
.LBB11142:
.LBB11143:
	.loc 27 819 0
	movl	$3, 44(%ebx)
.LBE11143:
.LBE11142:
.LBE11144:
.LBE11145:
	.loc 21 162 0
	movl	$138412032, 4(%esi)
	.loc 21 163 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL4259:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
.LVL4260:
	.p2align 4,,7
	.p2align 3
.L3448:
	.cfi_restore_state
	.loc 21 147 0
	movl	$.LC200, (%esp)
	call	printf
.LVL4261:
	.loc 21 163 0
	movl	%esi, %eax
.LBB11146:
.LBB11147:
	.loc 27 896 0
	movl	$0, (%esi)
	movl	$0, 4(%esi)
.LBE11147:
.LBE11146:
	.loc 21 163 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL4262:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
.LVL4263:
.L3450:
	.cfi_restore_state
.LBB11148:
.LBB11139:
	.loc 27 1271 0
	movl	$__FUNCTION__.1679, 12(%esp)
	movl	$1271, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC201, (%esp)
	call	_assert_fail
.LVL4264:
.L3449:
.LBE11139:
.LBE11148:
.LBB11149:
.LBB11136:
	call	memzero.part.214
.LVL4265:
.LBE11136:
.LBE11149:
	.cfi_endproc
.LFE434:
	.size	create_root_cnode, .-create_root_cnode
	.section	.rodata.str1.4
	.align 4
.LC202:
	.string	"Kernel init failing: could not create irq cnode\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	create_irq_cnode
	.type	create_irq_cnode, @function
create_irq_cnode:
.LFB435:
	.loc 21 169 0
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 21 172 0
	movl	$12, (%esp)
	call	alloc_region
.LVL4266:
	.loc 21 173 0
	testl	%eax, %eax
	.loc 21 172 0
	movl	%eax, %edx
.LVL4267:
	.loc 21 173 0
	je	.L3472
.LVL4268:
.LBB11152:
.LBB11153:
	.loc 45 26 0
	testb	$3, %al
	jne	.L3473
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %ebx
	jne	.L3474
.L3455:
	testl	$2, %edi
	jne	.L3475
.L3456:
	movl	%ebx, %ecx
	xorl	%eax, %eax
.LVL4269:
	shrl	$2, %ecx
	testb	$2, %bl
	rep stosl
	jne	.L3476
	andl	$1, %ebx
	jne	.L3477
.L3458:
.LBE11153:
.LBE11152:
	.loc 21 178 0
	movl	%edx, intStateIRQNode
	.loc 21 180 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 21 179 0
	movl	$1, %eax
	.loc 21 180 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3477:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L3458
	.p2align 4,,7
	.p2align 3
.L3476:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %ebx
	je	.L3458
	jmp	.L3477
.LVL4270:
	.p2align 4,,7
	.p2align 3
.L3472:
	.loc 21 174 0
	movl	$.LC202, (%esp)
	call	printf
.LVL4271:
	.loc 21 180 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 21 175 0
	xorl	%eax, %eax
	.loc 21 180 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL4272:
	.p2align 4,,7
	.p2align 3
.L3475:
	.cfi_restore_state
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %ebx
	jmp	.L3456
	.p2align 4,,7
	.p2align 3
.L3474:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$4095, %bx
	jmp	.L3455
.L3473:
.LBB11155:
.LBB11154:
	call	memzero.part.214
.LVL4273:
.LBE11154:
.LBE11155:
	.cfi_endproc
.LFE435:
	.size	create_irq_cnode, .-create_irq_cnode
	.section	.rodata.str1.4
	.align 4
.LC203:
	.string	"Kernel init failed: failed to create initial thread asid pool\n"
	.align 4
.LC204:
	.string	"(capASIDPool & ~0xfffff000) == 0"
	.section	.boot.text
	.p2align 4,,15
	.globl	create_it_asid_pool
	.type	create_it_asid_pool, @function
create_it_asid_pool:
.LFB442:
	.loc 21 322 0
	.cfi_startproc
.LVL4274:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 21 327 0
	movl	$12, (%esp)
	.loc 21 322 0
	movl	32(%esp), %ebx
	.loc 21 327 0
	call	alloc_region
.LVL4275:
	.loc 21 328 0
	testl	%eax, %eax
	.loc 21 327 0
	movl	%eax, %edx
.LVL4276:
	.loc 21 328 0
	je	.L3500
.LVL4277:
.LBB11180:
.LBB11181:
	.loc 45 26 0
	testb	$3, %al
	jne	.L3501
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %esi
	jne	.L3502
.L3482:
	testl	$2, %edi
	jne	.L3503
.L3483:
	movl	%esi, %ecx
	xorl	%eax, %eax
.LVL4278:
	shrl	$2, %ecx
	testl	$2, %esi
	rep stosl
	jne	.L3504
	andl	$1, %esi
	jne	.L3505
.L3485:
.LVL4279:
.LBE11181:
.LBE11180:
.LBB11183:
.LBB11184:
	.loc 27 1741 0
	testl	$4095, %edx
	jne	.L3506
.LVL4280:
	.loc 27 1743 0
	andl	$-4096, %edx
.LVL4281:
.LBE11184:
.LBE11183:
	.loc 21 334 0
	movl	36(%esp), %eax
.LBB11188:
.LBB11185:
	.loc 27 1743 0
	movl	%edx, %esi
.LBE11185:
.LBE11188:
	.loc 21 334 0
	movl	40(%esp), %edx
.LBB11189:
.LBB11186:
	.loc 27 1743 0
	shrl	$8, %esi
.LVL4282:
	.loc 27 1747 0
	orl	$9, %esi
.LVL4283:
.LBE11186:
.LBE11189:
	.loc 21 334 0
	call	cap_get_capPtr
.LVL4284:
	.loc 21 338 0
	movl	40(%esp), %edx
.LBB11190:
.LBB11191:
	.loc 21 121 0
	movl	%esi, 96(%eax)
	movl	$0, 100(%eax)
.LVL4285:
	.loc 21 123 0
	movl	$0, 104(%eax)
.LVL4286:
.LBB11192:
.LBB11193:
	.loc 27 819 0
	movl	$3, 108(%eax)
.LVL4287:
.LBE11193:
.LBE11192:
.LBE11191:
.LBE11190:
	.loc 21 338 0
	movl	36(%esp), %eax
.LVL4288:
	call	cap_get_capPtr
.LVL4289:
	.loc 21 342 0
	movl	%esi, (%ebx)
	movl	$0, 4(%ebx)
.LBB11194:
.LBB11195:
	.loc 21 121 0
	movl	$7, 80(%eax)
	movl	$0, 84(%eax)
.LVL4290:
	.loc 21 123 0
	movl	$0, 88(%eax)
.LVL4291:
.LBB11196:
.LBB11197:
	.loc 27 819 0
	movl	$3, 92(%eax)
.LBE11197:
.LBE11196:
.LBE11195:
.LBE11194:
	.loc 21 343 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	%ebx, %eax
.LVL4292:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL4293:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL4294:
	.p2align 4,,7
	.p2align 3
.L3505:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L3485
	.p2align 4,,7
	.p2align 3
.L3504:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %esi
	je	.L3485
	jmp	.L3505
.LVL4295:
	.p2align 4,,7
	.p2align 3
.L3500:
	.loc 21 329 0
	movl	$.LC203, (%esp)
	call	printf
.LVL4296:
	.loc 21 343 0
	movl	%ebx, %eax
.LBB11198:
.LBB11199:
	.loc 27 896 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
.LBE11199:
.LBE11198:
	.loc 21 343 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL4297:
	.p2align 4,,7
	.p2align 3
.L3503:
	.cfi_restore_state
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %esi
	jmp	.L3483
	.p2align 4,,7
	.p2align 3
.L3502:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$4095, %si
	jmp	.L3482
.L3501:
.LBB11200:
.LBB11182:
	call	memzero.part.214
.LVL4298:
.L3506:
.LBE11182:
.LBE11200:
.LBB11201:
.LBB11187:
	.loc 27 1741 0
	movl	$__FUNCTION__.1862, 12(%esp)
	movl	$1741, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC204, (%esp)
	call	_assert_fail
.LVL4299:
.LBE11187:
.LBE11201:
	.cfi_endproc
.LFE442:
	.size	create_it_asid_pool, .-create_it_asid_pool
	.section	.rodata.str1.4
	.align 4
.LC205:
	.string	"Kernel init failed: Unable to allocate tcb for idle thread\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	create_idle_thread
	.type	create_idle_thread, @function
create_idle_thread:
.LFB443:
	.loc 21 347 0
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 21 349 0
	movl	$10, (%esp)
	call	alloc_region
.LVL4300:
	.loc 21 350 0
	testl	%eax, %eax
	.loc 21 349 0
	movl	%eax, %edx
.LVL4301:
	.loc 21 350 0
	je	.L3528
.LVL4302:
.LBB11228:
.LBB11229:
	.loc 45 26 0
	testb	$3, %al
	jne	.L3529
	testb	$1, %al
	movl	%eax, %edi
	movl	$1024, %ebx
	jne	.L3530
.L3511:
	testl	$2, %edi
	jne	.L3531
.L3512:
	movl	%ebx, %ecx
	xorl	%eax, %eax
.LVL4303:
	shrl	$2, %ecx
	testb	$2, %bl
	rep stosl
	jne	.L3532
	andl	$1, %ebx
	jne	.L3533
.L3514:
.LBE11229:
.LBE11228:
	.loc 21 355 0
	leal	256(%edx), %eax
.LBB11231:
.LBB11232:
.LBB11233:
.LBB11234:
.LBB11235:
	.loc 13 21 0
	movl	$514, 320(%edx)
.LBE11235:
.LBE11234:
.LBB11236:
.LBB11237:
	movl	$idle_thread, 312(%edx)
.LBE11237:
.LBE11236:
.LBB11238:
.LBB11239:
	movl	$8, 316(%edx)
.LBE11239:
.LBE11238:
.LBB11240:
.LBB11241:
	movl	$16, 284(%edx)
.LBE11241:
.LBE11240:
.LBB11242:
.LBB11243:
	movl	$16, 288(%edx)
.LBE11243:
.LBE11242:
.LBB11244:
.LBB11245:
	movl	$16, 292(%edx)
.LBE11245:
.LBE11244:
.LBB11246:
.LBB11247:
	movl	$16, 296(%edx)
.LBE11247:
.LBE11246:
.LBB11248:
.LBB11249:
	movl	$16, 328(%edx)
.LBE11249:
.LBE11248:
.LBE11233:
.LBE11232:
.LBB11250:
.LBB11251:
.LBB11252:
.LBB11253:
	.loc 27 626 0
	movl	848(%edx), %edx
.LVL4304:
.LBE11253:
.LBE11252:
.LBE11251:
.LBE11250:
.LBE11231:
	.loc 21 355 0
	movl	%eax, ksIdleThread
.LVL4305:
.LBB11258:
.LBB11257:
.LBB11256:
.LBB11255:
.LBB11254:
	.loc 27 626 0
	andl	$-16, %edx
	.loc 27 627 0
	orl	$7, %edx
	movl	%edx, 592(%eax)
.LBE11254:
.LBE11255:
	.loc 22 428 0
	movl	%eax, (%esp)
	call	scheduleTCB
.LVL4306:
.LBE11256:
.LBE11257:
.LBE11258:
	.loc 21 358 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 21 357 0
	movl	$1, %eax
	.loc 21 358 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL4307:
	.p2align 4,,7
	.p2align 3
.L3533:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L3514
	.p2align 4,,7
	.p2align 3
.L3532:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %ebx
	je	.L3514
	jmp	.L3533
.LVL4308:
	.p2align 4,,7
	.p2align 3
.L3528:
	.loc 21 351 0
	movl	$.LC205, (%esp)
	call	printf
.LVL4309:
	.loc 21 358 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 21 352 0
	xorl	%eax, %eax
	.loc 21 358 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL4310:
	.p2align 4,,7
	.p2align 3
.L3531:
	.cfi_restore_state
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %ebx
	jmp	.L3512
	.p2align 4,,7
	.p2align 3
.L3530:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$1023, %bx
	jmp	.L3511
.L3529:
.LBB11259:
.LBB11230:
	call	memzero.part.214
.LVL4311:
.LBE11230:
.LBE11259:
	.cfi_endproc
.LFE443:
	.size	create_idle_thread, .-create_idle_thread
	.section	.rodata.str1.4
	.align 4
.LC206:
	.string	"Kernel init failed: Unable to allocate tcb for initial thread\n"
	.align 4
.LC207:
	.string	"ksCurDomain < CONFIG_NUM_DOMAINS && ksDomainTime > 0"
	.section	.boot.text
	.p2align 4,,15
	.globl	create_initial_thread
	.type	create_initial_thread, @function
create_initial_thread:
.LFB444:
	.loc 21 369 0
	.cfi_startproc
.LVL4312:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 21 375 0
	movl	$10, (%esp)
	call	alloc_region
.LVL4313:
	.loc 21 376 0
	testl	%eax, %eax
	.loc 21 375 0
	movl	%eax, %ebp
.LVL4314:
	.loc 21 376 0
	je	.L3563
.LVL4315:
.LBB11283:
.LBB11284:
	.loc 45 26 0
	testb	$3, %al
	jne	.L3564
	testb	$1, %al
	movl	%eax, %edi
	movl	$1024, %edx
	jne	.L3565
.L3538:
	testl	$2, %edi
	jne	.L3566
.L3539:
	movl	%edx, %ecx
	xorl	%eax, %eax
.LVL4316:
	shrl	$2, %ecx
	testb	$2, %dl
	rep stosl
	jne	.L3567
	andl	$1, %edx
	jne	.L3568
.L3541:
.LBE11284:
.LBE11283:
	.loc 21 381 0
	leal	256(%ebp), %ebx
.LVL4317:
.LBB11286:
.LBB11287:
.LBB11288:
.LBB11289:
	.loc 15 25 0
	movl	$ia32KSnullFpuState, %esi
.LBE11289:
.LBE11288:
.LBE11287:
.LBE11286:
	.loc 21 388 0
	movl	52(%esp), %edx
	.loc 21 382 0
	movl	$1, 628(%ebx)
.LVL4318:
.LBB11296:
.LBB11294:
.LBB11292:
.LBB11290:
	.loc 15 25 0
	leal	336(%ebp), %edi
	movl	$128, %ecx
.LBE11290:
.LBE11292:
	.loc 17 37 0
	movl	$0, 256(%ebp)
.LBE11294:
.LBE11296:
	.loc 21 388 0
	movl	48(%esp), %eax
.LBB11297:
.LBB11295:
	.loc 17 38 0
	movl	$0, 4(%ebx)
	.loc 17 39 0
	movl	$0, 8(%ebx)
	.loc 17 40 0
	movl	$0, 12(%ebx)
	.loc 17 41 0
	movl	$0, 16(%ebx)
	.loc 17 42 0
	movl	$0, 20(%ebx)
	.loc 17 43 0
	movl	$0, 24(%ebx)
	.loc 17 44 0
	movl	$35, 28(%ebx)
	.loc 17 45 0
	movl	$35, 32(%ebx)
	.loc 17 46 0
	movl	$0, 36(%ebx)
	.loc 17 47 0
	movl	$0, 40(%ebx)
	.loc 17 48 0
	movl	$0, 48(%ebx)
	.loc 17 49 0
	movl	$0, 52(%ebx)
	.loc 17 50 0
	movl	$0, 44(%ebx)
	.loc 17 51 0
	movl	$0, 56(%ebx)
	.loc 17 52 0
	movl	$27, 60(%ebx)
	.loc 17 53 0
	movl	$514, 64(%ebx)
	.loc 17 54 0
	movl	$0, 68(%ebx)
	.loc 17 55 0
	movl	$35, 72(%ebx)
.LVL4319:
.LBB11293:
.LBB11291:
	.loc 15 25 0
	rep movsl
.LBE11291:
.LBE11293:
.LBE11295:
.LBE11297:
	.loc 21 388 0
	call	cap_get_capPtr
.LVL4320:
	.loc 21 386 0
	movl	52(%esp), %edx
	movl	%ebp, 12(%esp)
	movl	%edx, 4(%esp)
	addl	$32, %eax
	movl	%eax, 8(%esp)
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	call	cteInsert
.LVL4321:
	.loc 21 393 0
	movl	52(%esp), %edx
	movl	48(%esp), %eax
	call	cap_get_capPtr
.LVL4322:
	.loc 21 394 0
	leal	16(%ebp), %edx
	.loc 21 399 0
	addl	$64, %ebp
.LVL4323:
	.loc 21 391 0
	movl	%edx, 12(%esp)
	movl	60(%esp), %edx
	movl	%edx, 4(%esp)
	addl	$48, %eax
	movl	%eax, 8(%esp)
	movl	56(%esp), %eax
	movl	%eax, (%esp)
	call	cteInsert
.LVL4324:
	.loc 21 398 0
	movl	52(%esp), %edx
	movl	48(%esp), %eax
	call	cap_get_capPtr
.LVL4325:
	.loc 21 396 0
	movl	80(%esp), %edx
	movl	%ebp, 12(%esp)
	movl	%edx, 4(%esp)
	addl	$160, %eax
	movl	%eax, 8(%esp)
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	cteInsert
.LVL4326:
	.loc 21 401 0
	movl	72(%esp), %eax
	.loc 21 406 0
	movl	$255, 624(%ebx)
	.loc 21 401 0
	movl	%eax, 636(%ebx)
.LVL4327:
.LBB11298:
.LBB11299:
	.loc 13 21 0
	movl	68(%esp), %eax
	movl	%eax, 4(%ebx)
.LVL4328:
.LBE11299:
.LBE11298:
.LBB11300:
.LBB11301:
.LBB11302:
	movl	64(%esp), %eax
	movl	%eax, 56(%ebx)
.LBE11302:
.LBE11301:
.LBE11300:
	.loc 21 407 0
	movl	%ebx, (%esp)
	call	setupReplyMaster
.LVL4329:
.LBB11303:
.LBB11304:
.LBB11305:
.LBB11306:
	.loc 27 626 0
	movl	592(%ebx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$1, %eax
	movl	%eax, 592(%ebx)
.LBE11306:
.LBE11305:
	.loc 22 428 0
	movl	%ebx, (%esp)
	call	scheduleTCB
.LVL4330:
.LBE11304:
.LBE11303:
	.loc 21 410 0
	movl	ksIdleThread, %eax
	.loc 21 409 0
	movl	$0, ksSchedulerAction
	.loc 21 412 0
	movl	$1, ksDomainTime
	.loc 21 410 0
	movl	%eax, ksCurThread
	.loc 21 411 0
	movl	ksDomScheduleIdx, %eax
	movl	ksDomSchedule(,%eax,8), %eax
	.loc 21 413 0
	testl	%eax, %eax
	.loc 21 411 0
	movl	%eax, ksCurDomain
	.loc 21 413 0
	jne	.L3542
.LVL4331:
.LBB11307:
.LBB11308:
	.loc 22 346 0
	movl	%ebx, (%esp)
	call	Arch_switchToThread
.LVL4332:
.LBB11309:
.LBB11310:
	.loc 30 97 0
	testb	$1, 600(%ebx)
	jne	.L3569
.L3543:
.LBE11310:
.LBE11309:
.LBE11308:
.LBE11307:
.LBB11315:
.LBB11316:
	.loc 27 1346 0
	testb	$15, %bl
.LBE11316:
.LBE11315:
.LBB11321:
.LBB11313:
	.loc 22 348 0
	movl	%ebx, ksCurThread
.LVL4333:
.LBE11313:
.LBE11321:
.LBB11322:
.LBB11317:
	.loc 27 1346 0
	jne	.L3570
.LVL4334:
.LBE11317:
.LBE11322:
	.loc 21 420 0
	movl	48(%esp), %eax
.LBB11323:
.LBB11318:
	.loc 27 1348 0
	andl	$-16, %ebx
.LVL4335:
.LBE11318:
.LBE11323:
	.loc 21 420 0
	movl	52(%esp), %edx
.LBB11324:
.LBB11319:
	.loc 27 1352 0
	orl	$12, %ebx
.LBE11319:
.LBE11324:
	.loc 21 420 0
	call	cap_get_capPtr
.LVL4336:
	movl	%ebx, 4(%esp)
	movl	$0, 8(%esp)
	addl	$16, %eax
	movl	%eax, (%esp)
	call	write_slot
.LVL4337:
	.loc 21 423 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 21 422 0
	movl	$1, %eax
	.loc 21 423 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4338:
	ret
.LVL4339:
	.p2align 4,,7
	.p2align 3
.L3568:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L3541
	.p2align 4,,7
	.p2align 3
.L3567:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %edx
	je	.L3541
	jmp	.L3568
.LVL4340:
	.p2align 4,,7
	.p2align 3
.L3569:
.LBB11325:
.LBB11314:
.LBB11312:
.LBB11311:
	movl	%ebx, %eax
	call	tcbSchedDequeue.part.202
.LVL4341:
	.p2align 4,,6
	jmp	.L3543
.LVL4342:
	.p2align 4,,7
	.p2align 3
.L3563:
.LBE11311:
.LBE11312:
.LBE11314:
.LBE11325:
	.loc 21 377 0
	movl	$.LC206, (%esp)
	call	printf
.LVL4343:
	.loc 21 423 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 21 378 0
	xorl	%eax, %eax
	.loc 21 423 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4344:
	ret
.LVL4345:
	.p2align 4,,7
	.p2align 3
.L3565:
	.cfi_restore_state
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$1023, %dx
	jmp	.L3538
	.p2align 4,,7
	.p2align 3
.L3566:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %edx
	jmp	.L3539
.LVL4346:
.L3542:
	.loc 21 413 0 discriminator 1
	movl	$__FUNCTION__.5945, 12(%esp)
	movl	$413, 8(%esp)
	movl	$.LC87, 4(%esp)
	movl	$.LC207, (%esp)
	call	_assert_fail
.LVL4347:
.L3570:
.LBB11326:
.LBB11320:
	call	cap_thread_cap_new.part.162
.LVL4348:
.L3564:
.LBE11320:
.LBE11326:
.LBB11327:
.LBB11285:
	call	memzero.part.214
.LVL4349:
.LBE11285:
.LBE11327:
	.cfi_endproc
.LFE444:
	.size	create_initial_thread, .-create_initial_thread
	.p2align 4,,15
	.type	pci_scan_fun.constprop.222, @function
pci_scan_fun.constprop.222:
.LFB935:
	.loc 50 154 0
	.cfi_startproc
.LVL4350:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	.loc 50 160 0
	movzbl	%dl, %edi
	.loc 50 154 0
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	.loc 50 160 0
	movzbl	%al, %esi
.LVL4351:
	.loc 50 154 0
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
.LBB11334:
.LBB11335:
	.loc 50 49 0
	movl	%esi, %eax
	movl	%edi, %ebx
.LBE11335:
.LBE11334:
	.loc 50 154 0
	subl	$44, %esp
	.cfi_def_cfa_offset 64
.LBB11337:
.LBB11336:
	.loc 50 49 0
	sall	$16, %eax
.LVL4352:
	sall	$11, %ebx
	orl	%eax, %ebx
	movl	%ebx, %ebp
	orl	$-2147483648, %ebp
	movl	%ebp, 4(%esp)
	movl	$3320, (%esp)
	call	out32
.LVL4353:
	.loc 50 50 0
	movl	$3324, (%esp)
	call	in32
.LVL4354:
	movl	%eax, %edx
.LBE11336:
.LBE11337:
	.loc 50 193 0
	xorl	%eax, %eax
	.loc 50 161 0
	cmpw	$-1, %dx
	movl	%edx, 28(%esp)
	je	.L3572
.LVL4355:
.LBB11338:
.LBB11339:
	.loc 50 49 0
	movl	%ebp, 4(%esp)
.LBE11339:
.LBE11338:
.LBB11343:
.LBB11344:
	.loc 50 67 0
	orl	$-2147483636, %ebx
.LBE11344:
.LBE11343:
.LBB11349:
.LBB11340:
	.loc 50 49 0
	movl	$3320, (%esp)
	call	out32
.LVL4356:
	.loc 50 50 0
	movl	$3324, (%esp)
	call	in32
.LVL4357:
.LBE11340:
.LBE11349:
.LBB11350:
.LBB11345:
	.loc 50 67 0
	movl	%ebx, 4(%esp)
	movl	$3320, (%esp)
.LBE11345:
.LBE11350:
.LBB11351:
.LBB11341:
	.loc 50 50 0
	movl	%eax, %ebp
.LVL4358:
.LBE11341:
.LBE11351:
.LBB11352:
.LBB11346:
	.loc 50 67 0
	call	out32
.LVL4359:
.LBE11346:
.LBE11352:
.LBB11353:
.LBB11342:
	.loc 50 50 0
	shrl	$16, %ebp
.LBE11342:
.LBE11353:
.LBB11354:
.LBB11347:
	.loc 50 68 0
	movl	$3324, (%esp)
	call	in32
.LVL4360:
	movl	28(%esp), %edx
.LBE11347:
.LBE11354:
	.loc 50 165 0
	movl	%ebp, 20(%esp)
	movl	$0, 12(%esp)
	movl	%edi, 8(%esp)
	movzwl	%dx, %edx
	movl	%edx, 16(%esp)
.LBB11355:
.LBB11348:
	.loc 50 68 0
	shrl	$16, %eax
.LBE11348:
.LBE11355:
	.loc 50 164 0
	movl	%eax, %ebx
	andl	$127, %ebx
.LVL4361:
	.loc 50 165 0
	movl	%esi, 4(%esp)
	movl	$.LC189, (%esp)
	call	printf
.LVL4362:
	.loc 50 170 0
	cmpb	$1, %bl
	je	.L3574
	jb	.L3575
	cmpb	$2, %bl
	.p2align 4,,5
	jne	.L3581
	.loc 50 182 0
	movl	$.LC192, (%esp)
	call	printf
.LVL4363:
	.loc 50 183 0
	movl	$1, (%esp)
.L3580:
	movl	%esi, %eax
	xorl	%ecx, %ecx
	movl	%edi, %edx
	call	pci_scan_bars
.LVL4364:
	.loc 50 191 0
	movl	$1, %eax
.LVL4365:
.L3572:
	.loc 50 194 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4366:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4367:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4368:
	.p2align 4,,7
	.p2align 3
.L3581:
	.cfi_restore_state
	.loc 50 187 0
	movzbl	%bl, %ebx
	movl	%ebx, 4(%esp)
	movl	$.LC193, (%esp)
	call	printf
.LVL4369:
	.loc 50 194 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 50 191 0
	movl	$1, %eax
	.loc 50 194 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4370:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4371:
	.p2align 4,,7
	.p2align 3
.L3574:
	.cfi_restore_state
	.loc 50 177 0
	movl	$.LC191, (%esp)
	call	printf
.LVL4372:
	.loc 50 178 0
	movl	$2, (%esp)
	jmp	.L3580
	.p2align 4,,7
	.p2align 3
.L3575:
	.loc 50 172 0
	movl	$.LC190, (%esp)
	call	printf
.LVL4373:
	.loc 50 173 0
	movl	$6, (%esp)
	jmp	.L3580
	.cfi_endproc
.LFE935:
	.size	pci_scan_fun.constprop.222, .-pci_scan_fun.constprop.222
	.text
	.p2align 4,,15
	.globl	platAddDevices
	.type	platAddDevices, @function
platAddDevices:
.LFB608:
	.loc 25 27 0
	.cfi_startproc
.LVL4374:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
.LBB11362:
.LBB11363:
	.loc 50 211 0
	xorl	%edi, %edi
.LBE11363:
.LBE11362:
	.loc 25 27 0
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
.LVL4375:
	.p2align 4,,7
	.p2align 3
.L3583:
.LBB11369:
.LBB11368:
.LBB11364:
.LBB11365:
	.loc 50 67 0
	movl	%edi, %ebp
	xorl	%ebx, %ebx
	sall	$16, %ebp
	orl	$-2147483636, %ebp
	jmp	.L3590
.LVL4376:
	.p2align 4,,7
	.p2align 3
.L3587:
	addl	$1, %ebx
.LVL4377:
.LBE11365:
.LBE11364:
	.loc 50 207 0
	cmpl	$32, %ebx
	je	.L3598
.L3590:
.LVL4378:
	.loc 50 208 0
	movl	%ebx, %edx
	movl	%edi, %eax
	call	pci_scan_fun.constprop.222
.LVL4379:
	testl	%eax, %eax
	je	.L3587
.LVL4380:
.LBB11367:
.LBB11366:
	.loc 50 67 0
	movl	%ebx, %eax
	sall	$11, %eax
	orl	%ebp, %eax
	movl	%eax, 4(%esp)
	movl	$3320, (%esp)
	call	out32
.LVL4381:
	.loc 50 68 0
	movl	$3324, (%esp)
	call	in32
.LVL4382:
	shrl	$16, %eax
.LBE11366:
.LBE11367:
	.loc 50 211 0
	testb	%al, %al
	jns	.L3587
	movl	$1, %esi
	.p2align 4,,7
	.p2align 3
.L3588:
.LVL4383:
	.loc 50 219 0
	movl	%esi, %ecx
	movl	%ebx, %edx
	movl	%edi, %eax
	addl	$1, %esi
.LVL4384:
	call	pci_scan_fun
.LVL4385:
	.loc 50 218 0
	cmpl	$8, %esi
	jne	.L3588
.LVL4386:
	addl	$1, %ebx
.LVL4387:
	.loc 50 207 0
	cmpl	$32, %ebx
	jne	.L3590
.LVL4388:
	.p2align 4,,7
	.p2align 3
.L3598:
	addl	$1, %edi
.LVL4389:
	.loc 50 205 0
	cmpl	$256, %edi
	jne	.L3583
.LVL4390:
.LBE11368:
.LBE11369:
.LBB11370:
.LBB11371:
	.loc 9 214 0
	movl	glks+188, %eax
	cmpl	$198, %eax
	jbe	.L3599
	.loc 9 219 0
	movl	$.LC17, (%esp)
	call	printf
.LVL4391:
.LBE11371:
.LBE11370:
	.loc 25 40 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L3599:
	.cfi_restore_state
.LBB11373:
.LBB11372:
	.loc 9 215 0
	leal	glks+176(,%eax,8), %edx
	.loc 9 216 0
	addl	$1, %eax
	.loc 9 215 0
	movl	$753664, 16(%edx)
	movl	$757760, 20(%edx)
	.loc 9 217 0
	movl	$.LC16, (%esp)
	.loc 9 216 0
	movl	%eax, glks+188
	.loc 9 217 0
	call	printf
.LVL4392:
.LBE11372:
.LBE11373:
	.loc 25 40 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE608:
	.size	platAddDevices, .-platAddDevices
	.section	.boot.text
	.p2align 4,,15
	.globl	init_vm_state
	.type	init_vm_state, @function
init_vm_state:
.LFB349:
	.loc 4 874 0
	.cfi_startproc
.LVL4393:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
.LBB11398:
.LBB11399:
	.loc 16 46 0
	call	getCacheLineSize
.LVL4394:
	.loc 16 47 0
	testl	%eax, %eax
	je	.L3601
.LVL4395:
	.loc 16 54 0
	xorl	%edx, %edx
	testb	$1, %al
	jne	.L3603
.LVL4396:
	.p2align 4,,7
	.p2align 3
.L3609:
	.loc 16 55 0
	shrl	%eax
.LVL4397:
	.loc 16 56 0
	addl	$1, %edx
.LVL4398:
	.loc 16 54 0
	testb	$1, %al
	je	.L3609
.LVL4399:
.L3603:
	.loc 16 59 0
	cmpl	$1, %eax
	je	.L3606
	.loc 16 60 0
	movl	$.LC23, (%esp)
	call	printf
.LVL4400:
.L3604:
.LBE11399:
.LBE11398:
	.loc 4 875 0
	movl	$0, ia32KScacheLineSizeBits
.L3613:
	.loc 4 877 0
	xorl	%eax, %eax
	.loc 4 885 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL4401:
	.p2align 4,,7
	.p2align 3
.L3606:
	.cfi_restore_state
	.loc 4 876 0
	testl	%edx, %edx
	.loc 4 875 0
	movl	%edx, ia32KScacheLineSizeBits
	.loc 4 876 0
	je	.L3613
	.loc 4 879 0
	movl	32(%esp), %eax
.LVL4402:
.LBB11401:
.LBB11402:
.LBB11403:
	.loc 27 268 0
	movl	$ia32KStss, %edx
	movl	$0, ia32KStss
	.loc 27 269 0
	movl	$0, ia32KStss+4
	.loc 27 271 0
	movl	$0, ia32KStss+12
.LBE11403:
.LBE11402:
.LBE11401:
	.loc 4 879 0
	movl	%eax, ia32KSkernelPD
	.loc 4 880 0
	movl	36(%esp), %eax
.LBB11408:
.LBB11406:
.LBB11404:
	.loc 27 272 0
	movl	$0, ia32KStss+16
	.loc 27 273 0
	movl	$0, ia32KStss+20
	.loc 27 274 0
	movl	$0, ia32KStss+24
.LBE11404:
.LBE11406:
.LBE11408:
	.loc 4 880 0
	movl	%eax, ia32KSkernelPT
.LVL4403:
.LBB11409:
.LBB11410:
.LBB11411:
.LBB11412:
	.loc 27 2169 0
	movl	%edx, %eax
	sall	$16, %eax
	.loc 27 2173 0
	orl	$103, %eax
.LBE11412:
.LBE11411:
.LBE11410:
.LBE11409:
.LBB11422:
.LBB11407:
.LBB11405:
	.loc 27 275 0
	movl	$0, ia32KStss+28
	.loc 27 276 0
	movl	$0, ia32KStss+32
	.loc 27 277 0
	movl	$0, ia32KStss+36
	.loc 27 278 0
	movl	$0, ia32KStss+40
	.loc 27 279 0
	movl	$0, ia32KStss+44
	.loc 27 280 0
	movl	$0, ia32KStss+48
	.loc 27 281 0
	movl	$0, ia32KStss+52
	.loc 27 282 0
	movl	$0, ia32KStss+56
	.loc 27 283 0
	movl	$0, ia32KStss+60
	.loc 27 284 0
	movl	$0, ia32KStss+64
	.loc 27 285 0
	movl	$0, ia32KStss+68
	.loc 27 286 0
	movl	$0, ia32KStss+72
	.loc 27 287 0
	movl	$0, ia32KStss+76
	.loc 27 288 0
	movl	$0, ia32KStss+80
	.loc 27 289 0
	movl	$0, ia32KStss+84
	.loc 27 290 0
	movl	$0, ia32KStss+88
	.loc 27 291 0
	movl	$0, ia32KStss+92
	.loc 27 292 0
	movl	$0, ia32KStss+96
	.loc 27 293 0
	movl	$0, ia32KStss+100
	.loc 27 355 0
	movl	$16, ia32KStss+8
.LVL4404:
.LBE11405:
.LBE11407:
.LBE11422:
.LBB11423:
.LBB11419:
	.loc 4 161 0
	movl	$0, ia32KSgdt
	movl	$0, ia32KSgdt+4
.LVL4405:
	.loc 4 164 0
	movl	$65535, ia32KSgdt+8
	movl	$13605632, ia32KSgdt+12
.LVL4406:
.LBB11416:
.LBB11413:
	.loc 27 2173 0
	movl	%eax, ia32KSgdt+40
	.loc 27 2129 0
	movl	%edx, %eax
.LBE11413:
.LBE11416:
	.loc 4 237 0
	shrl	$16, %edx
.LBB11417:
.LBB11414:
	.loc 27 2129 0
	andl	$-16777216, %eax
	.loc 27 2165 0
	movzbl	%dl, %edx
	.loc 27 2161 0
	orl	%edx, %eax
.LBE11414:
.LBE11417:
.LBE11419:
.LBE11423:
.LBB11424:
.LBB11425:
	.loc 4 300 0
	movl	$int_00, %edx
.LBE11425:
.LBE11424:
.LBB11428:
.LBB11420:
.LBB11418:
.LBB11415:
	.loc 27 2165 0
	orb	$137, %ah
	movl	%eax, ia32KSgdt+44
.LBE11415:
.LBE11418:
.LBE11420:
.LBE11428:
.LBB11429:
.LBB11426:
	.loc 4 300 0
	xorl	%eax, %eax
.LBE11426:
.LBE11429:
.LBB11430:
.LBB11421:
	.loc 4 180 0
	movl	$65535, ia32KSgdt+16
	movl	$13603584, ia32KSgdt+20
.LVL4407:
	.loc 4 196 0
	movl	$65535, ia32KSgdt+24
	movl	$13630208, ia32KSgdt+28
.LVL4408:
	.loc 4 212 0
	movl	$65535, ia32KSgdt+32
	movl	$13628160, ia32KSgdt+36
.LVL4409:
	.loc 4 243 0
	movl	$65535, ia32KSgdt+48
	movl	$13628160, ia32KSgdt+52
.LVL4410:
	.loc 4 259 0
	movl	$65535, ia32KSgdt+56
	movl	$13628160, ia32KSgdt+60
.LVL4411:
.LBE11421:
.LBE11430:
.LBB11431:
.LBB11427:
	.loc 4 300 0
	call	init_idt_entry.constprop.236
.LVL4412:
	.loc 4 301 0
	movl	$int_01, %edx
	movl	$1, %eax
	call	init_idt_entry.constprop.236
.LVL4413:
	.loc 4 302 0
	movl	$int_02, %edx
	movl	$2, %eax
	call	init_idt_entry.constprop.236
.LVL4414:
	.loc 4 303 0
	movl	$int_03, %edx
	movl	$3, %eax
	call	init_idt_entry.constprop.236
.LVL4415:
	.loc 4 304 0
	movl	$int_04, %edx
	movl	$4, %eax
	call	init_idt_entry.constprop.236
.LVL4416:
	.loc 4 305 0
	movl	$int_05, %edx
	movl	$5, %eax
	call	init_idt_entry.constprop.236
.LVL4417:
	.loc 4 306 0
	movl	$int_06, %edx
	movl	$6, %eax
	call	init_idt_entry.constprop.236
.LVL4418:
	.loc 4 307 0
	movl	$int_07, %edx
	movl	$7, %eax
	call	init_idt_entry.constprop.236
.LVL4419:
	.loc 4 308 0
	movl	$int_08, %edx
	movl	$8, %eax
	call	init_idt_entry.constprop.236
.LVL4420:
	.loc 4 309 0
	movl	$int_09, %edx
	movl	$9, %eax
	call	init_idt_entry.constprop.236
.LVL4421:
	.loc 4 310 0
	movl	$int_0a, %edx
	movl	$10, %eax
	call	init_idt_entry.constprop.236
.LVL4422:
	.loc 4 311 0
	movl	$int_0b, %edx
	movl	$11, %eax
	call	init_idt_entry.constprop.236
.LVL4423:
	.loc 4 312 0
	movl	$int_0c, %edx
	movl	$12, %eax
	call	init_idt_entry.constprop.236
.LVL4424:
	.loc 4 313 0
	movl	$int_0d, %edx
	movl	$13, %eax
	call	init_idt_entry.constprop.236
.LVL4425:
	.loc 4 314 0
	movl	$int_0e, %edx
	movl	$14, %eax
	call	init_idt_entry.constprop.236
.LVL4426:
	.loc 4 315 0
	movl	$int_0f, %edx
	movl	$15, %eax
	call	init_idt_entry.constprop.236
.LVL4427:
	.loc 4 317 0
	movl	$int_10, %edx
	movl	$16, %eax
	call	init_idt_entry.constprop.236
.LVL4428:
	.loc 4 318 0
	movl	$int_11, %edx
	movl	$17, %eax
	call	init_idt_entry.constprop.236
.LVL4429:
	.loc 4 319 0
	movl	$int_12, %edx
	movl	$18, %eax
	call	init_idt_entry.constprop.236
.LVL4430:
	.loc 4 320 0
	movl	$int_13, %edx
	movl	$19, %eax
	call	init_idt_entry.constprop.236
.LVL4431:
	.loc 4 321 0
	movl	$int_14, %edx
	movl	$20, %eax
	call	init_idt_entry.constprop.236
.LVL4432:
	.loc 4 322 0
	movl	$int_15, %edx
	movl	$21, %eax
	call	init_idt_entry.constprop.236
.LVL4433:
	.loc 4 323 0
	movl	$int_16, %edx
	movl	$22, %eax
	call	init_idt_entry.constprop.236
.LVL4434:
	.loc 4 324 0
	movl	$int_17, %edx
	movl	$23, %eax
	call	init_idt_entry.constprop.236
.LVL4435:
	.loc 4 325 0
	movl	$int_18, %edx
	movl	$24, %eax
	call	init_idt_entry.constprop.236
.LVL4436:
	.loc 4 326 0
	movl	$int_19, %edx
	movl	$25, %eax
	call	init_idt_entry.constprop.236
.LVL4437:
	.loc 4 327 0
	movl	$int_1a, %edx
	movl	$26, %eax
	call	init_idt_entry.constprop.236
.LVL4438:
	.loc 4 328 0
	movl	$int_1b, %edx
	movl	$27, %eax
	call	init_idt_entry.constprop.236
.LVL4439:
	.loc 4 329 0
	movl	$int_1c, %edx
	movl	$28, %eax
	call	init_idt_entry.constprop.236
.LVL4440:
	.loc 4 330 0
	movl	$int_1d, %edx
	movl	$29, %eax
	call	init_idt_entry.constprop.236
.LVL4441:
	.loc 4 331 0
	movl	$int_1e, %edx
	movl	$30, %eax
	call	init_idt_entry.constprop.236
.LVL4442:
	.loc 4 332 0
	movl	$int_1f, %edx
	movl	$31, %eax
	call	init_idt_entry.constprop.236
.LVL4443:
	.loc 4 334 0
	movl	$int_20, %edx
	movl	$32, %eax
	call	init_idt_entry.constprop.236
.LVL4444:
	.loc 4 335 0
	movl	$int_21, %edx
	movl	$33, %eax
	call	init_idt_entry.constprop.236
.LVL4445:
	.loc 4 336 0
	movl	$int_22, %edx
	movl	$34, %eax
	call	init_idt_entry.constprop.236
.LVL4446:
	.loc 4 337 0
	movl	$int_23, %edx
	movl	$35, %eax
	call	init_idt_entry.constprop.236
.LVL4447:
	.loc 4 338 0
	movl	$int_24, %edx
	movl	$36, %eax
	call	init_idt_entry.constprop.236
.LVL4448:
	.loc 4 339 0
	movl	$int_25, %edx
	movl	$37, %eax
	call	init_idt_entry.constprop.236
.LVL4449:
	.loc 4 340 0
	movl	$int_26, %edx
	movl	$38, %eax
	call	init_idt_entry.constprop.236
.LVL4450:
	.loc 4 341 0
	movl	$int_27, %edx
	movl	$39, %eax
	call	init_idt_entry.constprop.236
.LVL4451:
	.loc 4 342 0
	movl	$int_28, %edx
	movl	$40, %eax
	call	init_idt_entry.constprop.236
.LVL4452:
	.loc 4 343 0
	movl	$int_29, %edx
	movl	$41, %eax
	call	init_idt_entry.constprop.236
.LVL4453:
	.loc 4 344 0
	movl	$int_2a, %edx
	movl	$42, %eax
	call	init_idt_entry.constprop.236
.LVL4454:
	.loc 4 345 0
	movl	$int_2b, %edx
	movl	$43, %eax
	call	init_idt_entry.constprop.236
.LVL4455:
	.loc 4 346 0
	movl	$int_2c, %edx
	movl	$44, %eax
	call	init_idt_entry.constprop.236
.LVL4456:
	.loc 4 347 0
	movl	$int_2d, %edx
	movl	$45, %eax
	call	init_idt_entry.constprop.236
.LVL4457:
	.loc 4 348 0
	movl	$int_2e, %edx
	movl	$46, %eax
	call	init_idt_entry.constprop.236
.LVL4458:
	.loc 4 349 0
	movl	$int_2f, %edx
	movl	$47, %eax
	call	init_idt_entry.constprop.236
.LVL4459:
	.loc 4 351 0
	movl	$int_30, %edx
	movl	$48, %eax
	call	init_idt_entry.constprop.236
.LVL4460:
	.loc 4 352 0
	movl	$int_31, %edx
	movl	$49, %eax
	call	init_idt_entry.constprop.236
.LVL4461:
	.loc 4 353 0
	movl	$int_32, %edx
	movl	$50, %eax
	call	init_idt_entry.constprop.236
.LVL4462:
	.loc 4 354 0
	movl	$int_33, %edx
	movl	$51, %eax
	call	init_idt_entry.constprop.236
.LVL4463:
	.loc 4 355 0
	movl	$int_34, %edx
	movl	$52, %eax
	call	init_idt_entry.constprop.236
.LVL4464:
	.loc 4 356 0
	movl	$int_35, %edx
	movl	$53, %eax
	call	init_idt_entry.constprop.236
.LVL4465:
	.loc 4 357 0
	movl	$int_36, %edx
	movl	$54, %eax
	call	init_idt_entry.constprop.236
.LVL4466:
	.loc 4 358 0
	movl	$int_37, %edx
	movl	$55, %eax
	call	init_idt_entry.constprop.236
.LVL4467:
	.loc 4 359 0
	movl	$int_38, %edx
	movl	$56, %eax
	call	init_idt_entry.constprop.236
.LVL4468:
	.loc 4 360 0
	movl	$int_39, %edx
	movl	$57, %eax
	call	init_idt_entry.constprop.236
.LVL4469:
	.loc 4 361 0
	movl	$int_3a, %edx
	movl	$58, %eax
	call	init_idt_entry.constprop.236
.LVL4470:
	.loc 4 362 0
	movl	$int_3b, %edx
	movl	$59, %eax
	call	init_idt_entry.constprop.236
.LVL4471:
	.loc 4 363 0
	movl	$int_3c, %edx
	movl	$60, %eax
	call	init_idt_entry.constprop.236
.LVL4472:
	.loc 4 364 0
	movl	$int_3d, %edx
	movl	$61, %eax
	call	init_idt_entry.constprop.236
.LVL4473:
	.loc 4 365 0
	movl	$int_3e, %edx
	movl	$62, %eax
	call	init_idt_entry.constprop.236
.LVL4474:
	.loc 4 366 0
	movl	$int_3f, %edx
	movl	$63, %eax
	call	init_idt_entry.constprop.236
.LVL4475:
	.loc 4 368 0
	movl	$int_40, %edx
	movl	$64, %eax
	call	init_idt_entry.constprop.236
.LVL4476:
	.loc 4 369 0
	movl	$int_41, %edx
	movl	$65, %eax
	call	init_idt_entry.constprop.236
.LVL4477:
	.loc 4 370 0
	movl	$int_42, %edx
	movl	$66, %eax
	call	init_idt_entry.constprop.236
.LVL4478:
	.loc 4 371 0
	movl	$int_43, %edx
	movl	$67, %eax
	call	init_idt_entry.constprop.236
.LVL4479:
	.loc 4 372 0
	movl	$int_44, %edx
	movl	$68, %eax
	call	init_idt_entry.constprop.236
.LVL4480:
	.loc 4 373 0
	movl	$int_45, %edx
	movl	$69, %eax
	call	init_idt_entry.constprop.236
.LVL4481:
	.loc 4 374 0
	movl	$int_46, %edx
	movl	$70, %eax
	call	init_idt_entry.constprop.236
.LVL4482:
	.loc 4 375 0
	movl	$int_47, %edx
	movl	$71, %eax
	call	init_idt_entry.constprop.236
.LVL4483:
	.loc 4 376 0
	movl	$int_48, %edx
	movl	$72, %eax
	call	init_idt_entry.constprop.236
.LVL4484:
	.loc 4 377 0
	movl	$int_49, %edx
	movl	$73, %eax
	call	init_idt_entry.constprop.236
.LVL4485:
	.loc 4 378 0
	movl	$int_4a, %edx
	movl	$74, %eax
	call	init_idt_entry.constprop.236
.LVL4486:
	.loc 4 379 0
	movl	$int_4b, %edx
	movl	$75, %eax
	call	init_idt_entry.constprop.236
.LVL4487:
	.loc 4 380 0
	movl	$int_4c, %edx
	movl	$76, %eax
	call	init_idt_entry.constprop.236
.LVL4488:
	.loc 4 381 0
	movl	$int_4d, %edx
	movl	$77, %eax
	call	init_idt_entry.constprop.236
.LVL4489:
	.loc 4 382 0
	movl	$int_4e, %edx
	movl	$78, %eax
	call	init_idt_entry.constprop.236
.LVL4490:
	.loc 4 383 0
	movl	$int_4f, %edx
	movl	$79, %eax
	call	init_idt_entry.constprop.236
.LVL4491:
	.loc 4 385 0
	movl	$int_50, %edx
	movl	$80, %eax
	call	init_idt_entry.constprop.236
.LVL4492:
	.loc 4 386 0
	movl	$int_51, %edx
	movl	$81, %eax
	call	init_idt_entry.constprop.236
.LVL4493:
	.loc 4 387 0
	movl	$int_52, %edx
	movl	$82, %eax
	call	init_idt_entry.constprop.236
.LVL4494:
	.loc 4 388 0
	movl	$int_53, %edx
	movl	$83, %eax
	call	init_idt_entry.constprop.236
.LVL4495:
	.loc 4 389 0
	movl	$int_54, %edx
	movl	$84, %eax
	call	init_idt_entry.constprop.236
.LVL4496:
	.loc 4 390 0
	movl	$int_55, %edx
	movl	$85, %eax
	call	init_idt_entry.constprop.236
.LVL4497:
	.loc 4 391 0
	movl	$int_56, %edx
	movl	$86, %eax
	call	init_idt_entry.constprop.236
.LVL4498:
	.loc 4 392 0
	movl	$int_57, %edx
	movl	$87, %eax
	call	init_idt_entry.constprop.236
.LVL4499:
	.loc 4 393 0
	movl	$int_58, %edx
	movl	$88, %eax
	call	init_idt_entry.constprop.236
.LVL4500:
	.loc 4 394 0
	movl	$int_59, %edx
	movl	$89, %eax
	call	init_idt_entry.constprop.236
.LVL4501:
	.loc 4 395 0
	movl	$int_5a, %edx
	movl	$90, %eax
	call	init_idt_entry.constprop.236
.LVL4502:
	.loc 4 396 0
	movl	$int_5b, %edx
	movl	$91, %eax
	call	init_idt_entry.constprop.236
.LVL4503:
	.loc 4 397 0
	movl	$int_5c, %edx
	movl	$92, %eax
	call	init_idt_entry.constprop.236
.LVL4504:
	.loc 4 398 0
	movl	$int_5d, %edx
	movl	$93, %eax
	call	init_idt_entry.constprop.236
.LVL4505:
	.loc 4 399 0
	movl	$int_5e, %edx
	movl	$94, %eax
	call	init_idt_entry.constprop.236
.LVL4506:
	.loc 4 400 0
	movl	$int_5f, %edx
	movl	$95, %eax
	call	init_idt_entry.constprop.236
.LVL4507:
	.loc 4 402 0
	movl	$int_60, %edx
	movl	$96, %eax
	call	init_idt_entry.constprop.236
.LVL4508:
	.loc 4 403 0
	movl	$int_61, %edx
	movl	$97, %eax
	call	init_idt_entry.constprop.236
.LVL4509:
	.loc 4 404 0
	movl	$int_62, %edx
	movl	$98, %eax
	call	init_idt_entry.constprop.236
.LVL4510:
	.loc 4 405 0
	movl	$int_63, %edx
	movl	$99, %eax
	call	init_idt_entry.constprop.236
.LVL4511:
	.loc 4 406 0
	movl	$int_64, %edx
	movl	$100, %eax
	call	init_idt_entry.constprop.236
.LVL4512:
	.loc 4 407 0
	movl	$int_65, %edx
	movl	$101, %eax
	call	init_idt_entry.constprop.236
.LVL4513:
	.loc 4 408 0
	movl	$int_66, %edx
	movl	$102, %eax
	call	init_idt_entry.constprop.236
.LVL4514:
	.loc 4 409 0
	movl	$int_67, %edx
	movl	$103, %eax
	call	init_idt_entry.constprop.236
.LVL4515:
	.loc 4 410 0
	movl	$int_68, %edx
	movl	$104, %eax
	call	init_idt_entry.constprop.236
.LVL4516:
	.loc 4 411 0
	movl	$int_69, %edx
	movl	$105, %eax
	call	init_idt_entry.constprop.236
.LVL4517:
	.loc 4 412 0
	movl	$int_6a, %edx
	movl	$106, %eax
	call	init_idt_entry.constprop.236
.LVL4518:
	.loc 4 413 0
	movl	$int_6b, %edx
	movl	$107, %eax
	call	init_idt_entry.constprop.236
.LVL4519:
	.loc 4 414 0
	movl	$int_6c, %edx
	movl	$108, %eax
	call	init_idt_entry.constprop.236
.LVL4520:
	.loc 4 415 0
	movl	$int_6d, %edx
	movl	$109, %eax
	call	init_idt_entry.constprop.236
.LVL4521:
	.loc 4 416 0
	movl	$int_6e, %edx
	movl	$110, %eax
	call	init_idt_entry.constprop.236
.LVL4522:
	.loc 4 417 0
	movl	$int_6f, %edx
	movl	$111, %eax
	call	init_idt_entry.constprop.236
.LVL4523:
	.loc 4 419 0
	movl	$int_70, %edx
	movl	$112, %eax
	call	init_idt_entry.constprop.236
.LVL4524:
	.loc 4 420 0
	movl	$int_71, %edx
	movl	$113, %eax
	call	init_idt_entry.constprop.236
.LVL4525:
	.loc 4 421 0
	movl	$int_72, %edx
	movl	$114, %eax
	call	init_idt_entry.constprop.236
.LVL4526:
	.loc 4 422 0
	movl	$int_73, %edx
	movl	$115, %eax
	call	init_idt_entry.constprop.236
.LVL4527:
	.loc 4 423 0
	movl	$int_74, %edx
	movl	$116, %eax
	call	init_idt_entry.constprop.236
.LVL4528:
	.loc 4 424 0
	movl	$int_75, %edx
	movl	$117, %eax
	call	init_idt_entry.constprop.236
.LVL4529:
	.loc 4 425 0
	movl	$int_76, %edx
	movl	$118, %eax
	call	init_idt_entry.constprop.236
.LVL4530:
	.loc 4 426 0
	movl	$int_77, %edx
	movl	$119, %eax
	call	init_idt_entry.constprop.236
.LVL4531:
	.loc 4 427 0
	movl	$int_78, %edx
	movl	$120, %eax
	call	init_idt_entry.constprop.236
.LVL4532:
	.loc 4 428 0
	movl	$int_79, %edx
	movl	$121, %eax
	call	init_idt_entry.constprop.236
.LVL4533:
	.loc 4 429 0
	movl	$int_7a, %edx
	movl	$122, %eax
	call	init_idt_entry.constprop.236
.LVL4534:
	.loc 4 430 0
	movl	$int_7b, %edx
	movl	$123, %eax
	call	init_idt_entry.constprop.236
.LVL4535:
	.loc 4 431 0
	movl	$int_7c, %edx
	movl	$124, %eax
	call	init_idt_entry.constprop.236
.LVL4536:
	.loc 4 432 0
	movl	$int_7d, %edx
	movl	$125, %eax
	call	init_idt_entry.constprop.236
.LVL4537:
	.loc 4 433 0
	movl	$int_7e, %edx
	movl	$126, %eax
	call	init_idt_entry.constprop.236
.LVL4538:
	.loc 4 434 0
	movl	$int_7f, %edx
	movl	$127, %eax
	call	init_idt_entry.constprop.236
.LVL4539:
	.loc 4 436 0
	movl	$int_80, %edx
	movl	$128, %eax
	call	init_idt_entry.constprop.236
.LVL4540:
	.loc 4 437 0
	movl	$int_81, %edx
	movl	$129, %eax
	call	init_idt_entry.constprop.236
.LVL4541:
	.loc 4 438 0
	movl	$int_82, %edx
	movl	$130, %eax
	call	init_idt_entry.constprop.236
.LVL4542:
	.loc 4 439 0
	movl	$int_83, %edx
	movl	$131, %eax
	call	init_idt_entry.constprop.236
.LVL4543:
	.loc 4 440 0
	movl	$int_84, %edx
	movl	$132, %eax
	call	init_idt_entry.constprop.236
.LVL4544:
	.loc 4 441 0
	movl	$int_85, %edx
	movl	$133, %eax
	call	init_idt_entry.constprop.236
.LVL4545:
	.loc 4 442 0
	movl	$int_86, %edx
	movl	$134, %eax
	call	init_idt_entry.constprop.236
.LVL4546:
	.loc 4 443 0
	movl	$int_87, %edx
	movl	$135, %eax
	call	init_idt_entry.constprop.236
.LVL4547:
	.loc 4 444 0
	movl	$int_88, %edx
	movl	$136, %eax
	call	init_idt_entry.constprop.236
.LVL4548:
	.loc 4 445 0
	movl	$int_89, %edx
	movl	$137, %eax
	call	init_idt_entry.constprop.236
.LVL4549:
	.loc 4 446 0
	movl	$int_8a, %edx
	movl	$138, %eax
	call	init_idt_entry.constprop.236
.LVL4550:
	.loc 4 447 0
	movl	$int_8b, %edx
	movl	$139, %eax
	call	init_idt_entry.constprop.236
.LVL4551:
	.loc 4 448 0
	movl	$int_8c, %edx
	movl	$140, %eax
	call	init_idt_entry.constprop.236
.LVL4552:
	.loc 4 449 0
	movl	$int_8d, %edx
	movl	$141, %eax
	call	init_idt_entry.constprop.236
.LVL4553:
	.loc 4 450 0
	movl	$int_8e, %edx
	movl	$142, %eax
	call	init_idt_entry.constprop.236
.LVL4554:
	.loc 4 451 0
	movl	$int_8f, %edx
	movl	$143, %eax
	call	init_idt_entry.constprop.236
.LVL4555:
	.loc 4 453 0
	movl	$int_90, %edx
	movl	$144, %eax
	call	init_idt_entry.constprop.236
.LVL4556:
	.loc 4 454 0
	movl	$int_91, %edx
	movl	$145, %eax
	call	init_idt_entry.constprop.236
.LVL4557:
	.loc 4 455 0
	movl	$int_92, %edx
	movl	$146, %eax
	call	init_idt_entry.constprop.236
.LVL4558:
	.loc 4 456 0
	movl	$int_93, %edx
	movl	$147, %eax
	call	init_idt_entry.constprop.236
.LVL4559:
	.loc 4 457 0
	movl	$int_94, %edx
	movl	$148, %eax
	call	init_idt_entry.constprop.236
.LVL4560:
	.loc 4 458 0
	movl	$int_95, %edx
	movl	$149, %eax
	call	init_idt_entry.constprop.236
.LVL4561:
	.loc 4 459 0
	movl	$int_96, %edx
	movl	$150, %eax
	call	init_idt_entry.constprop.236
.LVL4562:
	.loc 4 460 0
	movl	$int_97, %edx
	movl	$151, %eax
	call	init_idt_entry.constprop.236
.LVL4563:
	.loc 4 461 0
	movl	$int_98, %edx
	movl	$152, %eax
	call	init_idt_entry.constprop.236
.LVL4564:
	.loc 4 462 0
	movl	$int_99, %edx
	movl	$153, %eax
	call	init_idt_entry.constprop.236
.LVL4565:
	.loc 4 463 0
	movl	$int_9a, %edx
	movl	$154, %eax
	call	init_idt_entry.constprop.236
.LVL4566:
	.loc 4 464 0
	movl	$int_9b, %edx
	movl	$155, %eax
	call	init_idt_entry.constprop.236
.LVL4567:
	.loc 4 465 0
	movl	$int_9c, %edx
	movl	$156, %eax
	call	init_idt_entry.constprop.236
.LVL4568:
	.loc 4 466 0
	movl	$int_9d, %edx
	movl	$157, %eax
	call	init_idt_entry.constprop.236
.LVL4569:
	.loc 4 467 0
	movl	$int_9e, %edx
	movl	$158, %eax
	call	init_idt_entry.constprop.236
.LVL4570:
	.loc 4 468 0
	movl	$int_9f, %edx
	movl	$159, %eax
	call	init_idt_entry.constprop.236
.LVL4571:
	.loc 4 470 0
	movl	$int_a0, %edx
	movl	$160, %eax
	call	init_idt_entry.constprop.236
.LVL4572:
	.loc 4 471 0
	movl	$int_a1, %edx
	movl	$161, %eax
	call	init_idt_entry.constprop.236
.LVL4573:
	.loc 4 472 0
	movl	$int_a2, %edx
	movl	$162, %eax
	call	init_idt_entry.constprop.236
.LVL4574:
	.loc 4 473 0
	movl	$int_a3, %edx
	movl	$163, %eax
	call	init_idt_entry.constprop.236
.LVL4575:
	.loc 4 474 0
	movl	$int_a4, %edx
	movl	$164, %eax
	call	init_idt_entry.constprop.236
.LVL4576:
	.loc 4 475 0
	movl	$int_a5, %edx
	movl	$165, %eax
	call	init_idt_entry.constprop.236
.LVL4577:
	.loc 4 476 0
	movl	$int_a6, %edx
	movl	$166, %eax
	call	init_idt_entry.constprop.236
.LVL4578:
	.loc 4 477 0
	movl	$int_a7, %edx
	movl	$167, %eax
	call	init_idt_entry.constprop.236
.LVL4579:
	.loc 4 478 0
	movl	$int_a8, %edx
	movl	$168, %eax
	call	init_idt_entry.constprop.236
.LVL4580:
	.loc 4 479 0
	movl	$int_a9, %edx
	movl	$169, %eax
	call	init_idt_entry.constprop.236
.LVL4581:
	.loc 4 480 0
	movl	$int_aa, %edx
	movl	$170, %eax
	call	init_idt_entry.constprop.236
.LVL4582:
	.loc 4 481 0
	movl	$int_ab, %edx
	movl	$171, %eax
	call	init_idt_entry.constprop.236
.LVL4583:
	.loc 4 482 0
	movl	$int_ac, %edx
	movl	$172, %eax
	call	init_idt_entry.constprop.236
.LVL4584:
	.loc 4 483 0
	movl	$int_ad, %edx
	movl	$173, %eax
	call	init_idt_entry.constprop.236
.LVL4585:
	.loc 4 484 0
	movl	$int_ae, %edx
	movl	$174, %eax
	call	init_idt_entry.constprop.236
.LVL4586:
	.loc 4 485 0
	movl	$int_af, %edx
	movl	$175, %eax
	call	init_idt_entry.constprop.236
.LVL4587:
	.loc 4 487 0
	movl	$int_b0, %edx
	movl	$176, %eax
	call	init_idt_entry.constprop.236
.LVL4588:
	.loc 4 488 0
	movl	$int_b1, %edx
	movl	$177, %eax
	call	init_idt_entry.constprop.236
.LVL4589:
	.loc 4 489 0
	movl	$int_b2, %edx
	movl	$178, %eax
	call	init_idt_entry.constprop.236
.LVL4590:
	.loc 4 490 0
	movl	$int_b3, %edx
	movl	$179, %eax
	call	init_idt_entry.constprop.236
.LVL4591:
	.loc 4 491 0
	movl	$int_b4, %edx
	movl	$180, %eax
	call	init_idt_entry.constprop.236
.LVL4592:
	.loc 4 492 0
	movl	$int_b5, %edx
	movl	$181, %eax
	call	init_idt_entry.constprop.236
.LVL4593:
	.loc 4 493 0
	movl	$int_b6, %edx
	movl	$182, %eax
	call	init_idt_entry.constprop.236
.LVL4594:
	.loc 4 494 0
	movl	$int_b7, %edx
	movl	$183, %eax
	call	init_idt_entry.constprop.236
.LVL4595:
	.loc 4 495 0
	movl	$int_b8, %edx
	movl	$184, %eax
	call	init_idt_entry.constprop.236
.LVL4596:
	.loc 4 496 0
	movl	$int_b9, %edx
	movl	$185, %eax
	call	init_idt_entry.constprop.236
.LVL4597:
	.loc 4 497 0
	movl	$int_ba, %edx
	movl	$186, %eax
	call	init_idt_entry.constprop.236
.LVL4598:
	.loc 4 498 0
	movl	$int_bb, %edx
	movl	$187, %eax
	call	init_idt_entry.constprop.236
.LVL4599:
	.loc 4 499 0
	movl	$int_bc, %edx
	movl	$188, %eax
	call	init_idt_entry.constprop.236
.LVL4600:
	.loc 4 500 0
	movl	$int_bd, %edx
	movl	$189, %eax
	call	init_idt_entry.constprop.236
.LVL4601:
	.loc 4 501 0
	movl	$int_be, %edx
	movl	$190, %eax
	call	init_idt_entry.constprop.236
.LVL4602:
	.loc 4 502 0
	movl	$int_bf, %edx
	movl	$191, %eax
	call	init_idt_entry.constprop.236
.LVL4603:
	.loc 4 504 0
	movl	$int_c0, %edx
	movl	$192, %eax
	call	init_idt_entry.constprop.236
.LVL4604:
	.loc 4 505 0
	movl	$int_c1, %edx
	movl	$193, %eax
	call	init_idt_entry.constprop.236
.LVL4605:
	.loc 4 506 0
	movl	$int_c2, %edx
	movl	$194, %eax
	call	init_idt_entry.constprop.236
.LVL4606:
	.loc 4 507 0
	movl	$int_c3, %edx
	movl	$195, %eax
	call	init_idt_entry.constprop.236
.LVL4607:
	.loc 4 508 0
	movl	$int_c4, %edx
	movl	$196, %eax
	call	init_idt_entry.constprop.236
.LVL4608:
	.loc 4 509 0
	movl	$int_c5, %edx
	movl	$197, %eax
	call	init_idt_entry.constprop.236
.LVL4609:
	.loc 4 510 0
	movl	$int_c6, %edx
	movl	$198, %eax
	call	init_idt_entry.constprop.236
.LVL4610:
	.loc 4 511 0
	movl	$int_c7, %edx
	movl	$199, %eax
	call	init_idt_entry.constprop.236
.LVL4611:
	.loc 4 512 0
	movl	$int_c8, %edx
	movl	$200, %eax
	call	init_idt_entry.constprop.236
.LVL4612:
	.loc 4 513 0
	movl	$int_c9, %edx
	movl	$201, %eax
	call	init_idt_entry.constprop.236
.LVL4613:
	.loc 4 514 0
	movl	$int_ca, %edx
	movl	$202, %eax
	call	init_idt_entry.constprop.236
.LVL4614:
	.loc 4 515 0
	movl	$int_cb, %edx
	movl	$203, %eax
	call	init_idt_entry.constprop.236
.LVL4615:
	.loc 4 516 0
	movl	$int_cc, %edx
	movl	$204, %eax
	call	init_idt_entry.constprop.236
.LVL4616:
	.loc 4 517 0
	movl	$int_cd, %edx
	movl	$205, %eax
	call	init_idt_entry.constprop.236
.LVL4617:
	.loc 4 518 0
	movl	$int_ce, %edx
	movl	$206, %eax
	call	init_idt_entry.constprop.236
.LVL4618:
	.loc 4 519 0
	movl	$int_cf, %edx
	movl	$207, %eax
	call	init_idt_entry.constprop.236
.LVL4619:
	.loc 4 521 0
	movl	$int_d0, %edx
	movl	$208, %eax
	call	init_idt_entry.constprop.236
.LVL4620:
	.loc 4 522 0
	movl	$int_d1, %edx
	movl	$209, %eax
	call	init_idt_entry.constprop.236
.LVL4621:
	.loc 4 523 0
	movl	$int_d2, %edx
	movl	$210, %eax
	call	init_idt_entry.constprop.236
.LVL4622:
	.loc 4 524 0
	movl	$int_d3, %edx
	movl	$211, %eax
	call	init_idt_entry.constprop.236
.LVL4623:
	.loc 4 525 0
	movl	$int_d4, %edx
	movl	$212, %eax
	call	init_idt_entry.constprop.236
.LVL4624:
	.loc 4 526 0
	movl	$int_d5, %edx
	movl	$213, %eax
	call	init_idt_entry.constprop.236
.LVL4625:
	.loc 4 527 0
	movl	$int_d6, %edx
	movl	$214, %eax
	call	init_idt_entry.constprop.236
.LVL4626:
	.loc 4 528 0
	movl	$int_d7, %edx
	movl	$215, %eax
	call	init_idt_entry.constprop.236
.LVL4627:
	.loc 4 529 0
	movl	$int_d8, %edx
	movl	$216, %eax
	call	init_idt_entry.constprop.236
.LVL4628:
	.loc 4 530 0
	movl	$int_d9, %edx
	movl	$217, %eax
	call	init_idt_entry.constprop.236
.LVL4629:
	.loc 4 531 0
	movl	$int_da, %edx
	movl	$218, %eax
	call	init_idt_entry.constprop.236
.LVL4630:
	.loc 4 532 0
	movl	$int_db, %edx
	movl	$219, %eax
	call	init_idt_entry.constprop.236
.LVL4631:
	.loc 4 533 0
	movl	$int_dc, %edx
	movl	$220, %eax
	call	init_idt_entry.constprop.236
.LVL4632:
	.loc 4 534 0
	movl	$int_dd, %edx
	movl	$221, %eax
	call	init_idt_entry.constprop.236
.LVL4633:
	.loc 4 535 0
	movl	$int_de, %edx
	movl	$222, %eax
	call	init_idt_entry.constprop.236
.LVL4634:
	.loc 4 536 0
	movl	$int_df, %edx
	movl	$223, %eax
	call	init_idt_entry.constprop.236
.LVL4635:
	.loc 4 538 0
	movl	$int_e0, %edx
	movl	$224, %eax
	call	init_idt_entry.constprop.236
.LVL4636:
	.loc 4 539 0
	movl	$int_e1, %edx
	movl	$225, %eax
	call	init_idt_entry.constprop.236
.LVL4637:
	.loc 4 540 0
	movl	$int_e2, %edx
	movl	$226, %eax
	call	init_idt_entry.constprop.236
.LVL4638:
	.loc 4 541 0
	movl	$int_e3, %edx
	movl	$227, %eax
	call	init_idt_entry.constprop.236
.LVL4639:
	.loc 4 542 0
	movl	$int_e4, %edx
	movl	$228, %eax
	call	init_idt_entry.constprop.236
.LVL4640:
	.loc 4 543 0
	movl	$int_e5, %edx
	movl	$229, %eax
	call	init_idt_entry.constprop.236
.LVL4641:
	.loc 4 544 0
	movl	$int_e6, %edx
	movl	$230, %eax
	call	init_idt_entry.constprop.236
.LVL4642:
	.loc 4 545 0
	movl	$int_e7, %edx
	movl	$231, %eax
	call	init_idt_entry.constprop.236
.LVL4643:
	.loc 4 546 0
	movl	$int_e8, %edx
	movl	$232, %eax
	call	init_idt_entry.constprop.236
.LVL4644:
	.loc 4 547 0
	movl	$int_e9, %edx
	movl	$233, %eax
	call	init_idt_entry.constprop.236
.LVL4645:
	.loc 4 548 0
	movl	$int_ea, %edx
	movl	$234, %eax
	call	init_idt_entry.constprop.236
.LVL4646:
	.loc 4 549 0
	movl	$int_eb, %edx
	movl	$235, %eax
	call	init_idt_entry.constprop.236
.LVL4647:
	.loc 4 550 0
	movl	$int_ec, %edx
	movl	$236, %eax
	call	init_idt_entry.constprop.236
.LVL4648:
	.loc 4 551 0
	movl	$int_ed, %edx
	movl	$237, %eax
	call	init_idt_entry.constprop.236
.LVL4649:
	.loc 4 552 0
	movl	$int_ee, %edx
	movl	$238, %eax
	call	init_idt_entry.constprop.236
.LVL4650:
	.loc 4 553 0
	movl	$int_ef, %edx
	movl	$239, %eax
	call	init_idt_entry.constprop.236
.LVL4651:
	.loc 4 555 0
	movl	$int_f0, %edx
	movl	$240, %eax
	call	init_idt_entry.constprop.236
.LVL4652:
	.loc 4 556 0
	movl	$int_f1, %edx
	movl	$241, %eax
	call	init_idt_entry.constprop.236
.LVL4653:
	.loc 4 557 0
	movl	$int_f2, %edx
	movl	$242, %eax
	call	init_idt_entry.constprop.236
.LVL4654:
	.loc 4 558 0
	movl	$int_f3, %edx
	movl	$243, %eax
	call	init_idt_entry.constprop.236
.LVL4655:
	.loc 4 559 0
	movl	$int_f4, %edx
	movl	$244, %eax
	call	init_idt_entry.constprop.236
.LVL4656:
	.loc 4 560 0
	movl	$int_f5, %edx
	movl	$245, %eax
	call	init_idt_entry.constprop.236
.LVL4657:
	.loc 4 561 0
	movl	$int_f6, %edx
	movl	$246, %eax
	call	init_idt_entry.constprop.236
.LVL4658:
	.loc 4 562 0
	movl	$int_f7, %edx
	movl	$247, %eax
	call	init_idt_entry.constprop.236
.LVL4659:
	.loc 4 563 0
	movl	$int_f8, %edx
	movl	$248, %eax
	call	init_idt_entry.constprop.236
.LVL4660:
	.loc 4 564 0
	movl	$int_f9, %edx
	movl	$249, %eax
	call	init_idt_entry.constprop.236
.LVL4661:
	.loc 4 565 0
	movl	$int_fa, %edx
	movl	$250, %eax
	call	init_idt_entry.constprop.236
.LVL4662:
	.loc 4 566 0
	movl	$int_fb, %edx
	movl	$251, %eax
	call	init_idt_entry.constprop.236
.LVL4663:
	.loc 4 567 0
	movl	$int_fc, %edx
	movl	$252, %eax
	call	init_idt_entry.constprop.236
.LVL4664:
	.loc 4 568 0
	movl	$int_fd, %edx
	movl	$253, %eax
	call	init_idt_entry.constprop.236
.LVL4665:
	.loc 4 569 0
	movl	$int_fe, %edx
	movl	$254, %eax
	call	init_idt_entry.constprop.236
.LVL4666:
	.loc 4 570 0
	movl	$255, %eax
	movl	$int_ff, %edx
	call	init_idt_entry.constprop.236
.LVL4667:
.LBE11427:
.LBE11431:
	.loc 4 884 0
	movl	$1, %eax
	.loc 4 885 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL4668:
	.p2align 4,,7
	.p2align 3
.L3601:
	.cfi_restore_state
.LBB11432:
.LBB11400:
	.loc 16 48 0
	movl	$.LC22, (%esp)
	call	printf
.LVL4669:
	jmp	.L3604
.LBE11400:
.LBE11432:
	.cfi_endproc
.LFE349:
	.size	init_vm_state, .-init_vm_state
	.p2align 4,,15
	.globl	create_frames_of_region
	.type	create_frames_of_region, @function
create_frames_of_region:
.LFB441:
	.loc 21 293 0
	.cfi_startproc
.LVL4670:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 21 299 0
	movl	ndks_boot+20, %esi
	.loc 21 293 0
	movl	84(%esp), %eax
	.loc 21 301 0
	movl	100(%esp), %ebp
	.loc 21 299 0
	movl	%esi, 44(%esp)
	.loc 21 293 0
	movl	%eax, 32(%esp)
	movl	88(%esp), %eax
	movl	%eax, 24(%esp)
	movl	104(%esp), %eax
.LVL4671:
	.loc 21 301 0
	cmpl	%eax, %ebp
	.loc 21 293 0
	movl	%eax, 36(%esp)
	.loc 21 301 0
	jae	.L3650
	.loc 21 303 0
	movl	112(%esp), %eax
.LVL4672:
	.loc 21 301 0
	movl	%esi, %edi
	.loc 21 303 0
	movl	$536870912, 40(%esp)
	subl	%eax, 40(%esp)
.LVL4673:
.L3649:
	.loc 21 302 0
	movl	108(%esp), %eax
	testl	%eax, %eax
	jne	.L3656
.LVL4674:
.LBB11507:
.LBB11508:
.LBB11509:
.LBB11510:
.LBB11511:
	.loc 27 1393 0
	testl	$4095, %ebp
	jne	.L3620
.LVL4675:
	.loc 27 1395 0
	movl	%ebp, %ebx
.LBE11511:
.LBE11510:
.LBE11509:
.LBE11508:
.LBE11507:
	.loc 21 305 0
	xorl	%esi, %esi
.LBB11516:
.LBB11515:
.LBB11514:
.LBB11513:
.LBB11512:
	.loc 27 1395 0
	andl	$-4096, %ebx
	shrl	$8, %ebx
	.loc 27 1399 0
	orl	$50331649, %ebx
.LVL4676:
.L3619:
	movl	24(%esp), %eax
.LVL4677:
.LBE11512:
.LBE11513:
.LBE11514:
.LBE11515:
.LBE11516:
.LBB11517:
.LBB11518:
	.loc 21 276 0
	cmpl	%edi, ndks_boot+24
	movl	%eax, 28(%esp)
.LVL4678:
	jbe	.L3657
	movl	32(%esp), %eax
.LVL4679:
.LBB11519:
.LBB11520:
.LBB11521:
.LBB11522:
	.loc 27 872 0
	movl	%eax, %ecx
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %edx
	.loc 27 872 0
	movl	%ecx, 20(%esp)
	.loc 27 873 0
	movzbl	%al, %ecx
	cmpl	$14, 20(%esp)
	cmove	%ecx, %edx
.LBE11522:
.LBE11521:
	.loc 40 428 0
	cmpl	$62, %edx
	ja	.L3625
	jmp	*.L3627(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L3627:
	.long	.L3651
	.long	.L3628
	.long	.L3629
	.long	.L3630
	.long	.L3631
	.long	.L3632
	.long	.L3633
	.long	.L3651
	.long	.L3651
	.long	.L3634
	.long	.L3635
	.long	.L3651
	.long	.L3636
	.long	.L3625
	.long	.L3651
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3651
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3637
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3625
	.long	.L3651
	.section	.boot.text
.LVL4680:
	.p2align 4,,7
	.p2align 3
.L3657:
.LBE11520:
.LBE11519:
	.loc 21 277 0
	movl	$.LC161, (%esp)
	call	printf
.LVL4681:
.LBE11518:
.LBE11517:
	.loc 21 308 0
	movl	80(%esp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	.loc 21 318 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4682:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4683:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4684:
	ret	$4
.LVL4685:
	.p2align 4,,7
	.p2align 3
.L3656:
	.cfi_restore_state
	movl	40(%esp), %eax
	addl	%ebp, %eax
.LVL4686:
.LBB11580:
.LBB11581:
.LBB11582:
.LBB11583:
.LBB11584:
.LBB11585:
	.loc 27 1381 0
	testl	$4095, %eax
	jne	.L3658
	.loc 27 1383 0
	shrl	$12, %eax
.LVL4687:
	movl	%eax, %esi
	orl	$1048576, %esi
.LVL4688:
	.loc 27 1393 0
	testl	$4095, %ebp
	jne	.L3620
.LVL4689:
.LBE11585:
.LBE11584:
.LBE11583:
.LBE11582:
	.loc 46 106 0
	movl	92(%esp), %eax
.LBB11595:
.LBB11592:
.LBB11589:
.LBB11586:
	.loc 27 1395 0
	movl	%ebp, %ebx
.LBE11586:
.LBE11589:
.LBE11592:
.LBE11595:
	.loc 46 106 0
	movl	96(%esp), %edx
.LBB11596:
.LBB11593:
.LBB11590:
.LBB11587:
	.loc 27 1395 0
	andl	$-4096, %ebx
	shrl	$8, %ebx
	.loc 27 1399 0
	orl	$50331649, %ebx
.LVL4690:
.LBE11587:
.LBE11590:
.LBE11593:
.LBE11596:
	.loc 46 106 0
	movl	%ebx, 8(%esp)
	movl	%esi, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	map_it_frame_cap
.LVL4691:
	movl	ndks_boot+20, %edi
	jmp	.L3619
.LVL4692:
	.p2align 4,,7
	.p2align 3
.L3651:
.LBE11581:
.LBE11580:
.LBB11599:
.LBB11575:
.LBB11568:
.LBB11565:
	.loc 40 457 0
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L3626:
.LBE11565:
.LBE11568:
	.loc 21 280 0
	sall	$4, %edi
.LBE11575:
.LBE11599:
	.loc 21 301 0
	addl	$4096, %ebp
.LVL4693:
.LBB11600:
.LBB11576:
	.loc 21 280 0
	addl	%edi, %eax
.LVL4694:
.LBB11569:
.LBB11570:
	.loc 21 121 0
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
.LVL4695:
	.loc 21 123 0
	movl	$0, 8(%eax)
.LVL4696:
.LBB11571:
.LBB11572:
	.loc 27 819 0
	movl	$3, 12(%eax)
.LBE11572:
.LBE11571:
.LBE11570:
.LBE11569:
	.loc 21 281 0
	movl	ndks_boot+20, %eax
.LVL4697:
	addl	$1, %eax
.LBE11576:
.LBE11600:
	.loc 21 301 0
	cmpl	36(%esp), %ebp
.LBB11601:
.LBB11577:
	.loc 21 281 0
	movl	%eax, ndks_boot+20
.LBE11577:
.LBE11601:
	.loc 21 301 0
	jae	.L3653
.LBB11602:
.LBB11578:
	.loc 21 281 0
	movl	%eax, %edi
	jmp	.L3649
.LVL4698:
	.p2align 4,,7
	.p2align 3
.L3635:
.LBB11573:
.LBB11566:
.LBB11523:
.LBB11524:
	.loc 27 1332 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$10, %edx
	jne	.L3659
	.loc 27 1335 0
	andl	$2147483632, %eax
	addl	%eax, %eax
	jmp	.L3626
	.p2align 4,,7
	.p2align 3
.L3634:
.LVL4699:
.LBE11524:
.LBE11523:
.LBB11526:
.LBB11527:
	.loc 27 1762 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$9, %edx
	jne	.L3660
.L3648:
	.loc 27 1765 0
	andl	$16777200, %eax
	sall	$8, %eax
	jmp	.L3626
	.p2align 4,,7
	.p2align 3
.L3637:
.LVL4700:
.LBE11527:
.LBE11526:
.LBB11529:
.LBB11530:
.LBB11531:
.LBB11532:
.LBB11533:
.LBB11534:
	.loc 27 1891 0
	cmpb	$46, %al
	jne	.L3661
	.loc 27 1894 0
	andl	$16128, %eax
.LBE11534:
.LBE11533:
	.loc 40 90 0
	movl	$-16, %edx
.LBB11537:
.LBB11535:
	.loc 27 1894 0
	shrl	$8, %eax
.LBE11535:
.LBE11537:
	.loc 40 90 0
	cmpl	$32, %eax
	je	.L3647
	leal	1(%eax), %ecx
	movb	$-1, %dl
	sall	%cl, %edx
.L3647:
.LVL4701:
.LBE11532:
.LBE11531:
	.loc 40 107 0
	movl	28(%esp), %eax
	andl	%edx, %eax
	jmp	.L3626
.LVL4702:
	.p2align 4,,7
	.p2align 3
.L3636:
.LBE11530:
.LBE11529:
.LBB11542:
.LBB11543:
	.loc 27 1359 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$12, %edx
	jne	.L3662
.LBE11543:
.LBE11542:
	.loc 40 442 0
	andl	$-1024, %eax
	jmp	.L3626
	.p2align 4,,7
	.p2align 3
.L3633:
.LVL4703:
.LBB11545:
.LBB11546:
	.loc 27 1187 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$6, %edx
	jne	.L3663
.L3640:
	.loc 27 1190 0
	andl	$-16, %eax
	jmp	.L3626
	.p2align 4,,7
	.p2align 3
.L3632:
.LVL4704:
.LBE11546:
.LBE11545:
.LBB11548:
.LBB11549:
	.loc 27 1708 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$5, %edx
	je	.L3648
	call	cap_page_directory_cap_get_capPDBasePtr.isra.67.part.68
.LVL4705:
	.p2align 4,,7
	.p2align 3
.L3631:
.LBE11549:
.LBE11548:
.LBB11550:
.LBB11551:
	.loc 27 1088 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$4, %edx
	je	.L3640
	call	cap_endpoint_cap_get_capEPPtr.isra.65.part.66
.LVL4706:
	.p2align 4,,7
	.p2align 3
.L3630:
.LBE11551:
.LBE11550:
.LBB11552:
.LBB11553:
	.loc 27 1619 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$3, %edx
	je	.L3648
	call	cap_page_table_cap_get_capPTBasePtr.isra.92.part.93
.LVL4707:
	.p2align 4,,7
	.p2align 3
.L3629:
.LBE11553:
.LBE11552:
.LBB11554:
.LBB11555:
	.loc 27 965 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L3640
	call	cap_untyped_cap_get_capPtr.isra.84.part.85
.LVL4708:
	.p2align 4,,7
	.p2align 3
.L3628:
.LBE11555:
.LBE11554:
.LBB11556:
.LBB11557:
	.loc 27 1507 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$1, %edx
	je	.L3648
	call	cap_frame_cap_get_capFBasePtr.isra.90.part.91
.LVL4709:
	.p2align 4,,7
	.p2align 3
.L3625:
.LBE11557:
.LBE11556:
.LBB11558:
.LBB11559:
	.loc 40 487 0
	movl	$__func__.2498, 12(%esp)
	movl	$487, 8(%esp)
	movl	$.LC55, 4(%esp)
	movl	$.LC56, (%esp)
	call	_fail
.LVL4710:
	.p2align 4,,7
	.p2align 3
.L3653:
	movl	44(%esp), %ecx
.LVL4711:
.L3615:
.LBE11559:
.LBE11558:
.LBE11566:
.LBE11573:
.LBE11578:
.LBE11602:
	.loc 21 315 0
	movl	80(%esp), %esi
	movl	%eax, 4(%esi)
	movl	%esi, %eax
.LVL4712:
	movl	%ecx, (%esi)
	movl	$1, 8(%esi)
	.loc 21 318 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4713:
	ret	$4
.LVL4714:
.L3650:
	.cfi_restore_state
	movl	%esi, %eax
.LVL4715:
	movl	%esi, %ecx
	jmp	.L3615
.LVL4716:
.L3620:
.LBB11603:
.LBB11598:
.LBB11597:
.LBB11594:
.LBB11591:
.LBB11588:
	.loc 27 1393 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1393, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC135, (%esp)
	call	_assert_fail
.LVL4717:
.L3658:
	.loc 27 1381 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1381, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC137, (%esp)
	call	_assert_fail
.LVL4718:
.L3659:
.LBE11588:
.LBE11591:
.LBE11594:
.LBE11597:
.LBE11598:
.LBE11603:
.LBB11604:
.LBB11579:
.LBB11574:
.LBB11567:
.LBB11560:
.LBB11525:
	call	cap_cnode_cap_get_capCNodePtr.isra.62.part.63
.LVL4719:
.L3660:
.LBE11525:
.LBE11560:
.LBB11561:
.LBB11528:
	call	cap_asid_pool_cap_get_capASIDPool.isra.99.part.100
.LVL4720:
.L3661:
.LBE11528:
.LBE11561:
.LBB11562:
.LBB11541:
.LBB11540:
.LBB11539:
.LBB11538:
.LBB11536:
	.p2align 4,,5
	call	cap_zombie_cap_get_capZombieType.isra.94.part.95
.LVL4721:
.L3662:
.LBE11536:
.LBE11538:
.LBE11539:
.LBE11540:
.LBE11541:
.LBE11562:
.LBB11563:
.LBB11544:
	.p2align 4,,5
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL4722:
.L3663:
.LBE11544:
.LBE11563:
.LBB11564:
.LBB11547:
	.p2align 4,,5
	call	cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87
.LVL4723:
.LBE11547:
.LBE11564:
.LBE11567:
.LBE11574:
.LBE11579:
.LBE11604:
	.cfi_endproc
.LFE441:
	.size	create_frames_of_region, .-create_frames_of_region
	.section	.rodata.str1.1
.LC208:
	.string	"size_bits >= WORD_BITS / 8"
.LC209:
	.string	"(capBlockSize & ~0x1f) == 0"
.LC210:
	.string	"(capPtr & ~0xfffffff0) == 0"
	.section	.rodata.str1.4
	.align 4
.LC211:
	.string	"Kernel init: Too many untyped regions for boot info\n"
	.section	.boot.text
	.p2align 4,,15
	.type	create_untypeds_for_region, @function
create_untypeds_for_region:
.LFB448:
	.loc 21 468 0
	.cfi_startproc
.LVL4724:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 21 468 0
	movl	68(%esp), %ebp
	movl	64(%esp), %ebx
.LVL4725:
	movl	%eax, 24(%esp)
	movl	%edx, 28(%esp)
	.loc 21 472 0
	cmpl	%ebp, %ebx
	jne	.L3675
	jmp	.L3673
.LVL4726:
	.p2align 4,,7
	.p2align 3
.L3668:
.LBB11633:
.LBB11634:
	.loc 21 440 0
	movl	$.LC211, (%esp)
	call	printf
.LVL4727:
.LBE11634:
.LBE11633:
	.loc 21 488 0
	movl	$1, %eax
	movl	%esi, %ecx
	sall	%cl, %eax
	addl	%eax, %ebx
.LVL4728:
	.loc 21 472 0
	cmpl	%ebp, %ebx
	je	.L3673
.LVL4729:
.L3675:
	.loc 21 474 0
	movl	%ebp, %eax
.LVL4730:
	movl	$31, %esi
	subl	%ebx, %eax
.LVL4731:
.LBB11670:
.LBB11671:
	.loc 21 459 0
	rep bsfl	%ebx, %edx
.LBE11671:
.LBE11670:
.LBB11672:
.LBB11673:
	.loc 21 451 0
	bsrl	%eax, %eax
.LVL4732:
	xorl	$31, %eax
.LVL4733:
.LBE11673:
.LBE11672:
	.loc 21 474 0
	subl	%eax, %esi
.LVL4734:
	cmpl	%edx, %esi
	cmova	%edx, %esi
.LVL4735:
	.loc 21 484 0
	cmpl	$3, %esi
	jbe	.L3678
.LVL4736:
.LBB11674:
.LBB11665:
	.loc 21 434 0
	movl	ndks_boot+20, %edi
	movl	%edi, %edx
	subl	72(%esp), %edx
.LVL4737:
	.loc 21 435 0
	cmpl	$166, %edx
	ja	.L3668
	.loc 21 436 0
	movl	ndks_boot+16, %eax
.LVL4738:
.LBB11635:
.LBB11636:
	.loc 10 41 0
	leal	536870912(%ebx), %ecx
.LBE11636:
.LBE11635:
.LBB11638:
.LBB11639:
	.loc 27 911 0
	testl	$-32, %esi
.LBE11639:
.LBE11638:
.LBB11645:
.LBB11637:
	.loc 10 41 0
	movl	%ecx, 56(%eax,%edx,4)
.LBE11637:
.LBE11645:
	.loc 21 437 0
	movl	%esi, %ecx
	movb	%cl, 724(%eax,%edx)
.LVL4739:
.LBB11646:
.LBB11640:
	.loc 27 911 0
	jne	.L3679
.LVL4740:
	.loc 27 915 0
	testb	$15, %bl
	jne	.L3680
.LVL4741:
.LBE11640:
.LBE11646:
.LBB11647:
.LBB11648:
	.loc 21 276 0
	cmpl	ndks_boot+24, %edi
	jae	.L3681
	.loc 21 280 0
	movl	28(%esp), %edx
.LVL4742:
	sall	$4, %edi
.LVL4743:
	movl	24(%esp), %eax
	call	cap_get_capPtr
.LVL4744:
.LBE11648:
.LBE11647:
.LBB11657:
.LBB11641:
	.loc 27 917 0
	movl	%ebx, %edx
.LBE11641:
.LBE11657:
.LBE11665:
.LBE11674:
	.loc 21 488 0
	movl	%esi, %ecx
.LBB11675:
.LBB11666:
.LBB11658:
.LBB11642:
	.loc 27 917 0
	andl	$-16, %edx
.LVL4745:
	.loc 27 921 0
	orl	$2, %edx
.LVL4746:
.LBE11642:
.LBE11658:
.LBB11659:
.LBB11653:
	.loc 21 280 0
	addl	%edi, %eax
.LVL4747:
.LBE11653:
.LBE11659:
.LBB11660:
.LBB11643:
	.loc 27 921 0
	movl	%edx, (%eax)
.LBE11643:
.LBE11660:
.LBB11661:
.LBB11654:
.LBB11649:
.LBB11650:
	.loc 21 121 0
	movl	%esi, 4(%eax)
.LVL4748:
	.loc 21 123 0
	movl	$0, 8(%eax)
.LVL4749:
.LBB11651:
.LBB11652:
	.loc 27 819 0
	movl	$3, 12(%eax)
.LBE11652:
.LBE11651:
.LBE11650:
.LBE11649:
.LBE11654:
.LBE11661:
.LBE11666:
.LBE11675:
	.loc 21 488 0
	movl	$1, %eax
.LVL4750:
	sall	%cl, %eax
	addl	%eax, %ebx
.LVL4751:
.LBB11676:
.LBB11667:
.LBB11662:
.LBB11655:
	.loc 21 281 0
	addl	$1, ndks_boot+20
.LVL4752:
.LBE11655:
.LBE11662:
.LBE11667:
.LBE11676:
	.loc 21 472 0
	cmpl	%ebp, %ebx
	jne	.L3675
.LVL4753:
.L3673:
	.loc 21 491 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 21 490 0
	movl	$1, %eax
.LVL4754:
	.loc 21 491 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4755:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4756:
	ret
.LVL4757:
	.p2align 4,,7
	.p2align 3
.L3681:
	.cfi_restore_state
.LBB11677:
.LBB11668:
.LBB11663:
.LBB11656:
	.loc 21 277 0
	movl	$.LC161, (%esp)
	call	printf
.LVL4758:
.LBE11656:
.LBE11663:
.LBE11668:
.LBE11677:
	.loc 21 491 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 21 486 0
	xorl	%eax, %eax
	.loc 21 491 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4759:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4760:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4761:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4762:
	ret
.LVL4763:
.L3678:
	.cfi_restore_state
.LBB11678:
.LBB11679:
	.loc 21 484 0
	movl	$__FUNCTION__.5967, 12(%esp)
	movl	$484, 8(%esp)
	movl	$.LC87, 4(%esp)
	movl	$.LC208, (%esp)
	call	_assert_fail
.LVL4764:
.L3680:
.LBE11679:
.LBE11678:
.LBB11680:
.LBB11669:
.LBB11664:
.LBB11644:
	.loc 27 915 0
	movl	$__FUNCTION__.1542, 12(%esp)
	movl	$915, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC210, (%esp)
	call	_assert_fail
.LVL4765:
.L3679:
	.loc 27 911 0
	movl	$__FUNCTION__.1542, 12(%esp)
	movl	$911, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC209, (%esp)
	call	_assert_fail
.LVL4766:
.LBE11644:
.LBE11664:
.LBE11669:
.LBE11680:
	.cfi_endproc
.LFE448:
	.size	create_untypeds_for_region, .-create_untypeds_for_region
	.p2align 4,,15
	.globl	create_untypeds
	.type	create_untypeds, @function
create_untypeds:
.LFB449:
	.loc 21 495 0
	.cfi_startproc
.LVL4767:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 21 504 0
	xorl	%ebx, %ebx
	.loc 21 495 0
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 21 501 0
	movl	ndks_boot+20, %ebp
.LVL4768:
	.loc 21 504 0
	movl	56(%esp), %eax
	movl	60(%esp), %edx
	.loc 21 495 0
	movl	48(%esp), %esi
	movl	52(%esp), %edi
	.loc 21 504 0
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	movl	%ebp, 8(%esp)
	movl	%esi, %eax
	movl	%edi, %edx
	call	create_untypeds_for_region
.LVL4769:
	testl	%eax, %eax
	je	.L3685
.L3690:
.LVL4770:
	.loc 21 510 0
	movl	ndks_boot(,%ebx,8), %eax
.LVL4771:
	movl	ndks_boot+4(,%ebx,8), %edx
	.loc 21 512 0
	movl	%ebp, 8(%esp)
	.loc 21 511 0
	movl	$0, ndks_boot(,%ebx,8)
	.loc 21 512 0
	movl	%eax, (%esp)
	movl	%esi, %eax
	movl	%edx, 4(%esp)
	movl	%edi, %edx
	.loc 21 511 0
	movl	$0, ndks_boot+4(,%ebx,8)
	.loc 21 512 0
	call	create_untypeds_for_region
.LVL4772:
	testl	%eax, %eax
	je	.L3685
	.loc 21 509 0
	addl	$1, %ebx
.LVL4773:
	cmpl	$2, %ebx
	jne	.L3690
.LVL4774:
	.loc 21 518 0
	movl	ndks_boot+16, %eax
	movl	ndks_boot+20, %edx
	movl	%ebp, 48(%eax)
	movl	%edx, 52(%eax)
	.loc 21 522 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 21 521 0
	movl	$1, %eax
	.loc 21 522 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4775:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4776:
	ret
.LVL4777:
	.p2align 4,,7
	.p2align 3
.L3685:
	.cfi_restore_state
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	.loc 21 505 0
	xorl	%eax, %eax
	.loc 21 522 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4778:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4779:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4780:
	ret
	.cfi_endproc
.LFE449:
	.size	create_untypeds, .-create_untypeds
	.section	.rodata.str1.1
.LC212:
	.string	"Caught "
.LC213:
	.string	"\nwhile trying to handle:\n"
.LC214:
	.string	"\nin thread 0x%x "
.LC215:
	.string	"at address 0x%x\n"
	.text
	.p2align 4,,15
	.globl	handleFault
	.type	handleFault, @function
handleFault:
.LFB459:
	.loc 47 20 0
	.cfi_startproc
.LVL4781:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 47 22 0
	movl	current_fault, %eax
.LVL4782:
	.loc 47 20 0
	movl	32(%esp), %ebx
	.loc 47 22 0
	movl	current_fault+4, %edx
	movl	%eax, 8(%esp)
	.loc 47 24 0
	movl	%ebx, (%esp)
	.loc 47 22 0
	movl	%edx, 12(%esp)
.LVL4783:
	.loc 47 24 0
	call	sendFaultIPC
.LVL4784:
	.loc 47 25 0
	testl	%eax, %eax
	jne	.L3696
	.loc 47 28 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3696:
	.cfi_restore_state
.LVL4785:
.LBB11690:
.LBB11691:
	.loc 47 109 0
	movl	current_fault+4, %edx
.LVL4786:
	movl	current_fault, %eax
.LVL4787:
	.loc 47 110 0
	movl	$.LC212, (%esp)
	.loc 47 109 0
	movl	%edx, %edi
	movl	%eax, %esi
.LVL4788:
	.loc 47 110 0
	call	printf
.LVL4789:
	.loc 47 111 0
	movl	%edi, %edx
	movl	%esi, %eax
.LVL4790:
	call	print_fault
.LVL4791:
	.loc 47 112 0
	movl	$.LC213, (%esp)
	call	printf
.LVL4792:
	.loc 47 113 0
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	call	print_fault
.LVL4793:
	.loc 47 114 0
	movl	%ebx, 4(%esp)
	movl	$.LC214, (%esp)
	call	printf
.LVL4794:
	.loc 47 115 0
	movl	44(%ebx), %eax
	movl	$.LC215, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL4795:
.LBB11692:
.LBB11693:
.LBB11694:
.LBB11695:
	.loc 27 626 0
	andl	$-16, 592(%ebx)
.LBE11695:
.LBE11694:
	.loc 22 428 0
	movl	%ebx, 32(%esp)
.LBE11693:
.LBE11692:
.LBE11691:
.LBE11690:
	.loc 47 28 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL4796:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL4797:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LBB11699:
.LBB11698:
.LBB11697:
.LBB11696:
	.loc 22 428 0
	jmp	scheduleTCB
.LVL4798:
.LBE11696:
.LBE11697:
.LBE11698:
.LBE11699:
	.cfi_endproc
.LFE459:
	.size	handleFault, .-handleFault
	.p2align 4,,15
	.globl	handleVMFaultEvent
	.type	handleVMFaultEvent, @function
handleVMFaultEvent:
.LFB261:
	.loc 52 155 0
	.cfi_startproc
.LVL4799:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 52 158 0
	movl	ksCurThread, %esi
.LVL4800:
	.loc 52 155 0
	movl	32(%esp), %ebx
.LVL4801:
.LBB11736:
.LBB11737:
	.loc 4 1127 0
	call	getFaultAddr
.LVL4802:
.LBB11738:
.LBB11739:
	.loc 13 27 0
	movl	52(%esi), %edx
.LBE11739:
.LBE11738:
	.loc 4 1130 0
	testl	%ebx, %ebx
	je	.L3699
	cmpl	$1, %ebx
	jne	.L3716
.LVL4803:
.LBB11740:
.LBB11741:
	.loc 27 1992 0
	testl	$-32, %edx
	jne	.L3703
.LVL4804:
	.loc 27 1994 0
	sall	$27, %edx
.LVL4805:
	.loc 27 2002 0
	orl	$524290, %edx
	movl	%edx, current_fault
.LBE11741:
.LBE11740:
	.loc 4 1136 0
	movl	%eax, current_fault+4
.LVL4806:
.L3702:
.LBE11737:
.LBE11736:
	.loc 52 160 0
	movl	ksCurThread, %eax
.LVL4807:
	movl	%eax, (%esp)
	call	handleFault
.LVL4808:
	.loc 52 163 0
	call	schedule
.LVL4809:
.LBB11748:
.LBB11749:
	.loc 22 69 0
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
.LBB11750:
.LBB11751:
	.loc 27 614 0
	movl	%ecx, %edx
	andl	$15, %edx
.LBE11751:
.LBE11750:
	.loc 22 69 0
	cmpl	$2, %edx
	je	.L3705
	cmpl	$7, %edx
	je	.L3706
	cmpl	$1, %edx
	je	.L3706
.LBB11752:
.LBB11753:
	.loc 22 87 0
	movl	$__func__.6108, 12(%esp)
	movl	$87, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$.LC109, (%esp)
	call	_fail
.LVL4810:
	.p2align 4,,7
	.p2align 3
.L3716:
.LBE11753:
.LBE11752:
.LBE11749:
.LBE11748:
.LBB11768:
.LBB11746:
	.loc 4 1140 0
	movl	$__func__.5172, 12(%esp)
	movl	$1140, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC124, (%esp)
	call	_fail
.LVL4811:
	.p2align 4,,7
	.p2align 3
.L3705:
.LBE11746:
.LBE11768:
.LBB11769:
.LBB11767:
.LBB11754:
.LBB11755:
.LBB11756:
.LBB11757:
	.loc 13 21 0
	movl	44(%eax), %edx
.LBE11757:
.LBE11756:
.LBE11755:
.LBB11760:
.LBB11761:
.LBB11762:
.LBB11763:
	.loc 27 626 0
	andl	$-16, %ecx
	.loc 27 627 0
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
.LBE11763:
.LBE11762:
.LBE11761:
.LBE11760:
.LBB11765:
.LBB11759:
.LBB11758:
	.loc 13 21 0
	movl	%edx, 56(%eax)
.LVL4812:
.LBE11758:
.LBE11759:
.LBE11765:
.LBB11766:
.LBB11764:
	.loc 22 428 0
	movl	%eax, (%esp)
.LVL4813:
	call	scheduleTCB
.LVL4814:
.L3706:
.LBE11764:
.LBE11766:
.LBE11754:
.LBE11767:
.LBE11769:
	.loc 52 167 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL4815:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL4816:
	ret
.LVL4817:
	.p2align 4,,7
	.p2align 3
.L3699:
	.cfi_restore_state
.LBB11770:
.LBB11747:
.LBB11742:
.LBB11743:
	.loc 27 1992 0
	testl	$-32, %edx
	jne	.L3703
.LVL4818:
	.loc 27 1994 0
	sall	$27, %edx
.LVL4819:
	.loc 27 2002 0
	orl	$2, %edx
	movl	%edx, current_fault
.LBE11743:
.LBE11742:
	.loc 4 1132 0
	movl	%eax, current_fault+4
	jmp	.L3702
.LVL4820:
.L3703:
.LBB11745:
.LBB11744:
	call	fault_vm_fault_new.part.122
.LVL4821:
.LBE11744:
.LBE11745:
.LBE11747:
.LBE11770:
	.cfi_endproc
.LFE261:
	.size	handleVMFaultEvent, .-handleVMFaultEvent
	.section	.rodata.str1.1
.LC216:
	.string	"(code & ~0x1fffffff) == 0"
	.text
	.p2align 4,,15
	.globl	handleUserLevelFault
	.type	handleUserLevelFault, @function
handleUserLevelFault:
.LFB260:
	.loc 52 143 0
	.cfi_startproc
.LVL4822:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$32, %esp
	.cfi_def_cfa_offset 48
.LVL4823:
	.loc 52 143 0
	movl	52(%esp), %eax
.LVL4824:
.LBB11812:
.LBB11813:
	.loc 27 2064 0
	testl	$-536870912, %eax
	jne	.L3734
.LVL4825:
	.loc 27 2070 0
	leal	4(,%eax,8), %eax
.LVL4826:
.LBE11813:
.LBE11812:
	.loc 52 145 0
	movl	ksCurThread, %ebx
.LVL4827:
.LBB11816:
.LBB11814:
	.loc 27 2070 0
	movl	%eax, current_fault
.LBE11814:
.LBE11816:
	.loc 52 144 0
	movl	48(%esp), %eax
.LBB11817:
.LBB11818:
	.loc 47 24 0
	movl	%ebx, (%esp)
.LBE11818:
.LBE11817:
	.loc 52 144 0
	movl	%eax, current_fault+4
.LBB11826:
.LBB11825:
	.loc 47 22 0
	movl	current_fault, %eax
.LVL4828:
	movl	current_fault+4, %edx
	movl	%eax, 24(%esp)
	movl	%edx, 28(%esp)
.LVL4829:
	.loc 47 24 0
	call	sendFaultIPC
.LVL4830:
	.loc 47 25 0
	testl	%eax, %eax
	je	.L3719
.LVL4831:
.LBB11819:
.LBB11820:
	.loc 47 109 0
	movl	current_fault+4, %edx
.LVL4832:
	movl	current_fault, %eax
.LVL4833:
	.loc 47 110 0
	movl	$.LC212, (%esp)
	.loc 47 109 0
	movl	%edx, %edi
	movl	%eax, %esi
.LVL4834:
	.loc 47 110 0
	call	printf
.LVL4835:
	.loc 47 111 0
	movl	%edi, %edx
	movl	%esi, %eax
.LVL4836:
	call	print_fault
.LVL4837:
	.loc 47 112 0
	movl	$.LC213, (%esp)
	call	printf
.LVL4838:
	.loc 47 113 0
	movl	28(%esp), %edx
	movl	24(%esp), %eax
	call	print_fault
.LVL4839:
	.loc 47 114 0
	movl	%ebx, 4(%esp)
	movl	$.LC214, (%esp)
	call	printf
.LVL4840:
	.loc 47 115 0
	movl	44(%ebx), %eax
	movl	$.LC215, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL4841:
.LBB11821:
.LBB11822:
.LBB11823:
.LBB11824:
	.loc 27 626 0
	andl	$-16, 592(%ebx)
.LBE11824:
.LBE11823:
	.loc 22 428 0
	movl	%ebx, (%esp)
	call	scheduleTCB
.LVL4842:
.L3719:
.LBE11822:
.LBE11821:
.LBE11820:
.LBE11819:
.LBE11825:
.LBE11826:
	.loc 52 147 0
	call	schedule
.LVL4843:
.LBB11827:
.LBB11828:
	.loc 22 69 0
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
.LBB11829:
.LBB11830:
	.loc 27 614 0
	movl	%ecx, %edx
	andl	$15, %edx
.LBE11830:
.LBE11829:
	.loc 22 69 0
	cmpl	$2, %edx
	je	.L3721
	cmpl	$7, %edx
	je	.L3722
	cmpl	$1, %edx
	je	.L3722
.LBB11831:
.LBB11832:
	.loc 22 87 0
	movl	$__func__.6108, 12(%esp)
	movl	$87, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$.LC109, (%esp)
	call	_fail
.LVL4844:
	.p2align 4,,7
	.p2align 3
.L3721:
.LBE11832:
.LBE11831:
.LBB11833:
.LBB11834:
.LBB11835:
.LBB11836:
	.loc 13 21 0
	movl	44(%eax), %edx
.LBE11836:
.LBE11835:
.LBE11834:
.LBB11839:
.LBB11840:
.LBB11841:
.LBB11842:
	.loc 27 626 0
	andl	$-16, %ecx
	.loc 27 627 0
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
.LBE11842:
.LBE11841:
.LBE11840:
.LBE11839:
.LBB11844:
.LBB11838:
.LBB11837:
	.loc 13 21 0
	movl	%edx, 56(%eax)
.LVL4845:
.LBE11837:
.LBE11838:
.LBE11844:
.LBB11845:
.LBB11843:
	.loc 22 428 0
	movl	%eax, (%esp)
.LVL4846:
	call	scheduleTCB
.LVL4847:
.L3722:
.LBE11843:
.LBE11845:
.LBE11833:
.LBE11828:
.LBE11827:
	.loc 52 151 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL4848:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL4849:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL4850:
.L3734:
	.cfi_restore_state
.LBB11846:
.LBB11815:
	.loc 27 2064 0
	movl	$__FUNCTION__.1990, 12(%esp)
	movl	$2064, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC216, (%esp)
	call	_assert_fail
.LVL4851:
.LBE11815:
.LBE11846:
	.cfi_endproc
.LFE260:
	.size	handleUserLevelFault, .-handleUserLevelFault
	.section	.rodata.str1.4
	.align 4
.LC217:
	.string	"idx == (PPTR_APIC & MASK(pageBitsForSize(IA32_4M))) >> pageBitsForSize(IA32_4K)"
	.section	.boot.text
	.p2align 4,,15
	.globl	map_kernel_window
	.type	map_kernel_window, @function
map_kernel_window:
.LFB347:
	.loc 4 587 0
	.cfi_startproc
.LVL4852:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %eax
	.loc 4 587 0
	movl	56(%esp), %edi
	movl	52(%esp), %esi
	movl	60(%esp), %ebp
.LVL4853:
	leal	3584(%eax), %ecx
	.loc 4 597 0
	xorl	%eax, %eax
	movl	%edi, %ebx
.LVL4854:
	.p2align 4,,7
	.p2align 3
.L3737:
.LBB11869:
.LBB11870:
	.loc 27 2699 0
	movl	%eax, %edx
.LBE11870:
.LBE11869:
	.loc 4 620 0
	addl	$4194304, %eax
.LVL4855:
.LBB11872:
.LBB11871:
	.loc 27 2699 0
	andl	$-4194304, %edx
.LVL4856:
	addl	$4, %ecx
	.loc 27 2743 0
	orl	$387, %edx
.LVL4857:
	movl	%edx, -4(%ecx)
.LVL4858:
.LBE11871:
.LBE11872:
	.loc 4 604 0
	cmpl	$532676608, %eax
	jne	.L3737
.LVL4859:
.LBB11873:
.LBB11874:
	.loc 10 41 0
	leal	536870912(%esi), %eax
.LVL4860:
.LBE11874:
.LBE11873:
.LBB11875:
.LBB11876:
	.loc 27 2569 0
	testl	$4095, %eax
	jne	.L3770
.LVL4861:
	.loc 27 2603 0
	movl	48(%esp), %ecx
.LBE11876:
.LBE11875:
	.loc 4 670 0
	subl	%edi, %ebp
.LVL4862:
.LBB11881:
.LBB11877:
	.loc 27 2571 0
	andl	$-4096, %eax
.LVL4863:
.LBE11877:
.LBE11881:
	.loc 4 670 0
	shrl	$12, %ebp
.LBB11882:
.LBB11878:
	.loc 27 2603 0
	orl	$7, %eax
.LBE11878:
.LBE11882:
	.loc 4 670 0
	testl	%ebp, %ebp
.LBB11883:
.LBB11879:
	.loc 27 2603 0
	movl	%eax, 4092(%ecx)
.LVL4864:
.LBE11879:
.LBE11883:
	.loc 4 665 0
	movl	$0, (%esi)
.LVL4865:
	.loc 4 670 0
	je	.L3771
.LVL4866:
.LBB11884:
.LBB11885:
	.loc 27 35 0
	andl	$4095, %edi
.LVL4867:
	jne	.L3741
	leal	1(%ebp), %edx
.LVL4868:
.LBE11885:
.LBE11884:
	.loc 4 666 0
	movl	$1, %edi
	jmp	.L3743
.LVL4869:
	.p2align 4,,7
	.p2align 3
.L3744:
.LBB11889:
.LBB11886:
	.loc 27 35 0
	testl	$4095, %ebx
	jne	.L3741
.LVL4870:
.L3743:
	.loc 27 37 0
	movl	%ebx, %eax
.LBE11886:
.LBE11889:
	.loc 4 685 0
	addl	$4096, %ebx
.LBB11890:
.LBB11887:
	.loc 27 37 0
	andl	$-4096, %eax
	.loc 27 77 0
	orl	$259, %eax
	movl	%eax, (%esi,%edi,4)
.LVL4871:
.LBE11887:
.LBE11890:
	.loc 4 686 0
	addl	$1, %edi
.LVL4872:
	.loc 4 670 0
	cmpl	%edx, %edi
	jne	.L3744
.LVL4873:
	.loc 4 691 0
	cmpl	$1007, %edi
	ja	.L3772
.LVL4874:
	.p2align 4,,7
	.p2align 3
.L3740:
	.loc 4 705 0
	movl	$0, (%esi,%edi,4)
.LVL4875:
	.loc 4 707 0
	addl	$1, %edi
.LVL4876:
	.loc 4 691 0
	cmpl	$1007, %edi
	jbe	.L3740
.LVL4877:
.L3772:
.LBB11891:
.LBB11892:
	.loc 8 95 0
	movl	$27, (%esp)
	call	ia32_rdmsr_low
.LVL4878:
	.loc 8 96 0
	testb	$8, %ah
	.loc 8 95 0
	movl	%eax, %ebx
.LVL4879:
	.loc 8 96 0
	je	.L3773
.LVL4880:
.LBE11892:
.LBE11891:
	.loc 4 714 0
	andl	$-4096, %ebx
	je	.L3754
.LVL4881:
.L3777:
.LBB11894:
.LBB11895:
	.loc 27 77 0
	orl	$283, %ebx
.LVL4882:
.LBE11895:
.LBE11894:
	.loc 4 731 0
	cmpl	$1008, %edi
	jne	.L3774
	leal	4036(%esi), %edi
.LVL4883:
	movl	$60, %edx
	testl	$1, %edi
	.loc 4 732 0
	movl	%ebx, 4032(%esi)
.LVL4884:
	jne	.L3775
.LVL4885:
.L3750:
	testl	$2, %edi
	jne	.L3776
.L3751:
	movl	%edx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %dl
	rep stosl
	je	.L3752
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
.L3752:
	andl	$1, %edx
	je	.L3753
	movb	$0, (%edi)
.L3753:
	.loc 4 828 0
	call	invalidatePageStructureCache
.LVL4886:
	.loc 4 830 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 4 829 0
	movl	$1, %eax
	.loc 4 830 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4887:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4888:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4889:
.L3754:
	.cfi_restore_state
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 4 715 0
	xorl	%eax, %eax
	.loc 4 830 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4890:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4891:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4892:
.L3773:
	.cfi_restore_state
.LBB11896:
.LBB11893:
	.loc 8 97 0
	movl	$.LC15, (%esp)
	call	printf
.LVL4893:
.LBE11893:
.LBE11896:
	.loc 4 714 0
	andl	$-4096, %ebx
.LVL4894:
	jne	.L3777
	jmp	.L3754
.LVL4895:
.L3771:
	.loc 4 666 0
	movl	$1, %edi
.LVL4896:
	jmp	.L3740
.LVL4897:
.L3776:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %edx
	jmp	.L3751
.LVL4898:
.L3775:
	movb	$0, 4036(%esi)
.LVL4899:
	leal	4037(%esi), %edi
	movb	$59, %dl
	jmp	.L3750
.LVL4900:
.L3774:
	.loc 4 731 0 discriminator 1
	movl	$__FUNCTION__.5057, 12(%esp)
	movl	$731, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC217, (%esp)
	call	_assert_fail
.LVL4901:
.L3741:
.LBB11897:
.LBB11888:
	call	pte_new.part.106
.LVL4902:
.L3770:
.LBE11888:
.LBE11897:
.LBB11898:
.LBB11880:
	call	pde_pde_4k_new.part.105
.LVL4903:
.LBE11880:
.LBE11898:
	.cfi_endproc
.LFE347:
	.size	map_kernel_window, .-map_kernel_window
	.text
	.p2align 4,,15
	.globl	handleDoubleFault
	.type	handleDoubleFault, @function
handleDoubleFault:
.LFB462:
	.loc 47 107 0
	.cfi_startproc
.LVL4904:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 47 109 0
	movl	current_fault, %edi
.LVL4905:
	.loc 47 107 0
	movl	72(%esp), %eax
	.loc 47 110 0
	movl	$.LC212, (%esp)
	.loc 47 107 0
	movl	64(%esp), %ebx
	movl	68(%esp), %esi
	.loc 47 109 0
	movl	current_fault+4, %ebp
	.loc 47 107 0
	movl	%eax, 28(%esp)
	.loc 47 110 0
	call	printf
.LVL4906:
.LBB11959:
.LBB11960:
.LBB11961:
.LBB11962:
	.loc 27 1928 0
	movl	%edi, %eax
	andl	$7, %eax
.LBE11962:
.LBE11961:
	.loc 47 73 0
	cmpl	$4, %eax
	ja	.L3779
	jmp	*.L3781(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L3781:
	.long	.L3780
	.long	.L3782
	.long	.L3783
	.long	.L3784
	.long	.L3785
	.text
	.p2align 4,,7
	.p2align 3
.L3784:
.LVL4907:
	.loc 47 89 0
	movl	%ebp, 4(%esp)
	movl	$.LC169, (%esp)
	call	printf
.LVL4908:
	.p2align 4,,7
	.p2align 3
.L3786:
.LBE11960:
.LBE11959:
	.loc 47 112 0
	movl	$.LC213, (%esp)
	call	printf
.LVL4909:
.LBB11971:
.LBB11972:
.LBB11973:
.LBB11974:
	.loc 27 1928 0
	movl	%esi, %eax
	andl	$7, %eax
.LBE11974:
.LBE11973:
	.loc 47 73 0
	cmpl	$4, %eax
	ja	.L3789
	jmp	*.L3791(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L3791:
	.long	.L3790
	.long	.L3792
	.long	.L3793
	.long	.L3794
	.long	.L3795
	.text
.LVL4910:
	.p2align 4,,7
	.p2align 3
.L3780:
.LBE11972:
.LBE11971:
.LBB11984:
.LBB11969:
	.loc 47 75 0
	movl	$.LC166, (%esp)
	call	printf
.LVL4911:
	jmp	.L3786
	.p2align 4,,7
	.p2align 3
.L3782:
.LVL4912:
	.loc 47 78 0
	testl	%edi, %edi
	movl	$.LC163, %edx
	movl	$.LC162, %eax
	cmovns	%edx, %eax
	movl	%ebp, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC167, (%esp)
	call	printf
.LVL4913:
	jmp	.L3786
.LVL4914:
	.p2align 4,,7
	.p2align 3
.L3785:
.LBB11963:
.LBB11964:
	.loc 27 2088 0
	movl	%edi, %edx
	shrl	$3, %edx
.LBE11964:
.LBE11963:
	.loc 47 93 0
	movl	%edx, 8(%esp)
	movl	%ebp, 4(%esp)
	movl	$.LC170, (%esp)
	call	printf
.LVL4915:
	jmp	.L3786
.LVL4916:
	.p2align 4,,7
	.p2align 3
.L3783:
.LBB11965:
.LBB11966:
	.loc 27 2020 0
	movl	%edi, %ecx
.LBE11966:
.LBE11965:
	.loc 47 83 0
	movl	$.LC165, %edx
.LBB11968:
.LBB11967:
	.loc 27 2020 0
	shrl	$27, %ecx
.LVL4917:
.LBE11967:
.LBE11968:
	.loc 47 83 0
	movl	$.LC164, %eax
	andl	$524288, %edi
.LVL4918:
	cmove	%edx, %eax
	movl	%ecx, 12(%esp)
	movl	%ebp, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC168, (%esp)
	call	printf
.LVL4919:
	jmp	.L3786
.LVL4920:
	.p2align 4,,7
	.p2align 3
.L3794:
.LBE11969:
.LBE11984:
.LBB11985:
.LBB11981:
	.loc 47 89 0
	movl	28(%esp), %eax
.LVL4921:
	movl	$.LC169, (%esp)
	movl	%eax, 4(%esp)
.LVL4922:
	call	printf
.LVL4923:
	.p2align 4,,7
	.p2align 3
.L3796:
.LBE11981:
.LBE11985:
	.loc 47 114 0
	movl	%ebx, 4(%esp)
	movl	$.LC214, (%esp)
	call	printf
.LVL4924:
	.loc 47 115 0
	movl	44(%ebx), %eax
	movl	$.LC215, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL4925:
.LBB11986:
.LBB11987:
.LBB11988:
	.loc 27 626 0
	andl	$-16, 592(%ebx)
.LVL4926:
.LBE11988:
.LBE11987:
.LBB11989:
.LBB11990:
	.loc 22 434 0
	cmpl	ksCurThread, %ebx
	je	.L3805
.L3778:
.LBE11990:
.LBE11989:
.LBE11986:
	.loc 47 119 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4927:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4928:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4929:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4930:
	ret
.LVL4931:
	.p2align 4,,7
	.p2align 3
.L3793:
	.cfi_restore_state
.LBB11997:
.LBB11982:
.LBB11975:
.LBB11976:
	.loc 27 2020 0
	movl	%esi, %edx
.LBE11976:
.LBE11975:
	.loc 47 83 0
	movl	$.LC165, %ecx
.LBB11978:
.LBB11977:
	.loc 27 2020 0
	shrl	$27, %edx
.LVL4932:
.LBE11977:
.LBE11978:
	.loc 47 83 0
	movl	$.LC164, %eax
	andl	$524288, %esi
.LVL4933:
	cmove	%ecx, %eax
	movl	28(%esp), %ecx
	movl	%edx, 12(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC168, (%esp)
	movl	%ecx, 8(%esp)
	call	printf
.LVL4934:
	jmp	.L3796
.LVL4935:
	.p2align 4,,7
	.p2align 3
.L3792:
	.loc 47 78 0
	movl	28(%esp), %ecx
.LVL4936:
	testl	%esi, %esi
	movl	$.LC163, %edx
	movl	$.LC162, %eax
	cmovns	%edx, %eax
	movl	%eax, 4(%esp)
	movl	%ecx, 8(%esp)
.LVL4937:
	movl	$.LC167, (%esp)
	call	printf
.LVL4938:
	jmp	.L3796
.LVL4939:
	.p2align 4,,7
	.p2align 3
.L3790:
	.loc 47 75 0
	movl	$.LC166, (%esp)
	call	printf
.LVL4940:
	jmp	.L3796
	.p2align 4,,7
	.p2align 3
.L3795:
.LVL4941:
	.loc 47 93 0
	movl	28(%esp), %eax
.LVL4942:
.LBB11979:
.LBB11980:
	.loc 27 2088 0
	shrl	$3, %esi
.LVL4943:
.LBE11980:
.LBE11979:
	.loc 47 93 0
	movl	%esi, 8(%esp)
	movl	$.LC170, (%esp)
	movl	%eax, 4(%esp)
.LVL4944:
	call	printf
.LVL4945:
	jmp	.L3796
.LVL4946:
	.p2align 4,,7
	.p2align 3
.L3805:
.LBE11982:
.LBE11997:
.LBB11998:
.LBB11995:
.LBB11993:
	.loc 22 434 0
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L3778
.LVL4947:
.LBE11993:
.LBE11995:
.LBE11998:
	.loc 47 119 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4948:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4949:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4950:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4951:
.LBB11999:
.LBB11996:
.LBB11994:
.LBB11991:
.LBB11992:
	.loc 22 437 0
	jmp	rescheduleRequired
.LVL4952:
	.p2align 4,,7
	.p2align 3
.L3779:
	.cfi_restore_state
.LBE11992:
.LBE11991:
.LBE11994:
.LBE11996:
.LBE11999:
.LBB12000:
.LBB11970:
	.loc 47 98 0
	movl	$.LC171, (%esp)
	call	printf
.LVL4953:
	jmp	.L3786
.LVL4954:
	.p2align 4,,7
	.p2align 3
.L3789:
.LBE11970:
.LBE12000:
.LBB12001:
.LBB11983:
	movl	$.LC171, (%esp)
	call	printf
.LVL4955:
	jmp	.L3796
.LBE11983:
.LBE12001:
	.cfi_endproc
.LFE462:
	.size	handleDoubleFault, .-handleDoubleFault
	.section	.rodata.str1.1
.LC218:
	.string	"ACPI: RSDP vaddr=0x%x\n"
.LC219:
	.string	"ACPI: RSDT paddr=0x%x\n"
.LC220:
	.string	"ACPI: RSDT vaddr=0x%x\n"
	.section	.rodata.str1.4
	.align 4
.LC221:
	.string	"acpi_rsdt_mapped->header.length > 0"
	.section	.rodata.str1.1
.LC222:
	.string	"ACPI: RSDT checksum failure\n"
	.section	.rodata.str1.4
	.align 4
.LC223:
	.string	"BIOS: No ACPI support detected\n"
	.section	.rodata.str1.1
.LC224:
	.string	"ACPI: RSDP paddr=0x%x\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	acpi_init
	.type	acpi_init, @function
acpi_init:
.LFB604:
	.loc 49 228 0
	.cfi_startproc
.LVL4956:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
.LBB12026:
.LBB12027:
	.loc 49 176 0
	movl	$917504, %ebx
.LBE12027:
.LBE12026:
	.loc 49 228 0
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	jmp	.L3807
.LVL4957:
	.p2align 4,,7
	.p2align 3
.L3809:
.LBB12033:
.LBB12032:
	.loc 49 176 0
	addl	$16, %ebx
.LVL4958:
	cmpl	$1048576, %ebx
	je	.L3808
.LVL4959:
.L3807:
.LBB12028:
.LBB12029:
	.loc 45 79 0
	cmpb	$82, (%ebx)
	jne	.L3809
.LVL4960:
	cmpb	$83, 1(%ebx)
	jne	.L3809
.LVL4961:
	cmpb	$68, 2(%ebx)
	jne	.L3809
.LVL4962:
	cmpb	$32, 3(%ebx)
	jne	.L3809
.LVL4963:
	cmpb	$80, 4(%ebx)
	jne	.L3809
.LVL4964:
	cmpb	$84, 5(%ebx)
	jne	.L3809
.LVL4965:
	cmpb	$82, 6(%ebx)
	jne	.L3809
.LVL4966:
	cmpb	$32, 7(%ebx)
	jne	.L3809
.LBE12029:
.LBE12028:
.LBB12030:
.LBB12031:
	.loc 49 164 0
	movl	(%ebx), %ecx
	movl	4(%ebx), %eax
	movl	12(%ebx), %esi
	movl	%ecx, %edx
	andl	$2139062143, %ecx
	xorl	%eax, %edx
	andl	$2139062143, %eax
	addl	%ecx, %eax
	movl	8(%ebx), %ecx
	andl	$-2139062144, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	andl	$2139062143, %edx
	xorl	%ecx, %eax
	andl	$2139062143, %ecx
	addl	%ecx, %edx
	andl	$-2139062144, %eax
	movl	16(%ebx), %ecx
	xorl	%edx, %eax
	movl	%eax, %edx
	andl	$2139062143, %eax
	xorl	%esi, %edx
	andl	$2139062143, %esi
	addl	%esi, %eax
	andl	$-2139062144, %edx
	xorl	%eax, %edx
	movl	%ecx, %eax
	movl	%edx, %esi
	andl	$2139062143, %eax
	xorl	%ecx, %edx
	andl	$2139062143, %esi
	andl	$-2139062144, %edx
	addl	%esi, %eax
	xorl	%edx, %eax
.LVL4967:
	movl	%eax, %edx
	movl	%eax, %ecx
	shrl	$16, %edx
	shrl	$24, %ecx
	addl	%ecx, %edx
	addl	%eax, %edx
	movzbl	%ah, %eax
.LBE12031:
.LBE12030:
	.loc 49 178 0
	addb	%al, %dl
	jne	.L3809
.LBE12032:
.LBE12033:
	.loc 49 237 0
	movl	%ebx, 4(%esp)
.LVL4968:
.LBB12034:
.LBB12035:
	.loc 49 195 0
	movl	%ebx, %esi
	.loc 49 196 0
	movl	$4194303, %ebp
.LBE12035:
.LBE12034:
	.loc 49 237 0
	movl	$.LC224, (%esp)
.LBB12042:
.LBB12039:
	.loc 49 195 0
	andl	$4194303, %esi
.LBB12036:
	.loc 49 206 0
	movl	$1025, %edi
.LBE12036:
.LBE12039:
.LBE12042:
	.loc 49 237 0
	call	printf
.LVL4969:
.LBB12043:
.LBB12040:
	.loc 49 196 0
	movl	%ebp, %eax
	subl	%esi, %eax
	.loc 49 192 0
	cmpl	$36, %eax
	sbbl	%eax, %eax
	notl	%eax
	addl	$2, %eax
.LVL4970:
	.loc 49 201 0
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	map_temp_boot_page
.LVL4971:
.LBB12037:
	.loc 49 206 0
	addl	20(%ebx), %esi
.LVL4972:
.LBE12037:
	.loc 49 221 0
	movl	%ebx, (%esp)
.LVL4973:
.LBB12038:
	.loc 49 206 0
	movl	%esi, %eax
	mull	%edi
	movl	%esi, %eax
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$21, %eax
	addl	$1, %eax
.LBE12038:
	.loc 49 221 0
	movl	%eax, 4(%esp)
	call	map_temp_boot_page
.LVL4974:
.LBE12040:
.LBE12043:
	.loc 49 239 0
	movl	$.LC218, (%esp)
.LBB12044:
.LBB12041:
	.loc 49 221 0
	movl	%eax, %ebx
.LVL4975:
.LBE12041:
.LBE12044:
	.loc 49 239 0
	movl	%eax, 4(%esp)
	call	printf
.LVL4976:
	.loc 49 241 0
	movl	16(%ebx), %esi
.LVL4977:
	.loc 49 242 0
	movl	$.LC219, (%esp)
.LBB12045:
.LBB12046:
	.loc 49 195 0
	movl	%esi, %ebx
.LVL4978:
	andl	$4194303, %ebx
	.loc 49 196 0
	subl	%ebx, %ebp
.LBE12046:
.LBE12045:
	.loc 49 242 0
	movl	%esi, 4(%esp)
	call	printf
.LVL4979:
.LBB12051:
.LBB12049:
	.loc 49 192 0
	cmpl	$36, %ebp
	sbbl	%eax, %eax
	notl	%eax
	addl	$2, %eax
.LVL4980:
	.loc 49 201 0
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	map_temp_boot_page
.LVL4981:
.LBB12047:
	.loc 49 211 0
	movl	4(%esi), %ecx
.LBE12047:
	.loc 49 221 0
	movl	%esi, (%esp)
.LVL4982:
.LBB12048:
	.loc 49 211 0
	addl	%ebx, %ecx
	movl	%ecx, %eax
	mull	%edi
	movl	%ecx, %eax
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$21, %eax
	addl	$1, %eax
.LBE12048:
	.loc 49 221 0
	movl	%eax, 4(%esp)
	call	map_temp_boot_page
.LVL4983:
.LBE12049:
.LBE12051:
	.loc 49 244 0
	movl	$.LC220, (%esp)
.LBB12052:
.LBB12050:
	.loc 49 221 0
	movl	%eax, %ebx
.LVL4984:
.LBE12050:
.LBE12052:
	.loc 49 244 0
	movl	%eax, 4(%esp)
	call	printf
.LVL4985:
	.loc 49 246 0
	movl	4(%ebx), %eax
	testl	%eax, %eax
	je	.L3844
	movl	%eax, %edi
	shrl	$2, %edi
	leal	0(,%edi,4), %ebp
.LVL4986:
	testl	%ebp, %ebp
	movl	%edi, 24(%esp)
	je	.L3825
	cmpl	$5, %eax
	jbe	.L3825
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	%eax, 28(%esp)
.L3821:
.LBB12053:
.LBB12054:
	.loc 49 164 0
	movl	(%ebx,%edx,4), %edi
	movl	%ecx, %eax
	xorl	(%ebx,%edx,4), %ecx
	andl	$2139062143, %eax
	addl	$1, %edx
	andl	$2139062143, %edi
	andl	$-2139062144, %ecx
	addl	%eax, %edi
	xorl	%ecx, %edi
.LVL4987:
	cmpl	24(%esp), %edx
	jae	.L3845
	movl	%edi, %ecx
	jmp	.L3821
	.p2align 4,,7
	.p2align 3
.L3825:
.LBE12054:
.LBE12053:
	.loc 49 246 0
	movl	%eax, %ecx
	xorl	%edx, %edx
.LVL4988:
.L3815:
.LBB12056:
.LBB12055:
	.loc 49 164 0
	addb	(%ebx), %dl
.LVL4989:
	.loc 49 163 0
	cmpl	$1, %ecx
	je	.L3819
	.loc 49 164 0
	addb	1(%ebx), %dl
.LVL4990:
	.loc 49 163 0
	cmpl	$2, %ecx
	je	.L3819
	.loc 49 164 0
	addb	2(%ebx), %dl
.LVL4991:
	.loc 49 163 0
	cmpl	$3, %ecx
	je	.L3819
	.loc 49 164 0
	addb	3(%ebx), %dl
.LVL4992:
	.loc 49 163 0
	cmpl	$4, %ecx
	je	.L3819
	.loc 49 164 0
	addb	4(%ebx), %dl
.LVL4993:
.L3819:
.LBE12055:
.LBE12056:
	.loc 49 247 0
	testb	%dl, %dl
	movl	%esi, %eax
	jne	.L3846
.L3834:
	.loc 49 253 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4994:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4995:
	.p2align 4,,7
	.p2align 3
.L3808:
	.cfi_restore_state
	.loc 49 234 0
	movl	$.LC223, (%esp)
	call	printf
.LVL4996:
	.loc 49 253 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 49 235 0
	xorl	%eax, %eax
	.loc 49 253 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4997:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4998:
.L3845:
	.cfi_restore_state
	movl	28(%esp), %eax
	movl	%edi, %ecx
	movl	%edi, %edx
	movzbl	%ch, %ecx
	addl	%ebp, %ebx
.LVL4999:
	addl	%edi, %ecx
	shrl	$16, %edx
	addl	%ecx, %edx
	movl	%eax, %ecx
	shrl	$24, %edi
	subl	%ebp, %ecx
	addl	%edi, %edx
	cmpl	%ebp, %eax
	jne	.L3815
	jmp	.L3819
.LVL5000:
.L3846:
	.loc 49 248 0
	movl	$.LC222, (%esp)
	call	printf
.LVL5001:
	.loc 49 249 0
	xorl	%eax, %eax
	jmp	.L3834
.LVL5002:
.L3844:
	.loc 49 246 0 discriminator 1
	movl	$__FUNCTION__.7489, 12(%esp)
	movl	$246, 8(%esp)
	movl	$.LC178, 4(%esp)
	movl	$.LC221, (%esp)
	call	_assert_fail
.LVL5003:
	.cfi_endproc
.LFE604:
	.size	acpi_init, .-acpi_init
	.section	.rodata.str1.4
	.align 4
.LC225:
	.string	"Debug halt syscall from user thread 0x%x\n"
	.align 4
.LC226:
	.string	"Debug snapshot syscall from user thread 0x%x\n"
	.text
	.p2align 4,,15
	.globl	handleUnknownSyscall
	.type	handleUnknownSyscall, @function
handleUnknownSyscall:
.LFB259:
	.loc 52 52 0
	.cfi_startproc
.LVL5004:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 52 52 0
	movl	8(%ebp), %eax
	.loc 52 54 0
	cmpl	$-8, %eax
	je	.L3873
	.loc 52 58 0
	cmpl	$-9, %eax
	je	.L3874
	.loc 52 62 0
	cmpl	$-11, %eax
	je	.L3875
	.loc 52 67 0
	cmpl	$-10, %eax
	.p2align 4,,2
	je	.L3876
.LVL5005:
	.loc 52 133 0
	movl	ksCurThread, %ebx
.LVL5006:
	.loc 52 132 0
	movl	%eax, current_fault+4
.LBB12115:
.LBB12116:
	.loc 47 22 0
	movl	current_fault+4, %edx
.LVL5007:
.LBE12116:
.LBE12115:
	.loc 52 132 0
	movl	$3, current_fault
.LBB12125:
.LBB12123:
	.loc 47 22 0
	movl	current_fault, %eax
.LVL5008:
	.loc 47 24 0
	movl	%ebx, (%esp)
	.loc 47 22 0
	movl	%edx, -44(%ebp)
	movl	%eax, -48(%ebp)
.LVL5009:
	.loc 47 24 0
	call	sendFaultIPC
.LVL5010:
	.loc 47 25 0
	testl	%eax, %eax
	jne	.L3877
.LVL5011:
.L3856:
.LBE12123:
.LBE12125:
	.loc 52 135 0
	call	schedule
.LVL5012:
.LBB12126:
.LBB12127:
	.loc 22 69 0
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
.LBB12128:
.LBB12129:
	.loc 27 614 0
	movl	%ecx, %edx
	andl	$15, %edx
.LBE12129:
.LBE12128:
	.loc 22 69 0
	cmpl	$2, %edx
	je	.L3858
	cmpl	$7, %edx
	je	.L3849
	cmpl	$1, %edx
	je	.L3849
.LBB12130:
.LBB12131:
	.loc 22 87 0
	movl	$__func__.6108, 12(%esp)
	movl	$87, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$.LC109, (%esp)
	call	_fail
.LVL5013:
	.p2align 4,,7
	.p2align 3
.L3877:
.LBE12131:
.LBE12130:
.LBE12127:
.LBE12126:
.LBB12146:
.LBB12124:
.LBB12117:
.LBB12118:
	.loc 47 109 0
	movl	current_fault+4, %edx
	movl	current_fault, %eax
.LVL5014:
	.loc 47 110 0
	movl	$.LC212, (%esp)
	.loc 47 109 0
	movl	%edx, %edi
	movl	%eax, %esi
.LVL5015:
	.loc 47 110 0
	call	printf
.LVL5016:
	.loc 47 111 0
	movl	%edi, %edx
	movl	%esi, %eax
.LVL5017:
	call	print_fault
.LVL5018:
	.loc 47 112 0
	movl	$.LC213, (%esp)
	call	printf
.LVL5019:
	.loc 47 113 0
	movl	-44(%ebp), %edx
	movl	-48(%ebp), %eax
	call	print_fault
.LVL5020:
	.loc 47 114 0
	movl	%ebx, 4(%esp)
	movl	$.LC214, (%esp)
	call	printf
.LVL5021:
	.loc 47 115 0
	movl	44(%ebx), %eax
	movl	$.LC215, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL5022:
.LBB12119:
.LBB12120:
.LBB12121:
.LBB12122:
	.loc 27 626 0
	andl	$-16, 592(%ebx)
.LBE12122:
.LBE12121:
	.loc 22 428 0
	movl	%ebx, (%esp)
	call	scheduleTCB
.LVL5023:
	jmp	.L3856
.LVL5024:
.L3859:
.LBE12120:
.LBE12119:
.LBE12118:
.LBE12117:
.LBE12124:
.LBE12146:
.LBB12147:
.LBB12148:
.LBB12149:
.LBB12150:
	.loc 42 48 0
	xorl	%eax, %eax
.LVL5025:
.LBE12150:
.LBE12149:
.LBB12159:
.LBB12160:
	.loc 27 873 0
	andl	$15, %eax
.LVL5026:
	movl	%eax, %edx
.LVL5027:
	.p2align 4,,7
	.p2align 3
.L3855:
.LBE12160:
.LBE12159:
.LBB12162:
.LBB12163:
	.loc 13 21 0
	movl	ksCurThread, %eax
	movl	%edx, 4(%eax)
.LVL5028:
.L3849:
.LBE12163:
.LBE12162:
.LBE12148:
.LBE12147:
	.loc 52 139 0
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
.LVL5029:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.p2align 4,,7
	.p2align 3
.L3876:
	.cfi_restore_state
.LVL5030:
.LBB12170:
.LBB12169:
	.loc 52 68 0
	movl	ksCurThread, %eax
.LVL5031:
.LBB12164:
.LBB12157:
.LBB12151:
.LBB12152:
	.loc 42 65 0
	leal	-36(%ebp), %ecx
.LBE12152:
.LBE12151:
.LBE12157:
.LBE12164:
.LBB12165:
.LBB12166:
	.loc 13 27 0
	movl	4(%eax), %ebx
.LVL5032:
.LBE12166:
.LBE12165:
.LBB12167:
.LBB12158:
.LBB12155:
.LBB12153:
	.loc 42 64 0
	andl	$-1024, %eax
.LVL5033:
	movl	4(%eax), %edx
.LVL5034:
	movl	(%eax), %eax
	.loc 42 65 0
	movl	$32, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
.LVL5035:
	movl	%ecx, (%esp)
	call	resolveAddressBits
.LVL5036:
.LBE12153:
.LBE12155:
	.loc 42 44 0
	movl	-36(%ebp), %edx
.LBB12156:
.LBB12154:
	.loc 42 68 0
	movl	-32(%ebp), %eax
.LVL5037:
	.loc 42 65 0
	subl	$4, %esp
.LBE12154:
.LBE12156:
	.loc 42 44 0
	testl	%edx, %edx
	jne	.L3859
.LVL5038:
	.loc 42 53 0
	movl	(%eax), %eax
.LVL5039:
.LBE12158:
.LBE12167:
.LBB12168:
.LBB12161:
	.loc 27 872 0
	movl	%eax, %ecx
	.loc 27 874 0
	movzbl	%al, %edx
	.loc 27 872 0
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L3855
	.loc 27 873 0
	andl	$15, %eax
.LVL5040:
	movl	%eax, %edx
	jmp	.L3855
.LVL5041:
	.p2align 4,,7
	.p2align 3
.L3858:
.LBE12161:
.LBE12168:
.LBE12169:
.LBE12170:
.LBB12171:
.LBB12145:
.LBB12132:
.LBB12133:
.LBB12134:
.LBB12135:
	.loc 13 21 0
	movl	44(%eax), %edx
.LBE12135:
.LBE12134:
.LBE12133:
.LBB12138:
.LBB12139:
.LBB12140:
.LBB12141:
	.loc 27 626 0
	andl	$-16, %ecx
	.loc 27 627 0
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
.LBE12141:
.LBE12140:
.LBE12139:
.LBE12138:
.LBB12143:
.LBB12137:
.LBB12136:
	.loc 13 21 0
	movl	%edx, 56(%eax)
.LVL5042:
.LBE12136:
.LBE12137:
.LBE12143:
.LBB12144:
.LBB12142:
	.loc 22 428 0
	movl	%eax, (%esp)
.LVL5043:
	call	scheduleTCB
.LVL5044:
.LBE12142:
.LBE12144:
.LBE12132:
.LBE12145:
.LBE12171:
	.loc 52 139 0
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL5045:
	popl	%esi
	.cfi_restore 6
.LVL5046:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL5047:
	.p2align 4,,7
	.p2align 3
.L3873:
	.cfi_restore_state
	.loc 52 55 0
	movl	ksCurThread, %eax
	movsbl	4(%eax), %eax
	movl	%eax, (%esp)
	call	console_putchar
.LVL5048:
	.loc 52 56 0
	jmp	.L3849
.LVL5049:
	.p2align 4,,7
	.p2align 3
.L3875:
	.loc 52 63 0
	movl	ksCurThread, %eax
	movl	$.LC226, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL5050:
	.loc 52 64 0
	call	capDL
.LVL5051:
	.loc 52 65 0
	jmp	.L3849
.L3874:
	.loc 52 59 0
	movl	ksCurThread, %eax
	movl	$.LC225, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL5052:
	.loc 52 60 0
	call	halt
.LVL5053:
	.cfi_endproc
.LFE259:
	.size	handleUnknownSyscall, .-handleUnknownSyscall
	.p2align 4,,15
	.globl	c_handle_interrupt
	.type	c_handle_interrupt, @function
c_handle_interrupt:
.LFB274:
	.loc 7 118 0
	.cfi_startproc
.LVL5054:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 7 119 0
	cmpl	$7, %ecx
	je	.L3888
	.loc 7 121 0
	cmpl	$14, %ecx
	je	.L3889
	.loc 7 124 0
	cmpl	$31, %ecx
	jle	.L3890
	.loc 7 126 0
	cmpl	$63, %ecx
	.p2align 4,,2
	jg	.L3883
	.loc 7 127 0
	movl	%ecx, ia32KScurInterrupt
	.loc 7 128 0
	call	handleInterruptEntry
.LVL5055:
.L3880:
	.loc 7 141 0
	call	restore_user_context
.LVL5056:
.L3890:
	.loc 7 125 0
	movl	ksCurThread, %eax
	movl	52(%eax), %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	call	handleUserLevelFault
.LVL5057:
	jmp	.L3880
.LVL5058:
.L3888:
	.loc 7 120 0
	call	handleUnimplementedDevice
.LVL5059:
	.p2align 4,,8
	jmp	.L3880
.LVL5060:
.L3889:
	.loc 7 123 0
	movl	ksCurThread, %eax
	movl	52(%eax), %eax
	shrl	$4, %eax
	andl	$1, %eax
	movl	%eax, (%esp)
	call	handleVMFaultEvent
.LVL5061:
	jmp	.L3880
.LVL5062:
.L3883:
	.loc 7 129 0
	cmpl	$255, %ecx
	je	.L3880
.LBB12172:
	.loc 7 136 0
	movl	ksCurThread, %eax
	.loc 7 138 0
	sall	$24, %ecx
.LVL5063:
	andl	$16777215, %edx
.LVL5064:
	orl	%edx, %ecx
	.loc 7 136 0
	subl	$2, 44(%eax)
	.loc 7 139 0
	movl	%ecx, (%esp)
	call	handleUnknownSyscall
.LVL5065:
	jmp	.L3880
.LBE12172:
	.cfi_endproc
.LFE274:
	.size	c_handle_interrupt, .-c_handle_interrupt
	.section	.rodata.str1.4
	.align 4
.LC227:
	.string	"acpi_rsdt_mapped->header.length >= sizeof(acpi_header_t)"
	.section	.rodata.str1.1
.LC228:
	.string	"ACPI: MADT paddr=0x%x\n"
.LC229:
	.string	"ACPI: MADT vaddr=0x%x\n"
.LC230:
	.string	"ACPI: MADT apic_addr=0x%x\n"
.LC231:
	.string	"ACPI: MADT flags=0x%x\n"
.LC232:
	.string	"ACPI: MADT_APIC apic_id=0x%x\n"
	.section	.rodata.str1.4
	.align 4
.LC233:
	.string	"ACPI: MADT_IOAPIC ioapic_id=%d ioapic_addr=0x%x gsib=%d\n"
	.align 4
.LC234:
	.string	"ACPI: Not recording this IOAPIC, only support %d\n"
	.align 4
.LC235:
	.string	"ACIP: MADT_ISO bus=%d source=%d gsi=%d flags=0x%x\n"
	.section	.rodata.str1.1
.LC236:
	.string	"ACPI: %d CPU(s) detected\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	acpi_madt_scan
	.type	acpi_madt_scan, @function
acpi_madt_scan:
.LFB605:
	.loc 49 263 0
	.cfi_startproc
.LVL5066:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
.LBB12192:
.LBB12193:
	.loc 49 196 0
	movl	$4194303, %edx
.LBE12193:
.LBE12192:
	.loc 49 263 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 49 263 0
	movl	80(%esp), %ebx
.LVL5067:
	movl	92(%esp), %edi
.LBB12198:
.LBB12196:
	.loc 49 195 0
	movl	%ebx, %esi
	andl	$4194303, %esi
.LVL5068:
	.loc 49 196 0
	subl	%esi, %edx
	.loc 49 192 0
	cmpl	$36, %edx
	sbbl	%eax, %eax
	notl	%eax
	addl	$2, %eax
.LVL5069:
	.loc 49 201 0
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	map_temp_boot_page
.LVL5070:
.LBB12194:
	.loc 49 211 0
	movl	$1025, %edx
	addl	4(%ebx), %esi
.LVL5071:
.LBE12194:
	.loc 49 221 0
	movl	%ebx, (%esp)
.LVL5072:
.LBB12195:
	.loc 49 211 0
	movl	%esi, %eax
	mull	%edx
	movl	%esi, %eax
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$21, %eax
	addl	$1, %eax
.LBE12195:
	.loc 49 221 0
	movl	%eax, 4(%esp)
	call	map_temp_boot_page
.LVL5073:
.LBE12196:
.LBE12198:
	.loc 49 275 0
	movl	$0, (%edi)
.LBB12199:
.LBB12197:
	.loc 49 221 0
	movl	%eax, 36(%esp)
.LVL5074:
.LBE12197:
.LBE12199:
	.loc 49 277 0
	movl	4(%eax), %eax
.LVL5075:
	cmpl	$35, %eax
	jbe	.L3909
	.loc 49 278 0
	subl	$36, %eax
	movl	%eax, 32(%esp)
	shrl	$2, 32(%esp)
.LVL5076:
	.loc 49 279 0
	movl	32(%esp), %eax
	testl	%eax, %eax
	je	.L3906
	xorl	%esi, %esi
	.loc 49 274 0
	movl	$0, 40(%esp)
.LVL5077:
	.p2align 4,,7
	.p2align 3
.L3904:
	.loc 49 280 0
	movl	36(%esp), %eax
	movl	36(%eax,%esi,4), %ebx
.LVL5078:
.LBB12200:
.LBB12201:
	.loc 49 196 0
	movl	$4194303, %eax
.LVL5079:
	.loc 49 195 0
	movl	%ebx, %ebp
	andl	$4194303, %ebp
.LVL5080:
	.loc 49 196 0
	subl	%ebp, %eax
.LVL5081:
	.loc 49 192 0
	cmpl	$36, %eax
	sbbl	%eax, %eax
	notl	%eax
	addl	$2, %eax
.LVL5082:
	.loc 49 201 0
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	map_temp_boot_page
.LVL5083:
.LBB12202:
	.loc 49 211 0
	movl	4(%ebx), %ecx
	movl	$1025, %eax
.LBE12202:
	.loc 49 221 0
	movl	%ebx, (%esp)
.LVL5084:
.LBB12203:
	.loc 49 211 0
	addl	%ebp, %ecx
	mull	%ecx
	subl	%edx, %ecx
	shrl	%ecx
	addl	%edx, %ecx
	shrl	$21, %ecx
	addl	$1, %ecx
.LBE12203:
	.loc 49 221 0
	movl	%ecx, 4(%esp)
	call	map_temp_boot_page
.LVL5085:
.LBE12201:
.LBE12200:
.LBB12205:
.LBB12206:
	.loc 45 79 0
	cmpb	$65, (%eax)
.LBE12206:
.LBE12205:
.LBB12208:
.LBB12204:
	.loc 49 221 0
	movl	%eax, %ebp
.LVL5086:
.LBE12204:
.LBE12208:
.LBB12209:
.LBB12207:
	.loc 45 79 0
	jne	.L3896
.LVL5087:
	cmpb	$80, 1(%eax)
	jne	.L3896
.LVL5088:
	cmpb	$73, 2(%eax)
	jne	.L3896
.LVL5089:
	cmpb	$67, 3(%eax)
	jne	.L3896
.LBE12207:
.LBE12209:
	.loc 49 284 0
	movl	%ebx, 4(%esp)
.LVL5090:
	.loc 49 289 0
	leal	44(%ebp), %ebx
.LVL5091:
	.loc 49 284 0
	movl	$.LC228, (%esp)
	call	printf
.LVL5092:
	.loc 49 285 0
	movl	%ebp, 4(%esp)
	movl	$.LC229, (%esp)
	call	printf
.LVL5093:
	.loc 49 286 0
	movl	36(%ebp), %eax
	movl	$.LC230, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL5094:
	.loc 49 287 0
	movl	40(%ebp), %eax
	movl	$.LC231, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL5095:
	.loc 49 291 0
	movl	4(%ebp), %ecx
	leal	0(%ebp,%ecx), %eax
	cmpl	%eax, %ebx
	jb	.L3903
	jmp	.L3896
	.p2align 4,,7
	.p2align 3
.L3910:
	.loc 49 292 0
	jb	.L3899
	cmpb	$2, %al
	.p2align 4,,9
	jne	.L3897
	.loc 49 321 0
	movzwl	8(%ebx), %eax
	movl	%eax, 16(%esp)
	movl	4(%ebx), %eax
	movl	%eax, 12(%esp)
	movzbl	3(%ebx), %eax
	movl	%eax, 8(%esp)
	movzbl	2(%ebx), %eax
	movl	$.LC235, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL5096:
	movl	4(%ebp), %ecx
.L3897:
	.loc 49 330 0
	movzbl	1(%ebx), %eax
	addl	%eax, %ebx
.LVL5097:
	.loc 49 291 0
	leal	0(%ebp,%ecx), %eax
	cmpl	%eax, %ebx
	jae	.L3896
.L3903:
	.loc 49 292 0
	movzbl	(%ebx), %eax
	cmpb	$1, %al
	jne	.L3910
	.loc 49 307 0
	movl	8(%ebx), %eax
	movl	%eax, 12(%esp)
	movl	4(%ebx), %eax
	movl	%eax, 8(%esp)
	movzbl	2(%ebx), %eax
	movl	$.LC233, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL5098:
	.loc 49 313 0
	movl	(%edi), %eax
	cmpl	$1, %eax
	je	.L3911
	.loc 49 316 0
	movl	4(%ebx), %edx
	movl	96(%esp), %ecx
	movl	%edx, (%ecx,%eax,4)
	.loc 49 317 0
	addl	$1, (%edi)
	.loc 49 330 0
	movzbl	1(%ebx), %eax
	movl	4(%ebp), %ecx
	addl	%eax, %ebx
.LVL5099:
	.loc 49 291 0
	leal	0(%ebp,%ecx), %eax
	cmpl	%eax, %ebx
	jb	.L3903
.LVL5100:
	.p2align 4,,7
	.p2align 3
.L3896:
	.loc 49 279 0
	addl	$1, %esi
.LVL5101:
	cmpl	32(%esp), %esi
	jne	.L3904
.LVL5102:
.L3894:
	.loc 49 335 0
	movl	40(%esp), %edi
	movl	$.LC236, (%esp)
	movl	%edi, 4(%esp)
	call	printf
.LVL5103:
	.loc 49 338 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%edi, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5104:
	.p2align 4,,7
	.p2align 3
.L3899:
	.cfi_restore_state
.LBB12210:
	.loc 49 297 0
	cmpl	$1, 4(%ebx)
	.loc 49 295 0
	movzbl	3(%ebx), %eax
.LVL5105:
	.loc 49 297 0
	jne	.L3897
	.loc 49 298 0
	movzbl	%al, %edx
	movl	%edx, 4(%esp)
.LVL5106:
	movl	$.LC232, (%esp)
	movl	%edx, 44(%esp)
	call	printf
.LVL5107:
	.loc 49 299 0
	movl	40(%esp), %eax
	cmpl	%eax, 88(%esp)
	movl	44(%esp), %edx
	jbe	.L3901
	movl	%eax, %ecx
	.loc 49 300 0
	movl	84(%esp), %eax
	movl	%edx, (%eax,%ecx,4)
.L3901:
	.loc 49 302 0
	addl	$1, 40(%esp)
.LVL5108:
	movl	4(%ebp), %ecx
	jmp	.L3897
.LVL5109:
	.p2align 4,,7
	.p2align 3
.L3911:
.LBE12210:
	.loc 49 314 0
	movl	$1, 4(%esp)
	movl	$.LC234, (%esp)
	call	printf
.LVL5110:
	movl	4(%ebp), %ecx
	jmp	.L3897
.LVL5111:
.L3906:
	.loc 49 274 0
	movl	$0, 40(%esp)
	jmp	.L3894
.LVL5112:
.L3909:
	.loc 49 277 0 discriminator 1
	movl	$__FUNCTION__.7504, 12(%esp)
	movl	$277, 8(%esp)
	movl	$.LC178, 4(%esp)
	movl	$.LC227, (%esp)
	call	_assert_fail
.LVL5113:
	.cfi_endproc
.LFE605:
	.size	acpi_madt_scan, .-acpi_madt_scan
	.section	.rodata.str1.4
	.align 4
.LC237:
	.string	"(capPDBasePtr & ~0xfffff000) == 0"
	.align 4
.LC238:
	.string	"(capPTBasePtr & ~0xfffff000) == 0"
	.section	.boot.text
	.p2align 4,,15
	.globl	init_node_state
	.type	init_node_state, @function
init_node_state:
.LFB313:
	.loc 46 255 0
	.cfi_startproc
.LVL5114:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	28(%ebp), %ecx
	movl	36(%ebp), %eax
	movl	32(%ebp), %esi
	.loc 46 293 0
	movl	$0, ndks_boot+8
	movl	%ecx, -64(%ebp)
.LVL5115:
.LBB12291:
.LBB12292:
	.loc 10 48 0
	subl	$536870912, %ecx
.LVL5116:
	movl	%eax, -60(%ebp)
.LVL5117:
.LBE12292:
.LBE12291:
.LBB12294:
.LBB12295:
	movl	8(%ebp), %eax
.LVL5118:
.LBE12295:
.LBE12294:
.LBB12298:
.LBB12293:
	movl	%ecx, -76(%ebp)
	leal	-536870912(%esi), %ecx
	movl	%ecx, -80(%ebp)
.LBE12293:
.LBE12298:
.LBB12299:
.LBB12300:
	movl	20(%ebp), %ecx
.LBE12300:
.LBE12299:
	.loc 46 293 0
	movl	$0, ndks_boot+12
.LBB12304:
.LBB12296:
	.loc 10 48 0
	leal	-536870912(%eax), %edx
	movl	12(%ebp), %eax
.LBE12296:
.LBE12304:
	.loc 46 291 0
	movl	%edx, ndks_boot
.LBB12305:
.LBB12301:
	.loc 10 48 0
	leal	-536870912(%ecx), %edi
	movl	16(%ebp), %ecx
	movl	%edi, -68(%ebp)
.LBE12301:
.LBE12305:
.LBB12306:
.LBB12297:
	subl	$536870912, %eax
.LVL5119:
.LBE12297:
.LBE12306:
	.loc 46 291 0
	movl	%eax, ndks_boot+4
	.loc 46 297 0
	movl	64(%ebp), %eax
.LVL5120:
.LBB12307:
.LBB12302:
	.loc 10 48 0
	leal	-536870912(%ecx), %edi
.LBE12302:
.LBE12307:
.LBB12308:
.LBB12309:
	movl	48(%ebp), %ecx
.LVL5121:
.LBE12309:
.LBE12308:
.LBB12312:
.LBB12303:
	movl	%edi, -84(%ebp)
.LVL5122:
.LBE12303:
.LBE12312:
	.loc 46 297 0
	movl	%eax, 4(%esp)
	movl	60(%ebp), %eax
.LBB12313:
.LBB12310:
	.loc 10 48 0
	leal	-536870912(%ecx), %edi
	movl	44(%ebp), %ecx
.LVL5123:
	movl	%edi, -72(%ebp)
.LBE12310:
.LBE12313:
	.loc 46 297 0
	movl	%eax, (%esp)
.LBB12314:
.LBB12311:
	.loc 10 48 0
	leal	-536870912(%ecx), %edi
	movl	%edi, -88(%ebp)
.LVL5124:
.LBE12311:
.LBE12314:
	.loc 46 297 0
	call	init_vm_state
.LVL5125:
	testl	%eax, %eax
	jne	.L3913
.LVL5126:
.L3963:
	.loc 46 456 0
	xorl	%eax, %eax
.L4014:
	.loc 46 482 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
.LVL5127:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL5128:
	.p2align 4,,7
	.p2align 3
.L3913:
	.cfi_restore_state
	.loc 46 339 0
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	create_root_cnode
.LVL5129:
	movl	-44(%ebp), %edx
.LVL5130:
	movl	-48(%ebp), %eax
	movl	%edx, -52(%ebp)
.LVL5131:
	movl	%eax, -56(%ebp)
.LVL5132:
	subl	$4, %esp
	.loc 46 343 0
	call	cap_get_capPtr
.LVL5133:
	.loc 46 342 0
	movl	$11, 4(%esp)
	movl	$65535, 8(%esp)
	addl	$112, %eax
	movl	%eax, (%esp)
	call	write_slot
.LVL5134:
	.loc 46 351 0
	movl	-56(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
.LVL5135:
	call	create_domain_cap
.LVL5136:
.LBB12315:
.LBB12316:
	.loc 21 172 0
	movl	$12, (%esp)
	call	alloc_region
.LVL5137:
	.loc 21 173 0
	testl	%eax, %eax
	.loc 21 172 0
	movl	%eax, %ebx
.LVL5138:
	.loc 21 173 0
	je	.L4021
	.loc 21 177 0
	call	memzero.constprop.274
.LVL5139:
	movl	52(%ebp), %eax
	.loc 21 178 0
	movl	$1, %edi
	movl	%ebx, intStateIRQNode
.LVL5140:
	xorl	%ebx, %ebx
.LVL5141:
	testl	%eax, %eax
	jne	.L3917
.LBE12316:
.LBE12315:
.LBB12318:
.LBB12319:
.LBB12320:
.LBB12321:
.LBB12322:
.LBB12323:
.LBB12324:
.LBB12325:
	.loc 24 55 0
	movl	%esi, -108(%ebp)
	movl	%edi, %esi
.LVL5142:
	.p2align 4,,7
	.p2align 3
.L3931:
.LBE12325:
.LBE12324:
.LBE12323:
.LBE12322:
.LBE12321:
.LBE12320:
	.loc 46 42 0
	cmpl	$31, %ebx
	je	.L4018
	.loc 46 44 0
	cmpl	$30, %ebx
	je	.L3919
	.loc 46 47 0
	cmpl	$2, %ebx
	je	.L3922
	.loc 46 51 0
	cmpl	$15, %ebx
	.p2align 4,,2
	ja	.L4022
.LVL5143:
.LBB12340:
.LBB12338:
.LBB12335:
.LBB12332:
.LBB12329:
.LBB12326:
	.loc 24 54 0
	cmpl	$7, %ebx
.LBE12326:
.LBE12329:
.LBE12332:
.LBE12335:
	.loc 29 263 0
	movl	$0, intStateIRQTable(,%ebx,4)
.LVL5144:
.LBB12336:
.LBB12333:
.LBB12330:
.LBB12327:
	.loc 24 54 0
	jg	.L4023
	.loc 24 55 0
	movl	$1, %eax
	movl	%ebx, %ecx
	sall	%cl, %eax
	movl	$33, %edi
	movl	%eax, -104(%ebp)
.LVL5145:
.L3929:
	.loc 24 64 0
	movl	%edi, (%esp)
	call	in8
.LVL5146:
	movl	%edi, (%esp)
	orb	-104(%ebp), %al
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
.LVL5147:
	.p2align 4,,7
	.p2align 3
.L3926:
.LBE12327:
.LBE12330:
.LBE12333:
.LBE12336:
.LBE12338:
.LBE12340:
	.loc 46 41 0
	cmpl	$31, %esi
	jg	.L4024
.LVL5148:
.L3921:
	addl	$1, %ebx
	addl	$1, %esi
	jmp	.L3931
.LVL5149:
.L4025:
.LBB12341:
.LBB12342:
	.loc 29 264 0
	movl	$30, %eax
	.loc 29 263 0
	movl	$3, intStateIRQTable+120
	.loc 29 264 0
	call	maskInterrupt.constprop.256
.LVL5150:
	.p2align 4,,7
	.p2align 3
.L3938:
	addl	$1, %ebx
	addl	$1, %edi
.L3917:
.LVL5151:
.LBE12342:
.LBE12341:
	.loc 46 42 0
	cmpl	$31, %ebx
	je	.L3918
	.loc 46 44 0
	cmpl	$30, %ebx
	je	.L4025
	.loc 46 47 0
	cmpl	$2, %ebx
	je	.L4026
	.loc 46 56 0
	cmpl	$16, %ebx
	sbbl	%eax, %eax
	andl	$3, %eax
	.loc 46 41 0
	cmpl	$31, %edi
	.loc 46 56 0
	movl	%eax, intStateIRQTable(,%ebx,4)
.LVL5152:
	.loc 46 41 0
	jle	.L3938
.LVL5153:
.L3925:
	.loc 46 66 0
	movl	-52(%ebp), %edx
	movl	-56(%ebp), %eax
	call	cap_get_capPtr
.LVL5154:
	movl	$14, 4(%esp)
	movl	$0, 8(%esp)
	addl	$64, %eax
	movl	%eax, (%esp)
	call	write_slot
.LVL5155:
.LBE12319:
.LBE12318:
.LBB12356:
.LBB12357:
	.loc 21 252 0
	movl	$12, (%esp)
	call	alloc_region
.LVL5156:
	.loc 21 253 0
	testl	%eax, %eax
	.loc 21 252 0
	movl	%eax, %ebx
.LVL5157:
	.loc 21 253 0
	je	.L4027
.LVL5158:
.LBB12358:
.LBB12359:
.LBB12360:
	.loc 45 26 0
	testb	$3, %al
	jne	.L4028
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %edx
	jne	.L4029
.LVL5159:
.L3941:
	testl	$2, %edi
	jne	.L4030
.LVL5160:
.L3942:
	movl	%edx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %dl
	rep stosl
	jne	.L4031
.L3943:
	andl	$1, %edx
	jne	.L4032
.L3944:
.LBE12360:
.LBE12359:
.LBE12358:
	.loc 21 263 0
	movl	52(%ebp), %eax
	.loc 21 260 0
	movl	%ebx, ndks_boot+16
	.loc 21 261 0
	movl	$12, ndks_boot+20
.LBE12357:
.LBE12356:
	.loc 46 281 0
	subl	-60(%ebp), %esi
.LBB12368:
.LBB12364:
	.loc 21 263 0
	movl	%eax, (%ebx)
	.loc 21 264 0
	movl	56(%ebp), %eax
	.loc 21 265 0
	movl	$0, 8(%ebx)
	.loc 21 266 0
	movl	%esi, 12(%ebx)
	.loc 21 267 0
	movb	$16, 891(%ebx)
	.loc 21 264 0
	movl	%eax, 4(%ebx)
	.loc 21 268 0
	movl	ksDomScheduleIdx, %eax
.LBE12364:
.LBE12368:
	.loc 46 281 0
	movl	%esi, -112(%ebp)
.LBB12369:
.LBB12365:
	.loc 21 268 0
	movl	ksDomSchedule(,%eax,8), %eax
	movb	%al, 4080(%ebx)
.LVL5161:
.LBE12365:
.LBE12369:
.LBB12370:
.LBB12371:
	.loc 46 141 0
	movl	$12, (%esp)
	call	alloc_region
.LVL5162:
	.loc 46 142 0
	testl	%eax, %eax
	.loc 46 141 0
	movl	%eax, %esi
.LVL5163:
	.loc 46 142 0
	je	.L3963
	.loc 46 145 0
	call	memzero.constprop.274
.LVL5164:
	movl	ia32KSkernelPD, %eax
	leal	3584(%esi), %edx
	leal	4096(%esi), %ecx
	subl	%esi, %eax
.LVL5165:
	.p2align 4,,7
	.p2align 3
.L3947:
.LBB12372:
.LBB12373:
	.loc 4 1397 0
	movl	(%eax,%edx), %edi
	addl	$4, %edx
	movl	%edi, -4(%edx)
	.loc 4 1396 0
	cmpl	%ecx, %edx
	jne	.L3947
.LVL5166:
.LBE12373:
.LBE12372:
.LBB12374:
.LBB12375:
	.loc 27 1641 0
	testl	$4095, %esi
	jne	.L4033
.LBE12375:
.LBE12374:
.LBE12371:
.LBE12370:
	.loc 46 288 0
	movl	-112(%ebp), %eax
.LBB12407:
.LBB12398:
.LBB12380:
.LBB12376:
	.loc 27 1643 0
	andl	$-4096, %esi
.LVL5167:
.LBE12376:
.LBE12380:
	.loc 46 153 0
	movl	-52(%ebp), %edx
.LBB12381:
.LBB12377:
	.loc 27 1643 0
	movl	%esi, -104(%ebp)
	shrl	$8, -104(%ebp)
.LBE12377:
.LBE12381:
.LBE12398:
.LBE12407:
	.loc 46 288 0
	leal	8192(%eax), %edi
.LBB12408:
.LBB12399:
	.loc 46 153 0
	movl	-56(%ebp), %eax
.LBB12382:
.LBB12378:
	.loc 27 1647 0
	orl	$5, -104(%ebp)
.LBE12378:
.LBE12382:
.LBE12399:
.LBE12408:
	.loc 46 288 0
	movl	%edi, -108(%ebp)
.LVL5168:
.LBB12409:
.LBB12400:
	.loc 46 153 0
	call	cap_get_capPtr
.LVL5169:
	movl	-104(%ebp), %esi
	movl	$65537, 8(%esp)
	movl	%esi, 4(%esp)
	addl	$48, %eax
	movl	%eax, (%esp)
	call	write_slot
.LVL5170:
.LBE12400:
.LBE12409:
	.loc 46 280 0
	movl	-64(%ebp), %esi
	subl	-60(%ebp), %esi
.LBB12410:
.LBB12401:
	.loc 46 156 0
	movl	ndks_boot+20, %eax
	.loc 46 158 0
	andl	$-4194304, %esi
	cmpl	%esi, %edi
	.loc 46 156 0
	movl	%eax, -116(%ebp)
.LVL5171:
	.loc 46 158 0
	jbe	.L3953
	movl	%ebx, -64(%ebp)
	jmp	.L4000
.LVL5172:
	.p2align 4,,7
	.p2align 3
.L4036:
.LBB12383:
.LBB12384:
.LBB12385:
.LBB12386:
	.loc 27 1531 0
	movl	%esi, %edi
	shrl	$22, %edi
.LBE12386:
.LBE12385:
.LBE12384:
.LBE12383:
	.loc 46 165 0
	call	memzero.constprop.274
.LVL5173:
.LBB12395:
.LBB12393:
.LBB12390:
.LBB12387:
	.loc 27 1531 0
	orl	$67109888, %edi
.LVL5174:
	.loc 27 1533 0
	testl	$4095, %ebx
	jne	.L4034
.LVL5175:
.LBE12387:
.LBE12390:
	.loc 46 123 0
	movl	-104(%ebp), %eax
.LBB12391:
.LBB12388:
	.loc 27 1535 0
	andl	$-4096, %ebx
.LVL5176:
	shrl	$8, %ebx
.LVL5177:
	.loc 27 1539 0
	orl	$3, %ebx
.LVL5178:
.LBE12388:
.LBE12391:
	.loc 46 123 0
	movl	%ebx, 8(%esp)
	movl	%eax, (%esp)
	movl	%edi, 12(%esp)
	movl	$65537, 4(%esp)
	call	map_it_pt_cap
.LVL5179:
.LBE12393:
.LBE12395:
	.loc 46 166 0
	movl	-56(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%ebx, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
.LVL5180:
	call	provide_cap
.LVL5181:
	testl	%eax, %eax
	je	.L3963
	.loc 46 160 0
	addl	$4194304, %esi
.LVL5182:
	.loc 46 158 0
	cmpl	%esi, -108(%ebp)
	jbe	.L4035
.LVL5183:
.L4000:
	.loc 46 161 0
	movl	$12, (%esp)
	call	alloc_region
.LVL5184:
	.loc 46 162 0
	testl	%eax, %eax
	.loc 46 161 0
	movl	%eax, %ebx
.LVL5185:
	.loc 46 162 0
	jne	.L4036
	jmp	.L3963
.LVL5186:
	.p2align 4,,7
	.p2align 3
.L4022:
.LBE12401:
.LBE12410:
.LBB12411:
.LBB12352:
.LBB12344:
.LBB12345:
	.loc 29 263 0
	movl	$0, intStateIRQTable(,%ebx,4)
.LVL5187:
	jmp	.L3926
.LVL5188:
	.p2align 4,,7
	.p2align 3
.L4021:
.LBE12345:
.LBE12344:
.LBE12352:
.LBE12411:
.LBB12412:
.LBB12317:
	.loc 21 174 0
	movl	$.LC202, (%esp)
	call	printf
.LVL5189:
.LBE12317:
.LBE12412:
	.loc 46 482 0
	leal	-12(%ebp), %esp
	.loc 46 355 0
	xorl	%eax, %eax
	.loc 46 482 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL5190:
	popl	%esi
	.cfi_restore 6
.LVL5191:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL5192:
	.p2align 4,,7
	.p2align 3
.L4027:
	.cfi_restore_state
.LBB12413:
.LBB12366:
	.loc 21 254 0
	movl	$.LC199, (%esp)
	call	printf
.LVL5193:
.LBE12366:
.LBE12413:
	.loc 46 364 0
	xorl	%eax, %eax
	jmp	.L4014
.LVL5194:
	.p2align 4,,7
	.p2align 3
.L4032:
	movb	$0, (%edi)
	jmp	.L3944
	.p2align 4,,7
	.p2align 3
.L4031:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	jmp	.L3943
.LVL5195:
	.p2align 4,,7
	.p2align 3
.L4024:
	movl	-108(%ebp), %esi
.LVL5196:
	jmp	.L3925
.LVL5197:
	.p2align 4,,7
	.p2align 3
.L4023:
	leal	-8(%ebx), %ecx
.LBB12414:
.LBB12353:
.LBB12346:
.LBB12339:
.LBB12337:
.LBB12334:
.LBB12331:
.LBB12328:
	.loc 24 58 0
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %edi
	movl	%eax, -104(%ebp)
.LVL5198:
	jmp	.L3929
.LVL5199:
.L4030:
	xorl	%eax, %eax
.LVL5200:
	addl	$2, %edi
	movw	%ax, -2(%edi)
	subl	$2, %edx
	jmp	.L3942
.LVL5201:
.L4029:
	movb	$0, (%eax)
.LVL5202:
	leal	1(%eax), %edi
	movw	$4095, %dx
	jmp	.L3941
.LVL5203:
.L4035:
	movl	-64(%ebp), %ebx
.LVL5204:
	movl	ndks_boot+20, %eax
.LVL5205:
.L3953:
.LBE12328:
.LBE12331:
.LBE12334:
.LBE12337:
.LBE12339:
.LBE12346:
.LBE12353:
.LBE12414:
.LBB12415:
.LBB12402:
	.loc 46 174 0
	movl	ndks_boot+16, %edx
	movl	-116(%ebp), %esi
.LVL5206:
.LBE12402:
.LBE12415:
	.loc 46 284 0
	movl	-112(%ebp), %edi
.LBB12416:
.LBB12403:
	.loc 46 174 0
	movl	%eax, 44(%edx)
.LVL5207:
.LBE12403:
.LBE12416:
	.loc 46 375 0
	movl	-56(%ebp), %eax
.LVL5208:
.LBB12417:
.LBB12404:
	.loc 46 174 0
	movl	%esi, 40(%edx)
.LBE12404:
.LBE12417:
	.loc 46 375 0
	movl	-52(%ebp), %edx
.LVL5209:
	movl	%ebx, 16(%esp)
.LVL5210:
	movl	-104(%ebp), %ebx
	.loc 46 284 0
	leal	4096(%edi), %esi
	.loc 46 375 0
	movl	%esi, 20(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
.LVL5211:
	movl	%ebx, 8(%esp)
	movl	$65537, 12(%esp)
	call	create_bi_frame_cap
.LVL5212:
	.loc 46 383 0
	movl	-56(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%ebx, 12(%esp)
	movl	%edi, 20(%esp)
	movl	%eax, 4(%esp)
	leal	-48(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	movl	$65537, 16(%esp)
	call	create_ipcbuf_frame
.LVL5213:
	movl	-48(%ebp), %ebx
	movl	-44(%ebp), %eax
.LBB12418:
.LBB12419:
	.loc 27 872 0
	movl	%ebx, %ecx
	.loc 27 874 0
	movl	%ebx, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 874 0
	andl	$15, %edx
.LBE12419:
.LBE12418:
	.loc 46 383 0
	subl	$4, %esp
.LBB12422:
.LBB12420:
	.loc 27 874 0
	cmpl	$14, %ecx
.LBE12420:
.LBE12422:
	.loc 46 383 0
	movl	%eax, -64(%ebp)
.LVL5214:
.LBB12423:
.LBB12421:
	.loc 27 874 0
	movzbl	%bl, %eax
.LVL5215:
	cmovne	%edx, %eax
.LBE12421:
.LBE12423:
	.loc 46 384 0
	testl	%eax, %eax
	je	.L3963
	.loc 46 389 0
	movl	-60(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	$1, 28(%esp)
	movl	$65537, 16(%esp)
	movl	%eax, 32(%esp)
	movl	-76(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 20(%esp)
	movl	-80(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	-104(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, 4(%esp)
.LVL5216:
	leal	-36(%ebp), %eax
.LVL5217:
	movl	%eax, (%esp)
	call	create_frames_of_region
.LVL5218:
	.loc 46 397 0
	movl	-28(%ebp), %edx
	.loc 46 389 0
	subl	$4, %esp
.LVL5219:
	.loc 46 397 0
	testl	%edx, %edx
	je	.L3963
	.loc 46 400 0
	movl	ndks_boot+16, %ecx
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
.LVL5220:
	movl	%eax, 32(%ecx)
	.loc 46 403 0
	movl	-56(%ebp), %eax
	.loc 46 400 0
	movl	%edx, 36(%ecx)
	.loc 46 403 0
	movl	-52(%ebp), %edx
	movl	%eax, 4(%esp)
	leal	-48(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	create_it_asid_pool
.LVL5221:
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %ecx
.LVL5222:
.LBB12424:
.LBB12425:
	.loc 27 872 0
	movl	%eax, %edx
	.loc 27 873 0
	movzbl	%al, %edi
	.loc 27 872 0
	andl	$14, %edx
	movl	%edx, -60(%ebp)
	.loc 27 873 0
	movl	%eax, %edx
.LVL5223:
.LBE12425:
.LBE12424:
	.loc 46 403 0
	subl	$4, %esp
.LBB12427:
.LBB12426:
	.loc 27 873 0
	andl	$15, %edx
	cmpl	$14, -60(%ebp)
	cmove	%edi, %edx
.LBE12426:
.LBE12427:
	.loc 46 404 0
	testl	%edx, %edx
	je	.L3963
	.loc 46 407 0
	movl	-104(%ebp), %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	$65537, 12(%esp)
	movl	%edx, 8(%esp)
	call	write_it_asid_pool
.LVL5224:
	.loc 46 414 0
	call	resetFpu
.LVL5225:
	.loc 46 415 0
	movl	$ia32KSnullFpuState, (%esp)
	call	saveFpuState
.LVL5226:
	.loc 46 416 0
	movl	$0, ia32KSfpuOwner
	.loc 46 419 0
	call	create_idle_thread
.LVL5227:
	testl	%eax, %eax
	je	.L3963
	.loc 46 424 0
	movl	-64(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%ebx, 28(%esp)
	movl	%esi, 20(%esp)
	movl	%eax, 32(%esp)
.LVL5228:
	movl	-112(%ebp), %eax
.LVL5229:
	movl	$65537, 12(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, 24(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-104(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, (%esp)
.LVL5230:
	call	create_initial_thread
.LVL5231:
	testl	%eax, %eax
	je	.L3963
	.loc 46 449 0
	movl	-88(%ebp), %eax
.LBB12428:
.LBB12429:
	.loc 46 196 0
	xorl	%esi, %esi
.LBE12429:
.LBE12428:
	.loc 46 449 0
	movl	-52(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	-72(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, (%esp)
.LVL5232:
	call	create_untypeds
.LVL5233:
	testl	%eax, %eax
	je	.L3963
.LVL5234:
.L3959:
.LBB12457:
.LBB12454:
	.loc 46 196 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %esi
	jae	.L4037
	movl	24(%ebp), %eax
	.loc 46 204 0
	xorl	%edi, %edi
	movl	4(%eax,%esi,8), %edx
.LVL5235:
.LBB12430:
.LBB12431:
	.loc 10 48 0
	movl	8(%eax,%esi,8), %eax
.LVL5236:
	leal	-536870912(%edx), %ebx
	subl	$536870912, %eax
.LBE12431:
.LBE12430:
	.loc 46 200 0
	testl	$4194303, %ebx
.LBB12433:
.LBB12432:
	.loc 10 48 0
	movl	%eax, -60(%ebp)
.LVL5237:
.LBE12432:
.LBE12433:
	.loc 46 200 0
	jne	.L3960
.LVL5238:
	testl	$4194303, %eax
	sete	%al
.LVL5239:
	movzbl	%al, %eax
	movl	%eax, %edi
.LVL5240:
.L3960:
	.loc 46 207 0
	movl	ndks_boot+20, %eax
	movl	%eax, -64(%ebp)
.LVL5241:
.LBB12434:
.LBB12435:
.LBB12436:
.LBB12437:
	.loc 27 1375 0
	movl	%edi, %eax
.LVL5242:
	sall	$31, %eax
	movl	%eax, -72(%ebp)
.LVL5243:
.L3961:
.LBE12437:
.LBE12436:
.LBE12435:
.LBE12434:
	.loc 46 210 0
	cmpl	%ebx, -60(%ebp)
	jbe	.L4038
.LVL5244:
.LBB12444:
.LBB12442:
.LBB12440:
.LBB12438:
	.loc 27 1393 0
	testl	$4095, %ebx
	jne	.L4039
	.loc 27 1395 0
	movl	%ebx, %eax
	andl	$-4096, %eax
	shrl	$8, %eax
	.loc 27 1399 0
	orl	$50331649, %eax
.LBE12438:
.LBE12440:
.LBE12442:
.LBE12444:
	.loc 46 212 0
	movl	%eax, 8(%esp)
	movl	-72(%ebp), %eax
	movl	%edx, -76(%ebp)
.LVL5245:
	movl	-52(%ebp), %edx
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
.LVL5246:
	call	provide_cap
.LVL5247:
	testl	%eax, %eax
	je	.L3963
.LVL5248:
.LBB12445:
.LBB12446:
	.loc 37 43 0
	cmpl	$1, %edi
	movl	$22, %eax
.LBE12446:
.LBE12445:
	.loc 46 210 0
	movl	-76(%ebp), %edx
.LBB12448:
.LBB12447:
	.loc 37 43 0
	movl	$12, %ecx
	cmove	%eax, %ecx
.LBE12447:
.LBE12448:
	.loc 46 210 0
	movb	$1, %al
	sall	%cl, %eax
.LVL5249:
	addl	%eax, %ebx
.LVL5250:
	jmp	.L3961
.LVL5251:
.L4018:
	movl	-108(%ebp), %esi
.LVL5252:
.L3918:
.LBE12454:
.LBE12457:
.LBB12458:
.LBB12354:
.LBB12347:
.LBB12348:
	.loc 29 264 0
	movl	$31, %eax
	.loc 29 263 0
	movl	$2, intStateIRQTable+124
	.loc 29 264 0
	call	maskInterrupt.constprop.256
.LVL5253:
	jmp	.L3925
.LVL5254:
.L4026:
.LBE12348:
.LBE12347:
.LBB12349:
.LBB12350:
	movl	$2, %eax
	.loc 29 263 0
	movl	$3, intStateIRQTable+8
	.loc 29 264 0
	call	maskInterrupt.constprop.256
.LVL5255:
	jmp	.L3938
.LVL5256:
.L3922:
	movl	$2, %eax
	.loc 29 263 0
	movl	$3, intStateIRQTable+8
	.loc 29 264 0
	call	maskInterrupt.constprop.256
.LVL5257:
	jmp	.L3921
.LVL5258:
.L4037:
.LBE12350:
.LBE12349:
.LBE12354:
.LBE12458:
.LBB12459:
.LBB12455:
	.loc 46 228 0
	movl	ndks_boot+16, %edx
	movl	%eax, 892(%edx)
.LBE12455:
.LBE12459:
	.loc 46 460 0
	movl	-84(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	$0, 32(%esp)
	movl	$0, 28(%esp)
	movl	%eax, 20(%esp)
	movl	-68(%ebp), %eax
	movl	$65537, 16(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 24(%esp)
	movl	-104(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, 4(%esp)
.LVL5259:
	leal	-36(%ebp), %eax
.LVL5260:
	movl	%eax, (%esp)
	call	create_frames_of_region
.LVL5261:
	.loc 46 468 0
	cmpl	$0, -28(%ebp)
	.loc 46 460 0
	pushl	%eax
	.loc 46 468 0
	je	.L3963
	.loc 46 471 0
	movl	ndks_boot+16, %ecx
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%eax, 24(%ecx)
.LBB12460:
.LBB12461:
	.loc 21 528 0
	movl	ndks_boot+24, %eax
.LBE12461:
.LBE12460:
	.loc 46 471 0
	movl	%edx, 28(%ecx)
.LVL5262:
.LBB12464:
.LBB12462:
	.loc 21 529 0
	movl	ndks_boot+20, %edx
	movl	%eax, 20(%ecx)
.LVL5263:
.LBE12462:
.LBE12464:
	.loc 46 477 0
	movl	52(%ebp), %eax
.LVL5264:
.LBB12465:
.LBB12463:
	.loc 21 529 0
	movl	%edx, 16(%ecx)
.LBE12463:
.LBE12465:
	.loc 46 477 0
	movzwl	cmdline_opt(%eax,%eax), %eax
	movw	%ax, ia32KSconsolePort
.LVL5265:
	.loc 46 478 0
	movl	52(%ebp), %eax
	movzwl	cmdline_opt+16(%eax,%eax), %eax
	movw	%ax, ia32KSdebugPort
	.loc 46 481 0
	movl	$1, %eax
	jmp	.L4014
.LVL5266:
.L4034:
.LBB12466:
.LBB12405:
.LBB12396:
.LBB12394:
.LBB12392:
.LBB12389:
	.loc 27 1533 0
	movl	$__FUNCTION__.1781, 12(%esp)
	movl	$1533, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC238, (%esp)
	call	_assert_fail
.LVL5267:
.L3919:
.LBE12389:
.LBE12392:
.LBE12394:
.LBE12396:
.LBE12405:
.LBE12466:
.LBB12467:
.LBB12355:
.LBB12351:
.LBB12343:
	.loc 29 264 0
	movl	$30, %eax
	.loc 29 263 0
	movl	$3, intStateIRQTable+120
	.loc 29 264 0
	call	maskInterrupt.constprop.256
.LVL5268:
	jmp	.L3921
.LVL5269:
.L4028:
.LBE12343:
.LBE12351:
.LBE12355:
.LBE12467:
.LBB12468:
.LBB12367:
.LBB12363:
.LBB12362:
.LBB12361:
	call	memzero.part.214
.LVL5270:
.L4033:
.LBE12361:
.LBE12362:
.LBE12363:
.LBE12367:
.LBE12468:
.LBB12469:
.LBB12406:
.LBB12397:
.LBB12379:
	.loc 27 1641 0
	movl	$__FUNCTION__.1824, 12(%esp)
	movl	$1641, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC237, (%esp)
	call	_assert_fail
.LVL5271:
.L4039:
.LBE12379:
.LBE12397:
.LBE12406:
.LBE12469:
.LBB12470:
.LBB12456:
.LBB12449:
.LBB12443:
.LBB12441:
.LBB12439:
	.loc 27 1393 0
	movl	$__FUNCTION__.1724, 12(%esp)
	movl	$1393, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC135, (%esp)
	call	_assert_fail
.LVL5272:
.L4038:
.LBE12439:
.LBE12441:
.LBE12443:
.LBE12449:
.LBB12450:
.LBB12451:
	.loc 37 43 0
	subl	$1, %edi
.LVL5273:
	movl	$22, %eax
.LBE12451:
.LBE12450:
	.loc 46 217 0
	movl	ndks_boot+20, %ecx
.LVL5274:
.LBB12453:
.LBB12452:
	.loc 37 43 0
	movl	$12, %ebx
.LVL5275:
	cmove	%eax, %ebx
.LVL5276:
.LBE12452:
.LBE12453:
	.loc 46 225 0
	leal	56(%esi), %eax
	.loc 46 196 0
	addl	$1, %esi
.LVL5277:
	.loc 46 225 0
	sall	$4, %eax
	addl	ndks_boot+16, %eax
	movl	%edx, (%eax)
	movl	-64(%ebp), %edx
.LVL5278:
	movl	%ebx, 4(%eax)
	movl	%ecx, 12(%eax)
	movl	%edx, 8(%eax)
	jmp	.L3959
.LBE12456:
.LBE12470:
	.cfi_endproc
.LFE313:
	.size	init_node_state, .-init_node_state
	.p2align 4,,15
	.type	try_boot_node, @function
try_boot_node:
.LFB325:
	.loc 9 319 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$108, %esp
	.cfi_def_cfa_offset 128
.LBB12487:
.LBB12488:
	.loc 9 229 0
	call	get_current_esp
.LVL5279:
.LBB12489:
.LBB12490:
	.loc 10 41 0
	addl	$536870912, %eax
.LVL5280:
.LBE12490:
.LBE12489:
	.loc 9 231 0
	cmpl	$_boot_stack_top, %eax
	ja	.L4041
	cmpl	$_boot_stack_bottom, %eax
	ja	.L4072
.L4041:
	.loc 9 234 0
	shrl	$11, %eax
.LVL5281:
.L4042:
.LBE12488:
.LBE12487:
.LBB12492:
.LBB12493:
	.loc 9 245 0
	movl	glks+24, %ebx
	testl	%ebx, %ebx
	je	.L4043
	.loc 9 246 0
	cmpl	%eax, glks+28
	je	.L4073
.LVL5282:
	.loc 9 245 0
	cmpl	$1, %ebx
	jbe	.L4043
	.loc 9 246 0
	cmpl	%eax, glks+32
	je	.L4054
.LVL5283:
	.loc 9 245 0
	cmpl	$2, %ebx
	jbe	.L4043
	.loc 9 246 0
	cmpl	%eax, glks+36
	je	.L4055
.LVL5284:
	.loc 9 245 0
	cmpl	$3, %ebx
	jbe	.L4043
	.loc 9 246 0
	cmpl	%eax, glks+40
	je	.L4056
.LVL5285:
	.loc 9 245 0
	cmpl	$4, %ebx
	jbe	.L4043
	.loc 9 246 0
	cmpl	%eax, glks+44
	je	.L4057
.LVL5286:
	.loc 9 245 0
	cmpl	$5, %ebx
	jbe	.L4043
	.loc 9 246 0
	cmpl	%eax, glks+48
	je	.L4058
.LVL5287:
	.loc 9 245 0
	cmpl	$6, %ebx
	jbe	.L4043
	.loc 9 246 0
	cmpl	%eax, glks+52
	je	.L4059
.LVL5288:
	.loc 9 245 0
	cmpl	$7, %ebx
	jbe	.L4043
	.loc 9 246 0
	cmpl	%eax, glks+56
	je	.L4060
.LVL5289:
.L4043:
	call	node_of_cpu.part.46
.LVL5290:
	.p2align 4,,7
	.p2align 3
.L4072:
.LBE12493:
.LBE12492:
.LBB12496:
.LBB12491:
	.loc 9 232 0
	movl	glks+28, %eax
.LVL5291:
	jmp	.L4042
.LVL5292:
	.p2align 4,,7
	.p2align 3
.L4073:
.LBE12491:
.LBE12496:
.LBB12497:
.LBB12494:
	.loc 9 245 0
	xorl	%esi, %esi
.LVL5293:
	.p2align 4,,7
	.p2align 3
.L4044:
.LBE12494:
.LBE12497:
	.loc 9 326 0
	movl	%esi, %eax
.LVL5294:
	movl	glks, %ecx
	sall	$4, %eax
	movl	glks+60(%eax), %edx
	movl	%edx, 80(%esp)
	movl	glks+64(%eax), %edx
	movl	%edx, 84(%esp)
	movl	glks+68(%eax), %edx
	addl	$glks+48, %eax
	movl	24(%eax), %eax
	movl	%edx, 88(%esp)
.LBB12498:
.LBB12499:
	.loc 9 269 0
	xorl	%edx, %edx
.LBE12499:
.LBE12498:
	.loc 9 326 0
	movl	%eax, 92(%esp)
.LVL5295:
.LBB12505:
.LBB12500:
	.loc 9 268 0
	movl	glks+4, %eax
	subl	%ecx, %eax
	shrl	$12, %eax
.LVL5296:
	.loc 9 269 0
	divl	%ebx
.LVL5297:
	.loc 9 272 0
	cmpl	%edx, %esi
	jb	.L4074
.LVL5298:
	.loc 9 279 0
	movl	%esi, %ebp
	subl	%edx, %ebp
	leal	1(%eax), %edi
	imull	%eax, %ebp
	imull	%edx, %edi
	leal	0(%ebp,%edi), %edx
.LVL5299:
.L4071:
	sall	$12, %edx
.LBE12500:
.LBE12505:
	.loc 9 337 0
	movl	$1048576, %edi
.LBB12506:
.LBB12501:
	.loc 9 282 0
	addl	%ecx, %edx
.LBE12501:
.LBE12506:
.LBB12507:
.LBB12508:
	.loc 9 297 0
	movl	%esi, %ebp
.LBE12508:
.LBE12507:
.LBB12518:
.LBB12502:
	.loc 9 282 0
	sall	$12, %eax
	.loc 9 280 0
	addl	%edx, %eax
	movl	%eax, 76(%esp)
.LBE12502:
.LBE12518:
	.loc 9 337 0
	xorl	%eax, %eax
	cmpl	$1, %ebx
.LBB12519:
.LBB12503:
	.loc 9 280 0
	movl	%edx, 72(%esp)
.LBE12503:
.LBE12519:
	.loc 9 337 0
	movl	$ki_boot_end+536870912, %edx
	cmovne	%eax, %edx
	cmove	%edi, %eax
	movl	%eax, 64(%esp)
.LVL5300:
.LBB12520:
.LBB12515:
	.loc 9 292 0
	leal	(%esi,%esi,2), %eax
	sall	$12, %eax
.LVL5301:
	.loc 9 297 0
	sall	$12, %ebp
.LVL5302:
.LBE12515:
.LBE12520:
	.loc 9 337 0
	movl	%edx, 68(%esp)
.LBB12521:
.LBB12516:
	.loc 9 297 0
	leal	kernel_pt_list(%ebp), %edi
	.loc 9 296 0
	addl	$kernel_pd_list, %ebp
	.loc 9 293 0
	leal	ndks_list+536883200(%eax), %edx
.LBB12509:
.LBB12510:
	.loc 10 41 0
	addl	$ndks_list+536870912, %eax
.LVL5303:
.LBE12510:
.LBE12509:
	.loc 9 295 0
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	%edi, 4(%esp)
	movl	%ebp, (%esp)
	call	map_kernel_window
.LVL5304:
.LBE12516:
.LBE12521:
	.loc 9 342 0
	xorl	%edx, %edx
.LBB12522:
.LBB12517:
	.loc 9 295 0
	testl	%eax, %eax
	je	.L4064
.LVL5305:
.LBB12511:
.LBB12512:
	.loc 10 41 0
	leal	536870912(%ebp), %eax
.LVL5306:
.LBE12512:
.LBE12511:
.LBB12513:
.LBB12514:
	.loc 2 35 0
#APP
# 35 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr3
# 0 "" 2
#NO_APP
.LBE12514:
.LBE12513:
	.loc 9 313 0
.LBE12517:
.LBE12522:
	.loc 9 346 0
	movl	64(%esp), %eax
.LVL5307:
	movl	glks+20, %edx
	movl	%edi, 56(%esp)
	movl	%ebp, 52(%esp)
	movl	%eax, 36(%esp)
	movl	68(%esp), %eax
	movl	%edx, 12(%esp)
	movl	%ebx, 48(%esp)
	movl	%esi, 44(%esp)
	movl	%eax, 40(%esp)
	movl	80(%esp), %eax
	movl	$glks+188, 16(%esp)
.LVL5308:
	movl	%eax, 20(%esp)
	movl	84(%esp), %eax
	movl	%eax, 24(%esp)
	movl	88(%esp), %eax
	movl	%eax, 28(%esp)
	movl	92(%esp), %eax
	movl	%eax, 32(%esp)
	movl	glks+16, %eax
	movl	%eax, 8(%esp)
	movl	72(%esp), %eax
	movl	%eax, (%esp)
	movl	76(%esp), %eax
	movl	%eax, 4(%esp)
	call	init_node_state
.LVL5309:
	.loc 9 366 0
	xorl	%edx, %edx
	.loc 9 346 0
	testl	%eax, %eax
	jne	.L4075
.LVL5310:
.L4064:
	.loc 9 381 0
	addl	$108, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%edx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5311:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5312:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5313:
	.p2align 4,,7
	.p2align 3
.L4074:
	.cfi_restore_state
.LBB12523:
.LBB12504:
	.loc 9 273 0
	addl	$1, %eax
.LVL5314:
	movl	%esi, %edx
.LVL5315:
	imull	%eax, %edx
	jmp	.L4071
.LVL5316:
	.p2align 4,,7
	.p2align 3
.L4075:
.LBE12504:
.LBE12523:
	.loc 9 370 0
	xorl	%eax, %eax
	testl	%esi, %esi
	setne	%al
	movl	%eax, 4(%esp)
	movl	glks+1784, %eax
	movl	%eax, (%esp)
	call	init_node_cpu
.LVL5317:
	xorl	%edx, %edx
	testl	%eax, %eax
	setne	%dl
	.loc 9 381 0
	addl	$108, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5318:
	movl	%edx, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5319:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL5320:
	ret
.LVL5321:
	.p2align 4,,7
	.p2align 3
.L4060:
	.cfi_restore_state
.LBB12524:
.LBB12495:
	.loc 9 246 0
	movl	$7, %esi
	jmp	.L4044
.LVL5322:
	.p2align 4,,7
	.p2align 3
.L4059:
	movl	$6, %esi
	jmp	.L4044
.LVL5323:
	.p2align 4,,7
	.p2align 3
.L4058:
	movl	$5, %esi
	jmp	.L4044
.LVL5324:
	.p2align 4,,7
	.p2align 3
.L4057:
	movl	$4, %esi
	jmp	.L4044
.LVL5325:
	.p2align 4,,7
	.p2align 3
.L4056:
	movl	$3, %esi
	jmp	.L4044
.LVL5326:
	.p2align 4,,7
	.p2align 3
.L4055:
	movl	$2, %esi
	jmp	.L4044
.LVL5327:
	.p2align 4,,7
	.p2align 3
.L4054:
	movl	$1, %esi
	jmp	.L4044
.LBE12495:
.LBE12524:
	.cfi_endproc
.LFE325:
	.size	try_boot_node, .-try_boot_node
	.section	.rodata.str1.1
.LC239:
	.string	"Failed to start node :(\n"
	.section	.boot.text
	.p2align 4,,15
	.globl	boot_node
	.type	boot_node, @function
boot_node:
.LFB326:
	.loc 9 387 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 9 389 0
	call	try_boot_node
.LVL5328:
	.loc 9 390 0
	testl	%eax, %eax
	je	.L4079
	.loc 9 393 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.L4079:
	.cfi_restore_state
	.loc 9 391 0
	movl	$__func__.4805, 12(%esp)
	movl	$391, 8(%esp)
	movl	$.LC27, 4(%esp)
	movl	$.LC239, (%esp)
	call	_fail
.LVL5329:
	.cfi_endproc
.LFE326:
	.size	boot_node, .-boot_node
	.p2align 4,,15
	.globl	pci_scan
	.type	pci_scan, @function
pci_scan:
.LFB626:
	.loc 50 198 0
	.cfi_startproc
.LVL5330:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %eax
	testl	%eax, %eax
	setne	15(%esp)
	.loc 50 210 0
	xorl	%edi, %edi
.LVL5331:
	.p2align 4,,7
	.p2align 3
.L4081:
.LBB12527:
.LBB12528:
	.loc 50 67 0 discriminator 1
	movl	%edi, %ebp
	xorl	%ebx, %ebx
	sall	$16, %ebp
	xorl	%esi, %esi
	movw	%di, 12(%esp)
.LVL5332:
	orl	$-2147483636, %ebp
	jmp	.L4089
.LVL5333:
	.p2align 4,,7
	.p2align 3
.L4082:
	addl	$1, %ebx
.LVL5334:
.LBE12528:
.LBE12527:
	.loc 50 207 0
	cmpl	$32, %ebx
	je	.L4103
.LVL5335:
.L4089:
	.loc 50 208 0
	movl	%ebx, %edx
	movl	%edi, %eax
	call	pci_scan_fun.constprop.222
.LVL5336:
	testl	%eax, %eax
	je	.L4082
.LVL5337:
.LBB12530:
.LBB12529:
	.loc 50 67 0
	movl	%ebx, %eax
	sall	$11, %eax
	orl	%ebp, %eax
	movl	%eax, 4(%esp)
	movl	$3320, (%esp)
	call	out32
.LVL5338:
	.loc 50 68 0
	movl	$3324, (%esp)
	call	in32
.LVL5339:
	shrl	$16, %eax
.LBE12529:
.LBE12530:
	.loc 50 211 0
	testb	%al, %al
	js	.L4083
.L4084:
	addl	$1, %ebx
.LVL5340:
	.loc 50 210 0
	movl	$1, %esi
.LVL5341:
	.loc 50 207 0
	cmpl	$32, %ebx
	jne	.L4089
.LVL5342:
.L4103:
	.loc 50 222 0
	testl	%esi, %esi
	je	.L4087
	cmpb	$0, 15(%esp)
	je	.L4087
	.loc 50 223 0
	movzwl	12(%esp), %ecx
	movl	$1, %eax
	movl	%ecx, %edx
	sall	%cl, %eax
	movl	48(%esp), %ecx
	shrw	$5, %dx
	movzwl	%dx, %edx
	orl	%eax, (%ecx,%edx,4)
.L4087:
.LVL5343:
	addl	$1, %edi
.LVL5344:
	.loc 50 205 0
	cmpl	$256, %edi
	jne	.L4081
	.loc 50 226 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5345:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5346:
	.p2align 4,,7
	.p2align 3
.L4083:
	.cfi_restore_state
	.loc 50 211 0
	movl	$1, %esi
	.p2align 4,,7
	.p2align 3
.L4085:
.LVL5347:
	.loc 50 219 0 discriminator 2
	movl	%esi, %ecx
	movl	%ebx, %edx
	movl	%edi, %eax
	addl	$1, %esi
.LVL5348:
	call	pci_scan_fun
.LVL5349:
	.loc 50 218 0 discriminator 2
	cmpl	$8, %esi
	jne	.L4085
	jmp	.L4084
	.cfi_endproc
.LFE626:
	.size	pci_scan, .-pci_scan
	.p2align 4,,15
	.globl	pic_remap_irqs
	.type	pic_remap_irqs, @function
pic_remap_irqs:
.LFB627:
	.loc 24 23 0
	.cfi_startproc
.LVL5350:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 24 23 0
	movl	32(%esp), %ebx
	.loc 24 24 0
	movl	$17, 4(%esp)
	movl	$32, (%esp)
	call	out8
.LVL5351:
	.loc 24 25 0
	movl	$17, 4(%esp)
	movl	$160, (%esp)
	call	out8
.LVL5352:
	.loc 24 26 0
	movzbl	%bl, %eax
	.loc 24 27 0
	addl	$8, %ebx
	.loc 24 26 0
	movl	%eax, 4(%esp)
	.loc 24 27 0
	movzbl	%bl, %ebx
	.loc 24 26 0
	movl	$33, (%esp)
	call	out8
.LVL5353:
	.loc 24 27 0
	movl	%ebx, 4(%esp)
	movl	$161, (%esp)
	call	out8
.LVL5354:
	.loc 24 28 0
	movl	$4, 4(%esp)
	movl	$33, (%esp)
	call	out8
.LVL5355:
	.loc 24 29 0
	movl	$2, 4(%esp)
	movl	$161, (%esp)
	call	out8
.LVL5356:
	.loc 24 30 0
	movl	$1, 4(%esp)
	movl	$33, (%esp)
	call	out8
.LVL5357:
	.loc 24 31 0
	movl	$1, 4(%esp)
	movl	$161, (%esp)
	call	out8
.LVL5358:
	.loc 24 32 0
	movl	$0, 4(%esp)
	movl	$33, (%esp)
	call	out8
.LVL5359:
	.loc 24 33 0
	movl	$0, 4(%esp)
	movl	$161, (%esp)
	call	out8
.LVL5360:
	.loc 24 34 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE627:
	.size	pic_remap_irqs, .-pic_remap_irqs
	.p2align 4,,15
	.globl	pic_disable
	.type	pic_disable, @function
pic_disable:
.LFB628:
	.loc 24 37 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 24 40 0
	movl	$255, 4(%esp)
	movl	$33, (%esp)
	call	out8
.LVL5361:
	.loc 24 41 0
	movl	$255, 4(%esp)
	movl	$161, (%esp)
	call	out8
.LVL5362:
	.loc 24 42 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE628:
	.size	pic_disable, .-pic_disable
	.section	.rodata.str1.4
	.align 4
.LC240:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/machine/pic.c"
	.section	.rodata.str1.1
.LC241:
	.string	"irq >= irq_isa_min"
.LC242:
	.string	"irq <= irq_isa_max"
	.text
	.p2align 4,,15
	.globl	pic_mask_irq
	.type	pic_mask_irq, @function
pic_mask_irq:
.LFB629:
	.loc 24 47 0
	.cfi_startproc
.LVL5363:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 24 47 0
	movl	36(%esp), %ecx
	movl	32(%esp), %eax
	.loc 24 51 0
	testl	%ecx, %ecx
	js	.L4116
	.loc 24 52 0
	cmpl	$15, %ecx
	jg	.L4117
	.loc 24 54 0
	cmpl	$7, %ecx
	jle	.L4118
	.loc 24 58 0
	subl	$8, %ecx
	movl	$1, %edx
	sall	%cl, %edx
	movl	$161, %ebx
	.loc 24 62 0
	testl	%eax, %eax
	.loc 24 58 0
	movl	%edx, %esi
.LVL5364:
	.loc 24 64 0
	movl	%ebx, (%esp)
	.loc 24 62 0
	jne	.L4119
.L4113:
	.loc 24 67 0
	call	in8
.LVL5365:
	notl	%esi
.LVL5366:
	andl	%esi, %eax
.L4115:
	movzbl	%al, %eax
	movl	%ebx, 32(%esp)
	movl	%eax, 36(%esp)
	.loc 24 69 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.loc 24 67 0
	jmp	out8
.LVL5367:
	.p2align 4,,7
	.p2align 3
.L4118:
	.cfi_restore_state
	.loc 24 55 0
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
.LVL5368:
	.loc 24 62 0
	testl	%eax, %eax
	.loc 24 64 0
	movl	%ebx, (%esp)
	.loc 24 62 0
	je	.L4113
.L4119:
	.loc 24 64 0
	call	in8
.LVL5369:
	orl	%esi, %eax
	jmp	.L4115
.LVL5370:
.L4117:
	.loc 24 52 0 discriminator 1
	movl	$__FUNCTION__.7670, 12(%esp)
	movl	$52, 8(%esp)
	movl	$.LC240, 4(%esp)
	movl	$.LC242, (%esp)
	call	_assert_fail
.LVL5371:
.L4116:
	.loc 24 51 0 discriminator 1
	movl	$__FUNCTION__.7670, 12(%esp)
	movl	$51, 8(%esp)
	movl	$.LC240, 4(%esp)
	movl	$.LC241, (%esp)
	call	_assert_fail
.LVL5372:
	.cfi_endproc
.LFE629:
	.size	pic_mask_irq, .-pic_mask_irq
	.section	.rodata.str1.4
	.align 4
.LC243:
	.string	"finaliseCap should only return Zombie or NullCap"
	.align 4
.LC244:
	.string	"capRemovable(fc_ret.remainder, slot) && fc_ret.irq == irqInvalid"
	.text
	.p2align 4,,15
	.globl	cteDeleteOne
	.type	cteDeleteOne, @function
cteDeleteOne:
.LFB524:
	.loc 26 758 0
	.cfi_startproc
.LVL5373:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 26 758 0
	movl	8(%ebp), %ebx
	.loc 26 759 0
	movl	(%ebx), %edx
.LVL5374:
.LBB12605:
.LBB12606:
	.loc 27 872 0
	movl	%edx, %ecx
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL5375:
	cmpl	$14, %ecx
	cmove	%edx, %eax
.LBE12606:
.LBE12605:
	.loc 26 759 0
	testl	%eax, %eax
	jne	.L4175
.LVL5376:
.L4120:
	.loc 26 770 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL5377:
	.p2align 4,,7
	.p2align 3
.L4175:
	.cfi_restore_state
.LBB12607:
.LBB12608:
.LBB12609:
	.loc 26 906 0
	movl	8(%ebx), %eax
	.loc 26 904 0
	movl	12(%ebx), %edx
.LVL5378:
	.loc 26 906 0
	andl	$-8, %eax
	je	.L4176
.LBB12610:
	.loc 26 912 0
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
	movl	%edx, -44(%ebp)
.LVL5379:
	movl	%esi, 8(%esp)
.LVL5380:
	movl	%edi, 12(%esp)
	movl	4(%eax), %edx
.LVL5381:
	movl	(%eax), %eax
.LVL5382:
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
.LVL5383:
.LBE12610:
	.loc 26 916 0
	xorl	%ecx, %ecx
	.loc 26 915 0
	movl	-44(%ebp), %edx
	testl	%eax, %eax
	je	.L4124
.LVL5384:
.L4125:
.LBE12609:
.LBE12608:
	.loc 26 764 0
	leal	-36(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, (%esp)
	movl	$1, 16(%esp)
	call	finaliseCap
.LVL5385:
	movl	-36(%ebp), %ecx
	movl	-32(%ebp), %esi
.LBB12613:
.LBB12614:
.LBB12615:
.LBB12616:
	.loc 27 872 0
	movl	%ecx, %edi
	.loc 27 873 0
	movl	%ecx, %eax
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %eax
.LBE12616:
.LBE12615:
.LBE12614:
.LBE12613:
	.loc 26 764 0
	subl	$4, %esp
.LVL5386:
.LBB12643:
.LBB12640:
.LBB12618:
.LBB12617:
	.loc 27 873 0
	movzbl	%cl, %edx
	cmpl	$14, %edi
	cmove	%edx, %eax
.LBE12617:
.LBE12618:
	.loc 26 623 0
	testl	%eax, %eax
	je	.L4129
	cmpl	$46, %eax
	jne	.L4172
.LVL5387:
.LBB12619:
.LBB12620:
.LBB12621:
.LBB12622:
.LBB12623:
.LBB12624:
.LBB12625:
	.loc 27 1891 0
	cmpl	$46, %edx
	jne	.L4177
	.loc 27 1894 0
	andl	$16128, %ecx
.LVL5388:
	shrl	$8, %ecx
.LBE12625:
.LBE12624:
	.loc 40 90 0
	cmpl	$32, %ecx
	je	.L4178
.LVL5389:
.LBE12623:
.LBE12622:
	.loc 40 100 0
	addl	$1, %ecx
	movl	$1, %edx
	sall	%cl, %edx
	leal	-1(%edx), %eax
	negl	%edx
	andl	%esi, %eax
.LVL5390:
.L4143:
.LBE12621:
.LBE12620:
	.loc 26 629 0
	testl	%eax, %eax
	je	.L4129
.LBB12632:
.LBB12633:
	.loc 40 107 0
	andl	%esi, %edx
.LVL5391:
.LBE12633:
.LBE12632:
.LBE12619:
.LBE12640:
.LBE12643:
	.loc 26 766 0
	cmpl	%edx, %ebx
	jne	.L4135
	cmpl	$1, %eax
	jne	.L4135
.LVL5392:
.L4129:
	.loc 26 766 0 is_stmt 0 discriminator 2
	cmpl	$-1, -28(%ebp)
	jne	.L4135
.LVL5393:
.LBB12644:
.LBB12645:
	.loc 26 593 0 is_stmt 1
	movl	(%ebx), %edx
.LVL5394:
.LBB12646:
.LBB12647:
	.loc 27 872 0
	movl	%edx, %ecx
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL5395:
	cmpl	$14, %ecx
	cmove	%edx, %eax
.LBE12647:
.LBE12646:
	.loc 26 593 0
	testl	%eax, %eax
	je	.L4120
.LVL5396:
.LBB12648:
.LBB12649:
	.loc 26 597 0
	movl	12(%ebx), %esi
.LVL5397:
	.loc 26 601 0
	movl	8(%ebx), %ecx
.LBB12650:
.LBB12651:
	.loc 27 767 0
	movl	%esi, %eax
	andl	$-8, %eax
.LVL5398:
.LBE12651:
.LBE12650:
	.loc 26 601 0
	andl	$-8, %ecx
.LVL5399:
	je	.L4140
.LVL5400:
.LBB12652:
.LBB12653:
	.loc 27 774 0
	movl	12(%ecx), %edx
	andl	$7, %edx
	.loc 27 775 0
	orl	%eax, %edx
	movl	%edx, 12(%ecx)
.LVL5401:
.L4140:
.LBE12653:
.LBE12652:
	.loc 26 604 0
	testl	%eax, %eax
	je	.L4141
.LVL5402:
.LBB12654:
.LBB12655:
	.loc 27 840 0
	movl	8(%eax), %edx
.LBE12655:
.LBE12654:
.LBB12658:
.LBB12659:
	.loc 27 802 0
	andl	$1, %esi
.LVL5403:
.LBE12659:
.LBE12658:
.LBB12661:
.LBB12656:
	.loc 27 840 0
	andl	$7, %edx
	.loc 27 841 0
	orl	%ecx, %edx
.LBE12656:
.LBE12661:
	.loc 26 609 0
	movl	12(%eax), %ecx
.LVL5404:
.LBB12662:
.LBB12657:
	.loc 27 841 0
	movl	%edx, 8(%eax)
.LBE12657:
.LBE12662:
.LBB12663:
.LBB12660:
	.loc 27 802 0
	movl	$1, %edx
	testb	$1, %cl
	cmove	%esi, %edx
.LVL5405:
.LBE12660:
.LBE12663:
.LBB12664:
.LBB12665:
	.loc 27 818 0
	andl	$-2, %ecx
	.loc 27 819 0
	orl	%ecx, %edx
.LVL5406:
	movl	%edx, 12(%eax)
.LVL5407:
.L4141:
.LBE12665:
.LBE12664:
	.loc 26 611 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
.LVL5408:
	.loc 26 612 0
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
.LBE12649:
.LBE12648:
.LBE12645:
.LBE12644:
.LBE12607:
	.loc 26 770 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL5409:
	.p2align 4,,7
	.p2align 3
.L4176:
	.cfi_restore_state
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
.LVL5410:
.L4124:
.LBB12669:
.LBB12666:
.LBB12612:
	.loc 26 918 0
	andl	$-8, %edx
.LVL5411:
	.loc 26 919 0
	movl	$1, %ecx
	.loc 26 918 0
	je	.L4125
.LVL5412:
.LBB12611:
	.loc 26 924 0
	movl	(%edx), %eax
	movl	4(%edx), %edx
.LVL5413:
	movl	%esi, (%esp)
	movl	%edi, 4(%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	call	sameObjectAs
.LVL5414:
	xorl	%ecx, %ecx
	testl	%eax, %eax
	sete	%cl
	jmp	.L4125
.LVL5415:
	.p2align 4,,7
	.p2align 3
.L4172:
.LBE12611:
.LBE12612:
.LBE12666:
.LBB12667:
.LBB12641:
.LBB12636:
.LBB12637:
	.loc 26 632 0
	movl	$__func__.6546, 12(%esp)
	movl	$632, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC243, (%esp)
	call	_fail
.LVL5416:
	.p2align 4,,7
	.p2align 3
.L4178:
.LBE12637:
.LBE12636:
.LBB12638:
.LBB12634:
.LBB12630:
	.loc 40 100 0
	movl	%esi, %eax
	movl	$-16, %edx
	andl	$15, %eax
.LVL5417:
	jmp	.L4143
.LVL5418:
.L4135:
.LBE12630:
.LBE12634:
.LBE12638:
.LBE12641:
.LBE12667:
.LBE12669:
.LBB12670:
.LBB12671:
.LBB12672:
	.loc 26 766 0
	movl	$__FUNCTION__.6583, 12(%esp)
	movl	$767, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC244, (%esp)
	call	_assert_fail
.LVL5419:
.L4177:
.LBE12672:
.LBE12671:
.LBE12670:
.LBB12673:
.LBB12668:
.LBB12642:
.LBB12639:
.LBB12635:
.LBB12631:
.LBB12629:
.LBB12628:
.LBB12627:
.LBB12626:
	call	cap_zombie_cap_get_capZombieType.isra.94.part.95
.LVL5420:
.LBE12626:
.LBE12627:
.LBE12628:
.LBE12629:
.LBE12631:
.LBE12635:
.LBE12639:
.LBE12642:
.LBE12668:
.LBE12673:
	.cfi_endproc
.LFE524:
	.size	cteDeleteOne, .-cteDeleteOne
	.section	.text.unlikely
	.type	doReplyTransfer.part.211, @function
doReplyTransfer.part.211:
.LFB851:
	.loc 22 129 0
	.cfi_startproc
.LVL5421:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	movl	%eax, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	%edx, %ebx
	subl	$20, %esp
	.cfi_def_cfa_offset 32
.LBB12693:
	.loc 22 142 0
	movl	%ecx, (%esp)
	call	cteDeleteOne
.LVL5422:
	.loc 22 143 0
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	handleFaultReply
.LVL5423:
.LBB12694:
.LBB12695:
	.loc 27 1938 0
	movl	$0, 604(%ebx)
	.loc 27 1939 0
	movl	$0, 608(%ebx)
.LBE12695:
.LBE12694:
	.loc 22 145 0
	testl	%eax, %eax
	je	.L4180
.LVL5424:
.LBB12696:
.LBB12697:
	.loc 22 427 0
	leal	592(%ebx), %eax
.LVL5425:
	call	thread_state_ptr_set_tsType.isra.166.constprop.286
.LVL5426:
	.loc 22 428 0
	movl	%ebx, (%esp)
	call	scheduleTCB
.LVL5427:
.LBE12697:
.LBE12696:
.LBE12693:
	.loc 22 152 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB12708:
.LBB12698:
.LBB12699:
	.loc 22 415 0
	movl	%ebx, %eax
.LBE12699:
.LBE12698:
.LBE12708:
	.loc 22 152 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL5428:
.LBB12709:
.LBB12702:
.LBB12700:
	.loc 22 415 0
	movl	$1, %edx
.LBE12700:
.LBE12702:
.LBE12709:
	.loc 22 152 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL5429:
.LBB12710:
.LBB12703:
.LBB12701:
	.loc 22 415 0
	jmp	possibleSwitchTo
.LVL5430:
.L4180:
	.cfi_restore_state
.LBE12701:
.LBE12703:
.LBB12704:
.LBB12705:
.LBB12706:
.LBB12707:
	.loc 27 626 0
	andl	$-16, 592(%ebx)
.LBE12707:
.LBE12706:
	.loc 22 428 0
	movl	%ebx, (%esp)
	call	scheduleTCB
.LVL5431:
.LBE12705:
.LBE12704:
.LBE12710:
	.loc 22 152 0
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL5432:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL5433:
	ret
	.cfi_endproc
.LFE851:
	.size	doReplyTransfer.part.211, .-doReplyTransfer.part.211
	.section	.rodata.str1.4
	.align 4
.LC245:
	.string	"thread_state_get_tsType(receiver->tcbState) == ThreadState_BlockedOnReply"
	.text
	.p2align 4,,15
	.globl	doReplyTransfer
	.type	doReplyTransfer, @function
doReplyTransfer:
.LFB470:
	.loc 22 130 0
	.cfi_startproc
.LVL5434:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 22 130 0
	movl	68(%esp), %ebx
	movl	64(%esp), %esi
	movl	72(%esp), %edi
.LBB12741:
.LBB12742:
	.loc 27 614 0
	movl	592(%ebx), %edx
	andl	$15, %edx
.LBE12742:
.LBE12741:
	.loc 22 131 0
	cmpl	$5, %edx
	jne	.L4188
	.loc 22 134 0
	testb	$7, 604(%ebx)
	jne	.L4184
.LVL5435:
.LBB12743:
.LBB12744:
	.loc 22 117 0
	movl	%ebx, 4(%esp)
	movl	$1, (%esp)
	call	lookupIPCBuffer
.LVL5436:
	.loc 22 119 0
	testb	$7, 604(%esi)
	.loc 22 117 0
	movl	%eax, %ebp
.LVL5437:
	.loc 22 119 0
	jne	.L4185
	.loc 22 120 0
	movl	%esi, 4(%esp)
	movl	$0, (%esp)
	call	lookupIPCBuffer
.LVL5438:
	.loc 22 121 0
	movl	$0, 28(%esp)
	movl	%ebp, 24(%esp)
	movl	%ebx, 20(%esp)
	movl	$1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	doNormalTransfer
.LVL5439:
.L4186:
.LBE12744:
.LBE12743:
	.loc 22 136 0
	movl	%edi, (%esp)
	call	cteDeleteOne
.LVL5440:
.LBB12746:
.LBB12747:
.LBB12748:
	.loc 27 626 0
	movl	592(%ebx), %eax
.LBE12748:
.LBE12747:
.LBE12746:
.LBB12751:
.LBB12752:
	.loc 22 415 0
	movl	$1, %edx
.LBE12752:
.LBE12751:
.LBB12755:
.LBB12750:
.LBB12749:
	.loc 27 626 0
	andl	$-16, %eax
	.loc 27 627 0
	orl	$1, %eax
	movl	%eax, 592(%ebx)
.LVL5441:
.LBE12749:
.LBE12750:
.LBE12755:
	.loc 22 152 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LBB12756:
.LBB12753:
	.loc 22 415 0
	movl	%ebx, %eax
.LBE12753:
.LBE12756:
	.loc 22 152 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5442:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5443:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL5444:
.LBB12757:
.LBB12754:
	.loc 22 415 0
	jmp	possibleSwitchTo
.LVL5445:
.L4188:
	.cfi_restore_state
.LBE12754:
.LBE12757:
	.loc 22 131 0 discriminator 1
	movl	$__FUNCTION__.6130, 12(%esp)
	movl	$132, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$.LC245, (%esp)
	call	_assert_fail
.LVL5446:
.L4185:
.LBB12758:
.LBB12745:
	.loc 22 124 0
	movl	%eax, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%esi, 4(%esp)
	movl	$0, (%esp)
	call	doFaultTransfer
.LVL5447:
	jmp	.L4186
.LVL5448:
.L4184:
.LBE12745:
.LBE12758:
	.loc 22 152 0
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	movl	%edi, %ecx
	movl	%ebx, %edx
	movl	%esi, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	jmp	doReplyTransfer.part.211
.LVL5449:
	.cfi_endproc
.LFE470:
	.size	doReplyTransfer, .-doReplyTransfer
	.section	.rodata.str1.4
	.align 4
.LC246:
	.string	"/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/api/syscall.c"
	.section	.rodata.str1.1
.LC247:
	.string	"caller != ksCurThread"
	.section	.rodata.str1.4
	.align 4
.LC248:
	.string	"Attempted reply operation when no reply cap present."
	.align 4
.LC249:
	.string	"handleReply: invalid caller cap"
	.text
	.p2align 4,,15
	.type	handleReply, @function
handleReply:
.LFB263:
	.loc 52 246 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 52 250 0
	movl	ksCurThread, %edx
	movl	%edx, %eax
	andl	$-1024, %eax
	leal	48(%eax), %esi
.LVL5450:
	.loc 52 251 0
	movl	48(%eax), %eax
	movl	4(%esi), %edi
.LVL5451:
.LBB12759:
.LBB12760:
	.loc 27 872 0
	movl	%eax, %ebp
	.loc 27 873 0
	movl	%eax, %ebx
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %ebx
	movzbl	%al, %ecx
	cmpl	$14, %ebp
	cmovne	%ebx, %ecx
.LBE12760:
.LBE12759:
	.loc 52 252 0
	testl	%ecx, %ecx
	je	.L4193
	cmpl	$8, %ecx
	jne	.L4192
.LVL5452:
.LBB12761:
.LBB12762:
.LBB12763:
	.loc 27 1237 0
	cmpl	$8, %ebx
	jne	.L4199
.LBE12763:
.LBE12762:
	.loc 52 256 0
	andl	$1, %edi
.LVL5453:
	.p2align 4,,2
	jne	.L4192
.LVL5454:
.LBB12765:
.LBB12766:
	.loc 27 1248 0
	andl	$-16, %eax
.LVL5455:
.LBE12766:
.LBE12765:
	.loc 52 262 0
	cmpl	%eax, %edx
	je	.L4200
	.loc 52 263 0
	movl	%esi, 8(%esp)
.LVL5456:
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	doReplyTransfer
.LVL5457:
.LBE12761:
	.loc 52 276 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5458:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5459:
	.p2align 4,,7
	.p2align 3
.L4192:
	.cfi_restore_state
	.loc 52 275 0
	movl	$__func__.3993, 12(%esp)
.LVL5460:
	movl	$275, 8(%esp)
	movl	$.LC246, 4(%esp)
	movl	$.LC249, (%esp)
	call	_fail
.LVL5461:
	.p2align 4,,7
	.p2align 3
.L4193:
	.loc 52 268 0
	movl	44(%edx), %eax
.LVL5462:
	movl	%edx, 12(%esp)
.LVL5463:
	movl	$268, 8(%esp)
	movl	$__func__.3993, 4(%esp)
	movl	%eax, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5464:
	movl	$.LC248, (%esp)
	call	printf
.LVL5465:
	movl	$.LC20, (%esp)
	call	printf
.LVL5466:
	.loc 52 276 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5467:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL5468:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5469:
.L4199:
	.cfi_restore_state
.LBB12768:
.LBB12767:
.LBB12764:
	call	cap_reply_cap_get_capReplyMaster.part.53
.LVL5470:
.L4200:
.LBE12764:
.LBE12767:
	.loc 52 262 0 discriminator 1
	movl	$__FUNCTION__.3991, 12(%esp)
.LVL5471:
	movl	$262, 8(%esp)
	movl	$.LC246, 4(%esp)
	movl	$.LC247, (%esp)
	call	_assert_fail
.LVL5472:
.LBE12768:
	.cfi_endproc
.LFE263:
	.size	handleReply, .-handleReply
	.section	.rodata.str1.4
	.align 4
.LC250:
	.string	"endpoint_ptr_get_state(epptr) != EPState_Idle"
	.text
	.p2align 4,,15
	.globl	ipcCancel
	.type	ipcCancel, @function
ipcCancel:
.LFB541:
	.loc 44 221 0
	.cfi_startproc
.LVL5473:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 44 221 0
	movl	64(%esp), %eax
.LVL5474:
	.loc 44 222 0
	movl	592(%eax), %edx
.LVL5475:
.LBB12803:
.LBB12804:
	.loc 27 619 0
	movl	%edx, %ecx
	andl	$15, %ecx
.LBE12804:
.LBE12803:
	.loc 44 224 0
	cmpl	$5, %ecx
	je	.L4203
	ja	.L4204
	cmpl	$3, %ecx
	jb	.L4201
.LVL5476:
.LBB12805:
.LBB12806:
.LBB12807:
	.loc 27 601 0
	andl	$-16, %edx
.LVL5477:
.LBE12807:
.LBE12806:
.LBE12805:
	.loc 44 228 0
	movl	(%edx), %ebx
.LVL5478:
.LBB12854:
	.loc 44 234 0
	testb	$3, %bl
	je	.L4220
.LVL5479:
.LBB12808:
.LBB12809:
.LBB12810:
.LBB12811:
	.loc 27 438 0
	movl	%ebx, %esi
.LBE12811:
.LBE12810:
.LBE12809:
.LBE12808:
.LBE12854:
	.loc 44 22 0
	movl	4(%edx), %edi
.LVL5480:
.LBB12855:
.LBB12818:
.LBB12816:
.LBB12813:
.LBB12812:
	.loc 27 438 0
	andl	$-16, %esi
	movl	%esi, 28(%esp)
.LBE12812:
.LBE12813:
.LBE12816:
.LBE12818:
.LBB12819:
.LBB12820:
	.loc 30 146 0
	movl	652(%eax), %esi
.LBE12820:
.LBE12819:
.LBB12823:
.LBB12817:
.LBB12814:
.LBB12815:
	.loc 27 425 0
	movl	%edi, %ecx
	andl	$-16, %ecx
.LVL5481:
.LBE12815:
.LBE12814:
.LBE12817:
.LBE12823:
.LBB12824:
.LBB12821:
	.loc 30 146 0
	testl	%esi, %esi
	je	.L4208
	.loc 30 147 0
	movl	648(%eax), %ebp
	movl	%ebp, 648(%esi)
	movl	648(%eax), %ebp
.LVL5482:
.L4209:
	.loc 30 152 0
	testl	%ebp, %ebp
	je	.L4214
	.loc 30 153 0
	movl	%esi, 652(%ebp)
.LVL5483:
.L4210:
.LBE12821:
.LBE12824:
.LBB12825:
.LBB12826:
.LBB12827:
.LBB12828:
	.loc 27 431 0
	testb	$15, %cl
	jne	.L4221
	.loc 27 433 0
	movl	%ecx, %esi
	.loc 27 432 0
	andl	$15, %edi
.LVL5484:
	.loc 27 433 0
	andl	$-16, %esi
	orl	%edi, %esi
.LBE12828:
.LBE12827:
.LBB12831:
.LBB12832:
	.loc 27 444 0
	testb	$15, 28(%esp)
.LBE12832:
.LBE12831:
.LBB12836:
.LBB12829:
	.loc 27 433 0
	movl	%esi, 4(%edx)
.LVL5485:
.LBE12829:
.LBE12836:
.LBB12837:
.LBB12833:
	.loc 27 444 0
	jne	.L4222
	.loc 27 446 0
	movl	28(%esp), %esi
	.loc 27 445 0
	andl	$15, %ebx
.LVL5486:
	.loc 27 446 0
	andl	$-16, %esi
	orl	%ebx, %esi
.LBE12833:
.LBE12837:
.LBE12826:
.LBE12825:
	.loc 44 241 0
	testl	%ecx, %ecx
.LBB12843:
.LBB12841:
.LBB12838:
.LBB12834:
	.loc 27 446 0
	movl	%esi, (%edx)
.LVL5487:
.LBE12834:
.LBE12838:
.LBE12841:
.LBE12843:
	.loc 44 241 0
	je	.L4223
.L4213:
.LVL5488:
.LBB12844:
.LBB12845:
.LBB12846:
.LBB12847:
	.loc 27 626 0
	andl	$-16, 592(%eax)
.LBE12847:
.LBE12846:
	.loc 22 428 0
	movl	%eax, 64(%esp)
.LVL5489:
.LBE12845:
.LBE12844:
.LBE12855:
	.loc 44 270 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LBB12856:
.LBB12849:
.LBB12848:
	.loc 22 428 0
	jmp	scheduleTCB
.LVL5490:
	.p2align 4,,7
	.p2align 3
.L4204:
	.cfi_restore_state
.LBE12848:
.LBE12849:
.LBE12856:
	.loc 44 224 0
	cmpl	$6, %ecx
	jne	.L4201
.LVL5491:
.LBB12857:
.LBB12858:
	.loc 27 601 0
	andl	$-16, %edx
.LBE12858:
.LBE12857:
	.loc 44 250 0
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	asyncIPCCancel
.LVL5492:
.L4201:
	.loc 44 270 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5493:
	.p2align 4,,7
	.p2align 3
.L4203:
	.cfi_restore_state
.LBB12859:
.LBB12860:
.LBB12861:
	.loc 27 1938 0
	movl	$0, 604(%eax)
	.loc 27 1939 0
	movl	$0, 608(%eax)
.LVL5494:
.LBE12861:
.LBE12860:
	.loc 44 260 0
	andl	$-1024, %eax
.LVL5495:
.LBB12862:
.LBB12863:
	.loc 27 767 0
	movl	44(%eax), %eax
.LVL5496:
.LBE12863:
.LBE12862:
	.loc 44 263 0
	andl	$-8, %eax
.LVL5497:
	je	.L4201
	.loc 44 264 0
	movl	%eax, 64(%esp)
.LVL5498:
.LBE12859:
	.loc 44 270 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LBB12864:
	.loc 44 264 0
	jmp	cteDeleteOne
.LVL5499:
	.p2align 4,,7
	.p2align 3
.L4214:
	.cfi_restore_state
.LBE12864:
.LBB12865:
.LBB12850:
.LBB12822:
	.loc 30 146 0
	movl	%esi, 28(%esp)
.LVL5500:
	jmp	.L4210
.LVL5501:
	.p2align 4,,7
	.p2align 3
.L4208:
	.loc 30 149 0
	movl	648(%eax), %ecx
.LVL5502:
	movl	%ecx, %ebp
	jmp	.L4209
.LVL5503:
	.p2align 4,,7
	.p2align 3
.L4223:
.LBE12822:
.LBE12850:
.LBB12851:
.LBB12852:
	.loc 27 458 0
	andl	$-4, %esi
	movl	%esi, (%edx)
	jmp	.L4213
.LVL5504:
.L4220:
.LBE12852:
.LBE12851:
	.loc 44 234 0 discriminator 1
	movl	$__FUNCTION__.6703, 12(%esp)
	movl	$234, 8(%esp)
	movl	$.LC110, 4(%esp)
	movl	$.LC250, (%esp)
	call	_assert_fail
.LVL5505:
.L4221:
.LBB12853:
.LBB12842:
.LBB12839:
.LBB12830:
	call	endpoint_ptr_set_epQueue_head.isra.185.part.186
.LVL5506:
.L4222:
.LBE12830:
.LBE12839:
.LBB12840:
.LBB12835:
	call	endpoint_ptr_set_epQueue_tail.isra.187.part.188
.LVL5507:
.LBE12835:
.LBE12840:
.LBE12842:
.LBE12853:
.LBE12865:
	.cfi_endproc
.LFE541:
	.size	ipcCancel, .-ipcCancel
	.p2align 4,,15
	.globl	suspend
	.type	suspend, @function
suspend:
.LFB467:
	.loc 22 93 0
	.cfi_startproc
.LVL5508:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 22 93 0
	movl	48(%esp), %ebx
	.loc 22 94 0
	movl	%ebx, (%esp)
	call	ipcCancel
.LVL5509:
.LBB12891:
.LBB12892:
.LBB12893:
	.loc 27 626 0
	andl	$-16, 592(%ebx)
.LVL5510:
.LBE12893:
.LBE12892:
.LBB12894:
.LBB12895:
	.loc 22 434 0
	cmpl	ksCurThread, %ebx
	je	.L4235
.L4225:
.LVL5511:
.LBE12895:
.LBE12894:
.LBE12891:
.LBB12900:
.LBB12901:
	.loc 30 97 0
	movl	600(%ebx), %edx
	testb	$1, %dl
	jne	.L4236
.LBE12901:
.LBE12900:
	.loc 22 97 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5512:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5513:
	.p2align 4,,7
	.p2align 3
.L4236:
	.cfi_restore_state
.LBB12914:
.LBB12912:
.LBB12902:
.LBB12903:
.LBB12904:
.LBB12905:
	.loc 30 30 0
	movl	620(%ebx), %eax
	sall	$8, %eax
	addl	624(%ebx), %eax
.LBE12905:
.LBE12904:
	.loc 30 106 0
	leal	ksReadyQueues(,%eax,8), %esi
	movl	ksReadyQueues(,%eax,8), %ebp
.LVL5514:
	movl	4(%esi), %ecx
	movl	%ecx, 12(%esp)
.LVL5515:
	.loc 30 108 0
	movl	644(%ebx), %ecx
.LVL5516:
	testl	%ecx, %ecx
	je	.L4227
	.loc 30 109 0
	movl	640(%ebx), %edi
	movl	%edi, 640(%ecx)
.LVL5517:
	movl	640(%ebx), %edi
.L4228:
	.loc 30 114 0
	testl	%edi, %edi
	je	.L4230
	.loc 30 115 0
	movl	%ecx, 644(%edi)
.LVL5518:
.L4229:
	.loc 30 120 0
	movl	%ebp, ksReadyQueues(,%eax,8)
.LVL5519:
	movl	12(%esp), %eax
.LBB12906:
.LBB12907:
	.loc 27 577 0
	andl	$-2, %edx
.LBE12907:
.LBE12906:
	.loc 30 120 0
	movl	%eax, 4(%esi)
.LVL5520:
.LBB12909:
.LBB12908:
	.loc 27 577 0
	movl	%edx, 600(%ebx)
.LBE12908:
.LBE12909:
.LBE12903:
.LBE12902:
.LBE12912:
.LBE12914:
	.loc 22 97 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5521:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL5522:
	ret
.LVL5523:
	.p2align 4,,7
	.p2align 3
.L4235:
	.cfi_restore_state
.LBB12915:
.LBB12899:
.LBB12898:
	.loc 22 434 0
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L4225
.LVL5524:
.LBB12896:
.LBB12897:
	.loc 22 437 0
	call	rescheduleRequired
.LVL5525:
	jmp	.L4225
.LVL5526:
	.p2align 4,,7
	.p2align 3
.L4230:
.LBE12897:
.LBE12896:
.LBE12898:
.LBE12899:
.LBE12915:
.LBB12916:
.LBB12913:
.LBB12911:
.LBB12910:
	.loc 30 108 0
	movl	%ecx, 12(%esp)
.LVL5527:
	.p2align 4,,4
	jmp	.L4229
.LVL5528:
	.p2align 4,,7
	.p2align 3
.L4227:
	.loc 30 111 0
	movl	640(%ebx), %ebp
.LVL5529:
	movl	%ebp, %edi
	jmp	.L4228
.LBE12910:
.LBE12911:
.LBE12913:
.LBE12916:
	.cfi_endproc
.LFE467:
	.size	suspend, .-suspend
	.p2align 4,,15
	.globl	invokeTCB_Suspend
	.type	invokeTCB_Suspend, @function
invokeTCB_Suspend:
.LFB592:
	.loc 30 766 0
	.cfi_startproc
.LVL5530:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 30 767 0
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	suspend
.LVL5531:
	.loc 30 769 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE592:
	.size	invokeTCB_Suspend, .-invokeTCB_Suspend
	.p2align 4,,15
	.globl	invokeTCB_ReadRegisters
	.type	invokeTCB_ReadRegisters, @function
invokeTCB_ReadRegisters:
.LFB596:
	.loc 30 894 0
	.cfi_startproc
.LVL5532:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 30 899 0
	movl	ksCurThread, %ebx
.LVL5533:
	.loc 30 901 0
	movl	36(%esp), %edx
	.loc 30 894 0
	movl	32(%esp), %edi
	movl	40(%esp), %esi
	.loc 30 901 0
	testl	%edx, %edx
	jne	.L4276
.LVL5534:
.L4240:
	.loc 30 910 0
	movl	48(%esp), %eax
	testl	%eax, %eax
	je	.L4241
.LBB12944:
	.loc 30 913 0
	movl	%ebx, 4(%esp)
	movl	$1, (%esp)
	call	lookupIPCBuffer
.LVL5535:
	.loc 30 917 0
	testl	%esi, %esi
.LBB12945:
.LBB12946:
	.loc 13 21 0
	movl	$0, 4(%ebx)
.LVL5536:
.LBE12946:
.LBE12945:
	.loc 30 917 0
	je	.L4248
.LVL5537:
.LBB12947:
.LBB12948:
	.loc 13 21 0
	movl	44(%edi), %edx
.LBE12948:
.LBE12947:
	.loc 30 917 0
	cmpl	$1, %esi
.LBB12952:
.LBB12949:
	.loc 13 21 0
	movl	%edx, 20(%ebx)
.LVL5538:
.LBE12949:
.LBE12952:
	.loc 30 917 0
	jbe	.L4249
.LVL5539:
.LBB12953:
.LBB12950:
	.loc 13 21 0
	movl	68(%edi), %edx
.LBE12950:
.LBE12953:
	.loc 30 922 0
	testl	%eax, %eax
.LBB12954:
.LBB12951:
	.loc 13 21 0
	movl	%edx, 24(%ebx)
.LVL5540:
.LBE12951:
.LBE12954:
	.loc 30 922 0
	je	.L4250
	cmpl	$2, %esi
	jbe	.L4250
.LVL5541:
.LBB12955:
.LBB12956:
	.loc 13 27 0
	movl	64(%edi), %edx
.LVL5542:
.LBE12956:
.LBE12955:
	.loc 30 923 0
	cmpl	$3, %esi
	.loc 30 924 0
	movl	%edx, 12(%eax)
.LVL5543:
	.loc 30 923 0
	jbe	.L4251
.LVL5544:
.LBB12964:
.LBB12957:
	.loc 13 27 0
	movl	(%edi), %edx
.LBE12957:
.LBE12964:
	.loc 30 923 0
	cmpl	$4, %esi
	.loc 30 924 0
	movl	%edx, 16(%eax)
.LVL5545:
	.loc 30 923 0
	jbe	.L4252
.LVL5546:
.LBB12965:
.LBB12958:
	.loc 13 27 0
	movl	4(%edi), %edx
.LBE12958:
.LBE12965:
	.loc 30 923 0
	cmpl	$5, %esi
	.loc 30 924 0
	movl	%edx, 20(%eax)
.LVL5547:
	.loc 30 923 0
	jbe	.L4253
.LVL5548:
.LBB12966:
.LBB12959:
	.loc 13 27 0
	movl	8(%edi), %edx
.LBE12959:
.LBE12966:
	.loc 30 923 0
	cmpl	$6, %esi
	.loc 30 924 0
	movl	%edx, 24(%eax)
.LVL5549:
	.loc 30 923 0
	jbe	.L4254
.LVL5550:
.LBB12967:
.LBB12960:
	.loc 13 27 0
	movl	12(%edi), %edx
.LBE12960:
.LBE12967:
	.loc 30 923 0
	cmpl	$7, %esi
	.loc 30 924 0
	movl	%edx, 28(%eax)
.LVL5551:
	.loc 30 923 0
	jbe	.L4255
.LVL5552:
.LBB12968:
.LBB12961:
	.loc 13 27 0
	movl	16(%edi), %edx
.LBE12961:
.LBE12968:
	.loc 30 923 0
	cmpl	$8, %esi
	.loc 30 924 0
	movl	%edx, 32(%eax)
.LVL5553:
	.loc 30 923 0
	jbe	.L4256
.LVL5554:
.LBB12969:
.LBB12962:
	.loc 13 27 0
	movl	20(%edi), %edx
.LBE12962:
.LBE12969:
	.loc 30 923 0
	cmpl	$9, %esi
	.loc 30 924 0
	movl	%edx, 36(%eax)
.LVL5555:
	.loc 30 923 0
	jbe	.L4257
.LVL5556:
.LBB12970:
.LBB12963:
	.loc 13 27 0 discriminator 2
	movl	24(%edi), %edx
.LBE12963:
.LBE12970:
	.loc 30 924 0 discriminator 2
	movl	$10, %ecx
	movl	%edx, 40(%eax)
.LVL5557:
	jmp	.L4245
.LVL5558:
	.p2align 4,,7
	.p2align 3
.L4250:
	.loc 30 917 0
	movl	$2, %ecx
.LVL5559:
.L4243:
	.loc 30 936 0
	testl	%eax, %eax
	je	.L4258
.LVL5560:
.L4245:
	xorl	%edx, %edx
	.loc 30 937 0
	cmpl	$10, %esi
	jbe	.L4246
.LVL5561:
.LBB12971:
.LBB12972:
	.loc 13 27 0
	movl	48(%edi), %edx
.LBE12972:
.LBE12971:
	.loc 30 938 0
	cmpl	$11, %esi
	.loc 30 939 0
	movl	%edx, 44(%eax)
.LVL5562:
	.loc 30 938 0
	je	.L4260
.LVL5563:
.LBB12975:
.LBB12973:
	.loc 13 27 0
	movl	36(%edi), %edx
.LBE12973:
.LBE12975:
	.loc 30 938 0
	cmpl	$12, %esi
	.loc 30 939 0
	movl	%edx, 48(%eax)
.LVL5564:
	.loc 30 938 0
	je	.L4261
.LVL5565:
.LBB12976:
.LBB12974:
	.loc 13 27 0
	movl	40(%edi), %edx
.LBE12974:
.LBE12976:
	.loc 30 939 0
	movl	%edx, 52(%eax)
.LVL5566:
	.loc 30 938 0
	movl	$3, %edx
.LVL5567:
.L4246:
	.loc 30 944 0
	addl	%ecx, %edx
.LVL5568:
.LBB12977:
.LBB12978:
	.loc 13 21 0
	movl	%edx, 16(%ebx)
.LVL5569:
.L4241:
.LBE12978:
.LBE12977:
.LBE12944:
.LBB12979:
.LBB12980:
.LBB12981:
	.loc 27 626 0
	movl	592(%ebx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$1, %eax
	movl	%eax, 592(%ebx)
.LVL5570:
.LBE12981:
.LBE12980:
.LBE12979:
	.loc 30 950 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL5571:
	ret
.LVL5572:
	.p2align 4,,7
	.p2align 3
.L4276:
	.cfi_restore_state
	.loc 30 902 0
	movl	%edi, (%esp)
	call	suspend
.LVL5573:
	jmp	.L4240
.LVL5574:
	.p2align 4,,7
	.p2align 3
.L4258:
.LBB12982:
	xorl	%edx, %edx
	jmp	.L4246
.LVL5575:
	.p2align 4,,7
	.p2align 3
.L4248:
	.loc 30 917 0
	xorl	%ecx, %ecx
	.p2align 4,,7
	jmp	.L4243
.LVL5576:
	.p2align 4,,7
	.p2align 3
.L4249:
	movl	$1, %ecx
	.p2align 4,,2
	jmp	.L4243
.LVL5577:
	.p2align 4,,7
	.p2align 3
.L4257:
	.loc 30 924 0
	movl	$9, %ecx
.LVL5578:
	jmp	.L4245
.LVL5579:
	.p2align 4,,7
	.p2align 3
.L4256:
	movl	$8, %ecx
	jmp	.L4245
.LVL5580:
	.p2align 4,,7
	.p2align 3
.L4251:
	movl	$3, %ecx
	jmp	.L4245
.LVL5581:
	.p2align 4,,7
	.p2align 3
.L4255:
	movl	$7, %ecx
	jmp	.L4245
.LVL5582:
	.p2align 4,,7
	.p2align 3
.L4254:
	movl	$6, %ecx
	jmp	.L4245
.LVL5583:
	.p2align 4,,7
	.p2align 3
.L4253:
	movl	$5, %ecx
	jmp	.L4245
.LVL5584:
	.p2align 4,,7
	.p2align 3
.L4252:
	movl	$4, %ecx
	jmp	.L4245
.LVL5585:
	.p2align 4,,7
	.p2align 3
.L4260:
	.loc 30 938 0
	movl	$1, %edx
	jmp	.L4246
.LVL5586:
	.p2align 4,,7
	.p2align 3
.L4261:
	movl	$2, %edx
	jmp	.L4246
.LBE12982:
	.cfi_endproc
.LFE596:
	.size	invokeTCB_ReadRegisters, .-invokeTCB_ReadRegisters
	.section	.rodata.str1.4
	.align 4
.LC251:
	.string	"TCB ReadRegisters: Truncated message."
	.align 4
.LC252:
	.string	"TCB ReadRegisters: Attempted to read an invalid number of registers (%d)."
	.align 4
.LC253:
	.string	"TCB ReadRegisters: Attempted to read our own registers."
	.text
	.p2align 4,,15
	.globl	decodeReadRegisters
	.type	decodeReadRegisters, @function
decodeReadRegisters:
.LFB585:
	.loc 30 369 0
	.cfi_startproc
.LVL5587:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 30 374 0
	movl	ksCurThread, %eax
	.loc 30 373 0
	cmpl	$1, 72(%esp)
	.loc 30 369 0
	movl	64(%esp), %edx
.LVL5588:
	movl	76(%esp), %esi
	.loc 30 373 0
	jbe	.L4284
.LVL5589:
.LBB13008:
.LBB13009:
.LBB13010:
.LBB13011:
	.loc 13 27 0
	movl	24(%eax), %ebx
.LBE13011:
.LBE13010:
.LBE13009:
.LBE13008:
.LBB13012:
.LBB13013:
.LBB13014:
.LBB13015:
	movl	20(%eax), %edi
.LVL5590:
.LBE13015:
.LBE13014:
.LBE13013:
.LBE13012:
	.loc 30 382 0
	leal	-1(%ebx), %ecx
	cmpl	$12, %ecx
	ja	.L4285
.LVL5591:
.LBB13016:
.LBB13017:
	.loc 27 1359 0
	movl	%edx, %ecx
.LVL5592:
	andl	$15, %ecx
	cmpl	$12, %ecx
	jne	.L4286
	.loc 27 1362 0
	andl	$-16, %edx
.LVL5593:
.LBE13017:
.LBE13016:
	.loc 30 395 0
	cmpl	%eax, %edx
.LBB13020:
.LBB13018:
	.loc 27 1362 0
	movl	%edx, %ebp
.LVL5594:
.LBE13018:
.LBE13020:
	.loc 30 395 0
	je	.L4287
.LVL5595:
.LBB13021:
.LBB13022:
.LBB13023:
.LBB13024:
	.loc 27 626 0
	movl	592(%eax), %edx
.LVL5596:
.LBE13024:
.LBE13023:
.LBE13022:
.LBE13021:
	.loc 30 402 0
	andl	$1, %edi
.LBB13028:
.LBB13027:
.LBB13026:
.LBB13025:
	.loc 27 626 0
	andl	$-16, %edx
	.loc 27 627 0
	orl	$2, %edx
	movl	%edx, 592(%eax)
.LBE13025:
.LBE13026:
	.loc 22 428 0
	movl	%eax, (%esp)
	call	scheduleTCB
.LVL5597:
.LBE13027:
.LBE13028:
	.loc 30 402 0
	movl	%esi, 80(%esp)
.LVL5598:
	movl	%ebx, 72(%esp)
	movl	%edi, 68(%esp)
	movl	%ebp, 64(%esp)
.LVL5599:
	movl	$0, 76(%esp)
	.loc 30 406 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL5600:
	.loc 30 402 0
	jmp	invokeTCB_ReadRegisters
.LVL5601:
	.p2align 4,,7
	.p2align 3
.L4285:
	.cfi_restore_state
	.loc 30 383 0
	movl	44(%eax), %edx
.LVL5602:
	movl	%eax, 12(%esp)
	movl	$384, 8(%esp)
	movl	$__func__.7138, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5603:
	.loc 30 383 0
	movl	%ebx, 4(%esp)
	movl	$.LC252, (%esp)
	call	printf
.LVL5604:
	movl	$.LC20, (%esp)
	call	printf
.LVL5605:
	.loc 30 406 0
	movl	$3, %eax
	.loc 30 385 0
	movl	$4, current_syscall_error+24
	.loc 30 386 0
	movl	$1, current_syscall_error+8
	.loc 30 387 0
	movl	$13, current_syscall_error+12
	.loc 30 406 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5606:
	.p2align 4,,7
	.p2align 3
.L4284:
	.cfi_restore_state
	.loc 30 374 0
	movl	44(%eax), %edx
.LVL5607:
	movl	%eax, 12(%esp)
	movl	$374, 8(%esp)
	movl	$__func__.7138, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5608:
	movl	$.LC251, (%esp)
	call	printf
.LVL5609:
	movl	$.LC20, (%esp)
	call	printf
.LVL5610:
	.loc 30 406 0
	movl	$3, %eax
	.loc 30 375 0
	movl	$7, current_syscall_error+24
	.loc 30 406 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5611:
	.p2align 4,,7
	.p2align 3
.L4287:
	.cfi_restore_state
	.loc 30 396 0
	movl	44(%edx), %eax
.LVL5612:
	movl	%edx, 12(%esp)
	movl	$396, 8(%esp)
	movl	$__func__.7138, 4(%esp)
	movl	%eax, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5613:
	movl	$.LC253, (%esp)
	call	printf
.LVL5614:
	movl	$.LC20, (%esp)
	call	printf
.LVL5615:
	.loc 30 406 0
	movl	$3, %eax
	.loc 30 397 0
	movl	$3, current_syscall_error+24
	.loc 30 406 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL5616:
	ret
.LVL5617:
.L4286:
	.cfi_restore_state
.LBB13029:
.LBB13019:
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL5618:
.LBE13019:
.LBE13029:
	.cfi_endproc
.LFE585:
	.size	decodeReadRegisters, .-decodeReadRegisters
	.p2align 4,,15
	.globl	restart
	.type	restart, @function
restart:
.LFB468:
	.loc 22 101 0
	.cfi_startproc
.LVL5619:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 22 101 0
	movl	32(%esp), %ebx
.LVL5620:
.LBB13083:
.LBB13084:
.LBB13085:
.LBB13086:
	.loc 27 614 0
	movl	592(%ebx), %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	ja	.L4288
	movl	$1, %eax
	sall	%cl, %eax
	testb	$121, %al
	jne	.L4290
.L4288:
.LBE13086:
.LBE13085:
.LBE13084:
.LBE13083:
	.loc 22 109 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5621:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5622:
	.p2align 4,,7
	.p2align 3
.L4290:
	.cfi_restore_state
.LBB13087:
.LBB13088:
	.loc 22 103 0
	movl	%ebx, (%esp)
	call	ipcCancel
.LVL5623:
.LBB13089:
.LBB13090:
	.loc 26 819 0
	movl	%ebx, %ecx
	andl	$-1024, %ecx
	.loc 26 820 0
	movl	32(%ecx), %edx
	.loc 26 819 0
	leal	32(%ecx), %esi
.LVL5624:
.LBB13091:
.LBB13092:
	.loc 27 872 0
	movl	%edx, %edi
	.loc 27 874 0
	movzbl	%dl, %eax
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 874 0
	andl	$15, %edx
.LVL5625:
	cmpl	$14, %edi
	cmovne	%edx, %eax
.LBE13092:
.LBE13091:
	.loc 26 820 0
	testl	%eax, %eax
	je	.L4301
.LVL5626:
.L4292:
.LBE13090:
.LBE13089:
.LBB13101:
.LBB13102:
.LBB13103:
	.loc 27 626 0
	movl	592(%ebx), %eax
.LBE13103:
.LBE13102:
.LBE13101:
.LBB13108:
.LBB13109:
	.loc 30 37 0
	movl	600(%ebx), %edx
.LBE13109:
.LBE13108:
.LBB13127:
.LBB13106:
.LBB13104:
	.loc 27 626 0
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
.LBE13104:
.LBE13106:
.LBE13127:
.LBB13128:
.LBB13122:
	.loc 30 37 0
	testb	$1, %dl
.LBE13122:
.LBE13128:
.LBB13129:
.LBB13107:
.LBB13105:
	.loc 27 627 0
	movl	%eax, 592(%ebx)
.LVL5627:
.LBE13105:
.LBE13107:
.LBE13129:
.LBB13130:
.LBB13123:
	.loc 30 37 0
	je	.L4302
.LVL5628:
.LBE13123:
.LBE13130:
.LBE13088:
.LBE13087:
	.loc 22 109 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
.LBB13153:
.LBB13148:
.LBB13131:
.LBB13132:
	.loc 22 421 0
	movl	%ebx, %eax
.LBE13132:
.LBE13131:
.LBE13148:
.LBE13153:
	.loc 22 109 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5629:
.LBB13154:
.LBB13149:
.LBB13138:
.LBB13133:
	.loc 22 421 0
	xorl	%edx, %edx
.LBE13133:
.LBE13138:
.LBE13149:
.LBE13154:
	.loc 22 109 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL5630:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LBB13155:
.LBB13150:
.LBB13139:
.LBB13134:
	.loc 22 421 0
	jmp	possibleSwitchTo
.LVL5631:
	.p2align 4,,7
	.p2align 3
.L4301:
	.cfi_restore_state
.LBE13134:
.LBE13139:
.LBB13140:
.LBB13099:
.LBB13093:
.LBB13094:
	.loc 27 1205 0
	testb	$15, %bl
	jne	.L4303
.LVL5632:
	.loc 27 1207 0
	movl	%ebx, %eax
	andl	$-16, %eax
	.loc 27 1211 0
	orl	$8, %eax
.LVL5633:
	movl	%eax, 32(%ecx)
.LVL5634:
.LBE13094:
.LBE13093:
	.loc 26 823 0
	movl	$1, 4(%esi)
.LVL5635:
	.loc 26 824 0
	movl	$0, 8(%esi)
.LVL5636:
.LBB13096:
.LBB13097:
	.loc 27 819 0
	movl	$3, 12(%esi)
	jmp	.L4292
.LVL5637:
	.p2align 4,,7
	.p2align 3
.L4302:
.LBE13097:
.LBE13096:
.LBE13099:
.LBE13140:
.LBB13141:
.LBB13124:
.LBB13110:
.LBB13111:
.LBB13112:
.LBB13113:
	.loc 30 30 0
	movl	620(%ebx), %eax
	sall	$8, %eax
	addl	624(%ebx), %eax
.LBE13113:
.LBE13112:
	.loc 30 46 0
	leal	ksReadyQueues(,%eax,8), %esi
.LVL5638:
	movl	ksReadyQueues(,%eax,8), %edi
.LVL5639:
	movl	4(%esi), %ecx
.LVL5640:
	.loc 30 48 0
	testl	%ecx, %ecx
	je	.L4298
	.loc 30 51 0
	movl	%ebx, 644(%edi)
.LVL5641:
.L4295:
.LBB13114:
.LBB13115:
	.loc 27 578 0
	orl	$1, %edx
.LBE13115:
.LBE13114:
	.loc 30 53 0
	movl	$0, 644(%ebx)
	.loc 30 54 0
	movl	%edi, 640(%ebx)
.LVL5642:
	.loc 30 57 0
	movl	%ebx, ksReadyQueues(,%eax,8)
.LVL5643:
.LBE13111:
.LBE13110:
.LBE13124:
.LBE13141:
.LBB13142:
.LBB13135:
	.loc 22 421 0
	movl	%ebx, %eax
.LBE13135:
.LBE13142:
.LBB13143:
.LBB13125:
.LBB13120:
.LBB13118:
	.loc 30 57 0
	movl	%ecx, 4(%esi)
.LVL5644:
.LBB13117:
.LBB13116:
	.loc 27 578 0
	movl	%edx, 600(%ebx)
.LVL5645:
.LBE13116:
.LBE13117:
.LBE13118:
.LBE13120:
.LBE13125:
.LBE13143:
.LBE13150:
.LBE13155:
	.loc 22 109 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
.LBB13156:
.LBB13151:
.LBB13144:
.LBB13136:
	.loc 22 421 0
	xorl	%edx, %edx
.LBE13136:
.LBE13144:
.LBE13151:
.LBE13156:
	.loc 22 109 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5646:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LBB13157:
.LBB13152:
.LBB13145:
.LBB13137:
	.loc 22 421 0
	jmp	possibleSwitchTo
.LVL5647:
	.p2align 4,,7
	.p2align 3
.L4298:
	.cfi_restore_state
.LBE13137:
.LBE13145:
.LBB13146:
.LBB13126:
.LBB13121:
.LBB13119:
	.loc 30 48 0
	movl	%ebx, %ecx
.LVL5648:
	jmp	.L4295
.LVL5649:
.L4303:
.LBE13119:
.LBE13121:
.LBE13126:
.LBE13146:
.LBB13147:
.LBB13100:
.LBB13098:
.LBB13095:
	.loc 27 1205 0
	movl	$__FUNCTION__.1657, 12(%esp)
.LVL5650:
	movl	$1205, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$.LC92, (%esp)
	call	_assert_fail
.LVL5651:
.LBE13095:
.LBE13098:
.LBE13100:
.LBE13147:
.LBE13152:
.LBE13157:
	.cfi_endproc
.LFE468:
	.size	restart, .-restart
	.p2align 4,,15
	.globl	invokeTCB_CopyRegisters
	.type	invokeTCB_CopyRegisters, @function
invokeTCB_CopyRegisters:
.LFB595:
	.loc 30 849 0
	.cfi_startproc
.LVL5652:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 30 850 0
	movl	40(%esp), %eax
	.loc 30 849 0
	movl	32(%esp), %ebx
	movl	36(%esp), %esi
	.loc 30 850 0
	testl	%eax, %eax
	jne	.L4322
	.loc 30 854 0
	movl	44(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L4323
.L4306:
	.loc 30 858 0
	movl	48(%esp), %edx
	testl	%edx, %edx
	je	.L4307
.LVL5653:
.LBB13174:
.LBB13175:
.LBB13176:
	.loc 13 27 0
	movl	44(%esi), %eax
.LVL5654:
.LBE13176:
.LBE13175:
.LBB13186:
.LBB13187:
	.loc 13 21 0
	movl	%eax, 44(%ebx)
.LVL5655:
.LBE13187:
.LBE13186:
.LBB13197:
.LBB13177:
	.loc 13 27 0
	movl	68(%esi), %edx
.LVL5656:
.LBE13177:
.LBE13197:
.LBB13198:
.LBB13188:
	.loc 13 21 0
	movl	%edx, 68(%ebx)
.LVL5657:
.LBE13188:
.LBE13198:
.LBB13199:
.LBB13178:
	.loc 13 27 0
	movl	64(%esi), %edx
.LVL5658:
.LBE13178:
.LBE13199:
.LBB13200:
.LBB13189:
	.loc 13 21 0
	movl	%edx, 64(%ebx)
.LVL5659:
.LBE13189:
.LBE13200:
.LBB13201:
.LBB13179:
	.loc 13 27 0
	movl	(%esi), %edx
.LVL5660:
.LBE13179:
.LBE13201:
.LBB13202:
.LBB13190:
	.loc 13 21 0
	movl	%edx, (%ebx)
.LVL5661:
.LBE13190:
.LBE13202:
.LBB13203:
.LBB13180:
	.loc 13 27 0
	movl	4(%esi), %edx
.LVL5662:
.LBE13180:
.LBE13203:
.LBB13204:
.LBB13191:
	.loc 13 21 0
	movl	%edx, 4(%ebx)
.LVL5663:
.LBE13191:
.LBE13204:
.LBB13205:
.LBB13181:
	.loc 13 27 0
	movl	8(%esi), %edx
.LVL5664:
.LBE13181:
.LBE13205:
.LBB13206:
.LBB13192:
	.loc 13 21 0
	movl	%edx, 8(%ebx)
.LVL5665:
.LBE13192:
.LBE13206:
.LBB13207:
.LBB13182:
	.loc 13 27 0
	movl	12(%esi), %edx
.LVL5666:
.LBE13182:
.LBE13207:
.LBB13208:
.LBB13193:
	.loc 13 21 0
	movl	%edx, 12(%ebx)
.LVL5667:
.LBE13193:
.LBE13208:
.LBB13209:
.LBB13183:
	.loc 13 27 0
	movl	16(%esi), %edx
.LVL5668:
.LBE13183:
.LBE13209:
.LBB13210:
.LBB13194:
	.loc 13 21 0
	movl	%edx, 16(%ebx)
.LVL5669:
.LBE13194:
.LBE13210:
.LBB13211:
.LBB13184:
	.loc 13 27 0
	movl	20(%esi), %edx
.LVL5670:
.LBE13184:
.LBE13211:
.LBB13212:
.LBB13195:
	.loc 13 21 0
	movl	%edx, 20(%ebx)
.LVL5671:
.LBE13195:
.LBE13212:
.LBB13213:
.LBB13185:
	.loc 13 27 0
	movl	24(%esi), %edx
.LVL5672:
.LBE13185:
.LBE13213:
.LBB13214:
.LBB13215:
.LBB13216:
	.loc 13 21 0
	movl	%eax, 56(%ebx)
.LBE13216:
.LBE13215:
.LBE13214:
.LBB13217:
.LBB13196:
	movl	%edx, 24(%ebx)
.LVL5673:
.L4307:
.LBE13196:
.LBE13217:
.LBE13174:
	.loc 30 872 0
	movl	52(%esp), %eax
	testl	%eax, %eax
	je	.L4308
.LVL5674:
.LBB13218:
.LBB13219:
.LBB13220:
	.loc 13 27 0 discriminator 1
	movl	48(%esi), %eax
.LVL5675:
.LBE13220:
.LBE13219:
.LBB13223:
.LBB13224:
	.loc 13 21 0 discriminator 1
	movl	%eax, 48(%ebx)
.LVL5676:
.LBE13224:
.LBE13223:
.LBB13227:
.LBB13221:
	.loc 13 27 0 discriminator 1
	movl	36(%esi), %eax
.LVL5677:
.LBE13221:
.LBE13227:
.LBB13228:
.LBB13225:
	.loc 13 21 0 discriminator 1
	movl	%eax, 36(%ebx)
.LVL5678:
.LBE13225:
.LBE13228:
.LBB13229:
.LBB13222:
	.loc 13 27 0 discriminator 1
	movl	40(%esi), %eax
.LVL5679:
.LBE13222:
.LBE13229:
.LBB13230:
.LBB13226:
	.loc 13 21 0 discriminator 1
	movl	%eax, 40(%ebx)
.LVL5680:
.L4308:
.LBE13226:
.LBE13230:
.LBE13218:
	.loc 30 883 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL5681:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL5682:
	ret
.LVL5683:
	.p2align 4,,7
	.p2align 3
.L4322:
	.cfi_restore_state
	.loc 30 851 0
	movl	%esi, (%esp)
	call	suspend
.LVL5684:
	.loc 30 854 0
	movl	44(%esp), %ecx
	testl	%ecx, %ecx
	je	.L4306
.L4323:
	.loc 30 855 0
	movl	%ebx, (%esp)
	call	restart
.LVL5685:
	jmp	.L4306
	.cfi_endproc
.LFE595:
	.size	invokeTCB_CopyRegisters, .-invokeTCB_CopyRegisters
	.p2align 4,,15
	.globl	invokeTCB_WriteRegisters
	.type	invokeTCB_WriteRegisters, @function
invokeTCB_WriteRegisters:
.LFB597:
	.loc 30 955 0
	.cfi_startproc
.LVL5686:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	$13, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 30 955 0
	movl	56(%esp), %eax
.LVL5687:
	movl	64(%esp), %esi
	cmpl	$13, %eax
	cmovbe	%eax, %edi
.LVL5688:
	.loc 30 969 0
	testl	%edi, %edi
	je	.L4325
.LVL5689:
.LBB13253:
.LBB13254:
	.loc 41 33 0
	testl	%esi, %esi
	je	.L4352
.LBE13254:
.LBE13253:
	.loc 30 969 0
	xorl	%ecx, %ecx
.LBB13257:
.LBB13258:
	.loc 17 71 0
	xorl	%ebp, %ebp
.LVL5690:
.L4333:
.LBE13258:
.LBE13257:
	.loc 30 971 0
	movl	frameRegisters(,%ecx,4), %edx
.LVL5691:
.LBB13261:
.LBB13255:
	.loc 41 34 0
	movl	12(%esi,%ecx,4), %eax
.LBE13255:
.LBE13261:
.LBB13262:
.LBB13259:
	.loc 17 62 0
	cmpl	$16, %edx
	je	.L4353
.LVL5692:
	.loc 17 69 0
	leal	-9(%edx), %ebx
	cmpl	$1, %ebx
	ja	.L4328
	.loc 17 70 0
	movl	%eax, %ebx
	andl	$-9, %ebx
	.loc 17 71 0
	cmpl	$51, %ebx
	cmovne	%ebp, %eax
.LVL5693:
.L4328:
.LBE13259:
.LBE13262:
.LBB13263:
.LBB13264:
	.loc 13 21 0
	movl	48(%esp), %ebx
.LBE13264:
.LBE13263:
	.loc 30 969 0
	addl	$1, %ecx
.LVL5694:
	cmpl	$9, %ecx
.LBB13266:
.LBB13265:
	.loc 13 21 0
	movl	%eax, (%ebx,%edx,4)
.LBE13265:
.LBE13266:
	.loc 30 969 0
	ja	.L4332
	cmpl	%ecx, %edi
	ja	.L4333
.L4332:
.LVL5695:
	.loc 30 976 0
	cmpl	$10, %edi
	jbe	.L4325
.LVL5696:
.LBB13267:
.LBB13268:
	.loc 41 34 0
	movl	52(%esi), %eax
.LVL5697:
.LBE13268:
.LBE13267:
	.loc 30 976 0
	cmpl	$11, %edi
.LBB13271:
.LBB13272:
	.loc 13 21 0
	movl	48(%esp), %ecx
.LVL5698:
	movl	%eax, 48(%ecx)
.LVL5699:
.LBE13272:
.LBE13271:
	.loc 30 976 0
	jbe	.L4325
.LVL5700:
.LBB13276:
.LBB13269:
	.loc 41 34 0
	movl	56(%esi), %eax
.LVL5701:
.LBE13269:
.LBE13276:
.LBB13277:
.LBB13278:
	.loc 17 71 0
	xorl	%edx, %edx
.LVL5702:
	.loc 17 70 0
	movl	%eax, %ecx
	andl	$-9, %ecx
	.loc 17 71 0
	cmpl	$51, %ecx
.LBE13278:
.LBE13277:
.LBB13281:
.LBB13273:
	.loc 13 21 0
	movl	48(%esp), %ecx
.LBE13273:
.LBE13281:
.LBB13282:
.LBB13279:
	.loc 17 71 0
	cmovne	%edx, %eax
.LVL5703:
.LBE13279:
.LBE13282:
	.loc 30 976 0
	cmpl	$12, %edi
.LBB13283:
.LBB13274:
	.loc 13 21 0
	movl	%eax, 36(%ecx)
.LVL5704:
.LBE13274:
.LBE13283:
	.loc 30 976 0
	jbe	.L4325
.LBB13284:
.LBB13270:
	.loc 41 34 0
	movl	60(%esi), %eax
.LVL5705:
	movl	%ecx, %edi
.LVL5706:
.LBE13270:
.LBE13284:
.LBB13285:
.LBB13280:
	.loc 17 70 0
	movl	%eax, %ecx
	andl	$-9, %ecx
	.loc 17 71 0
	cmpl	$51, %ecx
	cmovne	%edx, %eax
.LVL5707:
.LBE13280:
.LBE13285:
.LBB13286:
.LBB13275:
	.loc 13 21 0
	movl	%eax, 40(%edi)
.LVL5708:
.L4325:
.LBE13275:
.LBE13286:
.LBB13287:
.LBB13288:
.LBB13289:
	movl	48(%esp), %eax
	movl	48(%esp), %edi
	movl	44(%eax), %eax
	movl	%eax, 56(%edi)
.LBE13289:
.LBE13288:
.LBE13287:
	.loc 30 986 0
	movl	52(%esp), %eax
	testl	%eax, %eax
	je	.L4341
	.loc 30 987 0
	movl	%edi, (%esp)
.LVL5709:
	call	restart
.LVL5710:
.L4341:
	.loc 30 991 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5711:
	.p2align 4,,7
	.p2align 3
.L4353:
	.cfi_restore_state
.LBB13290:
.LBB13260:
	.loc 17 67 0
	andl	$4055, %eax
	orl	$514, %eax
.LVL5712:
	jmp	.L4328
.LVL5713:
.L4352:
.LBE13260:
.LBE13290:
.LBB13291:
.LBB13256:
	call	getSyscallArg.part.131
.LVL5714:
.LBE13256:
.LBE13291:
	.cfi_endproc
.LFE597:
	.size	invokeTCB_WriteRegisters, .-invokeTCB_WriteRegisters
	.section	.rodata.str1.4
	.align 4
.LC254:
	.string	"TCB WriteRegisters: Truncated message."
	.align 4
.LC255:
	.string	"TCB WriteRegisters: Message too short for requested write size (%d/%d)."
	.align 4
.LC256:
	.string	"TCB WriteRegisters: Attempted to write our own registers."
	.text
	.p2align 4,,15
	.globl	decodeWriteRegisters
	.type	decodeWriteRegisters, @function
decodeWriteRegisters:
.LFB586:
	.loc 30 414 0
	.cfi_startproc
.LVL5715:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$32, %esp
	.cfi_def_cfa_offset 48
	.loc 30 420 0
	movl	ksCurThread, %eax
	.loc 30 414 0
	movl	56(%esp), %edx
	movl	48(%esp), %ecx
	.loc 30 419 0
	cmpl	$1, %edx
	jbe	.L4361
.LVL5716:
.LBB13315:
.LBB13316:
.LBB13317:
.LBB13318:
	.loc 13 27 0
	movl	24(%eax), %ebx
.LBE13318:
.LBE13317:
.LBE13316:
.LBE13315:
	.loc 30 428 0
	leal	-2(%edx), %esi
.LBB13319:
.LBB13320:
.LBB13321:
.LBB13322:
	.loc 13 27 0
	movl	20(%eax), %edi
.LVL5717:
.LBE13322:
.LBE13321:
.LBE13320:
.LBE13319:
	.loc 30 428 0
	cmpl	%ebx, %esi
	jb	.L4362
.LVL5718:
.LBB13323:
.LBB13324:
	.loc 27 1359 0
	movl	%ecx, %edx
.LVL5719:
	andl	$15, %edx
	cmpl	$12, %edx
	jne	.L4363
	.loc 27 1362 0
	andl	$-16, %ecx
.LVL5720:
.LBE13324:
.LBE13323:
	.loc 30 438 0
	cmpl	%eax, %ecx
.LBB13327:
.LBB13325:
	.loc 27 1362 0
	movl	%ecx, %esi
.LVL5721:
.LBE13325:
.LBE13327:
	.loc 30 438 0
	je	.L4364
.LVL5722:
.LBB13328:
.LBB13329:
.LBB13330:
.LBB13331:
	.loc 27 626 0
	movl	592(%eax), %edx
.LBE13331:
.LBE13330:
.LBE13329:
.LBE13328:
	.loc 30 445 0
	andl	$1, %edi
.LBB13335:
.LBB13334:
.LBB13333:
.LBB13332:
	.loc 27 626 0
	andl	$-16, %edx
	.loc 27 627 0
	orl	$2, %edx
	movl	%edx, 592(%eax)
.LBE13332:
.LBE13333:
	.loc 22 428 0
	movl	%eax, (%esp)
	call	scheduleTCB
.LVL5723:
.LBE13334:
.LBE13335:
	.loc 30 445 0
	movl	60(%esp), %eax
	movl	%ebx, 8(%esp)
	movl	%edi, 4(%esp)
	movl	%esi, (%esp)
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	call	invokeTCB_WriteRegisters
.LVL5724:
	.loc 30 448 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL5725:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5726:
	.p2align 4,,7
	.p2align 3
.L4362:
	.cfi_restore_state
	.loc 30 429 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$430, 8(%esp)
	movl	$__func__.7150, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5727:
	.loc 30 429 0
	movl	%ebx, 8(%esp)
	movl	%esi, 4(%esp)
	movl	$.LC255, (%esp)
	call	printf
.LVL5728:
	movl	$.LC20, (%esp)
	call	printf
.LVL5729:
	.loc 30 432 0
	movl	$3, %eax
	.loc 30 431 0
	movl	$7, current_syscall_error+24
	.loc 30 448 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5730:
	.p2align 4,,7
	.p2align 3
.L4361:
	.cfi_restore_state
	.loc 30 420 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$420, 8(%esp)
	movl	$__func__.7150, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5731:
	movl	$.LC254, (%esp)
	call	printf
.LVL5732:
	movl	$.LC20, (%esp)
	call	printf
.LVL5733:
	.loc 30 422 0
	movl	$3, %eax
	.loc 30 421 0
	movl	$7, current_syscall_error+24
	.loc 30 448 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5734:
	.p2align 4,,7
	.p2align 3
.L4364:
	.cfi_restore_state
	.loc 30 439 0
	movl	44(%ecx), %eax
.LVL5735:
	movl	%ecx, 12(%esp)
	movl	$439, 8(%esp)
	movl	$__func__.7150, 4(%esp)
	movl	%eax, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5736:
	movl	$.LC256, (%esp)
	call	printf
.LVL5737:
	movl	$.LC20, (%esp)
	call	printf
.LVL5738:
	.loc 30 441 0
	movl	$3, %eax
	.loc 30 440 0
	movl	$3, current_syscall_error+24
	.loc 30 448 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL5739:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5740:
.L4363:
	.cfi_restore_state
.LBB13336:
.LBB13326:
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL5741:
.LBE13326:
.LBE13336:
	.cfi_endproc
.LFE586:
	.size	decodeWriteRegisters, .-decodeWriteRegisters
	.section	.rodata.str1.4
	.align 4
.LC257:
	.string	"TCB CopyRegisters: Truncated message."
	.align 4
.LC258:
	.string	"TCB CopyRegisters: Invalid source TCB."
	.text
	.p2align 4,,15
	.globl	decodeCopyRegisters
	.type	decodeCopyRegisters, @function
decodeCopyRegisters:
.LFB584:
	.loc 30 324 0
	.cfi_startproc
.LVL5742:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 30 330 0
	movl	72(%esp), %edx
	.loc 30 324 0
	movl	64(%esp), %ebx
	movl	76(%esp), %eax
.LVL5743:
	.loc 30 330 0
	testl	%edx, %edx
	je	.L4366
	.loc 30 330 0 is_stmt 0 discriminator 1
	testl	%eax, %eax
	je	.L4366
.LVL5744:
	.loc 30 340 0 is_stmt 1
	movl	(%eax), %eax
.LVL5745:
.LBB13375:
.LBB13376:
	.loc 41 30 0
	movl	ksCurThread, %edx
.LVL5746:
.LBE13376:
.LBE13375:
.LBB13380:
.LBB13381:
	.loc 27 872 0
	movl	%eax, %ebp
	.loc 27 873 0
	movl	%eax, %ecx
	.loc 27 872 0
	andl	$14, %ebp
	.loc 27 873 0
	andl	$15, %ecx
.LBE13381:
.LBE13380:
.LBB13383:
.LBB13379:
.LBB13377:
.LBB13378:
	.loc 13 27 0
	movl	20(%edx), %edi
.LVL5747:
.LBE13378:
.LBE13377:
.LBE13379:
.LBE13383:
.LBB13384:
.LBB13382:
	.loc 27 873 0
	cmpl	$14, %ebp
	movzbl	%al, %esi
	cmovne	%ecx, %esi
.LBE13382:
.LBE13384:
	.loc 30 342 0
	cmpl	$12, %esi
	je	.L4392
.LVL5748:
	.loc 30 345 0
	movl	44(%edx), %eax
	movl	%edx, 12(%esp)
	movl	$345, 8(%esp)
	movl	$__func__.7125, 4(%esp)
	movl	%eax, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5749:
	movl	$.LC258, (%esp)
	call	printf
.LVL5750:
	movl	$.LC20, (%esp)
	call	printf
.LVL5751:
	.loc 30 348 0
	movl	$3, %eax
	.loc 30 346 0
	movl	$2, current_syscall_error+24
	.loc 30 347 0
	movl	$1, current_syscall_error+4
	.loc 30 360 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5752:
	.p2align 4,,7
	.p2align 3
.L4366:
	.cfi_restore_state
	.loc 30 331 0
	movl	ksCurThread, %eax
.LVL5753:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$331, 8(%esp)
	movl	$__func__.7125, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5754:
	movl	$.LC257, (%esp)
	call	printf
.LVL5755:
	movl	$.LC20, (%esp)
	call	printf
.LVL5756:
	.loc 30 333 0
	movl	$3, %eax
	.loc 30 332 0
	movl	$7, current_syscall_error+24
.LVL5757:
.L4368:
	.loc 30 360 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5758:
	.p2align 4,,7
	.p2align 3
.L4392:
	.cfi_restore_state
.LBB13385:
.LBB13386:
	.loc 27 1359 0
	cmpl	$12, %ecx
	jne	.L4373
	.loc 27 1362 0
	andl	$-16, %eax
.LBE13386:
.LBE13385:
	.loc 30 352 0
	movl	%edi, %ebp
.LBB13389:
.LBB13387:
	.loc 27 1362 0
	movl	%eax, %esi
.LVL5759:
.LBE13387:
.LBE13389:
.LBB13390:
.LBB13391:
.LBB13392:
.LBB13393:
	.loc 27 626 0
	movl	592(%edx), %eax
.LVL5760:
.LBE13393:
.LBE13392:
.LBE13391:
.LBE13390:
	.loc 30 352 0
	andl	$8, %ebp
.LBB13397:
.LBB13396:
.LBB13395:
.LBB13394:
	.loc 27 626 0
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%edx)
.LBE13394:
.LBE13395:
	.loc 22 428 0
	movl	%edx, (%esp)
	call	scheduleTCB
.LVL5761:
.LBE13396:
.LBE13397:
.LBB13398:
.LBB13399:
	.loc 27 1359 0
	movl	%ebx, %ecx
.LBE13399:
.LBE13398:
	.loc 30 352 0
	movl	%edi, %eax
	movl	%edi, %edx
.LBB13402:
.LBB13400:
	.loc 27 1359 0
	andl	$15, %ecx
.LBE13400:
.LBE13402:
	.loc 30 352 0
	andl	$4, %eax
	andl	$2, %edx
	andl	$1, %edi
.LVL5762:
.LBB13403:
.LBB13401:
	.loc 27 1359 0
	cmpl	$12, %ecx
	jne	.L4373
	.loc 27 1362 0
	andl	$-16, %ebx
.LVL5763:
.LBE13401:
.LBE13403:
.LBB13404:
.LBB13405:
	.loc 30 850 0
	testl	%edi, %edi
	jne	.L4393
.LVL5764:
.L4374:
	.loc 30 854 0
	testl	%edx, %edx
	jne	.L4394
.L4375:
	.loc 30 858 0
	testl	%eax, %eax
	.p2align 4,,2
	je	.L4376
.LVL5765:
.LBB13406:
.LBB13407:
.LBB13408:
	.loc 13 27 0
	movl	44(%esi), %eax
.LVL5766:
.LBE13408:
.LBE13407:
.LBB13418:
.LBB13419:
	.loc 13 21 0
	movl	%eax, 44(%ebx)
.LVL5767:
.LBE13419:
.LBE13418:
.LBB13429:
.LBB13409:
	.loc 13 27 0
	movl	68(%esi), %edx
.LVL5768:
.LBE13409:
.LBE13429:
.LBB13430:
.LBB13420:
	.loc 13 21 0
	movl	%edx, 68(%ebx)
.LVL5769:
.LBE13420:
.LBE13430:
.LBB13431:
.LBB13410:
	.loc 13 27 0
	movl	64(%esi), %edx
.LVL5770:
.LBE13410:
.LBE13431:
.LBB13432:
.LBB13421:
	.loc 13 21 0
	movl	%edx, 64(%ebx)
.LVL5771:
.LBE13421:
.LBE13432:
.LBB13433:
.LBB13411:
	.loc 13 27 0
	movl	(%esi), %edx
.LVL5772:
.LBE13411:
.LBE13433:
.LBB13434:
.LBB13422:
	.loc 13 21 0
	movl	%edx, (%ebx)
.LVL5773:
.LBE13422:
.LBE13434:
.LBB13435:
.LBB13412:
	.loc 13 27 0
	movl	4(%esi), %edx
.LVL5774:
.LBE13412:
.LBE13435:
.LBB13436:
.LBB13423:
	.loc 13 21 0
	movl	%edx, 4(%ebx)
.LVL5775:
.LBE13423:
.LBE13436:
.LBB13437:
.LBB13413:
	.loc 13 27 0
	movl	8(%esi), %edx
.LVL5776:
.LBE13413:
.LBE13437:
.LBB13438:
.LBB13424:
	.loc 13 21 0
	movl	%edx, 8(%ebx)
.LVL5777:
.LBE13424:
.LBE13438:
.LBB13439:
.LBB13414:
	.loc 13 27 0
	movl	12(%esi), %edx
.LVL5778:
.LBE13414:
.LBE13439:
.LBB13440:
.LBB13425:
	.loc 13 21 0
	movl	%edx, 12(%ebx)
.LVL5779:
.LBE13425:
.LBE13440:
.LBB13441:
.LBB13415:
	.loc 13 27 0
	movl	16(%esi), %edx
.LVL5780:
.LBE13415:
.LBE13441:
.LBB13442:
.LBB13426:
	.loc 13 21 0
	movl	%edx, 16(%ebx)
.LVL5781:
.LBE13426:
.LBE13442:
.LBB13443:
.LBB13416:
	.loc 13 27 0
	movl	20(%esi), %edx
.LVL5782:
.LBE13416:
.LBE13443:
.LBB13444:
.LBB13427:
	.loc 13 21 0
	movl	%edx, 20(%ebx)
.LVL5783:
.LBE13427:
.LBE13444:
.LBB13445:
.LBB13417:
	.loc 13 27 0
	movl	24(%esi), %edx
.LVL5784:
.LBE13417:
.LBE13445:
.LBB13446:
.LBB13447:
.LBB13448:
	.loc 13 21 0
	movl	%eax, 56(%ebx)
.LBE13448:
.LBE13447:
.LBE13446:
.LBB13449:
.LBB13428:
	movl	%edx, 24(%ebx)
.LVL5785:
.L4376:
.LBE13428:
.LBE13449:
.LBE13406:
.LBE13405:
.LBE13404:
	.loc 30 352 0
	xorl	%eax, %eax
.LBB13464:
.LBB13463:
	.loc 30 872 0
	testl	%ebp, %ebp
	je	.L4368
.LVL5786:
.LBB13450:
.LBB13451:
.LBB13452:
	.loc 13 27 0
	movl	48(%esi), %edx
.LVL5787:
.LBE13452:
.LBE13451:
.LBB13455:
.LBB13456:
	.loc 13 21 0
	movl	%edx, 48(%ebx)
.LVL5788:
.LBE13456:
.LBE13455:
.LBB13459:
.LBB13453:
	.loc 13 27 0
	movl	36(%esi), %edx
.LVL5789:
.LBE13453:
.LBE13459:
.LBB13460:
.LBB13457:
	.loc 13 21 0
	movl	%edx, 36(%ebx)
.LVL5790:
.LBE13457:
.LBE13460:
.LBB13461:
.LBB13454:
	.loc 13 27 0
	movl	40(%esi), %edx
.LVL5791:
.LBE13454:
.LBE13461:
.LBB13462:
.LBB13458:
	.loc 13 21 0
	movl	%edx, 40(%ebx)
.LVL5792:
	jmp	.L4368
.LVL5793:
	.p2align 4,,7
	.p2align 3
.L4393:
.LBE13458:
.LBE13462:
.LBE13450:
	.loc 30 851 0
	movl	%esi, (%esp)
	movl	%edx, 28(%esp)
	movl	%eax, 24(%esp)
	call	suspend
.LVL5794:
	movl	28(%esp), %edx
	movl	24(%esp), %eax
	jmp	.L4374
.LVL5795:
	.p2align 4,,7
	.p2align 3
.L4394:
	.loc 30 855 0
	movl	%ebx, (%esp)
	movl	%eax, 24(%esp)
	call	restart
.LVL5796:
	movl	24(%esp), %eax
	jmp	.L4375
.LVL5797:
.L4373:
.LBE13463:
.LBE13464:
.LBB13465:
.LBB13388:
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL5798:
.LBE13388:
.LBE13465:
	.cfi_endproc
.LFE584:
	.size	decodeCopyRegisters, .-decodeCopyRegisters
	.p2align 4,,15
	.globl	invokeTCB_Resume
	.type	invokeTCB_Resume, @function
invokeTCB_Resume:
.LFB593:
	.loc 30 773 0
	.cfi_startproc
.LVL5799:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 30 773 0
	movl	32(%esp), %ebx
.LVL5800:
.LBB13497:
.LBB13498:
.LBB13499:
.LBB13500:
.LBB13501:
	.loc 27 614 0
	movl	592(%ebx), %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	ja	.L4402
	movl	$1, %eax
	sall	%cl, %eax
	testb	$121, %al
	jne	.L4397
.L4402:
.LBE13501:
.LBE13500:
.LBE13499:
.LBE13498:
.LBE13497:
	.loc 30 776 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5801:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5802:
	.p2align 4,,7
	.p2align 3
.L4397:
	.cfi_restore_state
.LBB13536:
.LBB13502:
.LBB13503:
	.loc 22 103 0
	movl	%ebx, (%esp)
	call	ipcCancel
.LVL5803:
	.loc 22 104 0
	movl	%ebx, (%esp)
	call	setupReplyMaster
.LVL5804:
.LBB13504:
.LBB13505:
.LBB13506:
.LBB13507:
	.loc 27 626 0
	movl	592(%ebx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%ebx)
.LBE13507:
.LBE13506:
	.loc 22 428 0
	movl	%ebx, (%esp)
	call	scheduleTCB
.LVL5805:
.LBE13505:
.LBE13504:
.LBB13508:
.LBB13509:
	.loc 30 37 0
	movl	600(%ebx), %edx
	testb	$1, %dl
	je	.L4404
.LVL5806:
.LBE13509:
.LBE13508:
.LBB13525:
.LBB13526:
	.loc 22 421 0
	xorl	%edx, %edx
	movl	%ebx, %eax
	call	possibleSwitchTo
.LVL5807:
.L4405:
.LBE13526:
.LBE13525:
.LBE13503:
.LBE13502:
.LBE13536:
	.loc 30 776 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5808:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5809:
	.p2align 4,,7
	.p2align 3
.L4404:
	.cfi_restore_state
.LBB13537:
.LBB13535:
.LBB13534:
.LBB13529:
.LBB13522:
.LBB13510:
.LBB13511:
.LBB13512:
.LBB13513:
	.loc 30 30 0
	movl	620(%ebx), %eax
	sall	$8, %eax
	addl	624(%ebx), %eax
.LBE13513:
.LBE13512:
	.loc 30 46 0
	leal	ksReadyQueues(,%eax,8), %esi
	movl	ksReadyQueues(,%eax,8), %edi
.LVL5810:
	movl	4(%esi), %ecx
.LVL5811:
	.loc 30 48 0
	testl	%ecx, %ecx
	je	.L4401
	.loc 30 51 0
	movl	%ebx, 644(%edi)
.LVL5812:
.L4398:
.LBB13514:
.LBB13515:
	.loc 27 578 0
	orl	$1, %edx
.LBE13515:
.LBE13514:
	.loc 30 53 0
	movl	$0, 644(%ebx)
	.loc 30 54 0
	movl	%edi, 640(%ebx)
.LVL5813:
	.loc 30 57 0
	movl	%ebx, ksReadyQueues(,%eax,8)
.LVL5814:
.LBE13511:
.LBE13510:
.LBE13522:
.LBE13529:
.LBB13530:
.LBB13527:
	.loc 22 421 0
	movl	%ebx, %eax
.LBE13527:
.LBE13530:
.LBB13531:
.LBB13523:
.LBB13520:
.LBB13518:
	.loc 30 57 0
	movl	%ecx, 4(%esi)
.LVL5815:
.LBB13517:
.LBB13516:
	.loc 27 578 0
	movl	%edx, 600(%ebx)
.LVL5816:
.LBE13516:
.LBE13517:
.LBE13518:
.LBE13520:
.LBE13523:
.LBE13531:
.LBB13532:
.LBB13528:
	.loc 22 421 0
	xorl	%edx, %edx
	call	possibleSwitchTo
.LVL5817:
	jmp	.L4405
.LVL5818:
	.p2align 4,,7
	.p2align 3
.L4401:
.LBE13528:
.LBE13532:
.LBB13533:
.LBB13524:
.LBB13521:
.LBB13519:
	.loc 30 48 0
	movl	%ebx, %ecx
.LVL5819:
	jmp	.L4398
.LBE13519:
.LBE13521:
.LBE13524:
.LBE13533:
.LBE13534:
.LBE13535:
.LBE13537:
	.cfi_endproc
.LFE593:
	.size	invokeTCB_Resume, .-invokeTCB_Resume
	.p2align 4,,15
	.globl	invokeIRQHandler_SetIRQHandler
	.type	invokeIRQHandler_SetIRQHandler, @function
invokeIRQHandler_SetIRQHandler:
.LFB549:
	.loc 29 170 0
	.cfi_startproc
.LVL5820:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 29 170 0
	movl	48(%esp), %ebx
	movl	52(%esp), %esi
	movl	56(%esp), %edi
	movl	60(%esp), %ebp
	.loc 29 173 0
	sall	$4, %ebx
	addl	intStateIRQNode, %ebx
.LVL5821:
	.loc 29 174 0
	movl	%ebx, (%esp)
	call	cteDeleteOne
.LVL5822:
	.loc 29 175 0
	movl	%ebx, 60(%esp)
	movl	%ebp, 56(%esp)
	movl	%esi, 48(%esp)
	movl	%edi, 52(%esp)
	.loc 29 176 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5823:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 29 175 0
	jmp	cteInsert
.LVL5824:
	.cfi_endproc
.LFE549:
	.size	invokeIRQHandler_SetIRQHandler, .-invokeIRQHandler_SetIRQHandler
	.p2align 4,,15
	.globl	invokeIRQHandler_ClearIRQHandler
	.type	invokeIRQHandler_ClearIRQHandler, @function
invokeIRQHandler_ClearIRQHandler:
.LFB550:
	.loc 29 180 0
	.cfi_startproc
.LVL5825:
	.loc 29 180 0
	movl	4(%esp), %eax
.LVL5826:
	.loc 29 183 0
	sall	$4, %eax
	addl	intStateIRQNode, %eax
.LVL5827:
	.loc 29 184 0
	movl	%eax, 4(%esp)
.LVL5828:
	jmp	cteDeleteOne
.LVL5829:
	.cfi_endproc
.LFE550:
	.size	invokeIRQHandler_ClearIRQHandler, .-invokeIRQHandler_ClearIRQHandler
	.section	.rodata.str1.4
	.align 4
.LC259:
	.string	"IRQSetHandler: provided cap is not an async endpoint capablity."
	.align 4
.LC260:
	.string	"IRQSetHandler: caller does not have send rights on the endpoint."
	.align 4
.LC261:
	.string	"IRQSetMode: Not enough arguments"
	.align 4
.LC262:
	.string	"IRQHandler: Illegal operation."
	.text
	.p2align 4,,15
	.globl	decodeIRQHandlerInvocation
	.type	decodeIRQHandlerInvocation, @function
decodeIRQHandlerInvocation:
.LFB546:
	.loc 29 95 0
	.cfi_startproc
.LVL5830:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$32, %esp
	.cfi_def_cfa_offset 48
	.loc 29 95 0
	movl	48(%esp), %eax
	movl	60(%esp), %ebx
.LVL5831:
	.loc 29 96 0
	cmpl	$23, %eax
	je	.L4411
	jbe	.L4443
	cmpl	$24, %eax
	je	.L4414
	cmpl	$25, %eax
	.p2align 4,,5
	jne	.L4410
.LBB13580:
	.loc 29 137 0
	cmpl	$1, 52(%esp)
	jbe	.L4444
	.loc 29 145 0
	movl	ksCurThread, %edx
.LVL5832:
.LBB13581:
.LBB13582:
.LBB13583:
.LBB13584:
	.loc 27 626 0
	movl	592(%edx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%edx)
.LBE13584:
.LBE13583:
	.loc 22 428 0
	movl	%edx, (%esp)
	call	scheduleTCB
.LVL5833:
.LBE13582:
.LBE13581:
.LBE13580:
	.loc 29 155 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
.LBB13585:
	.loc 29 147 0
	xorl	%eax, %eax
.LBE13585:
	.loc 29 155 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5834:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5835:
	.p2align 4,,7
	.p2align 3
.L4414:
	.cfi_restore_state
	.loc 29 131 0
	movl	ksCurThread, %edx
.LVL5836:
.LBB13586:
.LBB13587:
.LBB13588:
.LBB13589:
	.loc 27 626 0
	movl	592(%edx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%edx)
.LBE13589:
.LBE13588:
	.loc 22 428 0
	movl	%edx, (%esp)
	call	scheduleTCB
.LVL5837:
.LBE13587:
.LBE13586:
.LBB13590:
.LBB13591:
	.loc 29 183 0
	movl	56(%esp), %eax
	sall	$4, %eax
	addl	intStateIRQNode, %eax
	.loc 29 184 0
	movl	%eax, (%esp)
	call	cteDeleteOne
.LVL5838:
.LBE13591:
.LBE13590:
	.loc 29 133 0
	xorl	%eax, %eax
.LVL5839:
.L4418:
	.loc 29 155 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5840:
	.p2align 4,,7
	.p2align 3
.L4443:
	.cfi_restore_state
	.loc 29 96 0
	cmpl	$22, %eax
	jne	.L4410
	.loc 29 98 0
	movl	ksCurThread, %edx
.LVL5841:
.LBB13592:
.LBB13593:
.LBB13594:
.LBB13595:
	.loc 27 626 0
	movl	592(%edx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%edx)
.LBE13595:
.LBE13594:
	.loc 22 428 0
	movl	%edx, (%esp)
	call	scheduleTCB
.LVL5842:
.LBE13593:
.LBE13592:
.LBB13596:
.LBB13597:
.LBB13598:
	.loc 25 47 0
	movl	56(%esp), %eax
	testl	%eax, %eax
	js	.L4445
	.loc 25 48 0
	cmpl	$31, 56(%esp)
	jg	.L4446
.LBE13598:
.LBE13597:
.LBE13596:
	.loc 29 100 0
	xorl	%eax, %eax
.LBB13609:
.LBB13606:
.LBB13603:
	.loc 25 50 0
	cmpl	$15, 56(%esp)
	jg	.L4418
.LVL5843:
.LBB13599:
.LBB13600:
	.loc 24 54 0
	cmpl	$7, 56(%esp)
	jle	.L4447
	.loc 24 58 0
	movl	56(%esp), %eax
	movl	$161, %ebx
.LVL5844:
	leal	-8(%eax), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	%eax, %esi
.LVL5845:
.L4420:
	.loc 24 67 0
	movl	%ebx, (%esp)
	call	in8
.LVL5846:
	movl	%esi, %edx
	notl	%edx
	movl	%ebx, (%esp)
	andl	%eax, %edx
	movzbl	%dl, %edx
	movl	%edx, 4(%esp)
	call	out8
.LVL5847:
.LBE13600:
.LBE13599:
.LBE13603:
.LBE13606:
.LBE13609:
	.loc 29 100 0
	xorl	%eax, %eax
	jmp	.L4418
.LVL5848:
	.p2align 4,,7
	.p2align 3
.L4410:
	.loc 29 151 0
	movl	ksCurThread, %eax
.LVL5849:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$151, 8(%esp)
	movl	$__func__.6768, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5850:
	movl	$.LC262, (%esp)
	call	printf
.LVL5851:
	movl	$.LC20, (%esp)
	call	printf
.LVL5852:
	.loc 29 153 0
	movl	$3, %eax
	.loc 29 152 0
	movl	$3, current_syscall_error+24
	.loc 29 155 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5853:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5854:
	.p2align 4,,7
	.p2align 3
.L4411:
	.cfi_restore_state
.LBB13610:
	.loc 29 106 0
	testl	%ebx, %ebx
	je	.L4442
	.loc 29 110 0
	movl	(%ebx), %edx
	movl	4(%ebx), %edi
.LVL5855:
.LBB13611:
.LBB13612:
	.loc 27 872 0
	movl	%edx, %ecx
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %esi
	cmpl	$14, %ecx
	cmovne	%eax, %esi
.LBE13612:
.LBE13611:
	.loc 29 113 0
	cmpl	$6, %esi
	je	.L4425
.L4429:
.LVL5856:
.LBB13613:
.LBB13614:
	.loc 27 874 0
	movzbl	%dl, %eax
	andl	$15, %edx
.LVL5857:
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LBE13614:
.LBE13613:
	.loc 29 115 0
	cmpl	$6, %eax
	je	.L4448
	.loc 29 116 0
	movl	ksCurThread, %eax
.LVL5858:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
.LVL5859:
	movl	$116, 8(%esp)
	movl	$__func__.6768, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5860:
	movl	$.LC259, (%esp)
	call	printf
.LVL5861:
	movl	$.LC20, (%esp)
	call	printf
.LVL5862:
.L4433:
	.loc 29 120 0
	movl	$2, current_syscall_error+24
	.loc 29 122 0
	movl	$3, %eax
	.loc 29 121 0
	movl	$0, current_syscall_error+4
.LBE13610:
	.loc 29 155 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5863:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL5864:
	ret
.LVL5865:
	.p2align 4,,7
	.p2align 3
.L4444:
	.cfi_restore_state
.LBB13621:
	.loc 29 138 0
	movl	ksCurThread, %eax
.LVL5866:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$138, 8(%esp)
	movl	$__func__.6768, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5867:
	movl	52(%esp), %eax
	movl	$.LC261, (%esp)
	movl	%eax, 4(%esp)
	call	printf
.LVL5868:
	movl	$.LC20, (%esp)
	call	printf
.LVL5869:
.L4442:
	.loc 29 139 0
	movl	$7, current_syscall_error+24
.LBE13621:
	.loc 29 155 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
.LBB13622:
	.loc 29 140 0
	movl	$3, %eax
.LBE13622:
	.loc 29 155 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5870:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5871:
	.p2align 4,,7
	.p2align 3
.L4447:
	.cfi_restore_state
.LBB13623:
.LBB13607:
.LBB13604:
.LBB13602:
.LBB13601:
	.loc 24 55 0
	movzbl	56(%esp), %ecx
	movl	$1, %esi
	movl	$33, %ebx
.LVL5872:
	sall	%cl, %esi
.LVL5873:
	jmp	.L4420
.LVL5874:
.L4445:
.LBE13601:
.LBE13602:
	call	maskInterrupt.part.208
.LVL5875:
	.p2align 4,,7
	.p2align 3
.L4425:
.LBE13604:
.LBE13607:
.LBE13623:
.LBB13624:
.LBB13615:
.LBB13616:
	.loc 27 1147 0 discriminator 1
	cmpl	$6, %eax
	jne	.L4449
.LBE13616:
.LBE13615:
	.loc 29 113 0
	testl	$2, %edi
	je	.L4429
	.loc 29 125 0
	movl	ksCurThread, %esi
.LVL5876:
	movl	%edx, 28(%esp)
.LBB13618:
.LBB13619:
	.loc 22 427 0
	leal	592(%esi), %eax
	call	thread_state_ptr_set_tsType.isra.166.constprop.286
.LVL5877:
	.loc 22 428 0
	movl	%esi, (%esp)
	call	scheduleTCB
.LVL5878:
.LBE13619:
.LBE13618:
	.loc 29 126 0
	movl	56(%esp), %eax
	movl	28(%esp), %edx
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	invokeIRQHandler_SetIRQHandler
.LVL5879:
	.loc 29 127 0
	xorl	%eax, %eax
	jmp	.L4418
.LVL5880:
	.p2align 4,,7
	.p2align 3
.L4448:
	.loc 29 118 0
	movl	ksCurThread, %eax
.LVL5881:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
.LVL5882:
	movl	$118, 8(%esp)
	movl	$__func__.6768, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL5883:
	movl	$.LC260, (%esp)
	call	printf
.LVL5884:
	movl	$.LC20, (%esp)
	call	printf
.LVL5885:
	jmp	.L4433
.LVL5886:
.L4446:
.LBE13624:
.LBB13625:
.LBB13608:
.LBB13605:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL5887:
.L4449:
.LBE13605:
.LBE13608:
.LBE13625:
.LBB13626:
.LBB13620:
.LBB13617:
	call	cap_async_endpoint_cap_get_capAEPCanSend.part.192
.LVL5888:
.LBE13617:
.LBE13620:
.LBE13626:
	.cfi_endproc
.LFE546:
	.size	decodeIRQHandlerInvocation, .-decodeIRQHandlerInvocation
	.p2align 4,,15
	.globl	deletingIRQHandler
	.type	deletingIRQHandler, @function
deletingIRQHandler:
.LFB551:
	.loc 29 189 0
	.cfi_startproc
.LVL5889:
	.loc 29 189 0
	movl	4(%esp), %eax
.LVL5890:
	.loc 29 192 0
	sall	$4, %eax
	addl	intStateIRQNode, %eax
.LVL5891:
	.loc 29 193 0
	movl	%eax, 4(%esp)
.LVL5892:
	jmp	cteDeleteOne
.LVL5893:
	.cfi_endproc
.LFE551:
	.size	deletingIRQHandler, .-deletingIRQHandler
	.section	.rodata.str1.4
	.align 4
.LC263:
	.string	"finaliseCap: failed to finalise immediately."
	.text
	.p2align 4,,15
	.globl	finaliseCap
	.type	finaliseCap, @function
finaliseCap:
.LFB558:
	.loc 38 100 0
	.cfi_startproc
.LVL5894:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 38 100 0
	movl	12(%ebp), %ebx
	movl	8(%ebp), %eax
	movl	16(%ebp), %esi
.LVL5895:
.LBB13674:
.LBB13675:
.LBB13676:
.LBB13677:
	.loc 27 872 0
	movl	%ebx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L4452
.LBE13677:
.LBE13676:
.LBE13675:
.LBE13674:
.LBB13678:
.LBB13679:
	.loc 27 873 0
	movl	%ebx, %edx
	andl	$15, %edx
.LBE13679:
.LBE13678:
	.loc 38 103 0
	testb	$1, %bl
	jne	.L4453
.L4457:
	.loc 38 109 0
	cmpl	$6, %edx
	je	.L4459
	ja	.L4460
	testl	%edx, %edx
	.p2align 4,,6
	je	.L4470
	cmpl	$4, %edx
	.p2align 4,,6
	jne	.L4458
	.loc 38 111 0
	movl	20(%ebp), %esi
.LVL5896:
	testl	%esi, %esi
	je	.L4470
.LVL5897:
.LBB13681:
.LBB13682:
	.loc 27 1088 0
	movl	%ebx, %edx
	andl	$15, %edx
	cmpl	$4, %edx
	jne	.L4511
	.loc 27 1091 0
	andl	$-16, %ebx
.LVL5898:
.LBE13682:
.LBE13681:
	.loc 38 112 0
	movl	%ebx, (%esp)
	movl	%eax, -44(%ebp)
	call	epCancelAll
.LVL5899:
	movl	-44(%ebp), %eax
.LVL5900:
	.p2align 4,,7
	.p2align 3
.L4470:
	.loc 38 196 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$-1, 8(%eax)
.LVL5901:
.L4451:
	.loc 38 197 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
.LVL5902:
	.p2align 4,,7
	.p2align 3
.L4460:
	.cfi_restore_state
	.loc 38 109 0
	cmpl	$8, %edx
	je	.L4470
	cmpl	$62, %edx
	je	.L4470
.L4458:
	.loc 38 136 0
	movl	24(%ebp), %edx
	testl	%edx, %edx
	jne	.L4512
.LVL5903:
.LBB13684:
.LBB13685:
	.loc 27 873 0
	movl	%ebx, %edx
	movzbl	%bl, %edi
.LVL5904:
	andl	$15, %edx
	cmpl	$14, %ecx
	movl	%edx, %ecx
	cmove	%edi, %ecx
.LVL5905:
.LBE13685:
.LBE13684:
	.loc 38 140 0
	cmpl	$12, %ecx
	je	.L4471
	jbe	.L4513
	cmpl	$30, %ecx
	je	.L4474
	cmpl	$46, %ecx
	.p2align 4,,5
	jne	.L4470
.LVL5906:
	.loc 38 179 0
	movl	%ebx, (%eax)
.LVL5907:
	movl	%esi, 4(%eax)
	movl	$-1, 8(%eax)
	jmp	.L4451
.LVL5908:
	.p2align 4,,7
	.p2align 3
.L4452:
	.loc 38 103 0
	testb	$1, %bl
.LBB13686:
.LBB13680:
	.loc 27 874 0
	movzbl	%bl, %edx
.LBE13680:
.LBE13686:
	.loc 38 103 0
	je	.L4457
.L4453:
	movl	%eax, -44(%ebp)
	.loc 38 104 0
	movl	20(%ebp), %eax
	leal	-36(%ebp), %edx
	movl	%ebx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%edx, (%esp)
	movl	%eax, 12(%esp)
	call	Arch_finaliseCap
.LVL5909:
	.loc 38 106 0
	movl	-44(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	$-1, 8(%eax)
	movl	%edx, (%eax)
	movl	-32(%ebp), %edx
	.loc 38 104 0
	subl	$4, %esp
.LVL5910:
	.loc 38 106 0
	movl	%edx, 4(%eax)
	.loc 38 197 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL5911:
	popl	%esi
	.cfi_restore 6
.LVL5912:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
.LVL5913:
	.p2align 4,,7
	.p2align 3
.L4459:
	.cfi_restore_state
	.loc 38 120 0
	movl	20(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L4470
.LVL5914:
.LBB13687:
.LBB13688:
	.loc 27 1187 0
	movl	%ebx, %edx
	andl	$15, %edx
	cmpl	$6, %edx
	jne	.L4514
	.loc 27 1190 0
	andl	$-16, %ebx
.LVL5915:
.LBE13688:
.LBE13687:
	.loc 38 121 0
	movl	%ebx, (%esp)
	movl	%eax, -44(%ebp)
	call	aepCancelAll
.LVL5916:
	movl	-44(%ebp), %eax
.LVL5917:
	jmp	.L4470
.LVL5918:
	.p2align 4,,7
	.p2align 3
.L4513:
	.loc 38 140 0
	cmpl	$10, %ecx
	jne	.L4470
	.loc 38 142 0
	movl	20(%ebp), %edi
.LVL5919:
	testl	%edi, %edi
	je	.L4470
.LVL5920:
.LBB13690:
.LBB13691:
	.loc 27 1332 0
	cmpl	$10, %edx
	jne	.L4515
.LVL5921:
.LBE13691:
.LBE13690:
.LBB13695:
.LBB13696:
	.loc 27 1287 0
	andl	$260046848, %esi
.LVL5922:
.LBE13696:
.LBE13695:
.LBB13698:
.LBB13699:
	.loc 40 80 0
	movl	$1, %edi
.LBE13699:
.LBE13698:
.LBB13712:
.LBB13697:
	.loc 27 1287 0
	shrl	$23, %esi
.LVL5923:
.LBE13697:
.LBE13712:
.LBB13713:
.LBB13706:
	.loc 40 80 0
	movl	%edi, %edx
	leal	1(%esi), %ecx
.LVL5924:
.LBE13706:
.LBE13713:
.LBB13714:
.LBB13692:
	.loc 27 1335 0
	andl	$2147483632, %ebx
.LVL5925:
.LBE13692:
.LBE13714:
.LBB13715:
.LBB13707:
	.loc 40 80 0
	sall	%cl, %edx
.LBE13707:
.LBE13715:
.LBB13716:
.LBB13693:
	.loc 27 1335 0
	addl	%ebx, %ebx
.LBE13693:
.LBE13716:
.LBB13717:
.LBB13708:
	.loc 40 80 0
	movl	%edx, %ecx
.LBB13700:
.LBB13701:
	.loc 27 1860 0
	movl	%esi, %edx
	sall	$8, %edx
.LBE13701:
.LBE13700:
	.loc 40 80 0
	subl	$1, %ecx
.LVL5926:
.LBB13704:
.LBB13702:
	.loc 27 1864 0
	orl	$46, %edx
.LVL5927:
.LBE13702:
.LBE13704:
	.loc 40 83 0
	movl	%ecx, -44(%ebp)
.LBB13705:
.LBB13703:
	.loc 27 1864 0
	movl	%edx, (%eax)
.LBE13703:
.LBE13705:
	.loc 40 83 0
	movl	%ecx, %edx
.LVL5928:
.LBE13708:
.LBE13717:
	.loc 38 145 0
	movl	%esi, %ecx
.LVL5929:
.LBB13718:
.LBB13709:
	.loc 40 83 0
	movl	-44(%ebp), %esi
.LVL5930:
	notl	%edx
.LVL5931:
.LBE13709:
.LBE13718:
	.loc 38 145 0
	sall	%cl, %edi
.LBB13719:
.LBB13710:
	.loc 40 83 0
	andl	%ebx, %edx
.LBE13710:
.LBE13719:
	.loc 38 150 0
	movl	$-1, 8(%eax)
.LBB13720:
.LBB13711:
	.loc 40 83 0
	andl	%edi, %esi
.LVL5932:
	orl	%esi, %edx
	movl	%edx, 4(%eax)
.LBE13711:
.LBE13720:
	.loc 38 150 0
	jmp	.L4451
.LVL5933:
	.p2align 4,,7
	.p2align 3
.L4474:
	.loc 38 182 0
	movl	20(%ebp), %edx
	testl	%edx, %edx
	je	.L4470
.LVL5934:
.LBB13721:
.LBB13722:
.LBB13723:
	.loc 27 1843 0
	cmpl	$30, %edi
	jne	.L4516
	movl	%eax, -44(%ebp)
	.loc 27 1846 0
	movl	%esi, %eax
	movzbl	%al, %esi
.LVL5935:
.LBE13723:
.LBE13722:
.LBB13725:
.LBB13726:
	.loc 29 192 0
	movl	%esi, %edx
	sall	$4, %edx
	addl	intStateIRQNode, %edx
.LVL5936:
	.loc 29 193 0
	movl	%edx, (%esp)
	call	cteDeleteOne
.LVL5937:
.LBE13726:
.LBE13725:
	.loc 38 189 0
	movl	-44(%ebp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	%esi, 8(%eax)
	jmp	.L4451
.LVL5938:
	.p2align 4,,7
	.p2align 3
.L4471:
.LBE13721:
	.loc 38 156 0
	movl	20(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L4470
.LVL5939:
.LBB13728:
.LBB13729:
.LBB13730:
	.loc 27 1359 0
	cmpl	$12, %edx
	jne	.L4517
	.loc 27 1362 0
	movl	%ebx, %esi
.LVL5940:
	andl	$-16, %esi
.LVL5941:
.LBE13730:
.LBE13729:
	.loc 38 162 0
	movl	%esi, (%esp)
	movl	%eax, -44(%ebp)
	call	suspend
.LVL5942:
.LBB13732:
.LBB13733:
.LBB13734:
	.loc 15 80 0
	movl	-44(%ebp), %eax
	cmpl	ia32KSfpuOwner, %esi
	je	.L4518
.LVL5943:
.L4478:
.LBE13734:
.LBE13733:
.LBE13732:
.LBB13747:
.LBB13748:
	.loc 40 83 0
	andl	$-1024, %ebx
.LVL5944:
	orl	$5, %ebx
.LBE13748:
.LBE13747:
	.loc 38 171 0
	movl	$8238, (%eax)
.LBB13750:
.LBB13749:
	.loc 40 83 0
	movl	%ebx, 4(%eax)
.LBE13749:
.LBE13750:
	.loc 38 171 0
	movl	$-1, 8(%eax)
	jmp	.L4451
.LVL5945:
.L4518:
.LBB13751:
.LBB13746:
.LBB13745:
.LBB13735:
.LBB13736:
.LBB13737:
.LBB13738:
	.loc 3 45 0
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.LBE13738:
.LBE13737:
	.loc 15 35 0
	testl	%esi, %esi
	je	.L4479
	.loc 15 36 0
	addl	$80, %esi
.LVL5946:
	movl	%esi, (%esp)
	movl	%eax, -44(%ebp)
	call	saveFpuState
.LVL5947:
	movl	-44(%ebp), %eax
.LVL5948:
.L4479:
.LBB13739:
.LBB13740:
.LBB13741:
.LBB13742:
	.loc 2 41 0
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %edx
# 0 "" 2
.LVL5949:
#NO_APP
.LBE13742:
.LBE13741:
	.loc 3 53 0
	orl	$8, %edx
.LVL5950:
.LBB13743:
.LBB13744:
	.loc 2 47 0
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %edx, %cr0
# 0 "" 2
#NO_APP
.LBE13744:
.LBE13743:
.LBE13740:
.LBE13739:
	.loc 15 43 0
	movl	$0, ia32KSfpuOwner
	jmp	.L4478
.LVL5951:
.L4512:
.LBE13736:
.LBE13735:
.LBE13745:
.LBE13746:
.LBE13751:
.LBE13728:
	.loc 38 137 0
	movl	$__func__.6850, 12(%esp)
	movl	$137, 8(%esp)
	movl	$.LC139, 4(%esp)
	movl	$.LC263, (%esp)
	call	_fail
.LVL5952:
.L4511:
.LBB13753:
.LBB13683:
	call	cap_endpoint_cap_get_capEPPtr.isra.65.part.66
.LVL5953:
.L4517:
.LBE13683:
.LBE13753:
.LBB13754:
.LBB13752:
.LBB13731:
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL5954:
.L4514:
.LBE13731:
.LBE13752:
.LBE13754:
.LBB13755:
.LBB13689:
	.p2align 4,,5
	call	cap_async_endpoint_cap_get_capAEPPtr.isra.86.part.87
.LVL5955:
.L4515:
.LBE13689:
.LBE13755:
.LBB13756:
.LBB13694:
	.p2align 4,,5
	call	cap_cnode_cap_get_capCNodePtr.isra.62.part.63
.LVL5956:
.L4516:
.LBE13694:
.LBE13756:
.LBB13757:
.LBB13727:
.LBB13724:
	.p2align 4,,5
	call	cap_irq_handler_cap_get_capIRQ.part.193
.LVL5957:
.LBE13724:
.LBE13727:
.LBE13757:
	.cfi_endproc
.LFE558:
	.size	finaliseCap, .-finaliseCap
	.section	.rodata.str1.4
	.align 4
.LC264:
	.string	"cap_get_capType(slot->cap) == cap_zombie_cap"
	.section	.rodata.str1.1
.LC265:
	.string	"n > 0"
	.section	.rodata.str1.4
	.align 4
.LC266:
	.string	"cap_get_capType(endSlot->cap) == cap_null_cap"
	.section	.rodata.str1.1
.LC267:
	.string	"ptr2 == slot && ptr != slot"
	.section	.rodata.str1.4
	.align 4
.LC268:
	.string	"Expected recursion to result in Zombie."
	.section	.rodata.str1.1
.LC269:
	.string	"ptr != slot"
	.section	.rodata.str1.4
	.align 4
.LC270:
	.string	"ptr != CTE_PTR(cap_zombie_cap_get_capZombiePtr(ptr->cap))"
	.text
	.p2align 4,,15
	.globl	cteDelete
	.type	cteDelete, @function
cteDelete:
.LFB518:
	.loc 26 576 0
	.cfi_startproc
.LVL5958:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %edi
.LVL5959:
.L4574:
.LBB13912:
.LBB13913:
	.loc 26 651 0
	movl	(%edi), %eax
.LVL5960:
.LBB13914:
.LBB13915:
	.loc 27 872 0
	movl	%eax, %ebx
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ebx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %ebx
	cmove	%ecx, %edx
.LBE13915:
.LBE13914:
	.loc 26 651 0
	testl	%edx, %edx
	je	.L4635
.LVL5961:
.LBB13916:
.LBB13917:
	.loc 26 906 0
	movl	8(%edi), %eax
.LVL5962:
	.loc 26 904 0
	movl	12(%edi), %edx
.LVL5963:
	.loc 26 906 0
	andl	$-8, %eax
	jne	.L4621
	movl	(%edi), %ebx
	movl	4(%edi), %esi
.LVL5964:
.L4521:
	.loc 26 918 0
	andl	$-8, %edx
.LVL5965:
	.loc 26 919 0
	movl	$1, %ecx
	.loc 26 918 0
	je	.L4522
.LVL5966:
.LBB13918:
	.loc 26 924 0
	movl	(%edx), %eax
	movl	4(%edx), %edx
.LVL5967:
	movl	%ebx, (%esp)
	movl	%esi, 4(%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	call	sameObjectAs
.LVL5968:
	xorl	%ecx, %ecx
	testl	%eax, %eax
	sete	%cl
.L4522:
.LBE13918:
.LBE13917:
.LBE13916:
	.loc 26 653 0
	leal	-36(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, (%esp)
	movl	$0, 16(%esp)
	movl	%ebx, 4(%esp)
	call	finaliseCap
.LVL5969:
	movl	-28(%ebp), %eax
	movl	-36(%ebp), %ecx
	movl	%eax, -60(%ebp)
	movl	-32(%ebp), %eax
.LVL5970:
.LBB13921:
.LBB13922:
.LBB13923:
.LBB13924:
	.loc 27 872 0
	movl	%ecx, %edx
	.loc 27 873 0
	movzbl	%cl, %esi
	.loc 27 872 0
	andl	$14, %edx
.LBE13924:
.LBE13923:
.LBE13922:
.LBE13921:
	.loc 26 653 0
	subl	$4, %esp
.LVL5971:
	movl	%eax, -56(%ebp)
.LVL5972:
.LBB13952:
.LBB13948:
.LBB13926:
.LBB13925:
	.loc 27 873 0
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$14, %edx
	cmove	%esi, %eax
.LBE13925:
.LBE13926:
	.loc 26 623 0
	testl	%eax, %eax
	je	.L4633
	cmpl	$46, %eax
	jne	.L4623
.LVL5973:
.LBB13927:
.LBB13928:
.LBB13929:
.LBB13930:
.LBB13931:
.LBB13932:
.LBB13933:
	.loc 27 1891 0
	cmpl	$46, %esi
	jne	.L4549
	.loc 27 1894 0
	movl	%ecx, %eax
	andl	$16128, %eax
	shrl	$8, %eax
.LBE13933:
.LBE13932:
	.loc 40 90 0
	cmpl	$32, %eax
	je	.L4636
.LVL5974:
.LBE13931:
.LBE13930:
	.loc 40 100 0
	leal	1(%eax), %ecx
.LVL5975:
	movl	$1, %esi
	sall	%cl, %esi
	leal	-1(%esi), %ecx
	negl	%esi
	andl	-56(%ebp), %ecx
.LVL5976:
.L4577:
.LBE13929:
.LBE13928:
	.loc 26 629 0
	testl	%ecx, %ecx
	je	.L4633
.LBB13940:
.LBB13941:
	.loc 40 107 0
	andl	-56(%ebp), %esi
.LVL5977:
.LBE13941:
.LBE13940:
.LBE13927:
.LBE13948:
.LBE13952:
	.loc 26 655 0
	cmpl	%esi, %edi
	je	.L4637
.L4532:
	.loc 26 664 0
	movl	12(%ebp), %ecx
	.loc 26 662 0
	movl	-36(%ebp), %ebx
	movl	-32(%ebp), %esi
.LVL5978:
	.loc 26 664 0
	testl	%ecx, %ecx
	.loc 26 662 0
	movl	%ebx, (%edi)
	movl	%esi, 4(%edi)
	.loc 26 664 0
	jne	.L4536
.LVL5979:
.LBB13953:
.LBB13954:
.LBB13955:
.LBB13956:
	.loc 27 872 0
	cmpl	$14, %edx
	je	.L4638
.LVL5980:
.L4536:
.LBE13956:
.LBE13955:
.LBE13954:
.LBE13953:
.LBB13962:
.LBB13963:
	.loc 26 700 0
	movl	(%edi), %edx
.LVL5981:
.LBB13964:
.LBB13965:
	.loc 27 872 0
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L4639
.L4534:
.LBE13965:
.LBE13964:
	.loc 26 700 0
	movl	$__FUNCTION__.6570, 12(%esp)
.LVL5982:
	movl	$700, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC264, (%esp)
	call	_assert_fail
.LVL5983:
.L4637:
.LBE13963:
.LBE13962:
	.loc 26 655 0
	subl	$1, %ecx
	jne	.L4532
.LVL5984:
	.p2align 4,,7
	.p2align 3
.L4633:
	movl	(%edi), %eax
.LVL5985:
.L4526:
.LBE13913:
.LBE13912:
.LBB14048:
.LBB14049:
.LBB14050:
.LBB14051:
	.loc 27 872 0
	movl	%eax, %ecx
	.loc 27 874 0
	movzbl	%al, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 874 0
	andl	$15, %eax
.LVL5986:
	cmpl	$14, %ecx
	cmovne	%eax, %edx
.LBE14051:
.LBE14050:
	.loc 26 593 0
	testl	%edx, %edx
	je	.L4634
.LVL5987:
.LBB14052:
.LBB14053:
	.loc 26 597 0
	movl	12(%edi), %ebx
.LVL5988:
	.loc 26 601 0
	movl	8(%edi), %ecx
.LBB14054:
.LBB14055:
	.loc 27 767 0
	movl	%ebx, %eax
	andl	$-8, %eax
.LVL5989:
.LBE14055:
.LBE14054:
	.loc 26 601 0
	andl	$-8, %ecx
.LVL5990:
	je	.L4566
.LVL5991:
.LBB14056:
.LBB14057:
	.loc 27 774 0
	movl	12(%ecx), %edx
	andl	$7, %edx
	.loc 27 775 0
	orl	%eax, %edx
	movl	%edx, 12(%ecx)
.LVL5992:
.L4566:
.LBE14057:
.LBE14056:
	.loc 26 604 0
	testl	%eax, %eax
	je	.L4567
.LVL5993:
.LBB14058:
.LBB14059:
	.loc 27 840 0
	movl	8(%eax), %edx
.LBE14059:
.LBE14058:
.LBB14062:
.LBB14063:
	.loc 27 802 0
	andl	$1, %ebx
.LVL5994:
.LBE14063:
.LBE14062:
.LBB14065:
.LBB14060:
	.loc 27 840 0
	andl	$7, %edx
	.loc 27 841 0
	orl	%ecx, %edx
.LBE14060:
.LBE14065:
	.loc 26 609 0
	movl	12(%eax), %ecx
.LVL5995:
.LBB14066:
.LBB14061:
	.loc 27 841 0
	movl	%edx, 8(%eax)
.LBE14061:
.LBE14066:
.LBB14067:
.LBB14064:
	.loc 27 802 0
	movl	$1, %edx
	testb	$1, %cl
	cmove	%ebx, %edx
.LVL5996:
.LBE14064:
.LBE14067:
.LBB14068:
.LBB14069:
	.loc 27 818 0
	andl	$-2, %ecx
	.loc 27 819 0
	orl	%ecx, %edx
.LVL5997:
	movl	%edx, 12(%eax)
.LVL5998:
.L4567:
.LBE14069:
.LBE14068:
	.loc 26 614 0
	movl	-60(%ebp), %eax
.LVL5999:
	.loc 26 611 0
	movl	$0, (%edi)
	movl	$0, 4(%edi)
.LVL6000:
	.loc 26 612 0
	movl	$0, 8(%edi)
	.loc 26 614 0
	cmpl	$-1, %eax
	.loc 26 612 0
	movl	$0, 12(%edi)
	.loc 26 614 0
	je	.L4634
.LVL6001:
.LBB14070:
.LBB14071:
.LBB14072:
.LBB14073:
.LBB14074:
	.loc 25 47 0
	testl	%eax, %eax
.LBE14074:
.LBE14073:
	.loc 29 263 0
	movl	$0, intStateIRQTable(,%eax,4)
.LVL6002:
.LBB14082:
.LBB14079:
	.loc 25 47 0
	js	.L4640
	.loc 25 48 0
	cmpl	$31, -60(%ebp)
	jg	.L4641
	.loc 25 50 0
	cmpl	$15, -60(%ebp)
	jg	.L4634
.LVL6003:
.LBB14075:
.LBB14076:
	.loc 24 54 0
	cmpl	$7, -60(%ebp)
	jg	.L4571
	.loc 24 55 0
	movzbl	-60(%ebp), %ecx
	movl	$1, %eax
	movl	$33, %ebx
	sall	%cl, %eax
	movl	%eax, %edi
.LVL6004:
.L4572:
	.loc 24 64 0
	movl	%ebx, (%esp)
	call	in8
.LVL6005:
	movl	%ebx, (%esp)
	orl	%edi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
.LVL6006:
	.p2align 4,,7
	.p2align 3
.L4634:
.LBE14076:
.LBE14075:
.LBE14079:
.LBE14082:
.LBE14072:
.LBE14071:
.LBE14070:
.LBE14053:
.LBE14052:
.LBE14049:
.LBE14048:
	.loc 26 587 0
	xorl	%eax, %eax
.LVL6007:
.L4628:
	.loc 26 588 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6008:
	.p2align 4,,7
	.p2align 3
.L4621:
	.cfi_restore_state
.LBB14097:
.LBB14042:
.LBB14016:
.LBB13920:
.LBB13919:
	.loc 26 912 0
	movl	(%edi), %ebx
	movl	4(%edi), %esi
	movl	%edx, -56(%ebp)
.LVL6009:
	movl	%ebx, 8(%esp)
.LVL6010:
	movl	%esi, 12(%esp)
	movl	4(%eax), %edx
.LVL6011:
	movl	(%eax), %eax
.LVL6012:
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
.LVL6013:
.LBE13919:
	.loc 26 916 0
	xorl	%ecx, %ecx
	.loc 26 915 0
	movl	-56(%ebp), %edx
.LVL6014:
	testl	%eax, %eax
	jne	.L4522
	jmp	.L4521
.LVL6015:
	.p2align 4,,7
	.p2align 3
.L4623:
.LBE13920:
.LBE14016:
.LBB14017:
.LBB13949:
.LBB13944:
.LBB13945:
	.loc 26 632 0
	movl	$__func__.6546, 12(%esp)
.LVL6016:
	movl	$632, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC243, (%esp)
	call	_fail
.LVL6017:
	.p2align 4,,7
	.p2align 3
.L4639:
.LBE13945:
.LBE13944:
.LBE13949:
.LBE14017:
.LBB14018:
.LBB14009:
	.loc 26 700 0
	cmpb	$46, %dl
	jne	.L4534
.LVL6018:
.LBB13966:
.LBB13967:
.LBB13968:
.LBB13969:
.LBB13970:
.LBB13971:
	.loc 27 1894 0
	movl	%edx, %esi
	movl	4(%edi), %eax
.LVL6019:
	andl	$16128, %esi
	shrl	$8, %esi
.LBE13971:
.LBE13970:
	.loc 40 90 0
	cmpl	$32, %esi
	je	.L4540
.LVL6020:
	leal	1(%esi), %ecx
	movl	$1, %edx
	sall	%cl, %edx
	movl	%edx, %ebx
	subl	$1, %edx
	negl	%ebx
.LBE13969:
.LBE13968:
	.loc 40 107 0
	andl	%eax, %ebx
.LVL6021:
.L4541:
.LBE13967:
.LBE13966:
	.loc 26 706 0
	andl	%eax, %edx
	movl	%edx, -56(%ebp)
.LVL6022:
	je	.L4642
	.loc 26 708 0
	movl	12(%ebp), %eax
	testl	%eax, %eax
	jne	.L4643
	.loc 26 744 0
	cmpl	%ebx, %edi
	je	.L4644
	.loc 26 746 0
	movl	(%ebx), %ecx
.LVL6023:
.LBB13974:
.LBB13975:
	.loc 27 872 0
	movl	%ecx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L4645
.LVL6024:
.L4557:
.LBE13975:
.LBE13974:
.LBB13976:
.LBB13977:
	.loc 26 503 0
	movl	(%ebx), %eax
.LVL6025:
	movl	4(%ebx), %edx
	movl	%eax, -56(%ebp)
	.loc 26 504 0
	movl	(%edi), %eax
.LVL6026:
	.loc 26 503 0
	movl	%edx, -52(%ebp)
	.loc 26 504 0
	movl	4(%edi), %edx
	.loc 26 506 0
	movl	%edi, 20(%esp)
.LVL6027:
	movl	%ebx, 8(%esp)
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%edx, 16(%esp)
	movl	-52(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
.LVL6028:
	call	cteSwap
.LVL6029:
.L4547:
.LBE13977:
.LBE13976:
.LBE14009:
.LBE14018:
.LBB14019:
.LBB14020:
	.loc 23 24 0
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	.loc 23 34 0
	cmpl	$99, %eax
	.loc 23 24 0
	movl	%eax, ksWorkUnitsCompleted
	.loc 23 34 0
	jbe	.L4574
.LBB14021:
	.loc 23 35 0
	movl	$0, ksWorkUnitsCompleted
.LVL6030:
.LBB14022:
.LBB14023:
.LBB14024:
.LBB14025:
.LBB14026:
.LBB14027:
	.loc 8 63 0
	movl	-65008, %eax
.LBE14027:
.LBE14026:
	.loc 8 204 0
	testl	%eax, %eax
	jne	.L4575
.LVL6031:
.LBE14025:
.LBE14024:
.LBB14028:
.LBB14029:
	.loc 24 77 0
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
.LVL6032:
	.loc 24 80 0
	movl	$32, (%esp)
	call	in8
.LVL6033:
.LBE14029:
.LBE14028:
	.loc 25 105 0
	testb	%al, %al
	je	.L4574
.LVL6034:
.L4575:
.LBE14023:
.LBE14022:
.LBE14021:
.LBE14020:
.LBE14019:
.LBE14042:
.LBE14097:
	.loc 26 588 0
	leal	-12(%ebp), %esp
.LBB14098:
.LBB14043:
.LBB14032:
.LBB14031:
.LBB14030:
	.loc 23 37 0
	movl	$4, %eax
.LBE14030:
.LBE14031:
.LBE14032:
.LBE14043:
.LBE14098:
	.loc 26 588 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL6035:
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6036:
	.p2align 4,,7
	.p2align 3
.L4643:
	.cfi_restore_state
.LBB14099:
.LBB14044:
.LBB14033:
.LBB14010:
.LBB13978:
	.loc 26 709 0
	movl	-56(%ebp), %eax
	.loc 26 711 0
	movl	$0, 4(%esp)
.LVL6037:
	.loc 26 709 0
	addl	$268435455, %eax
	sall	$4, %eax
	addl	%ebx, %eax
	.loc 26 711 0
	movl	%eax, (%esp)
	.loc 26 709 0
	movl	%eax, -64(%ebp)
.LVL6038:
	.loc 26 711 0
	call	cteDelete
.LVL6039:
	.loc 26 712 0
	testl	%eax, %eax
	jne	.L4628
	.loc 26 716 0
	movl	(%edi), %edx
.LVL6040:
.LBB13979:
.LBB13980:
	.loc 27 872 0
	movl	%edx, %eax
.LVL6041:
	.loc 27 873 0
	movzbl	%dl, %ecx
	.loc 27 872 0
	andl	$14, %eax
	movl	%eax, -60(%ebp)
	.loc 27 873 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$14, -60(%ebp)
	cmove	%ecx, %eax
.LBE13980:
.LBE13979:
	.loc 26 716 0
	testl	%eax, %eax
	je	.L4547
	cmpl	$46, %eax
	jne	.L4627
.LVL6042:
	movl	4(%edi), %eax
.LBB13981:
.LBB13982:
.LBB13983:
.LBB13984:
.LBB13985:
.LBB13986:
.LBB13987:
	.loc 27 1891 0
	cmpl	$46, %ecx
	movl	%eax, -60(%ebp)
.LVL6043:
	jne	.L4549
	.loc 27 1894 0
	andl	$16128, %edx
.LVL6044:
	shrl	$8, %edx
.LBE13987:
.LBE13986:
	.loc 40 90 0
	cmpl	$32, %edx
	je	.L4550
.LVL6045:
	leal	1(%edx), %ecx
	movl	$1, %eax
.LVL6046:
	sall	%cl, %eax
	movl	%eax, %ecx
	subl	$1, %eax
	negl	%ecx
.LBE13985:
.LBE13984:
	.loc 40 107 0
	andl	-60(%ebp), %ecx
.LVL6047:
.LBE13983:
.LBE13982:
	.loc 26 724 0
	cmpl	%ecx, %ebx
	je	.L4582
.L4551:
	.loc 26 734 0
	cmpl	%ecx, %edi
	jne	.L4589
	cmpl	%ebx, %edi
	jne	.L4547
.L4589:
	movl	$__FUNCTION__.6570, 12(%esp)
.LVL6048:
	movl	$734, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC267, (%esp)
	call	_assert_fail
.LVL6049:
	.p2align 4,,7
	.p2align 3
.L4540:
.LBE13981:
.LBE13978:
.LBB13996:
.LBB13972:
	.loc 40 107 0
	movl	%eax, %ebx
.LBE13972:
.LBE13996:
	.loc 26 701 0
	movl	$15, %edx
.LBB13997:
.LBB13973:
	.loc 40 107 0
	andl	$-16, %ebx
.LVL6050:
	jmp	.L4541
.LVL6051:
	.p2align 4,,7
	.p2align 3
.L4638:
.LBE13973:
.LBE13997:
.LBE14010:
.LBE14033:
.LBB14034:
.LBB13961:
.LBB13957:
.LBB13958:
.LBB13959:
.LBB13960:
	.loc 40 90 0
	cmpl	$32, %eax
	movl	$-16, %edx
	je	.L4537
	leal	1(%eax), %ecx
	movb	$-1, %dl
	sall	%cl, %edx
.L4537:
.LVL6052:
.LBE13960:
.LBE13959:
	.loc 40 107 0
	movl	-56(%ebp), %ebx
	andl	%edx, %ebx
.LBE13958:
.LBE13957:
	.loc 26 639 0
	cmpl	%ebx, %edi
	jne	.L4536
.LBE13961:
.LBE14034:
.LBE14044:
.LBE14099:
	.loc 26 587 0
	xorl	%eax, %eax
	jmp	.L4628
.LVL6053:
	.p2align 4,,7
	.p2align 3
.L4645:
.LBB14100:
.LBB14045:
.LBB14035:
.LBB14011:
	.loc 26 746 0
	cmpb	$46, %cl
	jne	.L4557
.LVL6054:
.LBB13998:
.LBB13999:
.LBB14000:
.LBB14001:
.LBB14002:
.LBB14003:
	.loc 27 1894 0
	andl	$16128, %ecx
.LVL6055:
	movl	4(%ebx), %eax
.LVL6056:
.LBE14003:
.LBE14002:
	.loc 40 90 0
	movl	$-16, %edx
.LBB14005:
.LBB14004:
	.loc 27 1894 0
	shrl	$8, %ecx
.LBE14004:
.LBE14005:
	.loc 40 90 0
	cmpl	$32, %ecx
	je	.L4558
	addl	$1, %ecx
	movb	$-1, %dl
	sall	%cl, %edx
.L4558:
.LVL6057:
.LBE14001:
.LBE14000:
	.loc 40 107 0
	andl	%edx, %eax
.LVL6058:
.LBE13999:
.LBE13998:
	.loc 26 748 0
	cmpl	%eax, %ebx
	jne	.L4557
	movl	$__FUNCTION__.6570, 12(%esp)
.LVL6059:
	movl	$748, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC270, (%esp)
	call	_assert_fail
.LVL6060:
	.p2align 4,,7
	.p2align 3
.L4636:
.LBE14011:
.LBE14035:
.LBB14036:
.LBB13950:
.LBB13946:
.LBB13942:
.LBB13938:
	.loc 40 100 0
	movl	-56(%ebp), %ecx
.LVL6061:
	movl	$-16, %esi
	andl	$15, %ecx
.LVL6062:
	jmp	.L4577
.LVL6063:
	.p2align 4,,7
	.p2align 3
.L4627:
.LBE13938:
.LBE13942:
.LBE13946:
.LBE13950:
.LBE14036:
.LBB14037:
.LBB14012:
.LBB14006:
	.loc 26 740 0
	movl	$__func__.6577, 12(%esp)
.LVL6064:
	movl	$740, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC268, (%esp)
	call	_fail
.LVL6065:
	.p2align 4,,7
	.p2align 3
.L4635:
.LBE14006:
.LBE14012:
.LBE14037:
	.loc 26 690 0
	movl	$-1, -60(%ebp)
	jmp	.L4526
.LVL6066:
.L4550:
.LBB14038:
.LBB14013:
.LBB14007:
.LBB13994:
.LBB13989:
.LBB13988:
	.loc 40 107 0
	movl	-60(%ebp), %ecx
	andl	$-16, %ecx
.LVL6067:
.LBE13988:
.LBE13989:
	.loc 26 724 0
	cmpl	%ecx, %ebx
	jne	.L4551
	movl	$15, %eax
.L4582:
.LVL6068:
.LBB13990:
.LBB13991:
	.loc 40 100 0
	andl	-60(%ebp), %eax
.LBE13991:
.LBE13990:
	.loc 26 724 0
	cmpl	%eax, -56(%ebp)
	jne	.L4551
.LVL6069:
	.loc 26 725 0
	cmpl	%edx, %esi
	jne	.L4551
	.loc 26 727 0
	movl	-64(%ebp), %eax
	movl	(%eax), %edx
.LVL6070:
.LBB13992:
.LBB13993:
	.loc 27 872 0
	movl	%edx, %ecx
.LVL6071:
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL6072:
	cmpl	$14, %ecx
	cmove	%edx, %eax
.LBE13993:
.LBE13992:
	.loc 26 727 0
	testl	%eax, %eax
	jne	.L4646
	.loc 26 729 0
	movl	-56(%ebp), %eax
	subl	$1, %eax
	.loc 26 728 0
	movl	%eax, (%esp)
.LVL6073:
	movl	(%edi), %edx
	leal	-48(%ebp), %eax
	movl	4(%edi), %ecx
	call	cap_zombie_cap_set_capZombieNumber
.LVL6074:
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, (%edi)
	movl	%edx, 4(%edi)
	jmp	.L4547
.LVL6075:
.L4571:
.LBE13994:
.LBE14007:
.LBE14013:
.LBE14038:
.LBE14045:
.LBE14100:
.LBB14101:
.LBB14095:
.LBB14093:
.LBB14091:
.LBB14089:
.LBB14087:
.LBB14085:
.LBB14083:
.LBB14080:
.LBB14078:
.LBB14077:
	.loc 24 58 0
	movl	-60(%ebp), %ecx
	movl	$1, %eax
	movl	$161, %ebx
	subl	$8, %ecx
	sall	%cl, %eax
	movl	%eax, %edi
.LVL6076:
	jmp	.L4572
.LVL6077:
.L4549:
.LBE14077:
.LBE14078:
.LBE14080:
.LBE14083:
.LBE14085:
.LBE14087:
.LBE14089:
.LBE14091:
.LBE14093:
.LBE14095:
.LBE14101:
.LBB14102:
.LBB14046:
.LBB14039:
.LBB13951:
.LBB13947:
.LBB13943:
.LBB13939:
.LBB13937:
.LBB13936:
.LBB13935:
.LBB13934:
	call	cap_zombie_cap_get_capZombieType.isra.94.part.95
.LVL6078:
.L4642:
.LBE13934:
.LBE13935:
.LBE13936:
.LBE13937:
.LBE13939:
.LBE13943:
.LBE13947:
.LBE13951:
.LBE14039:
.LBB14040:
.LBB14014:
	.loc 26 706 0
	movl	$__FUNCTION__.6570, 12(%esp)
.LVL6079:
	movl	$706, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC265, (%esp)
	call	_assert_fail
.LVL6080:
.L4644:
	.loc 26 744 0
	movl	$__FUNCTION__.6570, 12(%esp)
.LVL6081:
	movl	$744, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC269, (%esp)
	call	_assert_fail
.LVL6082:
.L4641:
.LBE14014:
.LBE14040:
.LBE14046:
.LBE14102:
.LBB14103:
.LBB14096:
.LBB14094:
.LBB14092:
.LBB14090:
.LBB14088:
.LBB14086:
.LBB14084:
.LBB14081:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL6083:
.L4640:
	call	maskInterrupt.part.208
.LVL6084:
.L4646:
.LBE14081:
.LBE14084:
.LBE14086:
.LBE14088:
.LBE14090:
.LBE14092:
.LBE14094:
.LBE14096:
.LBE14103:
.LBB14104:
.LBB14047:
.LBB14041:
.LBB14015:
.LBB14008:
.LBB13995:
	.loc 26 727 0
	movl	$__FUNCTION__.6570, 12(%esp)
.LVL6085:
	movl	$727, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC266, (%esp)
	call	_assert_fail
.LVL6086:
.LBE13995:
.LBE14008:
.LBE14015:
.LBE14041:
.LBE14047:
.LBE14104:
	.cfi_endproc
.LFE518:
	.size	cteDelete, .-cteDelete
	.p2align 4,,15
	.type	finaliseSlot.constprop.241, @function
finaliseSlot.constprop.241:
.LFB916:
	.loc 26 644 0
	.cfi_startproc
.LVL6087:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	%edx, %ebx
	subl	$76, %esp
	movl	%eax, -52(%ebp)
.LVL6088:
.L4684:
	.loc 26 651 0
	movl	(%ebx), %edx
.LVL6089:
.LBB14221:
.LBB14222:
	.loc 27 872 0
	movl	%edx, %ecx
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL6090:
	cmpl	$14, %ecx
	cmove	%edx, %eax
.LBE14222:
.LBE14221:
	.loc 26 651 0
	testl	%eax, %eax
	je	.L4719
.LVL6091:
.LBB14223:
.LBB14224:
	.loc 26 906 0
	movl	8(%ebx), %eax
	.loc 26 904 0
	movl	12(%ebx), %edx
.LVL6092:
	.loc 26 906 0
	andl	$-8, %eax
	jne	.L4713
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
.LVL6093:
.L4649:
	.loc 26 918 0
	andl	$-8, %edx
.LVL6094:
	.loc 26 919 0
	movl	$1, %ecx
	.loc 26 918 0
	je	.L4650
.LVL6095:
.LBB14225:
	.loc 26 924 0
	movl	(%edx), %eax
	movl	4(%edx), %edx
.LVL6096:
	movl	%esi, (%esp)
	movl	%edi, 4(%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	call	sameObjectAs
.LVL6097:
	xorl	%ecx, %ecx
	testl	%eax, %eax
	sete	%cl
.L4650:
.LBE14225:
.LBE14224:
.LBE14223:
	.loc 26 653 0
	leal	-36(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, (%esp)
	movl	$0, 16(%esp)
	call	finaliseCap
.LVL6098:
	movl	-36(%ebp), %ecx
	movl	-28(%ebp), %eax
	movl	-32(%ebp), %esi
.LVL6099:
.LBB14228:
.LBB14229:
.LBB14230:
.LBB14231:
	.loc 27 872 0
	movl	%ecx, %edi
	.loc 27 873 0
	movzbl	%cl, %edx
.LBE14231:
.LBE14230:
.LBE14229:
.LBE14228:
	.loc 26 653 0
	movl	%eax, -56(%ebp)
.LVL6100:
.LBB14262:
.LBB14257:
.LBB14234:
.LBB14232:
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	movl	%ecx, %eax
.LVL6101:
	andl	$15, %eax
.LBE14232:
.LBE14234:
.LBE14257:
.LBE14262:
	.loc 26 653 0
	subl	$4, %esp
.LBB14263:
.LBB14258:
.LBB14235:
.LBB14233:
	.loc 27 873 0
	cmpl	$14, %edi
	cmove	%edx, %eax
.LBE14233:
.LBE14235:
	.loc 26 623 0
	testl	%eax, %eax
	je	.L4654
	cmpl	$46, %eax
	jne	.L4714
.LVL6102:
.LBB14236:
.LBB14237:
.LBB14238:
.LBB14239:
.LBB14240:
.LBB14241:
.LBB14242:
	.loc 27 1891 0
	cmpl	$46, %edx
	jne	.L4672
	.loc 27 1894 0
	andl	$16128, %ecx
.LVL6103:
	shrl	$8, %ecx
.LBE14242:
.LBE14241:
	.loc 40 90 0
	cmpl	$32, %ecx
	je	.L4720
.LVL6104:
.LBE14240:
.LBE14239:
	.loc 40 100 0
	addl	$1, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	leal	-1(%eax), %edx
	negl	%eax
	andl	%esi, %edx
.LVL6105:
.LBE14238:
.LBE14237:
	.loc 26 629 0
	testl	%edx, %edx
	je	.L4654
.LVL6106:
.L4725:
.LBB14249:
.LBB14250:
	.loc 40 107 0
	andl	%esi, %eax
.LBE14250:
.LBE14249:
.LBE14236:
.LBE14258:
.LBE14263:
	.loc 26 655 0
	cmpl	%eax, %ebx
	je	.L4721
.L4660:
	.loc 26 662 0
	movl	-36(%ebp), %eax
	movl	%eax, %edx
	movl	%eax, (%ebx)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%ebx)
.LVL6107:
.LBB14264:
.LBB14265:
.LBB14266:
.LBB14267:
	.loc 27 872 0
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L4722
.L4662:
.LBE14267:
.LBE14266:
	.loc 26 700 0
	movl	$__FUNCTION__.6570, 12(%esp)
.LVL6108:
	movl	$700, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC264, (%esp)
	call	_assert_fail
.LVL6109:
	.p2align 4,,7
	.p2align 3
.L4713:
.LBE14265:
.LBE14264:
.LBB14304:
.LBB14227:
.LBB14226:
	.loc 26 912 0
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
	movl	%edx, -56(%ebp)
.LVL6110:
	movl	%esi, 8(%esp)
.LVL6111:
	movl	%edi, 12(%esp)
	movl	4(%eax), %edx
.LVL6112:
	movl	(%eax), %eax
.LVL6113:
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
.LVL6114:
.LBE14226:
	.loc 26 916 0
	xorl	%ecx, %ecx
	.loc 26 915 0
	movl	-56(%ebp), %edx
.LVL6115:
	testl	%eax, %eax
	jne	.L4650
	jmp	.L4649
.LVL6116:
	.p2align 4,,7
	.p2align 3
.L4714:
.LBE14227:
.LBE14304:
.LBB14305:
.LBB14259:
.LBB14253:
.LBB14254:
	.loc 26 632 0
	movl	$__func__.6546, 12(%esp)
.LVL6117:
	movl	$632, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC243, (%esp)
	call	_fail
.LVL6118:
	.p2align 4,,7
	.p2align 3
.L4722:
.LBE14254:
.LBE14253:
.LBE14259:
.LBE14305:
.LBB14306:
.LBB14299:
	.loc 26 700 0
	cmpb	$46, %dl
	jne	.L4662
.LVL6119:
.LBB14268:
.LBB14269:
.LBB14270:
.LBB14271:
.LBB14272:
.LBB14273:
	.loc 27 1894 0
	movl	%edx, %esi
.LVL6120:
	movl	4(%ebx), %eax
.LVL6121:
	andl	$16128, %esi
	shrl	$8, %esi
.LBE14273:
.LBE14272:
	.loc 40 90 0
	cmpl	$32, %esi
	je	.L4664
.LVL6122:
	leal	1(%esi), %ecx
	movl	$1, %edx
	sall	%cl, %edx
	movl	%edx, %edi
	subl	$1, %edx
	negl	%edi
.LBE14271:
.LBE14270:
	.loc 40 107 0
	andl	%eax, %edi
.LVL6123:
.L4665:
.LBE14269:
.LBE14268:
	.loc 26 706 0
	andl	%eax, %edx
	movl	%edx, -56(%ebp)
	je	.L4723
	movl	%edx, %eax
.LBB14276:
	.loc 26 709 0
	addl	$268435455, %eax
	sall	$4, %eax
	addl	%edi, %eax
	.loc 26 711 0
	movl	$0, 4(%esp)
.LVL6124:
	movl	%eax, (%esp)
	.loc 26 709 0
	movl	%eax, -64(%ebp)
.LVL6125:
	.loc 26 711 0
	call	cteDelete
.LVL6126:
	.loc 26 712 0
	testl	%eax, %eax
	jne	.L4666
	.loc 26 716 0
	movl	(%ebx), %edx
.LVL6127:
.LBB14277:
.LBB14278:
	.loc 27 872 0
	movl	%edx, %eax
.LVL6128:
	.loc 27 873 0
	movzbl	%dl, %ecx
	.loc 27 872 0
	andl	$14, %eax
	movl	%eax, -60(%ebp)
	.loc 27 873 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$14, -60(%ebp)
	cmove	%ecx, %eax
.LBE14278:
.LBE14277:
	.loc 26 716 0
	testl	%eax, %eax
	je	.L4670
	cmpl	$46, %eax
	jne	.L4716
.LVL6129:
	movl	4(%ebx), %eax
.LBB14279:
.LBB14280:
.LBB14281:
.LBB14282:
.LBB14283:
.LBB14284:
.LBB14285:
	.loc 27 1891 0
	cmpl	$46, %ecx
	movl	%eax, -68(%ebp)
.LVL6130:
	jne	.L4672
	.loc 27 1894 0
	movl	%edx, %eax
	andl	$16128, %eax
	shrl	$8, %eax
.LBE14285:
.LBE14284:
	.loc 40 90 0
	cmpl	$32, %eax
	je	.L4673
.LVL6131:
	movl	$1, -60(%ebp)
	leal	1(%eax), %ecx
	sall	%cl, -60(%ebp)
	movl	-60(%ebp), %edx
	negl	%edx
.LBE14283:
.LBE14282:
	.loc 40 107 0
	andl	-68(%ebp), %edx
.LVL6132:
.LBE14281:
.LBE14280:
	.loc 26 724 0
	cmpl	%edx, %edi
	je	.L4724
.L4674:
	.loc 26 734 0
	cmpl	%edx, %ebx
	jne	.L4694
	cmpl	%edi, %ebx
	je	.L4694
.LVL6133:
.L4670:
.LBE14279:
.LBE14276:
.LBE14299:
.LBE14306:
.LBB14307:
.LBB14308:
	.loc 23 24 0
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	.loc 23 34 0
	cmpl	$99, %eax
	.loc 23 24 0
	movl	%eax, ksWorkUnitsCompleted
	.loc 23 34 0
	jbe	.L4684
.LBB14309:
	.loc 23 35 0
	movl	$0, ksWorkUnitsCompleted
.LVL6134:
.LBB14310:
.LBB14311:
.LBB14312:
.LBB14313:
.LBB14314:
.LBB14315:
	.loc 8 63 0
	movl	-65008, %eax
.LBE14315:
.LBE14314:
	.loc 8 204 0
	testl	%eax, %eax
	jne	.L4685
.LVL6135:
.LBE14313:
.LBE14312:
.LBB14316:
.LBB14317:
	.loc 24 77 0
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
.LVL6136:
	.loc 24 80 0
	movl	$32, (%esp)
	call	in8
.LVL6137:
.LBE14317:
.LBE14316:
	.loc 25 105 0
	testb	%al, %al
	je	.L4684
.LVL6138:
.L4685:
.LBE14311:
.LBE14310:
.LBE14309:
.LBE14308:
.LBE14307:
	.loc 26 684 0
	movl	-52(%ebp), %eax
	movl	$4, (%eax)
	movl	$0, 4(%eax)
	movl	$-1, 8(%eax)
	.loc 26 691 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL6139:
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
.LVL6140:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6141:
	.p2align 4,,7
	.p2align 3
.L4666:
	.cfi_restore_state
	.loc 26 676 0
	movl	-52(%ebp), %edi
.LVL6142:
	movl	%eax, (%edi)
	movl	%edi, %eax
.LVL6143:
	movl	$0, 4(%edi)
	movl	$-1, 8(%edi)
.LVL6144:
.L4647:
	.loc 26 691 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6145:
	.p2align 4,,7
	.p2align 3
.L4664:
	.cfi_restore_state
.LBB14318:
.LBB14300:
.LBB14294:
.LBB14274:
	.loc 40 107 0
	movl	%eax, %edi
.LBE14274:
.LBE14294:
	.loc 26 701 0
	movl	$15, %edx
.LBB14295:
.LBB14275:
	.loc 40 107 0
	andl	$-16, %edi
.LVL6146:
	jmp	.L4665
.LVL6147:
	.p2align 4,,7
	.p2align 3
.L4716:
.LBE14275:
.LBE14295:
.LBB14296:
	.loc 26 740 0
	movl	$__func__.6577, 12(%esp)
.LVL6148:
	movl	$740, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC268, (%esp)
	call	_fail
.LVL6149:
	.p2align 4,,7
	.p2align 3
.L4720:
.LBE14296:
.LBE14300:
.LBE14318:
.LBB14319:
.LBB14260:
.LBB14255:
.LBB14251:
.LBB14247:
	.loc 40 100 0
	movl	%esi, %edx
	movl	$-16, %eax
	andl	$15, %edx
.LVL6150:
.LBE14247:
.LBE14251:
	.loc 26 629 0
	testl	%edx, %edx
	jne	.L4725
.LVL6151:
	.p2align 4,,7
	.p2align 3
.L4654:
.LBE14255:
.LBE14260:
.LBE14319:
	.loc 26 659 0
	movl	-52(%ebp), %eax
	movl	-56(%ebp), %ebx
.LVL6152:
	movl	$0, (%eax)
	movl	$1, 4(%eax)
	movl	%ebx, 8(%eax)
	jmp	.L4647
.LVL6153:
.L4673:
.LBB14320:
.LBB14301:
.LBB14297:
.LBB14292:
.LBB14287:
.LBB14286:
	.loc 40 107 0
	movl	-68(%ebp), %edx
	andl	$-16, %edx
.LVL6154:
.LBE14286:
.LBE14287:
	.loc 26 724 0
	cmpl	%edx, %edi
	jne	.L4674
	movl	$15, %ecx
	.p2align 4,,7
	.p2align 3
.L4690:
.LVL6155:
.LBB14288:
.LBB14289:
	.loc 40 100 0
	andl	-68(%ebp), %ecx
.LBE14289:
.LBE14288:
	.loc 26 724 0
	cmpl	%ecx, -56(%ebp)
	jne	.L4674
.LVL6156:
	.loc 26 725 0
	cmpl	%eax, %esi
	jne	.L4674
	.loc 26 727 0
	movl	-64(%ebp), %eax
	movl	(%eax), %edx
.LVL6157:
.LBB14290:
.LBB14291:
	.loc 27 872 0
	movl	%edx, %ecx
	.loc 27 873 0
	movl	%edx, %eax
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL6158:
	cmpl	$14, %ecx
	cmove	%edx, %eax
.LBE14291:
.LBE14290:
	.loc 26 727 0
	testl	%eax, %eax
	jne	.L4726
	.loc 26 729 0
	movl	-56(%ebp), %eax
	subl	$1, %eax
	.loc 26 728 0
	movl	%eax, (%esp)
.LVL6159:
	movl	(%ebx), %edx
	leal	-48(%ebp), %eax
	movl	4(%ebx), %ecx
	call	cap_zombie_cap_set_capZombieNumber
.LVL6160:
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, (%ebx)
	movl	%edx, 4(%ebx)
	jmp	.L4670
.LVL6161:
.L4694:
	.loc 26 734 0
	movl	$__FUNCTION__.6570, 12(%esp)
.LVL6162:
	movl	$734, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC267, (%esp)
	call	_assert_fail
.LVL6163:
	.p2align 4,,7
	.p2align 3
.L4719:
.LBE14292:
.LBE14297:
.LBE14301:
.LBE14320:
	.loc 26 690 0
	movl	-52(%ebp), %eax
	movl	$0, (%eax)
	movl	$1, 4(%eax)
	movl	$-1, 8(%eax)
	jmp	.L4647
.LVL6164:
	.p2align 4,,7
	.p2align 3
.L4724:
	movl	-60(%ebp), %ecx
	subl	$1, %ecx
	jmp	.L4690
.LVL6165:
.L4672:
.LBB14321:
.LBB14261:
.LBB14256:
.LBB14252:
.LBB14248:
.LBB14246:
.LBB14245:
.LBB14244:
.LBB14243:
	call	cap_zombie_cap_get_capZombieType.isra.94.part.95
.LVL6166:
.L4723:
.LBE14243:
.LBE14244:
.LBE14245:
.LBE14246:
.LBE14248:
.LBE14252:
.LBE14256:
.LBE14261:
.LBE14321:
.LBB14322:
.LBB14302:
	.loc 26 706 0
	movl	$__FUNCTION__.6570, 12(%esp)
.LVL6167:
	movl	$706, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC265, (%esp)
	call	_assert_fail
.LVL6168:
.L4721:
.LBE14302:
.LBE14322:
	.loc 26 655 0
	subl	$1, %edx
	jne	.L4660
	jmp	.L4654
.LVL6169:
.L4726:
.LBB14323:
.LBB14303:
.LBB14298:
.LBB14293:
	.loc 26 727 0
	movl	$__FUNCTION__.6570, 12(%esp)
.LVL6170:
	movl	$727, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	$.LC266, (%esp)
	call	_assert_fail
.LVL6171:
.LBE14293:
.LBE14298:
.LBE14303:
.LBE14323:
	.cfi_endproc
.LFE916:
	.size	finaliseSlot.constprop.241, .-finaliseSlot.constprop.241
	.p2align 4,,15
	.type	cteDelete.constprop.243, @function
cteDelete.constprop.243:
.LFB914:
	.loc 26 575 0
	.cfi_startproc
.LVL6172:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.loc 26 579 0
	movl	%eax, %edx
	.loc 26 575 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%eax, %ebx
	subl	$32, %esp
	.cfi_def_cfa_offset 48
	.loc 26 579 0
	leal	20(%esp), %eax
.LVL6173:
	call	finaliseSlot.constprop.241
.LVL6174:
	movl	20(%esp), %eax
.LVL6175:
	.loc 26 580 0
	testl	%eax, %eax
	jne	.L4728
.LBB14358:
.LBB14359:
	.loc 26 593 0
	movl	(%ebx), %edx
.LBE14359:
.LBE14358:
	.loc 26 585 0
	movl	28(%esp), %ecx
.LVL6176:
.LBB14398:
.LBB14396:
.LBB14360:
.LBB14361:
	.loc 27 872 0
	movl	%edx, %esi
	.loc 27 873 0
	movl	%edx, %eax
.LVL6177:
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL6178:
	cmpl	$14, %esi
	cmove	%edx, %eax
.LBE14361:
.LBE14360:
	.loc 26 593 0
	testl	%eax, %eax
	je	.L4752
.LVL6179:
.LBB14362:
.LBB14363:
	.loc 26 597 0
	movl	12(%ebx), %edi
.LVL6180:
	.loc 26 601 0
	movl	8(%ebx), %esi
.LBB14364:
.LBB14365:
	.loc 27 767 0
	movl	%edi, %eax
	andl	$-8, %eax
.LVL6181:
.LBE14365:
.LBE14364:
	.loc 26 601 0
	andl	$-8, %esi
.LVL6182:
	je	.L4732
.LVL6183:
.LBB14366:
.LBB14367:
	.loc 27 774 0
	movl	12(%esi), %edx
	andl	$7, %edx
	.loc 27 775 0
	orl	%eax, %edx
	movl	%edx, 12(%esi)
.LVL6184:
.L4732:
.LBE14367:
.LBE14366:
	.loc 26 604 0
	testl	%eax, %eax
	je	.L4733
.LVL6185:
.LBB14368:
.LBB14369:
	.loc 27 840 0
	movl	8(%eax), %edx
.LBE14369:
.LBE14368:
.LBB14372:
.LBB14373:
	.loc 27 802 0
	andl	$1, %edi
.LVL6186:
.LBE14373:
.LBE14372:
.LBB14375:
.LBB14370:
	.loc 27 840 0
	andl	$7, %edx
	.loc 27 841 0
	orl	%esi, %edx
.LBE14370:
.LBE14375:
	.loc 26 609 0
	movl	12(%eax), %esi
.LVL6187:
.LBB14376:
.LBB14371:
	.loc 27 841 0
	movl	%edx, 8(%eax)
.LBE14371:
.LBE14376:
.LBB14377:
.LBB14374:
	.loc 27 802 0
	movl	$1, %edx
	testl	$1, %esi
	cmove	%edi, %edx
.LVL6188:
.LBE14374:
.LBE14377:
.LBB14378:
.LBB14379:
	.loc 27 818 0
	andl	$-2, %esi
	.loc 27 819 0
	orl	%esi, %edx
.LVL6189:
	movl	%edx, 12(%eax)
.LVL6190:
.L4733:
.LBE14379:
.LBE14378:
	.loc 26 614 0
	cmpl	$-1, %ecx
	.loc 26 611 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
.LVL6191:
	.loc 26 612 0
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	.loc 26 614 0
	je	.L4752
.LVL6192:
.LBB14380:
.LBB14381:
.LBB14382:
.LBB14383:
.LBB14384:
	.loc 25 47 0
	testl	%ecx, %ecx
.LBE14384:
.LBE14383:
	.loc 29 263 0
	movl	$0, intStateIRQTable(,%ecx,4)
.LVL6193:
.LBB14389:
.LBB14387:
	.loc 25 47 0
	js	.L4753
	.loc 25 48 0
	cmpl	$31, %ecx
	jg	.L4754
	.loc 25 50 0
	cmpl	$15, %ecx
	jle	.L4755
.LVL6194:
.L4752:
.LBE14387:
.LBE14389:
.LBE14382:
.LBE14381:
.LBE14380:
.LBE14363:
.LBE14362:
.LBE14396:
.LBE14398:
	.loc 26 587 0
	xorl	%eax, %eax
.LVL6195:
.L4728:
	.loc 26 588 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL6196:
	.p2align 4,,7
	.p2align 3
.L4755:
	.cfi_restore_state
.LBB14399:
.LBB14397:
.LBB14395:
.LBB14394:
.LBB14393:
.LBB14392:
.LBB14391:
.LBB14390:
.LBB14388:
.LBB14385:
.LBB14386:
	.loc 24 54 0
	cmpl	$7, %ecx
	jle	.L4756
	.loc 24 58 0
	subl	$8, %ecx
.LVL6197:
	movl	$1, %eax
.LVL6198:
	sall	%cl, %eax
	movl	$161, %ebx
.LVL6199:
	movl	%eax, %esi
.LVL6200:
.L4739:
	.loc 24 64 0
	movl	%ebx, (%esp)
	call	in8
.LVL6201:
	movl	%ebx, (%esp)
	orl	%esi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
.LVL6202:
	jmp	.L4752
.LVL6203:
	.p2align 4,,7
	.p2align 3
.L4756:
	.loc 24 55 0
	movl	$1, %esi
	movl	$33, %ebx
.LVL6204:
	sall	%cl, %esi
.LVL6205:
	jmp	.L4739
.LVL6206:
.L4753:
.LBE14386:
.LBE14385:
	call	maskInterrupt.part.208
.LVL6207:
.L4754:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL6208:
.LBE14388:
.LBE14390:
.LBE14391:
.LBE14392:
.LBE14393:
.LBE14394:
.LBE14395:
.LBE14397:
.LBE14399:
	.cfi_endproc
.LFE914:
	.size	cteDelete.constprop.243, .-cteDelete.constprop.243
	.p2align 4,,15
	.globl	invokeCNodeDelete
	.type	invokeCNodeDelete, @function
invokeCNodeDelete:
.LFB506:
	.loc 26 316 0
	.cfi_startproc
.LVL6209:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$32, %esp
	.cfi_def_cfa_offset 48
	.loc 26 316 0
	movl	48(%esp), %ebx
.LVL6210:
.LBB14436:
.LBB14437:
	.loc 26 579 0
	leal	20(%esp), %eax
	movl	%ebx, %edx
	call	finaliseSlot.constprop.241
.LVL6211:
	movl	20(%esp), %eax
.LVL6212:
	.loc 26 580 0
	testl	%eax, %eax
	jne	.L4758
.LBB14438:
.LBB14439:
	.loc 26 593 0
	movl	(%ebx), %edx
.LBE14439:
.LBE14438:
	.loc 26 585 0
	movl	28(%esp), %ecx
.LVL6213:
.LBB14478:
.LBB14476:
.LBB14440:
.LBB14441:
	.loc 27 872 0
	movl	%edx, %esi
	.loc 27 873 0
	movl	%edx, %eax
.LVL6214:
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %eax
	movzbl	%dl, %edx
.LVL6215:
	cmpl	$14, %esi
	cmove	%edx, %eax
.LBE14441:
.LBE14440:
	.loc 26 593 0
	testl	%eax, %eax
	je	.L4782
.LVL6216:
.LBB14442:
.LBB14443:
	.loc 26 597 0
	movl	12(%ebx), %edi
.LVL6217:
	.loc 26 601 0
	movl	8(%ebx), %esi
.LBB14444:
.LBB14445:
	.loc 27 767 0
	movl	%edi, %eax
	andl	$-8, %eax
.LVL6218:
.LBE14445:
.LBE14444:
	.loc 26 601 0
	andl	$-8, %esi
.LVL6219:
	je	.L4762
.LVL6220:
.LBB14446:
.LBB14447:
	.loc 27 774 0
	movl	12(%esi), %edx
	andl	$7, %edx
	.loc 27 775 0
	orl	%eax, %edx
	movl	%edx, 12(%esi)
.LVL6221:
.L4762:
.LBE14447:
.LBE14446:
	.loc 26 604 0
	testl	%eax, %eax
	je	.L4763
.LVL6222:
.LBB14448:
.LBB14449:
	.loc 27 840 0
	movl	8(%eax), %edx
.LBE14449:
.LBE14448:
.LBB14452:
.LBB14453:
	.loc 27 802 0
	andl	$1, %edi
.LVL6223:
.LBE14453:
.LBE14452:
.LBB14455:
.LBB14450:
	.loc 27 840 0
	andl	$7, %edx
	.loc 27 841 0
	orl	%esi, %edx
.LBE14450:
.LBE14455:
	.loc 26 609 0
	movl	12(%eax), %esi
.LVL6224:
.LBB14456:
.LBB14451:
	.loc 27 841 0
	movl	%edx, 8(%eax)
.LBE14451:
.LBE14456:
.LBB14457:
.LBB14454:
	.loc 27 802 0
	movl	$1, %edx
	testl	$1, %esi
	cmove	%edi, %edx
.LVL6225:
.LBE14454:
.LBE14457:
.LBB14458:
.LBB14459:
	.loc 27 818 0
	andl	$-2, %esi
	.loc 27 819 0
	orl	%esi, %edx
.LVL6226:
	movl	%edx, 12(%eax)
.LVL6227:
.L4763:
.LBE14459:
.LBE14458:
	.loc 26 614 0
	cmpl	$-1, %ecx
	.loc 26 611 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
.LVL6228:
	.loc 26 612 0
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	.loc 26 614 0
	je	.L4782
.LVL6229:
.LBB14460:
.LBB14461:
.LBB14462:
.LBB14463:
.LBB14464:
	.loc 25 47 0
	testl	%ecx, %ecx
.LBE14464:
.LBE14463:
	.loc 29 263 0
	movl	$0, intStateIRQTable(,%ecx,4)
.LVL6230:
.LBB14469:
.LBB14467:
	.loc 25 47 0
	js	.L4783
	.loc 25 48 0
	cmpl	$31, %ecx
	jg	.L4784
	.loc 25 50 0
	cmpl	$15, %ecx
	jle	.L4785
.LVL6231:
.L4782:
.LBE14467:
.LBE14469:
.LBE14462:
.LBE14461:
.LBE14460:
.LBE14443:
.LBE14442:
.LBE14476:
.LBE14478:
	.loc 26 587 0
	xorl	%eax, %eax
.LVL6232:
.L4758:
.LBE14437:
.LBE14436:
	.loc 26 318 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL6233:
	.p2align 4,,7
	.p2align 3
.L4785:
	.cfi_restore_state
.LBB14481:
.LBB14480:
.LBB14479:
.LBB14477:
.LBB14475:
.LBB14474:
.LBB14473:
.LBB14472:
.LBB14471:
.LBB14470:
.LBB14468:
.LBB14465:
.LBB14466:
	.loc 24 54 0
	cmpl	$7, %ecx
	jle	.L4786
	.loc 24 58 0
	subl	$8, %ecx
.LVL6234:
	movl	$1, %eax
.LVL6235:
	sall	%cl, %eax
	movl	$161, %ebx
.LVL6236:
	movl	%eax, %esi
.LVL6237:
.L4769:
	.loc 24 64 0
	movl	%ebx, (%esp)
	call	in8
.LVL6238:
	movl	%ebx, (%esp)
	orl	%esi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
.LVL6239:
	jmp	.L4782
.LVL6240:
	.p2align 4,,7
	.p2align 3
.L4786:
	.loc 24 55 0
	movl	$1, %esi
	movl	$33, %ebx
.LVL6241:
	sall	%cl, %esi
.LVL6242:
	jmp	.L4769
.LVL6243:
.L4783:
.LBE14466:
.LBE14465:
	call	maskInterrupt.part.208
.LVL6244:
.L4784:
	.loc 25 48 0
	movl	$__FUNCTION__.7538, 12(%esp)
	movl	$48, 8(%esp)
	movl	$.LC114, 4(%esp)
	movl	$.LC138, (%esp)
	call	_assert_fail
.LVL6245:
.LBE14468:
.LBE14470:
.LBE14471:
.LBE14472:
.LBE14473:
.LBE14474:
.LBE14475:
.LBE14477:
.LBE14479:
.LBE14480:
.LBE14481:
	.cfi_endproc
.LFE506:
	.size	invokeCNodeDelete, .-invokeCNodeDelete
	.p2align 4,,15
	.globl	cteRevoke
	.type	cteRevoke, @function
cteRevoke:
.LFB517:
	.loc 26 551 0
	.cfi_startproc
.LVL6246:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$36, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %esi
	.p2align 4,,7
	.p2align 3
.L4833:
	.loc 26 557 0
	movl	12(%esi), %eax
.LVL6247:
	movl	%eax, %ebx
	andl	$-8, %ebx
.LVL6248:
	je	.L4790
.LVL6249:
.LBB14524:
.LBB14525:
	.loc 26 833 0
	testb	$2, %al
	je	.L4790
	.loc 26 836 0
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameRegionAs
.LVL6250:
	testl	%eax, %eax
	je	.L4790
.LVL6251:
.LBB14526:
.LBB14527:
	.loc 26 839 0
	movl	(%esi), %eax
.LVL6252:
.LBB14528:
.LBB14529:
	.loc 27 872 0
	movl	%eax, %ecx
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %eax
.LVL6253:
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LBE14529:
.LBE14528:
	.loc 26 839 0
	cmpl	$4, %eax
	je	.L4798
	cmpl	$6, %eax
	jne	.L4792
.LBB14530:
.LBB14531:
.LBB14532:
	.loc 27 1127 0
	cmpl	$6, %edx
	movl	4(%esi), %eax
.LVL6254:
	jne	.L4805
	.loc 27 1130 0
	shrl	$3, %eax
.LVL6255:
.LBE14532:
.LBE14531:
	.loc 26 856 0
	testl	%eax, %eax
	je	.L4792
.LVL6256:
.LBB14534:
.LBB14535:
	.loc 27 1127 0
	movl	(%ebx), %edx
	movl	4(%ebx), %ecx
.LVL6257:
	andl	$15, %edx
	cmpl	$6, %edx
	jne	.L4805
.LVL6258:
.L4835:
	.loc 27 1130 0
	shrl	$3, %ecx
.LBE14535:
.LBE14534:
	.loc 26 860 0
	cmpl	%ecx, %eax
	je	.L4836
.LVL6259:
	.p2align 4,,7
	.p2align 3
.L4790:
.LBE14530:
.LBE14527:
.LBE14526:
.LBE14525:
.LBE14524:
	.loc 26 571 0
	xorl	%eax, %eax
.L4829:
	.loc 26 572 0
	addl	$36, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL6260:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL6261:
	.p2align 4,,7
	.p2align 3
.L4836:
	.cfi_restore_state
.LBB14552:
.LBB14550:
.LBB14548:
.LBB14546:
.LBB14537:
	.loc 26 860 0
	movl	12(%ebx), %eax
	xorl	$1, %eax
	andl	$1, %eax
.LBE14537:
.LBE14546:
.LBE14548:
.LBE14550:
.LBE14552:
	.loc 26 558 0
	testl	%eax, %eax
	je	.L4790
	.p2align 4,,7
	.p2align 3
.L4792:
.LVL6262:
.LBB14553:
.LBB14554:
	.loc 26 579 0
	leal	20(%esp), %eax
	movl	%ebx, %edx
	call	finaliseSlot.constprop.241
.LVL6263:
	movl	20(%esp), %eax
.LVL6264:
	.loc 26 580 0
	testl	%eax, %eax
	jne	.L4829
	.loc 26 585 0
	movl	28(%esp), %edx
	movl	%ebx, %eax
.LVL6265:
	call	emptySlot
.LVL6266:
.LBE14554:
.LBE14553:
.LBB14555:
.LBB14556:
	.loc 23 24 0
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	.loc 23 34 0
	cmpl	$99, %eax
	ja	.L4837
	.loc 23 24 0
	movl	%eax, ksWorkUnitsCompleted
	jmp	.L4833
	.p2align 4,,7
	.p2align 3
.L4837:
.LBB14557:
	.loc 23 35 0
	movl	$0, ksWorkUnitsCompleted
.LVL6267:
.LBB14558:
.LBB14559:
.LBB14560:
.LBB14561:
.LBB14562:
.LBB14563:
	.loc 8 63 0
	movl	-65008, %eax
.LBE14563:
.LBE14562:
	.loc 8 204 0
	testl	%eax, %eax
	jne	.L4807
.LVL6268:
.LBE14561:
.LBE14560:
.LBB14564:
.LBB14565:
	.loc 24 77 0
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
.LVL6269:
	.loc 24 80 0
	movl	$32, (%esp)
	call	in8
.LVL6270:
.LBE14565:
.LBE14564:
	.loc 25 105 0
	testb	%al, %al
	je	.L4833
.LVL6271:
.L4807:
.LBE14559:
.LBE14558:
.LBE14557:
.LBE14556:
.LBE14555:
	.loc 26 572 0
	addl	$36, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB14568:
.LBB14567:
.LBB14566:
	.loc 23 37 0
	movl	$4, %eax
.LBE14566:
.LBE14567:
.LBE14568:
	.loc 26 572 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL6272:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL6273:
	ret
.LVL6274:
	.p2align 4,,7
	.p2align 3
.L4798:
	.cfi_restore_state
.LBB14569:
.LBB14551:
.LBB14549:
.LBB14547:
.LBB14538:
.LBB14539:
.LBB14540:
	.loc 27 1008 0
	cmpl	$4, %edx
	movl	4(%esi), %eax
.LVL6275:
	jne	.L4801
	.loc 27 1011 0
	shrl	$3, %eax
.LVL6276:
.LBE14540:
.LBE14539:
	.loc 26 844 0
	testl	%eax, %eax
	je	.L4792
.LVL6277:
.LBB14542:
.LBB14543:
	.loc 27 1008 0
	movl	(%ebx), %edx
	movl	4(%ebx), %ecx
.LVL6278:
	andl	$15, %edx
	cmpl	$4, %edx
	je	.L4835
.LVL6279:
.L4801:
.LBE14543:
.LBE14542:
.LBB14544:
.LBB14541:
	call	cap_endpoint_cap_get_capEPBadge.part.71
.LVL6280:
.L4805:
.LBE14541:
.LBE14544:
.LBE14538:
.LBB14545:
.LBB14536:
.LBB14533:
	call	cap_async_endpoint_cap_get_capAEPBadge.part.176
.LVL6281:
.LBE14533:
.LBE14536:
.LBE14545:
.LBE14547:
.LBE14549:
.LBE14551:
.LBE14569:
	.cfi_endproc
.LFE517:
	.size	cteRevoke, .-cteRevoke
	.p2align 4,,15
	.globl	invokeCNodeRevoke
	.type	invokeCNodeRevoke, @function
invokeCNodeRevoke:
.LFB505:
	.loc 26 310 0
	.cfi_startproc
.LVL6282:
	.loc 26 311 0
	jmp	cteRevoke
.LVL6283:
	.cfi_endproc
.LFE505:
	.size	invokeCNodeRevoke, .-invokeCNodeRevoke
	.p2align 4,,15
	.globl	invokeTCB_ThreadControl
	.type	invokeTCB_ThreadControl, @function
invokeTCB_ThreadControl:
.LFB594:
	.loc 30 786 0
	.cfi_startproc
.LVL6284:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 30 786 0
	movl	80(%esp), %ebx
.LVL6285:
	movl	136(%esp), %esi
.LBB14593:
.LBB14594:
	.loc 27 1346 0
	testb	$15, %bl
	jne	.L4891
.LVL6286:
	.loc 27 1348 0
	movl	%ebx, %edi
.LBE14594:
.LBE14593:
	.loc 30 790 0
	movl	%esi, %ebp
.LBB14597:
.LBB14595:
	.loc 27 1348 0
	andl	$-16, %edi
	.loc 27 1352 0
	orl	$12, %edi
.LBE14595:
.LBE14597:
	.loc 30 790 0
	andl	$4, %ebp
	jne	.L4892
	.loc 30 794 0
	testl	$1, %esi
	jne	.L4893
.L4843:
	.loc 30 798 0
	testl	%ebp, %ebp
	jne	.L4894
.L4849:
	.loc 30 826 0
	andl	$2, %esi
	jne	.L4853
.L4856:
	.loc 30 841 0
	xorl	%ecx, %ecx
.L4878:
	.loc 30 842 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ecx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL6287:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL6288:
	.p2align 4,,7
	.p2align 3
.L4892:
	.cfi_restore_state
	.loc 30 791 0
	movl	88(%esp), %eax
	.loc 30 794 0
	testl	$1, %esi
	.loc 30 791 0
	movl	%eax, 632(%ebx)
	.loc 30 794 0
	je	.L4843
.L4893:
.LVL6289:
.LBB14598:
.LBB14599:
.LBB14600:
.LBB14601:
	.loc 30 97 0
	testb	$1, 600(%ebx)
	jne	.L4895
.L4844:
.LBE14601:
.LBE14600:
	.loc 22 375 0
	movl	92(%esp), %eax
	movl	%eax, 624(%ebx)
.LVL6290:
.LBB14603:
.LBB14604:
.LBB14605:
.LBB14606:
	.loc 27 614 0
	movl	592(%ebx), %eax
	andl	$15, %eax
.LBE14606:
.LBE14605:
	.loc 22 49 0
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L4896
.L4845:
.LBE14604:
.LBE14603:
	.loc 22 379 0
	cmpl	ksCurThread, %ebx
	jne	.L4843
	.loc 22 380 0
	call	rescheduleRequired
.LVL6291:
	.p2align 4,,2
	jmp	.L4843
.LVL6292:
	.p2align 4,,7
	.p2align 3
.L4853:
.LBE14599:
.LBE14598:
.LBB14611:
	.loc 30 829 0
	movl	%ebx, %esi
	andl	$-1024, %esi
	addl	$64, %esi
.LVL6293:
.LBB14612:
.LBB14613:
	.loc 26 579 0
	movl	%esi, %edx
	leal	36(%esp), %eax
	call	finaliseSlot.constprop.241
.LVL6294:
	movl	36(%esp), %ecx
.LVL6295:
	.loc 26 580 0
	testl	%ecx, %ecx
	jne	.L4878
	.loc 26 585 0
	movl	44(%esp), %edx
	movl	%esi, %eax
	movl	%ecx, 28(%esp)
	call	emptySlot
.LVL6296:
.LBE14613:
.LBE14612:
	.loc 30 834 0
	movl	120(%esp), %eax
	movl	%eax, 636(%ebx)
	.loc 30 835 0
	movl	132(%esp), %eax
	testl	%eax, %eax
	je	.L4856
	.loc 30 835 0 is_stmt 0 discriminator 1
	movl	132(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 12(%esp)
	movl	128(%esp), %edx
	movl	%eax, 8(%esp)
	movl	124(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
.LVL6297:
	testl	%eax, %eax
	je	.L4856
	.loc 30 836 0 is_stmt 1 discriminator 1
	movl	84(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edi, (%esp)
	movl	$0, 4(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	call	sameObjectAs
.LVL6298:
	.loc 30 835 0 discriminator 1
	testl	%eax, %eax
	je	.L4856
	.loc 30 837 0
	movl	132(%esp), %eax
	movl	128(%esp), %edx
	movl	%esi, 12(%esp)
	movl	%eax, 8(%esp)
	movl	124(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
.LVL6299:
	movl	28(%esp), %ecx
	jmp	.L4878
.LVL6300:
	.p2align 4,,7
	.p2align 3
.L4894:
.LBE14611:
.LBB14614:
	.loc 30 801 0
	movl	%ebx, %ebp
	andl	$-1024, %ebp
.LVL6301:
.LBB14615:
.LBB14616:
	.loc 26 579 0
	movl	%ebp, %edx
	leal	36(%esp), %eax
	call	finaliseSlot.constprop.241
.LVL6302:
	movl	36(%esp), %ecx
	.loc 26 580 0
	testl	%ecx, %ecx
	jne	.L4878
	.loc 26 585 0
	movl	44(%esp), %edx
	movl	%ebp, %eax
	call	emptySlot
.LVL6303:
.LBE14616:
.LBE14615:
	.loc 30 806 0
	movl	104(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 12(%esp)
	movl	100(%esp), %edx
	movl	%eax, 8(%esp)
	movl	96(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
.LVL6304:
	testl	%eax, %eax
	je	.L4851
	.loc 30 807 0 discriminator 1
	movl	84(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edi, (%esp)
	movl	$0, 4(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	call	sameObjectAs
.LVL6305:
	.loc 30 806 0 discriminator 1
	testl	%eax, %eax
	jne	.L4897
.L4851:
.LBE14614:
.LBB14617:
	.loc 30 815 0
	addl	$16, %ebp
.LVL6306:
	.loc 30 816 0
	movl	%ebp, %eax
	call	cteDelete.constprop.243
.LVL6307:
	.loc 30 817 0
	testl	%eax, %eax
	movl	%eax, %ecx
	jne	.L4878
	.loc 30 820 0
	movl	116(%esp), %eax
.LVL6308:
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 12(%esp)
	movl	112(%esp), %edx
	movl	%eax, 8(%esp)
	movl	108(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
.LVL6309:
	testl	%eax, %eax
	je	.L4849
	.loc 30 821 0 discriminator 1
	movl	84(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edi, (%esp)
	movl	$0, 4(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	call	sameObjectAs
.LVL6310:
	.loc 30 820 0 discriminator 1
	testl	%eax, %eax
	je	.L4849
	.loc 30 822 0
	movl	116(%esp), %eax
	movl	112(%esp), %edx
	movl	%ebp, 12(%esp)
	movl	%eax, 8(%esp)
	movl	108(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
.LVL6311:
	jmp	.L4849
.LVL6312:
	.p2align 4,,7
	.p2align 3
.L4896:
.LBE14617:
.LBB14618:
.LBB14610:
.LBB14607:
.LBB14608:
	.loc 30 37 0
	testb	$1, 600(%ebx)
	jne	.L4845
	movl	%ebx, %eax
	call	tcbSchedEnqueue.part.197
.LVL6313:
	jmp	.L4845
.LVL6314:
	.p2align 4,,7
	.p2align 3
.L4895:
.LBE14608:
.LBE14607:
.LBB14609:
.LBB14602:
	movl	%ebx, %eax
	call	tcbSchedDequeue.part.202
.LVL6315:
	.p2align 4,,6
	jmp	.L4844
.LVL6316:
	.p2align 4,,7
	.p2align 3
.L4897:
.LBE14602:
.LBE14609:
.LBE14610:
.LBE14618:
.LBB14619:
	.loc 30 808 0
	movl	104(%esp), %eax
	movl	100(%esp), %edx
	movl	%ebp, 12(%esp)
	movl	%eax, 8(%esp)
	movl	96(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
.LVL6317:
	jmp	.L4851
.LVL6318:
.L4891:
.LBE14619:
.LBB14620:
.LBB14596:
	call	cap_thread_cap_new.part.162
.LVL6319:
.LBE14596:
.LBE14620:
	.cfi_endproc
.LFE594:
	.size	invokeTCB_ThreadControl, .-invokeTCB_ThreadControl
	.section	.rodata.str1.4
	.align 4
.LC271:
	.string	"TCB Configure: Truncated message."
	.align 4
.LC272:
	.string	"TCB Configure: Requested priority %d too high (max %d)."
	.align 4
.LC273:
	.string	"TCB Configure: CSpace or VSpace currently being deleted."
	.align 4
.LC274:
	.string	"TCB Configure: CSpace cap is invalid."
	.align 4
.LC275:
	.string	"TCB Configure: VSpace cap is invalid."
	.text
	.p2align 4,,15
	.globl	decodeTCBConfigure
	.type	decodeTCBConfigure, @function
decodeTCBConfigure:
.LFB587:
	.loc 30 456 0
	.cfi_startproc
.LVL6320:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$156, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 30 456 0
	movl	8(%ebp), %eax
	.loc 30 464 0
	cmpl	$4, 16(%ebp)
	movl	24(%ebp), %ebx
	movl	28(%ebp), %edi
	.loc 30 456 0
	movl	%eax, -52(%ebp)
.LVL6321:
	movl	32(%ebp), %esi
.LVL6322:
	.loc 30 464 0
	jbe	.L4899
	.loc 30 464 0 is_stmt 0 discriminator 1
	testl	%ebx, %ebx
	je	.L4899
	.loc 30 465 0 is_stmt 1
	testl	%edi, %edi
	je	.L4899
	.loc 30 466 0
	testl	%esi, %esi
	.p2align 4,,5
	je	.L4899
.LVL6323:
.LBB14667:
.LBB14668:
	.loc 41 30 0
	movl	ksCurThread, %eax
.LVL6324:
.LBB14669:
.LBB14670:
	.loc 13 27 0
	movl	20(%eax), %edx
.LBE14670:
.LBE14669:
.LBE14668:
.LBE14667:
.LBB14674:
.LBB14675:
.LBB14676:
.LBB14677:
	movl	24(%eax), %ecx
.LBE14677:
.LBE14676:
.LBE14675:
.LBE14674:
.LBB14681:
.LBB14673:
.LBB14672:
.LBB14671:
	movl	%edx, -96(%ebp)
.LVL6325:
.LBE14671:
.LBE14672:
.LBE14673:
.LBE14681:
.LBB14682:
.LBB14683:
	.loc 41 33 0
	movl	36(%ebp), %edx
.LBE14683:
.LBE14682:
.LBB14686:
.LBB14680:
.LBB14679:
.LBB14678:
	.loc 13 27 0
	movl	%ecx, -56(%ebp)
.LVL6326:
.LBE14678:
.LBE14679:
.LBE14680:
.LBE14686:
.LBB14687:
.LBB14684:
	.loc 41 33 0
	testl	%edx, %edx
	je	.L4933
	.loc 41 34 0
	movl	36(%ebp), %ecx
	movl	12(%ecx), %edx
	movl	%edx, -80(%ebp)
.LVL6327:
.LBE14684:
.LBE14687:
.LBB14688:
.LBB14689:
	movl	16(%ecx), %edx
	movl	%edx, -92(%ebp)
.LVL6328:
.LBE14689:
.LBE14688:
.LBB14690:
.LBB14691:
	movl	20(%ecx), %edx
.LBE14691:
.LBE14690:
	.loc 30 479 0
	movl	4(%ebx), %ecx
.LVL6329:
.LBB14693:
.LBB14692:
	.loc 41 34 0
	movl	%edx, -60(%ebp)
.LVL6330:
.LBE14692:
.LBE14693:
	.loc 30 479 0
	movl	(%ebx), %edx
	movl	%ecx, -64(%ebp)
	.loc 30 481 0
	movl	4(%edi), %ecx
.LVL6331:
	.loc 30 479 0
	movl	%edx, -76(%ebp)
.LVL6332:
	.loc 30 481 0
	movl	(%edi), %edx
.LVL6333:
	movl	%ecx, -84(%ebp)
.LVL6334:
	.loc 30 483 0
	movl	4(%esi), %ecx
.LVL6335:
	.loc 30 481 0
	movl	%edx, -88(%ebp)
	.loc 30 483 0
	movl	(%esi), %edx
	movl	%ecx, -68(%ebp)
	.loc 30 485 0
	movzbl	-56(%ebp), %ecx
	.loc 30 487 0
	cmpl	624(%eax), %ecx
	.loc 30 483 0
	movl	%edx, -72(%ebp)
	.loc 30 485 0
	movl	%ecx, -56(%ebp)
.LVL6336:
	.loc 30 487 0
	ja	.L4934
	.loc 30 494 0
	movl	-60(%ebp), %ecx
.LVL6337:
	testl	%ecx, %ecx
	jne	.L4935
	.loc 30 495 0
	xorl	%esi, %esi
.LVL6338:
.L4904:
.LBB14694:
.LBB14695:
	.loc 27 1359 0
	movl	-52(%ebp), %eax
	andl	$15, %eax
	cmpl	$12, %eax
	jne	.L4936
.LBE14695:
.LBE14694:
	.loc 30 511 0
	movl	-52(%ebp), %ecx
	andl	$-1024, %ecx
	.loc 30 510 0
	movl	%ecx, (%esp)
.LVL6339:
	movl	%ecx, -100(%ebp)
	call	slotCapLongRunningDelete
.LVL6340:
	testl	%eax, %eax
	jne	.L4906
.LVL6341:
	.loc 30 513 0
	movl	-100(%ebp), %ecx
	addl	$16, %ecx
	.loc 30 512 0
	movl	%ecx, (%esp)
	call	slotCapLongRunningDelete
.LVL6342:
	.loc 30 511 0
	testl	%eax, %eax
	je	.L4907
.L4906:
	.loc 30 514 0
	movl	ksCurThread, %eax
.LVL6343:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$514, 8(%esp)
	movl	$__func__.7170, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6344:
	movl	$.LC273, (%esp)
.LVL6345:
.L4932:
	.loc 30 546 0
	call	printf
.LVL6346:
	movl	$.LC20, (%esp)
	call	printf
.LVL6347:
	.loc 30 548 0
	movl	$3, %eax
	.loc 30 547 0
	movl	$3, current_syscall_error+24
	.loc 30 548 0
	jmp	.L4901
.LVL6348:
	.p2align 4,,7
	.p2align 3
.L4899:
	.loc 30 467 0
	movl	ksCurThread, %eax
.LVL6349:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$467, 8(%esp)
	movl	$__func__.7170, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6350:
	movl	$.LC271, (%esp)
	call	printf
.LVL6351:
	movl	$.LC20, (%esp)
	call	printf
.LVL6352:
	.loc 30 469 0
	movl	$3, %eax
	.loc 30 468 0
	movl	$7, current_syscall_error+24
.LVL6353:
.L4901:
	.loc 30 559 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL6354:
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
.LVL6355:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6356:
	.p2align 4,,7
	.p2align 3
.L4934:
	.cfi_restore_state
	.loc 30 488 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
.LVL6357:
	movl	$489, 8(%esp)
	movl	$__func__.7170, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6358:
	.loc 30 488 0
	movl	ksCurThread, %eax
	movl	624(%eax), %eax
	movl	$.LC272, (%esp)
	movl	%eax, 8(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, 4(%esp)
	call	printf
.LVL6359:
	movl	$.LC20, (%esp)
	call	printf
.LVL6360:
	.loc 30 491 0
	movl	$3, %eax
	.loc 30 490 0
	movl	$3, current_syscall_error+24
	.loc 30 491 0
	jmp	.L4901
.LVL6361:
	.p2align 4,,7
	.p2align 3
.L4907:
	.loc 30 519 0
	movl	-80(%ebp), %edx
	testl	%edx, %edx
	je	.L4908
.LVL6362:
	.loc 30 520 0
	movl	-76(%ebp), %ecx
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
.LVL6363:
	movl	$0, 4(%esp)
	movl	%ecx, 12(%esp)
	movl	-64(%ebp), %ecx
.LVL6364:
	movl	%ecx, 16(%esp)
.LVL6365:
	movl	-80(%ebp), %ecx
	movl	%ecx, 8(%esp)
	call	updateCapData
.LVL6366:
	movl	-44(%ebp), %eax
.LVL6367:
	movl	%eax, -64(%ebp)
	movl	-48(%ebp), %eax
	subl	$4, %esp
	movl	%eax, -76(%ebp)
.LVL6368:
.L4908:
	.loc 30 523 0
	movl	-76(%ebp), %eax
	movl	%ebx, 4(%esp)
.LVL6369:
	movl	%eax, 8(%esp)
	movl	-64(%ebp), %eax
.LVL6370:
	movl	%eax, 12(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	deriveCap
.LVL6371:
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %ecx
	movl	%ecx, -76(%ebp)
.LVL6372:
	subl	$4, %esp
	.loc 30 524 0
	testl	%eax, %eax
	jne	.L4901
	.loc 30 527 0
	movl	-28(%ebp), %eax
.LVL6373:
.LBB14699:
.LBB14700:
	.loc 27 872 0
	movl	%ecx, %edx
	andl	$14, %edx
.LBE14700:
.LBE14699:
	.loc 30 527 0
	movl	%eax, -64(%ebp)
.LVL6374:
.LBB14702:
.LBB14701:
	.loc 27 873 0
	movl	%ecx, %eax
.LVL6375:
	movzbl	%cl, %ecx
.LVL6376:
	andl	$15, %eax
.LVL6377:
	cmpl	$14, %edx
	cmove	%ecx, %eax
.LBE14701:
.LBE14702:
	.loc 30 529 0
	cmpl	$10, %eax
	je	.L4911
	.loc 30 530 0
	movl	ksCurThread, %eax
.LVL6378:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
.LVL6379:
	movl	$530, 8(%esp)
	movl	$__func__.7170, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6380:
	movl	$.LC274, (%esp)
	jmp	.L4932
.LVL6381:
	.p2align 4,,7
	.p2align 3
.L4935:
.LBB14703:
	.loc 30 499 0
	movl	-72(%ebp), %edx
	leal	-36(%ebp), %eax
.LVL6382:
	movl	-68(%ebp), %ecx
	movl	%eax, (%esp)
.LVL6383:
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
.LVL6384:
	call	deriveCap
.LVL6385:
	movl	-36(%ebp), %eax
.LVL6386:
	subl	$4, %esp
	.loc 30 500 0
	testl	%eax, %eax
	jne	.L4901
	.loc 30 503 0
	movl	-32(%ebp), %eax
.LVL6387:
	movl	-28(%ebp), %edx
	movl	%eax, -72(%ebp)
	.loc 30 504 0
	movl	%eax, 4(%esp)
	movl	-60(%ebp), %eax
	movl	%edx, 8(%esp)
	.loc 30 503 0
	movl	%edx, -68(%ebp)
	.loc 30 504 0
	movl	%eax, (%esp)
	call	checkValidIPCBuffer
.LVL6388:
	.loc 30 505 0
	testl	%eax, %eax
	je	.L4904
	jmp	.L4901
.LVL6389:
.L4911:
.LBE14703:
	.loc 30 535 0
	movl	-92(%ebp), %eax
	testl	%eax, %eax
	.p2align 4,,4
	je	.L4912
	.loc 30 536 0
	movl	-84(%ebp), %ecx
	leal	-48(%ebp), %eax
	movl	-88(%ebp), %edx
	movl	%eax, (%esp)
.LVL6390:
	movl	$0, 4(%esp)
	movl	%ecx, 16(%esp)
	movl	-92(%ebp), %ecx
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	call	updateCapData
.LVL6391:
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, -88(%ebp)
	movl	%edx, -84(%ebp)
.LVL6392:
	subl	$4, %esp
.L4912:
	.loc 30 539 0
	movl	-88(%ebp), %eax
.LVL6393:
	movl	-84(%ebp), %edx
	movl	%edi, 4(%esp)
	movl	%eax, 8(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, 12(%esp)
	call	deriveCap
.LVL6394:
	movl	-36(%ebp), %eax
.LVL6395:
	subl	$4, %esp
	.loc 30 540 0
	testl	%eax, %eax
	jne	.L4901
	.loc 30 543 0
	movl	-32(%ebp), %eax
.LVL6396:
	movl	-28(%ebp), %edx
	.loc 30 545 0
	movl	%eax, (%esp)
.LVL6397:
	movl	%edx, 4(%esp)
.LVL6398:
	.loc 30 543 0
	movl	%eax, -88(%ebp)
	movl	%edx, -84(%ebp)
	.loc 30 545 0
	call	isValidVTableRoot
.LVL6399:
	testl	%eax, %eax
	jne	.L4913
	.loc 30 546 0
	movl	ksCurThread, %eax
.LVL6400:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
.LVL6401:
	movl	$546, 8(%esp)
	movl	$__func__.7170, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6402:
	movl	$.LC275, (%esp)
	jmp	.L4932
.LVL6403:
.L4913:
	.loc 30 551 0
	movl	ksCurThread, %ecx
.LVL6404:
.LBB14704:
.LBB14705:
	.loc 22 427 0
	leal	592(%ecx), %eax
	movl	%ecx, -80(%ebp)
	call	thread_state_ptr_set_tsType.isra.166.constprop.286
.LVL6405:
	.loc 22 428 0
	movl	-80(%ebp), %ecx
	movl	%ecx, (%esp)
.LVL6406:
	call	scheduleTCB
.LVL6407:
.LBE14705:
.LBE14704:
	.loc 30 552 0
	movl	-72(%ebp), %eax
	movl	-68(%ebp), %edx
	movl	$7, 56(%esp)
.LVL6408:
	movl	%esi, 52(%esp)
	movl	%eax, 44(%esp)
	movl	-60(%ebp), %eax
	movl	%edx, 48(%esp)
	movl	-84(%ebp), %edx
	movl	%edi, 36(%esp)
	movl	%ebx, 24(%esp)
	movl	%eax, 40(%esp)
	movl	-88(%ebp), %eax
	movl	%edx, 32(%esp)
.LBB14706:
.LBB14696:
	.loc 27 1362 0
	movl	-52(%ebp), %edx
.LBE14696:
.LBE14706:
	.loc 30 552 0
	movl	%eax, 28(%esp)
	movl	-76(%ebp), %eax
.LVL6409:
.LBB14707:
.LBB14697:
	.loc 27 1362 0
	andl	$-16, %edx
.LBE14697:
.LBE14707:
	.loc 30 552 0
	movl	%edx, (%esp)
	movl	%eax, 16(%esp)
	movl	-64(%ebp), %eax
.LVL6410:
	movl	%eax, 20(%esp)
.LVL6411:
	movl	-56(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-96(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	call	invokeTCB_ThreadControl
.LVL6412:
	jmp	.L4901
.LVL6413:
.L4933:
.LBB14708:
.LBB14685:
	call	getSyscallArg.part.131
.LVL6414:
.L4936:
.LBE14685:
.LBE14708:
.LBB14709:
.LBB14698:
	.p2align 4,,8
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL6415:
.LBE14698:
.LBE14709:
	.cfi_endproc
.LFE587:
	.size	decodeTCBConfigure, .-decodeTCBConfigure
	.section	.rodata.str1.4
	.align 4
.LC276:
	.string	"TCB SetPriority: Truncated message."
	.align 4
.LC277:
	.string	"TCB SetPriority: Requested priority %d too high (max %d)."
	.text
	.p2align 4,,15
	.globl	decodeSetPriority
	.type	decodeSetPriority, @function
decodeSetPriority:
.LFB588:
	.loc 30 563 0
	.cfi_startproc
.LVL6416:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$68, %esp
	.cfi_def_cfa_offset 80
	.loc 30 567 0
	movl	ksCurThread, %eax
	.loc 30 566 0
	movl	88(%esp), %edx
	.loc 30 563 0
	movl	80(%esp), %esi
	.loc 30 566 0
	testl	%edx, %edx
	je	.L4943
.LVL6417:
	.loc 30 575 0
	movzbl	20(%eax), %ebx
.LVL6418:
	.loc 30 577 0
	cmpl	624(%eax), %ebx
	jbe	.L4940
.LVL6419:
	.loc 30 578 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$579, 8(%esp)
	movl	$__func__.7178, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6420:
	.loc 30 578 0
	movl	ksCurThread, %eax
	movl	624(%eax), %eax
	movl	%ebx, 4(%esp)
	movl	$.LC277, (%esp)
	movl	%eax, 8(%esp)
	call	printf
.LVL6421:
	movl	$.LC20, (%esp)
	call	printf
.LVL6422:
	.loc 30 581 0
	movl	$3, %eax
	.loc 30 580 0
	movl	$3, current_syscall_error+24
	.loc 30 592 0
	addl	$68, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL6423:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL6424:
	.p2align 4,,7
	.p2align 3
.L4943:
	.cfi_restore_state
	.loc 30 567 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$567, 8(%esp)
	movl	$__func__.7178, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6425:
	movl	$.LC276, (%esp)
	call	printf
.LVL6426:
	movl	$.LC20, (%esp)
	call	printf
.LVL6427:
	.loc 30 569 0
	movl	$3, %eax
	.loc 30 568 0
	movl	$7, current_syscall_error+24
	.loc 30 592 0
	addl	$68, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL6428:
	.p2align 4,,7
	.p2align 3
.L4940:
	.cfi_restore_state
.LBB14728:
.LBB14729:
.LBB14730:
.LBB14731:
	.loc 27 626 0
	movl	592(%eax), %edx
	andl	$-16, %edx
	.loc 27 627 0
	orl	$2, %edx
	movl	%edx, 592(%eax)
.LBE14731:
.LBE14730:
	.loc 22 428 0
	movl	%eax, (%esp)
	call	scheduleTCB
.LVL6429:
.LBE14729:
.LBE14728:
.LBB14732:
.LBB14733:
	.loc 27 1359 0
	movl	%esi, %eax
	andl	$15, %eax
	cmpl	$12, %eax
	jne	.L4944
	.loc 27 1362 0
	andl	$-16, %esi
.LVL6430:
.LBE14733:
.LBE14732:
	.loc 30 585 0
	movl	%ebx, 12(%esp)
	movl	%esi, (%esp)
	movl	$1, 56(%esp)
	movl	$0, 52(%esp)
	movl	$0, 44(%esp)
	movl	$0, 48(%esp)
	movl	$0, 40(%esp)
	movl	$0, 36(%esp)
	movl	$0, 28(%esp)
	movl	$0, 32(%esp)
	movl	$0, 24(%esp)
	movl	$0, 16(%esp)
	movl	$0, 20(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	call	invokeTCB_ThreadControl
.LVL6431:
	.loc 30 592 0
	addl	$68, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL6432:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL6433:
.L4944:
	.cfi_restore_state
.LBB14735:
.LBB14734:
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL6434:
.LBE14734:
.LBE14735:
	.cfi_endproc
.LFE588:
	.size	decodeSetPriority, .-decodeSetPriority
	.section	.rodata.str1.4
	.align 4
.LC278:
	.string	"TCB SetIPCBuffer: Truncated message."
	.text
	.p2align 4,,15
	.globl	decodeSetIPCBuffer
	.type	decodeSetIPCBuffer, @function
decodeSetIPCBuffer:
.LFB589:
	.loc 30 597 0
	.cfi_startproc
.LVL6435:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$108, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 30 602 0
	movl	16(%ebp), %eax
	.loc 30 597 0
	movl	8(%ebp), %edx
	movl	24(%ebp), %ebx
.LVL6436:
	.loc 30 602 0
	testl	%eax, %eax
	je	.L4946
	.loc 30 602 0 is_stmt 0 discriminator 1
	testl	%ebx, %ebx
	je	.L4946
.LVL6437:
.LBB14752:
.LBB14753:
	.loc 41 30 0 is_stmt 1
	movl	ksCurThread, %ecx
.LVL6438:
.LBE14753:
.LBE14752:
	.loc 30 610 0
	movl	(%ebx), %esi
.LVL6439:
	movl	4(%ebx), %edi
.LBB14760:
.LBB14758:
.LBB14754:
.LBB14755:
	.loc 13 27 0
	movl	20(%ecx), %eax
.LBE14755:
.LBE14754:
.LBE14758:
.LBE14760:
	.loc 30 612 0
	testl	%eax, %eax
.LBB14761:
.LBB14759:
.LBB14757:
.LBB14756:
	.loc 13 27 0
	movl	%eax, -44(%ebp)
.LVL6440:
.LBE14756:
.LBE14757:
.LBE14759:
.LBE14761:
	.loc 30 612 0
	je	.L4952
.LBB14762:
	.loc 30 618 0
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
.LVL6441:
	movl	%ebx, 4(%esp)
	movl	%edx, -48(%ebp)
.LVL6442:
	call	deriveCap
.LVL6443:
	movl	-36(%ebp), %eax
.LVL6444:
	subl	$4, %esp
	.loc 30 619 0
	testl	%eax, %eax
	jne	.L4948
	.loc 30 622 0
	movl	-32(%ebp), %esi
.LVL6445:
	movl	-28(%ebp), %edi
	.loc 30 623 0
	movl	-44(%ebp), %eax
.LVL6446:
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
.LVL6447:
	movl	%eax, (%esp)
	call	checkValidIPCBuffer
.LVL6448:
	.loc 30 624 0
	testl	%eax, %eax
	jne	.L4948
	movl	ksCurThread, %ecx
	movl	-48(%ebp), %edx
.LVL6449:
	jmp	.L4949
.LVL6450:
	.p2align 4,,7
	.p2align 3
.L4946:
.LBE14762:
	.loc 30 603 0
	movl	ksCurThread, %eax
.LVL6451:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$603, 8(%esp)
	movl	$__func__.7189, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6452:
	movl	$.LC278, (%esp)
	call	printf
.LVL6453:
	movl	$.LC20, (%esp)
	call	printf
.LVL6454:
	.loc 30 605 0
	movl	$3, %eax
	.loc 30 604 0
	movl	$7, current_syscall_error+24
.LVL6455:
.L4948:
	.loc 30 638 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL6456:
	popl	%esi
	.cfi_restore 6
.LVL6457:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6458:
	.p2align 4,,7
	.p2align 3
.L4952:
	.cfi_restore_state
	.loc 30 613 0
	xorl	%ebx, %ebx
.LVL6459:
.L4949:
.LBB14763:
.LBB14764:
.LBB14765:
.LBB14766:
	.loc 27 626 0
	movl	592(%ecx), %eax
.LVL6460:
	movl	%edx, -48(%ebp)
.LVL6461:
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%ecx)
.LBE14766:
.LBE14765:
	.loc 22 428 0
	movl	%ecx, (%esp)
.LVL6462:
	call	scheduleTCB
.LVL6463:
.LBE14764:
.LBE14763:
.LBB14767:
.LBB14768:
	.loc 27 1359 0
	movl	-48(%ebp), %edx
.LVL6464:
	movl	%edx, %eax
.LVL6465:
	andl	$15, %eax
	cmpl	$12, %eax
	jne	.L4959
.LBE14768:
.LBE14767:
	.loc 30 630 0
	movl	-44(%ebp), %eax
.LBB14771:
.LBB14769:
	.loc 27 1362 0
	andl	$-16, %edx
.LVL6466:
.LBE14769:
.LBE14771:
	.loc 30 630 0
	movl	%ebx, 52(%esp)
	movl	%esi, 44(%esp)
	movl	%edi, 48(%esp)
	movl	%eax, 40(%esp)
	movl	20(%ebp), %eax
	movl	$2, 56(%esp)
	movl	$0, 36(%esp)
	movl	$0, 28(%esp)
	movl	$0, 32(%esp)
	movl	$0, 24(%esp)
	movl	$0, 16(%esp)
	movl	$0, 20(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	invokeTCB_ThreadControl
.LVL6467:
	.loc 30 638 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL6468:
	popl	%esi
	.cfi_restore 6
.LVL6469:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6470:
.L4959:
	.cfi_restore_state
.LBB14772:
.LBB14770:
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL6471:
.LBE14770:
.LBE14772:
	.cfi_endproc
.LFE589:
	.size	decodeSetIPCBuffer, .-decodeSetIPCBuffer
	.section	.rodata.str1.4
	.align 4
.LC279:
	.string	"TCB SetSpace: Truncated message."
	.align 4
.LC280:
	.string	"TCB SetSpace: CSpace or VSpace currently being deleted."
	.align 4
.LC281:
	.string	"TCB SetSpace: Invalid CNode cap."
	.align 4
.LC282:
	.string	"TCB SetSpace: Invalid VSpace cap."
	.text
	.p2align 4,,15
	.globl	decodeSetSpace
	.type	decodeSetSpace, @function
decodeSetSpace:
.LFB590:
	.loc 30 643 0
	.cfi_startproc
.LVL6472:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	24(%ebp), %eax
	.loc 30 650 0
	cmpl	$2, 16(%ebp)
	.loc 30 643 0
	movl	8(%ebp), %edi
.LVL6473:
	movl	28(%ebp), %esi
	movl	%eax, -52(%ebp)
.LVL6474:
	.loc 30 650 0
	jbe	.L4961
	.loc 30 650 0 is_stmt 0 discriminator 1
	testl	%eax, %eax
	je	.L4961
	.loc 30 651 0 is_stmt 1
	testl	%esi, %esi
	je	.L4961
.LVL6475:
.LBB14809:
.LBB14810:
	.loc 41 30 0
	movl	ksCurThread, %edx
.LVL6476:
.LBE14810:
.LBE14809:
.LBB14817:
.LBB14818:
	.loc 41 33 0
	movl	36(%ebp), %ecx
.LBE14818:
.LBE14817:
.LBB14824:
.LBB14815:
.LBB14811:
.LBB14812:
	.loc 13 27 0
	movl	20(%edx), %eax
.LVL6477:
.LBE14812:
.LBE14811:
.LBE14815:
.LBE14824:
.LBB14825:
.LBB14819:
	.loc 41 33 0
	testl	%ecx, %ecx
.LBE14819:
.LBE14825:
.LBB14826:
.LBB14816:
.LBB14814:
.LBB14813:
	.loc 13 27 0
	movl	%eax, -88(%ebp)
.LVL6478:
.LBE14813:
.LBE14814:
.LBE14816:
.LBE14826:
.LBB14827:
.LBB14828:
.LBB14829:
.LBB14830:
	movl	24(%edx), %eax
	movl	%eax, -72(%ebp)
.LVL6479:
.LBE14830:
.LBE14829:
.LBE14828:
.LBE14827:
.LBB14831:
.LBB14820:
	.loc 41 33 0
	je	.L4987
	.loc 41 34 0
	movl	36(%ebp), %eax
.LBE14820:
.LBE14831:
	.loc 30 662 0
	movl	-52(%ebp), %ebx
	.loc 30 664 0
	movl	(%esi), %ecx
.LVL6480:
.LBB14832:
.LBB14821:
	.loc 41 34 0
	movl	12(%eax), %eax
.LBE14821:
.LBE14832:
	.loc 30 664 0
	movl	%ecx, -80(%ebp)
.LBB14833:
.LBB14822:
	.loc 41 34 0
	movl	%eax, -84(%ebp)
.LVL6481:
.LBE14822:
.LBE14833:
	.loc 30 662 0
	movl	4(%ebx), %eax
.LVL6482:
	movl	%eax, -64(%ebp)
	movl	(%ebx), %eax
	.loc 30 664 0
	movl	4(%esi), %ebx
	.loc 30 662 0
	movl	%eax, -68(%ebp)
.LVL6483:
.LBB14834:
.LBB14835:
	.loc 27 1359 0
	movl	%edi, %eax
.LVL6484:
	andl	$15, %eax
	cmpl	$12, %eax
.LBE14835:
.LBE14834:
	.loc 30 664 0
	movl	%ebx, -76(%ebp)
.LVL6485:
.LBB14839:
.LBB14836:
	.loc 27 1359 0
	jne	.L4988
.LBE14836:
.LBE14839:
	.loc 30 667 0
	movl	%edi, %ecx
.LVL6486:
	andl	$-1024, %ecx
	.loc 30 666 0
	movl	%ecx, (%esp)
.LVL6487:
	movl	%edx, -56(%ebp)
	movl	%ecx, -60(%ebp)
	call	slotCapLongRunningDelete
.LVL6488:
	movl	-56(%ebp), %edx
	testl	%eax, %eax
	jne	.L4966
.LVL6489:
	.loc 30 669 0
	movl	-60(%ebp), %ecx
	addl	$16, %ecx
	.loc 30 668 0
	movl	%ecx, (%esp)
	call	slotCapLongRunningDelete
.LVL6490:
	.loc 30 667 0
	movl	-56(%ebp), %edx
	testl	%eax, %eax
	jne	.L4966
	.loc 30 675 0
	movl	-72(%ebp), %edx
	testl	%edx, %edx
	je	.L4968
	.loc 30 676 0
	movl	-68(%ebp), %ebx
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	%ebx, 12(%esp)
	movl	-64(%ebp), %ebx
.LVL6491:
	movl	%ebx, 16(%esp)
	movl	-72(%ebp), %ebx
	movl	%ebx, 8(%esp)
	call	updateCapData
.LVL6492:
	movl	-44(%ebp), %eax
	movl	%eax, -64(%ebp)
	movl	-48(%ebp), %eax
	subl	$4, %esp
	movl	%eax, -68(%ebp)
.LVL6493:
.L4968:
	.loc 30 679 0
	movl	-68(%ebp), %eax
	movl	%eax, 8(%esp)
.LVL6494:
	movl	-64(%ebp), %eax
.LVL6495:
	movl	%eax, 12(%esp)
.LVL6496:
	movl	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	deriveCap
.LVL6497:
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %ecx
.LVL6498:
	subl	$4, %esp
	.loc 30 680 0
	testl	%eax, %eax
	jne	.L4963
	.loc 30 683 0
	movl	-28(%ebp), %eax
.LVL6499:
.LBB14840:
.LBB14841:
	.loc 27 872 0
	movl	%ecx, %ebx
	.loc 27 873 0
	movzbl	%cl, %edx
	.loc 27 872 0
	andl	$14, %ebx
.LBE14841:
.LBE14840:
	.loc 30 683 0
	movl	%eax, -64(%ebp)
.LVL6500:
.LBB14843:
.LBB14842:
	.loc 27 873 0
	movl	%ecx, %eax
.LVL6501:
	andl	$15, %eax
	cmpl	$14, %ebx
	cmove	%edx, %eax
.LBE14842:
.LBE14843:
	.loc 30 685 0
	cmpl	$10, %eax
	je	.L4971
	.loc 30 686 0
	movl	ksCurThread, %eax
.LVL6502:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
.LVL6503:
	movl	$686, 8(%esp)
	movl	$__func__.7207, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6504:
	movl	$.LC281, (%esp)
	jmp	.L4986
.LVL6505:
	.p2align 4,,7
	.p2align 3
.L4961:
	.loc 30 652 0
	movl	ksCurThread, %eax
.LVL6506:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$652, 8(%esp)
	movl	$__func__.7207, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6507:
	movl	$.LC279, (%esp)
	call	printf
.LVL6508:
	movl	$.LC20, (%esp)
	call	printf
.LVL6509:
	.loc 30 654 0
	movl	$3, %eax
	.loc 30 653 0
	movl	$7, current_syscall_error+24
.LVL6510:
.L4963:
	.loc 30 715 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
.LVL6511:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6512:
	.p2align 4,,7
	.p2align 3
.L4966:
	.cfi_restore_state
	.loc 30 670 0
	movl	44(%edx), %eax
	movl	%edx, 12(%esp)
	movl	$670, 8(%esp)
	movl	$__func__.7207, 4(%esp)
	movl	%eax, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6513:
	movl	$.LC280, (%esp)
.LVL6514:
.L4986:
	.loc 30 686 0
	call	printf
.LVL6515:
	movl	$.LC20, (%esp)
	call	printf
.LVL6516:
	.loc 30 688 0
	movl	$3, %eax
	.loc 30 687 0
	movl	$3, current_syscall_error+24
	.loc 30 715 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
.LVL6517:
	popl	%edi
	.cfi_restore 7
.LVL6518:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6519:
	.p2align 4,,7
	.p2align 3
.L4971:
	.cfi_restore_state
	.loc 30 691 0
	movl	-84(%ebp), %eax
	testl	%eax, %eax
	je	.L4972
	.loc 30 692 0
	movl	-76(%ebp), %ebx
	leal	-48(%ebp), %eax
	movl	%ecx, -56(%ebp)
	movl	-80(%ebp), %ecx
.LVL6520:
	movl	%eax, (%esp)
.LVL6521:
	movl	$0, 4(%esp)
	movl	%ebx, 16(%esp)
	movl	-84(%ebp), %ebx
	movl	%ecx, 12(%esp)
	movl	%ebx, 8(%esp)
	call	updateCapData
.LVL6522:
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	-56(%ebp), %ecx
	movl	%eax, -80(%ebp)
	movl	%edx, -76(%ebp)
.LVL6523:
	subl	$4, %esp
.L4972:
	.loc 30 695 0
	movl	-80(%ebp), %eax
.LVL6524:
	movl	-76(%ebp), %edx
	movl	%esi, 4(%esp)
	movl	%ecx, -56(%ebp)
	movl	%eax, 8(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, 12(%esp)
	call	deriveCap
.LVL6525:
	movl	-36(%ebp), %eax
.LVL6526:
	subl	$4, %esp
	.loc 30 696 0
	testl	%eax, %eax
	jne	.L4963
	.loc 30 699 0
	movl	-32(%ebp), %eax
.LVL6527:
	movl	-28(%ebp), %edx
	.loc 30 701 0
	movl	%eax, (%esp)
.LVL6528:
	movl	%edx, 4(%esp)
.LVL6529:
	.loc 30 699 0
	movl	%eax, -80(%ebp)
	movl	%edx, -76(%ebp)
	.loc 30 701 0
	call	isValidVTableRoot
.LVL6530:
	movl	-56(%ebp), %ecx
	testl	%eax, %eax
	jne	.L4973
	.loc 30 702 0
	movl	ksCurThread, %eax
.LVL6531:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
.LVL6532:
	movl	$702, 8(%esp)
	movl	$__func__.7207, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6533:
	movl	$.LC282, (%esp)
	jmp	.L4986
.LVL6534:
.L4973:
	.loc 30 707 0
	movl	ksCurThread, %edx
.LVL6535:
.LBB14844:
.LBB14837:
	.loc 27 1362 0
	andl	$-16, %edi
.LVL6536:
	movl	%ecx, -60(%ebp)
.LBE14837:
.LBE14844:
.LBB14845:
.LBB14846:
	.loc 22 427 0
	leal	592(%edx), %eax
	movl	%edx, -56(%ebp)
	call	thread_state_ptr_set_tsType.isra.166.constprop.286
.LVL6537:
	.loc 22 428 0
	movl	-56(%ebp), %edx
	movl	%edx, (%esp)
.LVL6538:
	call	scheduleTCB
.LVL6539:
.LBE14846:
.LBE14845:
	.loc 30 708 0
	movl	-80(%ebp), %eax
	movl	-76(%ebp), %edx
	movl	-60(%ebp), %ecx
	movl	$4, 56(%esp)
.LVL6540:
	movl	%eax, 28(%esp)
	movl	-52(%ebp), %eax
	movl	$0, 52(%esp)
	movl	$0, 44(%esp)
	movl	$0, 48(%esp)
	movl	%eax, 24(%esp)
	movl	-64(%ebp), %eax
.LVL6541:
	movl	$0, 40(%esp)
	movl	%esi, 36(%esp)
	movl	%edx, 32(%esp)
	movl	%eax, 20(%esp)
	movl	-88(%ebp), %eax
	movl	%ecx, 16(%esp)
	movl	$0, 12(%esp)
	movl	%edi, (%esp)
	movl	%eax, 8(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	call	invokeTCB_ThreadControl
.LVL6542:
	jmp	.L4963
.LVL6543:
.L4987:
.LBB14847:
.LBB14823:
	call	getSyscallArg.part.131
.LVL6544:
.L4988:
.LBE14823:
.LBE14847:
.LBB14848:
.LBB14838:
	.p2align 4,,8
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL6545:
.LBE14838:
.LBE14848:
	.cfi_endproc
.LFE590:
	.size	decodeSetSpace, .-decodeSetSpace
	.section	.rodata.str1.1
.LC283:
	.string	"TCB: Illegal operation."
	.text
	.p2align 4,,15
	.globl	decodeTCBInvocation
	.type	decodeTCBInvocation, @function
decodeTCBInvocation:
.LFB583:
	.loc 30 271 0
	.cfi_startproc
.LVL6546:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 30 271 0
	movl	64(%esp), %eax
	movl	68(%esp), %ecx
	movl	72(%esp), %ebx
.LVL6547:
	movl	76(%esp), %edx
	.loc 30 272 0
	cmpl	$10, %eax
	.loc 30 271 0
	movl	80(%esp), %edi
	movl	96(%esp), %ebp
	movl	100(%esp), %esi
	.loc 30 272 0
	ja	.L4990
	jmp	*.L4992(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L4992:
	.long	.L4990
	.long	.L4990
	.long	.L4991
	.long	.L4993
	.long	.L4994
	.long	.L4995
	.long	.L4996
	.long	.L4997
	.long	.L4998
	.long	.L4999
	.long	.L5000
	.text
	.p2align 4,,7
	.p2align 3
.L5000:
	.loc 30 290 0
	movl	ksCurThread, %edx
.LVL6548:
.LBB14868:
.LBB14869:
.LBB14870:
.LBB14871:
	.loc 27 626 0
	movl	592(%edx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%edx)
.LBE14871:
.LBE14870:
	.loc 22 428 0
	movl	%edx, (%esp)
	call	scheduleTCB
.LVL6549:
.LBE14869:
.LBE14868:
.LBB14872:
.LBB14873:
	.loc 27 1359 0
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$12, %eax
	jne	.L5003
.LVL6550:
	.loc 27 1362 0
	andl	$-16, %ebx
.LVL6551:
.LBE14873:
.LBE14872:
.LBB14874:
.LBB14875:
	.loc 30 774 0
	movl	%ebx, (%esp)
	call	restart
.LVL6552:
.LBE14875:
.LBE14874:
	.loc 30 291 0
	xorl	%eax, %eax
.LVL6553:
.L5001:
	.loc 30 312 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL6554:
	.p2align 4,,7
	.p2align 3
.L4991:
	.cfi_restore_state
	.loc 30 275 0
	movl	%esi, 80(%esp)
.LVL6555:
	movl	%ebp, 76(%esp)
.LVL6556:
	movl	%ebx, 64(%esp)
.LVL6557:
	movl	%ecx, 72(%esp)
	movl	%edx, 68(%esp)
.LVL6558:
	.loc 30 312 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL6559:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 30 275 0
	jmp	decodeReadRegisters
.LVL6560:
	.p2align 4,,7
	.p2align 3
.L4993:
	.cfi_restore_state
	.loc 30 278 0
	movl	%esi, 76(%esp)
.LVL6561:
	movl	%ebx, 64(%esp)
.LVL6562:
	movl	%ecx, 72(%esp)
	movl	%edx, 68(%esp)
.LVL6563:
	.loc 30 312 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL6564:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 30 278 0
	jmp	decodeWriteRegisters
.LVL6565:
	.p2align 4,,7
	.p2align 3
.L4994:
	.cfi_restore_state
	.loc 30 281 0
	movl	84(%esp), %eax
	movl	%esi, 24(%esp)
.LVL6566:
	movl	%ebx, (%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	movl	88(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, 16(%esp)
	movl	92(%esp), %eax
	movl	%eax, 20(%esp)
	call	decodeCopyRegisters
.LVL6567:
	.loc 30 312 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL6568:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL6569:
	.p2align 4,,7
	.p2align 3
.L4995:
	.cfi_restore_state
	.loc 30 295 0
	movl	84(%esp), %eax
	movl	%esi, 28(%esp)
	movl	%edi, 12(%esp)
.LVL6570:
	movl	%ebx, (%esp)
	movl	%eax, 16(%esp)
	movl	88(%esp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, 20(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	call	decodeTCBConfigure
.LVL6571:
	.loc 30 312 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL6572:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL6573:
	.p2align 4,,7
	.p2align 3
.L4996:
	.cfi_restore_state
	.loc 30 298 0
	movl	%esi, 76(%esp)
.LVL6574:
	movl	%ebx, 64(%esp)
.LVL6575:
	movl	%ecx, 72(%esp)
	movl	%edx, 68(%esp)
.LVL6576:
	.loc 30 312 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL6577:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 30 298 0
	jmp	decodeSetPriority
.LVL6578:
	.p2align 4,,7
	.p2align 3
.L4997:
	.cfi_restore_state
	.loc 30 301 0
	movl	84(%esp), %eax
	movl	%esi, 28(%esp)
	movl	%edi, 12(%esp)
.LVL6579:
	movl	%ebx, (%esp)
	movl	%eax, 16(%esp)
	movl	88(%esp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, 20(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	call	decodeSetIPCBuffer
.LVL6580:
	.loc 30 312 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL6581:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL6582:
	.p2align 4,,7
	.p2align 3
.L4998:
	.cfi_restore_state
	.loc 30 304 0
	movl	84(%esp), %eax
	movl	%esi, 28(%esp)
	movl	%edi, 12(%esp)
.LVL6583:
	movl	%ebx, (%esp)
	movl	%eax, 16(%esp)
	movl	88(%esp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, 20(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	call	decodeSetSpace
.LVL6584:
	.loc 30 312 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL6585:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL6586:
	.p2align 4,,7
	.p2align 3
.L4999:
	.cfi_restore_state
	.loc 30 285 0
	movl	ksCurThread, %edx
.LVL6587:
.LBB14876:
.LBB14877:
.LBB14878:
.LBB14879:
	.loc 27 626 0
	movl	592(%edx), %eax
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%edx)
.LBE14879:
.LBE14878:
	.loc 22 428 0
	movl	%edx, (%esp)
	call	scheduleTCB
.LVL6588:
.LBE14877:
.LBE14876:
.LBB14880:
.LBB14881:
	.loc 27 1359 0
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$12, %eax
	jne	.L5003
.LVL6589:
	.loc 27 1362 0
	andl	$-16, %ebx
.LVL6590:
.LBE14881:
.LBE14880:
.LBB14883:
.LBB14884:
	.loc 30 767 0
	movl	%ebx, (%esp)
	call	suspend
.LVL6591:
.LBE14884:
.LBE14883:
	.loc 30 286 0
	xorl	%eax, %eax
	jmp	.L5001
.LVL6592:
	.p2align 4,,7
	.p2align 3
.L4990:
	.loc 30 308 0
	movl	ksCurThread, %eax
.LVL6593:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$308, 8(%esp)
	movl	$__func__.7109, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6594:
	movl	$.LC283, (%esp)
	call	printf
.LVL6595:
	movl	$.LC20, (%esp)
	call	printf
.LVL6596:
	.loc 30 310 0
	movl	$3, %eax
	.loc 30 309 0
	movl	$3, current_syscall_error+24
	.loc 30 312 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL6597:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL6598:
.L5003:
	.cfi_restore_state
.LBB14885:
.LBB14882:
	call	cap_thread_cap_get_capTCBPtr.isra.88.part.89
.LVL6599:
.LBE14882:
.LBE14885:
	.cfi_endproc
.LFE583:
	.size	decodeTCBInvocation, .-decodeTCBInvocation
	.p2align 4,,15
	.globl	deleteCallerCap
	.type	deleteCallerCap, @function
deleteCallerCap:
.LFB580:
	.loc 30 197 0
	.cfi_startproc
.LVL6600:
	.loc 30 197 0
	movl	4(%esp), %eax
.LVL6601:
	.loc 30 200 0
	andl	$-1024, %eax
	addl	$48, %eax
.LVL6602:
	.loc 30 201 0
	movl	%eax, 4(%esp)
.LVL6603:
	jmp	cteDeleteOne
.LVL6604:
	.cfi_endproc
.LFE580:
	.size	deleteCallerCap, .-deleteCallerCap
	.p2align 4,,15
	.type	handleWait, @function
handleWait:
.LFB264:
	.loc 52 280 0
	.cfi_startproc
.LVL6605:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
.LBB14900:
.LBB14901:
	.loc 30 200 0
	movl	ksCurThread, %eax
	andl	$-1024, %eax
	addl	$48, %eax
	.loc 30 201 0
	movl	%eax, (%esp)
	call	cteDeleteOne
.LVL6606:
.LBE14901:
.LBE14900:
	.loc 52 286 0
	movl	ksCurThread, %eax
.LVL6607:
.LBB14902:
.LBB14903:
.LBB14904:
.LBB14905:
	.loc 42 65 0
	leal	-36(%ebp), %ecx
.LBE14905:
.LBE14904:
.LBE14903:
.LBE14902:
.LBB14911:
.LBB14912:
	.loc 13 27 0
	movl	4(%eax), %ebx
.LVL6608:
.LBE14912:
.LBE14911:
.LBB14913:
.LBB14910:
.LBB14908:
.LBB14906:
	.loc 42 64 0
	andl	$-1024, %eax
.LVL6609:
	movl	4(%eax), %edx
.LVL6610:
	movl	(%eax), %eax
	.loc 42 65 0
	movl	$32, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
.LVL6611:
	movl	%ecx, (%esp)
	call	resolveAddressBits
.LVL6612:
.LBE14906:
.LBE14908:
	.loc 42 26 0
	movl	-36(%ebp), %eax
.LBB14909:
.LBB14907:
	.loc 42 68 0
	movl	-32(%ebp), %edx
	.loc 42 65 0
	subl	$4, %esp
.LVL6613:
.LBE14907:
.LBE14909:
	.loc 42 26 0
	testl	%eax, %eax
	jne	.L5021
.LVL6614:
	.loc 42 33 0
	movl	(%edx), %eax
.LVL6615:
	movl	4(%edx), %esi
.LVL6616:
.LBE14910:
.LBE14913:
.LBB14914:
.LBB14915:
	.loc 27 872 0
	movl	%eax, %edi
	.loc 27 873 0
	movl	%eax, %edx
.LVL6617:
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %edi
	cmovne	%edx, %ecx
.LBE14915:
.LBE14914:
	.loc 52 296 0
	cmpl	$4, %ecx
	je	.L5012
	cmpl	$6, %ecx
	jne	.L5019
.LVL6618:
.LBB14916:
.LBB14917:
	.loc 27 1167 0
	cmpl	$6, %edx
	jne	.L5022
.LBE14917:
.LBE14916:
	.loc 52 309 0
	testl	$1, %esi
	je	.L5019
	.loc 52 316 0
	movl	%eax, -32(%ebp)
.LVL6619:
	movl	-32(%ebp), %eax
	movl	%esi, -28(%ebp)
	movl	-28(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	ksCurThread, %eax
.LVL6620:
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	receiveAsyncIPC
.LVL6621:
	.loc 52 325 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL6622:
	popl	%esi
	.cfi_restore 6
.LVL6623:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL6624:
	ret
.LVL6625:
	.p2align 4,,7
	.p2align 3
.L5019:
	.cfi_restore_state
	.loc 52 320 0
	movl	$1, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL6626:
.L5021:
	.loc 52 322 0
	movl	ksCurThread, %eax
	.loc 52 321 0
	movl	%ebx, current_fault+4
	movl	$-2147483647, current_fault
	.loc 52 322 0
	movl	%eax, (%esp)
	call	handleFault
.LVL6627:
	.loc 52 325 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL6628:
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6629:
	.p2align 4,,7
	.p2align 3
.L5012:
	.cfi_restore_state
.LBB14919:
.LBB14920:
	.loc 27 1068 0
	cmpl	$4, %edx
	jne	.L5023
.LBE14920:
.LBE14919:
	.loc 52 298 0
	testl	$1, %esi
	je	.L5019
	.loc 52 305 0
	movl	%eax, -32(%ebp)
.LVL6630:
	movl	-32(%ebp), %eax
	movl	%esi, -28(%ebp)
	movl	-28(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	ksCurThread, %eax
.LVL6631:
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	receiveIPC
.LVL6632:
	.loc 52 325 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL6633:
	popl	%esi
	.cfi_restore 6
.LVL6634:
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6635:
.L5022:
	.cfi_restore_state
.LBB14922:
.LBB14918:
	call	cap_async_endpoint_cap_get_capAEPCanReceive.part.57
.LVL6636:
.L5023:
.LBE14918:
.LBE14922:
.LBB14923:
.LBB14921:
	call	cap_endpoint_cap_get_capCanReceive.part.56
.LVL6637:
.LBE14921:
.LBE14923:
	.cfi_endproc
.LFE264:
	.size	handleWait, .-handleWait
	.p2align 4,,15
	.globl	performInvocation_Reply
	.type	performInvocation_Reply, @function
performInvocation_Reply:
.LFB570:
	.loc 38 700 0
	.cfi_startproc
.LVL6638:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$32, %esp
	.cfi_def_cfa_offset 48
	.loc 38 701 0
	movl	ksCurThread, %esi
.LVL6639:
	.loc 38 700 0
	movl	48(%esp), %ebx
.LVL6640:
.LBB14948:
.LBB14949:
.LBB14950:
.LBB14951:
	.loc 27 614 0
	movl	592(%ebx), %edx
	andl	$15, %edx
.LBE14951:
.LBE14950:
	.loc 22 131 0
	cmpl	$5, %edx
	jne	.L5031
	.loc 22 134 0
	testb	$7, 604(%ebx)
	jne	.L5026
.LVL6641:
.LBB14952:
.LBB14953:
	.loc 22 117 0
	movl	%ebx, 4(%esp)
	movl	$1, (%esp)
	call	lookupIPCBuffer
.LVL6642:
	.loc 22 119 0
	testb	$7, 604(%esi)
	.loc 22 117 0
	movl	%eax, %edi
.LVL6643:
	.loc 22 119 0
	jne	.L5027
	.loc 22 120 0
	movl	%esi, 4(%esp)
	movl	$0, (%esp)
	call	lookupIPCBuffer
.LVL6644:
	.loc 22 121 0
	movl	$0, 28(%esp)
	movl	%edi, 24(%esp)
	movl	%ebx, 20(%esp)
	movl	$1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	doNormalTransfer
.LVL6645:
.L5028:
.LBE14953:
.LBE14952:
	.loc 22 136 0
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	cteDeleteOne
.LVL6646:
.LBB14955:
.LBB14956:
.LBB14957:
	.loc 27 626 0
	movl	592(%ebx), %eax
.LBE14957:
.LBE14956:
.LBE14955:
.LBB14960:
.LBB14961:
	.loc 22 415 0
	movl	$1, %edx
.LBE14961:
.LBE14960:
.LBB14963:
.LBB14959:
.LBB14958:
	.loc 27 626 0
	andl	$-16, %eax
	.loc 27 627 0
	orl	$1, %eax
	movl	%eax, 592(%ebx)
.LVL6647:
.LBE14958:
.LBE14959:
.LBE14963:
.LBB14964:
.LBB14962:
	.loc 22 415 0
	movl	%ebx, %eax
	call	possibleSwitchTo
.LVL6648:
.L5029:
.LBE14962:
.LBE14964:
.LBE14949:
.LBE14948:
	.loc 38 703 0
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL6649:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL6650:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL6651:
.L5031:
	.cfi_restore_state
.LBB14967:
.LBB14966:
	.loc 22 131 0
	movl	$__FUNCTION__.6130, 12(%esp)
	movl	$132, 8(%esp)
	movl	$.LC108, 4(%esp)
	movl	$.LC245, (%esp)
	call	_assert_fail
.LVL6652:
.L5027:
.LBB14965:
.LBB14954:
	.loc 22 124 0
	movl	%eax, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%esi, 4(%esp)
	movl	$0, (%esp)
	call	doFaultTransfer
.LVL6653:
	jmp	.L5028
.LVL6654:
.L5026:
.LBE14954:
.LBE14965:
	movl	52(%esp), %ecx
	movl	%ebx, %edx
	movl	%esi, %eax
	call	doReplyTransfer.part.211
.LVL6655:
	jmp	.L5029
.LBE14966:
.LBE14967:
	.cfi_endproc
.LFE570:
	.size	performInvocation_Reply, .-performInvocation_Reply
	.p2align 4,,15
	.globl	pic_is_irq_pending
	.type	pic_is_irq_pending, @function
pic_is_irq_pending:
.LFB630:
	.loc 24 72 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 24 77 0
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
.LVL6656:
	.loc 24 80 0
	movl	$32, (%esp)
	call	in8
.LVL6657:
	.loc 24 85 0
	testb	%al, %al
	setne	%al
.LVL6658:
	.loc 24 86 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	.loc 24 85 0
	movzbl	%al, %eax
	.loc 24 86 0
	ret
	.cfi_endproc
.LFE630:
	.size	pic_is_irq_pending, .-pic_is_irq_pending
	.p2align 4,,15
	.globl	pic_ack_active_irq
	.type	pic_ack_active_irq, @function
pic_ack_active_irq:
.LFB631:
	.loc 24 89 0
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 24 90 0
	cmpl	$39, ia32KScurInterrupt
	jle	.L5035
	.loc 24 92 0
	movl	$32, 4(%esp)
	movl	$160, (%esp)
	call	out8
.LVL6659:
.L5035:
	.loc 24 95 0
	movl	$32, 4(%esp)
	movl	$32, (%esp)
	call	out8
.LVL6660:
	.loc 24 96 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE631:
	.size	pic_ack_active_irq, .-pic_ack_active_irq
	.section	.phys.text
	.p2align 4,,15
	.globl	pit_init
	.type	pit_init, @function
pit_init:
.LFB632:
	.file 53 "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/machine/pit.c"
	.loc 53 24 0
	.cfi_startproc
.LVL6661:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 53 27 0
	movl	$52, 4(%esp)
	movl	$67, (%esp)
	call	out8_phys
.LVL6662:
	.loc 53 28 0
	movl	$11, 4(%esp)
	movl	$64, (%esp)
	call	out8_phys
.LVL6663:
	.loc 53 29 0
	movl	$233, 4(%esp)
	movl	$64, (%esp)
	call	out8_phys
.LVL6664:
	.loc 53 30 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE632:
	.size	pit_init, .-pit_init
	.p2align 4,,15
	.globl	pit_wait_wraparound
	.type	pit_wait_wraparound, @function
pit_wait_wraparound:
.LFB633:
	.loc 53 34 0
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 53 38 0
	movl	$0, 4(%esp)
	movl	$67, (%esp)
	call	out8_phys
.LVL6665:
	.loc 53 39 0
	movl	$64, (%esp)
	call	in8_phys
.LVL6666:
	.loc 53 40 0
	movl	$64, (%esp)
	.loc 53 39 0
	movl	%eax, %esi
.LVL6667:
	.loc 53 40 0
	call	in8_phys
.LVL6668:
	movl	%eax, %ebx
	movl	%esi, %eax
	sall	$8, %ebx
	movzbl	%al, %esi
.LVL6669:
	orl	%esi, %ebx
.LVL6670:
	jmp	.L5041
.LVL6671:
	.p2align 4,,7
	.p2align 3
.L5043:
	.loc 53 47 0
	movl	%edx, %ebx
.LVL6672:
.L5041:
	.loc 53 45 0
	movl	$0, 4(%esp)
	movl	$67, (%esp)
	call	out8_phys
.LVL6673:
	.loc 53 46 0
	movl	$64, (%esp)
	call	in8_phys
.LVL6674:
	.loc 53 47 0
	movl	$64, (%esp)
	.loc 53 46 0
	movl	%eax, %esi
.LVL6675:
	.loc 53 47 0
	call	in8_phys
.LVL6676:
	movl	%eax, %edx
	movl	%esi, %eax
	sall	$8, %edx
	movzbl	%al, %esi
.LVL6677:
	orl	%esi, %edx
.LVL6678:
	.loc 53 43 0
	cmpw	%bx, %dx
	jbe	.L5043
	.loc 53 49 0
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL6679:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE633:
	.size	pit_wait_wraparound, .-pit_wait_wraparound
	.p2align 4,,15
	.globl	apic_measure_freq
	.type	apic_measure_freq, @function
apic_measure_freq:
.LFB298:
	.loc 8 74 0
	.cfi_startproc
.LVL6680:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 8 74 0
	movl	32(%esp), %edi
.LBB14978:
.LBB14979:
	.loc 53 27 0
	movl	$52, 4(%esp)
	movl	$67, (%esp)
	call	out8_phys
.LVL6681:
	.loc 53 28 0
	movl	$11, 4(%esp)
	movl	$64, (%esp)
	call	out8_phys
.LVL6682:
	.loc 53 29 0
	movl	$233, 4(%esp)
	movl	$64, (%esp)
	call	out8_phys
.LVL6683:
.LBE14979:
.LBE14978:
	.loc 8 77 0
	call	pit_wait_wraparound
.LVL6684:
.LBB14980:
.LBB14981:
	.loc 8 57 0
	movl	$11, 992(%edi)
.LVL6685:
.LBE14981:
.LBE14980:
.LBB14982:
.LBB14983:
	movl	$-1, 896(%edi)
.LBE14983:
.LBE14982:
.LBB14984:
.LBB14985:
	.loc 53 38 0
	movl	$0, 4(%esp)
	movl	$67, (%esp)
	call	out8_phys
.LVL6686:
	.loc 53 39 0
	movl	$64, (%esp)
	call	in8_phys
.LVL6687:
	.loc 53 40 0
	movl	$64, (%esp)
	.loc 53 39 0
	movl	%eax, %esi
.LVL6688:
	.loc 53 40 0
	call	in8_phys
.LVL6689:
	movl	%eax, %ebx
	movl	%esi, %eax
	sall	$8, %ebx
	movzbl	%al, %esi
.LVL6690:
	orl	%esi, %ebx
.LVL6691:
	jmp	.L5046
.LVL6692:
	.p2align 4,,7
	.p2align 3
.L5048:
	.loc 53 47 0
	movl	%edx, %ebx
.LVL6693:
.L5046:
	.loc 53 45 0
	movl	$0, 4(%esp)
	movl	$67, (%esp)
	call	out8_phys
.LVL6694:
	.loc 53 46 0
	movl	$64, (%esp)
	call	in8_phys
.LVL6695:
	.loc 53 47 0
	movl	$64, (%esp)
	.loc 53 46 0
	movl	%eax, %esi
.LVL6696:
	.loc 53 47 0
	call	in8_phys
.LVL6697:
	movl	%eax, %edx
	movl	%esi, %eax
	sall	$8, %edx
	movzbl	%al, %esi
.LVL6698:
	orl	%esi, %edx
.LVL6699:
	.loc 53 43 0
	cmpw	%bx, %dx
	jbe	.L5048
.LVL6700:
.LBE14985:
.LBE14984:
.LBB14986:
.LBB14987:
	.loc 8 50 0
	movl	912(%edi), %eax
.LBE14987:
.LBE14986:
	.loc 8 87 0
	movl	$1374389535, %edx
.LVL6701:
	.loc 8 88 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL6702:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL6703:
	.loc 8 87 0
	notl	%eax
	mull	%edx
	shrl	$4, %edx
	.loc 8 88 0
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE298:
	.size	apic_measure_freq, .-apic_measure_freq
	.section	.rodata.str1.1
.LC284:
	.string	"n % 4 == 0"
	.text
	.p2align 4,,15
	.globl	memzero
	.type	memzero, @function
memzero:
.LFB634:
	.loc 45 22 0
	.cfi_startproc
.LVL6704:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 45 22 0
	movl	32(%esp), %edx
.LVL6705:
	movl	36(%esp), %eax
	.loc 45 26 0
	testb	$3, %dl
	jne	.L5060
	.loc 45 27 0
	testb	$3, %al
	jne	.L5051
.LVL6706:
	.loc 45 30 0 discriminator 1
	testl	%eax, %eax
	je	.L5049
	.p2align 4,,7
	.p2align 3
.L5057:
	.loc 45 31 0
	movl	$0, (%edx)
.LVL6707:
	.loc 45 32 0
	addl	$4, %edx
.LVL6708:
	.loc 45 30 0
	subl	$4, %eax
.LVL6709:
	jne	.L5057
.L5049:
	.loc 45 35 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL6710:
.L5060:
	.cfi_restore_state
	call	memzero.part.214
.LVL6711:
.L5051:
	.loc 45 27 0 discriminator 1
	movl	$__FUNCTION__.7695, 12(%esp)
	movl	$27, 8(%esp)
	movl	$.LC116, 4(%esp)
	movl	$.LC284, (%esp)
	call	_assert_fail
.LVL6712:
	.cfi_endproc
.LFE634:
	.size	memzero, .-memzero
	.section	.rodata.str1.4
	.align 4
.LC285:
	.string	"IA32PageTable: Cannot unmap if more than one cap exists."
	.align 4
.LC286:
	.string	"((cap_ptr->words[0] >> 0) & 0xf) == cap_page_table_cap"
	.align 4
.LC287:
	.string	"IA32PageTable: Illegal operation."
	.align 4
.LC288:
	.string	"IA32PageTable: Truncated message."
	.align 4
.LC289:
	.string	"IA32PageTable: Page table is already mapped to a page directory."
	.align 4
.LC290:
	.string	"IA32PageTable: Mapping address too high."
	.align 4
.LC291:
	.string	"IA32Frame: Frame already mapped."
	.align 4
.LC292:
	.string	"IA32Frame: Attempting to map frame into invalid page directory cap."
	.align 4
.LC293:
	.string	"IA32Frame: Attempting to map frame into unmapped page directory cap."
	.align 4
.LC294:
	.string	"IA32PageRemap: Frame must already have been mapped."
	.align 4
.LC295:
	.string	"((cap_ptr->words[0] >> 0) & 0xf) == cap_frame_cap"
	.align 4
.LC296:
	.string	"((cap_ptr->words[0] >> 0) & 0xf) == cap_page_directory_cap"
	.section	.rodata.str1.1
.LC297:
	.string	"((~0xffff >> 0) & v) == 0"
	.text
	.p2align 4,,15
	.globl	decodeIA32MMUInvocation
	.type	decodeIA32MMUInvocation, @function
decodeIA32MMUInvocation:
.LFB380:
	.loc 4 1921 0
	.cfi_startproc
.LVL6713:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$108, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 4 1921 0
	movl	24(%ebp), %ebx
	movl	28(%ebp), %eax
	movl	32(%ebp), %edi
	movl	36(%ebp), %ecx
.LBB15331:
.LBB15332:
	.loc 27 872 0
	movl	%ebx, %esi
	.loc 27 873 0
	movl	%ebx, %edx
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %edx
.LBE15332:
.LBE15331:
	.loc 4 1921 0
	movl	%eax, -60(%ebp)
.LVL6714:
.LBB15334:
.LBB15333:
	.loc 27 873 0
	cmpl	$14, %esi
	movzbl	%bl, %eax
.LVL6715:
	cmove	%eax, %edx
.LVL6716:
.LBE15333:
.LBE15334:
	.loc 4 1922 0
	cmpl	$9, %edx
	ja	.L5064
	jmp	*.L5066(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L5066:
	.long	.L5064
	.long	.L5065
	.long	.L5064
	.long	.L5067
	.long	.L5064
	.long	.L5278
	.long	.L5064
	.long	.L5069
	.long	.L5064
	.long	.L5070
	.text
	.p2align 4,,7
	.p2align 3
.L5067:
.LVL6717:
.LBB15335:
.LBB15336:
	.loc 4 1470 0
	cmpl	$28, 8(%ebp)
	je	.L5290
	.loc 4 1492 0
	cmpl	$27, 8(%ebp)
	.p2align 4,,3
	je	.L5096
	.loc 4 1493 0
	movl	ksCurThread, %eax
.LVL6718:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$1493, 8(%esp)
	movl	$__func__.5286, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6719:
	movl	$.LC287, (%esp)
	call	printf
.LVL6720:
	movl	$.LC20, (%esp)
	call	printf
.LVL6721:
	.p2align 4,,7
	.p2align 3
.L5278:
	.loc 4 1494 0
	movl	$3, current_syscall_error+24
	.loc 4 1495 0
	movl	$3, %eax
.LVL6722:
.L5265:
.LBE15336:
.LBE15335:
	.loc 4 2070 0
	leal	-12(%ebp), %esp
.LVL6723:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
.LVL6724:
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.LVL6725:
	.p2align 4,,7
	.p2align 3
.L5070:
	.cfi_restore_state
.LBB15451:
	.loc 4 2014 0
	cmpl	$36, 8(%ebp)
	jne	.L5278
	.loc 4 2020 0
	testl	%edi, %edi
	je	.L5282
.LVL6726:
	.loc 4 2027 0
	movl	(%edi), %eax
.LVL6727:
	movl	4(%edi), %esi
.LVL6728:
.LBB15452:
.LBB15453:
	.loc 27 872 0
	movl	%eax, %ecx
.LVL6729:
	.loc 27 873 0
	movl	%eax, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%al, %eax
.LVL6730:
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LBE15453:
.LBE15452:
	.loc 4 2029 0
	cmpl	$5, %eax
	je	.L5291
.LVL6731:
.L5207:
	.loc 4 2031 0
	movl	$2, current_syscall_error+24
	.loc 4 2034 0
	movl	$3, %eax
	.loc 4 2032 0
	movl	$1, current_syscall_error+4
	.loc 4 2034 0
	jmp	.L5265
.LVL6732:
	.p2align 4,,7
	.p2align 3
.L5065:
.LBE15451:
.LBB15478:
.LBB15479:
	.loc 4 1599 0
	cmpl	$31, 8(%ebp)
	je	.L5117
	jbe	.L5292
	cmpl	$32, 8(%ebp)
	.p2align 4,,3
	je	.L5120
	cmpl	$34, 8(%ebp)
	.p2align 4,,3
	jne	.L5278
	.loc 4 1900 0
	movl	ksCurThread, %edx
.LVL6733:
.LBB15480:
.LBB15481:
.LBB15482:
.LBB15483:
	.loc 27 626 0
	movl	592(%edx), %eax
.LVL6734:
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%edx)
.LBE15483:
.LBE15482:
	.loc 22 428 0
	movl	%edx, (%esp)
	call	scheduleTCB
.LVL6735:
.LBE15481:
.LBE15480:
.LBB15484:
.LBB15485:
	.loc 27 1507 0
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L5293
.LVL6736:
.LBE15485:
.LBE15484:
.LBB15488:
.LBB15489:
	.loc 4 1437 0
	movl	ksCurThread, %eax
.LVL6737:
.LBE15489:
.LBE15488:
.LBB15495:
.LBB15486:
	.loc 27 1510 0
	andl	$16777200, %ebx
.LVL6738:
	sall	$8, %ebx
.LBE15486:
.LBE15495:
.LBB15496:
.LBB15494:
.LBB15490:
.LBB15491:
	.loc 10 41 0
	addl	$536870912, %ebx
	movl	%ebx, 20(%eax)
.LVL6739:
.LBE15491:
.LBE15490:
.LBB15492:
.LBB15493:
	.loc 13 21 0
	movl	$1, 16(%eax)
.LBE15493:
.LBE15492:
.LBE15494:
.LBE15496:
	.loc 4 1901 0
	xorl	%eax, %eax
.LVL6740:
	jmp	.L5265
.LVL6741:
	.p2align 4,,7
	.p2align 3
.L5069:
.LBE15479:
.LBE15478:
.LBB15766:
	.loc 4 1946 0
	cmpl	$35, 8(%ebp)
	jne	.L5278
	.loc 4 1952 0
	cmpl	$1, 12(%ebp)
	jbe	.L5282
	.loc 4 1952 0 is_stmt 0 discriminator 1
	testl	%edi, %edi
	je	.L5282
	.loc 4 1953 0 is_stmt 1
	testl	%ecx, %ecx
	.p2align 4,,3
	je	.L5282
.LVL6742:
.LBB15767:
.LBB15768:
	.loc 41 30 0
	movl	ksCurThread, %eax
.LVL6743:
.LBE15768:
.LBE15767:
	.loc 4 1966 0
	xorl	%esi, %esi
	.loc 4 1963 0
	movl	4(%ecx), %edx
.LBB15775:
.LBB15773:
.LBB15769:
.LBB15770:
	.loc 13 27 0
	movl	20(%eax), %ebx
.LBE15770:
.LBE15769:
.LBE15773:
.LBE15775:
.LBB15776:
.LBB15777:
.LBB15778:
.LBB15779:
	movl	24(%eax), %eax
.LVL6744:
.LBE15779:
.LBE15778:
.LBE15777:
.LBE15776:
	.loc 4 1963 0
	movl	%edx, -76(%ebp)
.LBB15783:
.LBB15774:
.LBB15772:
.LBB15771:
	.loc 13 27 0
	movl	%ebx, -64(%ebp)
.LVL6745:
.LBE15771:
.LBE15772:
.LBE15774:
.LBE15783:
	.loc 4 1962 0
	movl	(%edi), %ebx
.LBB15784:
.LBB15782:
.LBB15781:
.LBB15780:
	.loc 13 27 0
	movl	%eax, -68(%ebp)
.LVL6746:
.LBE15780:
.LBE15781:
.LBE15782:
.LBE15784:
	.loc 4 1962 0
	movl	4(%edi), %eax
	movl	%eax, -60(%ebp)
.LVL6747:
	.loc 4 1963 0
	movl	(%ecx), %eax
.LVL6748:
	movl	%eax, -80(%ebp)
.LVL6749:
	jmp	.L5191
.LVL6750:
	.p2align 4,,7
	.p2align 3
.L5193:
	.loc 4 1966 0 discriminator 1
	addl	$1, %esi
.LVL6751:
	cmpl	$64, %esi
	je	.L5214
.LVL6752:
.L5191:
	.loc 4 1966 0 is_stmt 0 discriminator 2
	movl	ia32KSASIDTable(,%esi,4), %eax
.LVL6753:
	testl	%eax, %eax
	jne	.L5193
.LVL6754:
.LBB15785:
.LBB15786:
	.loc 27 872 0 is_stmt 1
	movl	%ebx, %ecx
.LVL6755:
	.loc 27 874 0
	movl	%ebx, %edx
	.loc 27 872 0
	andl	$14, %ecx
	.loc 27 874 0
	andl	$15, %edx
	movzbl	%bl, %eax
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LBE15786:
.LBE15785:
	.loc 4 1977 0
	cmpl	$2, %eax
	jne	.L5207
.LVL6756:
.LBB15787:
.LBB15788:
	.loc 27 949 0 discriminator 1
	cmpl	$2, %edx
	jne	.L5285
	.loc 27 952 0
	movl	-60(%ebp), %eax
	andl	$31, %eax
.LBE15788:
.LBE15787:
	.loc 4 1977 0
	cmpl	$12, %eax
	jne	.L5207
	.loc 4 1985 0
	movl	%edi, (%esp)
	call	ensureNoChildren
.LVL6757:
	.loc 4 1986 0
	testl	%eax, %eax
	jne	.L5265
.LVL6758:
.LBB15790:
.LBB15791:
	.loc 42 129 0
	movl	-68(%ebp), %ecx
	leal	-56(%ebp), %eax
.LVL6759:
	movl	-80(%ebp), %edx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	%ecx, 20(%esp)
	movl	-64(%ebp), %ecx
	movl	%edx, 8(%esp)
	movl	%ecx, 16(%esp)
	movl	-76(%ebp), %ecx
	movl	%ecx, 12(%esp)
.LVL6760:
	call	lookupSlotForCNodeOp
.LVL6761:
	movl	-56(%ebp), %eax
.LBE15791:
.LBE15790:
	.loc 4 1993 0
	testl	%eax, %eax
.LBB15793:
.LBB15792:
	.loc 42 129 0
	pushl	%ecx
	movl	-52(%ebp), %ecx
.LVL6762:
.LBE15792:
.LBE15793:
	.loc 4 1993 0
	jne	.L5265
.LVL6763:
.LBB15794:
.LBB15795:
	.loc 26 890 0
	movl	(%ecx), %eax
.LVL6764:
.LBB15796:
.LBB15797:
	.loc 27 872 0
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L5199
	.loc 27 873 0
	andl	$15, %eax
.LVL6765:
.L5200:
.LBE15797:
.LBE15796:
	.loc 26 890 0
	testl	%eax, %eax
	jne	.L5214
.LBE15795:
.LBE15794:
	.loc 4 2003 0
	movl	ksCurThread, %edx
.LVL6766:
.LBB15801:
.LBB15802:
	.loc 27 968 0
	movl	%ebx, %eax
	andl	$-16, %eax
	movl	%eax, -60(%ebp)
.LVL6767:
.LBE15802:
.LBE15801:
	.loc 4 1975 0
	sall	$10, %esi
.LVL6768:
	movl	%ecx, -68(%ebp)
.LBB15803:
.LBB15804:
	.loc 22 427 0
	leal	592(%edx), %eax
	movl	%edx, -64(%ebp)
	call	thread_state_ptr_set_tsType.isra.166.constprop.286
.LVL6769:
	.loc 22 428 0
	movl	-64(%ebp), %edx
	movl	%edx, (%esp)
	call	scheduleTCB
.LVL6770:
.LBE15804:
.LBE15803:
.LBB15805:
.LBB15806:
	.loc 4 1403 0
	movl	-60(%ebp), %eax
	call	memzero.constprop.274
.LVL6771:
.LBB15807:
.LBB15808:
	.loc 27 1741 0
	testl	$4080, %ebx
	movl	-68(%ebp), %ecx
.LVL6772:
	jne	.L5294
.LVL6773:
	.loc 27 1743 0
	movl	%ebx, %eax
	andl	$-4096, %eax
	shrl	$8, %eax
	.loc 27 1747 0
	orl	$9, %eax
.LVL6774:
.LBE15808:
.LBE15807:
	.loc 4 1404 0
	movl	%eax, (%esp)
	movl	%esi, 4(%esp)
	.loc 4 1414 0
	shrl	$10, %esi
	.loc 4 1404 0
	movl	%ecx, 12(%esp)
	movl	%edi, 8(%esp)
	call	cteInsert
.LVL6775:
	.loc 4 1414 0
	movl	-60(%ebp), %eax
	movl	%eax, ia32KSASIDTable(,%esi,4)
.LBE15806:
.LBE15805:
	.loc 4 2004 0
	xorl	%eax, %eax
	jmp	.L5265
.LVL6776:
	.p2align 4,,7
	.p2align 3
.L5064:
.LBE15766:
	.loc 4 2068 0
	movl	$__func__.5377, 12(%esp)
	movl	$2068, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$.LC56, (%esp)
	call	_fail
.LVL6777:
	.p2align 4,,7
	.p2align 3
.L5292:
.LBB15815:
.LBB15753:
	.loc 4 1599 0
	cmpl	$30, 8(%ebp)
	jne	.L5278
.LBB15497:
	.loc 4 1613 0
	cmpl	$2, 12(%ebp)
	jbe	.L5282
	testl	%edi, %edi
	je	.L5282
.LVL6778:
.LBB15498:
.LBB15499:
	.loc 41 30 0
	movl	ksCurThread, %eax
.LVL6779:
.LBE15499:
.LBE15498:
.LBB15506:
.LBB15507:
	.loc 41 33 0
	movl	44(%ebp), %esi
.LBE15507:
.LBE15506:
.LBB15511:
.LBB15504:
.LBB15500:
.LBB15501:
	.loc 13 27 0
	movl	20(%eax), %ecx
.LVL6780:
.LBE15501:
.LBE15500:
.LBE15504:
.LBE15511:
.LBB15512:
.LBB15508:
	.loc 41 33 0
	testl	%esi, %esi
.LBE15508:
.LBE15512:
.LBB15513:
.LBB15505:
.LBB15503:
.LBB15502:
	.loc 13 27 0
	movl	%ecx, -64(%ebp)
.LVL6781:
.LBE15502:
.LBE15503:
.LBE15505:
.LBE15513:
.LBB15514:
.LBB15515:
.LBB15516:
.LBB15517:
	movl	24(%eax), %ecx
	movl	%ecx, -80(%ebp)
.LVL6782:
.LBE15517:
.LBE15516:
.LBE15515:
.LBE15514:
.LBB15518:
.LBB15509:
	.loc 41 33 0
	je	.L5295
.LBE15509:
.LBE15518:
.LBB15519:
.LBB15520:
	.loc 40 497 0
	movl	44(%ebp), %ecx
.LVL6783:
.LBE15520:
.LBE15519:
.LBB15522:
.LBB15523:
	.loc 27 1406 0
	movl	%ebx, %edx
	andl	$15, %edx
	cmpl	$1, %edx
.LBE15523:
.LBE15522:
.LBB15527:
.LBB15521:
	.loc 40 497 0
	movl	12(%ecx), %ecx
.LVL6784:
	movl	%ecx, -72(%ebp)
.LVL6785:
.LBE15521:
.LBE15527:
	.loc 4 1622 0
	movl	4(%edi), %ecx
.LVL6786:
	movl	%ecx, -68(%ebp)
.LVL6787:
	movl	(%edi), %ecx
.LVL6788:
.LBB15528:
.LBB15524:
	.loc 27 1406 0
	jne	.L5286
.LVL6789:
.LBE15524:
.LBE15528:
.LBB15529:
.LBB15530:
.LBB15531:
.LBB15532:
	.loc 27 1417 0
	movl	-60(%ebp), %edx
.LBE15532:
.LBE15531:
.LBB15534:
.LBB15535:
	.loc 27 1470 0
	movl	%ebx, %esi
	shrl	$26, %esi
.LBE15535:
.LBE15534:
	.loc 40 321 0
	sall	$10, %esi
.LBB15536:
.LBB15533:
	.loc 27 1417 0
	andl	$1072693248, %edx
	shrl	$20, %edx
.LBE15533:
.LBE15536:
.LBE15530:
.LBE15529:
	.loc 4 1627 0
	addl	%esi, %edx
	jne	.L5296
.LVL6790:
.LBB15537:
.LBB15538:
	.loc 27 872 0
	movl	%ecx, %edi
.LVL6791:
	.loc 27 873 0
	movl	%ecx, %edx
	.loc 27 872 0
	andl	$14, %edi
	.loc 27 873 0
	andl	$15, %edx
	movzbl	%cl, %esi
	cmpl	$14, %edi
	cmovne	%edx, %esi
.LBE15538:
.LBE15537:
	.loc 4 1635 0
	cmpl	$5, %esi
	je	.L5297
.L5130:
.LVL6792:
.LBB15539:
.LBB15540:
	.loc 27 873 0
	movl	%ecx, %edx
	movzbl	%cl, %ecx
.LVL6793:
	andl	$15, %edx
.LVL6794:
	cmpl	$14, %edi
	cmove	%ecx, %edx
.LBE15540:
.LBE15539:
	.loc 4 1637 0
	cmpl	$5, %edx
	.loc 4 1638 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
.LVL6795:
	movl	%edx, 16(%esp)
	.loc 4 1637 0
	je	.L5135
.LVL6796:
	.loc 4 1638 0
	movl	$1638, 8(%esp)
	movl	$__func__.5309, 4(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6797:
	movl	$.LC292, (%esp)
	call	printf
.LVL6798:
	movl	$.LC20, (%esp)
	call	printf
.LVL6799:
	jmp	.L5207
.LVL6800:
	.p2align 4,,7
	.p2align 3
.L5282:
.LBE15497:
.LBE15753:
.LBE15815:
.LBB15816:
	.loc 4 2021 0
	movl	$7, current_syscall_error+24
	.loc 4 2023 0
	movl	$3, %eax
.LVL6801:
	jmp	.L5265
.LVL6802:
	.p2align 4,,7
	.p2align 3
.L5290:
.LBE15816:
.LBB15817:
.LBB15442:
	.loc 4 1471 0
	movl	20(%ebp), %eax
.LVL6803:
	movl	%eax, (%esp)
	call	isFinalCapability
.LVL6804:
	testl	%eax, %eax
	jne	.L5073
	.loc 4 1473 0
	movl	ksCurThread, %eax
.LVL6805:
	.loc 4 1472 0
	movl	$9, current_syscall_error+24
	.loc 4 1473 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$1473, 8(%esp)
	movl	$__func__.5286, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6806:
	movl	$.LC285, (%esp)
	call	printf
.LVL6807:
	movl	$.LC20, (%esp)
	call	printf
.LVL6808:
	.loc 4 1474 0
	movl	$3, %eax
	jmp	.L5265
.LVL6809:
	.p2align 4,,7
	.p2align 3
.L5096:
	.loc 4 1498 0
	cmpl	$1, 12(%ebp)
	jbe	.L5097
	testl	%edi, %edi
	je	.L5097
.LVL6810:
.LBB15337:
.LBB15338:
	.loc 27 1546 0
	movl	%ebx, %eax
.LVL6811:
	andl	$15, %eax
	cmpl	$3, %eax
	jne	.L5099
.LBE15338:
.LBE15337:
	.loc 4 1504 0
	testl	$67108864, -60(%ebp)
	.loc 4 1505 0
	movl	ksCurThread, %eax
	.loc 4 1504 0
	jne	.L5298
.LVL6812:
.LBB15339:
.LBB15340:
.LBB15341:
.LBB15342:
	.loc 13 27 0
	movl	20(%eax), %ecx
.LVL6813:
	movl	%ecx, -64(%ebp)
.LVL6814:
.LBE15342:
.LBE15341:
.LBE15340:
.LBE15339:
.LBB15343:
.LBB15344:
.LBB15345:
.LBB15346:
	movl	24(%eax), %ecx
	movl	%ecx, -80(%ebp)
.LBE15346:
.LBE15345:
.LBE15344:
.LBE15343:
	.loc 4 1515 0
	movl	4(%edi), %ecx
	movl	%ecx, -68(%ebp)
.LVL6815:
	movl	(%edi), %ecx
.LVL6816:
.LBB15347:
.LBB15348:
	.loc 27 872 0
	movl	%ecx, %esi
	.loc 27 873 0
	movl	%ecx, %edi
.LVL6817:
	.loc 27 872 0
	andl	$14, %esi
	.loc 27 873 0
	andl	$15, %edi
	movzbl	%cl, %edx
	cmpl	$14, %esi
	cmovne	%edi, %edx
.LBE15348:
.LBE15347:
	.loc 4 1517 0
	cmpl	$5, %edx
	jne	.L5207
.LVL6818:
.LBB15349:
.LBB15350:
	.loc 27 1654 0
	cmpl	$5, %edi
	jne	.L5131
.LBE15350:
.LBE15349:
	.loc 4 1517 0
	testl	$65536, -68(%ebp)
	je	.L5207
.LVL6819:
	.loc 4 1528 0
	cmpl	$-536870913, -64(%ebp)
	jbe	.L5106
.LVL6820:
	.loc 4 1529 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$1529, 8(%esp)
	movl	$__func__.5286, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6821:
	movl	$.LC290, (%esp)
	call	printf
.LVL6822:
	movl	$.LC20, (%esp)
	call	printf
.LVL6823:
	.loc 4 1533 0
	movl	$3, %eax
	.loc 4 1530 0
	movl	$1, current_syscall_error+24
	.loc 4 1531 0
	movl	$0, current_syscall_error
	jmp	.L5265
.LVL6824:
	.p2align 4,,7
	.p2align 3
.L5120:
.LBE15442:
.LBE15817:
.LBB15818:
.LBB15754:
.LBB15610:
.LBB15611:
.LBB15612:
.LBB15613:
	.loc 27 1467 0
	movl	%ebx, %eax
.LVL6825:
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L5299
.LVL6826:
.LBE15613:
.LBE15612:
.LBB15616:
.LBB15617:
	.loc 27 1417 0
	movl	-60(%ebp), %ecx
.LVL6827:
.LBE15617:
.LBE15616:
.LBB15619:
.LBB15614:
	.loc 27 1470 0
	movl	%ebx, %eax
	shrl	$26, %eax
.LBE15614:
.LBE15619:
	.loc 40 322 0
	sall	$10, %eax
.LBB15620:
.LBB15618:
	.loc 27 1417 0
	movl	%ecx, %edx
.LVL6828:
	andl	$1072693248, %edx
	shrl	$20, %edx
.LBE15618:
.LBE15620:
.LBE15611:
.LBE15610:
	.loc 4 1871 0
	addl	%edx, %eax
	je	.L5183
.LVL6829:
.LBB15623:
.LBB15624:
	.loc 27 1510 0
	andl	$16777200, %ebx
.LVL6830:
.LBE15624:
.LBE15623:
.LBB15626:
.LBB15627:
	.loc 27 1437 0
	movl	%ecx, %edx
.LBE15627:
.LBE15626:
	.loc 4 1877 0
	movl	%eax, 4(%esp)
.LBB15629:
.LBB15630:
	.loc 27 1409 0
	movl	%ecx, %eax
.LBE15630:
.LBE15629:
.LBB15632:
.LBB15625:
	.loc 27 1510 0
	sall	$8, %ebx
.LBE15625:
.LBE15632:
.LBB15633:
.LBB15628:
	.loc 27 1437 0
	sall	$12, %edx
.LBE15628:
.LBE15633:
.LBB15634:
.LBB15631:
	.loc 27 1409 0
	shrl	$31, %eax
.LBE15631:
.LBE15634:
	.loc 4 1877 0
	movl	%ebx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	unmapPage
.LVL6831:
.L5183:
.LBB15635:
.LBB15636:
	.loc 27 1455 0
	movl	20(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L5300
	.loc 27 1461 0
	movl	20(%ebp), %eax
.LBE15636:
.LBE15635:
.LBB15639:
.LBB15640:
.LBB15641:
.LBB15642:
.LBB15643:
	.loc 27 1480 0
	andl	$67108863, %edx
	movl	20(%ebp), %edi
.LVL6832:
.LBE15643:
.LBE15642:
.LBE15641:
.LBE15640:
.LBE15639:
.LBB15652:
.LBB15637:
	.loc 27 1461 0
	movl	4(%eax), %eax
.LVL6833:
.LBE15637:
.LBE15652:
.LBB15653:
.LBB15650:
.LBB15648:
.LBB15645:
.LBB15644:
	.loc 27 1480 0
	movl	%edx, (%edi)
.LBE15644:
.LBE15645:
.LBE15648:
.LBE15650:
.LBE15653:
	.loc 4 1887 0
	movl	ksCurThread, %edx
.LBB15654:
.LBB15651:
.LBB15649:
.LBB15646:
.LBB15647:
	.loc 27 1427 0
	andl	$-1073741824, %eax
.LVL6834:
.LBE15647:
.LBE15646:
.LBE15649:
	.loc 40 342 0
	movl	%eax, 4(%edi)
.LBE15651:
.LBE15654:
.LBB15655:
.LBB15656:
.LBB15657:
.LBB15658:
	.loc 27 626 0
	movl	592(%edx), %eax
.LVL6835:
	andl	$-16, %eax
	.loc 27 627 0
	orl	$2, %eax
	movl	%eax, 592(%edx)
.LVL6836:
.LBE15658:
.LBE15657:
	.loc 22 428 0
	movl	%edx, (%esp)
	call	scheduleTCB
.LVL6837:
.LBE15656:
.LBE15655:
	.loc 4 1888 0
	xorl	%eax, %eax
	jmp	.L5265
.LVL6838:
	.p2align 4,,7
	.p2align 3
.L5117:
.LBB15659:
	.loc 4 1760 0
	cmpl	$1, 12(%ebp)
	jbe	.L5282
	testl	%edi, %edi
	.p2align 4,,3
	je	.L5282
.LVL6839:
.LBB15660:
.LBB15661:
	.loc 41 30 0
	movl	ksCurThread, %esi
.LVL6840:
.LBE15661:
.LBE15660:
	.loc 4 1768 0
	movl	(%edi), %ecx
.LVL6841:
.LBB15668:
.LBB15666:
.LBB15662:
.LBB15663:
	.loc 13 27 0
	movl	20(%esi), %eax
.LVL6842:
.LBE15663:
.LBE15662:
.LBE15666:
.LBE15668:
.LBB15669:
.LBB15670:
	.loc 27 872 0
	movl	%ecx, %edx
	andl	$14, %edx
.LBE15670:
.LBE15669:
.LBB15673:
.LBB15667:
.LBB15665:
.LBB15664:
	.loc 13 27 0
	movl	%eax, -68(%ebp)
.LVL6843:
.LBE15664:
.LBE15665:
.LBE15667:
.LBE15673:
.LBB15674:
.LBB15675:
	.loc 40 497 0
	movl	24(%esi), %eax
.LVL6844:
	movl	%eax, -80(%ebp)
.LVL6845:
.LBE15675:
.LBE15674:
	.loc 4 1768 0
	movl	4(%edi), %eax
.LVL6846:
.LBB15676:
.LBB15671:
	.loc 27 873 0
	movl	%ecx, %edi
.LVL6847:
	andl	$15, %edi
	cmpl	$14, %edx
.LBE15671:
.LBE15676:
	.loc 4 1768 0
	movl	%eax, -64(%ebp)
.LVL6848:
.LBB15677:
.LBB15672:
	.loc 27 873 0
	movzbl	%cl, %eax
.LVL6849:
	cmovne	%edi, %eax
.LBE15672:
.LBE15677:
	.loc 4 1770 0
	cmpl	$5, %eax
	jne	.L5207
.LVL6850:
.LBB15678:
.LBB15679:
	.loc 27 1654 0
	cmpl	$5, %edi
	jne	.L5131
.LBE15679:
.LBE15678:
	.loc 4 1770 0
	testl	$65536, -64(%ebp)
	je	.L5207
	.loc 4 1782 0
	movl	-60(%ebp), %edx
.LVL6851:
	movl	%ebx, %eax
	movl	%ecx, -72(%ebp)
.LVL6852:
	call	cap_frame_cap_get_capFMappedASID
.LVL6853:
	movl	-72(%ebp), %ecx
	testl	%eax, %eax
	je	.L5301
.LVL6854:
.LBB15680:
.LBB15681:
	.loc 27 1434 0
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L5302
.LBE15681:
.LBE15680:
.LBB15684:
.LBB15685:
	.loc 27 1690 0
	movzwl	-64(%ebp), %edi
.LBE15685:
.LBE15684:
.LBB15686:
	.loc 4 1795 0
	leal	-32(%ebp), %eax
	movl	%ecx, -72(%ebp)
.LVL6855:
	movl	%edi, %edx
	call	findPDForASID
.LVL6856:
	.loc 4 1796 0
	movl	-32(%ebp), %edx
	.loc 4 1795 0
	movl	-28(%ebp), %eax
.LVL6857:
	.loc 4 1796 0
	movl	-72(%ebp), %ecx
	testl	%edx, %edx
	jne	.L5289
.LBE15686:
.LBB15687:
.LBB15688:
	.loc 27 1711 0
	andl	$16777200, %ecx
	movl	%ecx, %esi
.LVL6858:
	sall	$8, %esi
.LBE15688:
.LBE15687:
.LBB15689:
	.loc 4 1803 0
	cmpl	%eax, %esi
	je	.L5303
.LVL6859:
.L5170:
	.loc 4 1804 0
	movl	$2, current_syscall_error+24
	.loc 4 1806 0
	movl	$1, current_syscall_error+4
.LVL6860:
.L5281:
.LBE15689:
.LBE15659:
.LBE15754:
.LBE15818:
.LBB15819:
	.loc 4 2058 0
	movl	$3, %eax
	jmp	.L5265
.LVL6861:
.L5097:
.LBE15819:
.LBB15820:
.LBB15443:
	.loc 4 1499 0
	movl	ksCurThread, %eax
.LVL6862:
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$1499, 8(%esp)
	movl	$__func__.5286, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6863:
	movl	$.LC288, (%esp)
	call	printf
.LVL6864:
	movl	$.LC20, (%esp)
	call	printf
.LVL6865:
	.loc 4 1501 0
	movl	$3, %eax
	.loc 4 1500 0
	movl	$7, current_syscall_error+24
	jmp	.L5265
.LVL6866:
.L5073:
	.loc 4 1476 0
	movl	ksCurThread, %edi
.LVL6867:
.LBB15352:
.LBB15353:
	.loc 22 427 0
	leal	592(%edi), %eax
	call	thread_state_ptr_set_tsType.isra.166.constprop.286
.LVL6868:
	.loc 22 428 0
	movl	%edi, (%esp)
	call	scheduleTCB
.LVL6869:
.LBE15353:
.LBE15352:
.LBB15354:
.LBB15355:
	.loc 27 1546 0
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$3, %eax
	jne	.L5099
.LBE15355:
.LBE15354:
	.loc 4 1478 0
	movl	-60(%ebp), %ecx
.LVL6870:
	testl	$67108864, %ecx
.LVL6871:
	je	.L5076
.LVL6872:
.LBB15357:
.LBB15358:
.LBB15359:
	.loc 27 1602 0
	movl	%ecx, %eax
.LBE15359:
.LBE15358:
.LBB15361:
.LBB15362:
	.loc 27 1622 0
	movl	%ebx, %edi
.LVL6873:
.LBE15362:
.LBE15361:
.LBB15365:
.LBB15360:
	.loc 27 1602 0
	sall	$22, %eax
.LBE15360:
.LBE15365:
.LBB15366:
.LBB15363:
	.loc 27 1622 0
	andl	$16777200, %edi
.LBE15363:
.LBE15366:
	.loc 4 1480 0
	movl	%eax, 4(%esp)
.LBB15367:
.LBB15368:
	.loc 27 1582 0
	movl	%ecx, %eax
	andl	$67107840, %eax
	shrl	$10, %eax
.LBE15368:
.LBE15367:
.LBB15369:
.LBB15364:
	.loc 27 1622 0
	sall	$8, %edi
.LVL6874:
.LBE15364:
.LBE15369:
	.loc 4 1480 0
	movl	%edi, 8(%esp)
	movl	%eax, (%esp)
	call	unmapPageTable
.LVL6875:
.LBB15370:
.LBB15371:
.LBB15372:
.LBB15373:
	.loc 27 872 0
	cmpl	$14, %esi
.LBE15373:
.LBE15372:
	.loc 40 374 0
	movl	$12, %ecx
.LBB15376:
.LBB15374:
	.loc 27 872 0
	je	.L5304
.L5077:
.LVL6876:
.LBE15374:
.LBE15376:
.LBE15371:
.LBE15370:
.LBB15388:
.LBB15389:
	.loc 39 74 0
	movl	$1, %eax
	sall	%cl, %eax
	movl	%eax, 4(%esp)
	movl	%edi, (%esp)
	call	memzero
.LVL6877:
.L5076:
.LBE15389:
.LBE15388:
.LBE15357:
.LBB15392:
.LBB15393:
	.loc 27 1567 0
	movl	20(%ebp), %eax
	movl	(%eax), %eax
	andl	$15, %eax
	cmpl	$3, %eax
	jne	.L5305
	.loc 27 1573 0
	movl	20(%ebp), %eax
	andl	$-67108865, 4(%eax)
.LBE15393:
.LBE15392:
	.loc 4 1489 0
	xorl	%eax, %eax
	jmp	.L5265
.LVL6878:
.L5291:
.LBE15443:
.LBE15820:
.LBB15821:
.LBB15454:
.LBB15455:
	.loc 27 1687 0 discriminator 1
	cmpl	$5, %edx
	jne	.L5306
.LBE15455:
.LBE15454:
	.loc 4 2029 0
	testw	%si, %si
	jne	.L5207
.LVL6879:
.LBB15457:
.LBB15458:
	.loc 27 1754 0
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$9, %eax
	jne	.L5307
	.loc 27 1757 0
	movzwl	-60(%ebp), %esi
.LVL6880:
.LBE15458:
.LBE15457:
	.loc 4 2037 0
	movl	%esi, %eax
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
.LVL6881:
	.loc 4 2038 0
	testl	%eax, %eax
	je	.L5308
.LVL6882:
.LBB15460:
.LBB15461:
	.loc 27 1765 0
	andl	$16777200, %ebx
.LVL6883:
	sall	$8, %ebx
.LBE15461:
.LBE15460:
	.loc 4 2045 0
	cmpl	%eax, %ebx
	je	.L5309
.LVL6884:
.L5280:
.LBE15821:
.LBB15822:
.LBB15755:
.LBB15737:
	.loc 4 1629 0
	movl	$2, current_syscall_error+24
	.loc 4 1632 0
	movl	$3, %eax
	.loc 4 1630 0
	movl	$0, current_syscall_error+4
	jmp	.L5265
.LVL6885:
.L5298:
.LBE15737:
.LBE15755:
.LBE15822:
.LBB15823:
.LBB15444:
	.loc 4 1505 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$1505, 8(%esp)
	movl	$__func__.5286, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6886:
	movl	$.LC289, (%esp)
.LVL6887:
.L5279:
.LBE15444:
.LBE15823:
.LBB15824:
.LBB15756:
.LBB15738:
	.loc 4 1628 0
	call	printf
.LVL6888:
	movl	$.LC20, (%esp)
	call	printf
.LVL6889:
	jmp	.L5280
.LVL6890:
.L5214:
.LBE15738:
.LBE15756:
.LBE15824:
.LBB15825:
	.loc 4 2056 0
	movl	$8, current_syscall_error+24
	jmp	.L5281
.LVL6891:
.L5296:
.LBE15825:
.LBB15826:
.LBB15757:
.LBB15739:
	.loc 4 1628 0
	movl	44(%eax), %edx
	movl	%eax, 12(%esp)
	movl	$1628, 8(%esp)
	movl	$__func__.5309, 4(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC18, (%esp)
	call	printf
.LVL6892:
	movl	$.LC291, (%esp)
	jmp	.L5279
.LVL6893:
.L5304:
.LBE15739:
.LBE15757:
.LBE15826:
.LBB15827:
.LBB15445:
.LBB15395:
.LBB15390:
.LBB15386:
.LBB15377:
.LBB15375:
	.loc 27 874 0
	movzbl	%bl, %eax
.LBE15375:
.LBE15377:
	.loc 40 354 0
	cmpl	$62, %eax
	ja	.L5078
	jmp	*.L5080(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L5080:
	.long	.L5086
	.long	.L5286
	.long	.L5285
	.long	.L5088
	.long	.L5084
	.long	.L5088
	.long	.L5084
	.long	.L5086
	.long	.L5086
	.long	.L5088
	.long	.L5089
	.long	.L5086
	.long	.L5227
	.long	.L5078
	.long	.L5086
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5086
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5093
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5078
	.long	.L5086
	.text
.L5086:
	.loc 40 411 0
	xorl	%ecx, %ecx
	.p2align 4,,3
	jmp	.L5077
.L5088:
	.loc 40 414 0
	movl	$12, %ecx
	.p2align 4,,4
	jmp	.L5077
.L5089:
.LVL6894:
.LBB15378:
.LBB15379:
	call	cap_cnode_cap_get_capCNodeRadix.part.60
.LVL6895:
.L5093:
.LBE15379:
.LBE15378:
.LBB15380:
.LBB15381:
	.loc 27 1894 0
	andl	$16128, %ebx
.LBE15381:
.LBE15380:
	.loc 40 382 0
	movl	$10, %ecx
.LBB15383:
.LBB15382:
	.loc 27 1894 0
	shrl	$8, %ebx
.LBE15382:
.LBE15383:
	.loc 40 381 0
	cmpl	$32, %ebx
	je	.L5077
	.loc 40 384 0
	movl	%ebx, %ecx
	andl	$31, %ecx
	addl	$4, %ecx
	jmp	.L5077
.LVL6896:
.L5286:
.LBE15386:
.LBE15390:
.LBE15395:
.LBE15445:
.LBE15827:
.LBB15828:
.LBB15758:
.LBB15740:
.LBB15541:
.LBB15525:
	call	cap_frame_cap_get_capFSize.part.121
.LVL6897:
.L5285:
.LBE15525:
.LBE15541:
.LBE15740:
.LBE15758:
.LBE15828:
.LBB15829:
.LBB15812:
.LBB15789:
	call	cap_untyped_cap_get_capBlockSize.part.132
.LVL6898:
.L5084:
.LBE15789:
.LBE15812:
.LBE15829:
.LBB15830:
.LBB15446:
.LBB15396:
.LBB15391:
.LBB15387:
	.loc 40 359 0
	movl	$4, %ecx
	jmp	.L5077
.L5227:
	.loc 40 368 0
	movl	$10, %ecx
	jmp	.L5077
.L5078:
.LBB15384:
.LBB15385:
	.loc 40 417 0
	movl	$__func__.2475, 12(%esp)
	movl	$417, 8(%esp)
	movl	$.LC55, 4(%esp)
	movl	$.LC56, (%esp)
	call	_fail
.LVL6899:
.L5297:
.LBE15385:
.LBE15384:
.LBE15387:
.LBE15391:
.LBE15396:
.LBE15446:
.LBE15830:
.LBB15831:
.LBB15759:
.LBB15741:
.LBB15542:
.LBB15543:
	.loc 27 1654 0
	cmpl	$5, %edx
	jne	.L5131
.LBE15543:
.LBE15542:
	.loc 4 1635 0
	testl	$65536, -68(%ebp)
	je	.L5130
.LBB15544:
.LBB15545:
	.loc 27 1690 0
	movzwl	-68(%ebp), %eax
.LVL6900:
	movl	%ecx, -88(%ebp)
.LVL6901:
	movl	%eax, -84(%ebp)
.LBE15545:
.LBE15544:
.LBB15546:
	.loc 4 1653 0
	movl	%eax, %edx
	leal	-32(%ebp), %eax
	call	findPDForASID
.LVL6902:
	.loc 4 1654 0
	movl	-32(%ebp), %ecx
	.loc 4 1653 0
	movl	-28(%ebp), %eax
.LVL6903: