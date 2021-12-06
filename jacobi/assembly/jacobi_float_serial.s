	.text
	.file	"jacobi_float.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function jacobi_seq
.LCPI0_0:
	.quad	0x4024000000000000              # double 10
.LCPI0_1:
	.quad	0x4000000000000000              # double 2
.LCPI0_2:
	.quad	0xc000000000000000              # double -2
.LCPI0_3:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	jacobi_seq
	.p2align	4, 0x90
	.type	jacobi_seq,@function
jacobi_seq:                             # @jacobi_seq
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$160, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movss	%xmm0, -12(%rbp)
	movss	%xmm1, -16(%rbp)
	movss	%xmm2, -20(%rbp)
	movss	%xmm3, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	movss	%xmm4, -44(%rbp)
	movl	%r8d, -48(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -152(%rbp)                # 8-byte Spill
	movq	%rsp, %rdx
	movq	%rdx, -88(%rbp)
	movq	%rcx, %rdx
	imulq	%rax, %rdx
	leaq	15(,%rdx,4), %rsi
	andq	$-16, %rsi
	movq	%rsp, %rdx
	subq	%rsi, %rdx
	movq	%rdx, -144(%rbp)                # 8-byte Spill
	movq	%rdx, %rsp
	movq	%rcx, -96(%rbp)
	movq	%rax, -104(%rbp)
	movl	-8(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -136(%rbp)                # 8-byte Spill
	movq	-32(%rbp), %rax
	movq	%rax, -112(%rbp)
	movl	-8(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -128(%rbp)                # 8-byte Spill
	movq	-40(%rbp), %rax
	movq	%rax, -120(%rbp)
	movss	-12(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	mulss	-12(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI0_3(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -68(%rbp)
	movss	-16(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	mulss	-16(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI0_3(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -72(%rbp)
	movss	-12(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	mulss	-12(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI0_2(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movss	-16(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	-16(%rbp), %xmm1
	cvtss2sd	%xmm1, %xmm2
	movsd	.LCPI0_1(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movss	-20(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	cvtss2sd	%xmm1, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -76(%rbp)
	movss	-44(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -64(%rbp)
	movl	$1, -60(%rbp)
.LBB0_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #       Child Loop BB0_7 Depth 3
                                        #     Child Loop BB0_13 Depth 2
                                        #       Child Loop BB0_15 Depth 3
	movl	-60(%rbp), %ecx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	-48(%rbp), %ecx
	movb	%al, -153(%rbp)                 # 1-byte Spill
	jg	.LBB0_3
# %bb.2:                                # %land.rhs
                                        #   in Loop: Header=BB0_1 Depth=1
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	ucomiss	-44(%rbp), %xmm0
	seta	%al
	movb	%al, -153(%rbp)                 # 1-byte Spill
.LBB0_3:                                # %land.end
                                        #   in Loop: Header=BB0_1 Depth=1
	movb	-153(%rbp), %al                 # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_4
	jmp	.LBB0_21
.LBB0_4:                                # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	xorps	%xmm0, %xmm0
	movss	%xmm0, -64(%rbp)
	movl	$0, -52(%rbp)
.LBB0_5:                                # %for.cond
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_7 Depth 3
	movl	-52(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB0_12
# %bb.6:                                # %for.body
                                        #   in Loop: Header=BB0_5 Depth=2
	movl	$0, -56(%rbp)
.LBB0_7:                                # %for.cond23
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-56(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB0_10
# %bb.8:                                # %for.body26
                                        #   in Loop: Header=BB0_7 Depth=3
	movq	-144(%rbp), %rax                # 8-byte Reload
	movq	-152(%rbp), %rdx                # 8-byte Reload
	movq	-136(%rbp), %rdi                # 8-byte Reload
	movq	-112(%rbp), %rcx
	movslq	-52(%rbp), %rsi
	imulq	%rdi, %rsi
	shlq	$2, %rsi
	addq	%rsi, %rcx
	movslq	-56(%rbp), %rsi
	movss	(%rcx,%rsi,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movslq	-52(%rbp), %rcx
	imulq	%rdx, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-56(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.9:                                # %for.inc
                                        #   in Loop: Header=BB0_7 Depth=3
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB0_7
.LBB0_10:                               # %for.end
                                        #   in Loop: Header=BB0_5 Depth=2
	jmp	.LBB0_11
.LBB0_11:                               # %for.inc33
                                        #   in Loop: Header=BB0_5 Depth=2
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.LBB0_5
.LBB0_12:                               # %for.end35
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$1, -52(%rbp)
.LBB0_13:                               # %for.cond36
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_15 Depth 3
	movl	-52(%rbp), %eax
	movl	-4(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB0_20
# %bb.14:                               # %for.body40
                                        #   in Loop: Header=BB0_13 Depth=2
	movl	$1, -56(%rbp)
.LBB0_15:                               # %for.cond41
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-56(%rbp), %eax
	movl	-8(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB0_18
# %bb.16:                               # %for.body45
                                        #   in Loop: Header=BB0_15 Depth=3
	movq	-136(%rbp), %rdx                # 8-byte Reload
	movq	-144(%rbp), %rax                # 8-byte Reload
	movq	-152(%rbp), %rsi                # 8-byte Reload
	movq	-128(%rbp), %r8                 # 8-byte Reload
	movss	-68(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movl	-52(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdi
	imulq	%rsi, %rdi
	shlq	$2, %rdi
	movq	%rax, %rcx
	addq	%rdi, %rcx
	movslq	-56(%rbp), %rdi
	movss	(%rcx,%rdi,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	movl	-52(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rdi
	imulq	%rsi, %rdi
	shlq	$2, %rdi
	movq	%rax, %rcx
	addq	%rdi, %rcx
	movslq	-56(%rbp), %rdi
	addss	(%rcx,%rdi,4), %xmm1
	mulss	%xmm1, %xmm0
	movss	-72(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movslq	-52(%rbp), %rdi
	imulq	%rsi, %rdi
	shlq	$2, %rdi
	movq	%rax, %rcx
	addq	%rdi, %rcx
	movl	-56(%rbp), %edi
	subl	$1, %edi
	movslq	%edi, %rdi
	movss	(%rcx,%rdi,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movslq	-52(%rbp), %rdi
	imulq	%rsi, %rdi
	shlq	$2, %rdi
	movq	%rax, %rcx
	addq	%rdi, %rcx
	movl	-56(%rbp), %edi
	addl	$1, %edi
	movslq	%edi, %rdi
	addss	(%rcx,%rdi,4), %xmm2
	mulss	%xmm2, %xmm1
	addss	%xmm1, %xmm0
	movss	-76(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movslq	-52(%rbp), %rdi
	imulq	%rsi, %rdi
	shlq	$2, %rdi
	movq	%rax, %rcx
	addq	%rdi, %rcx
	movslq	-56(%rbp), %rdi
	mulss	(%rcx,%rdi,4), %xmm1
	addss	%xmm1, %xmm0
	movq	-120(%rbp), %rcx
	movslq	-52(%rbp), %rdi
	imulq	%r8, %rdi
	shlq	$2, %rdi
	addq	%rdi, %rcx
	movslq	-56(%rbp), %rdi
	subss	(%rcx,%rdi,4), %xmm0
	divss	-76(%rbp), %xmm0
	movss	%xmm0, -80(%rbp)
	movslq	-52(%rbp), %rcx
	imulq	%rsi, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-56(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	-24(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	-80(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movq	-112(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rdx, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-56(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-80(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	-80(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -64(%rbp)
# %bb.17:                               # %for.inc94
                                        #   in Loop: Header=BB0_15 Depth=3
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB0_15
.LBB0_18:                               # %for.end96
                                        #   in Loop: Header=BB0_13 Depth=2
	jmp	.LBB0_19
.LBB0_19:                               # %for.inc97
                                        #   in Loop: Header=BB0_13 Depth=2
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.LBB0_13
.LBB0_20:                               # %for.end99
                                        #   in Loop: Header=BB0_1 Depth=1
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	callq	sqrt
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -64(%rbp)
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB0_1
.LBB0_21:                               # %while.end
	movl	-60(%rbp), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.1, %rdi
	movb	$1, %al
	callq	printf
	movq	-88(%rbp), %rax
	movq	%rax, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	jacobi_seq, .Lfunc_end0-jacobi_seq
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function jacobi_omp
.LCPI1_0:
	.quad	0x4024000000000000              # double 10
.LCPI1_1:
	.quad	0x4000000000000000              # double 2
.LCPI1_2:
	.quad	0xc000000000000000              # double -2
.LCPI1_3:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	jacobi_omp
	.p2align	4, 0x90
	.type	jacobi_omp,@function
jacobi_omp:                             # @jacobi_omp
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movss	%xmm0, -12(%rbp)
	movss	%xmm1, -16(%rbp)
	movss	%xmm2, -20(%rbp)
	movss	%xmm3, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	movss	%xmm4, -44(%rbp)
	movl	%r8d, -48(%rbp)
	movslq	-4(%rbp), %rdi
	shlq	$2, %rdi
	movslq	-8(%rbp), %rax
	imulq	%rax, %rdi
	callq	malloc
	movq	%rax, -88(%rbp)
	movl	-8(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -192(%rbp)                # 8-byte Spill
	movq	-88(%rbp), %rax
	movq	%rax, -96(%rbp)
	movl	-8(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -184(%rbp)                # 8-byte Spill
	movq	-32(%rbp), %rax
	movq	%rax, -104(%rbp)
	movl	-8(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -176(%rbp)                # 8-byte Spill
	movq	-40(%rbp), %rax
	movq	%rax, -112(%rbp)
	movss	-12(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	mulss	-12(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI1_3(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -68(%rbp)
	movss	-16(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	mulss	-16(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI1_3(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -72(%rbp)
	movss	-12(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	mulss	-12(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI1_2(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movss	-16(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	-16(%rbp), %xmm1
	cvtss2sd	%xmm1, %xmm2
	movsd	.LCPI1_1(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movss	-20(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	cvtss2sd	%xmm1, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -76(%rbp)
	movss	-44(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -64(%rbp)
	movl	$1, -60(%rbp)
.LBB1_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_8 Depth 3
                                        #     Child Loop BB1_16 Depth 2
                                        #       Child Loop BB1_19 Depth 3
	movl	-60(%rbp), %ecx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	-48(%rbp), %ecx
	movb	%al, -193(%rbp)                 # 1-byte Spill
	jg	.LBB1_3
# %bb.2:                                # %land.rhs
                                        #   in Loop: Header=BB1_1 Depth=1
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	ucomiss	-44(%rbp), %xmm0
	seta	%al
	movb	%al, -193(%rbp)                 # 1-byte Spill
.LBB1_3:                                # %land.end
                                        #   in Loop: Header=BB1_1 Depth=1
	movb	-193(%rbp), %al                 # 1-byte Reload
	testb	$1, %al
	jne	.LBB1_4
	jmp	.LBB1_27
.LBB1_4:                                # %while.body
                                        #   in Loop: Header=BB1_1 Depth=1
	xorps	%xmm0, %xmm0
	movss	%xmm0, -64(%rbp)
	movl	$0, -52(%rbp)
.LBB1_5:                                # %for.cond
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_8 Depth 3
	movl	-52(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB1_15
# %bb.6:                                # %for.body
                                        #   in Loop: Header=BB1_5 Depth=2
	movl	-8(%rbp), %eax
	movl	%eax, -120(%rbp)
	movl	-120(%rbp), %eax
	subl	$0, %eax
	movl	$1, %ecx
	cltd
	idivl	%ecx
	subl	$1, %eax
	movl	%eax, -124(%rbp)
	movl	$0, -128(%rbp)
	xorl	%eax, %eax
	cmpl	-120(%rbp), %eax
	jge	.LBB1_13
# %bb.7:                                # %simd.if.then
                                        #   in Loop: Header=BB1_5 Depth=2
	movl	$0, -132(%rbp)
.LBB1_8:                                # %omp.inner.for.cond
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-132(%rbp), %eax
	movl	-124(%rbp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB1_12
# %bb.9:                                # %omp.inner.for.body
                                        #   in Loop: Header=BB1_8 Depth=3
	movq	-192(%rbp), %rdx                # 8-byte Reload
	movq	-184(%rbp), %rsi                # 8-byte Reload
	movl	-132(%rbp), %eax
	shll	$0, %eax
	addl	$0, %eax
	movl	%eax, -136(%rbp)
	movq	-104(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rsi, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-136(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-96(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rdx, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-136(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.10:                               # %omp.body.continue
                                        #   in Loop: Header=BB1_8 Depth=3
	jmp	.LBB1_11
.LBB1_11:                               # %omp.inner.for.inc
                                        #   in Loop: Header=BB1_8 Depth=3
	movl	-132(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -132(%rbp)
	jmp	.LBB1_8
.LBB1_12:                               # %omp.inner.for.end
                                        #   in Loop: Header=BB1_5 Depth=2
	movl	-120(%rbp), %eax
	subl	$0, %eax
	movl	$1, %ecx
	cltd
	idivl	%ecx
	shll	$0, %eax
	addl	$0, %eax
	movl	%eax, -56(%rbp)
.LBB1_13:                               # %simd.if.end
                                        #   in Loop: Header=BB1_5 Depth=2
	jmp	.LBB1_14
.LBB1_14:                               # %for.inc
                                        #   in Loop: Header=BB1_5 Depth=2
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.LBB1_5
.LBB1_15:                               # %for.end
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$1, -52(%rbp)
.LBB1_16:                               # %for.cond51
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_19 Depth 3
	movl	-52(%rbp), %eax
	movl	-4(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB1_26
# %bb.17:                               # %for.body55
                                        #   in Loop: Header=BB1_16 Depth=2
	movl	-8(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -144(%rbp)
	movl	-144(%rbp), %eax
	subl	$1, %eax
	movl	$1, %ecx
	cltd
	idivl	%ecx
	subl	$1, %eax
	movl	%eax, -148(%rbp)
	movl	$1, -152(%rbp)
	movl	$1, %eax
	cmpl	-144(%rbp), %eax
	jge	.LBB1_24
# %bb.18:                               # %simd.if.then66
                                        #   in Loop: Header=BB1_16 Depth=2
	movl	$0, -156(%rbp)
	xorps	%xmm0, %xmm0
	movss	%xmm0, -164(%rbp)
.LBB1_19:                               # %omp.inner.for.cond70
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-156(%rbp), %eax
	movl	-148(%rbp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB1_23
# %bb.20:                               # %omp.inner.for.body74
                                        #   in Loop: Header=BB1_19 Depth=3
	movq	-184(%rbp), %rdx                # 8-byte Reload
	movq	-192(%rbp), %rsi                # 8-byte Reload
	movq	-176(%rbp), %rdi                # 8-byte Reload
	movl	-156(%rbp), %eax
	shll	$0, %eax
	addl	$1, %eax
	movl	%eax, -160(%rbp)
	movss	-68(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movq	-96(%rbp), %rax
	movl	-52(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	imulq	%rsi, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-160(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	movq	-96(%rbp), %rax
	movl	-52(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	imulq	%rsi, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-160(%rbp), %rcx
	addss	(%rax,%rcx,4), %xmm1
	mulss	%xmm1, %xmm0
	movss	-72(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movq	-96(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rsi, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movl	-160(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movss	(%rax,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movq	-96(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rsi, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movl	-160(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	addss	(%rax,%rcx,4), %xmm2
	mulss	%xmm2, %xmm1
	addss	%xmm1, %xmm0
	movss	-76(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movq	-96(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rsi, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-160(%rbp), %rcx
	mulss	(%rax,%rcx,4), %xmm1
	addss	%xmm1, %xmm0
	movq	-112(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rdi, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-160(%rbp), %rcx
	subss	(%rax,%rcx,4), %xmm0
	divss	-76(%rbp), %xmm0
	movss	%xmm0, -80(%rbp)
	movq	-96(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rsi, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-160(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	-24(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	-80(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movq	-104(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rdx, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-160(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
	movss	-164(%rbp), %xmm0               # xmm0 = mem[0],zero,zero,zero
	movss	-80(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	-80(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -164(%rbp)
# %bb.21:                               # %omp.body.continue126
                                        #   in Loop: Header=BB1_19 Depth=3
	jmp	.LBB1_22
.LBB1_22:                               # %omp.inner.for.inc127
                                        #   in Loop: Header=BB1_19 Depth=3
	movl	-156(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -156(%rbp)
	jmp	.LBB1_19
.LBB1_23:                               # %omp.inner.for.end129
                                        #   in Loop: Header=BB1_16 Depth=2
	movl	-144(%rbp), %eax
	subl	$1, %eax
	movl	$1, %ecx
	cltd
	idivl	%ecx
	shll	$0, %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	addss	-164(%rbp), %xmm0
	movss	%xmm0, -64(%rbp)
.LBB1_24:                               # %simd.if.end135
                                        #   in Loop: Header=BB1_16 Depth=2
	jmp	.LBB1_25
.LBB1_25:                               # %for.inc136
                                        #   in Loop: Header=BB1_16 Depth=2
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.LBB1_16
.LBB1_26:                               # %for.end138
                                        #   in Loop: Header=BB1_1 Depth=1
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	callq	sqrt
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -64(%rbp)
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB1_1
.LBB1_27:                               # %while.end
	movl	-60(%rbp), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.1, %rdi
	movb	$1, %al
	callq	printf
	movq	-88(%rbp), %rdi
	callq	free
	addq	$208, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	jacobi_omp, .Lfunc_end1-jacobi_omp
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
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
	movl	$0, -36(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB2_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$0, -40(%rbp)
.LBB2_3:                                # %for.cond1
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jge	.LBB2_6
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB2_3 Depth=2
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
	movabsq	$.L.str.3, %rdi
	movb	$1, %al
	callq	printf
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB2_3
.LBB2_6:                                # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
# %bb.7:                                # %for.inc6
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB2_1
.LBB2_8:                                # %for.end8
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function initialize
.LCPI3_0:
	.quad	0x4000000000000000              # double 2
.LCPI3_1:
	.quad	0x3ff0000000000000              # double 1
.LCPI3_2:
	.quad	0xbff0000000000000              # double -1
	.text
	.globl	initialize
	.p2align	4, 0x90
	.type	initialize,@function
initialize:                             # @initialize
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movss	%xmm0, -12(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movl	-8(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	movq	-40(%rbp), %rax
	movq	%rax, -72(%rbp)
	movl	-8(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -88(%rbp)                 # 8-byte Spill
	movq	-48(%rbp), %rax
	movq	%rax, -80(%rbp)
	movl	-4(%rbp), %eax
	subl	$1, %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LCPI3_0(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movq	-24(%rbp), %rax
	movss	%xmm0, (%rax)
	movl	-8(%rbp), %eax
	subl	$1, %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LCPI3_0(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movq	-32(%rbp), %rax
	movss	%xmm0, (%rax)
	movl	$0, -52(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	movl	-52(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB3_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$0, -56(%rbp)
.LBB3_3:                                # %for.cond7
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB3_6
# %bb.4:                                # %for.body10
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	-88(%rbp), %rdx                 # 8-byte Reload
	movq	-96(%rbp), %rsi                 # 8-byte Reload
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	movl	-52(%rbp), %eax
	subl	$1, %eax
	cvtsi2ss	%eax, %xmm1
	mulss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI3_2(%rip), %xmm0           # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, -60(%rbp)
	movq	-32(%rbp), %rax
	movss	(%rax), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	movl	-56(%rbp), %eax
	subl	$1, %eax
	cvtsi2ss	%eax, %xmm1
	mulss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI3_2(%rip), %xmm0           # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, -64(%rbp)
	movq	-72(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rsi, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-56(%rbp), %rcx
	xorps	%xmm0, %xmm0
	movss	%xmm0, (%rax,%rcx,4)
	movss	-12(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI3_2(%rip), %xmm0           # xmm0 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	imull	-60(%rbp), %eax
	cvtsi2sd	%eax, %xmm2
	movsd	.LCPI3_1(%rip), %xmm1           # xmm1 = mem[0],zero
	subsd	%xmm2, %xmm1
	mulsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	imull	-64(%rbp), %eax
	cvtsi2sd	%eax, %xmm2
	movsd	.LCPI3_1(%rip), %xmm1           # xmm1 = mem[0],zero
	subsd	%xmm2, %xmm1
	mulsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	imull	-60(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LCPI3_1(%rip), %xmm2           # xmm2 = mem[0],zero
	subsd	%xmm1, %xmm2
	movsd	.LCPI3_0(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	imull	-64(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LCPI3_1(%rip), %xmm2           # xmm2 = mem[0],zero
	subsd	%xmm1, %xmm2
	movsd	.LCPI3_0(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movq	-80(%rbp), %rax
	movslq	-52(%rbp), %rcx
	imulq	%rdx, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-56(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB3_3
.LBB3_6:                                # %for.end
                                        #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_7
.LBB3_7:                                # %for.inc48
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.LBB3_1
.LBB3_8:                                # %for.end50
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	initialize, .Lfunc_end3-initialize
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function error_check
.LCPI4_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI4_1:
	.quad	0xbff0000000000000              # double -1
	.text
	.globl	error_check
	.p2align	4, 0x90
	.type	error_check,@function
error_check:                            # @error_check
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movss	%xmm0, -12(%rbp)
	movss	%xmm1, -16(%rbp)
	movss	%xmm2, -20(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	xorps	%xmm0, %xmm0
	movss	%xmm0, -64(%rbp)
	movl	-8(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -88(%rbp)                 # 8-byte Spill
	movq	-32(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -80(%rbp)
	movl	$0, -44(%rbp)
.LBB4_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_3 Depth 2
	movl	-44(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB4_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	$0, -48(%rbp)
.LBB4_3:                                # %for.cond1
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-48(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB4_6
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB4_3 Depth=2
	movq	-88(%rbp), %rdx                 # 8-byte Reload
	movss	-16(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movl	-44(%rbp), %eax
	subl	$1, %eax
	cvtsi2ss	%eax, %xmm1
	mulss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI4_1(%rip), %xmm0           # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -52(%rbp)
	movss	-20(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movl	-48(%rbp), %eax
	subl	$1, %eax
	cvtsi2ss	%eax, %xmm1
	mulss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LCPI4_1(%rip), %xmm0           # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -56(%rbp)
	movq	-72(%rbp), %rax
	movslq	-44(%rbp), %rcx
	imulq	%rdx, %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movslq	-48(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movss	-52(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	-52(%rbp), %xmm1
	cvtss2sd	%xmm1, %xmm2
	movsd	.LCPI4_0(%rip), %xmm1           # xmm1 = mem[0],zero
	subsd	%xmm2, %xmm1
	movss	-56(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	mulss	-56(%rbp), %xmm2
	cvtss2sd	%xmm2, %xmm3
	movsd	.LCPI4_0(%rip), %xmm2           # xmm2 = mem[0],zero
	subsd	%xmm3, %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -60(%rbp)
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-60(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	-60(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -64(%rbp)
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB4_3 Depth=2
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	jmp	.LBB4_3
.LBB4_6:                                # %for.end
                                        #   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_7
.LBB4_7:                                # %for.inc26
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB4_1
.LBB4_8:                                # %for.end28
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	callq	sqrt
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -64(%rbp)
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.5, %rdi
	movb	$1, %al
	callq	printf
	addq	$96, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	error_check, .Lfunc_end4-error_check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI5_0:
	.long	0x3f800000                      # float 1
.LCPI5_1:
	.long	0x2edbe6ff                      # float 1.00000001E-10
.LCPI5_2:
	.long	0x3d5e69ad                      # float 0.054299999
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
	subq	$128, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$256, -20(%rbp)                 # imm = 0x100
	movl	$256, -24(%rbp)                 # imm = 0x100
	movss	.LCPI5_2(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -28(%rbp)
	movss	.LCPI5_1(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -32(%rbp)
	movss	.LCPI5_0(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -36(%rbp)
	movl	$5000, -40(%rbp)                # imm = 0x1388
	cmpl	$2, -8(%rbp)
	jne	.LBB5_2
# %bb.1:                                # %if.then
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-20(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB5_18
.LBB5_2:                                # %if.else
	cmpl	$3, -8(%rbp)
	jne	.LBB5_4
# %bb.3:                                # %if.then2
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-20(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-24(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	jmp	.LBB5_17
.LBB5_4:                                # %if.else7
	cmpl	$4, -8(%rbp)
	jne	.LBB5_6
# %bb.5:                                # %if.then9
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-20(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-24(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdi
	movabsq	$.L.str.7, %rsi
	leaq	-28(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	jmp	.LBB5_16
.LBB5_6:                                # %if.else16
	cmpl	$5, -8(%rbp)
	jne	.LBB5_8
# %bb.7:                                # %if.then18
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-20(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-24(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdi
	movabsq	$.L.str.7, %rsi
	leaq	-28(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdi
	movabsq	$.L.str.7, %rsi
	leaq	-32(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	jmp	.LBB5_15
.LBB5_8:                                # %if.else27
	cmpl	$6, -8(%rbp)
	jne	.LBB5_10
# %bb.9:                                # %if.then29
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-20(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-24(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdi
	movabsq	$.L.str.7, %rsi
	leaq	-28(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdi
	movabsq	$.L.str.7, %rsi
	leaq	-32(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	40(%rax), %rdi
	movabsq	$.L.str.7, %rsi
	leaq	-36(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	jmp	.LBB5_14
.LBB5_10:                               # %if.else40
	cmpl	$7, -8(%rbp)
	jne	.LBB5_12
# %bb.11:                               # %if.then42
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-20(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-24(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdi
	movabsq	$.L.str.7, %rsi
	leaq	-28(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdi
	movabsq	$.L.str.7, %rsi
	leaq	-32(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	40(%rax), %rdi
	movabsq	$.L.str.7, %rsi
	leaq	-36(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	movq	-16(%rbp), %rax
	movq	48(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	leaq	-40(%rbp), %rdx
	movb	$0, %al
	callq	__isoc99_sscanf
	jmp	.LBB5_13
.LBB5_12:                               # %if.else55
	jmp	.LBB5_13
.LBB5_13:                               # %if.end
	jmp	.LBB5_14
.LBB5_14:                               # %if.end56
	jmp	.LBB5_15
.LBB5_15:                               # %if.end57
	jmp	.LBB5_16
.LBB5_16:                               # %if.end58
	jmp	.LBB5_17
.LBB5_17:                               # %if.end59
	jmp	.LBB5_18
.LBB5_18:                               # %if.end60
	movl	-20(%rbp), %esi
	movl	-24(%rbp), %edx
	movss	-28(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movss	-32(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	cvtss2sd	%xmm1, %xmm1
	movss	-36(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	cvtss2sd	%xmm2, %xmm2
	movl	-40(%rbp), %ecx
	movabsq	$.L.str.8, %rdi
	movb	$3, %al
	callq	printf
	movabsq	$.L.str.9, %rdi
	movb	$0, %al
	callq	printf
	movslq	-20(%rbp), %rdi
	shlq	$2, %rdi
	movslq	-24(%rbp), %rax
	imulq	%rax, %rdi
	callq	malloc
	movq	%rax, -48(%rbp)
	movslq	-20(%rbp), %rdi
	shlq	$2, %rdi
	movslq	-24(%rbp), %rax
	imulq	%rax, %rdi
	callq	malloc
	movq	%rax, -56(%rbp)
	movslq	-20(%rbp), %rdi
	shlq	$2, %rdi
	movslq	-24(%rbp), %rax
	imulq	%rax, %rdi
	callq	malloc
	movq	%rax, -64(%rbp)
	movl	-20(%rbp), %edi
	movl	-24(%rbp), %esi
	movss	-28(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movq	-48(%rbp), %r8
	movq	-64(%rbp), %r9
	leaq	-68(%rbp), %rdx
	leaq	-72(%rbp), %rcx
	callq	initialize
	movq	-56(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movslq	-20(%rbp), %rdx
	shlq	$2, %rdx
	movslq	-24(%rbp), %rax
	imulq	%rax, %rdx
	callq	memcpy@PLT
	movl	-20(%rbp), %edi
	movl	-24(%rbp), %esi
	movss	-68(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-72(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-28(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	-36(%rbp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	movq	-48(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movss	-32(%rbp), %xmm4                # xmm4 = mem[0],zero,zero,zero
	movl	-40(%rbp), %r8d
	callq	jacobi_seq
	movl	-20(%rbp), %edi
	movl	-24(%rbp), %esi
	movss	-68(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-72(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-28(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	-36(%rbp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movss	-32(%rbp), %xmm4                # xmm4 = mem[0],zero,zero,zero
	movl	-40(%rbp), %r8d
	callq	jacobi_omp
	movl	-20(%rbp), %edi
	movl	-24(%rbp), %esi
	movss	-28(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movq	-48(%rbp), %r8
	movq	-64(%rbp), %r9
	leaq	-68(%rbp), %rdx
	leaq	-72(%rbp), %rcx
	callq	initialize
	movq	-56(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movslq	-20(%rbp), %rdx
	shlq	$2, %rdx
	movslq	-24(%rbp), %rax
	imulq	%rax, %rdx
	callq	memcpy@PLT
	movl	$20, -76(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -88(%rbp)
	movl	$0, -92(%rbp)
.LBB5_19:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$20, -92(%rbp)
	jge	.LBB5_22
# %bb.20:                               # %for.body
                                        #   in Loop: Header=BB5_19 Depth=1
	callq	read_timer_ms
	movsd	%xmm0, -104(%rbp)
	movl	-20(%rbp), %edi
	movl	-24(%rbp), %esi
	movss	-68(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-72(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-28(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	-36(%rbp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	movq	-48(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movss	-32(%rbp), %xmm4                # xmm4 = mem[0],zero,zero,zero
	movl	-40(%rbp), %r8d
	callq	jacobi_seq
	callq	read_timer_ms
	subsd	-104(%rbp), %xmm0
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -88(%rbp)
# %bb.21:                               # %for.inc
                                        #   in Loop: Header=BB5_19 Depth=1
	movl	-92(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -92(%rbp)
	jmp	.LBB5_19
.LBB5_22:                               # %for.end
	movsd	-88(%rbp), %xmm0                # xmm0 = mem[0],zero
	cvtsi2sdl	-76(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movabsq	$.L.str.10, %rdi
	movb	$1, %al
	callq	printf
	movabsq	$.L.str.11, %rdi
	callq	puts
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -112(%rbp)
	movl	$0, -116(%rbp)
.LBB5_23:                               # %for.cond95
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$20, -116(%rbp)
	jge	.LBB5_26
# %bb.24:                               # %for.body98
                                        #   in Loop: Header=BB5_23 Depth=1
	callq	read_timer_ms
	movsd	%xmm0, -128(%rbp)
	movl	-20(%rbp), %edi
	movl	-24(%rbp), %esi
	movss	-68(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-72(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-28(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	-36(%rbp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movss	-32(%rbp), %xmm4                # xmm4 = mem[0],zero,zero,zero
	movl	-40(%rbp), %r8d
	callq	jacobi_omp
	callq	read_timer_ms
	subsd	-128(%rbp), %xmm0
	addsd	-112(%rbp), %xmm0
	movsd	%xmm0, -112(%rbp)
# %bb.25:                               # %for.inc103
                                        #   in Loop: Header=BB5_23 Depth=1
	movl	-116(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -116(%rbp)
	jmp	.LBB5_23
.LBB5_26:                               # %for.end105
	movsd	-112(%rbp), %xmm0               # xmm0 = mem[0],zero
	cvtsi2sdl	-76(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movabsq	$.L.str.12, %rdi
	movb	$1, %al
	callq	printf
	movl	-20(%rbp), %edi
	movl	-24(%rbp), %esi
	movss	-28(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-68(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-72(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movq	-48(%rbp), %rdx
	movq	-64(%rbp), %rcx
	callq	error_check
	movq	-48(%rbp), %rdi
	callq	free
	movq	-64(%rbp), %rdi
	callq	free
	movq	-56(%rbp), %rdi
	callq	free
	xorl	%eax, %eax
	addq	$128, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function read_timer_ms
.LCPI6_0:
	.quad	0x408f400000000000              # double 1000
	.text
	.p2align	4, 0x90
	.type	read_timer_ms,@function
read_timer_ms:                          # @read_timer_ms
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
	movsd	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movzwl	-8(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	addsd	%xmm1, %xmm0
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	read_timer_ms, .Lfunc_end6-read_timer_ms
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Total Number of Iterations: %d\n"
	.size	.L.str, 32

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Residual: %.15g\n"
	.size	.L.str.1, 17

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"%s:\n"
	.size	.L.str.2, 5

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%s[%d][%d]:%f  "
	.size	.L.str.3, 16

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"\n"
	.size	.L.str.4, 2

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Solution Error: %2.6g\n"
	.size	.L.str.5, 23

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"%d"
	.size	.L.str.6, 3

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"%g"
	.size	.L.str.7, 3

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"jacobi %d %d %g %g %g %d\n"
	.size	.L.str.8, 26

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"------------------------------------------------------------------------------------------------------\n"
	.size	.L.str.9, 104

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"seq elasped time(ms): %4f\n"
	.size	.L.str.10, 27

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"================"
	.size	.L.str.11, 17

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"OpenMP elasped time(ms): %4f\n"
	.size	.L.str.12, 30

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym jacobi_seq
	.addrsig_sym sqrt
	.addrsig_sym printf
	.addrsig_sym jacobi_omp
	.addrsig_sym malloc
	.addrsig_sym free
	.addrsig_sym initialize
	.addrsig_sym error_check
	.addrsig_sym __isoc99_sscanf
	.addrsig_sym puts
	.addrsig_sym read_timer_ms
	.addrsig_sym ftime
