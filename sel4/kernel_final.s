	.file	"kernel_final.c"
	.text
	.p2align 4,,15
	.type	switchFpuOwner, @function
switchFpuOwner:
.LFB346:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	%eax, %ebx
	subl	$24, %esp
	.cfi_def_cfa_offset 32
#APP
# 45 "./include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
	movl	ia32KSfpuOwner, %eax
	testl	%eax, %eax
	je	.L2
	addl	$80, %eax
	movl	%eax, (%esp)
	call	saveFpuState
.L2:
	testl	%ebx, %ebx
	je	.L3
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
.L3:
	.cfi_restore_state
#APP
# 41 "./include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
#NO_APP
	orl	$8, %eax
#APP
# 47 "./include/arch/ia32/arch/machine/cpu_registers.h" 1
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
.LFE346:
	.size	switchFpuOwner, .-switchFpuOwner
	.section	.boot.text,"ax",@progbits
	.p2align 4,,15
	.type	pci_read_reg32, @function
pci_read_reg32:
.LFB552:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	sall	$8, %ecx
	sall	$11, %edx
	orl	$-2147483648, %ecx
	orl	%edx, %ecx
	sall	$16, %eax
	orl	%eax, %ecx
	andl	$252, %ebx
	orl	%ebx, %ecx
	movl	%ecx, 4(%esp)
	movl	$3320, (%esp)
	call	out32
	movl	$3324, 32(%esp)
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	jmp	in32
	.cfi_endproc
.LFE552:
	.size	pci_read_reg32, .-pci_read_reg32
	.text
	.p2align 4,,15
	.type	lookupPTSlot, @function
lookupPTSlot:
.LFB325:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	%ecx, %ebx
	shrl	$22, %ebx
	movl	(%edx,%ebx,4), %edx
	testb	$-128, %dl
	jne	.L13
	testb	$1, %dl
	je	.L13
	shrl	$10, %ecx
	andl	$-4096, %edx
	andl	$4092, %ecx
	leal	-536870912(%edx,%ecx), %edx
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L13:
	.cfi_restore_state
	movl	$89, current_lookup_fault
	movl	$0, current_lookup_fault+4
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE325:
	.size	lookupPTSlot, .-lookupPTSlot
	.p2align 4,,15
	.type	findPDForASID, @function
findPDForASID:
.LFB331:
	.cfi_startproc
	movl	%edx, %ecx
	shrl	$10, %ecx
	movl	ia32KSASIDTable(,%ecx,4), %ecx
	testl	%ecx, %ecx
	je	.L20
	andl	$1023, %edx
	movl	(%ecx,%edx,4), %edx
	testl	%edx, %edx
	je	.L20
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	ret
	.p2align 4,,7
	.p2align 3
.L20:
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	ret
	.cfi_endproc
.LFE331:
	.size	findPDForASID, .-findPDForASID
	.p2align 4,,15
	.type	parse_opt.constprop.131, @function
parse_opt.constprop.131:
.LFB719:
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
.L25:
	cmpb	$32, %bl
	jg	.L53
	testb	%bl, %bl
	jne	.L30
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
.L53:
	.cfi_restore_state
	movzbl	(%esi), %edx
	testb	%dl, %dl
	.p2align 4,,2
	je	.L27
	cmpb	$61, %bl
	je	.L41
	cmpb	%bl, %dl
	jne	.L41
	movl	%esi, %ebx
	.p2align 4,,4
	jmp	.L33
	.p2align 4,,7
	.p2align 3
.L32:
	movzbl	1(%ecx), %ecx
	cmpb	$61, %cl
	je	.L42
	cmpb	$32, %cl
	jle	.L44
	cmpb	%cl, %dl
	jne	.L44
	movl	%edi, %ecx
.L33:
	addl	$1, %ebx
	movzbl	(%ebx), %edx
	leal	1(%ecx), %edi
	testb	%dl, %dl
	jne	.L32
	movzbl	1(%ecx), %ebx
	movl	%edi, %ecx
.L27:
	cmpb	$61, %bl
	je	.L54
	.p2align 4,,7
	.p2align 3
.L39:
	cmpb	$32, %bl
	jle	.L25
	.p2align 4,,7
	.p2align 3
.L38:
	addl	$1, %ecx
	movzbl	(%ecx), %ebx
	cmpb	$32, %bl
	jg	.L38
	jmp	.L25
	.p2align 4,,7
	.p2align 3
.L30:
	movzbl	1(%ecx), %ebx
	addl	$1, %ecx
	jmp	.L25
	.p2align 4,,7
	.p2align 3
.L44:
	movl	%ecx, %ebx
	movl	%edi, %ecx
	jmp	.L39
	.p2align 4,,7
	.p2align 3
.L42:
	movl	$61, %ebx
	movl	%edi, %ecx
	jmp	.L39
.L54:
	leal	1(%ecx), %edx
	movzbl	1(%ecx), %ecx
	cmpb	$32, %cl
	jle	.L45
	xorl	%eax, %eax
	jmp	.L36
	.p2align 4,,7
	.p2align 3
.L35:
	cmpl	$999, %eax
	je	.L55
.L36:
	addl	$1, %edx
	addl	$1, %eax
	movb	%cl, cmdline_val-1(%eax)
	movzbl	(%edx), %ecx
	cmpb	$32, %cl
	jg	.L35
	leal	cmdline_val(%eax), %ecx
.L34:
	movb	$0, (%ecx)
	movl	%edx, %ecx
	movzbl	(%edx), %ebx
	jmp	.L39
.L55:
	movl	$cmdline_val+999, %ecx
	jmp	.L34
.L41:
	movl	%ecx, %edi
	movl	%edi, %ecx
	jmp	.L39
.L45:
	movl	$cmdline_val, %ecx
	xorl	%eax, %eax
	jmp	.L34
	.cfi_endproc
.LFE719:
	.size	parse_opt.constprop.131, .-parse_opt.constprop.131
	.section	.text.unlikely,"ax",@progbits
	.type	makeUserPDE, @function
makeUserPDE:
.LFB321:
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
	je	.L61
	cmpl	$3, %ebx
	je	.L59
	cmpl	$1, %ebx
	je	.L59
	call	halt
.L59:
	subl	$2, %ebx
	cmpl	$1, %ebx
	ja	.L63
	movl	$1, %esi
	jmp	.L58
.L61:
	xorl	%esi, %esi
.L58:
	movl	$1, %edi
	jmp	.L60
.L63:
	movl	$1, %esi
	xorl	%edi, %edi
.L60:
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
.LFE321:
	.size	makeUserPDE, .-makeUserPDE
	.type	makeUserPTE, @function
makeUserPTE:
.LFB322:
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
	je	.L77
	cmpl	$3, %ebx
	je	.L75
	cmpl	$1, %ebx
	je	.L75
	call	halt
.L75:
	subl	$2, %ebx
	cmpl	$1, %ebx
	ja	.L79
	movl	$1, %esi
	jmp	.L74
.L77:
	xorl	%esi, %esi
.L74:
	movl	$1, %edi
	jmp	.L76
.L79:
	movl	$1, %esi
	xorl	%edi, %edi
.L76:
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
.LFE322:
	.size	makeUserPTE, .-makeUserPTE
	.section	.boot.text
	.p2align 4,,15
	.type	pci_scan_bars, @function
pci_scan_bars:
.LFB556:
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
	movzbl	80(%esp), %edi
	testl	%edi, %edi
	movl	%edi, 40(%esp)
	je	.L88
	movzbl	%al, %eax
	movzbl	%dl, %edx
	movl	%eax, 28(%esp)
	sall	$16, %eax
	movzbl	%cl, %edi
	movl	%eax, 36(%esp)
	movl	%edx, %eax
	xorl	%ebp, %ebp
	orl	$-2147483648, 36(%esp)
	sall	$11, %eax
	orl	%eax, 36(%esp)
	movl	%edi, %eax
	sall	$8, %eax
	orl	%eax, 36(%esp)
	movl	%edi, 20(%esp)
	movl	%edx, 24(%esp)
	.p2align 4,,7
	.p2align 3
.L98:
	movl	20(%esp), %ecx
	leal	0(,%ebp,4), %edi
	movl	24(%esp), %edx
	leal	16(%edi), %ebx
	movl	28(%esp), %eax
	movzbl	%bl, %esi
	andl	$252, %ebx
	movl	%esi, (%esp)
	call	pci_read_reg32
	orl	36(%esp), %ebx
	movl	$3320, (%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, 32(%esp)
	call	out32
	movl	$-1, 4(%esp)
	movl	$3324, (%esp)
	call	out32
	movl	20(%esp), %ecx
	movl	24(%esp), %edx
	movl	28(%esp), %eax
	movl	%esi, (%esp)
	call	pci_read_reg32
	testl	%eax, %eax
	je	.L90
	testb	$1, %al
	jne	.L91
	movl	%eax, %esi
	movl	$4096, %edx
	andl	$-16, %esi
	negl	%esi
	cmpl	$4095, %esi
	cmovbe	%edx, %esi
	testl	$4080, 32(%esp)
	jne	.L91
	xorl	%ecx, %ecx
	.p2align 4,,7
	.p2align 3
.L94:
	addl	$1, %ecx
	btl	%ecx, %esi
	jnc	.L94
	movl	$1, %edx
	sall	%cl, %edx
	cmpl	%esi, %edx
	je	.L104
	.p2align 4,,7
	.p2align 3
.L91:
	movl	%ebx, 4(%esp)
	movl	$3320, (%esp)
	call	out32
	movl	32(%esp), %eax
	movl	$3324, (%esp)
	movl	%eax, 4(%esp)
	call	out32
.L90:
	addl	$1, %ebp
	cmpl	40(%esp), %ebp
	jb	.L98
.L88:
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
	.p2align 4,,7
	.p2align 3
.L104:
	.cfi_restore_state
	movl	32(%esp), %edx
	andl	$-16, %edx
	testb	$4, %al
	movl	%edx, 44(%esp)
	jne	.L105
	movl	glks+188, %eax
	cmpl	$199, %eax
	ja	.L91
	movl	44(%esp), %edi
	leal	glks+176(,%eax,8), %edx
	addl	$1, %eax
	addl	%edi, %esi
	movl	%edi, 16(%edx)
	movl	%esi, 20(%edx)
	movl	%eax, glks+188
	jmp	.L91
.L105:
	leal	20(%edi), %eax
	movl	20(%esp), %ecx
	movzbl	%al, %eax
	movl	24(%esp), %edx
	movl	%eax, (%esp)
	movl	28(%esp), %eax
	call	pci_read_reg32
	testl	%eax, %eax
	jne	.L96
	movl	glks+188, %eax
	cmpl	$199, %eax
	ja	.L96
	movl	44(%esp), %edi
	leal	glks+176(,%eax,8), %edx
	addl	$1, %eax
	addl	%edi, %esi
	movl	%edi, 16(%edx)
	movl	%esi, 20(%edx)
	movl	%eax, glks+188
.L96:
	addl	$1, %ebp
	jmp	.L91
	.cfi_endproc
.LFE556:
	.size	pci_scan_bars, .-pci_scan_bars
	.p2align 4,,15
	.type	pci_scan_fun, @function
pci_scan_fun:
.LFB557:
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
	je	.L111
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
	je	.L108
	jb	.L109
	cmpb	$2, %al
	jne	.L116
	movl	$1, (%esp)
.L115:
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
.L111:
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
.L116:
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
.L108:
	.cfi_restore_state
	movl	$2, (%esp)
	jmp	.L115
	.p2align 4,,7
	.p2align 3
.L109:
	movl	$6, (%esp)
	jmp	.L115
	.cfi_endproc
.LFE557:
	.size	pci_scan_fun, .-pci_scan_fun
	.text
	.p2align 4,,15
	.type	resetMemMapping, @function
resetMemMapping:
.LFB364:
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
	je	.L121
	cmpl	$5, %ebx
	je	.L122
	cmpl	$1, %ebx
	je	.L127
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
.L127:
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
.L122:
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
.L121:
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
.LFE364:
	.size	resetMemMapping, .-resetMemMapping
	.p2align 4,,15
	.globl	restore_user_context
	.type	restore_user_context, @function
restore_user_context:
.LFB258:
	.cfi_startproc
	movl	ksCurThread, %eax
	leal	76(%eax), %edx
	movl	%edx, ia32KStss+4
	movl	ia32KSfpuOwner, %edx
	cmpl	%edx, %eax
	je	.L136
	testl	%edx, %edx
	jne	.L137
.L130:
	cmpl	$-1, 52(%eax)
	jne	.L131
	andl	$-513, 64(%eax)
#APP
# 37 "src/arch/ia32/c_traps.c" 1
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
.L133:
.L134:
	jmp	.L134
.L131:
#APP
# 89 "src/arch/ia32/c_traps.c" 1
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
	jmp	.L133
.L137:
#APP
# 41 "./include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %edx
# 0 "" 2
#NO_APP
	orl	$8, %edx
#APP
# 47 "./include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %edx, %cr0
# 0 "" 2
#NO_APP
	jmp	.L130
.L136:
#APP
# 45 "./include/arch/ia32/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
	.p2align 4,,8
	jmp	.L130
	.cfi_endproc
.LFE258:
	.size	restore_user_context, .-restore_user_context
	.section	.boot.text
	.p2align 4,,15
	.globl	apic_get_base_paddr
	.type	apic_get_base_paddr, @function
apic_get_base_paddr:
.LFB267:
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
.LFE267:
	.size	apic_get_base_paddr, .-apic_get_base_paddr
	.p2align 4,,15
	.globl	apic_init
	.type	apic_init, @function
apic_init:
.LFB268:
	.cfi_startproc
	movl	-65488, %ecx
	xorl	%eax, %eax
	movzbl	%cl, %edx
	shrl	$4, %edx
	cmpl	$1, %edx
	je	.L144
.L141:
	rep ret
	.p2align 4,,7
	.p2align 3
.L144:
	andl	$16711680, %ecx
	shrl	$16, %ecx
	addl	$1, %ecx
	cmpl	$2, %ecx
	jbe	.L141
	movl	$11, -64544
	movl	4(%esp), %eax
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
.LFE268:
	.size	apic_init, .-apic_init
	.text
	.p2align 4,,15
	.globl	apic_is_interrupt_pending
	.type	apic_is_interrupt_pending, @function
apic_is_interrupt_pending:
.LFB269:
	.cfi_startproc
	movl	-65008, %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE269:
	.size	apic_is_interrupt_pending, .-apic_is_interrupt_pending
	.p2align 4,,15
	.globl	apic_ack_active_interrupt
	.type	apic_ack_active_interrupt, @function
apic_ack_active_interrupt:
.LFB270:
	.cfi_startproc
	movl	$0, -65360
	ret
	.cfi_endproc
.LFE270:
	.size	apic_ack_active_interrupt, .-apic_ack_active_interrupt
	.section	.boot.text
	.p2align 4,,15
	.globl	apic_send_init_ipi
	.type	apic_send_init_ipi, @function
apic_send_init_ipi:
.LFB271:
	.cfi_startproc
	movl	4(%esp), %eax
	sall	$24, %eax
	movl	%eax, -64752
	movl	$50432, -64768
	movl	%eax, -64752
	movl	$34048, -64768
	ret
	.cfi_endproc
.LFE271:
	.size	apic_send_init_ipi, .-apic_send_init_ipi
	.p2align 4,,15
	.globl	apic_send_startup_ipi
	.type	apic_send_startup_ipi, @function
apic_send_startup_ipi:
.LFB272:
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
.LFE272:
	.size	apic_send_startup_ipi, .-apic_send_startup_ipi
	.p2align 4,,15
	.globl	create_unmapped_it_frame_cap
	.type	create_unmapped_it_frame_cap, @function
create_unmapped_it_frame_cap:
.LFB276:
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
.LFE276:
	.size	create_unmapped_it_frame_cap, .-create_unmapped_it_frame_cap
	.p2align 4,,15
	.globl	insert_dev_p_reg
	.type	insert_dev_p_reg, @function
insert_dev_p_reg:
.LFB284:
	.cfi_startproc
	movl	glks+188, %ecx
	cmpl	$199, %ecx
	ja	.L150
	movl	4(%esp), %eax
	movl	8(%esp), %edx
	movl	%eax, glks+192(,%ecx,8)
	movl	%edx, glks+196(,%ecx,8)
	addl	$1, %ecx
	movl	%ecx, glks+188
.L150:
	rep ret
	.cfi_endproc
.LFE284:
	.size	insert_dev_p_reg, .-insert_dev_p_reg
	.p2align 4,,15
	.globl	cur_cpu_id
	.type	cur_cpu_id, @function
cur_cpu_id:
.LFB285:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	get_current_esp
	addl	$536870912, %eax
	cmpl	$_boot_stack_top, %eax
	ja	.L153
	cmpl	$_boot_stack_bottom, %eax
	ja	.L156
.L153:
	shrl	$11, %eax
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L156:
	.cfi_restore_state
	movl	glks+28, %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE285:
	.size	cur_cpu_id, .-cur_cpu_id
	.p2align 4,,15
	.globl	node_of_cpu
	.type	node_of_cpu, @function
node_of_cpu:
.LFB286:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	glks+24, %edx
	movl	16(%esp), %ecx
	testl	%edx, %edx
	je	.L158
	xorl	%eax, %eax
	cmpl	%ecx, glks+28
	je	.L170
	.p2align 4,,7
	.p2align 3
.L161:
	addl	$1, %eax
	cmpl	%edx, %eax
	je	.L158
	cmpl	%ecx, glks+28(,%eax,4)
	jne	.L161
.L165:
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.L170:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L165
.L158:
	.p2align 4,,7
	call	halt
	.cfi_endproc
.LFE286:
	.size	node_of_cpu, .-node_of_cpu
	.p2align 4,,15
	.globl	elf32_checkFile
	.type	elf32_checkFile, @function
elf32_checkFile:
.LFB298:
	.cfi_startproc
	movl	4(%esp), %edx
	xorl	%eax, %eax
	cmpl	$1179403647, (%edx)
	je	.L174
	rep ret
	.p2align 4,,7
	.p2align 3
.L174:
	xorl	%eax, %eax
	cmpb	$1, 4(%edx)
	sete	%al
	ret
	.cfi_endproc
.LFE298:
	.size	elf32_checkFile, .-elf32_checkFile
	.p2align 4,,15
	.globl	elf32_getMemoryBounds
	.type	elf32_getMemoryBounds, @function
elf32_getMemoryBounds:
.LFB299:
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
	je	.L179
	sall	$5, %ecx
	movl	$-1, %edi
	leal	20(%ebx), %edx
	xorl	%esi, %esi
	leal	20(%ebx,%ecx), %ebp
	.p2align 4,,7
	.p2align 3
.L178:
	movl	(%edx), %ecx
	testl	%ecx, %ecx
	je	.L177
	movl	-12(%edx), %ebx
	addl	%ebx, %ecx
	cmpl	%ebx, %edi
	cmova	%ebx, %edi
	cmpl	%ecx, %esi
	cmovb	%ecx, %esi
.L177:
	addl	$32, %edx
	cmpl	%ebp, %edx
	jne	.L178
.L176:
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
.L179:
	.cfi_restore_state
	movl	$-1, %edi
	xorl	%esi, %esi
	jmp	.L176
	.cfi_endproc
.LFE299:
	.size	elf32_getMemoryBounds, .-elf32_getMemoryBounds
	.p2align 4,,15
	.globl	Arch_configureIdleThread
	.type	Arch_configureIdleThread, @function
Arch_configureIdleThread:
.LFB302:
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
.LFE302:
	.size	Arch_configureIdleThread, .-Arch_configureIdleThread
	.text
	.p2align 4,,15
	.globl	Arch_switchToIdleThread
	.type	Arch_switchToIdleThread, @function
Arch_switchToIdleThread:
.LFB303:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE303:
	.size	Arch_switchToIdleThread, .-Arch_switchToIdleThread
	.p2align 4,,15
	.globl	Arch_activateIdleThread
	.type	Arch_activateIdleThread, @function
Arch_activateIdleThread:
.LFB304:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE304:
	.size	Arch_activateIdleThread, .-Arch_activateIdleThread
	.section	.phys.text,"ax",@progbits
	.p2align 4,,15
	.globl	init_boot_pd
	.type	init_boot_pd, @function
init_boot_pd:
.LFB306:
	.cfi_startproc
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L189:
	movl	%eax, %edx
	sall	$22, %edx
	orl	$387, %edx
	movl	%edx, _boot_pd(,%eax,4)
	addl	$1, %eax
	cmpl	$896, %eax
	jne	.L189
	xorw	%ax, %ax
	.p2align 4,,7
	.p2align 3
.L191:
	movl	%eax, %edx
	sall	$22, %edx
	orl	$387, %edx
	movl	%edx, _boot_pd+3584(,%eax,4)
	addl	$1, %eax
	cmpl	$128, %eax
	jne	.L191
	rep ret
	.cfi_endproc
.LFE306:
	.size	init_boot_pd, .-init_boot_pd
	.section	.boot.text
	.p2align 4,,15
	.globl	map_kernel_window
	.type	map_kernel_window, @function
map_kernel_window:
.LFB311:
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
.L194:
	movl	%eax, %edx
	addl	$4194304, %eax
	andl	$-4194304, %edx
	addl	$4, %ecx
	orl	$387, %edx
	movl	%edx, -4(%ecx)
	cmpl	$532676608, %eax
	jne	.L194
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
	je	.L214
	.p2align 4,,7
	.p2align 3
.L198:
	movl	%ebx, %edx
	addl	$4, %eax
	andl	$-4096, %edx
	addl	$4096, %ebx
	orl	$259, %edx
	movl	%edx, -4(%eax)
	cmpl	%ecx, %eax
	jne	.L198
	leal	1(%ebp), %ebx
	cmpl	$1007, %ebx
	ja	.L200
	.p2align 4,,7
	.p2align 3
.L196:
	movl	$0, (%esi,%ebx,4)
	addl	$1, %ebx
	cmpl	$1007, %ebx
	jbe	.L196
.L200:
	movl	$27, (%esp)
	call	ia32_rdmsr_low
	movl	%eax, %edx
	xorl	%eax, %eax
	andl	$-4096, %edx
	je	.L201
	orl	$283, %edx
	movl	%edx, (%esi,%ebx,4)
	addl	$1, %ebx
	cmpl	$1023, %ebx
	ja	.L203
	.p2align 4,,7
	.p2align 3
.L208:
	movl	$0, (%esi,%ebx,4)
	addl	$1, %ebx
	cmpl	$1024, %ebx
	jne	.L208
.L203:
	call	invalidatePageStructureCache
	movl	$1, %eax
.L201:
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
.L214:
	.cfi_restore_state
	movl	$1, %ebx
	jmp	.L196
	.cfi_endproc
.LFE311:
	.size	map_kernel_window, .-map_kernel_window
	.p2align 4,,15
	.globl	map_temp_boot_page
	.type	map_temp_boot_page, @function
map_temp_boot_page:
.LFB312:
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
	je	.L217
	.p2align 4,,7
	.p2align 3
.L219:
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
	jne	.L219
.L217:
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
.LFE312:
	.size	map_temp_boot_page, .-map_temp_boot_page
	.p2align 4,,15
	.globl	init_dtrs
	.type	init_dtrs, @function
init_dtrs:
.LFB314:
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
.LFE314:
	.size	init_dtrs, .-init_dtrs
	.p2align 4,,15
	.globl	map_it_pt_cap
	.type	map_it_pt_cap, @function
map_it_pt_cap:
.LFB315:
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
	ja	.L228
	jmp	*.L230(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L230:
	.long	.L242
	.long	.L237
	.long	.L236
	.long	.L237
	.long	.L236
	.long	.L237
	.long	.L236
	.long	.L242
	.long	.L242
	.long	.L237
	.long	.L238
	.long	.L242
	.long	.L239
	.long	.L228
	.long	.L242
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L242
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L240
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L228
	.long	.L242
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L237:
	andl	$16777200, %ecx
	sall	$8, %ecx
.L229:
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
.L236:
	.cfi_restore_state
	andl	$-16, %ecx
	jmp	.L229
	.p2align 4,,7
	.p2align 3
.L242:
	xorl	%ecx, %ecx
	jmp	.L229
	.p2align 4,,7
	.p2align 3
.L240:
	andl	$16128, %ecx
	shrl	$8, %ecx
	cmpl	$32, %ecx
	je	.L243
	addl	$1, %ecx
	movl	$-1, %eax
	sall	%cl, %eax
.L241:
	andl	%edi, %eax
	movl	%eax, %ecx
	jmp	.L229
	.p2align 4,,7
	.p2align 3
.L239:
	andl	$-1024, %ecx
	jmp	.L229
	.p2align 4,,7
	.p2align 3
.L238:
	andl	$2147483632, %ecx
	addl	%ecx, %ecx
	jmp	.L229
	.p2align 4,,7
	.p2align 3
.L228:
	call	halt
	.p2align 4,,7
	.p2align 3
.L243:
	movl	$-16, %eax
	jmp	.L241
	.cfi_endproc
.LFE315:
	.size	map_it_pt_cap, .-map_it_pt_cap
	.p2align 4,,15
	.globl	map_it_frame_cap
	.type	map_it_frame_cap, @function
map_it_frame_cap:
.LFB316:
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
	ja	.L248
	jmp	*.L250(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L250:
	.long	.L262
	.long	.L257
	.long	.L256
	.long	.L257
	.long	.L256
	.long	.L257
	.long	.L256
	.long	.L262
	.long	.L262
	.long	.L257
	.long	.L258
	.long	.L262
	.long	.L259
	.long	.L248
	.long	.L262
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L262
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L260
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L248
	.long	.L262
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L257:
	andl	$16777200, %ecx
	sall	$8, %ecx
.L249:
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
.L256:
	.cfi_restore_state
	andl	$-16, %ecx
	jmp	.L249
	.p2align 4,,7
	.p2align 3
.L262:
	xorl	%ecx, %ecx
	jmp	.L249
	.p2align 4,,7
	.p2align 3
.L260:
	andl	$16128, %ecx
	shrl	$8, %ecx
	cmpl	$32, %ecx
	je	.L263
	addl	$1, %ecx
	movl	$-1, %eax
	sall	%cl, %eax
.L261:
	andl	%edi, %eax
	movl	%eax, %ecx
	jmp	.L249
	.p2align 4,,7
	.p2align 3
.L259:
	andl	$-1024, %ecx
	jmp	.L249
	.p2align 4,,7
	.p2align 3
.L258:
	andl	$2147483632, %ecx
	addl	%ecx, %ecx
	jmp	.L249
	.p2align 4,,7
	.p2align 3
.L248:
	call	halt
	.p2align 4,,7
	.p2align 3
.L263:
	movl	$-16, %eax
	jmp	.L261
	.cfi_endproc
.LFE316:
	.size	map_it_frame_cap, .-map_it_frame_cap
	.p2align 4,,15
	.globl	create_mapped_it_frame_cap
	.type	create_mapped_it_frame_cap, @function
create_mapped_it_frame_cap:
.LFB277:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	xorl	%ecx, %ecx
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	52(%esp), %esi
	movl	44(%esp), %eax
	movl	48(%esp), %edx
	movl	32(%esp), %edi
	movl	%esi, %ebx
	andl	$1023, %ebx
	sall	$20, %ebx
	cmpl	$0, 56(%esp)
	setne	%cl
	andl	$-4096, %eax
	shrl	$10, %esi
	sall	$31, %ecx
	sall	$26, %esi
	orl	%ecx, %ebx
	shrl	$12, %edx
	orl	$50331649, %esi
	shrl	$8, %eax
	orl	%edx, %ebx
	movl	40(%esp), %edx
	orl	%eax, %esi
	movl	36(%esp), %eax
	movl	%esi, 8(%esp)
	movl	%ebx, 12(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	map_it_frame_cap
	movl	%edi, %eax
	movl	%esi, (%edi)
	movl	%ebx, 4(%edi)
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
	ret	$4
	.cfi_endproc
.LFE277:
	.size	create_mapped_it_frame_cap, .-create_mapped_it_frame_cap
	.p2align 4,,15
	.globl	write_it_asid_pool
	.type	write_it_asid_pool, @function
write_it_asid_pool:
.LFB317:
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
	ja	.L286
	jmp	*.L272(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L272:
	.long	.L300
	.long	.L279
	.long	.L278
	.long	.L279
	.long	.L278
	.long	.L279
	.long	.L278
	.long	.L300
	.long	.L300
	.long	.L279
	.long	.L280
	.long	.L300
	.long	.L281
	.long	.L286
	.long	.L300
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L300
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L282
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L300
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L279:
	movl	%ecx, %ebx
	andl	$16777200, %ebx
	sall	$8, %ebx
.L271:
	movl	%edx, %edi
	movl	%edx, %eax
	andl	$14, %edi
	andl	$15, %eax
	movzbl	%dl, %ecx
	cmpl	$14, %edi
	cmove	%ecx, %eax
	cmpl	$62, %eax
	ja	.L286
	jmp	*.L288(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L288:
	.long	.L302
	.long	.L295
	.long	.L294
	.long	.L295
	.long	.L294
	.long	.L295
	.long	.L294
	.long	.L302
	.long	.L302
	.long	.L295
	.long	.L296
	.long	.L302
	.long	.L297
	.long	.L286
	.long	.L302
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L302
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L298
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L286
	.long	.L302
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L295:
	andl	$16777200, %edx
	sall	$8, %edx
.L287:
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
.L278:
	.cfi_restore_state
	movl	%ecx, %ebx
	andl	$-16, %ebx
	jmp	.L271
	.p2align 4,,7
	.p2align 3
.L294:
	andl	$-16, %edx
	jmp	.L287
	.p2align 4,,7
	.p2align 3
.L300:
	xorl	%ebx, %ebx
	jmp	.L271
	.p2align 4,,7
	.p2align 3
.L282:
	andl	$16128, %ecx
	shrl	$8, %ecx
	cmpl	$32, %ecx
	je	.L301
	addl	$1, %ecx
	movl	$-1, %eax
	sall	%cl, %eax
	andl	%eax, %ebx
	jmp	.L271
	.p2align 4,,7
	.p2align 3
.L281:
	movl	%ecx, %ebx
	andl	$-1024, %ebx
	jmp	.L271
	.p2align 4,,7
	.p2align 3
.L280:
	andl	$2147483632, %ecx
	leal	(%ecx,%ecx), %ebx
	jmp	.L271
	.p2align 4,,7
	.p2align 3
.L302:
	xorl	%edx, %edx
	jmp	.L287
	.p2align 4,,7
	.p2align 3
.L296:
	andl	$2147483632, %edx
	addl	%edx, %edx
	jmp	.L287
	.p2align 4,,7
	.p2align 3
.L297:
	andl	$-1024, %edx
	jmp	.L287
	.p2align 4,,7
	.p2align 3
.L298:
	andl	$16128, %edx
	shrl	$8, %edx
	cmpl	$32, %edx
	je	.L303
	leal	1(%edx), %ecx
	movl	$-1, %edx
	sall	%cl, %edx
	andl	%esi, %edx
	jmp	.L287
	.p2align 4,,7
	.p2align 3
.L286:
	call	halt
	.p2align 4,,7
	.p2align 3
.L301:
	movl	$-16, %eax
	andl	%eax, %ebx
	jmp	.L271
	.p2align 4,,7
	.p2align 3
.L303:
	movl	$-16, %edx
	andl	%esi, %edx
	jmp	.L287
	.cfi_endproc
.LFE317:
	.size	write_it_asid_pool, .-write_it_asid_pool
	.p2align 4,,15
	.globl	init_pat_msr
	.type	init_pat_msr, @function
init_pat_msr:
.LFB318:
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
	je	.L306
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
.L306:
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	movl	%edx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE318:
	.size	init_pat_msr, .-init_pat_msr
	.text
	.p2align 4,,15
	.globl	lookupIPCBuffer
	.type	lookupIPCBuffer, @function
lookupIPCBuffer:
.LFB323:
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
	jne	.L319
	movl	%edx, %eax
	andl	$50331648, %eax
	shrl	$24, %eax
	cmpl	$3, %eax
	je	.L314
	cmpl	$2, %eax
	jne	.L319
	movl	16(%esp), %eax
	testl	%eax, %eax
	jne	.L319
.L314:
	movl	%edi, %eax
	shrl	$31, %eax
	testl	%eax, %eax
	je	.L316
	cmpl	$1, %eax
	je	.L320
	call	halt
	.p2align 4,,7
	.p2align 3
.L316:
	movl	$4095, %eax
.L317:
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
.L319:
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
.L320:
	.cfi_restore_state
	movl	$4194303, %eax
	jmp	.L317
	.cfi_endproc
.LFE323:
	.size	lookupIPCBuffer, .-lookupIPCBuffer
	.p2align 4,,15
	.globl	handleFaultReply
	.type	handleFaultReply, @function
handleFaultReply:
.LFB255:
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
	jbe	.L332
	andl	$-128, %eax
	movl	$120, %esi
	orl	$120, %eax
.L332:
	shrl	$12, %eax
	movl	%eax, 12(%esp)
	movl	604(%edi), %eax
	andl	$7, %eax
	cmpl	$3, %eax
	je	.L334
	ja	.L335
	cmpl	$1, %eax
	jb	.L333
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
.L335:
	.cfi_restore_state
	cmpl	$4, %eax
	jne	.L333
	movl	%ebx, 4(%esp)
	movl	$0, (%esp)
	call	lookupIPCBuffer
	xorl	%edx, %edx
	testl	%esi, %esi
	je	.L345
	movl	20(%ebx), %edx
	cmpl	$1, %esi
	movl	%edx, 44(%edi)
	movl	$1, %edx
	jbe	.L345
	movl	24(%ebx), %edx
	movl	%edx, 68(%edi)
	movl	$2, %edx
.L345:
	testl	%eax, %eax
	je	.L348
.L347:
	cmpl	%esi, %edx
	jae	.L348
	movl	exceptionMessage(,%edx,4), %ebx
	addl	$1, %edx
	movl	(%eax,%edx,4), %ecx
	cmpl	$16, %ebx
	je	.L376
	leal	-9(%ebx), %ebp
	cmpl	$1, %ebp
	ja	.L350
	movl	%ecx, %ebp
	andl	$-9, %ebp
	cmpl	$51, %ebp
	movl	$0, %ebp
	cmovne	%ebp, %ecx
.L350:
	cmpl	$2, %edx
	movl	%ecx, (%edi,%ebx,4)
	jbe	.L347
.L348:
	movl	12(%esp), %edx
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
.L334:
	.cfi_restore_state
	movl	%ebx, 4(%esp)
	movl	$0, (%esp)
	call	lookupIPCBuffer
	xorl	%edx, %edx
	testl	%esi, %esi
	je	.L338
	movl	20(%ebx), %edx
	cmpl	$1, %esi
	movl	%edx, (%edi)
	movl	$1, %edx
	jbe	.L338
	movl	24(%ebx), %edx
	movl	%edx, 4(%edi)
	movl	$2, %edx
.L338:
	testl	%eax, %eax
	jne	.L340
	jmp	.L341
	.p2align 4,,7
	.p2align 3
.L342:
	leal	-9(%ebx), %ebp
	cmpl	$1, %ebp
	ja	.L343
	movl	%ecx, %ebp
	andl	$-9, %ebp
	cmpl	$51, %ebp
	movl	$0, %ebp
	cmovne	%ebp, %ecx
.L343:
	cmpl	$9, %edx
	movl	%ecx, (%edi,%ebx,4)
	ja	.L341
.L340:
	cmpl	%esi, %edx
	jae	.L341
	movl	syscallMessage(,%edx,4), %ebx
	addl	$1, %edx
	movl	(%eax,%edx,4), %ecx
	cmpl	$16, %ebx
	jne	.L342
	andl	$4055, %ecx
	orl	$514, %ecx
	cmpl	$9, %edx
	movl	%ecx, (%edi,%ebx,4)
	jbe	.L340
	.p2align 4,,7
	.p2align 3
.L341:
	movl	56(%edi), %eax
	movl	12(%esp), %ecx
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
.L333:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L376:
	andl	$4055, %ecx
	orl	$514, %ecx
	cmpl	$2, %edx
	movl	%ecx, (%edi,%ebx,4)
	jbe	.L347
	jmp	.L348
	.cfi_endproc
.LFE255:
	.size	handleFaultReply, .-handleFaultReply
	.p2align 4,,15
	.globl	handleVMFault
	.type	handleVMFault, @function
handleVMFault:
.LFB326:
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
	je	.L379
	cmpl	$1, %ebx
	jne	.L384
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
.L384:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L379:
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
.LFE326:
	.size	handleVMFault, .-handleVMFault
	.p2align 4,,15
	.globl	isValidVTableRoot
	.type	isValidVTableRoot, @function
isValidVTableRoot:
.LFB327:
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
	je	.L391
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L391:
	.cfi_restore_state
	xorl	%eax, %eax
	andl	$65536, %ebx
	setne	%al
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE327:
	.size	isValidVTableRoot, .-isValidVTableRoot
	.p2align 4,,15
	.globl	checkValidIPCBuffer
	.type	checkValidIPCBuffer, @function
checkValidIPCBuffer:
.LFB328:
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
	je	.L395
	movl	$3, current_syscall_error+24
	movl	$3, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L395:
	xorl	%eax, %eax
	testl	$511, 4(%esp)
	je	.L396
	movl	$5, current_syscall_error+24
	movb	$3, %al
.L396:
	rep ret
	.cfi_endproc
.LFE328:
	.size	checkValidIPCBuffer, .-checkValidIPCBuffer
	.p2align 4,,15
	.globl	maskVMRights
	.type	maskVMRights, @function
maskVMRights:
.LFB329:
	.cfi_startproc
	movl	4(%esp), %edx
	cmpl	$2, %edx
	je	.L408
	cmpl	$3, %edx
	movl	$1, %eax
	je	.L409
.L402:
	rep ret
	.p2align 4,,7
	.p2align 3
.L409:
	testb	$2, 8(%esp)
	je	.L402
	movl	8(%esp), %eax
	andl	$1, %eax
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$3, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L408:
	movl	8(%esp), %eax
	andl	$2, %eax
	shrl	%eax
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$2, %eax
	ret
	.cfi_endproc
.LFE329:
	.size	maskVMRights, .-maskVMRights
	.p2align 4,,15
	.globl	setVMRoot
	.type	setVMRoot, @function
setVMRoot:
.LFB332:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$12, %esp
	.cfi_def_cfa_offset 24
	movl	24(%esp), %eax
	andl	$-1024, %eax
	movl	16(%eax), %ebx
	movl	20(%eax), %esi
	movl	%ebx, %edx
	movl	%ebx, %eax
	andl	$14, %edx
	andl	$15, %eax
	movzbl	%bl, %ecx
	cmpl	$14, %edx
	cmove	%ecx, %eax
	cmpl	$5, %eax
	je	.L421
.L416:
	movl	ia32KSkernelPD, %eax
	addl	$536870912, %eax
	movl	%eax, ia32KSCurrentPD
#APP
# 35 "./include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr3
# 0 "" 2
#NO_APP
.L410:
	addl	$12, %esp
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
.L421:
	.cfi_restore_state
	testl	$65536, %esi
	je	.L416
	movzwl	%si, %edx
	movl	%esp, %eax
	call	findPDForASID
	movl	(%esp), %edx
	movl	4(%esp), %eax
	testl	%edx, %edx
	jne	.L416
	andl	$16777200, %ebx
	sall	$8, %ebx
	cmpl	%eax, %ebx
	jne	.L416
	addl	$536870912, %ebx
	cmpl	%ebx, ia32KSCurrentPD
	je	.L410
	movl	%ebx, ia32KSCurrentPD
#APP
# 35 "./include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %ebx, %cr3
# 0 "" 2
#NO_APP
	jmp	.L410
	.cfi_endproc
.LFE332:
	.size	setVMRoot, .-setVMRoot
	.p2align 4,,15
	.globl	Arch_switchToThread
	.type	Arch_switchToThread, @function
Arch_switchToThread:
.LFB301:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %ebx
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
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE301:
	.size	Arch_switchToThread, .-Arch_switchToThread
	.p2align 4,,15
	.globl	deleteASIDPool
	.type	deleteASIDPool, @function
deleteASIDPool:
.LFB333:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	8(%esp), %edx
	shrl	$10, %eax
	cmpl	%edx, ia32KSASIDTable(,%eax,4)
	je	.L426
	rep ret
	.p2align 4,,7
	.p2align 3
.L426:
	movl	$0, ia32KSASIDTable(,%eax,4)
	movl	ksCurThread, %eax
	movl	%eax, 4(%esp)
	jmp	setVMRoot
	.cfi_endproc
.LFE333:
	.size	deleteASIDPool, .-deleteASIDPool
	.p2align 4,,15
	.globl	deleteASID
	.type	deleteASID, @function
deleteASID:
.LFB334:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	8(%esp), %ecx
	movl	%edx, %eax
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
	testl	%eax, %eax
	je	.L427
	andl	$1023, %edx
	leal	(%eax,%edx,4), %eax
	cmpl	%ecx, (%eax)
	je	.L432
.L427:
	rep ret
	.p2align 4,,7
	.p2align 3
.L432:
	movl	$0, (%eax)
	movl	ksCurThread, %eax
	movl	%eax, 4(%esp)
	jmp	setVMRoot
	.cfi_endproc
.LFE334:
	.size	deleteASID, .-deleteASID
	.p2align 4,,15
	.globl	unmapPageTable
	.type	unmapPageTable, @function
unmapPageTable:
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
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	64(%esp), %edx
	leal	24(%esp), %eax
	movl	68(%esp), %esi
	movl	72(%esp), %ebx
	call	findPDForASID
	movl	24(%esp), %edx
	movl	28(%esp), %eax
	testl	%edx, %edx
	je	.L451
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
.L451:
	.cfi_restore_state
	movl	ksCurThread, %ecx
	movl	%esi, %edx
	shrl	$22, %edx
	leal	(%eax,%edx,4), %ebp
	andl	$-1024, %ecx
	movl	16(%ecx), %edx
	movl	20(%ecx), %ecx
	movzbl	%dl, %edi
	movl	%ecx, 20(%esp)
	movl	%edx, %ecx
	andl	$14, %ecx
	movl	%ecx, 16(%esp)
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$14, 16(%esp)
	cmove	%edi, %ecx
	cmpl	$5, %ecx
	je	.L437
.L438:
	movl	$0, 0(%ebp)
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
	jmp	invalidatePageStructureCache
	.p2align 4,,7
	.p2align 3
.L437:
	.cfi_restore_state
	testl	$65536, 20(%esp)
	je	.L438
	andl	$16777200, %edx
	sall	$8, %edx
	cmpl	%edx, %eax
	jne	.L438
	xorl	%edi, %edi
	jmp	.L440
	.p2align 4,,7
	.p2align 3
.L439:
	addl	$1, %edi
	cmpl	$1024, %edi
	je	.L438
.L440:
	testb	$1, (%ebx,%edi,4)
	je	.L439
	movl	%edi, %eax
	sall	$12, %eax
	addl	%esi, %eax
	movl	%eax, (%esp)
	call	invalidateTLBentry
	jmp	.L439
	.cfi_endproc
.LFE335:
	.size	unmapPageTable, .-unmapPageTable
	.p2align 4,,15
	.globl	unmapPage
	.type	unmapPage, @function
unmapPage:
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
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	68(%esp), %edx
	leal	24(%esp), %eax
	movl	64(%esp), %esi
	movl	72(%esp), %edi
	movl	76(%esp), %ebp
	call	findPDForASID
	movl	24(%esp), %ecx
	movl	28(%esp), %edx
	testl	%ecx, %ecx
	jne	.L452
	movl	ksCurThread, %ecx
	andl	$-1024, %ecx
	movl	16(%ecx), %eax
	movl	20(%ecx), %ecx
	movl	%eax, %ebx
	andl	$14, %ebx
	movl	%ebx, 8(%esp)
	movl	%eax, %ebx
	andl	$15, %ebx
	cmpl	$14, 8(%esp)
	movl	%ecx, 12(%esp)
	movzbl	%al, %ecx
	cmove	%ecx, %ebx
	cmpl	$5, %ebx
	je	.L472
.L456:
	testl	%esi, %esi
	je	.L458
	cmpl	$1, %esi
	jne	.L473
	shrl	$22, %edi
	leal	(%edx,%edi,4), %edx
	movl	(%edx), %eax
	testb	$-128, %al
	jne	.L474
	.p2align 4,,7
	.p2align 3
.L452:
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
.L473:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L458:
	leal	16(%esp), %eax
	movl	%edi, %ecx
	call	lookupPTSlot
	movl	16(%esp), %edx
	movl	20(%esp), %eax
	testl	%edx, %edx
	jne	.L452
	movl	(%eax), %edx
	testb	$1, %dl
	je	.L452
	andl	$-4096, %edx
	leal	536870912(%ebp), %ecx
	cmpl	%ecx, %edx
	jne	.L452
	movl	$0, (%eax)
	jmp	.L460
	.p2align 4,,7
	.p2align 3
.L472:
	testl	$65536, 12(%esp)
	je	.L456
	andl	$16777200, %eax
	sall	$8, %eax
	cmpl	%eax, %edx
	jne	.L456
	movl	%edi, (%esp)
	movl	%edx, 8(%esp)
	call	invalidateTLBentry
	movl	8(%esp), %edx
	jmp	.L456
	.p2align 4,,7
	.p2align 3
.L474:
	testb	$1, %al
	je	.L452
	andl	$-4194304, %eax
	leal	536870912(%ebp), %ecx
	cmpl	%ecx, %eax
	jne	.L452
	movl	$128, (%edx)
.L460:
	addl	$44, %esp
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
	.cfi_endproc
.LFE336:
	.size	unmapPage, .-unmapPage
	.p2align 4,,15
	.globl	copyGlobalMappings
	.type	copyGlobalMappings, @function
copyGlobalMappings:
.LFB337:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	ia32KSkernelPD, %ecx
	movl	$896, %eax
	movl	8(%esp), %ebx
	.p2align 4,,7
	.p2align 3
.L477:
	movl	(%ecx,%eax,4), %edx
	movl	%edx, (%ebx,%eax,4)
	addl	$1, %eax
	cmpl	$1024, %eax
	jne	.L477
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE337:
	.size	copyGlobalMappings, .-copyGlobalMappings
	.p2align 4,,15
	.globl	Arch_initFpuContext
	.type	Arch_initFpuContext, @function
Arch_initFpuContext:
.LFB345:
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
.LFE345:
	.size	Arch_initFpuContext, .-Arch_initFpuContext
	.p2align 4,,15
	.globl	handleUnimplementedDevice
	.type	handleUnimplementedDevice, @function
handleUnimplementedDevice:
.LFB347:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	ksCurThread, %eax
	call	switchFpuOwner
	xorl	%eax, %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE347:
	.size	handleUnimplementedDevice, .-handleUnimplementedDevice
	.p2align 4,,15
	.globl	Arch_fpuThreadDelete
	.type	Arch_fpuThreadDelete, @function
Arch_fpuThreadDelete:
.LFB348:
	.cfi_startproc
	movl	4(%esp), %eax
	cmpl	%eax, ia32KSfpuOwner
	je	.L485
	rep ret
	.p2align 4,,7
	.p2align 3
.L485:
	xorl	%eax, %eax
	jmp	switchFpuOwner
	.cfi_endproc
.LFE348:
	.size	Arch_fpuThreadDelete, .-Arch_fpuThreadDelete
	.section	.boot.text
	.p2align 4,,15
	.globl	Arch_initFpu
	.type	Arch_initFpu, @function
Arch_initFpu:
.LFB349:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	call	read_cr4
	orb	$2, %ah
	movl	%eax, (%esp)
	call	write_cr4
#APP
# 41 "./include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
#NO_APP
	andl	$-47, %eax
	orl	$42, %eax
#APP
# 47 "./include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
#NO_APP
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE349:
	.size	Arch_initFpu, .-Arch_initFpu
	.p2align 4,,15
	.globl	init_sysenter_msrs
	.type	init_sysenter_msrs, @function
init_sysenter_msrs:
.LFB350:
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
.LFE350:
	.size	init_sysenter_msrs, .-init_sysenter_msrs
	.p2align 4,,15
	.globl	init_node_cpu
	.type	init_node_cpu, @function
init_node_cpu:
.LFB282:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	call	init_dtrs
	call	init_sysenter_msrs
	call	init_pat_msr
	xorl	%edx, %edx
	testl	%eax, %eax
	je	.L491
	call	Arch_initFpu
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	apic_init
	xorl	%edx, %edx
	testl	%eax, %eax
	setne	%dl
.L491:
	movl	%edx, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE282:
	.size	init_node_cpu, .-init_node_cpu
	.text
	.p2align 4,,15
	.globl	getRestartPC
	.type	getRestartPC, @function
getRestartPC:
.LFB351:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	44(%eax), %eax
	ret
	.cfi_endproc
.LFE351:
	.size	getRestartPC, .-getRestartPC
	.p2align 4,,15
	.globl	setNextPC
	.type	setNextPC, @function
setNextPC:
.LFB352:
	.cfi_startproc
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	movl	%edx, 56(%eax)
	ret
	.cfi_endproc
.LFE352:
	.size	setNextPC, .-setNextPC
	.section	.boot.text
	.p2align 4,,15
	.globl	getCacheLineSizeBits
	.type	getCacheLineSizeBits, @function
getCacheLineSizeBits:
.LFB353:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	getCacheLineSize
	movl	%eax, %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L498
	xorl	%ecx, %ecx
	testb	$1, %dl
	jne	.L499
	.p2align 4,,7
	.p2align 3
.L500:
	shrl	%edx
	addl	$1, %ecx
	testb	$1, %dl
	je	.L500
.L499:
	xorl	%eax, %eax
	cmpl	$1, %edx
	cmove	%ecx, %eax
.L498:
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE353:
	.size	getCacheLineSizeBits, .-getCacheLineSizeBits
	.p2align 4,,15
	.globl	init_vm_state
	.type	init_vm_state, @function
init_vm_state:
.LFB313:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	getCacheLineSizeBits
	movl	%eax, %edx
	movl	%eax, ia32KScacheLineSizeBits
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L507
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
.L507:
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE313:
	.size	init_vm_state, .-init_vm_state
	.text
	.p2align 4,,15
	.globl	flushCacheRange
	.type	flushCacheRange, @function
flushCacheRange:
.LFB354:
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
	jae	.L513
	.p2align 4,,7
	.p2align 3
.L515:
	movl	%ebx, (%esp)
	call	flushCacheLine
	movl	ia32KScacheLineSizeBits, %ecx
	movl	%edi, %eax
	sall	%cl, %eax
	addl	%eax, %ebx
	cmpl	%esi, %ebx
	jb	.L515
.L513:
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
.LFE354:
	.size	flushCacheRange, .-flushCacheRange
	.p2align 4,,15
	.globl	Arch_initContext
	.type	Arch_initContext, @function
Arch_initContext:
.LFB355:
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
.LFE355:
	.size	Arch_initContext, .-Arch_initContext
	.p2align 4,,15
	.globl	sanitiseRegister
	.type	sanitiseRegister, @function
sanitiseRegister:
.LFB356:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	8(%esp), %eax
	cmpl	$16, %edx
	je	.L523
	subl	$9, %edx
	cmpl	$1, %edx
	ja	.L521
	movl	%eax, %edx
	andl	$-9, %edx
	cmpl	$51, %edx
	movl	$0, %edx
	cmovne	%edx, %eax
.L521:
	rep ret
	.p2align 4,,7
	.p2align 3
.L523:
	andl	$4055, %eax
	orl	$514, %eax
	ret
	.cfi_endproc
.LFE356:
	.size	sanitiseRegister, .-sanitiseRegister
	.p2align 4,,15
	.globl	Arch_decodeInterruptControl
	.type	Arch_decodeInterruptControl, @function
Arch_decodeInterruptControl:
.LFB357:
	.cfi_startproc
	movl	$3, current_syscall_error+24
	movl	$3, %eax
	ret
	.cfi_endproc
.LFE357:
	.size	Arch_decodeInterruptControl, .-Arch_decodeInterruptControl
	.p2align 4,,15
	.globl	Arch_deriveCap
	.type	Arch_deriveCap, @function
Arch_deriveCap:
.LFB360:
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
	ja	.L528
	movl	%edx, %ebp
	movl	%ebx, %edi
	jmp	*.L530(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L530:
	.long	.L528
	.long	.L529
	.long	.L528
	.long	.L531
	.long	.L528
	.long	.L532
	.long	.L528
	.long	.L534
	.long	.L528
	.long	.L534
	.long	.L528
	.long	.L534
	.text
	.p2align 4,,7
	.p2align 3
.L534:
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
.L532:
	.cfi_restore_state
	xorl	%edx, %edx
	andl	$65536, %ebx
	jne	.L537
.L541:
	movl	$3, current_syscall_error+24
	xorl	%edi, %edi
	xorl	%ebp, %ebp
	movb	$3, %dl
.L537:
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
.L529:
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
.L531:
	.cfi_restore_state
	xorl	%edx, %edx
	andl	$67108864, %ebx
	je	.L541
	jmp	.L537
	.p2align 4,,7
	.p2align 3
.L528:
	call	halt
	.cfi_endproc
.LFE360:
	.size	Arch_deriveCap, .-Arch_deriveCap
	.p2align 4,,15
	.globl	Arch_updateCapData
	.type	Arch_updateCapData, @function
Arch_updateCapData:
.LFB361:
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
	jne	.L556
	movl	24(%esp), %ecx
	movzwl	24(%esp), %edx
	shrl	$16, %ecx
	cmpw	%dx, %cx
	ja	.L549
	cmpw	%dx, %di
	jb	.L549
	shrl	$16, %edi
	cmpw	%di, %cx
	jb	.L549
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
.L556:
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
.L549:
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
.LFE361:
	.size	Arch_updateCapData, .-Arch_updateCapData
	.p2align 4,,15
	.globl	Arch_maskCapRights
	.type	Arch_maskCapRights, @function
Arch_maskCapRights:
.LFB362:
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
	je	.L571
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
.L571:
	.cfi_restore_state
	movl	%edx, %ecx
	andl	$50331648, %ecx
	shrl	$24, %ecx
	cmpl	$2, %ecx
	je	.L572
	cmpl	$3, %ecx
	movl	$16777216, %esi
	je	.L573
.L563:
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
.L573:
	.cfi_restore_state
	testb	$2, 20(%esp)
	je	.L563
	movl	20(%esp), %ecx
	andl	$1, %ecx
	cmpl	$1, %ecx
	sbbl	%esi, %esi
	andl	$-16777216, %esi
	addl	$50331648, %esi
	jmp	.L563
	.p2align 4,,7
	.p2align 3
.L572:
	movl	20(%esp), %ecx
	andl	$2, %ecx
	shrl	%ecx
	cmpl	$1, %ecx
	sbbl	%esi, %esi
	andl	$-16777216, %esi
	addl	$33554432, %esi
	jmp	.L563
	.cfi_endproc
.LFE362:
	.size	Arch_maskCapRights, .-Arch_maskCapRights
	.p2align 4,,15
	.globl	Arch_finaliseCap
	.type	Arch_finaliseCap, @function
Arch_finaliseCap:
.LFB363:
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
	ja	.L577
	jmp	*.L579(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L579:
	.long	.L577
	.long	.L578
	.long	.L577
	.long	.L580
	.long	.L577
	.long	.L581
	.long	.L577
	.long	.L582
	.long	.L577
	.long	.L583
	.long	.L577
	.long	.L582
	.text
	.p2align 4,,7
	.p2align 3
.L581:
	movl	60(%esp), %esi
	testl	%esi, %esi
	je	.L582
	testl	$65536, %edi
	je	.L582
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
.L582:
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
.L583:
	.cfi_restore_state
	movl	60(%esp), %edx
	testl	%edx, %edx
	je	.L582
	movzwl	%di, %edi
	andl	$16777200, %ecx
	shrl	$10, %edi
	sall	$8, %ecx
	cmpl	%ecx, ia32KSASIDTable(,%edi,4)
	jne	.L582
	movl	ksCurThread, %edx
	movl	%eax, 28(%esp)
	movl	$0, ia32KSASIDTable(,%edi,4)
	movl	%edx, (%esp)
	call	setVMRoot
	movl	28(%esp), %eax
	jmp	.L582
	.p2align 4,,7
	.p2align 3
.L578:
	movl	%edi, %ebx
	movl	%ecx, %edx
	andl	$1072693248, %ebx
	shrl	$26, %edx
	shrl	$20, %ebx
	sall	$10, %edx
	addl	%ebx, %edx
	je	.L582
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
	jmp	.L582
	.p2align 4,,7
	.p2align 3
.L580:
	movl	60(%esp), %ebx
	testl	%ebx, %ebx
	je	.L582
	testl	$67108864, %edi
	je	.L582
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
	jmp	.L582
	.p2align 4,,7
	.p2align 3
.L577:
	call	halt
	.cfi_endproc
.LFE363:
	.size	Arch_finaliseCap, .-Arch_finaliseCap
	.p2align 4,,15
	.globl	Arch_recycleCap
	.type	Arch_recycleCap, @function
Arch_recycleCap:
.LFB365:
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
	movl	16(%ebp), %ebx
	movl	8(%ebp), %esi
	movl	20(%ebp), %edi
	movl	%ebx, %eax
	movl	%ebx, %edx
	andl	$14, %eax
	andl	$15, %edx
	movzbl	%bl, %ecx
	cmpl	$14, %eax
	cmove	%ecx, %edx
	cmpl	$11, %edx
	ja	.L606
	jmp	*.L608(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L608:
	.long	.L606
	.long	.L607
	.long	.L606
	.long	.L609
	.long	.L606
	.long	.L610
	.long	.L606
	.long	.L613
	.long	.L606
	.long	.L612
	.long	.L606
	.long	.L613
	.text
	.p2align 4,,7
	.p2align 3
.L612:
	movzwl	%di, %ecx
	shrl	$10, %ecx
	movl	ia32KSASIDTable(,%ecx,4), %eax
	movl	%eax, %edx
	movl	%eax, -36(%ebp)
	movl	%ebx, %eax
	andl	$16777200, %eax
	sall	$8, %eax
	cmpl	%eax, %edx
	jne	.L613
	movl	ksCurThread, %eax
	movl	$0, ia32KSASIDTable(,%ecx,4)
	movl	%ecx, -40(%ebp)
	movl	%eax, (%esp)
	call	setVMRoot
	movl	-36(%ebp), %eax
	movl	-40(%ebp), %ecx
	leal	4096(%eax), %edx
	.p2align 4,,7
	.p2align 3
.L705:
	movl	$0, (%eax)
	addl	$4, %eax
	cmpl	%edx, %eax
	jne	.L705
	movl	-36(%ebp), %eax
	movl	%eax, ia32KSASIDTable(,%ecx,4)
	.p2align 4,,7
	.p2align 3
.L613:
	movl	%ebx, (%esi)
	movl	%esi, %eax
	movl	%edi, 4(%esi)
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
.L607:
	.cfi_restore_state
	movl	%ebx, %edx
	movzbl	%bl, %ecx
	andl	$15, %edx
	cmpl	$14, %eax
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L606
	jmp	*.L618(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L618:
	.long	.L624
	.long	.L619
	.long	.L620
	.long	.L707
	.long	.L622
	.long	.L707
	.long	.L622
	.long	.L624
	.long	.L624
	.long	.L707
	.long	.L627
	.long	.L624
	.long	.L706
	.long	.L606
	.long	.L624
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L624
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L632
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L624
	.text
	.p2align 4,,7
	.p2align 3
.L609:
	movl	%ebx, %edx
	movzbl	%bl, %ecx
	andl	$15, %edx
	cmpl	$14, %eax
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L606
	jmp	*.L660(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L660:
	.long	.L666
	.long	.L661
	.long	.L662
	.long	.L712
	.long	.L664
	.long	.L712
	.long	.L664
	.long	.L666
	.long	.L666
	.long	.L712
	.long	.L669
	.long	.L666
	.long	.L711
	.long	.L606
	.long	.L666
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L666
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L674
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L666
	.text
	.p2align 4,,7
	.p2align 3
.L610:
	movl	%ebx, %eax
	andl	$16777200, %eax
	sall	$8, %eax
	leal	3584(%eax), %edx
	.p2align 4,,7
	.p2align 3
.L701:
	movl	$0, (%eax)
	addl	$4, %eax
	cmpl	%edx, %eax
	jne	.L701
.L696:
	movl	12(%ebp), %ecx
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	movl	%ebx, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%ecx, 12(%esp)
	call	Arch_finaliseCap
	movl	12(%ebp), %eax
	subl	$4, %esp
	testl	%eax, %eax
	je	.L613
	movl	%esi, %eax
	movl	%ebx, %edx
	movl	%edi, %ecx
	call	resetMemMapping
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
.L606:
	.cfi_restore_state
	call	halt
.L624:
	movl	$0, -36(%ebp)
.L629:
	movl	%ebx, %edx
	movzbl	%bl, %ecx
	andl	$15, %edx
	cmpl	$14, %eax
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L606
	jmp	*.L640(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L640:
	.long	.L709
	.long	.L647
	.long	.L646
	.long	.L647
	.long	.L646
	.long	.L647
	.long	.L646
	.long	.L709
	.long	.L709
	.long	.L647
	.long	.L648
	.long	.L709
	.long	.L649
	.long	.L606
	.long	.L709
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L709
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L650
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L709
	.text
.L666:
	movl	$0, -36(%ebp)
.L671:
	movl	%ebx, %edx
	movzbl	%bl, %ecx
	andl	$15, %edx
	cmpl	$14, %eax
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L606
	jmp	*.L682(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L682:
	.long	.L714
	.long	.L689
	.long	.L688
	.long	.L689
	.long	.L688
	.long	.L689
	.long	.L688
	.long	.L714
	.long	.L714
	.long	.L689
	.long	.L690
	.long	.L714
	.long	.L691
	.long	.L606
	.long	.L714
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L714
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L692
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L606
	.long	.L714
	.text
.L689:
	movl	%ebx, %edx
	andl	$16777200, %edx
	sall	$8, %edx
.L681:
	movzbl	-36(%ebp), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	testl	%eax, %eax
	je	.L697
	.p2align 4,,7
	.p2align 3
.L721:
	movl	$0, (%edx)
	addl	$4, %edx
	subl	$4, %eax
	jne	.L721
.L697:
	testl	$67108864, %edi
	je	.L696
	movl	%ebx, %eax
	andl	$16777200, %eax
	sall	$8, %eax
	movl	%eax, 8(%esp)
	movl	%edi, %eax
	sall	$22, %eax
	movl	%eax, 4(%esp)
	movl	%edi, %eax
	andl	$67107840, %eax
	shrl	$10, %eax
	movl	%eax, (%esp)
	call	unmapPageTable
	jmp	.L696
.L647:
	movl	%ebx, %edx
	andl	$16777200, %edx
	sall	$8, %edx
.L639:
	movzbl	-36(%ebp), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	testl	%eax, %eax
	je	.L654
	.p2align 4,,7
	.p2align 3
.L720:
	movl	$0, (%edx)
	addl	$4, %edx
	subl	$4, %eax
	jne	.L720
.L654:
	movl	12(%ebp), %ecx
	leal	-32(%ebp), %eax
	movl	%ebx, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, (%esp)
	movl	%ecx, 12(%esp)
	call	Arch_finaliseCap
	movl	%esi, %eax
	movl	%ebx, %edx
	movl	%edi, %ecx
	subl	$4, %esp
	call	resetMemMapping
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
.L646:
	.cfi_restore_state
	movl	%ebx, %edx
	andl	$-16, %edx
	jmp	.L639
.L688:
	movl	%ebx, %edx
	andl	$-16, %edx
	jmp	.L681
.L707:
	movl	$12, -36(%ebp)
	jmp	.L629
.L712:
	movl	$12, -36(%ebp)
	jmp	.L671
.L691:
	movl	%ebx, %edx
	andl	$-1024, %edx
	jmp	.L681
.L692:
	movl	%ebx, %eax
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L715
	leal	1(%eax), %ecx
	movl	$-1, %edx
	sall	%cl, %edx
	andl	%edi, %edx
	jmp	.L681
.L650:
	movl	%ebx, %eax
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L710
	leal	1(%eax), %ecx
	movl	$-1, %edx
	sall	%cl, %edx
	andl	%edi, %edx
	jmp	.L639
.L649:
	movl	%ebx, %edx
	andl	$-1024, %edx
	jmp	.L639
.L648:
	movl	%ebx, %edx
	andl	$2147483632, %edx
	addl	%edx, %edx
	jmp	.L639
.L709:
	xorl	%edx, %edx
	jmp	.L639
.L690:
	movl	%ebx, %edx
	andl	$2147483632, %edx
	addl	%edx, %edx
	jmp	.L681
.L714:
	xorl	%edx, %edx
	jmp	.L681
.L669:
	movl	%edi, %edx
	andl	$260046848, %edx
	shrl	$23, %edx
	leal	4(%edx), %ecx
	movl	%ecx, -36(%ebp)
	jmp	.L671
.L711:
	movl	$10, -36(%ebp)
	jmp	.L671
.L619:
	movl	%edi, %edx
	shrl	$31, %edx
	testl	%edx, %edx
	je	.L707
	cmpl	$1, %edx
	jne	.L606
	movl	$22, -36(%ebp)
	jmp	.L629
.L632:
	movl	%ebx, %edx
	andl	$16128, %edx
	shrl	$8, %edx
	cmpl	$32, %edx
	movl	$10, -36(%ebp)
	je	.L629
	andl	$31, %edx
	leal	4(%edx), %ecx
	movl	%ecx, -36(%ebp)
	jmp	.L629
.L620:
	movl	%edi, %ecx
	andl	$31, %ecx
	movl	%ecx, -36(%ebp)
	jmp	.L629
.L664:
	movl	$4, -36(%ebp)
	jmp	.L671
.L662:
	movl	%edi, %ecx
	andl	$31, %ecx
	movl	%ecx, -36(%ebp)
	jmp	.L671
.L661:
	movl	%edi, %edx
	shrl	$31, %edx
	testl	%edx, %edx
	je	.L712
	cmpl	$1, %edx
	jne	.L606
	movl	$22, -36(%ebp)
	jmp	.L671
.L674:
	movl	%ebx, %edx
	andl	$16128, %edx
	shrl	$8, %edx
	cmpl	$32, %edx
	movl	$10, -36(%ebp)
	je	.L671
	andl	$31, %edx
	leal	4(%edx), %ecx
	movl	%ecx, -36(%ebp)
	jmp	.L671
.L627:
	movl	%edi, %edx
	andl	$260046848, %edx
	shrl	$23, %edx
	leal	4(%edx), %ecx
	movl	%ecx, -36(%ebp)
	jmp	.L629
.L706:
	movl	$10, -36(%ebp)
	jmp	.L629
.L622:
	movl	$4, -36(%ebp)
	jmp	.L629
.L715:
	movl	$-16, %edx
	andl	%edi, %edx
	jmp	.L681
.L710:
	movl	$-16, %edx
	andl	%edi, %edx
	jmp	.L639
	.cfi_endproc
.LFE365:
	.size	Arch_recycleCap, .-Arch_recycleCap
	.p2align 4,,15
	.globl	Arch_hasRecycleRights
	.type	Arch_hasRecycleRights, @function
Arch_hasRecycleRights:
.LFB366:
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
	jne	.L735
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
.L735:
	.cfi_restore_state
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE366:
	.size	Arch_hasRecycleRights, .-Arch_hasRecycleRights
	.p2align 4,,15
	.globl	Arch_sameRegionAs
	.type	Arch_sameRegionAs, @function
Arch_sameRegionAs:
.LFB367:
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
	ja	.L767
	jmp	*.L742(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L742:
	.long	.L767
	.long	.L741
	.long	.L767
	.long	.L743
	.long	.L767
	.long	.L744
	.long	.L767
	.long	.L745
	.long	.L767
	.long	.L746
	.long	.L767
	.long	.L747
	.text
	.p2align 4,,7
	.p2align 3
.L747:
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
.L740:
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
.L741:
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
	jne	.L740
	shrl	$31, %esi
	testl	%esi, %esi
	je	.L751
	cmpl	$1, %esi
	jne	.L783
	movl	$4194304, %eax
.L752:
	shrl	$31, %edi
	testl	%edi, %edi
	je	.L754
	cmpl	$1, %edi
	jne	.L783
	movl	$4194304, %ebx
.L755:
	andl	$16777200, %edx
	andl	$16777200, %ecx
	sall	$8, %edx
	sall	$8, %ecx
	leal	-1(%ecx,%ebx), %ebx
	leal	-1(%edx,%eax), %eax
	cmpl	%ebx, %eax
	jb	.L767
	cmpl	%ecx, %edx
	ja	.L767
	xorl	%eax, %eax
	cmpl	%ecx, %ebx
	setae	%al
	jmp	.L740
	.p2align 4,,7
	.p2align 3
.L743:
	movl	%ecx, %esi
	movl	%ecx, %ebx
	andl	$14, %esi
	andl	$15, %ebx
	movzbl	%cl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$3, %ebx
	jne	.L740
.L782:
	andl	$16777200, %edx
	andl	$16777200, %ecx
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	sete	%al
	jmp	.L740
	.p2align 4,,7
	.p2align 3
.L744:
	movl	%ecx, %esi
	movl	%ecx, %ebx
	andl	$14, %esi
	andl	$15, %ebx
	movzbl	%cl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$5, %ebx
	je	.L782
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
.L745:
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
.L746:
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
	je	.L782
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
.L767:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L740
	.p2align 4,,7
	.p2align 3
.L783:
	call	halt
	.p2align 4,,7
	.p2align 3
.L751:
	movl	$4096, %eax
	jmp	.L752
.L754:
	movl	$4096, %ebx
	jmp	.L755
	.cfi_endproc
.LFE367:
	.size	Arch_sameRegionAs, .-Arch_sameRegionAs
	.p2align 4,,15
	.globl	Arch_sameObjectAs
	.type	Arch_sameObjectAs, @function
Arch_sameObjectAs:
.LFB368:
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
	je	.L796
.L789:
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
.L796:
	.cfi_restore_state
	movl	%ecx, %esi
	movl	%ecx, %edx
	andl	$14, %esi
	andl	$15, %edx
	movzbl	%cl, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %edx
	cmpl	$1, %edx
	jne	.L789
	andl	$16777200, %eax
	andl	$16777200, %ecx
	movl	%eax, %edx
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	je	.L797
.L793:
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
.L797:
	.cfi_restore_state
	shrl	$31, %edi
	xorl	%eax, %eax
	shrl	$31, %ebp
	cmpl	%ebp, %edi
	sete	%al
	jmp	.L793
	.cfi_endproc
.LFE368:
	.size	Arch_sameObjectAs, .-Arch_sameObjectAs
	.p2align 4,,15
	.globl	Arch_getObjectSize
	.type	Arch_getObjectSize, @function
Arch_getObjectSize:
.LFB369:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	cmpl	$6, %eax
	je	.L803
	ja	.L801
	cmpl	$5, %eax
	jne	.L799
.L802:
	movl	$12, %eax
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L801:
	.cfi_restore_state
	cmpl	$8, %eax
	jbe	.L802
.L799:
	call	halt
	.p2align 4,,7
	.p2align 3
.L803:
	movl	$22, %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE369:
	.size	Arch_getObjectSize, .-Arch_getObjectSize
	.p2align 4,,15
	.globl	Arch_createObject
	.type	Arch_createObject, @function
Arch_createObject:
.LFB370:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	20(%esp), %esi
	movl	16(%esp), %eax
	movl	24(%esp), %ecx
	cmpl	$6, %esi
	je	.L810
	leal	4096(%ecx), %ebx
	movl	%ecx, %edx
	jbe	.L831
	cmpl	$7, %esi
	je	.L821
	cmpl	$8, %esi
	jne	.L809
	.p2align 4,,7
	.p2align 3
.L827:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ebx, %edx
	jne	.L827
	movl	ia32KSkernelPD, %ebx
	movl	$896, %edx
	.p2align 4,,7
	.p2align 3
.L825:
	movl	(%ebx,%edx,4), %esi
	movl	%esi, (%ecx,%edx,4)
	addl	$1, %edx
	cmpl	$1024, %edx
	jne	.L825
	andl	$-4096, %ecx
	shrl	$8, %ecx
	orl	$5, %ecx
	movl	%ecx, (%eax)
	movl	$0, 4(%eax)
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
.L821:
	.cfi_restore_state
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ebx, %edx
	jne	.L821
	andl	$-4096, %ecx
	shrl	$8, %ecx
	orl	$3, %ecx
	movl	%ecx, (%eax)
	movl	$0, 4(%eax)
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
.L831:
	.cfi_restore_state
	cmpl	$5, %esi
	jne	.L809
	.p2align 4,,7
	.p2align 3
.L826:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ebx, %edx
	jne	.L826
	andl	$-4096, %ecx
	shrl	$8, %ecx
	orl	$50331649, %ecx
	movl	%ecx, (%eax)
	movl	$0, 4(%eax)
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
.L810:
	.cfi_restore_state
	leal	4194304(%ecx), %ebx
	movl	%ecx, %edx
	.p2align 4,,7
	.p2align 3
.L819:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ebx, %edx
	jne	.L819
	andl	$-4096, %ecx
	shrl	$8, %ecx
	orl	$50331649, %ecx
	movl	%ecx, (%eax)
	movl	$-2147483648, 4(%eax)
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
.L809:
	.cfi_restore_state
	call	halt
	.cfi_endproc
.LFE370:
	.size	Arch_createObject, .-Arch_createObject
	.p2align 4,,15
	.globl	Arch_prepareThreadDelete
	.type	Arch_prepareThreadDelete, @function
Arch_prepareThreadDelete:
.LFB372:
	.cfi_startproc
	movl	ia32KSfpuOwner, %eax
	cmpl	%eax, 4(%esp)
	je	.L834
	rep ret
	.p2align 4,,7
	.p2align 3
.L834:
	xorl	%eax, %eax
	jmp	switchFpuOwner
	.cfi_endproc
.LFE372:
	.size	Arch_prepareThreadDelete, .-Arch_prepareThreadDelete
	.p2align 4,,15
	.globl	setMRs_fault
	.type	setMRs_fault, @function
setMRs_fault:
.LFB374:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %edx
	movl	20(%esp), %ebx
	movl	24(%esp), %ecx
	movl	604(%edx), %eax
	andl	$7, %eax
	cmpl	$2, %eax
	je	.L837
	jbe	.L863
	cmpl	$3, %eax
	je	.L840
	cmpl	$4, %eax
	.p2align 4,,5
	jne	.L836
	movl	44(%edx), %eax
	testl	%ecx, %ecx
	movl	%eax, 20(%ebx)
	movl	68(%edx), %eax
	movl	%eax, 24(%ebx)
	je	.L843
	movl	64(%edx), %eax
	movl	%eax, 12(%ecx)
	movl	608(%edx), %eax
	movl	%eax, 16(%ecx)
	movl	604(%edx), %eax
	shrl	$3, %eax
	movl	%eax, 20(%ecx)
	movl	$5, %eax
	jmp	.L849
	.p2align 4,,7
	.p2align 3
.L840:
	movl	(%edx), %eax
	testl	%ecx, %ecx
	movl	%eax, 20(%ebx)
	movl	4(%edx), %eax
	movl	%eax, 24(%ebx)
	movl	$2, %eax
	je	.L843
	.p2align 4,,7
	.p2align 3
.L857:
	addl	$1, %eax
	movl	syscallMessage-4(,%eax,4), %ebx
	cmpl	$10, %eax
	movl	(%edx,%ebx,4), %esi
	movl	%esi, (%ecx,%eax,4)
	jne	.L857
	movl	608(%edx), %eax
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
.L863:
	.cfi_restore_state
	cmpl	$1, %eax
	jne	.L836
	movl	44(%edx), %eax
	testl	%ecx, %ecx
	movl	%eax, 20(%ebx)
	movl	608(%edx), %eax
	movl	%eax, 24(%ebx)
	je	.L843
	movl	604(%edx), %eax
	shrl	$31, %eax
	movl	%eax, 12(%ecx)
	movl	612(%edx), %ebx
	movl	616(%edx), %esi
	movl	%ebx, %eax
	andl	$3, %eax
	leal	1(%eax), %edx
	cmpl	$2, %eax
	movl	%edx, 16(%ecx)
	je	.L846
	cmpl	$3, %eax
	je	.L847
	cmpl	$1, %eax
	jne	.L862
	andl	$252, %ebx
	movb	$5, %al
	shrl	$2, %ebx
	movl	%ebx, 20(%ecx)
	jmp	.L849
	.p2align 4,,7
	.p2align 3
.L836:
	call	halt
	.p2align 4,,7
	.p2align 3
.L837:
	movl	44(%edx), %eax
	testl	%ecx, %ecx
	movl	%eax, 20(%ebx)
	movl	608(%edx), %eax
	movl	%eax, 24(%ebx)
	je	.L843
	movl	604(%edx), %eax
	andl	$524288, %eax
	shrl	$19, %eax
	movl	%eax, 12(%ecx)
	movl	604(%edx), %eax
	shrl	$27, %eax
	movl	%eax, 16(%ecx)
.L862:
	movl	$4, %eax
.L849:
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
.L843:
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
.L847:
	.cfi_restore_state
	movl	%ebx, %eax
	andl	$252, %ebx
	andl	$16128, %eax
	shrl	$8, %eax
	shrl	$2, %ebx
	movl	%eax, 20(%ecx)
	movl	$7, %eax
	movl	%esi, 24(%ecx)
	movl	%ebx, 28(%ecx)
	jmp	.L849
	.p2align 4,,7
	.p2align 3
.L846:
	movl	%ebx, %eax
	andl	$16128, %ebx
	andl	$252, %eax
	shrl	$2, %eax
	shrl	$8, %ebx
	movl	%eax, 20(%ecx)
	movl	$6, %eax
	movl	%ebx, 24(%ecx)
	jmp	.L849
	.cfi_endproc
.LFE374:
	.size	setMRs_fault, .-setMRs_fault
	.p2align 4,,15
	.globl	setMRs_syscall_error
	.type	setMRs_syscall_error, @function
setMRs_syscall_error:
.LFB375:
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
	ja	.L865
	jmp	*.L867(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L867:
	.long	.L865
	.long	.L866
	.long	.L868
	.long	.L877
	.long	.L870
	.long	.L877
	.long	.L871
	.long	.L877
	.long	.L877
	.long	.L877
	.long	.L872
	.text
	.p2align 4,,7
	.p2align 3
.L877:
	xorl	%eax, %eax
.L869:
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
.L870:
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
.L872:
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
.L871:
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
	je	.L869
	cmpl	$2, %edx
	je	.L874
	cmpl	$3, %edx
	je	.L875
	cmpl	$1, %edx
	.p2align 4,,2
	jne	.L869
	movl	20(%esp), %eax
	andl	$252, %ecx
	shrl	$2, %ecx
	movl	%ecx, 12(%eax)
	movl	$3, %eax
	jmp	.L869
	.p2align 4,,7
	.p2align 3
.L866:
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
.L868:
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
.L865:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L875:
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
	jmp	.L869
	.p2align 4,,7
	.p2align 3
.L874:
	movl	20(%esp), %esi
	movl	%ecx, %eax
	andl	$16128, %ecx
	andl	$252, %eax
	shrl	$2, %eax
	shrl	$8, %ecx
	movl	%eax, 12(%esi)
	movl	$4, %eax
	movl	%ecx, 16(%esi)
	jmp	.L869
	.cfi_endproc
.LFE375:
	.size	setMRs_syscall_error, .-setMRs_syscall_error
	.p2align 4,,15
	.globl	Arch_decodeTransfer
	.type	Arch_decodeTransfer, @function
Arch_decodeTransfer:
.LFB376:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE376:
	.size	Arch_decodeTransfer, .-Arch_decodeTransfer
	.p2align 4,,15
	.globl	Arch_performTransfer
	.type	Arch_performTransfer, @function
Arch_performTransfer:
.LFB377:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE377:
	.size	Arch_performTransfer, .-Arch_performTransfer
	.section	.boot.text
	.p2align 4,,15
	.globl	insert_region
	.type	insert_region, @function
insert_region:
.LFB378:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %ecx
	movl	12(%esp), %edx
	cmpl	%ecx, %edx
	je	.L887
	movl	ndks_boot+4, %eax
	cmpl	%eax, ndks_boot
	movl	$0, %eax
	je	.L886
	movl	ndks_boot+12, %ebx
	cmpl	%ebx, ndks_boot+8
	je	.L891
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L887:
	.cfi_restore_state
	movl	$1, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L891:
	.cfi_restore_state
	movb	$1, %al
.L886:
	movl	%ecx, ndks_boot(,%eax,8)
	movl	%edx, ndks_boot+4(,%eax,8)
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE378:
	.size	insert_region, .-insert_region
	.p2align 4,,15
	.globl	alloc_region
	.type	alloc_region, @function
alloc_region:
.LFB380:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	xorl	%ebp, %ebp
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
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	64(%esp), %ecx
	movl	$0, 28(%esp)
	movl	$0, 4(%esp)
	movl	$0, 12(%esp)
	sall	%cl, %edi
	movl	$0, 16(%esp)
	movl	$0, 20(%esp)
	movl	$0, 24(%esp)
	movl	$0, 32(%esp)
	movl	%edi, 8(%esp)
.L898:
	movl	ndks_boot(,%ebp,8), %ebx
	movl	ndks_boot+4(,%ebp,8), %edi
	leal	-1(%ebx), %eax
	shrl	%cl, %eax
	movl	%edi, %edx
	addl	$1, %eax
	sall	%cl, %eax
	movl	%eax, %esi
	subl	%ebx, %esi
	shrl	%cl, %edx
	sall	%cl, %edx
	movl	%esi, (%esp)
	movl	%edi, %esi
	subl	%edx, %esi
	cmpl	%esi, (%esp)
	jae	.L893
	movl	8(%esp), %esi
	leal	(%eax,%esi), %edx
.L894:
	cmpl	%eax, %edx
	jbe	.L895
	cmpl	%eax, %ebx
	ja	.L895
	cmpl	%edx, %edi
	jae	.L912
	.p2align 4,,7
	.p2align 3
.L895:
	addl	$1, %ebp
	cmpl	$2, %ebp
	jne	.L898
	movl	4(%esp), %eax
	cmpl	%eax, 12(%esp)
	je	.L906
	movl	32(%esp), %eax
	movl	$0, ndks_boot(,%eax,8)
	movl	$0, ndks_boot+4(,%eax,8)
	movl	28(%esp), %eax
	cmpl	%eax, 24(%esp)
	je	.L900
	movl	ndks_boot+4, %eax
	cmpl	%eax, ndks_boot
	je	.L907
	movl	ndks_boot+12, %eax
	cmpl	%eax, ndks_boot+8
	je	.L913
.L900:
	movl	4(%esp), %ebx
	movl	20(%esp), %edi
	cmpl	%edi, 16(%esp)
	movl	%ebx, %eax
	je	.L899
	movl	ndks_boot+4, %eax
	cmpl	%eax, ndks_boot
	je	.L909
	movl	%ebx, %eax
	movl	ndks_boot+12, %ebx
	cmpl	%ebx, ndks_boot+8
	je	.L914
.L899:
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
.L893:
	.cfi_restore_state
	movl	%edx, %eax
	subl	8(%esp), %eax
	jmp	.L894
	.p2align 4,,7
	.p2align 3
.L912:
	movl	%eax, %esi
	subl	%ebx, %esi
	movl	%esi, (%esp)
	movl	%edi, %esi
	subl	%edx, %esi
	cmpl	%esi, (%esp)
	jb	.L915
	movl	%eax, 36(%esp)
	movl	%edx, (%esp)
.L896:
	movl	4(%esp), %esi
	cmpl	%esi, 12(%esp)
	je	.L905
	movl	%edx, 40(%esp)
	movl	20(%esp), %edx
	movl	%eax, %esi
	subl	16(%esp), %edx
	movl	%edi, %eax
	subl	(%esp), %eax
	cmpl	%edx, %eax
	movl	%esi, %eax
	movl	40(%esp), %edx
	jb	.L905
	jne	.L895
	movl	36(%esp), %eax
	movl	28(%esp), %edx
	subl	24(%esp), %edx
	subl	%ebx, %eax
	cmpl	%edx, %eax
	movl	%esi, %eax
	movl	40(%esp), %edx
	jae	.L895
	.p2align 4,,7
	.p2align 3
.L905:
	movl	36(%esp), %esi
	movl	%ebx, 24(%esp)
	movl	(%esp), %ebx
	movl	%edi, 20(%esp)
	movl	%edx, 12(%esp)
	movl	%esi, 28(%esp)
	movl	%ebx, 16(%esp)
	movl	%eax, 4(%esp)
	movl	%ebp, 32(%esp)
	jmp	.L895
	.p2align 4,,7
	.p2align 3
.L915:
	movl	%edi, 36(%esp)
	movl	%eax, %edi
	movl	%ebx, (%esp)
	movl	%edx, %ebx
	jmp	.L896
	.p2align 4,,7
	.p2align 3
.L906:
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
.L909:
	.cfi_restore_state
	movl	$ndks_boot, %eax
.L902:
	movl	16(%esp), %ebx
	movl	%ebx, (%eax)
	movl	20(%esp), %ebx
	movl	%ebx, 4(%eax)
	movl	4(%esp), %eax
	jmp	.L899
	.p2align 4,,7
	.p2align 3
.L907:
	movl	$ndks_boot, %eax
.L901:
	movl	24(%esp), %ebx
	movl	%ebx, (%eax)
	movl	28(%esp), %ebx
	movl	%ebx, 4(%eax)
	jmp	.L900
	.p2align 4,,7
	.p2align 3
.L914:
	movl	$ndks_boot+8, %eax
	jmp	.L902
	.p2align 4,,7
	.p2align 3
.L913:
	movl	$ndks_boot+8, %eax
	jmp	.L901
	.cfi_endproc
.LFE380:
	.size	alloc_region, .-alloc_region
	.p2align 4,,15
	.globl	write_slot
	.type	write_slot, @function
write_slot:
.LFB381:
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
.LFE381:
	.size	write_slot, .-write_slot
	.p2align 4,,15
	.globl	create_root_cnode
	.type	create_root_cnode, @function
create_root_cnode:
.LFB382:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	$16, (%esp)
	movl	16(%esp), %esi
	movl	$4096, ndks_boot+24
	call	alloc_region
	testl	%eax, %eax
	movl	%eax, %ebx
	movl	%eax, %edx
	leal	65536(%eax), %ecx
	je	.L924
	.p2align 4,,7
	.p2align 3
.L922:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jne	.L922
	movl	%ebx, %eax
	andl	$-32, %eax
	shrl	%eax
	orl	$10, %eax
	movl	%eax, 32(%ebx)
	movl	%eax, (%esi)
	movl	%esi, %eax
	movl	$105906176, 36(%ebx)
	movl	$0, 40(%ebx)
	movl	$3, 44(%ebx)
	movl	$105906176, 4(%esi)
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
.L924:
	.cfi_restore_state
	movl	$0, (%esi)
	movl	%esi, %eax
	movl	$0, 4(%esi)
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE382:
	.size	create_root_cnode, .-create_root_cnode
	.p2align 4,,15
	.globl	create_irq_cnode
	.type	create_irq_cnode, @function
create_irq_cnode:
.LFB383:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$4, %esp
	.cfi_def_cfa_offset 12
	movl	$12, (%esp)
	call	alloc_region
	movl	%eax, %ebx
	xorl	%eax, %eax
	testl	%ebx, %ebx
	je	.L926
	leal	4096(%ebx), %ecx
	movl	%ebx, %edx
	.p2align 4,,7
	.p2align 3
.L928:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jne	.L928
	movl	%ebx, intStateIRQNode
	movl	$1, %eax
.L926:
	addl	$4, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE383:
	.size	create_irq_cnode, .-create_irq_cnode
	.p2align 4,,15
	.globl	create_domain_cap
	.type	create_domain_cap, @function
create_domain_cap:
.LFB384:
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
	ja	.L935
	jmp	*.L937(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L937:
	.long	.L949
	.long	.L944
	.long	.L943
	.long	.L944
	.long	.L943
	.long	.L944
	.long	.L943
	.long	.L949
	.long	.L949
	.long	.L944
	.long	.L945
	.long	.L949
	.long	.L946
	.long	.L935
	.long	.L949
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L949
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L947
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L935
	.long	.L949
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L944:
	andl	$16777200, %eax
	sall	$8, %eax
.L936:
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
.L943:
	.cfi_restore_state
	andl	$-16, %eax
	jmp	.L936
	.p2align 4,,7
	.p2align 3
.L949:
	xorl	%eax, %eax
	jmp	.L936
	.p2align 4,,7
	.p2align 3
.L947:
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L950
	leal	1(%eax), %ecx
	movl	$-1, %eax
	sall	%cl, %eax
	andl	%esi, %eax
	jmp	.L936
	.p2align 4,,7
	.p2align 3
.L946:
	andl	$-1024, %eax
	jmp	.L936
	.p2align 4,,7
	.p2align 3
.L945:
	andl	$2147483632, %eax
	addl	%eax, %eax
	jmp	.L936
	.p2align 4,,7
	.p2align 3
.L935:
	call	halt
	.p2align 4,,7
	.p2align 3
.L950:
	movl	$-16, %eax
	andl	%esi, %eax
	jmp	.L936
	.cfi_endproc
.LFE384:
	.size	create_domain_cap, .-create_domain_cap
	.p2align 4,,15
	.globl	create_ipcbuf_frame
	.type	create_ipcbuf_frame, @function
create_ipcbuf_frame:
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
	movl	16(%ebp), %eax
	movl	$12, (%esp)
	movl	8(%ebp), %ebx
	movl	12(%ebp), %esi
	movl	%eax, -44(%ebp)
	call	alloc_region
	testl	%eax, %eax
	movl	%eax, %edx
	leal	4096(%eax), %ecx
	je	.L978
	.p2align 4,,7
	.p2align 3
.L975:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jne	.L975
	movl	28(%ebp), %edx
	leal	-32(%ebp), %ecx
	movl	%eax, 12(%esp)
	movl	20(%ebp), %eax
	movl	%ecx, (%esp)
	movl	$0, 24(%esp)
	movl	%edx, 16(%esp)
	movl	24(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	$1, 20(%esp)
	movl	%edx, 8(%esp)
	call	create_mapped_it_frame_cap
	movl	-32(%ebp), %eax
	movl	%esi, %ecx
	movl	-28(%ebp), %edx
	andl	$15, %ecx
	movl	%eax, -40(%ebp)
	movl	%esi, %eax
	andl	$14, %eax
	movl	%edx, -36(%ebp)
	movl	%eax, %edx
	movl	%esi, %eax
	subl	$4, %esp
	movzbl	%al, %edi
	cmpl	$14, %edx
	cmove	%edi, %ecx
	cmpl	$62, %ecx
	ja	.L959
	jmp	*.L961(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L961:
	.long	.L973
	.long	.L968
	.long	.L967
	.long	.L968
	.long	.L967
	.long	.L968
	.long	.L967
	.long	.L973
	.long	.L973
	.long	.L968
	.long	.L969
	.long	.L973
	.long	.L970
	.long	.L959
	.long	.L973
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L973
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L971
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L959
	.long	.L973
	.section	.boot.text
.L968:
	andl	$16777200, %esi
	sall	$8, %esi
.L960:
	movl	-40(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	$0, 168(%esi)
	movl	$3, 172(%esi)
	movl	%eax, 160(%esi)
	movl	%eax, (%ebx)
	movl	%ebx, %eax
	movl	%edx, 164(%esi)
	movl	%edx, 4(%ebx)
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
.L978:
	.cfi_restore_state
	movl	$0, (%ebx)
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
.L967:
	.cfi_restore_state
	andl	$-16, %esi
	jmp	.L960
.L973:
	xorl	%esi, %esi
	jmp	.L960
.L969:
	andl	$2147483632, %esi
	addl	%esi, %esi
	jmp	.L960
.L971:
	andl	$16128, %esi
	shrl	$8, %esi
	cmpl	$32, %esi
	je	.L974
	leal	1(%esi), %ecx
	movl	$-1, %esi
	sall	%cl, %esi
.L972:
	andl	-44(%ebp), %esi
	jmp	.L960
.L970:
	andl	$-1024, %esi
	jmp	.L960
.L959:
	call	halt
.L974:
	movl	$-16, %esi
	jmp	.L972
	.cfi_endproc
.LFE385:
	.size	create_ipcbuf_frame, .-create_ipcbuf_frame
	.p2align 4,,15
	.globl	create_bi_frame_cap
	.type	create_bi_frame_cap, @function
create_bi_frame_cap:
.LFB386:
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
	movl	12(%ebp), %eax
	movl	20(%ebp), %edx
	leal	-32(%ebp), %ecx
	movl	%ecx, (%esp)
	movl	8(%ebp), %ebx
	movl	$0, 24(%esp)
	movl	%eax, -36(%ebp)
	movl	28(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$1, 20(%esp)
	movl	%ebx, %edi
	movzbl	%bl, %esi
	andl	$14, %edi
	movl	%eax, 16(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	call	create_mapped_it_frame_cap
	movl	%ebx, %ecx
	movl	-32(%ebp), %eax
	andl	$15, %ecx
	movl	-28(%ebp), %edx
	subl	$4, %esp
	cmpl	$14, %edi
	cmove	%esi, %ecx
	cmpl	$62, %ecx
	ja	.L982
	jmp	*.L984(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L984:
	.long	.L996
	.long	.L991
	.long	.L990
	.long	.L991
	.long	.L990
	.long	.L991
	.long	.L990
	.long	.L996
	.long	.L996
	.long	.L991
	.long	.L992
	.long	.L996
	.long	.L993
	.long	.L982
	.long	.L996
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L996
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L994
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L982
	.long	.L996
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L991:
	andl	$16777200, %ebx
	sall	$8, %ebx
.L983:
	movl	%eax, 144(%ebx)
	movl	%edx, 148(%ebx)
	movl	$0, 152(%ebx)
	movl	$3, 156(%ebx)
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
.L990:
	.cfi_restore_state
	andl	$-16, %ebx
	jmp	.L983
	.p2align 4,,7
	.p2align 3
.L996:
	xorl	%ebx, %ebx
	jmp	.L983
	.p2align 4,,7
	.p2align 3
.L994:
	andl	$16128, %ebx
	shrl	$8, %ebx
	cmpl	$32, %ebx
	je	.L997
	leal	1(%ebx), %ecx
	movl	$-1, %ebx
	sall	%cl, %ebx
.L995:
	andl	-36(%ebp), %ebx
	jmp	.L983
	.p2align 4,,7
	.p2align 3
.L993:
	andl	$-1024, %ebx
	jmp	.L983
	.p2align 4,,7
	.p2align 3
.L992:
	andl	$2147483632, %ebx
	addl	%ebx, %ebx
	jmp	.L983
	.p2align 4,,7
	.p2align 3
.L982:
	call	halt
	.p2align 4,,7
	.p2align 3
.L997:
	movl	$-16, %ebx
	jmp	.L995
	.cfi_endproc
.LFE386:
	.size	create_bi_frame_cap, .-create_bi_frame_cap
	.p2align 4,,15
	.globl	allocate_bi_frame
	.type	allocate_bi_frame, @function
allocate_bi_frame:
.LFB387:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$4, %esp
	.cfi_def_cfa_offset 12
	movl	$12, (%esp)
	call	alloc_region
	movl	%eax, %ebx
	xorl	%eax, %eax
	testl	%ebx, %ebx
	je	.L1000
	leal	4096(%ebx), %ecx
	movl	%ebx, %edx
	.p2align 4,,7
	.p2align 3
.L1002:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jne	.L1002
	movl	12(%esp), %eax
	movl	%ebx, ndks_boot+16
	movl	$12, ndks_boot+20
	movb	$12, 886(%ebx)
	movl	%eax, (%ebx)
	movl	16(%esp), %eax
	movl	$0, 8(%ebx)
	movl	%eax, 4(%ebx)
	movl	20(%esp), %eax
	movl	%eax, 12(%ebx)
	movl	ksDomScheduleIdx, %eax
	movl	ksDomSchedule(,%eax,8), %eax
	movb	%al, 4092(%ebx)
	movl	%ebx, %eax
.L1000:
	addl	$4, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE387:
	.size	allocate_bi_frame, .-allocate_bi_frame
	.p2align 4,,15
	.globl	provide_cap
	.type	provide_cap, @function
provide_cap:
.LFB388:
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
	jae	.L1024
	movl	%eax, %edi
	movl	%eax, %edx
	andl	$14, %edi
	andl	$15, %edx
	movzbl	%al, %ecx
	cmpl	$14, %edi
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L1010
	jmp	*.L1012(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L1012:
	.long	.L1025
	.long	.L1019
	.long	.L1018
	.long	.L1019
	.long	.L1018
	.long	.L1019
	.long	.L1018
	.long	.L1025
	.long	.L1025
	.long	.L1019
	.long	.L1020
	.long	.L1025
	.long	.L1021
	.long	.L1010
	.long	.L1025
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1025
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1022
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1010
	.long	.L1025
	.section	.boot.text
	.p2align 4,,7
	.p2align 3
.L1019:
	andl	$16777200, %eax
	sall	$8, %eax
.L1011:
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
.L1024:
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
.L1018:
	.cfi_restore_state
	andl	$-16, %eax
	jmp	.L1011
	.p2align 4,,7
	.p2align 3
.L1025:
	xorl	%eax, %eax
	jmp	.L1011
	.p2align 4,,7
	.p2align 3
.L1020:
	andl	$2147483632, %eax
	addl	%eax, %eax
	jmp	.L1011
	.p2align 4,,7
	.p2align 3
.L1022:
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L1026
	leal	1(%eax), %ecx
	movl	$-1, %eax
	sall	%cl, %eax
	andl	%esi, %eax
	jmp	.L1011
	.p2align 4,,7
	.p2align 3
.L1021:
	andl	$-1024, %eax
	jmp	.L1011
	.p2align 4,,7
	.p2align 3
.L1010:
	call	halt
	.p2align 4,,7
	.p2align 3
.L1026:
	movl	$-16, %eax
	andl	%esi, %eax
	jmp	.L1011
	.cfi_endproc
.LFE388:
	.size	provide_cap, .-provide_cap
	.p2align 4,,15
	.type	create_untypeds_for_region, @function
create_untypeds_for_region:
.LFB396:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	$31, %ebp
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
	movl	68(%esp), %edi
	movl	64(%esp), %ebx
	movl	%eax, 24(%esp)
	movl	%edx, 28(%esp)
	cmpl	%edi, %ebx
	jne	.L1037
	jmp	.L1033
	.p2align 4,,7
	.p2align 3
.L1034:
	movl	$1, %eax
	movl	%esi, %ecx
	sall	%cl, %eax
	addl	%eax, %ebx
	cmpl	%edi, %ebx
	je	.L1033
.L1037:
	movl	%edi, %eax
	movl	%ebp, %esi
	subl	%ebx, %eax
	bsrl	%eax, %eax
	xorl	$31, %eax
	subl	%eax, %esi
	rep bsfl	%ebx, %eax
	cmpl	%eax, %esi
	cmova	%eax, %esi
	movl	ndks_boot+20, %eax
	subl	72(%esp), %eax
	cmpl	$165, %eax
	ja	.L1034
	movl	ndks_boot+16, %edx
	leal	536870912(%ebx), %ecx
	movl	%ecx, 56(%edx,%eax,4)
	movl	%esi, %ecx
	movb	%cl, 720(%edx,%eax)
	movl	%ebx, %eax
	movl	%esi, %edx
	andl	$-16, %eax
	andl	$31, %edx
	orl	$2, %eax
	movl	%eax, 8(%esp)
	movl	24(%esp), %eax
	movl	%edx, 12(%esp)
	movl	28(%esp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	provide_cap
	testl	%eax, %eax
	jne	.L1034
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
.L1033:
	.cfi_restore_state
	addl	$44, %esp
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
	.cfi_endproc
.LFE396:
	.size	create_untypeds_for_region, .-create_untypeds_for_region
	.p2align 4,,15
	.globl	create_frames_of_region
	.type	create_frames_of_region, @function
create_frames_of_region:
.LFB389:
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
	movl	32(%ebp), %ebx
	movl	28(%ebp), %edi
	movl	ndks_boot+20, %eax
	movl	36(%ebp), %esi
	cmpl	%edi, %ebx
	movl	%eax, -40(%ebp)
	jbe	.L1048
	movl	40(%ebp), %eax
	movl	$536870912, -36(%ebp)
	subl	%eax, -36(%ebp)
	jmp	.L1047
	.p2align 4,,7
	.p2align 3
.L1042:
	movl	%edi, %eax
	xorl	%ecx, %ecx
	andl	$-4096, %eax
	shrl	$8, %eax
	orl	$50331649, %eax
.L1043:
	movl	%eax, 8(%esp)
	movl	16(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	provide_cap
	testl	%eax, %eax
	je	.L1050
	addl	$4096, %edi
	cmpl	%edi, %ebx
	jbe	.L1051
.L1047:
	testl	%esi, %esi
	je	.L1042
	movl	-36(%ebp), %edx
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	movl	$0, 24(%esp)
	movl	$1, 20(%esp)
	leal	(%edx,%edi), %ecx
	movl	20(%ebp), %edx
	movl	%ecx, 16(%esp)
	movl	24(%ebp), %ecx
	movl	%edi, 12(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	call	create_mapped_it_frame_cap
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %ecx
	subl	$4, %esp
	jmp	.L1043
	.p2align 4,,7
	.p2align 3
.L1050:
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
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
.L1051:
	.cfi_restore_state
	movl	ndks_boot+20, %eax
.L1041:
	movl	8(%ebp), %esi
	movl	-40(%ebp), %ebx
	movl	%eax, 4(%esi)
	movl	8(%ebp), %eax
	movl	%ebx, (%esi)
	movl	$1, 8(%esi)
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
.L1048:
	.cfi_restore_state
	movl	-40(%ebp), %eax
	jmp	.L1041
	.cfi_endproc
.LFE389:
	.size	create_frames_of_region, .-create_frames_of_region
	.p2align 4,,15
	.globl	create_it_asid_pool
	.type	create_it_asid_pool, @function
create_it_asid_pool:
.LFB390:
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
	movl	$12, (%esp)
	movl	48(%esp), %edi
	movl	52(%esp), %ebx
	movl	56(%esp), %esi
	call	alloc_region
	testl	%eax, %eax
	movl	%eax, %edx
	leal	4096(%eax), %ecx
	je	.L1095
	.p2align 4,,7
	.p2align 3
.L1093:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jne	.L1093
	andl	$-4096, %eax
	movl	%ebx, %ebp
	shrl	$8, %eax
	andl	$14, %ebp
	movl	%ebx, %edx
	orl	$9, %eax
	andl	$15, %edx
	movzbl	%bl, %ecx
	cmpl	$14, %ebp
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L1075
	jmp	*.L1061(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L1061:
	.long	.L1089
	.long	.L1068
	.long	.L1067
	.long	.L1068
	.long	.L1067
	.long	.L1068
	.long	.L1067
	.long	.L1089
	.long	.L1089
	.long	.L1068
	.long	.L1069
	.long	.L1089
	.long	.L1070
	.long	.L1075
	.long	.L1089
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1089
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1071
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1089
	.section	.boot.text
.L1068:
	movl	%ebx, %edx
	andl	$16777200, %edx
	sall	$8, %edx
.L1060:
	movl	%eax, 96(%edx)
	movzbl	%bl, %ecx
	movl	$0, 100(%edx)
	movl	$0, 104(%edx)
	movl	$3, 108(%edx)
	movl	%ebx, %edx
	andl	$15, %edx
	cmpl	$14, %ebp
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L1075
	jmp	*.L1077(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L1077:
	.long	.L1091
	.long	.L1084
	.long	.L1083
	.long	.L1084
	.long	.L1083
	.long	.L1084
	.long	.L1083
	.long	.L1091
	.long	.L1091
	.long	.L1084
	.long	.L1085
	.long	.L1091
	.long	.L1086
	.long	.L1075
	.long	.L1091
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1091
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1087
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1075
	.long	.L1091
	.section	.boot.text
.L1084:
	andl	$16777200, %ebx
	sall	$8, %ebx
.L1076:
	movl	%eax, (%edi)
	movl	%edi, %eax
	movl	$7, 80(%ebx)
	movl	$0, 84(%ebx)
	movl	$0, 88(%ebx)
	movl	$3, 92(%ebx)
	movl	$0, 4(%edi)
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
.L1095:
	.cfi_restore_state
	movl	$0, (%edi)
	movl	%edi, %eax
	movl	$0, 4(%edi)
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
.L1067:
	.cfi_restore_state
	movl	%ebx, %edx
	andl	$-16, %edx
	jmp	.L1060
.L1083:
	andl	$-16, %ebx
	jmp	.L1076
.L1089:
	xorl	%edx, %edx
	jmp	.L1060
.L1086:
	andl	$-1024, %ebx
	jmp	.L1076
.L1069:
	movl	%ebx, %edx
	andl	$2147483632, %edx
	addl	%edx, %edx
	jmp	.L1060
.L1071:
	movl	%ebx, %edx
	andl	$16128, %edx
	shrl	$8, %edx
	cmpl	$32, %edx
	je	.L1090
	leal	1(%edx), %ecx
	movl	$-1, %edx
	sall	%cl, %edx
	andl	%esi, %edx
	jmp	.L1060
.L1070:
	movl	%ebx, %edx
	andl	$-1024, %edx
	jmp	.L1060
.L1087:
	andl	$16128, %ebx
	shrl	$8, %ebx
	cmpl	$32, %ebx
	je	.L1092
	leal	1(%ebx), %ecx
	movl	$-1, %ebx
	sall	%cl, %ebx
	andl	%esi, %ebx
	jmp	.L1076
.L1085:
	andl	$2147483632, %ebx
	addl	%ebx, %ebx
	jmp	.L1076
.L1091:
	xorl	%ebx, %ebx
	jmp	.L1076
.L1075:
	call	halt
.L1092:
	movl	$-16, %ebx
	andl	%esi, %ebx
	jmp	.L1076
.L1090:
	movl	$-16, %edx
	andl	%esi, %edx
	jmp	.L1060
	.cfi_endproc
.LFE390:
	.size	create_it_asid_pool, .-create_it_asid_pool
	.p2align 4,,15
	.globl	create_untypeds
	.type	create_untypeds, @function
create_untypeds:
.LFB397:
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
	xorl	%ebx, %ebx
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	ndks_boot+20, %ebp
	movl	56(%esp), %eax
	movl	60(%esp), %edx
	movl	48(%esp), %esi
	movl	52(%esp), %edi
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	movl	%ebp, 8(%esp)
	movl	%esi, %eax
	movl	%edi, %edx
	call	create_untypeds_for_region
	testl	%eax, %eax
	je	.L1099
.L1104:
	movl	ndks_boot(,%ebx,8), %eax
	movl	ndks_boot+4(,%ebx,8), %edx
	movl	%ebp, 8(%esp)
	movl	$0, ndks_boot(,%ebx,8)
	movl	%eax, (%esp)
	movl	%esi, %eax
	movl	%edx, 4(%esp)
	movl	%edi, %edx
	movl	$0, ndks_boot+4(,%ebx,8)
	call	create_untypeds_for_region
	testl	%eax, %eax
	je	.L1099
	addl	$1, %ebx
	cmpl	$2, %ebx
	jne	.L1104
	movl	ndks_boot+16, %eax
	movl	ndks_boot+20, %edx
	movl	%ebp, 48(%eax)
	movl	%edx, 52(%eax)
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
.L1099:
	.cfi_restore_state
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
.LFE397:
	.size	create_untypeds, .-create_untypeds
	.p2align 4,,15
	.globl	bi_finalise
	.type	bi_finalise, @function
bi_finalise:
.LFB398:
	.cfi_startproc
	movl	ndks_boot+24, %edx
	movl	ndks_boot+16, %eax
	movl	ndks_boot+20, %ecx
	movl	%edx, 20(%eax)
	movl	%ecx, 16(%eax)
	ret
	.cfi_endproc
.LFE398:
	.size	bi_finalise, .-bi_finalise
	.text
	.p2align 4,,15
	.globl	resolveAddressBits
	.type	resolveAddressBits, @function
resolveAddressBits:
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
	jne	.L1124
	movl	44(%esp), %ebx
	movl	%ebp, 4(%esp)
	movl	%eax, 28(%esp)
.L1120:
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
	jne	.L1121
	cmpl	%edx, %ebx
	jb	.L1121
	cmpl	%ebp, %ebx
	jb	.L1125
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
	ja	.L1116
	movl	28(%esp), %eax
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	movl	$0, 8(%eax)
.L1108:
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
.L1124:
	.cfi_restore_state
	movl	$0, current_lookup_fault
.L1123:
	movl	44(%esp), %ebx
	movl	$0, current_lookup_fault+4
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	movl	%ebx, 8(%eax)
	jmp	.L1108
.L1116:
	movl	(%edx), %eax
	movl	4(%edx), %ecx
	movl	%eax, %ebx
	andl	$14, %ebx
	cmpl	$14, %ebx
	movl	%eax, 4(%esp)
	je	.L1117
	movl	%eax, %ebx
	andl	$15, %ebx
.L1118:
	cmpl	$10, %ebx
	jne	.L1119
	movl	%edi, %ebx
	jmp	.L1120
.L1125:
	sall	$8, %ebp
	movl	28(%esp), %eax
	sall	$2, %ebx
	orl	%ebx, %ebp
	orl	$2, %ebp
	movl	%ebp, current_lookup_fault
	jmp	.L1123
.L1121:
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
	jmp	.L1108
.L1117:
	movzbl	4(%esp), %ebx
	jmp	.L1118
.L1119:
	movl	28(%esp), %eax
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	movl	%edi, 8(%eax)
	jmp	.L1108
	.cfi_endproc
.LFE406:
	.size	resolveAddressBits, .-resolveAddressBits
	.p2align 4,,15
	.globl	lookupSlot
	.type	lookupSlot, @function
lookupSlot:
.LFB401:
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
.LFE401:
	.size	lookupSlot, .-lookupSlot
	.p2align 4,,15
	.globl	lookupCap
	.type	lookupCap, @function
lookupCap:
.LFB399:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$24, %esp
	.cfi_offset 3, -12
	movl	16(%ebp), %edx
	leal	-16(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	%eax, (%esp)
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	call	lookupSlot
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	subl	$4, %esp
	testl	%edx, %edx
	jne	.L1132
	movl	(%eax), %edx
	movl	4(%eax), %eax
	movl	$0, (%ebx)
	movl	%edx, 4(%ebx)
	movl	%eax, 8(%ebx)
.L1128:
	movl	%ebx, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
.L1132:
	.cfi_restore_state
	movl	%edx, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	jmp	.L1128
	.cfi_endproc
.LFE399:
	.size	lookupCap, .-lookupCap
	.p2align 4,,15
	.globl	lookupCapAndSlot
	.type	lookupCapAndSlot, @function
lookupCapAndSlot:
.LFB400:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$24, %esp
	.cfi_offset 3, -12
	movl	16(%ebp), %edx
	leal	-16(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	%eax, (%esp)
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	call	lookupSlot
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	subl	$4, %esp
	testl	%edx, %edx
	jne	.L1137
	movl	(%eax), %ecx
	movl	4(%eax), %edx
	movl	$0, (%ebx)
	movl	%eax, 12(%ebx)
	movl	%ecx, 4(%ebx)
	movl	%edx, 8(%ebx)
.L1133:
	movl	%ebx, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
.L1137:
	.cfi_restore_state
	movl	%edx, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	jmp	.L1133
	.cfi_endproc
.LFE400:
	.size	lookupCapAndSlot, .-lookupCapAndSlot
	.p2align 4,,15
	.globl	lookupSlotForCNodeOp
	.type	lookupSlotForCNodeOp, @function
lookupSlotForCNodeOp:
.LFB402:
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
	jne	.L1147
	movl	28(%ebp), %ecx
	leal	-1(%ecx), %edx
	cmpl	$31, %edx
	ja	.L1148
	movl	28(%ebp), %esi
	leal	-24(%ebp), %edx
	movl	24(%ebp), %ecx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	movl	%esi, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%edi, 8(%esp)
	call	resolveAddressBits
	movl	-24(%ebp), %edx
	movl	-16(%ebp), %eax
	subl	$4, %esp
	testl	%edx, %edx
	jne	.L1149
	testl	%eax, %eax
	jne	.L1150
	movl	-20(%ebp), %eax
	movl	$0, (%ebx)
	movl	%eax, 4(%ebx)
.L1138:
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
.L1147:
	.cfi_restore_state
	movl	12(%ebp), %eax
	movl	$6, current_syscall_error+24
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
	movl	%eax, current_syscall_error+20
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	jmp	.L1138
.L1150:
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
	jmp	.L1138
.L1149:
	movl	12(%ebp), %eax
	movl	$6, current_syscall_error+24
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	movl	%eax, current_syscall_error+20
	jmp	.L1138
.L1148:
	movl	$4, current_syscall_error+24
	movl	$1, current_syscall_error+8
	movl	$32, current_syscall_error+12
	movl	$3, (%ebx)
	movl	$0, 4(%ebx)
	jmp	.L1138
	.cfi_endproc
.LFE402:
	.size	lookupSlotForCNodeOp, .-lookupSlotForCNodeOp
	.p2align 4,,15
	.globl	lookupSourceSlot
	.type	lookupSourceSlot, @function
lookupSourceSlot:
.LFB403:
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
.LFE403:
	.size	lookupSourceSlot, .-lookupSourceSlot
	.p2align 4,,15
	.globl	lookupTargetSlot
	.type	lookupTargetSlot, @function
lookupTargetSlot:
.LFB404:
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
.LFE404:
	.size	lookupTargetSlot, .-lookupTargetSlot
	.p2align 4,,15
	.globl	lookupPivotSlot
	.type	lookupPivotSlot, @function
lookupPivotSlot:
.LFB405:
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
.LFE405:
	.size	lookupPivotSlot, .-lookupPivotSlot
	.p2align 4,,15
	.globl	doFaultTransfer
	.type	doFaultTransfer, @function
doFaultTransfer:
.LFB419:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	40(%esp), %ebx
	movl	36(%esp), %esi
	movl	44(%esp), %eax
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	movl	%eax, 8(%esp)
	call	setMRs_fault
	movl	604(%esi), %edx
	andl	$7, %edx
	sall	$12, %edx
	andl	$127, %eax
	orl	%edx, %eax
	movl	%eax, 16(%ebx)
	movl	32(%esp), %eax
	movl	%eax, 4(%ebx)
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
.LFE419:
	.size	doFaultTransfer, .-doFaultTransfer
	.p2align 4,,15
	.globl	doAsyncTransfer
	.type	doAsyncTransfer, @function
doAsyncTransfer:
.LFB421:
	.cfi_startproc
	movl	12(%esp), %eax
	movl	8(%esp), %edx
	movl	$1, 16(%eax)
	movl	%edx, 20(%eax)
	movl	4(%esp), %edx
	movl	%edx, 4(%eax)
	ret
	.cfi_endproc
.LFE421:
	.size	doAsyncTransfer, .-doAsyncTransfer
	.p2align 4,,15
	.globl	switchToIdleThread
	.type	switchToIdleThread, @function
switchToIdleThread:
.LFB426:
	.cfi_startproc
	movl	ksIdleThread, %eax
	movl	%eax, ksCurThread
	ret
	.cfi_endproc
.LFE426:
	.size	switchToIdleThread, .-switchToIdleThread
	.p2align 4,,15
	.globl	cteInsert
	.type	cteInsert, @function
cteInsert:
.LFB452:
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
	je	.L1168
	jbe	.L1183
	cmpl	$6, %edx
	je	.L1168
	cmpl	$30, %edx
	.p2align 4,,5
	jne	.L1164
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
.L1170:
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
	je	.L1184
.L1175:
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
	je	.L1161
	movl	8(%edx), %eax
	andl	$7, %eax
	orl	%esi, %eax
	movl	%eax, 8(%edx)
.L1161:
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
.L1168:
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
	jmp	.L1170
	.p2align 4,,7
	.p2align 3
.L1184:
	movl	%ebx, %ecx
	movzbl	%bl, %ebp
	andl	$15, %ecx
	cmpl	$14, 24(%esp)
	cmove	%ebp, %ecx
	cmpl	$2, %ecx
	jne	.L1175
	movl	%ebx, %ecx
	andl	$-16, %edi
	andl	$-16, %ecx
	cmpl	%ecx, %edi
	jne	.L1175
	movl	4(%esp), %ebp
	movl	20(%esp), %ecx
	andl	$31, %ebp
	andl	$31, %ecx
	cmpl	%ecx, %ebp
	jne	.L1175
	leal	-4(%ebp), %ecx
	movl	$32, %edi
	sall	%cl, %edi
	orl	%ebp, %edi
	movl	%edi, 4(%eax)
	jmp	.L1175
	.p2align 4,,7
	.p2align 3
.L1183:
	cmpl	$2, %edx
	jne	.L1164
	movl	%edi, %ecx
	movl	$1, %ebp
	andl	$14, %ecx
	movl	%ecx, 8(%esp)
	movl	$2, %ecx
	jmp	.L1170
	.p2align 4,,7
	.p2align 3
.L1164:
	movl	%edi, %ecx
	xorl	%ebp, %ebp
	andl	$14, %ecx
	movl	%ecx, 8(%esp)
	xorl	%ecx, %ecx
	jmp	.L1170
	.cfi_endproc
.LFE452:
	.size	cteInsert, .-cteInsert
	.p2align 4,,15
	.globl	invokeCNodeInsert
	.type	invokeCNodeInsert, @function
invokeCNodeInsert:
.LFB447:
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
.LFE447:
	.size	invokeCNodeInsert, .-invokeCNodeInsert
	.p2align 4,,15
	.globl	cteMove
	.type	cteMove, @function
cteMove:
.LFB453:
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
	je	.L1188
	movl	12(%edi), %eax
	movl	%ebx, %edx
	andl	$-8, %edx
	andl	$7, %eax
	orl	%edx, %eax
	movl	%eax, 12(%edi)
.L1188:
	andl	$-8, %esi
	je	.L1187
	movl	8(%esi), %eax
	andl	$-8, %ebx
	andl	$7, %eax
	orl	%ebx, %eax
	movl	%eax, 8(%esi)
.L1187:
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
.LFE453:
	.size	cteMove, .-cteMove
	.p2align 4,,15
	.globl	invokeCNodeMove
	.type	invokeCNodeMove, @function
invokeCNodeMove:
.LFB448:
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
	call	cteMove
	xorl	%eax, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE448:
	.size	invokeCNodeMove, .-invokeCNodeMove
	.p2align 4,,15
	.globl	invokeCNodeSaveCaller
	.type	invokeCNodeSaveCaller, @function
invokeCNodeSaveCaller:
.LFB450:
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
	movl	ksCurThread, %eax
	andl	$-1024, %eax
	movl	48(%eax), %edx
	leal	48(%eax), %ecx
	movl	52(%eax), %edi
	movl	%edx, %esi
	movl	%edx, %eax
	andl	$14, %esi
	andl	$15, %eax
	movzbl	%dl, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %eax
	testl	%eax, %eax
	je	.L1203
	cmpl	$8, %eax
	jne	.L1208
	testl	$1, %edi
	je	.L1210
.L1203:
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
.L1208:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L1210:
	movl	32(%esp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, (%esp)
	movl	%edi, 4(%esp)
	movl	%eax, 12(%esp)
	call	cteMove
	jmp	.L1203
	.cfi_endproc
.LFE450:
	.size	invokeCNodeSaveCaller, .-invokeCNodeSaveCaller
	.p2align 4,,15
	.globl	cteSwap
	.type	cteSwap, @function
cteSwap:
.LFB455:
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
	je	.L1212
	movl	12(%edx), %eax
	movl	%ebx, %ebp
	andl	$-8, %ebp
	andl	$7, %eax
	orl	%ebp, %eax
	movl	%eax, 12(%edx)
.L1212:
	movl	%esi, %edx
	andl	$-8, %edx
	je	.L1213
	movl	8(%edx), %eax
	movl	%ebx, %ebp
	andl	$-8, %ebp
	andl	$7, %eax
	orl	%ebp, %eax
	movl	%eax, 8(%edx)
.L1213:
	movl	8(%ebx), %edx
	movl	12(%ebx), %eax
	movl	%edx, 8(%ecx)
	andl	$-8, %edx
	movl	%eax, 12(%ecx)
	movl	%edi, 8(%ebx)
	movl	%esi, 12(%ebx)
	je	.L1214
	movl	12(%edx), %ebx
	movl	%ecx, %esi
	andl	$-8, %esi
	andl	$7, %ebx
	orl	%esi, %ebx
	movl	%ebx, 12(%edx)
.L1214:
	andl	$-8, %eax
	je	.L1211
	movl	8(%eax), %edx
	andl	$-8, %ecx
	andl	$7, %edx
	orl	%ecx, %edx
	movl	%edx, 8(%eax)
.L1211:
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
.LFE455:
	.size	cteSwap, .-cteSwap
	.p2align 4,,15
	.globl	invokeCNodeRotate
	.type	invokeCNodeRotate, @function
invokeCNodeRotate:
.LFB449:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$24, %esp
	.cfi_def_cfa_offset 36
	movl	52(%esp), %ebx
	movl	60(%esp), %eax
	movl	56(%esp), %esi
	cmpl	%eax, %ebx
	je	.L1233
	movl	48(%esp), %edx
	movl	%eax, 12(%esp)
	movl	44(%esp), %eax
	movl	%esi, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteMove
	movl	36(%esp), %eax
	movl	40(%esp), %edx
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	cteMove
	addl	$24, %esp
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
.L1233:
	.cfi_restore_state
	movl	44(%esp), %eax
	movl	48(%esp), %edx
	movl	%esi, 20(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 12(%esp)
	movl	36(%esp), %eax
	movl	%edx, 16(%esp)
	movl	40(%esp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	cteSwap
	addl	$24, %esp
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
.LFE449:
	.size	invokeCNodeRotate, .-invokeCNodeRotate
	.p2align 4,,15
	.globl	capSwapForDelete
	.type	capSwapForDelete, @function
capSwapForDelete:
.LFB454:
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
	subl	$24, %esp
	.cfi_def_cfa_offset 40
	movl	40(%esp), %ecx
	movl	44(%esp), %ebx
	cmpl	%ebx, %ecx
	je	.L1234
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	movl	%eax, %esi
	movl	(%ebx), %eax
	movl	%edx, %edi
	movl	4(%ebx), %edx
	movl	%ebx, 20(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	movl	%edx, 16(%esp)
	movl	%esi, (%esp)
	movl	%edi, 4(%esp)
	call	cteSwap
.L1234:
	addl	$24, %esp
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
	.cfi_endproc
.LFE454:
	.size	capSwapForDelete, .-capSwapForDelete
	.p2align 4,,15
	.globl	insertNewCap
	.type	insertNewCap, @function
insertNewCap:
.LFB465:
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
	je	.L1240
	movl	8(%ecx), %eax
	andl	$7, %eax
	orl	%esi, %eax
	movl	%eax, 8(%ecx)
.L1240:
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
.LFE465:
	.size	insertNewCap, .-insertNewCap
	.p2align 4,,15
	.globl	setupReplyMaster
	.type	setupReplyMaster, @function
setupReplyMaster:
.LFB466:
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
	jne	.L1242
	andl	$-16, %esi
	orl	$8, %esi
	movl	%esi, 32(%ecx)
	movl	$1, 36(%ecx)
	movl	$0, 40(%ecx)
	movl	$3, 44(%ecx)
.L1242:
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
.LFE466:
	.size	setupReplyMaster, .-setupReplyMaster
	.p2align 4,,15
	.globl	ensureEmptySlot
	.type	ensureEmptySlot, @function
ensureEmptySlot:
.LFB469:
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
	je	.L1250
	movl	$8, current_syscall_error+24
	movb	$3, %al
.L1250:
	rep ret
	.cfi_endproc
.LFE469:
	.size	ensureEmptySlot, .-ensureEmptySlot
	.p2align 4,,15
	.globl	getReceiveSlots
	.type	getReceiveSlots, @function
getReceiveSlots:
.LFB472:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$48, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	12(%ebp), %eax
	testl	%eax, %eax
	je	.L1256
	movl	504(%eax), %ebx
	leal	-20(%ebp), %edx
	movl	508(%eax), %esi
	movl	500(%eax), %eax
	movl	%edx, (%esp)
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	call	lookupCap
	movl	-20(%ebp), %ecx
	subl	$4, %esp
	testl	%ecx, %ecx
	jne	.L1256
	movl	-16(%ebp), %eax
	leal	-32(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	%esi, 20(%esp)
	movl	%ebx, 16(%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	$0, 4(%esp)
	movl	%ecx, (%esp)
	call	lookupSlotForCNodeOp
	movl	-32(%ebp), %edx
	movl	-28(%ebp), %eax
	subl	$4, %esp
	testl	%edx, %edx
	jne	.L1256
	movl	(%eax), %ecx
	movl	%ecx, %ebx
	movl	%ecx, %edx
	andl	$14, %ebx
	andl	$15, %edx
	movzbl	%cl, %ecx
	cmpl	$14, %ebx
	cmove	%ecx, %edx
	testl	%edx, %edx
	jne	.L1256
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.p2align 4,,7
	.p2align 3
.L1256:
	.cfi_restore_state
	leal	-8(%ebp), %esp
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE472:
	.size	getReceiveSlots, .-getReceiveSlots
	.p2align 4,,15
	.globl	loadCapTransfer
	.type	loadCapTransfer, @function
loadCapTransfer:
.LFB473:
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
.LFE473:
	.size	loadCapTransfer, .-loadCapTransfer
	.p2align 4,,15
	.globl	replyFromKernel_error
	.type	replyFromKernel_error, @function
replyFromKernel_error:
.LFB478:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	$1, (%esp)
	movl	%ebx, 4(%esp)
	call	lookupIPCBuffer
	movl	$0, 4(%ebx)
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	setMRs_syscall_error
	movl	current_syscall_error+24, %edx
	sall	$12, %edx
	andl	$127, %eax
	orl	%edx, %eax
	movl	%eax, 16(%ebx)
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE478:
	.size	replyFromKernel_error, .-replyFromKernel_error
	.p2align 4,,15
	.globl	replyFromKernel_success_empty
	.type	replyFromKernel_success_empty, @function
replyFromKernel_success_empty:
.LFB479:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	$0, 4(%eax)
	movl	$0, 16(%eax)
	ret
	.cfi_endproc
.LFE479:
	.size	replyFromKernel_success_empty, .-replyFromKernel_success_empty
	.p2align 4,,15
	.globl	isIRQActive
	.type	isIRQActive, @function
isIRQActive:
.LFB492:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	intStateIRQTable(,%eax,4), %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE492:
	.size	isIRQActive, .-isIRQActive
	.p2align 4,,15
	.globl	getObjectSize
	.type	getObjectSize, @function
getObjectSize:
.LFB494:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	8(%esp), %ecx
	cmpl	$4, %edx
	ja	.L1276
	cmpl	$3, %edx
	ja	.L1269
	cmpl	$2, %edx
	movl	$4, %eax
	jae	.L1270
	cmpl	$1, %edx
	movb	$10, %al
	jne	.L1268
.L1270:
	rep ret
	.p2align 4,,7
	.p2align 3
.L1269:
	cmpl	$4, %edx
	leal	4(%ecx), %eax
	je	.L1270
.L1268:
	movl	%ecx, %eax
	.p2align 4,,3
	ret
	.p2align 4,,7
	.p2align 3
.L1276:
	jmp	Arch_getObjectSize
	.cfi_endproc
.LFE494:
	.size	getObjectSize, .-getObjectSize
	.p2align 4,,15
	.globl	hasRecycleRights
	.type	hasRecycleRights, @function
hasRecycleRights:
.LFB498:
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
	je	.L1281
	jbe	.L1307
	cmpl	$6, %eax
	jne	.L1308
	movl	%esi, %edx
	xorl	%eax, %eax
	andl	$1, %edx
	andl	$2, %esi
	cmovne	%edx, %eax
.L1283:
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
.L1308:
	.cfi_restore_state
	cmpl	$62, %eax
	jne	.L1280
.L1292:
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
.L1307:
	.cfi_restore_state
	testl	%eax, %eax
	je	.L1292
.L1280:
	cmpl	$14, %ecx
	.p2align 4,,3
	je	.L1287
	movl	%edx, %eax
	andl	$15, %eax
	testb	$1, %dl
	je	.L1305
.L1290:
	cmpl	$1, %eax
	jne	.L1305
	andl	$50331648, %edx
	xorl	%eax, %eax
	cmpl	$50331648, %edx
	sete	%al
	jmp	.L1283
	.p2align 4,,7
	.p2align 3
.L1281:
	xorl	%eax, %eax
	testl	$2, %esi
	je	.L1283
	testl	$1, %esi
	je	.L1283
	xorl	%eax, %eax
	andl	$4, %esi
	setne	%al
	jmp	.L1283
	.p2align 4,,7
	.p2align 3
.L1287:
	testb	$1, %dl
	movzbl	%dl, %eax
	jne	.L1290
	.p2align 4,,7
	.p2align 3
.L1305:
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE498:
	.size	hasRecycleRights, .-hasRecycleRights
	.p2align 4,,15
	.globl	sameRegionAs
	.type	sameRegionAs, @function
sameRegionAs:
.LFB499:
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
	movl	48(%esp), %ecx
	movl	52(%esp), %ebx
	movl	56(%esp), %edx
	movl	60(%esp), %esi
	movl	%ecx, %ebp
	movl	%ecx, %eax
	andl	$14, %ebp
	andl	$15, %eax
	movzbl	%cl, %edi
	cmpl	$14, %ebp
	cmove	%edi, %eax
	cmpl	$62, %eax
	ja	.L1312
	jmp	*.L1314(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1314:
	.long	.L1312
	.long	.L1312
	.long	.L1313
	.long	.L1312
	.long	.L1315
	.long	.L1312
	.long	.L1316
	.long	.L1312
	.long	.L1317
	.long	.L1312
	.long	.L1318
	.long	.L1312
	.long	.L1319
	.long	.L1312
	.long	.L1320
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1321
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1312
	.long	.L1322
	.text
	.p2align 4,,7
	.p2align 3
.L1322:
	movl	%edx, %ecx
	xorl	%eax, %eax
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L1409
	.p2align 4,,7
	.p2align 3
.L1362:
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
.L1313:
	.cfi_restore_state
	movl	%edx, %ebp
	andl	$-16, %ecx
	andl	$14, %ebp
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$14, %ebp
	movl	%ecx, 12(%esp)
	movzbl	%dl, %ecx
	cmove	%ecx, %eax
	cmpl	$62, %eax
	ja	.L1341
	jmp	*.L1327(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1327:
	.long	.L1380
	.long	.L1334
	.long	.L1333
	.long	.L1334
	.long	.L1333
	.long	.L1334
	.long	.L1333
	.long	.L1380
	.long	.L1380
	.long	.L1334
	.long	.L1335
	.long	.L1380
	.long	.L1336
	.long	.L1341
	.long	.L1380
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1380
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1337
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1380
	.text
	.p2align 4,,7
	.p2align 3
.L1315:
	movl	%edx, %esi
	movl	%edx, %ebx
	andl	$14, %esi
	andl	$15, %ebx
	movzbl	%dl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$4, %ebx
	jne	.L1362
.L1408:
	andl	$-16, %ecx
	andl	$-16, %edx
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	sete	%al
	jmp	.L1362
	.p2align 4,,7
	.p2align 3
.L1316:
	movl	%edx, %esi
	movl	%edx, %ebx
	andl	$14, %esi
	andl	$15, %ebx
	movzbl	%dl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$6, %ebx
	jne	.L1362
	jmp	.L1408
	.p2align 4,,7
	.p2align 3
.L1317:
	movl	%edx, %esi
	movl	%edx, %ebx
	andl	$14, %esi
	andl	$15, %ebx
	movzbl	%dl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$8, %ebx
	jne	.L1362
	jmp	.L1408
	.p2align 4,,7
	.p2align 3
.L1318:
	movl	%edx, %ebp
	movl	%edx, %edi
	andl	$14, %ebp
	andl	$15, %edi
	movzbl	%dl, %eax
	cmpl	$14, %ebp
	cmove	%eax, %edi
	xorl	%eax, %eax
	cmpl	$10, %edi
	jne	.L1362
	andl	$2147483632, %ecx
	andl	$2147483632, %edx
	cmpl	%ecx, %edx
	jne	.L1362
	andl	$260046848, %ebx
	andl	$260046848, %esi
	xorl	%eax, %eax
	cmpl	%ebx, %esi
	sete	%al
	jmp	.L1362
	.p2align 4,,7
	.p2align 3
.L1319:
	movl	%edx, %esi
	movl	%edx, %ebx
	andl	$14, %esi
	andl	$15, %ebx
	movzbl	%dl, %eax
	cmpl	$14, %esi
	cmove	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$12, %ebx
	jne	.L1362
	jmp	.L1408
	.p2align 4,,7
	.p2align 3
.L1320:
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
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
.L1321:
	.cfi_restore_state
	movl	%edx, %ecx
	xorl	%eax, %eax
	andl	$14, %ecx
	cmpl	$14, %ecx
	jne	.L1362
	cmpb	$30, %dl
	jne	.L1362
	movl	%esi, %eax
	cmpb	%bl, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L1362
	.p2align 4,,7
	.p2align 3
.L1312:
	xorl	%eax, %eax
	testb	$1, %cl
	je	.L1362
	testb	$1, %dl
	je	.L1362
	movl	%esi, 60(%esp)
	movl	%ebx, 52(%esp)
	movl	%edx, 56(%esp)
	movl	%ecx, 48(%esp)
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
.L1334:
	.cfi_restore_state
	movl	%edx, %edi
	andl	$16777200, %edi
	sall	$8, %edi
.L1326:
	movl	%edx, %eax
	movzbl	%dl, %ecx
	andl	$15, %eax
	cmpl	$14, %ebp
	cmove	%ecx, %eax
	cmpl	$62, %eax
	ja	.L1341
	jmp	*.L1343(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1343:
	.long	.L1349
	.long	.L1344
	.long	.L1345
	.long	.L1351
	.long	.L1347
	.long	.L1351
	.long	.L1347
	.long	.L1349
	.long	.L1349
	.long	.L1351
	.long	.L1352
	.long	.L1349
	.long	.L1382
	.long	.L1341
	.long	.L1349
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1349
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1357
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1341
	.long	.L1349
	.text
	.p2align 4,,7
	.p2align 3
.L1349:
	movl	$1, %eax
.L1354:
	cmpl	%edi, 12(%esp)
	ja	.L1385
	testl	%edi, %edi
	je	.L1385
	leal	-1(%edi,%eax), %edx
	movl	%ebx, %ecx
	cmpl	%edi, %edx
	movl	12(%esp), %edi
	setae	%al
	movl	%eax, %esi
	movl	$1, %eax
	sall	%cl, %eax
	leal	-1(%edi,%eax), %eax
	cmpl	%eax, %edx
	setbe	%al
	movzbl	%al, %eax
	andl	%esi, %eax
	jmp	.L1362
	.p2align 4,,7
	.p2align 3
.L1333:
	movl	%edx, %edi
	andl	$-16, %edi
	jmp	.L1326
	.p2align 4,,7
	.p2align 3
.L1351:
	movl	$4096, %eax
	jmp	.L1354
.L1380:
	xorl	%edi, %edi
	jmp	.L1326
.L1336:
	movl	%edx, %edi
	andl	$-1024, %edi
	jmp	.L1326
.L1337:
	movl	%edx, %eax
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L1381
	leal	1(%eax), %ecx
	movl	$-1, %edi
	sall	%cl, %edi
	andl	%esi, %edi
	jmp	.L1326
.L1335:
	movl	%edx, %edi
	andl	$2147483632, %edi
	addl	%edi, %edi
	jmp	.L1326
.L1382:
	movl	$1024, %eax
	jmp	.L1354
.L1345:
	movl	$1, %eax
	movl	%esi, %ecx
	sall	%cl, %eax
	jmp	.L1354
.L1352:
	andl	$260046848, %esi
	movl	$1, %eax
	shrl	$23, %esi
	leal	4(%esi), %ecx
	sall	%cl, %eax
	jmp	.L1354
.L1347:
	movl	$16, %eax
	jmp	.L1354
.L1344:
	shrl	$31, %esi
	testl	%esi, %esi
	je	.L1351
	cmpl	$1, %esi
	jne	.L1341
	movl	$4194304, %eax
	jmp	.L1354
.L1357:
	andl	$16128, %edx
	movl	$1024, %eax
	shrl	$8, %edx
	cmpl	$32, %edx
	je	.L1354
	andl	$31, %edx
	movw	$1, %ax
	leal	4(%edx), %ecx
	sall	%cl, %eax
	jmp	.L1354
	.p2align 4,,7
	.p2align 3
.L1341:
	call	halt
	.p2align 4,,7
	.p2align 3
.L1385:
	xorl	%eax, %eax
	jmp	.L1362
	.p2align 4,,7
	.p2align 3
.L1409:
	xorl	%eax, %eax
	cmpb	$62, %dl
	sete	%al
	jmp	.L1362
.L1381:
	movl	$-16, %edi
	andl	%esi, %edi
	jmp	.L1326
	.cfi_endproc
.LFE499:
	.size	sameRegionAs, .-sameRegionAs
	.p2align 4,,15
	.globl	isMDBParentOf
	.type	isMDBParentOf, @function
isMDBParentOf:
.LFB467:
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
	je	.L1411
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
	je	.L1411
	movl	(%ebx), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$4, %eax
	je	.L1416
	cmpl	$6, %eax
	jne	.L1435
.L1416:
	movl	4(%ebx), %eax
	movl	$1, %edi
	shrl	$3, %eax
	testl	%eax, %eax
	je	.L1411
	movl	4(%esi), %edx
	xorw	%di, %di
	shrl	$3, %edx
	cmpl	%edx, %eax
	je	.L1436
	.p2align 4,,7
	.p2align 3
.L1411:
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
.L1435:
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
.L1436:
	.cfi_restore_state
	movl	12(%esi), %edi
	xorl	$1, %edi
	andl	$1, %edi
	jmp	.L1411
	.cfi_endproc
.LFE467:
	.size	isMDBParentOf, .-isMDBParentOf
	.p2align 4,,15
	.globl	ensureNoChildren
	.type	ensureNoChildren, @function
ensureNoChildren:
.LFB468:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	xorl	%ebx, %ebx
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %edx
	movl	12(%edx), %eax
	andl	$-8, %eax
	je	.L1438
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	isMDBParentOf
	testl	%eax, %eax
	je	.L1438
	movl	$9, current_syscall_error+24
	movb	$3, %bl
.L1438:
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE468:
	.size	ensureNoChildren, .-ensureNoChildren
	.p2align 4,,15
	.globl	deriveCap
	.type	deriveCap, @function
deriveCap:
.LFB495:
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
	movl	16(%ebp), %esi
	movl	8(%ebp), %ebx
	movl	20(%ebp), %edi
	movl	%esi, %eax
	movl	%esi, %edx
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L1445
	movl	%esi, %eax
	andl	$15, %eax
	testl	$1, %esi
	jne	.L1446
.L1450:
	cmpl	$8, %eax
	je	.L1452
	ja	.L1453
	cmpl	$2, %eax
	.p2align 4,,5
	jne	.L1455
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	ensureNoChildren
	xorl	%edx, %edx
	testl	%eax, %eax
	cmovne	%edx, %edi
	cmove	%esi, %edx
.L1451:
	movl	%eax, (%ebx)
	movl	%ebx, %eax
	movl	%edx, 4(%ebx)
	movl	%edi, 8(%ebx)
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
.L1453:
	.cfi_restore_state
	cmpl	$14, %eax
	je	.L1452
	cmpl	$46, %eax
	je	.L1452
.L1455:
	xorl	%eax, %eax
	.p2align 4,,3
	jmp	.L1451
	.p2align 4,,7
	.p2align 3
.L1452:
	xorl	%edi, %edi
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.L1451
	.p2align 4,,7
	.p2align 3
.L1445:
	testl	$1, %esi
	movzbl	%dl, %eax
	je	.L1450
.L1446:
	movl	12(%ebp), %eax
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	Arch_deriveCap
	movl	%ebx, %eax
	subl	$4, %esp
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
	ret	$4
	.cfi_endproc
.LFE495:
	.size	deriveCap, .-deriveCap
	.p2align 4,,15
	.globl	sameObjectAs
	.type	sameObjectAs, @function
sameObjectAs:
.LFB500:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	12(%esp), %eax
	movl	16(%esp), %ebx
	movl	20(%esp), %ecx
	movl	24(%esp), %esi
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L1470
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L1471
.L1472:
	cmpl	$14, %edx
	je	.L1492
.L1473:
	testb	$1, %al
	movl	%ecx, 20(%esp)
	movl	%esi, 24(%esp)
	movl	%eax, 12(%esp)
	movl	%ebx, 16(%esp)
	je	.L1476
	andl	$1, %ecx
	jne	.L1493
.L1476:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	sameRegionAs
	.p2align 4,,7
	.p2align 3
.L1470:
	.cfi_restore_state
	movzbl	%al, %edx
	cmpl	$2, %edx
	jne	.L1472
.L1471:
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
.L1492:
	.cfi_restore_state
	movl	%ecx, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	jne	.L1473
	cmpb	$30, %cl
	je	.L1471
	jmp	.L1473
	.p2align 4,,7
	.p2align 3
.L1493:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.p2align 4,,6
	jmp	Arch_sameObjectAs
	.cfi_endproc
.LFE500:
	.size	sameObjectAs, .-sameObjectAs
	.p2align 4,,15
	.globl	isFinalCapability
	.type	isFinalCapability, @function
isFinalCapability:
.LFB470:
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
	je	.L1495
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
	je	.L1495
.L1496:
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
.L1495:
	.cfi_restore_state
	andl	$-8, %esi
	movl	$1, %eax
	je	.L1496
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
.LFE470:
	.size	isFinalCapability, .-isFinalCapability
	.p2align 4,,15
	.globl	slotCapLongRunningDelete
	.type	slotCapLongRunningDelete, @function
slotCapLongRunningDelete:
.LFB471:
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
	movl	(%edx), %eax
	movl	%eax, %edi
	movl	%eax, %ebx
	andl	$15, %ebx
	andl	$14, %edi
	cmpl	$14, %edi
	movzbl	%al, %esi
	movl	%ebx, %eax
	cmove	%esi, %eax
	xorl	%ebp, %ebp
	testl	%eax, %eax
	je	.L1507
	movl	%edx, (%esp)
	call	isFinalCapability
	testl	%eax, %eax
	je	.L1507
	cmpl	$14, %edi
	cmove	%esi, %ebx
	cmpl	$12, %ebx
	je	.L1510
	cmpl	$46, %ebx
	je	.L1510
	cmpl	$10, %ebx
	je	.L1510
.L1507:
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebp, %eax
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
.L1510:
	.cfi_restore_state
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	movl	$1, %ebp
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	movl	%ebp, %eax
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
.LFE471:
	.size	slotCapLongRunningDelete, .-slotCapLongRunningDelete
	.p2align 4,,15
	.globl	updateCapData
	.type	updateCapData, @function
updateCapData:
.LFB501:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	20(%ebp), %edx
	movl	8(%ebp), %eax
	movl	24(%ebp), %ebx
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L1527
	movl	%edx, %ecx
	andl	$15, %ecx
	testb	$1, %dl
	jne	.L1528
.L1532:
	cmpl	$6, %ecx
	je	.L1534
	cmpl	$10, %ecx
	je	.L1535
	cmpl	$4, %ecx
	.p2align 4,,2
	je	.L1534
	movl	%edx, (%eax)
	movl	%ebx, 4(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1527:
	.cfi_restore_state
	testb	$1, %dl
	movzbl	%dl, %ecx
	je	.L1532
.L1528:
	movl	16(%ebp), %esi
	movl	%eax, (%esp)
	movl	%edx, 12(%esp)
	movl	%ebx, 16(%esp)
	movl	%esi, 8(%esp)
	movl	12(%ebp), %esi
	movl	%eax, -12(%ebp)
	movl	%esi, 4(%esp)
	call	Arch_updateCapData
	movl	-12(%ebp), %eax
	subl	$4, %esp
.L1526:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1534:
	.cfi_restore_state
	movl	12(%ebp), %ecx
	testl	%ecx, %ecx
	jne	.L1537
	movl	%ebx, %ecx
	shrl	$3, %ecx
	testl	%ecx, %ecx
	jne	.L1537
	movl	16(%ebp), %esi
	movl	%edx, (%eax)
	leal	0(,%esi,8), %edx
	orl	%ebx, %edx
	movl	%edx, 4(%eax)
	jmp	.L1526
	.p2align 4,,7
	.p2align 3
.L1537:
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1535:
	.cfi_restore_state
	movl	16(%ebp), %ecx
	movl	%ebx, %esi
	andl	$260046848, %esi
	shrl	$23, %esi
	andl	$248, %ecx
	shrl	$3, %ecx
	addl	%ecx, %esi
	cmpl	$32, %esi
	ja	.L1537
	movl	16(%ebp), %esi
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
	jmp	.L1526
	.cfi_endproc
.LFE501:
	.size	updateCapData, .-updateCapData
	.p2align 4,,15
	.globl	maskCapRights
	.type	maskCapRights, @function
maskCapRights:
.LFB502:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	16(%ebp), %edx
	movl	8(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	%edx, %ebx
	andl	$14, %ebx
	cmpl	$14, %ebx
	je	.L1547
	movl	%edx, %ebx
	andl	$15, %ebx
	testb	$1, %dl
	jne	.L1548
.L1552:
	cmpl	$62, %ebx
	ja	.L1553
	jmp	*.L1555(,%ebx,4)
	.section	.rodata
	.align 4
	.align 4
.L1555:
	.long	.L1554
	.long	.L1553
	.long	.L1554
	.long	.L1553
	.long	.L1556
	.long	.L1553
	.long	.L1557
	.long	.L1553
	.long	.L1554
	.long	.L1553
	.long	.L1554
	.long	.L1553
	.long	.L1554
	.long	.L1553
	.long	.L1554
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1554
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1554
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1553
	.long	.L1554
	.text
	.p2align 4,,7
	.p2align 3
.L1547:
	testb	$1, %dl
	movzbl	%dl, %ebx
	.p2align 4,,2
	je	.L1552
.L1548:
	movl	%ecx, 12(%esp)
	movl	12(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%edx, 8(%esp)
	movl	%eax, -12(%ebp)
	movl	%ecx, 4(%esp)
	call	Arch_maskCapRights
	movl	-12(%ebp), %eax
	movl	-4(%ebp), %ebx
	subl	$4, %esp
	leave
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1557:
	.cfi_restore_state
	movl	%edx, (%eax)
	movl	%ecx, %edx
	andl	$2, %edx
	shrl	%edx
	andl	12(%ebp), %edx
	leal	(%edx,%edx), %ebx
	movl	%ecx, %edx
	andl	$-4, %edx
	orl	%ebx, %edx
	movl	12(%ebp), %ebx
	andl	$2, %ebx
	shrl	%ebx
	andl	%ecx, %ebx
	orl	%ebx, %edx
	movl	-4(%ebp), %ebx
	movl	%edx, 4(%eax)
	leave
	.cfi_remember_state
	.cfi_restore 3
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1554:
	.cfi_restore_state
	movl	%edx, (%eax)
	movl	-4(%ebp), %ebx
	movl	%ecx, 4(%eax)
	leave
	.cfi_remember_state
	.cfi_restore 3
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1556:
	.cfi_restore_state
	movl	%edx, (%eax)
	movl	%ecx, %edx
	andl	$2, %edx
	shrl	%edx
	andl	12(%ebp), %edx
	leal	(%edx,%edx), %ebx
	movl	%ecx, %edx
	andl	$-4, %edx
	orl	%ebx, %edx
	movl	12(%ebp), %ebx
	andl	$2, %ebx
	shrl	%ebx
	andl	%ecx, %ebx
	andl	$4, %ecx
	andl	12(%ebp), %ecx
	orl	%ebx, %edx
	andl	$-5, %edx
	movl	-4(%ebp), %ebx
	orl	%ecx, %edx
	movl	%edx, 4(%eax)
	leave
	.cfi_remember_state
	.cfi_restore 3
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1553:
	.cfi_restore_state
	call	halt
	.cfi_endproc
.LFE502:
	.size	maskCapRights, .-maskCapRights
	.p2align 4,,15
	.globl	createObject
	.type	createObject, @function
createObject:
.LFB503:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	12(%ebp), %esi
	movl	8(%ebp), %eax
	movl	16(%ebp), %ebx
	cmpl	$4, %esi
	ja	.L1582
	cmpl	$2, %esi
	je	.L1565
	jbe	.L1583
	cmpl	$3, %esi
	.p2align 4,,5
	je	.L1568
	cmpl	$4, %esi
	.p2align 4,,5
	jne	.L1564
	movl	20(%ebp), %esi
	movl	$1, %edx
	leal	4(%esi), %ecx
	sall	%cl, %edx
	movl	%ebx, %ecx
	testl	%edx, %edx
	je	.L1573
	.p2align 4,,7
	.p2align 3
.L1578:
	movl	$0, (%ecx)
	addl	$4, %ecx
	subl	$4, %edx
	jne	.L1578
.L1573:
	movl	20(%ebp), %edx
	andl	$-32, %ebx
	shrl	%ebx
	orl	$10, %ebx
	movl	%ebx, (%eax)
	andl	$31, %edx
	sall	$23, %edx
	movl	%edx, 4(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1583:
	.cfi_restore_state
	cmpl	$1, %esi
	movl	%ebx, %edx
	leal	1024(%ebx), %ecx
	jne	.L1564
	.p2align 4,,7
	.p2align 3
.L1577:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jne	.L1577
	addl	$256, %ebx
	movl	%ebx, (%esp)
	movl	%eax, -12(%ebp)
	call	Arch_initContext
	movl	ksCurDomain, %edx
	movl	-12(%ebp), %eax
	movl	$5, 628(%ebx)
	movl	%edx, 620(%ebx)
	andl	$-16, %ebx
	orl	$12, %ebx
	movl	%ebx, (%eax)
	movl	$0, 4(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1582:
	.cfi_restore_state
	movl	20(%ebp), %ecx
	movl	%ebx, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%eax, (%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, -12(%ebp)
	call	Arch_createObject
	movl	-12(%ebp), %eax
	subl	$4, %esp
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1564:
	.cfi_restore_state
	movl	20(%ebp), %edx
	andl	$-16, %ebx
	orl	$2, %ebx
	movl	%ebx, (%eax)
	andl	$31, %edx
	movl	%edx, 4(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1568:
	.cfi_restore_state
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	andl	$-16, %ebx
	orl	$6, %ebx
	movl	%ebx, (%eax)
	movl	$3, 4(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1565:
	.cfi_restore_state
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	andl	$-16, %ebx
	orl	$4, %ebx
	movl	%ebx, (%eax)
	movl	$7, 4(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE503:
	.size	createObject, .-createObject
	.p2align 4,,15
	.globl	createNewObjects
	.type	createNewObjects, @function
createNewObjects:
.LFB504:
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
	movl	24(%ebp), %eax
	movl	%eax, %edi
	movl	%eax, -36(%ebp)
	movl	32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	getObjectSize
	testl	%edi, %edi
	movl	%eax, -40(%ebp)
	je	.L1584
	movl	20(%ebp), %ebx
	xorl	%esi, %esi
	leal	-32(%ebp), %edi
	sall	$4, %ebx
	addl	16(%ebp), %ebx
	.p2align 4,,7
	.p2align 3
.L1587:
	movl	32(%ebp), %eax
	movl	%esi, %edx
	addl	$1, %esi
	movzbl	-40(%ebp), %ecx
	movl	%edi, (%esp)
	movl	%eax, 12(%esp)
	movl	8(%ebp), %eax
	sall	%cl, %edx
	addl	28(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	call	createObject
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edx
	subl	$4, %esp
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%ebx, 4(%esp)
	addl	$16, %ebx
	movl	%edx, 12(%esp)
	movl	%eax, (%esp)
	call	insertNewCap
	cmpl	-36(%ebp), %esi
	jne	.L1587
.L1584:
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
	ret
	.cfi_endproc
.LFE504:
	.size	createNewObjects, .-createNewObjects
	.p2align 4,,15
	.globl	tcbSchedEnqueue
	.type	tcbSchedEnqueue, @function
tcbSchedEnqueue:
.LFB510:
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
	jne	.L1589
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %edi
	movl	4(%esi), %ebx
	testl	%ebx, %ebx
	je	.L1592
	movl	%eax, 644(%edi)
.L1591:
	orl	$1, %ecx
	movl	$0, 644(%eax)
	movl	%edi, 640(%eax)
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ebx, 4(%esi)
	movl	%ecx, 600(%eax)
.L1589:
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
.L1592:
	.cfi_restore_state
	movl	%eax, %ebx
	jmp	.L1591
	.cfi_endproc
.LFE510:
	.size	tcbSchedEnqueue, .-tcbSchedEnqueue
	.p2align 4,,15
	.globl	rescheduleRequired
	.type	rescheduleRequired, @function
rescheduleRequired:
.LFB435:
	.cfi_startproc
	movl	ksSchedulerAction, %eax
	leal	-1(%eax), %edx
	cmpl	$-3, %edx
	jbe	.L1598
	movl	$-1, ksSchedulerAction
	ret
	.p2align 4,,7
	.p2align 3
.L1598:
	subl	$4, %esp
	.cfi_def_cfa_offset 8
	movl	%eax, (%esp)
	call	tcbSchedEnqueue
	movl	$-1, ksSchedulerAction
	addl	$4, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE435:
	.size	rescheduleRequired, .-rescheduleRequired
	.p2align 4,,15
	.globl	scheduleTCB
	.type	scheduleTCB, @function
scheduleTCB:
.LFB433:
	.cfi_startproc
	movl	4(%esp), %eax
	cmpl	ksCurThread, %eax
	je	.L1602
.L1599:
	rep ret
	.p2align 4,,7
	.p2align 3
.L1602:
	movl	ksSchedulerAction, %edx
	testl	%edx, %edx
	jne	.L1599
	movl	592(%eax), %eax
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L1599
	jmp	rescheduleRequired
	.cfi_endproc
.LFE433:
	.size	scheduleTCB, .-scheduleTCB
	.p2align 4,,15
	.globl	setThreadState
	.type	setThreadState, @function
setThreadState:
.LFB432:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	8(%esp), %ecx
	movl	592(%edx), %eax
	andl	$15, %ecx
	andl	$-16, %eax
	orl	%ecx, %eax
	movl	%eax, 592(%edx)
	jmp	scheduleTCB
	.cfi_endproc
.LFE432:
	.size	setThreadState, .-setThreadState
	.p2align 4,,15
	.globl	decodeIA32PortInvocation
	.type	decodeIA32PortInvocation, @function
decodeIA32PortInvocation:
.LFB359:
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
	jne	.L1605
.L1622:
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
.L1605:
	.cfi_restore_state
	movl	32(%esp), %ecx
	movl	ksCurThread, %esi
	subl	$36, %ecx
	cmpl	$5, %ecx
	movl	20(%esi), %ebx
	ja	.L1607
	jmp	*.L1609(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L1609:
	.long	.L1608
	.long	.L1610
	.long	.L1611
	.long	.L1612
	.long	.L1613
	.long	.L1614
	.text
	.p2align 4,,7
	.p2align 3
.L1607:
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
.L1613:
	.cfi_restore_state
	movzwl	%bx, %eax
	movzwl	%dx, %esi
	leal	1(%eax), %ecx
	cmpl	%ecx, %esi
	jb	.L1607
	shrl	$16, %edx
	cmpl	%edx, %eax
	jb	.L1607
	shrl	$16, %ebx
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	out16
.L1625:
	movl	ksCurThread, %edx
	xorl	%eax, %eax
.L1626:
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
.L1614:
	.cfi_restore_state
	cmpl	$1, %eax
	jbe	.L1622
	movzwl	%bx, %ebx
	movzwl	%dx, %ecx
	leal	3(%ebx), %eax
	cmpl	%eax, %ecx
	jb	.L1607
	shrl	$16, %edx
	cmpl	%edx, %ebx
	jb	.L1607
	movl	24(%esi), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	out32
	jmp	.L1625
	.p2align 4,,7
	.p2align 3
.L1608:
	cmpw	%bx, %dx
	movzwl	%bx, %eax
	jb	.L1607
	shrl	$16, %edx
	cmpl	%edx, %eax
	jb	.L1607
	movl	%eax, (%esp)
	call	in8
	movzbl	%al, %eax
.L1624:
	movl	ksCurThread, %edx
	movl	%eax, 20(%edx)
	movl	$1, %eax
	movl	$0, 4(%edx)
	jmp	.L1626
	.p2align 4,,7
	.p2align 3
.L1610:
	movzwl	%bx, %ebx
	movzwl	%dx, %ecx
	leal	1(%ebx), %eax
	cmpl	%eax, %ecx
	jb	.L1607
	shrl	$16, %edx
	cmpl	%edx, %ebx
	jb	.L1607
	movl	%ebx, (%esp)
	call	in16
	movzwl	%ax, %eax
	jmp	.L1624
	.p2align 4,,7
	.p2align 3
.L1611:
	movzwl	%bx, %ebx
	movzwl	%dx, %ecx
	leal	3(%ebx), %eax
	cmpl	%eax, %ecx
	jb	.L1607
	shrl	$16, %edx
	cmpl	%edx, %ebx
	jb	.L1607
	movl	%ebx, (%esp)
	call	in32
	jmp	.L1624
	.p2align 4,,7
	.p2align 3
.L1612:
	cmpw	%bx, %dx
	movzwl	%bx, %eax
	jb	.L1607
	shrl	$16, %edx
	cmpl	%edx, %eax
	jb	.L1607
	shrl	$16, %ebx
	movzbl	%bl, %ebx
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	out8
	jmp	.L1625
	.cfi_endproc
.LFE359:
	.size	decodeIA32PortInvocation, .-decodeIA32PortInvocation
	.p2align 4,,15
	.globl	handleDoubleFault
	.type	handleDoubleFault, @function
handleDoubleFault:
.LFB409:
	.cfi_startproc
	movl	4(%esp), %eax
	andl	$-16, 592(%eax)
	jmp	scheduleTCB
	.cfi_endproc
.LFE409:
	.size	handleDoubleFault, .-handleDoubleFault
	.section	.boot.text
	.p2align 4,,15
	.globl	configureIdleThread
	.type	configureIdleThread, @function
configureIdleThread:
.LFB412:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	592(%eax), %edx
	movl	$514, 64(%eax)
	movl	$idle_thread, 56(%eax)
	movl	$8, 60(%eax)
	andl	$-16, %edx
	orl	$7, %edx
	movl	$16, 28(%eax)
	movl	$16, 32(%eax)
	movl	$16, 36(%eax)
	movl	$16, 40(%eax)
	movl	$16, 72(%eax)
	movl	%edx, 592(%eax)
	jmp	scheduleTCB
	.cfi_endproc
.LFE412:
	.size	configureIdleThread, .-configureIdleThread
	.p2align 4,,15
	.globl	create_idle_thread
	.type	create_idle_thread, @function
create_idle_thread:
.LFB391:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$4, %esp
	.cfi_def_cfa_offset 12
	movl	$10, (%esp)
	call	alloc_region
	movl	%eax, %ebx
	xorl	%eax, %eax
	testl	%ebx, %ebx
	je	.L1637
	movl	%ebx, %edx
	leal	1024(%ebx), %ecx
	.p2align 4,,7
	.p2align 3
.L1639:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jne	.L1639
	addl	$256, %ebx
	movl	%ebx, (%esp)
	movl	%ebx, ksIdleThread
	call	configureIdleThread
	movl	$1, %eax
.L1637:
	addl	$4, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE391:
	.size	create_idle_thread, .-create_idle_thread
	.text
	.p2align 4,,15
	.globl	activateThread
	.type	activateThread, @function
activateThread:
.LFB413:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	ksCurThread, %eax
	movl	592(%eax), %ecx
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L1645
	cmpl	$7, %edx
	je	.L1643
	cmpl	$1, %edx
	je	.L1643
	.p2align 4,,5
	call	halt
	.p2align 4,,7
	.p2align 3
.L1645:
	movl	44(%eax), %edx
	andl	$-16, %ecx
	orl	$1, %ecx
	movl	%ecx, 592(%eax)
	movl	%edx, 56(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
.L1643:
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE413:
	.size	activateThread, .-activateThread
	.p2align 4,,15
	.globl	receiveAsyncIPC
	.type	receiveAsyncIPC, @function
receiveAsyncIPC:
.LFB440:
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
	jbe	.L1657
	cmpl	$2, %eax
	jne	.L1655
	movl	12(%ebx), %edx
	movl	8(%ebx), %eax
	movl	$1, 16(%esi)
	movl	%edx, 20(%esi)
	movl	%eax, 4(%esi)
	andl	$-4, (%ebx)
.L1655:
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
.L1657:
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
	je	.L1660
	movl	%esi, 648(%edi)
.L1659:
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
.L1660:
	.cfi_restore_state
	movl	%esi, %edx
	jmp	.L1659
	.cfi_endproc
.LFE440:
	.size	receiveAsyncIPC, .-receiveAsyncIPC
	.p2align 4,,15
	.globl	asyncIPCCancel
	.type	asyncIPCCancel, @function
asyncIPCCancel:
.LFB442:
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
	je	.L1663
	movl	648(%eax), %ebp
	movl	%ebp, 648(%ecx)
	movl	648(%eax), %ebp
.L1664:
	testl	%ebp, %ebp
	je	.L1668
	movl	%ecx, 652(%ebp)
.L1665:
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
	je	.L1666
.L1670:
	movl	%ecx, (%edx)
	andl	$-16, 592(%eax)
	movl	%eax, 24(%esp)
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
	jmp	scheduleTCB
	.p2align 4,,7
	.p2align 3
.L1666:
	.cfi_restore_state
	andl	$-4, %ecx
	jmp	.L1670
	.p2align 4,,7
	.p2align 3
.L1668:
	movl	%ecx, (%esp)
	jmp	.L1665
	.p2align 4,,7
	.p2align 3
.L1663:
	movl	648(%eax), %ebx
	movl	%ebx, %ebp
	jmp	.L1664
	.cfi_endproc
.LFE442:
	.size	asyncIPCCancel, .-asyncIPCCancel
	.p2align 4,,15
	.globl	decodeIA32MMUInvocation
	.type	decodeIA32MMUInvocation, @function
decodeIA32MMUInvocation:
.LFB344:
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
	movl	32(%ebp), %edi
	movl	36(%ebp), %ecx
	movl	%ebx, %esi
	movzbl	%bl, %edx
	movl	%eax, -60(%ebp)
	andl	$14, %esi
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$14, %esi
	cmove	%edx, %eax
	cmpl	$9, %eax
	ja	.L1674
	jmp	*.L1676(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1676:
	.long	.L1674
	.long	.L1675
	.long	.L1674
	.long	.L1677
	.long	.L1674
	.long	.L1860
	.long	.L1674
	.long	.L1679
	.long	.L1674
	.long	.L1680
	.text
	.p2align 4,,7
	.p2align 3
.L1677:
	cmpl	$27, 8(%ebp)
	je	.L1865
	cmpl	$26, 8(%ebp)
	.p2align 4,,3
	je	.L1709
	.p2align 4,,7
	.p2align 3
.L1860:
	movl	$3, current_syscall_error+24
	movl	$3, %eax
.L1840:
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
.L1680:
	.cfi_restore_state
	cmpl	$35, 8(%ebp)
	jne	.L1860
	testl	%edi, %edi
	je	.L1859
	movl	(%edi), %edx
	movl	4(%edi), %esi
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$5, %eax
	jne	.L1800
	testw	%si, %si
	jne	.L1800
	movzwl	-60(%ebp), %esi
	movl	%esi, %eax
	shrl	$10, %eax
	movl	ia32KSASIDTable(,%eax,4), %eax
	testl	%eax, %eax
	je	.L1866
	andl	$16777200, %ebx
	sall	$8, %ebx
	cmpl	%eax, %ebx
	je	.L1867
.L1803:
	movl	$2, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+4
	jmp	.L1840
	.p2align 4,,7
	.p2align 3
.L1675:
	cmpl	$30, 8(%ebp)
	je	.L1724
	jbe	.L1868
	cmpl	$31, 8(%ebp)
	.p2align 4,,3
	je	.L1727
	cmpl	$33, 8(%ebp)
	.p2align 4,,3
	jne	.L1860
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
	jmp	.L1840
	.p2align 4,,7
	.p2align 3
.L1679:
	cmpl	$34, 8(%ebp)
	jne	.L1860
	cmpl	$1, 12(%ebp)
	jbe	.L1859
	testl	%edi, %edi
	je	.L1859
	testl	%ecx, %ecx
	.p2align 4,,3
	je	.L1859
	movl	ksCurThread, %eax
	movl	4(%ecx), %ebx
	movl	(%ecx), %ecx
	movl	4(%edi), %esi
	movl	20(%eax), %edx
	movl	24(%eax), %eax
	movl	%ebx, -76(%ebp)
	xorl	%ebx, %ebx
	movl	%ecx, -80(%ebp)
	movl	%edx, -64(%ebp)
	movl	(%edi), %edx
	movl	%eax, -68(%ebp)
	jmp	.L1785
	.p2align 4,,7
	.p2align 3
.L1787:
	addl	$1, %ebx
	cmpl	$64, %ebx
	je	.L1805
.L1785:
	movl	ia32KSASIDTable(,%ebx,4), %ecx
	testl	%ecx, %ecx
	jne	.L1787
	movl	%edx, %ecx
	movzbl	%dl, %eax
	andl	$14, %ecx
	movl	%ecx, -60(%ebp)
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$14, -60(%ebp)
	cmovne	%ecx, %eax
	cmpl	$2, %eax
	jne	.L1800
	andl	$31, %esi
	cmpl	$12, %esi
	jne	.L1800
	movl	%edi, (%esp)
	movl	%edx, -60(%ebp)
	call	ensureNoChildren
	testl	%eax, %eax
	jne	.L1840
	movl	-68(%ebp), %ecx
	leal	-56(%ebp), %eax
	movl	-80(%ebp), %edx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	%ecx, 20(%esp)
	movl	-64(%ebp), %ecx
	movl	%edx, 8(%esp)
	movl	%ecx, 16(%esp)
	movl	-76(%ebp), %ecx
	movl	%ecx, 12(%esp)
	call	lookupSlotForCNodeOp
	movl	-52(%ebp), %ecx
	pushl	%eax
	movl	-56(%ebp), %eax
	testl	%eax, %eax
	jne	.L1840
	movl	(%ecx), %eax
	movl	-60(%ebp), %edx
	movl	%eax, %esi
	andl	$14, %esi
	cmpl	$14, %esi
	je	.L1792
	andl	$15, %eax
.L1793:
	testl	%eax, %eax
	jne	.L1805
	movl	ksCurThread, %eax
	movl	%edx, %esi
	movl	%ecx, -68(%ebp)
	movl	ksCurThread, %ecx
	andl	$-16, %esi
	movl	%edx, -64(%ebp)
	movl	592(%eax), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%ecx)
	movl	%ecx, (%esp)
	call	scheduleTCB
	movl	-64(%ebp), %edx
	leal	4096(%esi), %eax
	movl	-68(%ebp), %ecx
	movl	%eax, -60(%ebp)
	movl	%esi, %eax
.L1810:
	movl	$0, (%eax)
	addl	$4, %eax
	cmpl	-60(%ebp), %eax
	jne	.L1810
	movl	%edx, %eax
	andl	$-4096, %eax
	shrl	$8, %eax
	orl	$9, %eax
	sall	$10, %ebx
	movl	%eax, (%esp)
	movl	%ebx, 4(%esp)
	shrl	$10, %ebx
	movl	%ecx, 12(%esp)
	movl	%edi, 8(%esp)
	call	cteInsert
	xorl	%eax, %eax
	movl	%esi, ia32KSASIDTable(,%ebx,4)
	jmp	.L1840
	.p2align 4,,7
	.p2align 3
.L1674:
	call	halt
	.p2align 4,,7
	.p2align 3
.L1868:
	cmpl	$29, 8(%ebp)
	jne	.L1860
	cmpl	$2, 12(%ebp)
	jbe	.L1859
	testl	%edi, %edi
	je	.L1859
	movl	ksCurThread, %eax
	movl	%ebx, %edx
	shrl	$26, %edx
	sall	$10, %edx
	movl	20(%eax), %ecx
	movl	24(%eax), %eax
	movl	%ecx, -64(%ebp)
	movl	(%edi), %ecx
	movl	%eax, -68(%ebp)
	movl	44(%ebp), %eax
	movl	4(%edi), %edi
	movl	12(%eax), %eax
	movl	%eax, -80(%ebp)
	movl	-60(%ebp), %eax
	andl	$1072693248, %eax
	shrl	$20, %eax
	addl	%edx, %eax
	jne	.L1803
	movl	%ecx, %esi
	movl	%ecx, %eax
	andl	$14, %esi
	andl	$15, %eax
	movzbl	%cl, %edx
	cmpl	$14, %esi
	cmove	%edx, %eax
	cmpl	$5, %eax
	je	.L1869
	.p2align 4,,7
	.p2align 3
.L1800:
	movl	$2, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error+4
	jmp	.L1840
	.p2align 4,,7
	.p2align 3
.L1709:
	cmpl	$1, 12(%ebp)
	jbe	.L1859
	testl	%edi, %edi
	je	.L1859
	testl	$67108864, -60(%ebp)
	jne	.L1803
	movl	ksCurThread, %eax
	movl	(%edi), %esi
	movl	4(%edi), %edx
	movl	20(%eax), %ecx
	movl	24(%eax), %eax
	movl	%esi, %edi
	andl	$14, %edi
	movl	%ecx, -64(%ebp)
	movl	%esi, %ecx
	movl	%eax, -68(%ebp)
	movl	%esi, %eax
	movzbl	%cl, %ecx
	andl	$15, %eax
	cmpl	$14, %edi
	cmove	%ecx, %eax
	cmpl	$5, %eax
	jne	.L1800
	testl	$65536, %edx
	je	.L1800
	cmpl	$-536870913, -64(%ebp)
	jbe	.L1717
.L1743:
	movl	$1, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error
	jmp	.L1840
	.p2align 4,,7
	.p2align 3
.L1859:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
	jmp	.L1840
	.p2align 4,,7
	.p2align 3
.L1865:
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	isFinalCapability
	testl	%eax, %eax
	jne	.L1683
	movl	$9, current_syscall_error+24
	movb	$3, %al
	jmp	.L1840
	.p2align 4,,7
	.p2align 3
.L1727:
	movl	-60(%ebp), %edx
	movl	%ebx, %eax
	shrl	$26, %eax
	sall	$10, %eax
	andl	$1072693248, %edx
	shrl	$20, %edx
	addl	%edx, %eax
	je	.L1780
	movl	-60(%ebp), %ecx
	andl	$16777200, %ebx
	movl	%eax, 4(%esp)
	sall	$8, %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, %edx
	movl	%ecx, %eax
	sall	$12, %edx
	shrl	$31, %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	unmapPage
.L1780:
	movl	20(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	4(%eax), %eax
	andl	$67108863, (%ecx)
	andl	$-1073741824, %eax
	movl	%eax, 4(%ecx)
.L1861:
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	xorl	%eax, %eax
	jmp	.L1840
	.p2align 4,,7
	.p2align 3
.L1724:
	cmpl	$1, 12(%ebp)
	jbe	.L1859
	testl	%edi, %edi
	.p2align 4,,3
	je	.L1859
	movl	ksCurThread, %eax
	movl	20(%eax), %ecx
	movl	24(%eax), %eax
	movl	%ecx, -64(%ebp)
	movl	(%edi), %ecx
	movl	%eax, -68(%ebp)
	movl	4(%edi), %edi
	movl	%ecx, %esi
	movl	%ecx, %eax
	andl	$14, %esi
	andl	$15, %eax
	movzbl	%cl, %edx
	cmpl	$14, %esi
	cmove	%edx, %eax
	cmpl	$5, %eax
	jne	.L1800
	testl	$65536, %edi
	je	.L1800
	movl	-60(%ebp), %edx
	movl	%ebx, %eax
	shrl	$26, %eax
	sall	$10, %eax
	andl	$1072693248, %edx
	shrl	$20, %edx
	addl	%eax, %edx
	movl	%edx, %esi
	je	.L1803
	movzwl	%di, %edi
	leal	-32(%ebp), %eax
	movl	%edi, %edx
	movl	%ecx, -80(%ebp)
	call	findPDForASID
	movl	-28(%ebp), %eax
	cmpl	$0, -32(%ebp)
	movl	-80(%ebp), %ecx
	jne	.L1864
	andl	$16777200, %ecx
	movl	%ecx, %edx
	sall	$8, %edx
	cmpl	%eax, %edx
	je	.L1870
.L1768:
	movl	$2, current_syscall_error+24
	movl	$1, current_syscall_error+4
.L1858:
	movl	$3, %eax
	jmp	.L1840
.L1683:
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	testl	$67108864, -60(%ebp)
	jne	.L1685
.L1707:
	movl	20(%ebp), %eax
	andl	$-67108865, 4(%eax)
	xorl	%eax, %eax
	jmp	.L1840
.L1805:
	movl	$8, current_syscall_error+24
	jmp	.L1858
.L1685:
	movl	-60(%ebp), %ecx
	movl	%ebx, %edi
	andl	$16777200, %edi
	sall	$8, %edi
	movl	%edi, 8(%esp)
	movl	%ecx, %eax
	sall	$22, %eax
	movl	%eax, 4(%esp)
	movl	%ecx, %eax
	andl	$67107840, %eax
	shrl	$10, %eax
	movl	%eax, (%esp)
	call	unmapPageTable
	movl	%ebx, %eax
	movzbl	%bl, %edx
	andl	$15, %eax
	cmpl	$14, %esi
	cmove	%edx, %eax
	cmpl	$62, %eax
	ja	.L1674
	jmp	*.L1690(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1690:
	.long	.L1695
	.long	.L1691
	.long	.L1692
	.long	.L1813
	.long	.L1812
	.long	.L1813
	.long	.L1812
	.long	.L1695
	.long	.L1695
	.long	.L1813
	.long	.L1697
	.long	.L1695
	.long	.L1815
	.long	.L1674
	.long	.L1695
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1695
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1702
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1674
	.long	.L1695
	.text
.L1695:
	xorl	%ecx, %ecx
.L1694:
	movl	$1, %eax
	sall	%cl, %eax
	.p2align 4,,7
	.p2align 3
.L1708:
	movl	$0, (%edi)
	addl	$4, %edi
	subl	$4, %eax
	jne	.L1708
	jmp	.L1707
.L1813:
	movl	$12, %ecx
	jmp	.L1694
.L1815:
	movl	$10, %ecx
	jmp	.L1694
.L1697:
	movl	-60(%ebp), %ecx
	andl	$260046848, %ecx
	shrl	$23, %ecx
	addl	$4, %ecx
.L1704:
	movl	$1, %eax
	sall	%cl, %eax
	testl	%eax, %eax
	je	.L1707
	jmp	.L1708
.L1702:
	andl	$16128, %ebx
	shrl	$8, %ebx
	cmpl	$32, %ebx
	je	.L1815
	movl	%ebx, %ecx
	andl	$31, %ecx
	addl	$4, %ecx
	jmp	.L1704
.L1692:
	movl	-60(%ebp), %ecx
	andl	$31, %ecx
	jmp	.L1704
.L1691:
	movl	-60(%ebp), %eax
	shrl	$31, %eax
	testl	%eax, %eax
	je	.L1813
	subl	$1, %eax
	jne	.L1674
	movl	$22, %ecx
	jmp	.L1694
.L1812:
	movl	$4, %ecx
	jmp	.L1694
.L1869:
	testl	$65536, %edi
	je	.L1800
	movzwl	%di, %eax
	movl	%eax, -88(%ebp)
	movl	%eax, %edx
	leal	-32(%ebp), %eax
	movl	%ecx, -72(%ebp)
	call	findPDForASID
	movl	-28(%ebp), %eax
	cmpl	$0, -32(%ebp)
	movl	-72(%ebp), %ecx
	jne	.L1864
	andl	$16777200, %ecx
	movl	%ecx, -72(%ebp)
	sall	$8, -72(%ebp)
	cmpl	%eax, -72(%ebp)
	jne	.L1768
	movl	-60(%ebp), %eax
	shrl	$31, %eax
	testl	%eax, %eax
	je	.L1741
	cmpl	$1, %eax
	jne	.L1674
	movl	$22, %ecx
.L1742:
	movl	$1, %edx
	sall	%cl, %edx
	addl	-64(%ebp), %edx
	cmpl	$-536870912, %edx
	ja	.L1743
	movl	%ebx, %edx
	andl	$50331648, %edx
	shrl	$24, %edx
	cmpl	$2, %edx
	je	.L1871
	cmpl	$3, %edx
	movl	$1, %esi
	je	.L1872
.L1746:
	testl	%eax, %eax
	je	.L1748
	cmpl	$1, %eax
	jne	.L1674
	movl	$22, %ecx
.L1749:
	movl	$1, %edx
	sall	%cl, %edx
	subl	$1, %edx
	testl	%edx, -64(%ebp)
	jne	.L1775
	movl	%ebx, %edx
	andl	$67108863, %ebx
	andl	$16777200, %edx
	andl	$1023, %edi
	sall	$8, %edx
	leal	536870912(%edx), %ecx
	movl	-64(%ebp), %edx
	movl	%ecx, -84(%ebp)
	movl	-88(%ebp), %ecx
	sall	$20, %edi
	shrl	$12, %edx
	shrl	$10, %ecx
	movl	%ecx, -68(%ebp)
	sall	$26, -68(%ebp)
	orl	%ebx, -68(%ebp)
	movl	-60(%ebp), %ebx
	andl	$-1073741824, %ebx
	orl	%edi, %ebx
	orl	%edx, %ebx
	testl	%eax, %eax
	je	.L1752
	subl	$1, %eax
	jne	.L1674
	movl	-64(%ebp), %eax
	movl	-72(%ebp), %edi
	shrl	$22, %eax
	leal	(%edi,%eax,4), %eax
	movl	(%eax), %edx
	testb	$-128, %dl
	jne	.L1756
	andb	$1, %dl
	jne	.L1805
.L1756:
	movl	-80(%ebp), %ecx
	movl	-84(%ebp), %edx
	movl	%esi, (%esp)
	call	makeUserPDE
	movl	20(%ebp), %eax
	movl	-68(%ebp), %edi
	movl	%ebx, 4(%eax)
	movl	%edi, (%eax)
	jmp	.L1861
.L1864:
	movl	$6, current_syscall_error+24
	movl	$0, current_syscall_error+20
	jmp	.L1858
.L1866:
	movl	$6, current_syscall_error+24
	movb	$3, %al
	movl	$0, current_syscall_error+20
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
	jmp	.L1840
.L1870:
	cmpl	%esi, %edi
	jne	.L1768
	movl	-60(%ebp), %esi
	movl	%ebx, %eax
	andl	$16777200, %ebx
	andl	$50331648, %eax
	shrl	$24, %eax
	sall	$8, %ebx
	shrl	$31, %esi
	cmpl	$2, %eax
	leal	536870912(%ebx), %edi
	je	.L1873
	cmpl	$3, %eax
	movl	$1, %ebx
	je	.L1874
.L1771:
	movl	-60(%ebp), %ecx
	sall	$12, %ecx
	testl	%esi, %esi
	je	.L1773
	subl	$1, %esi
	jne	.L1674
	testl	$4190208, %ecx
	je	.L1875
.L1775:
	movl	$5, current_syscall_error+24
	movl	$3, %eax
	jmp	.L1840
.L1867:
	xorl	%eax, %eax
	jmp	.L1804
	.p2align 4,,7
	.p2align 3
.L1806:
	addl	$1, %eax
	addl	$1, %esi
	cmpl	$1024, %eax
	je	.L1805
.L1804:
	testl	%esi, %esi
	je	.L1806
	cmpl	$0, (%ebx,%eax,4)
	jne	.L1806
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	movl	4(%edi), %eax
	movzwl	%si, %edx
	andl	$1023, %esi
	andl	$-131072, %eax
	orl	%edx, %eax
	orl	$65536, %eax
	movl	%eax, 4(%edi)
	movl	(%edi), %eax
	andl	$16777200, %eax
	sall	$8, %eax
	movl	%eax, (%ebx,%esi,4)
	xorl	%eax, %eax
	jmp	.L1840
.L1875:
	shrl	$22, %ecx
	leal	(%edx,%ecx,4), %eax
	movl	(%eax), %edx
	testb	$-128, %dl
	jne	.L1779
	andb	$1, %dl
	jne	.L1805
.L1779:
	movl	-68(%ebp), %ecx
	movl	%edi, %edx
	movl	%ebx, (%esp)
	call	makeUserPDE
	jmp	.L1861
.L1873:
	movl	-64(%ebp), %eax
	andl	$2, %eax
	shrl	%eax
	cmpl	$1, %eax
	sbbl	%ebx, %ebx
	addl	$2, %ebx
	jmp	.L1771
.L1773:
	leal	-40(%ebp), %eax
	call	lookupPTSlot
	movl	-36(%ebp), %esi
	cmpl	$0, -40(%ebp)
	je	.L1777
.L1862:
	movl	$6, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+20
	jmp	.L1840
.L1874:
	testb	$2, -64(%ebp)
	je	.L1771
	movl	-64(%ebp), %eax
	andl	$1, %eax
	cmpl	$1, %eax
	sbbl	%ebx, %ebx
	addl	$3, %ebx
	jmp	.L1771
.L1777:
	movl	-68(%ebp), %ecx
	leal	-44(%ebp), %eax
	movl	%edi, %edx
	movl	%ebx, (%esp)
	call	makeUserPTE
	movl	-44(%ebp), %eax
	movl	%eax, (%esi)
	jmp	.L1861
.L1752:
	movl	-64(%ebp), %ecx
	leal	-40(%ebp), %eax
	movl	-72(%ebp), %edx
	call	lookupPTSlot
	movl	-36(%ebp), %edi
	cmpl	$0, -40(%ebp)
	jne	.L1862
	movl	-80(%ebp), %ecx
	leal	-44(%ebp), %eax
	movl	-84(%ebp), %edx
	movl	%esi, (%esp)
	call	makeUserPTE
	movl	20(%ebp), %eax
	movl	-68(%ebp), %ecx
	movl	%ebx, 4(%eax)
	movl	%ecx, (%eax)
	movl	-44(%ebp), %eax
	movl	%eax, (%edi)
	jmp	.L1861
.L1748:
	movl	$12, %ecx
	jmp	.L1749
.L1872:
	testb	$2, -68(%ebp)
	je	.L1746
	movl	-68(%ebp), %edx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	%esi, %esi
	addl	$3, %esi
	jmp	.L1746
.L1871:
	movl	-68(%ebp), %edx
	andl	$2, %edx
	shrl	%edx
	cmpl	$1, %edx
	sbbl	%esi, %esi
	addl	$2, %esi
	jmp	.L1746
.L1741:
	movl	$12, %ecx
	jmp	.L1742
.L1717:
	movzwl	%dx, %edi
	leal	-32(%ebp), %eax
	movl	%edi, %edx
	call	findPDForASID
	movl	-28(%ebp), %eax
	cmpl	$0, -32(%ebp)
	jne	.L1864
	andl	$16777200, %esi
	sall	$8, %esi
	cmpl	%eax, %esi
	jne	.L1768
	movl	-64(%ebp), %eax
	shrl	$22, %eax
	leal	(%esi,%eax,4), %edx
	testb	$1, (%edx)
	jne	.L1805
	movl	20(%ebp), %ecx
	sall	$10, %edi
	movl	%ebx, (%ecx)
	movl	-60(%ebp), %ecx
	andl	$16777200, %ebx
	sall	$8, %ebx
	addl	$536870912, %ebx
	andl	$-134216705, %ecx
	orl	$67108864, %ecx
	orl	%edi, %ecx
	andl	$-1024, %ecx
	orl	%eax, %ecx
	movl	20(%ebp), %eax
	movl	%ecx, 4(%eax)
	movl	-68(%ebp), %ecx
	movl	%ecx, %eax
	andl	$2, %ecx
	andl	$1, %eax
	sall	$3, %eax
	shrl	%ecx
	orl	$7, %eax
	sall	$4, %ecx
	orl	%ecx, %eax
	orl	%ebx, %eax
	movl	%eax, (%edx)
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%edx)
	movl	%edx, (%esp)
	call	scheduleTCB
	call	invalidatePageStructureCache
	xorl	%eax, %eax
	jmp	.L1840
.L1792:
	movzbl	%al, %eax
	.p2align 4,,3
	jmp	.L1793
	.cfi_endproc
.LFE344:
	.size	decodeIA32MMUInvocation, .-decodeIA32MMUInvocation
	.p2align 4,,15
	.globl	Arch_decodeInvocation
	.type	Arch_decodeInvocation, @function
Arch_decodeInvocation:
.LFB371:
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
	jbe	.L1884
.L1879:
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
.L1884:
	.cfi_restore_state
	movl	$1, %edx
	sall	%cl, %edx
	testb	$21, %dl
	jne	.L1881
	testl	$320, %edx
	jne	.L1881
	andb	$4, %dh
	je	.L1879
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
.L1881:
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
.LFE371:
	.size	Arch_decodeInvocation, .-Arch_decodeInvocation
	.p2align 4,,15
	.type	possibleSwitchTo, @function
possibleSwitchTo:
.LFB429:
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
	movl	ksCurThread, %ecx
	movl	ksCurDomain, %edi
	cmpl	%edi, 620(%eax)
	movl	624(%eax), %esi
	movl	624(%ecx), %ecx
	movl	ksSchedulerAction, %ebx
	jne	.L1897
	cmpl	%esi, %ecx
	jae	.L1898
.L1888:
	testl	%ebx, %ebx
	je	.L1899
.L1889:
	movl	%eax, (%esp)
	subl	$1, %ebx
	call	tcbSchedEnqueue
	cmpl	$-3, %ebx
	jbe	.L1900
.L1885:
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
.L1898:
	.cfi_restore_state
	testl	%edx, %edx
	je	.L1889
	cmpl	%ecx, %esi
	.p2align 4,,2
	jne	.L1889
	.p2align 4,,7
	jmp	.L1888
	.p2align 4,,7
	.p2align 3
.L1897:
	movl	%eax, (%esp)
	.p2align 4,,6
	call	tcbSchedEnqueue
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
.L1900:
	.cfi_restore_state
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
	jmp	rescheduleRequired
	.p2align 4,,7
	.p2align 3
.L1899:
	.cfi_restore_state
	movl	%eax, ksSchedulerAction
	jmp	.L1885
	.cfi_endproc
.LFE429:
	.size	possibleSwitchTo, .-possibleSwitchTo
	.p2align 4,,15
	.globl	attemptSwitchTo
	.type	attemptSwitchTo, @function
attemptSwitchTo:
.LFB430:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	$1, %edx
	jmp	possibleSwitchTo
	.cfi_endproc
.LFE430:
	.size	attemptSwitchTo, .-attemptSwitchTo
	.p2align 4,,15
	.globl	switchIfRequiredTo
	.type	switchIfRequiredTo, @function
switchIfRequiredTo:
.LFB431:
	.cfi_startproc
	movl	4(%esp), %eax
	xorl	%edx, %edx
	jmp	possibleSwitchTo
	.cfi_endproc
.LFE431:
	.size	switchIfRequiredTo, .-switchIfRequiredTo
	.p2align 4,,15
	.globl	sendAsyncIPC
	.type	sendAsyncIPC, @function
sendAsyncIPC:
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
	subl	$16, %esp
	.cfi_def_cfa_offset 36
	movl	36(%esp), %edx
	movl	40(%esp), %esi
	movl	44(%esp), %edi
	movl	(%edx), %eax
	movl	%eax, %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	je	.L1905
	jb	.L1906
	cmpl	$2, %ecx
	jne	.L1903
	orl	12(%edx), %edi
	orl	%esi, 8(%edx)
	movl	%edi, 12(%edx)
.L1903:
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
.L1906:
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
.L1905:
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
	je	.L1908
	movl	%ebp, 648(%ecx)
	movl	648(%ebx), %ebp
	movl	%ebx, 4(%esp)
.L1909:
	testl	%ebp, %ebp
	je	.L1913
	movl	%ecx, 652(%ebp)
.L1910:
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
	je	.L1911
.L1915:
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
.L1911:
	.cfi_restore_state
	andl	$-4, %ecx
	jmp	.L1915
	.p2align 4,,7
	.p2align 3
.L1913:
	movl	%ecx, 8(%esp)
	jmp	.L1910
	.p2align 4,,7
	.p2align 3
.L1908:
	movl	%ebp, 4(%esp)
	jmp	.L1909
	.cfi_endproc
.LFE439:
	.size	sendAsyncIPC, .-sendAsyncIPC
	.p2align 4,,15
	.globl	performInvocation_AsyncEndpoint
	.type	performInvocation_AsyncEndpoint, @function
performInvocation_AsyncEndpoint:
.LFB507:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	24(%esp), %eax
	movl	%eax, 8(%esp)
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	call	sendAsyncIPC
	xorl	%eax, %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE507:
	.size	performInvocation_AsyncEndpoint, .-performInvocation_AsyncEndpoint
	.p2align 4,,15
	.globl	aepCancelAll
	.type	aepCancelAll, @function
aepCancelAll:
.LFB441:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$4, %esp
	.cfi_def_cfa_offset 12
	movl	12(%esp), %eax
	movl	(%eax), %edx
	movl	%edx, %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	je	.L1928
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1928:
	.cfi_restore_state
	movl	4(%eax), %ebx
	andl	$12, %edx
	movl	%edx, (%eax)
	movl	%ebx, %ecx
	andl	$15, %ecx
	andl	$-16, %ebx
	movl	%ecx, 4(%eax)
	je	.L1921
	.p2align 4,,7
	.p2align 3
.L1925:
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	%ebx, (%esp)
	call	tcbSchedEnqueue
	movl	648(%ebx), %ebx
	testl	%ebx, %ebx
	jne	.L1925
.L1921:
	addl	$4, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	jmp	rescheduleRequired
	.cfi_endproc
.LFE441:
	.size	aepCancelAll, .-aepCancelAll
	.p2align 4,,15
	.globl	epCancelAll
	.type	epCancelAll, @function
epCancelAll:
.LFB481:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$4, %esp
	.cfi_def_cfa_offset 12
	movl	12(%esp), %eax
	movl	(%eax), %edx
	testb	$3, %dl
	je	.L1929
	movl	4(%eax), %ebx
	andl	$12, %edx
	movl	%edx, (%eax)
	movl	%ebx, %ecx
	andl	$15, %ecx
	andl	$-16, %ebx
	movl	%ecx, 4(%eax)
	je	.L1933
	.p2align 4,,7
	.p2align 3
.L1937:
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	%ebx, (%esp)
	call	tcbSchedEnqueue
	movl	648(%ebx), %ebx
	testl	%ebx, %ebx
	jne	.L1937
.L1933:
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	jmp	rescheduleRequired
	.p2align 4,,7
	.p2align 3
.L1929:
	.cfi_restore_state
	addl	$4, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE481:
	.size	epCancelAll, .-epCancelAll
	.p2align 4,,15
	.globl	epCancelBadgedSends
	.type	epCancelBadgedSends, @function
epCancelBadgedSends:
.LFB482:
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
	movl	52(%esp), %edi
	movl	(%eax), %edx
	movl	%edx, %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	je	.L1942
	jb	.L1940
	cmpl	$2, %ecx
	je	.L1940
	.p2align 4,,8
	call	halt
	.p2align 4,,7
	.p2align 3
.L1940:
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
.L1942:
	.cfi_restore_state
	movl	4(%eax), %ebx
	movl	%edx, %ecx
	andl	$12, %edx
	andl	$-16, %ecx
	movl	%ecx, %ebp
	movl	%edx, (%eax)
	movl	%ebx, %esi
	andl	$15, %esi
	andl	$-16, %ebx
	movl	%esi, 4(%eax)
	je	.L1944
	movl	%ebp, 8(%esp)
	movl	%edi, %ebp
	movl	%ebx, %edi
	movl	%eax, 12(%esp)
	jmp	.L1949
	.p2align 4,,7
	.p2align 3
.L1945:
	testl	%esi, %esi
	je	.L1948
.L1960:
	movl	%esi, %ebx
.L1949:
	movl	600(%ebx), %edx
	movl	648(%ebx), %esi
	shrl	$3, %edx
	cmpl	%edx, %ebp
	jne	.L1945
	movl	592(%ebx), %edx
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	%ebx, (%esp)
	call	tcbSchedEnqueue
	movl	652(%ebx), %edx
	testl	%edx, %edx
	je	.L1946
	movl	648(%ebx), %eax
	movl	%eax, 648(%edx)
	movl	648(%ebx), %ebx
.L1947:
	testl	%ebx, %ebx
	je	.L1953
	testl	%esi, %esi
	movl	%edx, 652(%ebx)
	jne	.L1960
	.p2align 4,,7
	.p2align 3
.L1948:
	movl	12(%esp), %eax
	movl	%edi, %ebx
	movl	8(%esp), %ebp
	andl	$-16, %ebx
	movl	4(%eax), %esi
	movl	(%eax), %edx
	andl	$-16, %ebp
	andl	$15, %esi
	andl	$15, %edx
	orl	%esi, %ebx
	orl	%edx, %ebp
	testl	%edi, %edi
	movl	%ebx, 4(%eax)
	je	.L1959
	andl	$-4, %ebp
	orl	$1, %ebp
.L1959:
	movl	%ebp, (%eax)
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
	jmp	rescheduleRequired
	.p2align 4,,7
	.p2align 3
.L1946:
	.cfi_restore_state
	movl	648(%ebx), %edi
	movl	%edi, %ebx
	jmp	.L1947
	.p2align 4,,7
	.p2align 3
.L1953:
	movl	%edx, 8(%esp)
	jmp	.L1945
.L1944:
	orl	%edx, %ecx
	movl	%esi, 4(%eax)
	movl	%ecx, %ebp
	jmp	.L1959
	.cfi_endproc
.LFE482:
	.size	epCancelBadgedSends, .-epCancelBadgedSends
	.p2align 4,,15
	.globl	recycleCap
	.type	recycleCap, @function
recycleCap:
.LFB497:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	16(%ebp), %ebx
	movl	8(%ebp), %eax
	movl	20(%ebp), %esi
	movl	%ebx, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L1962
	movl	%ebx, %edx
	andl	$15, %edx
	testb	$1, %bl
	jne	.L1963
.L1967:
	cmpl	$10, %edx
	je	.L1968
	jbe	.L1986
	cmpl	$46, %edx
	.p2align 4,,5
	je	.L1973
.L1968:
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
.L1961:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1986:
	.cfi_restore_state
	testl	%edx, %edx
	je	.L1971
	cmpl	$4, %edx
	jne	.L1968
	movl	%esi, %edx
	shrl	$3, %edx
	testl	%edx, %edx
	je	.L1968
	movl	%edx, 4(%esp)
	movl	%ebx, %edx
	andl	$-16, %edx
	movl	%edx, (%esp)
	movl	%eax, -12(%ebp)
	call	epCancelBadgedSends
	movl	-12(%ebp), %eax
	jmp	.L1968
	.p2align 4,,7
	.p2align 3
.L1962:
	testb	$1, %bl
	movzbl	%bl, %edx
	je	.L1967
.L1963:
	movl	12(%ebp), %edx
	movl	%ebx, 8(%esp)
	movl	%esi, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	movl	%eax, -12(%ebp)
	call	Arch_recycleCap
	movl	-12(%ebp), %eax
	subl	$4, %esp
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.p2align 4,,7
	.p2align 3
.L1971:
	.cfi_restore_state
	call	halt
	.p2align 4,,7
	.p2align 3
.L1973:
	andl	$16128, %ebx
	shrl	$8, %ebx
	cmpl	$32, %ebx
	je	.L1987
	leal	1(%ebx), %ecx
	movl	$-1, %edx
	andl	$-32, %esi
	andl	$31, %ebx
	sall	%cl, %edx
	andl	%edx, %esi
	shrl	%esi
	orl	$10, %esi
	sall	$23, %ebx
	movl	%esi, (%eax)
	movl	%ebx, 4(%eax)
	jmp	.L1961
	.p2align 4,,7
	.p2align 3
.L1987:
	andl	$-16, %esi
	movl	%esi, %ecx
	leal	256(%esi), %ebx
	addl	$912, %ecx
	movl	%ebx, %edx
	.p2align 4,,7
	.p2align 3
.L1978:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jne	.L1978
	movl	%ebx, (%esp)
	movl	%eax, -12(%ebp)
	call	Arch_initContext
	movl	ksCurDomain, %edx
	movl	-12(%ebp), %eax
	movl	$5, 628(%ebx)
	movl	%edx, 620(%ebx)
	orl	$12, %ebx
	movl	%ebx, (%eax)
	movl	$0, 4(%eax)
	jmp	.L1961
	.cfi_endproc
.LFE497:
	.size	recycleCap, .-recycleCap
	.p2align 4,,15
	.globl	tcbSchedAppend
	.type	tcbSchedAppend, @function
tcbSchedAppend:
.LFB511:
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
	jne	.L1988
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	movl	ksReadyQueues(,%edx,8), %ebx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	4(%esi), %edi
	testl	%ebx, %ebx
	je	.L1991
	movl	%eax, 640(%edi)
.L1990:
	orl	$1, %ecx
	movl	%edi, 644(%eax)
	movl	$0, 640(%eax)
	movl	%ebx, ksReadyQueues(,%edx,8)
	movl	%eax, 4(%esi)
	movl	%ecx, 600(%eax)
.L1988:
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
.L1991:
	.cfi_restore_state
	movl	%eax, %ebx
	jmp	.L1990
	.cfi_endproc
.LFE511:
	.size	tcbSchedAppend, .-tcbSchedAppend
	.p2align 4,,15
	.globl	timerTick
	.type	timerTick, @function
timerTick:
.LFB434:
	.cfi_startproc
	subl	$4, %esp
	.cfi_def_cfa_offset 8
	movl	ksCurThread, %eax
	movl	592(%eax), %edx
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L1994
	movl	628(%eax), %edx
	cmpl	$1, %edx
	jbe	.L1995
	subl	$1, %edx
	movl	%edx, 628(%eax)
.L1994:
	subl	$1, ksDomainTime
	je	.L1998
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L1998:
	.cfi_restore_state
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	jmp	rescheduleRequired
	.p2align 4,,7
	.p2align 3
.L1995:
	.cfi_restore_state
	movl	$5, 628(%eax)
	movl	%eax, (%esp)
	call	tcbSchedAppend
	call	rescheduleRequired
	jmp	.L1994
	.cfi_endproc
.LFE434:
	.size	timerTick, .-timerTick
	.p2align 4,,15
	.globl	tcbSchedDequeue
	.type	tcbSchedDequeue, @function
tcbSchedDequeue:
.LFB512:
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
	je	.L1999
	movl	620(%eax), %edx
	sall	$8, %edx
	addl	624(%eax), %edx
	leal	ksReadyQueues(,%edx,8), %esi
	movl	ksReadyQueues(,%edx,8), %ebp
	movl	4(%esi), %ebx
	movl	%ebx, (%esp)
	movl	644(%eax), %ebx
	testl	%ebx, %ebx
	je	.L2001
	movl	640(%eax), %edi
	movl	%edi, 640(%ebx)
	movl	640(%eax), %edi
.L2002:
	testl	%edi, %edi
	je	.L2004
	movl	%ebx, 644(%edi)
.L2003:
	movl	(%esp), %edi
	andl	$-2, %ecx
	movl	%ebp, ksReadyQueues(,%edx,8)
	movl	%edi, 4(%esi)
	movl	%ecx, 600(%eax)
.L1999:
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
.L2001:
	.cfi_restore_state
	movl	640(%eax), %ebp
	movl	%ebp, %edi
	jmp	.L2002
	.p2align 4,,7
	.p2align 3
.L2004:
	movl	%ebx, (%esp)
	jmp	.L2003
	.cfi_endproc
.LFE512:
	.size	tcbSchedDequeue, .-tcbSchedDequeue
	.p2align 4,,15
	.globl	switchToThread
	.type	switchToThread, @function
switchToThread:
.LFB425:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %ebx
	movl	%ebx, (%esp)
	call	Arch_switchToThread
	movl	%ebx, (%esp)
	call	tcbSchedDequeue
	movl	%ebx, ksCurThread
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE425:
	.size	switchToThread, .-switchToThread
	.p2align 4,,15
	.globl	chooseThread
	.type	chooseThread, @function
chooseThread:
.LFB424:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$255, %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movl	ksCurDomain, %ecx
	sall	$8, %ecx
	jmp	.L2015
	.p2align 4,,7
	.p2align 3
.L2012:
	subl	$1, %eax
	cmpl	$-1, %eax
	je	.L2017
.L2015:
	leal	(%eax,%ecx), %edx
	movl	ksReadyQueues(,%edx,8), %ebx
	testl	%ebx, %ebx
	je	.L2012
	movl	%ebx, (%esp)
	call	Arch_switchToThread
	movl	%ebx, (%esp)
	call	tcbSchedDequeue
	movl	%ebx, ksCurThread
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2017:
	.cfi_restore_state
	movl	ksIdleThread, %eax
	movl	%eax, ksCurThread
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE424:
	.size	chooseThread, .-chooseThread
	.p2align 4,,15
	.globl	schedule
	.type	schedule, @function
schedule:
.LFB423:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movl	ksSchedulerAction, %eax
	cmpl	$-1, %eax
	je	.L2035
	testl	%eax, %eax
	je	.L2018
	movl	ksCurThread, %ecx
	movl	%eax, %ebx
	movl	592(%ecx), %edx
	andl	$15, %edx
	subl	$1, %edx
	cmpl	$1, %edx
	ja	.L2026
	movl	%ecx, (%esp)
	call	tcbSchedEnqueue
	movl	ksSchedulerAction, %ebx
.L2026:
	movl	%ebx, (%esp)
	call	Arch_switchToThread
	movl	%ebx, (%esp)
	call	tcbSchedDequeue
	movl	%ebx, ksCurThread
	movl	$0, ksSchedulerAction
.L2018:
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2035:
	.cfi_restore_state
	movl	ksCurThread, %edx
	movl	592(%edx), %eax
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L2032
	movl	ksDomainTime, %eax
	testl	%eax, %eax
	jne	.L2022
.L2036:
	movl	$0, ksDomScheduleIdx
	movl	$0, ksWorkUnitsCompleted
	movl	$0, ksCurDomain
	movl	$1, ksDomainTime
.L2022:
	call	chooseThread
	movl	$0, ksSchedulerAction
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2032:
	.cfi_restore_state
	movl	%edx, (%esp)
	call	tcbSchedEnqueue
	movl	ksDomainTime, %eax
	testl	%eax, %eax
	je	.L2036
	jmp	.L2022
	.cfi_endproc
.LFE423:
	.size	schedule, .-schedule
	.p2align 4,,15
	.globl	setDomain
	.type	setDomain, @function
setDomain:
.LFB427:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %ebx
	movl	20(%esp), %esi
	movl	%ebx, (%esp)
	call	tcbSchedDequeue
	movl	592(%ebx), %eax
	movl	%esi, 620(%ebx)
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L2038
	movl	%ebx, (%esp)
	call	tcbSchedEnqueue
.L2038:
	cmpl	ksCurThread, %ebx
	je	.L2043
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
.L2043:
	.cfi_restore_state
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	rescheduleRequired
	.cfi_endproc
.LFE427:
	.size	setDomain, .-setDomain
	.p2align 4,,15
	.globl	setPriority
	.type	setPriority, @function
setPriority:
.LFB428:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %ebx
	movl	20(%esp), %esi
	movl	%ebx, (%esp)
	call	tcbSchedDequeue
	movl	592(%ebx), %eax
	movl	%esi, 624(%ebx)
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L2045
	movl	%ebx, (%esp)
	call	tcbSchedEnqueue
.L2045:
	cmpl	ksCurThread, %ebx
	je	.L2050
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
.L2050:
	.cfi_restore_state
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	rescheduleRequired
	.cfi_endproc
.LFE428:
	.size	setPriority, .-setPriority
	.section	.boot.text
	.p2align 4,,15
	.globl	create_initial_thread
	.type	create_initial_thread, @function
create_initial_thread:
.LFB392:
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
	movl	68(%esp), %eax
	movl	$10, (%esp)
	movl	64(%esp), %ebx
	movl	%eax, 28(%esp)
	call	alloc_region
	testl	%eax, %eax
	movl	%eax, %ebp
	je	.L2119
	movl	%eax, %edx
	leal	1024(%eax), %ecx
	.p2align 4,,7
	.p2align 3
.L2054:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jne	.L2054
	leal	256(%ebp), %esi
	movl	%ebx, %edi
	movl	$5, 628(%esi)
	andl	$14, %edi
	movl	%esi, (%esp)
	call	Arch_initContext
	movl	%ebx, %edx
	movzbl	%bl, %ecx
	andl	$15, %edx
	cmpl	$14, %edi
	cmove	%ecx, %edx
	cmpl	$62, %edx
	ja	.L2105
	jmp	*.L2059(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L2059:
	.long	.L2120
	.long	.L2066
	.long	.L2065
	.long	.L2066
	.long	.L2065
	.long	.L2066
	.long	.L2065
	.long	.L2120
	.long	.L2120
	.long	.L2066
	.long	.L2067
	.long	.L2120
	.long	.L2068
	.long	.L2105
	.long	.L2120
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2120
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2069
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2120
	.section	.boot.text
.L2066:
	movl	%ebx, %edx
	andl	$16777200, %edx
	sall	$8, %edx
	addl	$32, %edx
.L2058:
	movl	28(%esp), %eax
	movl	%edx, 8(%esp)
	movl	%ebp, 12(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	cteInsert
	movl	%ebx, %edx
	movzbl	%bl, %ecx
	andl	$15, %edx
	cmpl	$14, %edi
	cmove	%ecx, %edx
	cmpl	$62, %edx
	leal	16(%ebp), %eax
	ja	.L2105
	jmp	*.L2075(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L2075:
	.long	.L2122
	.long	.L2082
	.long	.L2081
	.long	.L2082
	.long	.L2081
	.long	.L2082
	.long	.L2081
	.long	.L2122
	.long	.L2122
	.long	.L2082
	.long	.L2083
	.long	.L2122
	.long	.L2084
	.long	.L2105
	.long	.L2122
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2122
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2085
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2122
	.section	.boot.text
.L2082:
	movl	%ebx, %edx
	andl	$16777200, %edx
	sall	$8, %edx
	addl	$48, %edx
.L2074:
	movl	%eax, 12(%esp)
	movl	72(%esp), %eax
	movl	%edx, 8(%esp)
	movl	76(%esp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	cteInsert
	movl	%ebx, %edx
	movzbl	%bl, %ecx
	andl	$15, %edx
	cmpl	$14, %edi
	cmove	%ecx, %edx
	cmpl	$62, %edx
	leal	64(%ebp), %eax
	ja	.L2105
	jmp	*.L2091(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L2091:
	.long	.L2124
	.long	.L2098
	.long	.L2097
	.long	.L2098
	.long	.L2097
	.long	.L2098
	.long	.L2097
	.long	.L2124
	.long	.L2124
	.long	.L2098
	.long	.L2099
	.long	.L2124
	.long	.L2100
	.long	.L2105
	.long	.L2124
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2124
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2101
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2124
	.section	.boot.text
.L2119:
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
.L2098:
	.cfi_restore_state
	movl	%ebx, %edx
	andl	$16777200, %edx
	sall	$8, %edx
	addl	$160, %edx
.L2090:
	movl	%eax, 12(%esp)
	movl	92(%esp), %eax
	movl	%edx, 8(%esp)
	movl	96(%esp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	cteInsert
	movl	88(%esp), %eax
	movl	$255, 624(%esi)
	movl	%eax, 636(%esi)
	movl	84(%esp), %eax
	movl	%eax, 4(%esi)
	movl	80(%esp), %eax
	movl	%eax, 56(%esi)
	movl	%esi, (%esp)
	call	setupReplyMaster
	movl	592(%esi), %eax
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%esi)
	movl	%esi, (%esp)
	call	scheduleTCB
	movl	ksIdleThread, %eax
	movl	%esi, (%esp)
	movl	$0, ksSchedulerAction
	movl	$1, ksDomainTime
	movl	%eax, ksCurThread
	movl	ksDomScheduleIdx, %eax
	movl	ksDomSchedule(,%eax,8), %eax
	movl	%eax, ksCurDomain
	call	Arch_switchToThread
	movl	%esi, (%esp)
	call	tcbSchedDequeue
	movl	%ebx, %eax
	movzbl	%bl, %edx
	movl	%esi, ksCurThread
	andl	$-16, %esi
	andl	$15, %eax
	orl	$12, %esi
	cmpl	$14, %edi
	cmove	%edx, %eax
	cmpl	$62, %eax
	ja	.L2105
	jmp	*.L2107(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L2107:
	.long	.L2126
	.long	.L2114
	.long	.L2113
	.long	.L2114
	.long	.L2113
	.long	.L2114
	.long	.L2113
	.long	.L2126
	.long	.L2126
	.long	.L2114
	.long	.L2115
	.long	.L2126
	.long	.L2116
	.long	.L2105
	.long	.L2126
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2126
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2117
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2105
	.long	.L2126
	.section	.boot.text
.L2114:
	andl	$16777200, %ebx
	sall	$8, %ebx
.L2106:
	movl	%esi, 16(%ebx)
	movl	$1, %eax
	movl	$0, 20(%ebx)
	movl	$0, 24(%ebx)
	movl	$3, 28(%ebx)
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
.L2065:
	.cfi_restore_state
	movl	%ebx, %edx
	andl	$-16, %edx
	addl	$32, %edx
	jmp	.L2058
.L2081:
	movl	%ebx, %edx
	andl	$-16, %edx
	addl	$48, %edx
	jmp	.L2074
.L2097:
	movl	%ebx, %edx
	andl	$-16, %edx
	addl	$160, %edx
	jmp	.L2090
.L2113:
	andl	$-16, %ebx
	jmp	.L2106
.L2120:
	movl	$32, %edx
	jmp	.L2058
.L2085:
	movl	%ebx, %edx
	andl	$16128, %edx
	shrl	$8, %edx
	cmpl	$32, %edx
	je	.L2123
	leal	1(%edx), %ecx
	movl	$-1, %edx
	sall	%cl, %edx
.L2086:
	andl	28(%esp), %edx
	addl	$48, %edx
	jmp	.L2074
.L2083:
	movl	%ebx, %edx
	andl	$2147483632, %edx
	leal	48(%edx,%edx), %edx
	jmp	.L2074
.L2122:
	movl	$48, %edx
	jmp	.L2074
.L2084:
	movl	%ebx, %edx
	andl	$-1024, %edx
	addl	$48, %edx
	jmp	.L2074
.L2067:
	movl	%ebx, %edx
	andl	$2147483632, %edx
	leal	32(%edx,%edx), %edx
	jmp	.L2058
.L2069:
	movl	%ebx, %edx
	andl	$16128, %edx
	shrl	$8, %edx
	cmpl	$32, %edx
	je	.L2121
	leal	1(%edx), %ecx
	movl	$-1, %edx
	sall	%cl, %edx
.L2070:
	andl	28(%esp), %edx
	addl	$32, %edx
	jmp	.L2058
.L2068:
	movl	%ebx, %edx
	andl	$-1024, %edx
	addl	$32, %edx
	jmp	.L2058
.L2105:
	call	halt
.L2099:
	movl	%ebx, %edx
	andl	$2147483632, %edx
	leal	160(%edx,%edx), %edx
	jmp	.L2090
.L2101:
	movl	%ebx, %edx
	andl	$16128, %edx
	shrl	$8, %edx
	cmpl	$32, %edx
	je	.L2125
	leal	1(%edx), %ecx
	movl	$-1, %edx
	sall	%cl, %edx
.L2102:
	andl	28(%esp), %edx
	addl	$160, %edx
	jmp	.L2090
.L2100:
	movl	%ebx, %edx
	andl	$-1024, %edx
	addl	$160, %edx
	jmp	.L2090
.L2124:
	movl	$160, %edx
	jmp	.L2090
.L2126:
	xorl	%ebx, %ebx
	jmp	.L2106
.L2116:
	andl	$-1024, %ebx
	jmp	.L2106
.L2117:
	andl	$16128, %ebx
	shrl	$8, %ebx
	cmpl	$32, %ebx
	je	.L2127
	leal	1(%ebx), %ecx
	movl	$-1, %ebx
	sall	%cl, %ebx
.L2118:
	andl	28(%esp), %ebx
	jmp	.L2106
.L2115:
	andl	$2147483632, %ebx
	addl	%ebx, %ebx
	jmp	.L2106
.L2121:
	movl	$-16, %edx
	jmp	.L2070
.L2123:
	movl	$-16, %edx
	jmp	.L2086
.L2125:
	movl	$-16, %edx
	jmp	.L2102
.L2127:
	movl	$-16, %ebx
	jmp	.L2118
	.cfi_endproc
.LFE392:
	.size	create_initial_thread, .-create_initial_thread
	.text
	.p2align 4,,15
	.globl	tcbEPAppend
	.type	tcbEPAppend, @function
tcbEPAppend:
.LFB513:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	16(%esp), %ecx
	movl	8(%esp), %eax
	movl	12(%esp), %edx
	movl	20(%esp), %ebx
	testl	%ecx, %ecx
	je	.L2131
	movl	%edx, 648(%ebx)
.L2130:
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
.L2131:
	.cfi_restore_state
	movl	%edx, %ecx
	jmp	.L2130
	.cfi_endproc
.LFE513:
	.size	tcbEPAppend, .-tcbEPAppend
	.p2align 4,,15
	.globl	tcbEPDequeue
	.type	tcbEPDequeue, @function
tcbEPDequeue:
.LFB514:
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
	je	.L2134
	movl	648(%edx), %edi
	movl	%edi, 648(%ecx)
	movl	648(%edx), %edx
	testl	%edx, %edx
	je	.L2137
.L2139:
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
.L2134:
	.cfi_restore_state
	movl	648(%edx), %ebx
	movl	%ebx, %edx
	testl	%edx, %edx
	jne	.L2139
	.p2align 4,,7
	.p2align 3
.L2137:
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
.LFE514:
	.size	tcbEPDequeue, .-tcbEPDequeue
	.p2align 4,,15
	.globl	getExtraCPtr
	.type	getExtraCPtr, @function
getExtraCPtr:
.LFB515:
	.cfi_startproc
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	movl	488(%eax,%edx,4), %eax
	ret
	.cfi_endproc
.LFE515:
	.size	getExtraCPtr, .-getExtraCPtr
	.p2align 4,,15
	.globl	setExtraBadge
	.type	setExtraBadge, @function
setExtraBadge:
.LFB516:
	.cfi_startproc
	movl	12(%esp), %edx
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movl	%ecx, 488(%eax,%edx,4)
	ret
	.cfi_endproc
.LFE516:
	.size	setExtraBadge, .-setExtraBadge
	.p2align 4,,15
	.globl	setupCallerCap
	.type	setupCallerCap, @function
setupCallerCap:
.LFB517:
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
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	28(%esp), %edx
	movl	%ebx, %eax
	andl	$-16, %eax
	andl	$-1024, %ebx
	orl	$8, %eax
	addl	$32, %ebx
	movl	%ebx, 8(%esp)
	andl	$-1024, %edx
	addl	$48, %edx
	movl	%edx, 12(%esp)
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	call	cteInsert
	addl	$16, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE517:
	.size	setupCallerCap, .-setupCallerCap
	.p2align 4,,15
	.globl	lookupExtraCaps
	.type	lookupExtraCaps, @function
lookupExtraCaps:
.LFB519:
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
	movl	12(%ebp), %edx
	testl	%edx, %edx
	je	.L2155
	movl	16(%ebp), %eax
	xorl	%ebx, %ebx
	andl	$384, %eax
	movl	%eax, -28(%ebp)
	shrl	$7, -28(%ebp)
	movl	-28(%ebp), %eax
	testl	%eax, %eax
	je	.L2147
	leal	-24(%ebp), %edi
	jmp	.L2150
	.p2align 4,,7
	.p2align 3
.L2148:
	movl	%ecx, current_extra_caps(,%ebx,4)
	addl	$1, %ebx
	cmpl	-28(%ebp), %ebx
	je	.L2156
.L2150:
	movl	12(%ebp), %eax
	movl	488(%eax,%ebx,4), %esi
	movl	8(%ebp), %eax
	movl	%edi, (%esp)
	movl	%esi, 8(%esp)
	movl	%eax, 4(%esp)
	call	lookupSlot
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %ecx
	subl	$4, %esp
	testl	%eax, %eax
	je	.L2148
	movl	$1, current_fault
	movl	%esi, current_fault+4
.L2146:
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
.L2156:
	.cfi_restore_state
	xorl	%eax, %eax
	cmpl	$3, %ebx
	je	.L2146
.L2147:
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
.L2155:
	.cfi_restore_state
	movl	$0, current_extra_caps
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
.LFE519:
	.size	lookupExtraCaps, .-lookupExtraCaps
	.p2align 4,,15
	.globl	copyMRs
	.type	copyMRs, @function
copyMRs:
.LFB520:
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
	je	.L2165
	movl	20(%ecx), %edi
	cmpl	$1, %eax
	movl	%edi, 20(%edx)
	jbe	.L2161
	movl	24(%ecx), %ecx
	testl	%ebx, %ebx
	movl	%ecx, 24(%edx)
	je	.L2163
	testl	%esi, %esi
	je	.L2163
	cmpl	$2, %eax
	jbe	.L2163
	movl	$2, %edx
	.p2align 4,,7
	.p2align 3
.L2160:
	addl	$1, %edx
	movl	(%esi,%edx,4), %ecx
	cmpl	%eax, %edx
	movl	%ecx, (%ebx,%edx,4)
	jne	.L2160
.L2165:
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
.L2163:
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
.L2161:
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
.LFE520:
	.size	copyMRs, .-copyMRs
	.p2align 4,,15
	.globl	doNormalTransfer
	.type	doNormalTransfer, @function
doNormalTransfer:
.LFB418:
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
	movl	8(%ebp), %edi
	movl	16(%edi), %ebx
	movl	%ebx, %edx
	andl	$127, %edx
	cmpl	$120, %edx
	jbe	.L2170
	andl	$-128, %ebx
	movl	$120, %edx
	orl	$120, %ebx
.L2170:
	movl	24(%ebp), %ecx
	testl	%ecx, %ecx
	jne	.L2200
	movl	current_extra_caps+4, %eax
	xorl	%esi, %esi
	movl	%eax, -56(%ebp)
	movl	current_extra_caps+8, %eax
	movl	%eax, -52(%ebp)
.L2172:
	movl	32(%ebp), %eax
	andl	$-3969, %ebx
	movl	%edi, (%esp)
	movl	%edx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	call	copyMRs
	testl	%esi, %esi
	movl	%esi, -60(%ebp)
	movl	%esi, -48(%ebp)
	movl	%eax, %edi
	movl	-56(%ebp), %eax
	movl	%eax, -44(%ebp)
	movl	-52(%ebp), %eax
	movl	%eax, -40(%ebp)
	jne	.L2201
.L2173:
	movl	28(%ebp), %eax
	andl	$127, %edi
	andl	$-128, %ebx
	orl	%edi, %ebx
	movl	28(%ebp), %ecx
	movl	%ebx, 16(%eax)
	movl	20(%ebp), %eax
	movl	%eax, 4(%ecx)
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
.L2200:
	.cfi_restore_state
	movl	12(%ebp), %eax
	movl	%ebx, 8(%esp)
	movl	%edi, (%esp)
	movl	%edx, -84(%ebp)
	movl	%eax, 4(%esp)
	call	lookupExtraCaps
	movl	current_extra_caps+4, %esi
	movl	-84(%ebp), %edx
	movl	%esi, -56(%ebp)
	movl	current_extra_caps+8, %esi
	movl	%esi, -52(%ebp)
	xorl	%esi, %esi
	testl	%eax, %eax
	cmove	current_extra_caps, %esi
	jmp	.L2172
.L2201:
	cmpl	$0, 32(%ebp)
	je	.L2173
	movl	32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	28(%ebp), %eax
	movl	%eax, (%esp)
	call	getReceiveSlots
	movl	%edi, -88(%ebp)
	movl	%eax, -84(%ebp)
	xorl	%eax, %eax
	movl	%eax, %edi
.L2174:
	movl	-48(%ebp,%edi,4), %esi
	testl	%esi, %esi
	je	.L2184
	movl	(%esi), %eax
	movl	4(%esi), %edx
	movl	%eax, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L2175
	movl	%eax, %ecx
	andl	$15, %ecx
.L2176:
	cmpl	$4, %ecx
	je	.L2202
.L2177:
	cmpl	$0, -84(%ebp)
	je	.L2184
	cmpl	$0, 36(%ebp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	je	.L2180
	leal	-80(%ebp), %eax
	movl	%eax, (%esp)
	movl	$6, 4(%esp)
	call	maskCapRights
	movl	-80(%ebp), %eax
	pushl	%edx
	movl	-76(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
.L2180:
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	%esi, 4(%esp)
	call	deriveCap
	cmpl	$0, -36(%ebp)
	pushl	%eax
	jne	.L2184
	movl	-32(%ebp), %eax
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L2182
	andl	$15, %eax
.L2183:
	testl	%eax, %eax
	je	.L2184
	movl	-84(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%esi, 8(%esp)
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
	movl	$0, -84(%ebp)
.L2178:
	addl	$1, %edi
	cmpl	$3, %edi
	jne	.L2174
.L2184:
	movl	%edi, %ecx
	movl	%ebx, %eax
	movl	-88(%ebp), %edi
	movl	%ecx, %ebx
	andl	$-385, %eax
	sall	$7, %ebx
	andl	$384, %ebx
	orl	%eax, %ebx
	jmp	.L2173
.L2202:
	movl	%eax, %ecx
	andl	$-16, %ecx
	cmpl	%ecx, 16(%ebp)
	jne	.L2177
	movl	32(%ebp), %eax
	shrl	$3, %edx
	movl	%edi, %ecx
	movl	%edx, 488(%eax,%edi,4)
	movl	%ebx, %edx
	movl	$1, %eax
	andl	$3584, %ebx
	andb	$241, %dh
	sall	%cl, %eax
	shrl	$9, %ebx
	orl	%eax, %ebx
	sall	$9, %ebx
	andl	$3584, %ebx
	orl	%edx, %ebx
	jmp	.L2178
.L2182:
	movzbl	%al, %eax
	jmp	.L2183
.L2175:
	movzbl	%al, %ecx
	jmp	.L2176
	.cfi_endproc
.LFE418:
	.size	doNormalTransfer, .-doNormalTransfer
	.p2align 4,,15
	.globl	doIPCTransfer
	.type	doIPCTransfer, @function
doIPCTransfer:
.LFB416:
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
	jne	.L2204
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
.L2204:
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
.LFE416:
	.size	doIPCTransfer, .-doIPCTransfer
	.p2align 4,,15
	.globl	sendIPC
	.type	sendIPC, @function
sendIPC:
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
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	movl	84(%esp), %eax
	movl	100(%esp), %ebx
	movl	80(%esp), %ecx
	movl	96(%esp), %edi
	movl	%eax, 32(%esp)
	movl	88(%esp), %eax
	movl	%eax, 36(%esp)
	movl	92(%esp), %eax
	movl	%eax, 28(%esp)
	movl	(%ebx), %eax
	movl	%eax, %edx
	andl	$3, %edx
	cmpl	$1, %edx
	jbe	.L2210
	cmpl	$2, %edx
	jne	.L2208
	movl	4(%ebx), %ecx
	movl	%ecx, %esi
	andl	$-16, %esi
	movl	652(%esi), %edx
	movl	%ecx, 44(%esp)
	movl	%eax, %ecx
	andl	$-16, %ecx
	movl	%ecx, 40(%esp)
	movl	648(%esi), %ecx
	testl	%edx, %edx
	je	.L2214
	movl	%ecx, 648(%edx)
	movl	648(%esi), %ebp
	movl	%esi, %ecx
.L2215:
	testl	%ebp, %ebp
	je	.L2222
	movl	%edx, 652(%ebp)
.L2216:
	movl	44(%esp), %ebp
	movl	%ecx, %edx
	andl	$15, %eax
	andl	$-16, %edx
	andl	$15, %ebp
	orl	%ebp, %edx
	movl	%edx, 4(%ebx)
	movl	40(%esp), %edx
	andl	$-16, %edx
	orl	%eax, %edx
	testl	%ecx, %ecx
	movl	%edx, (%ebx)
	je	.L2233
.L2217:
	movl	28(%esp), %eax
	movl	596(%esi), %ebp
	movl	%esi, 16(%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, 12(%esp)
	movl	36(%esp), %eax
	andl	$1, %ebp
	movl	%ebp, 20(%esp)
	movl	%edi, (%esp)
	movl	%eax, 8(%esp)
	call	doIPCTransfer
	movl	592(%esi), %eax
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%esi)
	movl	%esi, (%esp)
	call	scheduleTCB
	movl	$1, %edx
	movl	%esi, %eax
	call	possibleSwitchTo
	movl	32(%esp), %edx
	testl	%edx, %edx
	je	.L2234
	testl	%ebp, %ebp
	je	.L2235
.L2220:
	andl	$-16, 592(%edi)
	movl	%edi, 80(%esp)
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
	jmp	scheduleTCB
	.p2align 4,,7
	.p2align 3
.L2210:
	.cfi_restore_state
	testl	%ecx, %ecx
	je	.L2208
	movl	%ebx, %eax
	movl	36(%esp), %edx
	andl	$-16, %eax
	orl	$4, %eax
	movl	%eax, 592(%edi)
	movl	600(%edi), %eax
	sall	$3, %edx
	andl	$3, %eax
	orl	%edx, %eax
	movl	28(%esp), %edx
	sall	$2, %edx
	andl	$4, %edx
	orl	%edx, %eax
	movl	32(%esp), %edx
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
	je	.L2221
	movl	%edi, 648(%esi)
.L2213:
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
.L2208:
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
	.p2align 4,,7
	.p2align 3
.L2234:
	.cfi_restore_state
	testb	$7, 604(%edi)
	je	.L2208
	testl	%ebp, %ebp
	jne	.L2220
.L2235:
	movl	28(%esp), %eax
	testl	%eax, %eax
	je	.L2220
	movl	%esi, 84(%esp)
	movl	%edi, 80(%esp)
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
	jmp	setupCallerCap
	.p2align 4,,7
	.p2align 3
.L2214:
	.cfi_restore_state
	movl	%ecx, %ebp
	jmp	.L2215
	.p2align 4,,7
	.p2align 3
.L2233:
	andl	$-4, %edx
	movl	%edx, (%ebx)
	jmp	.L2217
	.p2align 4,,7
	.p2align 3
.L2222:
	movl	%edx, 40(%esp)
	jmp	.L2216
	.p2align 4,,7
	.p2align 3
.L2221:
	movl	%edi, %eax
	jmp	.L2213
	.cfi_endproc
.LFE476:
	.size	sendIPC, .-sendIPC
	.p2align 4,,15
	.globl	sendFaultIPC
	.type	sendFaultIPC, @function
sendFaultIPC:
.LFB408:
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
	movl	%eax, -48(%ebp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	movl	%ebx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%edx, -44(%ebp)
	call	lookupCap
	movl	-36(%ebp), %eax
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L2250
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %ecx
	movl	%eax, %edi
	movl	%eax, %edx
	andl	$14, %edi
	andl	$15, %edx
	movl	%ecx, -52(%ebp)
	cmpl	$14, %edi
	movzbl	%al, %ecx
	cmove	%ecx, %edx
	cmpl	$4, %edx
	je	.L2251
.L2241:
	movl	$1, current_fault
	movl	$1, %eax
	movl	%esi, current_fault+4
	movl	$1, current_lookup_fault
	movl	$0, current_lookup_fault+4
.L2238:
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
.L2250:
	.cfi_restore_state
	movl	%esi, current_fault+4
	movl	$1, %eax
	movl	$1, current_fault
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
.L2251:
	.cfi_restore_state
	testb	$2, -52(%ebp)
	je	.L2241
	testb	$4, -52(%ebp)
	je	.L2241
	movl	current_fault, %edx
	movl	current_fault, %esi
	movl	current_fault+4, %edi
	andl	$7, %edx
	cmpl	$1, %edx
	movl	%esi, 604(%ebx)
	movl	%edi, 608(%ebx)
	jne	.L2242
	movl	-48(%ebp), %esi
	movl	-44(%ebp), %edi
	movl	%esi, 612(%ebx)
	movl	%edi, 616(%ebx)
.L2242:
	andl	$-16, %eax
	movl	%eax, 20(%esp)
	movl	-52(%ebp), %eax
	movl	%ebx, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 4(%esp)
	shrl	$3, %eax
	movl	%eax, 8(%esp)
	movl	$1, (%esp)
	call	sendIPC
	xorl	%eax, %eax
	jmp	.L2238
	.cfi_endproc
.LFE408:
	.size	sendFaultIPC, .-sendFaultIPC
	.p2align 4,,15
	.globl	handleFault
	.type	handleFault, @function
handleFault:
.LFB407:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	%ebx, (%esp)
	call	sendFaultIPC
	testl	%eax, %eax
	jne	.L2255
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2255:
	.cfi_restore_state
	andl	$-16, 592(%ebx)
	movl	%ebx, 32(%esp)
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	jmp	scheduleTCB
	.cfi_endproc
.LFE407:
	.size	handleFault, .-handleFault
	.p2align 4,,15
	.globl	handleUnknownSyscall
	.type	handleUnknownSyscall, @function
handleUnknownSyscall:
.LFB247:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	$3, current_fault
	movl	%eax, current_fault+4
	movl	ksCurThread, %eax
	movl	%eax, (%esp)
	call	handleFault
	call	schedule
	call	activateThread
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE247:
	.size	handleUnknownSyscall, .-handleUnknownSyscall
	.p2align 4,,15
	.globl	handleUserLevelFault
	.type	handleUserLevelFault, @function
handleUserLevelFault:
.LFB248:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	leal	4(,%eax,8), %eax
	movl	%eax, current_fault
	movl	32(%esp), %eax
	movl	%eax, current_fault+4
	movl	ksCurThread, %eax
	movl	%eax, (%esp)
	call	handleFault
	call	schedule
	call	activateThread
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE248:
	.size	handleUserLevelFault, .-handleUserLevelFault
	.p2align 4,,15
	.globl	handleVMFaultEvent
	.type	handleVMFaultEvent, @function
handleVMFaultEvent:
.LFB249:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	ksCurThread, %eax
	movl	%eax, (%esp)
	call	handleVMFault
	testl	%eax, %eax
	je	.L2261
	movl	ksCurThread, %eax
	movl	%eax, (%esp)
	call	handleFault
.L2261:
	call	schedule
	call	activateThread
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE249:
	.size	handleVMFaultEvent, .-handleVMFaultEvent
	.p2align 4,,15
	.globl	performInvocation_Endpoint
	.type	performInvocation_Endpoint, @function
performInvocation_Endpoint:
.LFB506:
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
.LFE506:
	.size	performInvocation_Endpoint, .-performInvocation_Endpoint
	.p2align 4,,15
	.globl	receiveIPC
	.type	receiveIPC, @function
receiveIPC:
.LFB477:
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
	movl	88(%esp), %esi
	movl	84(%esp), %ebx
	movl	80(%esp), %edi
	andl	$2, %esi
	shrl	%esi
	andl	$-16, %ebx
	movl	%esi, %eax
	xorl	$1, %eax
	movl	%eax, 32(%esp)
	movl	(%ebx), %eax
	movl	%eax, %edx
	andl	$3, %edx
	cmpl	$1, %edx
	je	.L2270
	jb	.L2271
	cmpl	$2, %edx
	je	.L2271
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
	.p2align 4,,1
	ret
	.p2align 4,,7
	.p2align 3
.L2271:
	.cfi_restore_state
	movl	%ebx, %eax
	orl	$3, %eax
	movl	%eax, 592(%edi)
	movl	596(%edi), %eax
	andl	$-2, %eax
	orl	32(%esp), %eax
	movl	%eax, 596(%edi)
	movl	%edi, (%esp)
	call	scheduleTCB
	movl	4(%ebx), %ecx
	movl	(%ebx), %eax
	movl	%ecx, %edx
	movl	%eax, %esi
	andl	$-16, %esi
	andl	$-16, %edx
	je	.L2280
	movl	%edi, 648(%esi)
.L2272:
	movl	%esi, 652(%edi)
	andl	$12, %eax
	andl	$-16, %edx
	movl	$0, 648(%edi)
	andl	$-16, %edi
	andl	$15, %ecx
	orl	%edi, %eax
	orl	%ecx, %edx
	orl	$2, %eax
	movl	%edx, 4(%ebx)
	movl	%eax, (%ebx)
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
	.p2align 4,,7
	.p2align 3
.L2270:
	.cfi_restore_state
	movl	4(%ebx), %ecx
	movl	%ecx, %ebp
	andl	$-16, %ebp
	movl	652(%ebp), %edx
	movl	%ecx, 44(%esp)
	movl	%eax, %ecx
	andl	$-16, %ecx
	movl	%ecx, 40(%esp)
	movl	648(%ebp), %ecx
	testl	%edx, %edx
	je	.L2273
	movl	%ecx, 648(%edx)
	movl	648(%ebp), %ecx
	movl	%ebp, 36(%esp)
.L2274:
	testl	%ecx, %ecx
	je	.L2281
	movl	%edx, 652(%ecx)
.L2275:
	movl	36(%esp), %edx
	andl	$15, %eax
	movl	44(%esp), %ecx
	andl	$-16, %edx
	andl	$15, %ecx
	orl	%ecx, %edx
	movl	40(%esp), %ecx
	movl	%edx, 4(%ebx)
	andl	$-16, %ecx
	movl	%ecx, %edx
	orl	%eax, %edx
	movl	36(%esp), %eax
	movl	%edx, (%ebx)
	testl	%eax, %eax
	je	.L2286
.L2276:
	movl	600(%ebp), %edx
	movl	32(%esp), %ecx
	movl	%edi, 16(%esp)
	movl	%ebx, 4(%esp)
	movl	%edx, %eax
	andl	$4, %eax
	shrl	$2, %eax
	shrl	$3, %edx
	movl	%eax, 12(%esp)
	movl	%ecx, 20(%esp)
	movl	%edx, 8(%esp)
	movl	%ebp, (%esp)
	movl	%eax, 32(%esp)
	call	doIPCTransfer
	movl	32(%esp), %eax
	testb	$2, 600(%ebp)
	je	.L2287
.L2277:
	movl	%esi, %ecx
	testb	%cl, %al
	je	.L2279
	movl	%edi, 84(%esp)
	movl	%ebp, 80(%esp)
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
	jmp	setupCallerCap
	.p2align 4,,7
	.p2align 3
.L2287:
	.cfi_restore_state
	testb	$7, 604(%ebp)
	jne	.L2277
	movl	592(%ebp), %eax
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%ebp)
	movl	%ebp, (%esp)
	call	scheduleTCB
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebp, %eax
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
.L2279:
	.cfi_restore_state
	andl	$-16, 592(%ebp)
	movl	%ebp, 80(%esp)
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
	jmp	scheduleTCB
	.p2align 4,,7
	.p2align 3
.L2286:
	.cfi_restore_state
	andl	$-4, %edx
	movl	%edx, (%ebx)
	jmp	.L2276
	.p2align 4,,7
	.p2align 3
.L2281:
	movl	%edx, 40(%esp)
	jmp	.L2275
	.p2align 4,,7
	.p2align 3
.L2273:
	movl	%ecx, 36(%esp)
	jmp	.L2274
	.p2align 4,,7
	.p2align 3
.L2280:
	movl	%edi, %edx
	jmp	.L2272
	.cfi_endproc
.LFE477:
	.size	receiveIPC, .-receiveIPC
	.p2align 4,,15
	.globl	decodeDomainInvocation
	.type	decodeDomainInvocation, @function
decodeDomainInvocation:
.LFB529:
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
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	cmpl	$25, 24(%esp)
	movl	32(%esp), %edx
	jne	.L2301
	movl	28(%esp), %eax
	testl	%eax, %eax
	je	.L2293
	movl	ksCurThread, %eax
	movl	20(%eax), %ebx
	cmpl	$15, %ebx
	jbe	.L2292
	movl	$1, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error
.L2290:
	addl	$8, %esp
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
.L2292:
	.cfi_restore_state
	testl	%edx, %edx
	je	.L2293
	movl	(%edx), %esi
	movl	%esi, %edi
	movl	%esi, %edx
	andl	$14, %edi
	movl	%esi, %ecx
	andl	$15, %edx
	movzbl	%cl, %ecx
	cmpl	$14, %edi
	cmove	%ecx, %edx
	cmpl	$12, %edx
	jne	.L2302
	movl	592(%eax), %edx
	andl	$-16, %esi
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	call	setDomain
	addl	$8, %esp
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
.L2293:
	.cfi_restore_state
	movl	$7, current_syscall_error+24
	movl	$3, %eax
	jmp	.L2290
.L2301:
	movl	$3, current_syscall_error+24
	movl	$3, %eax
	jmp	.L2290
.L2302:
	movl	$1, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error
	jmp	.L2290
	.cfi_endproc
.LFE529:
	.size	decodeDomainInvocation, .-decodeDomainInvocation
	.p2align 4,,15
	.globl	invokeUntyped_Retype
	.type	invokeUntyped_Retype, @function
invokeUntyped_Retype:
.LFB538:
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
	movl	80(%esp), %ebp
	movl	76(%esp), %eax
	movl	72(%esp), %edi
	movl	92(%esp), %esi
	movl	%ebp, 4(%esp)
	movl	64(%esp), %ebx
	movl	%eax, (%esp)
	call	getObjectSize
	movl	%esi, %edx
	movl	%eax, %ecx
	movl	%edi, %eax
	subl	68(%esp), %eax
	sall	%cl, %edx
	movl	%edx, %ecx
	addl	%eax, %ecx
	movl	4(%ebx), %eax
	shrl	$4, %ecx
	sall	$5, %ecx
	andl	$31, %eax
	orl	%eax, %ecx
	movl	84(%esp), %eax
	movl	%ecx, 4(%ebx)
	movl	%ebp, 24(%esp)
	movl	%edi, 20(%esp)
	movl	%eax, 8(%esp)
	movl	88(%esp), %eax
	movl	%esi, 16(%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, 12(%esp)
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	createNewObjects
	addl	$44, %esp
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
.LFE538:
	.size	invokeUntyped_Retype, .-invokeUntyped_Retype
	.p2align 4,,15
	.globl	decodeUntypedInvocation
	.type	decodeUntypedInvocation, @function
decodeUntypedInvocation:
.LFB537:
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
	je	.L2306
	movl	$3, current_syscall_error+24
	movl	$3, %eax
.L2343:
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
.L2306:
	.cfi_restore_state
	cmpl	$5, 12(%ebp)
	ja	.L2345
.L2308:
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
.L2345:
	.cfi_restore_state
	testl	%eax, %eax
	je	.L2308
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
	jbe	.L2310
	movl	$1, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error
	jmp	.L2343
.L2310:
	cmpl	$30, -52(%ebp)
	jbe	.L2311
	movl	$4, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+8
	movl	$30, current_syscall_error+12
	jmp	.L2343
.L2311:
	movl	-52(%ebp), %edx
	testl	%edx, %edx
	jne	.L2312
	cmpl	$4, %ebx
	jne	.L2312
.L2313:
	movl	$1, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error
	jmp	.L2343
.L2312:
	cmpl	$3, -52(%ebp)
	ja	.L2333
	testl	%ebx, %ebx
	je	.L2313
.L2333:
	testl	%ecx, %ecx
	.p2align 4,,3
	jne	.L2315
.L2317:
	movl	(%eax), %edx
	movl	4(%eax), %eax
	movl	%eax, -64(%ebp)
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L2318
	movl	%edx, %eax
	andl	$15, %eax
.L2319:
	cmpl	$10, %eax
	je	.L2320
	leal	0(,%ecx,4), %eax
	movzbl	%al, %eax
	orl	$1, %eax
	movl	%eax, current_lookup_fault
	movl	$3, %eax
	movl	$6, current_syscall_error+24
	movl	$0, current_syscall_error+20
	movl	$0, current_lookup_fault+4
	jmp	.L2343
.L2315:
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
	je	.L2317
	movl	%edx, %eax
	jmp	.L2343
.L2320:
	movl	-64(%ebp), %ecx
	movl	$1, %eax
	andl	$260046848, %ecx
	shrl	$23, %ecx
	sall	%cl, %eax
	leal	-1(%eax), %ecx
	cmpl	-60(%ebp), %ecx
	jae	.L2321
	movl	$4, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+8
	movl	%ecx, current_syscall_error+12
	jmp	.L2343
.L2318:
	movzbl	%dl, %eax
	jmp	.L2319
.L2321:
	movl	-56(%ebp), %ecx
	subl	$1, %ecx
	cmpl	$255, %ecx
	jbe	.L2322
	movl	$4, current_syscall_error+24
	movl	$3, %eax
	movl	$1, current_syscall_error+8
	movl	$256, current_syscall_error+12
	jmp	.L2343
.L2322:
	subl	-60(%ebp), %eax
	cmpl	-56(%ebp), %eax
	jae	.L2323
	movl	%eax, current_syscall_error+12
	movl	$3, %eax
	movl	$4, current_syscall_error+24
	movl	$1, current_syscall_error+8
	jmp	.L2343
.L2323:
	andl	$2147483632, %edx
	movl	-60(%ebp), %ecx
	leal	(%edx,%edx), %eax
	movl	%eax, -64(%ebp)
	movl	-56(%ebp), %eax
	movl	%ecx, -32(%ebp)
	leal	(%eax,%ecx), %edx
	movl	%eax, -28(%ebp)
	movl	%edx, -60(%ebp)
.L2324:
	cmpl	-60(%ebp), %ecx
	jae	.L2346
	movl	-64(%ebp), %edx
	movl	%ecx, %eax
	sall	$4, %eax
	movl	(%eax,%edx), %eax
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L2325
	andl	$15, %eax
.L2326:
	testl	%eax, %eax
	je	.L2327
	movl	$8, current_syscall_error+24
	movl	$3, %eax
	jmp	.L2343
.L2346:
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
	jbe	.L2347
.L2330:
	movl	%eax, current_syscall_error+16
	movl	$3, %eax
	movl	$10, current_syscall_error+24
	jmp	.L2343
.L2327:
	addl	$1, %ecx
	jmp	.L2324
.L2325:
	movzbl	%al, %eax
	jmp	.L2326
.L2347:
	movl	%eax, %esi
	movl	%edi, %ecx
	shrl	%cl, %esi
	cmpl	-56(%ebp), %esi
	jb	.L2330
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
	jmp	.L2343
	.cfi_endproc
.LFE537:
	.size	decodeUntypedInvocation, .-decodeUntypedInvocation
	.section	.boot.text
	.p2align 4,,15
	.globl	acpi_table_init
	.type	acpi_table_init, @function
acpi_table_init:
.LFB541:
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
	je	.L2351
	cmpl	$1, %edi
	jne	.L2358
	addl	4(%ebx), %esi
.L2357:
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
.L2358:
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
.L2351:
	.cfi_restore_state
	addl	20(%ebx), %esi
	jmp	.L2357
	.cfi_endproc
.LFE541:
	.size	acpi_table_init, .-acpi_table_init
	.p2align 4,,15
	.globl	acpi_init
	.type	acpi_init, @function
acpi_init:
.LFB542:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$917504, %ebx
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.p2align 4,,7
	.p2align 3
.L2360:
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L2370:
	movzbl	(%ebx,%eax), %edx
	cmpb	%dl, acpi_str_rsd(%eax)
	jne	.L2365
	testb	%dl, %dl
	je	.L2362
	addl	$1, %eax
	cmpl	$8, %eax
	jne	.L2370
.L2362:
	leal	20(%ebx), %ecx
	movl	%ebx, %eax
	xorl	%edx, %edx
	.p2align 4,,7
	.p2align 3
.L2364:
	addb	(%eax), %dl
	addl	$1, %eax
	cmpl	%eax, %ecx
	jne	.L2364
	testb	%dl, %dl
	je	.L2367
.L2365:
	addl	$16, %ebx
	cmpl	$1048576, %ebx
	jne	.L2360
.L2371:
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.L2367:
	.cfi_restore_state
	testl	%ebx, %ebx
	je	.L2371
	movl	%ebx, (%esp)
	movl	$0, 4(%esp)
	call	acpi_table_init
	movl	16(%eax), %ebx
	movl	$1, 4(%esp)
	movl	%ebx, (%esp)
	call	acpi_table_init
	movl	4(%eax), %ecx
	testl	%ecx, %ecx
	je	.L2374
	addl	%eax, %ecx
	xorl	%edx, %edx
	.p2align 4,,7
	.p2align 3
.L2373:
	addb	(%eax), %dl
	addl	$1, %eax
	cmpl	%ecx, %eax
	jne	.L2373
	testb	%dl, %dl
	jne	.L2371
.L2374:
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE542:
	.size	acpi_init, .-acpi_init
	.p2align 4,,15
	.globl	acpi_madt_scan
	.type	acpi_madt_scan, @function
acpi_madt_scan:
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
	movl	48(%esp), %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	acpi_table_init
	movl	%eax, %ebp
	movl	4(%eax), %eax
	subl	$36, %eax
	movl	%eax, 12(%esp)
	shrl	$2, 12(%esp)
	movl	12(%esp), %eax
	testl	%eax, %eax
	je	.L2393
	xorl	%esi, %esi
	xorl	%edi, %edi
	.p2align 4,,7
	.p2align 3
.L2392:
	movl	$1, 4(%esp)
	movl	36(%ebp,%esi,4), %eax
	movl	%eax, (%esp)
	call	acpi_table_init
	xorl	%edx, %edx
.L2386:
	movzbl	acpi_str_apic(%edx), %ecx
	cmpb	%cl, (%eax,%edx)
	jne	.L2387
	testb	%cl, %cl
	je	.L2385
	addl	$1, %edx
	cmpl	$4, %edx
	jne	.L2386
.L2385:
	movl	4(%eax), %ebx
	leal	44(%eax), %edx
	leal	(%eax,%ebx), %ecx
	cmpl	%ecx, %edx
	jb	.L2391
	jmp	.L2387
	.p2align 4,,7
	.p2align 3
.L2388:
	movzbl	1(%edx), %ecx
	addl	%ecx, %edx
	leal	(%eax,%ebx), %ecx
	cmpl	%ecx, %edx
	jae	.L2387
.L2391:
	cmpb	$0, (%edx)
	jne	.L2388
	cmpl	$1, 4(%edx)
	movzbl	3(%edx), %ecx
	jne	.L2388
	cmpl	%edi, 56(%esp)
	jbe	.L2390
	movl	52(%esp), %ebx
	movl	%ecx, (%ebx,%edi,4)
	movl	4(%eax), %ebx
.L2390:
	movzbl	1(%edx), %ecx
	addl	$1, %edi
	addl	%ecx, %edx
	leal	(%eax,%ebx), %ecx
	cmpl	%ecx, %edx
	jb	.L2391
	.p2align 4,,7
	.p2align 3
.L2387:
	addl	$1, %esi
	cmpl	12(%esp), %esi
	jne	.L2392
.L2383:
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
.L2393:
	.cfi_restore_state
	xorl	%edi, %edi
	jmp	.L2383
	.cfi_endproc
.LFE543:
	.size	acpi_madt_scan, .-acpi_madt_scan
	.text
	.p2align 4,,15
	.globl	handleReservedIRQ
	.type	handleReservedIRQ, @function
handleReservedIRQ:
.LFB546:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE546:
	.size	handleReservedIRQ, .-handleReservedIRQ
	.p2align 4,,15
	.globl	getActiveIRQ
	.type	getActiveIRQ, @function
getActiveIRQ:
.LFB547:
	.cfi_startproc
	movl	ia32KScurInterrupt, %eax
	cmpl	$-1, %eax
	je	.L2405
	subl	$32, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L2405:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE547:
	.size	getActiveIRQ, .-getActiveIRQ
	.p2align 4,,15
	.globl	handleSpuriousIRQ
	.type	handleSpuriousIRQ, @function
handleSpuriousIRQ:
.LFB550:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE550:
	.size	handleSpuriousIRQ, .-handleSpuriousIRQ
	.p2align 4,,15
	.globl	resetTimer
	.type	resetTimer, @function
resetTimer:
.LFB551:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE551:
	.size	resetTimer, .-resetTimer
	.section	.boot.text
	.p2align 4,,15
	.globl	pci_scan
	.type	pci_scan, @function
pci_scan:
.LFB558:
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
.L2409:
	movl	%edi, %ebp
	xorl	%ebx, %ebx
	sall	$16, %ebp
	xorl	%esi, %esi
	movw	%di, 12(%esp)
	orl	$-2147483636, %ebp
	jmp	.L2417
	.p2align 4,,7
	.p2align 3
.L2410:
	addl	$1, %ebx
	cmpl	$32, %ebx
	je	.L2431
.L2417:
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	movl	%edi, %eax
	call	pci_scan_fun
	testl	%eax, %eax
	je	.L2410
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
	js	.L2411
.L2412:
	addl	$1, %ebx
	movl	$1, %esi
	cmpl	$32, %ebx
	jne	.L2417
.L2431:
	testl	%esi, %esi
	je	.L2415
	cmpb	$0, 15(%esp)
	je	.L2415
	movzwl	12(%esp), %ecx
	movl	$1, %eax
	movl	%ecx, %edx
	sall	%cl, %eax
	movl	48(%esp), %ecx
	shrw	$5, %dx
	movzwl	%dx, %edx
	orl	%eax, (%ecx,%edx,4)
.L2415:
	addl	$1, %edi
	cmpl	$256, %edi
	jne	.L2409
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
.L2411:
	.cfi_restore_state
	movl	$1, %esi
	.p2align 4,,7
	.p2align 3
.L2413:
	movl	%esi, %ecx
	movl	%ebx, %edx
	movl	%edi, %eax
	addl	$1, %esi
	call	pci_scan_fun
	cmpl	$8, %esi
	jne	.L2413
	jmp	.L2412
	.cfi_endproc
.LFE558:
	.size	pci_scan, .-pci_scan
	.text
	.p2align 4,,15
	.globl	platAddDevices
	.type	platAddDevices, @function
platAddDevices:
.LFB544:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	$0, (%esp)
	call	pci_scan
	movl	glks+188, %eax
	cmpl	$199, %eax
	ja	.L2432
	leal	glks+176(,%eax,8), %edx
	addl	$1, %eax
	movl	$753664, 16(%edx)
	movl	$757760, 20(%edx)
	movl	%eax, glks+188
.L2432:
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE544:
	.size	platAddDevices, .-platAddDevices
	.section	.boot.text
	.p2align 4,,15
	.globl	pic_remap_irqs
	.type	pic_remap_irqs, @function
pic_remap_irqs:
.LFB559:
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
.LFE559:
	.size	pic_remap_irqs, .-pic_remap_irqs
	.text
	.p2align 4,,15
	.globl	pic_mask_irq
	.type	pic_mask_irq, @function
pic_mask_irq:
.LFB560:
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
	jg	.L2438
	movl	$1, %esi
	movl	$33, %ebx
	sall	%cl, %esi
	testl	%eax, %eax
	movl	%ebx, (%esp)
	jne	.L2443
.L2440:
	call	in8
	notl	%esi
	andl	%esi, %eax
.L2442:
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
.L2438:
	.cfi_restore_state
	subl	$8, %ecx
	movl	$1, %edx
	sall	%cl, %edx
	movl	$161, %ebx
	testl	%eax, %eax
	movl	%edx, %esi
	movl	%ebx, (%esp)
	je	.L2440
.L2443:
	call	in8
	orl	%esi, %eax
	jmp	.L2442
	.cfi_endproc
.LFE560:
	.size	pic_mask_irq, .-pic_mask_irq
	.p2align 4,,15
	.globl	maskInterrupt
	.type	maskInterrupt, @function
maskInterrupt:
.LFB545:
	.cfi_startproc
	movl	8(%esp), %eax
	cmpl	$15, %eax
	jle	.L2446
	rep ret
	.p2align 4,,7
	.p2align 3
.L2446:
	jmp	pic_mask_irq
	.cfi_endproc
.LFE545:
	.size	maskInterrupt, .-maskInterrupt
	.p2align 4,,15
	.globl	invokeIRQHandler_AckIRQ
	.type	invokeIRQHandler_AckIRQ, @function
invokeIRQHandler_AckIRQ:
.LFB486:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	cmpl	$15, %eax
	jg	.L2447
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	pic_mask_irq
.L2447:
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE486:
	.size	invokeIRQHandler_AckIRQ, .-invokeIRQHandler_AckIRQ
	.p2align 4,,15
	.globl	setIRQState
	.type	setIRQState, @function
setIRQState:
.LFB493:
	.cfi_startproc
	movl	8(%esp), %eax
	movl	4(%esp), %edx
	cmpl	$15, %eax
	movl	%edx, intStateIRQTable(,%eax,4)
	jle	.L2452
	rep ret
	.p2align 4,,7
	.p2align 3
.L2452:
	xorl	%eax, %eax
	testl	%edx, %edx
	sete	%al
	movl	%eax, 4(%esp)
	jmp	pic_mask_irq
	.cfi_endproc
.LFE493:
	.size	setIRQState, .-setIRQState
	.section	.boot.text
	.p2align 4,,15
	.globl	init_node_state
	.type	init_node_state, @function
init_node_state:
.LFB281:
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
	movl	28(%ebp), %eax
	movl	32(%ebp), %ebx
	movl	$0, ndks_boot+8
	movl	$0, ndks_boot+12
	movl	%eax, %edi
	subl	$536870912, %edi
	movl	%eax, -60(%ebp)
	movl	36(%ebp), %eax
	movl	%edi, -72(%ebp)
	leal	-536870912(%ebx), %edi
	movl	%edi, -76(%ebp)
	movl	20(%ebp), %edi
	movl	%eax, -56(%ebp)
	movl	8(%ebp), %eax
	subl	$536870912, %edi
	movl	%edi, -64(%ebp)
	movl	16(%ebp), %edi
	leal	-536870912(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, ndks_boot
	subl	$536870912, %edi
	subl	$536870912, %eax
	movl	%edi, -80(%ebp)
	movl	48(%ebp), %edi
	movl	%eax, ndks_boot+4
	movl	64(%ebp), %eax
	subl	$536870912, %edi
	movl	%edi, -68(%ebp)
	movl	44(%ebp), %edi
	movl	%eax, 4(%esp)
	movl	60(%ebp), %eax
	subl	$536870912, %edi
	movl	%eax, (%esp)
	movl	%edi, -84(%ebp)
	call	init_vm_state
	testl	%eax, %eax
	jne	.L2454
.L2532:
	xorl	%eax, %eax
.L2583:
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
.L2454:
	.cfi_restore_state
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	create_root_cnode
	movl	-48(%ebp), %edi
	movl	-44(%ebp), %eax
	movl	%edi, %ecx
	movl	%edi, %edx
	movl	%eax, -52(%ebp)
	andl	$14, %ecx
	movl	%edi, %eax
	andl	$15, %eax
	subl	$4, %esp
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$62, %eax
	ja	.L2505
	jmp	*.L2460(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L2460:
	.long	.L2540
	.long	.L2467
	.long	.L2466
	.long	.L2467
	.long	.L2466
	.long	.L2467
	.long	.L2466
	.long	.L2540
	.long	.L2540
	.long	.L2467
	.long	.L2468
	.long	.L2540
	.long	.L2469
	.long	.L2505
	.long	.L2540
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2540
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2470
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2540
	.section	.boot.text
.L2467:
	movl	%edi, %eax
	andl	$16777200, %eax
	sall	$8, %eax
.L2459:
	movl	$11, 112(%eax)
	movl	$65535, 116(%eax)
	movl	$0, 120(%eax)
	movl	$3, 124(%eax)
	movl	-52(%ebp), %eax
	movl	%edi, (%esp)
	movl	%eax, 4(%esp)
	call	create_domain_cap
	call	create_irq_cnode
	testl	%eax, %eax
	je	.L2532
	movl	%ebx, -88(%ebp)
	xorl	%esi, %esi
	movl	52(%ebp), %ebx
	jmp	.L2473
	.p2align 4,,7
	.p2align 3
.L2551:
	cmpl	$15, %esi
	movl	$3, intStateIRQTable(,%esi,4)
	jle	.L2589
.L2478:
	addl	$1, %esi
	cmpl	$31, %esi
	je	.L2590
.L2473:
	cmpl	$2, %esi
	je	.L2551
	cmpl	$30, %esi
	je	.L2551
	cmpl	$15, %esi
	.p2align 4,,2
	ja	.L2479
	testl	%ebx, %ebx
	.p2align 4,,3
	je	.L2480
	movl	$3, intStateIRQTable(,%esi,4)
	jmp	.L2478
.L2466:
	movl	%edi, %eax
	andl	$-16, %eax
	jmp	.L2459
.L2505:
	call	halt
	.p2align 4,,7
	.p2align 3
.L2479:
	movl	$0, intStateIRQTable(,%esi,4)
	jmp	.L2478
	.p2align 4,,7
	.p2align 3
.L2589:
	movl	%esi, 4(%esp)
	movl	$0, (%esp)
	call	pic_mask_irq
	jmp	.L2478
	.p2align 4,,7
	.p2align 3
.L2480:
	movl	%esi, 4(%esp)
	movl	$1, (%esp)
	movl	$0, intStateIRQTable(,%esi,4)
	call	pic_mask_irq
	jmp	.L2478
.L2468:
	movl	%edi, %eax
	andl	$2147483632, %eax
	addl	%eax, %eax
	jmp	.L2459
.L2470:
	movl	%edi, %eax
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L2541
	leal	1(%eax), %ecx
	movl	$-1, %eax
	sall	%cl, %eax
.L2471:
	andl	-52(%ebp), %eax
	jmp	.L2459
.L2469:
	movl	%edi, %eax
	andl	$-1024, %eax
	jmp	.L2459
.L2540:
	xorl	%eax, %eax
	jmp	.L2459
.L2541:
	movl	$-16, %eax
	jmp	.L2471
.L2590:
	movl	%edi, %ecx
	movl	%edi, %eax
	movl	-88(%ebp), %ebx
	andl	$14, %ecx
	movl	%edi, %edx
	andl	$15, %edx
	movzbl	%al, %eax
	cmpl	$14, %ecx
	cmovne	%edx, %eax
	cmpl	$62, %eax
	movl	$2, intStateIRQTable+124
	ja	.L2505
	jmp	*.L2486(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L2486:
	.long	.L2542
	.long	.L2493
	.long	.L2492
	.long	.L2493
	.long	.L2492
	.long	.L2493
	.long	.L2492
	.long	.L2542
	.long	.L2542
	.long	.L2493
	.long	.L2494
	.long	.L2542
	.long	.L2495
	.long	.L2505
	.long	.L2542
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2542
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2496
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2542
	.section	.boot.text
.L2493:
	movl	%edi, %eax
	andl	$16777200, %eax
	sall	$8, %eax
.L2485:
	movl	$14, 64(%eax)
	movl	$0, 68(%eax)
	movl	$0, 72(%eax)
	movl	$3, 76(%eax)
	movl	56(%ebp), %eax
	subl	-56(%ebp), %ebx
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%ebx, 8(%esp)
	movl	%ebx, -96(%ebp)
	movl	%eax, (%esp)
	call	allocate_bi_frame
	testl	%eax, %eax
	movl	%eax, -100(%ebp)
	je	.L2532
	movl	$12, (%esp)
	call	alloc_region
	testl	%eax, %eax
	movl	%eax, %ebx
	je	.L2532
	leal	4096(%ebx), %edx
	.p2align 4,,7
	.p2align 3
.L2500:
	movl	$0, (%eax)
	addl	$4, %eax
	cmpl	%edx, %eax
	jne	.L2500
	movl	ia32KSkernelPD, %ecx
	leal	3584(%ebx), %eax
	subl	%ebx, %ecx
	.p2align 4,,7
	.p2align 3
.L2502:
	movl	(%ecx,%eax), %esi
	addl	$4, %eax
	movl	%esi, -4(%eax)
	cmpl	%edx, %eax
	jne	.L2502
	andl	$-4096, %ebx
	movl	%edi, %ecx
	shrl	$8, %ebx
	andl	$14, %ecx
	movl	%edi, %eax
	movl	%edi, %edx
	andl	$15, %eax
	orl	$5, %ebx
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$62, %eax
	ja	.L2505
	jmp	*.L2507(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L2507:
	.long	.L2544
	.long	.L2514
	.long	.L2513
	.long	.L2514
	.long	.L2513
	.long	.L2514
	.long	.L2513
	.long	.L2544
	.long	.L2544
	.long	.L2514
	.long	.L2515
	.long	.L2544
	.long	.L2516
	.long	.L2505
	.long	.L2544
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2544
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2517
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2505
	.long	.L2544
	.section	.boot.text
.L2492:
	movl	%edi, %eax
	andl	$-16, %eax
	jmp	.L2485
.L2494:
	movl	%edi, %eax
	andl	$2147483632, %eax
	addl	%eax, %eax
	jmp	.L2485
.L2542:
	xorl	%eax, %eax
	jmp	.L2485
.L2495:
	movl	%edi, %eax
	andl	$-1024, %eax
	jmp	.L2485
.L2496:
	movl	%edi, %eax
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L2543
	leal	1(%eax), %ecx
	movl	$-1, %eax
	sall	%cl, %eax
.L2497:
	andl	-52(%ebp), %eax
	jmp	.L2485
.L2514:
	movl	%edi, %eax
	andl	$16777200, %eax
	sall	$8, %eax
.L2506:
	movl	-96(%ebp), %esi
	movl	%ebx, 48(%eax)
	movl	$65537, 52(%eax)
	movl	$0, 56(%eax)
	addl	$8192, %esi
	movl	%esi, %ecx
	movl	%esi, -92(%ebp)
	movl	-60(%ebp), %esi
	subl	-56(%ebp), %esi
	movl	$3, 60(%eax)
	movl	ndks_boot+20, %eax
	andl	$-4194304, %esi
	cmpl	%esi, %ecx
	movl	%eax, -104(%ebp)
	jbe	.L2546
	movl	%ebx, -60(%ebp)
	movl	%edi, -88(%ebp)
	.p2align 4,,7
	.p2align 3
.L2523:
	movl	$12, (%esp)
	call	alloc_region
	testl	%eax, %eax
	je	.L2532
	movl	%eax, %edx
	leal	4096(%eax), %ecx
	.p2align 4,,7
	.p2align 3
.L2521:
	movl	$0, (%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jne	.L2521
	andl	$-4096, %eax
	movl	%esi, %ebx
	movl	%eax, %edi
	movl	-60(%ebp), %eax
	shrl	$22, %ebx
	shrl	$8, %edi
	orl	$67109888, %ebx
	orl	$3, %edi
	movl	%eax, (%esp)
	movl	%edi, 8(%esp)
	movl	%ebx, 12(%esp)
	movl	$65537, 4(%esp)
	call	map_it_pt_cap
	movl	-88(%ebp), %eax
	movl	%edi, 8(%esp)
	movl	%ebx, 12(%esp)
	movl	%eax, (%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	call	provide_cap
	testl	%eax, %eax
	je	.L2532
	addl	$4194304, %esi
	cmpl	%esi, -92(%ebp)
	ja	.L2523
	movl	-60(%ebp), %ebx
	movl	-88(%ebp), %edi
	movl	ndks_boot+20, %edx
.L2519:
	movl	ndks_boot+16, %eax
	movl	-104(%ebp), %esi
	movl	%edx, 44(%eax)
	movl	%esi, 40(%eax)
	movl	-96(%ebp), %esi
	movl	%ebx, 8(%esp)
	movl	$65537, 12(%esp)
	movl	%edi, (%esp)
	movl	%esi, %eax
	addl	$4096, %eax
	movl	%eax, 20(%esp)
	movl	%eax, -60(%ebp)
	movl	-100(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	call	create_bi_frame_cap
	movl	-52(%ebp), %eax
	movl	%esi, 20(%esp)
	movl	%ebx, 12(%esp)
	movl	$65537, 16(%esp)
	movl	%eax, 8(%esp)
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edi, 4(%esp)
	call	create_ipcbuf_frame
	movl	-48(%ebp), %esi
	movl	-44(%ebp), %eax
	movl	%esi, %ecx
	movl	%esi, %edx
	movl	%eax, -88(%ebp)
	andl	$14, %ecx
	movl	%esi, %eax
	andl	$15, %eax
	subl	$4, %esp
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L2532
	movl	-56(%ebp), %eax
	movl	$1, 28(%esp)
	movl	%ebx, 12(%esp)
	movl	$65537, 16(%esp)
	movl	%eax, 32(%esp)
	movl	-72(%ebp), %eax
	movl	%edi, 4(%esp)
	movl	%eax, 20(%esp)
	movl	-76(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	create_frames_of_region
	movl	-28(%ebp), %edx
	subl	$4, %esp
	testl	%edx, %edx
	je	.L2532
	movl	ndks_boot+16, %ecx
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%eax, 32(%ecx)
	movl	-52(%ebp), %eax
	movl	%edx, 36(%ecx)
	movl	%edi, 4(%esp)
	movl	%eax, 8(%esp)
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	create_it_asid_pool
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %ecx
	movl	%eax, %edx
	andl	$14, %edx
	movl	%edx, -56(%ebp)
	movl	%eax, %edx
	subl	$4, %esp
	andl	$15, %edx
	cmpl	$14, -56(%ebp)
	movl	%ecx, -72(%ebp)
	movzbl	%al, %ecx
	cmove	%ecx, %edx
	testl	%edx, %edx
	je	.L2532
	movl	%eax, (%esp)
	movl	-72(%ebp), %eax
	movl	%ebx, 8(%esp)
	movl	$65537, 12(%esp)
	movl	%eax, 4(%esp)
	call	write_it_asid_pool
	call	resetFpu
	movl	$ia32KSnullFpuState, (%esp)
	call	saveFpuState
	movl	$0, ia32KSfpuOwner
	call	create_idle_thread
	testl	%eax, %eax
	je	.L2532
	movl	-88(%ebp), %eax
	movl	%esi, 28(%esp)
	movl	%ebx, 8(%esp)
	movl	$65537, 12(%esp)
	movl	%eax, 32(%esp)
	movl	-96(%ebp), %eax
	movl	%edi, (%esp)
	movl	%eax, 24(%esp)
	movl	-60(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	call	create_initial_thread
	testl	%eax, %eax
	je	.L2532
	movl	-84(%ebp), %eax
	movl	%edi, (%esp)
	movl	%eax, 8(%esp)
	movl	-68(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	call	create_untypeds
	testl	%eax, %eax
	je	.L2532
	movl	24(%ebp), %eax
	movl	$0, -56(%ebp)
	movl	ndks_boot+16, %ecx
	movl	(%eax), %edx
	movl	ndks_boot+20, %eax
	movl	%eax, -60(%ebp)
	movl	24(%ebp), %eax
	addl	$4, %eax
	testl	%edx, %edx
	movl	%eax, -68(%ebp)
	je	.L2529
	movl	%ebx, -84(%ebp)
.L2582:
	movl	-68(%ebp), %eax
	xorl	%esi, %esi
	movl	(%eax), %ebx
	movl	4(%eax), %eax
	movl	%ebx, -72(%ebp)
	subl	$536870912, %ebx
	testl	$4194303, %ebx
	leal	-536870912(%eax), %ecx
	jne	.L2530
	xorl	%eax, %eax
	testl	$4194303, %ecx
	sete	%al
	movl	%eax, %esi
.L2530:
	cmpl	%ecx, %ebx
	jae	.L2548
	movl	%esi, %eax
	sall	$31, %eax
	movl	%eax, -76(%ebp)
.L2536:
	movl	%ebx, %eax
	andl	$-4096, %eax
	shrl	$8, %eax
	orl	$50331649, %eax
	movl	%eax, 8(%esp)
	movl	-76(%ebp), %eax
	movl	%edi, (%esp)
	movl	%ecx, -88(%ebp)
	movl	%eax, 12(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	call	provide_cap
	testl	%eax, %eax
	je	.L2532
	cmpl	$1, %esi
	movl	$4194304, %ecx
	movl	$4096, %eax
	cmove	%ecx, %eax
	movl	-88(%ebp), %ecx
	addl	%eax, %ebx
	cmpl	%ebx, %ecx
	ja	.L2536
	movl	ndks_boot+20, %ebx
.L2531:
	cmpl	$1, %esi
	movl	$12, %ecx
	movl	-72(%ebp), %edx
	movl	$22, %eax
	cmovne	%ecx, %eax
	movl	ndks_boot+16, %ecx
	movl	%eax, -76(%ebp)
	movl	-56(%ebp), %eax
	addl	$1, -56(%ebp)
	addl	$8, -68(%ebp)
	leal	55(%eax), %esi
	sall	$4, %esi
	addl	%ecx, %esi
	leal	12(%esi), %eax
	movl	%edx, 12(%esi)
	movl	-76(%ebp), %esi
	movl	%ebx, 12(%eax)
	movl	%esi, 4(%eax)
	movl	-60(%ebp), %esi
	movl	%esi, 8(%eax)
	movl	24(%ebp), %eax
	movl	(%eax), %edx
	cmpl	%edx, -56(%ebp)
	jae	.L2586
	movl	%ebx, -60(%ebp)
	jmp	.L2582
	.p2align 4,,7
	.p2align 3
.L2513:
	movl	%edi, %eax
	andl	$-16, %eax
	jmp	.L2506
.L2516:
	movl	%edi, %eax
	andl	$-1024, %eax
	jmp	.L2506
.L2515:
	movl	%edi, %eax
	andl	$2147483632, %eax
	addl	%eax, %eax
	jmp	.L2506
.L2544:
	xorl	%eax, %eax
	jmp	.L2506
.L2517:
	movl	%edi, %eax
	andl	$16128, %eax
	shrl	$8, %eax
	cmpl	$32, %eax
	je	.L2545
	leal	1(%eax), %ecx
	movl	$-1, %eax
	sall	%cl, %eax
.L2518:
	andl	-52(%ebp), %eax
	jmp	.L2506
.L2543:
	movl	$-16, %eax
	jmp	.L2497
.L2545:
	movl	$-16, %eax
	jmp	.L2518
.L2586:
	movl	-84(%ebp), %ebx
.L2529:
	movl	-80(%ebp), %eax
	movl	%edx, 888(%ecx)
	movl	$0, 32(%esp)
	movl	$0, 28(%esp)
	movl	%eax, 20(%esp)
	movl	-64(%ebp), %eax
	movl	%ebx, 12(%esp)
	movl	$65537, 16(%esp)
	movl	%edi, 4(%esp)
	movl	%eax, 24(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	create_frames_of_region
	movl	-28(%ebp), %eax
	subl	$4, %esp
	testl	%eax, %eax
	je	.L2532
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
	jmp	.L2583
.L2546:
	movl	-104(%ebp), %edx
	jmp	.L2519
.L2548:
	movl	-60(%ebp), %ebx
	jmp	.L2531
	.cfi_endproc
.LFE281:
	.size	init_node_state, .-init_node_state
	.p2align 4,,15
	.type	try_boot_node, @function
try_boot_node:
.LFB290:
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
	call	cur_cpu_id
	movl	glks+24, %esi
	testl	%esi, %esi
	je	.L2592
	xorl	%ebx, %ebx
	cmpl	glks+28, %eax
	je	.L2616
	.p2align 4,,7
	.p2align 3
.L2595:
	addl	$1, %ebx
	cmpl	%esi, %ebx
	je	.L2592
	cmpl	glks+28(,%ebx,4), %eax
	jne	.L2595
.L2593:
	movl	%ebx, %eax
	movl	glks, %edi
	sall	$4, %eax
	movl	glks+60(%eax), %edx
	movl	%edx, 80(%esp)
	movl	glks+64(%eax), %edx
	movl	%edx, 84(%esp)
	movl	glks+68(%eax), %edx
	addl	$glks+48, %eax
	movl	24(%eax), %eax
	movl	%edx, 88(%esp)
	xorl	%edx, %edx
	movl	%eax, 92(%esp)
	movl	glks+4, %eax
	subl	%edi, %eax
	shrl	$12, %eax
	divl	%esi
	cmpl	%edx, %ebx
	jb	.L2617
	movl	%ebx, %ebp
	subl	%edx, %ebp
	leal	1(%eax), %ecx
	imull	%eax, %ebp
	imull	%edx, %ecx
	addl	%ebp, %ecx
.L2615:
	sall	$12, %ecx
	movl	$1048576, %edx
	addl	%edi, %ecx
	movl	%ebx, %edi
	sall	$12, %eax
	addl	%ecx, %eax
	movl	%eax, 76(%esp)
	xorl	%eax, %eax
	cmpl	$1, %esi
	cmovne	%eax, %edx
	movl	%edx, 68(%esp)
	movl	$ki_boot_end+536870912, %edx
	cmove	%edx, %eax
	movl	%eax, 72(%esp)
	leal	(%ebx,%ebx,2), %eax
	sall	$12, %eax
	sall	$12, %edi
	leal	ndks_list+536883200(%eax), %edx
	addl	$ndks_list+536870912, %eax
	leal	kernel_pt_list(%edi), %ebp
	addl	$kernel_pd_list, %edi
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	%ebp, 4(%esp)
	movl	%edi, (%esp)
	movl	%ecx, 64(%esp)
	call	map_kernel_window
	xorl	%edx, %edx
	movl	64(%esp), %ecx
	testl	%eax, %eax
	je	.L2608
	leal	536870912(%edi), %eax
#APP
# 35 "./include/arch/ia32/arch/machine/cpu_registers.h" 1
	movl %eax, %cr3
# 0 "" 2
#NO_APP
	movl	68(%esp), %eax
	movl	glks+20, %edx
	movl	%ebp, 56(%esp)
	movl	%edi, 52(%esp)
	movl	%eax, 36(%esp)
	movl	72(%esp), %eax
	movl	%edx, 12(%esp)
	movl	%esi, 48(%esp)
	movl	%ebx, 44(%esp)
	movl	%eax, 40(%esp)
	movl	80(%esp), %eax
	movl	$glks+188, 16(%esp)
	movl	%ecx, (%esp)
	movl	%eax, 20(%esp)
	movl	84(%esp), %eax
	movl	%eax, 24(%esp)
	movl	88(%esp), %eax
	movl	%eax, 28(%esp)
	movl	92(%esp), %eax
	movl	%eax, 32(%esp)
	movl	glks+16, %eax
	movl	%eax, 8(%esp)
	movl	76(%esp), %eax
	movl	%eax, 4(%esp)
	call	init_node_state
	xorl	%edx, %edx
	testl	%eax, %eax
	jne	.L2618
.L2608:
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
.L2617:
	.cfi_restore_state
	addl	$1, %eax
	movl	%ebx, %ecx
	imull	%eax, %ecx
	jmp	.L2615
	.p2align 4,,7
	.p2align 3
.L2618:
	xorl	%eax, %eax
	testl	%ebx, %ebx
	setne	%al
	movl	%eax, 4(%esp)
	movl	glks+1792, %eax
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
.L2616:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L2593
.L2592:
	call	halt
	.cfi_endproc
.LFE290:
	.size	try_boot_node, .-try_boot_node
	.p2align 4,,15
	.globl	boot_node
	.type	boot_node, @function
boot_node:
.LFB291:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	try_boot_node
	testl	%eax, %eax
	je	.L2622
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.L2622:
	.cfi_restore_state
	.p2align 4,,7
	call	halt
	.cfi_endproc
.LFE291:
	.size	boot_node, .-boot_node
	.text
	.p2align 4,,15
	.globl	invokeIRQControl
	.type	invokeIRQControl, @function
invokeIRQControl:
.LFB484:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	cmpl	$15, %ebx
	movl	$1, intStateIRQTable(,%ebx,4)
	jg	.L2624
	movl	%ebx, 4(%esp)
	movl	$0, (%esp)
	call	pic_mask_irq
.L2624:
	movl	36(%esp), %eax
	movzbl	%bl, %ebx
	movl	%ebx, 4(%esp)
	movl	$30, (%esp)
	movl	%eax, 12(%esp)
	movl	40(%esp), %eax
	movl	%eax, 8(%esp)
	call	cteInsert
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE484:
	.size	invokeIRQControl, .-invokeIRQControl
	.p2align 4,,15
	.globl	decodeIRQControlInvocation
	.type	decodeIRQControlInvocation, @function
decodeIRQControlInvocation:
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
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %eax
	cmpl	$20, 8(%ebp)
	movl	16(%ebp), %ebx
	movl	32(%ebp), %edi
	movl	20(%ebp), %edx
	je	.L2640
	movl	$3, current_syscall_error+24
	movl	$3, %eax
.L2638:
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
.L2640:
	.cfi_restore_state
	cmpl	$2, %eax
	jbe	.L2628
	testl	%edx, %edx
	je	.L2628
	movl	ksCurThread, %eax
	movl	12(%edi), %edi
	movl	20(%eax), %esi
	movl	24(%eax), %ecx
	movl	(%edx), %eax
	movl	4(%edx), %edx
	cmpl	$31, %esi
	jbe	.L2631
	movl	$4, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+8
	movl	$31, current_syscall_error+12
	jmp	.L2638
	.p2align 4,,7
	.p2align 3
.L2628:
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
.L2631:
	.cfi_restore_state
	cmpl	$0, intStateIRQTable(,%esi,4)
	je	.L2632
	movl	$9, current_syscall_error+24
	movl	$3, %eax
	jmp	.L2638
.L2632:
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
	jne	.L2638
	movl	(%edi), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L2635
	movl	$8, current_syscall_error+24
	movl	$3, %eax
	jmp	.L2638
.L2635:
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
.LFE483:
	.size	decodeIRQControlInvocation, .-decodeIRQControlInvocation
	.p2align 4,,15
	.globl	deletedIRQHandler
	.type	deletedIRQHandler, @function
deletedIRQHandler:
.LFB490:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	cmpl	$15, %eax
	movl	$0, intStateIRQTable(,%eax,4)
	jg	.L2641
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	pic_mask_irq
.L2641:
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE490:
	.size	deletedIRQHandler, .-deletedIRQHandler
	.p2align 4,,15
	.type	emptySlot, @function
emptySlot:
.LFB458:
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
	movl	(%eax), %ebx
	movl	%ebx, %esi
	movl	%ebx, %ecx
	andl	$14, %esi
	andl	$15, %ecx
	movzbl	%bl, %ebx
	cmpl	$14, %esi
	cmove	%ebx, %ecx
	testl	%ecx, %ecx
	je	.L2644
	movl	12(%eax), %edi
	movl	8(%eax), %esi
	movl	%edi, %ecx
	andl	$-8, %ecx
	andl	$-8, %esi
	je	.L2649
	movl	12(%esi), %ebx
	andl	$7, %ebx
	orl	%ecx, %ebx
	movl	%ebx, 12(%esi)
.L2649:
	testl	%ecx, %ecx
	je	.L2650
	movl	8(%ecx), %ebx
	andl	$1, %edi
	andl	$7, %ebx
	orl	%esi, %ebx
	movl	12(%ecx), %esi
	movl	%ebx, 8(%ecx)
	movl	$1, %ebx
	testl	$1, %esi
	cmove	%edi, %ebx
	andl	$-2, %esi
	orl	%esi, %ebx
	movl	%ebx, 12(%ecx)
.L2650:
	cmpl	$-1, %edx
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	je	.L2644
	cmpl	$15, %edx
	movl	$0, intStateIRQTable(,%edx,4)
	jle	.L2664
.L2644:
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
.L2664:
	.cfi_restore_state
	movl	%edx, 4(%esp)
	movl	$1, (%esp)
	call	pic_mask_irq
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
	ret
	.cfi_endproc
.LFE458:
	.size	emptySlot, .-emptySlot
	.p2align 4,,15
	.globl	cteDeleteOne
	.type	cteDeleteOne, @function
cteDeleteOne:
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
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %ebx
	movl	(%ebx), %eax
	movl	%eax, %ecx
	movl	%eax, %edx
	andl	$14, %ecx
	andl	$15, %edx
	movzbl	%al, %eax
	cmpl	$14, %ecx
	cmove	%eax, %edx
	testl	%edx, %edx
	jne	.L2670
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
.L2670:
	.cfi_restore_state
	movl	%ebx, (%esp)
	call	isFinalCapability
	leal	-36(%ebp), %edx
	movl	$1, 16(%esp)
	movl	%eax, 12(%esp)
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
	movl	%edx, (%esp)
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	call	finaliseCap
	movl	%ebx, %eax
	movl	$-1, %edx
	subl	$4, %esp
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
	jmp	emptySlot
	.cfi_endproc
.LFE463:
	.size	cteDeleteOne, .-cteDeleteOne
	.p2align 4,,15
	.globl	doReplyTransfer
	.type	doReplyTransfer, @function
doReplyTransfer:
.LFB417:
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
	movl	52(%esp), %ebx
	movl	48(%esp), %esi
	movl	56(%esp), %edi
	testb	$7, 604(%ebx)
	jne	.L2672
	movl	$0, 20(%esp)
	movl	%ebx, 16(%esp)
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%esi, (%esp)
	call	doIPCTransfer
	movl	%edi, (%esp)
	call	cteDeleteOne
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$1, %eax
.L2675:
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	movl	$1, %edx
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	jmp	possibleSwitchTo
.L2672:
	.cfi_restore_state
	movl	%edi, (%esp)
	call	cteDeleteOne
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	handleFaultReply
	movl	$0, 604(%ebx)
	movl	$0, 608(%ebx)
	testl	%eax, %eax
	jne	.L2676
	andl	$-16, 592(%ebx)
	movl	%ebx, 48(%esp)
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
	jmp	scheduleTCB
.L2676:
	.cfi_restore_state
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	jmp	.L2675
	.cfi_endproc
.LFE417:
	.size	doReplyTransfer, .-doReplyTransfer
	.p2align 4,,15
	.type	handleReply, @function
handleReply:
.LFB251:
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
	je	.L2677
	cmpl	$8, %eax
	jne	.L2680
	andl	$1, %ebp
	jne	.L2680
	andl	$-16, %edx
	movl	%ebx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	doReplyTransfer
.L2677:
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
.L2680:
	.cfi_restore_state
	call	halt
	.cfi_endproc
.LFE251:
	.size	handleReply, .-handleReply
	.p2align 4,,15
	.globl	performInvocation_Reply
	.type	performInvocation_Reply, @function
performInvocation_Reply:
.LFB508:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	%eax, 8(%esp)
	movl	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	ksCurThread, %eax
	movl	%eax, (%esp)
	call	doReplyTransfer
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE508:
	.size	performInvocation_Reply, .-performInvocation_Reply
	.p2align 4,,15
	.globl	ipcCancel
	.type	ipcCancel, @function
ipcCancel:
.LFB480:
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
	movl	592(%eax), %edx
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L2691
	ja	.L2692
	cmpl	$3, %ecx
	jb	.L2689
	andl	$-16, %edx
	movl	(%edx), %esi
	movl	4(%edx), %edi
	movl	%esi, %ecx
	andl	$-16, %ecx
	movl	%edi, %ebx
	movl	%ecx, 12(%esp)
	movl	652(%eax), %ecx
	andl	$-16, %ebx
	testl	%ecx, %ecx
	je	.L2695
	movl	648(%eax), %ebp
	movl	%ebp, 648(%ecx)
	movl	648(%eax), %ebp
.L2696:
	testl	%ebp, %ebp
	je	.L2700
	movl	%ecx, 652(%ebp)
.L2697:
	movl	%ebx, %ecx
	andl	$15, %edi
	andl	$-16, %ecx
	andl	$15, %esi
	orl	%edi, %ecx
	movl	%ecx, 4(%edx)
	movl	12(%esp), %ecx
	andl	$-16, %ecx
	orl	%esi, %ecx
	testl	%ebx, %ebx
	je	.L2698
.L2706:
	movl	%ecx, (%edx)
	andl	$-16, 592(%eax)
	movl	%eax, 48(%esp)
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
	jmp	scheduleTCB
	.p2align 4,,7
	.p2align 3
.L2692:
	.cfi_restore_state
	cmpl	$6, %ecx
	jne	.L2689
	andl	$-16, %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	asyncIPCCancel
.L2689:
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
.L2691:
	.cfi_restore_state
	movl	$0, 604(%eax)
	movl	$0, 608(%eax)
	andl	$-1024, %eax
	movl	44(%eax), %eax
	andl	$-8, %eax
	je	.L2689
	movl	%eax, 48(%esp)
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
	jmp	cteDeleteOne
	.p2align 4,,7
	.p2align 3
.L2698:
	.cfi_restore_state
	andl	$-4, %ecx
	jmp	.L2706
	.p2align 4,,7
	.p2align 3
.L2700:
	movl	%ecx, 12(%esp)
	jmp	.L2697
	.p2align 4,,7
	.p2align 3
.L2695:
	movl	648(%eax), %ebx
	movl	%ebx, %ebp
	jmp	.L2696
	.cfi_endproc
.LFE480:
	.size	ipcCancel, .-ipcCancel
	.p2align 4,,15
	.globl	suspend
	.type	suspend, @function
suspend:
.LFB414:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	%ebx, (%esp)
	call	ipcCancel
	andl	$-16, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	%ebx, 32(%esp)
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	jmp	tcbSchedDequeue
	.cfi_endproc
.LFE414:
	.size	suspend, .-suspend
	.p2align 4,,15
	.globl	invokeTCB_Suspend
	.type	invokeTCB_Suspend, @function
invokeTCB_Suspend:
.LFB530:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	suspend
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE530:
	.size	invokeTCB_Suspend, .-invokeTCB_Suspend
	.p2align 4,,15
	.globl	invokeTCB_ReadRegisters
	.type	invokeTCB_ReadRegisters, @function
invokeTCB_ReadRegisters:
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
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	ksCurThread, %ebx
	movl	36(%esp), %edx
	movl	32(%esp), %edi
	movl	40(%esp), %esi
	testl	%edx, %edx
	jne	.L2746
.L2712:
	movl	48(%esp), %eax
	testl	%eax, %eax
	je	.L2713
	movl	%ebx, 4(%esp)
	movl	$1, (%esp)
	call	lookupIPCBuffer
	testl	%esi, %esi
	movl	$0, 4(%ebx)
	je	.L2719
	movl	44(%edi), %edx
	cmpl	$1, %esi
	movl	%edx, 20(%ebx)
	jbe	.L2720
	movl	68(%edi), %edx
	testl	%eax, %eax
	movl	%edx, 24(%ebx)
	movl	$2, %edx
	je	.L2715
	cmpl	$2, %esi
	ja	.L2717
.L2715:
	testl	%eax, %eax
	je	.L2722
.L2716:
	xorl	%ecx, %ecx
	cmpl	$10, %esi
	jbe	.L2718
	movl	48(%edi), %ecx
	cmpl	$11, %esi
	movl	%ecx, 44(%eax)
	je	.L2724
	movl	36(%edi), %ecx
	cmpl	$12, %esi
	movl	%ecx, 48(%eax)
	je	.L2725
	movl	40(%edi), %ecx
	movl	%ecx, 52(%eax)
	movl	$3, %ecx
.L2718:
	addl	%ecx, %edx
	andl	$127, %edx
	movl	%edx, 16(%ebx)
.L2713:
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
.L2747:
	.cfi_restore_state
	cmpl	$9, %edx
	ja	.L2716
.L2717:
	addl	$1, %edx
	movl	frameRegisters-4(,%edx,4), %ecx
	cmpl	%edx, %esi
	movl	(%edi,%ecx,4), %ecx
	movl	%ecx, (%eax,%edx,4)
	ja	.L2747
	jmp	.L2716
	.p2align 4,,7
	.p2align 3
.L2746:
	movl	%edi, (%esp)
	call	suspend
	.p2align 4,,5
	jmp	.L2712
	.p2align 4,,7
	.p2align 3
.L2722:
	xorl	%ecx, %ecx
	jmp	.L2718
	.p2align 4,,7
	.p2align 3
.L2719:
	xorl	%edx, %edx
	.p2align 4,,7
	jmp	.L2715
	.p2align 4,,7
	.p2align 3
.L2720:
	movl	$1, %edx
	.p2align 4,,2
	jmp	.L2715
.L2724:
	movl	$1, %ecx
	jmp	.L2718
.L2725:
	movl	$2, %ecx
	jmp	.L2718
	.cfi_endproc
.LFE534:
	.size	invokeTCB_ReadRegisters, .-invokeTCB_ReadRegisters
	.p2align 4,,15
	.globl	decodeReadRegisters
	.type	decodeReadRegisters, @function
decodeReadRegisters:
.LFB523:
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
	jbe	.L2754
	movl	ksCurThread, %eax
	movl	24(%eax), %ebx
	movl	20(%eax), %edi
	leal	-1(%ebx), %ecx
	cmpl	$12, %ecx
	jbe	.L2751
	movl	$4, current_syscall_error+24
	movl	$1, current_syscall_error+8
	movl	$13, current_syscall_error+12
.L2750:
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
.L2754:
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
.L2751:
	.cfi_restore_state
	andl	$-16, %edx
	cmpl	%eax, %edx
	movl	%edx, %ebp
	je	.L2755
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
.L2755:
	.cfi_restore_state
	movl	$3, current_syscall_error+24
	jmp	.L2750
	.cfi_endproc
.LFE523:
	.size	decodeReadRegisters, .-decodeReadRegisters
	.p2align 4,,15
	.globl	restart
	.type	restart, @function
restart:
.LFB415:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	592(%ebx), %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	ja	.L2756
	movl	$1, %eax
	sall	%cl, %eax
	testb	$121, %al
	jne	.L2760
.L2756:
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L2760:
	.cfi_restore_state
	movl	%ebx, (%esp)
	call	ipcCancel
	movl	%ebx, (%esp)
	call	setupReplyMaster
	movl	592(%ebx), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	movl	%ebx, (%esp)
	call	tcbSchedEnqueue
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	xorl	%edx, %edx
	jmp	possibleSwitchTo
	.cfi_endproc
.LFE415:
	.size	restart, .-restart
	.p2align 4,,15
	.globl	invokeTCB_Resume
	.type	invokeTCB_Resume, @function
invokeTCB_Resume:
.LFB531:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	restart
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE531:
	.size	invokeTCB_Resume, .-invokeTCB_Resume
	.p2align 4,,15
	.globl	invokeTCB_CopyRegisters
	.type	invokeTCB_CopyRegisters, @function
invokeTCB_CopyRegisters:
.LFB533:
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
	jne	.L2783
	movl	44(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L2784
.L2765:
	movl	48(%esp), %edx
	testl	%edx, %edx
	je	.L2766
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L2768:
	movl	frameRegisters(,%eax,4), %edx
	addl	$1, %eax
	cmpl	$10, %eax
	movl	(%esi,%edx,4), %ecx
	movl	%ecx, (%ebx,%edx,4)
	jne	.L2768
	movl	44(%ebx), %eax
	movl	%eax, 56(%ebx)
.L2766:
	movl	52(%esp), %eax
	testl	%eax, %eax
	je	.L2769
	movl	48(%esi), %eax
	movl	%eax, 48(%ebx)
	movl	36(%esi), %eax
	movl	%eax, 36(%ebx)
	movl	40(%esi), %eax
	movl	%eax, 40(%ebx)
.L2769:
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
.L2783:
	.cfi_restore_state
	movl	%esi, (%esp)
	call	suspend
	movl	44(%esp), %ecx
	testl	%ecx, %ecx
	je	.L2765
.L2784:
	movl	%ebx, (%esp)
	call	restart
	jmp	.L2765
	.cfi_endproc
.LFE533:
	.size	invokeTCB_CopyRegisters, .-invokeTCB_CopyRegisters
	.p2align 4,,15
	.globl	decodeCopyRegisters
	.type	decodeCopyRegisters, @function
decodeCopyRegisters:
.LFB522:
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
	jne	.L2796
.L2786:
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
.L2796:
	.cfi_restore_state
	testl	%eax, %eax
	je	.L2786
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
	je	.L2797
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
.L2797:
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
.LFE522:
	.size	decodeCopyRegisters, .-decodeCopyRegisters
	.p2align 4,,15
	.globl	invokeTCB_WriteRegisters
	.type	invokeTCB_WriteRegisters, @function
invokeTCB_WriteRegisters:
.LFB535:
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
	je	.L2799
	xorl	%eax, %eax
	jmp	.L2802
	.p2align 4,,7
	.p2align 3
.L2800:
	leal	-9(%ecx), %edi
	cmpl	$1, %edi
	ja	.L2801
	movl	%edx, %edi
	andl	$-9, %edi
	cmpl	$51, %edi
	movl	$0, %edi
	cmovne	%edi, %edx
.L2801:
	addl	$1, %eax
	cmpl	%eax, %ebx
	movl	%edx, (%esi,%ecx,4)
	jbe	.L2799
.L2825:
	cmpl	$9, %eax
	ja	.L2799
.L2802:
	movl	frameRegisters(,%eax,4), %ecx
	movl	12(%ebp,%eax,4), %edx
	cmpl	$16, %ecx
	jne	.L2800
	andl	$4055, %edx
	addl	$1, %eax
	orl	$514, %edx
	cmpl	%eax, %ebx
	movl	%edx, (%esi,%ecx,4)
	ja	.L2825
	.p2align 4,,7
	.p2align 3
.L2799:
	movl	$10, %eax
.L2810:
	cmpl	%eax, %ebx
	jbe	.L2809
	movl	gpRegisters-40(,%eax,4), %ecx
	movl	12(%ebp,%eax,4), %edx
	cmpl	$16, %ecx
	je	.L2826
	leal	-9(%ecx), %edi
	cmpl	$1, %edi
	ja	.L2804
	movl	%edx, %edi
	andl	$-9, %edi
	cmpl	$51, %edi
	movl	$0, %edi
	cmovne	%edi, %edx
.L2804:
	addl	$1, %eax
	cmpl	$13, %eax
	movl	%edx, (%esi,%ecx,4)
	jne	.L2810
.L2809:
	movl	44(%esi), %eax
	movl	%eax, 56(%esi)
	movl	52(%esp), %eax
	testl	%eax, %eax
	je	.L2822
	movl	%esi, (%esp)
	call	restart
.L2822:
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
.L2826:
	.cfi_restore_state
	andl	$4055, %edx
	orl	$514, %edx
	jmp	.L2804
	.cfi_endproc
.LFE535:
	.size	invokeTCB_WriteRegisters, .-invokeTCB_WriteRegisters
	.p2align 4,,15
	.globl	decodeWriteRegisters
	.type	decodeWriteRegisters, @function
decodeWriteRegisters:
.LFB524:
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
	jbe	.L2830
	movl	ksCurThread, %edx
	subl	$2, %eax
	movl	24(%edx), %ebx
	movl	20(%edx), %esi
	cmpl	%ebx, %eax
	jae	.L2833
.L2830:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
.L2829:
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
.L2833:
	.cfi_restore_state
	movl	%ecx, %edi
	andl	$-16, %edi
	cmpl	%edx, %edi
	je	.L2834
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
.L2834:
	.cfi_restore_state
	movl	$3, current_syscall_error+24
	movl	$3, %eax
	jmp	.L2829
	.cfi_endproc
.LFE524:
	.size	decodeWriteRegisters, .-decodeWriteRegisters
	.p2align 4,,15
	.globl	invokeIRQHandler_SetIRQHandler
	.type	invokeIRQHandler_SetIRQHandler, @function
invokeIRQHandler_SetIRQHandler:
.LFB487:
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
.LFE487:
	.size	invokeIRQHandler_SetIRQHandler, .-invokeIRQHandler_SetIRQHandler
	.p2align 4,,15
	.globl	invokeIRQHandler_ClearIRQHandler
	.type	invokeIRQHandler_ClearIRQHandler, @function
invokeIRQHandler_ClearIRQHandler:
.LFB488:
	.cfi_startproc
	movl	4(%esp), %eax
	sall	$4, %eax
	addl	intStateIRQNode, %eax
	movl	%eax, 4(%esp)
	jmp	cteDeleteOne
	.cfi_endproc
.LFE488:
	.size	invokeIRQHandler_ClearIRQHandler, .-invokeIRQHandler_ClearIRQHandler
	.p2align 4,,15
	.globl	deletingIRQHandler
	.type	deletingIRQHandler, @function
deletingIRQHandler:
.LFB489:
	.cfi_startproc
	movl	4(%esp), %eax
	sall	$4, %eax
	addl	intStateIRQNode, %eax
	movl	%eax, 4(%esp)
	jmp	cteDeleteOne
	.cfi_endproc
.LFE489:
	.size	deletingIRQHandler, .-deletingIRQHandler
	.p2align 4,,15
	.globl	finaliseCap
	.type	finaliseCap, @function
finaliseCap:
.LFB496:
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
	je	.L2840
	movl	%edx, %eax
	andl	$15, %eax
	testb	$1, %dl
	jne	.L2841
.L2845:
	cmpl	$6, %eax
	je	.L2847
	ja	.L2848
	testl	%eax, %eax
	.p2align 4,,6
	je	.L2856
	cmpl	$4, %eax
	.p2align 4,,6
	jne	.L2846
	movl	20(%ebp), %eax
	testl	%eax, %eax
	je	.L2856
	andl	$-16, %edx
	movl	%edx, (%esp)
	call	epCancelAll
	.p2align 4,,7
	.p2align 3
.L2856:
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movl	$-1, 8(%ebx)
.L2839:
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
.L2848:
	.cfi_restore_state
	cmpl	$8, %eax
	je	.L2856
	cmpl	$62, %eax
	je	.L2856
.L2846:
	movl	24(%ebp), %eax
	testl	%eax, %eax
	jne	.L2890
	movl	%edx, %eax
	movzbl	%dl, %edi
	andl	$15, %eax
	cmpl	$14, %ecx
	cmove	%edi, %eax
	cmpl	$12, %eax
	je	.L2857
	jbe	.L2891
	cmpl	$30, %eax
	je	.L2860
	cmpl	$46, %eax
	.p2align 4,,5
	jne	.L2856
	movl	%edx, (%ebx)
	movl	%esi, 4(%ebx)
	movl	$-1, 8(%ebx)
	jmp	.L2839
	.p2align 4,,7
	.p2align 3
.L2840:
	testb	$1, %dl
	movzbl	%dl, %eax
	je	.L2845
.L2841:
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
.L2847:
	.cfi_restore_state
	movl	20(%ebp), %eax
	testl	%eax, %eax
	je	.L2856
	andl	$-16, %edx
	movl	%edx, (%esp)
	call	aepCancelAll
	jmp	.L2856
	.p2align 4,,7
	.p2align 3
.L2891:
	cmpl	$10, %eax
	jne	.L2856
	movl	20(%ebp), %edi
	testl	%edi, %edi
	.p2align 4,,3
	je	.L2856
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
	jmp	.L2839
	.p2align 4,,7
	.p2align 3
.L2860:
	movl	20(%ebp), %eax
	testl	%eax, %eax
	je	.L2856
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
	jmp	.L2839
	.p2align 4,,7
	.p2align 3
.L2857:
	movl	20(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L2856
	movl	%edx, %esi
	andl	$-16, %esi
	movl	%esi, (%esp)
	movl	%edx, -44(%ebp)
	call	suspend
	movl	-44(%ebp), %edx
	cmpl	ia32KSfpuOwner, %esi
	je	.L2892
.L2862:
	andl	$-1024, %edx
	orl	$5, %edx
	movl	$8238, (%ebx)
	movl	%edx, 4(%ebx)
	movl	$-1, 8(%ebx)
	jmp	.L2839
.L2892:
	xorl	%eax, %eax
	call	switchFpuOwner
	movl	-44(%ebp), %edx
	jmp	.L2862
.L2890:
	call	halt
	.cfi_endproc
.LFE496:
	.size	finaliseCap, .-finaliseCap
	.p2align 4,,15
	.globl	deleteCallerCap
	.type	deleteCallerCap, @function
deleteCallerCap:
.LFB518:
	.cfi_startproc
	movl	4(%esp), %eax
	andl	$-1024, %eax
	addl	$48, %eax
	movl	%eax, 4(%esp)
	jmp	cteDeleteOne
	.cfi_endproc
.LFE518:
	.size	deleteCallerCap, .-deleteCallerCap
	.p2align 4,,15
	.type	handleWait, @function
handleWait:
.LFB252:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	ksCurThread, %eax
	andl	$-1024, %eax
	addl	$48, %eax
	movl	%eax, (%esp)
	call	cteDeleteOne
	movl	ksCurThread, %eax
	leal	-20(%ebp), %edx
	movl	4(%eax), %ebx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	movl	%ebx, 8(%esp)
	call	lookupCap
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %esi
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L2907
	movl	-16(%ebp), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	cmpl	$4, %eax
	je	.L2900
	cmpl	$6, %eax
	je	.L2901
.L2905:
	movl	$1, current_lookup_fault
	movl	$0, current_lookup_fault+4
.L2907:
	movl	ksCurThread, %eax
	movl	%ebx, current_fault+4
	movl	$-2147483647, current_fault
	movl	%eax, (%esp)
	call	handleFault
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.p2align 4,,7
	.p2align 3
.L2901:
	.cfi_restore_state
	andl	$1, %esi
	je	.L2905
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	ksCurThread, %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	receiveAsyncIPC
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.p2align 4,,7
	.p2align 3
.L2900:
	.cfi_restore_state
	andl	$1, %esi
	je	.L2905
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	ksCurThread, %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	receiveIPC
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE252:
	.size	handleWait, .-handleWait
	.p2align 4,,15
	.globl	decodeIRQHandlerInvocation
	.type	decodeIRQHandlerInvocation, @function
decodeIRQHandlerInvocation:
.LFB485:
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
	je	.L2910
	cmpl	$24, %eax
	je	.L2911
	cmpl	$22, %eax
	je	.L2922
	movl	$3, current_syscall_error+24
	movl	$3, %eax
.L2913:
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
.L2922:
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
	jg	.L2913
	movl	%eax, 28(%esp)
	movl	52(%esp), %eax
	movl	$0, (%esp)
	movl	%eax, 4(%esp)
	call	pic_mask_irq
	movl	28(%esp), %eax
	jmp	.L2913
	.p2align 4,,7
	.p2align 3
.L2911:
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
.L2910:
	.cfi_restore_state
	testl	%ebx, %ebx
	je	.L2923
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
	je	.L2924
.L2917:
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
.L2923:
	.cfi_restore_state
	movl	$7, current_syscall_error+24
	movl	$3, %eax
	jmp	.L2913
	.p2align 4,,7
	.p2align 3
.L2924:
	testl	$2, %edi
	je	.L2917
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
	jmp	.L2913
	.cfi_endproc
.LFE485:
	.size	decodeIRQHandlerInvocation, .-decodeIRQHandlerInvocation
	.p2align 4,,15
	.globl	pic_is_irq_pending
	.type	pic_is_irq_pending, @function
pic_is_irq_pending:
.LFB561:
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
.LFE561:
	.size	pic_is_irq_pending, .-pic_is_irq_pending
	.p2align 4,,15
	.globl	isIRQPending
	.type	isIRQPending, @function
isIRQPending:
.LFB548:
	.cfi_startproc
	movl	-65008, %eax
	testl	%eax, %eax
	jne	.L2932
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	call	pic_is_irq_pending
	testl	%eax, %eax
	setne	%al
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	movzbl	%al, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L2932:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE548:
	.size	isIRQPending, .-isIRQPending
	.p2align 4,,15
	.type	preemptionPoint.part.127, @function
preemptionPoint.part.127:
.LFB698:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	$0, ksWorkUnitsCompleted
	call	isIRQPending
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	notl	%eax
	andl	$4, %eax
	ret
	.cfi_endproc
.LFE698:
	.size	preemptionPoint.part.127, .-preemptionPoint.part.127
	.p2align 4,,15
	.globl	preemptionPoint
	.type	preemptionPoint, @function
preemptionPoint:
.LFB436:
	.cfi_startproc
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	cmpl	$99, %eax
	movl	%eax, ksWorkUnitsCompleted
	ja	.L2939
	xorl	%eax, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L2939:
	jmp	preemptionPoint.part.127
	.cfi_endproc
.LFE436:
	.size	preemptionPoint, .-preemptionPoint
	.p2align 4,,15
	.type	finaliseSlot, @function
finaliseSlot:
.LFB461:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	.cfi_offset 7, -12
	movl	%edx, %edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	%eax, -48(%ebp)
	movl	%ecx, -44(%ebp)
.L2972:
	movl	(%edi), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L2996
	movl	%edi, (%esp)
	call	isFinalCapability
	movl	$0, 16(%esp)
	movl	%eax, 12(%esp)
	movl	(%edi), %eax
	movl	4(%edi), %edx
	movl	%eax, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	finaliseCap
	movl	-28(%ebp), %eax
	movl	-32(%ebp), %esi
	movl	%eax, -56(%ebp)
	movl	-36(%ebp), %eax
	subl	$4, %esp
	movl	%eax, %edx
	movl	%eax, %ecx
	andl	$14, %edx
	andl	$15, %ecx
	movzbl	%al, %ebx
	cmpl	$14, %edx
	cmove	%ebx, %ecx
	testl	%ecx, %ecx
	je	.L2945
	cmpl	$46, %ecx
	jne	.L2993
	movl	%eax, %ebx
	andl	$16128, %ebx
	movl	%ebx, -52(%ebp)
	shrl	$8, -52(%ebp)
	movl	-52(%ebp), %ebx
	cmpl	$32, %ebx
	je	.L2947
	leal	1(%ebx), %ecx
	movl	$1, %ebx
	sall	%cl, %ebx
	movl	%ebx, %ecx
	leal	-1(%ebx), %ebx
	negl	%ecx
	andl	%esi, %ebx
	testl	%ebx, %ebx
	je	.L2945
.L3001:
	andl	%esi, %ecx
	cmpl	%ecx, %edi
	je	.L2997
.L2949:
	movl	-36(%ebp), %ecx
	movl	-32(%ebp), %ebx
	movl	%ecx, (%edi)
	movl	-44(%ebp), %ecx
	movl	%ebx, 4(%edi)
	testl	%ecx, %ecx
	jne	.L2951
	cmpl	$14, %edx
	je	.L2998
.L2951:
	movl	(%edi), %ebx
	movl	4(%edi), %eax
	andl	$16128, %ebx
	shrl	$8, %ebx
	cmpl	$32, %ebx
	je	.L2954
	leal	1(%ebx), %ecx
	movl	$1, %esi
	sall	%cl, %esi
	movl	%esi, %ecx
	negl	%esi
	andl	%eax, %esi
	subl	$1, %ecx
.L2970:
	movl	-44(%ebp), %edx
	testl	%edx, %edx
	je	.L2955
	andl	%eax, %ecx
	leal	268435455(%ecx), %eax
	sall	$4, %eax
	addl	%esi, %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	movl	%ecx, -56(%ebp)
	call	cteDelete
	testl	%eax, %eax
	jne	.L2956
	movl	(%edi), %edx
	movl	%edx, %eax
	movzbl	%dl, %ecx
	andl	$14, %eax
	movl	%eax, -52(%ebp)
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$14, -52(%ebp)
	cmove	%ecx, %eax
	testl	%eax, %eax
	je	.L2960
	cmpl	$46, %eax
	jne	.L2993
	movl	4(%edi), %eax
	andl	$16128, %edx
	shrl	$8, %edx
	cmpl	$32, %edx
	movl	%eax, -52(%ebp)
	je	.L2999
	leal	1(%edx), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	movl	%eax, %ecx
	negl	%ecx
	andl	-52(%ebp), %ecx
	cmpl	%ecx, %esi
	je	.L3000
	.p2align 4,,7
	.p2align 3
.L2960:
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	cmpl	$99, %eax
	movl	%eax, ksWorkUnitsCompleted
	jbe	.L2972
	call	preemptionPoint.part.127
	testl	%eax, %eax
	je	.L2972
	movl	-48(%ebp), %edi
	movl	%eax, (%edi)
	movl	$0, 4(%edi)
	movl	$-1, 8(%edi)
	jmp	.L2940
	.p2align 4,,7
	.p2align 3
.L2993:
	call	halt
	.p2align 4,,7
	.p2align 3
.L2955:
	movl	%edi, 4(%esp)
	movl	%esi, (%esp)
	call	capSwapForDelete
	jmp	.L2960
	.p2align 4,,7
	.p2align 3
.L2954:
	movl	%eax, %esi
	movl	$15, %ecx
	andl	$-16, %esi
	jmp	.L2970
	.p2align 4,,7
	.p2align 3
.L2998:
	cmpb	$46, %al
	jne	.L2951
	movl	-52(%ebp), %eax
	movl	$-16, %ecx
	cmpl	$32, %eax
	je	.L2952
	movl	%eax, %ecx
	movl	$1, %eax
	addl	$1, %ecx
	sall	%cl, %eax
	movl	%eax, %ecx
	negl	%ecx
.L2952:
	andl	%esi, %ecx
	cmpl	%ecx, %edi
	jne	.L2951
	movl	-48(%ebp), %eax
	movl	-56(%ebp), %edi
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	%edi, 8(%eax)
	jmp	.L2940
	.p2align 4,,7
	.p2align 3
.L2956:
	movl	-48(%ebp), %esi
	movl	%eax, (%esi)
	movl	$0, 4(%esi)
	movl	$-1, 8(%esi)
.L2940:
	movl	-48(%ebp), %eax
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
.L2947:
	.cfi_restore_state
	movl	%esi, %ebx
	movl	$-16, %ecx
	andl	$15, %ebx
	testl	%ebx, %ebx
	jne	.L3001
	.p2align 4,,7
	.p2align 3
.L2945:
	movl	-48(%ebp), %eax
	movl	-56(%ebp), %edi
	movl	$0, (%eax)
	movl	$1, 4(%eax)
	movl	%edi, 8(%eax)
	jmp	.L2940
	.p2align 4,,7
	.p2align 3
.L2996:
	movl	-48(%ebp), %eax
	movl	$0, (%eax)
	movl	$1, 4(%eax)
	movl	$-1, 8(%eax)
	jmp	.L2940
.L2997:
	subl	$1, %ebx
	jne	.L2949
	jmp	.L2945
.L3000:
	movl	%edx, %ecx
.L2973:
	addl	$1, %ecx
	movl	$1, %esi
	sall	%cl, %esi
	movl	%esi, %ecx
	subl	$1, %ecx
	andl	-52(%ebp), %ecx
	cmpl	%ecx, -56(%ebp)
	jne	.L2960
	cmpl	%edx, %ebx
	jne	.L2960
	movl	-56(%ebp), %edx
	subl	$1, %edx
	cmpl	$32, %ebx
	je	.L2975
	leal	1(%ebx), %ecx
	movl	$1, %ebx
	sall	%cl, %ebx
	movl	%ebx, %ecx
	subl	$1, %ebx
	negl	%ecx
.L2964:
	movl	-52(%ebp), %eax
	andl	%ebx, %edx
	andl	%ecx, %eax
	orl	%eax, %edx
	movl	%edx, 4(%edi)
	jmp	.L2960
.L2975:
	movl	$15, %ebx
	movl	$-16, %ecx
	jmp	.L2964
.L2999:
	movl	-52(%ebp), %ecx
	andl	$-16, %ecx
	cmpl	%ecx, %esi
	jne	.L2960
	movl	$3, %ecx
	jmp	.L2973
	.cfi_endproc
.LFE461:
	.size	finaliseSlot, .-finaliseSlot
	.p2align 4,,15
	.globl	cteDelete
	.type	cteDelete, @function
cteDelete:
.LFB457:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %esi
	leal	4(%esp), %eax
	movl	36(%esp), %ebx
	movl	%esi, %edx
	movl	%ebx, %ecx
	call	finaliseSlot
	movl	4(%esp), %eax
	testl	%eax, %eax
	jne	.L3003
	testl	%ebx, %ebx
	jne	.L3004
	movl	8(%esp), %edx
	testl	%edx, %edx
	je	.L3003
.L3004:
	movl	12(%esp), %edx
	movl	%esi, %eax
	call	emptySlot
	xorl	%eax, %eax
.L3003:
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
.LFE457:
	.size	cteDelete, .-cteDelete
	.p2align 4,,15
	.globl	invokeCNodeDelete
	.type	invokeCNodeDelete, @function
invokeCNodeDelete:
.LFB445:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	cteDelete
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE445:
	.size	invokeCNodeDelete, .-invokeCNodeDelete
	.p2align 4,,15
	.globl	invokeTCB_ThreadControl
	.type	invokeTCB_ThreadControl, @function
invokeTCB_ThreadControl:
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
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	64(%esp), %esi
	movl	120(%esp), %ebx
	movl	%esi, %edi
	andl	$-16, %edi
	movl	%ebx, %ebp
	orl	$12, %edi
	andl	$4, %ebp
	je	.L3011
	movl	72(%esp), %eax
	movl	%eax, 632(%esi)
.L3011:
	testb	$1, %bl
	jne	.L3054
.L3012:
	testl	%ebp, %ebp
	jne	.L3055
.L3014:
	andl	$2, %ebx
	jne	.L3018
.L3019:
	xorl	%edx, %edx
.L3042:
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
.L3018:
	.cfi_restore_state
	movl	%esi, %ebx
	andl	$-1024, %ebx
	addl	$64, %ebx
	movl	$1, 4(%esp)
	movl	%ebx, (%esp)
	call	cteDelete
	testl	%eax, %eax
	movl	%eax, %edx
	jne	.L3042
	movl	%eax, 28(%esp)
	movl	104(%esp), %eax
	movl	%eax, 636(%esi)
	movl	116(%esp), %eax
	testl	%eax, %eax
	je	.L3019
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
	je	.L3019
	movl	68(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edi, (%esp)
	movl	$0, 4(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	call	sameObjectAs
	testl	%eax, %eax
	je	.L3019
	movl	116(%esp), %eax
	movl	112(%esp), %edx
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	108(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
	movl	28(%esp), %edx
	jmp	.L3042
	.p2align 4,,7
	.p2align 3
.L3055:
	movl	%esi, %ebp
	andl	$-1024, %ebp
	movl	$1, 4(%esp)
	movl	%ebp, (%esp)
	call	cteDelete
	testl	%eax, %eax
	movl	%eax, %edx
	jne	.L3042
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
	je	.L3016
	movl	68(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edi, (%esp)
	movl	$0, 4(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	call	sameObjectAs
	testl	%eax, %eax
	jne	.L3056
.L3016:
	addl	$16, %ebp
	movl	$1, 4(%esp)
	movl	%ebp, (%esp)
	call	cteDelete
	testl	%eax, %eax
	movl	%eax, %edx
	jne	.L3042
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
	je	.L3014
	movl	68(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%edi, (%esp)
	movl	$0, 4(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	call	sameObjectAs
	testl	%eax, %eax
	je	.L3014
	movl	100(%esp), %eax
	movl	96(%esp), %edx
	movl	%ebp, 12(%esp)
	movl	%eax, 8(%esp)
	movl	92(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
	jmp	.L3014
	.p2align 4,,7
	.p2align 3
.L3054:
	movl	76(%esp), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	call	setPriority
	jmp	.L3012
	.p2align 4,,7
	.p2align 3
.L3056:
	movl	88(%esp), %eax
	movl	84(%esp), %edx
	movl	%ebp, 12(%esp)
	movl	%eax, 8(%esp)
	movl	80(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	cteInsert
	jmp	.L3016
	.cfi_endproc
.LFE532:
	.size	invokeTCB_ThreadControl, .-invokeTCB_ThreadControl
	.p2align 4,,15
	.globl	decodeTCBConfigure
	.type	decodeTCBConfigure, @function
decodeTCBConfigure:
.LFB525:
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
	ja	.L3093
.L3058:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
.L3087:
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
.L3093:
	.cfi_restore_state
	testl	%ebx, %ebx
	je	.L3058
	testl	%esi, %esi
	je	.L3058
	testl	%edi, %edi
	.p2align 4,,5
	je	.L3058
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
	jbe	.L3061
.L3072:
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
.L3061:
	.cfi_restore_state
	movl	-56(%ebp), %eax
	testl	%eax, %eax
	jne	.L3094
	xorl	%edi, %edi
.L3062:
	movl	-52(%ebp), %eax
	movl	%ecx, -96(%ebp)
	andl	$-1024, %eax
	movl	%eax, (%esp)
	movl	%eax, -100(%ebp)
	call	slotCapLongRunningDelete
	testl	%eax, %eax
	jne	.L3072
	movl	-100(%ebp), %eax
	addl	$16, %eax
	movl	%eax, (%esp)
	call	slotCapLongRunningDelete
	movl	-96(%ebp), %ecx
	testl	%eax, %eax
	jne	.L3072
	movl	-76(%ebp), %eax
	testl	%eax, %eax
	je	.L3065
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
.L3065:
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
	jne	.L3087
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
	jne	.L3072
	cmpl	$0, -88(%ebp)
	je	.L3069
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
.L3069:
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
	jne	.L3087
	movl	-28(%ebp), %eax
	movl	-88(%ebp), %ecx
	movl	%eax, -76(%ebp)
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L3070
	movl	%edx, %eax
	andl	$15, %eax
.L3071:
	cmpl	$5, %eax
	jne	.L3072
	testl	$65536, -76(%ebp)
	je	.L3072
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
	jmp	.L3087
	.p2align 4,,7
	.p2align 3
.L3094:
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
	jne	.L3087
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
	je	.L3062
	jmp	.L3087
.L3070:
	movzbl	-80(%ebp), %eax
	.p2align 4,,2
	jmp	.L3071
	.cfi_endproc
.LFE525:
	.size	decodeTCBConfigure, .-decodeTCBConfigure
	.p2align 4,,15
	.globl	decodeSetPriority
	.type	decodeSetPriority, @function
decodeSetPriority:
.LFB526:
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
	jne	.L3096
	movl	$7, current_syscall_error+24
	movl	$3, %eax
.L3097:
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
.L3096:
	.cfi_restore_state
	movl	ksCurThread, %eax
	movzbl	20(%eax), %esi
	cmpl	624(%eax), %esi
	jbe	.L3098
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
.L3098:
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
	jmp	.L3097
	.cfi_endproc
.LFE526:
	.size	decodeSetPriority, .-decodeSetPriority
	.p2align 4,,15
	.globl	decodeSetIPCBuffer
	.type	decodeSetIPCBuffer, @function
decodeSetIPCBuffer:
.LFB527:
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
	jne	.L3113
.L3101:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
.L3103:
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
.L3113:
	.cfi_restore_state
	testl	%ebx, %ebx
	je	.L3101
	movl	ksCurThread, %ecx
	movl	(%ebx), %esi
	movl	4(%ebx), %edi
	movl	20(%ecx), %eax
	testl	%eax, %eax
	movl	%eax, -44(%ebp)
	jne	.L3114
	xorl	%ebx, %ebx
.L3104:
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
.L3114:
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
	jne	.L3103
	movl	-32(%ebp), %esi
	movl	-28(%ebp), %edi
	movl	-44(%ebp), %eax
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, (%esp)
	call	checkValidIPCBuffer
	testl	%eax, %eax
	jne	.L3103
	movl	ksCurThread, %ecx
	movl	-48(%ebp), %edx
	jmp	.L3104
	.cfi_endproc
.LFE527:
	.size	decodeSetIPCBuffer, .-decodeSetIPCBuffer
	.p2align 4,,15
	.globl	decodeSetSpace
	.type	decodeSetSpace, @function
decodeSetSpace:
.LFB528:
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
	movl	8(%ebp), %edi
	cmpl	$2, 16(%ebp)
	movl	24(%ebp), %ebx
	movl	28(%ebp), %esi
	ja	.L3143
.L3116:
	movl	$7, current_syscall_error+24
	movl	$3, %eax
.L3138:
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
.L3143:
	.cfi_restore_state
	testl	%ebx, %ebx
	je	.L3116
	testl	%esi, %esi
	je	.L3116
	movl	ksCurThread, %eax
	movl	20(%eax), %edx
	movl	24(%eax), %eax
	movl	%edx, -80(%ebp)
	movl	%eax, -64(%ebp)
	movl	36(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -76(%ebp)
	movl	4(%ebx), %eax
	movl	%eax, -56(%ebp)
	movl	(%ebx), %eax
	movl	%eax, -60(%ebp)
	movl	(%esi), %eax
	movl	%eax, -72(%ebp)
	movl	4(%esi), %eax
	movl	%eax, -68(%ebp)
	movl	%edi, %eax
	andl	$-1024, %eax
	movl	%eax, (%esp)
	movl	%eax, -52(%ebp)
	call	slotCapLongRunningDelete
	testl	%eax, %eax
	je	.L3144
.L3128:
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
.L3144:
	.cfi_restore_state
	movl	-52(%ebp), %eax
	addl	$16, %eax
	movl	%eax, (%esp)
	call	slotCapLongRunningDelete
	testl	%eax, %eax
	jne	.L3128
	movl	-64(%ebp), %edx
	testl	%edx, %edx
	je	.L3121
	movl	-60(%ebp), %ecx
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	%ecx, 12(%esp)
	movl	-56(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	-64(%ebp), %ecx
	movl	%ecx, 8(%esp)
	call	updateCapData
	movl	-44(%ebp), %eax
	movl	%eax, -56(%ebp)
	movl	-48(%ebp), %eax
	subl	$4, %esp
	movl	%eax, -60(%ebp)
.L3121:
	movl	-60(%ebp), %eax
	movl	%ebx, 4(%esp)
	movl	%eax, 8(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	deriveCap
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %ecx
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L3138
	movl	-28(%ebp), %eax
	movzbl	%cl, %edx
	movl	%eax, -56(%ebp)
	movl	%ecx, %eax
	andl	$14, %eax
	movl	%eax, -52(%ebp)
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$14, -52(%ebp)
	cmove	%edx, %eax
	cmpl	$10, %eax
	jne	.L3128
	movl	-76(%ebp), %eax
	testl	%eax, %eax
	je	.L3125
	movl	%ecx, -52(%ebp)
	movl	-72(%ebp), %ecx
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	%ecx, 12(%esp)
	movl	-68(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	-76(%ebp), %ecx
	movl	%ecx, 8(%esp)
	call	updateCapData
	movl	-48(%ebp), %eax
	movl	-52(%ebp), %ecx
	movl	%eax, -72(%ebp)
	movl	-44(%ebp), %eax
	subl	$4, %esp
	movl	%eax, -68(%ebp)
.L3125:
	movl	-72(%ebp), %eax
	movl	%esi, 4(%esp)
	movl	%ecx, -64(%ebp)
	movl	%eax, 8(%esp)
	movl	-68(%ebp), %eax
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
	jne	.L3138
	movl	-28(%ebp), %eax
	movl	%eax, -52(%ebp)
	movl	%edx, %eax
	andl	$14, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	movzbl	%al, %eax
	andl	$15, %edx
	cmpl	$14, %ecx
	cmove	%eax, %edx
	cmpl	$5, %edx
	jne	.L3128
	testl	$65536, -52(%ebp)
	je	.L3128
	movl	ksCurThread, %eax
	movl	592(%eax), %edx
	andl	$-16, %edx
	orl	$2, %edx
	movl	%edx, 592(%eax)
	movl	%eax, (%esp)
	call	scheduleTCB
	movl	-60(%ebp), %eax
	movl	-64(%ebp), %ecx
	movl	$4, 56(%esp)
	movl	$0, 52(%esp)
	movl	%eax, 28(%esp)
	movl	-52(%ebp), %eax
	movl	%ecx, 16(%esp)
	movl	%edi, %ecx
	andl	$-16, %ecx
	movl	$0, 44(%esp)
	movl	%eax, 32(%esp)
	movl	-56(%ebp), %eax
	movl	$0, 48(%esp)
	movl	$0, 40(%esp)
	movl	%esi, 36(%esp)
	movl	%eax, 20(%esp)
	movl	-80(%ebp), %eax
	movl	%ebx, 24(%esp)
	movl	$0, 12(%esp)
	movl	%ecx, (%esp)
	movl	%eax, 8(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	call	invokeTCB_ThreadControl
	jmp	.L3138
	.cfi_endproc
.LFE528:
	.size	decodeSetSpace, .-decodeSetSpace
	.p2align 4,,15
	.globl	decodeTCBInvocation
	.type	decodeTCBInvocation, @function
decodeTCBInvocation:
.LFB521:
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
	movl	68(%esp), %ecx
	movl	72(%esp), %ebx
	movl	76(%esp), %edx
	cmpl	$10, %eax
	movl	80(%esp), %edi
	movl	96(%esp), %ebp
	movl	100(%esp), %esi
	ja	.L3146
	jmp	*.L3148(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L3148:
	.long	.L3146
	.long	.L3146
	.long	.L3147
	.long	.L3149
	.long	.L3150
	.long	.L3151
	.long	.L3152
	.long	.L3153
	.long	.L3154
	.long	.L3155
	.long	.L3156
	.text
	.p2align 4,,7
	.p2align 3
.L3156:
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
.L3147:
	.cfi_restore_state
	movl	%esi, 80(%esp)
	movl	%ebp, 76(%esp)
	movl	%ebx, 64(%esp)
	movl	%ecx, 72(%esp)
	movl	%edx, 68(%esp)
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
	jmp	decodeReadRegisters
	.p2align 4,,7
	.p2align 3
.L3149:
	.cfi_restore_state
	movl	%esi, 76(%esp)
	movl	%ebx, 64(%esp)
	movl	%ecx, 72(%esp)
	movl	%edx, 68(%esp)
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
	jmp	decodeWriteRegisters
	.p2align 4,,7
	.p2align 3
.L3150:
	.cfi_restore_state
	movl	84(%esp), %eax
	movl	%esi, 24(%esp)
	movl	%ebx, (%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	movl	88(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, 16(%esp)
	movl	92(%esp), %eax
	movl	%eax, 20(%esp)
	call	decodeCopyRegisters
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
.L3151:
	.cfi_restore_state
	movl	84(%esp), %eax
	movl	%esi, 28(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 16(%esp)
	movl	88(%esp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, 20(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	call	decodeTCBConfigure
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
.L3152:
	.cfi_restore_state
	movl	%esi, 76(%esp)
	movl	%ebx, 64(%esp)
	movl	%ecx, 72(%esp)
	movl	%edx, 68(%esp)
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
	jmp	decodeSetPriority
	.p2align 4,,7
	.p2align 3
.L3153:
	.cfi_restore_state
	movl	84(%esp), %eax
	movl	%esi, 28(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 16(%esp)
	movl	88(%esp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, 20(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	call	decodeSetIPCBuffer
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
.L3154:
	.cfi_restore_state
	movl	84(%esp), %eax
	movl	%esi, 28(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 16(%esp)
	movl	88(%esp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, 20(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	call	decodeSetSpace
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
.L3155:
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
.L3146:
	.cfi_restore_state
	movl	$3, current_syscall_error+24
	addl	$44, %esp
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
	.cfi_endproc
.LFE521:
	.size	decodeTCBInvocation, .-decodeTCBInvocation
	.p2align 4,,15
	.globl	cteRevoke
	.type	cteRevoke, @function
cteRevoke:
.LFB456:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %esi
	.p2align 4,,7
	.p2align 3
.L3172:
	movl	12(%esi), %ebx
	andl	$-8, %ebx
	je	.L3165
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	call	isMDBParentOf
	testl	%eax, %eax
	je	.L3165
	movl	$1, 4(%esp)
	movl	%ebx, (%esp)
	call	cteDelete
	testl	%eax, %eax
	jne	.L3161
	movl	ksWorkUnitsCompleted, %eax
	addl	$1, %eax
	cmpl	$99, %eax
	movl	%eax, ksWorkUnitsCompleted
	jbe	.L3172
	call	preemptionPoint.part.127
	testl	%eax, %eax
	je	.L3172
.L3161:
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.p2align 4,,1
	ret
	.p2align 4,,7
	.p2align 3
.L3165:
	.cfi_restore_state
	addl	$20, %esp
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
.LFE456:
	.size	cteRevoke, .-cteRevoke
	.p2align 4,,15
	.globl	invokeCNodeRevoke
	.type	invokeCNodeRevoke, @function
invokeCNodeRevoke:
.LFB444:
	.cfi_startproc
	jmp	cteRevoke
	.cfi_endproc
.LFE444:
	.size	invokeCNodeRevoke, .-invokeCNodeRevoke
	.p2align 4,,15
	.globl	cteRecycle
	.type	cteRecycle, @function
cteRecycle:
.LFB464:
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
	movl	8(%ebp), %esi
	movl	%esi, (%esp)
	call	cteRevoke
	testl	%eax, %eax
	movl	%eax, %ebx
	je	.L3183
.L3175:
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
	ret
	.p2align 4,,7
	.p2align 3
.L3183:
	.cfi_restore_state
	leal	-36(%ebp), %eax
	movl	$1, %ecx
	movl	%esi, %edx
	call	finaliseSlot
	movl	-36(%ebp), %eax
	testl	%eax, %eax
	jne	.L3179
	movl	(%esi), %edx
	movl	%edx, %ecx
	movl	%edx, %eax
	andl	$14, %ecx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L3175
	movl	%esi, (%esp)
	leal	-48(%ebp), %edi
	call	isFinalCapability
	movl	(%esi), %edx
	movl	4(%esi), %ecx
	movl	%edi, (%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 4(%esp)
	call	recycleCap
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, (%esi)
	movl	%edx, 4(%esi)
	subl	$4, %esp
	jmp	.L3175
	.p2align 4,,7
	.p2align 3
.L3179:
	leal	-12(%ebp), %esp
	movl	%eax, %ebx
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
	ret
	.cfi_endproc
.LFE464:
	.size	cteRecycle, .-cteRecycle
	.p2align 4,,15
	.globl	invokeCNodeRecycle
	.type	invokeCNodeRecycle, @function
invokeCNodeRecycle:
.LFB446:
	.cfi_startproc
	jmp	cteRecycle
	.cfi_endproc
.LFE446:
	.size	invokeCNodeRecycle, .-invokeCNodeRecycle
	.p2align 4,,15
	.globl	decodeCNodeInvocation
	.type	decodeCNodeInvocation, @function
decodeCNodeInvocation:
.LFB443:
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
	jbe	.L3186
.L3237:
	movl	$3, current_syscall_error+24
	movl	$3, %eax
.L3255:
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
.L3186:
	.cfi_restore_state
	cmpl	$1, %edi
	ja	.L3188
.L3218:
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
.L3188:
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
	jne	.L3255
	leal	-14(%ebx), %eax
	cmpl	$3, %eax
	jbe	.L3268
	cmpl	$11, %ebx
	je	.L3269
	cmpl	$12, %ebx
	je	.L3270
	cmpl	$19, %ebx
	.p2align 4,,2
	je	.L3271
	cmpl	$13, %ebx
	.p2align 4,,2
	je	.L3272
	xorl	%eax, %eax
	cmpl	$18, %ebx
	jne	.L3255
	cmpl	$7, %edi
	jbe	.L3218
	movl	-64(%ebp), %esi
	testl	%esi, %esi
	je	.L3218
	movl	-72(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L3218
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
	jne	.L3255
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
	jne	.L3255
	cmpl	%ecx, %esi
	je	.L3237
	cmpl	%esi, %ebx
	je	.L3237
	cmpl	%ecx, %ebx
	.p2align 4,,5
	je	.L3223
	movl	(%ecx), %eax
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L3224
	andl	$15, %eax
.L3225:
	testl	%eax, %eax
	jne	.L3267
.L3223:
	movl	(%ebx), %eax
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L3226
	andl	$15, %eax
.L3227:
	testl	%eax, %eax
	jne	.L3228
	movl	-84(%ebp), %eax
	movl	$6, current_syscall_error+24
	movl	$1, current_syscall_error+20
.L3264:
	sall	$2, %eax
	movzbl	%al, %eax
	orl	$1, %eax
	movl	%eax, current_lookup_fault
	movl	$3, %eax
	movl	$0, current_lookup_fault+4
	jmp	.L3255
	.p2align 4,,7
	.p2align 3
.L3268:
	cmpl	$3, %edi
	jbe	.L3218
	movl	-64(%ebp), %eax
	testl	%eax, %eax
	je	.L3218
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
	jne	.L3267
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
	jne	.L3255
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
	jne	.L3198
	movl	$6, current_syscall_error+24
	movl	-72(%ebp), %eax
	movl	$1, current_syscall_error+20
	jmp	.L3264
.L3267:
	movl	$8, current_syscall_error+24
	movl	$3, %eax
	jmp	.L3255
.L3271:
	movl	(%ecx), %edx
	movl	%edx, %ebx
	movl	%edx, %eax
	andl	$14, %ebx
	andl	$15, %eax
	movzbl	%dl, %edx
	cmpl	$14, %ebx
	cmove	%edx, %eax
	testl	%eax, %eax
	jne	.L3267
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
.L3272:
	.cfi_restore_state
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	movl	%ecx, -64(%ebp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	hasRecycleRights
	movl	-64(%ebp), %ecx
	testl	%eax, %eax
	jne	.L3217
.L3265:
	movl	$3, current_syscall_error+24
	movb	$3, %al
	jmp	.L3255
.L3269:
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
.L3270:
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
	movl	$1, 12(%ebp)
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
	jmp	cteDelete
.L3198:
	.cfi_restore_state
	cmpl	$16, %ebx
	je	.L3200
	cmpl	$17, %ebx
	je	.L3201
	cmpl	$15, %ebx
	.p2align 4,,2
	je	.L3202
	cmpl	$4, %edi
	.p2align 4,,2
	je	.L3218
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
.L3266:
	call	deriveCap
	movl	-32(%ebp), %edx
	pushl	%eax
	movl	-36(%ebp), %eax
	testl	%eax, %eax
	jne	.L3255
	movl	-28(%ebp), %ebx
	xorl	%edi, %edi
	movl	-64(%ebp), %ecx
.L3204:
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L3206
	movl	%edx, %eax
	andl	$15, %eax
.L3207:
	testl	%eax, %eax
	je	.L3265
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
	je	.L3209
	call	cteMove
	xorl	%eax, %eax
	jmp	.L3255
.L3217:
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
.L3202:
	.cfi_restore_state
	cmpl	$5, %edi
	jbe	.L3218
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
	jmp	.L3266
.L3201:
	cmpl	$4, %edi
	je	.L3218
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
	jmp	.L3204
.L3200:
	movl	4(%esi), %ebx
	movl	$1, %edi
	jmp	.L3204
.L3206:
	movzbl	%dl, %eax
	jmp	.L3207
.L3209:
	call	cteInsert
	xorl	%eax, %eax
	.p2align 4,,3
	jmp	.L3255
.L3224:
	movzbl	%al, %eax
	.p2align 4,,3
	jmp	.L3225
.L3228:
	movl	(%esi), %eax
	movl	%eax, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L3229
	andl	$15, %eax
.L3230:
	testl	%eax, %eax
	jne	.L3231
	movl	$6, current_syscall_error+24
	movl	-68(%ebp), %eax
	movl	$0, current_syscall_error+20
	jmp	.L3264
.L3226:
	movzbl	%al, %eax
	jmp	.L3227
.L3231:
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
	je	.L3232
	movl	%edx, %eax
	andl	$15, %eax
.L3233:
	testl	%eax, %eax
	je	.L3237
	movl	%edi, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L3235
	movl	%edi, %eax
	andl	$15, %eax
.L3236:
	testl	%eax, %eax
	je	.L3237
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
	jmp	.L3255
.L3229:
	movzbl	%al, %eax
	jmp	.L3230
.L3235:
	movl	%edi, %eax
	movzbl	%al, %eax
	.p2align 4,,3
	jmp	.L3236
.L3232:
	movzbl	-64(%ebp), %eax
	jmp	.L3233
	.cfi_endproc
.LFE443:
	.size	decodeCNodeInvocation, .-decodeCNodeInvocation
	.p2align 4,,15
	.globl	decodeInvocation
	.type	decodeInvocation, @function
decodeInvocation:
.LFB505:
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
	je	.L3274
	movl	%ebx, %eax
	andl	$15, %eax
	testb	$1, %bl
	jne	.L3275
.L3278:
	cmpl	$62, %eax
	ja	.L3279
	jmp	*.L3281(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L3281:
	.long	.L3294
	.long	.L3279
	.long	.L3282
	.long	.L3279
	.long	.L3283
	.long	.L3279
	.long	.L3284
	.long	.L3279
	.long	.L3285
	.long	.L3279
	.long	.L3286
	.long	.L3279
	.long	.L3287
	.long	.L3279
	.long	.L3288
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3289
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3294
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3279
	.long	.L3291
	.text
	.p2align 4,,7
	.p2align 3
.L3274:
	testb	$1, %bl
	movzbl	%bl, %eax
	.p2align 4,,2
	je	.L3278
.L3275:
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
.L3294:
	.cfi_restore_state
	movl	$2, current_syscall_error+24
	movl	$3, %eax
	movl	$0, current_syscall_error+4
.L3292:
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
.L3282:
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
	jmp	.L3292
	.p2align 4,,7
	.p2align 3
.L3283:
	testl	$2, %esi
	je	.L3294
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
	jmp	.L3292
	.p2align 4,,7
	.p2align 3
.L3284:
	testl	$2, %esi
	je	.L3294
	xorl	%edi, %edi
	testl	%ecx, %ecx
	movl	ksCurThread, %edx
	je	.L3296
	movl	20(%edx), %edi
.L3296:
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
	jmp	.L3292
	.p2align 4,,7
	.p2align 3
.L3285:
	andl	$1, %esi
	jne	.L3294
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
	jmp	.L3292
	.p2align 4,,7
	.p2align 3
.L3286:
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
	jmp	.L3292
	.p2align 4,,7
	.p2align 3
.L3287:
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
	jmp	.L3292
	.p2align 4,,7
	.p2align 3
.L3288:
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
	jmp	.L3292
	.p2align 4,,7
	.p2align 3
.L3289:
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
.L3291:
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
.L3279:
	.cfi_restore_state
	call	halt
	.cfi_endproc
.LFE505:
	.size	decodeInvocation, .-decodeInvocation
	.p2align 4,,15
	.type	handleInvocation, @function
handleInvocation:
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
	subl	$92, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	ksCurThread, %ebx
	movl	%eax, -44(%ebp)
	movl	%edx, -48(%ebp)
	movl	16(%ebx), %esi
	movl	%esi, %eax
	andl	$127, %eax
	cmpl	$120, %eax
	jbe	.L3304
	andl	$-128, %esi
	orl	$120, %esi
.L3304:
	movl	4(%ebx), %edi
	leal	-40(%ebp), %eax
	movl	%eax, (%esp)
	movl	%ebx, 4(%esp)
	movl	%edi, 8(%esp)
	call	lookupCapAndSlot
	movl	-40(%ebp), %eax
	subl	$4, %esp
	testl	%eax, %eax
	jne	.L3330
	movl	%ebx, 4(%esp)
	movl	$0, (%esp)
	call	lookupIPCBuffer
	movl	%esi, 8(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	movl	%eax, -52(%ebp)
	call	lookupExtraCaps
	movl	-52(%ebp), %edx
	testl	%eax, %eax
	jne	.L3331
	movl	%esi, %ecx
	andl	$127, %ecx
	testl	%edx, %edx
	je	.L3332
.L3310:
	movl	-44(%ebp), %eax
	shrl	$12, %esi
	movl	%edx, 44(%esp)
	movl	-32(%ebp), %edx
	movl	%edi, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 40(%esp)
	movl	-48(%ebp), %eax
	movl	%edx, 20(%esp)
	movl	%esi, (%esp)
	movl	%eax, 36(%esp)
	movl	current_extra_caps, %eax
	movl	%eax, 24(%esp)
	movl	current_extra_caps+4, %eax
	movl	%eax, 28(%esp)
	movl	current_extra_caps+8, %eax
	movl	%eax, 32(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 12(%esp)
	call	decodeInvocation
	cmpl	$4, %eax
	je	.L3313
	cmpl	$3, %eax
	je	.L3333
	movl	592(%ebx), %eax
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L3334
.L3329:
	xorl	%eax, %eax
.L3307:
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
.L3334:
	.cfi_restore_state
	cmpl	$0, -44(%ebp)
	je	.L3312
	movl	$0, 4(%ebx)
	movl	$0, 16(%ebx)
.L3312:
	andl	$-16, %eax
	orl	$1, %eax
	movl	%eax, 592(%ebx)
	movl	%ebx, (%esp)
	call	scheduleTCB
	xorl	%eax, %eax
	jmp	.L3307
.L3333:
	cmpl	$0, -44(%ebp)
	je	.L3329
	movl	%ebx, (%esp)
	call	replyFromKernel_error
	xorl	%eax, %eax
	jmp	.L3307
.L3313:
	movl	$4, %eax
	jmp	.L3307
.L3332:
	cmpl	$2, %ecx
	movl	$2, %eax
	cmova	%eax, %ecx
	jmp	.L3310
.L3331:
	cmpl	$0, -48(%ebp)
	je	.L3329
.L3306:
	movl	%ebx, (%esp)
	call	handleFault
	jmp	.L3329
.L3330:
	cmpl	$0, -48(%ebp)
	movl	$1, current_fault
	movl	%edi, current_fault+4
	je	.L3329
	jmp	.L3306
	.cfi_endproc
.LFE250:
	.size	handleInvocation, .-handleInvocation
	.p2align 4,,15
	.globl	pic_ack_active_irq
	.type	pic_ack_active_irq, @function
pic_ack_active_irq:
.LFB562:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	cmpl	$39, ia32KScurInterrupt
	jle	.L3336
	movl	$32, 4(%esp)
	movl	$160, (%esp)
	call	out8
.L3336:
	movl	$32, 4(%esp)
	movl	$32, (%esp)
	call	out8
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE562:
	.size	pic_ack_active_irq, .-pic_ack_active_irq
	.p2align 4,,15
	.globl	ackInterrupt
	.type	ackInterrupt, @function
ackInterrupt:
.LFB549:
	.cfi_startproc
	cmpl	$15, 4(%esp)
	jle	.L3340
	movl	$0, -65360
	ret
	.p2align 4,,7
	.p2align 3
.L3340:
	jmp	pic_ack_active_irq
	.cfi_endproc
.LFE549:
	.size	ackInterrupt, .-ackInterrupt
	.p2align 4,,15
	.globl	handleInterrupt
	.type	handleInterrupt, @function
handleInterrupt:
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %ebx
	movl	intStateIRQTable(,%ebx,4), %eax
	cmpl	$1, %eax
	je	.L3343
	jb	.L3349
	cmpl	$2, %eax
	je	.L3345
	cmpl	$3, %eax
	.p2align 4,,5
	je	.L3346
	.p2align 4,,5
	call	halt
	.p2align 4,,7
	.p2align 3
.L3345:
	call	timerTick
.L3346:
	cmpl	$15, %ebx
	.p2align 4,,2
	jle	.L3351
.L3353:
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
.L3343:
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
	jne	.L3349
	testl	$2, %edi
	je	.L3349
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
.L3349:
	cmpl	$15, %ebx
	jg	.L3353
	movl	%ebx, 4(%esp)
	movl	$1, (%esp)
	call	pic_mask_irq
.L3351:
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
	jmp	pic_ack_active_irq
	.cfi_endproc
.LFE491:
	.size	handleInterrupt, .-handleInterrupt
	.p2align 4,,15
	.globl	handleInterruptEntry
	.type	handleInterruptEntry, @function
handleInterruptEntry:
.LFB246:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	ia32KScurInterrupt, %eax
	cmpl	$-1, %eax
	je	.L3364
	subl	$32, %eax
	cmpl	$-1, %eax
	je	.L3364
	movl	%eax, (%esp)
	call	handleInterrupt
.L3364:
	call	schedule
	call	activateThread
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE246:
	.size	handleInterruptEntry, .-handleInterruptEntry
	.p2align 4,,15
	.globl	c_handle_interrupt
	.type	c_handle_interrupt, @function
c_handle_interrupt:
.LFB259:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	cmpl	$7, %ecx
	je	.L3382
	cmpl	$14, %ecx
	je	.L3383
	cmpl	$31, %ecx
	jle	.L3384
	cmpl	$63, %ecx
	.p2align 4,,2
	jg	.L3377
	movl	%ecx, ia32KScurInterrupt
	call	handleInterruptEntry
.L3374:
	call	restore_user_context
.L3384:
	movl	ksCurThread, %eax
	movl	52(%eax), %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	call	handleUserLevelFault
	jmp	.L3374
.L3382:
	movl	ksCurThread, %eax
	call	switchFpuOwner
	.p2align 4,,3
	jmp	.L3374
.L3383:
	movl	ksCurThread, %eax
	movl	52(%eax), %eax
	shrl	$4, %eax
	andl	$1, %eax
	movl	%eax, (%esp)
	call	handleVMFaultEvent
	jmp	.L3374
.L3377:
	cmpl	$255, %ecx
	je	.L3374
	movl	ksCurThread, %eax
	sall	$24, %ecx
	andl	$16777215, %edx
	orl	%edx, %ecx
	subl	$2, 44(%eax)
	movl	%ecx, (%esp)
	call	handleUnknownSyscall
	jmp	.L3374
	.cfi_endproc
.LFE259:
	.size	c_handle_interrupt, .-c_handle_interrupt
	.p2align 4,,15
	.globl	handleSyscall
	.type	handleSyscall, @function
handleSyscall:
.LFB254:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	addl	$7, %eax
	cmpl	$6, %eax
	ja	.L3386
	jmp	*.L3388(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L3388:
	.long	.L3387
	.long	.L3389
	.long	.L3426
	.long	.L3391
	.long	.L3392
	.long	.L3393
	.long	.L3394
	.text
	.p2align 4,,7
	.p2align 3
.L3393:
	call	handleReply
.L3426:
	.p2align 4,,8
	call	handleWait
.L3396:
	.p2align 4,,5
	call	schedule
	.p2align 4,,5
	call	activateThread
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3389:
	.cfi_restore_state
	call	handleReply
	call	schedule
	.p2align 4,,5
	call	activateThread
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3391:
	.cfi_restore_state
	xorl	%edx, %edx
	xorl	%eax, %eax
	call	handleInvocation
	testl	%eax, %eax
	je	.L3396
.L3431:
	movl	ia32KScurInterrupt, %eax
	cmpl	$-1, %eax
	je	.L3396
	subl	$32, %eax
	cmpl	$-1, %eax
	je	.L3396
	movl	%eax, (%esp)
	call	handleInterrupt
	jmp	.L3396
	.p2align 4,,7
	.p2align 3
.L3392:
	xorl	%eax, %eax
	movl	$1, %edx
	call	handleInvocation
	testl	%eax, %eax
	jne	.L3431
	call	schedule
	.p2align 4,,6
	call	activateThread
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3394:
	.cfi_restore_state
	movl	$1, %edx
	movl	$1, %eax
	call	handleInvocation
	testl	%eax, %eax
	jne	.L3431
	call	schedule
	.p2align 4,,6
	call	activateThread
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3387:
	.cfi_restore_state
	movl	ksCurThread, %eax
	movl	%eax, (%esp)
	call	tcbSchedDequeue
	movl	ksCurThread, %eax
	movl	%eax, (%esp)
	call	tcbSchedAppend
	call	rescheduleRequired
	call	schedule
	.p2align 4,,5
	call	activateThread
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L3386:
	.cfi_restore_state
	call	halt
	.cfi_endproc
.LFE254:
	.size	handleSyscall, .-handleSyscall
	.p2align 4,,15
	.globl	slowpath
	.type	slowpath, @function
slowpath:
.LFB260:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	ksCurThread, %edx
	movl	32(%esp), %eax
	movl	$-1, ia32KScurInterrupt
	addl	$2, 56(%edx)
	cmpl	$-8, %eax
	movl	%eax, (%esp)
	jbe	.L3439
	call	handleSyscall
.L3437:
	call	restore_user_context
.L3439:
	.p2align 4,,5
	call	handleUnknownSyscall
	.p2align 4,,5
	jmp	.L3437
	.cfi_endproc
.LFE260:
	.size	slowpath, .-slowpath
	.p2align 4,,15
	.globl	c_handle_syscall
	.type	c_handle_syscall, @function
c_handle_syscall:
.LFB261:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	slowpath
	.cfi_endproc
.LFE261:
	.size	c_handle_syscall, .-c_handle_syscall
	.section	.phys.text
	.p2align 4,,15
	.globl	pit_init
	.type	pit_init, @function
pit_init:
.LFB563:
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
.LFE563:
	.size	pit_init, .-pit_init
	.p2align 4,,15
	.globl	pit_wait_wraparound
	.type	pit_wait_wraparound, @function
pit_wait_wraparound:
.LFB564:
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
	jmp	.L3446
	.p2align 4,,7
	.p2align 3
.L3448:
	movl	%edx, %ebx
.L3446:
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
	jbe	.L3448
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
.LFE564:
	.size	pit_wait_wraparound, .-pit_wait_wraparound
	.p2align 4,,15
	.globl	apic_measure_freq
	.type	apic_measure_freq, @function
apic_measure_freq:
.LFB266:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %ebx
	call	pit_init
	call	pit_wait_wraparound
	movl	$11, 992(%ebx)
	movl	$-1, 896(%ebx)
	call	pit_wait_wraparound
	movl	912(%ebx), %eax
	movl	$1374389535, %edx
	addl	$8, %esp
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
.LFE266:
	.size	apic_measure_freq, .-apic_measure_freq
	.text
	.p2align 4,,15
	.globl	memzero
	.type	memzero, @function
memzero:
.LFB565:
	.cfi_startproc
	movl	8(%esp), %eax
	movl	4(%esp), %edx
	testl	%eax, %eax
	je	.L3451
	.p2align 4,,7
	.p2align 3
.L3457:
	movl	$0, (%edx)
	addl	$4, %edx
	subl	$4, %eax
	jne	.L3457
.L3451:
	rep ret
	.cfi_endproc
.LFE565:
	.size	memzero, .-memzero
	.p2align 4,,15
	.globl	memset
	.type	memset, @function
memset:
.LFB566:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	16(%esp), %eax
	movl	12(%esp), %esi
	movl	20(%esp), %ecx
	testl	%eax, %eax
	jne	.L3460
	movl	%esi, %edx
	orl	%ecx, %edx
	andl	$3, %edx
	jne	.L3460
	testl	%ecx, %ecx
	movl	%esi, %edx
	je	.L3467
	.p2align 4,,7
	.p2align 3
.L3469:
	movl	$0, (%edx)
	addl	$4, %edx
	subl	$4, %ecx
	jne	.L3469
.L3467:
	movl	%esi, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.L3460:
	.cfi_restore_state
	testl	%ecx, %ecx
	movl	%esi, %edx
	leal	(%esi,%ecx), %ebx
	je	.L3467
	.p2align 4,,7
	.p2align 3
.L3470:
	movb	%al, (%edx)
	addl	$1, %edx
	cmpl	%ebx, %edx
	je	.L3467
	movb	%al, (%edx)
	addl	$1, %edx
	cmpl	%ebx, %edx
	jne	.L3470
	jmp	.L3467
	.cfi_endproc
.LFE566:
	.size	memset, .-memset
	.section	.boot.text
	.p2align 4,,15
	.globl	elf32_load
	.type	elf32_load, @function
elf32_load:
.LFB300:
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
	subl	$16, %esp
	.cfi_def_cfa_offset 36
	movl	36(%esp), %eax
	movl	28(%eax), %ebx
	addl	%eax, %ebx
	cmpw	$0, 44(%eax)
	je	.L3474
	.p2align 4,,7
	.p2align 3
.L3482:
	movl	40(%esp), %ebp
	addl	8(%ebx), %ebp
	movl	16(%ebx), %esi
	movl	36(%esp), %eax
	addl	4(%ebx), %eax
	movl	%ebp, %edx
	subl	%eax, %edx
	testl	%esi, %esi
	leal	(%eax,%esi), %ecx
	je	.L3479
	movl	%ebx, 12(%esp)
	.p2align 4,,7
	.p2align 3
.L3483:
	movzbl	(%eax), %ebx
	addl	$1, %eax
	movb	%bl, -1(%eax,%edx)
	cmpl	%ecx, %eax
	jne	.L3483
	movl	12(%esp), %ebx
.L3479:
	movl	20(%ebx), %eax
	addl	$1, %edi
	addl	$32, %ebx
	movl	$0, 4(%esp)
	subl	%esi, %eax
	addl	%ebp, %esi
	movl	%eax, 8(%esp)
	movl	%esi, (%esp)
	call	memset
	movl	36(%esp), %eax
	movzwl	44(%eax), %eax
	cmpl	%edi, %eax
	ja	.L3482
.L3474:
	addl	$16, %esp
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
.LFE300:
	.size	elf32_load, .-elf32_load
	.p2align 4,,15
	.type	load_boot_module.isra.129, @function
load_boot_module.isra.129:
.LFB700:
	.cfi_startproc
	cmpl	$1179403647, (%edx)
	je	.L3487
.L3506:
	xorl	%eax, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L3487:
	cmpb	$1, 4(%edx)
	jne	.L3506
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-24(%ebp), %ebx
	movl	%edx, 4(%esp)
	movl	%ebx, (%esp)
	movl	%ecx, -36(%ebp)
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	call	elf32_getMemoryBounds
	movl	-20(%ebp), %esi
	movl	-24(%ebp), %ebx
	movl	-28(%ebp), %edx
	movl	-32(%ebp), %eax
	movl	-36(%ebp), %ecx
	subl	$4, %esp
	testl	%esi, %esi
	je	.L3490
	testl	$4095, %ebx
	jne	.L3490
	subl	$1, %esi
	andl	$-4096, %esi
	leal	12288(%esi), %edi
	addl	$4096, %esi
	cmpl	$-536870912, %edi
	ja	.L3490
	movl	24(%edx), %edi
	cmpl	%edi, %ebx
	movl	%edi, -28(%ebp)
	ja	.L3490
	cmpl	%edi, %esi
	jbe	.L3490
	addl	$3, %eax
	subl	%ebx, %esi
	movl	%eax, -32(%ebp)
	sall	$4, %eax
	addl	%ecx, %esi
	addl	$glks, %eax
	movl	%eax, %edi
	movl	%ecx, %eax
	subl	%ebx, %eax
	movl	-28(%ebp), %ebx
	cmpl	glks+4, %esi
	movl	%eax, 20(%edi)
	movl	%ecx, 12(%edi)
	movl	%esi, 16(%edi)
	movl	%ebx, 24(%edi)
	ja	.L3490
	movl	%esi, %eax
	subl	%ecx, %eax
	je	.L3492
	.p2align 4,,7
	.p2align 3
.L3499:
	movl	$0, (%ecx)
	addl	$4, %ecx
	subl	$4, %eax
	jne	.L3499
.L3492:
	movl	-32(%ebp), %eax
	movl	%edx, (%esp)
	sall	$4, %eax
	movl	glks+20(%eax), %eax
	movl	%eax, 4(%esp)
	call	elf32_load
	movl	%esi, %eax
	jmp	.L3502
	.p2align 4,,7
	.p2align 3
.L3490:
	xorl	%eax, %eax
.L3502:
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
	ret
	.cfi_endproc
.LFE700:
	.size	load_boot_module.isra.129, .-load_boot_module.isra.129
	.text
	.p2align 4,,15
	.globl	memcpy
	.type	memcpy, @function
memcpy:
.LFB567:
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
	movl	24(%esp), %esi
	movl	16(%esp), %edi
	movl	20(%esp), %ecx
	testl	%esi, %esi
	leal	(%edi,%esi), %ebx
	movl	%edi, %edx
	je	.L3511
	.p2align 4,,7
	.p2align 3
.L3512:
	movzbl	(%ecx), %eax
	addl	$1, %edx
	addl	$1, %ecx
	movb	%al, -1(%edx)
	cmpl	%ebx, %edx
	jne	.L3512
.L3511:
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
	.cfi_endproc
.LFE567:
	.size	memcpy, .-memcpy
	.p2align 4,,15
	.globl	strncmp
	.type	strncmp, @function
strncmp:
.LFB568:
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
	je	.L3522
	movzbl	(%edi), %ecx
	movzbl	0(%ebp), %edx
	movzbl	%cl, %eax
	subl	%edx, %eax
	jne	.L3515
	testb	%cl, %cl
	je	.L3522
	xorl	%edx, %edx
	jmp	.L3516
	.p2align 4,,7
	.p2align 3
.L3517:
	movzbl	(%edi,%edx), %ebx
	movzbl	0(%ebp,%edx), %ecx
	movzbl	%bl, %eax
	subl	%ecx, %eax
	jne	.L3515
	testb	%bl, %bl
	je	.L3522
.L3516:
	addl	$1, %edx
	cmpl	%esi, %edx
	jne	.L3517
.L3522:
	xorl	%eax, %eax
.L3515:
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
.LFE568:
	.size	strncmp, .-strncmp
	.p2align 4,,15
	.globl	char_to_int
	.type	char_to_int, @function
char_to_int:
.LFB569:
	.cfi_startproc
	movl	4(%esp), %eax
	leal	-48(%eax), %edx
	cmpb	$9, %dl
	jbe	.L3529
	leal	-65(%eax), %edx
	cmpb	$5, %dl
	jbe	.L3530
	leal	-97(%eax), %edx
	cmpb	$5, %dl
	ja	.L3528
	movsbl	%al, %eax
	subl	$87, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L3530:
	movsbl	%al, %eax
	subl	$55, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L3529:
	movsbl	%al, %eax
	subl	$48, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L3528:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE569:
	.size	char_to_int, .-char_to_int
	.p2align 4,,15
	.globl	str_to_int
	.type	str_to_int, @function
str_to_int:
.LFB570:
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
	je	.L3547
.L3532:
	testb	%dl, %dl
	je	.L3544
.L3533:
	xorl	%eax, %eax
	jmp	.L3539
	.p2align 4,,7
	.p2align 3
.L3548:
	subl	$48, %edx
.L3536:
	cmpl	%esi, %edx
	.p2align 4,,2
	jae	.L3544
	imull	%esi, %eax
	addl	$1, %ecx
	addl	%edx, %eax
	movsbl	(%ecx), %edx
	testb	%dl, %dl
	je	.L3545
.L3539:
	leal	-48(%edx), %ebx
	cmpb	$9, %bl
	jbe	.L3548
	leal	-65(%edx), %ebx
	cmpb	$5, %bl
	ja	.L3537
	subl	$55, %edx
	jmp	.L3536
	.p2align 4,,7
	.p2align 3
.L3544:
	movl	$-1, %eax
.L3545:
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
.L3537:
	.cfi_restore_state
	leal	-97(%edx), %ebx
	cmpb	$5, %bl
	ja	.L3544
	subl	$87, %edx
	jmp	.L3536
	.p2align 4,,7
	.p2align 3
.L3547:
	movzbl	1(%ecx), %eax
	andl	$-33, %eax
	cmpb	$88, %al
	jne	.L3533
	movsbl	2(%ecx), %edx
	movw	$16, %si
	addl	$2, %ecx
	jmp	.L3532
	.cfi_endproc
.LFE570:
	.size	str_to_int, .-str_to_int
	.p2align 4,,15
	.globl	cmdline_parse
	.type	cmdline_parse, @function
cmdline_parse:
.LFB297:
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
	call	parse_opt.constprop.131
	cmpl	$-1, %eax
	je	.L3550
	movl	$cmdline_val, (%esp)
	call	str_to_int
	leal	-1(%eax), %edx
	cmpl	$7, %edx
	jbe	.L3559
.L3550:
	movl	$0, 4(%ebx)
	movl	$cmdline_str_num_sh_frames, %edx
	movl	%esi, %eax
	call	parse_opt.constprop.131
	cmpl	$-1, %eax
	je	.L3549
	movl	$cmdline_val, (%esp)
	call	str_to_int
	cmpl	$1048575, %eax
	ja	.L3549
	movl	%eax, 4(%ebx)
.L3549:
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
.L3559:
	.cfi_restore_state
	movl	%eax, (%ebx)
	jmp	.L3550
	.cfi_endproc
.LFE297:
	.size	cmdline_parse, .-cmdline_parse
	.section	.boot.text
	.p2align 4,,15
	.globl	boot_sys
	.type	boot_sys, @function
boot_sys:
.LFB294:
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
	cmpl	$732803074, 48(%esp)
	movl	$1, glks+24
	je	.L3626
.L3561:
	call	halt
	.p2align 4,,7
	.p2align 3
.L3626:
	movl	52(%esp), %eax
	movl	$cmdline_opt, 4(%esp)
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	cmdline_parse
	movl	52(%esp), %eax
	testb	$1, (%eax)
	je	.L3561
	movl	4(%eax), %eax
	sall	$10, %eax
	cmpl	$525311, %eax
	jbe	.L3561
	movl	$_boot_cpu_end, %edx
	movl	$524288, %eax
	subl	$_boot_cpu_start, %edx
	testl	%edx, %edx
	leal	524288(%edx), %ecx
	je	.L3565
	.p2align 4,,7
	.p2align 3
.L3604:
	movzbl	_boot_cpu_start-524288(%eax), %edx
	addl	$1, %eax
	movb	%dl, -1(%eax)
	cmpl	%ecx, %eax
	jne	.L3604
.L3565:
	movl	52(%esp), %eax
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
	movl	56(%esp), %eax
	movl	%edx, glks+4
	movl	%eax, glks+1792
	call	pic_remap_irqs
	movl	$0, glks+188
	call	acpi_init
	testl	%eax, %eax
	je	.L3561
	movl	$8, 8(%esp)
	movl	$glks+28, 4(%esp)
	movl	%eax, (%esp)
	call	acpi_madt_scan
	testl	%eax, %eax
	movl	%eax, glks+24
	je	.L3561
	movl	cmdline_opt, %edx
	cmpl	%edx, %eax
	jbe	.L3568
	movl	%edx, glks+24
.L3568:
	movl	52(%esp), %eax
	testb	$8, (%eax)
	je	.L3561
	movl	20(%eax), %ebp
	testl	%ebp, %ebp
	je	.L3561
	movl	24(%eax), %edi
	movl	4(%edi), %eax
	movl	%eax, %edx
	subl	(%edi), %edx
	testl	%edx, %edx
	jle	.L3561
	movl	%edi, %edx
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	movl	%edi, 12(%esp)
	jmp	.L3569
	.p2align 4,,7
	.p2align 3
.L3570:
	movl	20(%edx), %eax
	movl	%edx, %esi
	addl	$16, %edx
	movl	%eax, %edi
	subl	16(%esi), %edi
	testl	%edi, %edi
	jle	.L3561
.L3569:
	cmpl	%eax, %ecx
	cmovb	%eax, %ecx
	addl	$1, %ebx
	cmpl	%ebp, %ebx
	jne	.L3570
	movl	glks+24, %edx
	subl	$1, %ecx
	xorl	%ebx, %ebx
	andl	$-4096, %ecx
	movl	12(%esp), %edi
	leal	4096(%ecx), %esi
	movl	52(%esp), %ebp
	movl	%esi, %eax
	testl	%edx, %edx
	jne	.L3607
	jmp	.L3575
	.p2align 4,,7
	.p2align 3
.L3572:
	cmpl	%ecx, %ebx
	jae	.L3573
	movl	24(%ebp), %edi
.L3607:
	movl	%ebx, %edx
	movl	%eax, %ecx
	sall	$4, %edx
	movl	%ebx, %eax
	movl	(%edi,%edx), %edx
	call	load_boot_module.isra.129
	testl	%eax, %eax
	je	.L3561
	movl	20(%ebp), %edx
	addl	$1, %ebx
	movl	glks+24, %ecx
	cmpl	%edx, %ebx
	movl	%edx, %edi
	jb	.L3572
.L3573:
	cmpl	%ecx, %edx
	jae	.L3575
	movl	52(%esp), %ebx
	jmp	.L3576
	.p2align 4,,7
	.p2align 3
.L3627:
	movl	20(%ebx), %edx
.L3576:
	addl	$268435455, %edx
	movl	%eax, %ecx
	sall	$4, %edx
	movl	%edi, %eax
	addl	24(%ebx), %edx
	movl	(%edx), %edx
	call	load_boot_module.isra.129
	testl	%eax, %eax
	je	.L3561
	addl	$1, %edi
	cmpl	glks+24, %edi
	jb	.L3627
.L3575:
	movl	glks+12, %edx
	movl	%edx, %ecx
	subl	%esi, %ecx
	addl	%ecx, %eax
	movl	%eax, %ebx
	subl	%edx, %ebx
	movl	%ebx, %edx
	testl	%edx, %edx
	leal	(%ebx,%esi), %ebx
	je	.L3580
	.p2align 4,,7
	.p2align 3
.L3605:
	movzbl	(%esi), %edx
	addl	$1, %esi
	movb	%dl, -1(%esi,%ecx)
	cmpl	%ebx, %esi
	jne	.L3605
.L3580:
	movl	glks+24, %esi
	xorl	%edx, %edx
	movl	%esi, %ebx
	sall	$4, %ebx
	testl	%esi, %esi
	je	.L3579
	.p2align 4,,7
	.p2align 3
.L3606:
	addl	%ecx, glks+60(%edx)
	addl	%ecx, glks+64(%edx)
	addl	%ecx, glks+68(%edx)
	addl	$16, %edx
	cmpl	%ebx, %edx
	jne	.L3606
.L3579:
	movl	cmdline_opt+4, %edx
	movl	%eax, glks
	movl	%eax, glks+16
	sall	$12, %edx
	addl	%eax, %edx
	cmpl	glks+4, %edx
	movl	%edx, glks+20
	ja	.L3561
	cmpl	%edx, %eax
	ja	.L3561
	movl	%edx, glks
	call	platAddDevices
	call	try_boot_node
	testl	%eax, %eax
	je	.L3561
	cmpl	$1, glks+24
	jbe	.L3560
	movl	$1, %ebx
.L3585:
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
	jb	.L3585
.L3560:
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
.LFE294:
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
	.comm	ksReadyQueues,32768,32
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
	.size	kernel_pt_list, 32768
kernel_pt_list:
	.zero	32768
	.globl	kernel_pd_list
	.align 4096
	.type	kernel_pd_list, @object
	.size	kernel_pd_list, 32768
kernel_pd_list:
	.zero	32768
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
	.size	ndks_list, 98304
ndks_list:
	.zero	98304
	.globl	glks
	.section	.boot.glob
	.align 32
	.type	glks, @object
	.size	glks, 1796
glks:
	.zero	1796
	.local	__control_reg_order
	.comm	__control_reg_order,4,4
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
