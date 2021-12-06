	.text
	.file	"matmul_float.c"
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
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function init
.LCPI1_0:
	.long	0x4d4ccccd                      # float 214748368
	.text
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	cmpl	$1024, -12(%rbp)                # imm = 0x400
	jge	.LBB1_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$0, -16(%rbp)
.LBB1_3:                                # %for.cond1
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$1024, -16(%rbp)                # imm = 0x400
	jge	.LBB1_6
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB1_3 Depth=2
	callq	rand
	cvtsi2ss	%eax, %xmm0
	movss	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-16(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB1_3 Depth=2
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB1_3
.LBB1_6:                                # %for.end
                                        #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_7
.LBB1_7:                                # %for.inc6
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB1_1
.LBB1_8:                                # %for.end8
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        # -- End function
	.globl	matmul_simd                     # -- Begin function matmul_simd
	.p2align	4, 0x90
	.type	matmul_simd,@function
matmul_simd:                            # @matmul_simd
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -28(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
                                        #       Child Loop BB2_5 Depth 3
	cmpl	$1024, -28(%rbp)                # imm = 0x400
	jge	.LBB2_13
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$0, -32(%rbp)
.LBB2_3:                                # %for.cond1
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_5 Depth 3
	cmpl	$1024, -32(%rbp)                # imm = 0x400
	jge	.LBB2_11
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB2_3 Depth=2
	xorps	%xmm0, %xmm0
	movss	%xmm0, -40(%rbp)
	movl	$0, -48(%rbp)
	xorps	%xmm0, %xmm0
	movss	%xmm0, -56(%rbp)
.LBB2_5:                                # %omp.inner.for.cond
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1024, -48(%rbp)                # imm = 0x400
	jge	.LBB2_9
# %bb.6:                                # %omp.inner.for.body
                                        #   in Loop: Header=BB2_5 Depth=3
	movl	-48(%rbp), %eax
	shll	$0, %eax
	addl	$0, %eax
	movl	%eax, -52(%rbp)
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-52(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-52(%rbp), %rcx
	mulss	(%rax,%rcx,4), %xmm0
	addss	-56(%rbp), %xmm0
	movss	%xmm0, -56(%rbp)
# %bb.7:                                # %omp.body.continue
                                        #   in Loop: Header=BB2_5 Depth=3
	jmp	.LBB2_8
.LBB2_8:                                # %omp.inner.for.inc
                                        #   in Loop: Header=BB2_5 Depth=3
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	jmp	.LBB2_5
.LBB2_9:                                # %omp.inner.for.end
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	$1024, -36(%rbp)                # imm = 0x400
	movss	-40(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	addss	-56(%rbp), %xmm0
	movss	%xmm0, -40(%rbp)
	movss	-40(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movq	-24(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-32(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.10:                               # %for.inc
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB2_3
.LBB2_11:                               # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_12
.LBB2_12:                               # %for.inc21
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB2_1
.LBB2_13:                               # %for.end23
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	matmul_simd, .Lfunc_end2-matmul_simd
	.cfi_endproc
                                        # -- End function
	.globl	print_matrix                    # -- Begin function print_matrix
	.p2align	4, 0x90
	.type	print_matrix,@function
print_matrix:                           # @print_matrix
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	cmpl	$8, -12(%rbp)
	jge	.LBB3_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	$0, -16(%rbp)
.LBB3_3:                                # %for.cond1
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$8, -16(%rbp)
	jge	.LBB3_6
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-16(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.1, %rdi
	movb	$1, %al
	callq	printf
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB3_3
.LBB3_6:                                # %for.end
                                        #   in Loop: Header=BB3_1 Depth=1
	movabsq	$.L.str.2, %rdi
	callq	puts
# %bb.7:                                # %for.inc8
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB3_1
.LBB3_8:                                # %for.end10
	movabsq	$.L.str.3, %rdi
	callq	puts
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	print_matrix, .Lfunc_end3-print_matrix
	.cfi_endproc
                                        # -- End function
	.globl	matmul_serial                   # -- Begin function matmul_serial
	.p2align	4, 0x90
	.type	matmul_serial,@function
matmul_serial:                          # @matmul_serial
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -28(%rbp)
.LBB4_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_3 Depth 2
                                        #       Child Loop BB4_5 Depth 3
	cmpl	$1024, -28(%rbp)                # imm = 0x400
	jge	.LBB4_12
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	$0, -32(%rbp)
.LBB4_3:                                # %for.cond1
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_5 Depth 3
	cmpl	$1024, -32(%rbp)                # imm = 0x400
	jge	.LBB4_10
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB4_3 Depth=2
	xorps	%xmm0, %xmm0
	movss	%xmm0, -40(%rbp)
	movl	$0, -36(%rbp)
.LBB4_5:                                # %for.cond4
                                        #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$1024, -36(%rbp)                # imm = 0x400
	jge	.LBB4_8
# %bb.6:                                # %for.body6
                                        #   in Loop: Header=BB4_5 Depth=3
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-36(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-36(%rbp), %rcx
	mulss	(%rax,%rcx,4), %xmm0
	addss	-40(%rbp), %xmm0
	movss	%xmm0, -40(%rbp)
# %bb.7:                                # %for.inc
                                        #   in Loop: Header=BB4_5 Depth=3
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB4_5
.LBB4_8:                                # %for.end
                                        #   in Loop: Header=BB4_3 Depth=2
	movss	-40(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movq	-24(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-32(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.9:                                # %for.inc17
                                        #   in Loop: Header=BB4_3 Depth=2
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB4_3
.LBB4_10:                               # %for.end19
                                        #   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_11
.LBB4_11:                               # %for.inc20
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB4_1
.LBB4_12:                               # %for.end22
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	matmul_serial, .Lfunc_end4-matmul_serial
	.cfi_endproc
                                        # -- End function
	.globl	check                           # -- Begin function check
	.p2align	4, 0x90
	.type	check,@function
check:                                  # @check
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	xorps	%xmm0, %xmm0
	movss	%xmm0, -20(%rbp)
	movl	$0, -24(%rbp)
.LBB5_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_3 Depth 2
	cmpl	$1024, -24(%rbp)                # imm = 0x400
	jge	.LBB5_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	$0, -28(%rbp)
.LBB5_3:                                # %for.cond1
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$1024, -28(%rbp)                # imm = 0x400
	jge	.LBB5_6
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB5_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-28(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-28(%rbp), %rcx
	subss	(%rax,%rcx,4), %xmm0
	addss	-20(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB5_3 Depth=2
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB5_3
.LBB5_6:                                # %for.end
                                        #   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_7
.LBB5_7:                                # %for.inc10
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB5_1
.LBB5_8:                                # %for.end12
	movss	-20(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI6_0:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI6_1:
	.quad	0x41e0000000000000              # double 2147483648
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
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, -24(%rbp)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, -32(%rbp)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, -40(%rbp)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, -48(%rbp)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, -56(%rbp)
	movl	$0, -60(%rbp)
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$1024, -60(%rbp)                # imm = 0x400
	jge	.LBB6_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movq	%rdx, (%rax,%rcx,8)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movq	%rdx, (%rax,%rcx,8)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movq	%rdx, (%rax,%rcx,8)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movq	%rdx, (%rax,%rcx,8)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movq	%rdx, (%rax,%rcx,8)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB6_1
.LBB6_4:                                # %for.end
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	movq	-24(%rbp), %rdi
	callq	init
	movq	-32(%rbp), %rdi
	callq	init
	movl	$0, -64(%rbp)
.LBB6_5:                                # %for.cond19
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_7 Depth 2
	cmpl	$1024, -64(%rbp)                # imm = 0x400
	jge	.LBB6_12
# %bb.6:                                # %for.body22
                                        #   in Loop: Header=BB6_5 Depth=1
	movl	$0, -68(%rbp)
.LBB6_7:                                # %for.cond23
                                        #   Parent Loop BB6_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$1024, -68(%rbp)                # imm = 0x400
	jge	.LBB6_10
# %bb.8:                                # %for.body26
                                        #   in Loop: Header=BB6_7 Depth=2
	movq	-32(%rbp), %rax
	movslq	-68(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-64(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-56(%rbp), %rax
	movslq	-64(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-68(%rbp), %rcx
	movss	%xmm0, (%rax,%rcx,4)
# %bb.9:                                # %for.inc35
                                        #   in Loop: Header=BB6_7 Depth=2
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	.LBB6_7
.LBB6_10:                               # %for.end37
                                        #   in Loop: Header=BB6_5 Depth=1
	jmp	.LBB6_11
.LBB6_11:                               # %for.inc38
                                        #   in Loop: Header=BB6_5 Depth=1
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -64(%rbp)
	jmp	.LBB6_5
.LBB6_12:                               # %for.end40
	movl	$20, -76(%rbp)
	movq	-24(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-40(%rbp), %rdx
	callq	matmul_simd
	movq	-24(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rdx
	callq	matmul_serial
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -88(%rbp)
	callq	read_timer
	movsd	%xmm0, -96(%rbp)
	movl	$0, -72(%rbp)
.LBB6_13:                               # %for.cond43
                                        # =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB6_16
# %bb.14:                               # %for.body46
                                        #   in Loop: Header=BB6_13 Depth=1
	movq	-24(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-40(%rbp), %rdx
	callq	matmul_simd
# %bb.15:                               # %for.inc47
                                        #   in Loop: Header=BB6_13 Depth=1
	movl	-72(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -72(%rbp)
	jmp	.LBB6_13
.LBB6_16:                               # %for.end49
	callq	read_timer
	subsd	-96(%rbp), %xmm0
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -88(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -104(%rbp)
	callq	read_timer
	movsd	%xmm0, -112(%rbp)
	movl	$0, -72(%rbp)
.LBB6_17:                               # %for.cond52
                                        # =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB6_20
# %bb.18:                               # %for.body55
                                        #   in Loop: Header=BB6_17 Depth=1
	movq	-24(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rdx
	callq	matmul_serial
# %bb.19:                               # %for.inc56
                                        #   in Loop: Header=BB6_17 Depth=1
	movl	-72(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -72(%rbp)
	jmp	.LBB6_17
.LBB6_20:                               # %for.end58
	callq	read_timer
	subsd	-112(%rbp), %xmm0
	addsd	-104(%rbp), %xmm0
	movsd	%xmm0, -104(%rbp)
	movq	-24(%rbp), %rdi
	callq	print_matrix
	movq	-56(%rbp), %rdi
	callq	print_matrix
	movabsq	$.L.str.4, %rdi
	callq	puts
	movq	-40(%rbp), %rdi
	callq	print_matrix
	movabsq	$.L.str.5, %rdi
	callq	puts
	movq	-48(%rbp), %rdi
	callq	print_matrix
	cvtsi2sdl	-76(%rbp), %xmm1
	movsd	.LCPI6_1(%rip), %xmm0           # xmm0 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movsd	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	-88(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -120(%rbp)
	cvtsi2sdl	-76(%rbp), %xmm1
	movsd	.LCPI6_1(%rip), %xmm0           # xmm0 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movsd	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	-104(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -128(%rbp)
	movabsq	$.L.str.6, %rdi
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.7, %rdi
	movl	$1024, %esi                     # imm = 0x400
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.8, %rdi
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.9, %rdi
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.8, %rdi
	movb	$0, %al
	callq	printf
	movsd	-88(%rbp), %xmm0                # xmm0 = mem[0],zero
	cvtsi2sdl	-76(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-120(%rbp), %xmm1               # xmm1 = mem[0],zero
	movabsq	$.L.str.10, %rdi
	movb	$2, %al
	callq	printf
	movsd	-104(%rbp), %xmm0               # xmm0 = mem[0],zero
	cvtsi2sdl	-76(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-128(%rbp), %xmm1               # xmm1 = mem[0],zero
	movabsq	$.L.str.11, %rdi
	movb	$2, %al
	callq	printf
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rsi
	callq	check
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.12, %rdi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$128, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"["
	.size	.L.str, 2

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%.2f "
	.size	.L.str.1, 6

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"]"
	.size	.L.str.2, 2

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.zero	1
	.size	.L.str.3, 1

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"=\n"
	.size	.L.str.4, 3

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"======================================================================================================\n"
	.size	.L.str.6, 104

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n"
	.size	.L.str.7, 59

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"------------------------------------------------------------------------------------------------------\n"
	.size	.L.str.8, 104

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"Performance:\t\tRuntime (s)\t GFLOPS\n"
	.size	.L.str.9, 35

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"matmul_omp:\t\t%4f\t%4f\n"
	.size	.L.str.10, 22

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"matmul_serial:\t\t%4f\t%4f\n"
	.size	.L.str.11, 25

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"Correctness check: %f\n"
	.size	.L.str.12, 23

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym read_timer
	.addrsig_sym ftime
	.addrsig_sym init
	.addrsig_sym rand
	.addrsig_sym matmul_simd
	.addrsig_sym print_matrix
	.addrsig_sym printf
	.addrsig_sym puts
	.addrsig_sym matmul_serial
	.addrsig_sym check
	.addrsig_sym malloc
	.addrsig_sym srand
	.addrsig_sym time
