	.text
	.file	"rose_matmul_int_avx512.c"
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
	vcvtsi2sdq	8(%rsp), %xmm0, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vdivsd	.LCPI0_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
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
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movq	(%r14,%r15,8), %rcx
	movl	%eax, (%rcx,%rbx,4)
	incq	%rbx
	cmpq	$1024, %rbx                     # imm = 0x400
	jne	.LBB1_2
# %bb.3:                                # %for.inc6
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r15
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
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
                                        #       Child Loop BB2_3 Depth 3
	movq	(%rdi,%r8,8), %r11
	movq	(%rdx,%r8,8), %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB2_2:                                # %for.cond4.preheader
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_3 Depth 3
	movq	(%rsi,%r10,8), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-16, %rcx
	.p2align	4, 0x90
.LBB2_3:                                # %for.body6
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu64	64(%rax,%rcx,4), %zmm1
	vmovdqu64	128(%rax,%rcx,4), %zmm2
	vmovdqu64	192(%rax,%rcx,4), %zmm3
	vmovdqu64	256(%rax,%rcx,4), %zmm4
	vpmulld	64(%r11,%rcx,4), %zmm1, %zmm1
	vpmulld	128(%r11,%rcx,4), %zmm2, %zmm2
	vpmulld	192(%r11,%rcx,4), %zmm3, %zmm3
	vpmulld	256(%r11,%rcx,4), %zmm4, %zmm4
	vpaddd	%zmm0, %zmm1, %zmm0
	vmovdqu64	320(%rax,%rcx,4), %zmm1
	vpmulld	320(%r11,%rcx,4), %zmm1, %zmm1
	vpaddd	%zmm3, %zmm2, %zmm2
	vmovdqu64	384(%rax,%rcx,4), %zmm3
	vpmulld	384(%r11,%rcx,4), %zmm3, %zmm3
	vpaddd	%zmm2, %zmm0, %zmm0
	vmovdqu64	448(%rax,%rcx,4), %zmm2
	vpmulld	448(%r11,%rcx,4), %zmm2, %zmm2
	vpaddd	%zmm1, %zmm4, %zmm1
	vmovdqu64	512(%rax,%rcx,4), %zmm4
	vpmulld	512(%r11,%rcx,4), %zmm4, %zmm4
	vpaddd	%zmm3, %zmm1, %zmm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vpaddd	%zmm4, %zmm2, %zmm1
	vpaddd	%zmm1, %zmm0, %zmm0
	subq	$-128, %rcx
	cmpq	$1008, %rcx                     # imm = 0x3F0
	jb	.LBB2_3
# %bb.4:                                # %for.end
                                        #   in Loop: Header=BB2_2 Depth=2
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%ymm0, %ymm1, %ymm0
	vphaddd	%ymm0, %ymm0, %ymm0
	vphaddd	%ymm0, %ymm0, %ymm0
	vpermq	$255, %ymm0, %ymm1              # ymm1 = ymm0[3,3,3,3]
	vpaddd	%xmm0, %xmm1, %xmm0
	vmovd	%xmm0, (%r9,%r10,4)
	incq	%r10
	cmpq	$1024, %r10                     # imm = 0x400
	jne	.LBB2_2
