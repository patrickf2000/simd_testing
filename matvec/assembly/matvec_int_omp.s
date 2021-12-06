	.text
	.file	"matvec_int.c"
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
	.globl	init                            # -- Begin function init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r12
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_2:                                # %for.body4
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, (%r12,%rbx,4)
	addq	$1, %rbx
	cmpq	$10240, %rbx                    # imm = 0x2800
	jne	.LBB1_2
# %bb.3:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB1_1 Depth=1
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, (%r14,%r15,4)
	addq	$1, %r15
	addq	$40960, %r12                    # imm = 0xA000
	cmpq	$10240, %r15                    # imm = 0x2800
	jne	.LBB1_1
# %bb.4:                                # %for.cond.cleanup
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        # -- End function
	.globl	matvec_simd                     # -- Begin function matvec_simd
	.p2align	4, 0x90
	.type	matvec_simd,@function
matvec_simd:                            # @matvec_simd
	.cfi_startproc
# %bb.0:                                # %entry
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_1:                                # %omp.inner.for.cond.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	pxor	%xmm0, %xmm0
	movl	$12, %ecx
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB2_2:                                # %vector.body
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	-48(%rdi,%rcx,4), %xmm5
	movdqu	-32(%rdi,%rcx,4), %xmm10
	movdqu	-16(%rdi,%rcx,4), %xmm9
	movdqu	(%rdi,%rcx,4), %xmm8
	movdqu	-48(%rsi,%rcx,4), %xmm7
	movdqu	-32(%rsi,%rcx,4), %xmm2
	movdqu	-16(%rsi,%rcx,4), %xmm4
	movdqu	(%rsi,%rcx,4), %xmm3
	pshufd	$245, %xmm7, %xmm6              # xmm6 = xmm7[1,1,3,3]
	pmuludq	%xmm5, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	pshufd	$245, %xmm5, %xmm5              # xmm5 = xmm5[1,1,3,3]
	pmuludq	%xmm6, %xmm5
	pshufd	$232, %xmm5, %xmm5              # xmm5 = xmm5[0,2,2,3]
	punpckldq	%xmm5, %xmm7            # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1]
	paddd	%xmm0, %xmm7
	pshufd	$245, %xmm2, %xmm0              # xmm0 = xmm2[1,1,3,3]
	pmuludq	%xmm10, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm10, %xmm5             # xmm5 = xmm10[1,1,3,3]
	pmuludq	%xmm0, %xmm5
	pshufd	$232, %xmm5, %xmm0              # xmm0 = xmm5[0,2,2,3]
	punpckldq	%xmm0, %xmm2            # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	pshufd	$245, %xmm4, %xmm1              # xmm1 = xmm4[1,1,3,3]
	pmuludq	%xmm9, %xmm4
	pshufd	$232, %xmm4, %xmm0              # xmm0 = xmm4[0,2,2,3]
	pshufd	$245, %xmm9, %xmm4              # xmm4 = xmm9[1,1,3,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm1              # xmm1 = xmm4[0,2,2,3]
	punpckldq	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	paddd	%xmm7, %xmm0
	pshufd	$245, %xmm3, %xmm4              # xmm4 = xmm3[1,1,3,3]
	pmuludq	%xmm8, %xmm3
	pshufd	$232, %xmm3, %xmm1              # xmm1 = xmm3[0,2,2,3]
	pshufd	$245, %xmm8, %xmm3              # xmm3 = xmm8[1,1,3,3]
	pmuludq	%xmm4, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm1            # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	paddd	%xmm2, %xmm1
	addq	$16, %rcx
	cmpq	$10252, %rcx                    # imm = 0x280C
	jne	.LBB2_2
# %bb.3:                                # %middle.block
                                        #   in Loop: Header=BB2_1 Depth=1
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, (%rdx,%rax,4)
	addq	$1, %rax
	addq	$40960, %rdi                    # imm = 0xA000
	cmpq	$10240, %rax                    # imm = 0x2800
	jne	.LBB2_1
# %bb.4:                                # %for.cond.cleanup
	retq
.Lfunc_end2:
	.size	matvec_simd, .Lfunc_end2-matvec_simd
	.cfi_endproc
                                        # -- End function
	.globl	matvec_serial                   # -- Begin function matvec_serial
	.p2align	4, 0x90
	.type	matvec_serial,@function
matvec_serial:                          # @matvec_serial
	.cfi_startproc
