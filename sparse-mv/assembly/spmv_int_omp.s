	.text
	.file	"spmv_int.c"
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	8(%rsp), %rdi
	callq	ftime
	cvtsi2sdq	8(%rsp), %xmm1
	movzwl	16(%rsp), %eax
	cvtsi2sd	%eax, %xmm0
	divsd	.LCPI0_0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
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
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	testl	%ebx, %ebx
	jle	.LBB1_6
# %bb.1:                                # %for.cond1.preheader.lr.ph
	movslq	12(%rsp), %r13                  # 4-byte Folded Reload
	movl	%ebx, %eax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movl	%r13d, %r14d
	shlq	$2, %r13
	xorl	%ebp, %ebp
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_5:                                # %for.end
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	$10, %edi
	callq	putchar@PLT
	addq	$1, %rbp
	addq	%r13, %r12
	cmpq	16(%rsp), %rbp                  # 8-byte Folded Reload
	je	.LBB1_6
.LBB1_2:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
	cmpl	$0, 12(%rsp)                    # 4-byte Folded Reload
	jle	.LBB1_5
# %bb.3:                                # %for.body3.lr.ph
                                        #   in Loop: Header=BB1_2 Depth=1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_4:                                # %for.body3
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%r12,%rbx,4), %r8d
	movl	$.L.str.1, %edi
	movq	%r15, %rsi
	movl	%ebp, %edx
	movl	%ebx, %ecx
	xorl	%eax, %eax
	callq	printf
	addq	$1, %rbx
	cmpq	%rbx, %r14
	jne	.LBB1_4
	jmp	.LBB1_5
.LBB1_6:                                # %for.end8
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
.Lfunc_end1:
	.size	print_array, .Lfunc_end1-print_array
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function main
.LCPI2_0:
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI2_1:
	.quad	0x408f400000000000              # double 1000
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$10240, %eax                    # imm = 0x2800
	cmpl	$2, %edi
	jl	.LBB2_2
# %bb.1:                                # %if.then
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
.LBB2_2:                                # %if.end
	movq	%rax, 8(%rsp)                   # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	imull	%eax, %eax
	leal	(%rax,%rax,4), %ebx
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	leaq	(,%rax,4), %r13
	movq	%r13, %rdi
	callq	malloc
	movq	%rax, %rbp
	shlq	$2, %rbx
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %r15
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %r12
	movq	%r13, %rdi
	callq	malloc
	movq	%rax, 80(%rsp)                  # 8-byte Spill
	movq	%r13, %rdi
	callq	malloc
	movq	8(%rsp), %rbx                   # 8-byte Reload
	movq	%rax, (%rsp)                    # 8-byte Spill
	testl	%ebx, %ebx
	movq	%rbp, 48(%rsp)                  # 8-byte Spill
	jle	.LBB2_3
# %bb.4:                                # %for.cond18.preheader.lr.ph
	leal	-1(%rbx), %eax
	leal	1(%rbx), %ecx
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	movl	$1, %ecx
	subl	%ebx, %ecx
	movl	%ecx, 24(%rsp)                  # 4-byte Spill
	movq	%rbp, %rcx
	addq	$4, %rcx
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	xorl	%edx, %edx
	xorl	%edi, %edi
	xorl	%r13d, %r13d
	jmp	.LBB2_5
	.p2align	4, 0x90
.LBB2_22:                               # %for.inc69.loopexit
                                        #   in Loop: Header=BB2_5 Depth=1
	movq	%rbx, %rcx
	addq	%r10, %rcx
	movq	48(%rsp), %rbp                  # 8-byte Reload
	movq	8(%rsp), %rbx                   # 8-byte Reload
.LBB2_23:                               # %for.inc69
                                        #   in Loop: Header=BB2_5 Depth=1
	addl	$1, %edi
	movl	%ecx, %edx
	cmpl	%ebx, %edi
	je	.LBB2_24
.LBB2_5:                                # %for.body21.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_14 Depth 2
	movslq	%edx, %r8
	movl	%r13d, (%rbp,%r8,4)
	testl	%edi, %edi
	je	.LBB2_7
