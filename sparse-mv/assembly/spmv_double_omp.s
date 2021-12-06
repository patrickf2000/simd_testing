	.text
	.file	"spmv_double.c"
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
	shlq	$3, %r13
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
	movsd	(%r12,%rbx,8), %xmm0            # xmm0 = mem[0],zero
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
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
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
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	movl	%eax, %ebp
	imull	%ebp, %ebp
	leal	(%rbp,%rbp,4), %ebx
	leaq	(,%rbp,4), %rdi
	callq	malloc
	movq	%rax, %r14
	leaq	(,%rbx,4), %rdi
	callq	malloc
	movq	%rax, %r15
	shlq	$3, %rbx
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %r12
	leaq	(,%rbp,8), %r13
	movq	%r13, %rdi
	callq	malloc
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	%r13, %rdi
	callq	malloc
	movq	40(%rsp), %r9                   # 8-byte Reload
	testl	%r9d, %r9d
	movq	%rbp, 32(%rsp)                  # 8-byte Spill
	movq	%rax, %r8
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	movq	%r14, 16(%rsp)                  # 8-byte Spill
	jle	.LBB2_3
# %bb.4:                                # %for.cond18.preheader.lr.ph
	leal	-1(%r9), %eax
	leal	1(%r9), %ecx
	movq	%rcx, 80(%rsp)                  # 8-byte Spill
	movl	$1, %ecx
	subl	%r9d, %ecx
	movl	%ecx, 28(%rsp)                  # 4-byte Spill
	movq	%r14, %rcx
	addq	$4, %rcx
	movq	%rcx, 72(%rsp)                  # 8-byte Spill
	xorl	%ebp, %ebp
	movabsq	$-4616189618054758400, %rcx     # imm = 0xBFF0000000000000
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movq	(%rsp), %r13                    # 8-byte Reload
	jmp	.LBB2_5
	.p2align	4, 0x90
.LBB2_22:                               # %for.inc69.loopexit
                                        #   in Loop: Header=BB2_5 Depth=1
	movq	8(%rsp), %rsi                   # 8-byte Reload
	addq	%r14, %rsi
	movq	(%rsp), %r13                    # 8-byte Reload
	movq	48(%rsp), %r8                   # 8-byte Reload
	movq	40(%rsp), %r9                   # 8-byte Reload
.LBB2_23:                               # %for.inc69
                                        #   in Loop: Header=BB2_5 Depth=1
	addl	$1, %edx
	movl	%esi, %ebp
	cmpl	%r9d, %edx
	je	.LBB2_24
.LBB2_5:                                # %for.body21.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_14 Depth 2
	movslq	%ebp, %r10
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movl	%r11d, (%rsi,%r10,4)
	testl	%edx, %edx
	je	.LBB2_7
# %bb.6:                                # %if.then25.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movl	%ebp, %esi
	subl	%r9d, %esi
	movslq	%r11d, %rdi
	movl	%esi, (%r15,%rdi,4)
	movq	%rcx, (%r12,%rdi,8)
	addl	$1, %r11d
.LBB2_7:                                # %if.end40.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%r11), %esi
	movslq	%r11d, %rdi
	movl	%ebp, (%r15,%rdi,4)
	movabsq	$4616189618054758400, %rbx      # imm = 0x4010000000000000
	movq	%rbx, (%r12,%rdi,8)
	cmpl	$1, %r9d
	je	.LBB2_9
# %bb.8:                                # %if.then49.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%rbp), %edi
	movslq	%esi, %rsi
	movl	%edi, (%r15,%rsi,4)
	movq	%rcx, (%r12,%rsi,8)
	addl	$2, %r11d
	movl	%r11d, %esi
.LBB2_9:                                # %if.end55.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	cmpl	%eax, %edx
	jge	.LBB2_10
# %bb.11:                               # %if.then59.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	(%r9,%rbp), %edi
	movslq	%esi, %r11
	movl	%edi, (%r15,%r11,4)
	movq	%rcx, (%r12,%r11,8)
	addl	$1, %r11d
	jmp	.LBB2_12
	.p2align	4, 0x90
.LBB2_10:                               #   in Loop: Header=BB2_5 Depth=1
	movl	%esi, %r11d
.LBB2_12:                               # %if.end66.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leaq	1(%r10), %rsi
	cmpl	$1, %r9d
	je	.LBB2_23
