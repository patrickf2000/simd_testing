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
	.globl	init                            # -- Begin function init
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
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	cmpl	$10240, -20(%rbp)               # imm = 0x2800
	jge	.LBB1_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$0, -24(%rbp)
.LBB1_3:                                # %for.cond1
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$10240, -24(%rbp)               # imm = 0x2800
	jge	.LBB1_6
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB1_3 Depth=2
	callq	rand
	movl	$214748364, %ecx                # imm = 0xCCCCCCC
	cltd
	idivl	%ecx
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	imull	$10240, -20(%rbp), %ecx         # imm = 0x2800
	addl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB1_3 Depth=2
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB1_3
.LBB1_6:                                # %for.end
                                        #   in Loop: Header=BB1_1 Depth=1
	callq	rand
	movl	$214748364, %ecx                # imm = 0xCCCCCCC
	cltd
	idivl	%ecx
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.7:                                # %for.inc8
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB1_1
.LBB1_8:                                # %for.end10
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	cmpl	$10240, -28(%rbp)               # imm = 0x2800
	jge	.LBB2_9
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$0, -32(%rbp)
	movl	$0, -40(%rbp)
	movl	$0, -48(%rbp)
.LBB2_3:                                # %omp.inner.for.cond
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$10240, -40(%rbp)               # imm = 0x2800
	jge	.LBB2_7