# %bb.6:                                # %if.then25.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movl	%edx, %ecx
	subl	%ebx, %ecx
	movslq	%r13d, %rsi
	movl	%ecx, (%r15,%rsi,4)
	movl	$-1, (%r12,%rsi,4)
	addl	$1, %r13d
.LBB2_7:                                # %if.end40.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%r13), %ecx
	movslq	%r13d, %rsi
	movl	%edx, (%r15,%rsi,4)
	movl	$4, (%r12,%rsi,4)
	cmpl	$1, %ebx
	je	.LBB2_9
# %bb.8:                                # %if.then49.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%rdx), %esi
	movslq	%ecx, %rcx
	movl	%esi, (%r15,%rcx,4)
	movl	$-1, (%r12,%rcx,4)
	addl	$2, %r13d
	movl	%r13d, %ecx
.LBB2_9:                                # %if.end55.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	cmpl	%eax, %edi
	jge	.LBB2_10
# %bb.11:                               # %if.then59.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	(%rdx,%rbx), %esi
	movslq	%ecx, %r13
	movl	%esi, (%r15,%r13,4)
	movl	$-1, (%r12,%r13,4)
	addl	$1, %r13d
	jmp	.LBB2_12
	.p2align	4, 0x90
.LBB2_10:                               #   in Loop: Header=BB2_5 Depth=1
	movl	%ecx, %r13d
.LBB2_12:                               # %if.end66.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leaq	1(%r8), %rcx
	cmpl	$1, %ebx
	je	.LBB2_23
# %bb.13:                               # %for.body21.preheader
                                        #   in Loop: Header=BB2_5 Depth=1
	movq	%rcx, %rbx
	movl	%edx, %ebp
	movq	32(%rsp), %rcx                  # 8-byte Reload
	leal	(%rcx,%rdx), %r11d
	addl	24(%rsp), %edx                  # 4-byte Folded Reload
	movq	16(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%r8,4), %r8
	xorl	%r9d, %r9d
	jmp	.LBB2_14
	.p2align	4, 0x90
.LBB2_20:                               # %if.then59
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%ecx, %r13
	addl	%r11d, %r9d
	movl	%r9d, (%r15,%r13,4)
	movl	$-1, (%r12,%r13,4)
	addl	$1, %r13d
.LBB2_21:                               # %if.end66
                                        #   in Loop: Header=BB2_14 Depth=2
	movq	%r10, %r9
	cmpl	%r10d, %eax
	je	.LBB2_22
.LBB2_14:                               # %for.body21
                                        #   Parent Loop BB2_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	1(%r9), %r10
	movl	%r13d, (%r8,%r9,4)
	testl	%edi, %edi
	je	.LBB2_16
# %bb.15:                               # %if.then25
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r13d, %rcx
	leal	(%rdx,%r9), %r14d
	movl	%r14d, (%r15,%rcx,4)
	movl	$-1, (%r12,%rcx,4)
	addl	$1, %r13d
.LBB2_16:                               # %if.end40
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r13d, %rcx
	leal	(%r9,%rbp), %esi
	movl	%esi, (%r15,%rcx,4)
	movl	$-1, (%r12,%rcx,4)
	leal	(%r9,%rbp), %esi
	addl	$1, %esi
	movl	%esi, 4(%r15,%rcx,4)
	movl	$4, 4(%r12,%rcx,4)
	addl	$2, %ecx
	cmpl	%eax, %r10d
	jge	.LBB2_18
# %bb.17:                               # %if.then49
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%ecx, %rcx
	leal	(%r9,%rbp), %esi
	addl	$2, %esi
	movl	%esi, (%r15,%rcx,4)
	movl	$-1, (%r12,%rcx,4)
	addl	$3, %r13d
	movl	%r13d, %ecx
.LBB2_18:                               # %if.end55
                                        #   in Loop: Header=BB2_14 Depth=2
	cmpl	%eax, %edi
	jl	.LBB2_20
# %bb.19:                               #   in Loop: Header=BB2_14 Depth=2
	movl	%ecx, %r13d
	jmp	.LBB2_21
.LBB2_24:                               # %for.end71.loopexit
	movslq	%ecx, %rax
	jmp	.LBB2_25