# %bb.0:                                # %entry
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB3_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	pxor	%xmm0, %xmm0
	movl	$12, %ecx
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB3_2:                                # %vector.body
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	-48(%rdi,%rcx,4), %xmm5
	movdqu	-32(%rdi,%rcx,4), %xmm10
	movdqu	-16(%rdi,%rcx,4), %xmm9
	movdqu	(%rdi,%rcx,4), %xmm8
	movdqu	-48(%rsi,%rcx,4), %xmm7
	movdqu	-32(%rsi,%rcx,4), %xmm2
	movdqu	-16(%rsi,%rcx,4), %xmm4
	movdqu	(%rsi,%rcx,4), %xmm3
	pshufd	$245, %xmm7, %xmm6              # xmm6 = xmm7[1,1,3,3]
	pmuludq	%xmm5, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	pshufd	$245, %xmm5, %xmm5              # xmm5 = xmm5[1,1,3,3]
	pmuludq	%xmm6, %xmm5
	pshufd	$232, %xmm5, %xmm5              # xmm5 = xmm5[0,2,2,3]
	punpckldq	%xmm5, %xmm7            # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1]
	paddd	%xmm0, %xmm7
	pshufd	$245, %xmm2, %xmm0              # xmm0 = xmm2[1,1,3,3]
	pmuludq	%xmm10, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm10, %xmm5             # xmm5 = xmm10[1,1,3,3]
	pmuludq	%xmm0, %xmm5
	pshufd	$232, %xmm5, %xmm0              # xmm0 = xmm5[0,2,2,3]
	punpckldq	%xmm0, %xmm2            # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	pshufd	$245, %xmm4, %xmm1              # xmm1 = xmm4[1,1,3,3]
	pmuludq	%xmm9, %xmm4
	pshufd	$232, %xmm4, %xmm0              # xmm0 = xmm4[0,2,2,3]
	pshufd	$245, %xmm9, %xmm4              # xmm4 = xmm9[1,1,3,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm1              # xmm1 = xmm4[0,2,2,3]
	punpckldq	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	paddd	%xmm7, %xmm0
	pshufd	$245, %xmm3, %xmm4              # xmm4 = xmm3[1,1,3,3]
	pmuludq	%xmm8, %xmm3
	pshufd	$232, %xmm3, %xmm1              # xmm1 = xmm3[0,2,2,3]
	pshufd	$245, %xmm8, %xmm3              # xmm3 = xmm8[1,1,3,3]
	pmuludq	%xmm4, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm1            # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	paddd	%xmm2, %xmm1
	addq	$16, %rcx
	cmpq	$10252, %rcx                    # imm = 0x280C
	jne	.LBB3_2
# %bb.3:                                # %middle.block
                                        #   in Loop: Header=BB3_1 Depth=1
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, (%rdx,%rax,4)
	addq	$1, %rax
	addq	$40960, %rdi                    # imm = 0xA000
	cmpq	$10240, %rax                    # imm = 0x2800
	jne	.LBB3_1
# %bb.4:                                # %for.cond.cleanup
	retq
.Lfunc_end3:
	.size	matvec_serial, .Lfunc_end3-matvec_serial
	.cfi_endproc
                                        # -- End function
	.globl	print_matrix                    # -- Begin function print_matrix
	.p2align	4, 0x90
	.type	print_matrix,@function
print_matrix:                           # @print_matrix
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	movl	$28, %ebx
	.p2align	4, 0x90
