	.text
	.file	"jacobi_float.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function jacobi_seq
.LCPI0_0:
	.long	0x3f800000                      # float 1
	.long	0x3f800000                      # float 1
	.zero	4
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_1:
	.quad	0xc000000000000000              # double -2
.LCPI0_3:
	.quad	0x0000000000000000              # double 0
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI0_2:
	.long	0x41200000                      # float 10
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$168, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, -112(%rbp)                # 8-byte Spill
	movq	%rdx, -72(%rbp)                 # 8-byte Spill
	movl	%esi, %r14d
                                        # kill: def $edi killed $edi def $rdi
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	movl	%edi, %ecx
	movl	%esi, %r13d
	movq	%r13, %rax
	movq	%rcx, -104(%rbp)                # 8-byte Spill
	imulq	%rcx, %rax
	leaq	15(,%rax,4), %rax
	andq	$-16, %rax
	movq	%rsp, %rcx
	subq	%rax, %rcx
	movq	%rcx, -64(%rbp)                 # 8-byte Spill
	movq	%rcx, %rsp
	movss	.LCPI0_2(%rip), %xmm5           # xmm5 = mem[0],zero,zero,zero
	mulss	%xmm4, %xmm5
	movss	%xmm4, -96(%rbp)                # 4-byte Spill
	ucomiss	%xmm4, %xmm5
	movl	$1, %esi
	jbe	.LBB0_28
# %bb.1:                                # %entry
	movl	%r8d, %r15d
	testl	%r8d, %r8d
	jle	.LBB0_28