.LBB2_3:
	xorl	%r13d, %r13d
	xorl	%eax, %eax
.LBB2_25:                               # %for.end71
	movl	%r13d, (%rbp,%rax,4)
	movq	40(%rsp), %r13                  # 8-byte Reload
	testl	%r13d, %r13d
	movq	80(%rsp), %rbx                  # 8-byte Reload
	je	.LBB2_37
# %bb.26:                               # %for.body77.preheader
	cmpl	$8, %r13d
	jae	.LBB2_28
# %bb.27:
	xorl	%eax, %eax
	jmp	.LBB2_36
.LBB2_28:                               # %vector.ph
	movl	%r13d, %eax
	andl	$-8, %eax
	leaq	-8(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$3, %rdx
	addq	$1, %rdx
	movl	%edx, %ecx
	andl	$7, %ecx
	cmpq	$56, %rsi
	jae	.LBB2_30
# %bb.29:
	xorl	%esi, %esi
	jmp	.LBB2_32
.LBB2_30:                               # %vector.ph.new
	andq	$-8, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movaps	.LCPI2_0(%rip), %xmm0           # xmm0 = [1,1,1,1]
	.p2align	4, 0x90
.LBB2_31:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movups	%xmm0, (%rbx,%rsi,4)
	movups	%xmm0, 16(%rbx,%rsi,4)
	movups	%xmm0, 32(%rbx,%rsi,4)
	movups	%xmm0, 48(%rbx,%rsi,4)
	movups	%xmm0, 64(%rbx,%rsi,4)
	movups	%xmm0, 80(%rbx,%rsi,4)
	movups	%xmm0, 96(%rbx,%rsi,4)
	movups	%xmm0, 112(%rbx,%rsi,4)
	movups	%xmm0, 128(%rbx,%rsi,4)
	movups	%xmm0, 144(%rbx,%rsi,4)
	movups	%xmm0, 160(%rbx,%rsi,4)
	movups	%xmm0, 176(%rbx,%rsi,4)
	movups	%xmm0, 192(%rbx,%rsi,4)
	movups	%xmm0, 208(%rbx,%rsi,4)
	movups	%xmm0, 224(%rbx,%rsi,4)
	movups	%xmm0, 240(%rbx,%rsi,4)
	addq	$64, %rsi
	addq	$8, %rdx
	jne	.LBB2_31
.LBB2_32:                               # %middle.block.unr-lcssa
	testq	%rcx, %rcx
	je	.LBB2_35
# %bb.33:                               # %vector.body.epil.preheader
	leaq	(%rbx,%rsi,4), %rdx
	addq	$16, %rdx
	shlq	$5, %rcx
	xorl	%esi, %esi
	movaps	.LCPI2_0(%rip), %xmm0           # xmm0 = [1,1,1,1]
	.p2align	4, 0x90
.LBB2_34:                               # %vector.body.epil
                                        # =>This Inner Loop Header: Depth=1
	movups	%xmm0, -16(%rdx,%rsi)
	movups	%xmm0, (%rdx,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %rcx
	jne	.LBB2_34
.LBB2_35:                               # %middle.block
	cmpq	%r13, %rax
	je	.LBB2_37
	.p2align	4, 0x90
.LBB2_36:                               # %for.body77
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	addq	$1, %rax
	cmpq	%rax, %r13
	jne	.LBB2_36
.LBB2_37:                               # %for.end82
	leaq	56(%rsp), %rdi
	callq	ftime
	movq	%rbp, %r8
	xorps	%xmm0, %xmm0
	cvtsi2sdq	56(%rsp), %xmm0
	movzwl	64(%rsp), %eax
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI2_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 72(%rsp)                 # 8-byte Spill
	testl	%r13d, %r13d
	movq	(%rsp), %rdi                    # 8-byte Reload
	je	.LBB2_54
# %bb.38:                               # %for.body87.preheader
	movl	(%r8), %r14d
	xorl	%r9d, %r9d
	jmp	.LBB2_39
	.p2align	4, 0x90
.LBB2_53:                               # %simd.if.end
                                        #   in Loop: Header=BB2_39 Depth=1
	movl	%ecx, (%rdi,%rbp,4)
	cmpq	%r13, %r9
	je	.LBB2_54
.LBB2_39:                               # %for.body87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_45 Depth 2
                                        #     Child Loop BB2_52 Depth 2
	movq	%r9, %rbp
	movl	%r14d, %eax
	addq	$1, %r9
	movl	4(%r8,%rbp,4), %r14d
	movl	%r14d, %edx
	movl	$0, %ecx
	subl	%eax, %edx
	jle	.LBB2_53
# %bb.40:                               # %for.body87
                                        #   in Loop: Header=BB2_39 Depth=1
	movl	$0, %ecx
	testl	%edx, %edx
	je	.LBB2_53
# %bb.41:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_39 Depth=1
	xorl	%ecx, %ecx
	cmpl	$8, %edx
	jb	.LBB2_42
# %bb.43:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_39 Depth=1
	leal	-1(%r14), %esi
	movl	$0, %r10d
	cmpl	%eax, %esi
	jl	.LBB2_47
# %bb.44:                               # %vector.ph325
                                        #   in Loop: Header=BB2_39 Depth=1
	movq	%rbp, 32(%rsp)                  # 8-byte Spill
	movq	%r9, 8(%rsp)                    # 8-byte Spill
	movl	%edx, 16(%rsp)                  # 4-byte Spill
	movl	%edx, %ecx
	andl	$-8, %ecx
	xorpd	%xmm0, %xmm0
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	movl	%ecx, %r13d
	movl	%eax, %esi
	xorpd	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB2_45:                               # %vector.body321
                                        #   Parent Loop BB2_39 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%esi, %rsi
	movdqu	(%r12,%rsi,4), %xmm3
	movdqu	16(%r12,%rsi,4), %xmm8
	movdqu	(%r15,%rsi,4), %xmm4
	movdqu	16(%r15,%rsi,4), %xmm5
	pshufd	$238, %xmm4, %xmm6              # xmm6 = xmm4[2,3,2,3]
	pxor	%xmm7, %xmm7
	pcmpgtd	%xmm6, %xmm7
	punpckldq	%xmm7, %xmm6            # xmm6 = xmm6[0],xmm7[0],xmm6[1],xmm7[1]
	pxor	%xmm7, %xmm7
	pcmpgtd	%xmm4, %xmm7
	punpckldq	%xmm7, %xmm4            # xmm4 = xmm4[0],xmm7[0],xmm4[1],xmm7[1]
	pshufd	$238, %xmm5, %xmm7              # xmm7 = xmm5[2,3,2,3]
	pxor	%xmm2, %xmm2
	pcmpgtd	%xmm7, %xmm2
	punpckldq	%xmm2, %xmm7            # xmm7 = xmm7[0],xmm2[0],xmm7[1],xmm2[1]
	pxor	%xmm2, %xmm2
	pcmpgtd	%xmm5, %xmm2
	punpckldq	%xmm2, %xmm5            # xmm5 = xmm5[0],xmm2[0],xmm5[1],xmm2[1]
	movq	%xmm4, %rdx
	pshufd	$238, %xmm4, %xmm2              # xmm2 = xmm4[2,3,2,3]
	movq	%xmm2, %rbp
	movq	%xmm6, %rdi
	pshufd	$238, %xmm6, %xmm2              # xmm2 = xmm6[2,3,2,3]
	movq	%xmm2, %r11
	movq	%xmm5, %rcx
	pshufd	$238, %xmm5, %xmm2              # xmm2 = xmm5[2,3,2,3]
	movq	%xmm2, %r8
	movq	%xmm7, %r9
	pshufd	$238, %xmm7, %xmm2              # xmm2 = xmm7[2,3,2,3]
	movq	%xmm2, %r10
	movd	(%rbx,%rdx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movd	(%rbx,%rbp,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	punpckldq	%xmm4, %xmm2            # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
	movd	(%rbx,%rdi,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	movd	(%rbx,%r11,4), %xmm5            # xmm5 = mem[0],zero,zero,zero
	punpckldq	%xmm5, %xmm4            # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
	punpcklqdq	%xmm4, %xmm2            # xmm2 = xmm2[0],xmm4[0]
	movd	(%rbx,%rcx,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	movd	(%rbx,%r8,4), %xmm5             # xmm5 = mem[0],zero,zero,zero
	punpckldq	%xmm5, %xmm4            # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
	movd	(%rbx,%r9,4), %xmm5             # xmm5 = mem[0],zero,zero,zero
	movd	(%rbx,%r10,4), %xmm6            # xmm6 = mem[0],zero,zero,zero
	punpckldq	%xmm6, %xmm5            # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
	punpcklqdq	%xmm5, %xmm4            # xmm4 = xmm4[0],xmm5[0]
	pshufd	$245, %xmm2, %xmm5              # xmm5 = xmm2[1,1,3,3]
	pmuludq	%xmm3, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm3, %xmm3              # xmm3 = xmm3[1,1,3,3]
	pmuludq	%xmm5, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
	paddd	%xmm2, %xmm0
	pshufd	$245, %xmm4, %xmm2              # xmm2 = xmm4[1,1,3,3]
	pmuludq	%xmm8, %xmm4
	pshufd	$232, %xmm4, %xmm3              # xmm3 = xmm4[0,2,2,3]
	pshufd	$245, %xmm8, %xmm4              # xmm4 = xmm8[1,1,3,3]
	pmuludq	%xmm2, %xmm4
	pshufd	$232, %xmm4, %xmm2              # xmm2 = xmm4[0,2,2,3]
	punpckldq	%xmm2, %xmm3            # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
	paddd	%xmm3, %xmm1
	addl	$8, %esi
	addl	$-8, %r13d
	jne	.LBB2_45
# %bb.46:                               # %middle.block319
                                        #   in Loop: Header=BB2_39 Depth=1
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %ecx
	movq	24(%rsp), %r10                  # 8-byte Reload
	movl	16(%rsp), %edx                  # 4-byte Reload
	cmpl	%r10d, %edx
	movq	48(%rsp), %r8                   # 8-byte Reload
	movq	40(%rsp), %r13                  # 8-byte Reload
	movq	(%rsp), %rdi                    # 8-byte Reload
	movq	8(%rsp), %r9                    # 8-byte Reload
	movq	32(%rsp), %rbp                  # 8-byte Reload
	je	.LBB2_53
	jmp	.LBB2_47
.LBB2_42:                               #   in Loop: Header=BB2_39 Depth=1
	xorl	%r10d, %r10d
.LBB2_47:                               # %omp.inner.for.body.preheader356
                                        #   in Loop: Header=BB2_39 Depth=1
	movl	%eax, %esi
	notl	%esi
	addl	%r14d, %esi
	testb	$1, %dl
	jne	.LBB2_49
# %bb.48:                               #   in Loop: Header=BB2_39 Depth=1
	movl	%r10d, %edx
	cmpl	%r10d, %esi
	je	.LBB2_53
	jmp	.LBB2_51
.LBB2_49:                               # %omp.inner.for.body.prol
                                        #   in Loop: Header=BB2_39 Depth=1
	leal	(%r10,%rax), %edx
	movslq	%edx, %rdx
	movslq	(%r15,%rdx,4), %rdi
	movl	(%rbx,%rdi,4), %edi
	imull	(%r12,%rdx,4), %edi
	addl	%edi, %ecx
	movq	(%rsp), %rdi                    # 8-byte Reload
	movl	%r10d, %edx
	orl	$1, %edx
	cmpl	%r10d, %esi
	je	.LBB2_53
.LBB2_51:                               # %omp.inner.for.body.preheader373
                                        #   in Loop: Header=BB2_39 Depth=1
	addl	%edx, %eax
	.p2align	4, 0x90
.LBB2_52:                               # %omp.inner.for.body
                                        #   Parent Loop BB2_39 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cltq
	movslq	(%r15,%rax,4), %rdx
	movl	(%rbx,%rdx,4), %edx
	imull	(%r12,%rax,4), %edx
	addl	%ecx, %edx
	leal	1(%rax), %ecx
	movslq	%ecx, %rsi
	movslq	(%r15,%rsi,4), %rcx
	movl	(%rbx,%rcx,4), %ecx
	imull	(%r12,%rsi,4), %ecx
	addl	%edx, %ecx
	addl	$2, %eax
	cmpl	%eax, %r14d
	jne	.LBB2_52
	jmp	.LBB2_53
.LBB2_54:                               # %for.end129
	movq	%r8, %r14
	leaq	56(%rsp), %rdi
	callq	ftime
	xorps	%xmm1, %xmm1
	cvtsi2sdq	56(%rsp), %xmm1
	movzwl	64(%rsp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	.LCPI2_1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	subsd	72(%rsp), %xmm0                 # 8-byte Folded Reload
	movl	$.L.str.3, %edi
	movb	$1, %al
	callq	printf
	testl	%r13d, %r13d
	je	.LBB2_55
# %bb.56:                               # %for.body136.preheader
	cmpl	$8, %r13d
	jae	.LBB2_58
# %bb.57:
	xorl	%eax, %eax
	xorl	%esi, %esi
	movq	(%rsp), %rbp                    # 8-byte Reload
	jmp	.LBB2_65
.LBB2_55:
	xorl	%esi, %esi
	movq	(%rsp), %rbp                    # 8-byte Reload
	jmp	.LBB2_66
.LBB2_58:                               # %vector.ph340
	movl	%r13d, %eax
	andl	$-8, %eax
	leaq	-8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$1, %rcx
	testq	%rdx, %rdx
	movq	(%rsp), %rbp                    # 8-byte Reload
	je	.LBB2_59
# %bb.60:                               # %vector.ph340.new
	movq	%rcx, %rsi
	andq	$-2, %rsi
	negq	%rsi
	pxor	%xmm2, %xmm2
	xorl	%edx, %edx
	pxor	%xmm3, %xmm3
	.p2align	4, 0x90
.LBB2_61:                               # %vector.body338
                                        # =>This Inner Loop Header: Depth=1
	movdqu	(%rbp,%rdx,4), %xmm4
	movdqu	16(%rbp,%rdx,4), %xmm5
	movdqu	32(%rbp,%rdx,4), %xmm0
	movdqu	48(%rbp,%rdx,4), %xmm1
	psrld	$31, %xmm4
	paddd	%xmm2, %xmm4
	psrld	$31, %xmm5
	paddd	%xmm3, %xmm5
	psrld	$31, %xmm0
	paddd	%xmm4, %xmm0
	psrld	$31, %xmm1
	paddd	%xmm5, %xmm1
	addq	$16, %rdx
	movdqa	%xmm0, %xmm2
	movdqa	%xmm1, %xmm3
	addq	$2, %rsi
	jne	.LBB2_61
# %bb.62:                               # %middle.block336.unr-lcssa
	testb	$1, %cl
	je	.LBB2_64
.LBB2_63:                               # %vector.body338.epil
	movdqu	(%rbp,%rdx,4), %xmm2
	movdqu	16(%rbp,%rdx,4), %xmm3
	psrld	$31, %xmm3
	paddd	%xmm3, %xmm1
	psrld	$31, %xmm2
	paddd	%xmm2, %xmm0
.LBB2_64:                               # %middle.block336
	paddd	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	paddd	%xmm0, %xmm1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	paddd	%xmm1, %xmm0
	movd	%xmm0, %esi
	cmpq	%r13, %rax
	je	.LBB2_66
	.p2align	4, 0x90
.LBB2_65:                               # %for.body136
                                        # =>This Inner Loop Header: Depth=1
	movl	(%rbp,%rax,4), %ecx
	shrl	$31, %ecx
	addl	%ecx, %esi
	addq	$1, %rax
	cmpq	%rax, %r13
	jne	.LBB2_65
.LBB2_66:                               # %for.end146
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$88, %rsp
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
.LBB2_59:
	.cfi_def_cfa_offset 144
	xorpd	%xmm0, %xmm0
	xorl	%edx, %edx
	xorpd	%xmm1, %xmm1
	testb	$1, %cl
	jne	.LBB2_63
	jmp	.LBB2_64
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
	.asciz	"%s[%d][%d]:%d  "
	.size	.L.str.1, 16

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