.LBB4_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$91, %edi
	callq	putchar@PLT
	movl	-28(%r14,%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-24(%r14,%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-20(%r14,%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-16(%r14,%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-12(%r14,%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-8(%r14,%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-4(%r14,%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	(%r14,%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.2, %edi
	callq	puts
	addq	$40960, %rbx                    # imm = 0xA000
	cmpq	$327708, %rbx                   # imm = 0x5001C
	jne	.LBB4_1
# %bb.2:                                # %for.cond.cleanup
	movl	$10, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT                     # TAILCALL
.Lfunc_end4:
	.size	print_matrix, .Lfunc_end4-print_matrix
	.cfi_endproc
                                        # -- End function
	.globl	print_vector                    # -- Begin function print_vector
	.p2align	4, 0x90
	.type	print_vector,@function
print_vector:                           # @print_vector
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$91, %edi
	callq	putchar@PLT
	movl	(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	4(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	8(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	12(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	16(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	20(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	24(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	28(%rbx), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.2, %edi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	puts                            # TAILCALL
.Lfunc_end5:
	.size	print_vector, .Lfunc_end5-print_vector
	.cfi_endproc
                                        # -- End function
	.globl	check                           # -- Begin function check
	.p2align	4, 0x90
	.type	check,@function
check:                                  # @check
	.cfi_startproc
# %bb.0:                                # %entry
	pxor	%xmm0, %xmm0
	movl	$4, %eax
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB6_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-16(%rdi,%rax,4), %xmm2
	movdqu	(%rdi,%rax,4), %xmm3
	movdqu	-16(%rsi,%rax,4), %xmm4
	psubd	%xmm4, %xmm2
	movdqu	(%rsi,%rax,4), %xmm4
	psubd	%xmm4, %xmm3
	movdqa	%xmm2, %xmm4
	psrad	$31, %xmm4
	paddd	%xmm4, %xmm2
	pxor	%xmm4, %xmm2
	paddd	%xmm2, %xmm0
	movdqa	%xmm3, %xmm2
	psrad	$31, %xmm2
	paddd	%xmm2, %xmm3
	pxor	%xmm2, %xmm3
	paddd	%xmm3, %xmm1
	addq	$8, %rax
	cmpq	$10244, %rax                    # imm = 0x2804
	jne	.LBB6_1
# %bb.2:                                # %middle.block
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
	retq
.Lfunc_end6:
	.size	check, .Lfunc_end6-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI7_0:
	.quad	0x408f400000000000              # double 1000
.LCPI7_1:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI7_2:
	.quad	0x41ef400000000000              # double 4194304000
.LCPI7_3:
	.quad	0x4034000000000000              # double 20
.LCPI7_4:
	.quad	0x0000000000000000              # double 0
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$81920, %edi                    # imm = 0x14000
	callq	malloc
	movq	%rax, %r12
	movl	$81920, %edi                    # imm = 0x14000
	callq	malloc
	movq	%rax, %r14
	movl	$838860800, %edi                # imm = 0x32000000
	callq	malloc
	movq	%rax, %rbp
	movl	$40960, %edi                    # imm = 0xA000
	callq	malloc
	movq	%rax, %rbx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	movq	%rbp, 48(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB7_1:                                # %for.cond1.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_2 Depth 2
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB7_2:                                # %for.body4.i
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, (%rbp,%r15,4)
	addq	$1, %r15
	cmpq	$10240, %r15                    # imm = 0x2800
	jne	.LBB7_2
# %bb.3:                                # %for.cond.cleanup3.i
                                        #   in Loop: Header=BB7_1 Depth=1
	callq	rand
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movl	%eax, (%rbx,%r13,4)
	addq	$1, %r13
	addq	$40960, %rbp                    # imm = 0xA000
	cmpq	$10240, %r13                    # imm = 0x2800
	jne	.LBB7_1
# %bb.4:                                # %omp.inner.for.cond.preheader.i.preheader
	xorl	%eax, %eax
	movq	48(%rsp), %rbp                  # 8-byte Reload
	movq	%rbp, %rcx
	.p2align	4, 0x90
.LBB7_5:                                # %omp.inner.for.cond.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_6 Depth 2
	pxor	%xmm0, %xmm0
	movl	$12, %edx
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB7_6:                                # %vector.body
                                        #   Parent Loop BB7_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	-48(%rcx,%rdx,4), %xmm5
	movdqu	-32(%rcx,%rdx,4), %xmm10
	movdqu	-16(%rcx,%rdx,4), %xmm9
	movdqu	(%rcx,%rdx,4), %xmm8
	movdqu	-48(%rbx,%rdx,4), %xmm7
	movdqu	-32(%rbx,%rdx,4), %xmm2
	movdqu	-16(%rbx,%rdx,4), %xmm4
	movdqu	(%rbx,%rdx,4), %xmm3
	pshufd	$245, %xmm7, %xmm6              # xmm6 = xmm7[1,1,3,3]
	pmuludq	%xmm5, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	pshufd	$245, %xmm5, %xmm5              # xmm5 = xmm5[1,1,3,3]
	pmuludq	%xmm6, %xmm5
	pshufd	$232, %xmm5, %xmm5              # xmm5 = xmm5[0,2,2,3]
	punpckldq	%xmm5, %xmm7            # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1]
	paddd	%xmm0, %xmm7
	pshufd	$245, %xmm2, %xmm0              # xmm0 = xmm2[1,1,3,3]
	pmuludq	%xmm10, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm10, %xmm5             # xmm5 = xmm10[1,1,3,3]
	pmuludq	%xmm0, %xmm5
	pshufd	$232, %xmm5, %xmm0              # xmm0 = xmm5[0,2,2,3]
	punpckldq	%xmm0, %xmm2            # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	pshufd	$245, %xmm4, %xmm1              # xmm1 = xmm4[1,1,3,3]
	pmuludq	%xmm9, %xmm4
	pshufd	$232, %xmm4, %xmm0              # xmm0 = xmm4[0,2,2,3]
	pshufd	$245, %xmm9, %xmm4              # xmm4 = xmm9[1,1,3,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm1              # xmm1 = xmm4[0,2,2,3]
	punpckldq	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	paddd	%xmm7, %xmm0
	pshufd	$245, %xmm3, %xmm4              # xmm4 = xmm3[1,1,3,3]
	pmuludq	%xmm8, %xmm3
	pshufd	$232, %xmm3, %xmm1              # xmm1 = xmm3[0,2,2,3]
	pshufd	$245, %xmm8, %xmm3              # xmm3 = xmm8[1,1,3,3]
	pmuludq	%xmm4, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm1            # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	paddd	%xmm2, %xmm1
	addq	$16, %rdx
	cmpq	$10252, %rdx                    # imm = 0x280C
	jne	.LBB7_6
# %bb.7:                                # %middle.block
                                        #   in Loop: Header=BB7_5 Depth=1
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, (%r12,%rax,4)
	addq	$1, %rax
	addq	$40960, %rcx                    # imm = 0xA000
	cmpq	$10240, %rax                    # imm = 0x2800
	jne	.LBB7_5
# %bb.8:                                # %matvec_simd.exit
	leaq	8(%rsp), %rdi
	callq	ftime
	movzwl	16(%rsp), %eax
	cvtsi2sd	%eax, %xmm11
	movq	8(%rsp), %rax
	divsd	.LCPI7_0(%rip), %xmm11
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_9:                                # %omp.inner.for.cond.preheader.i94.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_10 Depth 2
                                        #       Child Loop BB7_11 Depth 3
	movq	%rbp, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB7_10:                               # %omp.inner.for.cond.preheader.i94
                                        #   Parent Loop BB7_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_11 Depth 3
	pxor	%xmm0, %xmm0
	movl	$12, %edi
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB7_11:                               # %vector.body138
                                        #   Parent Loop BB7_9 Depth=1
                                        #     Parent Loop BB7_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movdqu	-48(%rdx,%rdi,4), %xmm5
	movdqu	-32(%rdx,%rdi,4), %xmm10
	movdqu	-16(%rdx,%rdi,4), %xmm9
	movdqu	(%rdx,%rdi,4), %xmm8
	movdqu	-48(%rbx,%rdi,4), %xmm7
	movdqu	-32(%rbx,%rdi,4), %xmm2
	movdqu	-16(%rbx,%rdi,4), %xmm4
	movdqu	(%rbx,%rdi,4), %xmm3
	pshufd	$245, %xmm7, %xmm6              # xmm6 = xmm7[1,1,3,3]
	pmuludq	%xmm5, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	pshufd	$245, %xmm5, %xmm5              # xmm5 = xmm5[1,1,3,3]
	pmuludq	%xmm6, %xmm5
	pshufd	$232, %xmm5, %xmm5              # xmm5 = xmm5[0,2,2,3]
	punpckldq	%xmm5, %xmm7            # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1]
	paddd	%xmm0, %xmm7
	pshufd	$245, %xmm2, %xmm0              # xmm0 = xmm2[1,1,3,3]
	pmuludq	%xmm10, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm10, %xmm5             # xmm5 = xmm10[1,1,3,3]
	pmuludq	%xmm0, %xmm5
	pshufd	$232, %xmm5, %xmm0              # xmm0 = xmm5[0,2,2,3]
	punpckldq	%xmm0, %xmm2            # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	pshufd	$245, %xmm4, %xmm1              # xmm1 = xmm4[1,1,3,3]
	pmuludq	%xmm9, %xmm4
	pshufd	$232, %xmm4, %xmm0              # xmm0 = xmm4[0,2,2,3]
	pshufd	$245, %xmm9, %xmm4              # xmm4 = xmm9[1,1,3,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm1              # xmm1 = xmm4[0,2,2,3]
	punpckldq	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	paddd	%xmm7, %xmm0
	pshufd	$245, %xmm3, %xmm4              # xmm4 = xmm3[1,1,3,3]
	pmuludq	%xmm8, %xmm3
	pshufd	$232, %xmm3, %xmm1              # xmm1 = xmm3[0,2,2,3]
	pshufd	$245, %xmm8, %xmm3              # xmm3 = xmm8[1,1,3,3]
	pmuludq	%xmm4, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm1            # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	paddd	%xmm2, %xmm1
	addq	$16, %rdi
	cmpq	$10252, %rdi                    # imm = 0x280C
	jne	.LBB7_11
# %bb.12:                               # %middle.block136
                                        #   in Loop: Header=BB7_10 Depth=2
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, (%r12,%rsi,4)
	addq	$1, %rsi
	addq	$40960, %rdx                    # imm = 0xA000
	cmpq	$10240, %rsi                    # imm = 0x2800
	jne	.LBB7_10
# %bb.13:                               # %matvec_simd.exit108
                                        #   in Loop: Header=BB7_9 Depth=1
	addl	$1, %ecx
	cmpl	$20, %ecx
	jne	.LBB7_9
# %bb.14:                               # %for.cond.cleanup
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rax, %xmm0
	addsd	%xmm0, %xmm11
	movsd	%xmm11, (%rsp)                  # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	8(%rsp), %xmm0
	movzwl	16(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI7_0(%rip), %xmm1
	addsd	%xmm0, %xmm1
	subsd	(%rsp), %xmm1                   # 8-byte Folded Reload
	movsd	%xmm1, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %rax
	movzwl	16(%rsp), %ecx
	xorps	%xmm11, %xmm11
	cvtsi2sd	%ecx, %xmm11
	divsd	.LCPI7_0(%rip), %xmm11
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_15:                               # %for.cond1.preheader.i109.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_16 Depth 2
                                        #       Child Loop BB7_17 Depth 3
	movq	%rbp, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB7_16:                               # %for.cond1.preheader.i109
                                        #   Parent Loop BB7_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_17 Depth 3
	xorpd	%xmm0, %xmm0
	movl	$12, %edi
	xorpd	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB7_17:                               # %vector.body154
                                        #   Parent Loop BB7_15 Depth=1
                                        #     Parent Loop BB7_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movdqu	-48(%rdx,%rdi,4), %xmm5
	movdqu	-32(%rdx,%rdi,4), %xmm10
	movdqu	-16(%rdx,%rdi,4), %xmm9
	movdqu	(%rdx,%rdi,4), %xmm8
	movdqu	-48(%rbx,%rdi,4), %xmm7
	movdqu	-32(%rbx,%rdi,4), %xmm2
	movdqu	-16(%rbx,%rdi,4), %xmm4
	movdqu	(%rbx,%rdi,4), %xmm3
	pshufd	$245, %xmm7, %xmm6              # xmm6 = xmm7[1,1,3,3]
	pmuludq	%xmm5, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	pshufd	$245, %xmm5, %xmm5              # xmm5 = xmm5[1,1,3,3]
	pmuludq	%xmm6, %xmm5
	pshufd	$232, %xmm5, %xmm5              # xmm5 = xmm5[0,2,2,3]
	punpckldq	%xmm5, %xmm7            # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1]
	paddd	%xmm0, %xmm7
	pshufd	$245, %xmm2, %xmm0              # xmm0 = xmm2[1,1,3,3]
	pmuludq	%xmm10, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm10, %xmm5             # xmm5 = xmm10[1,1,3,3]
	pmuludq	%xmm0, %xmm5
	pshufd	$232, %xmm5, %xmm0              # xmm0 = xmm5[0,2,2,3]
	punpckldq	%xmm0, %xmm2            # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	pshufd	$245, %xmm4, %xmm1              # xmm1 = xmm4[1,1,3,3]
	pmuludq	%xmm9, %xmm4
	pshufd	$232, %xmm4, %xmm0              # xmm0 = xmm4[0,2,2,3]
	pshufd	$245, %xmm9, %xmm4              # xmm4 = xmm9[1,1,3,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm1              # xmm1 = xmm4[0,2,2,3]
	punpckldq	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	paddd	%xmm7, %xmm0
	pshufd	$245, %xmm3, %xmm4              # xmm4 = xmm3[1,1,3,3]
	pmuludq	%xmm8, %xmm3
	pshufd	$232, %xmm3, %xmm1              # xmm1 = xmm3[0,2,2,3]
	pshufd	$245, %xmm8, %xmm3              # xmm3 = xmm8[1,1,3,3]
	pmuludq	%xmm4, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm1            # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	paddd	%xmm2, %xmm1
	addq	$16, %rdi
	cmpq	$10252, %rdi                    # imm = 0x280C
	jne	.LBB7_17
# %bb.18:                               # %middle.block152
                                        #   in Loop: Header=BB7_16 Depth=2
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, (%r14,%rsi,4)
	addq	$1, %rsi
	addq	$40960, %rdx                    # imm = 0xA000
	cmpq	$10240, %rsi                    # imm = 0x2800
	jne	.LBB7_16
# %bb.19:                               # %matvec_serial.exit
                                        #   in Loop: Header=BB7_15 Depth=1
	addl	$1, %ecx
	cmpl	$20, %ecx
	jne	.LBB7_15
# %bb.20:                               # %for.cond.cleanup13
	xorpd	%xmm1, %xmm1
	movsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)                   # 8-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rax, %xmm0
	addsd	%xmm0, %xmm11
	movsd	%xmm11, 24(%rsp)                # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	8(%rsp), %xmm0
	movzwl	16(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI7_0(%rip), %xmm1
	addsd	%xmm0, %xmm1
	subsd	24(%rsp), %xmm1                 # 8-byte Folded Reload
	addsd	.LCPI7_4, %xmm1
	movsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	movq	%rbp, %rdi
	callq	print_matrix
	movq	%rbx, %rdi
	callq	print_vector
	movl	$.L.str.4, %edi
	callq	puts
	movq	%r12, %rdi
	callq	print_vector
	movl	$.L.str.5, %edi
	callq	puts
	movq	%r14, %rdi
	callq	print_vector
	movsd	.LCPI7_1(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movsd	.LCPI7_2(%rip), %xmm2           # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm3
	divsd	%xmm1, %xmm3
	movsd	%xmm3, 32(%rsp)                 # 8-byte Spill
	mulsd	24(%rsp), %xmm0                 # 8-byte Folded Reload
	divsd	%xmm0, %xmm2
	movsd	%xmm2, 40(%rsp)                 # 8-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	movl	$.Lstr.12, %edi
	callq	puts
	movl	$.Lstr.13, %edi
	callq	puts
	movsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	.LCPI7_3(%rip), %xmm0
	movl	$.L.str.9, %edi
	movsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	movsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	.LCPI7_3(%rip), %xmm0
	movl	$.L.str.10, %edi
	movq	40(%rsp), %xmm1                 # 8-byte Folded Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	xorpd	%xmm0, %xmm0
	movl	$4, %eax
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB7_21:                               # %vector.body170
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-16(%r12,%rax,4), %xmm2
	movdqu	(%r12,%rax,4), %xmm3
	movdqu	-16(%r14,%rax,4), %xmm4
	psubd	%xmm4, %xmm2
	movdqu	(%r14,%rax,4), %xmm4
	psubd	%xmm4, %xmm3
	movdqa	%xmm2, %xmm4
	psrad	$31, %xmm4
	paddd	%xmm4, %xmm2
	pxor	%xmm4, %xmm2
	paddd	%xmm2, %xmm0
	movdqa	%xmm3, %xmm2
	psrad	$31, %xmm2
	paddd	%xmm2, %xmm3
	pxor	%xmm2, %xmm3
	paddd	%xmm3, %xmm1
	addq	$8, %rax
	cmpq	$10244, %rax                    # imm = 0x2804
	jne	.LBB7_21
# %bb.22:                               # %middle.block168
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %esi
	movl	$.L.str.11, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%r12, %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$56, %rsp
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
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"%d "
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"]"
	.size	.L.str.2, 2

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"=\n"
	.size	.L.str.4, 3

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"Matrix-vector (SIMD):\t\t%4f\t%4f\n"
	.size	.L.str.9, 32

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"Matrix-vector (Serial):\t\t%4f\t%4f\n"
	.size	.L.str.10, 34

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"Correctness check: %d\n"
	.size	.L.str.11, 23

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"=================================================================="
	.size	.Lstr, 67

	.type	.Lstr.12,@object                # @str.12
.Lstr.12:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.12, 35

	.type	.Lstr.13,@object                # @str.13
.Lstr.13:
	.asciz	"------------------------------------------------------------------"
	.size	.Lstr.13, 67

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