# %bb.13:                               # %for.body21.preheader
                                        #   in Loop: Header=BB2_5 Depth=1
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
	movl	%ebp, %r8d
	movq	80(%rsp), %rsi                  # 8-byte Reload
	leal	(%rsi,%rbp), %r9d
	addl	28(%rsp), %ebp                  # 4-byte Folded Reload
	movq	72(%rsp), %rsi                  # 8-byte Reload
	leaq	(%rsi,%r10,4), %r10
	xorl	%r13d, %r13d
	movabsq	$4616189618054758400, %rbx      # imm = 0x4010000000000000
	jmp	.LBB2_14
	.p2align	4, 0x90
.LBB2_20:                               # %if.then59
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%esi, %r11
	addl	%r9d, %r13d
	movl	%r13d, (%r15,%r11,4)
	movq	%rcx, (%r12,%r11,8)
	addl	$1, %r11d
.LBB2_21:                               # %if.end66
                                        #   in Loop: Header=BB2_14 Depth=2
	movq	%r14, %r13
	cmpl	%r14d, %eax
	je	.LBB2_22
.LBB2_14:                               # %for.body21
                                        #   Parent Loop BB2_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	1(%r13), %r14
	movl	%r11d, (%r10,%r13,4)
	testl	%edx, %edx
	je	.LBB2_16
# %bb.15:                               # %if.then25
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r11d, %rsi
	leal	(%rbp,%r13), %edi
	movl	%edi, (%r15,%rsi,4)
	movq	%rcx, (%r12,%rsi,8)
	addl	$1, %r11d
.LBB2_16:                               # %if.end40
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r11d, %rsi
	leal	(%r8,%r13), %edi
	movl	%edi, (%r15,%rsi,4)
	movq	%rcx, (%r12,%rsi,8)
	leal	(%r8,%r13), %edi
	addl	$1, %edi
	movl	%edi, 4(%r15,%rsi,4)
	movq	%rbx, 8(%r12,%rsi,8)
	addl	$2, %esi
	cmpl	%eax, %r14d
	jge	.LBB2_18
# %bb.17:                               # %if.then49
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%esi, %rsi
	leal	(%r8,%r13), %edi
	addl	$2, %edi
	movl	%edi, (%r15,%rsi,4)
	movq	%rcx, (%r12,%rsi,8)
	addl	$3, %r11d
	movl	%r11d, %esi
.LBB2_18:                               # %if.end55
                                        #   in Loop: Header=BB2_14 Depth=2
	cmpl	%eax, %edx
	jl	.LBB2_20
# %bb.19:                               #   in Loop: Header=BB2_14 Depth=2
	movl	%esi, %r11d
	jmp	.LBB2_21
.LBB2_24:                               # %for.end71.loopexit
	movslq	%esi, %rax
	movq	32(%rsp), %rbp                  # 8-byte Reload
	movq	16(%rsp), %rcx                  # 8-byte Reload
	jmp	.LBB2_25
.LBB2_3:
	xorl	%r11d, %r11d
	xorl	%eax, %eax
	movq	%r14, %rcx
	movq	(%rsp), %r13                    # 8-byte Reload
.LBB2_25:                               # %for.end71
	movq	%r8, %rbx
	movq	%rcx, %r14
	movl	%r11d, (%rcx,%rax,4)
	testl	%ebp, %ebp
	je	.LBB2_38
# %bb.26:                               # %for.body77.preheader
	cmpl	$4, %ebp
	jae	.LBB2_28
# %bb.27:
	xorl	%eax, %eax
	jmp	.LBB2_36
