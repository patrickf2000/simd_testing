	.text
	.file	"spmv_float.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function read_timer
.LCPI0_0:
	.quad	0x408f400000000000              # double 1000
	.text
	.globl	read_timer
	.p2align	4, 0x90
	.type	read_timer,@function
read_timer:                             # @read_timer
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	-16(%rbp), %rdi
	callq	ftime
	cvtsi2sdq	-16(%rbp), %xmm0
	movzwl	-8(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LCPI0_0(%rip), %xmm2           # xmm2 = mem[0],zero
	divsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	read_timer, .Lfunc_end0-read_timer
	.cfi_endproc
                                        # -- End function
	.globl	print_array                     # -- Begin function print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	movq	-8(%rbp), %rsi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	$0, -36(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB1_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$0, -40(%rbp)
.LBB1_3:                                # %for.cond1
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jge	.LBB1_6
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB1_3 Depth=2
	movq	-16(%rbp), %rsi
	movl	-36(%rbp), %edx
	movl	-40(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	-36(%rbp), %edi
	imull	-32(%rbp), %edi
	addl	-40(%rbp), %edi
	movslq	%edi, %rdi
	movss	(%rax,%rdi,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.1, %rdi
	movb	$1, %al
	callq	printf
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB1_3 Depth=2
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB1_3
.LBB1_6:                                # %for.end
                                        #   in Loop: Header=BB1_1 Depth=1
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
# %bb.7:                                # %for.inc6
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB1_1
.LBB1_8:                                # %for.end8
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	print_array, .Lfunc_end1-print_array
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI2_0:
	.long	0x3f800000                      # float 1
.LCPI2_1:
	.long	0xbf800000                      # float -1
.LCPI2_2:
	.long	0x40800000                      # float 4
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$160, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$10240, -76(%rbp)               # imm = 0x2800
	cmpl	$1, -8(%rbp)
	jle	.LBB2_2
# %bb.1:                                # %if.then
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	callq	atoi
	movl	%eax, -76(%rbp)
.LBB2_2:                                # %if.end
	movl	-76(%rbp), %eax
	imull	-76(%rbp), %eax
	movl	%eax, -88(%rbp)
	imull	$5, -88(%rbp), %eax
	movl	%eax, -80(%rbp)
	movslq	-88(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -24(%rbp)
	movslq	-80(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -32(%rbp)
	movslq	-80(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -40(%rbp)
	movslq	-88(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -48(%rbp)
	movslq	-88(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -56(%rbp)
	movl	$0, -60(%rbp)
	movl	$0, -84(%rbp)
	movl	$0, -64(%rbp)
.LBB2_3:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	movl	-64(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB2_18
# %bb.4:                                # %for.body
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	$0, -68(%rbp)
.LBB2_5:                                # %for.cond18
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-68(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB2_16
# %bb.6:                                # %for.body21
                                        #   in Loop: Header=BB2_5 Depth=2
	movl	-84(%rbp), %edx
	movq	-24(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	cmpl	$0, -64(%rbp)
	jle	.LBB2_8
# %bb.7:                                # %if.then25
                                        #   in Loop: Header=BB2_5 Depth=2
	movl	-60(%rbp), %edx
	subl	-76(%rbp), %edx
	movq	-32(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-40(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movss	.LCPI2_1(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rax,%rcx,4)
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
.LBB2_8:                                # %if.end30
                                        #   in Loop: Header=BB2_5 Depth=2
	cmpl	$0, -68(%rbp)
	jle	.LBB2_10
# %bb.9:                                # %if.then33
                                        #   in Loop: Header=BB2_5 Depth=2
	movl	-60(%rbp), %edx
	subl	$1, %edx
	movq	-32(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-40(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movss	.LCPI2_1(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rax,%rcx,4)
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
.LBB2_10:                               # %if.end40
                                        #   in Loop: Header=BB2_5 Depth=2
	movl	-60(%rbp), %edx
	movq	-32(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-40(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movss	.LCPI2_2(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rax,%rcx,4)
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	movl	-68(%rbp), %eax
	movl	-76(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB2_12
# %bb.11:                               # %if.then49
                                        #   in Loop: Header=BB2_5 Depth=2
	movl	-60(%rbp), %edx
	addl	$1, %edx
	movq	-32(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-40(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movss	.LCPI2_1(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rax,%rcx,4)
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
.LBB2_12:                               # %if.end55
                                        #   in Loop: Header=BB2_5 Depth=2
	movl	-64(%rbp), %eax
	movl	-76(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB2_14
# %bb.13:                               # %if.then59
                                        #   in Loop: Header=BB2_5 Depth=2
	movl	-60(%rbp), %edx
	addl	-76(%rbp), %edx
	movq	-32(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-40(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movss	.LCPI2_1(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rax,%rcx,4)
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
.LBB2_14:                               # %if.end66
                                        #   in Loop: Header=BB2_5 Depth=2
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
# %bb.15:                               # %for.inc
                                        #   in Loop: Header=BB2_5 Depth=2
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	.LBB2_5
.LBB2_16:                               # %for.end
                                        #   in Loop: Header=BB2_3 Depth=1
	jmp	.LBB2_17
.LBB2_17:                               # %for.inc69
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -64(%rbp)
	jmp	.LBB2_3
.LBB2_18:                               # %for.end71
	movl	-84(%rbp), %edx
	movq	-24(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	$0, -64(%rbp)
.LBB2_19:                               # %for.cond74
                                        # =>This Inner Loop Header: Depth=1
	movl	-64(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jge	.LBB2_22
# %bb.20:                               # %for.body77
                                        #   in Loop: Header=BB2_19 Depth=1
	movq	-48(%rbp), %rax
	movslq	-64(%rbp), %rcx
	movss	.LCPI2_0(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, (%rax,%rcx,4)
# %bb.21:                               # %for.inc80
                                        #   in Loop: Header=BB2_19 Depth=1
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -64(%rbp)
	jmp	.LBB2_19
.LBB2_22:                               # %for.end82
	callq	read_timer
	movsd	%xmm0, -112(%rbp)
	movl	$0, -60(%rbp)
.LBB2_23:                               # %for.cond84
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_26 Depth 2
	movl	-60(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jge	.LBB2_33
# %bb.24:                               # %for.body87
                                        #   in Loop: Header=BB2_23 Depth=1
	xorps	%xmm0, %xmm0
	movss	%xmm0, -116(%rbp)
	movq	-24(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -124(%rbp)
	movq	-24(%rbp), %rax
	movl	-60(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -128(%rbp)
	movl	-128(%rbp), %eax
	subl	-124(%rbp), %eax
	subl	$1, %eax
	addl	$1, %eax
	shrl	$0, %eax
	subl	$1, %eax
	movl	%eax, -132(%rbp)
	movl	-124(%rbp), %eax
	movl	%eax, -136(%rbp)
	movl	-124(%rbp), %eax
	cmpl	-128(%rbp), %eax
	jge	.LBB2_31
# %bb.25:                               # %simd.if.then
                                        #   in Loop: Header=BB2_23 Depth=1
	movl	$0, -140(%rbp)
	xorps	%xmm0, %xmm0
	movss	%xmm0, -148(%rbp)
.LBB2_26:                               # %omp.inner.for.cond
                                        #   Parent Loop BB2_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-140(%rbp), %eax
	movl	-132(%rbp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jae	.LBB2_30
# %bb.27:                               # %omp.inner.for.body
                                        #   in Loop: Header=BB2_26 Depth=2
	movl	-124(%rbp), %eax
	movl	-140(%rbp), %ecx
	shll	$0, %ecx
	addl	%ecx, %eax
	movl	%eax, -144(%rbp)
	movq	-40(%rbp), %rax
	movslq	-144(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-48(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-144(%rbp), %rdx
	movslq	(%rcx,%rdx,4), %rcx
	mulss	(%rax,%rcx,4), %xmm0
	addss	-148(%rbp), %xmm0
	movss	%xmm0, -148(%rbp)
# %bb.28:                               # %omp.body.continue
                                        #   in Loop: Header=BB2_26 Depth=2
	jmp	.LBB2_29
.LBB2_29:                               # %omp.inner.for.inc
                                        #   in Loop: Header=BB2_26 Depth=2
	movl	-140(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -140(%rbp)
	jmp	.LBB2_26
.LBB2_30:                               # %omp.inner.for.end
                                        #   in Loop: Header=BB2_23 Depth=1
	movl	-124(%rbp), %eax
	movl	-128(%rbp), %ecx
	subl	-124(%rbp), %ecx
	subl	$1, %ecx
	addl	$1, %ecx
	shrl	$0, %ecx
	shll	$0, %ecx
	addl	%ecx, %eax
	movl	%eax, -72(%rbp)
	movss	-116(%rbp), %xmm0               # xmm0 = mem[0],zero,zero,zero
	addss	-148(%rbp), %xmm0
	movss	%xmm0, -116(%rbp)
.LBB2_31:                               # %simd.if.end
                                        #   in Loop: Header=BB2_23 Depth=1
	movss	-116(%rbp), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movq	-56(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.32:                               # %for.inc127
                                        #   in Loop: Header=BB2_23 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB2_23
.LBB2_33:                               # %for.end129
	callq	read_timer
	subsd	-112(%rbp), %xmm0
	movsd	%xmm0, -112(%rbp)
	movsd	-112(%rbp), %xmm0               # xmm0 = mem[0],zero
	movabsq	$.L.str.3, %rdi
	movb	$1, %al
	callq	printf
	movl	$0, -152(%rbp)
	movl	$0, -60(%rbp)
.LBB2_34:                               # %for.cond133
                                        # =>This Inner Loop Header: Depth=1
	movl	-60(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jge	.LBB2_39
# %bb.35:                               # %for.body136
                                        #   in Loop: Header=BB2_34 Depth=1
	movq	-56(%rbp), %rax
	movslq	-60(%rbp), %rcx
	xorps	%xmm0, %xmm0
	ucomiss	(%rax,%rcx,4), %xmm0
	jbe	.LBB2_37
# %bb.36:                               # %if.then141
                                        #   in Loop: Header=BB2_34 Depth=1
	movl	-152(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -152(%rbp)
.LBB2_37:                               # %if.end143
                                        #   in Loop: Header=BB2_34 Depth=1
	jmp	.LBB2_38
.LBB2_38:                               # %for.inc144
                                        #   in Loop: Header=BB2_34 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB2_34
.LBB2_39:                               # %for.end146
	movl	-152(%rbp), %esi
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
	movq	-24(%rbp), %rdi
	callq	free
	movq	-32(%rbp), %rdi
	callq	free
	movq	-40(%rbp), %rdi
	callq	free
	movq	-48(%rbp), %rdi
	callq	free
	movq	-56(%rbp), %rdi
	callq	free
	xorl	%eax, %eax
	addq	$160, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s:\n"
	.size	.L.str, 5

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%s[%d][%d]:%f  "
	.size	.L.str.1, 16

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"\n"
	.size	.L.str.2, 2

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"seq elasped time(s): %.4f\n"
	.size	.L.str.3, 27

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Errors: %d\n"
	.size	.L.str.4, 12

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym read_timer
	.addrsig_sym ftime
	.addrsig_sym printf
	.addrsig_sym atoi
	.addrsig_sym malloc
	.addrsig_sym free
