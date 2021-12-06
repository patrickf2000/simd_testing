	.text
	.file	"matmul_double.c"
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_2:                                # %for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	%xmm1, %xmm0
	movq	(%r14,%r15,8), %rax
	movsd	%xmm0, (%rax,%rbx,8)
	addq	$1, %rbx
	cmpq	$1024, %rbx                     # imm = 0x400
	jne	.LBB1_2
# %bb.3:                                # %for.inc6
                                        #   in Loop: Header=BB1_1 Depth=1
	addq	$1, %r15
	cmpq	$1024, %r15                     # imm = 0x400
	jne	.LBB1_1
# %bb.4:                                # %for.end8
	popq	%rbx
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
	.globl	matmul_simd                     # -- Begin function matmul_simd
	.p2align	4, 0x90
	.type	matmul_simd,@function
matmul_simd:                            # @matmul_simd
	.cfi_startproc
# %bb.0:                                # %entry
	xorl	%r8d, %r8d
	xorpd	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
                                        #       Child Loop BB2_3 Depth 3
	movq	(%rdi,%r8,8), %r11
	movq	(%rdx,%r8,8), %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB2_2:                                # %omp.inner.for.cond.preheader
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_3 Depth 3
	movq	(%rsi,%r10,8), %rax
	xorpd	%xmm1, %xmm1
	xorl	%ecx, %ecx
	xorpd	%xmm2, %xmm2
	.p2align	4, 0x90
.LBB2_3:                                # %vector.body
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movupd	(%r11,%rcx,8), %xmm3
	movupd	16(%r11,%rcx,8), %xmm4
	movupd	32(%r11,%rcx,8), %xmm5
	movupd	48(%r11,%rcx,8), %xmm6
	movupd	(%rax,%rcx,8), %xmm7
	mulpd	%xmm3, %xmm7
	addpd	%xmm1, %xmm7
	movupd	16(%rax,%rcx,8), %xmm3
	mulpd	%xmm4, %xmm3
	addpd	%xmm2, %xmm3
	movupd	32(%rax,%rcx,8), %xmm1
	mulpd	%xmm5, %xmm1
	addpd	%xmm7, %xmm1
	movupd	48(%rax,%rcx,8), %xmm2
	mulpd	%xmm6, %xmm2
	addpd	%xmm3, %xmm2
	addq	$8, %rcx
	cmpq	$1024, %rcx                     # imm = 0x400
	jne	.LBB2_3
# %bb.4:                                # %middle.block
                                        #   in Loop: Header=BB2_2 Depth=2
	addpd	%xmm1, %xmm2
	movapd	%xmm2, %xmm1
	unpckhpd	%xmm2, %xmm1                    # xmm1 = xmm1[1],xmm2[1]
	addsd	%xmm2, %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%r9,%r10,8)
	addq	$1, %r10
	cmpq	$1024, %r10                     # imm = 0x400
	jne	.LBB2_2
# %bb.5:                                # %for.inc21
                                        #   in Loop: Header=BB2_1 Depth=1
	addq	$1, %r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB2_1
# %bb.6:                                # %for.end23
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB3_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$91, %edi
	callq	putchar@PLT
	movq	(%r14,%rbx,8), %rax
	movsd	(%rax), %xmm0                   # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movsd	8(%rax), %xmm0                  # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movsd	16(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movsd	24(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movsd	32(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movsd	40(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movsd	48(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movsd	56(%rax), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.2, %edi
	callq	puts
	addq	$1, %rbx
	cmpq	$8, %rbx
	jne	.LBB3_1
