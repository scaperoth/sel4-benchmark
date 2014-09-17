	.file	"kernel_final.c"
	.text
	.p2align 4,,15
	.type	lookup_fp, @function
lookup_fp:
.LFB265:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	%edx, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	andl	$15, %edx
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	cmpl	$10, %edx
	jne	.L5
	movl	%ecx, %esi
	xorl	%ebx, %ebx
	movl	%eax, (%esp)
.L8:
	movl	28(%esp), %eax
	movl	%esi, %edx
	movl	%esi, %ebp
	andl	$8126464, %edx
	andl	$260046848, %ebp
	shrl	$18, %edx
	movl	%ebx, %ecx
	shrl	$23, %ebp
	sall	%cl, %eax
	testl	%edx, %edx
	movl	%eax, 4(%esp)
	jne	.L16
.L4:
	movl	4(%esp), %esi
	movl	%edx, %ecx
	addl	%ebp, %edx
	andl	$2147483632, %edi
	addl	%edx, %ebx
	sall	%cl, %esi
	movl	$32, %ecx
	subl	%ebp, %ecx
	shrl	%cl, %esi
	sall	$4, %esi
	cmpl	$31, %ebx
	leal	(%esi,%edi,2), %ecx
	movl	(%ecx), %edi
	movl	4(%ecx), %esi
	jbe	.L17
	cmpl	$32, %ebx
	movl	(%esp), %eax
	jne	.L5
.L7:
	movl	%edi, (%eax)
	movl	%esi, 4(%eax)
.L1:
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
.L16:
	.cfi_restore_state
	movl	$32, %ecx
	andl	$262143, %esi
	subl	%edx, %ecx
	shrl	%cl, %eax
	cmpl	%esi, %eax
	je	.L4
	movl	(%esp), %eax
.L5:
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	jmp	.L1
.L17:
	movl	%edi, %edx
	andl	$15, %edx
	cmpl	$10, %edx
	je	.L8
	movl	(%esp), %eax
	jmp	.L7
	.cfi_endproc
.LFE265:
	.size	lookup_fp, .-lookup_fp
	.p2align 4,,15
	.type	switchToThread_fp, @function
switchToThread_fp:
.LFB266:
	.cfi_startproc
	addl	$536870912, %edx
	cmpl	ia32KSCurrentPD, %edx
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	je	.L19
	movl	%edx, ia32KSCurrentPD
#APP
# 35 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %edx, %cr3
# 0 "" 2
#NO_APP
.L19:
	movl	48(%ecx), %edx
	movl	ia32KSgdt+52, %eax
	movl	%ecx, ksCurThread
	movl	%edx, %ebx
	shrl	$16, %ebx
	andl	$16776960, %eax
	movzbl	%bl, %ebx
	orl	%ebx, %eax
	movw	%dx, ia32KSgdt+50
	andl	$-16777216, %edx
	orl	%edx, %eax
	movl	636(%ecx), %edx
	movl	%eax, ia32KSgdt+52
	movl	ia32KSgdt+60, %eax
	movl	%edx, %ebx
	shrl	$16, %ebx
	andl	$16776960, %eax
	movzbl	%bl, %ebx
	orl	%ebx, %eax
	movw	%dx, ia32KSgdt+58
	andl	$-16777216, %edx
	orl	%edx, %eax
	movl	%eax, ia32KSgdt+60
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE266:
	.size	switchToThread_fp, .-switchToThread_fp
	.p2align 4,,15
	.type	fastpath_restore, @function
fastpath_restore:
.LFB279:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	movl	ksCurThread, %eax
	movl	%edx, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	%ecx, %ebx
	movl	ia32KSfpuOwner, %ecx
	cmpl	%ecx, %eax
	je	.L31
	testl	%ecx, %ecx
	jne	.L32
.L23:
	andl	$-513, 64(%eax)
	cmpl	$35, 28(%eax)
	leal	76(%eax), %ecx
	movl	%ecx, ia32KStss+4
	je	.L33
.L24:
	leal	20(%eax), %ecx
	movl	(%eax), %eax
#APP
# 233 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/src/arch/ia32/fastpath/fastpath.c" 1
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
.L28:
.L27:
	jmp	.L27
.L33:
	cmpl	$35, 32(%eax)
	jne	.L24
	leal	20(%eax), %ecx
	movl	(%eax), %eax
#APP
# 210 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/src/arch/ia32/fastpath/fastpath.c" 1
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
	jmp	.L28
.L32:
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %ecx
# 0 "" 2
#NO_APP
	orl	$8, %ecx
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %ecx, %cr0
# 0 "" 2
#NO_APP
	jmp	.L23
.L31:
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
	.p2align 4,,3
	jmp	.L23
	.cfi_endproc
.LFE279:
	.size	fastpath_restore, .-fastpath_restore
	.p2align 4,,15
	.type	cap_get_capPtr, @function
cap_get_capPtr:
.LFB229:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	movl	%eax, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	andl	$14, %esi
	movl	%eax, %ecx
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	andl	$15, %ecx
	movzbl	%al, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %ecx
	cmpl	$62, %ecx
	ja	.L37
	jmp	*.L39(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L39:
	.long	.L51
	.long	.L46
	.long	.L45
	.long	.L46
	.long	.L45
	.long	.L46
	.long	.L45
	.long	.L51
	.long	.L51
	.long	.L46
	.long	.L47
	.long	.L51
	.long	.L48
	.long	.L37
	.long	.L51
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L51
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L49
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L37
	.long	.L51
	.text
	.p2align 4,,7
	.p2align 3
.L46:
	andl	$16777200, %eax
	sall	$8, %eax
.L38:
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
	.p2align 4,,7
	.p2align 3
.L45:
	.cfi_restore_state
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	andl	$-16, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L51:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L38
	.p2align 4,,7
	.p2align 3
.L49:
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L52
	leal	1(%eax), %ecx
	movl	$-1, %eax
	sall	%cl, %eax
	andl	%edx, %eax
	jmp	.L38
	.p2align 4,,7
	.p2align 3
.L48:
	andl	$-1024, %eax
	jmp	.L38
	.p2align 4,,7
	.p2align 3
.L47:
	andl	$2147483632, %eax
	addl	%eax, %eax
	jmp	.L38
	.p2align 4,,7
	.p2align 3
.L37:
	call	halt
	.p2align 4,,7
	.p2align 3
.L52:
	movl	$-16, %eax
	andl	%edx, %eax
	jmp	.L38
	.cfi_endproc
.LFE229:
	.size	cap_get_capPtr, .-cap_get_capPtr
	.p2align 4,,15
	.type	cap_get_capSizeBits, @function
cap_get_capSizeBits:
.LFB228:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	movl	%eax, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	andl	$14, %esi
	movl	%eax, %ecx
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	andl	$15, %ecx
	movzbl	%al, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %ecx
	cmpl	$62, %ecx
	ja	.L57
	jmp	*.L59(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L59:
	.long	.L65
	.long	.L60
	.long	.L61
	.long	.L67
	.long	.L63
	.long	.L67
	.long	.L63
	.long	.L65
	.long	.L65
	.long	.L67
	.long	.L68
	.long	.L65
	.long	.L77
	.long	.L57
	.long	.L65
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L65
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L73
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L57
	.long	.L65
	.text
	.p2align 4,,7
	.p2align 3
.L65:
	xorl	%eax, %eax
.L70:
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
	.p2align 4,,7
	.p2align 3
.L60:
	.cfi_restore_state
	shrl	$31, %edx
	testl	%edx, %edx
	jne	.L83
	.p2align 4,,7
	.p2align 3
.L67:
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	$12, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L77:
	.cfi_restore_state
	movl	$10, %eax
	jmp	.L70
	.p2align 4,,7
	.p2align 3
.L73:
	andl	$16128, %eax
	movl	%eax, %edx
	movl	$10, %eax
	shrl	$8, %edx
	cmpl	$32, %edx
	je	.L70
	movl	%edx, %eax
	andl	$31, %eax
	addl	$4, %eax
	jmp	.L70
	.p2align 4,,7
	.p2align 3
.L68:
	movl	%edx, %eax
	andl	$260046848, %eax
	shrl	$23, %eax
	addl	$4, %eax
	jmp	.L70
	.p2align 4,,7
	.p2align 3
.L61:
	movl	%edx, %eax
	andl	$31, %eax
	jmp	.L70
	.p2align 4,,7
	.p2align 3
.L63:
	movl	$4, %eax
	jmp	.L70
	.p2align 4,,7
	.p2align 3
.L57:
	call	halt
	.p2align 4,,7
	.p2align 3
.L83:
	cmpl	$1, %edx
	jne	.L57
	movl	$22, %eax
	jmp	.L70
	.cfi_endproc
.LFE228:
	.size	cap_get_capSizeBits, .-cap_get_capSizeBits
	.p2align 4,,15
	.type	switchFpuOwner, @function
switchFpuOwner:
.LFB366:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	%eax, %ebx
	subl	$24, %esp
	.cfi_def_cfa_offset 32
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
	movl	ia32KSfpuOwner, %eax
	testl	%eax, %eax
	je	.L85
	addl	$80, %eax
	movl	%eax, (%esp)
	call	saveFpuState
.L85:
	testl	%ebx, %ebx
	je	.L86
	leal	80(%ebx), %eax
	movl	%eax, (%esp)
	call	loadFpuState
	movl	%ebx, ia32KSfpuOwner
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L86:
	.cfi_restore_state
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
#NO_APP
	orl	$8, %eax
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
	movl	%ebx, ia32KSfpuOwner
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE366:
	.size	switchFpuOwner, .-switchFpuOwner
	.p2align 4,,15
	.type	lookupPTSlot, @function
lookupPTSlot:
.LFB345:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	%ecx, %ebx
	shrl	$22, %ebx
	movl	(%edx,%ebx,4), %edx
	testb	$-128, %dl
	jne	.L93
	testb	$1, %dl
	je	.L93
	shrl	$10, %ecx
	andl	$-4096, %edx
	andl	$4092, %ecx
	leal	-536870912(%edx,%ecx), %ecx
	xorl	%edx, %edx
	movl	%ecx, 4(%eax)
	movl	%edx, (%eax)
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L93:
	.cfi_restore_state
	xorl	%ecx, %ecx
	movl	$2, %edx
	movl	$89, current_lookup_fault
	movl	$0, current_lookup_fault+4
	movl	%ecx, 4(%eax)
	movl	%edx, (%eax)
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE345:
	.size	lookupPTSlot, .-lookupPTSlot
	.p2align 4,,15
	.type	findPDForASID, @function
findPDForASID:
.LFB351:
	.cfi_startproc
	movl	%edx, %ecx
	shrl	$10, %ecx
	movl	ia32KSASIDTable(,%ecx,4), %ecx
	testl	%ecx, %ecx
	je	.L100
	andl	$1023, %edx
	movl	(%ecx,%edx,4), %edx
	testl	%edx, %edx
	je	.L100
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	ret
	.p2align 4,,7
	.p2align 3
.L100:
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	ret
	.cfi_endproc
.LFE351:
	.size	findPDForASID, .-findPDForASID
	.p2align 4,,15
	.type	parse_opt.constprop.142, @function
parse_opt.constprop.142:
.LFB769:
	.cfi_startproc
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
	movl	$-1, %eax
	.p2align 4,,7
	.p2align 3
.L105:
	cmpb	$32, %bl
	jg	.L133
	testb	%bl, %bl
	jne	.L110
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
.L133:
	.cfi_restore_state
	movzbl	(%esi), %edx
	testb	%dl, %dl
	.p2align 4,,2
	je	.L107
	cmpb	$61, %bl
	je	.L121
	cmpb	%bl, %dl
	jne	.L121
	movl	%esi, %ebx
	.p2align 4,,4
	jmp	.L113
	.p2align 4,,7
	.p2align 3
.L112:
	movzbl	1(%ecx), %ecx
	cmpb	$61, %cl
	je	.L122
	cmpb	$32, %cl
	jle	.L124
	cmpb	%cl, %dl
	jne	.L124
	movl	%edi, %ecx
.L113:
	addl	$1, %ebx
	movzbl	(%ebx), %edx
	leal	1(%ecx), %edi
	testb	%dl, %dl
	jne	.L112
	movzbl	1(%ecx), %ebx
	movl	%edi, %ecx
.L107:
	cmpb	$61, %bl
	je	.L134
	.p2align 4,,7
	.p2align 3
.L119:
	cmpb	$32, %bl
	jle	.L105
	.p2align 4,,7
	.p2align 3
.L118:
	addl	$1, %ecx
	movzbl	(%ecx), %ebx
	cmpb	$32, %bl
	jg	.L118
	jmp	.L105
	.p2align 4,,7
	.p2align 3
.L110:
	movzbl	1(%ecx), %ebx
	addl	$1, %ecx
	jmp	.L105
	.p2align 4,,7
	.p2align 3
.L124:
	movl	%ecx, %ebx
	movl	%edi, %ecx
	jmp	.L119
	.p2align 4,,7
	.p2align 3
.L122:
	movl	$61, %ebx
	movl	%edi, %ecx
	jmp	.L119
.L134:
	leal	1(%ecx), %edx
	movzbl	1(%ecx), %ecx
	cmpb	$32, %cl
	jle	.L125
	xorl	%eax, %eax
	jmp	.L116
	.p2align 4,,7
	.p2align 3
.L115:
	cmpl	$999, %eax
	je	.L135
.L116:
	addl	$1, %edx
	addl	$1, %eax
	movb	%cl, cmdline_val-1(%eax)
	movzbl	(%edx), %ecx
	cmpb	$32, %cl
	jg	.L115
	leal	cmdline_val(%eax), %ecx
.L114:
	movb	$0, (%ecx)
	movl	%edx, %ecx
	movzbl	(%edx), %ebx
	jmp	.L119
.L135:
	movl	$cmdline_val+999, %ecx
	jmp	.L114
.L121:
	movl	%ecx, %edi
	movl	%edi, %ecx
	jmp	.L119
.L125:
	movl	$cmdline_val, %ecx
	xorl	%eax, %eax
	jmp	.L114
	.cfi_endproc
.LFE769:
	.size	parse_opt.constprop.142, .-parse_opt.constprop.142
	.section	.boot.text,"ax",@progbits
	.p2align 4,,15
	.type	alloc_region.constprop.155, @function
alloc_region.constprop.155:
.LFB756:
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
	subl	$32, %esp
	.cfi_def_cfa_offset 52
	movl	ndks_boot, %ecx
	movl	ndks_boot+4, %ebx
	leal	-1(%ecx), %eax
	andl	$-4096, %eax
	movl	%ebx, %esi
	leal	4096(%eax), %edx
	movl	%ebx, %eax
	andl	$-4096, %eax
	movl	%edx, %edi
	subl	%ecx, %edi
	subl	%eax, %esi
	cmpl	%esi, %edi
	jb	.L137
	leal	-4096(%eax), %edx
.L138:
	cmpl	%eax, %edx
	jae	.L152
	cmpl	%ecx, %edx
	jae	.L168
.L152:
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
	movl	$0, 12(%esp)
	xorl	%eax, %eax
	xorl	%edx, %edx
	movl	$0, 8(%esp)
.L139:
	movl	ndks_boot+8, %esi
	movl	ndks_boot+12, %edi
	movl	%esi, 4(%esp)
	subl	$1, %esi
	andl	$-4096, %esi
	movl	%edi, %ebp
	andl	$-4096, %ebp
	addl	$4096, %esi
	movl	%ebp, (%esp)
	movl	%esi, %ebp
	movl	%edi, 16(%esp)
	subl	4(%esp), %ebp
	subl	(%esp), %edi
	cmpl	%edi, %ebp
	jae	.L141
	leal	4096(%esi), %edi
	movl	%edi, (%esp)
.L142:
	cmpl	%esi, (%esp)
	jbe	.L156
	cmpl	%esi, 4(%esp)
	jbe	.L169
.L156:
	xorl	%edi, %edi
.L143:
	cmpl	%eax, %edx
	je	.L162
.L145:
	cmpl	%ebx, 12(%esp)
	movl	$0, ndks_boot(,%edi,8)
	movl	$0, ndks_boot+4(,%edi,8)
	je	.L147
	movl	ndks_boot+4, %eax
	cmpl	%eax, ndks_boot
	je	.L163
	movl	ndks_boot+12, %eax
	cmpl	%eax, ndks_boot+8
	je	.L170
.L147:
	cmpl	8(%esp), %ecx
	movl	%edx, %eax
	je	.L146
	movl	ndks_boot+4, %eax
	cmpl	%eax, ndks_boot
	je	.L165
	movl	ndks_boot+12, %ebx
	movl	%edx, %eax
	cmpl	%ebx, ndks_boot+8
	je	.L171
.L146:
	addl	$32, %esp
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
.L141:
	.cfi_restore_state
	movl	(%esp), %esi
	subl	$4096, %esi
	jmp	.L142
	.p2align 4,,7
	.p2align 3
.L137:
	leal	4096(%edx), %eax
	jmp	.L138
	.p2align 4,,7
	.p2align 3
.L169:
	movl	(%esp), %edi
	cmpl	%edi, 16(%esp)
	jb	.L156
	movl	%esi, %edi
	subl	4(%esp), %edi
	movl	%edi, %ebp
	movl	%edi, 20(%esp)
	movl	16(%esp), %edi
	subl	(%esp), %edi
	cmpl	%edi, %ebp
	jb	.L157
	movl	%eax, %ebp
	movl	20(%esp), %eax
	movl	%eax, 28(%esp)
	movl	4(%esp), %eax
	movl	%eax, 24(%esp)
	movl	16(%esp), %eax
	movl	%esi, 16(%esp)
	movl	%eax, 20(%esp)
	movl	(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%ebp, %eax
.L144:
	cmpl	%eax, %edx
	je	.L159
	movl	8(%esp), %eax
	subl	%ecx, %eax
	cmpl	%edi, %eax
	ja	.L159
	movl	$0, %edi
	jne	.L145
	movl	%ebx, %eax
	subl	12(%esp), %eax
	cmpl	28(%esp), %eax
	jbe	.L145
	movl	24(%esp), %eax
	movl	%esi, %edx
	movw	$1, %di
	movl	16(%esp), %ebx
	movl	4(%esp), %ecx
	movl	%eax, 12(%esp)
	movl	20(%esp), %eax
	movl	%eax, 8(%esp)
	movl	(%esp), %eax
	jmp	.L143
	.p2align 4,,7
	.p2align 3
.L168:
	cmpl	%eax, %ebx
	jb	.L152
	movl	%edx, %edi
	movl	%ebx, %esi
	subl	%ecx, %edi
	subl	%eax, %esi
	cmpl	%esi, %edi
	jb	.L153
	movl	%ecx, 12(%esp)
	movl	%eax, %ecx
	movl	%ebx, 8(%esp)
	movl	%edx, %ebx
	jmp	.L139
	.p2align 4,,7
	.p2align 3
.L159:
	movl	24(%esp), %eax
	movl	%esi, %edx
	movl	$1, %edi
	movl	16(%esp), %ebx
	movl	4(%esp), %ecx
	movl	%eax, 12(%esp)
	movl	20(%esp), %eax
	movl	%eax, 8(%esp)
	movl	(%esp), %eax
	jmp	.L143
	.p2align 4,,7
	.p2align 3
.L162:
	addl	$32, %esp
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
.L153:
	.cfi_restore_state
	movl	%eax, 12(%esp)
	movl	%edx, 8(%esp)
	jmp	.L139
	.p2align 4,,7
	.p2align 3
.L157:
	movl	(%esp), %ebp
	movl	%edi, 28(%esp)
	movl	20(%esp), %edi
	movl	%esi, 20(%esp)
	movl	%ebp, 24(%esp)
	jmp	.L144
	.p2align 4,,7
	.p2align 3
.L165:
	movl	$ndks_boot, %eax
.L149:
	movl	%ecx, (%eax)
	movl	8(%esp), %ecx
	movl	%ecx, 4(%eax)
	movl	%edx, %eax
	jmp	.L146
	.p2align 4,,7
	.p2align 3
.L163:
	movl	$ndks_boot, %eax
.L148:
	movl	12(%esp), %esi
	movl	%ebx, 4(%eax)
	movl	%esi, (%eax)
	jmp	.L147
	.p2align 4,,7
	.p2align 3
.L171:
	movl	$ndks_boot+8, %eax
	jmp	.L149
	.p2align 4,,7
	.p2align 3
.L170:
	movl	$ndks_boot+8, %eax
	jmp	.L148
	.cfi_endproc
.LFE756:
	.size	alloc_region.constprop.155, .-alloc_region.constprop.155
	.text
	.p2align 4,,15
	.type	pic_mask_irq.constprop.171, @function
pic_mask_irq.constprop.171:
.LFB742:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	cmpl	$7, %eax
	jg	.L173
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	$33, %ebx
.L174:
	movl	%ebx, (%esp)
	call	in8
	movl	%ebx, (%esp)
	orl	%esi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
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
.L173:
	.cfi_restore_state
	leal	-8(%eax), %ecx
	movl	$1, %edx
	sall	%cl, %edx
	movl	$161, %ebx
	movl	%edx, %esi
	jmp	.L174
	.cfi_endproc
.LFE742:
	.size	pic_mask_irq.constprop.171, .-pic_mask_irq.constprop.171
	.section	.text.unlikely,"ax",@progbits
	.type	makeUserPDE, @function
makeUserPDE:
.LFB341:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %ebx
	cmpl	$2, %ebx
	je	.L181
	cmpl	$3, %ebx
	je	.L179
	cmpl	$1, %ebx
	je	.L179
	call	halt
.L179:
	subl	$2, %ebx
	cmpl	$1, %ebx
	ja	.L183
	movl	$1, %esi
	jmp	.L178
.L181:
	xorl	%esi, %esi
.L178:
	movl	$1, %edi
	jmp	.L180
.L183:
	movl	$1, %esi
	xorl	%edi, %edi
.L180:
	movl	%ecx, %ebx
	andl	$-4194304, %edx
	andl	$1, %ebx
	addl	%esi, %esi
	sall	$3, %ebx
	orb	$-127, %bl
	orl	%edx, %ebx
	movl	%ecx, %edx
	andl	$4, %edx
	andl	$2, %ecx
	shrl	$2, %edx
	sall	$12, %edx
	shrl	%ecx
	orl	%edx, %ebx
	sall	$4, %ecx
	sall	$2, %edi
	orl	%ecx, %ebx
	orl	%edi, %ebx
	orl	%esi, %ebx
	movl	%ebx, (%eax)
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
	.cfi_endproc
.LFE341:
	.size	makeUserPDE, .-makeUserPDE
	.type	makeUserPTE, @function
makeUserPTE:
.LFB342:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %ebx
	cmpl	$2, %ebx
	je	.L197
	cmpl	$3, %ebx
	je	.L195
	cmpl	$1, %ebx
	je	.L195
	call	halt
.L195:
	subl	$2, %ebx
	cmpl	$1, %ebx
	ja	.L199
	movl	$1, %esi
	jmp	.L194
.L197:
	xorl	%esi, %esi
.L194:
	movl	$1, %edi
	jmp	.L196
.L199:
	movl	$1, %esi
	xorl	%edi, %edi
.L196:
	movl	%ecx, %ebx
	andl	$-4096, %edx
	andl	$1, %ebx
	addl	%esi, %esi
	sall	$3, %ebx
	orl	$1, %ebx
	orl	%edx, %ebx
	movl	%ecx, %edx
	andl	$4, %edx
	andl	$2, %ecx
	shrl	$2, %edx
	sall	$7, %edx
	shrl	%ecx
	orl	%edx, %ebx
	sall	$4, %ecx
	sall	$2, %edi
	orl	%ecx, %ebx
	orl	%edi, %ebx
	orl	%esi, %ebx
	movl	%ebx, (%eax)
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
	.cfi_endproc
.LFE342:
	.size	makeUserPTE, .-makeUserPTE
	.text
	.p2align 4,,15
	.type	resetMemMapping, @function
resetMemMapping:
.LFB384:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	movl	%edx, %edi
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	andl	$14, %edi
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edx, %ebx
	andl	$15, %ebx
	movzbl	%dl, %esi
	cmpl	$14, %edi
	cmove	%esi, %ebx
	cmpl	$3, %ebx
	je	.L212
	cmpl	$5, %ebx
	je	.L213
	cmpl	$1, %ebx
	je	.L218
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	movl	%edx, (%eax)
	movl	%ecx, 4(%eax)
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L218:
	.cfi_restore_state
	andl	$67108863, %edx
	andl	$-1072693249, %ecx
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	movl	%edx, (%eax)
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	movl	%ecx, 4(%eax)
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L213:
	.cfi_restore_state
	andl	$-65537, %ecx
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	movl	%edx, (%eax)
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	movl	%ecx, 4(%eax)
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L212:
	.cfi_restore_state
	andl	$-67108865, %ecx
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	movl	%edx, (%eax)
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	movl	%ecx, 4(%eax)
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE384:
	.size	resetMemMapping, .-resetMemMapping
	.section	.boot.text
	.p2align 4,,15
	.type	pci_scan_bars, @function
pci_scan_bars:
.LFB576:
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
	movzbl	64(%esp), %edi
	testl	%edi, %edi
	movl	%edi, 24(%esp)
	je	.L219
	sall	$16, %eax
	xorl	%esi, %esi
	movl	%eax, 20(%esp)
	sall	$11, %edx
	orl	$-2147483648, 20(%esp)
	orl	%edx, 20(%esp)
	sall	$8, %ecx
	orl	%ecx, 20(%esp)
	.p2align 4,,7
	.p2align 3
.L229:
	leal	0(,%esi,4), %ebp
	leal	16(%ebp), %ebx
	movzbl	%bl, %ebx
	orl	20(%esp), %ebx
	movl	$3320, (%esp)
	movl	%ebx, 4(%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	movl	%ebx, 4(%esp)
	movl	$3320, (%esp)
	movl	%eax, 16(%esp)
	call	out32
	movl	$-1, 4(%esp)
	movl	$3324, (%esp)
	call	out32
	movl	%ebx, 4(%esp)
	movl	$3320, (%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	testl	%eax, %eax
	je	.L221
	testb	$1, %al
	jne	.L222
	movl	%eax, %edi
	movl	$4096, %edx
	andl	$-16, %edi
	negl	%edi
	cmpl	$4095, %edi
	cmovbe	%edx, %edi
	testl	$4080, 16(%esp)
	jne	.L222
	xorl	%ecx, %ecx
	.p2align 4,,7
	.p2align 3
.L225:
	addl	$1, %ecx
	btl	%ecx, %edi
	jnc	.L225
	movl	$1, %edx
	sall	%cl, %edx
	cmpl	%edi, %edx
	je	.L235
	.p2align 4,,7
	.p2align 3
.L222:
	movl	%ebx, 4(%esp)
	movl	$3320, (%esp)
	call	out32
	movl	16(%esp), %eax
	movl	$3324, (%esp)
	movl	%eax, 4(%esp)
	call	out32
.L221:
	addl	$1, %esi
	cmpl	24(%esp), %esi
	jb	.L229
.L219:
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
.L235:
	.cfi_restore_state
	movl	16(%esp), %ecx
	andl	$-16, %ecx
	testb	$4, %al
	jne	.L236
	movl	glks+828, %edx
	cmpl	$198, %edx
	ja	.L222
	leal	glks+816(,%edx,8), %eax
	addl	%ecx, %edi
	addl	$1, %edx
	movl	%ecx, 16(%eax)
	movl	%edi, 20(%eax)
	movl	%edx, glks+828
	jmp	.L222
.L236:
	leal	20(%ebp), %eax
	movzbl	%al, %eax
	orl	20(%esp), %eax
	movl	$3320, (%esp)
	movl	%ecx, 28(%esp)
	movl	%eax, 4(%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	movl	28(%esp), %ecx
	testl	%eax, %eax
	jne	.L227
	movl	glks+828, %eax
	cmpl	$198, %eax
	ja	.L227
	leal	glks+816(,%eax,8), %edx
	addl	$1, %eax
	movl	%ecx, 16(%edx)
	addl	%edi, %ecx
	movl	%ecx, 20(%edx)
	movl	%eax, glks+828
.L227:
	addl	$1, %esi
	jmp	.L222
	.cfi_endproc
.LFE576:
	.size	pci_scan_bars, .-pci_scan_bars
	.p2align 4,,15
	.type	pci_scan_fun, @function
pci_scan_fun:
.LFB577:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movzbl	%cl, %ebp
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movzbl	%dl, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movzbl	%al, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	movl	%esi, %eax
	movl	%edi, %ebx
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	sall	$16, %eax
	sall	$11, %ebx
	orl	%eax, %ebx
	movl	%ebp, %eax
	sall	$8, %eax
	orl	%eax, %ebx
	movl	%ebx, %edx
	orl	$-2147483648, %edx
	movl	%edx, 4(%esp)
	movl	$3320, (%esp)
	movl	%edx, 12(%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	cmpw	$-1, %ax
	je	.L242
	movl	12(%esp), %edx
	orl	$-2147483636, %ebx
	movl	$3320, (%esp)
	movl	%edx, 4(%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	movl	%ebx, 4(%esp)
	movl	$3320, (%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	shrl	$16, %eax
	andl	$127, %eax
	cmpb	$1, %al
	je	.L239
	jb	.L240
	cmpb	$2, %al
	jne	.L247
	movl	$1, (%esp)
.L246:
	movl	%esi, %eax
	movl	%ebp, %ecx
	movl	%edi, %edx
	call	pci_scan_bars
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$1, %eax
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
.L242:
	.cfi_restore_state
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
	.p2align 4,,7
	.p2align 3
.L247:
	.cfi_restore_state
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$1, %eax
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
.L239:
	.cfi_restore_state
	movl	$2, (%esp)
	jmp	.L246
	.p2align 4,,7
	.p2align 3
.L240:
	movl	$6, (%esp)
	jmp	.L246
	.cfi_endproc
.LFE577:
	.size	pci_scan_fun, .-pci_scan_fun
	.p2align 4,,15
	.type	pci_scan_fun.constprop.145, @function
pci_scan_fun.constprop.145:
.LFB766:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movzbl	%dl, %ebp
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movzbl	%al, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %eax
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	movl	%ebp, %ebx
	sall	$16, %eax
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	sall	$11, %ebx
	orl	%eax, %ebx
	movl	%ebx, %esi
	orl	$-2147483648, %esi
	movl	%esi, 4(%esp)
	movl	$3320, (%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	cmpw	$-1, %ax
	je	.L253
	movl	%esi, 4(%esp)
	orl	$-2147483636, %ebx
	movl	$3320, (%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	movl	%ebx, 4(%esp)
	movl	$3320, (%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	shrl	$16, %eax
	andl	$127, %eax
	cmpb	$1, %al
	je	.L250
	jb	.L251
	cmpb	$2, %al
	jne	.L258
	movl	$1, (%esp)
.L257:
	movl	%edi, %eax
	movl	%ebp, %edx
	xorl	%ecx, %ecx
	call	pci_scan_bars
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$1, %eax
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
.L253:
	.cfi_restore_state
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
	.p2align 4,,7
	.p2align 3
.L258:
	.cfi_restore_state
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$1, %eax
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
.L250:
	.cfi_restore_state
	movl	$2, (%esp)
	jmp	.L257
	.p2align 4,,7
	.p2align 3
.L251:
	movl	$6, (%esp)
	jmp	.L257
	.cfi_endproc
.LFE766:
	.size	pci_scan_fun.constprop.145, .-pci_scan_fun.constprop.145
	.text
	.p2align 4,,15
	.globl	restore_user_context
	.type	restore_user_context, @function
restore_user_context:
.LFB261:
	.cfi_startproc
	movl	ksCurThread, %eax
	leal	76(%eax), %edx
	movl	%edx, ia32KStss+4
	movl	ia32KSfpuOwner, %edx
	cmpl	%edx, %eax
	je	.L267
	testl	%edx, %edx
	jne	.L268
.L261:
	cmpl	$-1, 52(%eax)
	jne	.L262
	andl	$-513, 64(%eax)
#APP
# 37 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/src/arch/ia32/c_traps.c" 1
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
.L264:
.L263:
	jmp	.L263
.L262:
#APP
# 89 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/src/arch/ia32/c_traps.c" 1
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
	jmp	.L264
.L268:
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %edx
# 0 "" 2
#NO_APP
	orl	$8, %edx
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %edx, %cr0
# 0 "" 2
#NO_APP
	jmp	.L261
.L267:
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
	.p2align 4,,8
	jmp	.L261
	.cfi_endproc
.LFE261:
	.size	restore_user_context, .-restore_user_context
	.section	.boot.text
	.p2align 4,,15
	.globl	apic_get_base_paddr
	.type	apic_get_base_paddr, @function
apic_get_base_paddr:
.LFB287:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	$27, (%esp)
	call	ia32_rdmsr_low
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	andl	$-4096, %eax
	ret
	.cfi_endproc
.LFE287:
	.size	apic_get_base_paddr, .-apic_get_base_paddr
	.p2align 4,,15
	.globl	apic_init
	.type	apic_init, @function
apic_init:
.LFB288:
	.cfi_startproc
	movl	-65488, %ecx
	xorl	%eax, %eax
	movzbl	%cl, %edx
	shrl	$4, %edx
	cmpl	$1, %edx
	je	.L275
.L272:
	rep ret
	.p2align 4,,7
	.p2align 3
.L275:
	andl	$16711680, %ecx
	shrl	$16, %ecx
	addl	$1, %ecx
	cmpl	$2, %ecx
	jbe	.L272
	movl	$11, -64544
	movl	4(%esp), %eax
	leal	(%eax,%eax,4), %eax
	addl	%eax, %eax
	movl	%eax, -64640
	movl	$511, -65296
	movl	8(%esp), %eax
	andl	$1, %eax
	sall	$16, %eax
	orb	$7, %ah
	movl	%eax, -64688
	movl	$1, %eax
	movl	$65536, -64672
	movl	$131135, -64736
	ret
	.cfi_endproc
.LFE288:
	.size	apic_init, .-apic_init
	.text
	.p2align 4,,15
	.globl	apic_is_interrupt_pending
	.type	apic_is_interrupt_pending, @function
apic_is_interrupt_pending:
.LFB289:
	.cfi_startproc
	movl	-65008, %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE289:
	.size	apic_is_interrupt_pending, .-apic_is_interrupt_pending
	.p2align 4,,15
	.globl	apic_ack_active_interrupt
	.type	apic_ack_active_interrupt, @function
apic_ack_active_interrupt:
.LFB290:
	.cfi_startproc
	movl	$0, -65360
	ret
	.cfi_endproc
.LFE290:
	.size	apic_ack_active_interrupt, .-apic_ack_active_interrupt
	.section	.boot.text
	.p2align 4,,15
	.globl	apic_send_init_ipi
	.type	apic_send_init_ipi, @function
apic_send_init_ipi:
.LFB291:
	.cfi_startproc
	movl	4(%esp), %eax
	sall	$24, %eax
	movl	%eax, -64752
	movl	$50432, -64768
	movl	%eax, -64752
	movl	$34048, -64768
	ret
	.cfi_endproc
.LFE291:
	.size	apic_send_init_ipi, .-apic_send_init_ipi
	.p2align 4,,15
	.globl	apic_send_startup_ipi
	.type	apic_send_startup_ipi, @function
apic_send_startup_ipi:
.LFB292:
	.cfi_startproc
	movl	8(%esp), %eax
	movl	4(%esp), %edx
	shrl	$12, %eax
	movzbl	%al, %eax
	sall	$24, %edx
	orb	$6, %ah
	movl	%edx, -64752
	movl	%eax, -64768
	ret
	.cfi_endproc
.LFE292:
	.size	apic_send_startup_ipi, .-apic_send_startup_ipi
	.p2align 4,,15
	.globl	create_unmapped_it_frame_cap
	.type	create_unmapped_it_frame_cap, @function
create_unmapped_it_frame_cap:
.LFB296:
	.cfi_startproc
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	movl	12(%esp), %ecx
	andl	$-4096, %edx
	shrl	$8, %edx
	orl	$50331649, %edx
	movl	%edx, (%eax)
	xorl	%edx, %edx
	testl	%ecx, %ecx
	setne	%dl
	sall	$31, %edx
	movl	%edx, 4(%eax)
	ret	$4
	.cfi_endproc
.LFE296:
	.size	create_unmapped_it_frame_cap, .-create_unmapped_it_frame_cap
	.p2align 4,,15
	.globl	create_mapped_it_frame_cap
	.type	create_mapped_it_frame_cap, @function
create_mapped_it_frame_cap:
.LFB297:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	xorl	%ecx, %ecx
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
	movl	68(%esp), %esi
	movl	72(%esp), %ebp
	movl	60(%esp), %eax
	movl	64(%esp), %edx
	movl	%esi, %ebx
	movl	48(%esp), %edi
	andl	$1023, %ebx
	sall	$20, %ebx
	testl	%ebp, %ebp
	setne	%cl
	andl	$-4096, %eax
	sall	$31, %ecx
	shrl	$10, %esi
	orl	%ecx, %ebx
	movl	52(%esp), %ecx
	sall	$26, %esi
	shrl	$8, %eax
	orl	$50331649, %esi
	orl	%eax, %esi
	movl	56(%esp), %eax
	shrl	$12, %edx
	movl	%ecx, %ebp
	orl	%edx, %ebx
	andl	$14, %ebp
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$14, %ebp
	movl	%eax, 12(%esp)
	movzbl	%cl, %eax
	cmove	%eax, %edx
	cmpl	$62, %edx
	ja	.L284
	jmp	*.L286(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L286:
	.long	.L298
	.long	.L293
	.long	.L292
	.long	.L293
	.long	.L292
	.long	.L293
	.long	.L292
	.long	.L298
	.long	.L298
	.long	.L293
	.long	.L294
	.long	.L298
	.long	.L295
	.long	.L284
	.long	.L298
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L298
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L296
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L284
	.long	.L298
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L293:
	andl	$16777200, %ecx
	sall	$8, %ecx
.L285:
	movl	%ebx, %edx
	sall	$12, %edx
	movl	%edx, %eax
	andl	$4194303, %edx
	shrl	$22, %eax
	movl	(%ecx,%eax,4), %eax
	movl	%esi, %ecx
	andl	$16777200, %ecx
	sall	$8, %ecx
	addl	$536870912, %ecx
	andl	$-4096, %eax
	orl	$7, %ecx
	shrl	$12, %edx
	movl	%ecx, -536870912(%eax,%edx,4)
	call	invalidatePageStructureCache
	movl	%edi, %eax
	movl	%esi, (%edi)
	movl	%ebx, 4(%edi)
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
	ret	$4
	.p2align 4,,7
	.p2align 3
.L292:
	.cfi_restore_state
	andl	$-16, %ecx
	jmp	.L285
	.p2align 4,,7
	.p2align 3
.L298:
	xorl	%ecx, %ecx
	jmp	.L285
	.p2align 4,,7
	.p2align 3
.L296:
	andl	$16128, %ecx
	shrl	$8, %ecx
	cmpl	$32, %ecx
	je	.L299
	addl	$1, %ecx
	movl	$-1, %eax
	sall	%cl, %eax
.L297:
	movl	12(%esp), %ecx
	andl	%eax, %ecx
	jmp	.L285
	.p2align 4,,7
	.p2align 3
.L295:
	andl	$-1024, %ecx
	jmp	.L285
	.p2align 4,,7
	.p2align 3
.L294:
	andl	$2147483632, %ecx
	addl	%ecx, %ecx
	jmp	.L285
	.p2align 4,,7
	.p2align 3
.L284:
	call	halt
	.p2align 4,,7
	.p2align 3
.L299:
	movl	$-16, %eax
	jmp	.L297
	.cfi_endproc
.LFE297:
	.size	create_mapped_it_frame_cap, .-create_mapped_it_frame_cap
	.p2align 4,,15
	.globl	init_node_cpu
	.type	init_node_cpu, @function
init_node_cpu:
.LFB302:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$63, %eax
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movw	%ax, gdt_idt_ptr
	movl	$ia32KSgdt, %eax
	movw	%ax, gdt_idt_ptr+2
	shrl	$16, %eax
	movl	$gdt_idt_ptr, (%esp)
	movw	%ax, gdt_idt_ptr+4
	call	ia32_install_gdt
	movl	$ia32KSidt, %eax
	movl	$2047, %edx
	movw	%ax, gdt_idt_ptr+2
	shrl	$16, %eax
	movl	$gdt_idt_ptr, (%esp)
	movw	%dx, gdt_idt_ptr
	movw	%ax, gdt_idt_ptr+4
	call	ia32_install_idt
	movl	$0, (%esp)
	call	ia32_install_ldt
	movl	$40, (%esp)
	call	ia32_install_tss
	movl	$8, 8(%esp)
	movl	$0, 4(%esp)
	movl	$372, (%esp)
	call	ia32_wrmsr
	movl	$handle_syscall, 8(%esp)
	movl	$0, 4(%esp)
	movl	$374, (%esp)
	call	ia32_wrmsr
	movl	$ia32KStss+4, 8(%esp)
	movl	$0, 4(%esp)
	movl	$373, (%esp)
	call	ia32_wrmsr
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	ia32_cpuid_edx
	xorl	%edx, %edx
	testl	$65536, %eax
	je	.L302
	movl	$631, (%esp)
	call	ia32_rdmsr_low
	movl	$631, (%esp)
	movl	%eax, %ebx
	call	ia32_rdmsr_high
	movl	$631, (%esp)
	movl	%eax, %edx
	movl	%ebx, %eax
	andl	$-117901064, %eax
	andl	$-8, %edx
	orl	$1, %edx
	orl	$459782, %eax
	movl	%edx, 4(%esp)
	movl	%eax, 8(%esp)
	call	ia32_wrmsr
	call	read_cr4
	orb	$2, %ah
	movl	%eax, (%esp)
	call	write_cr4
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
#NO_APP
	andl	$-47, %eax
	orl	$42, %eax
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	apic_init
	xorl	%edx, %edx
	testl	%eax, %eax
	setne	%dl
.L302:
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	movl	%edx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE302:
	.size	init_node_cpu, .-init_node_cpu
	.p2align 4,,15
	.globl	insert_dev_p_reg
	.type	insert_dev_p_reg, @function
insert_dev_p_reg:
.LFB304:
	.cfi_startproc
	movl	glks+828, %ecx
	cmpl	$198, %ecx
	ja	.L306
	movl	4(%esp), %eax
	movl	8(%esp), %edx
	movl	%eax, glks+832(,%ecx,8)
	movl	%edx, glks+836(,%ecx,8)
	addl	$1, %ecx
	movl	%ecx, glks+828
.L306:
	rep ret
	.cfi_endproc
.LFE304:
	.size	insert_dev_p_reg, .-insert_dev_p_reg
	.p2align 4,,15
	.globl	cur_cpu_id
	.type	cur_cpu_id, @function
cur_cpu_id:
.LFB305:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	get_current_esp
	addl	$536870912, %eax
	cmpl	$_boot_stack_top, %eax
	ja	.L309
	cmpl	$_boot_stack_bottom, %eax
	ja	.L312
.L309:
	shrl	$11, %eax
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L312:
	.cfi_restore_state
	movl	glks+28, %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE305:
	.size	cur_cpu_id, .-cur_cpu_id
	.p2align 4,,15
	.globl	node_of_cpu
	.type	node_of_cpu, @function
node_of_cpu:
.LFB306:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	glks+24, %edx
	movl	16(%esp), %ecx
	testl	%edx, %edx
	je	.L314
	xorl	%eax, %eax
	cmpl	%ecx, glks+28
	je	.L326
	.p2align 4,,7
	.p2align 3
.L317:
	addl	$1, %eax
	cmpl	%edx, %eax
	je	.L314
	cmpl	%ecx, glks+28(,%eax,4)
	jne	.L317
.L321:
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.L326:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L321
.L314:
	.p2align 4,,7
	call	halt
	.cfi_endproc
.LFE306:
	.size	node_of_cpu, .-node_of_cpu
	.p2align 4,,15
	.globl	elf32_checkFile
	.type	elf32_checkFile, @function
elf32_checkFile:
.LFB318:
	.cfi_startproc
	movl	4(%esp), %edx
	xorl	%eax, %eax
	cmpl	$1179403647, (%edx)
	je	.L330
	rep ret
	.p2align 4,,7
	.p2align 3
.L330:
	xorl	%eax, %eax
	cmpb	$1, 4(%edx)
	sete	%al
	ret
	.cfi_endproc
.LFE318:
	.size	elf32_checkFile, .-elf32_checkFile
	.p2align 4,,15
	.globl	elf32_getMemoryBounds
	.type	elf32_getMemoryBounds, @function
elf32_getMemoryBounds:
.LFB319:
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
	movl	24(%esp), %edx
	movl	20(%esp), %eax
	movl	28(%edx), %ebx
	movzwl	44(%edx), %ecx
	addl	%edx, %ebx
	testw	%cx, %cx
	je	.L335
	sall	$5, %ecx
	movl	$-1, %edi
	leal	20(%ebx), %edx
	xorl	%esi, %esi
	leal	20(%ebx,%ecx), %ebp
	.p2align 4,,7
	.p2align 3
.L334:
	movl	(%edx), %ecx
	testl	%ecx, %ecx
	je	.L333
	movl	-12(%edx), %ebx
	addl	%ebx, %ecx
	cmpl	%ebx, %edi
	cmova	%ebx, %edi
	cmpl	%ecx, %esi
	cmovb	%ecx, %esi
.L333:
	addl	$32, %edx
	cmpl	%ebp, %edx
	jne	.L334
.L332:
	movl	%edi, (%eax)
	movl	%esi, 4(%eax)
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
.L335:
	.cfi_restore_state
	movl	$-1, %edi
	xorl	%esi, %esi
	jmp	.L332
	.cfi_endproc
.LFE319:
	.size	elf32_getMemoryBounds, .-elf32_getMemoryBounds
	.p2align 4,,15
	.globl	elf32_load
	.type	elf32_load, @function
elf32_load:
.LFB320:
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
	movl	64(%esp), %eax
	movl	$0, 24(%esp)
	movl	28(%eax), %esi
	addl	%eax, %esi
	cmpw	$0, 44(%eax)
	je	.L340
	.p2align 4,,7
	.p2align 3
.L369:
	movl	16(%esi), %edx
	movl	64(%esp), %ecx
	movl	68(%esp), %ebx
	addl	4(%esi), %ecx
	addl	8(%esi), %ebx
	testl	%edx, %edx
	movl	%ecx, 28(%esp)
	movl	%ebx, 20(%esp)
	je	.L350
	leal	4(%ecx), %edi
	cmpl	%edi, %ebx
	leal	4(%ebx), %ebp
	setae	%al
	cmpl	%ebp, %ecx
	movl	%eax, %edi
	setae	%al
	movl	%eax, %ebp
	orl	%ebp, %edi
	cmpl	$9, %edx
	seta	%al
	movl	%eax, %ebp
	movl	%edi, %eax
	movl	%ebp, %ebx
	testb	%bl, %al
	je	.L345
	movl	20(%esp), %ebx
	movl	%ecx, %edi
	orl	%ebx, %edi
	andl	$3, %edi
	jne	.L345
	movl	%edx, %ebp
	xorl	%eax, %eax
	shrl	$2, %ebp
	leal	0(,%ebp,4), %edi
	movl	%edx, 28(%esp)
.L351:
	movl	(%ecx,%eax,4), %edx
	movl	%edx, (%ebx,%eax,4)
	addl	$1, %eax
	cmpl	%eax, %ebp
	ja	.L351
	movl	28(%esp), %edx
	movl	%ebx, %eax
	addl	%edi, %ecx
	addl	%edi, %eax
	movl	%ebx, 20(%esp)
	movl	%edx, %ebp
	subl	%edi, %ebp
	cmpl	%edi, %edx
	je	.L350
	movzbl	(%ecx), %ebx
	cmpl	$1, %ebp
	movb	%bl, (%eax)
	je	.L350
	movzbl	1(%ecx), %ebx
	cmpl	$2, %ebp
	movb	%bl, 1(%eax)
	je	.L350
	movzbl	2(%ecx), %ecx
	movb	%cl, 2(%eax)
.L350:
	movl	20(%esp), %ebx
	movl	20(%esi), %eax
	addl	%edx, %ebx
	subl	%edx, %eax
	movl	%ebx, %ecx
	orl	%eax, %ecx
	movl	%ebx, %edx
	andl	$3, %ecx
	jne	.L380
	testl	%eax, %eax
	je	.L358
	.p2align 4,,7
	.p2align 3
.L370:
	movl	$0, (%edx)
	addl	$4, %edx
	subl	$4, %eax
	jne	.L370
.L358:
	movl	64(%esp), %eax
	addl	$32, %esi
	addl	$1, 24(%esp)
	movzwl	44(%eax), %eax
	cmpl	24(%esp), %eax
	ja	.L369
.L340:
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
.L380:
	.cfi_restore_state
	testl	%eax, %eax
	je	.L358
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	call	memset
	jmp	.L358
	.p2align 4,,7
	.p2align 3
.L345:
	movl	20(%esp), %ebx
	leal	(%ecx,%edx), %edi
	movl	%edx, %ebp
	movl	%ebx, %eax
	subl	%ecx, %eax
	movl	%eax, %ecx
	movl	28(%esp), %eax
	.p2align 4,,7
	.p2align 3
.L353:
	movzbl	(%eax), %edx
	addl	$1, %eax
	movb	%dl, -1(%eax,%ecx)
	cmpl	%edi, %eax
	jne	.L353
	movl	%ebx, 20(%esp)
	movl	%ebp, %edx
	jmp	.L350
	.cfi_endproc
.LFE320:
	.size	elf32_load, .-elf32_load
	.p2align 4,,15
	.type	load_boot_module.isra.140, @function
load_boot_module.isra.140:
.LFB731:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	cmpl	$1179403647, (%edx)
	movl	%eax, 8(%esp)
	movl	%ecx, 12(%esp)
	je	.L382
.L385:
	xorl	%eax, %eax
.L405:
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
	.p2align 4,,7
	.p2align 3
.L382:
	.cfi_restore_state
	cmpb	$1, 4(%edx)
	jne	.L385
	movl	28(%edx), %ebx
	movzwl	44(%edx), %ecx
	addl	%edx, %ebx
	testl	%ecx, %ecx
	je	.L385
	sall	$5, %ecx
	xorl	%esi, %esi
	leal	20(%ebx), %eax
	movl	$-1, %edi
	leal	20(%ebx,%ecx), %ebp
	.p2align 4,,7
	.p2align 3
.L391:
	movl	(%eax), %ecx
	testl	%ecx, %ecx
	je	.L386
	movl	-12(%eax), %ebx
	addl	%ebx, %ecx
	cmpl	%ebx, %edi
	cmova	%ebx, %edi
	cmpl	%ecx, %esi
	cmovb	%ecx, %esi
.L386:
	addl	$32, %eax
	cmpl	%ebp, %eax
	jne	.L391
	testl	%esi, %esi
	je	.L385
	testl	$4095, %edi
	jne	.L385
	subl	$1, %esi
	andl	$-4096, %esi
	leal	12288(%esi), %ecx
	cmpl	$-536870912, %ecx
	leal	4096(%esi), %eax
	ja	.L385
	movl	24(%edx), %ecx
	cmpl	%edi, %ecx
	jb	.L385
	cmpl	%ecx, %eax
	jbe	.L385
	movl	12(%esp), %ebp
	movl	8(%esp), %esi
	movl	%ebp, %ebx
	addl	$11, %esi
	subl	%edi, %ebx
	movl	%esi, %edi
	sall	$4, %edi
	movl	%ebx, glks+20(%edi)
	addl	%eax, %ebx
	cmpl	glks+4, %ebx
	movl	%ebp, glks+12(%edi)
	movl	%ebx, glks+16(%edi)
	movl	%ecx, glks+24(%edi)
	ja	.L385
	movl	%ebx, %eax
	movl	%ebp, %ecx
	subl	%ebp, %eax
	je	.L389
	.p2align 4,,7
	.p2align 3
.L400:
	movl	$0, (%ecx)
	addl	$4, %ecx
	subl	$4, %eax
	jne	.L400
.L389:
	sall	$4, %esi
	movl	glks+20(%esi), %eax
	movl	%edx, (%esp)
	movl	%eax, 4(%esp)
	call	elf32_load
	movl	%ebx, %eax
	jmp	.L405
	.cfi_endproc
.LFE731:
	.size	load_boot_module.isra.140, .-load_boot_module.isra.140
	.p2align 4,,15
	.globl	Arch_configureIdleThread
	.type	Arch_configureIdleThread, @function
Arch_configureIdleThread:
.LFB322:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	$514, 64(%eax)
	movl	$idle_thread, 56(%eax)
	movl	$8, 60(%eax)
	movl	$16, 28(%eax)
	movl	$16, 32(%eax)
	movl	$16, 36(%eax)
	movl	$16, 40(%eax)
	movl	$16, 72(%eax)
	ret
	.cfi_endproc
.LFE322:
	.size	Arch_configureIdleThread, .-Arch_configureIdleThread
	.text
	.p2align 4,,15
	.globl	Arch_switchToIdleThread
	.type	Arch_switchToIdleThread, @function
Arch_switchToIdleThread:
.LFB323:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE323:
	.size	Arch_switchToIdleThread, .-Arch_switchToIdleThread
	.p2align 4,,15
	.globl	Arch_activateIdleThread
	.type	Arch_activateIdleThread, @function
Arch_activateIdleThread:
.LFB324:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE324:
	.size	Arch_activateIdleThread, .-Arch_activateIdleThread
	.section	.phys.text,"ax",@progbits
	.p2align 4,,15
	.globl	init_boot_pd
	.type	init_boot_pd, @function
init_boot_pd:
.LFB326:
	.cfi_startproc
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L413:
	movl	%eax, %edx
	sall	$22, %edx
	orl	$387, %edx
	movl	%edx, _boot_pd(,%eax,4)
	addl	$1, %eax
	cmpl	$896, %eax
	jne	.L413
	xorw	%ax, %ax
	.p2align 4,,7
	.p2align 3
.L415:
	movl	%eax, %edx
	sall	$22, %edx
	orl	$387, %edx
	movl	%edx, _boot_pd+3584(,%eax,4)
	addl	$1, %eax
	cmpl	$128, %eax
	jne	.L415
	rep ret
	.cfi_endproc
.LFE326:
	.size	init_boot_pd, .-init_boot_pd
	.section	.boot.text
	.p2align 4,,15
	.globl	map_kernel_window
	.type	map_kernel_window, @function
map_kernel_window:
.LFB331:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %eax
	movl	56(%esp), %edi
	movl	52(%esp), %esi
	movl	60(%esp), %ebp
	leal	3584(%eax), %ecx
	xorl	%eax, %eax
	movl	%edi, %ebx
	.p2align 4,,7
	.p2align 3
.L418:
	movl	%eax, %edx
	addl	$4194304, %eax
	andl	$-4194304, %edx
	addl	$4, %ecx
	orl	$387, %edx
	movl	%edx, -4(%ecx)
	cmpl	$532676608, %eax
	jne	.L418
	movl	48(%esp), %ecx
	subl	%edi, %ebp
	leal	536870912(%esi), %eax
	andl	$-4096, %eax
	shrl	$12, %ebp
	orl	$7, %eax
	testl	%ebp, %ebp
	movl	%eax, 4092(%ecx)
	leal	4(%esi), %eax
	movl	$0, (%esi)
	leal	4(%esi,%ebp,4), %ecx
	je	.L432
	.p2align 4,,7
	.p2align 3
.L422:
	movl	%ebx, %edx
	addl	$4, %eax
	andl	$-4096, %edx
	addl	$4096, %ebx
	orl	$259, %edx
	movl	%edx, -4(%eax)
	cmpl	%ecx, %eax
	jne	.L422
	leal	1(%ebp), %ebx
	cmpl	$1007, %ebx
	ja	.L424
	.p2align 4,,7
	.p2align 3
.L420:
	movl	$0, (%esi,%ebx,4)
	addl	$1, %ebx
	cmpl	$1007, %ebx
	jbe	.L420
.L424:
	movl	$27, (%esp)
	call	ia32_rdmsr_low
	movl	%eax, %edx
	xorl	%eax, %eax
	andl	$-4096, %edx
	je	.L425
	leal	1(%ebx), %eax
	orl	$283, %edx
	cmpl	$1023, %eax
	leal	0(,%ebx,4), %ecx
	movl	%edx, (%esi,%ebx,4)
	ja	.L427
	negl	%ebx
	leal	4092(,%ebx,4), %edx
	leal	4(%esi,%ecx), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	memset
.L427:
	call	invalidatePageStructureCache
	movl	$1, %eax
.L425:
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
.L432:
	.cfi_restore_state
	movl	$1, %ebx
	jmp	.L420
	.cfi_endproc
.LFE331:
	.size	map_kernel_window, .-map_kernel_window
	.p2align 4,,15
	.globl	map_temp_boot_page
	.type	map_temp_boot_page, @function
map_temp_boot_page:
.LFB332:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	$896, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$-536870912, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	xorl	%ebx, %ebx
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	52(%esp), %eax
	movl	48(%esp), %ebp
	subl	52(%esp), %edi
	sall	$22, %eax
	subl	%eax, %esi
	movl	52(%esp), %eax
	andl	$-4194304, %ebp
	testl	%eax, %eax
	je	.L435
	.p2align 4,,7
	.p2align 3
.L437:
	movl	%ebx, %edx
	sall	$22, %edx
	leal	(%edx,%ebp), %eax
	addl	%esi, %edx
	leal	(%ebx,%edi), %ecx
	orl	$387, %eax
	movl	%edx, (%esp)
	addl	$1, %ebx
	movl	%eax, _boot_pd(,%ecx,4)
	call	invalidateTLBentry
	cmpl	52(%esp), %ebx
	jne	.L437
.L435:
	call	invalidatePageStructureCache
	movl	48(%esp), %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	andl	$4194303, %eax
	addl	%esi, %eax
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
.LFE332:
	.size	map_temp_boot_page, .-map_temp_boot_page
	.p2align 4,,15
	.globl	init_vm_state
	.type	init_vm_state, @function
init_vm_state:
.LFB333:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	getCacheLineSize
	testl	%eax, %eax
	je	.L442
	xorl	%edx, %edx
	testb	$1, %al
	jne	.L443
	.p2align 4,,7
	.p2align 3
.L444:
	shrl	%eax
	addl	$1, %edx
	testb	$1, %al
	je	.L444
.L443:
	cmpl	$1, %eax
	je	.L454
.L442:
	movl	$0, ia32KScacheLineSizeBits
.L453:
	xorl	%eax, %eax
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L454:
	.cfi_restore_state
	testl	%edx, %edx
	movl	%edx, ia32KScacheLineSizeBits
	je	.L453
	movl	16(%esp), %eax
	movl	$ia32KStss, %edx
	movl	$0, ia32KStss
	movl	$0, ia32KStss+4
	movl	$0, ia32KStss+12
	movl	%eax, ia32KSkernelPD
	movl	20(%esp), %eax
	movl	$0, ia32KStss+16
	movl	$0, ia32KStss+20
	movl	$0, ia32KStss+24
	movl	%eax, ia32KSkernelPT
	movl	%edx, %eax
	sall	$16, %eax
	orl	$103, %eax
	movl	$0, ia32KStss+28
	movl	$0, ia32KStss+32
	movl	$0, ia32KStss+36
	movl	$0, ia32KStss+40
	movl	$0, ia32KStss+44
	movl	$0, ia32KStss+48
	movl	$0, ia32KStss+52
	movl	$0, ia32KStss+56
	movl	$0, ia32KStss+60
	movl	$0, ia32KStss+64
	movl	$0, ia32KStss+68
	movl	$0, ia32KStss+72
	movl	$0, ia32KStss+76
	movl	$0, ia32KStss+80
	movl	$0, ia32KStss+84
	movl	$0, ia32KStss+88
	movl	$0, ia32KStss+92
	movl	$0, ia32KStss+96
	movl	$0, ia32KStss+100
	movl	$16, ia32KStss+8
	movl	$0, ia32KSgdt
	movl	$0, ia32KSgdt+4
	movl	$65535, ia32KSgdt+8
	movl	$13605632, ia32KSgdt+12
	movl	%eax, ia32KSgdt+40
	movl	%edx, %eax
	shrl	$16, %edx
	andl	$-16777216, %eax
	movzbl	%dl, %edx
	orl	%edx, %eax
	orb	$137, %ah
	movl	%eax, ia32KSgdt+44
	movl	$int_00, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+4
	movl	$int_01, %eax
	movl	%edx, ia32KSidt
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+12
	movl	$int_02, %eax
	movl	%edx, ia32KSidt+8
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+20
	movl	$int_03, %eax
	movl	%edx, ia32KSidt+16
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+28
	movl	$int_04, %eax
	movl	%edx, ia32KSidt+24
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+36
	movl	$int_05, %eax
	movl	%edx, ia32KSidt+32
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+44
	movl	$int_06, %eax
	movl	%edx, ia32KSidt+40
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+52
	movl	$int_07, %eax
	movl	%edx, ia32KSidt+48
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+60
	movl	$int_08, %eax
	movl	%edx, ia32KSidt+56
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+68
	movl	$int_09, %eax
	movl	%edx, ia32KSidt+64
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	movl	%eax, ia32KSidt+76
	movl	$int_0a, %eax
	movl	%edx, ia32KSidt+72
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$142, %ah
	movl	%edx, ia32KSidt+80
	movl	$65535, ia32KSgdt+16
	movl	$13603584, ia32KSgdt+20
	movl	$65535, ia32KSgdt+24
	movl	$13630208, ia32KSgdt+28
	movl	$65535, ia32KSgdt+32
	movl	$13628160, ia32KSgdt+36
	movl	$65535, ia32KSgdt+48
	movl	$13628160, ia32KSgdt+52
	movl	$65535, ia32KSgdt+56
	movl	$13628160, ia32KSgdt+60
	movl	%eax, ia32KSidt+84
	movl	$int_0b, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+92
	movl	$int_0c, %eax
	movl	%edx, ia32KSidt+88
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+100
	movl	$int_0d, %eax
	movl	%edx, ia32KSidt+96
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+108
	movl	$int_0e, %eax
	movl	%edx, ia32KSidt+104
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+116
	movl	$int_0f, %eax
	movl	%edx, ia32KSidt+112
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+124
	movl	$int_10, %eax
	movl	%edx, ia32KSidt+120
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+132
	movl	$int_11, %eax
	movl	%edx, ia32KSidt+128
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+140
	movl	$int_12, %eax
	movl	%edx, ia32KSidt+136
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+148
	movl	$int_13, %eax
	movl	%edx, ia32KSidt+144
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+156
	movl	$int_14, %eax
	movl	%edx, ia32KSidt+152
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	movl	%eax, ia32KSidt+164
	movl	$int_15, %eax
	movl	%edx, ia32KSidt+160
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+172
	movl	$int_16, %eax
	movl	%edx, ia32KSidt+168
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+180
	movl	$int_17, %eax
	movl	%edx, ia32KSidt+176
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+188
	movl	$int_18, %eax
	movl	%edx, ia32KSidt+184
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+196
	movl	$int_19, %eax
	movl	%edx, ia32KSidt+192
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+204
	movl	$int_1a, %eax
	movl	%edx, ia32KSidt+200
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+212
	movl	$int_1b, %eax
	movl	%edx, ia32KSidt+208
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$142, %ah
	movl	%edx, ia32KSidt+216
	movl	%eax, ia32KSidt+220
	movl	$int_1c, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+228
	movl	$int_1d, %eax
	movl	%edx, ia32KSidt+224
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+236
	movl	$int_1e, %eax
	movl	%edx, ia32KSidt+232
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+244
	movl	$int_1f, %eax
	movl	%edx, ia32KSidt+240
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	movl	%eax, ia32KSidt+252
	movl	$int_20, %eax
	movl	%edx, ia32KSidt+248
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+260
	movl	$int_21, %eax
	movl	%edx, ia32KSidt+256
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+268
	movl	$int_22, %eax
	movl	%edx, ia32KSidt+264
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+276
	movl	$int_23, %eax
	movl	%edx, ia32KSidt+272
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+284
	movl	$int_24, %eax
	movl	%edx, ia32KSidt+280
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+292
	movl	$int_25, %eax
	movl	%edx, ia32KSidt+288
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+300
	movl	$int_26, %eax
	movl	%edx, ia32KSidt+296
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+308
	movl	$int_27, %eax
	movl	%edx, ia32KSidt+304
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+316
	movl	$int_28, %eax
	movl	%edx, ia32KSidt+312
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+324
	movl	$int_29, %eax
	movl	%edx, ia32KSidt+320
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+332
	movl	$int_2a, %eax
	movl	%edx, ia32KSidt+328
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	movl	%eax, ia32KSidt+340
	movl	$int_2b, %eax
	movl	%edx, ia32KSidt+336
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+348
	movl	$int_2c, %eax
	movl	%edx, ia32KSidt+344
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$142, %ah
	movl	%edx, ia32KSidt+352
	movl	%eax, ia32KSidt+356
	movl	$int_2d, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+364
	movl	$int_2e, %eax
	movl	%edx, ia32KSidt+360
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+372
	movl	$int_2f, %eax
	movl	%edx, ia32KSidt+368
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+380
	movl	$int_30, %eax
	movl	%edx, ia32KSidt+376
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+388
	movl	$int_31, %eax
	movl	%edx, ia32KSidt+384
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+396
	movl	$int_32, %eax
	movl	%edx, ia32KSidt+392
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+404
	movl	$int_33, %eax
	movl	%edx, ia32KSidt+400
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+412
	movl	$int_34, %eax
	movl	%edx, ia32KSidt+408
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+420
	movl	$int_35, %eax
	movl	%edx, ia32KSidt+416
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	movl	%eax, ia32KSidt+428
	movl	$int_36, %eax
	movl	%edx, ia32KSidt+424
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+436
	movl	$int_37, %eax
	movl	%edx, ia32KSidt+432
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+444
	movl	$int_38, %eax
	movl	%edx, ia32KSidt+440
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+452
	movl	$int_39, %eax
	movl	%edx, ia32KSidt+448
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+460
	movl	$int_3a, %eax
	movl	%edx, ia32KSidt+456
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+468
	movl	$int_3b, %eax
	movl	%edx, ia32KSidt+464
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+476
	movl	$int_3c, %eax
	movl	%edx, ia32KSidt+472
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+484
	movl	$int_3d, %eax
	movl	%edx, ia32KSidt+480
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$142, %ah
	movl	%edx, ia32KSidt+488
	movl	%eax, ia32KSidt+492
	movl	$int_3e, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+500
	movl	$int_3f, %eax
	movl	%edx, ia32KSidt+496
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+508
	movl	$int_40, %eax
	movl	%edx, ia32KSidt+504
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+516
	movl	$int_41, %eax
	movl	%edx, ia32KSidt+512
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+524
	movl	$int_42, %eax
	movl	%edx, ia32KSidt+520
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+532
	movl	$int_43, %eax
	movl	%edx, ia32KSidt+528
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+540
	movl	$int_44, %eax
	movl	%edx, ia32KSidt+536
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+548
	movl	$int_45, %eax
	movl	%edx, ia32KSidt+544
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+556
	movl	$int_46, %eax
	movl	%edx, ia32KSidt+552
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+564
	movl	$int_47, %eax
	movl	%edx, ia32KSidt+560
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+572
	movl	$int_48, %eax
	movl	%edx, ia32KSidt+568
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+580
	movl	$int_49, %eax
	movl	%edx, ia32KSidt+576
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+588
	movl	$int_4a, %eax
	movl	%edx, ia32KSidt+584
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+596
	movl	$int_4b, %eax
	movl	%edx, ia32KSidt+592
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+604
	movl	$int_4c, %eax
	movl	%edx, ia32KSidt+600
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+612
	movl	$int_4d, %eax
	movl	%edx, ia32KSidt+608
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+620
	movl	$int_4e, %eax
	movl	%edx, ia32KSidt+616
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$238, %ah
	movl	%edx, ia32KSidt+624
	movl	%eax, ia32KSidt+628
	movl	$int_4f, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+636
	movl	$int_50, %eax
	movl	%edx, ia32KSidt+632
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+644
	movl	$int_51, %eax
	movl	%edx, ia32KSidt+640
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+652
	movl	$int_52, %eax
	movl	%edx, ia32KSidt+648
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+660
	movl	$int_53, %eax
	movl	%edx, ia32KSidt+656
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+668
	movl	$int_54, %eax
	movl	%edx, ia32KSidt+664
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+676
	movl	$int_55, %eax
	movl	%edx, ia32KSidt+672
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+684
	movl	$int_56, %eax
	movl	%edx, ia32KSidt+680
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+692
	movl	$int_57, %eax
	movl	%edx, ia32KSidt+688
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+700
	movl	$int_58, %eax
	movl	%edx, ia32KSidt+696
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+708
	movl	$int_59, %eax
	movl	%edx, ia32KSidt+704
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+716
	movl	$int_5a, %eax
	movl	%edx, ia32KSidt+712
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+724
	movl	$int_5b, %eax
	movl	%edx, ia32KSidt+720
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+732
	movl	$int_5c, %eax
	movl	%edx, ia32KSidt+728
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+740
	movl	$int_5d, %eax
	movl	%edx, ia32KSidt+736
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+748
	movl	$int_5e, %eax
	movl	%edx, ia32KSidt+744
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+756
	movl	$int_5f, %eax
	movl	%edx, ia32KSidt+752
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$238, %ah
	movl	%edx, ia32KSidt+760
	movl	%eax, ia32KSidt+764
	movl	$int_60, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+772
	movl	$int_61, %eax
	movl	%edx, ia32KSidt+768
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+780
	movl	$int_62, %eax
	movl	%edx, ia32KSidt+776
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+788
	movl	$int_63, %eax
	movl	%edx, ia32KSidt+784
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+796
	movl	$int_64, %eax
	movl	%edx, ia32KSidt+792
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+804
	movl	$int_65, %eax
	movl	%edx, ia32KSidt+800
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+812
	movl	$int_66, %eax
	movl	%edx, ia32KSidt+808
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+820
	movl	$int_67, %eax
	movl	%edx, ia32KSidt+816
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+828
	movl	$int_68, %eax
	movl	%edx, ia32KSidt+824
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+836
	movl	$int_69, %eax
	movl	%edx, ia32KSidt+832
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+844
	movl	$int_6a, %eax
	movl	%edx, ia32KSidt+840
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+852
	movl	$int_6b, %eax
	movl	%edx, ia32KSidt+848
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+860
	movl	$int_6c, %eax
	movl	%edx, ia32KSidt+856
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+868
	movl	$int_6d, %eax
	movl	%edx, ia32KSidt+864
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+876
	movl	$int_6e, %eax
	movl	%edx, ia32KSidt+872
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+884
	movl	$int_6f, %eax
	movl	%edx, ia32KSidt+880
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+892
	movl	$int_70, %eax
	movl	%edx, ia32KSidt+888
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$238, %ah
	movl	%edx, ia32KSidt+896
	movl	%eax, ia32KSidt+900
	movl	$int_71, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+908
	movl	$int_72, %eax
	movl	%edx, ia32KSidt+904
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+916
	movl	$int_73, %eax
	movl	%edx, ia32KSidt+912
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+924
	movl	$int_74, %eax
	movl	%edx, ia32KSidt+920
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+932
	movl	$int_75, %eax
	movl	%edx, ia32KSidt+928
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+940
	movl	$int_76, %eax
	movl	%edx, ia32KSidt+936
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+948
	movl	$int_77, %eax
	movl	%edx, ia32KSidt+944
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+956
	movl	$int_78, %eax
	movl	%edx, ia32KSidt+952
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+964
	movl	$int_79, %eax
	movl	%edx, ia32KSidt+960
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+972
	movl	$int_7a, %eax
	movl	%edx, ia32KSidt+968
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+980
	movl	$int_7b, %eax
	movl	%edx, ia32KSidt+976
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+988
	movl	$int_7c, %eax
	movl	%edx, ia32KSidt+984
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+996
	movl	$int_7d, %eax
	movl	%edx, ia32KSidt+992
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1004
	movl	$int_7e, %eax
	movl	%edx, ia32KSidt+1000
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1012
	movl	$int_7f, %eax
	movl	%edx, ia32KSidt+1008
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1020
	movl	$int_80, %eax
	movl	%edx, ia32KSidt+1016
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1028
	movl	$int_81, %eax
	movl	%edx, ia32KSidt+1024
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$238, %ah
	movl	%edx, ia32KSidt+1032
	movl	%eax, ia32KSidt+1036
	movl	$int_82, %eax
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+1044
	movl	$int_83, %eax
	movl	%edx, ia32KSidt+1040
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1052
	movl	$int_84, %eax
	movl	%edx, ia32KSidt+1048
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1060
	movl	$int_85, %eax
	movl	%edx, ia32KSidt+1056
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1068
	movl	$int_86, %eax
	movl	%edx, ia32KSidt+1064
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1076
	movl	$int_87, %eax
	movl	%edx, ia32KSidt+1072
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1084
	movl	$int_88, %eax
	movl	%edx, ia32KSidt+1080
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1092
	movl	$int_89, %eax
	movl	%edx, ia32KSidt+1088
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1100
	movl	$int_8a, %eax
	movl	%edx, ia32KSidt+1096
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1108
	movl	$int_8b, %eax
	movl	%edx, ia32KSidt+1104
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1116
	movl	$int_8c, %eax
	movl	%edx, ia32KSidt+1112
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1124
	movl	$int_8d, %eax
	movl	%edx, ia32KSidt+1120
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+1132
	movl	$int_8e, %eax
	movl	%edx, ia32KSidt+1128
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1140
	movl	$int_8f, %eax
	movl	%edx, ia32KSidt+1136
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1148
	movl	$int_90, %eax
	movl	%edx, ia32KSidt+1144
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1156
	movl	$int_91, %eax
	movl	%edx, ia32KSidt+1152
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1164
	movl	$int_92, %eax
	movl	%edx, ia32KSidt+1160
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$238, %ah
	movl	%edx, ia32KSidt+1168
	movl	%eax, ia32KSidt+1172
	movl	$int_93, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1180
	movl	$int_94, %eax
	movl	%edx, ia32KSidt+1176
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1188
	movl	$int_95, %eax
	movl	%edx, ia32KSidt+1184
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1196
	movl	$int_96, %eax
	movl	%edx, ia32KSidt+1192
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1204
	movl	$int_97, %eax
	movl	%edx, ia32KSidt+1200
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1212
	movl	$int_98, %eax
	movl	%edx, ia32KSidt+1208
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+1220
	movl	$int_99, %eax
	movl	%edx, ia32KSidt+1216
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1228
	movl	$int_9a, %eax
	movl	%edx, ia32KSidt+1224
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1236
	movl	$int_9b, %eax
	movl	%edx, ia32KSidt+1232
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1244
	movl	$int_9c, %eax
	movl	%edx, ia32KSidt+1240
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1252
	movl	$int_9d, %eax
	movl	%edx, ia32KSidt+1248
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1260
	movl	$int_9e, %eax
	movl	%edx, ia32KSidt+1256
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1268
	movl	$int_9f, %eax
	movl	%edx, ia32KSidt+1264
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1276
	movl	$int_a0, %eax
	movl	%edx, ia32KSidt+1272
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1284
	movl	$int_a1, %eax
	movl	%edx, ia32KSidt+1280
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1292
	movl	$int_a2, %eax
	movl	%edx, ia32KSidt+1288
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1300
	movl	$int_a3, %eax
	movl	%edx, ia32KSidt+1296
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%edx, ia32KSidt+1304
	movl	%eax, ia32KSidt+1308
	movl	$int_a4, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1316
	movl	$int_a5, %eax
	movl	%edx, ia32KSidt+1312
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1324
	movl	$int_a6, %eax
	movl	%edx, ia32KSidt+1320
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1332
	movl	$int_a7, %eax
	movl	%edx, ia32KSidt+1328
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1340
	movl	$int_a8, %eax
	movl	%edx, ia32KSidt+1336
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1348
	movl	$int_a9, %eax
	movl	%edx, ia32KSidt+1344
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1356
	movl	$int_aa, %eax
	movl	%edx, ia32KSidt+1352
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1364
	movl	$int_ab, %eax
	movl	%edx, ia32KSidt+1360
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1372
	movl	$int_ac, %eax
	movl	%edx, ia32KSidt+1368
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1380
	movl	$int_ad, %eax
	movl	%edx, ia32KSidt+1376
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1388
	movl	$int_ae, %eax
	movl	%edx, ia32KSidt+1384
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+1396
	movl	$int_af, %eax
	movl	%edx, ia32KSidt+1392
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1404
	movl	$int_b0, %eax
	movl	%edx, ia32KSidt+1400
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1412
	movl	$int_b1, %eax
	movl	%edx, ia32KSidt+1408
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1420
	movl	$int_b2, %eax
	movl	%edx, ia32KSidt+1416
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1428
	movl	$int_b3, %eax
	movl	%edx, ia32KSidt+1424
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1436
	movl	$int_b4, %eax
	movl	%edx, ia32KSidt+1432
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$238, %ah
	movl	%edx, ia32KSidt+1440
	movl	%eax, ia32KSidt+1444
	movl	$int_b5, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1452
	movl	$int_b6, %eax
	movl	%edx, ia32KSidt+1448
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1460
	movl	$int_b7, %eax
	movl	%edx, ia32KSidt+1456
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1468
	movl	$int_b8, %eax
	movl	%edx, ia32KSidt+1464
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1476
	movl	$int_b9, %eax
	movl	%edx, ia32KSidt+1472
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+1484
	movl	$int_ba, %eax
	movl	%edx, ia32KSidt+1480
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1492
	movl	$int_bb, %eax
	movl	%edx, ia32KSidt+1488
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1500
	movl	$int_bc, %eax
	movl	%edx, ia32KSidt+1496
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1508
	movl	$int_bd, %eax
	movl	%edx, ia32KSidt+1504
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1516
	movl	$int_be, %eax
	movl	%edx, ia32KSidt+1512
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1524
	movl	$int_bf, %eax
	movl	%edx, ia32KSidt+1520
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1532
	movl	$int_c0, %eax
	movl	%edx, ia32KSidt+1528
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1540
	movl	$int_c1, %eax
	movl	%edx, ia32KSidt+1536
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1548
	movl	$int_c2, %eax
	movl	%edx, ia32KSidt+1544
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1556
	movl	$int_c3, %eax
	movl	%edx, ia32KSidt+1552
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1564
	movl	$int_c4, %eax
	movl	%edx, ia32KSidt+1560
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+1572
	movl	$int_c5, %eax
	movl	%edx, ia32KSidt+1568
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$238, %ah
	movl	%edx, ia32KSidt+1576
	movl	%eax, ia32KSidt+1580
	movl	$int_c6, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1588
	movl	$int_c7, %eax
	movl	%edx, ia32KSidt+1584
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1596
	movl	$int_c8, %eax
	movl	%edx, ia32KSidt+1592
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1604
	movl	$int_c9, %eax
	movl	%edx, ia32KSidt+1600
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1612
	movl	$int_ca, %eax
	movl	%edx, ia32KSidt+1608
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1620
	movl	$int_cb, %eax
	movl	%edx, ia32KSidt+1616
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1628
	movl	$int_cc, %eax
	movl	%edx, ia32KSidt+1624
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1636
	movl	$int_cd, %eax
	movl	%edx, ia32KSidt+1632
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1644
	movl	$int_ce, %eax
	movl	%edx, ia32KSidt+1640
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1652
	movl	$int_cf, %eax
	movl	%edx, ia32KSidt+1648
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+1660
	movl	$int_d0, %eax
	movl	%edx, ia32KSidt+1656
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1668
	movl	$int_d1, %eax
	movl	%edx, ia32KSidt+1664
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1676
	movl	$int_d2, %eax
	movl	%edx, ia32KSidt+1672
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1684
	movl	$int_d3, %eax
	movl	%edx, ia32KSidt+1680
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1692
	movl	$int_d4, %eax
	movl	%edx, ia32KSidt+1688
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1700
	movl	$int_d5, %eax
	movl	%edx, ia32KSidt+1696
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1708
	movl	$int_d6, %eax
	movl	%edx, ia32KSidt+1704
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$238, %ah
	movl	%edx, ia32KSidt+1712
	movl	%eax, ia32KSidt+1716
	movl	$int_d7, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1724
	movl	$int_d8, %eax
	movl	%edx, ia32KSidt+1720
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1732
	movl	$int_d9, %eax
	movl	%edx, ia32KSidt+1728
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1740
	movl	$int_da, %eax
	movl	%edx, ia32KSidt+1736
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+1748
	movl	$int_db, %eax
	movl	%edx, ia32KSidt+1744
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1756
	movl	$int_dc, %eax
	movl	%edx, ia32KSidt+1752
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1764
	movl	$int_dd, %eax
	movl	%edx, ia32KSidt+1760
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1772
	movl	$int_de, %eax
	movl	%edx, ia32KSidt+1768
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1780
	movl	$int_df, %eax
	movl	%edx, ia32KSidt+1776
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1788
	movl	$int_e0, %eax
	movl	%edx, ia32KSidt+1784
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1796
	movl	$int_e1, %eax
	movl	%edx, ia32KSidt+1792
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1804
	movl	$int_e2, %eax
	movl	%edx, ia32KSidt+1800
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1812
	movl	$int_e3, %eax
	movl	%edx, ia32KSidt+1808
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1820
	movl	$int_e4, %eax
	movl	%edx, ia32KSidt+1816
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1828
	movl	$int_e5, %eax
	movl	%edx, ia32KSidt+1824
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+1836
	movl	$int_e6, %eax
	movl	%edx, ia32KSidt+1832
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1844
	movl	$int_e7, %eax
	movl	%edx, ia32KSidt+1840
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$238, %ah
	movl	%edx, ia32KSidt+1848
	movl	%eax, ia32KSidt+1852
	movl	$int_e8, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1860
	movl	$int_e9, %eax
	movl	%edx, ia32KSidt+1856
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1868
	movl	$int_ea, %eax
	movl	%edx, ia32KSidt+1864
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1876
	movl	$int_eb, %eax
	movl	%edx, ia32KSidt+1872
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1884
	movl	$int_ec, %eax
	movl	%edx, ia32KSidt+1880
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1892
	movl	$int_ed, %eax
	movl	%edx, ia32KSidt+1888
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1900
	movl	$int_ee, %eax
	movl	%edx, ia32KSidt+1896
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1908
	movl	$int_ef, %eax
	movl	%edx, ia32KSidt+1904
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1916
	movl	$int_f0, %eax
	movl	%edx, ia32KSidt+1912
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+1924
	movl	$int_f1, %eax
	movl	%edx, ia32KSidt+1920
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1932
	movl	$int_f2, %eax
	movl	%edx, ia32KSidt+1928
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1940
	movl	$int_f3, %eax
	movl	%edx, ia32KSidt+1936
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1948
	movl	$int_f4, %eax
	movl	%edx, ia32KSidt+1944
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1956
	movl	$int_f5, %eax
	movl	%edx, ia32KSidt+1952
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1964
	movl	$int_f6, %eax
	movl	%edx, ia32KSidt+1960
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1972
	movl	$int_f7, %eax
	movl	%edx, ia32KSidt+1968
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1980
	movl	$int_f8, %eax
	movl	%edx, ia32KSidt+1976
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orl	$524288, %edx
	orb	$238, %ah
	movl	%edx, ia32KSidt+1984
	movl	%eax, ia32KSidt+1988
	movl	$int_f9, %eax
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+1996
	movl	$int_fa, %eax
	movl	%edx, ia32KSidt+1992
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+2004
	movl	$int_fb, %eax
	movl	%edx, ia32KSidt+2000
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%eax, ia32KSidt+2012
	movl	$int_fc, %eax
	movl	%edx, ia32KSidt+2008
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+2020
	movl	$int_fd, %eax
	movl	%edx, ia32KSidt+2016
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+2028
	movl	$int_fe, %eax
	movl	%edx, ia32KSidt+2024
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+2036
	movl	$int_ff, %eax
	movl	%edx, ia32KSidt+2032
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, ia32KSidt+2044
	movl	$1, %eax
	movl	%edx, ia32KSidt+2040
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE333:
	.size	init_vm_state, .-init_vm_state
	.p2align 4,,15
	.globl	init_dtrs
	.type	init_dtrs, @function
init_dtrs:
.LFB334:
	.cfi_startproc
	movl	$63, %eax
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movw	%ax, gdt_idt_ptr
	movl	$ia32KSgdt, %eax
	movw	%ax, gdt_idt_ptr+2
	shrl	$16, %eax
	movl	$gdt_idt_ptr, (%esp)
	movw	%ax, gdt_idt_ptr+4
	call	ia32_install_gdt
	movl	$ia32KSidt, %eax
	movl	$2047, %edx
	movw	%ax, gdt_idt_ptr+2
	shrl	$16, %eax
	movl	$gdt_idt_ptr, (%esp)
	movw	%dx, gdt_idt_ptr
	movw	%ax, gdt_idt_ptr+4
	call	ia32_install_idt
	movl	$0, (%esp)
	call	ia32_install_ldt
	movl	$40, (%esp)
	call	ia32_install_tss
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE334:
	.size	init_dtrs, .-init_dtrs
	.p2align 4,,15
	.globl	map_it_pt_cap
	.type	map_it_pt_cap, @function
map_it_pt_cap:
.LFB335:
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
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ecx
	movl	36(%esp), %edi
	movl	40(%esp), %ebx
	movl	44(%esp), %esi
	movl	%ecx, %ebp
	movl	%ecx, %eax
	andl	$14, %ebp
	andl	$15, %eax
	movzbl	%cl, %edx
	cmpl	$14, %ebp
	cmove	%edx, %eax
	cmpl	$62, %eax
	ja	.L460
	jmp	*.L462(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L462:
	.long	.L474
	.long	.L469
	.long	.L468
	.long	.L469
	.long	.L468
	.long	.L469
	.long	.L468
	.long	.L474
	.long	.L474
	.long	.L469
	.long	.L470
	.long	.L474
	.long	.L471
	.long	.L460
	.long	.L474
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L474
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L472
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L460
	.long	.L474
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L469:
	andl	$16777200, %ecx
	sall	$8, %ecx
.L461:
	movl	%ebx, %eax
	andl	$1023, %esi
	andl	$16777200, %eax
	sall	$8, %eax
	addl	$536870912, %eax
	orl	$7, %eax
	movl	%eax, (%ecx,%esi,4)
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
	jmp	invalidatePageStructureCache
	.p2align 4,,7
	.p2align 3
.L468:
	.cfi_restore_state
	andl	$-16, %ecx
	jmp	.L461
	.p2align 4,,7
	.p2align 3
.L474:
	xorl	%ecx, %ecx
	jmp	.L461
	.p2align 4,,7
	.p2align 3
.L472:
	andl	$16128, %ecx
	shrl	$8, %ecx
	cmpl	$32, %ecx
	je	.L475
	addl	$1, %ecx
	movl	$-1, %eax
	sall	%cl, %eax
.L473:
	andl	%edi, %eax
	movl	%eax, %ecx
	jmp	.L461
	.p2align 4,,7
	.p2align 3
.L471:
	andl	$-1024, %ecx
	jmp	.L461
	.p2align 4,,7
	.p2align 3
.L470:
	andl	$2147483632, %ecx
	addl	%ecx, %ecx
	jmp	.L461
	.p2align 4,,7
	.p2align 3
.L460:
	call	halt
	.p2align 4,,7
	.p2align 3
.L475:
	movl	$-16, %eax
	jmp	.L473
	.cfi_endproc
.LFE335:
	.size	map_it_pt_cap, .-map_it_pt_cap
	.p2align 4,,15
	.globl	map_it_frame_cap
	.type	map_it_frame_cap, @function
map_it_frame_cap:
.LFB336:
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
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ecx
	movl	36(%esp), %edi
	movl	40(%esp), %ebx
	movl	44(%esp), %edx
	movl	%ecx, %ebp
	movl	%ecx, %eax
	andl	$14, %ebp
	andl	$15, %eax
	movzbl	%cl, %esi
	cmpl	$14, %ebp
	cmove	%esi, %eax
	cmpl	$62, %eax
	ja	.L480
	jmp	*.L482(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L482:
	.long	.L494
	.long	.L489
	.long	.L488
	.long	.L489
	.long	.L488
	.long	.L489
	.long	.L488
	.long	.L494
	.long	.L494
	.long	.L489
	.long	.L490
	.long	.L494
	.long	.L491
	.long	.L480
	.long	.L494
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L494
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L492
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L480
	.long	.L494
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L489:
	andl	$16777200, %ecx
	sall	$8, %ecx
.L481:
	sall	$12, %edx
	andl	$16777200, %ebx
	movl	%edx, %eax
	andl	$4194303, %edx
	shrl	$22, %eax
	movl	(%ecx,%eax,4), %eax
	movl	%ebx, %ecx
	sall	$8, %ecx
	addl	$536870912, %ecx
	shrl	$12, %edx
	orl	$7, %ecx
	andl	$-4096, %eax
	movl	%ecx, -536870912(%eax,%edx,4)
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
	jmp	invalidatePageStructureCache
	.p2align 4,,7
	.p2align 3
.L488:
	.cfi_restore_state
	andl	$-16, %ecx
	jmp	.L481
	.p2align 4,,7
	.p2align 3
.L494:
	xorl	%ecx, %ecx
	jmp	.L481
	.p2align 4,,7
	.p2align 3
.L492:
	andl	$16128, %ecx
	shrl	$8, %ecx
	cmpl	$32, %ecx
	je	.L495
	addl	$1, %ecx
	movl	$-1, %eax
	sall	%cl, %eax
.L493:
	andl	%edi, %eax
	movl	%eax, %ecx
	jmp	.L481
	.p2align 4,,7
	.p2align 3
.L491:
	andl	$-1024, %ecx
	jmp	.L481
	.p2align 4,,7
	.p2align 3
.L490:
	andl	$2147483632, %ecx
	addl	%ecx, %ecx
	jmp	.L481
	.p2align 4,,7
	.p2align 3
.L480:
	call	halt
	.p2align 4,,7
	.p2align 3
.L495:
	movl	$-16, %eax
	jmp	.L493
	.cfi_endproc
.LFE336:
	.size	map_it_frame_cap, .-map_it_frame_cap
	.p2align 4,,15
	.globl	write_it_asid_pool
	.type	write_it_asid_pool, @function
write_it_asid_pool:
.LFB337:
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
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ecx
	movl	36(%esp), %ebx
	movl	40(%esp), %edx
	movl	44(%esp), %esi
	movl	%ecx, %ebp
	movl	%ecx, %eax
	andl	$14, %ebp
	andl	$15, %eax
	movzbl	%cl, %edi
	cmpl	$14, %ebp
	cmove	%edi, %eax
	cmpl	$62, %eax
	ja	.L516
	jmp	*.L502(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L502:
	.long	.L530
	.long	.L509
	.long	.L508
	.long	.L509
	.long	.L508
	.long	.L509
	.long	.L508
	.long	.L530
	.long	.L530
	.long	.L509
	.long	.L510
	.long	.L530
	.long	.L511
	.long	.L516
	.long	.L530
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L530
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L512
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L530
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L509:
	movl	%ecx, %ebx
	andl	$16777200, %ebx
	sall	$8, %ebx
.L501:
	movl	%edx, %edi
	movl	%edx, %eax
	andl	$14, %edi
	andl	$15, %eax
	movzbl	%dl, %ecx
	cmpl	$14, %edi
	cmove	%ecx, %eax
	cmpl	$62, %eax
	ja	.L516
	jmp	*.L518(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L518:
	.long	.L532
	.long	.L525
	.long	.L524
	.long	.L525
	.long	.L524
	.long	.L525
	.long	.L524
	.long	.L532
	.long	.L532
	.long	.L525
	.long	.L526
	.long	.L532
	.long	.L527
	.long	.L516
	.long	.L532
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L532
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L528
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L516
	.long	.L532
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L525:
	andl	$16777200, %edx
	sall	$8, %edx
.L517:
	movl	%edx, 4(%ebx)
	movl	%ebx, ia32KSASIDTable
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
.L508:
	.cfi_restore_state
	movl	%ecx, %ebx
	andl	$-16, %ebx
	jmp	.L501
	.p2align 4,,7
	.p2align 3
.L524:
	andl	$-16, %edx
	jmp	.L517
	.p2align 4,,7
	.p2align 3
.L530:
	xorl	%ebx, %ebx
	jmp	.L501
	.p2align 4,,7
	.p2align 3
.L512:
	andl	$16128, %ecx
	shrl	$8, %ecx
	cmpl	$32, %ecx
	je	.L531
	addl	$1, %ecx
	movl	$-1, %eax
	sall	%cl, %eax
	andl	%eax, %ebx
	jmp	.L501
	.p2align 4,,7
	.p2align 3
.L511:
	movl	%ecx, %ebx
	andl	$-1024, %ebx
	jmp	.L501
	.p2align 4,,7
	.p2align 3
.L510:
	andl	$2147483632, %ecx
	leal	(%ecx,%ecx), %ebx
	jmp	.L501
	.p2align 4,,7
	.p2align 3
.L532:
	xorl	%edx, %edx
	jmp	.L517
	.p2align 4,,7
	.p2align 3
.L526:
	andl	$2147483632, %edx
	addl	%edx, %edx
	jmp	.L517
	.p2align 4,,7
	.p2align 3
.L527:
	andl	$-1024, %edx
	jmp	.L517
	.p2align 4,,7
	.p2align 3
.L528:
	andl	$16128, %edx
	shrl	$8, %edx
	cmpl	$32, %edx
	je	.L533
	leal	1(%edx), %ecx
	movl	$-1, %edx
	sall	%cl, %edx
	andl	%esi, %edx
	jmp	.L517
	.p2align 4,,7
	.p2align 3
.L516:
	call	halt
	.p2align 4,,7
	.p2align 3
.L531:
	movl	$-16, %eax
	andl	%eax, %ebx
	jmp	.L501
	.p2align 4,,7
	.p2align 3
.L533:
	movl	$-16, %edx
	andl	%esi, %edx
	jmp	.L517
	.cfi_endproc
.LFE337:
	.size	write_it_asid_pool, .-write_it_asid_pool
	.p2align 4,,15
	.globl	init_pat_msr
	.type	init_pat_msr, @function
init_pat_msr:
.LFB338:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	ia32_cpuid_edx
	xorl	%edx, %edx
	testl	$65536, %eax
	je	.L536
	movl	$631, (%esp)
	call	ia32_rdmsr_low
	movl	$631, (%esp)
	movl	%eax, %ebx
	call	ia32_rdmsr_high
	movl	$631, (%esp)
	movl	%eax, %edx
	movl	%ebx, %eax
	andl	$-117901064, %eax
	andl	$-8, %edx
	orl	$1, %edx
	orl	$459782, %eax
	movl	%edx, 4(%esp)
	movl	%eax, 8(%esp)
	call	ia32_wrmsr
	movl	$1, %edx
.L536:
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	movl	%edx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE338:
	.size	init_pat_msr, .-init_pat_msr
	.text
	.p2align 4,,15
	.globl	lookupIPCBuffer
	.type	lookupIPCBuffer, @function
lookupIPCBuffer:
.LFB343:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	20(%esp), %eax
	movl	636(%eax), %ebx
	andl	$-1024, %eax
	movl	64(%eax), %edx
	movl	68(%eax), %edi
	movl	%edx, %esi
	movl	%edx, %eax
	andl	$14, %esi
	andl	$15, %eax
	movzbl	%dl, %ecx
	cmpl	$14, %esi
	cmove	%ecx, %eax
	cmpl	$1, %eax
	jne	.L549
	movl	%edx, %eax
	andl	$50331648, %eax
	shrl	$24, %eax
	cmpl	$3, %eax
	je	.L544
	cmpl	$2, %eax
	jne	.L549
	movl	16(%esp), %eax
	testl	%eax, %eax
	jne	.L549
.L544:
	movl	%edi, %eax
	shrl	$31, %eax
	testl	%eax, %eax
	je	.L546
	cmpl	$1, %eax
	je	.L550
	call	halt
	.p2align 4,,7
	.p2align 3
.L546:
	movl	$4095, %eax
.L547:
	andl	$16777200, %edx
	andl	%eax, %ebx
	sall	$8, %edx
	leal	(%ebx,%edx), %eax
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
.L549:
	.cfi_restore_state
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L550:
	.cfi_restore_state
	movl	$4194303, %eax
	jmp	.L547
	.cfi_endproc
.LFE343:
	.size	lookupIPCBuffer, .-lookupIPCBuffer
	.p2align 4,,15
	.globl	handleFaultReply
	.type	handleFaultReply, @function
handleFaultReply:
.LFB258:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	52(%esp), %ebx
	movl	48(%esp), %edi
	movl	16(%ebx), %eax
	movl	%eax, %esi
	andl	$127, %esi
	cmpl	$120, %esi
	jbe	.L562
	andl	$-128, %eax
	movl	$120, %esi
	orl	$120, %eax
.L562:
	shrl	$12, %eax
	movl	%eax, 8(%esp)
	movl	604(%edi), %eax
	andl	$7, %eax
	cmpl	$3, %eax
	je	.L564
	ja	.L565
	cmpl	$1, %eax
	jb	.L563
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$1, %eax
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
.L565:
	.cfi_restore_state
	cmpl	$4, %eax
	jne	.L563
	movl	%ebx, 4(%esp)
	movl	$0, (%esp)
	call	lookupIPCBuffer
	xorl	%ecx, %ecx
	testl	%esi, %esi
	je	.L575
	movl	20(%ebx), %edx
	cmpl	$1, %esi
	movb	$1, %cl
	movl	%edx, 44(%edi)
	jbe	.L575
	movl	24(%ebx), %edx
	movb	$2, %cl
	movl	%edx, 68(%edi)
.L575:
	testl	%eax, %eax
	je	.L578
	cmpl	%esi, %ecx
	jae	.L578
	movl	exceptionMessage(,%ecx,4), %ebx
	leal	1(%ecx), %edx
	movl	(%eax,%edx,4), %ebp
	cmpl	$16, %ebx
	movl	%ebp, 12(%esp)
	je	.L579
	leal	-9(%ebx), %ebp
	cmpl	$1, %ebp
	ja	.L580
	movl	12(%esp), %ebp
	andl	$-9, %ebp
	cmpl	$51, %ebp
	movl	$0, %ebp
	cmove	12(%esp), %ebp
	movl	%ebp, 12(%esp)
.L580:
	movl	12(%esp), %ebp
	cmpl	%esi, %edx
	movl	%ebp, (%edi,%ebx,4)
	jae	.L578
	cmpl	$2, %edx
	ja	.L578
	movl	exceptionMessage(,%edx,4), %ebx
	addl	$2, %ecx
	movl	(%eax,%ecx,4), %edx
	cmpl	$16, %ebx
	je	.L581
	leal	-9(%ebx), %ebp
	cmpl	$1, %ebp
	ja	.L582
	movl	%edx, %ebp
	andl	$-9, %ebp
	cmpl	$51, %ebp
	movl	$0, %ebp
	cmovne	%ebp, %edx
.L582:
	cmpl	%esi, %ecx
	movl	%edx, (%edi,%ebx,4)
	jae	.L578
	cmpl	$2, %ecx
	ja	.L578
	movl	12(%eax), %eax
	andl	$4055, %eax
	orl	$514, %eax
	movl	%eax, 64(%edi)
.L578:
	movl	8(%esp), %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	sete	%al
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
	.p2align 4,,7
	.p2align 3
.L564:
	.cfi_restore_state
	movl	%ebx, 4(%esp)
	movl	$0, (%esp)
	call	lookupIPCBuffer
	xorl	%edx, %edx
	testl	%esi, %esi
	je	.L568
	movl	20(%ebx), %edx
	cmpl	$1, %esi
	movl	%edx, (%edi)
	movl	$1, %edx
	jbe	.L568
	movl	24(%ebx), %edx
	movl	%edx, 4(%edi)
	movl	$2, %edx
.L568:
	testl	%eax, %eax
	jne	.L570
	jmp	.L571
	.p2align 4,,7
	.p2align 3
.L572:
	leal	-9(%ebx), %ebp
	cmpl	$1, %ebp
	ja	.L573
	movl	%ecx, %ebp
	andl	$-9, %ebp
	cmpl	$51, %ebp
	movl	$0, %ebp
	cmovne	%ebp, %ecx
.L573:
	cmpl	$9, %edx
	movl	%ecx, (%edi,%ebx,4)
	ja	.L571
.L570:
	cmpl	%esi, %edx
	jae	.L571
	movl	syscallMessage(,%edx,4), %ebx
	addl	$1, %edx
	movl	(%eax,%edx,4), %ecx
	cmpl	$16, %ebx
	jne	.L572
	andl	$4055, %ecx
	orl	$514, %ecx
	cmpl	$9, %edx
	movl	%ecx, (%edi,%ebx,4)
	jbe	.L570
	.p2align 4,,7
	.p2align 3
.L571:
	movl	56(%edi), %eax
	movl	8(%esp), %ecx
	movl	%eax, 44(%edi)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	sete	%al
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
	.p2align 4,,7
	.p2align 3
.L563:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L581:
	andl	$4055, %edx
	orl	$514, %edx
	jmp	.L582
	.p2align 4,,7
	.p2align 3
.L579:
	andl	$4055, 12(%esp)
	orl	$514, 12(%esp)
	jmp	.L580
	.cfi_endproc
.LFE258:
	.size	handleFaultReply, .-handleFaultReply
	.p2align 4,,15
	.globl	handleVMFault
	.type	handleVMFault, @function
handleVMFault:
.LFB346:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movl	20(%esp), %ebx
	call	getFaultAddr
	movl	16(%esp), %edx
	testl	%ebx, %ebx
	movl	52(%edx), %edx
	je	.L616
	cmpl	$1, %ebx
	jne	.L621
	sall	$27, %edx
	orl	$524290, %edx
	movl	%eax, current_fault+4
	movl	$1, %eax
	movl	%edx, current_fault
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L621:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L616:
	sall	$27, %edx
	orl	$2, %edx
	movl	%eax, current_fault+4
	movl	$1, %eax
	movl	%edx, current_fault
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE346:
	.size	handleVMFault, .-handleVMFault
	.p2align 4,,15
	.globl	isValidVTableRoot
	.type	isValidVTableRoot, @function
isValidVTableRoot:
.LFB347:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %eax
	movl	12(%esp), %ebx
	movl	%eax, %ecx
	movl	%eax, %edx
	andl	$14, %ecx
	andl	$15, %edx
	movzbl	%al, %eax
	cmpl	$14, %ecx
	cmove	%eax, %edx
	xorl	%eax, %eax
	cmpl	$5, %edx
	je	.L628
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L628:
	.cfi_restore_state
	xorl	%eax, %eax
	andl	$65536, %ebx
	setne	%al
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE347:
	.size	isValidVTableRoot, .-isValidVTableRoot
	.p2align 4,,15
	.globl	checkValidIPCBuffer
	.type	checkValidIPCBuffer, @function
checkValidIPCBuffer:
.LFB348:
	.cfi_startproc
	movl	8(%esp), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$1, %eax
	je	.L632
	movl	$3, current_syscall_error+24
	movl	$3, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L632:
	xorl	%eax, %eax
	testl	$511, 4(%esp)
	je	.L633
	movl	$5, current_syscall_error+24
	movb	$3, %al
.L633:
	rep ret
	.cfi_endproc
.LFE348:
	.size	checkValidIPCBuffer, .-checkValidIPCBuffer
	.p2align 4,,15
	.globl	maskVMRights
	.type	maskVMRights, @function
maskVMRights:
.LFB349:
	.cfi_startproc
	movl	4(%esp), %edx
	cmpl	$2, %edx
	je	.L645
	cmpl	$3, %edx
	movl	$1, %eax
	je	.L646
.L639:
	rep ret
	.p2align 4,,7
	.p2align 3
.L646:
	testb	$2, 8(%esp)
	je	.L639
	movl	8(%esp), %eax
	andl	$1, %eax
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$3, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L645:
	movl	8(%esp), %eax
	andl	$2, %eax
	shrl	%eax
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$2, %eax
	ret
	.cfi_endproc
.LFE349:
	.size	maskVMRights, .-maskVMRights
	.p2align 4,,15
	.globl	setVMRoot
	.type	setVMRoot, @function
setVMRoot:
.LFB352:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	12(%esp), %eax
	andl	$-1024, %eax
	movl	16(%eax), %edx
	movl	20(%eax), %esi
	movl	%edx, %ebx
	movl	%edx, %eax
	andl	$14, %ebx
	andl	$15, %eax
	movzbl	%dl, %ecx
	cmpl	$14, %ebx
	cmove	%ecx, %eax
	cmpl	$5, %eax
	je	.L663
.L654:
	movl	ia32KSkernelPD, %eax
	addl	$536870912, %eax
	movl	%eax, ia32KSCurrentPD
#APP
# 35 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr3
# 0 "" 2
#NO_APP
.L647:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L663:
	.cfi_restore_state
	testl	$65536, %esi
	je	.L654
	movzwl	%si, %eax
	andl	$16777200, %edx
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
	sall	$8, %edx
	testl	%eax, %eax
	je	.L655
	andl	$1023, %esi
	movl	(%eax,%esi,4), %eax
	testl	%eax, %eax
	je	.L655
	cmpl	%eax, %edx
	jne	.L654
	addl	$536870912, %edx
	cmpl	%edx, ia32KSCurrentPD
	je	.L647
	movl	%edx, ia32KSCurrentPD
#APP
# 35 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %edx, %cr3
# 0 "" 2
#NO_APP
	jmp	.L647
	.p2align 4,,7
	.p2align 3
.L655:
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
	jmp	.L654
	.cfi_endproc
.LFE352:
	.size	setVMRoot, .-setVMRoot
	.p2align 4,,15
	.globl	Arch_switchToThread
	.type	Arch_switchToThread, @function
Arch_switchToThread:
.LFB321:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$4, %esp
	.cfi_def_cfa_offset 12
	movl	12(%esp), %ebx
	movl	%ebx, (%esp)
	call	setVMRoot
	movl	48(%ebx), %edx
	movl	ia32KSgdt+52, %eax
	movl	%edx, %ecx
	shrl	$16, %ecx
	andl	$16776960, %eax
	movzbl	%cl, %ecx
	movw	%dx, ia32KSgdt+50
	orl	%ecx, %eax
	andl	$-16777216, %edx
	orl	%edx, %eax
	movl	636(%ebx), %edx
	movl	%eax, ia32KSgdt+52
	movl	ia32KSgdt+60, %eax
	movl	%edx, %ecx
	shrl	$16, %ecx
	andl	$16776960, %eax
	movzbl	%cl, %ecx
	movw	%dx, ia32KSgdt+58
	orl	%ecx, %eax
	andl	$-16777216, %edx
	orl	%edx, %eax
	movl	%eax, ia32KSgdt+60
	addl	$4, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE321:
	.size	Arch_switchToThread, .-Arch_switchToThread
	.p2align 4,,15
	.globl	deleteASIDPool
	.type	deleteASIDPool, @function
deleteASIDPool:
.LFB353:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	8(%esp), %edx
	shrl	$10, %eax
	cmpl	%edx, ia32KSASIDTable(,%eax,4)
	je	.L668
	rep ret
	.p2align 4,,7
	.p2align 3
.L668:
	movl	$0, ia32KSASIDTable(,%eax,4)
	movl	ksCurThread, %eax
	movl	%eax, 4(%esp)
	jmp	setVMRoot
	.cfi_endproc
.LFE353:
	.size	deleteASIDPool, .-deleteASIDPool
	.p2align 4,,15
	.globl	deleteASID
	.type	deleteASID, @function
deleteASID:
.LFB354:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	8(%esp), %ecx
	movl	%edx, %eax
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
	testl	%eax, %eax
	je	.L669
	andl	$1023, %edx
	leal	(%eax,%edx,4), %eax
	cmpl	%ecx, (%eax)
	je	.L674
.L669:
	rep ret
	.p2align 4,,7
	.p2align 3
.L674:
	movl	$0, (%eax)
	movl	ksCurThread, %eax
	movl	%eax, 4(%esp)
	jmp	setVMRoot
	.cfi_endproc
.LFE354:
	.size	deleteASID, .-deleteASID
	.p2align 4,,15
	.globl	unmapPageTable
	.type	unmapPageTable, @function
unmapPageTable:
.LFB355:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %edx
	movl	52(%esp), %edi
	movl	56(%esp), %esi
	movl	%edx, %eax
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
	testl	%eax, %eax
	je	.L678
	andl	$1023, %edx
	movl	(%eax,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L678
	movl	ksCurThread, %edx
	andl	$-1024, %edx
	movl	16(%edx), %eax
	movl	20(%edx), %ecx
	movl	%eax, %ebp
	movl	%eax, %edx
	andl	$14, %ebp
	andl	$15, %edx
	movl	%ecx, 12(%esp)
	cmpl	$14, %ebp
	movzbl	%al, %ecx
	cmove	%ecx, %edx
	cmpl	$5, %edx
	je	.L681
.L682:
	shrl	$22, %edi
	movl	$0, (%ebx,%edi,4)
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
	jmp	invalidatePageStructureCache
	.p2align 4,,7
	.p2align 3
.L678:
	.cfi_restore_state
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
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
	.p2align 4,,7
	.p2align 3
.L681:
	.cfi_restore_state
	testl	$65536, 12(%esp)
	je	.L682
	andl	$16777200, %eax
	sall	$8, %eax
	cmpl	%eax, %ebx
	jne	.L682
	xorl	%ebp, %ebp
	jmp	.L684
	.p2align 4,,7
	.p2align 3
.L683:
	addl	$1, %ebp
	cmpl	$1024, %ebp
	je	.L682
.L684:
	testb	$1, (%esi,%ebp,4)
	je	.L683
	movl	%ebp, %eax
	sall	$12, %eax
	addl	%edi, %eax
	movl	%eax, (%esp)
	call	invalidateTLBentry
	jmp	.L683
	.cfi_endproc
.LFE355:
	.size	unmapPageTable, .-unmapPageTable
	.p2align 4,,15
	.globl	unmapPage
	.type	unmapPage, @function
unmapPage:
.LFB356:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	60(%esp), %eax
	movl	52(%esp), %edx
	movl	48(%esp), %esi
	movl	56(%esp), %ebp
	movl	%eax, 8(%esp)
	movl	%edx, %eax
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
	testl	%eax, %eax
	je	.L702
	andl	$1023, %edx
	movl	(%eax,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L702
	movl	ksCurThread, %edx
	andl	$-1024, %edx
	movl	16(%edx), %eax
	movl	20(%edx), %ecx
	movl	%eax, %edi
	movl	%eax, %edx
	andl	$14, %edi
	andl	$15, %edx
	movl	%ecx, 12(%esp)
	cmpl	$14, %edi
	movzbl	%al, %ecx
	cmove	%ecx, %edx
	cmpl	$5, %edx
	je	.L726
.L705:
	testl	%esi, %esi
	je	.L707
	cmpl	$1, %esi
	jne	.L727
	movl	%ebp, %eax
	shrl	$22, %eax
	leal	(%ebx,%eax,4), %edx
	movl	(%edx), %eax
	testb	$-128, %al
	jne	.L728
.L699:
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
	.p2align 4,,7
	.p2align 3
.L727:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L707:
	movl	%ebp, %eax
	shrl	$22, %eax
	movl	(%ebx,%eax,4), %eax
	testb	$-128, %al
	jne	.L709
	testb	$1, %al
	je	.L709
	movl	%ebp, %edx
	andl	$-4096, %eax
	shrl	$10, %edx
	andl	$4092, %edx
	leal	-536870912(%eax,%edx), %edx
	movl	(%edx), %eax
	testb	$1, %al
	je	.L699
	movl	8(%esp), %ecx
	andl	$-4096, %eax
	addl	$536870912, %ecx
	cmpl	%ecx, %eax
	jne	.L699
	movl	$0, (%edx)
.L711:
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
	jmp	invalidatePageStructureCache
	.p2align 4,,7
	.p2align 3
.L702:
	.cfi_restore_state
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
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
	.p2align 4,,7
	.p2align 3
.L726:
	.cfi_restore_state
	testl	$65536, 12(%esp)
	je	.L705
	andl	$16777200, %eax
	sall	$8, %eax
	cmpl	%eax, %ebx
	jne	.L705
	movl	%ebp, (%esp)
	call	invalidateTLBentry
	jmp	.L705
	.p2align 4,,7
	.p2align 3
.L709:
	movl	$89, current_lookup_fault
	movl	$0, current_lookup_fault+4
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
	.p2align 4,,7
	.p2align 3
.L728:
	.cfi_restore_state
	testb	$1, %al
	je	.L699
	movl	8(%esp), %ecx
	andl	$-4194304, %eax
	addl	$536870912, %ecx
	cmpl	%ecx, %eax
	jne	.L699
	movl	$128, (%edx)
	jmp	.L711
	.cfi_endproc
.LFE356:
	.size	unmapPage, .-unmapPage
	.p2align 4,,15
	.globl	copyGlobalMappings
	.type	copyGlobalMappings, @function
copyGlobalMappings:
.LFB357:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	ia32KSkernelPD, %ecx
	movl	$896, %eax
	movl	8(%esp), %ebx
	.p2align 4,,7
	.p2align 3
.L731:
	movl	(%ecx,%eax,4), %edx
	movl	%edx, (%ebx,%eax,4)
	addl	$1, %eax
	cmpl	$1024, %eax
	jne	.L731
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE357:
	.size	copyGlobalMappings, .-copyGlobalMappings
	.p2align 4,,15
	.globl	Arch_initFpuContext
	.type	Arch_initFpuContext, @function
Arch_initFpuContext:
.LFB365:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	movl	$128, %ecx
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	movl	12(%esp), %eax
	movl	$ia32KSnullFpuState, %esi
	leal	80(%eax), %edi
	rep movsl
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE365:
	.size	Arch_initFpuContext, .-Arch_initFpuContext
	.p2align 4,,15
	.globl	handleUnimplementedDevice
	.type	handleUnimplementedDevice, @function
handleUnimplementedDevice:
.LFB367:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	ksCurThread, %ebx
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
	movl	ia32KSfpuOwner, %eax
	testl	%eax, %eax
	je	.L736
	addl	$80, %eax
	movl	%eax, (%esp)
	call	saveFpuState
.L736:
	testl	%ebx, %ebx
	je	.L737
	leal	80(%ebx), %eax
	movl	%eax, (%esp)
	call	loadFpuState
	xorl	%eax, %eax
	movl	%ebx, ia32KSfpuOwner
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L737:
	.cfi_restore_state
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
#NO_APP
	orl	$8, %eax
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
	movl	%ebx, ia32KSfpuOwner
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE367:
	.size	handleUnimplementedDevice, .-handleUnimplementedDevice
	.p2align 4,,15
	.globl	Arch_fpuThreadDelete
	.type	Arch_fpuThreadDelete, @function
Arch_fpuThreadDelete:
.LFB368:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	ia32KSfpuOwner, %eax
	cmpl	32(%esp), %eax
	je	.L750
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L750:
	.cfi_restore_state
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
	testl	%eax, %eax
	je	.L745
	addl	$80, %eax
	movl	%eax, (%esp)
	call	saveFpuState
.L745:
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
#NO_APP
	orl	$8, %eax
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
	movl	$0, ia32KSfpuOwner
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE368:
	.size	Arch_fpuThreadDelete, .-Arch_fpuThreadDelete
	.section	.boot.text
	.p2align 4,,15
	.globl	Arch_initFpu
	.type	Arch_initFpu, @function
Arch_initFpu:
.LFB369:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	call	read_cr4
	orb	$2, %ah
	movl	%eax, (%esp)
	call	write_cr4
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
#NO_APP
	andl	$-47, %eax
	orl	$42, %eax
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE369:
	.size	Arch_initFpu, .-Arch_initFpu
	.p2align 4,,15
	.globl	init_sysenter_msrs
	.type	init_sysenter_msrs, @function
init_sysenter_msrs:
.LFB370:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	$8, 8(%esp)
	movl	$0, 4(%esp)
	movl	$372, (%esp)
	call	ia32_wrmsr
	movl	$handle_syscall, 8(%esp)
	movl	$0, 4(%esp)
	movl	$374, (%esp)
	call	ia32_wrmsr
	movl	$ia32KStss+4, 8(%esp)
	movl	$0, 4(%esp)
	movl	$373, (%esp)
	call	ia32_wrmsr
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE370:
	.size	init_sysenter_msrs, .-init_sysenter_msrs
	.text
	.p2align 4,,15
	.globl	getRestartPC
	.type	getRestartPC, @function
getRestartPC:
.LFB371:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	44(%eax), %eax
	ret
	.cfi_endproc
.LFE371:
	.size	getRestartPC, .-getRestartPC
	.p2align 4,,15
	.globl	setNextPC
	.type	setNextPC, @function
setNextPC:
.LFB372:
	.cfi_startproc
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	movl	%edx, 56(%eax)
	ret
	.cfi_endproc
.LFE372:
	.size	setNextPC, .-setNextPC
	.section	.boot.text
	.p2align 4,,15
	.globl	getCacheLineSizeBits
	.type	getCacheLineSizeBits, @function
getCacheLineSizeBits:
.LFB373:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	getCacheLineSize
	movl	%eax, %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L758
	xorl	%ecx, %ecx
	testb	$1, %dl
	jne	.L759
	.p2align 4,,7
	.p2align 3
.L760:
	shrl	%edx
	addl	$1, %ecx
	testb	$1, %dl
	je	.L760
.L759:
	xorl	%eax, %eax
	cmpl	$1, %edx
	cmove	%ecx, %eax
.L758:
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE373:
	.size	getCacheLineSizeBits, .-getCacheLineSizeBits
	.text
	.p2align 4,,15
	.globl	flushCacheRange
	.type	flushCacheRange, @function
flushCacheRange:
.LFB374:
	.cfi_startproc
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
	movl	32(%esp), %esi
	movl	36(%esp), %edi
	call	ia32_mfence
	movl	ia32KScacheLineSizeBits, %ecx
	movl	$1, %eax
	movl	%esi, %ebx
	shrl	%cl, %ebx
	sall	%cl, %ebx
	movl	%edi, %ecx
	sall	%cl, %eax
	movl	$1, %edi
	addl	%eax, %esi
	cmpl	%esi, %ebx
	jae	.L768
	.p2align 4,,7
	.p2align 3
.L770:
	movl	%ebx, (%esp)
	call	flushCacheLine
	movl	ia32KScacheLineSizeBits, %ecx
	movl	%edi, %eax
	sall	%cl, %eax
	addl	%eax, %ebx
	cmpl	%esi, %ebx
	jb	.L770
.L768:
	addl	$16, %esp
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
	jmp	ia32_mfence
	.cfi_endproc
.LFE374:
	.size	flushCacheRange, .-flushCacheRange
	.p2align 4,,15
	.globl	Arch_initContext
	.type	Arch_initContext, @function
Arch_initContext:
.LFB375:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	movl	$128, %ecx
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	movl	12(%esp), %edi
	movl	$ia32KSnullFpuState, %esi
	movl	$0, (%edi)
	addl	$80, %edi
	movl	$0, -76(%edi)
	movl	$0, -72(%edi)
	movl	$0, -68(%edi)
	movl	$0, -64(%edi)
	movl	$0, -60(%edi)
	movl	$0, -56(%edi)
	movl	$35, -52(%edi)
	movl	$35, -48(%edi)
	movl	$0, -44(%edi)
	movl	$0, -40(%edi)
	movl	$0, -32(%edi)
	movl	$0, -28(%edi)
	movl	$0, -36(%edi)
	movl	$0, -24(%edi)
	movl	$27, -20(%edi)
	movl	$514, -16(%edi)
	movl	$0, -12(%edi)
	movl	$35, -8(%edi)
	rep movsl
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE375:
	.size	Arch_initContext, .-Arch_initContext
	.p2align 4,,15
	.globl	sanitiseRegister
	.type	sanitiseRegister, @function
sanitiseRegister:
.LFB376:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	8(%esp), %eax
	cmpl	$16, %edx
	je	.L778
	subl	$9, %edx
	cmpl	$1, %edx
	ja	.L776
	movl	%eax, %edx
	andl	$-9, %edx
	cmpl	$51, %edx
	movl	$0, %edx
	cmovne	%edx, %eax
.L776:
	rep ret
	.p2align 4,,7
	.p2align 3
.L778:
	andl	$4055, %eax
	orl	$514, %eax
	ret
	.cfi_endproc
.LFE376:
	.size	sanitiseRegister, .-sanitiseRegister
	.p2align 4,,15
	.globl	Arch_decodeInterruptControl
	.type	Arch_decodeInterruptControl, @function
Arch_decodeInterruptControl:
.LFB377:
	.cfi_startproc
	movl	$3, current_syscall_error+24
	movl	$3, %eax
	ret
	.cfi_endproc
.LFE377:
	.size	Arch_decodeInterruptControl, .-Arch_decodeInterruptControl
	.p2align 4,,15
	.globl	Arch_deriveCap
	.type	Arch_deriveCap, @function
Arch_deriveCap:
.LFB380:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	56(%esp), %edx
	movl	48(%esp), %eax
	movl	60(%esp), %ebx
	movl	%edx, %esi
	movl	%edx, %ecx
	andl	$14, %esi
	andl	$15, %ecx
	movl	%esi, 12(%esp)
	movzbl	%dl, %esi
	cmpl	$14, 12(%esp)
	cmove	%esi, %ecx
	cmpl	$11, %ecx
	ja	.L783
	movl	%edx, %ebp
	movl	%ebx, %edi
	jmp	*.L785(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L785:
	.long	.L783
	.long	.L784
	.long	.L783
	.long	.L786
	.long	.L783
	.long	.L787
	.long	.L783
	.long	.L789
	.long	.L783
	.long	.L789
	.long	.L783
	.long	.L789
	.text
	.p2align 4,,7
	.p2align 3
.L789:
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	movl	%ebx, 8(%eax)
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
	ret	$4
	.p2align 4,,7
	.p2align 3
.L787:
	.cfi_restore_state
	xorl	%edx, %edx
	andl	$65536, %ebx
	jne	.L792
.L796:
	movl	$3, current_syscall_error+24
	xorl	%edi, %edi
	xorl	%ebp, %ebp
	movb	$3, %dl
.L792:
	movl	%edx, (%eax)
	movl	%ebp, 4(%eax)
	movl	%edi, 8(%eax)
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
	ret	$4
	.p2align 4,,7
	.p2align 3
.L784:
	.cfi_restore_state
	andl	$-1072693249, %ebx
	andl	$67108863, %edx
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	movl	%ebx, 8(%eax)
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
	ret	$4
	.p2align 4,,7
	.p2align 3
.L786:
	.cfi_restore_state
	xorl	%edx, %edx
	andl	$67108864, %ebx
	je	.L796
	jmp	.L792
	.p2align 4,,7
	.p2align 3
.L783:
	call	halt
	.cfi_endproc
.LFE380:
	.size	Arch_deriveCap, .-Arch_deriveCap
	.p2align 4,,15
	.globl	Arch_updateCapData
	.type	Arch_updateCapData, @function
Arch_updateCapData:
.LFB381:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	28(%esp), %edx
	movl	16(%esp), %eax
	movl	32(%esp), %edi
	movl	%edx, %esi
	movl	%edx, %ecx
	andl	$14, %esi
	andl	$15, %ecx
	movzbl	%dl, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %ecx
	cmpl	$11, %ecx
	jne	.L811
	movl	24(%esp), %ecx
	movzwl	24(%esp), %edx
	shrl	$16, %ecx
	cmpw	%dx, %cx
	ja	.L804
	cmpw	%dx, %di
	jb	.L804
	shrl	$16, %edi
	cmpw	%di, %cx
	jb	.L804
	sall	$16, %ecx
	orl	%edx, %ecx
	movl	$11, (%eax)
	movl	%ecx, 4(%eax)
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
	.p2align 4,,7
	.p2align 3
.L811:
	.cfi_restore_state
	movl	%edx, (%eax)
	movl	%edi, 4(%eax)
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
	.p2align 4,,7
	.p2align 3
.L804:
	.cfi_restore_state
	movl	$0, (%eax)
	movl	$0, 4(%eax)
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
	.cfi_endproc
.LFE381:
	.size	Arch_updateCapData, .-Arch_updateCapData
	.p2align 4,,15
	.globl	Arch_maskCapRights
	.type	Arch_maskCapRights, @function
Arch_maskCapRights:
.LFB382:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	24(%esp), %edx
	movl	16(%esp), %eax
	movl	28(%esp), %ebx
	movl	%edx, %edi
	movl	%edx, %ecx
	andl	$14, %edi
	andl	$15, %ecx
	movzbl	%dl, %esi
	cmpl	$14, %edi
	cmove	%esi, %ecx
	cmpl	$1, %ecx
	je	.L826
	movl	%edx, (%eax)
	movl	%ebx, 4(%eax)
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
	.p2align 4,,7
	.p2align 3
.L826:
	.cfi_restore_state
	movl	%edx, %ecx
	andl	$50331648, %ecx
	shrl	$24, %ecx
	cmpl	$2, %ecx
	je	.L827
	cmpl	$3, %ecx
	movl	$16777216, %esi
	je	.L828
.L818:
	andl	$-50331649, %edx
	orl	%esi, %edx
	movl	%edx, (%eax)
	movl	%ebx, 4(%eax)
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
	.p2align 4,,7
	.p2align 3
.L828:
	.cfi_restore_state
	testb	$2, 20(%esp)
	je	.L818
	movl	20(%esp), %ecx
	andl	$1, %ecx
	cmpl	$1, %ecx
	sbbl	%esi, %esi
	andl	$-16777216, %esi
	addl	$50331648, %esi
	jmp	.L818
	.p2align 4,,7
	.p2align 3
.L827:
	movl	20(%esp), %ecx
	andl	$2, %ecx
	shrl	%ecx
	cmpl	$1, %ecx
	sbbl	%esi, %esi
	andl	$-16777216, %esi
	addl	$33554432, %esi
	jmp	.L818
	.cfi_endproc
.LFE382:
	.size	Arch_maskCapRights, .-Arch_maskCapRights
	.p2align 4,,15
	.globl	Arch_finaliseCap
	.type	Arch_finaliseCap, @function
Arch_finaliseCap:
.LFB383:
	.cfi_startproc
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
	movl	52(%esp), %ecx
	movl	48(%esp), %eax
	movl	56(%esp), %edi
	movl	%ecx, %esi
	movl	%ecx, %edx
	andl	$14, %esi
	andl	$15, %edx
	movzbl	%cl, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %edx
	cmpl	$11, %edx
	ja	.L832
	jmp	*.L834(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L834:
	.long	.L832
	.long	.L833
	.long	.L832
	.long	.L835
	.long	.L832
	.long	.L836
	.long	.L832
	.long	.L837
	.long	.L832
	.long	.L838
	.long	.L832
	.long	.L837
	.text
	.p2align 4,,7
	.p2align 3
.L836:
	movl	60(%esp), %esi
	testl	%esi, %esi
	je	.L837
	testl	$65536, %edi
	je	.L837
	andl	$16777200, %ecx
	movzwl	%di, %edi
	sall	$8, %ecx
	movl	%ecx, 4(%esp)
	movl	%edi, (%esp)
	movl	%eax, 28(%esp)
	call	deleteASID
	movl	28(%esp), %eax
	.p2align 4,,7
	.p2align 3
.L837:
	movl	$0, (%eax)
	movl	$0, 4(%eax)
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
	ret	$4
	.p2align 4,,7
	.p2align 3
.L838:
	.cfi_restore_state
	movl	60(%esp), %edx
	testl	%edx, %edx
	je	.L837
	movzwl	%di, %edi
	andl	$16777200, %ecx
	shrl	$10, %edi
	sall	$8, %ecx
	cmpl	%ecx, ia32KSASIDTable(,%edi,4)
	jne	.L837
	movl	ksCurThread, %edx
	movl	%eax, 28(%esp)
	movl	$0, ia32KSASIDTable(,%edi,4)
	movl	%edx, (%esp)
	call	setVMRoot
	movl	28(%esp), %eax
	jmp	.L837
	.p2align 4,,7
	.p2align 3
.L833:
	movl	%edi, %ebx
	movl	%ecx, %edx
	andl	$1072693248, %ebx
	shrl	$26, %edx
	shrl	$20, %ebx
	sall	$10, %edx
	addl	%ebx, %edx
	je	.L837
	andl	$16777200, %ecx
	sall	$8, %ecx
	movl	%ecx, 12(%esp)
	movl	%edi, %ecx
	sall	$12, %ecx
	shrl	$31, %edi
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%edi, (%esp)
	movl	%eax, 28(%esp)
	call	unmapPage
	movl	28(%esp), %eax
	jmp	.L837
	.p2align 4,,7
	.p2align 3
.L835:
	movl	60(%esp), %ebx
	testl	%ebx, %ebx
	je	.L837
	testl	$67108864, %edi
	je	.L837
	movl	%edi, %edx
	andl	$16777200, %ecx
	andl	$67107840, %edi
	sall	$8, %ecx
	sall	$22, %edx
	shrl	$10, %edi
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%edi, (%esp)
	movl	%eax, 28(%esp)
	call	unmapPageTable
	movl	28(%esp), %eax
	jmp	.L837
	.p2align 4,,7
	.p2align 3
.L832:
	call	halt
	.cfi_endproc
.LFE383:
	.size	Arch_finaliseCap, .-Arch_finaliseCap
	.p2align 4,,15
	.globl	Arch_recycleCap
	.type	Arch_recycleCap, @function
Arch_recycleCap:
.LFB385:
	.cfi_startproc
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
	movl	16(%ebp), %ebx
	movl	20(%ebp), %esi
	movl	%ebx, %ecx
	movl	%ebx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%bl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$11, %eax
	ja	.L861
	jmp	*.L863(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L863:
	.long	.L861
	.long	.L862
	.long	.L861
	.long	.L864
	.long	.L861
	.long	.L865
	.long	.L861
	.long	.L868
	.long	.L861
	.long	.L867
	.long	.L861
	.long	.L868
	.text
	.p2align 4,,7
	.p2align 3
.L867:
	movzwl	%si, %edx
	shrl	$10, %edx
	movl	ia32KSASIDTable(,%edx,4), %eax
	movl	%eax, %edi
	movl	%eax, -36(%ebp)
	movl	%ebx, %eax
	andl	$16777200, %eax
	sall	$8, %eax
	cmpl	%eax, %edi
	jne	.L868
	movl	ksCurThread, %eax
	movl	$0, ia32KSASIDTable(,%edx,4)
	movl	%edx, -44(%ebp)
	movl	%eax, (%esp)
	call	setVMRoot
	movl	-36(%ebp), %eax
	movl	$4096, -40(%ebp)
	movl	-44(%ebp), %edx
	testb	$1, %al
	movl	%eax, %edi
	jne	.L908
.L881:
	testl	$2, %edi
	jne	.L909
.L882:
	movl	-40(%ebp), %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	rep stosl
	testb	$2, -40(%ebp)
	je	.L883
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
.L883:
	testb	$1, -40(%ebp)
	je	.L884
	movb	$0, (%edi)
.L884:
	movl	-36(%ebp), %eax
	movl	%eax, ia32KSASIDTable(,%edx,4)
	.p2align 4,,7
	.p2align 3
.L868:
	movl	8(%ebp), %eax
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
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
	.p2align 4,,7
	.p2align 3
.L862:
	.cfi_restore_state
	movl	%esi, %edx
	movl	%ebx, %eax
	call	cap_get_capSizeBits
	movl	%esi, %edx
	movl	%eax, %edi
	movl	%ebx, %eax
	call	cap_get_capPtr
	movl	$1, %edx
	movl	%edi, %ecx
	sall	%cl, %edx
	testl	%edx, %edx
	je	.L871
	.p2align 4,,7
	.p2align 3
.L897:
	movl	$0, (%eax)
	addl	$4, %eax
	subl	$4, %edx
	jne	.L897
.L871:
	movl	12(%ebp), %edi
	leal	-32(%ebp), %eax
	movl	%ebx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, (%esp)
	movl	%edi, 12(%esp)
	call	Arch_finaliseCap
	subl	$4, %esp
	jmp	.L879
	.p2align 4,,7
	.p2align 3
.L864:
	movl	%esi, %edx
	movl	%ebx, %eax
	call	cap_get_capSizeBits
	movl	%esi, %edx
	movl	%eax, %edi
	movl	%ebx, %eax
	call	cap_get_capPtr
	movl	$1, %edx
	movl	%edi, %ecx
	sall	%cl, %edx
	testl	%edx, %edx
	je	.L876
	.p2align 4,,7
	.p2align 3
.L898:
	movl	$0, (%eax)
	addl	$4, %eax
	subl	$4, %edx
	jne	.L898
.L876:
	testl	$67108864, %esi
	je	.L875
	movl	%ebx, %eax
	andl	$16777200, %eax
	sall	$8, %eax
	movl	%eax, 8(%esp)
	movl	%esi, %eax
	sall	$22, %eax
	movl	%eax, 4(%esp)
	movl	%esi, %eax
	andl	$67107840, %eax
	shrl	$10, %eax
	movl	%eax, (%esp)
	call	unmapPageTable
	jmp	.L875
	.p2align 4,,7
	.p2align 3
.L865:
	movl	%ebx, %edx
	movl	$896, %ecx
	andl	$16777200, %edx
	xorl	%eax, %eax
	sall	$8, %edx
	movl	%edx, %edi
	rep stosl
.L875:
	movl	12(%ebp), %edi
	leal	-32(%ebp), %eax
	movl	%ebx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, (%esp)
	movl	%edi, 12(%esp)
	call	Arch_finaliseCap
	movl	12(%ebp), %edi
	subl	$4, %esp
	testl	%edi, %edi
	je	.L868
.L879:
	movl	8(%ebp), %eax
	movl	%ebx, %edx
	movl	%esi, %ecx
	call	resetMemMapping
	movl	8(%ebp), %eax
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
	.p2align 4,,7
	.p2align 3
.L861:
	.cfi_restore_state
	call	halt
.L909:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, -40(%ebp)
	jmp	.L882
.L908:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movl	$4095, -40(%ebp)
	jmp	.L881
	.cfi_endproc
.LFE385:
	.size	Arch_recycleCap, .-Arch_recycleCap
	.p2align 4,,15
	.globl	Arch_hasRecycleRights
	.type	Arch_hasRecycleRights, @function
Arch_hasRecycleRights:
.LFB386:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %eax
	movl	%eax, %ebx
	movl	%eax, %edx
	andl	$14, %ebx
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %ebx
	cmove	%ecx, %edx
	cmpl	$1, %edx
	jne	.L916
	andl	$50331648, %eax
	cmpl	$50331648, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L916:
	.cfi_restore_state
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE386:
	.size	Arch_hasRecycleRights, .-Arch_hasRecycleRights
	.p2align 4,,15
	.globl	Arch_sameRegionAs
	.type	Arch_sameRegionAs, @function
Arch_sameRegionAs:
.LFB387:
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
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %edx
	movl	36(%esp), %esi
	movl	40(%esp), %ecx
	movl	44(%esp), %edi
	movl	%edx, %ebp
	movl	%edx, %eax
	andl	$14, %ebp
	andl	$15, %eax
	movzbl	%dl, %ebx
	cmpl	$14, %ebp
	cmove	%ebx, %eax
	cmpl	$11, %eax
	ja	.L948
	jmp	*.L923(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L923:
	.long	.L948
	.long	.L922
	.long	.L948
	.long	.L924
	.long	.L948
	.long	.L925
	.long	.L948
	.long	.L926
	.long	.L948
	.long	.L927
	.long	.L948
	.long	.L928
	.text
	.p2align 4,,7
	.p2align 3
.L928:
	movl	%ecx, %edx
	movl	%ecx, %eax
	andl	$14, %edx
	andl	$15, %eax
	movzbl	%cl, %ecx
	cmpl	$14, %edx
	cmove	%ecx, %eax
	cmpl	$11, %eax
	sete	%al
	movzbl	%al, %eax
.L921:
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
.L922:
	.cfi_restore_state
	movl	%ecx, %ebp
	movl	%ecx, %ebx
	andl	$14, %ebp
	andl	$15, %ebx
	movzbl	%cl, %eax
	cmpl	$14, %ebp
	cmove	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$1, %ebx
	jne	.L921
	shrl	$31, %esi
	testl	%esi, %esi
	je	.L932
	cmpl	$1, %esi
	jne	.L964
	movl	$4194304, %eax
.L933:
	shrl	$31, %edi
	testl	%edi, %edi
	je	.L935
	cmpl	$1, %edi
	jne	.L964
	movl	$4194304, %ebx
.L936:
	andl	$16777200, %edx
	andl	$16777200, %ecx
	sall	$8, %edx
	sall	$8, %ecx
	leal	-1(%ecx,%ebx), %ebx
	leal	-1(%edx,%eax), %eax
	cmpl	%ebx, %eax
	jb	.L948
	cmpl	%ecx, %edx
	ja	.L948
	xorl	%eax, %eax
	cmpl	%ecx, %ebx
	setae	%al
	jmp	.L921
	.p2align 4,,7
	.p2align 3
.L924:
	movl	%ecx, %esi
	movl	%ecx, %ebx
	andl	$14, %esi
	andl	$15, %ebx
	movzbl	%cl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$3, %ebx
	jne	.L921
.L963:
	andl	$16777200, %edx
	andl	$16777200, %ecx
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	sete	%al
	jmp	.L921
	.p2align 4,,7
	.p2align 3
.L925:
	movl	%ecx, %esi
	movl	%ecx, %ebx
	andl	$14, %esi
	andl	$15, %ebx
	movzbl	%cl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$5, %ebx
	je	.L963
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
.L926:
	.cfi_restore_state
	movl	%ecx, %edx
	movl	%ecx, %eax
	andl	$14, %edx
	andl	$15, %eax
	movzbl	%cl, %ecx
	cmpl	$14, %edx
	cmove	%ecx, %eax
	cmpl	$7, %eax
	sete	%al
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	movzbl	%al, %eax
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
.L927:
	.cfi_restore_state
	movl	%ecx, %esi
	movl	%ecx, %ebx
	andl	$14, %esi
	andl	$15, %ebx
	movzbl	%cl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$9, %ebx
	je	.L963
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
.L948:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L921
	.p2align 4,,7
	.p2align 3
.L964:
	call	halt
	.p2align 4,,7
	.p2align 3
.L932:
	movl	$4096, %eax
	jmp	.L933
.L935:
	movl	$4096, %ebx
	jmp	.L936
	.cfi_endproc
.LFE387:
	.size	Arch_sameRegionAs, .-Arch_sameRegionAs
	.p2align 4,,15
	.globl	Arch_sameObjectAs
	.type	Arch_sameObjectAs, @function
Arch_sameObjectAs:
.LFB388:
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
	movl	20(%esp), %eax
	movl	24(%esp), %edi
	movl	28(%esp), %ecx
	movl	32(%esp), %ebp
	movl	%eax, %esi
	movl	%eax, %edx
	andl	$14, %esi
	andl	$15, %edx
	movzbl	%al, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %edx
	cmpl	$1, %edx
	je	.L977
.L970:
	movl	%ecx, 28(%esp)
	movl	%ebp, 32(%esp)
	movl	%eax, 20(%esp)
	movl	%edi, 24(%esp)
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
	jmp	Arch_sameRegionAs
	.p2align 4,,7
	.p2align 3
.L977:
	.cfi_restore_state
	movl	%ecx, %esi
	movl	%ecx, %edx
	andl	$14, %esi
	andl	$15, %edx
	movzbl	%cl, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %edx
	cmpl	$1, %edx
	jne	.L970
	andl	$16777200, %eax
	andl	$16777200, %ecx
	movl	%eax, %edx
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	je	.L978
.L974:
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
	.p2align 4,,7
	.p2align 3
.L978:
	.cfi_restore_state
	shrl	$31, %edi
	xorl	%eax, %eax
	shrl	$31, %ebp
	cmpl	%ebp, %edi
	sete	%al
	jmp	.L974
	.cfi_endproc
.LFE388:
	.size	Arch_sameObjectAs, .-Arch_sameObjectAs
	.p2align 4,,15
	.globl	Arch_getObjectSize
	.type	Arch_getObjectSize, @function
Arch_getObjectSize:
.LFB389:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	cmpl	$6, %eax
	je	.L984
	ja	.L982
	cmpl	$5, %eax
	jne	.L980
.L983:
	movl	$12, %eax
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L982:
	.cfi_restore_state
	cmpl	$8, %eax
	jbe	.L983
.L980:
	call	halt
	.p2align 4,,7
	.p2align 3
.L984:
	movl	$22, %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE389:
	.size	Arch_getObjectSize, .-Arch_getObjectSize
	.p2align 4,,15
	.globl	Arch_createObject
	.type	Arch_createObject, @function
Arch_createObject:
.LFB390:
	.cfi_startproc
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
	movl	36(%esp), %eax
	movl	32(%esp), %esi
	movl	40(%esp), %ebx
	cmpl	$6, %eax
	je	.L991
	jbe	.L1048
	cmpl	$7, %eax
	je	.L994
	cmpl	$8, %eax
	.p2align 4,,5
	jne	.L990
	testb	$1, %bl
	movl	%ebx, %edi
	movl	$4096, %edx
	jne	.L1049
.L1005:
	testl	$2, %edi
	jne	.L1050
.L1006:
	movl	%edx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %dl
	rep stosl
	jne	.L1051
	andl	$1, %edx
	jne	.L1052
.L1008:
	movl	ia32KSkernelPD, %ecx
	movl	$896, %eax
	.p2align 4,,7
	.p2align 3
.L1010:
	movl	(%ecx,%eax,4), %edx
	movl	%edx, (%ebx,%eax,4)
	addl	$1, %eax
	cmpl	$1024, %eax
	jne	.L1010
	andl	$-4096, %ebx
	movl	%esi, %eax
	shrl	$8, %ebx
	orl	$5, %ebx
	movl	%ebx, (%esi)
	movl	$0, 4(%esi)
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
	.p2align 4,,7
	.p2align 3
.L994:
	.cfi_restore_state
	testb	$1, %bl
	movl	%ebx, %edi
	movl	$4096, %edx
	jne	.L1053
.L1001:
	testl	$2, %edi
	jne	.L1054
.L1002:
	movl	%edx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %dl
	rep stosl
	jne	.L1055
	andl	$1, %edx
	jne	.L1056
.L1004:
	andl	$-4096, %ebx
	movl	%esi, %eax
	shrl	$8, %ebx
	orl	$3, %ebx
	movl	%ebx, (%esi)
	movl	$0, 4(%esi)
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
	.p2align 4,,7
	.p2align 3
.L1048:
	.cfi_restore_state
	cmpl	$5, %eax
	jne	.L990
	testb	$1, %bl
	movl	%ebx, %edi
	movl	$4096, %edx
	jne	.L1057
.L996:
	testl	$2, %edi
	jne	.L1058
.L997:
	movl	%edx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %dl
	rep stosl
	jne	.L1059
	andl	$1, %edx
	jne	.L1060
.L999:
	andl	$-4096, %ebx
	movl	%esi, %eax
	shrl	$8, %ebx
	orl	$50331649, %ebx
	movl	%ebx, (%esi)
	movl	$0, 4(%esi)
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
	.p2align 4,,7
	.p2align 3
.L990:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L991:
	movl	%ebx, (%esp)
	andl	$-4096, %ebx
	shrl	$8, %ebx
	movl	$4194304, 8(%esp)
	orl	$50331649, %ebx
	movl	$0, 4(%esp)
	call	memset
	movl	%esi, %eax
	movl	%ebx, (%esi)
	movl	$-2147483648, 4(%esi)
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
.L1060:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L999
.L1059:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %edx
	je	.L999
	jmp	.L1060
.L1056:
	movb	$0, (%edi)
	jmp	.L1004
.L1052:
	movb	$0, (%edi)
	.p2align 4,,5
	jmp	.L1008
.L1051:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %edx
	je	.L1008
	jmp	.L1052
.L1055:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %edx
	je	.L1004
	jmp	.L1056
.L1058:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	subl	$2, %edx
	jmp	.L997
.L1049:
	movb	$0, (%ebx)
	leal	1(%ebx), %edi
	movw	$4095, %dx
	jmp	.L1005
.L1053:
	movb	$0, (%ebx)
	leal	1(%ebx), %edi
	movw	$4095, %dx
	jmp	.L1001
.L1054:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	subl	$2, %edx
	jmp	.L1002
.L1050:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %edx
	jmp	.L1006
.L1057:
	movb	$0, (%ebx)
	leal	1(%ebx), %edi
	movw	$4095, %dx
	jmp	.L996
	.cfi_endproc
.LFE390:
	.size	Arch_createObject, .-Arch_createObject
	.p2align 4,,15
	.globl	Arch_prepareThreadDelete
	.type	Arch_prepareThreadDelete, @function
Arch_prepareThreadDelete:
.LFB392:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	cmpl	ia32KSfpuOwner, %eax
	je	.L1068
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1068:
	.cfi_restore_state
#APP
# 45 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
	testl	%eax, %eax
	je	.L1063
	addl	$80, %eax
	movl	%eax, (%esp)
	call	saveFpuState
.L1063:
#APP
# 41 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
#NO_APP
	orl	$8, %eax
#APP
# 47 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
	movl	$0, ia32KSfpuOwner
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE392:
	.size	Arch_prepareThreadDelete, .-Arch_prepareThreadDelete
	.p2align 4,,15
	.globl	setMRs_fault
	.type	setMRs_fault, @function
setMRs_fault:
.LFB394:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	20(%esp), %ebx
	movl	24(%esp), %ecx
	movl	604(%eax), %edx
	andl	$7, %edx
	cmpl	$2, %edx
	je	.L1071
	jbe	.L1094
	cmpl	$3, %edx
	je	.L1074
	cmpl	$4, %edx
	.p2align 4,,5
	jne	.L1070
	movl	44(%eax), %edx
	testl	%ecx, %ecx
	movl	%edx, 20(%ebx)
	movl	68(%eax), %edx
	movl	%edx, 24(%ebx)
	je	.L1077
	movl	64(%eax), %edx
	movl	%edx, 12(%ecx)
	movl	608(%eax), %edx
	movl	%edx, 16(%ecx)
	movl	604(%eax), %eax
	shrl	$3, %eax
	movl	%eax, 20(%ecx)
	movl	$5, %eax
	jmp	.L1083
	.p2align 4,,7
	.p2align 3
.L1074:
	movl	(%eax), %edx
	testl	%ecx, %ecx
	movl	%edx, 20(%ebx)
	movl	4(%eax), %edx
	movl	%edx, 24(%ebx)
	je	.L1077
	movl	8(%eax), %edx
	movl	%edx, 12(%ecx)
	movl	12(%eax), %edx
	movl	%edx, 16(%ecx)
	movl	16(%eax), %edx
	movl	%edx, 20(%ecx)
	movl	20(%eax), %edx
	movl	%edx, 24(%ecx)
	movl	24(%eax), %edx
	movl	%edx, 28(%ecx)
	movl	56(%eax), %edx
	movl	%edx, 32(%ecx)
	movl	68(%eax), %edx
	movl	%edx, 36(%ecx)
	movl	64(%eax), %edx
	movl	%edx, 40(%ecx)
	movl	608(%eax), %eax
	movl	%eax, 44(%ecx)
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	$11, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1094:
	.cfi_restore_state
	cmpl	$1, %edx
	jne	.L1070
	movl	44(%eax), %edx
	testl	%ecx, %ecx
	movl	%edx, 20(%ebx)
	movl	608(%eax), %edx
	movl	%edx, 24(%ebx)
	je	.L1077
	movl	604(%eax), %edx
	shrl	$31, %edx
	movl	%edx, 12(%ecx)
	movl	612(%eax), %edx
	movl	616(%eax), %esi
	movl	%edx, %eax
	andl	$3, %eax
	leal	1(%eax), %ebx
	cmpl	$2, %eax
	movl	%ebx, 16(%ecx)
	je	.L1080
	cmpl	$3, %eax
	je	.L1081
	cmpl	$1, %eax
	jne	.L1093
	andl	$252, %edx
	movb	$5, %al
	shrl	$2, %edx
	movl	%edx, 20(%ecx)
	jmp	.L1083
	.p2align 4,,7
	.p2align 3
.L1070:
	call	halt
	.p2align 4,,7
	.p2align 3
.L1071:
	movl	44(%eax), %edx
	testl	%ecx, %ecx
	movl	%edx, 20(%ebx)
	movl	608(%eax), %edx
	movl	%edx, 24(%ebx)
	je	.L1077
	movl	604(%eax), %edx
	andl	$524288, %edx
	shrl	$19, %edx
	movl	%edx, 12(%ecx)
	movl	604(%eax), %eax
	shrl	$27, %eax
	movl	%eax, 16(%ecx)
.L1093:
	movl	$4, %eax
.L1083:
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
	.p2align 4,,7
	.p2align 3
.L1077:
	.cfi_restore_state
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	$2, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1081:
	.cfi_restore_state
	movl	%edx, %eax
	andl	$252, %edx
	andl	$16128, %eax
	shrl	$8, %eax
	shrl	$2, %edx
	movl	%eax, 20(%ecx)
	movl	$7, %eax
	movl	%esi, 24(%ecx)
	movl	%edx, 28(%ecx)
	jmp	.L1083
	.p2align 4,,7
	.p2align 3
.L1080:
	movl	%edx, %eax
	andl	$16128, %edx
	andl	$252, %eax
	shrl	$2, %eax
	shrl	$8, %edx
	movl	%eax, 20(%ecx)
	movl	$6, %eax
	movl	%edx, 24(%ecx)
	jmp	.L1083
	.cfi_endproc
.LFE394:
	.size	setMRs_fault, .-setMRs_fault
	.p2align 4,,15
	.globl	setMRs_syscall_error
	.type	setMRs_syscall_error, @function
setMRs_syscall_error:
.LFB395:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	current_syscall_error+24, %eax
	cmpl	$10, %eax
	ja	.L1096
	jmp	*.L1098(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1098:
	.long	.L1096
	.long	.L1097
	.long	.L1099
	.long	.L1108
	.long	.L1101
	.long	.L1108
	.long	.L1102
	.long	.L1108
	.long	.L1108
	.long	.L1108
	.long	.L1103
	.text
	.p2align 4,,7
	.p2align 3
.L1108:
	xorl	%eax, %eax
.L1100:
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
	.p2align 4,,7
	.p2align 3
.L1101:
	.cfi_restore_state
	movl	current_syscall_error+8, %eax
	movl	16(%esp), %ecx
	movl	%eax, 20(%ecx)
	movl	current_syscall_error+12, %eax
	movl	%eax, 24(%ecx)
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	$2, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1103:
	.cfi_restore_state
	movl	current_syscall_error+16, %eax
	movl	16(%esp), %esi
	movl	%eax, 20(%esi)
	addl	$4, %esp
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
.L1102:
	.cfi_restore_state
	movl	current_syscall_error+20, %edx
	xorl	%eax, %eax
	movl	16(%esp), %ecx
	movl	16(%esp), %esi
	movl	current_lookup_fault+4, %ebx
	testl	%edx, %edx
	setne	%al
	movl	%eax, 20(%ecx)
	movl	current_lookup_fault, %ecx
	movl	%ecx, %edx
	andl	$3, %edx
	leal	1(%edx), %eax
	movl	%eax, 24(%esi)
	movl	20(%esp), %esi
	movl	$2, %eax
	testl	%esi, %esi
	je	.L1100
	cmpl	$2, %edx
	je	.L1105
	cmpl	$3, %edx
	je	.L1106
	cmpl	$1, %edx
	.p2align 4,,2
	jne	.L1100
	movl	20(%esp), %eax
	andl	$252, %ecx
	shrl	$2, %ecx
	movl	%ecx, 12(%eax)
	movl	$3, %eax
	jmp	.L1100
	.p2align 4,,7
	.p2align 3
.L1097:
	movl	16(%esp), %ebx
	movl	current_syscall_error, %edx
	movl	%edx, 20(%ebx)
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
	.p2align 4,,7
	.p2align 3
.L1099:
	.cfi_restore_state
	movl	current_syscall_error+4, %eax
	movl	16(%esp), %ebx
	movl	%eax, 20(%ebx)
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1096:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L1106:
	movl	20(%esp), %esi
	movl	%ecx, %eax
	andl	$252, %ecx
	andl	$16128, %eax
	shrl	$8, %eax
	shrl	$2, %ecx
	movl	%eax, 12(%esi)
	movl	$5, %eax
	movl	%ebx, 16(%esi)
	movl	%ecx, 20(%esi)
	jmp	.L1100
	.p2align 4,,7
	.p2align 3
.L1105:
	movl	20(%esp), %esi
	movl	%ecx, %eax
	andl	$16128, %ecx
	andl	$252, %eax
	shrl	$2, %eax
	shrl	$8, %ecx
	movl	%eax, 12(%esi)
	movl	$4, %eax
	movl	%ecx, 16(%esi)
	jmp	.L1100
	.cfi_endproc
.LFE395:
	.size	setMRs_syscall_error, .-setMRs_syscall_error
	.p2align 4,,15
	.globl	Arch_decodeTransfer
	.type	Arch_decodeTransfer, @function
Arch_decodeTransfer:
.LFB396:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE396:
	.size	Arch_decodeTransfer, .-Arch_decodeTransfer
	.p2align 4,,15
	.globl	Arch_performTransfer
	.type	Arch_performTransfer, @function
Arch_performTransfer:
.LFB397:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE397:
	.size	Arch_performTransfer, .-Arch_performTransfer
	.section	.boot.text
	.p2align 4,,15
	.globl	insert_region
	.type	insert_region, @function
insert_region:
.LFB398:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %ecx
	movl	12(%esp), %edx
	cmpl	%ecx, %edx
	je	.L1118
	movl	ndks_boot+4, %eax
	cmpl	%eax, ndks_boot
	movl	$0, %eax
	je	.L1117
	movl	ndks_boot+12, %ebx
	cmpl	%ebx, ndks_boot+8
	je	.L1122
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1118:
	.cfi_restore_state
	movl	$1, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1122:
	.cfi_restore_state
	movb	$1, %al
.L1117:
	movl	%ecx, ndks_boot(,%eax,8)
	movl	%edx, ndks_boot+4(,%eax,8)
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE398:
	.size	insert_region, .-insert_region
	.p2align 4,,15
	.globl	alloc_region
	.type	alloc_region, @function
alloc_region:
.LFB400:
	.cfi_startproc
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	ndks_boot, %ebp
	movl	48(%esp), %ecx
	movl	ndks_boot+4, %eax
	leal	-1(%ebp), %edx
	shrl	%cl, %edx
	addl	$1, %edx
	movl	%eax, %esi
	sall	%cl, %edx
	movl	%eax, 8(%esp)
	shrl	%cl, %eax
	movl	%edx, %ebx
	sall	%cl, %eax
	subl	%ebp, %ebx
	subl	%eax, %esi
	sall	%cl, %edi
	cmpl	%ebx, %esi
	ja	.L1124
	movl	%eax, %edx
	subl	%edi, %edx
.L1125:
	cmpl	%edx, %eax
	jbe	.L1139
	cmpl	%edx, %ebp
	jbe	.L1155
.L1139:
	movl	$0, 8(%esp)
	xorl	%ebp, %ebp
	xorl	%eax, %eax
	movl	$0, 20(%esp)
	xorl	%edx, %edx
	movl	$0, 12(%esp)
.L1126:
	movl	ndks_boot+8, %ebx
	movl	ndks_boot+12, %esi
	movl	%ebx, (%esp)
	subl	$1, %ebx
	shrl	%cl, %ebx
	addl	$1, %ebx
	sall	%cl, %ebx
	movl	%esi, 4(%esp)
	shrl	%cl, %esi
	sall	%cl, %esi
	movl	%ebx, %ecx
	subl	(%esp), %ecx
	movl	%ecx, 16(%esp)
	movl	4(%esp), %ecx
	subl	%esi, %ecx
	cmpl	%ecx, 16(%esp)
	jae	.L1128
	leal	(%ebx,%edi), %esi
.L1129:
	cmpl	%ebx, %esi
	jbe	.L1143
	cmpl	%ebx, (%esp)
	jbe	.L1156
.L1143:
	xorl	%ecx, %ecx
.L1130:
	cmpl	%edx, %eax
	je	.L1149
.L1132:
	movl	8(%esp), %eax
	cmpl	%eax, 20(%esp)
	movl	$0, ndks_boot(,%ecx,8)
	movl	$0, ndks_boot+4(,%ecx,8)
	je	.L1134
	movl	ndks_boot+4, %eax
	cmpl	%eax, ndks_boot
	je	.L1150
	movl	ndks_boot+12, %eax
	cmpl	%eax, ndks_boot+8
	je	.L1157
.L1134:
	cmpl	12(%esp), %ebp
	movl	%edx, %eax
	je	.L1133
	movl	ndks_boot+4, %eax
	cmpl	%eax, ndks_boot
	je	.L1152
	movl	ndks_boot+12, %edi
	movl	%edx, %eax
	cmpl	%edi, ndks_boot+8
	je	.L1158
.L1133:
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
	.p2align 4,,7
	.p2align 3
.L1128:
	.cfi_restore_state
	movl	%esi, %ebx
	subl	%edi, %ebx
	jmp	.L1129
	.p2align 4,,7
	.p2align 3
.L1124:
	leal	(%edx,%edi), %eax
	jmp	.L1125
	.p2align 4,,7
	.p2align 3
.L1156:
	cmpl	%esi, 4(%esp)
	jb	.L1143
	movl	4(%esp), %ecx
	movl	%ebx, %edi
	subl	(%esp), %edi
	subl	%esi, %ecx
	cmpl	%ecx, %edi
	jb	.L1144
	movl	%edi, 24(%esp)
	movl	(%esp), %edi
	movl	%esi, (%esp)
	movl	%edi, 16(%esp)
	movl	4(%esp), %edi
	movl	%ebx, 4(%esp)
.L1131:
	cmpl	%eax, %edx
	je	.L1146
	movl	12(%esp), %eax
	subl	%ebp, %eax
	cmpl	%ecx, %eax
	ja	.L1146
	movl	$0, %ecx
	jne	.L1132
	movl	8(%esp), %eax
	subl	20(%esp), %eax
	cmpl	24(%esp), %eax
	jbe	.L1132
	movl	4(%esp), %eax
	movl	%ebx, %edx
	movb	$1, %cl
	movl	%edi, 12(%esp)
	movl	(%esp), %ebp
	movl	%eax, 8(%esp)
	movl	16(%esp), %eax
	movl	%eax, 20(%esp)
	movl	%esi, %eax
	jmp	.L1130
	.p2align 4,,7
	.p2align 3
.L1155:
	cmpl	8(%esp), %eax
	ja	.L1139
	movl	8(%esp), %esi
	movl	%edx, %ebx
	subl	%ebp, %ebx
	subl	%eax, %esi
	cmpl	%ebx, %esi
	ja	.L1140
	movl	8(%esp), %esi
	movl	%ebp, 20(%esp)
	movl	%eax, %ebp
	movl	%edx, 8(%esp)
	movl	%esi, 12(%esp)
	jmp	.L1126
	.p2align 4,,7
	.p2align 3
.L1146:
	movl	4(%esp), %eax
	movl	%ebx, %edx
	movl	$1, %ecx
	movl	%edi, 12(%esp)
	movl	(%esp), %ebp
	movl	%eax, 8(%esp)
	movl	16(%esp), %eax
	movl	%eax, 20(%esp)
	movl	%esi, %eax
	jmp	.L1130
	.p2align 4,,7
	.p2align 3
.L1149:
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
	.p2align 4,,7
	.p2align 3
.L1140:
	.cfi_restore_state
	movl	%eax, 20(%esp)
	movl	%edx, 12(%esp)
	jmp	.L1126
	.p2align 4,,7
	.p2align 3
.L1144:
	movl	%ecx, 24(%esp)
	movl	%edi, %ecx
	movl	%ebx, %edi
	movl	%esi, 16(%esp)
	jmp	.L1131
	.p2align 4,,7
	.p2align 3
.L1152:
	movl	$ndks_boot, %eax
.L1136:
	movl	12(%esp), %edi
	movl	%ebp, (%eax)
	movl	%edi, 4(%eax)
	movl	%edx, %eax
	jmp	.L1133
	.p2align 4,,7
	.p2align 3
.L1150:
	movl	$ndks_boot, %eax
.L1135:
	movl	20(%esp), %edi
	movl	%edi, (%eax)
	movl	8(%esp), %edi
	movl	%edi, 4(%eax)
	jmp	.L1134
	.p2align 4,,7
	.p2align 3
.L1158:
	movl	$ndks_boot+8, %eax
	jmp	.L1136
	.p2align 4,,7
	.p2align 3
.L1157:
	movl	$ndks_boot+8, %eax
	jmp	.L1135
	.cfi_endproc
.LFE400:
	.size	alloc_region, .-alloc_region
	.p2align 4,,15
	.globl	write_slot
	.type	write_slot, @function
write_slot:
.LFB401:
	.cfi_startproc
	movl	4(%esp), %ecx
	movl	8(%esp), %eax
	movl	12(%esp), %edx
	movl	$0, 8(%ecx)
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
	movl	$3, 12(%ecx)
	ret
	.cfi_endproc
.LFE401:
	.size	write_slot, .-write_slot
	.p2align 4,,15
	.globl	create_root_cnode
	.type	create_root_cnode, @function
create_root_cnode:
.LFB402:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	$20, (%esp)
	movl	32(%esp), %ebx
	movl	$65536, ndks_boot+24
	call	alloc_region
	testl	%eax, %eax
	movl	%eax, %esi
	je	.L1164
	movl	$1048576, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	memset
	movl	%esi, %eax
	andl	$-32, %eax
	shrl	%eax
	orl	$10, %eax
	movl	%eax, 32(%esi)
	movl	%eax, (%ebx)
	movl	%ebx, %eax
	movl	$138412032, 36(%esi)
	movl	$0, 40(%esi)
	movl	$3, 44(%esi)
	movl	$138412032, 4(%ebx)
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
	.p2align 4,,7
	.p2align 3
.L1164:
	.cfi_restore_state
	movl	$0, (%ebx)
	movl	%ebx, %eax
	movl	$0, 4(%ebx)
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE402:
	.size	create_root_cnode, .-create_root_cnode
	.p2align 4,,15
	.globl	create_irq_cnode
	.type	create_irq_cnode, @function
create_irq_cnode:
.LFB403:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	call	alloc_region.constprop.155
	movl	%eax, %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L1166
	testb	$1, %dl
	movl	%edx, %edi
	movl	$4096, %ebx
	jne	.L1186
.L1167:
	testl	$2, %edi
	jne	.L1187
.L1168:
	movl	%ebx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %bl
	rep stosl
	jne	.L1188
	andl	$1, %ebx
	jne	.L1189
.L1170:
	movl	%edx, intStateIRQNode
	movl	$1, %eax
.L1166:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1189:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L1170
	.p2align 4,,7
	.p2align 3
.L1188:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %ebx
	je	.L1170
	jmp	.L1189
	.p2align 4,,7
	.p2align 3
.L1187:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %ebx
	jmp	.L1168
	.p2align 4,,7
	.p2align 3
.L1186:
	movb	$0, (%edx)
	leal	1(%edx), %edi
	movw	$4095, %bx
	jmp	.L1167
	.cfi_endproc
.LFE403:
	.size	create_irq_cnode, .-create_irq_cnode
	.p2align 4,,15
	.globl	create_domain_cap
	.type	create_domain_cap, @function
create_domain_cap:
.LFB404:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	movl	20(%esp), %esi
	movl	%eax, %ebx
	movl	%eax, %edx
	andl	$14, %ebx
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %ebx
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L1193
	jmp	*.L1195(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L1195:
	.long	.L1207
	.long	.L1202
	.long	.L1201
	.long	.L1202
	.long	.L1201
	.long	.L1202
	.long	.L1201
	.long	.L1207
	.long	.L1207
	.long	.L1202
	.long	.L1203
	.long	.L1207
	.long	.L1204
	.long	.L1193
	.long	.L1207
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1207
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1205
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1193
	.long	.L1207
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L1202:
	andl	$16777200, %eax
	sall	$8, %eax
.L1194:
	movl	$62, 176(%eax)
	movl	$0, 180(%eax)
	movl	$0, 184(%eax)
	movl	$3, 188(%eax)
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
	.p2align 4,,7
	.p2align 3
.L1201:
	.cfi_restore_state
	andl	$-16, %eax
	jmp	.L1194
	.p2align 4,,7
	.p2align 3
.L1207:
	xorl	%eax, %eax
	jmp	.L1194
	.p2align 4,,7
	.p2align 3
.L1205:
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L1208
	leal	1(%eax), %ecx
	movl	$-1, %eax
	sall	%cl, %eax
	andl	%esi, %eax
	jmp	.L1194
	.p2align 4,,7
	.p2align 3
.L1204:
	andl	$-1024, %eax
	jmp	.L1194
	.p2align 4,,7
	.p2align 3
.L1203:
	andl	$2147483632, %eax
	addl	%eax, %eax
	jmp	.L1194
	.p2align 4,,7
	.p2align 3
.L1193:
	call	halt
	.p2align 4,,7
	.p2align 3
.L1208:
	movl	$-16, %eax
	andl	%esi, %eax
	jmp	.L1194
	.cfi_endproc
.LFE404:
	.size	create_domain_cap, .-create_domain_cap
	.p2align 4,,15
	.globl	create_ipcbuf_frame
	.type	create_ipcbuf_frame, @function
create_ipcbuf_frame:
.LFB405:
	.cfi_startproc
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
	movl	32(%esp), %ebx
	call	alloc_region.constprop.155
	testl	%eax, %eax
	movl	%eax, %edx
	je	.L1230
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %esi
	jne	.L1231
.L1213:
	testl	$2, %edi
	jne	.L1232
.L1214:
	movl	%esi, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testl	$2, %esi
	rep stosl
	jne	.L1233
	andl	$1, %esi
	jne	.L1234
.L1216:
	movl	52(%esp), %esi
	andl	$-4096, %edx
	movl	44(%esp), %eax
	movl	%edx, %edi
	movl	48(%esp), %edx
	shrl	$8, %edi
	orl	$50331649, %edi
	shrl	$12, %esi
	orl	$1048576, %esi
	movl	%edi, 8(%esp)
	movl	%esi, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	map_it_frame_cap
	movl	36(%esp), %eax
	movl	40(%esp), %edx
	call	cap_get_capPtr
	movl	%edi, (%ebx)
	movl	%esi, 4(%ebx)
	movl	%edi, 160(%eax)
	movl	%esi, 164(%eax)
	movl	$0, 168(%eax)
	movl	$3, 172(%eax)
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	%ebx, %eax
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
	.p2align 4,,7
	.p2align 3
.L1234:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L1216
	.p2align 4,,7
	.p2align 3
.L1233:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %esi
	je	.L1216
	jmp	.L1234
	.p2align 4,,7
	.p2align 3
.L1230:
	movl	$0, (%ebx)
	movl	%ebx, %eax
	movl	$0, 4(%ebx)
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
	.p2align 4,,7
	.p2align 3
.L1232:
	.cfi_restore_state
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %esi
	jmp	.L1214
	.p2align 4,,7
	.p2align 3
.L1231:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$4095, %si
	jmp	.L1213
	.cfi_endproc
.LFE405:
	.size	create_ipcbuf_frame, .-create_ipcbuf_frame
	.p2align 4,,15
	.globl	create_bi_frame_cap
	.type	create_bi_frame_cap, @function
create_bi_frame_cap:
.LFB406:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	52(%esp), %eax
	movl	56(%esp), %ecx
	movl	60(%esp), %edi
	movl	68(%esp), %ebx
	movl	%eax, 12(%esp)
	movl	64(%esp), %eax
	movl	%ecx, %edx
	movl	48(%esp), %esi
	movl	%edi, 8(%esp)
	movl	%ecx, %edi
	andl	$15, %edx
	andl	$14, %edi
	andl	$-4096, %eax
	shrl	$8, %eax
	shrl	$12, %ebx
	movl	%eax, %ebp
	movl	%edi, 4(%esp)
	orl	$1048576, %ebx
	orl	$50331649, %ebp
	cmpl	$14, 4(%esp)
	movzbl	%cl, %edi
	cmove	%edi, %edx
	cmpl	$62, %edx
	ja	.L1254
	jmp	*.L1240(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L1240:
	.long	.L1268
	.long	.L1247
	.long	.L1246
	.long	.L1247
	.long	.L1246
	.long	.L1247
	.long	.L1246
	.long	.L1268
	.long	.L1268
	.long	.L1247
	.long	.L1248
	.long	.L1268
	.long	.L1249
	.long	.L1254
	.long	.L1268
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1268
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1250
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1268
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L1247:
	andl	$16777200, %ecx
	sall	$8, %ecx
.L1239:
	movl	%ebx, %edx
	sall	$12, %edx
	movl	%edx, %edi
	andl	$4194303, %edx
	shrl	$22, %edi
	movl	(%ecx,%edi,4), %ecx
	sall	$8, %eax
	addl	$536870912, %eax
	shrl	$12, %edx
	orl	$7, %eax
	andl	$-4096, %ecx
	movl	%eax, -536870912(%ecx,%edx,4)
	call	invalidatePageStructureCache
	movl	%esi, %ecx
	movl	%esi, %eax
	andl	$14, %ecx
	movl	%esi, %edx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$62, %eax
	ja	.L1254
	jmp	*.L1256(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1256:
	.long	.L1270
	.long	.L1263
	.long	.L1262
	.long	.L1263
	.long	.L1262
	.long	.L1263
	.long	.L1262
	.long	.L1270
	.long	.L1270
	.long	.L1263
	.long	.L1264
	.long	.L1270
	.long	.L1265
	.long	.L1254
	.long	.L1270
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1270
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1266
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1254
	.long	.L1270
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L1263:
	andl	$16777200, %esi
	sall	$8, %esi
.L1255:
	movl	%ebp, 144(%esi)
	movl	%ebx, 148(%esi)
	movl	$0, 152(%esi)
	movl	$3, 156(%esi)
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
	.p2align 4,,7
	.p2align 3
.L1246:
	.cfi_restore_state
	andl	$-16, %ecx
	jmp	.L1239
	.p2align 4,,7
	.p2align 3
.L1262:
	andl	$-16, %esi
	jmp	.L1255
	.p2align 4,,7
	.p2align 3
.L1268:
	xorl	%ecx, %ecx
	jmp	.L1239
	.p2align 4,,7
	.p2align 3
.L1250:
	andl	$16128, %ecx
	shrl	$8, %ecx
	cmpl	$32, %ecx
	je	.L1269
	addl	$1, %ecx
	movl	$-1, %edx
	sall	%cl, %edx
.L1251:
	movl	8(%esp), %ecx
	andl	%edx, %ecx
	jmp	.L1239
	.p2align 4,,7
	.p2align 3
.L1249:
	andl	$-1024, %ecx
	jmp	.L1239
	.p2align 4,,7
	.p2align 3
.L1248:
	andl	$2147483632, %ecx
	addl	%ecx, %ecx
	jmp	.L1239
	.p2align 4,,7
	.p2align 3
.L1270:
	xorl	%esi, %esi
	jmp	.L1255
	.p2align 4,,7
	.p2align 3
.L1264:
	andl	$2147483632, %esi
	addl	%esi, %esi
	jmp	.L1255
	.p2align 4,,7
	.p2align 3
.L1265:
	andl	$-1024, %esi
	jmp	.L1255
	.p2align 4,,7
	.p2align 3
.L1266:
	andl	$16128, %esi
	shrl	$8, %esi
	cmpl	$32, %esi
	je	.L1271
	leal	1(%esi), %ecx
	movl	$-1, %esi
	sall	%cl, %esi
.L1267:
	andl	12(%esp), %esi
	jmp	.L1255
	.p2align 4,,7
	.p2align 3
.L1254:
	call	halt
	.p2align 4,,7
	.p2align 3
.L1269:
	movl	$-16, %edx
	jmp	.L1251
	.p2align 4,,7
	.p2align 3
.L1271:
	movl	$-16, %esi
	jmp	.L1267
	.cfi_endproc
.LFE406:
	.size	create_bi_frame_cap, .-create_bi_frame_cap
	.p2align 4,,15
	.globl	allocate_bi_frame
	.type	allocate_bi_frame, @function
allocate_bi_frame:
.LFB407:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	call	alloc_region.constprop.155
	testl	%eax, %eax
	movl	%eax, %edx
	je	.L1274
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %ebx
	jne	.L1295
.L1275:
	testl	$2, %edi
	jne	.L1296
.L1276:
	movl	%ebx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %bl
	rep stosl
	jne	.L1297
	andl	$1, %ebx
	jne	.L1298
.L1278:
	movl	12(%esp), %eax
	movl	%edx, ndks_boot+16
	movl	$12, ndks_boot+20
	movb	$16, 891(%edx)
	movl	%eax, (%edx)
	movl	16(%esp), %eax
	movl	$0, 8(%edx)
	movl	%eax, 4(%edx)
	movl	20(%esp), %eax
	movl	%eax, 12(%edx)
	movl	ksDomScheduleIdx, %eax
	movl	ksDomSchedule(,%eax,8), %eax
	movb	%al, 4080(%edx)
.L1274:
	movl	%edx, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1298:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L1278
	.p2align 4,,7
	.p2align 3
.L1297:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %ebx
	je	.L1278
	jmp	.L1298
	.p2align 4,,7
	.p2align 3
.L1296:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %ebx
	jmp	.L1276
	.p2align 4,,7
	.p2align 3
.L1295:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$4095, %bx
	jmp	.L1275
	.cfi_endproc
.LFE407:
	.size	allocate_bi_frame, .-allocate_bi_frame
	.p2align 4,,15
	.globl	provide_cap
	.type	provide_cap, @function
provide_cap:
.LFB408:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	ndks_boot+20, %ebx
	cmpl	ndks_boot+24, %ebx
	movl	16(%esp), %eax
	movl	20(%esp), %esi
	jae	.L1317
	movl	%eax, %edi
	movl	%eax, %edx
	andl	$14, %edi
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %edi
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L1303
	jmp	*.L1305(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L1305:
	.long	.L1318
	.long	.L1312
	.long	.L1311
	.long	.L1312
	.long	.L1311
	.long	.L1312
	.long	.L1311
	.long	.L1318
	.long	.L1318
	.long	.L1312
	.long	.L1313
	.long	.L1318
	.long	.L1314
	.long	.L1303
	.long	.L1318
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1318
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1315
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1303
	.long	.L1318
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L1312:
	andl	$16777200, %eax
	sall	$8, %eax
.L1304:
	sall	$4, %ebx
	movl	28(%esp), %edx
	addl	%eax, %ebx
	movl	24(%esp), %eax
	movl	$0, 8(%ebx)
	movl	$3, 12(%ebx)
	movl	%edx, 4(%ebx)
	movl	%eax, (%ebx)
	movl	$1, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	addl	$1, ndks_boot+20
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1317:
	.cfi_restore_state
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1311:
	.cfi_restore_state
	andl	$-16, %eax
	jmp	.L1304
	.p2align 4,,7
	.p2align 3
.L1318:
	xorl	%eax, %eax
	jmp	.L1304
	.p2align 4,,7
	.p2align 3
.L1313:
	andl	$2147483632, %eax
	addl	%eax, %eax
	jmp	.L1304
	.p2align 4,,7
	.p2align 3
.L1315:
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L1319
	leal	1(%eax), %ecx
	movl	$-1, %eax
	sall	%cl, %eax
	andl	%esi, %eax
	jmp	.L1304
	.p2align 4,,7
	.p2align 3
.L1314:
	andl	$-1024, %eax
	jmp	.L1304
	.p2align 4,,7
	.p2align 3
.L1303:
	call	halt
	.p2align 4,,7
	.p2align 3
.L1319:
	movl	$-16, %eax
	andl	%esi, %eax
	jmp	.L1304
	.cfi_endproc
.LFE408:
	.size	provide_cap, .-provide_cap
	.p2align 4,,15
	.globl	create_frames_of_region
	.type	create_frames_of_region, @function
create_frames_of_region:
.LFB409:
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
	movl	ndks_boot+20, %edx
	movl	68(%esp), %eax
	movl	84(%esp), %esi
	movl	%edx, 28(%esp)
	movl	%eax, 16(%esp)
	movl	72(%esp), %eax
	movl	%eax, 12(%esp)
	movl	88(%esp), %eax
	cmpl	%eax, %esi
	movl	%eax, 20(%esp)
	jae	.L1344
	movl	96(%esp), %eax
	movl	%edx, %edi
	movl	$536870912, 24(%esp)
	subl	%eax, 24(%esp)
	movl	%esi, 4(%esp)
.L1342:
	movl	92(%esp), %eax
	testl	%eax, %eax
	jne	.L1349
	movl	4(%esp), %ebx
	xorl	%ebp, %ebp
	andl	$-4096, %ebx
	shrl	$8, %ebx
	orl	$50331649, %ebx
.L1324:
	cmpl	%edi, ndks_boot+24
	movl	12(%esp), %esi
	jbe	.L1325
	movl	16(%esp), %ecx
	movl	%ecx, %eax
	movzbl	%cl, %edx
	andl	$14, %eax
	movl	%eax, 8(%esp)
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$14, 8(%esp)
	cmove	%edx, %eax
	cmpl	$62, %eax
	ja	.L1328
	jmp	*.L1330(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1330:
	.long	.L1345
	.long	.L1337
	.long	.L1336
	.long	.L1337
	.long	.L1336
	.long	.L1337
	.long	.L1336
	.long	.L1345
	.long	.L1345
	.long	.L1337
	.long	.L1338
	.long	.L1345
	.long	.L1339
	.long	.L1328
	.long	.L1345
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1345
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1340
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1328
	.long	.L1345
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L1337:
	andl	$16777200, %ecx
	sall	$8, %ecx
.L1329:
	sall	$4, %edi
	addl	%ecx, %edi
	movl	$3, 12(%edi)
	movl	ndks_boot+20, %eax
	movl	%ebx, (%edi)
	movl	%ebp, 4(%edi)
	movl	$0, 8(%edi)
	addl	$4096, 4(%esp)
	leal	1(%eax), %edi
	movl	20(%esp), %eax
	cmpl	%eax, 4(%esp)
	movl	%edi, ndks_boot+20
	jb	.L1342
	movl	28(%esp), %esi
	movl	%edi, %edx
.L1322:
	movl	64(%esp), %eax
	movl	%esi, (%eax)
	movl	%edx, 4(%eax)
	movl	$1, 8(%eax)
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
	.p2align 4,,7
	.p2align 3
.L1336:
	.cfi_restore_state
	andl	$-16, %ecx
	jmp	.L1329
	.p2align 4,,7
	.p2align 3
.L1325:
	movl	64(%esp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
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
	.p2align 4,,7
	.p2align 3
.L1349:
	.cfi_restore_state
	movl	4(%esp), %esi
	movl	24(%esp), %ebp
	movl	80(%esp), %edx
	movl	76(%esp), %eax
	addl	%esi, %ebp
	andl	$-4096, %esi
	shrl	$12, %ebp
	call	cap_get_capPtr
	orl	$1048576, %ebp
	movl	%ebp, %edx
	sall	$12, %edx
	movl	%edx, %ecx
	andl	$4194303, %edx
	shrl	$22, %ecx
	shrl	$8, %esi
	movl	(%eax,%ecx,4), %eax
	movl	%esi, %ebx
	sall	$8, %esi
	orl	$50331649, %ebx
	addl	$536870912, %esi
	shrl	$12, %edx
	orl	$7, %esi
	andl	$-4096, %eax
	movl	%esi, -536870912(%eax,%edx,4)
	call	invalidatePageStructureCache
	movl	ndks_boot+20, %edi
	jmp	.L1324
	.p2align 4,,7
	.p2align 3
.L1345:
	xorl	%ecx, %ecx
	jmp	.L1329
	.p2align 4,,7
	.p2align 3
.L1339:
	andl	$-1024, %ecx
	jmp	.L1329
	.p2align 4,,7
	.p2align 3
.L1340:
	andl	$16128, %ecx
	shrl	$8, %ecx
	cmpl	$32, %ecx
	je	.L1346
	addl	$1, %ecx
	movl	$-1, %eax
	sall	%cl, %eax
.L1341:
	andl	%esi, %eax
	movl	%eax, %ecx
	jmp	.L1329
	.p2align 4,,7
	.p2align 3
.L1338:
	andl	$2147483632, %ecx
	addl	%ecx, %ecx
	jmp	.L1329
	.p2align 4,,7
	.p2align 3
.L1328:
	call	halt
	.p2align 4,,7
	.p2align 3
.L1346:
	movl	$-16, %eax
	jmp	.L1341
.L1344:
	movl	%edx, %esi
	jmp	.L1322
	.cfi_endproc
.LFE409:
	.size	create_frames_of_region, .-create_frames_of_region
	.p2align 4,,15
	.globl	create_it_asid_pool
	.type	create_it_asid_pool, @function
create_it_asid_pool:
.LFB410:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %ebx
	call	alloc_region.constprop.155
	testl	%eax, %eax
	movl	%eax, %edx
	je	.L1370
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %esi
	jne	.L1371
.L1353:
	testl	$2, %edi
	jne	.L1372
.L1354:
	movl	%esi, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testl	$2, %esi
	rep stosl
	jne	.L1373
	andl	$1, %esi
	jne	.L1374
.L1356:
	andl	$-4096, %edx
	movl	20(%esp), %eax
	movl	%edx, %esi
	movl	24(%esp), %edx
	shrl	$8, %esi
	orl	$9, %esi
	call	cap_get_capPtr
	movl	24(%esp), %edx
	movl	%esi, 96(%eax)
	movl	$0, 100(%eax)
	movl	$0, 104(%eax)
	movl	$3, 108(%eax)
	movl	20(%esp), %eax
	call	cap_get_capPtr
	movl	%esi, (%ebx)
	movl	$0, 4(%ebx)
	movl	$7, 80(%eax)
	movl	$0, 84(%eax)
	movl	$0, 88(%eax)
	movl	$3, 92(%eax)
	movl	%ebx, %eax
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
	.p2align 4,,7
	.p2align 3
.L1374:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L1356
	.p2align 4,,7
	.p2align 3
.L1373:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %esi
	je	.L1356
	jmp	.L1374
	.p2align 4,,7
	.p2align 3
.L1370:
	movl	$0, (%ebx)
	movl	%ebx, %eax
	movl	$0, 4(%ebx)
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
	.p2align 4,,7
	.p2align 3
.L1372:
	.cfi_restore_state
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %esi
	jmp	.L1354
	.p2align 4,,7
	.p2align 3
.L1371:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$4095, %si
	jmp	.L1353
	.cfi_endproc
.LFE410:
	.size	create_it_asid_pool, .-create_it_asid_pool
	.p2align 4,,15
	.globl	create_untypeds
	.type	create_untypeds, @function
create_untypeds:
.LFB417:
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
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	movl	96(%esp), %eax
	movl	108(%esp), %edi
	movl	104(%esp), %ebx
	movl	%eax, 32(%esp)
	movl	100(%esp), %eax
	cmpl	%edi, %ebx
	movl	%eax, 36(%esp)
	movl	ndks_boot+20, %eax
	movl	%eax, 28(%esp)
	movl	%eax, %edx
	je	.L1376
	movl	$31, %ebp
	jmp	.L1380
	.p2align 4,,7
	.p2align 3
.L1377:
	movl	$1, %eax
	movl	%esi, %ecx
	sall	%cl, %eax
	addl	%eax, %ebx
	cmpl	%edi, %ebx
	je	.L1376
.L1380:
	movl	%edi, %eax
	movl	%ebp, %esi
	subl	%ebx, %eax
	bsrl	%eax, %eax
	xorl	$31, %eax
	subl	%eax, %esi
	rep bsfl	%ebx, %eax
	cmpl	%eax, %esi
	cmova	%eax, %esi
	movl	%edx, %eax
	subl	28(%esp), %eax
	cmpl	$166, %eax
	ja	.L1377
	movl	ndks_boot+16, %edx
	leal	536870912(%ebx), %ecx
	movl	%ecx, 56(%edx,%eax,4)
	movl	%esi, %ecx
	movb	%cl, 724(%edx,%eax)
	movl	%ebx, %eax
	movl	%esi, %edx
	andl	$-16, %eax
	andl	$31, %edx
	orl	$2, %eax
	movl	%eax, 8(%esp)
	movl	32(%esp), %eax
	movl	%edx, 12(%esp)
	movl	%eax, (%esp)
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	call	provide_cap
	testl	%eax, %eax
	je	.L1383
	movl	$1, %eax
	movl	%esi, %ecx
	movl	ndks_boot+20, %edx
	sall	%cl, %eax
	addl	%eax, %ebx
	cmpl	%edi, %ebx
	jne	.L1380
.L1376:
	movl	32(%esp), %eax
	movl	ndks_boot+16, %ebp
	movl	$ndks_boot, 52(%esp)
	movl	%eax, %edi
	andl	$14, %edi
	movl	%edi, 48(%esp)
	movl	%eax, %edi
	andl	$16128, %edi
	movl	%edi, 56(%esp)
	shrl	$8, 56(%esp)
	movl	%eax, 40(%esp)
	movl	56(%esp), %eax
	addl	$1, %eax
	movl	%eax, 60(%esp)
.L1403:
	movl	52(%esp), %edi
	movl	(%edi), %eax
	movl	4(%edi), %esi
	movl	$0, (%edi)
	movl	$0, 4(%edi)
	cmpl	%eax, %esi
	jne	.L1400
	jmp	.L1381
	.p2align 4,,7
	.p2align 3
.L1382:
	movl	$1, %edi
	movl	%ebx, %ecx
	sall	%cl, %edi
	addl	%edi, %eax
	cmpl	%esi, %eax
	je	.L1381
.L1400:
	movl	%esi, %ebx
	movl	$31, %ecx
	subl	%eax, %ebx
	bsrl	%ebx, %ebx
	xorl	$31, %ebx
	subl	%ebx, %ecx
	rep bsfl	%eax, %ebx
	cmpl	%ebx, %ecx
	cmovbe	%ecx, %ebx
	movl	%edx, %ecx
	subl	28(%esp), %ecx
	cmpl	$166, %ecx
	ja	.L1382
	leal	536870912(%eax), %edi
	movl	%edi, 56(%ebp,%ecx,4)
	movl	36(%esp), %edi
	cmpl	%edx, ndks_boot+24
	movb	%bl, 724(%ebp,%ecx)
	movl	%edi, 44(%esp)
	jbe	.L1383
	movl	40(%esp), %edi
	movl	%edi, %ecx
	andl	$15, %ecx
	movl	%ecx, 32(%esp)
	movl	%edi, %ecx
	cmpl	$14, 48(%esp)
	movzbl	%cl, %edi
	cmovne	32(%esp), %edi
	cmpl	$62, %edi
	movl	%edi, 32(%esp)
	ja	.L1386
	jmp	*.L1388(,%edi,4)
	.section	.rodata
	.align 4
	.align 4
.L1388:
	.long	.L1405
	.long	.L1395
	.long	.L1394
	.long	.L1395
	.long	.L1394
	.long	.L1395
	.long	.L1394
	.long	.L1405
	.long	.L1405
	.long	.L1395
	.long	.L1396
	.long	.L1405
	.long	.L1397
	.long	.L1386
	.long	.L1405
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1405
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1398
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1386
	.long	.L1405
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L1383:
	addl	$76, %esp
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
.L1395:
	.cfi_restore_state
	movl	40(%esp), %edi
	andl	$16777200, %edi
	sall	$8, %edi
.L1387:
	movl	%eax, %ecx
	sall	$4, %edx
	andl	$-16, %ecx
	addl	%edi, %edx
	orl	$2, %ecx
	movl	%ecx, (%edx)
	movl	%ebx, %ecx
	movl	$1, %edi
	andl	$31, %ecx
	movl	%ecx, 4(%edx)
	movl	%ebx, %ecx
	movl	$0, 8(%edx)
	sall	%cl, %edi
	movl	$3, 12(%edx)
	movl	ndks_boot+20, %edx
	addl	%edi, %eax
	addl	$1, %edx
	cmpl	%esi, %eax
	movl	%edx, ndks_boot+20
	jne	.L1400
.L1381:
	addl	$8, 52(%esp)
	cmpl	$ndks_boot+16, 52(%esp)
	jne	.L1403
	movl	28(%esp), %eax
	movl	%edx, 52(%ebp)
	movl	%eax, 48(%ebp)
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$1, %eax
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
.L1394:
	.cfi_restore_state
	movl	40(%esp), %edi
	andl	$-16, %edi
	jmp	.L1387
	.p2align 4,,7
	.p2align 3
.L1405:
	xorl	%edi, %edi
	jmp	.L1387
	.p2align 4,,7
	.p2align 3
.L1398:
	cmpl	$32, 56(%esp)
	je	.L1406
	movzbl	60(%esp), %ecx
	movl	$-1, %edi
	sall	%cl, %edi
.L1399:
	andl	44(%esp), %edi
	jmp	.L1387
	.p2align 4,,7
	.p2align 3
.L1397:
	movl	40(%esp), %edi
	andl	$-1024, %edi
	jmp	.L1387
	.p2align 4,,7
	.p2align 3
.L1396:
	movl	40(%esp), %edi
	andl	$2147483632, %edi
	addl	%edi, %edi
	jmp	.L1387
	.p2align 4,,7
	.p2align 3
.L1386:
	call	halt
.L1406:
	movl	$-16, %edi
	jmp	.L1399
	.cfi_endproc
.LFE417:
	.size	create_untypeds, .-create_untypeds
	.p2align 4,,15
	.globl	bi_finalise
	.type	bi_finalise, @function
bi_finalise:
.LFB418:
	.cfi_startproc
	movl	ndks_boot+24, %edx
	movl	ndks_boot+16, %eax
	movl	ndks_boot+20, %ecx
	movl	%edx, 20(%eax)
	movl	%ecx, 16(%eax)
	ret
	.cfi_endproc
.LFE418:
	.size	bi_finalise, .-bi_finalise
	.text
	.p2align 4,,15
	.globl	resolveAddressBits
	.type	resolveAddressBits, @function
resolveAddressBits:
.LFB426:
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
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movl	32(%esp), %ebp
	movl	28(%esp), %eax
	movl	36(%esp), %ecx
	movl	%ebp, %esi
	movl	%ebp, %edx
	andl	$14, %esi
	movl	%ebp, %ebx
	andl	$15, %edx
	movzbl	%bl, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %edx
	cmpl	$10, %edx
	jne	.L1427
	movl	44(%esp), %ebx
	movl	%ebp, 4(%esp)
	movl	%eax, 28(%esp)
.L1423:
	movl	%ecx, %edx
	movl	%ebx, %edi
	andl	$8126464, %edx
	movl	%ecx, %esi
	shrl	$18, %edx
	andl	$262143, %ecx
	subl	%edx, %edi
	movl	$1, %eax
	movl	%ecx, (%esp)
	movl	%edi, %ecx
	movl	40(%esp), %edi
	andl	$260046848, %esi
	shrl	$23, %esi
	leal	(%edx,%esi), %ebp
	shrl	%cl, %edi
	movl	%edx, %ecx
	sall	%cl, %eax
	movl	%eax, %ecx
	subl	$1, %ecx
	andl	%ecx, %edi
	cmpl	(%esp), %edi
	jne	.L1424
	cmpl	%edx, %ebx
	jb	.L1424
	cmpl	%ebp, %ebx
	jb	.L1428
	movl	40(%esp), %edx
	movl	%ebx, %edi
	movl	$1, %eax
	subl	%ebp, %edi
	movl	%edi, %ecx
	shrl	%cl, %edx
	movl	%esi, %ecx
	sall	%cl, %eax
	movl	4(%esp), %ecx
	movl	%eax, %esi
	subl	$1, %esi
	andl	%esi, %edx
	sall	$4, %edx
	andl	$2147483632, %ecx
	cmpl	%ebp, %ebx
	leal	(%edx,%ecx,2), %edx
	ja	.L1419
	movl	28(%esp), %eax
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	movl	$0, 8(%eax)
.L1411:
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
	ret	$4
.L1427:
	.cfi_restore_state
	movl	$0, current_lookup_fault
.L1426:
	movl	44(%esp), %ebx
	movl	$0, current_lookup_fault+4
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	movl	%ebx, 8(%eax)
	jmp	.L1411
.L1419:
	movl	(%edx), %eax
	movl	4(%edx), %ecx
	movl	%eax, %ebx
	andl	$14, %ebx
	cmpl	$14, %ebx
	movl	%eax, 4(%esp)
	je	.L1420
	movl	%eax, %ebx
	andl	$15, %ebx
.L1421:
	cmpl	$10, %ebx
	jne	.L1422
	movl	%edi, %ebx
	jmp	.L1423
.L1428:
	sall	$8, %ebp
	movl	28(%esp), %eax
	sall	$2, %ebx
	orl	%ebx, %ebp
	orl	$2, %ebp
	movl	%ebp, current_lookup_fault
	jmp	.L1426
.L1424:
	andl	$63, %ebx
	movl	28(%esp), %eax
	sall	$8, %ebx
	leal	3(,%edx,4), %edx
	orl	%ebx, %edx
	movl	(%esp), %ebx
	movl	%edx, current_lookup_fault
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	movl	%ebx, current_lookup_fault+4
	movl	44(%esp), %ebx
	movl	%ebx, 8(%eax)
	jmp	.L1411
.L1420:
	movzbl	4(%esp), %ebx
	jmp	.L1421
.L1422:
	movl	28(%esp), %eax
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	movl	%edi, 8(%eax)
	jmp	.L1411
	.cfi_endproc
.LFE426:
	.size	resolveAddressBits, .-resolveAddressBits
	.p2align 4,,15
	.globl	lookupSlot
	.type	lookupSlot, @function
lookupSlot:
.LFB421:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	andl	$-1024, %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	$32, 16(%esp)
	movl	%edx, %edi
	movl	16(%ebp), %edx
	movl	%eax, %esi
	leal	-24(%ebp), %eax
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, (%esp)
	movl	%edx, 12(%esp)
	call	resolveAddressBits
	movl	-24(%ebp), %eax
	movl	%eax, (%ebx)
	movl	-20(%ebp), %eax
	subl	$4, %esp
	movl	%eax, 4(%ebx)
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE421:
	.size	lookupSlot, .-lookupSlot
	.p2align 4,,15
	.globl	lookupSlotForCNodeOp
	.type	lookupSlotForCNodeOp, @function
lookupSlotForCNodeOp:
.LFB422:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	16(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	20(%ebp), %edi
	movl	%eax, %esi
	movl	%eax, %edx
	andl	$14, %esi
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %esi
	cmove	%ecx, %edx
	cmpl	$10, %edx
	jne	.L1440
	movl	28(%ebp), %ecx
	leal	-1(%ecx), %edx
	cmpl	$31, %edx
	ja	.L1441
	movl	%ecx, 16(%esp)
	movl	24(%ebp), %ecx
	leal	-24(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	movl	%edi, 8(%esp)
	movl	%ecx, 12(%esp)
	call	resolveAddressBits
	movl	-24(%ebp), %edx
	movl	-16(%ebp), %eax
	subl	$4, %esp
	testl	%edx, %edx
	jne	.L1442
	testl	%eax, %eax
	jne	.L1443
	movl	-20(%ebp), %eax
	movl	$0, (%ebx)
	movl	%eax, 4(%ebx)
.L1431:
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
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
.L1440:
	.cfi_restore_state
	movl	12(%ebp), %eax
	movl	$6, current_syscall_error+24
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
	movl	%eax, current_syscall_error+20
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	jmp	.L1431
.L1443:
	movl	12(%ebp), %edi
	sall	$2, %eax
	movzbl	%al, %eax
	orl	$2, %eax
	movl	$6, current_syscall_error+24
	movl	%edi, current_syscall_error+20
	movl	%eax, current_lookup_fault
	movl	$0, current_lookup_fault+4
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	jmp	.L1431
.L1442:
	movl	12(%ebp), %eax
	movl	$6, current_syscall_error+24
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	movl	%eax, current_syscall_error+20
	jmp	.L1431
.L1441:
	movl	$4, current_syscall_error+24
	movl	$1, current_syscall_error+8
	movl	$32, current_syscall_error+12
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	jmp	.L1431
	.cfi_endproc
.LFE422:
	.size	lookupSlotForCNodeOp, .-lookupSlotForCNodeOp
	.p2align 4,,15
	.globl	lookupSourceSlot
	.type	lookupSourceSlot, @function
lookupSourceSlot:
.LFB423:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$24, %esp
	.cfi_offset 3, -12
	movl	24(%ebp), %eax
	movl	8(%ebp), %ebx
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
	movl	%ebx, %eax
	movl	-4(%ebp), %ebx
	subl	$4, %esp
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE423:
	.size	lookupSourceSlot, .-lookupSourceSlot
	.p2align 4,,15
	.globl	lookupTargetSlot
	.type	lookupTargetSlot, @function
lookupTargetSlot:
.LFB424:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$24, %esp
	.cfi_offset 3, -12
	movl	24(%ebp), %eax
	movl	8(%ebp), %ebx
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
	movl	%ebx, %eax
	movl	-4(%ebp), %ebx
	subl	$4, %esp
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE424:
	.size	lookupTargetSlot, .-lookupTargetSlot
	.p2align 4,,15
	.globl	lookupPivotSlot
	.type	lookupPivotSlot, @function
lookupPivotSlot:
.LFB425:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$24, %esp
	.cfi_offset 3, -12
	movl	24(%ebp), %eax
	movl	8(%ebp), %ebx
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
	movl	%ebx, %eax
	movl	-4(%ebp), %ebx
	subl	$4, %esp
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE425:
	.size	lookupPivotSlot, .-lookupPivotSlot
	.p2align 4,,15
	.globl	lookupCap
	.type	lookupCap, @function
lookupCap:
.LFB419:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	andl	$-1024, %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	$32, 16(%esp)
	movl	%edx, %edi
	movl	16(%ebp), %edx
	movl	%eax, %esi
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	call	resolveAddressBits
	movl	-24(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	testl	%edx, %edx
	jne	.L1454
	movl	(%eax), %edx
	movl	4(%eax), %eax
	movl	$0, (%ebx)
	movl	%edx, 4(%ebx)
	movl	%eax, 8(%ebx)
.L1450:
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
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
.L1454:
	.cfi_restore_state
	movl	%edx, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	jmp	.L1450
	.cfi_endproc
.LFE419:
	.size	lookupCap, .-lookupCap
	.p2align 4,,15
	.globl	lookupCapAndSlot
	.type	lookupCapAndSlot, @function
lookupCapAndSlot:
.LFB420:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	andl	$-1024, %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	$32, 16(%esp)
	movl	%edx, %edi
	movl	16(%ebp), %edx
	movl	%eax, %esi
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	call	resolveAddressBits
	movl	-24(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	$4, %esp
	testl	%edx, %edx
	jne	.L1459
	movl	(%eax), %ecx
	movl	4(%eax), %edx
	movl	$0, (%ebx)
	movl	%eax, 12(%ebx)
	movl	%ecx, 4(%ebx)
	movl	%edx, 8(%ebx)
.L1455:
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
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
.L1459:
	.cfi_restore_state
	movl	%edx, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	jmp	.L1455
	.cfi_endproc
.LFE420:
	.size	lookupCapAndSlot, .-lookupCapAndSlot
	.p2align 4,,15
	.globl	doFaultTransfer
	.type	doFaultTransfer, @function
doFaultTransfer:
.LFB439:
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
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	40(%esp), %ebx
	movl	44(%esp), %ecx
	movl	604(%eax), %edx
	andl	$7, %edx
	cmpl	$2, %edx
	je	.L1462
	jbe	.L1485
	cmpl	$3, %edx
	je	.L1465
	cmpl	$4, %edx
	.p2align 4,,5
	jne	.L1461
	movl	44(%eax), %edx
	testl	%ecx, %ecx
	movl	%edx, 20(%ebx)
	movl	68(%eax), %edx
	movl	%edx, 24(%ebx)
	je	.L1468
	movl	64(%eax), %edx
	movl	%edx, 12(%ecx)
	movl	608(%eax), %edx
	movl	%edx, 16(%ecx)
	movl	604(%eax), %edx
	shrl	$3, %edx
	movl	%edx, 20(%ecx)
	movl	$5, %edx
	jmp	.L1474
	.p2align 4,,7
	.p2align 3
.L1465:
	movl	(%eax), %edx
	testl	%ecx, %ecx
	movl	%edx, 20(%ebx)
	movl	4(%eax), %edx
	movl	%edx, 24(%ebx)
	je	.L1468
	movl	8(%eax), %edx
	movl	%edx, 12(%ecx)
	movl	12(%eax), %edx
	movl	%edx, 16(%ecx)
	movl	16(%eax), %edx
	movl	%edx, 20(%ecx)
	movl	20(%eax), %edx
	movl	%edx, 24(%ecx)
	movl	24(%eax), %edx
	movl	%edx, 28(%ecx)
	movl	56(%eax), %edx
	movl	%edx, 32(%ecx)
	movl	68(%eax), %edx
	movl	%edx, 36(%ecx)
	movl	64(%eax), %edx
	movl	%edx, 40(%ecx)
	movl	608(%eax), %edx
	movl	%edx, 44(%ecx)
	movl	$11, %edx
	jmp	.L1474
	.p2align 4,,7
	.p2align 3
.L1485:
	cmpl	$1, %edx
	jne	.L1461
	movl	44(%eax), %edx
	testl	%ecx, %ecx
	movl	%edx, 20(%ebx)
	movl	608(%eax), %edx
	movl	%edx, 24(%ebx)
	je	.L1468
	movl	604(%eax), %edx
	shrl	$31, %edx
	movl	%edx, 12(%ecx)
	movl	612(%eax), %esi
	movl	616(%eax), %ebp
	movl	%esi, %edx
	andl	$3, %edx
	leal	1(%edx), %edi
	cmpl	$2, %edx
	movl	%edi, 16(%ecx)
	je	.L1471
	cmpl	$3, %edx
	je	.L1472
	cmpl	$1, %edx
	jne	.L1484
	andl	$252, %esi
	movb	$5, %dl
	shrl	$2, %esi
	movl	%esi, 20(%ecx)
	jmp	.L1474
	.p2align 4,,7
	.p2align 3
.L1461:
	call	halt
	.p2align 4,,7
	.p2align 3
.L1462:
	movl	44(%eax), %edx
	testl	%ecx, %ecx
	movl	%edx, 20(%ebx)
	movl	608(%eax), %edx
	movl	%edx, 24(%ebx)
	je	.L1468
	movl	604(%eax), %edx
	andl	$524288, %edx
	shrl	$19, %edx
	movl	%edx, 12(%ecx)
	movl	604(%eax), %edx
	shrl	$27, %edx
	movl	%edx, 16(%ecx)
.L1484:
	movl	$4, %edx
.L1474:
	movl	604(%eax), %eax
	andl	$7, %eax
	sall	$12, %eax
	orl	%edx, %eax
	movl	%eax, 16(%ebx)
	movl	32(%esp), %eax
	movl	%eax, 4(%ebx)
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
.L1468:
	.cfi_restore_state
	movl	$2, %edx
	jmp	.L1474
	.p2align 4,,7
	.p2align 3
.L1472:
	movl	%esi, %edx
	andl	$252, %esi
	andl	$16128, %edx
	shrl	$8, %edx
	shrl	$2, %esi
	movl	%edx, 20(%ecx)
	movl	$7, %edx
	movl	%ebp, 24(%ecx)
	movl	%esi, 28(%ecx)
	jmp	.L1474
	.p2align 4,,7
	.p2align 3
.L1471:
	movl	%esi, %edx
	andl	$16128, %esi
	andl	$252, %edx
	shrl	$2, %edx
	shrl	$8, %esi
	movl	%edx, 20(%ecx)
	movl	$6, %edx
	movl	%esi, 24(%ecx)
	jmp	.L1474
	.cfi_endproc
.LFE439:
	.size	doFaultTransfer, .-doFaultTransfer
	.p2align 4,,15
	.globl	doAsyncTransfer
	.type	doAsyncTransfer, @function
doAsyncTransfer:
.LFB441:
	.cfi_startproc
	movl	12(%esp), %eax
	movl	8(%esp), %edx
	movl	$1, 16(%eax)
	movl	%edx, 20(%eax)
	movl	4(%esp), %edx
	movl	%edx, 4(%eax)
	ret
	.cfi_endproc
.LFE441:
	.size	doAsyncTransfer, .-doAsyncTransfer
	.p2align 4,,15
	.globl	switchToThread
	.type	switchToThread, @function
switchToThread:
.LFB445:
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
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movl	28(%esp), %ebx
	movl	%ebx, (%esp)
	call	Arch_switchToThread
	movl	600(%ebx), %edx
	testb	$1, %dl
	je	.L1488
	movl	620(%ebx), %eax
	sall	$8, %eax
	addl	624(%ebx), %eax
	leal	ksReadyQueues(,%eax,8), %esi
	movl	ksReadyQueues(,%eax,8), %ebp
	movl	4(%esi), %ecx
	movl	%ecx, 4(%esp)
	movl	644(%ebx), %ecx
	testl	%ecx, %ecx
	je	.L1489
	movl	640(%ebx), %edi
	movl	%edi, 640(%ecx)
	movl	640(%ebx), %edi
.L1490:
	testl	%edi, %edi
	je	.L1492
	movl	%ecx, 644(%edi)
.L1491:
	movl	%ebp, ksReadyQueues(,%eax,8)
	movl	4(%esp), %eax
	andl	$-2, %edx
	movl	%eax, 4(%esi)
	movl	%edx, 600(%ebx)
.L1488:
	movl	%ebx, ksCurThread
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
	.p2align 4,,7
	.p2align 3
.L1489:
	.cfi_restore_state
	movl	640(%ebx), %ebp
	movl	%ebp, %edi
	jmp	.L1490
	.p2align 4,,7
	.p2align 3
.L1492:
	movl	%ecx, 4(%esp)
	jmp	.L1491
	.cfi_endproc
.LFE445:
	.size	switchToThread, .-switchToThread
	.p2align 4,,15
	.globl	switchToIdleThread
	.type	switchToIdleThread, @function
switchToIdleThread:
.LFB446:
	.cfi_startproc
	movl	ksIdleThread, %eax
	movl	%eax, ksCurThread
	ret
	.cfi_endproc
.LFE446:
	.size	switchToIdleThread, .-switchToIdleThread
	.p2align 4,,15
	.globl	rescheduleRequired
	.type	rescheduleRequired, @function
rescheduleRequired:
.LFB455:
	.cfi_startproc
	movl	ksSchedulerAction, %eax
	leal	-1(%eax), %edx
	cmpl	$-3, %edx
	jbe	.L1504
.L1503:
	movl	$-1, ksSchedulerAction
	ret
	.p2align 4,,7
	.p2align 3
.L1504:
	movl	600(%eax), %ecx
	testb	$1, %cl
	jne	.L1503
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
	movl	4(%esi), %ebx
	testl	%ebx, %ebx
	je	.L1501
	movl	%eax, 644(%edi)
.L1500:
	orl	$1, %ecx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	$-1, ksSchedulerAction
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ebx, 4(%esi)
	movl	%ecx, 600(%eax)
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
.L1501:
	.cfi_restore_state
	movl	%eax, %ebx
	jmp	.L1500
	.cfi_endproc
.LFE455:
	.size	rescheduleRequired, .-rescheduleRequired
	.p2align 4,,15
	.globl	scheduleTCB
	.type	scheduleTCB, @function
scheduleTCB:
.LFB453:
	.cfi_startproc
	movl	4(%esp), %eax
	cmpl	ksCurThread, %eax
	je	.L1508
.L1505:
	rep ret
	.p2align 4,,7
	.p2align 3
.L1508:
	movl	ksSchedulerAction, %edx
	testl	%edx, %edx
	jne	.L1505
	movl	592(%eax), %eax
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L1505
	jmp	rescheduleRequired
	.cfi_endproc
.LFE453:
	.size	scheduleTCB, .-scheduleTCB
	.p2align 4,,15
	.globl	decodeIA32PortInvocation
	.type	decodeIA32PortInvocation, @function
decodeIA32PortInvocation:
.LFB379:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	52(%esp), %edx
	testl	%eax, %eax
	jne	.L1510
.L1527:
	movl	$7, current_syscall_error+24
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	$3, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1510:
	.cfi_restore_state
	movl	32(%esp), %ecx
	movl	ksCurThread, %esi
	subl	$36, %ecx
	cmpl	$5, %ecx
	movl	20(%esi), %ebx
	ja	.L1512
	jmp	*.L1514(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L1514:
	.long	.L1513
	.long	.L1515
	.long	.L1516
	.long	.L1517
	.long	.L1518
	.long	.L1519
	.text
	.p2align 4,,7
	.p2align 3
.L1512:
	movl	$3, current_syscall_error+24
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	$3, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1518:
	.cfi_restore_state
	movzwl	%bx, %eax
	movzwl	%dx, %esi
	leal	1(%eax), %ecx
	cmpl	%ecx, %esi
	jb	.L1512
	shrl	$16, %edx
	cmpl	%edx, %eax
	jb	.L1512
	shrl	$16, %ebx
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	out16
.L1530:
	movl	ksCurThread, %edx
	xorl	%eax, %eax
.L1531:
	movl	%eax, 16(%edx)
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	addl	$20, %esp
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
.L1519:
	.cfi_restore_state
	cmpl	$1, %eax
	jbe	.L1527
	movzwl	%bx, %ebx
	movzwl	%dx, %ecx
	leal	3(%ebx), %eax
	cmpl	%eax, %ecx
	jb	.L1512
	shrl	$16, %edx
	cmpl	%edx, %ebx
	jb	.L1512
	movl	24(%esi), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	out32
	jmp	.L1530
	.p2align 4,,7
	.p2align 3
.L1513:
	cmpw	%bx, %dx
	movzwl	%bx, %eax
	jb	.L1512
	shrl	$16, %edx
	cmpl	%edx, %eax
	jb	.L1512
	movl	%eax, (%esp)
	call	in8
	movzbl	%al, %eax
.L1529:
	movl	ksCurThread, %edx
	movl	%eax, 20(%edx)
	movl	$1, %eax
	movl	$0, 4(%edx)
	jmp	.L1531
	.p2align 4,,7
	.p2align 3
.L1515:
	movzwl	%bx, %ebx
	movzwl	%dx, %ecx
	leal	1(%ebx), %eax
	cmpl	%eax, %ecx
	jb	.L1512
	shrl	$16, %edx
	cmpl	%edx, %ebx
	jb	.L1512
	movl	%ebx, (%esp)
	call	in16
	movzwl	%ax, %eax
	jmp	.L1529
	.p2align 4,,7
	.p2align 3
.L1516:
	movzwl	%bx, %ebx
	movzwl	%dx, %ecx
	leal	3(%ebx), %eax
	cmpl	%eax, %ecx
	jb	.L1512
	shrl	$16, %edx
	cmpl	%edx, %ebx
	jb	.L1512
	movl	%ebx, (%esp)
	call	in32
	jmp	.L1529
	.p2align 4,,7
	.p2align 3
.L1517:
	cmpw	%bx, %dx
	movzwl	%bx, %eax
	jb	.L1512
	shrl	$16, %edx
	cmpl	%edx, %eax
	jb	.L1512
	shrl	$16, %ebx
	movzbl	%bl, %ebx
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	out8
	jmp	.L1530
	.cfi_endproc
.LFE379:
	.size	decodeIA32PortInvocation, .-decodeIA32PortInvocation
	.p2align 4,,15
	.globl	activateThread
	.type	activateThread, @function
activateThread:
.LFB433:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L1541
	cmpl	$7, %edx
	je	.L1539
	cmpl	$1, %edx
	je	.L1539
	.p2align 4,,5
	call	halt
	.p2align 4,,7
	.p2align 3
.L1541:
	movl	44(%eax), %edx
	andl	$-16, %ecx
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
	movl	%edx, 56(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
.L1539:
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE433:
	.size	activateThread, .-activateThread
	.section	.boot.text
	.p2align 4,,15
	.globl	create_idle_thread
	.type	create_idle_thread, @function
create_idle_thread:
.LFB411:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	$10, (%esp)
	call	alloc_region
	movl	%eax, %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L1552
	testb	$1, %dl
	movl	%edx, %edi
	movl	$1024, %ebx
	jne	.L1572
.L1553:
	testl	$2, %edi
	jne	.L1573
.L1554:
	movl	%ebx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %bl
	rep stosl
	jne	.L1574
	andl	$1, %ebx
	jne	.L1575
.L1556:
	leal	256(%edx), %eax
	movl	$514, 320(%edx)
	movl	$idle_thread, 312(%edx)
	movl	$8, 316(%edx)
	movl	$16, 284(%edx)
	movl	$16, 288(%edx)
	movl	$16, 292(%edx)
	movl	$16, 296(%edx)
	movl	$16, 328(%edx)
	movl	848(%edx), %edx
	movl	%eax, ksIdleThread
	andl	$-16, %edx
	orl	$7, %edx
	movl	%edx, 592(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
	movl	$1, %eax
.L1552:
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1575:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L1556
	.p2align 4,,7
	.p2align 3
.L1574:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %ebx
	je	.L1556
	jmp	.L1575
	.p2align 4,,7
	.p2align 3
.L1573:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %ebx
	jmp	.L1554
	.p2align 4,,7
	.p2align 3
.L1572:
	movb	$0, (%edx)
	leal	1(%edx), %edi
	movw	$1023, %bx
	jmp	.L1553
	.cfi_endproc
.LFE411:
	.size	create_idle_thread, .-create_idle_thread
	.text
	.p2align 4,,15
	.globl	setDomain
	.type	setDomain, @function
setDomain:
.LFB447:
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
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movl	28(%esp), %eax
	movl	32(%esp), %esi
	movl	600(%eax), %ecx
	testb	$1, %cl
	movl	%ecx, %ebx
	je	.L1577
	movl	620(%eax), %edx
	movl	640(%eax), %ebp
	sall	$8, %edx
	addl	624(%eax), %edx
	movl	ksReadyQueues(,%edx,8), %ebx
	leal	ksReadyQueues(,%edx,8), %edi
	movl	%ebx, (%esp)
	movl	4(%edi), %ebx
	movl	%ebx, 4(%esp)
	movl	644(%eax), %ebx
	testl	%ebx, %ebx
	je	.L1578
	movl	%ebp, 640(%ebx)
	movl	640(%eax), %ebp
.L1579:
	testl	%ebp, %ebp
	je	.L1587
	movl	%ebx, 644(%ebp)
.L1580:
	movl	(%esp), %ebx
	andl	$-2, %ecx
	movl	%ebx, ksReadyQueues(,%edx,8)
	movl	4(%esp), %edx
	movl	%ecx, %ebx
	movl	%edx, 4(%edi)
	movl	%ecx, 600(%eax)
.L1577:
	movl	592(%eax), %edx
	movl	%esi, 620(%eax)
	andl	$15, %edx
	subl	$1, %edx
	cmpl	$1, %edx
	ja	.L1581
	testb	$1, %bl
	jne	.L1581
	sall	$8, %esi
	addl	624(%eax), %esi
	leal	ksReadyQueues(,%esi,8), %ecx
	movl	ksReadyQueues(,%esi,8), %edi
	movl	4(%ecx), %edx
	testl	%edx, %edx
	je	.L1588
	movl	%eax, 644(%edi)
.L1583:
	orl	$1, %ebx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%esi,8)
	movl	%edx, 4(%ecx)
	movl	%ebx, 600(%eax)
.L1581:
	cmpl	ksCurThread, %eax
	je	.L1592
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
	.p2align 4,,7
	.p2align 3
.L1592:
	.cfi_restore_state
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
	jmp	rescheduleRequired
	.p2align 4,,7
	.p2align 3
.L1578:
	.cfi_restore_state
	movl	%ebp, (%esp)
	jmp	.L1579
	.p2align 4,,7
	.p2align 3
.L1587:
	movl	%ebx, 4(%esp)
	jmp	.L1580
	.p2align 4,,7
	.p2align 3
.L1588:
	movl	%eax, %edx
	jmp	.L1583
	.cfi_endproc
.LFE447:
	.size	setDomain, .-setDomain
	.p2align 4,,15
	.globl	setPriority
	.type	setPriority, @function
setPriority:
.LFB448:
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
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movl	28(%esp), %eax
	movl	32(%esp), %esi
	movl	600(%eax), %ecx
	testb	$1, %cl
	movl	%ecx, %ebx
	je	.L1594
	movl	620(%eax), %edx
	movl	640(%eax), %ebp
	sall	$8, %edx
	addl	624(%eax), %edx
	movl	ksReadyQueues(,%edx,8), %ebx
	leal	ksReadyQueues(,%edx,8), %edi
	movl	%ebx, (%esp)
	movl	4(%edi), %ebx
	movl	%ebx, 4(%esp)
	movl	644(%eax), %ebx
	testl	%ebx, %ebx
	je	.L1595
	movl	%ebp, 640(%ebx)
	movl	640(%eax), %ebp
.L1596:
	testl	%ebp, %ebp
	je	.L1604
	movl	%ebx, 644(%ebp)
.L1597:
	movl	(%esp), %ebx
	andl	$-2, %ecx
	movl	%ebx, ksReadyQueues(,%edx,8)
	movl	4(%esp), %edx
	movl	%ecx, %ebx
	movl	%edx, 4(%edi)
	movl	%ecx, 600(%eax)
.L1594:
	movl	592(%eax), %edx
	movl	%esi, 624(%eax)
	andl	$15, %edx
	subl	$1, %edx
	cmpl	$1, %edx
	ja	.L1598
	testb	$1, %bl
	jne	.L1598
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	%edx, %esi
	leal	ksReadyQueues(,%esi,8), %ecx
	movl	ksReadyQueues(,%esi,8), %edi
	movl	4(%ecx), %edx
	testl	%edx, %edx
	je	.L1605
	movl	%eax, 644(%edi)
.L1600:
	orl	$1, %ebx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%esi,8)
	movl	%edx, 4(%ecx)
	movl	%ebx, 600(%eax)
.L1598:
	cmpl	ksCurThread, %eax
	je	.L1609
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
	.p2align 4,,7
	.p2align 3
.L1609:
	.cfi_restore_state
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
	jmp	rescheduleRequired
	.p2align 4,,7
	.p2align 3
.L1595:
	.cfi_restore_state
	movl	%ebp, (%esp)
	jmp	.L1596
	.p2align 4,,7
	.p2align 3
.L1604:
	movl	%ebx, 4(%esp)
	jmp	.L1597
	.p2align 4,,7
	.p2align 3
.L1605:
	movl	%eax, %edx
	jmp	.L1600
	.cfi_endproc
.LFE448:
	.size	setPriority, .-setPriority
	.p2align 4,,15
	.globl	handleDoubleFault
	.type	handleDoubleFault, @function
handleDoubleFault:
.LFB429:
	.cfi_startproc
	movl	4(%esp), %eax
	andl	$-16, 592(%eax)
	cmpl	ksCurThread, %eax
	je	.L1612
.L1610:
	rep ret
	.p2align 4,,7
	.p2align 3
.L1612:
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L1610
	jmp	rescheduleRequired
	.cfi_endproc
.LFE429:
	.size	handleDoubleFault, .-handleDoubleFault
	.p2align 4,,15
	.globl	setThreadState
	.type	setThreadState, @function
setThreadState:
.LFB452:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	8(%esp), %ecx
	movl	592(%edx), %eax
	andl	$15, %ecx
	andl	$-16, %eax
	orl	%ecx, %eax
	cmpl	ksCurThread, %edx
	movl	%eax, 592(%edx)
	je	.L1616
.L1613:
	rep ret
	.p2align 4,,7
	.p2align 3
.L1616:
	movl	ksSchedulerAction, %edx
	testl	%edx, %edx
	jne	.L1613
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L1613
	jmp	rescheduleRequired
	.cfi_endproc
.LFE452:
	.size	setThreadState, .-setThreadState
	.section	.boot.text
	.p2align 4,,15
	.globl	configureIdleThread
	.type	configureIdleThread, @function
configureIdleThread:
.LFB432:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	592(%eax), %edx
	movl	$514, 64(%eax)
	movl	$idle_thread, 56(%eax)
	movl	$8, 60(%eax)
	andl	$-16, %edx
	orl	$7, %edx
	cmpl	ksCurThread, %eax
	movl	$16, 28(%eax)
	movl	$16, 32(%eax)
	movl	$16, 36(%eax)
	movl	$16, 40(%eax)
	movl	$16, 72(%eax)
	movl	%edx, 592(%eax)
	je	.L1620
.L1617:
	rep ret
	.p2align 4,,7
	.p2align 3
.L1620:
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L1617
	jmp	rescheduleRequired
	.cfi_endproc
.LFE432:
	.size	configureIdleThread, .-configureIdleThread
	.text
	.p2align 4,,15
	.globl	preemptionPoint
	.type	preemptionPoint, @function
preemptionPoint:
.LFB456:
	.cfi_startproc
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	cmpl	$99, %eax
	ja	.L1622
	movl	%eax, ksWorkUnitsCompleted
	xorl	%eax, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L1622:
	movl	$0, ksWorkUnitsCompleted
	movl	-65008, %eax
	testl	%eax, %eax
	jne	.L1631
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
	movl	$32, (%esp)
	call	in8
	testb	%al, %al
	je	.L1632
	movl	$4, %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1632:
	.cfi_restore_state
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1631:
	movl	$4, %eax
	ret
	.cfi_endproc
.LFE456:
	.size	preemptionPoint, .-preemptionPoint
	.p2align 4,,15
	.globl	receiveAsyncIPC
	.type	receiveAsyncIPC, @function
receiveAsyncIPC:
.LFB460:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	movl	24(%esp), %ebx
	movl	20(%esp), %esi
	andl	$-16, %ebx
	movl	(%ebx), %eax
	andl	$3, %eax
	cmpl	$1, %eax
	jbe	.L1635
	cmpl	$2, %eax
	jne	.L1633
	movl	12(%ebx), %edx
	movl	8(%ebx), %eax
	movl	$1, 16(%esi)
	movl	%edx, 20(%esi)
	movl	%eax, 4(%esi)
	andl	$-4, (%ebx)
.L1633:
	addl	$4, %esp
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
.L1635:
	.cfi_restore_state
	movl	%ebx, %eax
	orl	$6, %eax
	movl	%eax, 592(%esi)
	movl	%esi, (%esp)
	call	scheduleTCB
	movl	4(%ebx), %ecx
	movl	(%ebx), %eax
	movl	%ecx, %edx
	movl	%eax, %edi
	andl	$-16, %edi
	andl	$-16, %edx
	je	.L1638
	movl	%esi, 648(%edi)
.L1637:
	movl	%edi, 652(%esi)
	andl	$12, %eax
	andl	$-16, %edx
	movl	$0, 648(%esi)
	andl	$-16, %esi
	andl	$15, %ecx
	orl	%esi, %eax
	orl	%ecx, %edx
	orl	$1, %eax
	movl	%edx, 4(%ebx)
	movl	%eax, (%ebx)
	addl	$4, %esp
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
.L1638:
	.cfi_restore_state
	movl	%esi, %edx
	jmp	.L1637
	.cfi_endproc
.LFE460:
	.size	receiveAsyncIPC, .-receiveAsyncIPC
	.p2align 4,,15
	.globl	aepCancelAll
	.type	aepCancelAll, @function
aepCancelAll:
.LFB461:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %edx
	movl	(%edx), %ecx
	movl	%ecx, %eax
	andl	$3, %eax
	cmpl	$1, %eax
	je	.L1657
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
.L1657:
	.cfi_restore_state
	movl	4(%edx), %eax
	andl	$12, %ecx
	movl	%ecx, (%edx)
	movl	%eax, %ebx
	andl	$15, %ebx
	andl	$-16, %eax
	movl	%ebx, 4(%edx)
	jne	.L1654
	jmp	.L1647
	.p2align 4,,7
	.p2align 3
.L1658:
	movl	%eax, 644(%edi)
.L1646:
	orl	$1, %ecx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ebx, 4(%esi)
	movl	%ecx, 600(%eax)
.L1645:
	movl	648(%eax), %eax
	testl	%eax, %eax
	je	.L1647
.L1654:
	movl	592(%eax), %edx
	movl	600(%eax), %ecx
	andl	$-16, %edx
	orl	$2, %edx
	testb	$1, %cl
	movl	%edx, 592(%eax)
	jne	.L1645
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
	movl	4(%esi), %ebx
	testl	%ebx, %ebx
	jne	.L1658
	movl	%eax, %ebx
	jmp	.L1646
	.p2align 4,,7
	.p2align 3
.L1647:
	movl	ksSchedulerAction, %eax
	leal	-1(%eax), %edx
	cmpl	$-3, %edx
	jbe	.L1659
.L1644:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	movl	$-1, ksSchedulerAction
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1659:
	.cfi_restore_state
	movl	600(%eax), %ecx
	testb	$1, %cl
	jne	.L1644
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
	movl	4(%esi), %ebx
	testl	%ebx, %ebx
	je	.L1651
	movl	%eax, 644(%edi)
.L1649:
	orl	$1, %ecx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ebx, 4(%esi)
	movl	%ecx, 600(%eax)
	jmp	.L1644
.L1651:
	movl	%eax, %ebx
	jmp	.L1649
	.cfi_endproc
.LFE461:
	.size	aepCancelAll, .-aepCancelAll
	.p2align 4,,15
	.globl	asyncIPCCancel
	.type	asyncIPCCancel, @function
asyncIPCCancel:
.LFB462:
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
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	28(%esp), %edx
	movl	24(%esp), %eax
	movl	(%edx), %esi
	movl	4(%edx), %edi
	movl	%esi, %ecx
	andl	$-16, %ecx
	movl	%edi, %ebx
	movl	%ecx, (%esp)
	movl	652(%eax), %ecx
	andl	$-16, %ebx
	testl	%ecx, %ecx
	je	.L1661
	movl	648(%eax), %ebp
	movl	%ebp, 648(%ecx)
	movl	648(%eax), %ebp
	testl	%ebp, %ebp
	je	.L1667
.L1671:
	movl	%ecx, 652(%ebp)
.L1663:
	movl	%ebx, %ecx
	andl	$15, %edi
	andl	$-16, %ecx
	andl	$15, %esi
	orl	%edi, %ecx
	movl	%ecx, 4(%edx)
	movl	(%esp), %ecx
	andl	$-16, %ecx
	orl	%esi, %ecx
	testl	%ebx, %ebx
	je	.L1664
.L1669:
	movl	%ecx, (%edx)
	andl	$-16, 592(%eax)
	cmpl	ksCurThread, %eax
	je	.L1670
.L1660:
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
	.p2align 4,,7
	.p2align 3
.L1664:
	.cfi_restore_state
	andl	$-4, %ecx
	jmp	.L1669
	.p2align 4,,7
	.p2align 3
.L1670:
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L1660
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
	jmp	rescheduleRequired
	.p2align 4,,7
	.p2align 3
.L1661:
	.cfi_restore_state
	movl	648(%eax), %ebx
	movl	%ebx, %ebp
	testl	%ebp, %ebp
	jne	.L1671
	.p2align 4,,7
	.p2align 3
.L1667:
	movl	%ecx, (%esp)
	jmp	.L1663
	.cfi_endproc
.LFE462:
	.size	asyncIPCCancel, .-asyncIPCCancel
	.p2align 4,,15
	.globl	invokeCNodeMove
	.type	invokeCNodeMove, @function
invokeCNodeMove:
.LFB468:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	24(%esp), %ecx
	movl	28(%esp), %ebx
	movl	16(%esp), %eax
	movl	20(%esp), %edx
	movl	8(%ecx), %edi
	movl	12(%ecx), %esi
	movl	%eax, (%ebx)
	movl	%edx, 4(%ebx)
	movl	$0, (%ecx)
	movl	$0, 4(%ecx)
	movl	%edi, 8(%ebx)
	andl	$-8, %edi
	movl	%esi, 12(%ebx)
	movl	$0, 8(%ecx)
	movl	$0, 12(%ecx)
	je	.L1673
	movl	12(%edi), %eax
	movl	%ebx, %edx
	andl	$-8, %edx
	andl	$7, %eax
	orl	%edx, %eax
	movl	%eax, 12(%edi)
.L1673:
	andl	$-8, %esi
	je	.L1674
	movl	8(%esi), %eax
	andl	$-8, %ebx
	andl	$7, %eax
	orl	%ebx, %eax
	movl	%eax, 8(%esi)
.L1674:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE468:
	.size	invokeCNodeMove, .-invokeCNodeMove
	.p2align 4,,15
	.globl	invokeCNodeSaveCaller
	.type	invokeCNodeSaveCaller, @function
invokeCNodeSaveCaller:
.LFB470:
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
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	ksCurThread, %eax
	andl	$-1024, %eax
	movl	48(%eax), %ecx
	leal	48(%eax), %ebx
	movl	52(%eax), %ebp
	movl	%ecx, %edi
	movl	%ecx, %edx
	andl	$14, %edi
	andl	$15, %edx
	movzbl	%cl, %esi
	cmpl	$14, %edi
	cmove	%esi, %edx
	testl	%edx, %edx
	je	.L1686
	cmpl	$8, %edx
	jne	.L1700
	testl	$1, %ebp
	je	.L1702
.L1686:
	addl	$12, %esp
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
.L1700:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L1702:
	movl	56(%eax), %esi
	movl	32(%esp), %edi
	movl	60(%eax), %edx
	movl	%ecx, (%edi)
	movl	%edi, %ecx
	movl	%ebp, 4(%edi)
	movl	$0, 48(%eax)
	movl	$0, 52(%eax)
	movl	%esi, 8(%edi)
	andl	$-8, %esi
	movl	%edx, 12(%edi)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	jne	.L1703
.L1689:
	andl	$-8, %edx
	je	.L1686
	movl	8(%edx), %eax
	movl	32(%esp), %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	orl	%ecx, %eax
	movl	%eax, 8(%edx)
	jmp	.L1686
	.p2align 4,,7
	.p2align 3
.L1703:
	movl	12(%esi), %eax
	andl	$-8, %ecx
	andl	$7, %eax
	orl	%ecx, %eax
	movl	%eax, 12(%esi)
	jmp	.L1689
	.cfi_endproc
.LFE470:
	.size	invokeCNodeSaveCaller, .-invokeCNodeSaveCaller
	.p2align 4,,15
	.globl	cteInsert
	.type	cteInsert, @function
cteInsert:
.LFB472:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	52(%esp), %eax
	movl	48(%esp), %ebx
	movl	60(%esp), %esi
	movl	%eax, 4(%esp)
	movl	56(%esp), %eax
	movl	%ebx, %edx
	andl	$15, %edx
	movl	4(%eax), %ecx
	movl	12(%eax), %edi
	movl	%ecx, 20(%esp)
	movl	%ebx, %ecx
	andl	$14, %ecx
	movl	%ecx, %ebp
	movl	%edi, 16(%esp)
	movl	8(%eax), %edi
	cmpl	$14, %ebp
	movl	%ecx, 24(%esp)
	movzbl	%bl, %ecx
	cmove	%ecx, %edx
	cmpl	$4, %edx
	movl	%edi, 12(%esp)
	movl	(%eax), %edi
	je	.L1711
	jbe	.L1726
	cmpl	$6, %edx
	je	.L1711
	cmpl	$30, %edx
	.p2align 4,,5
	jne	.L1707
	movl	%edi, %ecx
	movl	%edi, %edx
	andl	$14, %ecx
	andl	$15, %edx
	movl	%ecx, %ebp
	movl	%ecx, 8(%esp)
	movl	%edi, %ecx
	cmpl	$14, %ebp
	movzbl	%cl, %ecx
	cmove	%ecx, %edx
	cmpl	$14, %edx
	sete	%dl
	movzbl	%dl, %edx
	leal	(%edx,%edx), %ecx
	movl	%edx, %ebp
	andl	$2, %ecx
.L1713:
	movl	%eax, %edx
	andl	$-8, %edx
	movl	%edx, (%esp)
	movl	12(%esp), %edx
	andl	$7, %edx
	orl	%edx, (%esp)
	movl	16(%esp), %edx
	andl	$-4, %edx
	orl	%ecx, %edx
	movl	%edi, %ecx
	andl	$15, %ecx
	orl	%ebp, %edx
	movl	%ecx, 12(%esp)
	movl	%edi, %ecx
	cmpl	$14, 8(%esp)
	movzbl	%cl, %ebp
	cmovne	12(%esp), %ebp
	cmpl	$2, %ebp
	je	.L1727
.L1718:
	movl	%ebx, (%esi)
	movl	(%esp), %edi
	movl	4(%esp), %ebx
	movl	%edx, 12(%esi)
	movl	%edi, 8(%esi)
	movl	%ebx, 4(%esi)
	movl	12(%eax), %ecx
	andl	$-8, %esi
	andl	$7, %ecx
	orl	%esi, %ecx
	andl	$-8, %edx
	movl	%ecx, 12(%eax)
	je	.L1704
	movl	8(%edx), %eax
	andl	$7, %eax
	orl	%esi, %eax
	movl	%eax, 8(%edx)
.L1704:
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
	.p2align 4,,7
	.p2align 3
.L1711:
	.cfi_restore_state
	movl	4(%esp), %ecx
	movl	20(%esp), %edx
	shrl	$3, %ecx
	shrl	$3, %edx
	cmpl	%edx, %ecx
	setne	%cl
	movzbl	%cl, %ecx
	movl	%ecx, %ebp
	movl	%edi, %ecx
	andl	$14, %ecx
	movl	%ecx, 8(%esp)
	leal	(%ebp,%ebp), %ecx
	andl	$2, %ecx
	jmp	.L1713
	.p2align 4,,7
	.p2align 3
.L1727:
	movl	%ebx, %ecx
	movzbl	%bl, %ebp
	andl	$15, %ecx
	cmpl	$14, 24(%esp)
	cmove	%ebp, %ecx
	cmpl	$2, %ecx
	jne	.L1718
	movl	%ebx, %ecx
	andl	$-16, %edi
	andl	$-16, %ecx
	cmpl	%ecx, %edi
	jne	.L1718
	movl	4(%esp), %ebp
	movl	20(%esp), %ecx
	andl	$31, %ebp
	andl	$31, %ecx
	cmpl	%ecx, %ebp
	jne	.L1718
	leal	-4(%ebp), %ecx
	movl	$32, %edi
	sall	%cl, %edi
	orl	%ebp, %edi
	movl	%edi, 4(%eax)
	jmp	.L1718
	.p2align 4,,7
	.p2align 3
.L1726:
	cmpl	$2, %edx
	jne	.L1707
	movl	%edi, %ecx
	movl	$1, %ebp
	andl	$14, %ecx
	movl	%ecx, 8(%esp)
	movl	$2, %ecx
	jmp	.L1713
	.p2align 4,,7
	.p2align 3
.L1707:
	movl	%edi, %ecx
	xorl	%ebp, %ebp
	andl	$14, %ecx
	movl	%ecx, 8(%esp)
	xorl	%ecx, %ecx
	jmp	.L1713
	.cfi_endproc
.LFE472:
	.size	cteInsert, .-cteInsert
	.p2align 4,,15
	.globl	invokeCNodeInsert
	.type	invokeCNodeInsert, @function
invokeCNodeInsert:
.LFB467:
	.cfi_startproc
	subl	$16, %esp
	.cfi_def_cfa_offset 20
	movl	32(%esp), %eax
	movl	24(%esp), %edx
	movl	%eax, 12(%esp)
	movl	28(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, 8(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	call	cteInsert
	xorl	%eax, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE467:
	.size	invokeCNodeInsert, .-invokeCNodeInsert
	.p2align 4,,15
	.globl	cteMove
	.type	cteMove, @function
cteMove:
.LFB473:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	24(%esp), %ecx
	movl	28(%esp), %ebx
	movl	16(%esp), %eax
	movl	20(%esp), %edx
	movl	8(%ecx), %edi
	movl	12(%ecx), %esi
	movl	%eax, (%ebx)
	movl	%edx, 4(%ebx)
	movl	$0, (%ecx)
	movl	$0, 4(%ecx)
	movl	%edi, 8(%ebx)
	andl	$-8, %edi
	movl	%esi, 12(%ebx)
	movl	$0, 8(%ecx)
	movl	$0, 12(%ecx)
	je	.L1731
	movl	12(%edi), %eax
	movl	%ebx, %edx
	andl	$-8, %edx
	andl	$7, %eax
	orl	%edx, %eax
	movl	%eax, 12(%edi)
.L1731:
	andl	$-8, %esi
	je	.L1730
	movl	8(%esi), %eax
	andl	$-8, %ebx
	andl	$7, %eax
	orl	%ebx, %eax
	movl	%eax, 8(%esi)
.L1730:
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
	.cfi_endproc
.LFE473:
	.size	cteMove, .-cteMove
	.p2align 4,,15
	.globl	capSwapForDelete
	.type	capSwapForDelete, @function
capSwapForDelete:
.LFB474:
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
	movl	20(%esp), %esi
	movl	24(%esp), %edi
	cmpl	%edi, %esi
	je	.L1740
	movl	(%esi), %ecx
	movl	4(%esi), %ebx
	movl	4(%edi), %edx
	movl	(%edi), %eax
	movl	%edx, 4(%esi)
	movl	%eax, (%esi)
	movl	%ecx, (%edi)
	movl	%ebx, 4(%edi)
	movl	8(%esi), %ebx
	movl	12(%esi), %ecx
	movl	%ebx, %edx
	andl	$-8, %edx
	je	.L1742
	movl	12(%edx), %eax
	movl	%edi, %ebp
	andl	$-8, %ebp
	andl	$7, %eax
	orl	%ebp, %eax
	movl	%eax, 12(%edx)
.L1742:
	movl	%ecx, %edx
	andl	$-8, %edx
	je	.L1743
	movl	8(%edx), %eax
	movl	%edi, %ebp
	andl	$-8, %ebp
	andl	$7, %eax
	orl	%ebp, %eax
	movl	%eax, 8(%edx)
.L1743:
	movl	8(%edi), %edx
	movl	12(%edi), %eax
	movl	%edx, 8(%esi)
	andl	$-8, %edx
	movl	%eax, 12(%esi)
	movl	%ebx, 8(%edi)
	movl	%ecx, 12(%edi)
	je	.L1744
	movl	12(%edx), %ecx
	movl	%esi, %ebx
	andl	$-8, %ebx
	andl	$7, %ecx
	orl	%ebx, %ecx
	movl	%ecx, 12(%edx)
.L1744:
	andl	$-8, %eax
	je	.L1740
	movl	8(%eax), %edx
	andl	$-8, %esi
	andl	$7, %edx
	orl	%esi, %edx
	movl	%edx, 8(%eax)
.L1740:
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
.LFE474:
	.size	capSwapForDelete, .-capSwapForDelete
	.p2align 4,,15
	.globl	cteSwap
	.type	cteSwap, @function
cteSwap:
.LFB475:
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
	movl	28(%esp), %ecx
	movl	32(%esp), %eax
	movl	36(%esp), %edx
	movl	40(%esp), %ebx
	movl	%eax, (%ecx)
	movl	20(%esp), %eax
	movl	%edx, 4(%ecx)
	movl	24(%esp), %edx
	movl	%eax, (%ebx)
	movl	%edx, 4(%ebx)
	movl	8(%ecx), %edi
	movl	12(%ecx), %esi
	movl	%edi, %edx
	andl	$-8, %edx
	je	.L1761
	movl	12(%edx), %eax
	movl	%ebx, %ebp
	andl	$-8, %ebp
	andl	$7, %eax
	orl	%ebp, %eax
	movl	%eax, 12(%edx)
.L1761:
	movl	%esi, %edx
	andl	$-8, %edx
	je	.L1762
	movl	8(%edx), %eax
	movl	%ebx, %ebp
	andl	$-8, %ebp
	andl	$7, %eax
	orl	%ebp, %eax
	movl	%eax, 8(%edx)
.L1762:
	movl	8(%ebx), %edx
	movl	12(%ebx), %eax
	movl	%edx, 8(%ecx)
	andl	$-8, %edx
	movl	%eax, 12(%ecx)
	movl	%edi, 8(%ebx)
	movl	%esi, 12(%ebx)
	je	.L1763
	movl	12(%edx), %ebx
	movl	%ecx, %esi
	andl	$-8, %esi
	andl	$7, %ebx
	orl	%esi, %ebx
	movl	%ebx, 12(%edx)
.L1763:
	andl	$-8, %eax
	je	.L1760
	movl	8(%eax), %edx
	andl	$-8, %ecx
	andl	$7, %edx
	orl	%ecx, %edx
	movl	%edx, 8(%eax)
.L1760:
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
.LFE475:
	.size	cteSwap, .-cteSwap
	.p2align 4,,15
	.globl	invokeCNodeRotate
	.type	invokeCNodeRotate, @function
invokeCNodeRotate:
.LFB469:
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
	subl	$24, %esp
	.cfi_def_cfa_offset 44
	movl	60(%esp), %edx
	movl	68(%esp), %ecx
	movl	64(%esp), %eax
	cmpl	%ecx, %edx
	je	.L1797
	movl	8(%eax), %esi
	movl	52(%esp), %edi
	movl	56(%esp), %ebp
	movl	12(%eax), %ebx
	movl	%edi, (%ecx)
	movl	%ebp, 4(%ecx)
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	%esi, 8(%ecx)
	andl	$-8, %esi
	movl	%ebx, 12(%ecx)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	jne	.L1798
.L1781:
	andl	$-8, %ebx
	je	.L1782
	movl	8(%ebx), %esi
	andl	$-8, %ecx
	andl	$7, %esi
	orl	%ecx, %esi
	movl	%esi, 8(%ebx)
.L1782:
	movl	8(%edx), %ebx
	movl	44(%esp), %edi
	movl	48(%esp), %ebp
	movl	12(%edx), %ecx
	movl	%edi, (%eax)
	movl	%ebp, 4(%eax)
	movl	$0, (%edx)
	movl	$0, 4(%edx)
	movl	%ebx, 8(%eax)
	andl	$-8, %ebx
	movl	%ecx, 12(%eax)
	movl	$0, 8(%edx)
	movl	$0, 12(%edx)
	jne	.L1799
.L1783:
	andl	$-8, %ecx
	je	.L1780
	movl	8(%ecx), %edx
	andl	$-8, %eax
	andl	$7, %edx
	orl	%eax, %edx
	movl	%edx, 8(%ecx)
.L1780:
	addl	$24, %esp
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
.L1799:
	.cfi_restore_state
	movl	12(%ebx), %edx
	movl	%eax, %esi
	andl	$-8, %esi
	andl	$7, %edx
	orl	%esi, %edx
	movl	%edx, 12(%ebx)
	jmp	.L1783
	.p2align 4,,7
	.p2align 3
.L1798:
	movl	12(%esi), %edi
	movl	%ecx, %ebp
	andl	$-8, %ebp
	andl	$7, %edi
	orl	%ebp, %edi
	movl	%edi, 12(%esi)
	jmp	.L1781
	.p2align 4,,7
	.p2align 3
.L1797:
	movl	52(%esp), %edi
	movl	56(%esp), %ebp
	movl	%eax, 20(%esp)
	movl	44(%esp), %eax
	movl	%edx, 8(%esp)
	movl	48(%esp), %edx
	movl	%edi, 12(%esp)
	movl	%ebp, 16(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	cteSwap
	addl	$24, %esp
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
	.cfi_endproc
.LFE469:
	.size	invokeCNodeRotate, .-invokeCNodeRotate
	.p2align 4,,15
	.globl	insertNewCap
	.type	insertNewCap, @function
insertNewCap:
.LFB485:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	12(%esp), %ebx
	movl	16(%esp), %esi
	movl	20(%esp), %eax
	movl	24(%esp), %edx
	movl	12(%ebx), %ecx
	movl	%eax, (%esi)
	movl	%ebx, %eax
	andl	$-8, %eax
	andl	$-8, %ecx
	movl	%eax, 8(%esi)
	movl	%ecx, %eax
	orl	$3, %eax
	movl	%edx, 4(%esi)
	movl	%eax, 12(%esi)
	andl	$-8, %esi
	testl	%ecx, %ecx
	je	.L1802
	movl	8(%ecx), %eax
	andl	$7, %eax
	orl	%esi, %eax
	movl	%eax, 8(%ecx)
.L1802:
	movl	12(%ebx), %eax
	andl	$7, %eax
	orl	%esi, %eax
	movl	%eax, 12(%ebx)
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE485:
	.size	insertNewCap, .-insertNewCap
	.p2align 4,,15
	.globl	setupReplyMaster
	.type	setupReplyMaster, @function
setupReplyMaster:
.LFB486:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %esi
	movl	%esi, %ecx
	andl	$-1024, %ecx
	movl	32(%ecx), %edx
	movl	%edx, %edi
	movl	%edx, %eax
	andl	$14, %edi
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %edi
	cmove	%edx, %eax
	testl	%eax, %eax
	jne	.L1804
	andl	$-16, %esi
	orl	$8, %esi
	movl	%esi, 32(%ecx)
	movl	$1, 36(%ecx)
	movl	$0, 40(%ecx)
	movl	$3, 44(%ecx)
.L1804:
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
	.cfi_endproc
.LFE486:
	.size	setupReplyMaster, .-setupReplyMaster
	.p2align 4,,15
	.globl	ensureEmptySlot
	.type	ensureEmptySlot, @function
ensureEmptySlot:
.LFB489:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, %ecx
	movl	%eax, %edx
	andl	$14, %ecx
	andl	$15, %edx
	movzbl	%al, %eax
	cmpl	$14, %ecx
	cmove	%eax, %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L1812
	movl	$8, current_syscall_error+24
	movb	$3, %al
.L1812:
	rep ret
	.cfi_endproc
.LFE489:
	.size	ensureEmptySlot, .-ensureEmptySlot
	.p2align 4,,15
	.globl	getReceiveSlots
	.type	getReceiveSlots, @function
getReceiveSlots:
.LFB492:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %eax
	testl	%eax, %eax
	je	.L1823
	movl	500(%eax), %ecx
	leal	-28(%ebp), %edi
	movl	504(%eax), %ebx
	movl	508(%eax), %esi
	movl	8(%ebp), %eax
	andl	$-1024, %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	$32, 16(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edi, (%esp)
	call	resolveAddressBits
	movl	-28(%ebp), %ecx
	movl	-24(%ebp), %eax
	subl	$4, %esp
	testl	%ecx, %ecx
	jne	.L1823
	movl	4(%eax), %edx
	movl	(%eax), %ecx
	leal	-40(%ebp), %eax
	movl	%eax, (%esp)
	movl	%esi, 20(%esp)
	movl	%edx, 12(%esp)
	movl	%ebx, 16(%esp)
	movl	%ecx, 8(%esp)
	movl	$0, 4(%esp)
	call	lookupSlotForCNodeOp
	movl	-40(%ebp), %edx
	movl	-36(%ebp), %eax
	subl	$4, %esp
	testl	%edx, %edx
	jne	.L1823
	movl	(%eax), %ecx
	movl	%ecx, %ebx
	movl	%ecx, %edx
	andl	$14, %ebx
	andl	$15, %edx
	movzbl	%cl, %ecx
	cmpl	$14, %ebx
	cmove	%ecx, %edx
	testl	%edx, %edx
	jne	.L1823
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
	.p2align 4,,7
	.p2align 3
.L1823:
	.cfi_restore_state
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
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
.LFE492:
	.size	getReceiveSlots, .-getReceiveSlots
	.p2align 4,,15
	.globl	loadCapTransfer
	.type	loadCapTransfer, @function
loadCapTransfer:
.LFB493:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	movl	504(%edx), %ecx
	movl	%ecx, %ebx
	movl	508(%edx), %ecx
	movl	500(%edx), %edx
	movl	%ebx, 4(%eax)
	movl	%ecx, 8(%eax)
	movl	%edx, (%eax)
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE493:
	.size	loadCapTransfer, .-loadCapTransfer
	.p2align 4,,15
	.globl	replyFromKernel_error
	.type	replyFromKernel_error, @function
replyFromKernel_error:
.LFB498:
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
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %edx
	movl	%edx, %ecx
	movl	636(%edx), %edi
	andl	$-1024, %ecx
	movl	64(%ecx), %eax
	movl	68(%ecx), %ebp
	movl	%eax, %esi
	movl	%eax, %ecx
	andl	$14, %esi
	andl	$15, %ecx
	movzbl	%al, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %ecx
	cmpl	$1, %ecx
	jne	.L1845
	movl	%eax, %ecx
	xorl	%ebx, %ebx
	andl	$50331648, %ecx
	cmpl	$50331648, %ecx
	je	.L1853
.L1829:
	movl	current_syscall_error+24, %ecx
	movl	$0, 4(%edx)
	cmpl	$10, %ecx
	ja	.L1833
	jmp	*.L1835(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L1835:
	.long	.L1833
	.long	.L1834
	.long	.L1836
	.long	.L1848
	.long	.L1838
	.long	.L1848
	.long	.L1839
	.long	.L1848
	.long	.L1848
	.long	.L1848
	.long	.L1840
	.text
	.p2align 4,,7
	.p2align 3
.L1853:
	movl	%ebp, %ecx
	shrl	$31, %ecx
	testl	%ecx, %ecx
	je	.L1831
	cmpl	$1, %ecx
	jne	.L1833
	movl	$4194303, %ebx
.L1832:
	andl	$16777200, %eax
	andl	%ebx, %edi
	sall	$8, %eax
	leal	(%edi,%eax), %ebx
	jmp	.L1829
	.p2align 4,,7
	.p2align 3
.L1831:
	movl	$4095, %ebx
	jmp	.L1832
	.p2align 4,,7
	.p2align 3
.L1833:
	call	halt
	.p2align 4,,7
	.p2align 3
.L1845:
	xorl	%ebx, %ebx
	jmp	.L1829
	.p2align 4,,7
	.p2align 3
.L1848:
	movl	%ecx, %eax
	xorl	%ecx, %ecx
.L1837:
	sall	$12, %eax
	orl	%ecx, %eax
	movl	%eax, 16(%edx)
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
.L1834:
	.cfi_restore_state
	movl	current_syscall_error, %eax
	movl	%eax, 20(%edx)
	movl	$1, %eax
	sall	$12, %eax
	orl	%ecx, %eax
	movl	%eax, 16(%edx)
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
.L1836:
	.cfi_restore_state
	movl	current_syscall_error+4, %eax
	movl	$1, %ecx
	movl	%eax, 20(%edx)
	movl	$2, %eax
	sall	$12, %eax
	orl	%ecx, %eax
	movl	%eax, 16(%edx)
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
.L1840:
	.cfi_restore_state
	movl	current_syscall_error+16, %eax
	xorl	%ecx, %ecx
	movl	%eax, 20(%edx)
	movl	$10, %eax
	sall	$12, %eax
	orl	%ecx, %eax
	movl	%eax, 16(%edx)
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
.L1839:
	.cfi_restore_state
	movl	current_syscall_error+20, %ecx
	xorl	%eax, %eax
	movl	current_lookup_fault+4, %edi
	testl	%ecx, %ecx
	movl	current_lookup_fault, %ecx
	setne	%al
	movl	%eax, 20(%edx)
	movl	%ecx, %eax
	andl	$3, %eax
	testl	%ebx, %ebx
	leal	1(%eax), %esi
	movl	%esi, 24(%edx)
	je	.L1851
	cmpl	$2, %eax
	je	.L1842
	cmpl	$3, %eax
	je	.L1843
	cmpl	$1, %eax
	.p2align 4,,2
	je	.L1854
.L1851:
	movl	$2, %ecx
	movl	$6, %eax
	jmp	.L1837
	.p2align 4,,7
	.p2align 3
.L1838:
	movl	current_syscall_error+8, %eax
	movl	$2, %ecx
	movl	%eax, 20(%edx)
	movl	current_syscall_error+12, %eax
	movl	%eax, 24(%edx)
	movl	$4, %eax
	sall	$12, %eax
	orl	%ecx, %eax
	movl	%eax, 16(%edx)
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
.L1843:
	.cfi_restore_state
	movl	%ecx, %eax
	andl	$252, %ecx
	andl	$16128, %eax
	shrl	$8, %eax
	shrl	$2, %ecx
	movl	%ecx, 20(%ebx)
	movl	$5, %ecx
	movl	%eax, 12(%ebx)
	movl	%edi, 16(%ebx)
	movl	current_syscall_error+24, %eax
	jmp	.L1837
	.p2align 4,,7
	.p2align 3
.L1842:
	movl	%ecx, %eax
	andl	$16128, %ecx
	andl	$252, %eax
	shrl	$2, %eax
	shrl	$8, %ecx
	movl	%ecx, 16(%ebx)
	movl	$4, %ecx
	movl	%eax, 12(%ebx)
	movl	current_syscall_error+24, %eax
	jmp	.L1837
	.p2align 4,,7
	.p2align 3
.L1854:
	andl	$252, %ecx
	shrl	$2, %ecx
	movl	%ecx, 12(%ebx)
	movl	$3, %ecx
	movl	current_syscall_error+24, %eax
	jmp	.L1837
	.cfi_endproc
.LFE498:
	.size	replyFromKernel_error, .-replyFromKernel_error
	.p2align 4,,15
	.globl	replyFromKernel_success_empty
	.type	replyFromKernel_success_empty, @function
replyFromKernel_success_empty:
.LFB499:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	$0, 4(%eax)
	movl	$0, 16(%eax)
	ret
	.cfi_endproc
.LFE499:
	.size	replyFromKernel_success_empty, .-replyFromKernel_success_empty
	.p2align 4,,15
	.globl	epCancelAll
	.type	epCancelAll, @function
epCancelAll:
.LFB501:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %edx
	movl	(%edx), %ecx
	testb	$3, %cl
	je	.L1856
	movl	4(%edx), %eax
	andl	$12, %ecx
	movl	%ecx, (%edx)
	movl	%eax, %ebx
	andl	$15, %ebx
	andl	$-16, %eax
	movl	%ebx, 4(%edx)
	jne	.L1873
	jmp	.L1864
	.p2align 4,,7
	.p2align 3
.L1877:
	movl	%eax, 644(%edi)
.L1863:
	orl	$1, %ecx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ebx, 4(%esi)
	movl	%ecx, 600(%eax)
.L1862:
	movl	648(%eax), %eax
	testl	%eax, %eax
	je	.L1864
.L1873:
	movl	592(%eax), %edx
	movl	600(%eax), %ecx
	andl	$-16, %edx
	orl	$2, %edx
	testb	$1, %cl
	movl	%edx, 592(%eax)
	jne	.L1862
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
	movl	4(%esi), %ebx
	testl	%ebx, %ebx
	jne	.L1877
	movl	%eax, %ebx
	jmp	.L1863
	.p2align 4,,7
	.p2align 3
.L1864:
	movl	ksSchedulerAction, %eax
	leal	-1(%eax), %edx
	cmpl	$-3, %edx
	ja	.L1861
	movl	600(%eax), %ecx
	testb	$1, %cl
	jne	.L1861
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
	movl	4(%esi), %ebx
	testl	%ebx, %ebx
	je	.L1868
	movl	%eax, 644(%edi)
.L1866:
	orl	$1, %ecx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ebx, 4(%esi)
	movl	%ecx, 600(%eax)
.L1861:
	movl	$-1, ksSchedulerAction
.L1856:
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
.L1868:
	.cfi_restore_state
	movl	%eax, %ebx
	jmp	.L1866
	.cfi_endproc
.LFE501:
	.size	epCancelAll, .-epCancelAll
	.p2align 4,,15
	.globl	invokeIRQControl
	.type	invokeIRQControl, @function
invokeIRQControl:
.LFB504:
	.cfi_startproc
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
	movl	32(%esp), %ebx
	cmpl	$15, %ebx
	movl	$1, intStateIRQTable(,%ebx,4)
	jle	.L1883
.L1879:
	movl	36(%esp), %eax
	movzbl	%bl, %ebx
	movl	%ebx, 4(%esp)
	movl	$30, (%esp)
	movl	%eax, 12(%esp)
	movl	40(%esp), %eax
	movl	%eax, 8(%esp)
	call	cteInsert
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
	.p2align 4,,7
	.p2align 3
.L1883:
	.cfi_restore_state
	cmpl	$7, %ebx
	jle	.L1884
	leal	-8(%ebx), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %esi
	movl	%eax, %edi
.L1881:
	movl	%esi, (%esp)
	call	in8
	movl	%edi, %ecx
	notl	%ecx
	movl	%esi, (%esp)
	andl	%eax, %ecx
	movzbl	%cl, %ecx
	movl	%ecx, 4(%esp)
	call	out8
	jmp	.L1879
	.p2align 4,,7
	.p2align 3
.L1884:
	movl	$1, %edi
	movl	%ebx, %ecx
	sall	%cl, %edi
	movl	$33, %esi
	jmp	.L1881
	.cfi_endproc
.LFE504:
	.size	invokeIRQControl, .-invokeIRQControl
	.p2align 4,,15
	.globl	decodeIRQControlInvocation
	.type	decodeIRQControlInvocation, @function
decodeIRQControlInvocation:
.LFB503:
	.cfi_startproc
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
	movl	12(%ebp), %eax
	cmpl	$20, 8(%ebp)
	movl	16(%ebp), %ebx
	movl	32(%ebp), %edi
	movl	20(%ebp), %edx
	je	.L1899
	movl	$3, current_syscall_error+24
	movl	$3, %eax
.L1897:
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
	.p2align 4,,7
	.p2align 3
.L1899:
	.cfi_restore_state
	cmpl	$2, %eax
	jbe	.L1887
	testl	%edx, %edx
	je	.L1887
	movl	ksCurThread, %eax
	movl	12(%edi), %edi
	movl	20(%eax), %esi
	movl	24(%eax), %ecx
	movl	(%edx), %eax
	movl	4(%edx), %edx
	cmpl	$31, %esi
	jbe	.L1890
	movl	$4, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+8
	movl	$31, current_syscall_error+12
	jmp	.L1897
	.p2align 4,,7
	.p2align 3
.L1887:
	movl	$7, current_syscall_error+24
	leal	-12(%ebp), %esp
	movl	$3, %eax
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
.L1890:
	.cfi_restore_state
	cmpl	$0, intStateIRQTable(,%esi,4)
	je	.L1891
	movl	$9, current_syscall_error+24
	movl	$3, %eax
	jmp	.L1897
.L1891:
	movl	%eax, 8(%esp)
	leal	-32(%ebp), %eax
	movl	%edi, 20(%esp)
	movl	%eax, (%esp)
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	$0, 4(%esp)
	call	lookupSlotForCNodeOp
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edi
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L1897
	movl	(%edi), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L1894
	movl	$8, current_syscall_error+24
	movl	$3, %eax
	jmp	.L1897
.L1894:
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	%ebx, 16(%ebp)
	movl	%edi, 12(%ebp)
	movl	%esi, 8(%ebp)
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	jmp	invokeIRQControl
	.cfi_endproc
.LFE503:
	.size	decodeIRQControlInvocation, .-decodeIRQControlInvocation
	.p2align 4,,15
	.globl	invokeIRQHandler_AckIRQ
	.type	invokeIRQHandler_AckIRQ, @function
invokeIRQHandler_AckIRQ:
.LFB506:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ecx
	cmpl	$15, %ecx
	jle	.L1905
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
.L1905:
	.cfi_restore_state
	cmpl	$7, %ecx
	jle	.L1906
	subl	$8, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %ebx
	movl	%eax, %esi
.L1903:
	movl	%ebx, (%esp)
	call	in8
	movl	%esi, %ecx
	notl	%ecx
	movl	%ebx, (%esp)
	andl	%eax, %ecx
	movzbl	%cl, %ecx
	movl	%ecx, 4(%esp)
	call	out8
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
.L1906:
	.cfi_restore_state
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
	jmp	.L1903
	.cfi_endproc
.LFE506:
	.size	invokeIRQHandler_AckIRQ, .-invokeIRQHandler_AckIRQ
	.p2align 4,,15
	.globl	deletedIRQHandler
	.type	deletedIRQHandler, @function
deletedIRQHandler:
.LFB510:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ecx
	cmpl	$15, %ecx
	movl	$0, intStateIRQTable(,%ecx,4)
	jle	.L1912
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
.L1912:
	.cfi_restore_state
	cmpl	$7, %ecx
	jle	.L1913
	subl	$8, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %ebx
	movl	%eax, %esi
.L1910:
	movl	%ebx, (%esp)
	call	in8
	movl	%ebx, (%esp)
	orl	%esi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
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
.L1913:
	.cfi_restore_state
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
	jmp	.L1910
	.cfi_endproc
.LFE510:
	.size	deletedIRQHandler, .-deletedIRQHandler
	.p2align 4,,15
	.globl	isIRQActive
	.type	isIRQActive, @function
isIRQActive:
.LFB512:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	intStateIRQTable(,%eax,4), %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE512:
	.size	isIRQActive, .-isIRQActive
	.p2align 4,,15
	.globl	setIRQState
	.type	setIRQState, @function
setIRQState:
.LFB513:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %ecx
	movl	32(%esp), %eax
	cmpl	$15, %ecx
	movl	%eax, intStateIRQTable(,%ecx,4)
	jle	.L1922
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
.L1922:
	.cfi_restore_state
	cmpl	$7, %ecx
	jle	.L1923
	subl	$8, %ecx
	movl	$1, %edx
	sall	%cl, %edx
	movl	$161, %ebx
	testl	%eax, %eax
	movl	%edx, %esi
	movl	%ebx, (%esp)
	je	.L1924
.L1919:
	call	in8
	notl	%esi
	andl	%esi, %eax
.L1921:
	movzbl	%al, %eax
	movl	%ebx, 32(%esp)
	movl	%eax, 36(%esp)
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	out8
	.p2align 4,,7
	.p2align 3
.L1923:
	.cfi_restore_state
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
	testl	%eax, %eax
	movl	%ebx, (%esp)
	jne	.L1919
.L1924:
	call	in8
	orl	%esi, %eax
	jmp	.L1921
	.cfi_endproc
.LFE513:
	.size	setIRQState, .-setIRQState
	.p2align 4,,15
	.globl	getObjectSize
	.type	getObjectSize, @function
getObjectSize:
.LFB514:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %edx
	cmpl	$4, %edx
	ja	.L1944
	cmpl	$3, %edx
	ja	.L1933
	cmpl	$2, %edx
	movl	$4, %eax
	jae	.L1931
	cmpl	$1, %edx
	movb	$10, %al
	jne	.L1932
.L1931:
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1933:
	.cfi_restore_state
	movl	20(%esp), %eax
	addl	$4, %eax
	cmpl	$4, %edx
	je	.L1931
.L1932:
	movl	20(%esp), %eax
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1944:
	.cfi_restore_state
	cmpl	$6, %edx
	je	.L1936
	.p2align 4,,2
	ja	.L1929
	cmpl	$5, %edx
	.p2align 4,,5
	jne	.L1927
.L1930:
	movl	$12, %eax
	.p2align 4,,3
	jmp	.L1931
	.p2align 4,,7
	.p2align 3
.L1936:
	movl	$22, %eax
	jmp	.L1931
	.p2align 4,,7
	.p2align 3
.L1929:
	cmpl	$8, %edx
	jbe	.L1930
.L1927:
	call	halt
	.cfi_endproc
.LFE514:
	.size	getObjectSize, .-getObjectSize
	.p2align 4,,15
	.globl	hasRecycleRights
	.type	hasRecycleRights, @function
hasRecycleRights:
.LFB518:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	12(%esp), %edx
	movl	16(%esp), %esi
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %ebx
	cmpl	$14, %ecx
	cmove	%ebx, %eax
	cmpl	$4, %eax
	je	.L1949
	jbe	.L1975
	cmpl	$6, %eax
	jne	.L1976
	movl	%esi, %edx
	xorl	%eax, %eax
	andl	$1, %edx
	andl	$2, %esi
	cmovne	%edx, %eax
.L1951:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1976:
	.cfi_restore_state
	cmpl	$62, %eax
	jne	.L1948
.L1960:
	xorl	%eax, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1975:
	.cfi_restore_state
	testl	%eax, %eax
	je	.L1960
.L1948:
	cmpl	$14, %ecx
	.p2align 4,,3
	je	.L1955
	movl	%edx, %eax
	andl	$15, %eax
	testb	$1, %dl
	je	.L1973
.L1958:
	cmpl	$1, %eax
	jne	.L1973
	andl	$50331648, %edx
	xorl	%eax, %eax
	cmpl	$50331648, %edx
	sete	%al
	jmp	.L1951
	.p2align 4,,7
	.p2align 3
.L1949:
	xorl	%eax, %eax
	testl	$2, %esi
	je	.L1951
	testl	$1, %esi
	je	.L1951
	xorl	%eax, %eax
	andl	$4, %esi
	setne	%al
	jmp	.L1951
	.p2align 4,,7
	.p2align 3
.L1955:
	testb	$1, %dl
	movzbl	%dl, %eax
	jne	.L1958
	.p2align 4,,7
	.p2align 3
.L1973:
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE518:
	.size	hasRecycleRights, .-hasRecycleRights
	.p2align 4,,15
	.globl	sameRegionAs
	.type	sameRegionAs, @function
sameRegionAs:
.LFB519:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %edx
	movl	52(%esp), %edi
	movl	56(%esp), %ebx
	movl	60(%esp), %esi
	movl	%edx, %ebp
	movl	%edx, %eax
	andl	$14, %ebp
	andl	$15, %eax
	movzbl	%dl, %ecx
	cmpl	$14, %ebp
	cmove	%ecx, %eax
	cmpl	$62, %eax
	ja	.L1980
	jmp	*.L1982(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1982:
	.long	.L1980
	.long	.L1980
	.long	.L1981
	.long	.L1980
	.long	.L1983
	.long	.L1980
	.long	.L1984
	.long	.L1980
	.long	.L1985
	.long	.L1980
	.long	.L1986
	.long	.L1980
	.long	.L1987
	.long	.L1980
	.long	.L1988
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1989
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1980
	.long	.L1990
	.text
	.p2align 4,,7
	.p2align 3
.L1990:
	movl	%ebx, %edx
	xorl	%eax, %eax
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L2059
	.p2align 4,,7
	.p2align 3
.L2014:
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
	.p2align 4,,7
	.p2align 3
.L1981:
	.cfi_restore_state
	andl	$-16, %edx
	movl	%ebx, %eax
	movl	%edx, %ebp
	movl	%esi, %edx
	call	cap_get_capPtr
	movl	%ebx, %ecx
	movl	%ebx, %edx
	andl	$14, %ecx
	andl	$15, %edx
	movl	%ecx, 12(%esp)
	movzbl	%bl, %ecx
	cmpl	$14, 12(%esp)
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L1993
	jmp	*.L1995(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L1995:
	.long	.L2001
	.long	.L1996
	.long	.L1997
	.long	.L2003
	.long	.L1999
	.long	.L2003
	.long	.L1999
	.long	.L2001
	.long	.L2001
	.long	.L2003
	.long	.L2004
	.long	.L2001
	.long	.L2032
	.long	.L1993
	.long	.L2001
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L2001
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L2009
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L1993
	.long	.L2001
	.text
	.p2align 4,,7
	.p2align 3
.L1983:
	movl	%ebx, %esi
	movl	%ebx, %ecx
	andl	$14, %esi
	andl	$15, %ecx
	movzbl	%bl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ecx
	xorl	%eax, %eax
	cmpl	$4, %ecx
	jne	.L2014
.L2058:
	andl	$-16, %edx
	andl	$-16, %ebx
	xorl	%eax, %eax
	cmpl	%ebx, %edx
	sete	%al
	jmp	.L2014
	.p2align 4,,7
	.p2align 3
.L1984:
	movl	%ebx, %esi
	movl	%ebx, %ecx
	andl	$14, %esi
	andl	$15, %ecx
	movzbl	%bl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ecx
	xorl	%eax, %eax
	cmpl	$6, %ecx
	jne	.L2014
	jmp	.L2058
	.p2align 4,,7
	.p2align 3
.L1985:
	movl	%ebx, %esi
	movl	%ebx, %ecx
	andl	$14, %esi
	andl	$15, %ecx
	movzbl	%bl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ecx
	xorl	%eax, %eax
	cmpl	$8, %ecx
	jne	.L2014
	jmp	.L2058
	.p2align 4,,7
	.p2align 3
.L1986:
	movl	%ebx, %ebp
	movl	%ebx, %ecx
	andl	$14, %ebp
	andl	$15, %ecx
	movzbl	%bl, %eax
	cmpl	$14, %ebp
	cmove	%eax, %ecx
	xorl	%eax, %eax
	cmpl	$10, %ecx
	jne	.L2014
	andl	$2147483632, %edx
	andl	$2147483632, %ebx
	cmpl	%edx, %ebx
	jne	.L2014
	andl	$260046848, %edi
	andl	$260046848, %esi
	xorl	%eax, %eax
	cmpl	%edi, %esi
	sete	%al
	jmp	.L2014
	.p2align 4,,7
	.p2align 3
.L1987:
	movl	%ebx, %esi
	movl	%ebx, %ecx
	andl	$14, %esi
	andl	$15, %ecx
	movzbl	%bl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ecx
	xorl	%eax, %eax
	cmpl	$12, %ecx
	jne	.L2014
	jmp	.L2058
	.p2align 4,,7
	.p2align 3
.L1988:
	movl	%ebx, %edx
	movl	%ebx, %eax
	andl	$14, %edx
	andl	$15, %eax
	movzbl	%bl, %ebx
	cmpl	$14, %edx
	cmove	%ebx, %eax
	andl	$-17, %eax
	cmpl	$14, %eax
	sete	%al
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	movzbl	%al, %eax
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
.L1989:
	.cfi_restore_state
	movl	%ebx, %edx
	xorl	%eax, %eax
	andl	$14, %edx
	cmpl	$14, %edx
	jne	.L2014
	cmpb	$30, %bl
	jne	.L2014
	movl	%esi, %eax
	movl	%edi, %ecx
	cmpb	%cl, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L2014
	.p2align 4,,7
	.p2align 3
.L1980:
	xorl	%eax, %eax
	testb	$1, %dl
	je	.L2014
	testb	$1, %bl
	je	.L2014
	movl	%ebx, 56(%esp)
	movl	%esi, 60(%esp)
	movl	%edi, 52(%esp)
	movl	%edx, 48(%esp)
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
	jmp	Arch_sameRegionAs
	.p2align 4,,7
	.p2align 3
.L2001:
	.cfi_restore_state
	movl	$1, %edx
.L2006:
	cmpl	%ebp, %eax
	jb	.L2035
	testl	%eax, %eax
	je	.L2035
	leal	-1(%eax,%edx), %edx
	movl	%edi, %ecx
	cmpl	%edx, %eax
	movl	$1, %eax
	setbe	%bl
	sall	%cl, %eax
	leal	-1(%ebp,%eax), %eax
	cmpl	%eax, %edx
	setbe	%al
	movzbl	%al, %eax
	andl	%ebx, %eax
	jmp	.L2014
	.p2align 4,,7
	.p2align 3
.L2003:
	movl	$4096, %edx
	jmp	.L2006
.L2032:
	movl	$1024, %edx
	jmp	.L2006
.L2004:
	andl	$260046848, %esi
	movl	$1, %edx
	shrl	$23, %esi
	leal	4(%esi), %ecx
	sall	%cl, %edx
	jmp	.L2006
.L1999:
	movl	$16, %edx
	jmp	.L2006
.L1997:
	movl	$1, %edx
	movl	%esi, %ecx
	sall	%cl, %edx
	jmp	.L2006
.L1996:
	shrl	$31, %esi
	testl	%esi, %esi
	je	.L2003
	cmpl	$1, %esi
	jne	.L1993
	movl	$4194304, %edx
	jmp	.L2006
.L2009:
	andl	$16128, %ebx
	movl	$1024, %edx
	shrl	$8, %ebx
	cmpl	$32, %ebx
	je	.L2006
	andl	$31, %ebx
	movw	$1, %dx
	movl	%ebx, %ecx
	addl	$4, %ecx
	sall	%cl, %edx
	jmp	.L2006
.L1993:
	call	halt
	.p2align 4,,7
	.p2align 3
.L2035:
	xorl	%eax, %eax
	jmp	.L2014
	.p2align 4,,7
	.p2align 3
.L2059:
	xorl	%eax, %eax
	cmpb	$62, %bl
	sete	%al
	jmp	.L2014
	.cfi_endproc
.LFE519:
	.size	sameRegionAs, .-sameRegionAs
	.p2align 4,,15
	.globl	isMDBParentOf
	.type	isMDBParentOf, @function
isMDBParentOf:
.LFB487:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	xorl	%edi, %edi
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	36(%esp), %esi
	testb	$2, 12(%ebx)
	je	.L2061
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameRegionAs
	testl	%eax, %eax
	je	.L2061
	movl	(%ebx), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$4, %eax
	je	.L2066
	cmpl	$6, %eax
	jne	.L2085
.L2066:
	movl	4(%ebx), %eax
	movl	$1, %edi
	shrl	$3, %eax
	testl	%eax, %eax
	je	.L2061
	movl	4(%esi), %edx
	xorw	%di, %di
	shrl	$3, %edx
	cmpl	%edx, %eax
	je	.L2086
	.p2align 4,,7
	.p2align 3
.L2061:
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	%edi, %eax
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
.L2085:
	.cfi_restore_state
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	$1, %edi
	movl	%edi, %eax
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
.L2086:
	.cfi_restore_state
	movl	12(%esi), %edi
	xorl	$1, %edi
	andl	$1, %edi
	jmp	.L2061
	.cfi_endproc
.LFE487:
	.size	isMDBParentOf, .-isMDBParentOf
	.p2align 4,,15
	.globl	deriveCap
	.type	deriveCap, @function
deriveCap:
.LFB515:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	56(%esp), %eax
	movl	60(%esp), %edx
	movl	48(%esp), %ebx
	movl	%eax, %ecx
	movl	%eax, %esi
	andl	$14, %ecx
	movl	%edx, %edi
	cmpl	$14, %ecx
	je	.L2088
	testb	$1, %al
	jne	.L2129
	andl	$15, %eax
.L2104:
	cmpl	$8, %eax
	je	.L2106
	.p2align 4,,3
	ja	.L2107
	cmpl	$2, %eax
	.p2align 4,,2
	jne	.L2111
	movl	52(%esp), %eax
	xorl	%ebp, %ebp
	movl	12(%eax), %eax
	movl	%eax, 12(%esp)
	andl	$-8, %eax
	je	.L2105
	movl	%eax, 4(%esp)
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	isMDBParentOf
	testl	%eax, %eax
	je	.L2105
	movl	$9, current_syscall_error+24
	xorl	%edi, %edi
	xorl	%esi, %esi
	movw	$3, %bp
	jmp	.L2105
	.p2align 4,,7
	.p2align 3
.L2107:
	cmpl	$14, %eax
	je	.L2106
	cmpl	$46, %eax
	je	.L2106
.L2111:
	xorl	%ebp, %ebp
.L2105:
	movl	%ebp, (%ebx)
	movl	%esi, 4(%ebx)
	movl	%edi, 8(%ebx)
.L2087:
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebx, %eax
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
	.p2align 4,,7
	.p2align 3
.L2106:
	.cfi_restore_state
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%ebp, %ebp
	jmp	.L2105
	.p2align 4,,7
	.p2align 3
.L2088:
	testb	$1, %al
	jne	.L2130
	movzbl	%al, %eax
	jmp	.L2104
	.p2align 4,,7
	.p2align 3
.L2129:
	movl	%eax, %ecx
	andl	$15, %ecx
.L2093:
	cmpl	$11, %ecx
	ja	.L2094
	jmp	*.L2096(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2096:
	.long	.L2094
	.long	.L2095
	.long	.L2094
	.long	.L2097
	.long	.L2094
	.long	.L2098
	.long	.L2094
	.long	.L2100
	.long	.L2094
	.long	.L2100
	.long	.L2094
	.long	.L2100
	.text
	.p2align 4,,7
	.p2align 3
.L2100:
	movl	$0, (%ebx)
	movl	%eax, 4(%ebx)
	movl	%edx, 8(%ebx)
	jmp	.L2087
	.p2align 4,,7
	.p2align 3
.L2130:
	movzbl	%al, %ecx
	jmp	.L2093
	.p2align 4,,7
	.p2align 3
.L2098:
	xorl	%eax, %eax
	andl	$65536, %edx
	jne	.L2103
.L2128:
	movl	$3, current_syscall_error+24
	xorl	%edi, %edi
	xorl	%esi, %esi
	movb	$3, %al
.L2103:
	movl	%eax, (%ebx)
	movl	%esi, 4(%ebx)
	movl	%edi, 8(%ebx)
	jmp	.L2087
	.p2align 4,,7
	.p2align 3
.L2097:
	xorl	%eax, %eax
	andl	$67108864, %edx
	je	.L2128
	jmp	.L2103
	.p2align 4,,7
	.p2align 3
.L2095:
	andl	$67108863, %eax
	andl	$-1072693249, %edx
	movl	$0, (%ebx)
	movl	%eax, 4(%ebx)
	movl	%edx, 8(%ebx)
	jmp	.L2087
	.p2align 4,,7
	.p2align 3
.L2094:
	call	halt
	.cfi_endproc
.LFE515:
	.size	deriveCap, .-deriveCap
	.p2align 4,,15
	.globl	ensureNoChildren
	.type	ensureNoChildren, @function
ensureNoChildren:
.LFB488:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	xorl	%esi, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	12(%ebx), %eax
	movl	%eax, %edi
	andl	$-8, %edi
	je	.L2132
	testb	$2, %al
	je	.L2132
	movl	(%edi), %eax
	movl	4(%edi), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameRegionAs
	testl	%eax, %eax
	je	.L2132
	movl	(%ebx), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$4, %eax
	je	.L2137
	cmpl	$6, %eax
	jne	.L2135
.L2137:
	movl	4(%ebx), %eax
	shrl	$3, %eax
	testl	%eax, %eax
	je	.L2135
	movl	4(%edi), %edx
	shrl	$3, %edx
	cmpl	%edx, %eax
	je	.L2163
.L2146:
	xorl	%esi, %esi
	.p2align 4,,7
	.p2align 3
.L2132:
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	%esi, %eax
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
.L2163:
	.cfi_restore_state
	movl	12(%edi), %eax
	xorl	$1, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L2146
	.p2align 4,,7
	.p2align 3
.L2135:
	movl	$3, %esi
	movl	$9, current_syscall_error+24
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	%esi, %eax
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
	.cfi_endproc
.LFE488:
	.size	ensureNoChildren, .-ensureNoChildren
	.p2align 4,,15
	.globl	sameObjectAs
	.type	sameObjectAs, @function
sameObjectAs:
.LFB520:
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
	movl	64(%esp), %edx
	movl	68(%esp), %esi
	movl	72(%esp), %ecx
	movl	76(%esp), %edi
	movl	%edx, %ebx
	andl	$14, %ebx
	cmpl	$14, %ebx
	je	.L2165
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$2, %eax
	je	.L2182
.L2167:
	cmpl	$14, %eax
	je	.L2193
.L2168:
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$14, %ebx
	movl	%eax, %ebp
	movl	%eax, 16(%esp)
	movzbl	%dl, %eax
	cmove	%eax, %ebp
	andl	$1, %ebp
	movl	%eax, 20(%esp)
	je	.L2171
	movl	%ecx, %eax
	movl	%ecx, %ebp
	andl	$14, %eax
	andl	$15, %ebp
	movl	%eax, 24(%esp)
	movl	%ebp, %eax
	cmpl	$14, 24(%esp)
	movl	%ebp, 28(%esp)
	movzbl	%cl, %ebp
	cmove	%ebp, %eax
	testb	$1, %al
	jne	.L2194
.L2171:
	movl	%edi, 76(%esp)
	movl	%esi, 68(%esp)
	movl	%ecx, 72(%esp)
	movl	%edx, 64(%esp)
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
	jmp	sameRegionAs
	.p2align 4,,7
	.p2align 3
.L2165:
	.cfi_restore_state
	movzbl	%dl, %eax
	cmpl	$2, %eax
	jne	.L2167
.L2182:
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
.L2193:
	.cfi_restore_state
	movl	%ecx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	jne	.L2168
	xorb	%al, %al
	cmpb	$30, %cl
	je	.L2166
	jmp	.L2168
	.p2align 4,,7
	.p2align 3
.L2194:
	movl	16(%esp), %eax
	cmpl	$14, %ebx
	cmove	20(%esp), %eax
	cmpl	$1, %eax
	je	.L2195
.L2176:
	movl	%ecx, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%edx, (%esp)
	movl	%esi, 4(%esp)
	call	Arch_sameRegionAs
.L2166:
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
.L2195:
	.cfi_restore_state
	movl	28(%esp), %eax
	cmpl	$14, 24(%esp)
	cmove	%ebp, %eax
	cmpl	$1, %eax
	jne	.L2176
	andl	$16777200, %edx
	andl	$16777200, %ecx
	xorb	%al, %al
	cmpl	%edx, %ecx
	jne	.L2166
	shrl	$31, %esi
	xorl	%eax, %eax
	shrl	$31, %edi
	cmpl	%edi, %esi
	sete	%al
	jmp	.L2166
	.cfi_endproc
.LFE520:
	.size	sameObjectAs, .-sameObjectAs
	.p2align 4,,15
	.globl	isFinalCapability
	.type	isFinalCapability, @function
isFinalCapability:
.LFB490:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	8(%ebx), %ecx
	movl	12(%ebx), %esi
	andl	$-8, %ecx
	je	.L2197
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	4(%ecx), %edx
	movl	(%ecx), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
	movl	%eax, %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L2197
.L2198:
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
.L2197:
	.cfi_restore_state
	andl	$-8, %esi
	movl	$1, %eax
	je	.L2198
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameObjectAs
	testl	%eax, %eax
	sete	%al
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	movzbl	%al, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE490:
	.size	isFinalCapability, .-isFinalCapability
	.p2align 4,,15
	.globl	decodeIA32MMUInvocation
	.type	decodeIA32MMUInvocation, @function
decodeIA32MMUInvocation:
.LFB364:
	.cfi_startproc
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
	movl	24(%ebp), %ebx
	movl	28(%ebp), %eax
	movl	32(%ebp), %esi
	movl	36(%ebp), %edi
	movl	%ebx, %ecx
	movl	%ebx, %edx
	andl	$14, %ecx
	andl	$15, %edx
	movl	%eax, -60(%ebp)
	cmpl	$14, %ecx
	movzbl	%bl, %eax
	cmove	%eax, %edx
	cmpl	$9, %edx
	ja	.L2209
	jmp	*.L2211(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L2211:
	.long	.L2209
	.long	.L2210
	.long	.L2209
	.long	.L2212
	.long	.L2209
	.long	.L2370
	.long	.L2209
	.long	.L2214
	.long	.L2209
	.long	.L2215
	.text
	.p2align 4,,7
	.p2align 3
.L2212:
	cmpl	$27, 8(%ebp)
	je	.L2376
	cmpl	$26, 8(%ebp)
	.p2align 4,,3
	je	.L2223
	.p2align 4,,7
	.p2align 3
.L2370:
	movl	$3, current_syscall_error+24
	movl	$3, %eax
.L2349:
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
	.p2align 4,,7
	.p2align 3
.L2215:
	.cfi_restore_state
	cmpl	$35, 8(%ebp)
	jne	.L2370
	testl	%esi, %esi
	je	.L2369
	movl	(%esi), %edx
	movl	4(%esi), %edi
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$5, %eax
	jne	.L2313
	testw	%di, %di
	jne	.L2313
	movzwl	-60(%ebp), %edi
	movl	%edi, %eax
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
	testl	%eax, %eax
	je	.L2377
	andl	$16777200, %ebx
	sall	$8, %ebx
	cmpl	%eax, %ebx
	je	.L2378
.L2316:
	movl	$2, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+4
	jmp	.L2349
	.p2align 4,,7
	.p2align 3
.L2210:
	cmpl	$30, 8(%ebp)
	je	.L2238
	jbe	.L2379
	cmpl	$31, 8(%ebp)
	.p2align 4,,3
	je	.L2241
	cmpl	$33, 8(%ebp)
	.p2align 4,,3
	jne	.L2370
	movl	ksCurThread, %edx
	andl	$16777200, %ebx
	sall	$8, %ebx
	addl	$536870912, %ebx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	ksCurThread, %eax
	movl	%ebx, 20(%eax)
	movl	$1, 16(%eax)
	xorl	%eax, %eax
	jmp	.L2349
	.p2align 4,,7
	.p2align 3
.L2214:
	cmpl	$34, 8(%ebp)
	jne	.L2370
	cmpl	$1, 12(%ebp)
	jbe	.L2369
	testl	%esi, %esi
	je	.L2369
	testl	%edi, %edi
	.p2align 4,,3
	je	.L2369
	movl	ksCurThread, %eax
	movl	4(%edi), %edx
	movl	4(%esi), %ecx
	movl	20(%eax), %ebx
	movl	24(%eax), %eax
	movl	%edx, -76(%ebp)
	xorl	%edx, %edx
	movl	%ebx, -64(%ebp)
	movl	(%esi), %ebx
	movl	%eax, -68(%ebp)
	movl	(%edi), %eax
	movl	%eax, -80(%ebp)
	jmp	.L2299
	.p2align 4,,7
	.p2align 3
.L2301:
	addl	$1, %edx
	cmpl	$64, %edx
	je	.L2318
.L2299:
	movl	ia32KSASIDTable(,%edx,4), %edi
	testl	%edi, %edi
	jne	.L2301
	movl	%ebx, %edi
	movzbl	%bl, %eax
	andl	$14, %edi
	movl	%edi, -60(%ebp)
	movl	%ebx, %edi
	andl	$15, %edi
	cmpl	$14, -60(%ebp)
	cmovne	%edi, %eax
	cmpl	$2, %eax
	jne	.L2313
	movl	%ecx, %eax
	andl	$31, %eax
	cmpl	$12, %eax
	jne	.L2313
	movl	%esi, (%esp)
	movl	%edx, -60(%ebp)
	call	ensureNoChildren
	testl	%eax, %eax
	jne	.L2349
	movl	-68(%ebp), %edi
	leal	-56(%ebp), %eax
	movl	-80(%ebp), %edx
	movl	-76(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%edi, 20(%esp)
	movl	-64(%ebp), %edi
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	$0, 4(%esp)
	movl	%edi, 16(%esp)
	call	lookupSlotForCNodeOp
	movl	-52(%ebp), %edi
	movl	%edi, -64(%ebp)
	pushl	%eax
	movl	-56(%ebp), %eax
	testl	%eax, %eax
	jne	.L2349
	movl	(%edi), %eax
	movl	-60(%ebp), %edx
	movl	%eax, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L2306
	andl	$15, %eax
.L2307:
	testl	%eax, %eax
	jne	.L2318
	movl	%ebx, %edi
	andl	$-4096, %ebx
	andl	$-16, %edi
	movl	%edi, -60(%ebp)
	movl	ksCurThread, %edi
	shrl	$8, %ebx
	movl	%eax, -80(%ebp)
	orl	$9, %ebx
	movl	%edx, -68(%ebp)
	movl	592(%edi), %ecx
	andl	$-16, %ecx
	orl	$2, %ecx
	movl	%ecx, 592(%edi)
	movl	%edi, (%esp)
	call	scheduleTCB
	movl	-80(%ebp), %eax
	movl	$1024, %ecx
	movl	-60(%ebp), %edi
	movl	-68(%ebp), %edx
	rep stosl
	movl	-64(%ebp), %eax
	sall	$10, %edx
	movl	%esi, 8(%esp)
	movl	%edx, %edi
	movl	%ebx, (%esp)
	shrl	$10, %edi
	movl	%eax, 12(%esp)
	movl	%edx, 4(%esp)
	call	cteInsert
	movl	-60(%ebp), %eax
	movl	%eax, ia32KSASIDTable(,%edi,4)
	xorl	%eax, %eax
	jmp	.L2349
	.p2align 4,,7
	.p2align 3
.L2209:
	call	halt
	.p2align 4,,7
	.p2align 3
.L2379:
	cmpl	$29, 8(%ebp)
	jne	.L2370
	cmpl	$2, 12(%ebp)
	jbe	.L2369
	testl	%esi, %esi
	je	.L2369
	movl	ksCurThread, %eax
	movl	%ebx, %edx
	shrl	$26, %edx
	movl	(%esi), %ecx
	sall	$10, %edx
	movl	20(%eax), %edi
	movl	24(%eax), %eax
	movl	%eax, -68(%ebp)
	movl	44(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -80(%ebp)
	movl	4(%esi), %eax
	movl	%eax, -64(%ebp)
	movl	-60(%ebp), %eax
	andl	$1072693248, %eax
	shrl	$20, %eax
	addl	%edx, %eax
	jne	.L2316
	movl	%ecx, %esi
	movl	%ecx, %eax
	andl	$14, %esi
	andl	$15, %eax
	movzbl	%cl, %edx
	cmpl	$14, %esi
	cmove	%edx, %eax
	cmpl	$5, %eax
	je	.L2380
	.p2align 4,,7
	.p2align 3
.L2313:
	movl	$2, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error+4
	jmp	.L2349
	.p2align 4,,7
	.p2align 3
.L2223:
	cmpl	$1, 12(%ebp)
	jbe	.L2369
	testl	%esi, %esi
	je	.L2369
	testl	$67108864, -60(%ebp)
	jne	.L2316
	movl	ksCurThread, %eax
	movl	4(%esi), %edx
	movl	20(%eax), %edi
	movl	24(%eax), %eax
	movl	%edi, -64(%ebp)
	movl	(%esi), %edi
	movl	%eax, -68(%ebp)
	movl	%edi, %esi
	movl	%edi, %eax
	andl	$14, %esi
	movl	%edi, %ecx
	andl	$15, %eax
	movzbl	%cl, %ecx
	cmpl	$14, %esi
	cmove	%ecx, %eax
	cmpl	$5, %eax
	jne	.L2313
	testl	$65536, %edx
	je	.L2313
	cmpl	$-536870913, -64(%ebp)
	jbe	.L2231
.L2257:
	movl	$1, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error
	jmp	.L2349
	.p2align 4,,7
	.p2align 3
.L2369:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
	jmp	.L2349
	.p2align 4,,7
	.p2align 3
.L2376:
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	isFinalCapability
	testl	%eax, %eax
	jne	.L2218
	movl	$9, current_syscall_error+24
	movb	$3, %al
	jmp	.L2349
	.p2align 4,,7
	.p2align 3
.L2241:
	movl	-60(%ebp), %edx
	movl	%ebx, %eax
	shrl	$26, %eax
	sall	$10, %eax
	andl	$1072693248, %edx
	shrl	$20, %edx
	addl	%edx, %eax
	je	.L2294
	movl	-60(%ebp), %edi
	andl	$16777200, %ebx
	movl	%eax, 4(%esp)
	sall	$8, %ebx
	movl	%ebx, 12(%esp)
	movl	%edi, %edx
	movl	%edi, %eax
	sall	$12, %edx
	shrl	$31, %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	unmapPage
.L2294:
	movl	20(%ebp), %eax
	movl	20(%ebp), %edi
	movl	4(%eax), %eax
	andl	$67108863, (%edi)
	andl	$-1073741824, %eax
	movl	%eax, 4(%edi)
.L2371:
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	xorl	%eax, %eax
	jmp	.L2349
	.p2align 4,,7
	.p2align 3
.L2238:
	cmpl	$1, 12(%ebp)
	jbe	.L2369
	testl	%esi, %esi
	.p2align 4,,3
	je	.L2369
	movl	ksCurThread, %eax
	movl	(%esi), %ecx
	movl	20(%eax), %edi
	movl	24(%eax), %eax
	movzbl	%cl, %edx
	movl	%edi, -64(%ebp)
	movl	4(%esi), %edi
	movl	%ecx, %esi
	movl	%eax, -68(%ebp)
	andl	$14, %esi
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$14, %esi
	cmove	%edx, %eax
	cmpl	$5, %eax
	jne	.L2313
	testl	$65536, %edi
	je	.L2313
	movl	-60(%ebp), %edx
	movl	%ebx, %eax
	shrl	$26, %eax
	sall	$10, %eax
	andl	$1072693248, %edx
	shrl	$20, %edx
	movl	%edx, %esi
	addl	%eax, %esi
	je	.L2316
	movzwl	%di, %edi
	leal	-32(%ebp), %eax
	movl	%edi, %edx
	movl	%ecx, -80(%ebp)
	call	findPDForASID
	movl	-28(%ebp), %eax
	cmpl	$0, -32(%ebp)
	movl	-80(%ebp), %ecx
	jne	.L2375
	andl	$16777200, %ecx
	movl	%ecx, %edx
	sall	$8, %edx
	cmpl	%eax, %edx
	je	.L2381
.L2282:
	movl	$2, current_syscall_error+24
	movl	$1, current_syscall_error+4
.L2368:
	movl	$3, %eax
	jmp	.L2349
.L2218:
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	testl	$67108864, -60(%ebp)
	jne	.L2220
.L2221:
	movl	20(%ebp), %eax
	andl	$-67108865, 4(%eax)
	xorl	%eax, %eax
	jmp	.L2349
.L2318:
	movl	$8, current_syscall_error+24
	jmp	.L2368
.L2220:
	movl	-60(%ebp), %edi
	movl	%ebx, %esi
	andl	$16777200, %esi
	sall	$8, %esi
	movl	%esi, 8(%esp)
	movl	%edi, %eax
	sall	$22, %eax
	movl	%eax, 4(%esp)
	movl	%edi, %eax
	andl	$67107840, %eax
	shrl	$10, %eax
	movl	%eax, (%esp)
	call	unmapPageTable
	movl	%edi, %edx
	movl	%ebx, %eax
	call	cap_get_capSizeBits
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	testl	%edx, %edx
	je	.L2221
	.p2align 4,,7
	.p2align 3
.L2222:
	movl	$0, (%esi)
	addl	$4, %esi
	subl	$4, %edx
	jne	.L2222
	jmp	.L2221
.L2380:
	testl	$65536, -64(%ebp)
	je	.L2313
	movzwl	-64(%ebp), %eax
	movl	%ecx, -72(%ebp)
	movl	%eax, -88(%ebp)
	movl	%eax, %edx
	leal	-32(%ebp), %eax
	call	findPDForASID
	movl	-28(%ebp), %eax
	cmpl	$0, -32(%ebp)
	movl	-72(%ebp), %ecx
	jne	.L2375
	andl	$16777200, %ecx
	movl	%ecx, -72(%ebp)
	sall	$8, -72(%ebp)
	cmpl	%eax, -72(%ebp)
	jne	.L2282
	movl	-60(%ebp), %eax
	shrl	$31, %eax
	testl	%eax, %eax
	je	.L2255
	cmpl	$1, %eax
	jne	.L2209
	movl	$22, %ecx
.L2256:
	movl	$1, %edx
	sall	%cl, %edx
	addl	%edi, %edx
	cmpl	$-536870912, %edx
	ja	.L2257
	movl	%ebx, %edx
	andl	$50331648, %edx
	shrl	$24, %edx
	cmpl	$2, %edx
	je	.L2382
	cmpl	$3, %edx
	movl	$1, %esi
	je	.L2383
.L2260:
	testl	%eax, %eax
	je	.L2262
	cmpl	$1, %eax
	jne	.L2209
	movl	$22, %ecx
.L2263:
	movl	$1, %edx
	sall	%cl, %edx
	subl	$1, %edx
	testl	%edi, %edx
	jne	.L2289
	movl	%ebx, %edx
	andl	$67108863, %ebx
	andl	$16777200, %edx
	sall	$8, %edx
	leal	536870912(%edx), %ecx
	movl	-64(%ebp), %edx
	movl	%ecx, -84(%ebp)
	movl	-88(%ebp), %ecx
	andl	$1023, %edx
	shrl	$10, %ecx
	movl	%ecx, -68(%ebp)
	sall	$20, %edx
	sall	$26, -68(%ebp)
	orl	%ebx, -68(%ebp)
	movl	-60(%ebp), %ebx
	andl	$-1073741824, %ebx
	orl	%edx, %ebx
	movl	%edi, %edx
	shrl	$12, %edx
	orl	%edx, %ebx
	testl	%eax, %eax
	je	.L2266
	subl	$1, %eax
	jne	.L2209
	movl	-72(%ebp), %eax
	shrl	$22, %edi
	leal	(%eax,%edi,4), %eax
	movl	(%eax), %edx
	testb	$-128, %dl
	jne	.L2270
	andb	$1, %dl
	jne	.L2318
.L2270:
	movl	-80(%ebp), %ecx
	movl	-84(%ebp), %edx
	movl	%esi, (%esp)
	call	makeUserPDE
	movl	20(%ebp), %eax
	movl	-68(%ebp), %edi
	movl	%ebx, 4(%eax)
	movl	%edi, (%eax)
	jmp	.L2371
.L2375:
	movl	$6, current_syscall_error+24
	movl	$0, current_syscall_error+20
	jmp	.L2368
.L2377:
	movl	$6, current_syscall_error+24
	movb	$3, %al
	movl	$0, current_syscall_error+20
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
	jmp	.L2349
.L2381:
	cmpl	%esi, %edi
	jne	.L2282
	movl	-60(%ebp), %esi
	movl	%ebx, %eax
	andl	$16777200, %ebx
	andl	$50331648, %eax
	shrl	$24, %eax
	sall	$8, %ebx
	shrl	$31, %esi
	cmpl	$2, %eax
	leal	536870912(%ebx), %edi
	je	.L2384
	cmpl	$3, %eax
	movl	$1, %ebx
	je	.L2385
.L2285:
	movl	-60(%ebp), %ecx
	sall	$12, %ecx
	testl	%esi, %esi
	je	.L2287
	subl	$1, %esi
	jne	.L2209
	testl	$4190208, %ecx
	je	.L2386
.L2289:
	movl	$5, current_syscall_error+24
	movl	$3, %eax
	jmp	.L2349
.L2378:
	xorl	%eax, %eax
	jmp	.L2317
	.p2align 4,,7
	.p2align 3
.L2319:
	addl	$1, %eax
	addl	$1, %edi
	cmpl	$1024, %eax
	je	.L2318
.L2317:
	testl	%edi, %edi
	je	.L2319
	cmpl	$0, (%ebx,%eax,4)
	jne	.L2319
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	4(%esi), %eax
	movzwl	%di, %edx
	andl	$1023, %edi
	andl	$-131072, %eax
	orl	%edx, %eax
	orl	$65536, %eax
	movl	%eax, 4(%esi)
	movl	(%esi), %eax
	andl	$16777200, %eax
	sall	$8, %eax
	movl	%eax, (%ebx,%edi,4)
	xorl	%eax, %eax
	jmp	.L2349
.L2386:
	shrl	$22, %ecx
	leal	(%edx,%ecx,4), %eax
	movl	(%eax), %edx
	testb	$-128, %dl
	jne	.L2293
	andb	$1, %dl
	jne	.L2318
.L2293:
	movl	-68(%ebp), %ecx
	movl	%edi, %edx
	movl	%ebx, (%esp)
	call	makeUserPDE
	jmp	.L2371
.L2384:
	movl	-64(%ebp), %eax
	andl	$2, %eax
	shrl	%eax
	cmpl	$1, %eax
	sbbl	%ebx, %ebx
	addl	$2, %ebx
	jmp	.L2285
.L2287:
	leal	-40(%ebp), %eax
	call	lookupPTSlot
	movl	-36(%ebp), %esi
	cmpl	$0, -40(%ebp)
	je	.L2291
.L2372:
	movl	$6, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+20
	jmp	.L2349
.L2385:
	testb	$2, -64(%ebp)
	je	.L2285
	movl	-64(%ebp), %eax
	andl	$1, %eax
	cmpl	$1, %eax
	sbbl	%ebx, %ebx
	addl	$3, %ebx
	jmp	.L2285
.L2291:
	movl	-68(%ebp), %ecx
	leal	-44(%ebp), %eax
	movl	%edi, %edx
	movl	%ebx, (%esp)
	call	makeUserPTE
	movl	-44(%ebp), %eax
	movl	%eax, (%esi)
	jmp	.L2371
.L2266:
	movl	-72(%ebp), %edx
	movl	%edi, %ecx
	leal	-40(%ebp), %eax
	call	lookupPTSlot
	movl	-36(%ebp), %edi
	cmpl	$0, -40(%ebp)
	jne	.L2372
	movl	-80(%ebp), %ecx
	leal	-44(%ebp), %eax
	movl	-84(%ebp), %edx
	movl	%esi, (%esp)
	call	makeUserPTE
	movl	20(%ebp), %eax
	movl	-68(%ebp), %esi
	movl	%ebx, 4(%eax)
	movl	%esi, (%eax)
	movl	-44(%ebp), %eax
	movl	%eax, (%edi)
	jmp	.L2371
.L2262:
	movl	$12, %ecx
	jmp	.L2263
.L2383:
	testb	$2, -68(%ebp)
	je	.L2260
	movl	-68(%ebp), %edx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	%esi, %esi
	addl	$3, %esi
	jmp	.L2260
.L2382:
	movl	-68(%ebp), %edx
	andl	$2, %edx
	shrl	%edx
	cmpl	$1, %edx
	sbbl	%esi, %esi
	addl	$2, %esi
	jmp	.L2260
.L2255:
	movl	$12, %ecx
	jmp	.L2256
.L2231:
	movzwl	%dx, %esi
	leal	-32(%ebp), %eax
	movl	%esi, %edx
	call	findPDForASID
	movl	-28(%ebp), %eax
	cmpl	$0, -32(%ebp)
	jne	.L2375
	andl	$16777200, %edi
	sall	$8, %edi
	cmpl	%eax, %edi
	jne	.L2282
	movl	-64(%ebp), %edx
	shrl	$22, %edx
	leal	(%edi,%edx,4), %eax
	testb	$1, (%eax)
	jne	.L2318
	movl	-60(%ebp), %ecx
	sall	$10, %esi
	movl	20(%ebp), %edi
	andl	$-134216705, %ecx
	orl	$67108864, %ecx
	orl	%esi, %ecx
	andl	$-1024, %ecx
	orl	%edx, %ecx
	movl	%ecx, 4(%edi)
	movl	-68(%ebp), %ecx
	movl	%ebx, (%edi)
	andl	$16777200, %ebx
	sall	$8, %ebx
	addl	$536870912, %ebx
	movl	%ecx, %edx
	andl	$2, %ecx
	andl	$1, %edx
	sall	$3, %edx
	shrl	%ecx
	orl	$7, %edx
	sall	$4, %ecx
	orl	%ecx, %edx
	orl	%ebx, %edx
	movl	%edx, (%eax)
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	call	invalidatePageStructureCache
	xorl	%eax, %eax
	jmp	.L2349
.L2306:
	movzbl	%al, %eax
	.p2align 4,,3
	jmp	.L2307
	.cfi_endproc
.LFE364:
	.size	decodeIA32MMUInvocation, .-decodeIA32MMUInvocation
	.p2align 4,,15
	.globl	Arch_decodeInvocation
	.type	Arch_decodeInvocation, @function
Arch_decodeInvocation:
.LFB391:
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
	subl	$24, %esp
	.cfi_def_cfa_offset 44
	movl	44(%esp), %eax
	movl	56(%esp), %ebx
	movl	64(%esp), %esi
	movl	80(%esp), %edi
	movl	%eax, (%esp)
	movl	48(%esp), %eax
	movl	%eax, 4(%esp)
	movl	52(%esp), %eax
	movl	%eax, 8(%esp)
	movl	60(%esp), %eax
	movl	%eax, %ebp
	movl	%eax, %ecx
	andl	$14, %ebp
	andl	$15, %ecx
	movzbl	%al, %edx
	cmpl	$14, %ebp
	cmove	%edx, %ecx
	subl	$1, %ecx
	cmpl	$10, %ecx
	jbe	.L2395
.L2390:
	movl	$2, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+4
	addl	$24, %esp
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
.L2395:
	.cfi_restore_state
	movl	$1, %edx
	sall	%cl, %edx
	testb	$21, %dl
	jne	.L2392
	testl	$320, %edx
	jne	.L2392
	andb	$4, %dh
	je	.L2390
	movl	%eax, 60(%esp)
	movl	8(%esp), %eax
	movl	%edi, 80(%esp)
	movl	%esi, 64(%esp)
	movl	%ebx, 56(%esp)
	movl	%eax, 52(%esp)
	movl	4(%esp), %eax
	movl	%eax, 48(%esp)
	movl	(%esp), %eax
	movl	%eax, 44(%esp)
	addl	$24, %esp
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
	jmp	decodeIA32PortInvocation
	.p2align 4,,7
	.p2align 3
.L2392:
	.cfi_restore_state
	movl	%eax, 60(%esp)
	movl	8(%esp), %eax
	movl	%edi, 80(%esp)
	movl	%esi, 64(%esp)
	movl	%ebx, 56(%esp)
	movl	%eax, 52(%esp)
	movl	4(%esp), %eax
	movl	%eax, 48(%esp)
	movl	(%esp), %eax
	movl	%eax, 44(%esp)
	addl	$24, %esp
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
	jmp	decodeIA32MMUInvocation
	.cfi_endproc
.LFE391:
	.size	Arch_decodeInvocation, .-Arch_decodeInvocation
	.p2align 4,,15
	.globl	slotCapLongRunningDelete
	.type	slotCapLongRunningDelete, @function
slotCapLongRunningDelete:
.LFB491:
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
	movl	64(%esp), %esi
	movl	(%esi), %ebx
	movl	%ebx, %ebp
	movl	%ebx, %eax
	andl	$14, %ebp
	andl	$15, %eax
	movzbl	%bl, %edx
	cmpl	$14, %ebp
	cmove	%edx, %eax
	xorl	%edi, %edi
	testl	%eax, %eax
	je	.L2399
	movl	8(%esi), %eax
	movl	12(%esi), %edx
	andl	$-8, %eax
	jne	.L2428
.L2400:
	andl	$-8, %edx
	je	.L2401
	movl	(%edx), %eax
	movl	4(%edx), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameObjectAs
	testl	%eax, %eax
	jne	.L2425
.L2401:
	movl	%ebx, %eax
	movzbl	%bl, %ebx
	andl	$15, %eax
	cmpl	$14, %ebp
	cmove	%ebx, %eax
	cmpl	$12, %eax
	je	.L2404
	cmpl	$46, %eax
	je	.L2404
	cmpl	$10, %eax
	je	.L2404
.L2425:
	xorl	%edi, %edi
.L2399:
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
	.p2align 4,,7
	.p2align 3
.L2428:
	.cfi_restore_state
	movl	4(%esi), %ecx
	movl	%edx, 28(%esp)
	movl	(%esi), %edx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
	movl	28(%esp), %edx
	testl	%eax, %eax
	je	.L2400
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
	.p2align 4,,7
	.p2align 3
.L2404:
	.cfi_restore_state
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	movl	$1, %edi
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	movl	%edi, %eax
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
.LFE491:
	.size	slotCapLongRunningDelete, .-slotCapLongRunningDelete
	.p2align 4,,15
	.globl	cteDeleteOne
	.type	cteDeleteOne, @function
cteDeleteOne:
.LFB483:
	.cfi_startproc
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
	movl	8(%ebp), %ebx
	movl	(%ebx), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	testl	%eax, %eax
	jne	.L2461
.L2429:
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
	.p2align 4,,7
	.p2align 3
.L2461:
	.cfi_restore_state
	movl	8(%ebx), %eax
	movl	12(%ebx), %edx
	andl	$-8, %eax
	je	.L2462
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
	movl	%edx, -44(%ebp)
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
	xorl	%ecx, %ecx
	movl	-44(%ebp), %edx
	testl	%eax, %eax
	je	.L2433
.L2434:
	leal	-36(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, (%esp)
	movl	$1, 16(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	call	finaliseCap
	movl	(%ebx), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	subl	$4, %esp
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L2429
	movl	12(%ebx), %esi
	movl	8(%ebx), %ecx
	movl	%esi, %eax
	andl	$-8, %eax
	andl	$-8, %ecx
	je	.L2438
	movl	12(%ecx), %edx
	andl	$7, %edx
	orl	%eax, %edx
	movl	%edx, 12(%ecx)
.L2438:
	testl	%eax, %eax
	je	.L2439
	movl	8(%eax), %edx
	andl	$1, %esi
	andl	$7, %edx
	orl	%ecx, %edx
	movl	12(%eax), %ecx
	movl	%edx, 8(%eax)
	movl	$1, %edx
	testb	$1, %cl
	cmove	%esi, %edx
	andl	$-2, %ecx
	orl	%ecx, %edx
	movl	%edx, 12(%eax)
.L2439:
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
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
	.p2align 4,,7
	.p2align 3
.L2462:
	.cfi_restore_state
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
.L2433:
	andl	$-8, %edx
	movl	$1, %ecx
	je	.L2434
	movl	(%edx), %eax
	movl	4(%edx), %edx
	movl	%esi, (%esp)
	movl	%edi, 4(%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	call	sameObjectAs
	xorl	%ecx, %ecx
	testl	%eax, %eax
	sete	%cl
	jmp	.L2434
	.cfi_endproc
.LFE483:
	.size	cteDeleteOne, .-cteDeleteOne
	.p2align 4,,15
	.globl	ipcCancel
	.type	ipcCancel, @function
ipcCancel:
.LFB500:
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
	subl	$16, %esp
	.cfi_def_cfa_offset 36
	movl	36(%esp), %eax
	movl	592(%eax), %edx
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L2465
	ja	.L2466
	cmpl	$3, %ecx
	jb	.L2463
.L2468:
	andl	$-16, %edx
	movl	(%edx), %esi
	movl	4(%edx), %edi
	movl	%esi, %ecx
	andl	$-16, %ecx
	movl	%edi, %ebx
	movl	%ecx, (%esp)
	movl	652(%eax), %ecx
	andl	$-16, %ebx
	testl	%ecx, %ecx
	je	.L2474
	movl	648(%eax), %ebp
	movl	%ebp, 648(%ecx)
	movl	648(%eax), %ebp
.L2475:
	testl	%ebp, %ebp
	je	.L2480
	movl	%ecx, 652(%ebp)
.L2476:
	movl	%ebx, %ecx
	andl	$15, %edi
	andl	$-16, %ecx
	andl	$15, %esi
	orl	%edi, %ecx
	movl	%ecx, 4(%edx)
	movl	(%esp), %ecx
	andl	$-16, %ecx
	orl	%esi, %ecx
	testl	%ebx, %ebx
	je	.L2477
.L2487:
	movl	%ecx, (%edx)
	andl	$-16, 592(%eax)
	movl	%eax, 36(%esp)
	addl	$16, %esp
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
	jmp	scheduleTCB
	.p2align 4,,7
	.p2align 3
.L2466:
	.cfi_restore_state
	cmpl	$6, %ecx
	je	.L2468
.L2463:
	addl	$16, %esp
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
.L2465:
	.cfi_restore_state
	movl	$0, 604(%eax)
	movl	$0, 608(%eax)
	andl	$-1024, %eax
	movl	44(%eax), %eax
	andl	$-8, %eax
	je	.L2463
	movl	%eax, 36(%esp)
	addl	$16, %esp
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
	jmp	cteDeleteOne
	.p2align 4,,7
	.p2align 3
.L2477:
	.cfi_restore_state
	andl	$-4, %ecx
	jmp	.L2487
	.p2align 4,,7
	.p2align 3
.L2480:
	movl	%ecx, (%esp)
	jmp	.L2476
	.p2align 4,,7
	.p2align 3
.L2474:
	movl	648(%eax), %ebx
	movl	%ebx, %ebp
	jmp	.L2475
	.cfi_endproc
.LFE500:
	.size	ipcCancel, .-ipcCancel
	.p2align 4,,15
	.globl	suspend
	.type	suspend, @function
suspend:
.LFB434:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %ebx
	movl	%ebx, (%esp)
	call	ipcCancel
	andl	$-16, 592(%ebx)
	cmpl	ksCurThread, %ebx
	je	.L2504
.L2494:
	movl	600(%ebx), %edx
	testb	$1, %dl
	je	.L2493
	movl	620(%ebx), %eax
	sall	$8, %eax
	addl	624(%ebx), %eax
	leal	ksReadyQueues(,%eax,8), %esi
	movl	ksReadyQueues(,%eax,8), %ebp
	movl	4(%esi), %ecx
	movl	%ecx, 12(%esp)
	movl	644(%ebx), %ecx
	testl	%ecx, %ecx
	je	.L2496
	movl	640(%ebx), %edi
	movl	%edi, 640(%ecx)
	movl	640(%ebx), %edi
.L2497:
	testl	%edi, %edi
	je	.L2499
	movl	%ecx, 644(%edi)
.L2498:
	movl	%ebp, ksReadyQueues(,%eax,8)
	movl	12(%esp), %eax
	andl	$-2, %edx
	movl	%eax, 4(%esi)
	movl	%edx, 600(%ebx)
.L2493:
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
	.p2align 4,,7
	.p2align 3
.L2504:
	.cfi_restore_state
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L2494
	call	rescheduleRequired
	jmp	.L2494
	.p2align 4,,7
	.p2align 3
.L2496:
	movl	640(%ebx), %ebp
	movl	%ebp, %edi
	jmp	.L2497
	.p2align 4,,7
	.p2align 3
.L2499:
	movl	%ecx, 12(%esp)
	jmp	.L2498
	.cfi_endproc
.LFE434:
	.size	suspend, .-suspend
	.p2align 4,,15
	.globl	invokeIRQHandler_SetIRQHandler
	.type	invokeIRQHandler_SetIRQHandler, @function
invokeIRQHandler_SetIRQHandler:
.LFB507:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %ebx
	movl	52(%esp), %esi
	movl	56(%esp), %edi
	movl	60(%esp), %ebp
	sall	$4, %ebx
	addl	intStateIRQNode, %ebx
	movl	%ebx, (%esp)
	call	cteDeleteOne
	movl	%ebx, 60(%esp)
	movl	%ebp, 56(%esp)
	movl	%esi, 48(%esp)
	movl	%edi, 52(%esp)
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
	jmp	cteInsert
	.cfi_endproc
.LFE507:
	.size	invokeIRQHandler_SetIRQHandler, .-invokeIRQHandler_SetIRQHandler
	.p2align 4,,15
	.globl	invokeIRQHandler_ClearIRQHandler
	.type	invokeIRQHandler_ClearIRQHandler, @function
invokeIRQHandler_ClearIRQHandler:
.LFB508:
	.cfi_startproc
	movl	4(%esp), %eax
	sall	$4, %eax
	addl	intStateIRQNode, %eax
	movl	%eax, 4(%esp)
	jmp	cteDeleteOne
	.cfi_endproc
.LFE508:
	.size	invokeIRQHandler_ClearIRQHandler, .-invokeIRQHandler_ClearIRQHandler
	.p2align 4,,15
	.globl	decodeIRQHandlerInvocation
	.type	decodeIRQHandlerInvocation, @function
decodeIRQHandlerInvocation:
.LFB505:
	.cfi_startproc
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
	movl	48(%esp), %eax
	movl	56(%esp), %ebx
	cmpl	$23, %eax
	je	.L2510
	cmpl	$24, %eax
	je	.L2511
	cmpl	$22, %eax
	je	.L2524
	movl	$3, current_syscall_error+24
	movl	$3, %eax
.L2513:
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
	.p2align 4,,7
	.p2align 3
.L2524:
	.cfi_restore_state
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	xorl	%eax, %eax
	cmpl	$15, 52(%esp)
	jg	.L2513
	cmpl	$7, 52(%esp)
	jle	.L2525
	movl	52(%esp), %eax
	movl	$161, %ebx
	leal	-8(%eax), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	%eax, %esi
.L2515:
	movl	%ebx, (%esp)
	call	in8
	movl	%esi, %edx
	notl	%edx
	movl	%ebx, (%esp)
	andl	%eax, %edx
	movzbl	%dl, %edx
	movl	%edx, 4(%esp)
	call	out8
	xorl	%eax, %eax
	jmp	.L2513
	.p2align 4,,7
	.p2align 3
.L2511:
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	52(%esp), %eax
	sall	$4, %eax
	addl	intStateIRQNode, %eax
	movl	%eax, (%esp)
	call	cteDeleteOne
	addl	$32, %esp
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
	.p2align 4,,7
	.p2align 3
.L2510:
	.cfi_restore_state
	testl	%ebx, %ebx
	je	.L2526
	movl	(%ebx), %eax
	movl	4(%ebx), %edi
	movl	%eax, %esi
	movl	%eax, %edx
	andl	$14, %esi
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %esi
	cmove	%ecx, %edx
	cmpl	$6, %edx
	je	.L2527
.L2519:
	movl	$2, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+4
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
	.p2align 4,,7
	.p2align 3
.L2526:
	.cfi_restore_state
	movl	$7, current_syscall_error+24
	movl	$3, %eax
	jmp	.L2513
	.p2align 4,,7
	.p2align 3
.L2525:
	movzbl	52(%esp), %ecx
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
	jmp	.L2515
	.p2align 4,,7
	.p2align 3
.L2527:
	testl	$2, %edi
	je	.L2519
	movl	ksCurThread, %ecx
	movl	%eax, 28(%esp)
	movl	592(%ecx), %edx
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%ecx)
	movl	%ecx, (%esp)
	call	scheduleTCB
	movl	28(%esp), %eax
	movl	%ebx, 12(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, 4(%esp)
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	invokeIRQHandler_SetIRQHandler
	xorl	%eax, %eax
	jmp	.L2513
	.cfi_endproc
.LFE505:
	.size	decodeIRQHandlerInvocation, .-decodeIRQHandlerInvocation
	.p2align 4,,15
	.globl	deletingIRQHandler
	.type	deletingIRQHandler, @function
deletingIRQHandler:
.LFB509:
	.cfi_startproc
	movl	4(%esp), %eax
	sall	$4, %eax
	addl	intStateIRQNode, %eax
	movl	%eax, 4(%esp)
	jmp	cteDeleteOne
	.cfi_endproc
.LFE509:
	.size	deletingIRQHandler, .-deletingIRQHandler
	.p2align 4,,15
	.globl	finaliseCap
	.type	finaliseCap, @function
finaliseCap:
.LFB516:
	.cfi_startproc
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
	movl	12(%ebp), %edx
	movl	8(%ebp), %ebx
	movl	16(%ebp), %esi
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L2530
	movl	%edx, %eax
	andl	$15, %eax
	testb	$1, %dl
	jne	.L2531
.L2535:
	cmpl	$6, %eax
	je	.L2537
	ja	.L2538
	testl	%eax, %eax
	.p2align 4,,6
	je	.L2546
	cmpl	$4, %eax
	.p2align 4,,6
	jne	.L2536
	movl	20(%ebp), %eax
	testl	%eax, %eax
	je	.L2546
	andl	$-16, %edx
	movl	%edx, (%esp)
	call	epCancelAll
	.p2align 4,,7
	.p2align 3
.L2546:
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movl	$-1, 8(%ebx)
.L2529:
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
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
	.p2align 4,,7
	.p2align 3
.L2538:
	.cfi_restore_state
	cmpl	$8, %eax
	je	.L2546
	cmpl	$62, %eax
	je	.L2546
.L2536:
	movl	24(%ebp), %eax
	testl	%eax, %eax
	jne	.L2580
	movl	%edx, %eax
	movzbl	%dl, %edi
	andl	$15, %eax
	cmpl	$14, %ecx
	cmove	%edi, %eax
	cmpl	$12, %eax
	je	.L2547
	jbe	.L2581
	cmpl	$30, %eax
	je	.L2550
	cmpl	$46, %eax
	.p2align 4,,5
	jne	.L2546
	movl	%edx, (%ebx)
	movl	%esi, 4(%ebx)
	movl	$-1, 8(%ebx)
	jmp	.L2529
	.p2align 4,,7
	.p2align 3
.L2530:
	testb	$1, %dl
	movzbl	%dl, %eax
	je	.L2535
.L2531:
	movl	20(%ebp), %edi
	leal	-36(%ebp), %eax
	movl	%esi, 8(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	movl	%edi, 12(%esp)
	call	Arch_finaliseCap
	movl	-36(%ebp), %eax
	movl	$-1, 8(%ebx)
	movl	%eax, (%ebx)
	movl	-32(%ebp), %eax
	subl	$4, %esp
	movl	%eax, 4(%ebx)
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
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
	.p2align 4,,7
	.p2align 3
.L2537:
	.cfi_restore_state
	movl	20(%ebp), %eax
	testl	%eax, %eax
	je	.L2546
	andl	$-16, %edx
	movl	%edx, (%esp)
	call	aepCancelAll
	jmp	.L2546
	.p2align 4,,7
	.p2align 3
.L2581:
	cmpl	$10, %eax
	jne	.L2546
	movl	20(%ebp), %edi
	testl	%edi, %edi
	.p2align 4,,3
	je	.L2546
	andl	$260046848, %esi
	movl	$1, %edi
	shrl	$23, %esi
	movl	%edi, %eax
	leal	1(%esi), %ecx
	andl	$2147483632, %edx
	sall	%cl, %eax
	addl	%edx, %edx
	subl	$1, %eax
	movl	%eax, %ecx
	movl	%esi, %eax
	sall	$8, %eax
	orl	$46, %eax
	movl	%ecx, -44(%ebp)
	movl	%eax, (%ebx)
	movl	%ecx, %eax
	movl	%esi, %ecx
	movl	-44(%ebp), %esi
	notl	%eax
	sall	%cl, %edi
	andl	%edx, %eax
	movl	$-1, 8(%ebx)
	andl	%edi, %esi
	orl	%esi, %eax
	movl	%eax, 4(%ebx)
	jmp	.L2529
	.p2align 4,,7
	.p2align 3
.L2550:
	movl	20(%ebp), %eax
	testl	%eax, %eax
	je	.L2546
	movl	%esi, %eax
	movzbl	%al, %esi
	movl	%esi, %eax
	sall	$4, %eax
	addl	intStateIRQNode, %eax
	movl	%eax, (%esp)
	call	cteDeleteOne
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movl	%esi, 8(%ebx)
	jmp	.L2529
	.p2align 4,,7
	.p2align 3
.L2547:
	movl	20(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L2546
	movl	%edx, %esi
	andl	$-16, %esi
	movl	%esi, (%esp)
	movl	%edx, -44(%ebp)
	call	suspend
	movl	-44(%ebp), %edx
	cmpl	ia32KSfpuOwner, %esi
	je	.L2582
.L2552:
	andl	$-1024, %edx
	orl	$5, %edx
	movl	$8238, (%ebx)
	movl	%edx, 4(%ebx)
	movl	$-1, 8(%ebx)
	jmp	.L2529
.L2582:
	xorl	%eax, %eax
	call	switchFpuOwner
	movl	-44(%ebp), %edx
	jmp	.L2552
.L2580:
	call	halt
	.cfi_endproc
.LFE516:
	.size	finaliseCap, .-finaliseCap
	.p2align 4,,15
	.globl	cteDelete
	.type	cteDelete, @function
cteDelete:
.LFB477:
	.cfi_startproc
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
.L2625:
	movl	(%edi), %eax
	movl	%eax, %ebx
	movl	%eax, %edx
	andl	$14, %ebx
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %ebx
	cmove	%ecx, %edx
	testl	%edx, %edx
	je	.L2678
	movl	8(%edi), %eax
	movl	12(%edi), %edx
	andl	$-8, %eax
	jne	.L2665
	movl	(%edi), %ebx
	movl	4(%edi), %esi
.L2585:
	andl	$-8, %edx
	movl	$1, %ecx
	je	.L2586
	movl	(%edx), %eax
	movl	4(%edx), %edx
	movl	%ebx, (%esp)
	movl	%esi, 4(%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	call	sameObjectAs
	xorl	%ecx, %ecx
	testl	%eax, %eax
	sete	%cl
.L2586:
	leal	-36(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	%ebx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, (%esp)
	movl	$0, 16(%esp)
	call	finaliseCap
	movl	-28(%ebp), %eax
	movl	-32(%ebp), %esi
	movl	%eax, -52(%ebp)
	movl	-36(%ebp), %eax
	movl	%esi, -44(%ebp)
	subl	$4, %esp
	movl	%eax, %edx
	movl	%eax, %ecx
	andl	$14, %edx
	andl	$15, %ecx
	movzbl	%al, %ebx
	cmpl	$14, %edx
	cmove	%ebx, %ecx
	testl	%ecx, %ecx
	je	.L2675
	cmpl	$46, %ecx
	jne	.L2669
	movl	%eax, %ebx
	andl	$16128, %ebx
	movl	%ebx, -48(%ebp)
	shrl	$8, -48(%ebp)
	movl	-48(%ebp), %esi
	cmpl	$32, %esi
	je	.L2592
	leal	1(%esi), %ecx
	movl	$1, %esi
	sall	%cl, %esi
	leal	-1(%esi), %ecx
	negl	%esi
	andl	-44(%ebp), %ecx
.L2622:
	testl	%ecx, %ecx
	je	.L2675
	andl	-44(%ebp), %esi
	cmpl	%esi, %edi
	je	.L2679
.L2594:
	movl	-36(%ebp), %ebx
	movl	-32(%ebp), %esi
	movl	%ebx, (%edi)
	movl	12(%ebp), %ebx
	movl	%esi, 4(%edi)
	testl	%ebx, %ebx
	jne	.L2595
	cmpl	$14, %edx
	je	.L2680
.L2595:
	movl	(%edi), %ebx
	movl	4(%edi), %edx
	andl	$16128, %ebx
	shrl	$8, %ebx
	cmpl	$32, %ebx
	je	.L2598
	leal	1(%ebx), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	%eax, %esi
	subl	$1, %eax
	negl	%esi
	andl	%edx, %esi
.L2623:
	movl	12(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L2599
	andl	%edx, %eax
	movl	%eax, -48(%ebp)
	addl	$268435455, %eax
	sall	$4, %eax
	addl	%esi, %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	cteDelete
	testl	%eax, %eax
	jne	.L2671
	movl	(%edi), %ecx
	movl	%ecx, %eax
	movzbl	%cl, %edx
	andl	$14, %eax
	movl	%eax, -44(%ebp)
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$14, -44(%ebp)
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L2604
	cmpl	$46, %eax
	jne	.L2669
	movl	4(%edi), %eax
	movl	%eax, -44(%ebp)
	movl	%ecx, %eax
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L2681
	orl	$-1, %edx
	leal	1(%eax), %ecx
	sall	%cl, %edx
	andl	-44(%ebp), %edx
	cmpl	%edx, %esi
	je	.L2682
	.p2align 4,,7
	.p2align 3
.L2604:
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	cmpl	$99, %eax
	movl	%eax, ksWorkUnitsCompleted
	jbe	.L2625
	movl	$0, ksWorkUnitsCompleted
	movl	-65008, %eax
	testl	%eax, %eax
	jne	.L2626
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
	movl	$32, (%esp)
	call	in8
	testb	%al, %al
	je	.L2625
.L2626:
	movl	$4, %eax
.L2671:
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
.L2679:
	.cfi_restore_state
	subl	$1, %ecx
	jne	.L2594
	.p2align 4,,7
	.p2align 3
.L2675:
	movl	(%edi), %eax
.L2590:
	movl	%eax, %ecx
	movzbl	%al, %edx
	andl	$14, %ecx
	andl	$15, %eax
	cmpl	$14, %ecx
	cmovne	%eax, %edx
	testl	%edx, %edx
	je	.L2676
	movl	12(%edi), %ebx
	movl	8(%edi), %ecx
	movl	%ebx, %eax
	andl	$-8, %eax
	andl	$-8, %ecx
	je	.L2617
	movl	12(%ecx), %edx
	andl	$7, %edx
	orl	%eax, %edx
	movl	%edx, 12(%ecx)
.L2617:
	testl	%eax, %eax
	je	.L2618
	movl	8(%eax), %edx
	andl	$1, %ebx
	andl	$7, %edx
	orl	%ecx, %edx
	movl	12(%eax), %ecx
	movl	%edx, 8(%eax)
	movl	$1, %edx
	testb	$1, %cl
	cmove	%ebx, %edx
	andl	$-2, %ecx
	orl	%ecx, %edx
	movl	%edx, 12(%eax)
.L2618:
	movl	-52(%ebp), %eax
	movl	$0, (%edi)
	movl	$0, 4(%edi)
	movl	$0, 8(%edi)
	cmpl	$-1, %eax
	movl	$0, 12(%edi)
	je	.L2676
	cmpl	$15, %eax
	movl	$0, intStateIRQTable(,%eax,4)
	jg	.L2676
	cmpl	$7, %eax
	jg	.L2620
	movzbl	-52(%ebp), %ecx
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
.L2621:
	movl	%ebx, (%esp)
	call	in8
	movl	%ebx, (%esp)
	orl	%esi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
	.p2align 4,,7
	.p2align 3
.L2676:
	xorl	%eax, %eax
	jmp	.L2671
	.p2align 4,,7
	.p2align 3
.L2665:
	movl	(%edi), %ebx
	movl	4(%edi), %esi
	movl	%edx, -44(%ebp)
	movl	%ebx, 8(%esp)
	movl	%esi, 12(%esp)
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
	xorl	%ecx, %ecx
	movl	-44(%ebp), %edx
	testl	%eax, %eax
	jne	.L2586
	jmp	.L2585
	.p2align 4,,7
	.p2align 3
.L2669:
	call	halt
	.p2align 4,,7
	.p2align 3
.L2599:
	cmpl	%esi, %edi
	.p2align 4,,6
	je	.L2604
	movl	(%esi), %ecx
	movl	4(%esi), %ebx
	movl	(%edi), %eax
	movl	4(%edi), %edx
	movl	%edi, 20(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, 12(%esp)
	movl	%edx, 16(%esp)
	movl	%ecx, (%esp)
	movl	%ebx, 4(%esp)
	call	cteSwap
	jmp	.L2604
	.p2align 4,,7
	.p2align 3
.L2598:
	movl	%edx, %esi
	movl	$15, %eax
	andl	$-16, %esi
	jmp	.L2623
	.p2align 4,,7
	.p2align 3
.L2680:
	cmpb	$46, %al
	jne	.L2595
	movl	-48(%ebp), %ecx
	movl	$-16, %eax
	cmpl	$32, %ecx
	je	.L2596
	addl	$1, %ecx
	movb	$-1, %al
	sall	%cl, %eax
.L2596:
	andl	-44(%ebp), %eax
	cmpl	%eax, %edi
	jne	.L2595
	xorl	%eax, %eax
	jmp	.L2671
	.p2align 4,,7
	.p2align 3
.L2592:
	movl	-44(%ebp), %ecx
	movl	$-16, %esi
	andl	$15, %ecx
	jmp	.L2622
	.p2align 4,,7
	.p2align 3
.L2678:
	movl	$-1, -52(%ebp)
	jmp	.L2590
.L2620:
	movl	-52(%ebp), %ecx
	movl	$1, %eax
	movl	$161, %ebx
	subl	$8, %ecx
	sall	%cl, %eax
	movl	%eax, %esi
	jmp	.L2621
.L2682:
	movl	%eax, %ecx
.L2628:
	movl	$1, %esi
	addl	$1, %ecx
	movl	%esi, %edx
	sall	%cl, %edx
	movl	%edx, %ecx
	subl	$1, %ecx
	andl	-44(%ebp), %ecx
	cmpl	%ecx, -48(%ebp)
	jne	.L2604
	cmpl	%eax, %ebx
	jne	.L2604
	movl	-48(%ebp), %eax
	subl	$1, %eax
	cmpl	$32, %ebx
	je	.L2634
	leal	1(%ebx), %ecx
	sall	%cl, %esi
	movl	%esi, %ebx
	movl	%esi, %ecx
	negl	%ecx
	subl	$1, %ebx
.L2608:
	movl	-44(%ebp), %edx
	andl	%ebx, %eax
	andl	%ecx, %edx
	orl	%edx, %eax
	movl	%eax, 4(%edi)
	jmp	.L2604
.L2634:
	movl	$15, %ebx
	movl	$-16, %ecx
	jmp	.L2608
.L2681:
	movl	-44(%ebp), %ecx
	andl	$-16, %ecx
	cmpl	%ecx, %esi
	jne	.L2604
	movl	$3, %ecx
	jmp	.L2628
	.cfi_endproc
.LFE477:
	.size	cteDelete, .-cteDelete
	.p2align 4,,15
	.type	finaliseSlot.constprop.158, @function
finaliseSlot.constprop.158:
.LFB753:
	.cfi_startproc
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
	movl	%eax, -44(%ebp)
.L2684:
	movl	(%ebx), %eax
.L2713:
	movl	%eax, %ecx
	movl	%eax, %edx
	andl	$14, %ecx
	andl	$15, %edx
	movzbl	%al, %eax
	cmpl	$14, %ecx
	cmove	%eax, %edx
	testl	%edx, %edx
	je	.L2742
	movl	8(%ebx), %eax
	movl	12(%ebx), %edx
	andl	$-8, %eax
	jne	.L2737
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
.L2685:
	andl	$-8, %edx
	movl	$1, %ecx
	je	.L2686
	movl	(%edx), %eax
	movl	4(%edx), %edx
	movl	%esi, (%esp)
	movl	%edi, 4(%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	call	sameObjectAs
	xorl	%ecx, %ecx
	testl	%eax, %eax
	sete	%cl
.L2686:
	leal	-36(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, (%esp)
	movl	$0, 16(%esp)
	call	finaliseCap
	movl	-36(%ebp), %ecx
	movl	-28(%ebp), %eax
	movl	-32(%ebp), %esi
	movl	%ecx, %edi
	movzbl	%cl, %edx
	movl	%eax, -48(%ebp)
	andl	$14, %edi
	movl	%ecx, %eax
	andl	$15, %eax
	subl	$4, %esp
	cmpl	$14, %edi
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L2690
	cmpl	$46, %eax
	jne	.L2739
	andl	$16128, %ecx
	shrl	$8, %ecx
	cmpl	$32, %ecx
	je	.L2692
	addl	$1, %ecx
	movb	$1, %al
	sall	%cl, %eax
	leal	-1(%eax), %edx
	negl	%eax
	andl	%esi, %edx
	testl	%edx, %edx
	je	.L2690
.L2745:
	andl	%esi, %eax
	cmpl	%eax, %ebx
	je	.L2743
.L2694:
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%eax, (%ebx)
	movl	(%ebx), %esi
	movl	%edx, 4(%ebx)
	movl	4(%ebx), %edx
	andl	$16128, %esi
	shrl	$8, %esi
	cmpl	$32, %esi
	je	.L2696
	leal	1(%esi), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	%eax, %edi
	subl	$1, %eax
	negl	%edi
	andl	%edx, %edi
.L2711:
	andl	%edx, %eax
	movl	%eax, -52(%ebp)
	addl	$268435455, %eax
	sall	$4, %eax
	addl	%edi, %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	cteDelete
	testl	%eax, %eax
	jne	.L2697
	movl	(%ebx), %edx
	movl	%edx, %eax
	movzbl	%dl, %ecx
	andl	$14, %eax
	movl	%eax, -48(%ebp)
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$14, -48(%ebp)
	cmove	%ecx, %eax
	testl	%eax, %eax
	je	.L2701
	cmpl	$46, %eax
	jne	.L2739
	movl	4(%ebx), %eax
	movl	%eax, -56(%ebp)
	movl	%edx, %eax
	andl	$16128, %eax
	movl	%eax, -48(%ebp)
	shrl	$8, -48(%ebp)
	cmpl	$32, -48(%ebp)
	je	.L2744
	movl	-48(%ebp), %eax
	movl	$-1, -60(%ebp)
	leal	1(%eax), %ecx
	movl	-56(%ebp), %eax
	sall	%cl, -60(%ebp)
	andl	%eax, -60(%ebp)
	cmpl	-60(%ebp), %edi
	jne	.L2701
	movl	-48(%ebp), %ecx
.L2716:
	movl	$1, %edi
	addl	$1, %ecx
	movl	%edi, %eax
	sall	%cl, %eax
	movl	%eax, %ecx
	subl	$1, %ecx
	andl	-56(%ebp), %ecx
	cmpl	%ecx, -52(%ebp)
	jne	.L2701
	cmpl	-48(%ebp), %esi
	jne	.L2701
	movl	-52(%ebp), %eax
	subl	$1, %eax
	cmpl	$32, %esi
	je	.L2719
	leal	1(%esi), %ecx
	sall	%cl, %edi
	movl	%edi, %ecx
	subl	$1, %edi
	negl	%ecx
.L2705:
	andl	-56(%ebp), %ecx
	andl	%edi, %eax
	orl	%ecx, %eax
	movl	%eax, 4(%ebx)
	.p2align 4,,7
	.p2align 3
.L2701:
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	cmpl	$99, %eax
	movl	%eax, ksWorkUnitsCompleted
	ja	.L2712
	movl	%edx, %eax
	jmp	.L2713
	.p2align 4,,7
	.p2align 3
.L2737:
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
	movl	%edx, -48(%ebp)
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
	xorl	%ecx, %ecx
	movl	-48(%ebp), %edx
	testl	%eax, %eax
	jne	.L2686
	jmp	.L2685
	.p2align 4,,7
	.p2align 3
.L2739:
	call	halt
	.p2align 4,,7
	.p2align 3
.L2697:
	movl	-44(%ebp), %esi
	movl	%eax, (%esi)
	movl	%esi, %eax
	movl	$0, 4(%esi)
	movl	$-1, 8(%esi)
.L2683:
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
	.p2align 4,,7
	.p2align 3
.L2696:
	.cfi_restore_state
	movl	%edx, %edi
	movl	$15, %eax
	andl	$-16, %edi
	jmp	.L2711
	.p2align 4,,7
	.p2align 3
.L2712:
	movl	$0, ksWorkUnitsCompleted
	movl	-65008, %eax
	testl	%eax, %eax
	jne	.L2714
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
	movl	$32, (%esp)
	call	in8
	testb	%al, %al
	je	.L2684
.L2714:
	movl	-44(%ebp), %eax
	movl	$4, (%eax)
	movl	$0, 4(%eax)
	movl	$-1, 8(%eax)
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
	.p2align 4,,7
	.p2align 3
.L2692:
	.cfi_restore_state
	movl	%esi, %edx
	movl	$-16, %eax
	andl	$15, %edx
	testl	%edx, %edx
	jne	.L2745
	.p2align 4,,7
	.p2align 3
.L2690:
	movl	-44(%ebp), %eax
	movl	-48(%ebp), %edi
	movl	$0, (%eax)
	movl	$1, 4(%eax)
	movl	%edi, 8(%eax)
	jmp	.L2683
.L2744:
	movl	-56(%ebp), %ecx
	andl	$-16, %ecx
	cmpl	%ecx, %edi
	jne	.L2701
	movl	$3, %ecx
	jmp	.L2716
	.p2align 4,,7
	.p2align 3
.L2742:
	movl	-44(%ebp), %eax
	movl	$0, (%eax)
	movl	$1, 4(%eax)
	movl	$-1, 8(%eax)
	jmp	.L2683
.L2719:
	movl	$15, %edi
	movl	$-16, %ecx
	jmp	.L2705
.L2743:
	subl	$1, %edx
	jne	.L2694
	jmp	.L2690
	.cfi_endproc
.LFE753:
	.size	finaliseSlot.constprop.158, .-finaliseSlot.constprop.158
	.p2align 4,,15
	.type	cteDelete.constprop.160, @function
cteDelete.constprop.160:
.LFB751:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	movl	%eax, %edx
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%eax, %ebx
	subl	$32, %esp
	.cfi_def_cfa_offset 48
	leal	20(%esp), %eax
	call	finaliseSlot.constprop.158
	movl	20(%esp), %eax
	testl	%eax, %eax
	jne	.L2747
	movl	(%ebx), %edx
	movl	28(%esp), %ecx
	movl	%edx, %esi
	movl	%edx, %eax
	andl	$14, %esi
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %esi
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L2769
	movl	12(%ebx), %edi
	movl	8(%ebx), %esi
	movl	%edi, %eax
	andl	$-8, %eax
	andl	$-8, %esi
	je	.L2751
	movl	12(%esi), %edx
	andl	$7, %edx
	orl	%eax, %edx
	movl	%edx, 12(%esi)
.L2751:
	testl	%eax, %eax
	je	.L2752
	movl	8(%eax), %edx
	andl	$1, %edi
	andl	$7, %edx
	orl	%esi, %edx
	movl	12(%eax), %esi
	movl	%edx, 8(%eax)
	movl	$1, %edx
	testl	$1, %esi
	cmove	%edi, %edx
	andl	$-2, %esi
	orl	%esi, %edx
	movl	%edx, 12(%eax)
.L2752:
	cmpl	$-1, %ecx
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	je	.L2769
	cmpl	$15, %ecx
	movl	$0, intStateIRQTable(,%ecx,4)
	jle	.L2770
.L2769:
	xorl	%eax, %eax
.L2747:
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
	.p2align 4,,7
	.p2align 3
.L2770:
	.cfi_restore_state
	cmpl	$7, %ecx
	jg	.L2755
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
.L2756:
	movl	%ebx, (%esp)
	call	in8
	movl	%ebx, (%esp)
	orl	%esi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
	jmp	.L2769
	.p2align 4,,7
	.p2align 3
.L2755:
	subl	$8, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %ebx
	movl	%eax, %esi
	jmp	.L2756
	.cfi_endproc
.LFE751:
	.size	cteDelete.constprop.160, .-cteDelete.constprop.160
	.p2align 4,,15
	.globl	invokeCNodeDelete
	.type	invokeCNodeDelete, @function
invokeCNodeDelete:
.LFB465:
	.cfi_startproc
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
	movl	48(%esp), %ebx
	leal	20(%esp), %eax
	movl	%ebx, %edx
	call	finaliseSlot.constprop.158
	movl	20(%esp), %eax
	testl	%eax, %eax
	jne	.L2772
	movl	(%ebx), %edx
	movl	28(%esp), %ecx
	movl	%edx, %esi
	movl	%edx, %eax
	andl	$14, %esi
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %esi
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L2794
	movl	12(%ebx), %edi
	movl	8(%ebx), %esi
	movl	%edi, %eax
	andl	$-8, %eax
	andl	$-8, %esi
	je	.L2776
	movl	12(%esi), %edx
	andl	$7, %edx
	orl	%eax, %edx
	movl	%edx, 12(%esi)
.L2776:
	testl	%eax, %eax
	je	.L2777
	movl	8(%eax), %edx
	andl	$1, %edi
	andl	$7, %edx
	orl	%esi, %edx
	movl	12(%eax), %esi
	movl	%edx, 8(%eax)
	movl	$1, %edx
	testl	$1, %esi
	cmove	%edi, %edx
	andl	$-2, %esi
	orl	%esi, %edx
	movl	%edx, 12(%eax)
.L2777:
	cmpl	$-1, %ecx
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	je	.L2794
	cmpl	$15, %ecx
	movl	$0, intStateIRQTable(,%ecx,4)
	jle	.L2795
.L2794:
	xorl	%eax, %eax
.L2772:
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
	.p2align 4,,7
	.p2align 3
.L2795:
	.cfi_restore_state
	cmpl	$7, %ecx
	jg	.L2780
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
.L2781:
	movl	%ebx, (%esp)
	call	in8
	movl	%ebx, (%esp)
	orl	%esi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
	jmp	.L2794
	.p2align 4,,7
	.p2align 3
.L2780:
	subl	$8, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %ebx
	movl	%eax, %esi
	jmp	.L2781
	.cfi_endproc
.LFE465:
	.size	invokeCNodeDelete, .-invokeCNodeDelete
	.p2align 4,,15
	.globl	cteRevoke
	.type	cteRevoke, @function
cteRevoke:
.LFB476:
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
	movl	64(%esp), %esi
	.p2align 4,,7
	.p2align 3
.L2862:
	movl	12(%esi), %eax
	movl	%eax, %ebx
	andl	$-8, %ebx
	je	.L2799
	testb	$2, %al
	je	.L2799
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	sameRegionAs
	testl	%eax, %eax
	je	.L2799
	movl	(%esi), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$4, %eax
	je	.L2816
	cmpl	$6, %eax
	jne	.L2801
.L2816:
	movl	4(%esi), %eax
	shrl	$3, %eax
	testl	%eax, %eax
	je	.L2801
	movl	4(%ebx), %edx
	shrl	$3, %edx
	cmpl	%edx, %eax
	je	.L2866
	.p2align 4,,7
	.p2align 3
.L2799:
	xorl	%eax, %eax
.L2857:
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
.L2866:
	.cfi_restore_state
	movl	12(%ebx), %eax
	xorl	$1, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L2799
	.p2align 4,,7
	.p2align 3
.L2801:
	leal	20(%esp), %eax
	movl	%ebx, %edx
	call	finaliseSlot.constprop.158
	movl	20(%esp), %eax
	testl	%eax, %eax
	jne	.L2857
	movl	(%ebx), %edx
	movl	28(%esp), %ecx
	movl	%edx, %edi
	movl	%edx, %eax
	andl	$14, %edi
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %edi
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L2811
	movl	12(%ebx), %ebp
	movl	8(%ebx), %edi
	movl	%ebp, %eax
	andl	$-8, %eax
	andl	$-8, %edi
	je	.L2806
	movl	12(%edi), %edx
	andl	$7, %edx
	orl	%eax, %edx
	movl	%edx, 12(%edi)
.L2806:
	testl	%eax, %eax
	je	.L2807
	movl	8(%eax), %edx
	andl	$1, %ebp
	andl	$7, %edx
	orl	%edi, %edx
	movl	$1, %edi
	movl	%edx, 8(%eax)
	movl	12(%eax), %edx
	testb	$1, %dl
	cmovne	%edi, %ebp
	andl	$-2, %edx
	orl	%edx, %ebp
	movl	%ebp, 12(%eax)
.L2807:
	cmpl	$-1, %ecx
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	je	.L2811
	cmpl	$15, %ecx
	movl	$0, intStateIRQTable(,%ecx,4)
	jle	.L2867
.L2811:
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	cmpl	$99, %eax
	ja	.L2868
	movl	%eax, ksWorkUnitsCompleted
	jmp	.L2862
	.p2align 4,,7
	.p2align 3
.L2868:
	movl	$0, ksWorkUnitsCompleted
	movl	-65008, %eax
	testl	%eax, %eax
	jne	.L2822
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
	movl	$32, (%esp)
	call	in8
	testb	%al, %al
	je	.L2862
.L2822:
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$4, %eax
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
.L2867:
	.cfi_restore_state
	cmpl	$7, %ecx
	jg	.L2809
	movl	$1, %eax
	movl	$33, %ebx
	sall	%cl, %eax
	movl	%eax, %edi
.L2810:
	movl	%ebx, (%esp)
	call	in8
	movl	%ebx, (%esp)
	orl	%edi, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
	jmp	.L2811
	.p2align 4,,7
	.p2align 3
.L2809:
	subl	$8, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %ebx
	movl	%eax, %edi
	jmp	.L2810
	.cfi_endproc
.LFE476:
	.size	cteRevoke, .-cteRevoke
	.p2align 4,,15
	.globl	invokeCNodeRevoke
	.type	invokeCNodeRevoke, @function
invokeCNodeRevoke:
.LFB464:
	.cfi_startproc
	jmp	cteRevoke
	.cfi_endproc
.LFE464:
	.size	invokeCNodeRevoke, .-invokeCNodeRevoke
	.p2align 4,,15
	.globl	updateCapData
	.type	updateCapData, @function
updateCapData:
.LFB521:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	24(%esp), %edx
	movl	12(%esp), %eax
	movl	28(%esp), %ebx
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L2871
	movl	%edx, %ecx
	andl	$15, %ecx
	testb	$1, %dl
	jne	.L2902
.L2882:
	cmpl	$6, %ecx
	je	.L2884
	cmpl	$10, %ecx
	je	.L2885
	cmpl	$4, %ecx
	.p2align 4,,2
	je	.L2884
.L2896:
	movl	%edx, (%eax)
	movl	%ebx, 4(%eax)
.L2870:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L2902:
	.cfi_restore_state
	movl	%edx, %ecx
	andl	$15, %ecx
.L2876:
	cmpl	$11, %ecx
	jne	.L2896
	movl	20(%esp), %ecx
	movzwl	20(%esp), %edx
	shrl	$16, %ecx
	cmpw	%dx, %cx
	ja	.L2881
	cmpw	%dx, %bx
	jb	.L2881
	shrl	$16, %ebx
	cmpw	%bx, %cx
	jb	.L2881
	sall	$16, %ecx
	orl	%edx, %ecx
	movl	$11, (%eax)
	movl	%ecx, 4(%eax)
	jmp	.L2870
	.p2align 4,,7
	.p2align 3
.L2884:
	movl	16(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L2881
	movl	%ebx, %ecx
	shrl	$3, %ecx
	testl	%ecx, %ecx
	jne	.L2881
	movl	20(%esp), %esi
	movl	%edx, (%eax)
	leal	0(,%esi,8), %edx
	orl	%ebx, %edx
	movl	%edx, 4(%eax)
	jmp	.L2870
	.p2align 4,,7
	.p2align 3
.L2881:
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L2871:
	.cfi_restore_state
	testb	$1, %dl
	movzbl	%dl, %ecx
	je	.L2882
	movzbl	%dl, %ecx
	jmp	.L2876
	.p2align 4,,7
	.p2align 3
.L2885:
	movl	20(%esp), %ecx
	movl	%ebx, %esi
	andl	$260046848, %esi
	shrl	$23, %esi
	andl	$248, %ecx
	shrl	$3, %ecx
	addl	%ecx, %esi
	cmpl	$32, %esi
	ja	.L2881
	movl	20(%esp), %esi
	andl	$-8388608, %ebx
	movl	%edx, (%eax)
	movl	$1, %edx
	sall	%cl, %edx
	subl	$1, %edx
	andl	$67108608, %esi
	shrl	$8, %esi
	andl	%esi, %edx
	orl	%edx, %ebx
	sall	$18, %ecx
	orl	%ecx, %ebx
	movl	%ebx, 4(%eax)
	jmp	.L2870
	.cfi_endproc
.LFE521:
	.size	updateCapData, .-updateCapData
	.p2align 4,,15
	.globl	maskCapRights
	.type	maskCapRights, @function
maskCapRights:
.LFB522:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	24(%esp), %edx
	movl	16(%esp), %eax
	movl	28(%esp), %ecx
	movl	%edx, %ebx
	andl	$14, %ebx
	cmpl	$14, %ebx
	je	.L2904
	movl	%edx, %ebx
	andl	$15, %ebx
	testb	$1, %dl
	jne	.L2928
.L2914:
	cmpl	$62, %ebx
	ja	.L2915
	jmp	*.L2917(,%ebx,4)
	.section	.rodata
	.align 4
	.align 4
.L2917:
	.long	.L2916
	.long	.L2915
	.long	.L2916
	.long	.L2915
	.long	.L2918
	.long	.L2915
	.long	.L2919
	.long	.L2915
	.long	.L2916
	.long	.L2915
	.long	.L2916
	.long	.L2915
	.long	.L2916
	.long	.L2915
	.long	.L2916
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2916
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2916
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2915
	.long	.L2916
	.text
	.p2align 4,,7
	.p2align 3
.L2928:
	movl	%edx, %ebx
	andl	$15, %ebx
	cmpl	$1, %ebx
	je	.L2929
.L2916:
	movl	%edx, (%eax)
	movl	%ecx, 4(%eax)
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L2904:
	.cfi_restore_state
	testb	$1, %dl
	movzbl	%dl, %ebx
	je	.L2914
	movzbl	%dl, %ebx
	cmpl	$1, %ebx
	jne	.L2916
.L2929:
	movl	%edx, %ebx
	andl	$50331648, %ebx
	shrl	$24, %ebx
	cmpl	$2, %ebx
	je	.L2930
	cmpl	$3, %ebx
	movl	$16777216, %esi
	je	.L2931
.L2912:
	andl	$-50331649, %edx
	orl	%esi, %edx
	movl	%edx, (%eax)
	movl	%ecx, 4(%eax)
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L2919:
	.cfi_restore_state
	movl	%edx, (%eax)
	movl	%ecx, %edx
	andl	$2, %edx
	shrl	%edx
	andl	20(%esp), %edx
	leal	(%edx,%edx), %ebx
	movl	%ecx, %edx
	andl	$-4, %edx
	orl	%ebx, %edx
	movl	20(%esp), %ebx
	andl	$2, %ebx
	shrl	%ebx
	andl	%ecx, %ebx
	orl	%ebx, %edx
	movl	%edx, 4(%eax)
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L2918:
	.cfi_restore_state
	movl	%edx, (%eax)
	movl	%ecx, %edx
	andl	$2, %edx
	shrl	%edx
	andl	20(%esp), %edx
	leal	(%edx,%edx), %ebx
	movl	%ecx, %edx
	andl	$-4, %edx
	orl	%ebx, %edx
	movl	20(%esp), %ebx
	andl	$2, %ebx
	shrl	%ebx
	andl	%ecx, %ebx
	andl	$4, %ecx
	andl	20(%esp), %ecx
	orl	%ebx, %edx
	andl	$-5, %edx
	orl	%ecx, %edx
	movl	%edx, 4(%eax)
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L2915:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L2931:
	testb	$2, 20(%esp)
	je	.L2912
	movl	20(%esp), %ebx
	andl	$1, %ebx
	cmpl	$1, %ebx
	sbbl	%esi, %esi
	andl	$-16777216, %esi
	addl	$50331648, %esi
	jmp	.L2912
	.p2align 4,,7
	.p2align 3
.L2930:
	movl	20(%esp), %ebx
	andl	$2, %ebx
	shrl	%ebx
	cmpl	$1, %ebx
	sbbl	%esi, %esi
	andl	$-16777216, %esi
	addl	$33554432, %esi
	jmp	.L2912
	.cfi_endproc
.LFE522:
	.size	maskCapRights, .-maskCapRights
	.p2align 4,,15
	.globl	createObject
	.type	createObject, @function
createObject:
.LFB523:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	16(%ebp), %edx
	cmpl	$4, %eax
	ja	.L2965
	cmpl	$2, %eax
	je	.L2936
	jbe	.L2966
	cmpl	$3, %eax
	.p2align 4,,5
	je	.L2939
	cmpl	$4, %eax
	.p2align 4,,5
	jne	.L2935
	movl	20(%ebp), %eax
	leal	4(%eax), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	%edx, %ecx
	testl	%eax, %eax
	je	.L2946
	.p2align 4,,7
	.p2align 3
.L2958:
	movl	$0, (%ecx)
	addl	$4, %ecx
	subl	$4, %eax
	jne	.L2958
.L2946:
	movl	20(%ebp), %eax
	andl	$-32, %edx
	shrl	%edx
	orl	$10, %edx
	movl	%edx, (%ebx)
	andl	$31, %eax
	sall	$23, %eax
	movl	%eax, 4(%ebx)
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
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
	.p2align 4,,7
	.p2align 3
.L2966:
	.cfi_restore_state
	cmpl	$1, %eax
	jne	.L2935
	testb	$1, %dl
	movl	%edx, %edi
	movl	$1024, %esi
	jne	.L2967
.L2941:
	testl	$2, %edi
	jne	.L2968
.L2942:
	movl	%esi, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testl	$2, %esi
	rep stosl
	je	.L2943
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
.L2943:
	andl	$1, %esi
	je	.L2944
	movb	$0, (%edi)
.L2944:
	movl	$0, 256(%edx)
	leal	256(%edx), %eax
	movl	$ia32KSnullFpuState, %esi
	leal	336(%edx), %edi
	movl	ksCurDomain, %edx
	movl	$128, %ecx
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	movl	$0, 16(%eax)
	movl	$0, 20(%eax)
	movl	$0, 24(%eax)
	movl	$35, 28(%eax)
	movl	$35, 32(%eax)
	movl	$0, 36(%eax)
	movl	$0, 40(%eax)
	movl	$0, 48(%eax)
	movl	$0, 52(%eax)
	movl	$0, 44(%eax)
	movl	$0, 56(%eax)
	movl	$27, 60(%eax)
	movl	$514, 64(%eax)
	movl	$0, 68(%eax)
	movl	$35, 72(%eax)
	rep movsl
	movl	$1, 628(%eax)
	movl	%edx, 620(%eax)
	andl	$-16, %eax
	orl	$12, %eax
	movl	%eax, (%ebx)
	movl	%ebx, %eax
	movl	$0, 4(%ebx)
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
	.p2align 4,,7
	.p2align 3
.L2965:
	.cfi_restore_state
	movl	20(%ebp), %esi
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	movl	%edx, 8(%esp)
	movl	%esi, 12(%esp)
	call	Arch_createObject
	movl	%ebx, %eax
	subl	$4, %esp
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
	.p2align 4,,7
	.p2align 3
.L2935:
	.cfi_restore_state
	movl	20(%ebp), %eax
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, (%ebx)
	andl	$31, %eax
	movl	%eax, 4(%ebx)
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
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
	.p2align 4,,7
	.p2align 3
.L2939:
	.cfi_restore_state
	movl	$0, (%edx)
	movl	%ebx, %eax
	movl	$0, 4(%edx)
	movl	$0, 8(%edx)
	movl	$0, 12(%edx)
	andl	$-16, %edx
	orl	$6, %edx
	movl	%edx, (%ebx)
	movl	$3, 4(%ebx)
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
	.p2align 4,,7
	.p2align 3
.L2936:
	.cfi_restore_state
	movl	$0, (%edx)
	movl	%ebx, %eax
	movl	$0, 4(%edx)
	movl	$0, 8(%edx)
	movl	$0, 12(%edx)
	andl	$-16, %edx
	orl	$4, %edx
	movl	%edx, (%ebx)
	movl	$7, 4(%ebx)
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
.L2967:
	.cfi_restore_state
	movb	$0, (%edx)
	leal	1(%edx), %edi
	movw	$1023, %si
	jmp	.L2941
.L2968:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %esi
	jmp	.L2942
	.cfi_endproc
.LFE523:
	.size	createObject, .-createObject
	.p2align 4,,15
	.globl	createNewObjects
	.type	createNewObjects, @function
createNewObjects:
.LFB524:
	.cfi_startproc
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
	movl	24(%ebp), %eax
	movl	%eax, %esi
	movl	%eax, -40(%ebp)
	movl	32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	getObjectSize
	testl	%esi, %esi
	movl	%eax, -36(%ebp)
	je	.L2969
	movl	12(%ebp), %eax
	xorl	%esi, %esi
	movl	20(%ebp), %ebx
	movl	$1, -52(%ebp)
	andl	$-8, %eax
	movl	%eax, -44(%ebp)
	movl	32(%ebp), %eax
	sall	$4, %ebx
	addl	16(%ebp), %ebx
	leal	4(%eax), %ecx
	andl	$31, %eax
	sall	%cl, -52(%ebp)
	movl	%eax, -56(%ebp)
	sall	$23, %eax
	movl	%eax, -60(%ebp)
.L2989:
	movzbl	-36(%ebp), %ecx
	movl	%esi, %edx
	sall	%cl, %edx
	addl	28(%ebp), %edx
	cmpl	$4, 8(%ebp)
	movl	%edx, %eax
	ja	.L3008
	cmpl	$2, 8(%ebp)
	je	.L2974
	jbe	.L3009
	cmpl	$3, 8(%ebp)
	.p2align 4,,3
	je	.L2977
	cmpl	$4, 8(%ebp)
	.p2align 4,,3
	jne	.L2973
	movl	-52(%ebp), %edi
	testl	%edi, %edi
	movl	%edi, %ecx
	je	.L2984
	.p2align 4,,7
	.p2align 3
.L3000:
	movl	$0, (%eax)
	addl	$4, %eax
	subl	$4, %ecx
	jne	.L3000
.L2984:
	movl	-60(%ebp), %ecx
	andl	$-32, %edx
	shrl	%edx
	orl	$10, %edx
	.p2align 4,,7
	.p2align 3
.L2972:
	movl	12(%ebp), %eax
	movl	-44(%ebp), %edi
	movl	12(%eax), %eax
	movl	%edx, (%ebx)
	movl	%ecx, 4(%ebx)
	movl	%edi, 8(%ebx)
	andl	$-8, %eax
	movl	%eax, %edx
	orl	$3, %edx
	movl	%edx, 12(%ebx)
	movl	%ebx, %edx
	andl	$-8, %edx
	testl	%eax, %eax
	je	.L2987
	movl	8(%eax), %ecx
	andl	$7, %ecx
	orl	%edx, %ecx
	movl	%ecx, 8(%eax)
.L2987:
	movl	12(%ebp), %eax
	addl	$1, %esi
	addl	$16, %ebx
	movl	12(%ebp), %edi
	movl	12(%eax), %eax
	andl	$7, %eax
	orl	%edx, %eax
	cmpl	-40(%ebp), %esi
	movl	%eax, 12(%edi)
	jne	.L2989
.L2969:
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
	.p2align 4,,7
	.p2align 3
.L3009:
	.cfi_restore_state
	cmpl	$1, 8(%ebp)
	jne	.L2973
	testb	$1, %dl
	movl	%edx, %edi
	movl	$1024, -48(%ebp)
	jne	.L3010
.L2979:
	testl	$2, %edi
	jne	.L3011
.L2980:
	movl	-48(%ebp), %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	rep stosl
	testb	$2, -48(%ebp)
	jne	.L3012
	testb	$1, -48(%ebp)
	jne	.L3013
.L2982:
	leal	256(%edx), %edi
	movl	%edi, (%esp)
	call	Arch_initContext
	movl	ksCurDomain, %eax
	xorl	%ecx, %ecx
	movl	$1, 628(%edi)
	movl	%eax, 620(%edi)
	andl	$-16, %edi
	movl	%edi, %edx
	orl	$12, %edx
	jmp	.L2972
	.p2align 4,,7
	.p2align 3
.L3008:
	movl	32(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 12(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	Arch_createObject
	movl	-32(%ebp), %edx
	movl	-28(%ebp), %ecx
	subl	$4, %esp
	jmp	.L2972
	.p2align 4,,7
	.p2align 3
.L2974:
	movl	$0, (%edx)
	movl	$7, %ecx
	movl	$0, 4(%edx)
	movl	$0, 8(%edx)
	movl	$0, 12(%edx)
	andl	$-16, %edx
	orl	$4, %edx
	jmp	.L2972
	.p2align 4,,7
	.p2align 3
.L2973:
	andl	$-16, %edx
	movl	-56(%ebp), %ecx
	orl	$2, %edx
	jmp	.L2972
	.p2align 4,,7
	.p2align 3
.L2977:
	movl	$0, (%edx)
	movl	$3, %ecx
	movl	$0, 4(%edx)
	movl	$0, 8(%edx)
	movl	$0, 12(%edx)
	andl	$-16, %edx
	orl	$6, %edx
	jmp	.L2972
	.p2align 4,,7
	.p2align 3
.L3013:
	movb	$0, (%edi)
	jmp	.L2982
	.p2align 4,,7
	.p2align 3
.L3012:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	testb	$1, -48(%ebp)
	je	.L2982
	jmp	.L3013
.L3011:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, -48(%ebp)
	jmp	.L2980
.L3010:
	movb	$0, (%edx)
	leal	1(%edx), %edi
	movl	$1023, -48(%ebp)
	jmp	.L2979
	.cfi_endproc
.LFE524:
	.size	createNewObjects, .-createNewObjects
	.p2align 4,,15
	.globl	tcbSchedEnqueue
	.type	tcbSchedEnqueue, @function
tcbSchedEnqueue:
.LFB530:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %eax
	movl	600(%eax), %ecx
	testb	$1, %cl
	jne	.L3014
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
	movl	4(%esi), %ebx
	testl	%ebx, %ebx
	je	.L3017
	movl	%eax, 644(%edi)
.L3016:
	orl	$1, %ecx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ebx, 4(%esi)
	movl	%ecx, 600(%eax)
.L3014:
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
.L3017:
	.cfi_restore_state
	movl	%eax, %ebx
	jmp	.L3016
	.cfi_endproc
.LFE530:
	.size	tcbSchedEnqueue, .-tcbSchedEnqueue
	.p2align 4,,15
	.globl	timerTick
	.type	timerTick, @function
timerTick:
.LFB454:
	.cfi_startproc
	movl	ksCurThread, %eax
	movl	592(%eax), %edx
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L3028
	movl	628(%eax), %edx
	cmpl	$1, %edx
	jbe	.L3021
	subl	$1, %edx
	movl	%edx, 628(%eax)
	ret
	.p2align 4,,7
	.p2align 3
.L3021:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	movl	600(%eax), %ecx
	movl	$1, 628(%eax)
	testb	$1, %cl
	jne	.L3022
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	movl	ksReadyQueues(,%edx,8), %ebx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	4(%esi), %edi
	testl	%ebx, %ebx
	je	.L3025
	movl	%eax, 640(%edi)
.L3023:
	orl	$1, %ecx
	movl	%edi, 644(%eax)
	movl	$0, 640(%eax)
	movl	%ebx, ksReadyQueues(,%edx,8)
	movl	%eax, 4(%esi)
	movl	%ecx, 600(%eax)
.L3022:
	movl	ksSchedulerAction, %eax
	leal	-1(%eax), %edx
	cmpl	$-3, %edx
	ja	.L3024
	movl	%eax, (%esp)
	call	tcbSchedEnqueue
.L3024:
	movl	$-1, ksSchedulerAction
	addl	$4, %esp
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
.L3028:
	rep ret
	.p2align 4,,7
	.p2align 3
.L3025:
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	movl	%eax, %ebx
	jmp	.L3023
	.cfi_endproc
.LFE454:
	.size	timerTick, .-timerTick
	.p2align 4,,15
	.type	possibleSwitchTo, @function
possibleSwitchTo:
.LFB449:
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
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	ksCurThread, %ecx
	movl	624(%eax), %ebx
	movl	ksSchedulerAction, %esi
	movl	624(%ecx), %edi
	movl	620(%eax), %ecx
	cmpl	ksCurDomain, %ecx
	jne	.L3050
	cmpl	%ebx, %edi
	jae	.L3051
.L3034:
	testl	%esi, %esi
	je	.L3052
.L3035:
	movl	600(%eax), %edx
	testb	$1, %dl
	jne	.L3049
	sall	$8, %ecx
	addl	%ecx, %ebx
	leal	ksReadyQueues(,%ebx,8), %edi
	movl	ksReadyQueues(,%ebx,8), %ebp
	movl	4(%edi), %ecx
	testl	%ecx, %ecx
	je	.L3041
	movl	%eax, 644(%ebp)
.L3037:
	orl	$1, %edx
	movl	$0, 644(%eax)
	movl	%ebp, 640(%eax)
	movl	%eax, ksReadyQueues(,%ebx,8)
	movl	%ecx, 4(%edi)
	movl	%edx, 600(%eax)
.L3049:
	leal	-1(%esi), %eax
	cmpl	$-3, %eax
	jbe	.L3053
.L3029:
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
	.p2align 4,,7
	.p2align 3
.L3051:
	.cfi_restore_state
	testl	%edx, %edx
	je	.L3035
	cmpl	%edi, %ebx
	jne	.L3035
	.p2align 4,,7
	jmp	.L3034
	.p2align 4,,7
	.p2align 3
.L3050:
	movl	600(%eax), %edx
	testb	$1, %dl
	jne	.L3029
	sall	$8, %ecx
	addl	%ecx, %ebx
	leal	ksReadyQueues(,%ebx,8), %esi
	movl	ksReadyQueues(,%ebx,8), %edi
	movl	4(%esi), %ecx
	testl	%ecx, %ecx
	je	.L3040
	movl	%eax, 644(%edi)
.L3033:
	orl	$1, %edx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%ebx,8)
	movl	%ecx, 4(%esi)
	movl	%edx, 600(%eax)
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
	.p2align 4,,7
	.p2align 3
.L3053:
	.cfi_restore_state
	movl	%esi, (%esp)
	call	tcbSchedEnqueue
	movl	$-1, ksSchedulerAction
	jmp	.L3029
	.p2align 4,,7
	.p2align 3
.L3052:
	movl	%eax, ksSchedulerAction
	jmp	.L3029
	.p2align 4,,7
	.p2align 3
.L3041:
	movl	%eax, %ecx
	jmp	.L3037
	.p2align 4,,7
	.p2align 3
.L3040:
	movl	%eax, %ecx
	jmp	.L3033
	.cfi_endproc
.LFE449:
	.size	possibleSwitchTo, .-possibleSwitchTo
	.p2align 4,,15
	.globl	sendAsyncIPC
	.type	sendAsyncIPC, @function
sendAsyncIPC:
.LFB459:
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
	subl	$16, %esp
	.cfi_def_cfa_offset 36
	movl	36(%esp), %edx
	movl	40(%esp), %esi
	movl	44(%esp), %edi
	movl	(%edx), %eax
	movl	%eax, %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	je	.L3056
	jb	.L3057
	cmpl	$2, %ecx
	jne	.L3054
	orl	12(%edx), %edi
	orl	%esi, 8(%edx)
	movl	%edi, 12(%edx)
.L3054:
	addl	$16, %esp
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
.L3057:
	.cfi_restore_state
	andl	$-4, %eax
	orl	$2, %eax
	movl	%eax, (%edx)
	movl	%esi, 8(%edx)
	movl	%edi, 12(%edx)
	addl	$16, %esp
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
.L3056:
	.cfi_restore_state
	movl	4(%edx), %ebx
	movl	%eax, %ecx
	andl	$-16, %ecx
	movl	%ecx, 8(%esp)
	movl	%ebx, 12(%esp)
	andl	$-16, %ebx
	movl	652(%ebx), %ecx
	movl	648(%ebx), %ebp
	testl	%ecx, %ecx
	je	.L3059
	movl	%ebp, 648(%ecx)
	movl	648(%ebx), %ebp
	movl	%ebx, 4(%esp)
.L3060:
	testl	%ebp, %ebp
	je	.L3064
	movl	%ecx, 652(%ebp)
.L3061:
	movl	4(%esp), %ecx
	andl	$15, %eax
	movl	12(%esp), %ebp
	andl	$-16, %ecx
	andl	$15, %ebp
	orl	%ebp, %ecx
	movl	%ecx, 4(%edx)
	movl	8(%esp), %ecx
	andl	$-16, %ecx
	orl	%eax, %ecx
	movl	4(%esp), %eax
	testl	%eax, %eax
	je	.L3062
.L3066:
	movl	%ecx, (%edx)
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	%ebx, %eax
	xorl	%edx, %edx
	movl	%edi, 20(%ebx)
	movl	%esi, 4(%ebx)
	movl	$1, 16(%ebx)
	addl	$16, %esp
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
	jmp	possibleSwitchTo
	.p2align 4,,7
	.p2align 3
.L3062:
	.cfi_restore_state
	andl	$-4, %ecx
	jmp	.L3066
	.p2align 4,,7
	.p2align 3
.L3064:
	movl	%ecx, 8(%esp)
	jmp	.L3061
	.p2align 4,,7
	.p2align 3
.L3059:
	movl	%ebp, 4(%esp)
	jmp	.L3060
	.cfi_endproc
.LFE459:
	.size	sendAsyncIPC, .-sendAsyncIPC
	.p2align 4,,15
	.globl	handleInterrupt
	.type	handleInterrupt, @function
handleInterrupt:
.LFB511:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %ebx
	movl	intStateIRQTable(,%ebx,4), %eax
	cmpl	$1, %eax
	je	.L3069
	jb	.L3070
	cmpl	$2, %eax
	je	.L3071
	cmpl	$3, %eax
	.p2align 4,,5
	je	.L3072
	.p2align 4,,5
	call	halt
	.p2align 4,,7
	.p2align 3
.L3071:
	movl	ksCurThread, %eax
	movl	592(%eax), %edx
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L3072
	movl	628(%eax), %edx
	cmpl	$1, %edx
	jbe	.L3080
	subl	$1, %edx
	movl	%edx, 628(%eax)
.L3072:
	cmpl	$15, %ebx
	jle	.L3088
.L3085:
	movl	$0, -65360
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
	.p2align 4,,7
	.p2align 3
.L3069:
	.cfi_restore_state
	movl	%ebx, %edx
	sall	$4, %edx
	addl	intStateIRQNode, %edx
	movl	(%edx), %esi
	movl	4(%edx), %edi
	movl	%esi, %ebp
	movl	%esi, %edx
	andl	$14, %ebp
	movl	%esi, %ecx
	andl	$15, %edx
	movzbl	%cl, %ecx
	cmpl	$14, %ebp
	cmove	%ecx, %edx
	cmpl	$6, %edx
	jne	.L3070
	testl	$2, %edi
	je	.L3070
	movl	%ebx, %ecx
	andl	$-16, %esi
	sall	%cl, %eax
	shrl	$3, %edi
	movl	%eax, 8(%esp)
	movl	%edi, 4(%esp)
	movl	%esi, (%esp)
	call	sendAsyncIPC
	.p2align 4,,7
	.p2align 3
.L3070:
	cmpl	$15, %ebx
	jg	.L3085
	cmpl	$7, %ebx
	jg	.L3083
	movl	%ebx, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$33, %esi
	movl	%eax, %ebx
.L3084:
	movl	%esi, (%esp)
	call	in8
	movl	%esi, (%esp)
	orl	%ebx, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	call	out8
.L3088:
	cmpl	$39, ia32KScurInterrupt
	jle	.L3086
	movl	$32, 4(%esp)
	movl	$160, (%esp)
	call	out8
.L3086:
	movl	$32, 4(%esp)
	movl	$32, (%esp)
	call	out8
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
	.p2align 4,,7
	.p2align 3
.L3083:
	.cfi_restore_state
	leal	-8(%ebx), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %esi
	movl	%eax, %ebx
	jmp	.L3084
	.p2align 4,,7
	.p2align 3
.L3080:
	movl	600(%eax), %ecx
	movl	$1, 628(%eax)
	testb	$1, %cl
	jne	.L3081
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	movl	ksReadyQueues(,%edx,8), %esi
	leal	ksReadyQueues(,%edx,8), %edi
	movl	4(%edi), %ebp
	testl	%esi, %esi
	je	.L3089
	movl	%eax, 640(%ebp)
.L3082:
	orl	$1, %ecx
	movl	%ebp, 644(%eax)
	movl	$0, 640(%eax)
	movl	%esi, ksReadyQueues(,%edx,8)
	movl	%eax, 4(%edi)
	movl	%ecx, 600(%eax)
.L3081:
	call	rescheduleRequired
	jmp	.L3072
.L3089:
	movl	%eax, %esi
	jmp	.L3082
	.cfi_endproc
.LFE511:
	.size	handleInterrupt, .-handleInterrupt
	.section	.text.unlikely
	.type	doReplyTransfer.part.136, @function
doReplyTransfer.part.136:
.LFB727:
	.cfi_startproc
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
	movl	%ecx, (%esp)
	call	cteDeleteOne
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	handleFaultReply
	movl	$0, 604(%ebx)
	movl	$0, 608(%ebx)
	testl	%eax, %eax
	je	.L3103
	movl	592(%ebx), %eax
	movl	%ebx, (%esp)
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%ebx)
	call	scheduleTCB
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	movl	$1, %edx
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	possibleSwitchTo
.L3103:
	.cfi_restore_state
	andl	$-16, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE727:
	.size	doReplyTransfer.part.136, .-doReplyTransfer.part.136
	.text
	.p2align 4,,15
	.globl	restart
	.type	restart, @function
restart:
.LFB435:
	.cfi_startproc
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
	movl	32(%esp), %ebx
	movl	592(%ebx), %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	ja	.L3105
	movl	$1, %eax
	sall	%cl, %eax
	testb	$121, %al
	jne	.L3107
.L3105:
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
.L3107:
	.cfi_restore_state
	movl	%ebx, (%esp)
	call	ipcCancel
	movl	%ebx, %ecx
	andl	$-1024, %ecx
	movl	32(%ecx), %edx
	leal	32(%ecx), %esi
	movl	%edx, %edi
	movzbl	%dl, %eax
	andl	$14, %edi
	andl	$15, %edx
	cmpl	$14, %edi
	cmovne	%edx, %eax
	testl	%eax, %eax
	jne	.L3109
	movl	%ebx, %eax
	andl	$-16, %eax
	orl	$8, %eax
	movl	%eax, 32(%ecx)
	movl	$1, 4(%esi)
	movl	$0, 8(%esi)
	movl	$3, 12(%esi)
.L3109:
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	600(%ebx), %edx
	testb	$1, %dl
	jne	.L3110
	movl	620(%ebx), %eax
	sall	$8, %eax
	addl	624(%ebx), %eax
	leal	ksReadyQueues(,%eax,8), %esi
	movl	ksReadyQueues(,%eax,8), %edi
	movl	4(%esi), %ecx
	testl	%ecx, %ecx
	je	.L3114
	movl	%ebx, 644(%edi)
.L3111:
	orl	$1, %edx
	movl	$0, 644(%ebx)
	movl	%edi, 640(%ebx)
	movl	%ebx, ksReadyQueues(,%eax,8)
	movl	%ecx, 4(%esi)
	movl	%edx, 600(%ebx)
.L3110:
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	xorl	%edx, %edx
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	jmp	possibleSwitchTo
	.p2align 4,,7
	.p2align 3
.L3114:
	.cfi_restore_state
	movl	%ebx, %ecx
	jmp	.L3111
	.cfi_endproc
.LFE435:
	.size	restart, .-restart
	.p2align 4,,15
	.globl	performInvocation_AsyncEndpoint
	.type	performInvocation_AsyncEndpoint, @function
performInvocation_AsyncEndpoint:
.LFB527:
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
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movl	28(%esp), %edx
	movl	(%edx), %eax
	movl	%eax, %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	je	.L3119
	jb	.L3120
	cmpl	$2, %ecx
	jne	.L3118
	movl	36(%esp), %eax
	movl	32(%esp), %edi
	orl	12(%edx), %eax
	orl	%edi, 8(%edx)
	movl	%eax, 12(%edx)
.L3118:
	addl	$8, %esp
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
.L3120:
	.cfi_restore_state
	andl	$-4, %eax
	orl	$2, %eax
	movl	%eax, (%edx)
	movl	32(%esp), %eax
	movl	%eax, 8(%edx)
	movl	36(%esp), %eax
	movl	%eax, 12(%edx)
	addl	$8, %esp
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
.L3119:
	.cfi_restore_state
	movl	4(%edx), %edi
	movl	%eax, %esi
	andl	$-16, %esi
	movl	%esi, 4(%esp)
	movl	%edi, %ebx
	andl	$-16, %ebx
	movl	652(%ebx), %ecx
	movl	648(%ebx), %esi
	testl	%ecx, %ecx
	je	.L3122
	movl	%esi, 648(%ecx)
	movl	648(%ebx), %ebp
	movl	%ebx, %esi
.L3123:
	testl	%ebp, %ebp
	je	.L3127
	movl	%ecx, 652(%ebp)
.L3124:
	movl	%esi, %ecx
	andl	$15, %edi
	andl	$-16, %ecx
	andl	$15, %eax
	orl	%edi, %ecx
	movl	%ecx, 4(%edx)
	movl	4(%esp), %ecx
	andl	$-16, %ecx
	orl	%eax, %ecx
	testl	%esi, %esi
	je	.L3125
.L3129:
	movl	%ecx, (%edx)
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	36(%esp), %eax
	xorl	%edx, %edx
	movl	$1, 16(%ebx)
	movl	%eax, 20(%ebx)
	movl	32(%esp), %eax
	movl	%eax, 4(%ebx)
	movl	%ebx, %eax
	call	possibleSwitchTo
	addl	$8, %esp
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
.L3125:
	.cfi_restore_state
	andl	$-4, %ecx
	jmp	.L3129
	.p2align 4,,7
	.p2align 3
.L3127:
	movl	%ecx, 4(%esp)
	jmp	.L3124
	.p2align 4,,7
	.p2align 3
.L3122:
	movl	%esi, %ebp
	jmp	.L3123
	.cfi_endproc
.LFE527:
	.size	performInvocation_AsyncEndpoint, .-performInvocation_AsyncEndpoint
	.p2align 4,,15
	.globl	epCancelBadgedSends
	.type	epCancelBadgedSends, @function
epCancelBadgedSends:
.LFB502:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %ebp
	movl	52(%esp), %edi
	movl	0(%ebp), %eax
	movl	%eax, %edx
	andl	$3, %edx
	cmpl	$1, %edx
	je	.L3132
	jb	.L3130
	cmpl	$2, %edx
	je	.L3130
	.p2align 4,,8
	call	halt
	.p2align 4,,7
	.p2align 3
.L3140:
	movl	48(%esp), %ebp
	movl	12(%esp), %edi
	movl	4(%ebp), %ecx
	movl	%edi, %eax
	movl	0(%ebp), %edx
	andl	$-16, %eax
	andl	$15, %ecx
	orl	%ecx, %eax
	andl	$15, %edx
	movl	%eax, 4(%ebp)
	movl	8(%esp), %eax
	andl	$-16, %eax
	orl	%edx, %eax
	testl	%edi, %edi
	je	.L3153
	andl	$-4, %eax
	orl	$1, %eax
.L3153:
	movl	%eax, 0(%ebp)
	movl	ksSchedulerAction, %eax
	leal	-1(%eax), %edx
	cmpl	$-3, %edx
	ja	.L3144
	movl	%eax, (%esp)
	call	tcbSchedEnqueue
.L3144:
	movl	$-1, ksSchedulerAction
.L3130:
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
	.p2align 4,,7
	.p2align 3
.L3132:
	.cfi_restore_state
	movl	4(%ebp), %ebx
	movl	%eax, %edx
	andl	$12, %eax
	andl	$-16, %edx
	movl	%edx, 8(%esp)
	movl	%eax, 0(%ebp)
	movl	%ebx, %ecx
	andl	$15, %ecx
	andl	$-16, %ebx
	movl	%ecx, 4(%ebp)
	movl	%ebx, 12(%esp)
	je	.L3134
	movl	%ebp, 48(%esp)
	jmp	.L3141
	.p2align 4,,7
	.p2align 3
.L3135:
	testl	%esi, %esi
	je	.L3140
	movl	%esi, %ebx
.L3141:
	movl	600(%ebx), %eax
	movl	648(%ebx), %esi
	shrl	$3, %eax
	cmpl	%eax, %edi
	jne	.L3135
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	600(%ebx), %eax
	testb	$1, %al
	movl	%eax, 4(%esp)
	jne	.L3136
	movl	620(%ebx), %eax
	sall	$8, %eax
	addl	624(%ebx), %eax
	leal	ksReadyQueues(,%eax,8), %ecx
	movl	ksReadyQueues(,%eax,8), %ebp
	movl	4(%ecx), %edx
	testl	%edx, %edx
	je	.L3146
	movl	%ebx, 644(%ebp)
.L3137:
	movl	$0, 644(%ebx)
	movl	%ebp, 640(%ebx)
	movl	%ebx, ksReadyQueues(,%eax,8)
	movl	%edx, 4(%ecx)
	movl	4(%esp), %edx
	orl	$1, %edx
	movl	%edx, 600(%ebx)
.L3136:
	movl	652(%ebx), %eax
	testl	%eax, %eax
	je	.L3138
	movl	648(%ebx), %edx
	movl	%edx, 648(%eax)
	movl	648(%ebx), %edx
.L3139:
	testl	%edx, %edx
	je	.L3147
	movl	%eax, 652(%edx)
	jmp	.L3135
	.p2align 4,,7
	.p2align 3
.L3147:
	movl	%eax, 8(%esp)
	jmp	.L3135
	.p2align 4,,7
	.p2align 3
.L3138:
	movl	648(%ebx), %ecx
	movl	%ecx, 12(%esp)
	movl	%ecx, %edx
	jmp	.L3139
	.p2align 4,,7
	.p2align 3
.L3146:
	movl	%ebx, %edx
	jmp	.L3137
.L3134:
	movl	%ecx, 4(%ebp)
	orl	%edx, %eax
	jmp	.L3153
	.cfi_endproc
.LFE502:
	.size	epCancelBadgedSends, .-epCancelBadgedSends
	.p2align 4,,15
	.globl	recycleCap
	.type	recycleCap, @function
recycleCap:
.LFB517:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	16(%ebp), %ebx
	movl	8(%ebp), %esi
	movl	20(%ebp), %edi
	movl	%ebx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L3155
	movl	%ebx, %eax
	andl	$15, %eax
	testb	$1, %bl
	jne	.L3156
.L3160:
	cmpl	$10, %eax
	je	.L3161
	jbe	.L3177
	cmpl	$46, %eax
	.p2align 4,,5
	je	.L3166
.L3161:
	movl	%ebx, (%esi)
	movl	%edi, 4(%esi)
.L3154:
	leal	-12(%ebp), %esp
	movl	%esi, %eax
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
	.p2align 4,,7
	.p2align 3
.L3177:
	.cfi_restore_state
	testl	%eax, %eax
	je	.L3164
	cmpl	$4, %eax
	jne	.L3161
	movl	%edi, %eax
	shrl	$3, %eax
	testl	%eax, %eax
	je	.L3161
	movl	%eax, 4(%esp)
	movl	%ebx, %eax
	andl	$-16, %eax
	movl	%eax, (%esp)
	call	epCancelBadgedSends
	jmp	.L3161
	.p2align 4,,7
	.p2align 3
.L3155:
	testb	$1, %bl
	movzbl	%bl, %eax
	je	.L3160
.L3156:
	movl	12(%ebp), %eax
	movl	%ebx, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	call	Arch_recycleCap
	movl	%esi, %eax
	subl	$4, %esp
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
	.p2align 4,,7
	.p2align 3
.L3164:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L3166:
	andl	$16128, %ebx
	shrl	$8, %ebx
	cmpl	$32, %ebx
	je	.L3178
	leal	1(%ebx), %ecx
	movl	$-1, %eax
	andl	$-32, %edi
	andl	$31, %ebx
	sall	%cl, %eax
	andl	%eax, %edi
	shrl	%edi
	orl	$10, %edi
	sall	$23, %ebx
	movl	%edi, (%esi)
	movl	%ebx, 4(%esi)
	jmp	.L3154
	.p2align 4,,7
	.p2align 3
.L3178:
	andl	$-16, %edi
	xorl	%eax, %eax
	movl	%edi, %ebx
	movl	$164, %ecx
	addl	$256, %ebx
	movl	%ebx, %edi
	rep stosl
	movl	%ebx, (%esp)
	call	Arch_initContext
	movl	ksCurDomain, %eax
	movl	$1, 628(%ebx)
	movl	$0, 4(%esi)
	movl	%eax, 620(%ebx)
	orl	$12, %ebx
	movl	%ebx, (%esi)
	jmp	.L3154
	.cfi_endproc
.LFE517:
	.size	recycleCap, .-recycleCap
	.p2align 4,,15
	.globl	cteRecycle
	.type	cteRecycle, @function
cteRecycle:
.LFB484:
	.cfi_startproc
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
	movl	8(%ebp), %ebx
	movl	%ebx, (%esp)
	call	cteRevoke
	testl	%eax, %eax
	movl	%eax, %esi
	je	.L3188
.L3180:
	leal	-12(%ebp), %esp
	movl	%esi, %eax
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
.L3188:
	.cfi_restore_state
	leal	-36(%ebp), %eax
	movl	%ebx, %edx
	call	finaliseSlot.constprop.158
	movl	-36(%ebp), %eax
	testl	%eax, %eax
	jne	.L3184
	movl	(%ebx), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L3180
	movl	%ebx, (%esp)
	leal	-48(%ebp), %edi
	call	isFinalCapability
	movl	(%ebx), %edx
	movl	4(%ebx), %ecx
	movl	%edi, (%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 4(%esp)
	call	recycleCap
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, (%ebx)
	movl	%edx, 4(%ebx)
	subl	$4, %esp
	jmp	.L3180
	.p2align 4,,7
	.p2align 3
.L3184:
	leal	-12(%ebp), %esp
	movl	%eax, %esi
	popl	%ebx
	.cfi_restore 3
	movl	%esi, %eax
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE484:
	.size	cteRecycle, .-cteRecycle
	.p2align 4,,15
	.globl	decodeCNodeInvocation
	.type	decodeCNodeInvocation, @function
decodeCNodeInvocation:
.LFB463:
	.cfi_startproc
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
	movl	36(%ebp), %esi
	movl	28(%ebp), %ecx
	movl	8(%ebp), %ebx
	movl	12(%ebp), %edi
	movl	%esi, -68(%ebp)
	movl	24(%ebp), %esi
	movl	%ecx, -72(%ebp)
	movl	16(%ebp), %eax
	leal	-11(%ebx), %ecx
	movl	20(%ebp), %edx
	cmpl	$8, %ecx
	movl	%esi, -64(%ebp)
	jbe	.L3190
.L3241:
	movl	$3, current_syscall_error+24
	movl	$3, %eax
.L3259:
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
	.p2align 4,,7
	.p2align 3
.L3190:
	.cfi_restore_state
	cmpl	$1, %edi
	ja	.L3192
.L3222:
	movl	$7, current_syscall_error+24
	leal	-12(%ebp), %esp
	movl	$3, %eax
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
.L3192:
	.cfi_restore_state
	movl	ksCurThread, %ecx
	movl	20(%ecx), %esi
	movl	24(%ecx), %ecx
	movl	%eax, 8(%esp)
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	movl	%esi, 16(%esp)
	movl	%ecx, 20(%esp)
	movl	%edx, 12(%esp)
	movl	$0, 4(%esp)
	call	lookupSlotForCNodeOp
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %ecx
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L3259
	leal	-14(%ebx), %eax
	cmpl	$3, %eax
	jbe	.L3272
	cmpl	$11, %ebx
	je	.L3273
	cmpl	$12, %ebx
	je	.L3274
	cmpl	$19, %ebx
	.p2align 4,,2
	je	.L3275
	cmpl	$13, %ebx
	.p2align 4,,2
	je	.L3276
	xorl	%eax, %eax
	cmpl	$18, %ebx
	jne	.L3259
	cmpl	$7, %edi
	jbe	.L3222
	movl	-64(%ebp), %esi
	testl	%esi, %esi
	je	.L3222
	movl	-72(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L3222
	movl	-68(%ebp), %eax
	movl	%ecx, -92(%ebp)
	movl	12(%eax), %edx
	movl	%edx, -76(%ebp)
	movl	16(%eax), %edx
	movl	%edx, -88(%ebp)
	movl	20(%eax), %edx
	movl	%edx, -68(%ebp)
	movl	24(%eax), %edx
	movl	%edx, -80(%ebp)
	movl	%eax, %edx
	movl	28(%eax), %eax
	movl	32(%edx), %edx
	movl	%edx, %ebx
	movl	%edx, -84(%ebp)
	movl	-64(%ebp), %edx
	movl	(%edx), %esi
	movl	4(%edx), %edi
	movl	-72(%ebp), %edx
	movl	4(%edx), %ecx
	movl	(%edx), %edx
	movl	%eax, 16(%esp)
	leal	-48(%ebp), %eax
	movl	%ebx, 20(%esp)
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	call	lookupSlotForCNodeOp
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %ebx
	movl	-88(%ebp), %edx
	movl	-92(%ebp), %ecx
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L3259
	movl	-68(%ebp), %eax
	movl	%esi, 8(%esp)
	movl	%edx, 16(%esp)
	movl	%edi, 12(%esp)
	movl	%eax, 20(%esp)
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	movl	%ecx, -64(%ebp)
	call	lookupSlotForCNodeOp
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %esi
	testl	%eax, %eax
	pushl	%ecx
	movl	-64(%ebp), %ecx
	jne	.L3259
	cmpl	%ecx, %esi
	je	.L3241
	cmpl	%esi, %ebx
	je	.L3241
	cmpl	%ecx, %ebx
	.p2align 4,,5
	je	.L3227
	movl	(%ecx), %eax
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L3228
	andl	$15, %eax
.L3229:
	testl	%eax, %eax
	jne	.L3271
.L3227:
	movl	(%ebx), %eax
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L3230
	andl	$15, %eax
.L3231:
	testl	%eax, %eax
	jne	.L3232
	movl	-84(%ebp), %eax
	movl	$6, current_syscall_error+24
	movl	$1, current_syscall_error+20
.L3268:
	sall	$2, %eax
	movzbl	%al, %eax
	orl	$1, %eax
	movl	%eax, current_lookup_fault
	movl	$3, %eax
	movl	$0, current_lookup_fault+4
	jmp	.L3259
	.p2align 4,,7
	.p2align 3
.L3272:
	cmpl	$3, %edi
	jbe	.L3222
	movl	-64(%ebp), %eax
	testl	%eax, %eax
	je	.L3222
	movl	-68(%ebp), %eax
	movl	12(%eax), %edx
	movl	16(%eax), %eax
	movl	%edx, -76(%ebp)
	movl	%eax, -72(%ebp)
	movl	-64(%ebp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, -60(%ebp)
	movl	(%ecx), %edx
	movl	%eax, -64(%ebp)
	movl	%edx, %esi
	movl	%edx, %eax
	andl	$14, %esi
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %esi
	cmove	%edx, %eax
	testl	%eax, %eax
	jne	.L3271
	movl	-72(%ebp), %eax
	movl	-60(%ebp), %edx
	movl	$1, 4(%esp)
	movl	%ecx, -80(%ebp)
	movl	%eax, 20(%esp)
	movl	-76(%ebp), %eax
	movl	%edx, 12(%esp)
	movl	%eax, 16(%esp)
	movl	-64(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	lookupSlotForCNodeOp
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %esi
	movl	-80(%ebp), %ecx
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L3259
	movl	(%esi), %edx
	movl	%edx, %eax
	andl	$14, %eax
	movl	%eax, -76(%ebp)
	movl	%edx, %eax
	andl	$15, %eax
	movl	%eax, -64(%ebp)
	movzbl	%dl, %eax
	cmpl	$14, -76(%ebp)
	cmovne	-64(%ebp), %eax
	testl	%eax, %eax
	jne	.L3202
	movl	$6, current_syscall_error+24
	movl	-72(%ebp), %eax
	movl	$1, current_syscall_error+20
	jmp	.L3268
.L3271:
	movl	$8, current_syscall_error+24
	movl	$3, %eax
	jmp	.L3259
.L3275:
	movl	(%ecx), %edx
	movl	%edx, %ebx
	movl	%edx, %eax
	andl	$14, %ebx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ebx
	cmove	%edx, %eax
	testl	%eax, %eax
	jne	.L3271
	movl	ksCurThread, %edx
	movl	%ecx, -64(%ebp)
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	-64(%ebp), %ecx
	movl	%ecx, 8(%ebp)
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
	jmp	invokeCNodeSaveCaller
.L3276:
	.cfi_restore_state
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	movl	%ecx, -64(%ebp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	hasRecycleRights
	movl	-64(%ebp), %ecx
	testl	%eax, %eax
	jne	.L3221
.L3269:
	movl	$3, current_syscall_error+24
	movb	$3, %al
	jmp	.L3259
.L3273:
	movl	ksCurThread, %edx
	movl	%ecx, -64(%ebp)
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	-64(%ebp), %ecx
	movl	%ecx, 8(%ebp)
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
	jmp	cteRevoke
.L3274:
	.cfi_restore_state
	movl	ksCurThread, %edx
	movl	%ecx, -64(%ebp)
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	-64(%ebp), %ecx
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
	movl	%ecx, %eax
	jmp	cteDelete.constprop.160
.L3202:
	.cfi_restore_state
	cmpl	$16, %ebx
	je	.L3204
	cmpl	$17, %ebx
	je	.L3205
	cmpl	$15, %ebx
	.p2align 4,,2
	je	.L3206
	cmpl	$4, %edi
	.p2align 4,,2
	je	.L3222
	movl	-68(%ebp), %eax
	leal	-56(%ebp), %edx
	movl	4(%esi), %ebx
	movl	%ecx, -64(%ebp)
	movl	(%esi), %ecx
	movl	20(%eax), %eax
	movl	%ebx, 12(%esp)
	leal	-36(%ebp), %ebx
	movl	%edx, (%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	call	maskCapRights
	movl	-52(%ebp), %edx
	pushl	%eax
	movl	-56(%ebp), %eax
	movl	%edx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%eax, 8(%esp)
	movl	%ebx, (%esp)
.L3270:
	call	deriveCap
	movl	-32(%ebp), %edx
	pushl	%eax
	movl	-36(%ebp), %eax
	testl	%eax, %eax
	jne	.L3259
	movl	-28(%ebp), %ebx
	xorl	%edi, %edi
	movl	-64(%ebp), %ecx
.L3208:
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L3210
	movl	%edx, %eax
	andl	$15, %eax
.L3211:
	testl	%eax, %eax
	je	.L3269
	movl	ksCurThread, %eax
	movl	%edx, -64(%ebp)
	movl	ksCurThread, %edx
	movl	%ecx, -68(%ebp)
	movl	592(%eax), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	-64(%ebp), %edx
	testl	%edi, %edi
	movl	-68(%ebp), %ecx
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%edx, (%esp)
	movl	%ecx, 12(%esp)
	je	.L3213
	call	cteMove
	xorl	%eax, %eax
	jmp	.L3259
.L3221:
	movl	ksCurThread, %edx
	movl	%ecx, -64(%ebp)
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	-64(%ebp), %ecx
	movl	%ecx, 8(%ebp)
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
	jmp	cteRecycle
.L3206:
	.cfi_restore_state
	cmpl	$5, %edi
	jbe	.L3222
	movl	-68(%ebp), %edx
	leal	-56(%ebp), %ebx
	movl	%ecx, -64(%ebp)
	movl	4(%esi), %ecx
	movl	20(%edx), %eax
	movl	24(%edx), %edi
	movl	(%esi), %edx
	movl	%ecx, 12(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	movl	%edx, 8(%esp)
	call	maskCapRights
	movl	-52(%ebp), %edx
	pushl	%eax
	movl	-56(%ebp), %eax
	movl	%edx, 16(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, 12(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	call	updateCapData
	movl	-56(%ebp), %edx
	movl	-52(%ebp), %ecx
	pushl	%eax
	leal	-36(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%eax, (%esp)
	jmp	.L3270
.L3205:
	cmpl	$4, %edi
	je	.L3222
	movl	(%esi), %edx
	leal	-56(%ebp), %eax
	movl	%ecx, -64(%ebp)
	movl	4(%esi), %ecx
	movl	%edx, 12(%esp)
	movl	-68(%ebp), %edx
	movl	%ecx, 16(%esp)
	movl	20(%edx), %edx
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	movl	%edx, 8(%esp)
	call	updateCapData
	movl	-52(%ebp), %ebx
	movl	-56(%ebp), %edx
	movl	-64(%ebp), %ecx
	pushl	%edi
	movl	$1, %edi
	jmp	.L3208
.L3204:
	movl	4(%esi), %ebx
	movl	$1, %edi
	jmp	.L3208
.L3210:
	movzbl	%dl, %eax
	jmp	.L3211
.L3213:
	call	cteInsert
	xorl	%eax, %eax
	.p2align 4,,3
	jmp	.L3259
.L3228:
	movzbl	%al, %eax
	.p2align 4,,3
	jmp	.L3229
.L3232:
	movl	(%esi), %eax
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L3233
	andl	$15, %eax
.L3234:
	testl	%eax, %eax
	jne	.L3235
	movl	$6, current_syscall_error+24
	movl	-68(%ebp), %eax
	movl	$0, current_syscall_error+20
	jmp	.L3268
.L3230:
	movzbl	%al, %eax
	jmp	.L3231
.L3235:
	movl	(%ebx), %eax
	leal	-56(%ebp), %edi
	movl	4(%ebx), %edx
	movl	%edi, (%esp)
	movl	$1, 4(%esp)
	movl	%eax, 12(%esp)
	movl	-80(%ebp), %eax
	movl	%edx, 16(%esp)
	movl	%ecx, -84(%ebp)
	movl	%eax, 8(%esp)
	call	updateCapData
	movl	-52(%ebp), %ecx
	movl	%ecx, -68(%ebp)
	movl	-76(%ebp), %ecx
	pushl	%eax
	movl	-56(%ebp), %eax
	movl	4(%esi), %edx
	movl	%eax, -64(%ebp)
	movl	(%esi), %eax
	movl	%edx, 16(%esp)
	movl	%ecx, 8(%esp)
	movl	%edi, (%esp)
	movl	%eax, 12(%esp)
	movl	$1, 4(%esp)
	call	updateCapData
	movl	-52(%ebp), %ecx
	movl	-56(%ebp), %edi
	movl	%ecx, -72(%ebp)
	movl	-84(%ebp), %ecx
	pushl	%edx
	movl	-64(%ebp), %edx
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L3236
	movl	%edx, %eax
	andl	$15, %eax
.L3237:
	testl	%eax, %eax
	je	.L3241
	movl	%edi, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L3239
	movl	%edi, %eax
	andl	$15, %eax
.L3240:
	testl	%eax, %eax
	je	.L3241
	movl	ksCurThread, %edx
	movl	%ecx, -76(%ebp)
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	-72(%ebp), %eax
	movl	-76(%ebp), %ecx
	movl	%esi, 20(%esp)
	movl	%ebx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-64(%ebp), %eax
	movl	%ecx, 24(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, (%esp)
	movl	-68(%ebp), %eax
	movl	%eax, 4(%esp)
	call	invokeCNodeRotate
	jmp	.L3259
.L3233:
	movzbl	%al, %eax
	jmp	.L3234
.L3239:
	movl	%edi, %eax
	movzbl	%al, %eax
	.p2align 4,,3
	jmp	.L3240
.L3236:
	movzbl	-64(%ebp), %eax
	jmp	.L3237
	.cfi_endproc
.LFE463:
	.size	decodeCNodeInvocation, .-decodeCNodeInvocation
	.p2align 4,,15
	.globl	invokeCNodeRecycle
	.type	invokeCNodeRecycle, @function
invokeCNodeRecycle:
.LFB466:
	.cfi_startproc
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
	movl	8(%ebp), %ebx
	movl	%ebx, (%esp)
	call	cteRevoke
	testl	%eax, %eax
	movl	%eax, %esi
	je	.L3286
.L3278:
	leal	-12(%ebp), %esp
	movl	%esi, %eax
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
.L3286:
	.cfi_restore_state
	leal	-36(%ebp), %eax
	movl	%ebx, %edx
	call	finaliseSlot.constprop.158
	movl	-36(%ebp), %eax
	testl	%eax, %eax
	jne	.L3282
	movl	(%ebx), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L3278
	movl	%ebx, (%esp)
	leal	-48(%ebp), %edi
	call	isFinalCapability
	movl	(%ebx), %edx
	movl	4(%ebx), %ecx
	movl	%edi, (%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 4(%esp)
	call	recycleCap
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, (%ebx)
	movl	%edx, 4(%ebx)
	subl	$4, %esp
	jmp	.L3278
	.p2align 4,,7
	.p2align 3
.L3282:
	leal	-12(%ebp), %esp
	movl	%eax, %esi
	popl	%ebx
	.cfi_restore 3
	movl	%esi, %eax
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE466:
	.size	invokeCNodeRecycle, .-invokeCNodeRecycle
	.p2align 4,,15
	.globl	attemptSwitchTo
	.type	attemptSwitchTo, @function
attemptSwitchTo:
.LFB450:
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
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	ksCurThread, %ecx
	movl	24(%esp), %eax
	movl	ksCurDomain, %edx
	movl	ksSchedulerAction, %esi
	movl	624(%ecx), %edi
	movl	620(%eax), %ecx
	movl	624(%eax), %ebx
	cmpl	%ecx, %edx
	jne	.L3301
	cmpl	%ebx, %edi
	ja	.L3292
	testl	%esi, %esi
	je	.L3302
.L3292:
	movl	600(%eax), %ecx
	testb	$1, %cl
	jne	.L3300
	sall	$8, %edx
	addl	%edx, %ebx
	leal	ksReadyQueues(,%ebx,8), %edi
	movl	ksReadyQueues(,%ebx,8), %ebp
	movl	4(%edi), %edx
	testl	%edx, %edx
	je	.L3298
	movl	%eax, 644(%ebp)
.L3294:
	orl	$1, %ecx
	movl	$0, 644(%eax)
	movl	%ebp, 640(%eax)
	movl	%eax, ksReadyQueues(,%ebx,8)
	movl	%edx, 4(%edi)
	movl	%ecx, 600(%eax)
.L3300:
	leal	-1(%esi), %eax
	cmpl	$-3, %eax
	jbe	.L3303
.L3287:
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
	.p2align 4,,7
	.p2align 3
.L3301:
	.cfi_restore_state
	movl	600(%eax), %edx
	testb	$1, %dl
	jne	.L3287
	sall	$8, %ecx
	addl	%ecx, %ebx
	leal	ksReadyQueues(,%ebx,8), %esi
	movl	ksReadyQueues(,%ebx,8), %edi
	movl	4(%esi), %ecx
	testl	%ecx, %ecx
	je	.L3297
	movl	%eax, 644(%edi)
.L3291:
	orl	$1, %edx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%ebx,8)
	movl	%ecx, 4(%esi)
	movl	%edx, 600(%eax)
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
	.p2align 4,,7
	.p2align 3
.L3303:
	.cfi_restore_state
	movl	%esi, (%esp)
	call	tcbSchedEnqueue
	movl	$-1, ksSchedulerAction
	jmp	.L3287
	.p2align 4,,7
	.p2align 3
.L3302:
	movl	%eax, ksSchedulerAction
	jmp	.L3287
	.p2align 4,,7
	.p2align 3
.L3298:
	movl	%eax, %edx
	jmp	.L3294
	.p2align 4,,7
	.p2align 3
.L3297:
	movl	%eax, %ecx
	jmp	.L3291
	.cfi_endproc
.LFE450:
	.size	attemptSwitchTo, .-attemptSwitchTo
	.p2align 4,,15
	.globl	switchIfRequiredTo
	.type	switchIfRequiredTo, @function
switchIfRequiredTo:
.LFB451:
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
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	ksCurThread, %ecx
	movl	24(%esp), %eax
	movl	ksCurDomain, %edx
	movl	ksSchedulerAction, %esi
	movl	624(%ecx), %edi
	movl	620(%eax), %ecx
	movl	624(%eax), %ebx
	cmpl	%ecx, %edx
	jne	.L3318
	cmpl	%ebx, %edi
	jae	.L3309
	testl	%esi, %esi
	je	.L3319
.L3309:
	movl	600(%eax), %edi
	testl	$1, %edi
	jne	.L3317
	sall	$8, %edx
	addl	%edx, %ebx
	leal	ksReadyQueues(,%ebx,8), %ecx
	movl	ksReadyQueues(,%ebx,8), %ebp
	movl	4(%ecx), %edx
	testl	%edx, %edx
	je	.L3315
	movl	%eax, 644(%ebp)
.L3311:
	orl	$1, %edi
	movl	$0, 644(%eax)
	movl	%ebp, 640(%eax)
	movl	%eax, ksReadyQueues(,%ebx,8)
	movl	%edx, 4(%ecx)
	movl	%edi, 600(%eax)
.L3317:
	leal	-1(%esi), %eax
	cmpl	$-3, %eax
	jbe	.L3320
.L3304:
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
	.p2align 4,,7
	.p2align 3
.L3318:
	.cfi_restore_state
	movl	600(%eax), %edx
	testb	$1, %dl
	jne	.L3304
	sall	$8, %ecx
	addl	%ecx, %ebx
	leal	ksReadyQueues(,%ebx,8), %esi
	movl	ksReadyQueues(,%ebx,8), %edi
	movl	4(%esi), %ecx
	testl	%ecx, %ecx
	je	.L3314
	movl	%eax, 644(%edi)
.L3308:
	orl	$1, %edx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%ebx,8)
	movl	%ecx, 4(%esi)
	movl	%edx, 600(%eax)
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
	.p2align 4,,7
	.p2align 3
.L3320:
	.cfi_restore_state
	movl	%esi, (%esp)
	call	tcbSchedEnqueue
	movl	$-1, ksSchedulerAction
	jmp	.L3304
	.p2align 4,,7
	.p2align 3
.L3319:
	movl	%eax, ksSchedulerAction
	jmp	.L3304
	.p2align 4,,7
	.p2align 3
.L3315:
	movl	%eax, %edx
	jmp	.L3311
	.p2align 4,,7
	.p2align 3
.L3314:
	movl	%eax, %ecx
	jmp	.L3308
	.cfi_endproc
.LFE451:
	.size	switchIfRequiredTo, .-switchIfRequiredTo
	.p2align 4,,15
	.globl	tcbSchedAppend
	.type	tcbSchedAppend, @function
tcbSchedAppend:
.LFB531:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %eax
	movl	600(%eax), %ecx
	testb	$1, %cl
	jne	.L3321
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	movl	ksReadyQueues(,%edx,8), %ebx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	4(%esi), %edi
	testl	%ebx, %ebx
	je	.L3324
	movl	%eax, 640(%edi)
.L3323:
	orl	$1, %ecx
	movl	%edi, 644(%eax)
	movl	$0, 640(%eax)
	movl	%ebx, ksReadyQueues(,%edx,8)
	movl	%eax, 4(%esi)
	movl	%ecx, 600(%eax)
.L3321:
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
.L3324:
	.cfi_restore_state
	movl	%eax, %ebx
	jmp	.L3323
	.cfi_endproc
.LFE531:
	.size	tcbSchedAppend, .-tcbSchedAppend
	.p2align 4,,15
	.globl	tcbSchedDequeue
	.type	tcbSchedDequeue, @function
tcbSchedDequeue:
.LFB532:
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
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	24(%esp), %eax
	movl	600(%eax), %ecx
	testb	$1, %cl
	je	.L3326
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %ebp
	movl	4(%esi), %ebx
	movl	%ebx, (%esp)
	movl	644(%eax), %ebx
	testl	%ebx, %ebx
	je	.L3328
	movl	640(%eax), %edi
	movl	%edi, 640(%ebx)
	movl	640(%eax), %edi
.L3329:
	testl	%edi, %edi
	je	.L3331
	movl	%ebx, 644(%edi)
	movl	(%esp), %edi
.L3330:
	andl	$-2, %ecx
	movl	%ebp, ksReadyQueues(,%edx,8)
	movl	%edi, 4(%esi)
	movl	%ecx, 600(%eax)
.L3326:
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
	.p2align 4,,7
	.p2align 3
.L3328:
	.cfi_restore_state
	movl	640(%eax), %ebp
	movl	%ebp, %edi
	jmp	.L3329
	.p2align 4,,7
	.p2align 3
.L3331:
	movl	%ebx, (%esp)
	movl	%ebx, %edi
	jmp	.L3330
	.cfi_endproc
.LFE532:
	.size	tcbSchedDequeue, .-tcbSchedDequeue
	.p2align 4,,15
	.globl	chooseThread
	.type	chooseThread, @function
chooseThread:
.LFB444:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$255, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 12
	movl	ksCurDomain, %ecx
	sall	$8, %ecx
	jmp	.L3340
	.p2align 4,,7
	.p2align 3
.L3337:
	subl	$1, %eax
	cmpl	$-1, %eax
	je	.L3342
.L3340:
	leal	(%eax,%ecx), %edx
	movl	ksReadyQueues(,%edx,8), %ebx
	testl	%ebx, %ebx
	je	.L3337
	movl	%ebx, (%esp)
	call	Arch_switchToThread
	movl	%ebx, (%esp)
	call	tcbSchedDequeue
	movl	%ebx, ksCurThread
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3342:
	.cfi_restore_state
	movl	ksIdleThread, %eax
	movl	%eax, ksCurThread
	addl	$4, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE444:
	.size	chooseThread, .-chooseThread
	.section	.boot.text
	.p2align 4,,15
	.globl	create_initial_thread
	.type	create_initial_thread, @function
create_initial_thread:
.LFB412:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	$10, (%esp)
	call	alloc_region
	movl	%eax, %ebx
	xorl	%eax, %eax
	testl	%ebx, %ebx
	je	.L3344
	testb	$1, %bl
	movl	%ebx, %edi
	movl	$1024, %edx
	jne	.L3368
.L3345:
	testl	$2, %edi
	jne	.L3369
.L3346:
	movl	%edx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %dl
	rep stosl
	jne	.L3370
	andl	$1, %edx
	jne	.L3371
.L3348:
	leal	256(%ebx), %ebp
	movl	$ia32KSnullFpuState, %esi
	movl	52(%esp), %edx
	movl	$1, 628(%ebp)
	leal	336(%ebx), %edi
	movl	$128, %ecx
	movl	$0, 256(%ebx)
	movl	48(%esp), %eax
	movl	$0, 4(%ebp)
	movl	$0, 8(%ebp)
	movl	$0, 12(%ebp)
	movl	$0, 16(%ebp)
	movl	$0, 20(%ebp)
	movl	$0, 24(%ebp)
	movl	$35, 28(%ebp)
	movl	$35, 32(%ebp)
	movl	$0, 36(%ebp)
	movl	$0, 40(%ebp)
	movl	$0, 48(%ebp)
	movl	$0, 52(%ebp)
	movl	$0, 44(%ebp)
	movl	$0, 56(%ebp)
	movl	$27, 60(%ebp)
	movl	$514, 64(%ebp)
	movl	$0, 68(%ebp)
	movl	$35, 72(%ebp)
	rep movsl
	call	cap_get_capPtr
	movl	52(%esp), %edx
	movl	%ebx, 12(%esp)
	movl	%edx, 4(%esp)
	addl	$32, %eax
	movl	%eax, 8(%esp)
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	call	cteInsert
	movl	52(%esp), %edx
	movl	48(%esp), %eax
	call	cap_get_capPtr
	leal	16(%ebx), %edx
	addl	$64, %ebx
	movl	%edx, 12(%esp)
	movl	60(%esp), %edx
	movl	%edx, 4(%esp)
	addl	$48, %eax
	movl	%eax, 8(%esp)
	movl	56(%esp), %eax
	movl	%eax, (%esp)
	call	cteInsert
	movl	52(%esp), %edx
	movl	48(%esp), %eax
	call	cap_get_capPtr
	movl	80(%esp), %edx
	movl	%ebx, 12(%esp)
	movl	%edx, 4(%esp)
	addl	$160, %eax
	movl	%eax, 8(%esp)
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	cteInsert
	movl	72(%esp), %eax
	movl	%ebp, %ecx
	andl	$-1024, %ecx
	movl	$255, 624(%ebp)
	leal	32(%ecx), %esi
	movl	%eax, 636(%ebp)
	movl	68(%esp), %eax
	movl	%eax, 4(%ebp)
	movl	64(%esp), %eax
	movl	%eax, 56(%ebp)
	movl	32(%ecx), %edx
	movl	%edx, %ebx
	movl	%edx, %eax
	andl	$14, %ebx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ebx
	cmove	%edx, %eax
	movl	%ebp, %ebx
	andl	$-16, %ebx
	testl	%eax, %eax
	jne	.L3352
	movl	%ebx, %eax
	orl	$8, %eax
	movl	%eax, 32(%ecx)
	movl	$1, 4(%esi)
	movl	$0, 8(%esi)
	movl	$3, 12(%esi)
.L3352:
	movl	592(%ebp), %eax
	orl	$12, %ebx
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%ebp)
	movl	%ebp, (%esp)
	call	scheduleTCB
	movl	ksIdleThread, %eax
	movl	%ebp, (%esp)
	movl	$0, ksSchedulerAction
	movl	$1, ksDomainTime
	movl	%eax, ksCurThread
	movl	ksDomScheduleIdx, %eax
	movl	ksDomSchedule(,%eax,8), %eax
	movl	%eax, ksCurDomain
	call	Arch_switchToThread
	movl	%ebp, (%esp)
	call	tcbSchedDequeue
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	movl	%ebp, ksCurThread
	call	cap_get_capPtr
	movl	%ebx, 16(%eax)
	movl	$0, 20(%eax)
	movl	$0, 24(%eax)
	movl	$3, 28(%eax)
	movl	$1, %eax
.L3344:
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
	.p2align 4,,7
	.p2align 3
.L3371:
	.cfi_restore_state
	movb	$0, (%edi)
	jmp	.L3348
	.p2align 4,,7
	.p2align 3
.L3370:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %edx
	je	.L3348
	jmp	.L3371
	.p2align 4,,7
	.p2align 3
.L3369:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, %edx
	jmp	.L3346
	.p2align 4,,7
	.p2align 3
.L3368:
	movb	$0, (%ebx)
	leal	1(%ebx), %edi
	movw	$1023, %dx
	jmp	.L3345
	.cfi_endproc
.LFE412:
	.size	create_initial_thread, .-create_initial_thread
	.p2align 4,,15
	.globl	init_node_state
	.type	init_node_state, @function
init_node_state:
.LFB301:
	.cfi_startproc
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
	movl	$0, ndks_boot+8
	leal	-536870912(%ecx), %ebx
	movl	%eax, -60(%ebp)
	movl	8(%ebp), %eax
	movl	%ebx, -76(%ebp)
	leal	-536870912(%esi), %ebx
	movl	%ebx, -80(%ebp)
	movl	20(%ebp), %ebx
	movl	%ecx, -64(%ebp)
	leal	-536870912(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, ndks_boot
	leal	-536870912(%ebx), %ecx
	movl	16(%ebp), %ebx
	movl	%ecx, -68(%ebp)
	subl	$536870912, %eax
	movl	%eax, ndks_boot+4
	movl	64(%ebp), %eax
	leal	-536870912(%ebx), %ecx
	movl	48(%ebp), %ebx
	movl	%ecx, -84(%ebp)
	movl	$0, ndks_boot+12
	movl	%eax, 4(%esp)
	movl	60(%ebp), %eax
	leal	-536870912(%ebx), %ecx
	movl	44(%ebp), %ebx
	movl	%ecx, -72(%ebp)
	movl	%eax, (%esp)
	leal	-536870912(%ebx), %ecx
	movl	%ecx, -88(%ebp)
	call	init_vm_state
	testl	%eax, %eax
	jne	.L3373
.L3420:
	xorl	%eax, %eax
.L3507:
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
	.p2align 4,,7
	.p2align 3
.L3373:
	.cfi_restore_state
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	create_root_cnode
	movl	-44(%ebp), %edx
	movl	-48(%ebp), %eax
	movl	%edx, -52(%ebp)
	movl	%eax, -56(%ebp)
	subl	$4, %esp
	call	cap_get_capPtr
	movl	-52(%ebp), %edx
	movl	$11, 112(%eax)
	movl	$65535, 116(%eax)
	movl	$0, 120(%eax)
	movl	$3, 124(%eax)
	movl	-56(%ebp), %eax
	call	cap_get_capPtr
	movl	$62, 176(%eax)
	movl	$0, 180(%eax)
	movl	$0, 184(%eax)
	movl	$3, 188(%eax)
	call	alloc_region.constprop.155
	testl	%eax, %eax
	movl	%eax, %edx
	je	.L3420
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %ebx
	jne	.L3515
.L3376:
	testl	$2, %edi
	jne	.L3516
.L3377:
	movl	%ebx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %bl
	rep stosl
	jne	.L3517
	andl	$1, %ebx
	jne	.L3518
.L3379:
	movl	52(%ebp), %eax
	xorl	%edi, %edi
	movl	%edx, intStateIRQNode
	movl	%esi, -92(%ebp)
	testl	%eax, %eax
	jne	.L3381
	cmpl	$2, %edi
	je	.L3382
	.p2align 4,,7
	.p2align 3
.L3519:
	cmpl	$30, %edi
	je	.L3382
	cmpl	$15, %edi
	movl	$0, intStateIRQTable(,%edi,4)
	ja	.L3384
	movl	%edi, %eax
	call	pic_mask_irq.constprop.171
	.p2align 4,,7
	.p2align 3
.L3384:
	addl	$1, %edi
	cmpl	$31, %edi
	je	.L3513
	cmpl	$2, %edi
	jne	.L3519
.L3382:
	cmpl	$15, %edi
	movl	$3, intStateIRQTable(,%edi,4)
	jg	.L3384
	cmpl	$7, %edi
	jle	.L3385
	leal	-8(%edi), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %esi
	movl	%eax, %ebx
.L3387:
	movl	%esi, (%esp)
	notl	%ebx
	call	in8
	movl	%ebx, %edx
	movl	%esi, (%esp)
	andl	%eax, %edx
	movzbl	%dl, %edx
	movl	%edx, 4(%esp)
	call	out8
	jmp	.L3384
	.p2align 4,,7
	.p2align 3
.L3433:
	cmpl	$15, %edi
	movl	$3, intStateIRQTable(,%edi,4)
	jle	.L3520
.L3393:
	addl	$1, %edi
	cmpl	$31, %edi
	je	.L3513
.L3381:
	cmpl	$2, %edi
	je	.L3433
	cmpl	$30, %edi
	je	.L3433
	cmpl	$16, %edi
	sbbl	%eax, %eax
	andl	$3, %eax
	movl	%eax, intStateIRQTable(,%edi,4)
	jmp	.L3393
	.p2align 4,,7
	.p2align 3
.L3520:
	cmpl	$7, %edi
	jle	.L3521
	leal	-8(%edi), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	$161, %esi
	movl	%eax, %ebx
.L3395:
	movl	%esi, (%esp)
	notl	%ebx
	call	in8
	movl	%ebx, %edx
	movl	%esi, (%esp)
	andl	%eax, %edx
	movzbl	%dl, %edx
	movl	%edx, 4(%esp)
	call	out8
	jmp	.L3393
	.p2align 4,,7
	.p2align 3
.L3521:
	movl	$1, %eax
	movl	%edi, %ecx
	sall	%cl, %eax
	movl	$33, %esi
	movl	%eax, %ebx
	jmp	.L3395
	.p2align 4,,7
	.p2align 3
.L3385:
	movl	$1, %eax
	movl	%edi, %ecx
	sall	%cl, %eax
	movl	$33, %esi
	movl	%eax, %ebx
	jmp	.L3387
	.p2align 4,,7
	.p2align 3
.L3518:
	movb	$0, (%edi)
	jmp	.L3379
	.p2align 4,,7
	.p2align 3
.L3517:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	andl	$1, %ebx
	je	.L3379
	jmp	.L3518
.L3516:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	subl	$2, %ebx
	jmp	.L3377
.L3515:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$4095, %bx
	jmp	.L3376
.L3513:
	movl	-92(%ebp), %esi
	movl	-56(%ebp), %eax
	movl	-52(%ebp), %edx
	subl	-60(%ebp), %esi
	movl	$2, intStateIRQTable+124
	movl	%esi, -100(%ebp)
	call	cap_get_capPtr
	movl	$14, 64(%eax)
	movl	$0, 68(%eax)
	movl	$0, 72(%eax)
	movl	$3, 76(%eax)
	movl	56(%ebp), %eax
	movl	%esi, 8(%esp)
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	allocate_bi_frame
	testl	%eax, %eax
	movl	%eax, -108(%ebp)
	je	.L3420
	call	alloc_region.constprop.155
	testl	%eax, %eax
	movl	%eax, %edx
	je	.L3420
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %ebx
	jne	.L3522
.L3399:
	testl	$2, %edi
	jne	.L3523
.L3400:
	movl	%ebx, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testb	$2, %bl
	rep stosl
	je	.L3401
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
.L3401:
	andl	$1, %ebx
	je	.L3402
	movb	$0, (%edi)
.L3402:
	movl	ia32KSkernelPD, %ecx
	leal	3584(%edx), %eax
	leal	4096(%edx), %ebx
	subl	%edx, %ecx
	.p2align 4,,7
	.p2align 3
.L3404:
	movl	(%ecx,%eax), %esi
	addl	$4, %eax
	movl	%esi, -4(%eax)
	cmpl	%ebx, %eax
	jne	.L3404
	movl	-100(%ebp), %eax
	andl	$-4096, %edx
	movl	%edx, -92(%ebp)
	movl	-52(%ebp), %edx
	shrl	$8, -92(%ebp)
	orl	$5, -92(%ebp)
	addl	$8192, %eax
	movl	%eax, %esi
	movl	%eax, -96(%ebp)
	movl	-56(%ebp), %eax
	call	cap_get_capPtr
	movl	-92(%ebp), %edx
	movl	-64(%ebp), %ebx
	subl	-60(%ebp), %ebx
	andl	$-4194304, %ebx
	movl	%edx, 48(%eax)
	cmpl	%ebx, %esi
	movl	$65537, 52(%eax)
	movl	$0, 56(%eax)
	movl	$3, 60(%eax)
	movl	ndks_boot+20, %eax
	movl	%eax, -104(%ebp)
	ja	.L3411
	jmp	.L3526
	.p2align 4,,7
	.p2align 3
.L3406:
	testl	$2, %edi
	jne	.L3524
.L3407:
	movl	%esi, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	testl	$2, %esi
	rep stosl
	je	.L3408
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
.L3408:
	andl	$1, %esi
	je	.L3409
	movb	$0, (%edi)
.L3409:
	andl	$-4096, %edx
	movl	-92(%ebp), %eax
	movl	%ebx, %edi
	movl	%edx, %esi
	shrl	$22, %edi
	shrl	$8, %esi
	orl	$67109888, %edi
	orl	$3, %esi
	movl	%eax, (%esp)
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	$65537, 4(%esp)
	call	map_it_pt_cap
	movl	-56(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	provide_cap
	testl	%eax, %eax
	je	.L3420
	addl	$4194304, %ebx
	cmpl	%ebx, -96(%ebp)
	jbe	.L3525
.L3411:
	call	alloc_region.constprop.155
	testl	%eax, %eax
	movl	%eax, %edx
	je	.L3420
	testb	$1, %al
	movl	%eax, %edi
	movl	$4096, %esi
	je	.L3406
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$4095, %si
	jmp	.L3406
	.p2align 4,,7
	.p2align 3
.L3524:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	subl	$2, %esi
	jmp	.L3407
.L3525:
	movl	ndks_boot+20, %edx
	movl	-104(%ebp), %esi
.L3405:
	movl	ndks_boot+16, %eax
	movl	-100(%ebp), %ebx
	movl	-92(%ebp), %edi
	movl	%esi, 40(%eax)
	movl	%edx, 44(%eax)
	movl	-108(%ebp), %eax
	leal	4096(%ebx), %esi
	movl	-52(%ebp), %edx
	movl	%esi, 20(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, 16(%esp)
	movl	-56(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	$65537, 12(%esp)
	movl	%eax, (%esp)
	call	create_bi_frame_cap
	movl	-56(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%ebx, 20(%esp)
	movl	%edi, 12(%esp)
	movl	%eax, 4(%esp)
	leal	-48(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	movl	$65537, 16(%esp)
	call	create_ipcbuf_frame
	movl	-48(%ebp), %ebx
	movl	-44(%ebp), %eax
	movl	%ebx, %ecx
	movzbl	%bl, %edx
	movl	%eax, -64(%ebp)
	andl	$14, %ecx
	movl	%ebx, %eax
	andl	$15, %eax
	subl	$4, %esp
	cmpl	$14, %ecx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L3420
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
	movl	-92(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	create_frames_of_region
	movl	-28(%ebp), %edx
	subl	$4, %esp
	testl	%edx, %edx
	je	.L3420
	movl	ndks_boot+16, %eax
	movl	-36(%ebp), %edx
	movl	-32(%ebp), %ecx
	movl	%edx, 32(%eax)
	movl	-52(%ebp), %edx
	movl	%ecx, 36(%eax)
	movl	-56(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	create_it_asid_pool
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edi
	movl	%eax, %edx
	movzbl	%al, %ecx
	andl	$14, %edx
	movl	%edx, -60(%ebp)
	movl	%eax, %edx
	subl	$4, %esp
	andl	$15, %edx
	cmpl	$14, -60(%ebp)
	cmove	%ecx, %edx
	testl	%edx, %edx
	je	.L3420
	movl	-92(%ebp), %edx
	movl	%eax, (%esp)
	movl	$65537, 12(%esp)
	movl	%edi, 4(%esp)
	movl	%edx, 8(%esp)
	call	write_it_asid_pool
	call	resetFpu
	movl	$ia32KSnullFpuState, (%esp)
	call	saveFpuState
	movl	$0, ia32KSfpuOwner
	call	create_idle_thread
	testl	%eax, %eax
	je	.L3420
	movl	-64(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%ebx, 28(%esp)
	movl	%esi, 20(%esp)
	movl	%eax, 32(%esp)
	movl	-100(%ebp), %eax
	movl	$65537, 12(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, 24(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-92(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, (%esp)
	call	create_initial_thread
	testl	%eax, %eax
	je	.L3420
	movl	-88(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	-72(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, (%esp)
	call	create_untypeds
	testl	%eax, %eax
	je	.L3420
	movl	24(%ebp), %eax
	xorl	%edi, %edi
	movl	ndks_boot+16, %esi
	movl	(%eax), %edx
	movl	ndks_boot+20, %eax
	testl	%edx, %edx
	movl	%eax, -60(%ebp)
	movl	24(%ebp), %eax
	leal	4(%eax), %ecx
	je	.L3417
.L3506:
	movl	(%ecx), %eax
	xorl	%esi, %esi
	leal	-536870912(%eax), %ebx
	movl	%eax, -64(%ebp)
	movl	4(%ecx), %eax
	testl	$4194303, %ebx
	leal	-536870912(%eax), %edx
	jne	.L3418
	xorl	%eax, %eax
	testl	$4194303, %edx
	sete	%al
	movl	%eax, %esi
.L3418:
	cmpl	%edx, %ebx
	jae	.L3430
	movl	%esi, %eax
	sall	$31, %eax
	movl	%eax, -72(%ebp)
.L3424:
	movl	%ebx, %eax
	andl	$-4096, %eax
	shrl	$8, %eax
	orl	$50331649, %eax
	movl	%eax, 8(%esp)
	movl	-72(%ebp), %eax
	movl	%edx, -76(%ebp)
	movl	-52(%ebp), %edx
	movl	%ecx, -80(%ebp)
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	provide_cap
	testl	%eax, %eax
	je	.L3420
	cmpl	$1, %esi
	movl	$4194304, %edx
	movl	-80(%ebp), %ecx
	movl	$4096, %eax
	cmove	%edx, %eax
	movl	-76(%ebp), %edx
	addl	%eax, %ebx
	cmpl	%ebx, %edx
	ja	.L3424
	movl	ndks_boot+20, %ebx
.L3419:
	cmpl	$1, %esi
	movl	$12, %edx
	movl	ndks_boot+16, %esi
	movl	$22, %eax
	cmovne	%edx, %eax
	movl	-64(%ebp), %edx
	addl	$8, %ecx
	movl	%eax, -72(%ebp)
	leal	56(%edi), %eax
	addl	$1, %edi
	sall	$4, %eax
	addl	%esi, %eax
	movl	%edx, (%eax)
	movl	-72(%ebp), %edx
	movl	%ebx, 12(%eax)
	movl	%edx, 4(%eax)
	movl	-60(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	24(%ebp), %eax
	movl	(%eax), %edx
	cmpl	%edx, %edi
	jae	.L3417
	movl	%ebx, -60(%ebp)
	jmp	.L3506
	.p2align 4,,7
	.p2align 3
.L3523:
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
	subl	$2, %ebx
	jmp	.L3400
.L3522:
	movb	$0, (%eax)
	leal	1(%eax), %edi
	movw	$4095, %bx
	jmp	.L3399
.L3417:
	movl	-84(%ebp), %eax
	movl	%edx, 892(%esi)
	movl	-52(%ebp), %edx
	movl	$0, 32(%esp)
	movl	$0, 28(%esp)
	movl	%eax, 20(%esp)
	movl	-68(%ebp), %eax
	movl	$65537, 16(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 24(%esp)
	movl	-92(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	create_frames_of_region
	movl	-28(%ebp), %eax
	subl	$4, %esp
	testl	%eax, %eax
	je	.L3420
	movl	ndks_boot+16, %ecx
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%eax, 24(%ecx)
	movl	ndks_boot+24, %eax
	movl	%edx, 28(%ecx)
	movl	ndks_boot+20, %edx
	movl	%eax, 20(%ecx)
	movl	$1, %eax
	movl	%edx, 16(%ecx)
	jmp	.L3507
.L3526:
	movl	%eax, %edx
	movl	%eax, %esi
	jmp	.L3405
.L3430:
	movl	-60(%ebp), %ebx
	jmp	.L3419
	.cfi_endproc
.LFE301:
	.size	init_node_state, .-init_node_state
	.p2align 4,,15
	.type	try_boot_node, @function
try_boot_node:
.LFB310:
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
	call	get_current_esp
	addl	$536870912, %eax
	cmpl	$_boot_stack_top, %eax
	ja	.L3528
	cmpl	$_boot_stack_bottom, %eax
	ja	.L3553
.L3528:
	shrl	$11, %eax
.L3529:
	movl	glks+24, %esi
	testl	%esi, %esi
	je	.L3530
	xorl	%ebx, %ebx
	cmpl	%eax, glks+28
	je	.L3554
	.p2align 4,,7
	.p2align 3
.L3533:
	addl	$1, %ebx
	cmpl	%esi, %ebx
	je	.L3530
	cmpl	%eax, glks+28(,%ebx,4)
	jne	.L3533
.L3531:
	movl	%ebx, %eax
	movl	glks, %ecx
	sall	$4, %eax
	movl	glks+188(%eax), %edx
	movl	%edx, 80(%esp)
	movl	glks+192(%eax), %edx
	movl	%edx, 84(%esp)
	movl	glks+196(%eax), %edx
	addl	$glks+176, %eax
	movl	24(%eax), %eax
	movl	%edx, 88(%esp)
	xorl	%edx, %edx
	movl	%eax, 92(%esp)
	movl	glks+4, %eax
	subl	%ecx, %eax
	shrl	$12, %eax
	divl	%esi
	cmpl	%edx, %ebx
	jb	.L3555
	movl	%ebx, %ebp
	subl	%edx, %ebp
	leal	1(%eax), %edi
	imull	%eax, %ebp
	imull	%edx, %edi
	leal	0(%ebp,%edi), %edx
.L3552:
	sall	$12, %edx
	movl	$1048576, %edi
	addl	%ecx, %edx
	movl	%ebx, %ebp
	sall	$12, %eax
	addl	%edx, %eax
	movl	%eax, 76(%esp)
	xorl	%eax, %eax
	cmpl	$1, %esi
	movl	%edx, 72(%esp)
	movl	$ki_boot_end+536870912, %edx
	cmovne	%eax, %edx
	cmove	%edi, %eax
	movl	%eax, 64(%esp)
	leal	(%ebx,%ebx,2), %eax
	sall	$12, %eax
	sall	$12, %ebp
	movl	%edx, 68(%esp)
	leal	kernel_pt_list(%ebp), %edi
	addl	$kernel_pd_list, %ebp
	leal	ndks_list+536883200(%eax), %edx
	addl	$ndks_list+536870912, %eax
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	%edi, 4(%esp)
	movl	%ebp, (%esp)
	call	map_kernel_window
	xorl	%edx, %edx
	testl	%eax, %eax
	je	.L3545
	leal	536870912(%ebp), %eax
#APP
# 35 "/home/mscapero/Desktop/sel4-benchmark/seL4test/kernel/include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr3
# 0 "" 2
#NO_APP
	movl	64(%esp), %eax
	movl	glks+20, %edx
	movl	%edi, 56(%esp)
	movl	%ebp, 52(%esp)
	movl	%eax, 36(%esp)
	movl	68(%esp), %eax
	movl	%edx, 12(%esp)
	movl	%esi, 48(%esp)
	movl	%ebx, 44(%esp)
	movl	%eax, 40(%esp)
	movl	80(%esp), %eax
	movl	$glks+828, 16(%esp)
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
	xorl	%edx, %edx
	testl	%eax, %eax
	jne	.L3556
.L3545:
	addl	$108, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%edx, %eax
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
.L3555:
	.cfi_restore_state
	addl	$1, %eax
	movl	%ebx, %edx
	imull	%eax, %edx
	jmp	.L3552
	.p2align 4,,7
	.p2align 3
.L3556:
	xorl	%eax, %eax
	testl	%ebx, %ebx
	setne	%al
	movl	%eax, 4(%esp)
	movl	glks+2424, %eax
	movl	%eax, (%esp)
	call	init_node_cpu
	xorl	%edx, %edx
	testl	%eax, %eax
	setne	%dl
	addl	$108, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	movl	%edx, %eax
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
.L3553:
	.cfi_restore_state
	movl	glks+28, %eax
	jmp	.L3529
.L3554:
	xorl	%ebx, %ebx
	jmp	.L3531
.L3530:
	call	halt
	.cfi_endproc
.LFE310:
	.size	try_boot_node, .-try_boot_node
	.p2align 4,,15
	.globl	boot_node
	.type	boot_node, @function
boot_node:
.LFB311:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	try_boot_node
	testl	%eax, %eax
	je	.L3560
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.L3560:
	.cfi_restore_state
	.p2align 4,,7
	call	halt
	.cfi_endproc
.LFE311:
	.size	boot_node, .-boot_node
	.text
	.p2align 4,,15
	.globl	schedule
	.type	schedule, @function
schedule:
.LFB443:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$4, %esp
	.cfi_def_cfa_offset 12
	movl	ksSchedulerAction, %eax
	cmpl	$-1, %eax
	je	.L3584
	testl	%eax, %eax
	je	.L3561
	movl	ksCurThread, %ecx
	movl	%eax, %ebx
	movl	592(%ecx), %edx
	andl	$15, %edx
	subl	$1, %edx
	cmpl	$1, %edx
	ja	.L3574
	movl	%ecx, (%esp)
	call	tcbSchedEnqueue
	movl	ksSchedulerAction, %ebx
.L3574:
	movl	%ebx, (%esp)
	call	Arch_switchToThread
	movl	%ebx, (%esp)
	call	tcbSchedDequeue
	movl	%ebx, ksCurThread
.L3583:
	movl	$0, ksSchedulerAction
.L3561:
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3584:
	.cfi_restore_state
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L3580
	movl	ksDomainTime, %eax
	movl	ksCurDomain, %ecx
	testl	%eax, %eax
	jne	.L3566
.L3585:
	movl	$0, ksDomScheduleIdx
	xorl	%ecx, %ecx
	movl	$0, ksWorkUnitsCompleted
	movl	$0, ksCurDomain
	movl	$1, ksDomainTime
.L3566:
	sall	$8, %ecx
	movl	$255, %eax
	.p2align 4,,7
	.p2align 3
.L3572:
	leal	(%eax,%ecx), %edx
	movl	ksReadyQueues(,%edx,8), %ebx
	testl	%ebx, %ebx
	jne	.L3574
	subl	$1, %eax
	cmpl	$-1, %eax
	jne	.L3572
	movl	ksIdleThread, %eax
	movl	%eax, ksCurThread
	jmp	.L3583
	.p2align 4,,7
	.p2align 3
.L3580:
	movl	%edx, (%esp)
	call	tcbSchedEnqueue
	movl	ksDomainTime, %eax
	movl	ksCurDomain, %ecx
	testl	%eax, %eax
	je	.L3585
	jmp	.L3566
	.cfi_endproc
.LFE443:
	.size	schedule, .-schedule
	.p2align 4,,15
	.globl	handleInterruptEntry
	.type	handleInterruptEntry, @function
handleInterruptEntry:
.LFB249:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	ia32KScurInterrupt, %eax
	cmpl	$-1, %eax
	je	.L3587
	subl	$32, %eax
	cmpl	$-1, %eax
	je	.L3587
	movl	%eax, (%esp)
	call	handleInterrupt
.L3587:
	call	schedule
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L3589
	cmpl	$7, %edx
	je	.L3590
	cmpl	$1, %edx
	je	.L3590
	.p2align 4,,5
	call	halt
	.p2align 4,,7
	.p2align 3
.L3589:
	movl	44(%eax), %edx
	andl	$-16, %ecx
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
	movl	%edx, 56(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
.L3590:
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE249:
	.size	handleInterruptEntry, .-handleInterruptEntry
	.p2align 4,,15
	.globl	tcbEPAppend
	.type	tcbEPAppend, @function
tcbEPAppend:
.LFB533:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	16(%esp), %ecx
	movl	8(%esp), %eax
	movl	12(%esp), %edx
	movl	20(%esp), %ebx
	testl	%ecx, %ecx
	je	.L3607
	movl	%edx, 648(%ebx)
.L3606:
	movl	%ebx, 652(%edx)
	movl	$0, 648(%edx)
	movl	%ecx, (%eax)
	movl	%edx, 4(%eax)
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L3607:
	.cfi_restore_state
	movl	%edx, %ecx
	jmp	.L3606
	.cfi_endproc
.LFE533:
	.size	tcbEPAppend, .-tcbEPAppend
	.p2align 4,,15
	.globl	tcbEPDequeue
	.type	tcbEPDequeue, @function
tcbEPDequeue:
.LFB534:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	20(%esp), %edx
	movl	16(%esp), %eax
	movl	24(%esp), %ebx
	movl	28(%esp), %esi
	movl	652(%edx), %ecx
	testl	%ecx, %ecx
	je	.L3610
	movl	648(%edx), %edi
	movl	%edi, 648(%ecx)
	movl	648(%edx), %edx
	testl	%edx, %edx
	je	.L3613
.L3615:
	movl	%ecx, 652(%edx)
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
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
	.p2align 4,,7
	.p2align 3
.L3610:
	.cfi_restore_state
	movl	648(%edx), %ebx
	movl	%ebx, %edx
	testl	%edx, %edx
	jne	.L3615
	.p2align 4,,7
	.p2align 3
.L3613:
	movl	%ecx, %esi
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
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
	.cfi_endproc
.LFE534:
	.size	tcbEPDequeue, .-tcbEPDequeue
	.p2align 4,,15
	.globl	getExtraCPtr
	.type	getExtraCPtr, @function
getExtraCPtr:
.LFB535:
	.cfi_startproc
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	movl	488(%eax,%edx,4), %eax
	ret
	.cfi_endproc
.LFE535:
	.size	getExtraCPtr, .-getExtraCPtr
	.p2align 4,,15
	.globl	setExtraBadge
	.type	setExtraBadge, @function
setExtraBadge:
.LFB536:
	.cfi_startproc
	movl	12(%esp), %edx
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movl	%ecx, 488(%eax,%edx,4)
	ret
	.cfi_endproc
.LFE536:
	.size	setExtraBadge, .-setExtraBadge
	.p2align 4,,15
	.globl	setupCallerCap
	.type	setupCallerCap, @function
setupCallerCap:
.LFB537:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	movl	24(%esp), %ebx
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$5, %eax
	cmpl	ksCurThread, %ebx
	movl	%eax, 592(%ebx)
	je	.L3623
.L3619:
	movl	28(%esp), %edx
	movl	%ebx, %eax
	andl	$-1024, %ebx
	andl	$-16, %eax
	addl	$32, %ebx
	orl	$8, %eax
	movl	%ebx, 8(%esp)
	andl	$-1024, %edx
	addl	$48, %edx
	movl	%edx, 12(%esp)
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	call	cteInsert
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3623:
	.cfi_restore_state
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L3619
	call	rescheduleRequired
	jmp	.L3619
	.cfi_endproc
.LFE537:
	.size	setupCallerCap, .-setupCallerCap
	.p2align 4,,15
	.globl	deleteCallerCap
	.type	deleteCallerCap, @function
deleteCallerCap:
.LFB538:
	.cfi_startproc
	movl	4(%esp), %eax
	andl	$-1024, %eax
	addl	$48, %eax
	movl	%eax, 4(%esp)
	jmp	cteDeleteOne
	.cfi_endproc
.LFE538:
	.size	deleteCallerCap, .-deleteCallerCap
	.p2align 4,,15
	.globl	lookupExtraCaps
	.type	lookupExtraCaps, @function
lookupExtraCaps:
.LFB539:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$40, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %edx
	testl	%edx, %edx
	je	.L3636
	movl	16(%ebp), %eax
	andl	$384, %eax
	movl	%eax, -32(%ebp)
	shrl	$7, -32(%ebp)
	movl	-32(%ebp), %eax
	testl	%eax, %eax
	je	.L3632
	movl	8(%ebp), %esi
	xorl	%ebx, %ebx
	andl	$-1024, %esi
	jmp	.L3631
	.p2align 4,,7
	.p2align 3
.L3629:
	movl	%edx, current_extra_caps(,%ebx,4)
	addl	$1, %ebx
	cmpl	-32(%ebp), %ebx
	je	.L3637
.L3631:
	movl	12(%ebp), %eax
	movl	4(%esi), %edx
	movl	488(%eax,%ebx,4), %edi
	movl	(%esi), %eax
	movl	%edx, 8(%esp)
	movl	$32, 16(%esp)
	movl	%edi, 12(%esp)
	movl	%eax, 4(%esp)
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	resolveAddressBits
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	subl	$4, %esp
	testl	%eax, %eax
	je	.L3629
	movl	$1, current_fault
	movl	%edi, current_fault+4
.L3627:
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
	.p2align 4,,7
	.p2align 3
.L3637:
	.cfi_restore_state
	xorl	%eax, %eax
	cmpl	$3, %ebx
	je	.L3627
.L3628:
	movl	$0, current_extra_caps(,%ebx,4)
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
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
.L3636:
	.cfi_restore_state
	movl	$0, current_extra_caps
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
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
.L3632:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L3628
	.cfi_endproc
.LFE539:
	.size	lookupExtraCaps, .-lookupExtraCaps
	.p2align 4,,15
	.globl	doNormalTransfer
	.type	doNormalTransfer, @function
doNormalTransfer:
.LFB438:
	.cfi_startproc
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
	movl	8(%ebp), %eax
	movl	32(%ebp), %edx
	movl	16(%eax), %edi
	movl	%edi, %ebx
	andl	$127, %ebx
	cmpl	$120, %ebx
	jbe	.L3639
	andl	$-128, %edi
	movl	$120, %ebx
	orl	$120, %edi
.L3639:
	movl	24(%ebp), %eax
	testl	%eax, %eax
	jne	.L3676
	movl	current_extra_caps+4, %eax
	xorl	%ecx, %ecx
	movl	%eax, -56(%ebp)
	movl	current_extra_caps+8, %eax
	movl	%eax, -52(%ebp)
.L3641:
	testl	%ebx, %ebx
	je	.L3659
	movl	8(%ebp), %eax
	cmpl	$1, %ebx
	movl	28(%ebp), %esi
	movl	20(%eax), %eax
	movl	%eax, 20(%esi)
	je	.L3660
	movl	8(%ebp), %eax
	testl	%edx, %edx
	sete	-88(%ebp)
	movl	24(%eax), %eax
	movl	%eax, 24(%esi)
	je	.L3662
	movl	12(%ebp), %esi
	testl	%esi, %esi
	je	.L3662
	cmpl	$2, %ebx
	jbe	.L3662
	movl	12(%ebp), %esi
	movl	$2, %eax
	movl	%ecx, -84(%ebp)
	.p2align 4,,7
	.p2align 3
.L3644:
	addl	$1, %eax
	movl	(%esi,%eax,4), %ecx
	cmpl	%ebx, %eax
	movl	%ecx, (%edx,%eax,4)
	jne	.L3644
	movl	-84(%ebp), %ecx
	movl	%eax, %esi
.L3643:
	movl	-56(%ebp), %eax
	andl	$-3969, %edi
	testl	%ecx, %ecx
	movl	%ecx, -60(%ebp)
	movl	%ecx, -48(%ebp)
	movl	%eax, -44(%ebp)
	movl	-52(%ebp), %eax
	movl	%eax, -40(%ebp)
	jne	.L3677
.L3645:
	movl	28(%ebp), %eax
	andl	$-128, %edi
	orl	%esi, %edi
	movl	28(%ebp), %edx
	movl	%edi, 16(%eax)
	movl	20(%ebp), %eax
	movl	%eax, 4(%edx)
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
	.p2align 4,,7
	.p2align 3
.L3662:
	.cfi_restore_state
	movl	$2, %esi
	jmp	.L3643
	.p2align 4,,7
	.p2align 3
.L3660:
	movl	$1, %esi
.L3642:
	testl	%edx, %edx
	sete	-88(%ebp)
	jmp	.L3643
	.p2align 4,,7
	.p2align 3
.L3659:
	xorl	%esi, %esi
	jmp	.L3642
	.p2align 4,,7
	.p2align 3
.L3676:
	movl	12(%ebp), %eax
	movl	%edi, 8(%esp)
	movl	%edx, -84(%ebp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	lookupExtraCaps
	movl	current_extra_caps+4, %ecx
	movl	-84(%ebp), %edx
	movl	%ecx, -56(%ebp)
	movl	current_extra_caps+8, %ecx
	movl	%ecx, -52(%ebp)
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmove	current_extra_caps, %ecx
	jmp	.L3641
.L3677:
	cmpb	$0, -88(%ebp)
	jne	.L3645
	movl	28(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%edx, -96(%ebp)
	movl	%eax, (%esp)
	call	getReceiveSlots
	movl	-96(%ebp), %edx
	movl	$0, -84(%ebp)
	movl	%esi, -92(%ebp)
	movl	%edx, %ebx
	movl	%eax, -88(%ebp)
.L3646:
	movl	-84(%ebp), %eax
	movl	-48(%ebp,%eax,4), %esi
	testl	%esi, %esi
	je	.L3656
	movl	(%esi), %edx
	movl	4(%esi), %eax
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L3647
	movl	%edx, %ecx
	andl	$15, %ecx
.L3648:
	cmpl	$4, %ecx
	je	.L3678
.L3649:
	cmpl	$0, -88(%ebp)
	je	.L3656
	cmpl	$0, 36(%ebp)
	movl	%edx, 8(%esp)
	movl	%eax, 12(%esp)
	je	.L3652
	leal	-80(%ebp), %eax
	movl	%eax, (%esp)
	movl	$6, 4(%esp)
	call	maskCapRights
	movl	-80(%ebp), %eax
	pushl	%edx
	movl	-76(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
.L3652:
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	%esi, 4(%esp)
	call	deriveCap
	cmpl	$0, -36(%ebp)
	pushl	%eax
	jne	.L3656
	movl	-32(%ebp), %edx
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L3654
	andl	$15, %edx
.L3655:
	testl	%edx, %edx
	je	.L3656
	movl	-88(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%esi, 8(%esp)
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
	movl	$0, -88(%ebp)
.L3650:
	addl	$1, -84(%ebp)
	cmpl	$3, -84(%ebp)
	jne	.L3646
.L3656:
	movl	%edi, %eax
	movl	-84(%ebp), %edi
	andl	$-385, %eax
	movl	-92(%ebp), %esi
	sall	$7, %edi
	andl	$384, %edi
	orl	%eax, %edi
	jmp	.L3645
.L3678:
	movl	%edx, %ecx
	andl	$-16, %ecx
	cmpl	%ecx, 16(%ebp)
	jne	.L3649
	movl	-84(%ebp), %esi
	shrl	$3, %eax
	movl	%edi, %edx
	andl	$3584, %edi
	andb	$241, %dh
	shrl	$9, %edi
	movl	%eax, 488(%ebx,%esi,4)
	movl	%esi, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	orl	%eax, %edi
	sall	$9, %edi
	andl	$3584, %edi
	orl	%edx, %edi
	jmp	.L3650
.L3654:
	movzbl	%dl, %edx
	jmp	.L3655
.L3647:
	movzbl	%dl, %ecx
	jmp	.L3648
	.cfi_endproc
.LFE438:
	.size	doNormalTransfer, .-doNormalTransfer
	.p2align 4,,15
	.globl	doIPCTransfer
	.type	doIPCTransfer, @function
doIPCTransfer:
.LFB436:
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
	movl	92(%esp), %ebx
	movl	84(%esp), %eax
	movl	80(%esp), %edi
	movl	$1, (%esp)
	movl	88(%esp), %esi
	movl	%ebx, 40(%esp)
	movl	96(%esp), %ebx
	movl	%eax, 36(%esp)
	movl	100(%esp), %ebp
	movl	%ebx, 4(%esp)
	call	lookupIPCBuffer
	testb	$7, 604(%edi)
	jne	.L3680
	movl	%edi, 4(%esp)
	movl	$0, (%esp)
	movl	%eax, 44(%esp)
	call	lookupIPCBuffer
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
.L3680:
	.cfi_restore_state
	movl	%ebx, 88(%esp)
	movl	%edi, 84(%esp)
	movl	%esi, 80(%esp)
	movl	%eax, 92(%esp)
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
	jmp	doFaultTransfer
	.cfi_endproc
.LFE436:
	.size	doIPCTransfer, .-doIPCTransfer
	.p2align 4,,15
	.globl	performInvocation_Reply
	.type	performInvocation_Reply, @function
performInvocation_Reply:
.LFB528:
	.cfi_startproc
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
	movl	ksCurThread, %esi
	movl	48(%esp), %ebx
	testb	$7, 604(%ebx)
	jne	.L3685
	movl	%ebx, 4(%esp)
	movl	$1, (%esp)
	call	lookupIPCBuffer
	testb	$7, 604(%esi)
	movl	%eax, %edi
	jne	.L3686
	movl	%esi, 4(%esp)
	movl	$0, (%esp)
	call	lookupIPCBuffer
	movl	$0, 28(%esp)
	movl	%edi, 24(%esp)
	movl	%ebx, 20(%esp)
	movl	$1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	doNormalTransfer
.L3687:
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	cteDeleteOne
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	$1, %edx
	movl	%ebx, %eax
	call	possibleSwitchTo
.L3688:
	addl	$32, %esp
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
.L3685:
	.cfi_restore_state
	movl	52(%esp), %ecx
	movl	%ebx, %edx
	movl	%esi, %eax
	call	doReplyTransfer.part.136
	jmp	.L3688
.L3686:
	movl	%eax, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%esi, 4(%esp)
	movl	$0, (%esp)
	call	doFaultTransfer
	jmp	.L3687
	.cfi_endproc
.LFE528:
	.size	performInvocation_Reply, .-performInvocation_Reply
	.p2align 4,,15
	.globl	doReplyTransfer
	.type	doReplyTransfer, @function
doReplyTransfer:
.LFB437:
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
	movl	68(%esp), %ebx
	movl	64(%esp), %esi
	movl	72(%esp), %edi
	testb	$7, 604(%ebx)
	jne	.L3691
	movl	%ebx, 4(%esp)
	movl	$1, (%esp)
	call	lookupIPCBuffer
	testb	$7, 604(%esi)
	movl	%eax, %ebp
	jne	.L3692
	movl	%esi, 4(%esp)
	movl	$0, (%esp)
	call	lookupIPCBuffer
	movl	$0, 28(%esp)
	movl	%ebp, 24(%esp)
	movl	%ebx, 20(%esp)
	movl	$1, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	doNormalTransfer
.L3693:
	movl	%edi, (%esp)
	call	cteDeleteOne
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	movl	$1, %edx
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	jmp	possibleSwitchTo
.L3691:
	.cfi_restore_state
	addl	$44, %esp
	.cfi_remember_state
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
	jmp	doReplyTransfer.part.136
.L3692:
	.cfi_restore_state
	movl	%eax, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%esi, 4(%esp)
	movl	$0, (%esp)
	call	doFaultTransfer
	jmp	.L3693
	.cfi_endproc
.LFE437:
	.size	doReplyTransfer, .-doReplyTransfer
	.p2align 4,,15
	.globl	sendIPC
	.type	sendIPC, @function
sendIPC:
.LFB496:
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
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	movl	100(%esp), %eax
	movl	116(%esp), %ebx
	movl	96(%esp), %ecx
	movl	112(%esp), %edi
	movl	%eax, 52(%esp)
	movl	104(%esp), %eax
	movl	%eax, 48(%esp)
	movl	108(%esp), %eax
	movl	%eax, 44(%esp)
	movl	(%ebx), %eax
	movl	%eax, %edx
	andl	$3, %edx
	cmpl	$1, %edx
	jbe	.L3697
	cmpl	$2, %edx
	jne	.L3695
	movl	4(%ebx), %ecx
	movl	%ecx, %esi
	andl	$-16, %esi
	movl	652(%esi), %edx
	movl	%ecx, 60(%esp)
	movl	%eax, %ecx
	andl	$-16, %ecx
	movl	%ecx, 56(%esp)
	movl	648(%esi), %ecx
	testl	%edx, %edx
	je	.L3701
	movl	%ecx, 648(%edx)
	movl	648(%esi), %ebp
	movl	%esi, %ecx
.L3702:
	testl	%ebp, %ebp
	je	.L3711
	movl	%edx, 652(%ebp)
.L3703:
	movl	60(%esp), %ebp
	movl	%ecx, %edx
	andl	$15, %eax
	andl	$-16, %edx
	andl	$15, %ebp
	orl	%ebp, %edx
	movl	%edx, 4(%ebx)
	movl	56(%esp), %edx
	andl	$-16, %edx
	orl	%eax, %edx
	testl	%ecx, %ecx
	movl	%edx, (%ebx)
	je	.L3722
.L3704:
	movl	596(%esi), %ebp
	movl	%esi, 4(%esp)
	movl	$1, (%esp)
	call	lookupIPCBuffer
	andl	$1, %ebp
	testb	$7, 604(%edi)
	jne	.L3705
	movl	%edi, 4(%esp)
	movl	$0, (%esp)
	movl	%eax, 56(%esp)
	call	lookupIPCBuffer
	movl	44(%esp), %ecx
	movl	56(%esp), %edx
	movl	%ebp, 28(%esp)
	movl	%esi, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	48(%esp), %ecx
	movl	%edx, 24(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, 12(%esp)
	movl	%edi, (%esp)
	call	doNormalTransfer
.L3706:
	movl	592(%esi), %eax
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%esi)
	movl	%esi, (%esp)
	call	scheduleTCB
	movl	$1, %edx
	movl	%esi, %eax
	call	possibleSwitchTo
	movl	52(%esp), %edx
	testl	%edx, %edx
	je	.L3723
	testl	%ebp, %ebp
	je	.L3724
.L3709:
	andl	$-16, 592(%edi)
	movl	%edi, 96(%esp)
	addl	$76, %esp
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
	jmp	scheduleTCB
	.p2align 4,,7
	.p2align 3
.L3697:
	.cfi_restore_state
	testl	%ecx, %ecx
	je	.L3695
	movl	%ebx, %eax
	movl	48(%esp), %edx
	andl	$-16, %eax
	orl	$4, %eax
	movl	%eax, 592(%edi)
	movl	600(%edi), %eax
	sall	$3, %edx
	andl	$3, %eax
	orl	%edx, %eax
	movl	44(%esp), %edx
	sall	$2, %edx
	andl	$4, %edx
	orl	%edx, %eax
	movl	52(%esp), %edx
	andl	$-3, %eax
	addl	%edx, %edx
	andl	$2, %edx
	orl	%edx, %eax
	movl	%eax, 600(%edi)
	movl	%edi, (%esp)
	call	scheduleTCB
	movl	4(%ebx), %edx
	movl	(%ebx), %ecx
	movl	%edx, %eax
	movl	%ecx, %esi
	andl	$-16, %esi
	andl	$-16, %eax
	je	.L3710
	movl	%edi, 648(%esi)
.L3700:
	movl	%esi, 652(%edi)
	andl	$-16, %eax
	andl	$15, %edx
	movl	$0, 648(%edi)
	andl	$-16, %edi
	andl	$12, %ecx
	orl	$1, %edi
	orl	%edx, %eax
	orl	%ecx, %edi
	movl	%eax, 4(%ebx)
	movl	%edi, (%ebx)
	.p2align 4,,7
	.p2align 3
.L3695:
	addl	$76, %esp
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
.L3723:
	.cfi_restore_state
	testb	$7, 604(%edi)
	je	.L3695
	testl	%ebp, %ebp
	jne	.L3709
.L3724:
	movl	44(%esp), %eax
	testl	%eax, %eax
	je	.L3709
	movl	%esi, 100(%esp)
	movl	%edi, 96(%esp)
	addl	$76, %esp
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
	jmp	setupCallerCap
	.p2align 4,,7
	.p2align 3
.L3701:
	.cfi_restore_state
	movl	%ecx, %ebp
	jmp	.L3702
	.p2align 4,,7
	.p2align 3
.L3722:
	andl	$-4, %edx
	movl	%edx, (%ebx)
	jmp	.L3704
	.p2align 4,,7
	.p2align 3
.L3711:
	movl	%edx, 56(%esp)
	jmp	.L3703
	.p2align 4,,7
	.p2align 3
.L3710:
	movl	%edi, %eax
	jmp	.L3700
.L3705:
	movl	%eax, 12(%esp)
	movl	48(%esp), %eax
	movl	%esi, 8(%esp)
	movl	%edi, 4(%esp)
	movl	%eax, (%esp)
	call	doFaultTransfer
	jmp	.L3706
	.cfi_endproc
.LFE496:
	.size	sendIPC, .-sendIPC
	.p2align 4,,15
	.globl	sendFaultIPC
	.type	sendFaultIPC, @function
sendFaultIPC:
.LFB428:
	.cfi_startproc
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
	movl	current_lookup_fault, %eax
	movl	current_lookup_fault+4, %edx
	movl	%eax, -48(%ebp)
	movl	8(%ebp), %eax
	movl	%edx, -44(%ebp)
	movl	632(%eax), %ebx
	andl	$-1024, %eax
	movl	(%eax), %esi
	movl	4(%eax), %edi
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	$32, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	call	resolveAddressBits
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L3739
	movl	(%edx), %eax
	movl	4(%edx), %edi
	movl	%eax, %esi
	movl	%eax, %edx
	andl	$14, %esi
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %esi
	cmove	%ecx, %edx
	cmpl	$4, %edx
	je	.L3740
.L3730:
	movl	$1, current_fault
	movl	$1, %eax
	movl	%ebx, current_fault+4
	movl	$1, current_lookup_fault
	movl	$0, current_lookup_fault+4
.L3727:
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
	.p2align 4,,7
	.p2align 3
.L3740:
	.cfi_restore_state
	testl	$2, %edi
	je	.L3730
	testl	$4, %edi
	je	.L3730
	movl	current_fault, %edx
	movl	8(%ebp), %esi
	movl	current_fault, %ecx
	movl	current_fault+4, %ebx
	andl	$7, %edx
	cmpl	$1, %edx
	movl	%ecx, 604(%esi)
	movl	%ebx, 608(%esi)
	jne	.L3731
	movl	-48(%ebp), %ecx
	movl	-44(%ebp), %ebx
	movl	%ecx, 612(%esi)
	movl	%ebx, 616(%esi)
.L3731:
	andl	$-16, %eax
	movl	%eax, 20(%esp)
	movl	8(%ebp), %eax
	shrl	$3, %edi
	movl	$1, 12(%esp)
	movl	%edi, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, 16(%esp)
	movl	$1, (%esp)
	call	sendIPC
	xorl	%eax, %eax
	jmp	.L3727
.L3739:
	movl	$1, current_fault
	movl	$1, %eax
	movl	%ebx, current_fault+4
	jmp	.L3727
	.cfi_endproc
.LFE428:
	.size	sendFaultIPC, .-sendFaultIPC
	.p2align 4,,15
	.globl	handleUserLevelFault
	.type	handleUserLevelFault, @function
handleUserLevelFault:
.LFB251:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	ksCurThread, %ebx
	movl	36(%esp), %eax
	movl	%ebx, (%esp)
	leal	4(,%eax,8), %eax
	movl	%eax, current_fault
	movl	32(%esp), %eax
	movl	%eax, current_fault+4
	call	sendFaultIPC
	testl	%eax, %eax
	je	.L3742
	andl	$-16, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
.L3742:
	call	schedule
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L3744
	cmpl	$7, %edx
	je	.L3745
	cmpl	$1, %edx
	je	.L3745
	.p2align 4,,5
	call	halt
	.p2align 4,,7
	.p2align 3
.L3744:
	movl	44(%eax), %edx
	andl	$-16, %ecx
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
	movl	%edx, 56(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
.L3745:
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE251:
	.size	handleUserLevelFault, .-handleUserLevelFault
	.p2align 4,,15
	.globl	handleVMFaultEvent
	.type	handleVMFaultEvent, @function
handleVMFaultEvent:
.LFB252:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	ksCurThread, %esi
	movl	32(%esp), %ebx
	call	getFaultAddr
	movl	52(%esi), %edx
	testl	%ebx, %ebx
	je	.L3759
	cmpl	$1, %ebx
	jne	.L3776
	sall	$27, %edx
	orl	$524290, %edx
	movl	%edx, current_fault
	movl	%eax, current_fault+4
.L3761:
	movl	ksCurThread, %ebx
	movl	%ebx, (%esp)
	call	sendFaultIPC
	testl	%eax, %eax
	jne	.L3778
.L3762:
	call	schedule
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L3764
	cmpl	$7, %edx
	je	.L3765
	cmpl	$1, %edx
	je	.L3765
.L3776:
	.p2align 4,,5
	call	halt
	.p2align 4,,7
	.p2align 3
.L3764:
	movl	44(%eax), %edx
	andl	$-16, %ecx
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
	movl	%edx, 56(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
.L3765:
	addl	$20, %esp
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
.L3759:
	.cfi_restore_state
	sall	$27, %edx
	orl	$2, %edx
	movl	%edx, current_fault
	movl	%eax, current_fault+4
	jmp	.L3761
	.p2align 4,,7
	.p2align 3
.L3778:
	andl	$-16, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	jmp	.L3762
	.cfi_endproc
.LFE252:
	.size	handleVMFaultEvent, .-handleVMFaultEvent
	.p2align 4,,15
	.globl	performInvocation_Endpoint
	.type	performInvocation_Endpoint, @function
performInvocation_Endpoint:
.LFB526:
	.cfi_startproc
	subl	$44, %esp
	.cfi_def_cfa_offset 48
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
	xorl	%eax, %eax
	addl	$44, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE526:
	.size	performInvocation_Endpoint, .-performInvocation_Endpoint
	.p2align 4,,15
	.globl	handleFault
	.type	handleFault, @function
handleFault:
.LFB427:
	.cfi_startproc
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
	movl	8(%ebp), %ebx
	movl	current_lookup_fault, %eax
	movl	current_lookup_fault+4, %edx
	movl	632(%ebx), %esi
	movl	%eax, -56(%ebp)
	movl	%ebx, %eax
	andl	$-1024, %eax
	movl	%edx, -52(%ebp)
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	$32, 16(%esp)
	movl	%esi, 12(%esp)
	movl	%edx, %ecx
	movl	%eax, %edx
	leal	-36(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	movl	%ecx, 8(%esp)
	call	resolveAddressBits
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L3797
	movl	(%edx), %eax
	movl	4(%edx), %edi
	movl	%eax, %edx
	movzbl	%al, %ecx
	movl	%edi, -44(%ebp)
	movl	%eax, %edi
	andl	$15, %edx
	andl	$14, %edi
	cmpl	$14, %edi
	cmove	%ecx, %edx
	cmpl	$4, %edx
	je	.L3798
.L3786:
	movl	$1, current_fault
	movl	%esi, current_fault+4
	movl	$1, current_lookup_fault
	movl	$0, current_lookup_fault+4
.L3783:
	andl	$-16, 592(%ebx)
	movl	%ebx, 8(%ebp)
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
	jmp	scheduleTCB
	.p2align 4,,7
	.p2align 3
.L3798:
	.cfi_restore_state
	testb	$2, -44(%ebp)
	je	.L3786
	testb	$4, -44(%ebp)
	je	.L3786
	movl	current_fault, %edx
	movl	current_fault, %esi
	movl	current_fault+4, %edi
	andl	$7, %edx
	cmpl	$1, %edx
	movl	%esi, 604(%ebx)
	movl	%edi, 608(%ebx)
	jne	.L3787
	movl	-56(%ebp), %esi
	movl	-52(%ebp), %edi
	movl	%esi, 612(%ebx)
	movl	%edi, 616(%ebx)
.L3787:
	andl	$-16, %eax
	movl	%eax, 20(%esp)
	movl	-44(%ebp), %eax
	movl	%ebx, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 4(%esp)
	shrl	$3, %eax
	movl	%eax, 8(%esp)
	movl	$1, (%esp)
	call	sendIPC
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
.L3797:
	.cfi_restore_state
	movl	$1, current_fault
	movl	%esi, current_fault+4
	jmp	.L3783
	.cfi_endproc
.LFE427:
	.size	handleFault, .-handleFault
	.p2align 4,,15
	.globl	handleUnknownSyscall
	.type	handleUnknownSyscall, @function
handleUnknownSyscall:
.LFB250:
	.cfi_startproc
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
	movl	8(%ebp), %eax
	movl	ksCurThread, %ebx
	movl	current_lookup_fault+4, %edx
	movl	$3, current_fault
	movl	%eax, current_fault+4
	movl	current_lookup_fault, %eax
	movl	632(%ebx), %esi
	movl	%edx, -52(%ebp)
	movl	%eax, -56(%ebp)
	movl	%ebx, %eax
	andl	$-1024, %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	$32, 16(%esp)
	movl	%esi, 12(%esp)
	movl	%edx, %ecx
	movl	%eax, %edx
	leal	-36(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	movl	%ecx, 8(%esp)
	call	resolveAddressBits
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L3825
	movl	(%edx), %eax
	movl	4(%edx), %edi
	movl	%eax, %edx
	movzbl	%al, %ecx
	movl	%edi, -44(%ebp)
	movl	%eax, %edi
	andl	$15, %edx
	andl	$14, %edi
	cmpl	$14, %edi
	cmove	%ecx, %edx
	cmpl	$4, %edx
	je	.L3826
.L3804:
	movl	$1, current_fault
	movl	%esi, current_fault+4
	movl	$1, current_lookup_fault
	movl	$0, current_lookup_fault+4
.L3801:
	andl	$-16, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
.L3806:
	call	schedule
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L3808
	cmpl	$7, %edx
	je	.L3814
	cmpl	$1, %edx
	je	.L3814
	.p2align 4,,5
	call	halt
	.p2align 4,,7
	.p2align 3
.L3808:
	movl	44(%eax), %edx
	andl	$-16, %ecx
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
	movl	%edx, 56(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
.L3814:
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
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
.L3826:
	.cfi_restore_state
	testb	$2, -44(%ebp)
	je	.L3804
	testb	$4, -44(%ebp)
	je	.L3804
	movl	current_fault, %edx
	movl	current_fault, %esi
	movl	current_fault+4, %edi
	andl	$7, %edx
	cmpl	$1, %edx
	movl	%esi, 604(%ebx)
	movl	%edi, 608(%ebx)
	jne	.L3805
	movl	-56(%ebp), %esi
	movl	-52(%ebp), %edi
	movl	%esi, 612(%ebx)
	movl	%edi, 616(%ebx)
.L3805:
	andl	$-16, %eax
	movl	%eax, 20(%esp)
	movl	-44(%ebp), %eax
	movl	%ebx, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 4(%esp)
	shrl	$3, %eax
	movl	%eax, 8(%esp)
	movl	$1, (%esp)
	call	sendIPC
	jmp	.L3806
.L3825:
	movl	$1, current_fault
	movl	%esi, current_fault+4
	jmp	.L3801
	.cfi_endproc
.LFE250:
	.size	handleUnknownSyscall, .-handleUnknownSyscall
	.p2align 4,,15
	.globl	c_handle_interrupt
	.type	c_handle_interrupt, @function
c_handle_interrupt:
.LFB262:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	cmpl	$7, %ecx
	je	.L3837
	cmpl	$14, %ecx
	je	.L3838
	cmpl	$31, %ecx
	jle	.L3839
	cmpl	$63, %ecx
	.p2align 4,,2
	jg	.L3832
	movl	%ecx, ia32KScurInterrupt
	call	handleInterruptEntry
.L3829:
	call	restore_user_context
.L3839:
	movl	ksCurThread, %eax
	movl	52(%eax), %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	call	handleUserLevelFault
	jmp	.L3829
.L3837:
	movl	ksCurThread, %eax
	call	switchFpuOwner
	.p2align 4,,3
	jmp	.L3829
.L3838:
	movl	ksCurThread, %eax
	movl	52(%eax), %eax
	shrl	$4, %eax
	andl	$1, %eax
	movl	%eax, (%esp)
	call	handleVMFaultEvent
	jmp	.L3829
.L3832:
	cmpl	$255, %ecx
	je	.L3829
	movl	ksCurThread, %eax
	sall	$24, %ecx
	andl	$16777215, %edx
	orl	%edx, %ecx
	subl	$2, 44(%eax)
	movl	%ecx, (%esp)
	call	handleUnknownSyscall
	jmp	.L3829
	.cfi_endproc
.LFE262:
	.size	c_handle_interrupt, .-c_handle_interrupt
	.p2align 4,,15
	.globl	receiveIPC
	.type	receiveIPC, @function
receiveIPC:
.LFB497:
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
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	movl	104(%esp), %esi
	movl	100(%esp), %ebx
	movl	96(%esp), %ebp
	andl	$2, %esi
	shrl	%esi
	andl	$-16, %ebx
	movl	%esi, %eax
	xorl	$1, %eax
	movl	%eax, 44(%esp)
	movl	(%ebx), %eax
	movl	%eax, %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	je	.L3842
	jb	.L3843
	cmpl	$2, %ecx
	je	.L3843
	addl	$76, %esp
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
	.p2align 4,,1
	ret
	.p2align 4,,7
	.p2align 3
.L3843:
	.cfi_restore_state
	movl	%ebx, %eax
	orl	$3, %eax
	movl	%eax, 592(%ebp)
	movl	596(%ebp), %eax
	andl	$-2, %eax
	orl	44(%esp), %eax
	movl	%eax, 596(%ebp)
	movl	%ebp, (%esp)
	call	scheduleTCB
	movl	4(%ebx), %esi
	movl	(%ebx), %eax
	movl	%esi, %ecx
	movl	%eax, %edi
	andl	$-16, %edi
	andl	$-16, %ecx
	je	.L3854
	movl	%ebp, 648(%edi)
.L3844:
	movl	%ebp, %edx
	andl	$12, %eax
	andl	$-16, %edx
	andl	$15, %esi
	andl	$-16, %ecx
	orl	%edx, %eax
	orl	%esi, %ecx
	orl	$2, %eax
	movl	%edi, 652(%ebp)
	movl	$0, 648(%ebp)
	movl	%ecx, 4(%ebx)
	movl	%eax, (%ebx)
	addl	$76, %esp
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
.L3842:
	.cfi_restore_state
	movl	4(%ebx), %edx
	movl	%edx, %edi
	andl	$-16, %edi
	movl	652(%edi), %ecx
	movl	%edx, 52(%esp)
	movl	%eax, %edx
	andl	$-16, %edx
	movl	%edx, 56(%esp)
	movl	648(%edi), %edx
	testl	%ecx, %ecx
	je	.L3845
	movl	%edx, 648(%ecx)
	movl	648(%edi), %edx
	movl	%edi, 48(%esp)
.L3846:
	testl	%edx, %edx
	je	.L3855
	movl	%ecx, 652(%edx)
.L3847:
	movl	48(%esp), %edx
	andl	$15, %eax
	movl	%edx, %ecx
	andl	$-16, %ecx
	movl	%ecx, 48(%esp)
	movl	52(%esp), %ecx
	andl	$15, %ecx
	orl	%ecx, 48(%esp)
	movl	48(%esp), %ecx
	movl	%ecx, 4(%ebx)
	movl	56(%esp), %ecx
	andl	$-16, %ecx
	orl	%eax, %ecx
	testl	%edx, %edx
	movl	%ecx, (%ebx)
	je	.L3860
.L3848:
	movl	600(%edi), %eax
	movl	%ebp, 4(%esp)
	movl	$1, (%esp)
	movl	%eax, %edx
	andl	$4, %eax
	shrl	$3, %edx
	movl	%eax, 48(%esp)
	movl	%edx, 56(%esp)
	shrl	$2, 48(%esp)
	call	lookupIPCBuffer
	testb	$7, 604(%edi)
	jne	.L3849
	movl	%edi, 4(%esp)
	movl	$0, (%esp)
	movl	%eax, 60(%esp)
	call	lookupIPCBuffer
	movl	44(%esp), %ecx
	movl	56(%esp), %edx
	movl	%ebp, 20(%esp)
	movl	%ebx, 8(%esp)
	movl	%ecx, 28(%esp)
	movl	60(%esp), %ecx
	movl	%edx, 12(%esp)
	movl	%eax, 4(%esp)
	movl	%edi, (%esp)
	movl	%ecx, 24(%esp)
	movl	48(%esp), %ecx
	movl	%ecx, 16(%esp)
	call	doNormalTransfer
.L3850:
	testb	$2, 600(%edi)
	je	.L3861
.L3851:
	movl	%esi, %eax
	testb	%al, 48(%esp)
	je	.L3853
	movl	592(%edi), %eax
	andl	$-16, %eax
	orl	$5, %eax
	movl	%eax, 592(%edi)
	movl	%edi, (%esp)
	orl	$8, %edi
	call	scheduleTCB
	movl	52(%esp), %eax
	movl	%ebp, %edx
	andl	$-1024, %edx
	addl	$48, %edx
	movl	%edi, (%esp)
	andl	$-1024, %eax
	addl	$32, %eax
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	call	cteInsert
	addl	$76, %esp
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
.L3861:
	.cfi_restore_state
	testb	$7, 604(%edi)
	jne	.L3851
	movl	592(%edi), %eax
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%edi)
	movl	%edi, (%esp)
	call	scheduleTCB
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%edi, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	xorl	%edx, %edx
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	jmp	possibleSwitchTo
	.p2align 4,,7
	.p2align 3
.L3853:
	.cfi_restore_state
	andl	$-16, 592(%edi)
	movl	%edi, 96(%esp)
	addl	$76, %esp
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
	jmp	scheduleTCB
	.p2align 4,,7
	.p2align 3
.L3860:
	.cfi_restore_state
	andl	$-4, %ecx
	movl	%ecx, (%ebx)
	jmp	.L3848
	.p2align 4,,7
	.p2align 3
.L3855:
	movl	%ecx, 56(%esp)
	jmp	.L3847
	.p2align 4,,7
	.p2align 3
.L3845:
	movl	%edx, 48(%esp)
	jmp	.L3846
	.p2align 4,,7
	.p2align 3
.L3854:
	movl	%ebp, %ecx
	jmp	.L3844
.L3849:
	movl	%eax, 12(%esp)
	movl	56(%esp), %eax
	movl	%ebp, 8(%esp)
	movl	%edi, 4(%esp)
	movl	%eax, (%esp)
	call	doFaultTransfer
	jmp	.L3850
	.cfi_endproc
.LFE497:
	.size	receiveIPC, .-receiveIPC
	.p2align 4,,15
	.type	handleWait, @function
handleWait:
.LFB255:
	.cfi_startproc
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
	movl	ksCurThread, %eax
	andl	$-1024, %eax
	addl	$48, %eax
	movl	%eax, (%esp)
	call	cteDeleteOne
	movl	ksCurThread, %eax
	leal	-36(%ebp), %ecx
	movl	4(%eax), %ebx
	andl	$-1024, %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	$32, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	resolveAddressBits
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L3878
	movl	(%edx), %eax
	movl	4(%edx), %ecx
	movl	%eax, %edi
	movl	%eax, %edx
	andl	$14, %edi
	andl	$15, %edx
	movzbl	%al, %esi
	cmpl	$14, %edi
	cmove	%esi, %edx
	cmpl	$4, %edx
	je	.L3868
	cmpl	$6, %edx
	je	.L3869
	movl	%ebx, current_fault+4
	movl	ksCurThread, %ebx
	movl	$1, current_lookup_fault
	movl	$0, current_lookup_fault+4
	movl	$-2147483647, current_fault
	movl	%ebx, (%esp)
	call	sendFaultIPC
	testl	%eax, %eax
	je	.L3862
	andl	$-16, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
.L3862:
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
	.p2align 4,,7
	.p2align 3
.L3869:
	.cfi_restore_state
	testb	$1, %cl
	je	.L3879
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	%ecx, -28(%ebp)
	movl	-28(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	ksCurThread, %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	receiveAsyncIPC
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
	.p2align 4,,7
	.p2align 3
.L3868:
	.cfi_restore_state
	testb	$1, %cl
	je	.L3879
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	%ecx, -28(%ebp)
	movl	-28(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	ksCurThread, %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	receiveIPC
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
.L3879:
	.cfi_restore_state
	movl	$1, current_lookup_fault
	movl	$0, current_lookup_fault+4
.L3878:
	movl	ksCurThread, %eax
	movl	%ebx, current_fault+4
	movl	$-2147483647, current_fault
	movl	%eax, (%esp)
	call	handleFault
	jmp	.L3862
	.cfi_endproc
.LFE255:
	.size	handleWait, .-handleWait
	.p2align 4,,15
	.globl	copyMRs
	.type	copyMRs, @function
copyMRs:
.LFB540:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	32(%esp), %eax
	movl	16(%esp), %ecx
	movl	20(%esp), %esi
	movl	24(%esp), %edx
	testl	%eax, %eax
	movl	28(%esp), %ebx
	je	.L3888
	movl	20(%ecx), %edi
	cmpl	$1, %eax
	movl	%edi, 20(%edx)
	jbe	.L3884
	movl	24(%ecx), %ecx
	testl	%ebx, %ebx
	movl	%ecx, 24(%edx)
	je	.L3886
	testl	%esi, %esi
	je	.L3886
	cmpl	$2, %eax
	jbe	.L3886
	movl	$2, %edx
	.p2align 4,,7
	.p2align 3
.L3883:
	addl	$1, %edx
	movl	(%esi,%edx,4), %ecx
	cmpl	%eax, %edx
	movl	%ecx, (%ebx,%edx,4)
	jne	.L3883
.L3888:
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
.L3886:
	.cfi_restore_state
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	movl	$2, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3884:
	.cfi_restore_state
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	movl	$1, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE540:
	.size	copyMRs, .-copyMRs
	.p2align 4,,15
	.globl	decodeDomainInvocation
	.type	decodeDomainInvocation, @function
decodeDomainInvocation:
.LFB549:
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
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	cmpl	$25, 28(%esp)
	movl	36(%esp), %edx
	jne	.L3918
	movl	32(%esp), %ebx
	testl	%ebx, %ebx
	je	.L3897
	movl	ksCurThread, %eax
	movl	20(%eax), %ecx
	testl	%ecx, %ecx
	je	.L3896
	movl	$1, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error
.L3913:
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
	.p2align 4,,7
	.p2align 3
.L3896:
	.cfi_restore_state
	testl	%edx, %edx
	je	.L3897
	movl	(%edx), %ebx
	movl	%ebx, %esi
	movl	%ebx, %edx
	andl	$14, %esi
	andl	$15, %edx
	movzbl	%bl, %ecx
	cmpl	$14, %esi
	cmove	%ecx, %edx
	cmpl	$12, %edx
	jne	.L3919
	movl	592(%eax), %edx
	andl	$-16, %ebx
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
	movl	600(%ebx), %edx
	testb	$1, %dl
	je	.L3901
	movl	620(%ebx), %eax
	movl	644(%ebx), %ecx
	sall	$8, %eax
	addl	624(%ebx), %eax
	testl	%ecx, %ecx
	leal	ksReadyQueues(,%eax,8), %esi
	movl	ksReadyQueues(,%eax,8), %ebp
	movl	4(%esi), %edi
	movl	%edi, 4(%esp)
	je	.L3902
	movl	640(%ebx), %edi
	movl	%edi, 640(%ecx)
	movl	640(%ebx), %edi
.L3903:
	testl	%edi, %edi
	je	.L3907
	movl	%ecx, 644(%edi)
.L3904:
	movl	%ebp, ksReadyQueues(,%eax,8)
	movl	4(%esp), %eax
	andl	$-2, %edx
	movl	%eax, 4(%esi)
	movl	%edx, 600(%ebx)
.L3901:
	movl	592(%ebx), %eax
	movl	$0, 620(%ebx)
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L3916
	xorl	%eax, %eax
	cmpl	ksCurThread, %ebx
	jne	.L3913
.L3920:
	movl	%eax, 4(%esp)
	call	rescheduleRequired
	movl	4(%esp), %eax
	jmp	.L3913
	.p2align 4,,7
	.p2align 3
.L3916:
	movl	%ebx, (%esp)
	call	tcbSchedEnqueue
	xorl	%eax, %eax
	cmpl	ksCurThread, %ebx
	jne	.L3913
	jmp	.L3920
	.p2align 4,,7
	.p2align 3
.L3902:
	movl	640(%ebx), %ebp
	movl	%ebp, %edi
	jmp	.L3903
	.p2align 4,,7
	.p2align 3
.L3907:
	movl	%ecx, 4(%esp)
	jmp	.L3904
.L3897:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
	jmp	.L3913
.L3918:
	movl	$3, current_syscall_error+24
	movl	$3, %eax
	jmp	.L3913
.L3919:
	movl	$1, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error
	jmp	.L3913
	.cfi_endproc
.LFE549:
	.size	decodeDomainInvocation, .-decodeDomainInvocation
	.p2align 4,,15
	.globl	invokeTCB_Suspend
	.type	invokeTCB_Suspend, @function
invokeTCB_Suspend:
.LFB550:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %ebx
	movl	%ebx, (%esp)
	call	ipcCancel
	andl	$-16, 592(%ebx)
	cmpl	ksCurThread, %ebx
	je	.L3932
.L3922:
	movl	600(%ebx), %edx
	testb	$1, %dl
	je	.L3923
	movl	620(%ebx), %eax
	sall	$8, %eax
	addl	624(%ebx), %eax
	leal	ksReadyQueues(,%eax,8), %esi
	movl	ksReadyQueues(,%eax,8), %ebp
	movl	4(%esi), %ecx
	movl	%ecx, 12(%esp)
	movl	644(%ebx), %ecx
	testl	%ecx, %ecx
	je	.L3924
	movl	640(%ebx), %edi
	movl	%edi, 640(%ecx)
	movl	640(%ebx), %edi
.L3925:
	testl	%edi, %edi
	je	.L3927
	movl	%ecx, 644(%edi)
.L3926:
	movl	%ebp, ksReadyQueues(,%eax,8)
	movl	12(%esp), %eax
	andl	$-2, %edx
	movl	%eax, 4(%esi)
	movl	%edx, 600(%ebx)
.L3923:
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
	.p2align 4,,7
	.p2align 3
.L3932:
	.cfi_restore_state
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L3922
	call	rescheduleRequired
	jmp	.L3922
	.p2align 4,,7
	.p2align 3
.L3924:
	movl	640(%ebx), %ebp
	movl	%ebp, %edi
	jmp	.L3925
	.p2align 4,,7
	.p2align 3
.L3927:
	movl	%ecx, 12(%esp)
	jmp	.L3926
	.cfi_endproc
.LFE550:
	.size	invokeTCB_Suspend, .-invokeTCB_Suspend
	.p2align 4,,15
	.globl	invokeTCB_Resume
	.type	invokeTCB_Resume, @function
invokeTCB_Resume:
.LFB551:
	.cfi_startproc
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
	movl	32(%esp), %ebx
	movl	592(%ebx), %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	ja	.L3940
	movl	$1, %eax
	sall	%cl, %eax
	testb	$121, %al
	jne	.L3935
.L3940:
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
	.p2align 4,,7
	.p2align 3
.L3935:
	.cfi_restore_state
	movl	%ebx, (%esp)
	call	ipcCancel
	movl	%ebx, %ecx
	andl	$-1024, %ecx
	movl	32(%ecx), %edx
	leal	32(%ecx), %esi
	movl	%edx, %edi
	movzbl	%dl, %eax
	andl	$14, %edi
	andl	$15, %edx
	cmpl	$14, %edi
	cmovne	%edx, %eax
	testl	%eax, %eax
	jne	.L3937
	movl	%ebx, %eax
	andl	$-16, %eax
	orl	$8, %eax
	movl	%eax, 32(%ecx)
	movl	$1, 4(%esi)
	movl	$0, 8(%esi)
	movl	$3, 12(%esi)
.L3937:
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	%ebx, (%esp)
	call	tcbSchedEnqueue
	movl	%ebx, %eax
	xorl	%edx, %edx
	call	possibleSwitchTo
	addl	$16, %esp
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
	.cfi_endproc
.LFE551:
	.size	invokeTCB_Resume, .-invokeTCB_Resume
	.p2align 4,,15
	.globl	invokeTCB_ThreadControl
	.type	invokeTCB_ThreadControl, @function
invokeTCB_ThreadControl:
.LFB552:
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
	movl	64(%esp), %esi
	movl	120(%esp), %ebx
	movl	%esi, %edi
	andl	$-16, %edi
	movl	%ebx, %ebp
	orl	$12, %edi
	andl	$4, %ebp
	je	.L3944
	movl	72(%esp), %eax
	movl	%eax, 632(%esi)
.L3944:
	testb	$1, %bl
	jne	.L3989
.L3946:
	testl	%ebp, %ebp
	jne	.L3990
.L3951:
	andl	$2, %ebx
	jne	.L3955
.L3956:
	xorl	%edx, %edx
.L3977:
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%edx, %eax
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
.L3955:
	.cfi_restore_state
	movl	%esi, %ebx
	andl	$-1024, %ebx
	addl	$64, %ebx
	movl	%ebx, %eax
	call	cteDelete.constprop.160
	testl	%eax, %eax
	movl	%eax, %edx
	jne	.L3977
	movl	%eax, 28(%esp)
	movl	104(%esp), %eax
	movl	%eax, 636(%esi)
	movl	116(%esp), %eax
	testl	%eax, %eax
	je	.L3956
	movl	116(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 12(%esp)
	movl	112(%esp), %edx
	movl	%eax, 8(%esp)
	movl	108(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
	testl	%eax, %eax
	je	.L3956
	movl	68(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edi, (%esp)
	movl	$0, 4(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	call	sameObjectAs
	testl	%eax, %eax
	je	.L3956
	movl	116(%esp), %eax
	movl	112(%esp), %edx
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	108(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
	movl	28(%esp), %edx
	jmp	.L3977
	.p2align 4,,7
	.p2align 3
.L3990:
	movl	%esi, %ebp
	andl	$-1024, %ebp
	movl	%ebp, %eax
	call	cteDelete.constprop.160
	testl	%eax, %eax
	movl	%eax, %edx
	jne	.L3977
	movl	88(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 12(%esp)
	movl	84(%esp), %edx
	movl	%eax, 8(%esp)
	movl	80(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
	testl	%eax, %eax
	je	.L3953
	movl	68(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edi, (%esp)
	movl	$0, 4(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	call	sameObjectAs
	testl	%eax, %eax
	jne	.L3991
.L3953:
	addl	$16, %ebp
	movl	%ebp, %eax
	call	cteDelete.constprop.160
	testl	%eax, %eax
	movl	%eax, %edx
	jne	.L3977
	movl	100(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 12(%esp)
	movl	96(%esp), %edx
	movl	%eax, 8(%esp)
	movl	92(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
	testl	%eax, %eax
	je	.L3951
	movl	68(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edi, (%esp)
	movl	$0, 4(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	call	sameObjectAs
	testl	%eax, %eax
	je	.L3951
	movl	100(%esp), %eax
	movl	96(%esp), %edx
	movl	%ebp, 12(%esp)
	movl	%eax, 8(%esp)
	movl	92(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
	jmp	.L3951
	.p2align 4,,7
	.p2align 3
.L3989:
	movl	%esi, (%esp)
	call	tcbSchedDequeue
	movl	76(%esp), %eax
	movl	%eax, 624(%esi)
	movl	592(%esi), %eax
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L3986
	cmpl	ksCurThread, %esi
	jne	.L3946
.L3992:
	call	rescheduleRequired
	.p2align 4,,2
	jmp	.L3946
	.p2align 4,,7
	.p2align 3
.L3986:
	movl	%esi, (%esp)
	.p2align 4,,5
	call	tcbSchedEnqueue
	cmpl	ksCurThread, %esi
	jne	.L3946
	jmp	.L3992
	.p2align 4,,7
	.p2align 3
.L3991:
	movl	88(%esp), %eax
	movl	84(%esp), %edx
	movl	%ebp, 12(%esp)
	movl	%eax, 8(%esp)
	movl	80(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
	jmp	.L3953
	.cfi_endproc
.LFE552:
	.size	invokeTCB_ThreadControl, .-invokeTCB_ThreadControl
	.p2align 4,,15
	.globl	decodeTCBConfigure
	.type	decodeTCBConfigure, @function
decodeTCBConfigure:
.LFB545:
	.cfi_startproc
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
	movl	8(%ebp), %eax
	cmpl	$4, 16(%ebp)
	movl	24(%ebp), %ebx
	movl	28(%ebp), %esi
	movl	%eax, -52(%ebp)
	movl	32(%ebp), %edi
	ja	.L4029
.L3994:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
.L4023:
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
	.p2align 4,,7
	.p2align 3
.L4029:
	.cfi_restore_state
	testl	%ebx, %ebx
	je	.L3994
	testl	%esi, %esi
	je	.L3994
	testl	%edi, %edi
	.p2align 4,,5
	je	.L3994
	movl	ksCurThread, %eax
	movl	20(%eax), %edx
	movl	%edx, -92(%ebp)
	movl	36(%ebp), %edx
	movl	12(%edx), %ecx
	movl	%ecx, -76(%ebp)
	movl	16(%edx), %ecx
	movl	%ecx, -88(%ebp)
	movl	20(%edx), %ecx
	movl	4(%ebx), %edx
	movl	%ecx, -56(%ebp)
	movl	(%ebx), %ecx
	movl	%edx, -68(%ebp)
	movl	(%esi), %edx
	movl	%ecx, -72(%ebp)
	movl	4(%esi), %ecx
	movl	%edx, -84(%ebp)
	movl	(%edi), %edx
	movl	%ecx, -80(%ebp)
	movl	4(%edi), %ecx
	movl	%edx, -64(%ebp)
	movl	%ecx, -60(%ebp)
	movzbl	24(%eax), %ecx
	cmpl	624(%eax), %ecx
	jbe	.L3997
.L4008:
	movl	$3, current_syscall_error+24
	leal	-12(%ebp), %esp
	movl	$3, %eax
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
.L3997:
	.cfi_restore_state
	movl	-56(%ebp), %eax
	testl	%eax, %eax
	jne	.L4030
	xorl	%edi, %edi
.L3998:
	movl	-52(%ebp), %eax
	movl	%ecx, -96(%ebp)
	andl	$-1024, %eax
	movl	%eax, (%esp)
	movl	%eax, -100(%ebp)
	call	slotCapLongRunningDelete
	testl	%eax, %eax
	jne	.L4008
	movl	-100(%ebp), %eax
	addl	$16, %eax
	movl	%eax, (%esp)
	call	slotCapLongRunningDelete
	movl	-96(%ebp), %ecx
	testl	%eax, %eax
	jne	.L4008
	movl	-76(%ebp), %eax
	testl	%eax, %eax
	je	.L4001
	movl	-72(%ebp), %edx
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	%ecx, -96(%ebp)
	movl	%edx, 12(%esp)
	movl	-68(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	-76(%ebp), %edx
	movl	%edx, 8(%esp)
	call	updateCapData
	movl	-44(%ebp), %eax
	movl	-96(%ebp), %ecx
	movl	%eax, -68(%ebp)
	movl	-48(%ebp), %eax
	subl	$4, %esp
	movl	%eax, -72(%ebp)
.L4001:
	movl	-72(%ebp), %eax
	movl	%ebx, 4(%esp)
	movl	%ecx, -76(%ebp)
	movl	%eax, 8(%esp)
	movl	-68(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	deriveCap
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, -72(%ebp)
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L4023
	movl	-28(%ebp), %eax
	movl	%edx, %ecx
	andl	$14, %ecx
	movl	%eax, -68(%ebp)
	movl	%edx, %eax
	andl	$15, %edx
	movzbl	%al, %eax
	cmpl	$14, %ecx
	movl	-76(%ebp), %ecx
	cmovne	%edx, %eax
	cmpl	$10, %eax
	jne	.L4008
	cmpl	$0, -88(%ebp)
	je	.L4005
	movl	-84(%ebp), %edx
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	%ecx, -76(%ebp)
	movl	%edx, 12(%esp)
	movl	-80(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	-88(%ebp), %edx
	movl	%edx, 8(%esp)
	call	updateCapData
	movl	-48(%ebp), %eax
	movl	-76(%ebp), %ecx
	movl	%eax, -84(%ebp)
	movl	-44(%ebp), %eax
	pushl	%edx
	movl	%eax, -80(%ebp)
.L4005:
	movl	-84(%ebp), %eax
	movl	%esi, 4(%esp)
	movl	%ecx, -88(%ebp)
	movl	%eax, 8(%esp)
	movl	-80(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	deriveCap
	movl	-32(%ebp), %edx
	movl	%edx, -80(%ebp)
	pushl	%eax
	movl	-36(%ebp), %eax
	testl	%eax, %eax
	jne	.L4023
	movl	-28(%ebp), %eax
	movl	-88(%ebp), %ecx
	movl	%eax, -76(%ebp)
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L4006
	movl	%edx, %eax
	andl	$15, %eax
.L4007:
	cmpl	$5, %eax
	jne	.L4008
	testl	$65536, -76(%ebp)
	je	.L4008
	movl	ksCurThread, %eax
	movl	ksCurThread, %edx
	movl	%ecx, -84(%ebp)
	movl	592(%eax), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	-64(%ebp), %eax
	movl	-60(%ebp), %edx
	movl	-84(%ebp), %ecx
	movl	$7, 56(%esp)
	movl	%eax, 44(%esp)
	movl	-56(%ebp), %eax
	movl	%edx, 48(%esp)
	movl	-52(%ebp), %edx
	movl	%edi, 52(%esp)
	movl	%esi, 36(%esp)
	movl	%eax, 40(%esp)
	movl	-80(%ebp), %eax
	andl	$-16, %edx
	movl	%ebx, 24(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 28(%esp)
	movl	-76(%ebp), %eax
	movl	%edx, (%esp)
	movl	%eax, 32(%esp)
	movl	-72(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-68(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	-92(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	call	invokeTCB_ThreadControl
	jmp	.L4023
	.p2align 4,,7
	.p2align 3
.L4030:
	movl	%ecx, -96(%ebp)
	movl	-64(%ebp), %edx
	leal	-36(%ebp), %eax
	movl	-60(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%edi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	call	deriveCap
	movl	-36(%ebp), %eax
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L4023
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%eax, -64(%ebp)
	movl	%eax, 4(%esp)
	movl	-56(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%edx, -60(%ebp)
	movl	%eax, (%esp)
	call	checkValidIPCBuffer
	movl	-96(%ebp), %ecx
	testl	%eax, %eax
	je	.L3998
	jmp	.L4023
.L4006:
	movzbl	-80(%ebp), %eax
	.p2align 4,,2
	jmp	.L4007
	.cfi_endproc
.LFE545:
	.size	decodeTCBConfigure, .-decodeTCBConfigure
	.p2align 4,,15
	.globl	decodeSetPriority
	.type	decodeSetPriority, @function
decodeSetPriority:
.LFB546:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$68, %esp
	.cfi_def_cfa_offset 80
	movl	88(%esp), %eax
	movl	80(%esp), %ebx
	testl	%eax, %eax
	jne	.L4032
	movl	$7, current_syscall_error+24
	movl	$3, %eax
.L4033:
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
	.p2align 4,,7
	.p2align 3
.L4032:
	.cfi_restore_state
	movl	ksCurThread, %eax
	movzbl	20(%eax), %esi
	cmpl	624(%eax), %esi
	jbe	.L4034
	movl	$3, current_syscall_error+24
	addl	$68, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	$3, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L4034:
	.cfi_restore_state
	movl	592(%eax), %edx
	andl	$-16, %ebx
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
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
	movl	%esi, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	call	invokeTCB_ThreadControl
	jmp	.L4033
	.cfi_endproc
.LFE546:
	.size	decodeSetPriority, .-decodeSetPriority
	.p2align 4,,15
	.globl	decodeSetIPCBuffer
	.type	decodeSetIPCBuffer, @function
decodeSetIPCBuffer:
.LFB547:
	.cfi_startproc
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
	movl	16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	24(%ebp), %ebx
	testl	%eax, %eax
	jne	.L4049
.L4037:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
.L4039:
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
	.p2align 4,,7
	.p2align 3
.L4049:
	.cfi_restore_state
	testl	%ebx, %ebx
	je	.L4037
	movl	ksCurThread, %ecx
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
	movl	20(%ecx), %eax
	testl	%eax, %eax
	movl	%eax, -44(%ebp)
	jne	.L4050
	xorl	%ebx, %ebx
.L4040:
	movl	592(%ecx), %eax
	movl	%edx, -48(%ebp)
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%ecx)
	movl	%ecx, (%esp)
	call	scheduleTCB
	movl	-44(%ebp), %eax
	movl	-48(%ebp), %edx
	movl	%ebx, 52(%esp)
	movl	%esi, 44(%esp)
	movl	%eax, 40(%esp)
	movl	20(%ebp), %eax
	andl	$-16, %edx
	movl	%edi, 48(%esp)
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
	.p2align 4,,7
	.p2align 3
.L4050:
	.cfi_restore_state
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 4(%esp)
	movl	%edx, -48(%ebp)
	call	deriveCap
	movl	-36(%ebp), %eax
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L4039
	movl	-32(%ebp), %esi
	movl	-28(%ebp), %edi
	movl	-44(%ebp), %eax
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, (%esp)
	call	checkValidIPCBuffer
	testl	%eax, %eax
	jne	.L4039
	movl	ksCurThread, %ecx
	movl	-48(%ebp), %edx
	jmp	.L4040
	.cfi_endproc
.LFE547:
	.size	decodeSetIPCBuffer, .-decodeSetIPCBuffer
	.p2align 4,,15
	.globl	decodeSetSpace
	.type	decodeSetSpace, @function
decodeSetSpace:
.LFB548:
	.cfi_startproc
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
	movl	24(%ebp), %eax
	cmpl	$2, 16(%ebp)
	movl	8(%ebp), %edi
	movl	28(%ebp), %esi
	movl	%eax, -52(%ebp)
	ja	.L4105
.L4052:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
.L4093:
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
	.p2align 4,,7
	.p2align 3
.L4105:
	.cfi_restore_state
	testl	%eax, %eax
	je	.L4052
	testl	%esi, %esi
	je	.L4052
	movl	ksCurThread, %eax
	movl	%edi, %edx
	andl	$-1024, %edx
	movl	(%edx), %ecx
	movl	20(%eax), %ebx
	movl	24(%eax), %eax
	movl	%ecx, -56(%ebp)
	movl	%ebx, -88(%ebp)
	movl	-52(%ebp), %ebx
	movl	%eax, -72(%ebp)
	movl	36(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -84(%ebp)
	movl	4(%ebx), %eax
	movl	%eax, -64(%ebp)
	movl	(%ebx), %eax
	movl	%eax, -68(%ebp)
	movl	(%esi), %eax
	movl	%eax, -80(%ebp)
	movl	4(%esi), %eax
	movl	%eax, -76(%ebp)
	movl	%ecx, %eax
	andl	$14, %eax
	movl	%eax, %ebx
	movl	%eax, -60(%ebp)
	movl	%ecx, %eax
	movzbl	%cl, %ecx
	andl	$15, %eax
	cmpl	$14, %ebx
	cmove	%ecx, %eax
	testl	%eax, %eax
	je	.L4057
	movl	8(%edx), %eax
	movl	12(%edx), %ecx
	andl	$-8, %eax
	je	.L4058
	movl	4(%edx), %ebx
	movl	%ecx, -96(%ebp)
	movl	(%edx), %ecx
	movl	%edx, -92(%ebp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	sameObjectAs
	movl	-92(%ebp), %edx
	movl	-96(%ebp), %ecx
	testl	%eax, %eax
	je	.L4058
.L4057:
	addl	$16, %edx
	movl	%edx, (%esp)
	call	slotCapLongRunningDelete
	testl	%eax, %eax
	je	.L4106
.L4070:
	movl	$3, current_syscall_error+24
	leal	-12(%ebp), %esp
	movl	$3, %eax
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
.L4058:
	.cfi_restore_state
	andl	$-8, %ecx
	je	.L4059
	movl	4(%ecx), %ebx
	movl	(%ecx), %ecx
	movl	%edx, -92(%ebp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	(%edx), %ecx
	movl	4(%edx), %ebx
	movl	%ecx, (%esp)
	movl	%ebx, 4(%esp)
	call	sameObjectAs
	movl	-92(%ebp), %edx
	testl	%eax, %eax
	jne	.L4057
.L4059:
	movl	-56(%ebp), %ecx
	movl	%ecx, %eax
	movzbl	%cl, %ecx
	andl	$15, %eax
	cmpl	$14, -60(%ebp)
	cmove	%ecx, %eax
	cmpl	$12, %eax
	je	.L4070
	cmpl	$46, %eax
	je	.L4070
	cmpl	$10, %eax
	jne	.L4057
	.p2align 4,,5
	jmp	.L4070
	.p2align 4,,7
	.p2align 3
.L4106:
	movl	-72(%ebp), %edx
	testl	%edx, %edx
	.p2align 4,,3
	je	.L4063
	movl	-68(%ebp), %ebx
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	%ebx, 12(%esp)
	movl	-64(%ebp), %ebx
	movl	%ebx, 16(%esp)
	movl	-72(%ebp), %ebx
	movl	%ebx, 8(%esp)
	call	updateCapData
	movl	-44(%ebp), %eax
	movl	%eax, -64(%ebp)
	movl	-48(%ebp), %eax
	subl	$4, %esp
	movl	%eax, -68(%ebp)
.L4063:
	movl	-68(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-64(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	deriveCap
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %ecx
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L4093
	movl	-28(%ebp), %eax
	movzbl	%cl, %edx
	movl	%eax, -64(%ebp)
	movl	%ecx, %eax
	andl	$14, %eax
	movl	%eax, %ebx
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$14, %ebx
	cmove	%edx, %eax
	cmpl	$10, %eax
	jne	.L4070
	movl	-84(%ebp), %eax
	testl	%eax, %eax
	je	.L4067
	movl	-80(%ebp), %ebx
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	%ecx, -56(%ebp)
	movl	%ebx, 12(%esp)
	movl	-76(%ebp), %ebx
	movl	%ebx, 16(%esp)
	movl	-84(%ebp), %ebx
	movl	%ebx, 8(%esp)
	call	updateCapData
	movl	-48(%ebp), %eax
	movl	-56(%ebp), %ecx
	movl	%eax, -80(%ebp)
	movl	-44(%ebp), %eax
	subl	$4, %esp
	movl	%eax, -76(%ebp)
.L4067:
	movl	-80(%ebp), %eax
	movl	%esi, 4(%esp)
	movl	%ecx, -68(%ebp)
	movl	%eax, 8(%esp)
	movl	-76(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	deriveCap
	movl	-32(%ebp), %eax
	movl	%eax, %edx
	movl	%eax, -60(%ebp)
	movl	-36(%ebp), %eax
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L4093
	movl	-28(%ebp), %eax
	movl	-68(%ebp), %ecx
	movl	%eax, -56(%ebp)
	movl	%edx, %eax
	andl	$14, %eax
	movl	%eax, %ebx
	movl	%edx, %eax
	movzbl	%al, %eax
	andl	$15, %edx
	cmpl	$14, %ebx
	cmove	%eax, %edx
	cmpl	$5, %edx
	jne	.L4070
	testl	$65536, -56(%ebp)
	je	.L4070
	movl	ksCurThread, %eax
	movl	%ecx, -68(%ebp)
	movl	592(%eax), %edx
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
	movl	-60(%ebp), %eax
	movl	-68(%ebp), %ecx
	movl	$4, 56(%esp)
	movl	$0, 52(%esp)
	movl	%eax, 28(%esp)
	movl	-56(%ebp), %eax
	movl	$0, 44(%esp)
	movl	$0, 48(%esp)
	movl	$0, 40(%esp)
	movl	%eax, 32(%esp)
	movl	-52(%ebp), %eax
	movl	%esi, 36(%esp)
	movl	%ecx, 16(%esp)
	movl	$0, 12(%esp)
	movl	%eax, 24(%esp)
	movl	-64(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	-88(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edi, %eax
	andl	$-16, %eax
	movl	%eax, (%esp)
	call	invokeTCB_ThreadControl
	jmp	.L4093
	.cfi_endproc
.LFE548:
	.size	decodeSetSpace, .-decodeSetSpace
	.p2align 4,,15
	.globl	invokeTCB_CopyRegisters
	.type	invokeTCB_CopyRegisters, @function
invokeTCB_CopyRegisters:
.LFB553:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	40(%esp), %eax
	movl	32(%esp), %ebx
	movl	36(%esp), %esi
	testl	%eax, %eax
	jne	.L4125
	movl	44(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L4126
.L4109:
	movl	48(%esp), %edx
	testl	%edx, %edx
	je	.L4110
	movl	44(%esi), %eax
	movl	%eax, 44(%ebx)
	movl	68(%esi), %edx
	movl	%edx, 68(%ebx)
	movl	64(%esi), %edx
	movl	%edx, 64(%ebx)
	movl	(%esi), %edx
	movl	%edx, (%ebx)
	movl	4(%esi), %edx
	movl	%edx, 4(%ebx)
	movl	8(%esi), %edx
	movl	%edx, 8(%ebx)
	movl	12(%esi), %edx
	movl	%edx, 12(%ebx)
	movl	16(%esi), %edx
	movl	%edx, 16(%ebx)
	movl	20(%esi), %edx
	movl	%edx, 20(%ebx)
	movl	24(%esi), %edx
	movl	%eax, 56(%ebx)
	movl	%edx, 24(%ebx)
.L4110:
	movl	52(%esp), %eax
	testl	%eax, %eax
	je	.L4111
	movl	48(%esi), %eax
	movl	%eax, 48(%ebx)
	movl	36(%esi), %eax
	movl	%eax, 36(%ebx)
	movl	40(%esi), %eax
	movl	%eax, 40(%ebx)
.L4111:
	addl	$20, %esp
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
.L4125:
	.cfi_restore_state
	movl	%esi, (%esp)
	call	suspend
	movl	44(%esp), %ecx
	testl	%ecx, %ecx
	je	.L4109
.L4126:
	movl	%ebx, (%esp)
	call	restart
	jmp	.L4109
	.cfi_endproc
.LFE553:
	.size	invokeTCB_CopyRegisters, .-invokeTCB_CopyRegisters
	.p2align 4,,15
	.globl	decodeCopyRegisters
	.type	decodeCopyRegisters, @function
decodeCopyRegisters:
.LFB542:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	56(%esp), %edx
	movl	48(%esp), %ebx
	movl	60(%esp), %eax
	testl	%edx, %edx
	jne	.L4138
.L4128:
	movl	$7, current_syscall_error+24
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$3, %eax
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
.L4138:
	.cfi_restore_state
	testl	%eax, %eax
	je	.L4128
	movl	(%eax), %eax
	movl	ksCurThread, %ecx
	movl	%eax, %ebp
	movl	%eax, %edx
	andl	$14, %ebp
	andl	$15, %edx
	movl	20(%ecx), %edi
	cmpl	$14, %ebp
	movzbl	%al, %esi
	cmove	%esi, %edx
	cmpl	$12, %edx
	je	.L4139
	movl	$2, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error+4
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
	.p2align 4,,7
	.p2align 3
.L4139:
	.cfi_restore_state
	movl	592(%ecx), %edx
	andl	$-16, %ebx
	movl	%eax, 12(%esp)
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%ecx)
	movl	%ecx, (%esp)
	call	scheduleTCB
	movl	%edi, %edx
	movl	12(%esp), %eax
	andl	$8, %edx
	movl	%edx, 68(%esp)
	movl	%edi, %edx
	andl	$4, %edx
	movl	%edx, 64(%esp)
	movl	%edi, %edx
	andl	$-16, %eax
	andl	$1, %edi
	andl	$2, %edx
	movl	%edi, 56(%esp)
	movl	%ebx, 48(%esp)
	movl	$0, 72(%esp)
	movl	%edx, 60(%esp)
	movl	%eax, 52(%esp)
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
	jmp	invokeTCB_CopyRegisters
	.cfi_endproc
.LFE542:
	.size	decodeCopyRegisters, .-decodeCopyRegisters
	.p2align 4,,15
	.globl	invokeTCB_ReadRegisters
	.type	invokeTCB_ReadRegisters, @function
invokeTCB_ReadRegisters:
.LFB554:
	.cfi_startproc
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
	movl	ksCurThread, %ebx
	movl	36(%esp), %edx
	movl	32(%esp), %edi
	movl	40(%esp), %esi
	testl	%edx, %edx
	jne	.L4176
.L4141:
	movl	48(%esp), %eax
	testl	%eax, %eax
	je	.L4142
	movl	%ebx, 4(%esp)
	movl	$1, (%esp)
	call	lookupIPCBuffer
	testl	%esi, %esi
	movl	$0, 4(%ebx)
	je	.L4148
	movl	44(%edi), %edx
	cmpl	$1, %esi
	movl	%edx, 20(%ebx)
	jbe	.L4149
	movl	68(%edi), %edx
	testl	%eax, %eax
	movl	%edx, 24(%ebx)
	je	.L4150
	cmpl	$2, %esi
	jbe	.L4150
	movl	64(%edi), %edx
	cmpl	$3, %esi
	movl	%edx, 12(%eax)
	jbe	.L4151
	movl	(%edi), %edx
	cmpl	$4, %esi
	movl	%edx, 16(%eax)
	jbe	.L4152
	movl	4(%edi), %edx
	cmpl	$5, %esi
	movl	%edx, 20(%eax)
	jbe	.L4153
	movl	8(%edi), %edx
	cmpl	$6, %esi
	movl	%edx, 24(%eax)
	jbe	.L4154
	movl	12(%edi), %edx
	cmpl	$7, %esi
	movl	%edx, 28(%eax)
	jbe	.L4155
	movl	16(%edi), %edx
	cmpl	$8, %esi
	movl	%edx, 32(%eax)
	jbe	.L4156
	movl	20(%edi), %edx
	cmpl	$9, %esi
	movl	%edx, 36(%eax)
	jbe	.L4157
	movl	24(%edi), %edx
	movl	$10, %ecx
	movl	%edx, 40(%eax)
	jmp	.L4146
	.p2align 4,,7
	.p2align 3
.L4150:
	movl	$2, %ecx
.L4144:
	testl	%eax, %eax
	je	.L4158
.L4146:
	xorl	%edx, %edx
	cmpl	$10, %esi
	jbe	.L4147
	movl	48(%edi), %edx
	cmpl	$11, %esi
	movl	%edx, 44(%eax)
	je	.L4160
	movl	36(%edi), %edx
	cmpl	$12, %esi
	movl	%edx, 48(%eax)
	je	.L4161
	movl	40(%edi), %edx
	movl	%edx, 52(%eax)
	movl	$3, %edx
.L4147:
	addl	%ecx, %edx
	movl	%edx, 16(%ebx)
.L4142:
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
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
	.p2align 4,,7
	.p2align 3
.L4176:
	.cfi_restore_state
	movl	%edi, (%esp)
	call	suspend
	jmp	.L4141
	.p2align 4,,7
	.p2align 3
.L4158:
	xorl	%edx, %edx
	jmp	.L4147
	.p2align 4,,7
	.p2align 3
.L4148:
	xorl	%ecx, %ecx
	.p2align 4,,7
	jmp	.L4144
	.p2align 4,,7
	.p2align 3
.L4149:
	movl	$1, %ecx
	.p2align 4,,2
	jmp	.L4144
	.p2align 4,,7
	.p2align 3
.L4157:
	movl	$9, %ecx
	jmp	.L4146
	.p2align 4,,7
	.p2align 3
.L4156:
	movl	$8, %ecx
	jmp	.L4146
	.p2align 4,,7
	.p2align 3
.L4151:
	movl	$3, %ecx
	jmp	.L4146
	.p2align 4,,7
	.p2align 3
.L4155:
	movl	$7, %ecx
	jmp	.L4146
	.p2align 4,,7
	.p2align 3
.L4154:
	movl	$6, %ecx
	jmp	.L4146
	.p2align 4,,7
	.p2align 3
.L4153:
	movl	$5, %ecx
	jmp	.L4146
	.p2align 4,,7
	.p2align 3
.L4152:
	movl	$4, %ecx
	jmp	.L4146
	.p2align 4,,7
	.p2align 3
.L4160:
	movl	$1, %edx
	jmp	.L4147
	.p2align 4,,7
	.p2align 3
.L4161:
	movl	$2, %edx
	jmp	.L4147
	.cfi_endproc
.LFE554:
	.size	invokeTCB_ReadRegisters, .-invokeTCB_ReadRegisters
	.p2align 4,,15
	.globl	decodeReadRegisters
	.type	decodeReadRegisters, @function
decodeReadRegisters:
.LFB543:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	cmpl	$1, 56(%esp)
	movl	48(%esp), %edx
	movl	60(%esp), %esi
	jbe	.L4183
	movl	ksCurThread, %eax
	movl	24(%eax), %ebx
	movl	20(%eax), %edi
	leal	-1(%ebx), %ecx
	cmpl	$12, %ecx
	jbe	.L4180
	movl	$4, current_syscall_error+24
	movl	$1, current_syscall_error+8
	movl	$13, current_syscall_error+12
.L4179:
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$3, %eax
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
.L4183:
	.cfi_restore_state
	movl	$7, current_syscall_error+24
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$3, %eax
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
.L4180:
	.cfi_restore_state
	andl	$-16, %edx
	cmpl	%eax, %edx
	movl	%edx, %ebp
	je	.L4184
	movl	592(%eax), %ecx
	andl	$1, %edi
	andl	$-16, %ecx
	orl	$2, %ecx
	movl	%ecx, 592(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
	movl	%esi, 64(%esp)
	movl	%ebx, 56(%esp)
	movl	%edi, 52(%esp)
	movl	%ebp, 48(%esp)
	movl	$0, 60(%esp)
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
	jmp	invokeTCB_ReadRegisters
	.p2align 4,,7
	.p2align 3
.L4184:
	.cfi_restore_state
	movl	$3, current_syscall_error+24
	jmp	.L4179
	.cfi_endproc
.LFE543:
	.size	decodeReadRegisters, .-decodeReadRegisters
	.p2align 4,,15
	.globl	invokeTCB_WriteRegisters
	.type	invokeTCB_WriteRegisters, @function
invokeTCB_WriteRegisters:
.LFB555:
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
	movl	$13, %ebx
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	56(%esp), %eax
	movl	48(%esp), %esi
	movl	64(%esp), %ebp
	cmpl	$13, %eax
	cmovbe	%eax, %ebx
	testl	%ebx, %ebx
	je	.L4186
	xorl	%eax, %eax
	jmp	.L4190
	.p2align 4,,7
	.p2align 3
.L4187:
	leal	-9(%ecx), %edi
	cmpl	$1, %edi
	ja	.L4188
	movl	%edx, %edi
	andl	$-9, %edi
	cmpl	$51, %edi
	movl	$0, %edi
	cmovne	%edi, %edx
.L4188:
	addl	$1, %eax
	cmpl	%eax, %ebx
	movl	%edx, (%esi,%ecx,4)
	jbe	.L4189
.L4213:
	cmpl	$9, %eax
	ja	.L4189
.L4190:
	movl	frameRegisters(,%eax,4), %ecx
	movl	12(%ebp,%eax,4), %edx
	cmpl	$16, %ecx
	jne	.L4187
	andl	$4055, %edx
	addl	$1, %eax
	orl	$514, %edx
	cmpl	%eax, %ebx
	movl	%edx, (%esi,%ecx,4)
	ja	.L4213
	.p2align 4,,7
	.p2align 3
.L4189:
	cmpl	$10, %ebx
	jbe	.L4186
	movl	52(%ebp), %eax
	cmpl	$11, %ebx
	movl	%eax, 48(%esi)
	jbe	.L4186
	movl	56(%ebp), %eax
	xorl	%edx, %edx
	movl	%eax, %ecx
	andl	$-9, %ecx
	cmpl	$51, %ecx
	cmovne	%edx, %eax
	cmpl	$12, %ebx
	movl	%eax, 36(%esi)
	jbe	.L4186
	movl	60(%ebp), %eax
	movl	%eax, %ecx
	andl	$-9, %ecx
	cmpl	$51, %ecx
	cmovne	%edx, %eax
	movl	%eax, 40(%esi)
.L4186:
	movl	44(%esi), %eax
	movl	%eax, 56(%esi)
	movl	52(%esp), %eax
	testl	%eax, %eax
	je	.L4202
	movl	%esi, (%esp)
	call	restart
.L4202:
	addl	$28, %esp
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
	.cfi_endproc
.LFE555:
	.size	invokeTCB_WriteRegisters, .-invokeTCB_WriteRegisters
	.p2align 4,,15
	.globl	decodeWriteRegisters
	.type	decodeWriteRegisters, @function
decodeWriteRegisters:
.LFB544:
	.cfi_startproc
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
	movl	56(%esp), %eax
	movl	48(%esp), %ecx
	cmpl	$1, %eax
	jbe	.L4217
	movl	ksCurThread, %edx
	subl	$2, %eax
	movl	24(%edx), %ebx
	movl	20(%edx), %esi
	cmpl	%ebx, %eax
	jae	.L4220
.L4217:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
.L4216:
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
	.p2align 4,,7
	.p2align 3
.L4220:
	.cfi_restore_state
	movl	%ecx, %edi
	andl	$-16, %edi
	cmpl	%edx, %edi
	je	.L4221
	movl	592(%edx), %eax
	andl	$1, %esi
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	60(%esp), %eax
	movl	%ebx, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%edi, (%esp)
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	call	invokeTCB_WriteRegisters
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
	.p2align 4,,7
	.p2align 3
.L4221:
	.cfi_restore_state
	movl	$3, current_syscall_error+24
	movl	$3, %eax
	jmp	.L4216
	.cfi_endproc
.LFE544:
	.size	decodeWriteRegisters, .-decodeWriteRegisters
	.p2align 4,,15
	.globl	decodeTCBInvocation
	.type	decodeTCBInvocation, @function
decodeTCBInvocation:
.LFB541:
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
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	movl	96(%esp), %eax
	movl	100(%esp), %edx
	movl	104(%esp), %ebx
	movl	108(%esp), %ecx
	cmpl	$10, %eax
	movl	112(%esp), %edi
	movl	128(%esp), %ebp
	movl	132(%esp), %esi
	ja	.L4223
	jmp	*.L4225(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L4225:
	.long	.L4223
	.long	.L4223
	.long	.L4224
	.long	.L4226
	.long	.L4227
	.long	.L4228
	.long	.L4229
	.long	.L4230
	.long	.L4231
	.long	.L4232
	.long	.L4233
	.text
	.p2align 4,,7
	.p2align 3
.L4233:
	movl	ksCurThread, %edx
	andl	$-16, %ebx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	%ebx, (%esp)
	call	restart
	xorl	%eax, %eax
.L4238:
	addl	$76, %esp
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
.L4224:
	.cfi_restore_state
	cmpl	$1, %edx
	jbe	.L4256
	movl	ksCurThread, %eax
	movl	24(%eax), %esi
	movl	20(%eax), %edi
	leal	-1(%esi), %edx
	cmpl	$12, %edx
	jbe	.L4236
	movl	$4, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error+8
	movl	$13, current_syscall_error+12
	jmp	.L4238
	.p2align 4,,7
	.p2align 3
.L4226:
	cmpl	$1, %edx
	jbe	.L4256
	movl	ksCurThread, %eax
	subl	$2, %edx
	movl	24(%eax), %edi
	movl	20(%eax), %ebp
	cmpl	%edx, %edi
	ja	.L4256
	andl	$-16, %ebx
	cmpl	%ebx, %eax
	je	.L4223
	movl	592(%eax), %edx
	andl	$1, %ebp
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
	movl	%esi, 112(%esp)
	movl	%edi, 104(%esp)
	movl	%ebp, 100(%esp)
	movl	%ebx, 96(%esp)
	movl	$0, 108(%esp)
	addl	$76, %esp
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
	jmp	invokeTCB_WriteRegisters
	.p2align 4,,7
	.p2align 3
.L4229:
	.cfi_restore_state
	testl	%edx, %edx
	jne	.L4249
.L4256:
	movl	$7, current_syscall_error+24
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$3, %eax
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
.L4230:
	.cfi_restore_state
	movl	116(%esp), %eax
	movl	%esi, 28(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 16(%esp)
	movl	120(%esp), %eax
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 20(%esp)
	movl	124(%esp), %eax
	movl	%eax, 24(%esp)
	call	decodeSetIPCBuffer
	addl	$76, %esp
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
.L4231:
	.cfi_restore_state
	movl	116(%esp), %eax
	movl	%esi, 28(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 16(%esp)
	movl	120(%esp), %eax
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 20(%esp)
	movl	124(%esp), %eax
	movl	%eax, 24(%esp)
	call	decodeSetSpace
	addl	$76, %esp
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
.L4232:
	.cfi_restore_state
	movl	ksCurThread, %edx
	andl	$-16, %ebx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	%ebx, (%esp)
	call	suspend
	addl	$76, %esp
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
.L4227:
	.cfi_restore_state
	testl	%edx, %edx
	movl	116(%esp), %eax
	je	.L4256
	testl	%eax, %eax
	je	.L4256
	movl	(%eax), %eax
	movl	ksCurThread, %ecx
	movl	%eax, %ebp
	movl	%eax, %edx
	andl	$14, %ebp
	andl	$15, %edx
	movl	20(%ecx), %edi
	cmpl	$14, %ebp
	movzbl	%al, %esi
	cmove	%esi, %edx
	cmpl	$12, %edx
	je	.L4257
	movl	$2, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error+4
	jmp	.L4238
	.p2align 4,,7
	.p2align 3
.L4228:
	movl	116(%esp), %eax
	movl	%esi, 28(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 16(%esp)
	movl	120(%esp), %eax
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 20(%esp)
	movl	124(%esp), %eax
	movl	%eax, 24(%esp)
	call	decodeTCBConfigure
	addl	$76, %esp
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
.L4223:
	.cfi_restore_state
	movl	$3, current_syscall_error+24
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$3, %eax
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
.L4236:
	.cfi_restore_state
	andl	$-16, %ebx
	cmpl	%ebx, %eax
	je	.L4223
	movl	592(%eax), %edx
	andl	$1, %edi
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
	movl	%ebp, 112(%esp)
	movl	%esi, 104(%esp)
	movl	%edi, 100(%esp)
	movl	%ebx, 96(%esp)
	movl	$0, 108(%esp)
	addl	$76, %esp
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
	jmp	invokeTCB_ReadRegisters
	.p2align 4,,7
	.p2align 3
.L4249:
	.cfi_restore_state
	movl	ksCurThread, %eax
	movzbl	20(%eax), %esi
	cmpl	624(%eax), %esi
	ja	.L4223
	movl	592(%eax), %edx
	andl	$-16, %ebx
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
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
	movl	%esi, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	call	invokeTCB_ThreadControl
	jmp	.L4238
.L4257:
	movl	592(%ecx), %edx
	andl	$-16, %ebx
	movl	%eax, 60(%esp)
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%ecx)
	movl	%ecx, (%esp)
	call	scheduleTCB
	movl	%edi, %edx
	movl	60(%esp), %eax
	andl	$8, %edx
	movl	%edx, 116(%esp)
	movl	%edi, %edx
	andl	$4, %edx
	movl	%edx, 112(%esp)
	movl	%edi, %edx
	andl	$-16, %eax
	andl	$1, %edi
	andl	$2, %edx
	movl	%edi, 104(%esp)
	movl	%ebx, 96(%esp)
	movl	$0, 120(%esp)
	movl	%edx, 108(%esp)
	movl	%eax, 100(%esp)
	addl	$76, %esp
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
	jmp	invokeTCB_CopyRegisters
	.cfi_endproc
.LFE541:
	.size	decodeTCBInvocation, .-decodeTCBInvocation
	.p2align 4,,15
	.globl	invokeUntyped_Retype
	.type	invokeUntyped_Retype, @function
invokeUntyped_Retype:
.LFB558:
	.cfi_startproc
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
	movl	36(%ebp), %eax
	cmpl	$4, 20(%ebp)
	movl	%eax, -36(%ebp)
	ja	.L4315
	cmpl	$3, 20(%ebp)
	ja	.L4266
	cmpl	$2, 20(%ebp)
	movl	$4, %ecx
	jae	.L4264
	cmpl	$1, 20(%ebp)
	movb	$10, %cl
	jne	.L4265
.L4264:
	movl	-36(%ebp), %edi
	movl	16(%ebp), %eax
	subl	12(%ebp), %eax
	movl	28(%ebp), %ebx
	movl	%edi, %esi
	sall	%cl, %esi
	addl	%esi, %eax
	movl	8(%ebp), %esi
	shrl	$4, %eax
	sall	$5, %eax
	movl	4(%esi), %edx
	andl	$31, %edx
	orl	%edx, %eax
	movl	%eax, 4(%esi)
	movl	24(%ebp), %eax
	movl	32(%ebp), %esi
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	getObjectSize
	testl	%edi, %edi
	movl	%eax, -40(%ebp)
	je	.L4297
	movl	8(%ebp), %eax
	sall	$4, %esi
	movl	$1, -52(%ebp)
	addl	%esi, %ebx
	xorl	%esi, %esi
	andl	$-8, %eax
	movl	%eax, -44(%ebp)
	movl	24(%ebp), %eax
	leal	4(%eax), %ecx
	andl	$31, %eax
	sall	%cl, -52(%ebp)
	movl	%eax, -56(%ebp)
	sall	$23, %eax
	movl	%eax, -60(%ebp)
.L4288:
	movzbl	-40(%ebp), %ecx
	movl	%esi, %edx
	sall	%cl, %edx
	addl	16(%ebp), %edx
	cmpl	$4, 20(%ebp)
	movl	%edx, %eax
	ja	.L4316
	cmpl	$2, 20(%ebp)
	je	.L4273
	jbe	.L4317
	cmpl	$3, 20(%ebp)
	.p2align 4,,3
	je	.L4276
	cmpl	$4, 20(%ebp)
	.p2align 4,,3
	jne	.L4272
	movl	-52(%ebp), %edi
	testl	%edi, %edi
	movl	%edi, %ecx
	je	.L4283
	.p2align 4,,7
	.p2align 3
.L4304:
	movl	$0, (%eax)
	addl	$4, %eax
	subl	$4, %ecx
	jne	.L4304
.L4283:
	andl	$-32, %edx
	movl	-60(%ebp), %ecx
	shrl	%edx
	orl	$10, %edx
	jmp	.L4271
	.p2align 4,,7
	.p2align 3
.L4316:
	movl	24(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 12(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	Arch_createObject
	movl	-32(%ebp), %edx
	movl	-28(%ebp), %ecx
	subl	$4, %esp
.L4271:
	movl	8(%ebp), %eax
	movl	-44(%ebp), %edi
	movl	12(%eax), %eax
	movl	%edx, (%ebx)
	movl	%ecx, 4(%ebx)
	movl	%edi, 8(%ebx)
	andl	$-8, %eax
	movl	%eax, %edx
	orl	$3, %edx
	movl	%edx, 12(%ebx)
	movl	%ebx, %edx
	andl	$-8, %edx
	testl	%eax, %eax
	je	.L4286
	movl	8(%eax), %ecx
	andl	$7, %ecx
	orl	%edx, %ecx
	movl	%ecx, 8(%eax)
.L4286:
	movl	8(%ebp), %eax
	addl	$1, %esi
	addl	$16, %ebx
	movl	8(%ebp), %edi
	movl	12(%eax), %eax
	andl	$7, %eax
	orl	%edx, %eax
	cmpl	-36(%ebp), %esi
	movl	%eax, 12(%edi)
	jne	.L4288
.L4297:
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
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
.L4317:
	.cfi_restore_state
	cmpl	$1, 20(%ebp)
	jne	.L4272
	testb	$1, %dl
	movl	%edx, %edi
	movl	$1024, -48(%ebp)
	jne	.L4318
.L4278:
	testl	$2, %edi
	jne	.L4319
.L4279:
	movl	-48(%ebp), %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	rep stosl
	testb	$2, -48(%ebp)
	je	.L4280
	xorl	%eax, %eax
	addl	$2, %edi
	movw	%ax, -2(%edi)
.L4280:
	testb	$1, -48(%ebp)
	je	.L4281
	movb	$0, (%edi)
.L4281:
	leal	256(%edx), %edi
	movl	%edi, (%esp)
	call	Arch_initContext
	movl	ksCurDomain, %eax
	xorl	%ecx, %ecx
	movl	$1, 628(%edi)
	movl	%eax, 620(%edi)
	andl	$-16, %edi
	movl	%edi, %edx
	orl	$12, %edx
	jmp	.L4271
	.p2align 4,,7
	.p2align 3
.L4276:
	movl	$0, (%edx)
	movl	$3, %ecx
	movl	$0, 4(%edx)
	movl	$0, 8(%edx)
	movl	$0, 12(%edx)
	andl	$-16, %edx
	orl	$6, %edx
	jmp	.L4271
	.p2align 4,,7
	.p2align 3
.L4272:
	andl	$-16, %edx
	movl	-56(%ebp), %ecx
	orl	$2, %edx
	jmp	.L4271
	.p2align 4,,7
	.p2align 3
.L4273:
	movl	$0, (%edx)
	movl	$7, %ecx
	movl	$0, 4(%edx)
	movl	$0, 8(%edx)
	movl	$0, 12(%edx)
	andl	$-16, %edx
	orl	$4, %edx
	jmp	.L4271
	.p2align 4,,7
	.p2align 3
.L4266:
	movl	24(%ebp), %eax
	cmpl	$4, 20(%ebp)
	leal	4(%eax), %ecx
	je	.L4264
.L4265:
	movl	24(%ebp), %ecx
	jmp	.L4264
	.p2align 4,,7
	.p2align 3
.L4315:
	cmpl	$6, 20(%ebp)
	je	.L4289
	.p2align 4,,4
	ja	.L4262
	cmpl	$5, 20(%ebp)
	.p2align 4,,3
	jne	.L4260
.L4263:
	movl	$12, %ecx
	.p2align 4,,2
	jmp	.L4264
	.p2align 4,,7
	.p2align 3
.L4289:
	movl	$22, %ecx
	jmp	.L4264
.L4318:
	movb	$0, (%edx)
	leal	1(%edx), %edi
	movl	$1023, -48(%ebp)
	jmp	.L4278
	.p2align 4,,7
	.p2align 3
.L4262:
	cmpl	$8, 20(%ebp)
	jbe	.L4263
.L4260:
	call	halt
.L4319:
	xorl	%ecx, %ecx
	addl	$2, %edi
	movw	%cx, -2(%edi)
	subl	$2, -48(%ebp)
	jmp	.L4279
	.cfi_endproc
.LFE558:
	.size	invokeUntyped_Retype, .-invokeUntyped_Retype
	.p2align 4,,15
	.globl	decodeUntypedInvocation
	.type	decodeUntypedInvocation, @function
decodeUntypedInvocation:
.LFB557:
	.cfi_startproc
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
	movl	20(%ebp), %edi
	cmpl	$1, 8(%ebp)
	movl	24(%ebp), %esi
	movl	28(%ebp), %eax
	je	.L4321
	movl	$3, current_syscall_error+24
	movl	$3, %eax
.L4358:
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
	.p2align 4,,7
	.p2align 3
.L4321:
	.cfi_restore_state
	cmpl	$5, 12(%ebp)
	ja	.L4360
.L4323:
	movl	$7, current_syscall_error+24
	leal	-12(%ebp), %esp
	movl	$3, %eax
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
.L4360:
	.cfi_restore_state
	testl	%eax, %eax
	je	.L4323
	movl	ksCurThread, %edx
	movl	24(%edx), %ecx
	movl	20(%edx), %ebx
	movl	44(%ebp), %edx
	movl	%ecx, -52(%ebp)
	cmpl	$8, %ebx
	movl	12(%edx), %ecx
	movl	%ecx, -64(%ebp)
	movl	16(%edx), %ecx
	movl	20(%edx), %edx
	movl	%edx, -60(%ebp)
	movl	44(%ebp), %edx
	movl	24(%edx), %edx
	movl	%edx, -56(%ebp)
	jbe	.L4325
	movl	$1, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error
	jmp	.L4358
.L4325:
	cmpl	$30, -52(%ebp)
	jbe	.L4326
	movl	$4, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+8
	movl	$30, current_syscall_error+12
	jmp	.L4358
.L4326:
	movl	-52(%ebp), %edx
	testl	%edx, %edx
	jne	.L4327
	cmpl	$4, %ebx
	jne	.L4327
.L4328:
	movl	$1, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error
	jmp	.L4358
.L4327:
	cmpl	$3, -52(%ebp)
	ja	.L4348
	testl	%ebx, %ebx
	je	.L4328
.L4348:
	testl	%ecx, %ecx
	.p2align 4,,3
	jne	.L4330
.L4332:
	movl	(%eax), %edx
	movl	4(%eax), %eax
	movl	%eax, -64(%ebp)
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L4333
	movl	%edx, %eax
	andl	$15, %eax
.L4334:
	cmpl	$10, %eax
	je	.L4335
	leal	0(,%ecx,4), %eax
	movzbl	%al, %eax
	orl	$1, %eax
	movl	%eax, current_lookup_fault
	movl	$3, %eax
	movl	$6, current_syscall_error+24
	movl	$0, current_syscall_error+20
	movl	$0, current_lookup_fault+4
	jmp	.L4358
.L4330:
	movl	4(%eax), %edx
	movl	%ecx, -76(%ebp)
	movl	(%eax), %eax
	movl	%ecx, 20(%esp)
	movl	-64(%ebp), %ecx
	movl	$0, 4(%esp)
	movl	%edx, -68(%ebp)
	movl	%eax, -72(%ebp)
	movl	-72(%ebp), %edx
	leal	-48(%ebp), %eax
	movl	%ecx, 16(%esp)
	movl	-68(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	call	lookupSlotForCNodeOp
	movl	-48(%ebp), %edx
	movl	-76(%ebp), %ecx
	testl	%edx, %edx
	pushl	%eax
	movl	-44(%ebp), %eax
	je	.L4332
	movl	%edx, %eax
	jmp	.L4358
.L4335:
	movl	-64(%ebp), %ecx
	movl	$1, %eax
	andl	$260046848, %ecx
	shrl	$23, %ecx
	sall	%cl, %eax
	leal	-1(%eax), %ecx
	cmpl	-60(%ebp), %ecx
	jae	.L4336
	movl	$4, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+8
	movl	%ecx, current_syscall_error+12
	jmp	.L4358
.L4333:
	movzbl	%dl, %eax
	jmp	.L4334
.L4336:
	movl	-56(%ebp), %ecx
	subl	$1, %ecx
	cmpl	$255, %ecx
	jbe	.L4337
	movl	$4, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error+8
	movl	$256, current_syscall_error+12
	jmp	.L4358
.L4337:
	subl	-60(%ebp), %eax
	cmpl	-56(%ebp), %eax
	jae	.L4338
	movl	%eax, current_syscall_error+12
	movl	$3, %eax
	movl	$4, current_syscall_error+24
	movl	$1, current_syscall_error+8
	jmp	.L4358
.L4338:
	andl	$2147483632, %edx
	movl	-60(%ebp), %ecx
	leal	(%edx,%edx), %eax
	movl	%eax, -64(%ebp)
	movl	-56(%ebp), %eax
	movl	%ecx, -32(%ebp)
	leal	(%eax,%ecx), %edx
	movl	%eax, -28(%ebp)
	movl	%edx, -60(%ebp)
.L4339:
	cmpl	-60(%ebp), %ecx
	jae	.L4361
	movl	-64(%ebp), %edx
	movl	%ecx, %eax
	sall	$4, %eax
	movl	(%eax,%edx), %eax
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L4340
	andl	$15, %eax
.L4341:
	testl	%eax, %eax
	je	.L4342
	movl	$8, current_syscall_error+24
	movl	$3, %eax
	jmp	.L4358
.L4361:
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	ensureNoChildren
	movl	%esi, %ecx
	xorl	%edx, %edx
	shrl	$5, %ecx
	movl	%ebx, (%esp)
	testl	%eax, %eax
	movl	-52(%ebp), %eax
	cmovne	%ecx, %edx
	andl	$-16, %edi
	sall	$4, %edx
	movl	%edi, -60(%ebp)
	movl	%eax, 4(%esp)
	movl	%edx, -72(%ebp)
	call	getObjectSize
	movl	-72(%ebp), %edx
	movl	%esi, %ecx
	movl	%eax, %edi
	movl	$1, %eax
	sall	%cl, %eax
	subl	%edx, %eax
	cmpl	$31, %edi
	jbe	.L4362
.L4345:
	movl	%eax, current_syscall_error+16
	movl	$3, %eax
	movl	$10, current_syscall_error+24
	jmp	.L4358
.L4342:
	addl	$1, %ecx
	jmp	.L4339
.L4340:
	movzbl	%al, %eax
	jmp	.L4341
.L4362:
	movl	%eax, %esi
	movl	%edi, %ecx
	shrl	%cl, %esi
	cmpl	-56(%ebp), %esi
	jb	.L4345
	movl	%edi, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	-60(%ebp), %ecx
	movl	%eax, %edi
	negl	%eax
	leal	-36(%ebp), %esi
	leal	-1(%edx,%ecx), %edx
	movl	ksCurThread, %ecx
	addl	%edx, %edi
	andl	%edi, %eax
	movl	%eax, -56(%ebp)
	leal	20(%esp), %edi
	movl	592(%ecx), %edx
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%ecx)
	movl	%ecx, (%esp)
	call	scheduleTCB
	movl	-64(%ebp), %eax
	movl	$3, %ecx
	movl	40(%ebp), %edx
	movl	%eax, -36(%ebp)
	movl	%edx, 32(%esp)
	rep movsl
	movl	%ebx, 12(%esp)
	movl	-52(%ebp), %eax
	movl	-60(%ebp), %ecx
	movl	%eax, 16(%esp)
	movl	-56(%ebp), %eax
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	invokeUntyped_Retype
	jmp	.L4358
	.cfi_endproc
.LFE557:
	.size	decodeUntypedInvocation, .-decodeUntypedInvocation
	.p2align 4,,15
	.globl	decodeInvocation
	.type	decodeInvocation, @function
decodeInvocation:
.LFB525:
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
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	movl	104(%esp), %eax
	movl	112(%esp), %ebx
	movl	96(%esp), %edx
	movl	100(%esp), %ecx
	movl	%eax, 52(%esp)
	movl	132(%esp), %eax
	movl	108(%esp), %ebp
	movl	116(%esp), %esi
	movl	140(%esp), %edi
	movl	%eax, 60(%esp)
	movl	136(%esp), %eax
	movl	%eax, 56(%esp)
	movl	%ebx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L4364
	movl	%ebx, %eax
	andl	$15, %eax
	testb	$1, %bl
	jne	.L4365
.L4368:
	cmpl	$62, %eax
	ja	.L4369
	jmp	*.L4371(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L4371:
	.long	.L4384
	.long	.L4369
	.long	.L4372
	.long	.L4369
	.long	.L4373
	.long	.L4369
	.long	.L4374
	.long	.L4369
	.long	.L4375
	.long	.L4369
	.long	.L4376
	.long	.L4369
	.long	.L4377
	.long	.L4369
	.long	.L4378
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4379
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4384
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4369
	.long	.L4381
	.text
	.p2align 4,,7
	.p2align 3
.L4364:
	testb	$1, %bl
	movzbl	%bl, %eax
	.p2align 4,,2
	je	.L4368
.L4365:
	movl	52(%esp), %eax
	movl	%edi, 132(%esp)
	movl	%ebx, 112(%esp)
	movl	%esi, 116(%esp)
	movl	%ebp, 108(%esp)
	movl	%eax, 104(%esp)
	movl	%ecx, 100(%esp)
	movl	%edx, 96(%esp)
	addl	$76, %esp
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
	jmp	Arch_decodeInvocation
	.p2align 4,,7
	.p2align 3
.L4384:
	.cfi_restore_state
	movl	$2, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+4
.L4382:
	addl	$76, %esp
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
.L4372:
	.cfi_restore_state
	movl	56(%esp), %eax
	movl	%edi, 36(%esp)
	movl	%ebx, 12(%esp)
	movl	%esi, 16(%esp)
	movl	%eax, 32(%esp)
	movl	120(%esp), %eax
	movl	%ebp, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, (%esp)
	movl	%eax, 20(%esp)
	movl	124(%esp), %eax
	movl	%eax, 24(%esp)
	movl	128(%esp), %eax
	movl	%eax, 28(%esp)
	call	decodeUntypedInvocation
	jmp	.L4382
	.p2align 4,,7
	.p2align 3
.L4373:
	testl	$2, %esi
	je	.L4384
	movl	ksCurThread, %edx
	andl	$-16, %ebx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	ksCurThread, %eax
	movl	%ebx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	%esi, %eax
	andl	$4, %eax
	shrl	$2, %eax
	movl	%eax, 12(%esp)
	movl	56(%esp), %eax
	shrl	$3, %esi
	movl	%esi, 8(%esp)
	movl	%eax, 4(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	call	sendIPC
	xorl	%eax, %eax
	jmp	.L4382
	.p2align 4,,7
	.p2align 3
.L4374:
	testl	$2, %esi
	je	.L4384
	xorl	%edi, %edi
	testl	%ecx, %ecx
	movl	ksCurThread, %edx
	je	.L4386
	movl	20(%edx), %edi
.L4386:
	movl	592(%edx), %eax
	shrl	$3, %esi
	andl	$-16, %ebx
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	%edi, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	sendAsyncIPC
	xorl	%eax, %eax
	jmp	.L4382
	.p2align 4,,7
	.p2align 3
.L4375:
	andl	$1, %esi
	jne	.L4384
	movl	ksCurThread, %edx
	andl	$-16, %ebx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	ksCurThread, %eax
	movl	%ebp, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	doReplyTransfer
	xorl	%eax, %eax
	jmp	.L4382
	.p2align 4,,7
	.p2align 3
.L4376:
	movl	120(%esp), %eax
	movl	%edi, 28(%esp)
	movl	%ebx, 8(%esp)
	movl	%esi, 12(%esp)
	movl	%eax, 16(%esp)
	movl	124(%esp), %eax
	movl	%ecx, 4(%esp)
	movl	%edx, (%esp)
	movl	%eax, 20(%esp)
	movl	128(%esp), %eax
	movl	%eax, 24(%esp)
	call	decodeCNodeInvocation
	jmp	.L4382
	.p2align 4,,7
	.p2align 3
.L4377:
	movl	56(%esp), %eax
	movl	%edi, 36(%esp)
	movl	%ebp, 16(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 32(%esp)
	movl	120(%esp), %eax
	movl	%esi, 12(%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, (%esp)
	movl	%eax, 20(%esp)
	movl	124(%esp), %eax
	movl	%eax, 24(%esp)
	movl	128(%esp), %eax
	movl	%eax, 28(%esp)
	call	decodeTCBInvocation
	jmp	.L4382
	.p2align 4,,7
	.p2align 3
.L4378:
	movl	120(%esp), %eax
	movl	%edi, 24(%esp)
	movl	%ebp, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 12(%esp)
	movl	124(%esp), %eax
	movl	%edx, (%esp)
	movl	%eax, 16(%esp)
	movl	128(%esp), %eax
	movl	%eax, 20(%esp)
	call	decodeIRQControlInvocation
	jmp	.L4382
	.p2align 4,,7
	.p2align 3
.L4379:
	movl	120(%esp), %eax
	movl	%edx, 96(%esp)
	movl	%eax, 104(%esp)
	movl	124(%esp), %eax
	movl	%eax, 108(%esp)
	movl	128(%esp), %eax
	movl	%eax, 112(%esp)
	movl	%esi, %eax
	movzbl	%al, %esi
	movl	%esi, 100(%esp)
	addl	$76, %esp
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
	jmp	decodeIRQHandlerInvocation
	.p2align 4,,7
	.p2align 3
.L4381:
	.cfi_restore_state
	movl	120(%esp), %eax
	movl	%edi, 116(%esp)
	movl	%ecx, 100(%esp)
	movl	%edx, 96(%esp)
	movl	%eax, 104(%esp)
	movl	124(%esp), %eax
	movl	%eax, 108(%esp)
	movl	128(%esp), %eax
	movl	%eax, 112(%esp)
	addl	$76, %esp
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
	jmp	decodeDomainInvocation
	.p2align 4,,7
	.p2align 3
.L4369:
	.cfi_restore_state
	call	halt
	.cfi_endproc
.LFE525:
	.size	decodeInvocation, .-decodeInvocation
	.p2align 4,,15
	.type	handleInvocation, @function
handleInvocation:
.LFB253:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	ksCurThread, %ebx
	movl	%eax, -48(%ebp)
	movl	%edx, -52(%ebp)
	movl	16(%ebx), %esi
	movl	%esi, %eax
	andl	$127, %eax
	cmpl	$120, %eax
	jbe	.L4394
	andl	$-128, %esi
	orl	$120, %esi
.L4394:
	movl	%ebx, %eax
	movl	4(%ebx), %edi
	andl	$-1024, %eax
	movl	4(%eax), %edx
	leal	-40(%ebp), %ecx
	movl	(%eax), %eax
	movl	$32, 16(%esp)
	movl	%edi, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	resolveAddressBits
	movl	-40(%ebp), %edx
	movl	-36(%ebp), %eax
	movl	%eax, -44(%ebp)
	subl	$4, %esp
	testl	%edx, %edx
	jne	.L4422
	movl	%eax, %edx
	movl	4(%eax), %eax
	movl	(%edx), %ecx
	movl	%ebx, 4(%esp)
	movl	$0, (%esp)
	movl	%eax, -32(%ebp)
	movl	%ecx, -36(%ebp)
	call	lookupIPCBuffer
	movl	%esi, 8(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	movl	%eax, -56(%ebp)
	call	lookupExtraCaps
	movl	-56(%ebp), %ecx
	testl	%eax, %eax
	jne	.L4423
	movl	%esi, %eax
	andl	$127, %eax
	testl	%ecx, %ecx
	je	.L4424
.L4401:
	movl	%ecx, 44(%esp)
	movl	current_extra_caps, %ecx
	shrl	$12, %esi
	movl	-48(%ebp), %edx
	movl	%edi, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, 24(%esp)
	movl	current_extra_caps+4, %ecx
	movl	%edx, 40(%esp)
	movl	-52(%ebp), %edx
	movl	%esi, (%esp)
	movl	%ecx, 28(%esp)
	movl	current_extra_caps+8, %ecx
	movl	%edx, 36(%esp)
	movl	-36(%ebp), %edx
	movl	%ecx, 32(%esp)
	movl	-32(%ebp), %ecx
	movl	%edx, 16(%esp)
	movl	%ecx, 20(%esp)
	movl	-44(%ebp), %ecx
	movl	%ecx, 12(%esp)
	call	decodeInvocation
	cmpl	$4, %eax
	je	.L4404
	cmpl	$3, %eax
	je	.L4425
	movl	592(%ebx), %eax
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L4426
.L4421:
	xorl	%eax, %eax
.L4397:
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
.L4426:
	.cfi_restore_state
	cmpl	$0, -48(%ebp)
	je	.L4403
	movl	$0, 4(%ebx)
	movl	$0, 16(%ebx)
.L4403:
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	xorl	%eax, %eax
	jmp	.L4397
.L4425:
	cmpl	$0, -48(%ebp)
	je	.L4421
	movl	%ebx, (%esp)
	call	replyFromKernel_error
	xorl	%eax, %eax
	jmp	.L4397
.L4404:
	movl	$4, %eax
	jmp	.L4397
.L4424:
	cmpl	$2, %eax
	movl	$2, %edx
	cmova	%edx, %eax
	jmp	.L4401
.L4423:
	cmpl	$0, -52(%ebp)
	je	.L4421
.L4396:
	movl	%ebx, (%esp)
	call	handleFault
	jmp	.L4421
.L4422:
	cmpl	$0, -52(%ebp)
	movl	$1, current_fault
	movl	%edi, current_fault+4
	je	.L4421
	jmp	.L4396
	.cfi_endproc
.LFE253:
	.size	handleInvocation, .-handleInvocation
	.p2align 4,,15
	.globl	handleSyscall
	.type	handleSyscall, @function
handleSyscall:
.LFB257:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %eax
	addl	$7, %eax
	cmpl	$6, %eax
	ja	.L4493
	jmp	*.L4430(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L4430:
	.long	.L4429
	.long	.L4431
	.long	.L4446
	.long	.L4433
	.long	.L4434
	.long	.L4435
	.long	.L4436
	.text
	.p2align 4,,7
	.p2align 3
.L4435:
	movl	ksCurThread, %ecx
	movl	%ecx, %eax
	andl	$-1024, %eax
	movl	48(%eax), %edx
	leal	48(%eax), %ebx
	movl	52(%eax), %ebp
	movl	%edx, %edi
	movl	%edx, %eax
	andl	$14, %edi
	andl	$15, %eax
	movzbl	%dl, %esi
	cmpl	$14, %edi
	cmove	%esi, %eax
	testl	%eax, %eax
	je	.L4446
	cmpl	$8, %eax
	jne	.L4493
	andl	$1, %ebp
	jne	.L4493
	andl	$-16, %edx
	movl	%ebx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	doReplyTransfer
	.p2align 4,,7
	.p2align 3
.L4446:
	call	handleWait
.L4438:
	call	schedule
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L4451
	cmpl	$7, %edx
	je	.L4452
	cmpl	$1, %edx
	je	.L4452
.L4493:
	.p2align 4,,5
	call	halt
	.p2align 4,,7
	.p2align 3
.L4451:
	movl	44(%eax), %edx
	andl	$-16, %ecx
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
	movl	%edx, 56(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
.L4452:
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
	.p2align 4,,7
	.p2align 3
.L4431:
	.cfi_restore_state
	movl	ksCurThread, %ecx
	movl	%ecx, %eax
	andl	$-1024, %eax
	movl	48(%eax), %edx
	leal	48(%eax), %ebx
	movl	52(%eax), %ebp
	movl	%edx, %edi
	movl	%edx, %eax
	andl	$14, %edi
	andl	$15, %eax
	movzbl	%dl, %esi
	cmpl	$14, %edi
	cmove	%esi, %eax
	testl	%eax, %eax
	je	.L4438
	cmpl	$8, %eax
	jne	.L4493
	andl	$1, %ebp
	jne	.L4493
	andl	$-16, %edx
	movl	%ebx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	doReplyTransfer
	jmp	.L4438
	.p2align 4,,7
	.p2align 3
.L4433:
	xorl	%edx, %edx
	xorl	%eax, %eax
	call	handleInvocation
	testl	%eax, %eax
	.p2align 4,,2
	je	.L4438
.L4500:
	movl	ia32KScurInterrupt, %eax
	cmpl	$-1, %eax
	je	.L4438
	subl	$32, %eax
	cmpl	$-1, %eax
	je	.L4438
	movl	%eax, (%esp)
	call	handleInterrupt
	jmp	.L4438
	.p2align 4,,7
	.p2align 3
.L4434:
	xorl	%eax, %eax
	movl	$1, %edx
	call	handleInvocation
	testl	%eax, %eax
	je	.L4438
	jmp	.L4500
	.p2align 4,,7
	.p2align 3
.L4436:
	movl	$1, %edx
	movl	$1, %eax
	call	handleInvocation
	testl	%eax, %eax
	je	.L4438
	jmp	.L4500
	.p2align 4,,7
	.p2align 3
.L4429:
	movl	ksCurThread, %eax
	movl	%eax, (%esp)
	call	tcbSchedDequeue
	movl	ksCurThread, %eax
	movl	600(%eax), %ecx
	testb	$1, %cl
	jne	.L4448
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	movl	ksReadyQueues(,%edx,8), %ebx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	4(%esi), %edi
	testl	%ebx, %ebx
	je	.L4453
	movl	%eax, 640(%edi)
.L4449:
	orl	$1, %ecx
	movl	%edi, 644(%eax)
	movl	$0, 640(%eax)
	movl	%ebx, ksReadyQueues(,%edx,8)
	movl	%eax, 4(%esi)
	movl	%ecx, 600(%eax)
.L4448:
	call	rescheduleRequired
	jmp	.L4438
	.p2align 4,,7
	.p2align 3
.L4453:
	movl	%eax, %ebx
	jmp	.L4449
	.cfi_endproc
.LFE257:
	.size	handleSyscall, .-handleSyscall
	.p2align 4,,15
	.globl	slowpath
	.type	slowpath, @function
slowpath:
.LFB263:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	ksCurThread, %edx
	movl	32(%esp), %eax
	movl	$-1, ia32KScurInterrupt
	addl	$2, 56(%edx)
	cmpl	$-8, %eax
	movl	%eax, (%esp)
	jbe	.L4506
	call	handleSyscall
.L4504:
	call	restore_user_context
.L4506:
	.p2align 4,,5
	call	handleUnknownSyscall
	.p2align 4,,5
	jmp	.L4504
	.cfi_endproc
.LFE263:
	.size	slowpath, .-slowpath
	.p2align 4,,15
	.globl	fastpath_call
	.type	fastpath_call, @function
fastpath_call:
.LFB280:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%ecx, %eax
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	%edx, %ecx
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	andl	$127, %ecx
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	movl	%edx, %ebp
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	cmpl	$120, %ecx
	jbe	.L4508
	andl	$-128, %ebp
	orl	$120, %ebp
.L4508:
	movl	ksCurThread, %ebx
	movl	%ebp, %esi
	andl	$511, %edx
	andl	$127, %esi
	movl	%esi, 16(%esp)
	movl	604(%ebx), %ecx
	andl	$7, %ecx
	cmpl	$2, %edx
	ja	.L4510
	testl	%ecx, %ecx
	jne	.L4510
	andl	$-1024, %ebx
	movl	4(%ebx), %ecx
	movl	(%ebx), %edx
	movl	%eax, (%esp)
	leal	24(%esp), %eax
	call	lookup_fp
	movl	24(%esp), %ecx
	movl	28(%esp), %esi
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$4, %eax
	jne	.L4510
	testl	$2, %esi
	je	.L4510
	andl	$-16, %ecx
	movl	(%ecx), %eax
	movl	4(%ecx), %ebx
	andl	$3, %eax
	cmpl	$2, %eax
	jne	.L4510
	movl	%ebx, %edx
	andl	$-1024, %edx
	movl	20(%edx), %eax
	movl	%eax, 20(%esp)
	movl	16(%edx), %eax
	movl	%eax, %edi
	andl	$15, %eax
	andl	$16777200, %edi
	movl	%edi, 12(%esp)
	sall	$8, 12(%esp)
	cmpl	$5, %eax
	je	.L4530
.L4510:
	movl	$-1, (%esp)
	call	slowpath
.L4530:
	testl	$65536, 20(%esp)
	je	.L4510
	movl	ksCurThread, %eax
	andl	$-16, %ebx
	movl	624(%eax), %edi
	cmpl	%edi, 624(%ebx)
	jb	.L4510
	testl	$4, %esi
	je	.L4510
	testb	$1, 596(%ebx)
	jne	.L4510
	movl	648(%ebx), %edi
	addl	$2, 56(%eax)
	testl	%edi, %edi
	movl	%edi, 4(%ecx)
	jne	.L4531
	movl	$0, (%ecx)
.L4515:
	shrl	$3, %esi
	movl	%eax, %edi
	andl	$-1024, %edi
	movl	%esi, 20(%esp)
	leal	48(%edx), %ecx
	movl	%eax, %esi
	addl	$32, %edi
	orl	$8, %esi
	orl	$3, %ecx
	cmpl	$2, 16(%esp)
	movl	$5, 592(%eax)
	movl	$0, 52(%edx)
	movl	%esi, 48(%edx)
	movl	%edi, 56(%edx)
	movl	%ecx, 12(%edi)
	je	.L4532
	movl	16(%esp), %edx
	subl	$1, %edx
	cmpl	$1, %edx
	jbe	.L4517
.L4518:
	movl	12(%esp), %edx
	movl	%ebx, %ecx
	movl	$1, 592(%ebx)
	call	switchToThread_fp
	movl	20(%esp), %ecx
	movl	%ebp, %edx
	andb	$241, %dh
	call	fastpath_restore
.L4532:
	movl	24(%eax), %edx
	movl	%edx, 24(%ebx)
.L4517:
	movl	20(%eax), %eax
	movl	%eax, 20(%ebx)
	jmp	.L4518
.L4531:
	movl	$0, 652(%edi)
	jmp	.L4515
	.cfi_endproc
.LFE280:
	.size	fastpath_call, .-fastpath_call
	.p2align 4,,15
	.globl	fastpath_reply_wait
	.type	fastpath_reply_wait, @function
fastpath_reply_wait:
.LFB281:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%ecx, %eax
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	movl	%edx, %ecx
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	andl	$127, %ecx
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	cmpl	$120, %ecx
	movl	%edx, 8(%esp)
	jbe	.L4534
	movl	%edx, %esi
	andl	$-128, %esi
	movl	%esi, 8(%esp)
	orl	$120, 8(%esp)
.L4534:
	movl	ksCurThread, %ebx
	andl	$511, %edx
	movl	8(%esp), %esi
	movl	604(%ebx), %ecx
	andl	$127, %esi
	movl	%esi, 12(%esp)
	andl	$7, %ecx
	cmpl	$2, %edx
	ja	.L4536
	testl	%ecx, %ecx
	jne	.L4536
	andl	$-1024, %ebx
	movl	(%ebx), %edx
	movl	4(%ebx), %ecx
	movl	%eax, (%esp)
	leal	24(%esp), %eax
	call	lookup_fp
	movl	28(%esp), %eax
	movl	24(%esp), %ebx
	movl	%eax, %esi
	movl	%eax, 16(%esp)
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$4, %eax
	jne	.L4536
	andl	$1, %esi
	je	.L4536
	andl	$-16, %ebx
	movl	(%ebx), %eax
	andl	$3, %eax
	cmpl	$1, %eax
	je	.L4536
	movl	ksCurThread, %eax
	movl	%eax, %ebp
	andl	$-1024, %ebp
	movl	48(%ebp), %edx
	leal	48(%ebp), %esi
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$8, %ecx
	jne	.L4536
	movl	%edx, %ecx
	andl	$-16, %ecx
	testb	$7, 604(%ecx)
	jne	.L4536
	andl	$-1024, %edx
	movl	20(%edx), %edi
	movl	%edi, 20(%esp)
	movl	16(%edx), %edi
	movl	%edi, %edx
	andl	$15, %edi
	andl	$16777200, %edx
	sall	$8, %edx
	cmpl	$5, %edi
	je	.L4556
.L4536:
	movl	$-2, (%esp)
	call	slowpath
.L4556:
	testl	$65536, 20(%esp)
	je	.L4536
	movl	624(%eax), %edi
	cmpl	%edi, 624(%ecx)
	jb	.L4536
	movl	%ebx, %edi
	orl	$3, %edi
	movl	%edi, 592(%eax)
	movl	16(%esp), %edi
	addl	$2, 56(%eax)
	andl	$1, 600(%eax)
	andl	$2, %edi
	shrl	%edi
	xorl	$1, %edi
	movl	%edi, 596(%eax)
	movl	(%ebx), %edi
	andl	$-16, %edi
	jne	.L4540
	movl	%eax, %edi
	orl	$2, %edi
	movl	$0, 652(%eax)
	movl	$0, 648(%eax)
	movl	%eax, 4(%ebx)
	movl	%edi, (%ebx)
.L4541:
	movl	8(%esi), %ebx
	andl	$-8, %ebx
	cmpl	$2, 12(%esp)
	movl	$3, 12(%ebx)
	movl	$0, 48(%ebp)
	movl	$0, 4(%esi)
	movl	$0, 8(%esi)
	movl	$0, 12(%esi)
	je	.L4557
	movl	12(%esp), %ebx
	subl	$1, %ebx
	cmpl	$1, %ebx
	jbe	.L4543
.L4544:
	movl	$1, 592(%ecx)
	call	switchToThread_fp
	movl	8(%esp), %edx
	xorl	%ecx, %ecx
	andb	$241, %dh
	call	fastpath_restore
.L4557:
	movl	24(%eax), %ebx
	movl	%ebx, 24(%ecx)
.L4543:
	movl	20(%eax), %eax
	movl	%eax, 20(%ecx)
	jmp	.L4544
.L4540:
	movl	%eax, 648(%edi)
	movl	%edi, 652(%eax)
	movl	%eax, %edi
	orl	$2, %edi
	movl	$0, 648(%eax)
	movl	%edi, (%ebx)
	jmp	.L4541
	.cfi_endproc
.LFE281:
	.size	fastpath_reply_wait, .-fastpath_reply_wait
	.p2align 4,,15
	.globl	c_handle_syscall
	.type	c_handle_syscall, @function
c_handle_syscall:
.LFB264:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	cmpl	$-1, %eax
	je	.L4562
	cmpl	$-2, %eax
	je	.L4563
	movl	%eax, (%esp)
	call	slowpath
.L4563:
	movl	40(%esp), %edx
	movl	36(%esp), %ecx
	call	fastpath_reply_wait
.L4562:
	movl	40(%esp), %edx
	movl	36(%esp), %ecx
	call	fastpath_call
	.cfi_endproc
.LFE264:
	.size	c_handle_syscall, .-c_handle_syscall
	.section	.boot.text
	.p2align 4,,15
	.globl	acpi_table_init
	.type	acpi_table_init, @function
acpi_table_init:
.LFB561:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	movl	$4194303, %edx
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	36(%esp), %edi
	movl	%ebx, %esi
	andl	$4194303, %esi
	subl	%esi, %edx
	cmpl	$36, %edx
	sbbl	%edx, %edx
	notl	%edx
	addl	$2, %edx
	movl	%edx, 4(%esp)
	movl	%ebx, (%esp)
	call	map_temp_boot_page
	testl	%edi, %edi
	je	.L4567
	cmpl	$1, %edi
	jne	.L4574
	addl	4(%ebx), %esi
.L4573:
	movl	%esi, %eax
	movl	$1025, %edx
	mull	%edx
	movl	%ebx, 32(%esp)
	subl	%edx, %esi
	shrl	%esi
	addl	%edx, %esi
	shrl	$21, %esi
	addl	$1, %esi
	movl	%esi, 36(%esp)
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
	jmp	map_temp_boot_page
	.p2align 4,,7
	.p2align 3
.L4574:
	.cfi_restore_state
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
	.p2align 4,,7
	.p2align 3
.L4567:
	.cfi_restore_state
	addl	20(%ebx), %esi
	jmp	.L4573
	.cfi_endproc
.LFE561:
	.size	acpi_table_init, .-acpi_table_init
	.p2align 4,,15
	.globl	acpi_init
	.type	acpi_init, @function
acpi_init:
.LFB562:
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
	movl	$917504, %ebx
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	jmp	.L4576
	.p2align 4,,7
	.p2align 3
.L4579:
	addl	$16, %ebx
	cmpl	$1048576, %ebx
	je	.L4591
.L4576:
	cmpb	$82, (%ebx)
	jne	.L4579
	cmpb	$83, 1(%ebx)
	jne	.L4579
	cmpb	$68, 2(%ebx)
	jne	.L4579
	cmpb	$32, 3(%ebx)
	jne	.L4579
	cmpb	$80, 4(%ebx)
	jne	.L4579
	cmpb	$84, 5(%ebx)
	jne	.L4579
	cmpb	$82, 6(%ebx)
	jne	.L4579
	cmpb	$32, 7(%ebx)
	jne	.L4579
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
	andl	$2139062143, %esi
	xorl	%ecx, %edx
	addl	%esi, %eax
	andl	$-2139062144, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	movzbl	%ah, %esi
	shrl	$16, %edx
	movl	%eax, %ecx
	shrl	$24, %ecx
	addl	%esi, %edx
	addl	%ecx, %edx
	addl	%edx, %eax
	testb	%al, %al
	jne	.L4579
	movl	%ebx, %esi
	movl	$4194303, %edi
	andl	$4194303, %esi
	movl	%edi, %eax
	subl	%esi, %eax
	cmpl	$36, %eax
	sbbl	%eax, %eax
	notl	%eax
	addl	$2, %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	map_temp_boot_page
	addl	20(%ebx), %esi
	movl	%ebx, (%esp)
	movl	%esi, %ecx
	movl	$1025, %esi
	movl	%ecx, %eax
	mull	%esi
	movl	%ecx, %eax
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$21, %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	call	map_temp_boot_page
	movl	16(%eax), %ebx
	movl	%ebx, %ebp
	andl	$4194303, %ebp
	subl	%ebp, %edi
	cmpl	$36, %edi
	sbbl	%eax, %eax
	notl	%eax
	addl	$2, %eax
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	map_temp_boot_page
	movl	4(%ebx), %ecx
	movl	%ebx, (%esp)
	addl	%ebp, %ecx
	movl	%ecx, %eax
	mull	%esi
	movl	%ecx, %eax
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$21, %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	call	map_temp_boot_page
	movl	4(%eax), %edx
	testl	%edx, %edx
	je	.L4594
	movl	%edx, %edi
	shrl	$2, %edi
	movl	%edi, 8(%esp)
	sall	$2, %edi
	testl	%edi, %edi
	je	.L4595
	cmpl	$5, %edx
	jbe	.L4595
	xorl	%ecx, %ecx
	xorl	%ebp, %ebp
	movl	%ebx, 12(%esp)
.L4590:
	movl	(%eax,%ecx,4), %esi
	movl	%ebp, %ebx
	xorl	(%eax,%ecx,4), %ebp
	andl	$2139062143, %ebx
	addl	$1, %ecx
	andl	$2139062143, %esi
	andl	$-2139062144, %ebp
	addl	%ebx, %esi
	xorl	%ebp, %esi
	cmpl	8(%esp), %ecx
	jae	.L4612
	movl	%esi, %ebp
	jmp	.L4590
	.p2align 4,,7
	.p2align 3
.L4595:
	movl	%edx, %esi
	xorl	%ecx, %ecx
.L4584:
	addb	(%eax), %cl
	cmpl	$1, %esi
	je	.L4588
	addb	1(%eax), %cl
	cmpl	$2, %esi
	je	.L4588
	addb	2(%eax), %cl
	cmpl	$3, %esi
	je	.L4588
	addb	3(%eax), %cl
	cmpl	$4, %esi
	je	.L4588
	addb	4(%eax), %cl
.L4588:
	testb	%cl, %cl
	jne	.L4591
.L4594:
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebx, %eax
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
.L4591:
	.cfi_restore_state
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
.L4612:
	.cfi_restore_state
	movl	%esi, %ecx
	addl	%edi, %eax
	movl	12(%esp), %ebx
	movzbl	%ch, %ebp
	shrl	$24, %ecx
	addl	%ebp, %ecx
	addl	%esi, %ecx
	shrl	$16, %esi
	addl	%esi, %ecx
	movl	%edx, %esi
	subl	%edi, %esi
	cmpl	%edi, %edx
	jne	.L4584
	jmp	.L4588
	.cfi_endproc
.LFE562:
	.size	acpi_init, .-acpi_init
	.p2align 4,,15
	.globl	acpi_madt_scan
	.type	acpi_madt_scan, @function
acpi_madt_scan:
.LFB563:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	$4194303, %edx
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
	movl	48(%esp), %ebx
	movl	%ebx, %esi
	andl	$4194303, %esi
	subl	%esi, %edx
	cmpl	$36, %edx
	sbbl	%eax, %eax
	notl	%eax
	addl	$2, %eax
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	map_temp_boot_page
	movl	$1025, %edx
	addl	4(%ebx), %esi
	movl	%ebx, (%esp)
	movl	%esi, %eax
	mull	%edx
	movl	%esi, %eax
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$21, %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	call	map_temp_boot_page
	movl	%eax, 12(%esp)
	movl	4(%eax), %eax
	subl	$36, %eax
	movl	%eax, 8(%esp)
	shrl	$2, 8(%esp)
	movl	8(%esp), %eax
	testl	%eax, %eax
	je	.L4624
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	.p2align 4,,7
	.p2align 3
.L4622:
	movl	12(%esp), %eax
	movl	36(%eax,%ebx,4), %ebp
	movl	$4194303, %eax
	movl	%ebp, %esi
	andl	$4194303, %esi
	subl	%esi, %eax
	cmpl	$36, %eax
	sbbl	%eax, %eax
	notl	%eax
	addl	$2, %eax
	movl	%eax, 4(%esp)
	movl	%ebp, (%esp)
	call	map_temp_boot_page
	movl	$1025, %eax
	addl	4(%ebp), %esi
	movl	%ebp, (%esp)
	mull	%esi
	movl	%esi, %ecx
	subl	%edx, %ecx
	shrl	%ecx
	addl	%edx, %ecx
	shrl	$21, %ecx
	addl	$1, %ecx
	movl	%ecx, 4(%esp)
	call	map_temp_boot_page
	cmpb	$65, (%eax)
	jne	.L4617
	cmpb	$80, 1(%eax)
	jne	.L4617
	cmpb	$73, 2(%eax)
	jne	.L4617
	cmpb	$67, 3(%eax)
	jne	.L4617
	movl	4(%eax), %ebp
	leal	44(%eax), %edx
	leal	(%eax,%ebp), %ecx
	cmpl	%ecx, %edx
	jb	.L4621
	jmp	.L4617
	.p2align 4,,7
	.p2align 3
.L4618:
	movzbl	1(%edx), %ecx
	addl	%ecx, %edx
	leal	(%eax,%ebp), %ecx
	cmpl	%ecx, %edx
	jae	.L4617
.L4621:
	cmpb	$0, (%edx)
	jne	.L4618
	cmpl	$1, 4(%edx)
	movzbl	3(%edx), %ecx
	jne	.L4618
	cmpl	%edi, 56(%esp)
	jbe	.L4620
	movl	52(%esp), %esi
	movl	%ecx, (%esi,%edi,4)
	movl	4(%eax), %ebp
.L4620:
	movzbl	1(%edx), %ecx
	addl	$1, %edi
	addl	%ecx, %edx
	leal	(%eax,%ebp), %ecx
	cmpl	%ecx, %edx
	jb	.L4621
	.p2align 4,,7
	.p2align 3
.L4617:
	addl	$1, %ebx
	cmpl	8(%esp), %ebx
	jne	.L4622
.L4615:
	addl	$28, %esp
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
.L4624:
	.cfi_restore_state
	xorl	%edi, %edi
	jmp	.L4615
	.cfi_endproc
.LFE563:
	.size	acpi_madt_scan, .-acpi_madt_scan
	.text
	.p2align 4,,15
	.globl	platAddDevices
	.type	platAddDevices, @function
platAddDevices:
.LFB564:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	xorl	%edi, %edi
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.p2align 4,,7
	.p2align 3
.L4628:
	movl	%edi, %ebp
	xorl	%ebx, %ebx
	sall	$16, %ebp
	orl	$-2147483636, %ebp
	jmp	.L4635
	.p2align 4,,7
	.p2align 3
.L4632:
	addl	$1, %ebx
	cmpl	$32, %ebx
	je	.L4642
.L4635:
	movl	%ebx, %edx
	movl	%edi, %eax
	call	pci_scan_fun.constprop.145
	testl	%eax, %eax
	je	.L4632
	movl	%ebx, %eax
	sall	$11, %eax
	orl	%ebp, %eax
	movl	%eax, 4(%esp)
	movl	$3320, (%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	shrl	$16, %eax
	testb	%al, %al
	jns	.L4632
	movl	$1, %esi
	.p2align 4,,7
	.p2align 3
.L4633:
	movl	%esi, %ecx
	movl	%ebx, %edx
	movl	%edi, %eax
	addl	$1, %esi
	call	pci_scan_fun
	cmpl	$8, %esi
	jne	.L4633
	addl	$1, %ebx
	cmpl	$32, %ebx
	jne	.L4635
	.p2align 4,,7
	.p2align 3
.L4642:
	addl	$1, %edi
	cmpl	$256, %edi
	jne	.L4628
	movl	glks+828, %eax
	cmpl	$198, %eax
	ja	.L4627
	leal	glks+816(,%eax,8), %edx
	addl	$1, %eax
	movl	$753664, 16(%edx)
	movl	$757760, 20(%edx)
	movl	%eax, glks+828
.L4627:
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
.LFE564:
	.size	platAddDevices, .-platAddDevices
	.p2align 4,,15
	.globl	maskInterrupt
	.type	maskInterrupt, @function
maskInterrupt:
.LFB565:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %ecx
	movl	32(%esp), %eax
	cmpl	$15, %ecx
	jle	.L4650
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
.L4650:
	.cfi_restore_state
	cmpl	$7, %ecx
	jle	.L4651
	subl	$8, %ecx
	movl	$1, %edx
	sall	%cl, %edx
	movl	$161, %ebx
	testl	%eax, %eax
	movl	%edx, %esi
	movl	%ebx, (%esp)
	jne	.L4652
.L4647:
	call	in8
	notl	%esi
	andl	%esi, %eax
.L4649:
	movzbl	%al, %eax
	movl	%ebx, 32(%esp)
	movl	%eax, 36(%esp)
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	out8
	.p2align 4,,7
	.p2align 3
.L4651:
	.cfi_restore_state
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
	testl	%eax, %eax
	movl	%ebx, (%esp)
	je	.L4647
.L4652:
	call	in8
	orl	%esi, %eax
	jmp	.L4649
	.cfi_endproc
.LFE565:
	.size	maskInterrupt, .-maskInterrupt
	.p2align 4,,15
	.globl	handleReservedIRQ
	.type	handleReservedIRQ, @function
handleReservedIRQ:
.LFB566:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE566:
	.size	handleReservedIRQ, .-handleReservedIRQ
	.p2align 4,,15
	.globl	getActiveIRQ
	.type	getActiveIRQ, @function
getActiveIRQ:
.LFB567:
	.cfi_startproc
	movl	ia32KScurInterrupt, %eax
	cmpl	$-1, %eax
	je	.L4656
	subl	$32, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L4656:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE567:
	.size	getActiveIRQ, .-getActiveIRQ
	.p2align 4,,15
	.globl	isIRQPending
	.type	isIRQPending, @function
isIRQPending:
.LFB568:
	.cfi_startproc
	movl	-65008, %eax
	testl	%eax, %eax
	jne	.L4662
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
	movl	$32, (%esp)
	call	in8
	testb	%al, %al
	setne	%al
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	movzbl	%al, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L4662:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE568:
	.size	isIRQPending, .-isIRQPending
	.p2align 4,,15
	.globl	ackInterrupt
	.type	ackInterrupt, @function
ackInterrupt:
.LFB569:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	cmpl	$15, 32(%esp)
	jle	.L4668
	movl	$0, -65360
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L4668:
	.cfi_restore_state
	cmpl	$39, ia32KScurInterrupt
	jle	.L4665
	movl	$32, 4(%esp)
	movl	$160, (%esp)
	call	out8
.L4665:
	movl	$32, 4(%esp)
	movl	$32, (%esp)
	call	out8
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE569:
	.size	ackInterrupt, .-ackInterrupt
	.p2align 4,,15
	.globl	handleSpuriousIRQ
	.type	handleSpuriousIRQ, @function
handleSpuriousIRQ:
.LFB570:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE570:
	.size	handleSpuriousIRQ, .-handleSpuriousIRQ
	.p2align 4,,15
	.globl	resetTimer
	.type	resetTimer, @function
resetTimer:
.LFB571:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE571:
	.size	resetTimer, .-resetTimer
	.section	.boot.text
	.p2align 4,,15
	.globl	pci_scan
	.type	pci_scan, @function
pci_scan:
.LFB578:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %eax
	testl	%eax, %eax
	setne	15(%esp)
	xorl	%edi, %edi
	.p2align 4,,7
	.p2align 3
.L4672:
	movl	%edi, %ebp
	xorl	%ebx, %ebx
	sall	$16, %ebp
	xorl	%esi, %esi
	movw	%di, 12(%esp)
	orl	$-2147483636, %ebp
	jmp	.L4680
	.p2align 4,,7
	.p2align 3
.L4673:
	addl	$1, %ebx
	cmpl	$32, %ebx
	je	.L4694
.L4680:
	movl	%ebx, %edx
	movl	%edi, %eax
	call	pci_scan_fun.constprop.145
	testl	%eax, %eax
	je	.L4673
	movl	%ebx, %eax
	sall	$11, %eax
	orl	%ebp, %eax
	movl	%eax, 4(%esp)
	movl	$3320, (%esp)
	call	out32
	movl	$3324, (%esp)
	call	in32
	shrl	$16, %eax
	testb	%al, %al
	js	.L4674
.L4675:
	addl	$1, %ebx
	movl	$1, %esi
	cmpl	$32, %ebx
	jne	.L4680
.L4694:
	testl	%esi, %esi
	je	.L4678
	cmpb	$0, 15(%esp)
	je	.L4678
	movzwl	12(%esp), %ecx
	movl	$1, %eax
	movl	%ecx, %edx
	sall	%cl, %eax
	movl	48(%esp), %ecx
	shrw	$5, %dx
	movzwl	%dx, %edx
	orl	%eax, (%ecx,%edx,4)
.L4678:
	addl	$1, %edi
	cmpl	$256, %edi
	jne	.L4672
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
	.p2align 4,,7
	.p2align 3
.L4674:
	.cfi_restore_state
	movl	$1, %esi
	.p2align 4,,7
	.p2align 3
.L4676:
	movl	%esi, %ecx
	movl	%ebx, %edx
	movl	%edi, %eax
	addl	$1, %esi
	call	pci_scan_fun
	cmpl	$8, %esi
	jne	.L4676
	jmp	.L4675
	.cfi_endproc
.LFE578:
	.size	pci_scan, .-pci_scan
	.p2align 4,,15
	.globl	pic_remap_irqs
	.type	pic_remap_irqs, @function
pic_remap_irqs:
.LFB579:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	$17, 4(%esp)
	movl	$32, (%esp)
	call	out8
	movl	$17, 4(%esp)
	movl	$160, (%esp)
	call	out8
	movzbl	%bl, %eax
	addl	$8, %ebx
	movl	%eax, 4(%esp)
	movzbl	%bl, %ebx
	movl	$33, (%esp)
	call	out8
	movl	%ebx, 4(%esp)
	movl	$161, (%esp)
	call	out8
	movl	$4, 4(%esp)
	movl	$33, (%esp)
	call	out8
	movl	$2, 4(%esp)
	movl	$161, (%esp)
	call	out8
	movl	$1, 4(%esp)
	movl	$33, (%esp)
	call	out8
	movl	$1, 4(%esp)
	movl	$161, (%esp)
	call	out8
	movl	$0, 4(%esp)
	movl	$33, (%esp)
	call	out8
	movl	$0, 4(%esp)
	movl	$161, (%esp)
	call	out8
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE579:
	.size	pic_remap_irqs, .-pic_remap_irqs
	.text
	.p2align 4,,15
	.globl	pic_mask_irq
	.type	pic_mask_irq, @function
pic_mask_irq:
.LFB580:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %ecx
	movl	32(%esp), %eax
	cmpl	$7, %ecx
	jg	.L4698
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
	testl	%eax, %eax
	movl	%ebx, (%esp)
	jne	.L4703
.L4700:
	call	in8
	notl	%esi
	andl	%esi, %eax
.L4702:
	movzbl	%al, %eax
	movl	%ebx, 32(%esp)
	movl	%eax, 36(%esp)
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	out8
	.p2align 4,,7
	.p2align 3
.L4698:
	.cfi_restore_state
	subl	$8, %ecx
	movl	$1, %edx
	sall	%cl, %edx
	movl	$161, %ebx
	testl	%eax, %eax
	movl	%edx, %esi
	movl	%ebx, (%esp)
	je	.L4700
.L4703:
	call	in8
	orl	%esi, %eax
	jmp	.L4702
	.cfi_endproc
.LFE580:
	.size	pic_mask_irq, .-pic_mask_irq
	.p2align 4,,15
	.globl	pic_is_irq_pending
	.type	pic_is_irq_pending, @function
pic_is_irq_pending:
.LFB581:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	$10, 4(%esp)
	movl	$32, (%esp)
	call	out8
	movl	$32, (%esp)
	call	in8
	testb	%al, %al
	setne	%al
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE581:
	.size	pic_is_irq_pending, .-pic_is_irq_pending
	.p2align 4,,15
	.globl	pic_ack_active_irq
	.type	pic_ack_active_irq, @function
pic_ack_active_irq:
.LFB582:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	cmpl	$39, ia32KScurInterrupt
	jle	.L4707
	movl	$32, 4(%esp)
	movl	$160, (%esp)
	call	out8
.L4707:
	movl	$32, 4(%esp)
	movl	$32, (%esp)
	call	out8
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE582:
	.size	pic_ack_active_irq, .-pic_ack_active_irq
	.section	.phys.text
	.p2align 4,,15
	.globl	pit_init
	.type	pit_init, @function
pit_init:
.LFB583:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	$52, 4(%esp)
	movl	$67, (%esp)
	call	out8_phys
	movl	$11, 4(%esp)
	movl	$64, (%esp)
	call	out8_phys
	movl	$233, 4(%esp)
	movl	$64, (%esp)
	call	out8_phys
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE583:
	.size	pit_init, .-pit_init
	.p2align 4,,15
	.globl	pit_wait_wraparound
	.type	pit_wait_wraparound, @function
pit_wait_wraparound:
.LFB584:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	$0, 4(%esp)
	movl	$67, (%esp)
	call	out8_phys
	movl	$64, (%esp)
	call	in8_phys
	movl	$64, (%esp)
	movl	%eax, %esi
	call	in8_phys
	movl	%eax, %ebx
	movl	%esi, %eax
	sall	$8, %ebx
	movzbl	%al, %esi
	orl	%esi, %ebx
	jmp	.L4713
	.p2align 4,,7
	.p2align 3
.L4715:
	movl	%edx, %ebx
.L4713:
	movl	$0, 4(%esp)
	movl	$67, (%esp)
	call	out8_phys
	movl	$64, (%esp)
	call	in8_phys
	movl	$64, (%esp)
	movl	%eax, %esi
	call	in8_phys
	movl	%eax, %edx
	movl	%esi, %eax
	sall	$8, %edx
	movzbl	%al, %esi
	orl	%esi, %edx
	cmpw	%bx, %dx
	jbe	.L4715
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE584:
	.size	pit_wait_wraparound, .-pit_wait_wraparound
	.p2align 4,,15
	.globl	apic_measure_freq
	.type	apic_measure_freq, @function
apic_measure_freq:
.LFB286:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	$52, 4(%esp)
	movl	$67, (%esp)
	call	out8_phys
	movl	$11, 4(%esp)
	movl	$64, (%esp)
	call	out8_phys
	movl	$233, 4(%esp)
	movl	$64, (%esp)
	call	out8_phys
	call	pit_wait_wraparound
	movl	$11, 992(%ebx)
	movl	$-1, 896(%ebx)
	call	pit_wait_wraparound
	movl	912(%ebx), %eax
	movl	$1374389535, %edx
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	notl	%eax
	mull	%edx
	shrl	$4, %edx
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE286:
	.size	apic_measure_freq, .-apic_measure_freq
	.text
	.p2align 4,,15
	.globl	memzero
	.type	memzero, @function
memzero:
.LFB585:
	.cfi_startproc
	movl	8(%esp), %eax
	movl	4(%esp), %edx
	testl	%eax, %eax
	je	.L4718
	.p2align 4,,7
	.p2align 3
.L4724:
	movl	$0, (%edx)
	addl	$4, %edx
	subl	$4, %eax
	jne	.L4724
.L4718:
	rep ret
	.cfi_endproc
.LFE585:
	.size	memzero, .-memzero
	.p2align 4,,15
	.globl	memset
	.type	memset, @function
memset:
.LFB586:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ebx
	movl	40(%esp), %edx
	testl	%eax, %eax
	jne	.L4727
	movl	%ebx, %ecx
	orl	%edx, %ecx
	andl	$3, %ecx
	jne	.L4727
	testl	%edx, %edx
	movl	%ebx, %ecx
	je	.L4733
	.p2align 4,,7
	.p2align 3
.L4735:
	movl	$0, (%ecx)
	addl	$4, %ecx
	subl	$4, %edx
	jne	.L4735
.L4733:
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.L4727:
	.cfi_restore_state
	testl	%edx, %edx
	je	.L4733
	movzbl	%al, %eax
	movl	%ebx, (%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	call	memset
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE586:
	.size	memset, .-memset
	.p2align 4,,15
	.globl	memcpy
	.type	memcpy, @function
memcpy:
.LFB587:
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
	movl	28(%esp), %ecx
	movl	20(%esp), %eax
	movl	24(%esp), %edx
	testl	%ecx, %ecx
	je	.L4752
	leal	4(%eax), %ebx
	cmpl	%ebx, %edx
	leal	4(%edx), %esi
	setae	%cl
	cmpl	%esi, %eax
	movl	%ecx, %edi
	setae	%bl
	movl	%ebx, %esi
	orl	%esi, %edi
	cmpl	$9, 28(%esp)
	movl	%edi, %ecx
	seta	%bl
	testb	%bl, %cl
	je	.L4740
	movl	%eax, %ebx
	orl	%edx, %ebx
	andl	$3, %ebx
	jne	.L4740
	movl	28(%esp), %esi
	xorl	%ebx, %ebx
	shrl	$2, %esi
	leal	0(,%esi,4), %edi
.L4746:
	movl	(%edx,%ebx,4), %ebp
	movl	%ebp, (%eax,%ebx,4)
	addl	$1, %ebx
	cmpl	%ebx, %esi
	ja	.L4746
	movl	28(%esp), %esi
	addl	%edi, %edx
	leal	(%eax,%edi), %ebx
	subl	%edi, %esi
	cmpl	%edi, 28(%esp)
	je	.L4752
	movzbl	(%edx), %ecx
	cmpl	$1, %esi
	movb	%cl, (%ebx)
	je	.L4752
	movzbl	1(%edx), %ecx
	cmpl	$2, %esi
	movb	%cl, 1(%ebx)
	je	.L4752
	movzbl	2(%edx), %edx
	movb	%dl, 2(%ebx)
.L4752:
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
	.p2align 4,,7
	.p2align 3
.L4740:
	.cfi_restore_state
	movl	28(%esp), %esi
	movl	%eax, %ecx
	addl	%eax, %esi
	.p2align 4,,7
	.p2align 3
.L4748:
	movzbl	(%edx), %ebx
	addl	$1, %ecx
	addl	$1, %edx
	movb	%bl, -1(%ecx)
	cmpl	%esi, %ecx
	jne	.L4748
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
.LFE587:
	.size	memcpy, .-memcpy
	.p2align 4,,15
	.globl	strncmp
	.type	strncmp, @function
strncmp:
.LFB588:
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
	movl	28(%esp), %esi
	movl	20(%esp), %edi
	movl	24(%esp), %ebp
	testl	%esi, %esi
	je	.L4769
	movzbl	(%edi), %ecx
	movzbl	0(%ebp), %edx
	movzbl	%cl, %eax
	subl	%edx, %eax
	jne	.L4762
	testb	%cl, %cl
	je	.L4769
	xorl	%edx, %edx
	jmp	.L4763
	.p2align 4,,7
	.p2align 3
.L4764:
	movzbl	(%edi,%edx), %ebx
	movzbl	0(%ebp,%edx), %ecx
	movzbl	%bl, %eax
	subl	%ecx, %eax
	jne	.L4762
	testb	%bl, %bl
	je	.L4769
.L4763:
	addl	$1, %edx
	cmpl	%esi, %edx
	jne	.L4764
.L4769:
	xorl	%eax, %eax
.L4762:
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
.LFE588:
	.size	strncmp, .-strncmp
	.p2align 4,,15
	.globl	char_to_int
	.type	char_to_int, @function
char_to_int:
.LFB589:
	.cfi_startproc
	movl	4(%esp), %eax
	leal	-48(%eax), %edx
	cmpb	$9, %dl
	jbe	.L4776
	leal	-65(%eax), %edx
	cmpb	$5, %dl
	jbe	.L4777
	leal	-97(%eax), %edx
	cmpb	$5, %dl
	ja	.L4775
	movsbl	%al, %eax
	subl	$87, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L4777:
	movsbl	%al, %eax
	subl	$55, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L4776:
	movsbl	%al, %eax
	subl	$48, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L4775:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE589:
	.size	char_to_int, .-char_to_int
	.p2align 4,,15
	.globl	str_to_int
	.type	str_to_int, @function
str_to_int:
.LFB590:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	movl	$10, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	12(%esp), %ecx
	movsbl	(%ecx), %edx
	cmpb	$48, %dl
	je	.L4794
.L4779:
	testb	%dl, %dl
	je	.L4791
.L4780:
	xorl	%eax, %eax
	jmp	.L4786
	.p2align 4,,7
	.p2align 3
.L4795:
	subl	$48, %edx
.L4783:
	cmpl	%esi, %edx
	.p2align 4,,2
	jae	.L4791
	imull	%esi, %eax
	addl	$1, %ecx
	addl	%edx, %eax
	movsbl	(%ecx), %edx
	testb	%dl, %dl
	je	.L4792
.L4786:
	leal	-48(%edx), %ebx
	cmpb	$9, %bl
	jbe	.L4795
	leal	-65(%edx), %ebx
	cmpb	$5, %bl
	ja	.L4784
	subl	$55, %edx
	jmp	.L4783
	.p2align 4,,7
	.p2align 3
.L4791:
	movl	$-1, %eax
.L4792:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L4784:
	.cfi_restore_state
	leal	-97(%edx), %ebx
	cmpb	$5, %bl
	ja	.L4791
	subl	$87, %edx
	jmp	.L4783
	.p2align 4,,7
	.p2align 3
.L4794:
	movzbl	1(%ecx), %eax
	andl	$-33, %eax
	cmpb	$88, %al
	jne	.L4780
	movsbl	2(%ecx), %edx
	movw	$16, %si
	addl	$2, %ecx
	jmp	.L4779
	.cfi_endproc
.LFE590:
	.size	str_to_int, .-str_to_int
	.p2align 4,,15
	.globl	cmdline_parse
	.type	cmdline_parse, @function
cmdline_parse:
.LFB317:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	movl	$cmdline_str_max_num_nodes, %edx
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %esi
	movl	20(%esp), %ebx
	movl	%esi, %eax
	movl	$1, (%ebx)
	call	parse_opt.constprop.142
	cmpl	$-1, %eax
	je	.L4797
	movl	$cmdline_val, (%esp)
	call	str_to_int
	leal	-1(%eax), %edx
	cmpl	$39, %edx
	jbe	.L4806
.L4797:
	movl	$0, 4(%ebx)
	movl	$cmdline_str_num_sh_frames, %edx
	movl	%esi, %eax
	call	parse_opt.constprop.142
	cmpl	$-1, %eax
	je	.L4796
	movl	$cmdline_val, (%esp)
	call	str_to_int
	cmpl	$1048575, %eax
	ja	.L4796
	movl	%eax, 4(%ebx)
.L4796:
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
	.p2align 4,,7
	.p2align 3
.L4806:
	.cfi_restore_state
	movl	%eax, (%ebx)
	jmp	.L4797
	.cfi_endproc
.LFE317:
	.size	cmdline_parse, .-cmdline_parse
	.section	.boot.text
	.p2align 4,,15
	.globl	boot_sys
	.type	boot_sys, @function
boot_sys:
.LFB314:
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
	cmpl	$732803074, 64(%esp)
	movl	$1, glks+24
	je	.L4898
.L4808:
	call	halt
	.p2align 4,,7
	.p2align 3
.L4898:
	movl	68(%esp), %eax
	movl	$cmdline_str_max_num_nodes, %edx
	movl	$1, cmdline_opt
	movl	16(%eax), %ebx
	movl	%ebx, %eax
	call	parse_opt.constprop.142
	cmpl	$-1, %eax
	je	.L4809
	movl	$cmdline_val, (%esp)
	call	str_to_int
	leal	-1(%eax), %edx
	cmpl	$39, %edx
	ja	.L4809
	movl	%eax, cmdline_opt
.L4809:
	movl	$cmdline_str_num_sh_frames, %edx
	movl	%ebx, %eax
	movl	$0, cmdline_opt+4
	call	parse_opt.constprop.142
	cmpl	$-1, %eax
	je	.L4810
	movl	$cmdline_val, (%esp)
	call	str_to_int
	cmpl	$1048575, %eax
	ja	.L4810
	movl	%eax, cmdline_opt+4
.L4810:
	movl	68(%esp), %eax
	testb	$1, (%eax)
	je	.L4808
	movl	4(%eax), %eax
	sall	$10, %eax
	cmpl	$525311, %eax
	jbe	.L4808
	movl	$_boot_cpu_end, %edx
	movl	$524288, %eax
	subl	$_boot_cpu_start, %edx
	testl	%edx, %edx
	leal	524288(%edx), %ecx
	je	.L4814
	.p2align 4,,7
	.p2align 3
.L4871:
	movzbl	_boot_cpu_start-524288(%eax), %edx
	addl	$1, %eax
	movb	%dl, -1(%eax)
	cmpl	%ecx, %eax
	jne	.L4871
.L4814:
	movl	68(%esp), %eax
	movl	$532676608, %edx
	movl	$1048576, glks
	movl	8(%eax), %eax
	movl	$32, (%esp)
	movl	$1048576, glks+8
	movl	$ki_end+536870912, glks+12
	sall	$10, %eax
	addl	$1048576, %eax
	andl	$-4096, %eax
	cmpl	$532676608, %eax
	cmovbe	%eax, %edx
	movl	72(%esp), %eax
	movl	%edx, glks+4
	movl	%eax, glks+2424
	call	pic_remap_irqs
	movl	$0, glks+828
	call	acpi_init
	testl	%eax, %eax
	je	.L4808
	movl	$40, 8(%esp)
	movl	$glks+28, 4(%esp)
	movl	%eax, (%esp)
	call	acpi_madt_scan
	testl	%eax, %eax
	movl	%eax, glks+24
	je	.L4808
	movl	cmdline_opt, %edx
	movl	%eax, 20(%esp)
	cmpl	%edx, %eax
	jbe	.L4817
	movl	%edx, glks+24
	movl	%edx, 20(%esp)
.L4817:
	movl	68(%esp), %eax
	testb	$8, (%eax)
	je	.L4808
	movl	20(%eax), %ebp
	testl	%ebp, %ebp
	je	.L4808
	movl	24(%eax), %edi
	movl	4(%edi), %eax
	movl	%eax, %edx
	subl	(%edi), %edx
	testl	%edx, %edx
	jle	.L4808
	movl	%edi, %edx
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	movl	%edi, 24(%esp)
	jmp	.L4818
	.p2align 4,,7
	.p2align 3
.L4819:
	movl	20(%edx), %eax
	movl	%edx, %esi
	addl	$16, %edx
	movl	%eax, %edi
	subl	16(%esi), %edi
	testl	%edi, %edi
	jle	.L4808
.L4818:
	cmpl	%eax, %ecx
	cmovb	%eax, %ecx
	addl	$1, %ebx
	cmpl	%ebp, %ebx
	jne	.L4819
	movl	20(%esp), %eax
	subl	$1, %ecx
	xorl	%esi, %esi
	andl	$-4096, %ecx
	movl	24(%esp), %edi
	leal	4096(%ecx), %ebx
	movl	%ebx, %ecx
	testl	%eax, %eax
	jne	.L4873
	jmp	.L4824
	.p2align 4,,7
	.p2align 3
.L4821:
	cmpl	%eax, %esi
	jae	.L4822
	movl	68(%esp), %eax
	movl	24(%eax), %edi
.L4873:
	movl	%esi, %eax
	sall	$4, %eax
	movl	(%edi,%eax), %edx
	movl	%esi, %eax
	call	load_boot_module.isra.140
	testl	%eax, %eax
	movl	%eax, %ecx
	je	.L4808
	movl	68(%esp), %eax
	addl	$1, %esi
	movl	20(%eax), %edi
	movl	glks+24, %eax
	cmpl	%edi, %esi
	jb	.L4821
.L4822:
	cmpl	%eax, %edi
	jae	.L4824
	movl	%edi, %edx
	movl	68(%esp), %eax
	jmp	.L4825
	.p2align 4,,7
	.p2align 3
.L4899:
	movl	68(%esp), %eax
	movl	20(%eax), %edx
.L4825:
	addl	$268435455, %edx
	sall	$4, %edx
	addl	24(%eax), %edx
	movl	%edi, %eax
	movl	(%edx), %edx
	call	load_boot_module.isra.140
	testl	%eax, %eax
	movl	%eax, %ecx
	je	.L4808
	addl	$1, %edi
	cmpl	glks+24, %edi
	jb	.L4899
.L4824:
	movl	glks+12, %esi
	movl	%ebx, 28(%esp)
	movl	%esi, %edx
	subl	%ebx, %edx
	addl	%edx, %ecx
	movl	%ecx, %eax
	subl	%esi, %eax
	movl	%edx, 20(%esp)
	movl	%eax, 24(%esp)
	je	.L4834
	leal	4(%ebx), %edi
	cmpl	%edi, %esi
	leal	4(%esi), %ebp
	setae	%al
	cmpl	%ebp, %ebx
	movl	%eax, %edi
	setae	%al
	movl	%eax, %ebp
	orl	%ebp, %edi
	testl	$3, %esi
	sete	%al
	movl	%eax, %ebp
	movl	%edi, %eax
	movl	%ebp, %edx
	testb	%dl, %al
	je	.L4829
	movl	24(%esp), %ebp
	cmpl	$8, %ebp
	jbe	.L4829
	shrl	$2, %ebp
	xorl	%eax, %eax
	leal	0(,%ebp,4), %edi
.L4835:
	movl	(%ebx,%eax,4), %edx
	movl	%edx, (%esi,%eax,4)
	addl	$1, %eax
	cmpl	%ebp, %eax
	jb	.L4835
	movl	24(%esp), %edx
	addl	%edi, %ebx
	addl	%edi, %esi
	movl	%edx, %eax
	subl	%edi, %eax
	cmpl	%edi, %edx
	je	.L4834
	movzbl	(%ebx), %edx
	cmpl	$1, %eax
	movb	%dl, (%esi)
	je	.L4834
	movzbl	1(%ebx), %edx
	cmpl	$2, %eax
	movb	%dl, 1(%esi)
	je	.L4834
	movzbl	2(%ebx), %eax
	movb	%al, 2(%esi)
.L4834:
	movl	glks+24, %esi
	movl	$glks+188, %eax
	movl	20(%esp), %edx
	movl	%esi, %ebx
	sall	$4, %ebx
	addl	%eax, %ebx
	testl	%esi, %esi
	je	.L4828
	.p2align 4,,7
	.p2align 3
.L4872:
	addl	%edx, (%eax)
	addl	%edx, 4(%eax)
	addl	%edx, 8(%eax)
	addl	$16, %eax
	cmpl	%ebx, %eax
	jne	.L4872
.L4828:
	movl	cmdline_opt+4, %eax
	movl	%ecx, glks
	movl	%ecx, glks+16
	sall	$12, %eax
	addl	%ecx, %eax
	cmpl	glks+4, %eax
	movl	%eax, glks+20
	ja	.L4808
	cmpl	%eax, %ecx
	ja	.L4808
	movl	%eax, glks
	call	platAddDevices
	call	try_boot_node
	testl	%eax, %eax
	je	.L4808
	cmpl	$1, glks+24
	jbe	.L4807
	movl	$1, %ebx
	.p2align 4,,7
	.p2align 3
.L4841:
	movl	glks+28(,%ebx,4), %esi
	addl	$1, %ebx
	call	ia32_mfence
	movl	%esi, %eax
	sall	$24, %eax
	cmpl	glks+24, %ebx
	movl	%eax, -64752
	movl	$50432, -64768
	movl	%eax, -64752
	movl	$34048, -64768
	movl	%eax, -64752
	movl	$1664, -64768
	jb	.L4841
.L4807:
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
.L4829:
	.cfi_restore_state
	movl	20(%esp), %edx
	movl	%ecx, %edi
	movl	28(%esp), %eax
	addl	24(%esp), %ebx
.L4837:
	movzbl	(%eax), %ecx
	addl	$1, %eax
	movb	%cl, -1(%eax,%edx)
	cmpl	%ebx, %eax
	jne	.L4837
	movl	%edx, 20(%esp)
	movl	%edi, %ecx
	jmp	.L4834
	.cfi_endproc
.LFE314:
	.size	boot_sys, .-boot_sys
	.globl	ksDomScheduleLength
	.section	.rodata
	.align 4
	.type	ksDomScheduleLength, @object
	.size	ksDomScheduleLength, 4
ksDomScheduleLength:
	.long	1
	.globl	ksDomSchedule
	.align 4
	.type	ksDomSchedule, @object
	.size	ksDomSchedule, 8
ksDomSchedule:
	.long	0
	.long	1
	.globl	acpi_str_apic
	.type	acpi_str_apic, @object
	.size	acpi_str_apic, 5
acpi_str_apic:
	.byte	65
	.byte	80
	.byte	73
	.byte	67
	.byte	0
	.globl	acpi_str_rsd
	.type	acpi_str_rsd, @object
	.size	acpi_str_rsd, 9
acpi_str_rsd:
	.byte	82
	.byte	83
	.byte	68
	.byte	32
	.byte	80
	.byte	84
	.byte	82
	.byte	32
	.byte	0
	.comm	current_extra_caps,12,4
	.comm	ksDomScheduleIdx,4,4
	.comm	ksDomainTime,4,4
	.comm	ksCurDomain,4,4
	.comm	intStateIRQNode,4,4
	.comm	intStateIRQTable,128,32
	.comm	ksWorkUnitsCompleted,4,4
	.comm	ksSchedulerAction,4,4
	.comm	ksIdleThread,4,4
	.comm	ksCurThread,4,4
	.comm	ksReadyQueues,2048,32
	.globl	ndks_boot
	.section	.boot.node,"aw",@progbits
	.align 4
	.type	ndks_boot, @object
	.size	ndks_boot, 28
ndks_boot:
	.zero	28
	.comm	current_syscall_error,28,4
	.comm	current_fault,8,4
	.comm	current_lookup_fault,8,4
	.comm	ia32KSCurrentPD,4,4
	.comm	ia32KSnullFpuState,512,16
	.comm	ia32KSidt,2048,32
	.comm	ia32KScacheLineSizeBits,4,4
	.comm	ia32KSkernelPT,4,4
	.comm	ia32KSkernelPD,4,4
	.comm	ia32KSfpuOwner,4,4
	.comm	ia32KSASIDTable,256,32
	.comm	ia32KSgdt,64,32
	.comm	ia32KStss,104,32
	.comm	ia32KScurInterrupt,4,4
	.globl	syscallMessage
	.section	.rodata
	.align 32
	.type	syscallMessage, @object
	.size	syscallMessage, 40
syscallMessage:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	14
	.long	17
	.long	16
	.globl	exceptionMessage
	.align 4
	.type	exceptionMessage, @object
	.size	exceptionMessage, 12
exceptionMessage:
	.long	11
	.long	17
	.long	16
	.globl	gpRegisters
	.align 4
	.type	gpRegisters, @object
	.size	gpRegisters, 12
gpRegisters:
	.long	12
	.long	9
	.long	10
	.globl	frameRegisters
	.align 32
	.type	frameRegisters, @object
	.size	frameRegisters, 40
frameRegisters:
	.long	11
	.long	17
	.long	16
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.globl	msgRegisters
	.align 4
	.type	msgRegisters, @object
	.size	msgRegisters, 8
msgRegisters:
	.long	5
	.long	6
	.comm	gdt_idt_ptr,6,2
	.globl	cmdline_str_disable_iommu
	.type	cmdline_str_disable_iommu, @object
	.size	cmdline_str_disable_iommu, 14
cmdline_str_disable_iommu:
	.byte	100
	.byte	105
	.byte	115
	.byte	97
	.byte	98
	.byte	108
	.byte	101
	.byte	95
	.byte	105
	.byte	111
	.byte	109
	.byte	109
	.byte	117
	.byte	0
	.globl	cmdline_str_num_sh_frames
	.type	cmdline_str_num_sh_frames, @object
	.size	cmdline_str_num_sh_frames, 14
cmdline_str_num_sh_frames:
	.byte	110
	.byte	117
	.byte	109
	.byte	95
	.byte	115
	.byte	104
	.byte	95
	.byte	102
	.byte	114
	.byte	97
	.byte	109
	.byte	101
	.byte	115
	.byte	0
	.globl	cmdline_str_max_num_nodes
	.type	cmdline_str_max_num_nodes, @object
	.size	cmdline_str_max_num_nodes, 14
cmdline_str_max_num_nodes:
	.byte	109
	.byte	97
	.byte	120
	.byte	95
	.byte	110
	.byte	117
	.byte	109
	.byte	95
	.byte	110
	.byte	111
	.byte	100
	.byte	101
	.byte	115
	.byte	0
	.globl	cmdline_val
	.section	.boot.glob,"aw",@progbits
	.align 32
	.type	cmdline_val, @object
	.size	cmdline_val, 1000
cmdline_val:
	.zero	1000
	.globl	kernel_pt_list
	.section	.glob,"aw",@progbits
	.align 4096
	.type	kernel_pt_list, @object
	.size	kernel_pt_list, 163840
kernel_pt_list:
	.zero	163840
	.globl	kernel_pd_list
	.align 4096
	.type	kernel_pd_list, @object
	.size	kernel_pd_list, 163840
kernel_pd_list:
	.zero	163840
	.globl	cmdline_opt
	.section	.boot.glob
	.align 4
	.type	cmdline_opt, @object
	.size	cmdline_opt, 8
cmdline_opt:
	.zero	8
	.globl	kernel_stack_alloc
	.section	.ndks.stack,"aw",@progbits
	.align 4096
	.type	kernel_stack_alloc, @object
	.size	kernel_stack_alloc, 4096
kernel_stack_alloc:
	.zero	4096
	.globl	ndks_list
	.section	.glob
	.align 4096
	.type	ndks_list, @object
	.size	ndks_list, 491520
ndks_list:
	.zero	491520
	.globl	glks
	.section	.boot.glob
	.align 32
	.type	glks, @object
	.size	glks, 2428
glks:
	.zero	2428
	.local	__control_reg_order
	.comm	__control_reg_order,4,4
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