# %bb.5:                                # %for.inc32
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB2_1
# %bb.6:                                # %for.end34
	vzeroupper
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
	movl	(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movl	4(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movl	8(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movl	12(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movl	16(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movl	20(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movl	24(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%r14,%rbx,8), %rax
	movl	28(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.2, %edi
	callq	puts
	incq	%rbx
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
	vpxor	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB4_3:                                # %vector.body
                                        #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu	(%rax,%rcx,4), %ymm4
	vmovdqu	32(%rax,%rcx,4), %ymm5
	vmovdqu	64(%rax,%rcx,4), %ymm6
	vmovdqu	96(%rax,%rcx,4), %ymm7
	vpmulld	(%r11,%rcx,4), %ymm4, %ymm4
	vpmulld	32(%r11,%rcx,4), %ymm5, %ymm5
	vpaddd	%ymm0, %ymm4, %ymm0
	vpaddd	%ymm1, %ymm5, %ymm1
	vpmulld	64(%r11,%rcx,4), %ymm6, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpmulld	96(%r11,%rcx,4), %ymm7, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	vmovdqu	128(%rax,%rcx,4), %ymm4
	vmovdqu	160(%rax,%rcx,4), %ymm5
	vmovdqu	192(%rax,%rcx,4), %ymm6
	vmovdqu	224(%rax,%rcx,4), %ymm7
	vpmulld	128(%r11,%rcx,4), %ymm4, %ymm4
	vpmulld	160(%r11,%rcx,4), %ymm5, %ymm5
	vpaddd	%ymm0, %ymm4, %ymm0
	vpaddd	%ymm1, %ymm5, %ymm1
	vpmulld	192(%r11,%rcx,4), %ymm6, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpmulld	224(%r11,%rcx,4), %ymm7, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	addq	$64, %rcx
	cmpq	$1024, %rcx                     # imm = 0x400
	jne	.LBB4_3
# %bb.4:                                # %middle.block
                                        #   in Loop: Header=BB4_2 Depth=2
	vpaddd	%ymm0, %ymm1, %ymm0
	vpaddd	%ymm0, %ymm2, %ymm0
	vpaddd	%ymm0, %ymm3, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, (%r9,%r10,4)
	incq	%r10
	cmpq	$1024, %r10                     # imm = 0x400
	jne	.LBB4_2
# %bb.5:                                # %for.inc20
                                        #   in Loop: Header=BB4_1 Depth=1
	incq	%r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB4_1
# %bb.6:                                # %for.end22
	vzeroupper
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
	xorl	%r8d, %r8d
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_2 Depth 2
	movq	(%rdi,%r8,8), %rdx
	movq	(%rsi,%r8,8), %rcx
	vmovd	%eax, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%eax, %eax
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_2:                                # %vector.body
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqu	(%rcx,%rax,4), %ymm4
	vmovdqu	32(%rcx,%rax,4), %ymm5
	vmovdqu	64(%rcx,%rax,4), %ymm6
	vmovdqu	96(%rcx,%rax,4), %ymm7
	vpaddd	(%rdx,%rax,4), %ymm0, %ymm0
	vpaddd	32(%rdx,%rax,4), %ymm1, %ymm1
	vpaddd	64(%rdx,%rax,4), %ymm2, %ymm2
	vpaddd	96(%rdx,%rax,4), %ymm3, %ymm3
	vpaddd	128(%rdx,%rax,4), %ymm0, %ymm0
	vpaddd	128(%rcx,%rax,4), %ymm4, %ymm4
	vpsubd	%ymm4, %ymm0, %ymm0
	vpaddd	160(%rdx,%rax,4), %ymm1, %ymm1
	vpaddd	160(%rcx,%rax,4), %ymm5, %ymm4
	vpsubd	%ymm4, %ymm1, %ymm1
	vpaddd	192(%rdx,%rax,4), %ymm2, %ymm2
	vpaddd	192(%rcx,%rax,4), %ymm6, %ymm4
	vpaddd	224(%rdx,%rax,4), %ymm3, %ymm3
	vpsubd	%ymm4, %ymm2, %ymm2
	vpaddd	224(%rcx,%rax,4), %ymm7, %ymm4
	vpsubd	%ymm4, %ymm3, %ymm3
	addq	$64, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB5_2
# %bb.3:                                # %middle.block
                                        #   in Loop: Header=BB5_1 Depth=1
	vpaddd	%ymm0, %ymm1, %ymm0
	vpaddd	%ymm0, %ymm2, %ymm0
	vpaddd	%ymm0, %ymm3, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	incq	%r8
	cmpq	$1024, %r8                      # imm = 0x400
	jne	.LBB5_1
# %bb.4:                                # %for.cond.cleanup
	vzeroupper
	retq
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI6_0:
	.quad	0x408f400000000000              # double 1000
.LCPI6_1:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI6_2:
	.quad	0x4224000000000000              # double 42949672960
.LCPI6_3:
	.quad	0x4034000000000000              # double 20
.LCPI6_4:
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
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, (%r12,%rbp,8)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, (%r13,%rbp,8)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, (%r14,%rbp,8)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, (%r15,%rbp,8)
	movl	$4096, %edi                     # imm = 0x1000
	callq	malloc
	movq	%rax, (%rbx,%rbp,8)
	incq	%rbp
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
	cltq
	imulq	$-1610612725, %rax, %rcx        # imm = 0xA000000B
	shrq	$32, %rcx
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	sarl	$27, %eax
	addl	%ecx, %eax
	movq	(%r12,%rbp,8), %rcx
	movl	%eax, (%rcx,%r14,4)
	incq	%r14
	cmpq	$1024, %r14                     # imm = 0x400
	jne	.LBB6_4
# %bb.5:                                # %for.inc6.i
                                        #   in Loop: Header=BB6_3 Depth=1
	incq	%rbp
	cmpq	$1024, %rbp                     # imm = 0x400
	jne	.LBB6_3
# %bb.6:                                # %for.cond1.preheader.i153.preheader
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB6_7:                                # %for.cond1.preheader.i153
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_8 Depth 2
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB6_8:                                # %for.body3.i160
                                        #   Parent Loop BB6_7 Depth=1
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
	movq	(%r13,%r14,8), %rcx
	movl	%eax, (%rcx,%rbp,4)
	incq	%rbp
	cmpq	$1024, %rbp                     # imm = 0x400
	jne	.LBB6_8
# %bb.9:                                # %for.inc6.i163
                                        #   in Loop: Header=BB6_7 Depth=1
	incq	%r14
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
	movl	(%rsi,%rax,4), %esi
	movl	%esi, (%rcx,%rdx,4)
	movq	8(%r13,%rdx,8), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 4(%rcx,%rdx,4)
	movq	16(%r13,%rdx,8), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 8(%rcx,%rdx,4)
	movq	24(%r13,%rdx,8), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 12(%rcx,%rdx,4)
	movq	32(%r13,%rdx,8), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 16(%rcx,%rdx,4)
	movq	40(%r13,%rdx,8), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 20(%rcx,%rdx,4)
	movq	48(%r13,%rdx,8), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 24(%rcx,%rdx,4)
	movq	56(%r13,%rdx,8), %rsi
	movl	(%rsi,%rax,4), %esi
	movl	%esi, 28(%rcx,%rdx,4)
	addq	$8, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_12
# %bb.13:                               # %for.cond.cleanup27
                                        #   in Loop: Header=BB6_11 Depth=1
	incq	%rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_11
# %bb.14:                               # %for.cond1.preheader.i166.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_15:                               # %for.cond1.preheader.i166
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_16 Depth 2
                                        #       Child Loop BB6_17 Depth 3
	movq	(%r12,%rax,8), %rcx
	movq	(%r14,%rax,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_16:                               # %for.cond4.preheader.i
                                        #   Parent Loop BB6_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_17 Depth 3
	movq	(%rbx,%rsi,8), %rdi
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-16, %rbp
	.p2align	4, 0x90
.LBB6_17:                               # %for.body6.i
                                        #   Parent Loop BB6_15 Depth=1
                                        #     Parent Loop BB6_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu64	64(%rdi,%rbp,4), %zmm1
	vmovdqu64	128(%rdi,%rbp,4), %zmm2
	vmovdqu64	192(%rdi,%rbp,4), %zmm3
	vmovdqu64	256(%rdi,%rbp,4), %zmm4
	vpmulld	64(%rcx,%rbp,4), %zmm1, %zmm1
	vpmulld	128(%rcx,%rbp,4), %zmm2, %zmm2
	vpmulld	192(%rcx,%rbp,4), %zmm3, %zmm3
	vpmulld	256(%rcx,%rbp,4), %zmm4, %zmm4
	vpaddd	%zmm0, %zmm1, %zmm0
	vmovdqu64	320(%rdi,%rbp,4), %zmm1
	vpmulld	320(%rcx,%rbp,4), %zmm1, %zmm1
	vpaddd	%zmm3, %zmm2, %zmm2
	vmovdqu64	384(%rdi,%rbp,4), %zmm3
	vpmulld	384(%rcx,%rbp,4), %zmm3, %zmm3
	vpaddd	%zmm2, %zmm0, %zmm0
	vmovdqu64	448(%rdi,%rbp,4), %zmm2
	vpmulld	448(%rcx,%rbp,4), %zmm2, %zmm2
	vpaddd	%zmm1, %zmm4, %zmm1
	vmovdqu64	512(%rdi,%rbp,4), %zmm4
	vpmulld	512(%rcx,%rbp,4), %zmm4, %zmm4
	vpaddd	%zmm3, %zmm1, %zmm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vpaddd	%zmm4, %zmm2, %zmm1
	vpaddd	%zmm1, %zmm0, %zmm0
	subq	$-128, %rbp
	cmpq	$1008, %rbp                     # imm = 0x3F0
	jb	.LBB6_17
# %bb.18:                               # %for.end.i
                                        #   in Loop: Header=BB6_16 Depth=2
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%ymm0, %ymm1, %ymm0
	vphaddd	%ymm0, %ymm0, %ymm0
	vphaddd	%ymm0, %ymm0, %ymm0
	vpermq	$255, %ymm0, %ymm1              # ymm1 = ymm0[3,3,3,3]
	vpaddd	%xmm0, %xmm1, %xmm0
	vmovd	%xmm0, (%rdx,%rsi,4)
	incq	%rsi
	cmpq	$1024, %rsi                     # imm = 0x400
	jne	.LBB6_16
# %bb.19:                               # %for.inc32.i
                                        #   in Loop: Header=BB6_15 Depth=1
	incq	%rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_15
# %bb.20:                               # %for.cond1.preheader.i177.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_21:                               # %for.cond1.preheader.i177
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_22 Depth 2
                                        #       Child Loop BB6_23 Depth 3
	movq	(%r12,%rax,8), %rcx
	movq	(%r15,%rax,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_22:                               # %for.cond4.preheader.i179
                                        #   Parent Loop BB6_21 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_23 Depth 3
	movq	(%rbx,%rsi,8), %rdi
	vpxor	%xmm0, %xmm0, %xmm0
	xorl	%ebp, %ebp
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB6_23:                               # %vector.body
                                        #   Parent Loop BB6_21 Depth=1
                                        #     Parent Loop BB6_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu	(%rdi,%rbp,4), %ymm4
	vmovdqu	32(%rdi,%rbp,4), %ymm5
	vmovdqu	64(%rdi,%rbp,4), %ymm6
	vmovdqu	96(%rdi,%rbp,4), %ymm7
	vpmulld	(%rcx,%rbp,4), %ymm4, %ymm4
	vpmulld	32(%rcx,%rbp,4), %ymm5, %ymm5
	vpaddd	%ymm0, %ymm4, %ymm0
	vpaddd	%ymm1, %ymm5, %ymm1
	vpmulld	64(%rcx,%rbp,4), %ymm6, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpmulld	96(%rcx,%rbp,4), %ymm7, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	vmovdqu	128(%rdi,%rbp,4), %ymm4
	vmovdqu	160(%rdi,%rbp,4), %ymm5
	vmovdqu	192(%rdi,%rbp,4), %ymm6
	vmovdqu	224(%rdi,%rbp,4), %ymm7
	vpmulld	128(%rcx,%rbp,4), %ymm4, %ymm4
	vpmulld	160(%rcx,%rbp,4), %ymm5, %ymm5
	vpaddd	%ymm0, %ymm4, %ymm0
	vpaddd	%ymm1, %ymm5, %ymm1
	vpmulld	192(%rcx,%rbp,4), %ymm6, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpmulld	224(%rcx,%rbp,4), %ymm7, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	addq	$64, %rbp
	cmpq	$1024, %rbp                     # imm = 0x400
	jne	.LBB6_23
# %bb.24:                               # %middle.block
                                        #   in Loop: Header=BB6_22 Depth=2
	vpaddd	%ymm0, %ymm1, %ymm0
	vpaddd	%ymm0, %ymm2, %ymm0
	vpaddd	%ymm0, %ymm3, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, (%rdx,%rsi,4)
	incq	%rsi
	cmpq	$1024, %rsi                     # imm = 0x400
	jne	.LBB6_22
# %bb.25:                               # %for.inc20.i
                                        #   in Loop: Header=BB6_21 Depth=1
	incq	%rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_21
# %bb.26:                               # %matmul_serial.exit
	leaq	8(%rsp), %rdi
	vzeroupper
	callq	ftime
	movq	8(%rsp), %r8
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm8, %xmm0
	vdivsd	.LCPI6_0(%rip), %xmm0, %xmm0
	xorl	%r9d, %r9d
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
.LBB6_29:                               # %for.cond4.preheader.i196
                                        #   Parent Loop BB6_27 Depth=1
                                        #     Parent Loop BB6_28 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_30 Depth 4
	movq	(%rbx,%rax,8), %rbp
	vpxor	%xmm1, %xmm1, %xmm1
	movq	$-16, %rcx
	.p2align	4, 0x90
.LBB6_30:                               # %for.body6.i204
                                        #   Parent Loop BB6_27 Depth=1
                                        #     Parent Loop BB6_28 Depth=2
                                        #       Parent Loop BB6_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovdqu64	64(%rbp,%rcx,4), %zmm2
	vmovdqu64	128(%rbp,%rcx,4), %zmm3
	vmovdqu64	192(%rbp,%rcx,4), %zmm4
	vmovdqu64	256(%rbp,%rcx,4), %zmm5
	vpmulld	64(%rsi,%rcx,4), %zmm2, %zmm2
	vpmulld	128(%rsi,%rcx,4), %zmm3, %zmm3
	vpmulld	192(%rsi,%rcx,4), %zmm4, %zmm4
	vpmulld	256(%rsi,%rcx,4), %zmm5, %zmm5
	vpaddd	%zmm1, %zmm2, %zmm1
	vmovdqu64	320(%rbp,%rcx,4), %zmm2
	vpmulld	320(%rsi,%rcx,4), %zmm2, %zmm2
	vpaddd	%zmm4, %zmm3, %zmm3
	vmovdqu64	384(%rbp,%rcx,4), %zmm4
	vpmulld	384(%rsi,%rcx,4), %zmm4, %zmm4
	vpaddd	%zmm3, %zmm1, %zmm1
	vmovdqu64	448(%rbp,%rcx,4), %zmm3
	vpmulld	448(%rsi,%rcx,4), %zmm3, %zmm3
	vpaddd	%zmm2, %zmm5, %zmm2
	vmovdqu64	512(%rbp,%rcx,4), %zmm5
	vpmulld	512(%rsi,%rcx,4), %zmm5, %zmm5
	vpaddd	%zmm4, %zmm2, %zmm2
	vpaddd	%zmm2, %zmm1, %zmm1
	vpaddd	%zmm5, %zmm3, %zmm2
	vpaddd	%zmm2, %zmm1, %zmm1
	subq	$-128, %rcx
	cmpq	$1008, %rcx                     # imm = 0x3F0
	jb	.LBB6_30
# %bb.31:                               # %for.end.i214
                                        #   in Loop: Header=BB6_29 Depth=3
	vextracti64x4	$1, %zmm1, %ymm2
	vpaddd	%ymm1, %ymm2, %ymm1
	vphaddd	%ymm1, %ymm1, %ymm1
	vphaddd	%ymm1, %ymm1, %ymm1
	vpermq	$255, %ymm1, %ymm2              # ymm2 = ymm1[3,3,3,3]
	vpaddd	%xmm1, %xmm2, %xmm1
	vmovd	%xmm1, (%rdi,%rax,4)
	incq	%rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_29
# %bb.32:                               # %for.inc32.i217
                                        #   in Loop: Header=BB6_28 Depth=2
	incq	%rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_28
# %bb.33:                               # %matmul_simd.exit218
                                        #   in Loop: Header=BB6_27 Depth=1
	incl	%r9d
	cmpl	$20, %r9d
	jne	.LBB6_27
# %bb.34:                               # %for.end51
	vcvtsi2sd	%r8, %xmm8, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	8(%rsp), %xmm8, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm8, %xmm1
	vdivsd	.LCPI6_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	(%rsp), %xmm0, %xmm0            # 8-byte Folded Reload
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %r8
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm8, %xmm0
	vdivsd	.LCPI6_0(%rip), %xmm0, %xmm0
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB6_35:                               # %for.cond1.preheader.i238.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_36 Depth 2
                                        #       Child Loop BB6_37 Depth 3
                                        #         Child Loop BB6_38 Depth 4
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_36:                               # %for.cond1.preheader.i238
                                        #   Parent Loop BB6_35 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_37 Depth 3
                                        #         Child Loop BB6_38 Depth 4
	movq	(%r12,%rdx,8), %rsi
	movq	(%r15,%rdx,8), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_37:                               # %for.cond4.preheader.i241
                                        #   Parent Loop BB6_35 Depth=1
                                        #     Parent Loop BB6_36 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_38 Depth 4
	movq	(%rbx,%rax,8), %rbp
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB6_38:                               # %vector.body294
                                        #   Parent Loop BB6_35 Depth=1
                                        #     Parent Loop BB6_36 Depth=2
                                        #       Parent Loop BB6_37 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovdqu	(%rbp,%rcx,4), %ymm5
	vmovdqu	32(%rbp,%rcx,4), %ymm6
	vmovdqu	64(%rbp,%rcx,4), %ymm7
	vmovdqu	96(%rbp,%rcx,4), %ymm8
	vpmulld	(%rsi,%rcx,4), %ymm5, %ymm5
	vpmulld	32(%rsi,%rcx,4), %ymm6, %ymm6
	vpaddd	%ymm1, %ymm5, %ymm1
	vpaddd	%ymm2, %ymm6, %ymm2
	vpmulld	64(%rsi,%rcx,4), %ymm7, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm3
	vpmulld	96(%rsi,%rcx,4), %ymm8, %ymm5
	vpaddd	%ymm4, %ymm5, %ymm4
	vmovdqu	128(%rbp,%rcx,4), %ymm5
	vmovdqu	160(%rbp,%rcx,4), %ymm6
	vmovdqu	192(%rbp,%rcx,4), %ymm7
	vmovdqu	224(%rbp,%rcx,4), %ymm8
	vpmulld	128(%rsi,%rcx,4), %ymm5, %ymm5
	vpmulld	160(%rsi,%rcx,4), %ymm6, %ymm6
	vpaddd	%ymm1, %ymm5, %ymm1
	vpaddd	%ymm2, %ymm6, %ymm2
	vpmulld	192(%rsi,%rcx,4), %ymm7, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm3
	vpmulld	224(%rsi,%rcx,4), %ymm8, %ymm5
	vpaddd	%ymm4, %ymm5, %ymm4
	addq	$64, %rcx
	cmpq	$1024, %rcx                     # imm = 0x400
	jne	.LBB6_38
# %bb.39:                               # %middle.block292
                                        #   in Loop: Header=BB6_37 Depth=3
	vpaddd	%ymm1, %ymm2, %ymm1
	vpaddd	%ymm1, %ymm3, %ymm1
	vpaddd	%ymm1, %ymm4, %ymm1
	vextracti128	$1, %ymm1, %xmm2
	vpaddd	%xmm2, %xmm1, %xmm1
	vpshufd	$238, %xmm1, %xmm2              # xmm2 = xmm1[2,3,2,3]
	vpaddd	%xmm2, %xmm1, %xmm1
	vpshufd	$85, %xmm1, %xmm2               # xmm2 = xmm1[1,1,1,1]
	vpaddd	%xmm2, %xmm1, %xmm1
	vmovd	%xmm1, (%rdi,%rax,4)
	incq	%rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB6_37
# %bb.40:                               # %for.inc20.i257
                                        #   in Loop: Header=BB6_36 Depth=2
	incq	%rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_36
# %bb.41:                               # %matmul_serial.exit258
                                        #   in Loop: Header=BB6_35 Depth=1
	incl	%r9d
	cmpl	$20, %r9d
	jne	.LBB6_35
# %bb.42:                               # %for.end60
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	(%rsp), %xmm1, %xmm1            # 8-byte Folded Reload
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vcvtsi2sd	%r8, %xmm9, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	8(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	8(%rsp), %xmm9, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm9, %xmm1
	vdivsd	.LCPI6_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vaddsd	.LCPI6_4, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
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
	vmovsd	.LCPI6_1(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	(%rsp), %xmm0, %xmm1            # 8-byte Folded Reload
	vmovsd	.LCPI6_2(%rip), %xmm2           # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 32(%rsp)                 # 8-byte Spill
	vmulsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vdivsd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, 40(%rsp)                 # 8-byte Spill
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
	vmovsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_3(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI6_3(%rip), %xmm0, %xmm0
	movl	$.L.str.11, %edi
	vmovq	40(%rsp), %xmm1                 # 8-byte Folded Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_43:                               # %for.cond1.preheader.i172
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_44 Depth 2
	movq	(%r14,%rbx,8), %rax
	movq	(%r15,%rbx,8), %rcx
	vmovd	%esi, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%edx, %edx
	vxorpd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB6_44:                               # %vector.body318
                                        #   Parent Loop BB6_43 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqu	(%rcx,%rdx,4), %ymm4
	vmovdqu	32(%rcx,%rdx,4), %ymm5
	vmovdqu	64(%rcx,%rdx,4), %ymm6
	vmovdqu	96(%rcx,%rdx,4), %ymm7
	vpaddd	(%rax,%rdx,4), %ymm0, %ymm0
	vpaddd	32(%rax,%rdx,4), %ymm1, %ymm1
	vpaddd	64(%rax,%rdx,4), %ymm2, %ymm2
	vpaddd	96(%rax,%rdx,4), %ymm3, %ymm3
	vpaddd	128(%rax,%rdx,4), %ymm0, %ymm0
	vpaddd	128(%rcx,%rdx,4), %ymm4, %ymm4
	vpsubd	%ymm4, %ymm0, %ymm0
	vpaddd	160(%rax,%rdx,4), %ymm1, %ymm1
	vpaddd	160(%rcx,%rdx,4), %ymm5, %ymm4
	vpsubd	%ymm4, %ymm1, %ymm1
	vpaddd	192(%rax,%rdx,4), %ymm2, %ymm2
	vpaddd	192(%rcx,%rdx,4), %ymm6, %ymm4
	vpaddd	224(%rax,%rdx,4), %ymm3, %ymm3
	vpsubd	%ymm4, %ymm2, %ymm2
	vpaddd	224(%rcx,%rdx,4), %ymm7, %ymm4
	vpsubd	%ymm4, %ymm3, %ymm3
	addq	$64, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB6_44
# %bb.45:                               # %middle.block316
                                        #   in Loop: Header=BB6_43 Depth=1
	vpaddd	%ymm0, %ymm1, %ymm0
	vpaddd	%ymm0, %ymm2, %ymm0
	vpaddd	%ymm0, %ymm3, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %esi
	incq	%rbx
	cmpq	$1024, %rbx                     # imm = 0x400
	jne	.LBB6_43
# %bb.46:                               # %check.exit
	movl	$.L.str.12, %edi
	xorl	%eax, %eax
	vzeroupper
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
	.asciz	"Correctness check: %d\n"
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