# %bb.2:                                # %for.cond.cleanup
	movl	$10, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT                     # TAILCALL
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
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB4_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_2 Depth 2
                                        #       Child Loop BB4_3 Depth 3
	movq	(%rdi,%r8,8), %r11
	movq	(%rdx,%r8,8), %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB4_2:                                # %for.cond4.preheader
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_3 Depth 3
	movq	(%rsi,%r10,8), %rax
	xorpd	%xmm0, %xmm0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB4_3:                                # %for.body6
                                        #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movsd	(%r11,%rcx,8), %xmm1            # xmm1 = mem[0],zero
	movsd	8(%r11,%rcx,8), %xmm2           # xmm2 = mem[0],zero
	mulsd	(%rax,%rcx,8), %xmm1
	mulsd	8(%rax,%rcx,8), %xmm2
	addsd	%xmm0, %xmm1
	movsd	16(%r11,%rcx,8), %xmm3          # xmm3 = mem[0],zero
	mulsd	16(%rax,%rcx,8), %xmm3
	addsd	%xmm1, %xmm2
	movsd	24(%r11,%rcx,8), %xmm0          # xmm0 = mem[0],zero
	mulsd	24(%rax,%rcx,8), %xmm0
	addsd	%xmm2, %xmm3
	addsd	%xmm3, %xmm0
	addq	$4, %rcx
	cmpq	$1024, %rcx                     # imm = 0x400
	jne	.LBB4_3
# %bb.4:                                # %for.end
                                        #   in Loop: Header=BB4_2 Depth=2
	movsd	%xmm0, (%r9,%r10,8)
	addq	$1, %r10
	cmpq	$1024, %r10                     # imm = 0x400
	jne	.LBB4_2
# %bb.5:                                # %for.inc20
                                        #   in Loop: Header=BB4_1 Depth=1
	addq	$1, %r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB4_1
# %bb.6:                                # %for.end22
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
	xorpd	%xmm0, %xmm0
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB5_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_2 Depth 2
	movq	(%rdi,%r8,8), %rcx
	movq	(%rsi,%r8,8), %rdx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_2:                                # %for.body4
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%rcx,%rax,8), %xmm1            # xmm1 = mem[0],zero
	movsd	8(%rcx,%rax,8), %xmm2           # xmm2 = mem[0],zero
	subsd	(%rdx,%rax,8), %xmm1
	subsd	8(%rdx,%rax,8), %xmm2
	addsd	%xmm0, %xmm1
	movsd	16(%rcx,%rax,8), %xmm3          # xmm3 = mem[0],zero
	subsd	16(%rdx,%rax,8), %xmm3
	addsd	%xmm1, %xmm2
	movsd	24(%rcx,%rax,8), %xmm0          # xmm0 = mem[0],zero
	subsd	24(%rdx,%rax,8), %xmm0
	addsd	%xmm2, %xmm3
	addsd	%xmm3, %xmm0
	addq	$4, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB5_2
# %bb.3:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB5_1 Depth=1
	addq	$1, %r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB5_1
# %bb.4:                                # %for.cond.cleanup
	retq
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI6_0:
	.quad	0x41a9999999666666              # double 214748364.69999999
.LCPI6_1:
	.quad	0x408f400000000000              # double 1000
.LCPI6_2:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI6_3:
	.quad	0x4224000000000000              # double 42949672960
.LCPI6_4:
	.quad	0x4034000000000000              # double 20
.LCPI6_5:
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
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, %r12
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, %r13
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, %r14
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, %r15
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, %rbx
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB6_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, (%r12,%rbp,8)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, (%r13,%rbp,8)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, (%r14,%rbp,8)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, (%r15,%rbp,8)
	movl	$8192, %edi                     # imm = 0x2000
	callq	malloc
	movq	%rax, (%rbx,%rbp,8)
	addq	$1, %rbp
	cmpq	$1024, %rbp                     # imm = 0x400
	jne	.LBB6_1
# %bb.2:                                # %for.cond.cleanup
	movq	%r14, 48(%rsp)                  # 8-byte Spill
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	.p2align	4, 0x90
.LBB6_3:                                # %for.cond1.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_4 Depth 2
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB6_4:                                # %for.body3.i
                                        #   Parent Loop BB6_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	movsd	.LCPI6_0(%rip), %xmm1           # xmm1 = mem[0],zero
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	%xmm1, %xmm0
	movq	(%r12,%rbp,8), %rax
	movsd	%xmm0, (%rax,%r14,8)
	addq	$1, %r14
	cmpq	$1024, %r14                     # imm = 0x400
	jne	.LBB6_4
