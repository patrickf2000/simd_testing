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
	movss	(%r12,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movq	%r15, %rsi
	movl	%ebp, %edx
	movl	%ebx, %ecx
	movb	$1, %al
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
	.long	0x3f800000                      # float 1
	.long	0x3f800000                      # float 1
	.long	0x3f800000                      # float 1
	.long	0x3f800000                      # float 1
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
	movq	%rax, 48(%rsp)                  # 8-byte Spill
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
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	%r13, %rdi
	callq	malloc
	movq	8(%rsp), %rbx                   # 8-byte Reload
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	testl	%ebx, %ebx
	movq	%rbp, 56(%rsp)                  # 8-byte Spill
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
	movq	56(%rsp), %rbp                  # 8-byte Reload
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
	movl	$-1082130432, (%r12,%rsi,4)     # imm = 0xBF800000
	addl	$1, %r13d
.LBB2_7:                                # %if.end40.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%r13), %ecx
	movslq	%r13d, %rsi
	movl	%edx, (%r15,%rsi,4)
	movl	$1082130432, (%r12,%rsi,4)      # imm = 0x40800000
	cmpl	$1, %ebx
	je	.LBB2_9
# %bb.8:                                # %if.then49.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%rdx), %esi
	movslq	%ecx, %rcx
	movl	%esi, (%r15,%rcx,4)
	movl	$-1082130432, (%r12,%rcx,4)     # imm = 0xBF800000
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
	movl	$-1082130432, (%r12,%r13,4)     # imm = 0xBF800000
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
	movl	$-1082130432, (%r12,%r13,4)     # imm = 0xBF800000
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
	movl	$-1082130432, (%r12,%rcx,4)     # imm = 0xBF800000
	addl	$1, %r13d
.LBB2_16:                               # %if.end40
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r13d, %rcx
	leal	(%r9,%rbp), %esi
	movl	%esi, (%r15,%rcx,4)
	movl	$-1082130432, (%r12,%rcx,4)     # imm = 0xBF800000
	leal	(%r9,%rbp), %esi
	addl	$1, %esi
	movl	%esi, 4(%r15,%rcx,4)
	movl	$1082130432, 4(%r12,%rcx,4)     # imm = 0x40800000
	addl	$2, %ecx
	cmpl	%eax, %r10d
	jge	.LBB2_18
# %bb.17:                               # %if.then49
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%ecx, %rcx
	leal	(%r9,%rbp), %esi
	addl	$2, %esi
	movl	%esi, (%r15,%rcx,4)
	movl	$-1082130432, (%r12,%rcx,4)     # imm = 0xBF800000
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
	movq	(%rsp), %rcx                    # 8-byte Reload
	movl	%r13d, (%rbp,%rax,4)
	movq	48(%rsp), %rbx                  # 8-byte Reload
	testl	%ebx, %ebx
	movq	40(%rsp), %r13                  # 8-byte Reload
	je	.LBB2_37
# %bb.26:                               # %for.body77.preheader
	cmpl	$8, %ebx
	jae	.LBB2_28
# %bb.27:
	xorl	%eax, %eax
	jmp	.LBB2_36
.LBB2_28:                               # %vector.ph
	movl	%ebx, %eax
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
	movaps	.LCPI2_0(%rip), %xmm0           # xmm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	movq	(%rsp), %rdi                    # 8-byte Reload
	.p2align	4, 0x90
.LBB2_31:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movups	%xmm0, (%rdi,%rsi,4)
	movups	%xmm0, 16(%rdi,%rsi,4)
	movups	%xmm0, 32(%rdi,%rsi,4)
	movups	%xmm0, 48(%rdi,%rsi,4)
	movups	%xmm0, 64(%rdi,%rsi,4)
	movups	%xmm0, 80(%rdi,%rsi,4)
	movups	%xmm0, 96(%rdi,%rsi,4)
	movups	%xmm0, 112(%rdi,%rsi,4)
	movups	%xmm0, 128(%rdi,%rsi,4)
	movups	%xmm0, 144(%rdi,%rsi,4)
	movups	%xmm0, 160(%rdi,%rsi,4)
	movups	%xmm0, 176(%rdi,%rsi,4)
	movups	%xmm0, 192(%rdi,%rsi,4)
	movups	%xmm0, 208(%rdi,%rsi,4)
	movups	%xmm0, 224(%rdi,%rsi,4)
	movups	%xmm0, 240(%rdi,%rsi,4)
	addq	$64, %rsi
	addq	$8, %rdx
	jne	.LBB2_31
.LBB2_32:                               # %middle.block.unr-lcssa
	testq	%rcx, %rcx
	je	.LBB2_35
# %bb.33:                               # %vector.body.epil.preheader
	movq	(%rsp), %rdx                    # 8-byte Reload
	leaq	(%rdx,%rsi,4), %rdx
	addq	$16, %rdx
	shlq	$5, %rcx
	xorl	%esi, %esi
	movaps	.LCPI2_0(%rip), %xmm0           # xmm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_34:                               # %vector.body.epil
                                        # =>This Inner Loop Header: Depth=1
	movups	%xmm0, -16(%rdx,%rsi)
	movups	%xmm0, (%rdx,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %rcx
	jne	.LBB2_34
.LBB2_35:                               # %middle.block
	cmpq	%rbx, %rax
	movq	(%rsp), %rcx                    # 8-byte Reload
	je	.LBB2_37
	.p2align	4, 0x90
.LBB2_36:                               # %for.body77
                                        # =>This Inner Loop Header: Depth=1
	movl	$1065353216, (%rcx,%rax,4)      # imm = 0x3F800000
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.LBB2_36
.LBB2_37:                               # %for.end82
	leaq	64(%rsp), %rdi
	callq	ftime
	movq	%rbx, %r8
	xorps	%xmm0, %xmm0
	cvtsi2sdq	64(%rsp), %xmm0
	movzwl	72(%rsp), %eax
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI2_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 80(%rsp)                 # 8-byte Spill
	testl	%r8d, %r8d
	je	.LBB2_55
# %bb.38:                               # %for.body87.preheader
	movl	(%rbp), %esi
	xorl	%ebx, %ebx
	xorps	%xmm8, %xmm8
	movq	(%rsp), %r11                    # 8-byte Reload
	jmp	.LBB2_39
.LBB2_41:                               #   in Loop: Header=BB2_39 Depth=1
	xorpd	%xmm1, %xmm1
.LBB2_53:                               # %omp.inner.for.end
                                        #   in Loop: Header=BB2_39 Depth=1
	addss	%xmm8, %xmm1
.LBB2_54:                               # %simd.if.end
                                        #   in Loop: Header=BB2_39 Depth=1
	movss	%xmm1, (%r13,%rbx,4)
	movl	%r14d, %esi
	movq	%rdi, %rbx
	cmpq	%r8, %rdi
	je	.LBB2_55
.LBB2_39:                               # %for.body87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_45 Depth 2
                                        #     Child Loop BB2_52 Depth 2
	leaq	1(%rbx), %rdi
	movl	4(%rbp,%rbx,4), %r14d
	movl	%r14d, %eax
	xorpd	%xmm1, %xmm1
	subl	%esi, %eax
	jle	.LBB2_54
# %bb.40:                               # %omp.inner.for.cond.preheader
                                        #   in Loop: Header=BB2_39 Depth=1
	testl	%eax, %eax
	je	.LBB2_41
# %bb.42:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_39 Depth=1
	xorl	%r9d, %r9d
	xorpd	%xmm1, %xmm1
	cmpl	$8, %eax
	jb	.LBB2_47
# %bb.43:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_39 Depth=1
	leal	-1(%r14), %edx
	cmpl	%esi, %edx
	jl	.LBB2_47
# %bb.44:                               # %vector.ph325
                                        #   in Loop: Header=BB2_39 Depth=1
	movq	%rdi, 32(%rsp)                  # 8-byte Spill
	movq	%rbx, 8(%rsp)                   # 8-byte Spill
	movl	%eax, 16(%rsp)                  # 4-byte Spill
                                        # kill: def $eax killed $eax def $rax
	andl	$-8, %eax
	xorps	%xmm2, %xmm2
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	movl	%eax, %edi
	movl	%esi, %edx
	xorpd	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB2_45:                               # %vector.body321
                                        #   Parent Loop BB2_39 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%edx, %rdx
	movups	(%r12,%rdx,4), %xmm4
	movups	16(%r12,%rdx,4), %xmm9
	movdqu	(%r15,%rdx,4), %xmm5
	movdqu	16(%r15,%rdx,4), %xmm6
	pshufd	$238, %xmm5, %xmm7              # xmm7 = xmm5[2,3,2,3]
	xorpd	%xmm0, %xmm0
	pcmpgtd	%xmm7, %xmm0
	punpckldq	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
	pxor	%xmm0, %xmm0
	pcmpgtd	%xmm5, %xmm0
	punpckldq	%xmm0, %xmm5            # xmm5 = xmm5[0],xmm0[0],xmm5[1],xmm0[1]
	pshufd	$238, %xmm6, %xmm0              # xmm0 = xmm6[2,3,2,3]
	pxor	%xmm3, %xmm3
	pcmpgtd	%xmm0, %xmm3
	punpckldq	%xmm3, %xmm0            # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1]
	pxor	%xmm3, %xmm3
	pcmpgtd	%xmm6, %xmm3
	punpckldq	%xmm3, %xmm6            # xmm6 = xmm6[0],xmm3[0],xmm6[1],xmm3[1]
	movq	%xmm5, %rax
	pshufd	$238, %xmm5, %xmm3              # xmm3 = xmm5[2,3,2,3]
	movq	%xmm3, %rbp
	movq	%xmm7, %rcx
	pshufd	$238, %xmm7, %xmm3              # xmm3 = xmm7[2,3,2,3]
	movq	%xmm3, %rbx
	movq	%xmm6, %r13
	pshufd	$238, %xmm6, %xmm3              # xmm3 = xmm6[2,3,2,3]
	movq	%xmm3, %r8
	movq	%xmm0, %r9
	pshufd	$238, %xmm0, %xmm0              # xmm0 = xmm0[2,3,2,3]
	movq	%xmm0, %r10
	movss	(%r11,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	(%r11,%rbp,4), %xmm3            # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm3, %xmm0                    # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1]
	movss	(%r11,%rcx,4), %xmm3            # xmm3 = mem[0],zero,zero,zero
	movss	(%r11,%rbx,4), %xmm5            # xmm5 = mem[0],zero,zero,zero
	unpcklps	%xmm5, %xmm3                    # xmm3 = xmm3[0],xmm5[0],xmm3[1],xmm5[1]
	movlhps	%xmm3, %xmm0                    # xmm0 = xmm0[0],xmm3[0]
	mulps	%xmm4, %xmm0
	addps	%xmm0, %xmm2
	movss	(%r11,%r13,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	(%r11,%r8,4), %xmm3             # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm3, %xmm0                    # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1]
	movss	(%r11,%r9,4), %xmm3             # xmm3 = mem[0],zero,zero,zero
	movss	(%r11,%r10,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	unpcklps	%xmm4, %xmm3                    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	movlhps	%xmm3, %xmm0                    # xmm0 = xmm0[0],xmm3[0]
	mulps	%xmm9, %xmm0
	addps	%xmm0, %xmm1
	addl	$8, %edx
	addl	$-8, %edi
	jne	.LBB2_45
# %bb.46:                               # %middle.block319
                                        #   in Loop: Header=BB2_39 Depth=1
	addps	%xmm2, %xmm1
	movaps	%xmm1, %xmm0
	shufps	$85, %xmm1, %xmm0               # xmm0 = xmm0[1,1],xmm1[1,1]
	addss	%xmm1, %xmm0
	movaps	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm2                    # xmm2 = xmm2[1],xmm1[1]
	addss	%xmm0, %xmm2
	shufps	$255, %xmm1, %xmm1              # xmm1 = xmm1[3,3,3,3]
	addss	%xmm2, %xmm1
	movq	24(%rsp), %r9                   # 8-byte Reload
	movl	16(%rsp), %eax                  # 4-byte Reload
	cmpl	%r9d, %eax
	movq	56(%rsp), %rbp                  # 8-byte Reload
	movq	48(%rsp), %r8                   # 8-byte Reload
	movq	40(%rsp), %r13                  # 8-byte Reload
	movq	8(%rsp), %rbx                   # 8-byte Reload
	movq	32(%rsp), %rdi                  # 8-byte Reload
	je	.LBB2_53
.LBB2_47:                               # %omp.inner.for.body.preheader355
                                        #   in Loop: Header=BB2_39 Depth=1
	movl	%esi, %edx
	notl	%edx
	addl	%r14d, %edx
	testb	$1, %al
	jne	.LBB2_49
# %bb.48:                               #   in Loop: Header=BB2_39 Depth=1
	movl	%r9d, %eax
	jmp	.LBB2_50
.LBB2_49:                               # %omp.inner.for.body.prol
                                        #   in Loop: Header=BB2_39 Depth=1
	leal	(%r9,%rsi), %eax
	cltq
	movss	(%r12,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movslq	(%r15,%rax,4), %rax
	movq	(%rsp), %rcx                    # 8-byte Reload
	mulss	(%rcx,%rax,4), %xmm0
	addss	%xmm0, %xmm1
	movl	%r9d, %eax
	orl	$1, %eax
.LBB2_50:                               # %omp.inner.for.body.prol.loopexit
                                        #   in Loop: Header=BB2_39 Depth=1
	cmpl	%r9d, %edx
	movq	(%rsp), %rcx                    # 8-byte Reload
	je	.LBB2_53
# %bb.51:                               # %omp.inner.for.body.preheader372
                                        #   in Loop: Header=BB2_39 Depth=1
	addl	%eax, %esi
	.p2align	4, 0x90
.LBB2_52:                               # %omp.inner.for.body
                                        #   Parent Loop BB2_39 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%esi, %rsi
	movss	(%r12,%rsi,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movslq	(%r15,%rsi,4), %rax
	mulss	(%rcx,%rax,4), %xmm0
	addss	%xmm1, %xmm0
	leal	1(%rsi), %eax
	cltq
	movss	(%r12,%rax,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	movslq	(%r15,%rax,4), %rax
	mulss	(%rcx,%rax,4), %xmm1
	addss	%xmm0, %xmm1
	addl	$2, %esi
	cmpl	%esi, %r14d
	jne	.LBB2_52
	jmp	.LBB2_53
.LBB2_55:                               # %for.end129
	leaq	64(%rsp), %rdi
	movq	%r8, %rbx
	callq	ftime
	xorps	%xmm1, %xmm1
	cvtsi2sdq	64(%rsp), %xmm1
	movzwl	72(%rsp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	.LCPI2_1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	subsd	80(%rsp), %xmm0                 # 8-byte Folded Reload
	movl	$.L.str.3, %edi
	movb	$1, %al
	callq	printf
	movq	%rbx, %rdi
	testl	%edi, %edi
	je	.LBB2_56
# %bb.57:                               # %for.body136.preheader
	cmpl	$8, %edi
	jae	.LBB2_59
# %bb.58:
	xorl	%eax, %eax
	xorl	%esi, %esi
	jmp	.LBB2_66
.LBB2_56:
	xorl	%esi, %esi
	jmp	.LBB2_68
.LBB2_59:                               # %vector.ph340
	movl	%edi, %eax
	andl	$-8, %eax
	leaq	-8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$1, %rcx
	testq	%rdx, %rdx
	je	.LBB2_60
# %bb.61:                               # %vector.ph340.new
	movq	%rcx, %rsi
	andq	$-2, %rsi
	negq	%rsi
	xorps	%xmm2, %xmm2
	xorl	%edx, %edx
	xorpd	%xmm0, %xmm0
	xorpd	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB2_62:                               # %vector.body338
                                        # =>This Inner Loop Header: Depth=1
	movups	(%r13,%rdx,4), %xmm3
	movups	16(%r13,%rdx,4), %xmm4
	movups	32(%r13,%rdx,4), %xmm5
	movups	48(%r13,%rdx,4), %xmm6
	cmpltps	%xmm2, %xmm3
	psubd	%xmm3, %xmm0
	cmpltps	%xmm2, %xmm4
	psubd	%xmm4, %xmm1
	cmpltps	%xmm2, %xmm5
	psubd	%xmm5, %xmm0
	cmpltps	%xmm2, %xmm6
	psubd	%xmm6, %xmm1
	addq	$16, %rdx
	addq	$2, %rsi
	jne	.LBB2_62
# %bb.63:                               # %middle.block336.unr-lcssa
	testb	$1, %cl
	je	.LBB2_65
.LBB2_64:                               # %vector.body338.epil
	movups	(%r13,%rdx,4), %xmm2
	movups	16(%r13,%rdx,4), %xmm3
	xorps	%xmm4, %xmm4
	cmpltps	%xmm4, %xmm3
	psubd	%xmm3, %xmm1
	cmpltps	%xmm4, %xmm2
	psubd	%xmm2, %xmm0
.LBB2_65:                               # %middle.block336
	paddd	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	paddd	%xmm0, %xmm1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	paddd	%xmm1, %xmm0
	movd	%xmm0, %esi
	cmpq	%rdi, %rax
	je	.LBB2_68
.LBB2_66:                               # %for.body136.preheader354
	pxor	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_67:                               # %for.body136
                                        # =>This Inner Loop Header: Depth=1
	xorl	%ecx, %ecx
	ucomiss	(%r13,%rax,4), %xmm0
	seta	%cl
	addl	%ecx, %esi
	addq	$1, %rax
	cmpq	%rax, %rdi
	jne	.LBB2_67
.LBB2_68:                               # %for.end146
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%rbp, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	(%rsp), %rdi                    # 8-byte Reload
	callq	free
	movq	%r13, %rdi
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
.LBB2_60:
	.cfi_def_cfa_offset 144
	xorpd	%xmm0, %xmm0
	xorl	%edx, %edx
	xorpd	%xmm1, %xmm1
	testb	$1, %cl
	jne	.LBB2_64
	jmp	.LBB2_65
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
