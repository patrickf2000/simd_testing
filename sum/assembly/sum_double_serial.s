	.text
	.file	"sum_double.c"
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
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function init
.LCPI1_0:
	.quad	0x41a9999999666666              # double 214748364.69999999
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
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$10240000, -12(%rbp)            # imm = 0x9C4000
	jge	.LBB1_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	callq	rand
	cvtsi2sd	%eax, %xmm0
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movsd	%xmm0, (%rax,%rcx,8)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB1_1
.LBB1_4:                                # %for.end
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        # -- End function
	.globl	sum                             # -- Begin function sum
	.p2align	4, 0x90
	.type	sum,@function
sum:                                    # @sum
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	$0, -24(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
.LBB2_1:                                # %omp.inner.for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$10240000, -24(%rbp)            # imm = 0x9C4000
	jge	.LBB2_5
# %bb.2:                                # %omp.inner.for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-24(%rbp), %eax
	shll	$0, %eax
	addl	$0, %eax
	movl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	addsd	-40(%rbp), %xmm0
	movsd	%xmm0, -40(%rbp)
# %bb.3:                                # %omp.body.continue
                                        #   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_4
.LBB2_4:                                # %omp.inner.for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB2_1
.LBB2_5:                                # %omp.inner.for.end
	movl	$10240000, -28(%rbp)            # imm = 0x9C4000
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	addsd	-40(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	sum, .Lfunc_end2-sum
	.cfi_endproc
                                        # -- End function
	.globl	sum_serial                      # -- Begin function sum_serial
	.p2align	4, 0x90
	.type	sum_serial,@function
sum_serial:                             # @sum_serial
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	$0, -20(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$10240000, -20(%rbp)            # imm = 0x9C4000
	jge	.LBB3_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	addsd	-16(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB3_1
.LBB3_4:                                # %for.end
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	sum_serial, .Lfunc_end3-sum_serial
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
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$8, -12(%rbp)
	jge	.LBB4_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	movabsq	$.L.str.1, %rdi
	movb	$1, %al
	callq	printf
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB4_1
.LBB4_4:                                # %for.end
	movabsq	$.L.str.2, %rdi
	callq	puts
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	print_vector, .Lfunc_end4-print_vector
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI5_0:
	.quad	0x4034000000000000              # double 20
.LCPI5_1:
	.quad	0x432dcd6500000000              # double 4.194304E+15
.LCPI5_2:
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
	movl	$81920000, %edi                 # imm = 0x4E20000
	callq	malloc
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	movq	-24(%rbp), %rdi
	callq	init
	movq	-24(%rbp), %rdi
	callq	sum
	movsd	%xmm0, -32(%rbp)
	movq	-24(%rbp), %rdi
	callq	sum_serial
	movsd	%xmm0, -40(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	callq	read_timer
	movsd	%xmm0, -56(%rbp)
	movl	$0, -60(%rbp)
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$20, -60(%rbp)
	jge	.LBB5_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movq	-24(%rbp), %rdi
	callq	sum
	movsd	%xmm0, -32(%rbp)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB5_1
.LBB5_4:                                # %for.end
	callq	read_timer
	subsd	-56(%rbp), %xmm0
	addsd	-48(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -72(%rbp)
	callq	read_timer
	movsd	%xmm0, -80(%rbp)
	movl	$0, -84(%rbp)
.LBB5_5:                                # %for.cond10
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$20, -84(%rbp)
	jge	.LBB5_8
# %bb.6:                                # %for.body13
                                        #   in Loop: Header=BB5_5 Depth=1
	movq	-24(%rbp), %rdi
	callq	sum_serial
	movsd	%xmm0, -40(%rbp)
# %bb.7:                                # %for.inc15
                                        #   in Loop: Header=BB5_5 Depth=1
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	jmp	.LBB5_5
.LBB5_8:                                # %for.end17
	callq	read_timer
	subsd	-80(%rbp), %xmm0
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movq	-24(%rbp), %rdi
	callq	print_vector
	movabsq	$.L.str.3, %rdi
	callq	puts
	movsd	-32(%rbp), %xmm0                # xmm0 = mem[0],zero
	movabsq	$.L.str.4, %rdi
	movb	$1, %al
	callq	printf
	movabsq	$.L.str.5, %rdi
	callq	puts
	movsd	-40(%rbp), %xmm0                # xmm0 = mem[0],zero
	movabsq	$.L.str.6, %rdi
	movb	$1, %al
	callq	printf
	movsd	.LCPI5_2(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	-48(%rbp), %xmm1
	movsd	.LCPI5_1(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	movsd	.LCPI5_2(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	-72(%rbp), %xmm1
	movsd	.LCPI5_1(%rip), %xmm0           # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	movabsq	$.L.str.7, %rdi
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.8, %rdi
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.9, %rdi
	movb	$0, %al
	callq	printf
	movsd	-48(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	.LCPI5_0(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	-96(%rbp), %xmm1                # xmm1 = mem[0],zero
	movabsq	$.L.str.10, %rdi
	movb	$2, %al
	callq	printf
	movsd	-72(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	.LCPI5_0(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	-104(%rbp), %xmm1               # xmm1 = mem[0],zero
	movabsq	$.L.str.11, %rdi
	movb	$2, %al
	callq	printf
	movsd	-40(%rbp), %xmm0                # xmm0 = mem[0],zero
	subsd	-32(%rbp), %xmm0
	movabsq	$.L.str.12, %rdi
	movb	$1, %al
	callq	printf
	movq	-24(%rbp), %rdi
	callq	free
	xorl	%eax, %eax
	addq	$112, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
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
	.asciz	"=\n"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"SIMD: %f\n"
	.size	.L.str.4, 10

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Serial: %f\n"
	.size	.L.str.6, 12

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"==================================================================\n"
	.size	.L.str.7, 68

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS\n"
	.size	.L.str.8, 36

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"------------------------------------------------------------------\n"
	.size	.L.str.9, 68

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"Sum (SIMD):\t\t%4f\t%4f\n"
	.size	.L.str.10, 22

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"Sum (Serial):\t\t%4f\t%4f\n"
	.size	.L.str.11, 24

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
	.addrsig_sym sum
	.addrsig_sym sum_serial
	.addrsig_sym print_vector
	.addrsig_sym printf
	.addrsig_sym puts
	.addrsig_sym malloc
	.addrsig_sym srand
	.addrsig_sym time
	.addrsig_sym free