.LBB2_28:                               # %vector.ph
	movl	%ebp, %eax
	andl	$-4, %eax
	leaq	-4(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$2, %rdx
	addq	$1, %rdx
	movl	%edx, %ecx
	andl	$7, %ecx
	cmpq	$28, %rsi
	jae	.LBB2_30
# %bb.29:
	xorl	%esi, %esi
	jmp	.LBB2_32
.LBB2_30:                               # %vector.ph.new
	andq	$-8, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movaps	.LCPI2_0(%rip), %xmm0           # xmm0 = [1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_31:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movups	%xmm0, (%r13,%rsi,8)
	movups	%xmm0, 16(%r13,%rsi,8)
	movups	%xmm0, 32(%r13,%rsi,8)
	movups	%xmm0, 48(%r13,%rsi,8)
	movups	%xmm0, 64(%r13,%rsi,8)
	movups	%xmm0, 80(%r13,%rsi,8)
	movups	%xmm0, 96(%r13,%rsi,8)
	movups	%xmm0, 112(%r13,%rsi,8)
	movups	%xmm0, 128(%r13,%rsi,8)
	movups	%xmm0, 144(%r13,%rsi,8)
	movups	%xmm0, 160(%r13,%rsi,8)
	movups	%xmm0, 176(%r13,%rsi,8)
	movups	%xmm0, 192(%r13,%rsi,8)
	movups	%xmm0, 208(%r13,%rsi,8)
	movups	%xmm0, 224(%r13,%rsi,8)
	movups	%xmm0, 240(%r13,%rsi,8)
	addq	$32, %rsi
	addq	$8, %rdx
	jne	.LBB2_31
.LBB2_32:                               # %middle.block.unr-lcssa
	testq	%rcx, %rcx
	je	.LBB2_35
# %bb.33:                               # %vector.body.epil.preheader
	leaq	16(,%rsi,8), %rdx
	addq	%r13, %rdx
	shlq	$5, %rcx
	xorl	%esi, %esi
	movaps	.LCPI2_0(%rip), %xmm0           # xmm0 = [1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_34:                               # %vector.body.epil
                                        # =>This Inner Loop Header: Depth=1
	movups	%xmm0, -16(%rdx,%rsi)
	movups	%xmm0, (%rdx,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %rcx
	jne	.LBB2_34
.LBB2_35:                               # %middle.block
	cmpq	%rbp, %rax
	je	.LBB2_38
.LBB2_36:                               # %for.body77.preheader356
	movabsq	$4607182418800017408, %rcx      # imm = 0x3FF0000000000000
	.p2align	4, 0x90
.LBB2_37:                               # %for.body77
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, (%r13,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rbp
	jne	.LBB2_37
.LBB2_38:                               # %for.end82
	leaq	56(%rsp), %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	56(%rsp), %xmm0
	movzwl	64(%rsp), %eax
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI2_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	testl	%ebp, %ebp
	movq	%r14, %rcx
	je	.LBB2_56
# %bb.39:                               # %for.body87.preheader
	movl	(%rcx), %esi
	xorl	%r10d, %r10d
	xorpd	%xmm0, %xmm0
	jmp	.LBB2_40
.LBB2_42:                               #   in Loop: Header=BB2_40 Depth=1
	xorpd	%xmm1, %xmm1
.LBB2_54:                               # %omp.inner.for.end
                                        #   in Loop: Header=BB2_40 Depth=1
	addsd	%xmm0, %xmm1
.LBB2_55:                               # %simd.if.end
                                        #   in Loop: Header=BB2_40 Depth=1
	movsd	%xmm1, (%rbx,%r10,8)
	movl	%r14d, %esi
	movq	%r9, %r10
	cmpq	%rbp, %r9
	je	.LBB2_56
.LBB2_40:                               # %for.body87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_46 Depth 2
                                        #     Child Loop BB2_53 Depth 2
	leaq	1(%r10), %r9
	movl	4(%rcx,%r10,4), %r14d
	movl	%r14d, %r11d
	xorpd	%xmm1, %xmm1
	subl	%esi, %r11d
	jle	.LBB2_55
# %bb.41:                               # %omp.inner.for.cond.preheader
                                        #   in Loop: Header=BB2_40 Depth=1
	testl	%r11d, %r11d
	je	.LBB2_42
# %bb.43:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_40 Depth=1
	xorl	%r8d, %r8d
	xorpd	%xmm1, %xmm1
	cmpl	$4, %r11d
	jb	.LBB2_48
# %bb.44:                               # %omp.inner.for.body.preheader
                                        #   in Loop: Header=BB2_40 Depth=1
	leal	-1(%r14), %edx
	cmpl	%esi, %edx
	jl	.LBB2_48
# %bb.45:                               # %vector.ph325
                                        #   in Loop: Header=BB2_40 Depth=1
	movl	%r11d, %r8d
	andl	$-4, %r8d
	xorpd	%xmm1, %xmm1
	movl	%r8d, %edi
	movl	%esi, %edx
	xorpd	%xmm2, %xmm2
	.p2align	4, 0x90
.LBB2_46:                               # %vector.body321
                                        #   Parent Loop BB2_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%edx, %rdx
	movupd	(%r12,%rdx,8), %xmm3
	movupd	16(%r12,%rdx,8), %xmm4
	movq	(%r15,%rdx,4), %xmm5            # xmm5 = mem[0],zero
	movq	8(%r15,%rdx,4), %xmm6           # xmm6 = mem[0],zero
	pxor	%xmm7, %xmm7
	pcmpgtd	%xmm5, %xmm7
	punpckldq	%xmm7, %xmm5            # xmm5 = xmm5[0],xmm7[0],xmm5[1],xmm7[1]
	pxor	%xmm7, %xmm7
	pcmpgtd	%xmm6, %xmm7
	punpckldq	%xmm7, %xmm6            # xmm6 = xmm6[0],xmm7[0],xmm6[1],xmm7[1]
	movq	%xmm5, %rax
	pshufd	$238, %xmm5, %xmm5              # xmm5 = xmm5[2,3,2,3]
	movq	%xmm5, %rbp
	movq	%xmm6, %rcx
	pshufd	$238, %xmm6, %xmm5              # xmm5 = xmm6[2,3,2,3]
	movq	%xmm5, %rbx
	movsd	(%r13,%rax,8), %xmm5            # xmm5 = mem[0],zero
	movhpd	(%r13,%rbp,8), %xmm5            # xmm5 = xmm5[0],mem[0]
	mulpd	%xmm3, %xmm5
	addpd	%xmm5, %xmm1
	movsd	(%r13,%rcx,8), %xmm3            # xmm3 = mem[0],zero
	movhpd	(%r13,%rbx,8), %xmm3            # xmm3 = xmm3[0],mem[0]
	mulpd	%xmm4, %xmm3
	addpd	%xmm3, %xmm2
	addl	$4, %edx
	addl	$-4, %edi
	jne	.LBB2_46
# %bb.47:                               # %middle.block319
                                        #   in Loop: Header=BB2_40 Depth=1
	addpd	%xmm1, %xmm2
	movapd	%xmm2, %xmm1
	unpckhpd	%xmm2, %xmm1                    # xmm1 = xmm1[1],xmm2[1]
	addsd	%xmm2, %xmm1
	cmpl	%r8d, %r11d
	movq	16(%rsp), %rcx                  # 8-byte Reload
	movq	32(%rsp), %rbp                  # 8-byte Reload
	movq	48(%rsp), %rbx                  # 8-byte Reload
	je	.LBB2_54
.LBB2_48:                               # %omp.inner.for.body.preheader355
                                        #   in Loop: Header=BB2_40 Depth=1
	movl	%esi, %edx
	notl	%edx
	addl	%r14d, %edx
	testb	$1, %r11b
	jne	.LBB2_50
# %bb.49:                               #   in Loop: Header=BB2_40 Depth=1
	movl	%r8d, %edi
	cmpl	%r8d, %edx
	je	.LBB2_54
	jmp	.LBB2_52
.LBB2_50:                               # %omp.inner.for.body.prol
                                        #   in Loop: Header=BB2_40 Depth=1
	leal	(%r8,%rsi), %eax
	cltq
	movsd	(%r12,%rax,8), %xmm2            # xmm2 = mem[0],zero
	movslq	(%r15,%rax,4), %rax
	mulsd	(%r13,%rax,8), %xmm2
	addsd	%xmm2, %xmm1
	movl	%r8d, %edi
	orl	$1, %edi
	cmpl	%r8d, %edx
	je	.LBB2_54
.LBB2_52:                               # %omp.inner.for.body.preheader372
                                        #   in Loop: Header=BB2_40 Depth=1
	addl	%edi, %esi
	.p2align	4, 0x90
.LBB2_53:                               # %omp.inner.for.body
                                        #   Parent Loop BB2_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%esi, %rsi
	movsd	(%r12,%rsi,8), %xmm2            # xmm2 = mem[0],zero
	movslq	(%r15,%rsi,4), %rax
	mulsd	(%r13,%rax,8), %xmm2
	addsd	%xmm1, %xmm2
	leal	1(%rsi), %eax
	cltq
	movsd	(%r12,%rax,8), %xmm1            # xmm1 = mem[0],zero
	movslq	(%r15,%rax,4), %rax
	mulsd	(%r13,%rax,8), %xmm1
	addsd	%xmm2, %xmm1
	addl	$2, %esi
	cmpl	%esi, %r14d
	jne	.LBB2_53
	jmp	.LBB2_54
.LBB2_56:                               # %for.end129
	movq	%rcx, %r14
	leaq	56(%rsp), %rdi
	callq	ftime
	xorps	%xmm1, %xmm1
	cvtsi2sdq	56(%rsp), %xmm1
	movzwl	64(%rsp), %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	.LCPI2_1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	subsd	8(%rsp), %xmm0                  # 8-byte Folded Reload
	movl	$.L.str.3, %edi
	movb	$1, %al
	callq	printf
	testl	%ebp, %ebp
	je	.LBB2_57
# %bb.58:                               # %for.body136.preheader
	cmpl	$4, %ebp
	jae	.LBB2_60
# %bb.59:
	xorl	%eax, %eax
	xorl	%esi, %esi
	jmp	.LBB2_67
.LBB2_57:
	xorl	%esi, %esi
	jmp	.LBB2_69
.LBB2_60:                               # %vector.ph340
	movl	%ebp, %eax
	andl	$-4, %eax
	leaq	-4(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$2, %rcx
	addq	$1, %rcx
	testq	%rdx, %rdx
	je	.LBB2_61
# %bb.62:                               # %vector.ph340.new
	movq	%rcx, %rsi
	andq	$-2, %rsi
	negq	%rsi
	xorpd	%xmm2, %xmm2
	xorl	%edx, %edx
	xorpd	%xmm0, %xmm0
	xorpd	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB2_63:                               # %vector.body338
                                        # =>This Inner Loop Header: Depth=1
	movupd	(%rbx,%rdx,8), %xmm3
	movupd	16(%rbx,%rdx,8), %xmm4
	movupd	32(%rbx,%rdx,8), %xmm5
	movupd	48(%rbx,%rdx,8), %xmm6
	cmpltpd	%xmm2, %xmm3
	shufps	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	psubd	%xmm3, %xmm0
	cmpltpd	%xmm2, %xmm4
	shufps	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	psubd	%xmm4, %xmm1
	cmpltpd	%xmm2, %xmm5
	shufps	$232, %xmm5, %xmm5              # xmm5 = xmm5[0,2,2,3]
	psubd	%xmm5, %xmm0
	cmpltpd	%xmm2, %xmm6
	shufps	$232, %xmm6, %xmm6              # xmm6 = xmm6[0,2,2,3]
	psubd	%xmm6, %xmm1
	addq	$8, %rdx
	addq	$2, %rsi
	jne	.LBB2_63
# %bb.64:                               # %middle.block336.unr-lcssa
	testb	$1, %cl
	je	.LBB2_66
.LBB2_65:                               # %vector.body338.epil
	movupd	(%rbx,%rdx,8), %xmm2
	movupd	16(%rbx,%rdx,8), %xmm3
	xorpd	%xmm4, %xmm4
	cmpltpd	%xmm4, %xmm3
	shufps	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	psubd	%xmm3, %xmm1
	cmpltpd	%xmm4, %xmm2
	shufps	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	psubd	%xmm2, %xmm0
.LBB2_66:                               # %middle.block336
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %esi
	cmpq	%rbp, %rax
	je	.LBB2_69
.LBB2_67:                               # %for.body136.preheader354
	pxor	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_68:                               # %for.body136
                                        # =>This Inner Loop Header: Depth=1
	xorl	%ecx, %ecx
	ucomisd	(%rbx,%rax,8), %xmm0
	seta	%cl
	addl	%ecx, %esi
	addq	$1, %rax
	cmpq	%rax, %rbp
	jne	.LBB2_68
.LBB2_69:                               # %for.end146
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
	movq	%rbx, %rdi
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
.LBB2_61:
	.cfi_def_cfa_offset 144
	xorpd	%xmm0, %xmm0
	xorl	%edx, %edx
	xorpd	%xmm1, %xmm1
	testb	$1, %cl
	jne	.LBB2_65
	jmp	.LBB2_66
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