# %bb.4:                                # %omp.inner.for.body
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	-40(%rbp), %eax
	shll	$0, %eax
	addl	$0, %eax
	movl	%eax, -44(%rbp)
	movq	-8(%rbp), %rax
	imull	$10240, -28(%rbp), %ecx         # imm = 0x2800
	addl	-44(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-16(%rbp), %rcx
	movslq	-44(%rbp), %rdx
	imull	(%rcx,%rdx,4), %eax
	addl	-48(%rbp), %eax
	movl	%eax, -48(%rbp)
# %bb.5:                                # %omp.body.continue
                                        #   in Loop: Header=BB2_3 Depth=2
	jmp	.LBB2_6
.LBB2_6:                                # %omp.inner.for.inc
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB2_3
.LBB2_7:                                # %omp.inner.for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$10240, -44(%rbp)               # imm = 0x2800
	movl	-32(%rbp), %eax
	addl	-48(%rbp), %eax
	movl	%eax, -32(%rbp)
	movl	-32(%rbp), %edx
	movq	-24(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.8:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB2_1
.LBB2_9:                                # %for.end
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -28(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	cmpl	$10240, -28(%rbp)               # imm = 0x2800
	jge	.LBB3_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$0, -32(%rbp)
	movl	$0, -36(%rbp)
.LBB3_3:                                # %for.cond1
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$10240, -36(%rbp)               # imm = 0x2800
	jge	.LBB3_6
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	-8(%rbp), %rax
	imull	$10240, -28(%rbp), %ecx         # imm = 0x2800
	addl	-36(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-16(%rbp), %rcx
	movslq	-36(%rbp), %rdx
	imull	(%rcx,%rdx,4), %eax
	addl	-32(%rbp), %eax
	movl	%eax, -32(%rbp)
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB3_3
.LBB3_6:                                # %for.end
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-32(%rbp), %edx
	movq	-24(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.7:                                # %for.inc10
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB3_1
.LBB3_8:                                # %for.end12
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
.LBB4_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_3 Depth 2
	cmpl	$8, -12(%rbp)
	jge	.LBB4_8
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	$0, -16(%rbp)
.LBB4_3:                                # %for.cond1
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$8, -16(%rbp)
	jge	.LBB4_6
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB4_3 Depth=2
	movq	-8(%rbp), %rax
	imull	$10240, -12(%rbp), %ecx         # imm = 0x2800
	addl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %esi
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB4_3 Depth=2
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB4_3
.LBB4_6:                                # %for.end
                                        #   in Loop: Header=BB4_1 Depth=1
	movabsq	$.L.str.2, %rdi
	callq	puts
# %bb.7:                                # %for.inc6
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB4_1
.LBB4_8:                                # %for.end8
	movabsq	$.L.str.3, %rdi
	callq	puts
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	$0, -12(%rbp)
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$8, -12(%rbp)
	jge	.LBB5_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB5_1
.LBB5_4:                                # %for.end
	movabsq	$.L.str.2, %rdi
	callq	puts
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -24(%rbp)
.LBB6_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$10240, -24(%rbp)               # imm = 0x2800
	jge	.LBB6_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB6_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %edi
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	subl	(%rax,%rcx,4), %edi
	callq	abs
	addl	-20(%rbp), %eax
	movl	%eax, -20(%rbp)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB6_1
.LBB6_4:                                # %for.end
	movl	-20(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	check, .Lfunc_end6-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI7_0:
	.quad	0x4034000000000000              # double 20
.LCPI7_1:
	.quad	0x41ef400000000000              # double 4194304000
.LCPI7_2:
	.quad	0x41cdcd6500000000              # double 1.0E+9
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
	subq	$112, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$81920, %edi                    # imm = 0x14000
	callq	malloc
	movq	%rax, -24(%rbp)
	movl	$81920, %edi                    # imm = 0x14000
	callq	malloc
	movq	%rax, -32(%rbp)
	movl	$838860800, %edi                # imm = 0x32000000
	callq	malloc
	movq	%rax, -40(%rbp)
	movl	$40960, %edi                    # imm = 0xA000
	callq	malloc
	movq	%rax, -48(%rbp)
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rsi
	callq	init
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movq	-24(%rbp), %rdx
	callq	matvec_simd
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -56(%rbp)
	callq	read_timer
	movsd	%xmm0, -64(%rbp)
	movl	$0, -68(%rbp)
.LBB7_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$20, -68(%rbp)
	jge	.LBB7_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB7_1 Depth=1
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movq	-24(%rbp), %rdx
	callq	matvec_simd
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	.LBB7_1
.LBB7_4:                                # %for.end
	callq	read_timer
	subsd	-64(%rbp), %xmm0
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -80(%rbp)
	callq	read_timer
	movsd	%xmm0, -88(%rbp)
	movl	$0, -92(%rbp)
.LBB7_5:                                # %for.cond10
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$20, -92(%rbp)
	jge	.LBB7_8
# %bb.6:                                # %for.body13
                                        #   in Loop: Header=BB7_5 Depth=1
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movq	-32(%rbp), %rdx
	callq	matvec_serial
# %bb.7:                                # %for.inc14
                                        #   in Loop: Header=BB7_5 Depth=1
	movl	-92(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -92(%rbp)
	jmp	.LBB7_5
.LBB7_8:                                # %for.end16
	callq	read_timer
	subsd	-88(%rbp), %xmm0
	addsd	-80(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	movq	-40(%rbp), %rdi
	callq	print_matrix
	movq	-48(%rbp), %rdi
	callq	print_vector
	movabsq	$.L.str.4, %rdi
	callq	puts
	movq	-24(%rbp), %rdi
	callq	print_vector
	movabsq	$.L.str.5, %rdi
	callq	puts
	movq	-32(%rbp), %rdi
	callq	print_vector
	movsd	.LCPI7_2(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	-56(%rbp), %xmm1
	movsd	.LCPI7_1(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	movsd	.LCPI7_2(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	-80(%rbp), %xmm1
	movsd	.LCPI7_1(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -112(%rbp)
	movabsq	$.L.str.6, %rdi
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.7, %rdi
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.8, %rdi
	movb	$0, %al
	callq	printf
	movsd	-56(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	.LCPI7_0(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	-104(%rbp), %xmm1               # xmm1 = mem[0],zero
	movabsq	$.L.str.9, %rdi
	movb	$2, %al
	callq	printf
	movsd	-80(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	.LCPI7_0(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	-112(%rbp), %xmm1               # xmm1 = mem[0],zero
	movabsq	$.L.str.10, %rdi
	movb	$2, %al
	callq	printf
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	callq	check
	movl	%eax, %esi
	movabsq	$.L.str.11, %rdi
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
	xorl	%eax, %eax
	addq	$112, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"["
	.size	.L.str, 2

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%d "
	.size	.L.str.1, 4

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
	.asciz	"==================================================================\n"
	.size	.L.str.6, 68

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS\n"
	.size	.L.str.7, 36

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"------------------------------------------------------------------\n"
	.size	.L.str.8, 68

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

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym read_timer
	.addrsig_sym ftime
	.addrsig_sym init
	.addrsig_sym rand
	.addrsig_sym matvec_simd
	.addrsig_sym matvec_serial
	.addrsig_sym print_matrix
	.addrsig_sym printf
	.addrsig_sym puts
	.addrsig_sym print_vector
	.addrsig_sym check
	.addrsig_sym abs
	.addrsig_sym malloc
	.addrsig_sym srand
	.addrsig_sym time
	.addrsig_sym free