# %bb.2:                                # %for.cond.preheader.lr.ph
	unpcklps	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	mulps	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movaps	%xmm0, %xmm4
	shufps	$85, %xmm0, %xmm4               # xmm4 = xmm4[1,1],xmm0[1,1]
	xorps	%xmm5, %xmm5
	cvtss2sd	%xmm4, %xmm5
	movaps	.LCPI0_0(%rip), %xmm8           # xmm8 = <1.0E+0,1.0E+0,u,u>
	divps	%xmm0, %xmm8
	movsd	.LCPI0_1(%rip), %xmm0           # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm4
	divsd	%xmm1, %xmm4
	divsd	%xmm5, %xmm0
	addsd	%xmm4, %xmm0
	xorps	%xmm1, %xmm1
	cvtss2sd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm9
	movl	%r14d, %eax
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	imull	%ecx, %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, -136(%rbp)               # 8-byte Spill
	leaq	(,%r13,4), %rax
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	leal	-1(%r14), %r12d
	leal	-1(%rcx), %eax
	movq	%rax, -88(%rbp)                 # 8-byte Spill
	movq	-104(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax def $rax
	andl	$-2, %eax
	movq	%rax, -200(%rbp)                # 8-byte Spill
	movq	-64(%rbp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%r13,4), %rax
	movq	%rax, -160(%rbp)                # 8-byte Spill
	leaq	(,%r13,8), %rax
	movq	%rax, -192(%rbp)                # 8-byte Spill
	movq	-72(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%r13,4), %rdx
	movq	%rdx, -152(%rbp)                # 8-byte Spill
	addq	$4, %rax
	movq	%rax, -184(%rbp)                # 8-byte Spill
	addq	$4, -112(%rbp)                  # 8-byte Folded Spill
	leaq	4(%rcx), %rax
	movq	%rax, -176(%rbp)                # 8-byte Spill
	addq	$-1, %r12
	leaq	8(%rcx), %rax
	movq	%rax, -168(%rbp)                # 8-byte Spill
	movl	$1, %eax
	movss	%xmm3, -48(%rbp)                # 4-byte Spill
	movaps	%xmm8, -128(%rbp)               # 16-byte Spill
	movss	%xmm9, -44(%rbp)                # 4-byte Spill
	movl	%r15d, -92(%rbp)                # 4-byte Spill
	.p2align	4, 0x90
.LBB0_3:                                # %for.cond.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_14 Depth 2
                                        #     Child Loop BB0_11 Depth 2
                                        #       Child Loop BB0_20 Depth 3
	movq	%rax, -144(%rbp)                # 8-byte Spill
	cmpl	$0, -56(%rbp)                   # 4-byte Folded Reload
	jle	.LBB0_9
# %bb.4:                                # %for.cond23.preheader.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	cmpl	$1, -56(%rbp)                   # 4-byte Folded Reload
	jne	.LBB0_13
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	xorl	%ebx, %ebx
.LBB0_6:                                # %for.cond36.preheader.loopexit.unr-lcssa
                                        #   in Loop: Header=BB0_3 Depth=1
	testb	$1, -104(%rbp)                  # 1-byte Folded Reload
	movl	-92(%rbp), %r15d                # 4-byte Reload
	je	.LBB0_9
# %bb.7:                                # %for.cond23.preheader.epil
                                        #   in Loop: Header=BB0_3 Depth=1
	testl	%r14d, %r14d
	jle	.LBB0_9
# %bb.8:                                # %for.body26.lr.ph.epil
                                        #   in Loop: Header=BB0_3 Depth=1
	imulq	%r13, %rbx
	movq	-72(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbx,4), %rsi
	movq	-64(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbx,4), %rdi
	movq	-80(%rbp), %rdx                 # 8-byte Reload
	callq	memcpy@PLT
	movss	-44(%rbp), %xmm9                # 4-byte Reload
                                        # xmm9 = mem[0],zero,zero,zero
	movaps	-128(%rbp), %xmm8               # 16-byte Reload
	movss	-48(%rbp), %xmm3                # 4-byte Reload
                                        # xmm3 = mem[0],zero,zero,zero
	.p2align	4, 0x90
.LBB0_9:                                # %for.cond36.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	xorpd	%xmm0, %xmm0
	cmpl	$3, -56(%rbp)                   # 4-byte Folded Reload
	jl	.LBB0_23
# %bb.10:                               # %for.cond41.preheader.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	xorpd	%xmm0, %xmm0
	movl	$1, %edi
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_12:                               # %for.cond41.preheader.for.inc97_crit_edge
                                        #   in Loop: Header=BB0_11 Depth=2
	addq	$1, %rdi
	movq	%rdi, %r8
	cmpq	-88(%rbp), %r8                  # 8-byte Folded Reload
	je	.LBB0_23
.LBB0_11:                               # %for.cond41.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_20 Depth 3
	cmpl	$2, %r14d
	jle	.LBB0_12
# %bb.19:                               # %for.body45.lr.ph
                                        #   in Loop: Header=BB0_11 Depth=2
	leaq	1(%rdi), %r8
	movq	%rdi, %rax
	imulq	%r13, %rax
	movq	-64(%rbp), %rcx                 # 8-byte Reload
	movss	(%rcx,%rax,4), %xmm7            # xmm7 = mem[0],zero,zero,zero
	movss	4(%rcx,%rax,4), %xmm1           # xmm1 = mem[0],zero,zero,zero
	movq	-184(%rbp), %rcx                # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	-112(%rbp), %rdx                # 8-byte Reload
	leaq	(%rdx,%rax,4), %rdx
	movq	%r13, %rsi
	imulq	%r8, %rsi
	movq	-176(%rbp), %rbx                # 8-byte Reload
	leaq	(%rbx,%rsi,4), %rsi
	addq	$-1, %rdi
	imulq	%r13, %rdi
	leaq	(%rbx,%rdi,4), %rdi
	movq	-168(%rbp), %rbx                # 8-byte Reload
	leaq	(%rbx,%rax,4), %rbx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_20:                               # %for.body45
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movss	(%rdi,%rax,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	unpcklps	%xmm7, %xmm2                    # xmm2 = xmm2[0],xmm7[0],xmm2[1],xmm7[1]
	movaps	%xmm1, %xmm4
	movaps	%xmm1, %xmm7
	movaps	%xmm1, %xmm5
	movss	(%rbx,%rax,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	movss	(%rsi,%rax,4), %xmm6            # xmm6 = mem[0],zero,zero,zero
	unpcklps	%xmm1, %xmm6                    # xmm6 = xmm6[0],xmm1[0],xmm6[1],xmm1[1]
	addps	%xmm2, %xmm6
	mulps	%xmm8, %xmm6
	movaps	%xmm6, %xmm2
	shufps	$85, %xmm6, %xmm2               # xmm2 = xmm2[1,1],xmm6[1,1]
	addss	%xmm6, %xmm2
	mulss	%xmm9, %xmm5
	addss	%xmm2, %xmm5
	subss	(%rdx,%rax,4), %xmm5
	divss	%xmm9, %xmm5
	movaps	%xmm5, %xmm2
	mulss	%xmm3, %xmm2
	subss	%xmm2, %xmm4
	movss	%xmm4, (%rcx,%rax,4)
	mulss	%xmm5, %xmm5
	addss	%xmm5, %xmm0
	addq	$1, %rax
	cmpq	%rax, %r12
	jne	.LBB0_20
# %bb.21:                               #   in Loop: Header=BB0_11 Depth=2
	movq	%r8, %rdi
	cmpq	-88(%rbp), %r8                  # 8-byte Folded Reload
	jne	.LBB0_11
.LBB0_23:                               # %for.end99
                                        #   in Loop: Header=BB0_3 Depth=1
	cvtss2sd	%xmm0, %xmm0
	ucomisd	.LCPI0_3, %xmm0
	movq	-144(%rbp), %rbx                # 8-byte Reload
	jb	.LBB0_25
# %bb.24:                               #   in Loop: Header=BB0_3 Depth=1
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB0_26
	.p2align	4, 0x90
.LBB0_25:                               # %call.sqrt
                                        #   in Loop: Header=BB0_3 Depth=1
	callq	sqrt
	movss	-44(%rbp), %xmm9                # 4-byte Reload
                                        # xmm9 = mem[0],zero,zero,zero
	movaps	-128(%rbp), %xmm8               # 16-byte Reload
	movss	-48(%rbp), %xmm3                # 4-byte Reload
                                        # xmm3 = mem[0],zero,zero,zero
.LBB0_26:                               # %for.end99.split
                                        #   in Loop: Header=BB0_3 Depth=1
	divsd	-136(%rbp), %xmm0               # 8-byte Folded Reload
	xorps	%xmm5, %xmm5
	cvtsd2ss	%xmm0, %xmm5
	leal	1(%rbx), %esi
	ucomiss	-96(%rbp), %xmm5                # 4-byte Folded Reload
	jbe	.LBB0_28
# %bb.27:                               # %for.end99.split
                                        #   in Loop: Header=BB0_3 Depth=1
	cmpl	%r15d, %ebx
	movl	%esi, %eax
	jl	.LBB0_3
	jmp	.LBB0_28
	.p2align	4, 0x90
.LBB0_13:                               # %for.cond23.preheader.preheader203
                                        #   in Loop: Header=BB0_3 Depth=1
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	jmp	.LBB0_14
	.p2align	4, 0x90
.LBB0_18:                               # %for.inc33.1
                                        #   in Loop: Header=BB0_14 Depth=2
	addq	$2, %rbx
	addq	-192(%rbp), %r15                # 8-byte Folded Reload
	cmpq	%rbx, -200(%rbp)                # 8-byte Folded Reload
	je	.LBB0_6
.LBB0_14:                               # %for.cond23.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testl	%r14d, %r14d
	jle	.LBB0_16
# %bb.15:                               # %for.body26.lr.ph
                                        #   in Loop: Header=BB0_14 Depth=2
	movq	-72(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%r15), %rsi
	movq	-64(%rbp), %rax                 # 8-byte Reload
	leaq	(%rax,%r15), %rdi
	movq	-80(%rbp), %rdx                 # 8-byte Reload
	callq	memcpy@PLT
	movss	-44(%rbp), %xmm9                # 4-byte Reload
                                        # xmm9 = mem[0],zero,zero,zero
	movaps	-128(%rbp), %xmm8               # 16-byte Reload
	movss	-48(%rbp), %xmm3                # 4-byte Reload
                                        # xmm3 = mem[0],zero,zero,zero
.LBB0_16:                               # %for.inc33
                                        #   in Loop: Header=BB0_14 Depth=2
	testl	%r14d, %r14d
	jle	.LBB0_18
# %bb.17:                               # %for.body26.lr.ph.1
                                        #   in Loop: Header=BB0_14 Depth=2
	movq	-152(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r15), %rsi
	movq	-160(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r15), %rdi
	movq	-80(%rbp), %rdx                 # 8-byte Reload
	callq	memcpy@PLT
	movss	-44(%rbp), %xmm9                # 4-byte Reload
                                        # xmm9 = mem[0],zero,zero,zero
	movaps	-128(%rbp), %xmm8               # 16-byte Reload
	movss	-48(%rbp), %xmm3                # 4-byte Reload
                                        # xmm3 = mem[0],zero,zero,zero
	jmp	.LBB0_18
.LBB0_28:                               # %while.end
	movss	%xmm5, -88(%rbp)                # 4-byte Spill
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movss	-88(%rbp), %xmm0                # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	printf                          # TAILCALL
.Lfunc_end0:
	.size	jacobi_seq, .Lfunc_end0-jacobi_seq
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function jacobi_omp
.LCPI1_0:
	.long	0x3f800000                      # float 1
	.long	0x3f800000                      # float 1
	.zero	4
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI1_1:
	.quad	0xc000000000000000              # double -2
.LCPI1_3:
	.quad	0x0000000000000000              # double 0
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI1_2:
	.long	0x41200000                      # float 10
	.text
	.globl	jacobi_omp
	.p2align	4, 0x90
	.type	jacobi_omp,@function
jacobi_omp:                             # @jacobi_omp
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, %ebx
	movss	%xmm4, 28(%rsp)                 # 4-byte Spill
	movq	%rcx, %rbp
	movq	%rdx, 40(%rsp)                  # 8-byte Spill
	movss	%xmm3, 12(%rsp)                 # 4-byte Spill
	movss	%xmm2, 16(%rsp)                 # 4-byte Spill
	movaps	%xmm1, 48(%rsp)                 # 16-byte Spill
	movaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	movl	%esi, %r14d
                                        # kill: def $edi killed $edi def $rdi
	movq	%rdi, 32(%rsp)                  # 8-byte Spill
	movslq	%edi, %rax
	movslq	%esi, %rdi
	imulq	%rax, %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %r13
	movss	.LCPI1_2(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	28(%rsp), %xmm1                 # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	mulss	%xmm1, %xmm0
	ucomiss	%xmm1, %xmm0
	movl	$1, %esi
	jbe	.LBB1_27
# %bb.1:                                # %entry
	testl	%ebx, %ebx
	movss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
	jle	.LBB1_27
# %bb.2:                                # %for.cond.preheader.lr.ph
	movl	%r14d, %edx
	movaps	64(%rsp), %xmm2                 # 16-byte Reload
	unpcklps	48(%rsp), %xmm2                 # 16-byte Folded Reload
                                        # xmm2 = xmm2[0],mem[0],xmm2[1],mem[1]
	mulps	%xmm2, %xmm2
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm2, %xmm0
	movaps	%xmm2, %xmm1
	shufps	$85, %xmm2, %xmm1               # xmm1 = xmm1[1,1],xmm2[1,1]
	cvtss2sd	%xmm1, %xmm1
	movaps	.LCPI1_0(%rip), %xmm9           # xmm9 = <1.0E+0,1.0E+0,u,u>
	divps	%xmm2, %xmm9
	movsd	.LCPI1_1(%rip), %xmm2           # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm3
	divsd	%xmm0, %xmm3
	divsd	%xmm1, %xmm2
	addsd	%xmm3, %xmm2
	movss	16(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	subsd	%xmm0, %xmm2
	cvtsd2ss	%xmm2, %xmm10
	movl	%r14d, %eax
	movq	32(%rsp), %rcx                  # 8-byte Reload
	imull	%ecx, %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, 136(%rsp)                # 8-byte Spill
	leaq	(,%rdx,4), %r15
	leal	-2(%r14), %r12d
	leal	-1(%rcx), %eax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movl	%ecx, %eax
	movq	%rax, 128(%rsp)                 # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	andl	$-2, %eax
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	movq	40(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rdx,4), %rcx
	movq	%rcx, 160(%rsp)                 # 8-byte Spill
	leaq	(,%rdx,8), %rcx
	movq	%rcx, 168(%rsp)                 # 8-byte Spill
	leaq	(%r13,%rdx,4), %rcx
	movq	%rcx, 152(%rsp)                 # 8-byte Spill
	leaq	8(%r13,%rdx,4), %rcx
	movq	%rcx, 120(%rsp)                 # 8-byte Spill
	leaq	4(%rax,%rdx,4), %rax
	movq	%rax, 112(%rsp)                 # 8-byte Spill
	leaq	4(%rbp,%rdx,4), %rax
	movq	%rax, 104(%rsp)                 # 8-byte Spill
	movq	%rdx, 88(%rsp)                  # 8-byte Spill
	leaq	4(%r13,%rdx,8), %rax
	movq	%rax, 96(%rsp)                  # 8-byte Spill
	movl	$1, %eax
	movaps	%xmm9, 64(%rsp)                 # 16-byte Spill
	movss	%xmm10, 48(%rsp)                # 4-byte Spill
	movl	%ebx, 24(%rsp)                  # 4-byte Spill
	.p2align	4, 0x90
.LBB1_3:                                # %for.cond.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_19 Depth 2
                                        #     Child Loop BB1_11 Depth 2
                                        #       Child Loop BB1_13 Depth 3
	movq	%rax, 144(%rsp)                 # 8-byte Spill
	cmpl	$0, 32(%rsp)                    # 4-byte Folded Reload
	jle	.LBB1_9
# %bb.4:                                # %for.body.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	cmpl	$1, 32(%rsp)                    # 4-byte Folded Reload
	jne	.LBB1_18
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=1
	xorl	%ebp, %ebp
.LBB1_6:                                # %for.cond51.preheader.loopexit.unr-lcssa
                                        #   in Loop: Header=BB1_3 Depth=1
	testb	$1, 128(%rsp)                   # 1-byte Folded Reload
	je	.LBB1_9
# %bb.7:                                # %for.cond51.preheader.loopexit.unr-lcssa
                                        #   in Loop: Header=BB1_3 Depth=1
	testl	%r14d, %r14d
	jle	.LBB1_9
# %bb.8:                                # %omp.inner.for.body.lr.ph.epil
                                        #   in Loop: Header=BB1_3 Depth=1
	movq	%r15, %rdi
	imulq	%rbp, %rdi
	imulq	88(%rsp), %rbp                  # 8-byte Folded Reload
	movq	40(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rbp,4), %rsi
	addq	%r13, %rdi
	movq	%r15, %rdx
	callq	memcpy@PLT
	movss	48(%rsp), %xmm10                # 4-byte Reload
                                        # xmm10 = mem[0],zero,zero,zero
	movaps	64(%rsp), %xmm9                 # 16-byte Reload
	movss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
.LBB1_9:                                # %for.cond51.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	xorpd	%xmm0, %xmm0
	cmpl	$3, 32(%rsp)                    # 4-byte Folded Reload
	jl	.LBB1_16
# %bb.10:                               # %for.body55.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	xorpd	%xmm0, %xmm0
	movl	$1, %r8d
	movq	%r13, %rcx
	movq	96(%rsp), %rdx                  # 8-byte Reload
	movq	104(%rsp), %rsi                 # 8-byte Reload
	movq	112(%rsp), %rdi                 # 8-byte Reload
	movq	120(%rsp), %rbp                 # 8-byte Reload
	jmp	.LBB1_11
	.p2align	4, 0x90
.LBB1_15:                               # %simd.if.end136
                                        #   in Loop: Header=BB1_11 Depth=2
	addq	$1, %r8
	addq	%r15, %rbp
	addq	%r15, %rdi
	addq	%r15, %rsi
	addq	%r15, %rdx
	addq	%r15, %rcx
	cmpq	16(%rsp), %r8                   # 8-byte Folded Reload
	je	.LBB1_16
.LBB1_11:                               # %for.body55
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_13 Depth 3
	cmpl	$3, %r14d
	jl	.LBB1_15
# %bb.12:                               # %omp.inner.for.body75.lr.ph
                                        #   in Loop: Header=BB1_11 Depth=2
	movq	%r8, %rax
	imulq	88(%rsp), %rax                  # 8-byte Folded Reload
	movss	(%r13,%rax,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	movss	4(%r13,%rax,4), %xmm2           # xmm2 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_13:                               # %omp.inner.for.body75
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movss	4(%rcx,%rbx,4), %xmm3           # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm4, %xmm3                    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	movaps	%xmm2, %xmm5
	movaps	%xmm2, %xmm4
	movaps	%xmm2, %xmm6
	movss	(%rbp,%rbx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movss	(%rdx,%rbx,4), %xmm7            # xmm7 = mem[0],zero,zero,zero
	unpcklps	%xmm2, %xmm7                    # xmm7 = xmm7[0],xmm2[0],xmm7[1],xmm2[1]
	addps	%xmm3, %xmm7
	mulps	%xmm9, %xmm7
	movaps	%xmm7, %xmm3
	shufps	$85, %xmm7, %xmm3               # xmm3 = xmm3[1,1],xmm7[1,1]
	addss	%xmm7, %xmm3
	mulss	%xmm10, %xmm6
	addss	%xmm3, %xmm6
	subss	(%rsi,%rbx,4), %xmm6
	divss	%xmm10, %xmm6
	movaps	%xmm6, %xmm3
	mulss	%xmm8, %xmm3
	subss	%xmm3, %xmm5
	movss	%xmm5, (%rdi,%rbx,4)
	leaq	1(%rbx), %rax
	mulss	%xmm6, %xmm6
	addss	%xmm6, %xmm1
	movq	%rax, %rbx
	cmpq	%rax, %r12
	jne	.LBB1_13
# %bb.14:                               # %omp.inner.for.end130
                                        #   in Loop: Header=BB1_11 Depth=2
	addss	%xmm1, %xmm0
	jmp	.LBB1_15
	.p2align	4, 0x90
.LBB1_16:                               # %for.end139
                                        #   in Loop: Header=BB1_3 Depth=1
	cvtss2sd	%xmm0, %xmm0
	ucomisd	.LCPI1_3, %xmm0
	movq	144(%rsp), %rbp                 # 8-byte Reload
	jb	.LBB1_24
# %bb.17:                               #   in Loop: Header=BB1_3 Depth=1
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB1_25
	.p2align	4, 0x90
.LBB1_24:                               # %call.sqrt
                                        #   in Loop: Header=BB1_3 Depth=1
	callq	sqrt
	movss	48(%rsp), %xmm10                # 4-byte Reload
                                        # xmm10 = mem[0],zero,zero,zero
	movaps	64(%rsp), %xmm9                 # 16-byte Reload
	movss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
.LBB1_25:                               # %for.end139.split
                                        #   in Loop: Header=BB1_3 Depth=1
	movl	24(%rsp), %ebx                  # 4-byte Reload
	divsd	136(%rsp), %xmm0                # 8-byte Folded Reload
	cvtsd2ss	%xmm0, %xmm0
	leal	1(%rbp), %esi
	ucomiss	28(%rsp), %xmm0                 # 4-byte Folded Reload
	jbe	.LBB1_27
# %bb.26:                               # %for.end139.split
                                        #   in Loop: Header=BB1_3 Depth=1
	cmpl	%ebx, %ebp
	movl	%esi, %eax
	jl	.LBB1_3
	jmp	.LBB1_27
	.p2align	4, 0x90
.LBB1_18:                               # %for.body.preheader270
                                        #   in Loop: Header=BB1_3 Depth=1
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB1_19
	.p2align	4, 0x90
.LBB1_23:                               # %simd.if.end.1
                                        #   in Loop: Header=BB1_19 Depth=2
	addq	$2, %rbp
	addq	168(%rsp), %rbx                 # 8-byte Folded Reload
	cmpq	%rbp, 176(%rsp)                 # 8-byte Folded Reload
	je	.LBB1_6
.LBB1_19:                               # %for.body
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testl	%r14d, %r14d
	jle	.LBB1_21
# %bb.20:                               # %omp.inner.for.body.lr.ph
                                        #   in Loop: Header=BB1_19 Depth=2
	movq	40(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rbx), %rsi
	leaq	(%rbx,%r13), %rdi
	movq	%r15, %rdx
	callq	memcpy@PLT
	movss	48(%rsp), %xmm10                # 4-byte Reload
                                        # xmm10 = mem[0],zero,zero,zero
	movaps	64(%rsp), %xmm9                 # 16-byte Reload
	movss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
.LBB1_21:                               # %simd.if.end
                                        #   in Loop: Header=BB1_19 Depth=2
	testl	%r14d, %r14d
	jle	.LBB1_23
# %bb.22:                               # %omp.inner.for.body.lr.ph.1
                                        #   in Loop: Header=BB1_19 Depth=2
	movq	160(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbx), %rsi
	movq	152(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rbx), %rdi
	movq	%r15, %rdx
	callq	memcpy@PLT
	movss	48(%rsp), %xmm10                # 4-byte Reload
                                        # xmm10 = mem[0],zero,zero,zero
	movaps	64(%rsp), %xmm9                 # 16-byte Reload
	movss	12(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
	jmp	.LBB1_23
.LBB1_27:                               # %while.end
	movss	%xmm0, 16(%rsp)                 # 4-byte Spill
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movss	16(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	%r13, %rdi
	addq	$184, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	free                            # TAILCALL
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
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, 12(%rsp)                  # 4-byte Spill
	movl	%ecx, %ebx
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %rsi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	testl	%ebx, %ebx
	jle	.LBB2_6
# %bb.1:                                # %for.cond1.preheader.lr.ph
	movslq	12(%rsp), %r13                  # 4-byte Folded Reload
	movl	%ebx, %eax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movl	%r13d, %r14d
	shlq	$2, %r13
	xorl	%ebp, %ebp
	jmp	.LBB2_2
	.p2align	4, 0x90
.LBB2_5:                                # %for.end
                                        #   in Loop: Header=BB2_2 Depth=1
	movl	$10, %edi
	callq	putchar@PLT
	addq	$1, %rbp
	addq	%r13, %r12
	cmpq	16(%rsp), %rbp                  # 8-byte Folded Reload
	je	.LBB2_6
.LBB2_2:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
	cmpl	$0, 12(%rsp)                    # 4-byte Folded Reload
	jle	.LBB2_5
# %bb.3:                                # %for.body3.lr.ph
                                        #   in Loop: Header=BB2_2 Depth=1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_4:                                # %for.body3
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%r12,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.3, %edi
	movq	%r15, %rsi
	movl	%ebp, %edx
	movl	%ebx, %ecx
	movb	$1, %al
	callq	printf
	addq	$1, %rbx
	cmpq	%rbx, %r14
	jne	.LBB2_4
	jmp	.LBB2_5
.LBB2_6:                                # %for.end8
	movl	$10, %edi
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT                     # TAILCALL
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function initialize
.LCPI3_0:
	.quad	0x4000000000000000              # double 2
.LCPI3_6:
	.quad	0xbff0000000000000              # double -1
.LCPI3_7:
	.quad	0x3ff0000000000000              # double 1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_1:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
.LCPI3_2:
	.quad	0xbff0000000000000              # double -1
	.quad	0xbff0000000000000              # double -1
.LCPI3_3:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
.LCPI3_4:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
.LCPI3_5:
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
.LCPI3_8:
	.zero	16,255
.LCPI3_9:
	.zero	16
	.text
	.globl	initialize
	.p2align	4, 0x90
	.type	initialize,@function
initialize:                             # @initialize
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, -88(%rsp)                  # 8-byte Spill
	movq	%r8, -96(%rsp)                  # 8-byte Spill
                                        # kill: def $esi killed $esi def $rsi
                                        # kill: def $edi killed $edi def $rdi
	leal	-1(%rdi), %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LCPI3_0(%rip), %xmm2           # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm3
	divsd	%xmm1, %xmm3
	xorps	%xmm1, %xmm1
	cvtsd2ss	%xmm3, %xmm1
	movss	%xmm1, (%rdx)
	leal	-1(%rsi), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	%xmm1, %xmm2
	xorps	%xmm1, %xmm1
	cvtsd2ss	%xmm2, %xmm1
	movss	%xmm1, (%rcx)
	testl	%edi, %edi
	jle	.LBB3_16
# %bb.1:                                # %for.cond7.preheader.lr.ph
	movl	%esi, %r12d
	cvtss2sd	%xmm0, %xmm14
	xorps	.LCPI3_1(%rip), %xmm14
	movl	%edi, %r8d
	leaq	1(%rdx), %rax
	movq	%rax, -24(%rsp)                 # 8-byte Spill
	leaq	1(%rcx), %rax
	movq	%rax, -32(%rsp)                 # 8-byte Spill
	movl	%r12d, %eax
	andl	$-4, %eax
	movq	%rax, -40(%rsp)                 # 8-byte Spill
	pshufd	$68, %xmm14, %xmm0              # xmm0 = xmm14[0,1,0,1]
	movdqa	%xmm0, -16(%rsp)                # 16-byte Spill
	leaq	(,%r12,4), %r9
	xorl	%r13d, %r13d
	movsd	.LCPI3_6(%rip), %xmm11          # xmm11 = mem[0],zero
	movsd	.LCPI3_7(%rip), %xmm12          # xmm12 = mem[0],zero
	movapd	.LCPI3_3(%rip), %xmm15          # xmm15 = [1.0E+0,1.0E+0]
	movapd	.LCPI3_2(%rip), %xmm2           # xmm2 = [-1.0E+0,-1.0E+0]
	movdqa	.LCPI3_5(%rip), %xmm3           # xmm3 = [4,4,4,4]
	movq	-88(%rsp), %r14                 # 8-byte Reload
	movq	-96(%rsp), %rdi                 # 8-byte Reload
	movq	%rsi, -104(%rsp)                # 8-byte Spill
	movq	%r8, -112(%rsp)                 # 8-byte Spill
	movq	%r9, -120(%rsp)                 # 8-byte Spill
	jmp	.LBB3_2
	.p2align	4, 0x90
.LBB3_15:                               # %for.inc48
                                        #   in Loop: Header=BB3_2 Depth=1
	addq	$1, %r13
	addq	%r9, %rdi
	addq	%r9, %r14
	cmpq	%r8, %r13
	je	.LBB3_16
.LBB3_2:                                # %for.cond7.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_12 Depth 2
                                        #     Child Loop BB3_14 Depth 2
	testl	%esi, %esi
	jle	.LBB3_15
# %bb.3:                                # %for.body10.lr.ph
                                        #   in Loop: Header=BB3_2 Depth=1
	leal	-1(%r13), %eax
	xorps	%xmm7, %xmm7
	cvtsi2ss	%eax, %xmm7
	cmpl	$4, %esi
	jae	.LBB3_5
# %bb.4:                                #   in Loop: Header=BB3_2 Depth=1
	xorl	%ebp, %ebp
	jmp	.LBB3_14
	.p2align	4, 0x90
.LBB3_5:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	movq	%r13, %rsi
	imulq	%r12, %rsi
	leaq	(%rsi,%r12), %r8
	movq	-96(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rsi,4), %rbp
	leaq	(%rax,%r8,4), %r10
	movq	-88(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rsi,4), %rsi
	leaq	(%rax,%r8,4), %r15
	cmpq	%r15, %rbp
	setb	-64(%rsp)                       # 1-byte Folded Spill
	cmpq	%r10, %rsi
	setb	-80(%rsp)                       # 1-byte Folded Spill
	movq	-24(%rsp), %rbx                 # 8-byte Reload
	cmpq	%rbp, %rbx
	seta	%r11b
	cmpq	%rdx, %r10
	seta	-121(%rsp)                      # 1-byte Folded Spill
	movq	-32(%rsp), %rax                 # 8-byte Reload
	cmpq	%rbp, %rax
	seta	%r9b
	cmpq	%rcx, %r10
	seta	%bpl
	cmpq	%rsi, %rbx
	seta	%r8b
	cmpq	%rdx, %r15
	seta	-122(%rsp)                      # 1-byte Folded Spill
	cmpq	%rsi, %rax
	seta	%r10b
	cmpq	%rcx, %r15
	seta	%al
	movb	-80(%rsp), %bl                  # 1-byte Reload
	testb	%bl, -64(%rsp)                  # 1-byte Folded Reload
	jne	.LBB3_6
# %bb.7:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	andb	-121(%rsp), %r11b               # 1-byte Folded Reload
	jne	.LBB3_6
# %bb.8:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	andb	%bpl, %r9b
	jne	.LBB3_6
# %bb.9:                                # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	andb	-122(%rsp), %r8b                # 1-byte Folded Reload
	jne	.LBB3_6
# %bb.10:                               # %vector.memcheck
                                        #   in Loop: Header=BB3_2 Depth=1
	movl	$0, %ebp
	andb	%al, %r10b
	movq	-104(%rsp), %rsi                # 8-byte Reload
	movq	-112(%rsp), %r8                 # 8-byte Reload
	movq	-120(%rsp), %r9                 # 8-byte Reload
	jne	.LBB3_14
# %bb.11:                               # %vector.ph
                                        #   in Loop: Header=BB3_2 Depth=1
	movss	(%rdx), %xmm1                   # xmm1 = mem[0],zero,zero,zero
	mulss	%xmm7, %xmm1
	shufps	$0, %xmm1, %xmm1                # xmm1 = xmm1[0,0,0,0]
	cvtps2pd	%xmm1, %xmm1
	addpd	.LCPI3_2(%rip), %xmm1
	cvttpd2dq	%xmm1, %xmm1
	pshufd	$68, %xmm1, %xmm4               # xmm4 = xmm1[0,1,0,1]
	movss	(%rcx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	pshufd	$85, %xmm1, %xmm1               # xmm1 = xmm1[1,1,1,1]
	pmuludq	%xmm1, %xmm1
	pmuludq	%xmm4, %xmm4
	movdqa	%xmm4, %xmm5
	punpckldq	%xmm1, %xmm5            # xmm5 = xmm5[0],xmm1[0],xmm5[1],xmm1[1]
	punpckhdq	%xmm1, %xmm4            # xmm4 = xmm4[2],xmm1[2],xmm4[3],xmm1[3]
	cvtdq2pd	%xmm4, %xmm4
	cvtdq2pd	%xmm5, %xmm1
	shufps	$0, %xmm0, %xmm0                # xmm0 = xmm0[0,0,0,0]
	movaps	%xmm0, -64(%rsp)                # 16-byte Spill
	movapd	%xmm15, %xmm8
	subpd	%xmm1, %xmm8
	movapd	%xmm15, %xmm1
	subpd	%xmm4, %xmm1
	movapd	%xmm1, %xmm4
	movapd	-16(%rsp), %xmm0                # 16-byte Reload
	mulpd	%xmm0, %xmm4
	movapd	%xmm4, -80(%rsp)                # 16-byte Spill
	movapd	%xmm8, %xmm13
	mulpd	%xmm0, %xmm13
	addpd	%xmm1, %xmm1
	addpd	%xmm8, %xmm8
	xorl	%ebp, %ebp
	movdqa	.LCPI3_4(%rip), %xmm10          # xmm10 = [0,1,2,3]
	movq	-40(%rsp), %rax                 # 8-byte Reload
	.p2align	4, 0x90
.LBB3_12:                               # %vector.body
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm10, %xmm9
	paddd	.LCPI3_8, %xmm9
	cvtdq2ps	%xmm9, %xmm6
	mulps	-64(%rsp), %xmm6                # 16-byte Folded Reload
	cvtps2pd	%xmm6, %xmm4
	movhlps	%xmm6, %xmm6                    # xmm6 = xmm6[1,1]
	cvtps2pd	%xmm6, %xmm6
	addpd	%xmm2, %xmm4
	addpd	%xmm2, %xmm6
	cvttpd2dq	%xmm4, %xmm5
	cvttpd2dq	%xmm6, %xmm6
	unpcklpd	%xmm6, %xmm5                    # xmm5 = xmm5[0],xmm6[0]
	pshufd	$245, %xmm5, %xmm6              # xmm6 = xmm5[1,1,3,3]
	pmuludq	%xmm5, %xmm5
	pmuludq	%xmm6, %xmm6
	movdqa	%xmm5, %xmm4
	punpckldq	%xmm6, %xmm4            # xmm4 = xmm4[0],xmm6[0],xmm4[1],xmm6[1]
	cvtdq2pd	%xmm4, %xmm4
	punpckhdq	%xmm6, %xmm5            # xmm5 = xmm5[2],xmm6[2],xmm5[3],xmm6[3]
	cvtdq2pd	%xmm5, %xmm5
	movapd	%xmm15, %xmm6
	subpd	%xmm5, %xmm6
	movapd	%xmm15, %xmm5
	subpd	%xmm4, %xmm5
	movapd	%xmm13, %xmm4
	mulpd	%xmm5, %xmm4
	movapd	-80(%rsp), %xmm0                # 16-byte Reload
	subpd	%xmm8, %xmm4
	mulpd	%xmm6, %xmm0
	subpd	%xmm1, %xmm0
	addpd	%xmm6, %xmm6
	subpd	%xmm6, %xmm0
	addpd	%xmm5, %xmm5
	subpd	%xmm5, %xmm4
	cvtpd2ps	%xmm0, %xmm0
	cvtpd2ps	%xmm4, %xmm4
	unpcklpd	%xmm0, %xmm4                    # xmm4 = xmm4[0],xmm0[0]
	xorpd	%xmm0, %xmm0
	movupd	%xmm0, (%rdi,%rbp,4)
	movupd	%xmm4, (%r14,%rbp,4)
	addq	$4, %rbp
	paddd	%xmm3, %xmm10
	cmpq	%rbp, %rax
	jne	.LBB3_12
# %bb.13:                               # %middle.block
                                        #   in Loop: Header=BB3_2 Depth=1
	movq	%rax, %rbp
	cmpq	%r12, %rax
	jne	.LBB3_14
	jmp	.LBB3_15
.LBB3_6:                                #   in Loop: Header=BB3_2 Depth=1
	xorl	%ebp, %ebp
	movq	-104(%rsp), %rsi                # 8-byte Reload
	movq	-112(%rsp), %r8                 # 8-byte Reload
	movq	-120(%rsp), %r9                 # 8-byte Reload
	.p2align	4, 0x90
.LBB3_14:                               # %for.body10
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%rdx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	mulss	%xmm7, %xmm0
	cvtss2sd	%xmm0, %xmm0
	addsd	%xmm11, %xmm0
	leal	-1(%rbp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2ss	%eax, %xmm1
	cvttsd2si	%xmm0, %ebx
	mulss	(%rcx), %xmm1
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	addsd	%xmm11, %xmm0
	cvttsd2si	%xmm0, %eax
	imull	%ebx, %ebx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%ebx, %xmm0
	movapd	%xmm12, %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	mulsd	%xmm14, %xmm0
	imull	%eax, %eax
	xorps	%xmm4, %xmm4
	cvtsi2sd	%eax, %xmm4
	movapd	%xmm12, %xmm5
	subsd	%xmm4, %xmm5
	mulsd	%xmm5, %xmm0
	addsd	%xmm1, %xmm1
	subsd	%xmm1, %xmm0
	addsd	%xmm5, %xmm5
	subsd	%xmm5, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movl	$0, (%rdi,%rbp,4)
	movss	%xmm0, (%r14,%rbp,4)
	addq	$1, %rbp
	cmpq	%rbp, %r12
	jne	.LBB3_14
	jmp	.LBB3_15
.LBB3_16:                               # %for.end50
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	initialize, .Lfunc_end3-initialize
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function error_check
.LCPI4_0:
	.long	0xbf800000                      # float -1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI4_1:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	error_check
	.p2align	4, 0x90
	.type	error_check,@function
error_check:                            # @error_check
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r15d
	movl	%edi, %r14d
	testl	%edi, %edi
	jle	.LBB4_1
# %bb.2:                                # %for.cond1.preheader.lr.ph
	movl	%r15d, %eax
	movl	%r14d, %ecx
	leaq	(,%rax,4), %rsi
	xorps	%xmm0, %xmm0
	xorl	%edi, %edi
	movss	.LCPI4_0(%rip), %xmm8           # xmm8 = mem[0],zero,zero,zero
	movsd	.LCPI4_1(%rip), %xmm3           # xmm3 = mem[0],zero
	jmp	.LBB4_3
	.p2align	4, 0x90
.LBB4_6:                                # %for.inc26
                                        #   in Loop: Header=BB4_3 Depth=1
	addq	$1, %rdi
	addq	%rsi, %rdx
	cmpq	%rcx, %rdi
	je	.LBB4_7
.LBB4_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
	testl	%r15d, %r15d
	jle	.LBB4_6
# %bb.4:                                # %for.body3.lr.ph
                                        #   in Loop: Header=BB4_3 Depth=1
	leal	-1(%rdi), %ebp
	xorps	%xmm5, %xmm5
	cvtsi2ss	%ebp, %xmm5
	mulss	%xmm1, %xmm5
	addss	%xmm8, %xmm5
	mulss	%xmm5, %xmm5
	xorps	%xmm6, %xmm6
	cvtss2sd	%xmm5, %xmm6
	movapd	%xmm3, %xmm5
	subsd	%xmm6, %xmm5
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB4_5:                                # %for.body3
                                        #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rbp), %ebx
	xorps	%xmm6, %xmm6
	cvtsi2ss	%ebx, %xmm6
	mulss	%xmm2, %xmm6
	addss	%xmm8, %xmm6
	movss	(%rdx,%rbp,4), %xmm7            # xmm7 = mem[0],zero,zero,zero
	cvtss2sd	%xmm7, %xmm7
	mulss	%xmm6, %xmm6
	cvtss2sd	%xmm6, %xmm6
	movapd	%xmm3, %xmm4
	subsd	%xmm6, %xmm4
	mulsd	%xmm5, %xmm4
	subsd	%xmm4, %xmm7
	xorps	%xmm4, %xmm4
	cvtsd2ss	%xmm7, %xmm4
	mulss	%xmm4, %xmm4
	addss	%xmm4, %xmm0
	addq	$1, %rbp
	cmpq	%rbp, %rax
	jne	.LBB4_5
	jmp	.LBB4_6
.LBB4_1:
	xorps	%xmm0, %xmm0
.LBB4_7:                                # %for.end28
	cvtss2sd	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jb	.LBB4_9
# %bb.8:
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB4_10
.LBB4_9:                                # %call.sqrt
	callq	sqrt
.LBB4_10:                               # %for.end28.split
	imull	%r14d, %r15d
	xorps	%xmm1, %xmm1
	cvtsi2sd	%r15d, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	printf                          # TAILCALL
.Lfunc_end4:
	.size	error_check, .Lfunc_end4-error_check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI5_0:
	.quad	0x4000000000000000              # double 2
.LCPI5_2:
	.quad	0xbff0000000000000              # double -1
.LCPI5_3:
	.quad	0x3ff0000000000000              # double 1
.LCPI5_8:
	.quad	0x408f400000000000              # double 1000
.LCPI5_9:
	.quad	0x4034000000000000              # double 20
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI5_1:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
.LCPI5_4:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
.LCPI5_5:
	.quad	0xbff0000000000000              # double -1
	.quad	0xbff0000000000000              # double -1
.LCPI5_6:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
.LCPI5_7:
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI5_10:
	.long	0xbf800000                      # float -1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $edi killed $edi def $rdi
	movl	$256, (%rsp)                    # imm = 0x100
	movl	$256, 4(%rsp)                   # imm = 0x100
	movl	$1029597613, 8(%rsp)            # imm = 0x3D5E69AD
	movl	$786163455, 12(%rsp)            # imm = 0x2EDBE6FF
	movl	$1065353216, 16(%rsp)           # imm = 0x3F800000
	movl	$5000, 20(%rsp)                 # imm = 0x1388
	addl	$-2, %edi
	cmpl	$5, %edi
	ja	.LBB5_11
# %bb.1:                                # %entry
	movq	%rsi, %rbx
	jmpq	*.LJTI5_0(,%rdi,8)
.LBB5_2:                                # %if.then
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movl	(%rsp), %eax
	movl	%eax, 4(%rsp)
	jmp	.LBB5_11
.LBB5_3:                                # %if.then2
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	4(%rsp), %rdx
	jmp	.LBB5_9
.LBB5_4:                                # %if.then9
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	4(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	8(%rsp), %rdx
	movl	$.L.str.7, %esi
	jmp	.LBB5_10
.LBB5_6:                                # %if.then18
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	4(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	8(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	32(%rbx), %rdi
	leaq	12(%rsp), %rdx
	movl	$.L.str.7, %esi
	jmp	.LBB5_10
.LBB5_7:                                # %if.then29
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	4(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	8(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	32(%rbx), %rdi
	leaq	12(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	40(%rbx), %rdi
	leaq	16(%rsp), %rdx
	movl	$.L.str.7, %esi
	jmp	.LBB5_10
.LBB5_8:                                # %if.then42
	movq	8(%rbx), %rdi
	movq	%rsp, %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	16(%rbx), %rdi
	leaq	4(%rsp), %rdx
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	24(%rbx), %rdi
	leaq	8(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	32(%rbx), %rdi
	leaq	12(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	40(%rbx), %rdi
	leaq	16(%rsp), %rdx
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	movq	48(%rbx), %rdi
	leaq	20(%rsp), %rdx
.LBB5_9:                                # %if.end60
	movl	$.L.str.6, %esi
.LBB5_10:                               # %if.end60
	xorl	%eax, %eax
	callq	__isoc99_sscanf
.LBB5_11:                               # %if.end60
	movl	(%rsp), %esi
	movl	4(%rsp), %edx
	movss	8(%rsp), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movss	12(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	cvtss2sd	%xmm1, %xmm1
	movss	16(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	cvtss2sd	%xmm2, %xmm2
	movl	20(%rsp), %ecx
	movl	$.L.str.8, %edi
	movb	$3, %al
	callq	printf
	movl	$.Lstr, %edi
	callq	puts
	movslq	(%rsp), %r14
	movl	4(%rsp), %ebx
	movslq	%ebx, %r15
	movq	%r14, %rbp
	imulq	%r15, %rbp
	shlq	$2, %rbp
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	movq	%rbp, 160(%rsp)                 # 8-byte Spill
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, 80(%rsp)                  # 8-byte Spill
	leal	-1(%r14), %eax
	addl	$-1, %r15d
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movl	%r14d, %eax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	movss	8(%rsp), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	movss	%xmm1, 72(%rsp)                 # 4-byte Spill
	movsd	.LCPI5_0(%rip), %xmm2           # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm1
	divsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	cvtsd2ss	%xmm1, %xmm0
	movss	%xmm0, 48(%rsp)                 # 4-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r15d, %xmm0
	movapd	%xmm2, %xmm1
	divsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm3
	testq	%r14, %r14
	movaps	%xmm3, 32(%rsp)                 # 16-byte Spill
	jle	.LBB5_21
# %bb.12:                               # %for.cond7.preheader.lr.ph.i
	movss	72(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	xorps	.LCPI5_1(%rip), %xmm0
	movaps	%xmm0, 112(%rsp)                # 16-byte Spill
	leaq	(,%rbx,4), %r13
	movl	%ebx, %r14d
	andl	$-4, %r14d
	movaps	%xmm3, %xmm9
	shufps	$0, %xmm3, %xmm9                # xmm9 = xmm9[0,0],xmm3[0,0]
	xorl	%r15d, %r15d
	movsd	.LCPI5_2(%rip), %xmm4           # xmm4 = mem[0],zero
	movq	80(%rsp), %r12                  # 8-byte Reload
	movaps	%xmm9, 144(%rsp)                # 16-byte Spill
	jmp	.LBB5_13
	.p2align	4, 0x90
.LBB5_20:                               # %for.inc48.i
                                        #   in Loop: Header=BB5_13 Depth=1
	addq	$1, %r15
	addq	%r13, %r12
	cmpq	24(%rsp), %r15                  # 8-byte Folded Reload
	je	.LBB5_21
.LBB5_13:                               # %for.cond7.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_17 Depth 2
                                        #     Child Loop BB5_19 Depth 2
	testl	%ebx, %ebx
	jle	.LBB5_20
# %bb.14:                               # %for.body10.lr.ph.i
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	%r13, %rdi
	leal	-1(%r15), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	imulq	%r15, %rdi
	addq	88(%rsp), %rdi                  # 8-byte Folded Reload
	mulss	48(%rsp), %xmm0                 # 4-byte Folded Reload
	cvtss2sd	%xmm0, %xmm0
	addsd	%xmm4, %xmm0
	cvttsd2si	%xmm0, %ebp
	imull	%ebp, %ebp
	xorl	%esi, %esi
	movq	%r13, %rdx
	callq	memset@PLT
	movsd	.LCPI5_3(%rip), %xmm10          # xmm10 = mem[0],zero
	xorps	%xmm1, %xmm1
	cvtsi2sd	%ebp, %xmm1
	movapd	%xmm10, %xmm12
	subsd	%xmm1, %xmm12
	movapd	%xmm12, %xmm8
	mulsd	112(%rsp), %xmm8                # 16-byte Folded Reload
	addsd	%xmm12, %xmm12
	cmpl	$4, %ebx
	jae	.LBB5_16
# %bb.15:                               #   in Loop: Header=BB5_13 Depth=1
	xorl	%eax, %eax
	movaps	32(%rsp), %xmm3                 # 16-byte Reload
	movsd	.LCPI5_2(%rip), %xmm4           # xmm4 = mem[0],zero
	jmp	.LBB5_19
	.p2align	4, 0x90
.LBB5_16:                               # %vector.ph
                                        #   in Loop: Header=BB5_13 Depth=1
	movapd	%xmm8, %xmm1
	unpcklpd	%xmm8, %xmm1                    # xmm1 = xmm1[0],xmm8[0]
	movapd	%xmm12, %xmm3
	unpcklpd	%xmm12, %xmm3                   # xmm3 = xmm3[0],xmm12[0]
	xorl	%eax, %eax
	movdqa	.LCPI5_4(%rip), %xmm4           # xmm4 = [0,1,2,3]
	movaps	144(%rsp), %xmm9                # 16-byte Reload
	pcmpeqd	%xmm11, %xmm11
	movapd	.LCPI5_5(%rip), %xmm0           # xmm0 = [-1.0E+0,-1.0E+0]
	movapd	.LCPI5_6(%rip), %xmm13          # xmm13 = [1.0E+0,1.0E+0]
	movdqa	.LCPI5_7(%rip), %xmm14          # xmm14 = [4,4,4,4]
	.p2align	4, 0x90
.LBB5_17:                               # %vector.body
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm4, %xmm5
	paddd	%xmm11, %xmm5
	cvtdq2ps	%xmm5, %xmm5
	mulps	%xmm9, %xmm5
	cvtps2pd	%xmm5, %xmm6
	movhlps	%xmm5, %xmm5                    # xmm5 = xmm5[1,1]
	cvtps2pd	%xmm5, %xmm5
	addpd	%xmm0, %xmm6
	addpd	%xmm0, %xmm5
	cvttpd2dq	%xmm6, %xmm6
	cvttpd2dq	%xmm5, %xmm5
	unpcklpd	%xmm5, %xmm6                    # xmm6 = xmm6[0],xmm5[0]
	pshufd	$245, %xmm6, %xmm5              # xmm5 = xmm6[1,1,3,3]
	pmuludq	%xmm6, %xmm6
	pmuludq	%xmm5, %xmm5
	movdqa	%xmm6, %xmm7
	punpckldq	%xmm5, %xmm7            # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1]
	cvtdq2pd	%xmm7, %xmm7
	punpckhdq	%xmm5, %xmm6            # xmm6 = xmm6[2],xmm5[2],xmm6[3],xmm5[3]
	cvtdq2pd	%xmm6, %xmm5
	movapd	%xmm13, %xmm6
	subpd	%xmm5, %xmm6
	movapd	%xmm13, %xmm5
	subpd	%xmm7, %xmm5
	movapd	%xmm1, %xmm7
	movapd	%xmm1, %xmm2
	mulpd	%xmm5, %xmm7
	mulpd	%xmm6, %xmm2
	subpd	%xmm3, %xmm2
	addpd	%xmm6, %xmm6
	subpd	%xmm3, %xmm7
	subpd	%xmm6, %xmm2
	addpd	%xmm5, %xmm5
	cvtpd2ps	%xmm2, %xmm2
	subpd	%xmm5, %xmm7
	cvtpd2ps	%xmm7, %xmm5
	unpcklpd	%xmm2, %xmm5                    # xmm5 = xmm5[0],xmm2[0]
	movupd	%xmm5, (%r12,%rax,4)
	addq	$4, %rax
	paddd	%xmm14, %xmm4
	cmpq	%rax, %r14
	jne	.LBB5_17
# %bb.18:                               # %middle.block
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	%r14, %rax
	cmpq	%rbx, %r14
	movaps	32(%rsp), %xmm3                 # 16-byte Reload
	movsd	.LCPI5_2(%rip), %xmm4           # xmm4 = mem[0],zero
	je	.LBB5_20
	.p2align	4, 0x90
.LBB5_19:                               # %for.body10.i
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rax), %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ss	%ecx, %xmm1
	mulss	%xmm3, %xmm1
	cvtss2sd	%xmm1, %xmm1
	addsd	%xmm4, %xmm1
	cvttsd2si	%xmm1, %ecx
	imull	%ecx, %ecx
	xorps	%xmm1, %xmm1
	cvtsi2sd	%ecx, %xmm1
	movapd	%xmm10, %xmm2
	subsd	%xmm1, %xmm2
	movapd	%xmm8, %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm12, %xmm1
	addsd	%xmm2, %xmm2
	subsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, (%r12,%rax,4)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.LBB5_19
	jmp	.LBB5_20
.LBB5_21:                               # %initialize.exit
	movq	136(%rsp), %r14                 # 8-byte Reload
	movq	%r14, %rdi
	movq	88(%rsp), %rbp                  # 8-byte Reload
	movq	%rbp, %rsi
	movq	160(%rsp), %rdx                 # 8-byte Reload
	callq	memcpy@PLT
	movss	16(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	movss	12(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	20(%rsp), %r8d
	movq	24(%rsp), %rdi                  # 8-byte Reload
                                        # kill: def $edi killed $edi killed $rdi
	movl	%ebx, %esi
	movss	48(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movaps	32(%rsp), %xmm1                 # 16-byte Reload
	movss	72(%rsp), %xmm2                 # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	movq	%rbp, %rdx
	movq	80(%rsp), %rbx                  # 8-byte Reload
	movq	%rbx, %rcx
	callq	jacobi_seq
	movl	(%rsp), %edi
	movl	4(%rsp), %esi
	movss	8(%rsp), %xmm2                  # xmm2 = mem[0],zero,zero,zero
	movss	16(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	movss	12(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	20(%rsp), %r8d
	movss	48(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movaps	32(%rsp), %xmm1                 # 16-byte Reload
	movq	%r14, %rdx
	movq	%rbx, %rcx
	callq	jacobi_omp
	movl	(%rsp), %ecx
	leal	-1(%rcx), %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movl	4(%rsp), %r13d
	movsd	.LCPI5_0(%rip), %xmm2           # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm1
	divsd	%xmm0, %xmm1
	xorps	%xmm3, %xmm3
	cvtsd2ss	%xmm1, %xmm3
	movslq	%r13d, %rax
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	addl	$-1, %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	%xmm0, %xmm2
	xorps	%xmm4, %xmm4
	cvtsd2ss	%xmm2, %xmm4
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	testl	%ecx, %ecx
	movss	%xmm3, 24(%rsp)                 # 4-byte Spill
	movaps	%xmm4, 48(%rsp)                 # 16-byte Spill
	jle	.LBB5_31
# %bb.22:                               # %for.cond7.preheader.lr.ph.i185
	movss	8(%rsp), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	xorps	.LCPI5_1(%rip), %xmm0
	movaps	%xmm0, 112(%rsp)                # 16-byte Spill
	leaq	(,%r13,4), %r15
	movl	%r13d, %ebp
	andl	$-4, %ebp
	movaps	%xmm4, %xmm9
	shufps	$0, %xmm4, %xmm9                # xmm9 = xmm9[0,0],xmm4[0,0]
	xorl	%r12d, %r12d
	movsd	.LCPI5_2(%rip), %xmm5           # xmm5 = mem[0],zero
	movq	80(%rsp), %rbx                  # 8-byte Reload
	movaps	%xmm9, 144(%rsp)                # 16-byte Spill
	jmp	.LBB5_23
	.p2align	4, 0x90
.LBB5_30:                               # %for.inc48.i222
                                        #   in Loop: Header=BB5_23 Depth=1
	addq	$1, %r12
	addq	%r15, %rbx
	cmpq	32(%rsp), %r12                  # 8-byte Folded Reload
	je	.LBB5_31
.LBB5_23:                               # %for.cond7.preheader.i187
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_27 Depth 2
                                        #     Child Loop BB5_29 Depth 2
	testl	%r13d, %r13d
	jle	.LBB5_30
# %bb.24:                               # %for.body10.lr.ph.i191
                                        #   in Loop: Header=BB5_23 Depth=1
	movq	%r15, %rdi
	leal	-1(%r12), %eax
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	imulq	%r12, %rdi
	addq	88(%rsp), %rdi                  # 8-byte Folded Reload
	mulss	%xmm3, %xmm0
	cvtss2sd	%xmm0, %xmm0
	addsd	%xmm5, %xmm0
	cvttsd2si	%xmm0, %r14d
	imull	%r14d, %r14d
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset@PLT
	movsd	.LCPI5_3(%rip), %xmm10          # xmm10 = mem[0],zero
	xorps	%xmm1, %xmm1
	cvtsi2sd	%r14d, %xmm1
	movapd	%xmm10, %xmm12
	subsd	%xmm1, %xmm12
	movapd	%xmm12, %xmm8
	mulsd	112(%rsp), %xmm8                # 16-byte Folded Reload
	addsd	%xmm12, %xmm12
	cmpl	$4, %r13d
	jae	.LBB5_26
# %bb.25:                               #   in Loop: Header=BB5_23 Depth=1
	xorl	%eax, %eax
	movss	24(%rsp), %xmm3                 # 4-byte Reload
                                        # xmm3 = mem[0],zero,zero,zero
	movaps	48(%rsp), %xmm4                 # 16-byte Reload
	movsd	.LCPI5_2(%rip), %xmm5           # xmm5 = mem[0],zero
	jmp	.LBB5_29
	.p2align	4, 0x90
.LBB5_26:                               # %vector.ph291
                                        #   in Loop: Header=BB5_23 Depth=1
	movapd	%xmm8, %xmm1
	unpcklpd	%xmm8, %xmm1                    # xmm1 = xmm1[0],xmm8[0]
	movapd	%xmm12, %xmm3
	unpcklpd	%xmm12, %xmm3                   # xmm3 = xmm3[0],xmm12[0]
	xorl	%eax, %eax
	movdqa	.LCPI5_4(%rip), %xmm4           # xmm4 = [0,1,2,3]
	movaps	144(%rsp), %xmm9                # 16-byte Reload
	pcmpeqd	%xmm11, %xmm11
	movapd	.LCPI5_5(%rip), %xmm0           # xmm0 = [-1.0E+0,-1.0E+0]
	movapd	.LCPI5_6(%rip), %xmm13          # xmm13 = [1.0E+0,1.0E+0]
	movdqa	.LCPI5_7(%rip), %xmm14          # xmm14 = [4,4,4,4]
	.p2align	4, 0x90
.LBB5_27:                               # %vector.body289
                                        #   Parent Loop BB5_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm4, %xmm5
	paddd	%xmm11, %xmm5
	cvtdq2ps	%xmm5, %xmm5
	mulps	%xmm9, %xmm5
	cvtps2pd	%xmm5, %xmm6
	movhlps	%xmm5, %xmm5                    # xmm5 = xmm5[1,1]
	cvtps2pd	%xmm5, %xmm5
	addpd	%xmm0, %xmm6
	addpd	%xmm0, %xmm5
	cvttpd2dq	%xmm6, %xmm6
	cvttpd2dq	%xmm5, %xmm5
	unpcklpd	%xmm5, %xmm6                    # xmm6 = xmm6[0],xmm5[0]
	pshufd	$245, %xmm6, %xmm5              # xmm5 = xmm6[1,1,3,3]
	pmuludq	%xmm6, %xmm6
	pmuludq	%xmm5, %xmm5
	movdqa	%xmm6, %xmm7
	punpckldq	%xmm5, %xmm7            # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1]
	cvtdq2pd	%xmm7, %xmm7
	punpckhdq	%xmm5, %xmm6            # xmm6 = xmm6[2],xmm5[2],xmm6[3],xmm5[3]
	cvtdq2pd	%xmm6, %xmm5
	movapd	%xmm13, %xmm6
	subpd	%xmm5, %xmm6
	movapd	%xmm13, %xmm5
	subpd	%xmm7, %xmm5
	movapd	%xmm1, %xmm7
	movapd	%xmm1, %xmm2
	mulpd	%xmm5, %xmm7
	mulpd	%xmm6, %xmm2
	subpd	%xmm3, %xmm2
	addpd	%xmm6, %xmm6
	subpd	%xmm3, %xmm7
	subpd	%xmm6, %xmm2
	addpd	%xmm5, %xmm5
	cvtpd2ps	%xmm2, %xmm2
	subpd	%xmm5, %xmm7
	cvtpd2ps	%xmm7, %xmm5
	unpcklpd	%xmm2, %xmm5                    # xmm5 = xmm5[0],xmm2[0]
	movupd	%xmm5, (%rbx,%rax,4)
	addq	$4, %rax
	paddd	%xmm14, %xmm4
	cmpq	%rax, %rbp
	jne	.LBB5_27
# %bb.28:                               # %middle.block287
                                        #   in Loop: Header=BB5_23 Depth=1
	movq	%rbp, %rax
	cmpq	%r13, %rbp
	movss	24(%rsp), %xmm3                 # 4-byte Reload
                                        # xmm3 = mem[0],zero,zero,zero
	movaps	48(%rsp), %xmm4                 # 16-byte Reload
	movsd	.LCPI5_2(%rip), %xmm5           # xmm5 = mem[0],zero
	je	.LBB5_30
	.p2align	4, 0x90
.LBB5_29:                               # %for.body10.i219
                                        #   Parent Loop BB5_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rax), %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ss	%ecx, %xmm1
	mulss	%xmm4, %xmm1
	cvtss2sd	%xmm1, %xmm1
	addsd	%xmm5, %xmm1
	cvttsd2si	%xmm1, %ecx
	imull	%ecx, %ecx
	xorps	%xmm1, %xmm1
	cvtsi2sd	%ecx, %xmm1
	movapd	%xmm10, %xmm2
	subsd	%xmm1, %xmm2
	movapd	%xmm8, %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm12, %xmm1
	addsd	%xmm2, %xmm2
	subsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, (%rbx,%rax,4)
	addq	$1, %rax
	cmpq	%rax, %r13
	jne	.LBB5_29
	jmp	.LBB5_30
.LBB5_31:                               # %initialize.exit223
	movslq	32(%rsp), %rdx                  # 4-byte Folded Reload
	imulq	72(%rsp), %rdx                  # 8-byte Folded Reload
	shlq	$2, %rdx
	movq	136(%rsp), %r14                 # 8-byte Reload
	movq	%r14, %rdi
	movq	88(%rsp), %r15                  # 8-byte Reload
	movq	%r15, %rsi
	callq	memcpy@PLT
	xorpd	%xmm0, %xmm0
	movl	$20, %ebp
	leaq	96(%rsp), %rbx
	movq	80(%rsp), %r12                  # 8-byte Reload
	.p2align	4, 0x90
.LBB5_32:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movsd	%xmm0, 32(%rsp)                 # 8-byte Spill
	movq	%rbx, %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	96(%rsp), %xmm0
	movzwl	104(%rsp), %eax
	xorps	%xmm2, %xmm2
	cvtsi2sd	%eax, %xmm2
	movsd	.LCPI5_8(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm2
	movsd	%xmm2, 112(%rsp)                # 8-byte Spill
	movl	(%rsp), %edi
	movl	4(%rsp), %esi
	movss	8(%rsp), %xmm2                  # xmm2 = mem[0],zero,zero,zero
	movss	16(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	movss	12(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	20(%rsp), %r8d
	movss	24(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movaps	48(%rsp), %xmm1                 # 16-byte Reload
	movq	%r15, %rdx
	movq	%r12, %rcx
	callq	jacobi_seq
	movq	%rbx, %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	96(%rsp), %xmm0
	mulsd	.LCPI5_8(%rip), %xmm0
	movzwl	104(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	addsd	%xmm0, %xmm1
	movsd	32(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	112(%rsp), %xmm1                # 8-byte Folded Reload
	addsd	%xmm1, %xmm0
	addl	$-1, %ebp
	jne	.LBB5_32
# %bb.33:                               # %for.cond.cleanup
	divsd	.LCPI5_9(%rip), %xmm0
	movl	$.L.str.10, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.11, %edi
	callq	puts
	xorpd	%xmm0, %xmm0
	movl	$20, %ebp
	leaq	96(%rsp), %rbx
	.p2align	4, 0x90
.LBB5_34:                               # %for.body99
                                        # =>This Inner Loop Header: Depth=1
	movsd	%xmm0, 32(%rsp)                 # 8-byte Spill
	movq	%rbx, %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	96(%rsp), %xmm0
	movzwl	104(%rsp), %eax
	xorps	%xmm2, %xmm2
	cvtsi2sd	%eax, %xmm2
	movsd	.LCPI5_8(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm2
	movsd	%xmm2, 112(%rsp)                # 8-byte Spill
	movl	(%rsp), %edi
	movl	4(%rsp), %esi
	movss	8(%rsp), %xmm2                  # xmm2 = mem[0],zero,zero,zero
	movss	16(%rsp), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	movss	12(%rsp), %xmm4                 # xmm4 = mem[0],zero,zero,zero
	movl	20(%rsp), %r8d
	movss	24(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movaps	48(%rsp), %xmm1                 # 16-byte Reload
	movq	%r14, %rdx
	movq	%r12, %rcx
	callq	jacobi_omp
	movq	%rbx, %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	96(%rsp), %xmm0
	mulsd	.LCPI5_8(%rip), %xmm0
	movzwl	104(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	addsd	%xmm0, %xmm1
	movsd	32(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	112(%rsp), %xmm1                # 8-byte Folded Reload
	addsd	%xmm1, %xmm0
	addl	$-1, %ebp
	jne	.LBB5_34
# %bb.35:                               # %for.cond.cleanup98
	divsd	.LCPI5_9(%rip), %xmm0
	movl	$.L.str.12, %edi
	movb	$1, %al
	callq	printf
	movl	(%rsp), %ebx
	movl	4(%rsp), %ebp
	testl	%ebx, %ebx
	jle	.LBB5_36
# %bb.37:                               # %for.cond1.preheader.lr.ph.i
	leaq	(,%rbp,4), %rax
	xorpd	%xmm0, %xmm0
	xorl	%ecx, %ecx
	movss	.LCPI5_10(%rip), %xmm1          # xmm1 = mem[0],zero,zero,zero
	movsd	.LCPI5_3(%rip), %xmm2           # xmm2 = mem[0],zero
	movq	%r15, %rdx
	movss	24(%rsp), %xmm8                 # 4-byte Reload
                                        # xmm8 = mem[0],zero,zero,zero
	movaps	48(%rsp), %xmm7                 # 16-byte Reload
	jmp	.LBB5_38
	.p2align	4, 0x90
.LBB5_41:                               # %for.inc26.i
                                        #   in Loop: Header=BB5_38 Depth=1
	addq	$1, %rcx
	addq	%rax, %rdx
	cmpq	%rbx, %rcx
	je	.LBB5_42
.LBB5_38:                               # %for.cond1.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_40 Depth 2
	testl	%ebp, %ebp
	jle	.LBB5_41
# %bb.39:                               # %for.body3.lr.ph.i
                                        #   in Loop: Header=BB5_38 Depth=1
	leal	-1(%rcx), %esi
	xorps	%xmm3, %xmm3
	cvtsi2ss	%esi, %xmm3
	mulss	%xmm8, %xmm3
	addss	%xmm1, %xmm3
	mulss	%xmm3, %xmm3
	xorps	%xmm4, %xmm4
	cvtss2sd	%xmm3, %xmm4
	movapd	%xmm2, %xmm3
	subsd	%xmm4, %xmm3
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB5_40:                               # %for.body3.i
                                        #   Parent Loop BB5_38 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rsi), %edi
	xorps	%xmm4, %xmm4
	cvtsi2ss	%edi, %xmm4
	mulss	%xmm7, %xmm4
	addss	%xmm1, %xmm4
	movss	(%rdx,%rsi,4), %xmm5            # xmm5 = mem[0],zero,zero,zero
	cvtss2sd	%xmm5, %xmm5
	mulss	%xmm4, %xmm4
	cvtss2sd	%xmm4, %xmm4
	movapd	%xmm2, %xmm6
	subsd	%xmm4, %xmm6
	mulsd	%xmm3, %xmm6
	subsd	%xmm6, %xmm5
	xorps	%xmm4, %xmm4
	cvtsd2ss	%xmm5, %xmm4
	mulss	%xmm4, %xmm4
	addss	%xmm4, %xmm0
	addq	$1, %rsi
	cmpq	%rsi, %rbp
	jne	.LBB5_40
	jmp	.LBB5_41
.LBB5_36:
	xorpd	%xmm0, %xmm0
.LBB5_42:                               # %error_check.exit
	cvtss2sd	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jb	.LBB5_44
# %bb.43:
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB5_45
.LBB5_44:                               # %call.sqrt
	callq	sqrt
.LBB5_45:                               # %error_check.exit.split
	imull	%ebp, %ebx
	xorps	%xmm1, %xmm1
	cvtsi2sd	%ebx, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	movq	%r15, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$168, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI5_0:
	.quad	.LBB5_2
	.quad	.LBB5_3
	.quad	.LBB5_4
	.quad	.LBB5_6
	.quad	.LBB5_7
	.quad	.LBB5_8
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

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"------------------------------------------------------------------------------------------------------"
	.size	.Lstr, 103

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