# %bb.5:                                # %for.inc6.i
                                        #   in Loop: Header=BB6_3 Depth=1
	addq	$1, %rbp
	cmpq	$1024, %rbp                     # imm = 0x400
	jne	.LBB6_3
# %bb.6:                                # %for.cond1.preheader.i152.preheader
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB6_7:                                # %for.cond1.preheader.i152
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_8 Depth 2
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB6_8:                                # %for.body3.i160
                                        #   Parent Loop BB6_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	.LCPI6_0(%rip), %xmm0
	movq	(%r13,%r14,8), %rax
	movsd	%xmm0, (%rax,%rbp,8)
	addq	$1, %rbp
	cmpq	$1024, %rbp                     # imm = 0x400
	jne	.LBB6_8
# %bb.9:                                # %for.inc6.i163
                                        #   in Loop: Header=BB6_7 Depth=1
	addq	$1, %r14
	cmpq	$1024, %r14                     # imm = 0x400
	jne	.LBB6_7
# %bb.10:                               # %for.cond24.preheader.preheader
	xorl	%eax, %eax
	movq	48(%rsp), %r14                  # 8-byte Reload
	.p2align	4, 0x90
.LBB6_11:                               # %for.cond24.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_12 Depth 2
	movq	(%rbx,%rax,8), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_12:                               # %for.body28
                                        #   Parent Loop BB6_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r13,%rdx,8), %rsi
	movsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, (%rcx,%rdx,8)
	movq	8(%r13,%rdx,8), %rsi
	movsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rcx,%rdx,8)
	movq	16(%r13,%rdx,8), %rsi
	movsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%rcx,%rdx,8)
	movq	24(%r13,%rdx,8), %rsi
	movsd	(%rsi,%rax,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, 24(%rcx,%rdx,8)
	addq	$4, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_12
# %bb.13:                               # %for.cond.cleanup27
                                        #   in Loop: Header=BB6_11 Depth=1
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_11
# %bb.14:                               # %for.cond1.preheader.i166.preheader
	xorl	%eax, %eax
	xorpd	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB6_15:                               # %for.cond1.preheader.i166
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_16 Depth 2
                                        #       Child Loop BB6_17 Depth 3
	movq	(%r12,%rax,8), %rcx
	movq	(%r14,%rax,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_16:                               # %omp.inner.for.cond.preheader.i
                                        #   Parent Loop BB6_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_17 Depth 3
	movq	(%rbx,%rsi,8), %rdi
	xorpd	%xmm1, %xmm1
	xorl	%ebp, %ebp
	xorpd	%xmm2, %xmm2
	.p2align	4, 0x90
.LBB6_17:                               # %vector.body
                                        #   Parent Loop BB6_15 Depth=1
                                        #     Parent Loop BB6_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movupd	(%rcx,%rbp,8), %xmm3
	movupd	16(%rcx,%rbp,8), %xmm4
	movupd	32(%rcx,%rbp,8), %xmm5
	movupd	48(%rcx,%rbp,8), %xmm6
	movupd	(%rdi,%rbp,8), %xmm7
	mulpd	%xmm3, %xmm7
	addpd	%xmm1, %xmm7
	movupd	16(%rdi,%rbp,8), %xmm3
	mulpd	%xmm4, %xmm3
	addpd	%xmm2, %xmm3
	movupd	32(%rdi,%rbp,8), %xmm1
	mulpd	%xmm5, %xmm1
	addpd	%xmm7, %xmm1
	movupd	48(%rdi,%rbp,8), %xmm2
	mulpd	%xmm6, %xmm2
	addpd	%xmm3, %xmm2
	addq	$8, %rbp
	cmpq	$1024, %rbp                     # imm = 0x400
	jne	.LBB6_17
# %bb.18:                               # %middle.block
                                        #   in Loop: Header=BB6_16 Depth=2
	addpd	%xmm1, %xmm2
	movapd	%xmm2, %xmm1
	unpckhpd	%xmm2, %xmm1                    # xmm1 = xmm1[1],xmm2[1]
	addsd	%xmm2, %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%rdx,%rsi,8)
	addq	$1, %rsi
	cmpq	$1024, %rsi                     # imm = 0x400
	jne	.LBB6_16
# %bb.19:                               # %for.inc21.i
                                        #   in Loop: Header=BB6_15 Depth=1
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_15
# %bb.20:                               # %for.cond1.preheader.i178.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_21:                               # %for.cond1.preheader.i178
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_22 Depth 2
                                        #       Child Loop BB6_23 Depth 3
	movq	(%r12,%rax,8), %rcx
	movq	(%r15,%rax,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_22:                               # %for.cond4.preheader.i
                                        #   Parent Loop BB6_21 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_23 Depth 3
	movq	(%rbx,%rsi,8), %rdi
	xorpd	%xmm0, %xmm0
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB6_23:                               # %for.body6.i
                                        #   Parent Loop BB6_21 Depth=1
                                        #     Parent Loop BB6_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movsd	(%rcx,%rbp,8), %xmm1            # xmm1 = mem[0],zero
	movsd	8(%rcx,%rbp,8), %xmm2           # xmm2 = mem[0],zero
	mulsd	(%rdi,%rbp,8), %xmm1
	mulsd	8(%rdi,%rbp,8), %xmm2
	addsd	%xmm0, %xmm1
	movsd	16(%rcx,%rbp,8), %xmm3          # xmm3 = mem[0],zero
	mulsd	16(%rdi,%rbp,8), %xmm3
	addsd	%xmm1, %xmm2
	movsd	24(%rcx,%rbp,8), %xmm0          # xmm0 = mem[0],zero
	mulsd	24(%rdi,%rbp,8), %xmm0
	addsd	%xmm2, %xmm3
	addsd	%xmm3, %xmm0
	addq	$4, %rbp
	cmpq	$1024, %rbp                     # imm = 0x400
	jne	.LBB6_23
# %bb.24:                               # %for.end.i
                                        #   in Loop: Header=BB6_22 Depth=2
	movsd	%xmm0, (%rdx,%rsi,8)
	addq	$1, %rsi
	cmpq	$1024, %rsi                     # imm = 0x400
	jne	.LBB6_22
# %bb.25:                               # %for.inc20.i
                                        #   in Loop: Header=BB6_21 Depth=1
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_21
# %bb.26:                               # %matmul_serial.exit
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %r8
	movzwl	16(%rsp), %eax
	cvtsi2sd	%eax, %xmm8
	divsd	.LCPI6_1(%rip), %xmm8
	xorl	%r9d, %r9d
	xorpd	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB6_27:                               # %for.cond1.preheader.i193.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_28 Depth 2
                                        #       Child Loop BB6_29 Depth 3
                                        #         Child Loop BB6_30 Depth 4
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_28:                               # %for.cond1.preheader.i193
                                        #   Parent Loop BB6_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_29 Depth 3
                                        #         Child Loop BB6_30 Depth 4
	movq	(%r12,%rdx,8), %rsi
	movq	(%r14,%rdx,8), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_29:                               # %omp.inner.for.cond.preheader.i196
                                        #   Parent Loop BB6_27 Depth=1
                                        #     Parent Loop BB6_28 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_30 Depth 4
	movq	(%rbx,%rax,8), %rbp
	xorpd	%xmm1, %xmm1
	xorl	%ecx, %ecx
	xorpd	%xmm2, %xmm2
	.p2align	4, 0x90
.LBB6_30:                               # %vector.body282
                                        #   Parent Loop BB6_27 Depth=1
                                        #     Parent Loop BB6_28 Depth=2
                                        #       Parent Loop BB6_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movupd	(%rsi,%rcx,8), %xmm3
	movupd	16(%rsi,%rcx,8), %xmm4
	movupd	32(%rsi,%rcx,8), %xmm5
	movupd	48(%rsi,%rcx,8), %xmm6
	movupd	(%rbp,%rcx,8), %xmm7
	mulpd	%xmm3, %xmm7
	addpd	%xmm1, %xmm7
	movupd	16(%rbp,%rcx,8), %xmm3
	mulpd	%xmm4, %xmm3
	addpd	%xmm2, %xmm3
	movupd	32(%rbp,%rcx,8), %xmm1
	mulpd	%xmm5, %xmm1
	addpd	%xmm7, %xmm1
	movupd	48(%rbp,%rcx,8), %xmm2
	mulpd	%xmm6, %xmm2
	addpd	%xmm3, %xmm2
	addq	$8, %rcx
	cmpq	$1024, %rcx                     # imm = 0x400
	jne	.LBB6_30
# %bb.31:                               # %middle.block280
                                        #   in Loop: Header=BB6_29 Depth=3
	addpd	%xmm1, %xmm2
	movapd	%xmm2, %xmm1
	unpckhpd	%xmm2, %xmm1                    # xmm1 = xmm1[1],xmm2[1]
	addsd	%xmm2, %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%rdi,%rax,8)
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_29
# %bb.32:                               # %for.inc21.i213
                                        #   in Loop: Header=BB6_28 Depth=2
	addq	$1, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_28
# %bb.33:                               # %matmul_simd.exit214
                                        #   in Loop: Header=BB6_27 Depth=1
	addl	$1, %r9d
	cmpl	$20, %r9d
	jne	.LBB6_27
# %bb.34:                               # %for.end51
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r8, %xmm0
	addsd	%xmm0, %xmm8
	movsd	%xmm8, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	8(%rsp), %xmm0
	movzwl	16(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	subsd	(%rsp), %xmm1                   # 8-byte Folded Reload
	movsd	%xmm1, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %r8
	movzwl	16(%rsp), %eax
	xorps	%xmm4, %xmm4
	cvtsi2sd	%eax, %xmm4
	divsd	.LCPI6_1(%rip), %xmm4
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB6_35:                               # %for.cond1.preheader.i234.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_36 Depth 2
                                        #       Child Loop BB6_37 Depth 3
                                        #         Child Loop BB6_38 Depth 4
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_36:                               # %for.cond1.preheader.i234
                                        #   Parent Loop BB6_35 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_37 Depth 3
                                        #         Child Loop BB6_38 Depth 4
	movq	(%r12,%rdx,8), %rsi
	movq	(%r15,%rdx,8), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_37:                               # %for.cond4.preheader.i237
                                        #   Parent Loop BB6_35 Depth=1
                                        #     Parent Loop BB6_36 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_38 Depth 4
	movq	(%rbx,%rax,8), %rbp
	xorpd	%xmm0, %xmm0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB6_38:                               # %for.body6.i246
                                        #   Parent Loop BB6_35 Depth=1
                                        #     Parent Loop BB6_36 Depth=2
                                        #       Parent Loop BB6_37 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movsd	(%rsi,%rcx,8), %xmm1            # xmm1 = mem[0],zero
	movsd	8(%rsi,%rcx,8), %xmm2           # xmm2 = mem[0],zero
	mulsd	(%rbp,%rcx,8), %xmm1
	mulsd	8(%rbp,%rcx,8), %xmm2
	addsd	%xmm0, %xmm1
	movsd	16(%rsi,%rcx,8), %xmm3          # xmm3 = mem[0],zero
	mulsd	16(%rbp,%rcx,8), %xmm3
	addsd	%xmm1, %xmm2
	movsd	24(%rsi,%rcx,8), %xmm0          # xmm0 = mem[0],zero
	mulsd	24(%rbp,%rcx,8), %xmm0
	addsd	%xmm2, %xmm3
	addsd	%xmm3, %xmm0
	addq	$4, %rcx
	cmpq	$1024, %rcx                     # imm = 0x400
	jne	.LBB6_38
# %bb.39:                               # %for.end.i250
                                        #   in Loop: Header=BB6_37 Depth=3
	movsd	%xmm0, (%rdi,%rax,8)
	addq	$1, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_37
# %bb.40:                               # %for.inc20.i253
                                        #   in Loop: Header=BB6_36 Depth=2
	addq	$1, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_36
# %bb.41:                               # %matmul_serial.exit254
                                        #   in Loop: Header=BB6_35 Depth=1
	addl	$1, %r9d
	cmpl	$20, %r9d
	jne	.LBB6_35
# %bb.42:                               # %for.end60
	xorpd	%xmm1, %xmm1
	movsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)                   # 8-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r8, %xmm0
	addsd	%xmm0, %xmm4
	movsd	%xmm4, 24(%rsp)                 # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	8(%rsp), %xmm0
	movzwl	16(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	subsd	24(%rsp), %xmm1                 # 8-byte Folded Reload
	addsd	.LCPI6_5, %xmm1
	movsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	movq	%r12, %rdi
	callq	print_matrix
	movq	%rbx, %rdi
	callq	print_matrix
	movl	$.L.str.4, %edi
	callq	puts
	movq	%r14, %rdi
	callq	print_matrix
	movl	$.L.str.5, %edi
	callq	puts
	movq	%r15, %rdi
	callq	print_matrix
	movsd	.LCPI6_2(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movsd	.LCPI6_3(%rip), %xmm2           # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm3
	divsd	%xmm1, %xmm3
	movsd	%xmm3, 32(%rsp)                 # 8-byte Spill
	mulsd	24(%rsp), %xmm0                 # 8-byte Folded Reload
	divsd	%xmm0, %xmm2
	movsd	%xmm2, 40(%rsp)                 # 8-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	xorl	%ebx, %ebx
	movl	$.L.str.7, %edi
	movl	$1024, %esi                     # imm = 0x400
	xorl	%eax, %eax
	callq	printf
	movl	$.Lstr.15, %edi
	callq	puts
	movl	$.Lstr.14, %edi
	callq	puts
	movl	$.Lstr.15, %edi
	callq	puts
	movsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	.LCPI6_4(%rip), %xmm0
	movl	$.L.str.10, %edi
	movsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	movsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	.LCPI6_4(%rip), %xmm0
	movl	$.L.str.11, %edi
	movsd	40(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	xorpd	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB6_43:                               # %for.cond1.preheader.i172
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_44 Depth 2
	movq	(%r14,%rbx,8), %rax
	movq	(%r15,%rbx,8), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_44:                               # %for.body4.i
                                        #   Parent Loop BB6_43 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%rax,%rdx,8), %xmm3            # xmm3 = mem[0],zero
	movsd	8(%rax,%rdx,8), %xmm1           # xmm1 = mem[0],zero
	subsd	(%rcx,%rdx,8), %xmm3
	subsd	8(%rcx,%rdx,8), %xmm1
	addsd	%xmm0, %xmm3
	movsd	16(%rax,%rdx,8), %xmm2          # xmm2 = mem[0],zero
	subsd	16(%rcx,%rdx,8), %xmm2
	addsd	%xmm3, %xmm1
	movsd	24(%rax,%rdx,8), %xmm0          # xmm0 = mem[0],zero
	subsd	24(%rcx,%rdx,8), %xmm0
	addsd	%xmm1, %xmm2
	addsd	%xmm2, %xmm0
	addq	$4, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_44
# %bb.45:                               # %for.cond.cleanup3.i
                                        #   in Loop: Header=BB6_43 Depth=1
	addq	$1, %rbx
	cmpq	$1024, %rbx                     # imm = 0x400
	jne	.LBB6_43
# %bb.46:                               # %check.exit
	movl	$.L.str.12, %edi
	movb	$1, %al
	callq	printf
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
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"%.2f "
	.size	.L.str.1, 6

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

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n"
	.size	.L.str.7, 59

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

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"======================================================================================================"
	.size	.Lstr, 103

	.type	.Lstr.14,@object                # @str.14
.Lstr.14:
	.asciz	"Performance:\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.14, 34

	.type	.Lstr.15,@object                # @str.15
.Lstr.15:
	.asciz	"------------------------------------------------------------------------------------------------------"
	.size	.Lstr.15, 103

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
