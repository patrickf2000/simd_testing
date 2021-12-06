	.text
	.file	"rose_matvec_int_avx512.c"
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
	incq	%rbx
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
	incq	%r15
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
	addq	$448, %rdi                      # imm = 0x1C0
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-16, %rcx
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqu64	64(%rsi,%rcx,4), %zmm1
	vmovdqu64	128(%rsi,%rcx,4), %zmm2
	vmovdqu64	192(%rsi,%rcx,4), %zmm3
	vmovdqu64	256(%rsi,%rcx,4), %zmm4
	vpmulld	-384(%rdi,%rcx,4), %zmm1, %zmm1
	vpmulld	-320(%rdi,%rcx,4), %zmm2, %zmm2
	vpmulld	-256(%rdi,%rcx,4), %zmm3, %zmm3
	vpmulld	-192(%rdi,%rcx,4), %zmm4, %zmm4
	vpaddd	%zmm0, %zmm1, %zmm0
	vmovdqu64	320(%rsi,%rcx,4), %zmm1
	vpmulld	-128(%rdi,%rcx,4), %zmm1, %zmm1
	vpaddd	%zmm3, %zmm2, %zmm2
	vmovdqu64	384(%rsi,%rcx,4), %zmm3
	vpmulld	-64(%rdi,%rcx,4), %zmm3, %zmm3
	vpaddd	%zmm2, %zmm0, %zmm0
	vmovdqu64	448(%rsi,%rcx,4), %zmm2
	vpmulld	(%rdi,%rcx,4), %zmm2, %zmm2
	vpaddd	%zmm1, %zmm4, %zmm1
	vmovdqu64	512(%rsi,%rcx,4), %zmm4
	vpmulld	64(%rdi,%rcx,4), %zmm4, %zmm4
	vpaddd	%zmm3, %zmm1, %zmm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vpaddd	%zmm4, %zmm2, %zmm1
	vpaddd	%zmm1, %zmm0, %zmm0
	subq	$-128, %rcx
	cmpq	$10224, %rcx                    # imm = 0x27F0
	jb	.LBB2_2
# %bb.3:                                # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%ymm0, %ymm1, %ymm0
	vphaddd	%ymm0, %ymm0, %ymm0
	vphaddd	%ymm0, %ymm0, %ymm0
	vpermq	$255, %ymm0, %ymm1              # ymm1 = ymm0[3,3,3,3]
	vpaddd	%xmm0, %xmm1, %xmm0
	vmovd	%xmm0, (%rdx,%rax,4)
	incq	%rax
	addq	$40960, %rdi                    # imm = 0xA000
	cmpq	$10240, %rax                    # imm = 0x2800
	jne	.LBB2_1
# %bb.4:                                # %for.cond.cleanup
	vzeroupper
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
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$56, %ecx
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB3_2:                                # %vector.body
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqu	-224(%rsi,%rcx,4), %ymm4
	vmovdqu	-192(%rsi,%rcx,4), %ymm5
	vmovdqu	-160(%rsi,%rcx,4), %ymm6
	vmovdqu	-128(%rsi,%rcx,4), %ymm7
	vpmulld	-224(%rdi,%rcx,4), %ymm4, %ymm4
	vpmulld	-192(%rdi,%rcx,4), %ymm5, %ymm5
	vpaddd	%ymm0, %ymm4, %ymm0
	vpaddd	%ymm1, %ymm5, %ymm1
	vpmulld	-160(%rdi,%rcx,4), %ymm6, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpmulld	-128(%rdi,%rcx,4), %ymm7, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	vmovdqu	-96(%rsi,%rcx,4), %ymm4
	vmovdqu	-64(%rsi,%rcx,4), %ymm5
	vmovdqu	-32(%rsi,%rcx,4), %ymm6
	vmovdqu	(%rsi,%rcx,4), %ymm7
	vpmulld	-96(%rdi,%rcx,4), %ymm4, %ymm4
	vpmulld	-64(%rdi,%rcx,4), %ymm5, %ymm5
	vpaddd	%ymm0, %ymm4, %ymm0
	vpaddd	%ymm1, %ymm5, %ymm1
	vpmulld	-32(%rdi,%rcx,4), %ymm6, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpmulld	(%rdi,%rcx,4), %ymm7, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	addq	$64, %rcx
	cmpq	$10296, %rcx                    # imm = 0x2838
	jne	.LBB3_2
# %bb.3:                                # %middle.block
                                        #   in Loop: Header=BB3_1 Depth=1
	vpaddd	%ymm0, %ymm1, %ymm0
	vpaddd	%ymm0, %ymm2, %ymm0
	vpaddd	%ymm0, %ymm3, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, (%rdx,%rax,4)
	incq	%rax
	addq	$40960, %rdi                    # imm = 0xA000
	cmpq	$10240, %rax                    # imm = 0x2800
	jne	.LBB3_1
# %bb.4:                                # %for.cond.cleanup
	vzeroupper
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
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$56, %eax
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB6_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	-224(%rdi,%rax,4), %ymm4
	vmovdqu	-192(%rdi,%rax,4), %ymm5
	vmovdqu	-160(%rdi,%rax,4), %ymm6
	vmovdqu	-128(%rdi,%rax,4), %ymm7
	vpsubd	-224(%rsi,%rax,4), %ymm4, %ymm4
	vpsubd	-192(%rsi,%rax,4), %ymm5, %ymm5
	vpsubd	-160(%rsi,%rax,4), %ymm6, %ymm6
	vpsubd	-128(%rsi,%rax,4), %ymm7, %ymm7
	vpabsd	%ymm4, %ymm4
	vpaddd	%ymm0, %ymm4, %ymm0
	vpabsd	%ymm5, %ymm4
	vpaddd	%ymm1, %ymm4, %ymm1
	vpabsd	%ymm6, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpabsd	%ymm7, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	vmovdqu	-96(%rdi,%rax,4), %ymm4
	vmovdqu	-64(%rdi,%rax,4), %ymm5
	vmovdqu	-32(%rdi,%rax,4), %ymm6
	vmovdqu	(%rdi,%rax,4), %ymm7
	vpsubd	-96(%rsi,%rax,4), %ymm4, %ymm4
	vpsubd	-64(%rsi,%rax,4), %ymm5, %ymm5
	vpsubd	-32(%rsi,%rax,4), %ymm6, %ymm6
	vpsubd	(%rsi,%rax,4), %ymm7, %ymm7
	vpabsd	%ymm4, %ymm4
	vpaddd	%ymm0, %ymm4, %ymm0
	vpabsd	%ymm5, %ymm4
	vpaddd	%ymm1, %ymm4, %ymm1
	vpabsd	%ymm6, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpabsd	%ymm7, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	addq	$64, %rax
	cmpq	$10296, %rax                    # imm = 0x2838
	jne	.LBB6_1
# %bb.2:                                # %middle.block
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
	vzeroupper
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
	movq	%rax, %r15
	movq	%rax, (%rsp)                    # 8-byte Spill
	movl	$40960, %edi                    # imm = 0xA000
	callq	malloc
	movq	%rax, %rbx
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	movq	%r15, 48(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB7_1:                                # %for.cond1.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_2 Depth 2
	xorl	%r13d, %r13d
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
	movl	%eax, (%r15,%r13,4)
	incq	%r13
	cmpq	$10240, %r13                    # imm = 0x2800
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
	movl	%eax, (%rbx,%rbp,4)
	incq	%rbp
	addq	$40960, %r15                    # imm = 0xA000
	cmpq	$10240, %rbp                    # imm = 0x2800
	jne	.LBB7_1
# %bb.4:                                # %for.cond1.preheader.i72.preheader
	movq	(%rsp), %rbp                    # 8-byte Reload
	leaq	448(%rbp), %rax
	xorl	%ecx, %ecx
	movq	48(%rsp), %r15                  # 8-byte Reload
	.p2align	4, 0x90
.LBB7_5:                                # %for.cond1.preheader.i72
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_6 Depth 2
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$-16, %rdx
	.p2align	4, 0x90
.LBB7_6:                                # %for.body3.i
                                        #   Parent Loop BB7_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqu64	64(%rbx,%rdx,4), %zmm1
	vmovdqu64	128(%rbx,%rdx,4), %zmm2
	vmovdqu64	192(%rbx,%rdx,4), %zmm3
	vmovdqu64	256(%rbx,%rdx,4), %zmm4
	vpmulld	-384(%rax,%rdx,4), %zmm1, %zmm1
	vpmulld	-320(%rax,%rdx,4), %zmm2, %zmm2
	vpmulld	-256(%rax,%rdx,4), %zmm3, %zmm3
	vpmulld	-192(%rax,%rdx,4), %zmm4, %zmm4
	vpaddd	%zmm0, %zmm1, %zmm0
	vmovdqu64	320(%rbx,%rdx,4), %zmm1
	vpmulld	-128(%rax,%rdx,4), %zmm1, %zmm1
	vpaddd	%zmm3, %zmm2, %zmm2
	vmovdqu64	384(%rbx,%rdx,4), %zmm3
	vpmulld	-64(%rax,%rdx,4), %zmm3, %zmm3
	vpaddd	%zmm2, %zmm0, %zmm0
	vmovdqu64	448(%rbx,%rdx,4), %zmm2
	vpmulld	(%rax,%rdx,4), %zmm2, %zmm2
	vpaddd	%zmm1, %zmm4, %zmm1
	vmovdqu64	512(%rbx,%rdx,4), %zmm4
	vpmulld	64(%rax,%rdx,4), %zmm4, %zmm4
	vpaddd	%zmm3, %zmm1, %zmm1
	vpaddd	%zmm1, %zmm0, %zmm0
	vpaddd	%zmm4, %zmm2, %zmm1
	vpaddd	%zmm1, %zmm0, %zmm0
	subq	$-128, %rdx
	cmpq	$10224, %rdx                    # imm = 0x27F0
	jb	.LBB7_6
# %bb.7:                                # %for.end.i
                                        #   in Loop: Header=BB7_5 Depth=1
	vextracti64x4	$1, %zmm0, %ymm1
	vpaddd	%ymm0, %ymm1, %ymm0
	vphaddd	%ymm0, %ymm0, %ymm0
	vphaddd	%ymm0, %ymm0, %ymm0
	vpermq	$255, %ymm0, %ymm1              # ymm1 = ymm0[3,3,3,3]
	vpaddd	%xmm0, %xmm1, %xmm0
	vmovd	%xmm0, (%r12,%rcx,4)
	incq	%rcx
	addq	$40960, %rax                    # imm = 0xA000
	cmpq	$10240, %rcx                    # imm = 0x2800
	jne	.LBB7_5
# %bb.8:                                # %matvec_simd.exit
	leaq	8(%rsp), %rdi
	vzeroupper
	callq	ftime
	movq	8(%rsp), %rax
	movzwl	16(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm5, %xmm0
	vdivsd	.LCPI7_0(%rip), %xmm0, %xmm0
	addq	$448, %rbp                      # imm = 0x1C0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_9:                                # %for.cond1.preheader.i96.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_10 Depth 2
                                        #       Child Loop BB7_11 Depth 3
	movq	%rbp, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB7_10:                               # %for.cond1.preheader.i96
                                        #   Parent Loop BB7_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_11 Depth 3
	vpxor	%xmm1, %xmm1, %xmm1
	movq	$-16, %rdi
	.p2align	4, 0x90
.LBB7_11:                               # %for.body3.i104
                                        #   Parent Loop BB7_9 Depth=1
                                        #     Parent Loop BB7_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu64	64(%rbx,%rdi,4), %zmm2
	vmovdqu64	128(%rbx,%rdi,4), %zmm3
	vmovdqu64	192(%rbx,%rdi,4), %zmm4
	vmovdqu64	256(%rbx,%rdi,4), %zmm5
	vpmulld	-384(%rdx,%rdi,4), %zmm2, %zmm2
	vpmulld	-320(%rdx,%rdi,4), %zmm3, %zmm3
	vpmulld	-256(%rdx,%rdi,4), %zmm4, %zmm4
	vpmulld	-192(%rdx,%rdi,4), %zmm5, %zmm5
	vpaddd	%zmm1, %zmm2, %zmm1
	vmovdqu64	320(%rbx,%rdi,4), %zmm2
	vpmulld	-128(%rdx,%rdi,4), %zmm2, %zmm2
	vpaddd	%zmm4, %zmm3, %zmm3
	vmovdqu64	384(%rbx,%rdi,4), %zmm4
	vpmulld	-64(%rdx,%rdi,4), %zmm4, %zmm4
	vpaddd	%zmm3, %zmm1, %zmm1
	vmovdqu64	448(%rbx,%rdi,4), %zmm3
	vpmulld	(%rdx,%rdi,4), %zmm3, %zmm3
	vpaddd	%zmm2, %zmm5, %zmm2
	vmovdqu64	512(%rbx,%rdi,4), %zmm5
	vpmulld	64(%rdx,%rdi,4), %zmm5, %zmm5
	vpaddd	%zmm4, %zmm2, %zmm2
	vpaddd	%zmm2, %zmm1, %zmm1
	vpaddd	%zmm5, %zmm3, %zmm2
	vpaddd	%zmm2, %zmm1, %zmm1
	subq	$-128, %rdi
	cmpq	$10224, %rdi                    # imm = 0x27F0
	jb	.LBB7_11
# %bb.12:                               # %for.end.i114
                                        #   in Loop: Header=BB7_10 Depth=2
	vextracti64x4	$1, %zmm1, %ymm2
	vpaddd	%ymm1, %ymm2, %ymm1
	vphaddd	%ymm1, %ymm1, %ymm1
	vphaddd	%ymm1, %ymm1, %ymm1
	vpermq	$255, %ymm1, %ymm2              # ymm2 = ymm1[3,3,3,3]
	vpaddd	%xmm1, %xmm2, %xmm1
	vmovd	%xmm1, (%r12,%rsi,4)
	incq	%rsi
	addq	$40960, %rdx                    # imm = 0xA000
	cmpq	$10240, %rsi                    # imm = 0x2800
	jne	.LBB7_10
# %bb.13:                               # %matvec_simd.exit115
                                        #   in Loop: Header=BB7_9 Depth=1
	incl	%ecx
	cmpl	$20, %ecx
	jne	.LBB7_9
# %bb.14:                               # %for.cond.cleanup
	vcvtsi2sd	%rax, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	8(%rsp), %xmm6, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm6, %xmm1
	vdivsd	.LCPI7_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	(%rsp), %xmm0, %xmm0            # 8-byte Folded Reload
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %rax
	movzwl	16(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm6, %xmm0
	vdivsd	.LCPI7_0(%rip), %xmm0, %xmm0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_15:                               # %for.cond1.preheader.i116.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_16 Depth 2
                                        #       Child Loop BB7_17 Depth 3
	movq	%r15, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB7_16:                               # %for.cond1.preheader.i116
                                        #   Parent Loop BB7_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_17 Depth 3
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$56, %edi
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB7_17:                               # %vector.body
                                        #   Parent Loop BB7_15 Depth=1
                                        #     Parent Loop BB7_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu	-224(%rbx,%rdi,4), %ymm5
	vmovdqu	-192(%rbx,%rdi,4), %ymm6
	vmovdqu	-160(%rbx,%rdi,4), %ymm7
	vmovdqu	-128(%rbx,%rdi,4), %ymm8
	vpmulld	-224(%rdx,%rdi,4), %ymm5, %ymm5
	vpmulld	-192(%rdx,%rdi,4), %ymm6, %ymm6
	vpaddd	%ymm1, %ymm5, %ymm1
	vpaddd	%ymm2, %ymm6, %ymm2
	vpmulld	-160(%rdx,%rdi,4), %ymm7, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm3
	vpmulld	-128(%rdx,%rdi,4), %ymm8, %ymm5
	vpaddd	%ymm4, %ymm5, %ymm4
	vmovdqu	-96(%rbx,%rdi,4), %ymm5
	vmovdqu	-64(%rbx,%rdi,4), %ymm6
	vmovdqu	-32(%rbx,%rdi,4), %ymm7
	vmovdqu	(%rbx,%rdi,4), %ymm8
	vpmulld	-96(%rdx,%rdi,4), %ymm5, %ymm5
	vpmulld	-64(%rdx,%rdi,4), %ymm6, %ymm6
	vpaddd	%ymm1, %ymm5, %ymm1
	vpaddd	%ymm2, %ymm6, %ymm2
	vpmulld	-32(%rdx,%rdi,4), %ymm7, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm3
	vpmulld	(%rdx,%rdi,4), %ymm8, %ymm5
	vpaddd	%ymm4, %ymm5, %ymm4
	addq	$64, %rdi
	cmpq	$10296, %rdi                    # imm = 0x2838
	jne	.LBB7_17
# %bb.18:                               # %middle.block
                                        #   in Loop: Header=BB7_16 Depth=2
	vpaddd	%ymm1, %ymm2, %ymm1
	vpaddd	%ymm1, %ymm3, %ymm1
	vpaddd	%ymm1, %ymm4, %ymm1
	vextracti128	$1, %ymm1, %xmm2
	vpaddd	%xmm2, %xmm1, %xmm1
	vpshufd	$238, %xmm1, %xmm2              # xmm2 = xmm1[2,3,2,3]
	vpaddd	%xmm2, %xmm1, %xmm1
	vpshufd	$85, %xmm1, %xmm2               # xmm2 = xmm1[1,1,1,1]
	vpaddd	%xmm2, %xmm1, %xmm1
	vmovd	%xmm1, (%r14,%rsi,4)
	incq	%rsi
	addq	$40960, %rdx                    # imm = 0xA000
	cmpq	$10240, %rsi                    # imm = 0x2800
	jne	.LBB7_16
# %bb.19:                               # %matvec_serial.exit
                                        #   in Loop: Header=BB7_15 Depth=1
	incl	%ecx
	cmpl	$20, %ecx
	jne	.LBB7_15
# %bb.20:                               # %for.cond.cleanup13
	vxorpd	%xmm1, %xmm1, %xmm1
	vaddsd	(%rsp), %xmm1, %xmm1            # 8-byte Folded Reload
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vcvtsi2sd	%rax, %xmm9, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	8(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	8(%rsp), %xmm9, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm9, %xmm1
	vdivsd	.LCPI7_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vaddsd	.LCPI7_4, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movq	%r15, %rdi
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
	vmovsd	.LCPI7_1(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	(%rsp), %xmm0, %xmm1            # 8-byte Folded Reload
	vmovsd	.LCPI7_2(%rip), %xmm2           # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 32(%rsp)                 # 8-byte Spill
	vmulsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vdivsd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, 40(%rsp)                 # 8-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	movl	$.Lstr.12, %edi
	callq	puts
	movl	$.Lstr.13, %edi
	callq	puts
	vmovsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI7_3(%rip), %xmm0, %xmm0
	movl	$.L.str.9, %edi
	vmovsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI7_3(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovq	40(%rsp), %xmm1                 # 8-byte Folded Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$56, %eax
	vpxor	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB7_21:                               # %vector.body154
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	-224(%r12,%rax,4), %ymm4
	vmovdqu	-192(%r12,%rax,4), %ymm5
	vmovdqu	-160(%r12,%rax,4), %ymm6
	vmovdqu	-128(%r12,%rax,4), %ymm7
	vpsubd	-224(%r14,%rax,4), %ymm4, %ymm4
	vpsubd	-192(%r14,%rax,4), %ymm5, %ymm5
	vpsubd	-160(%r14,%rax,4), %ymm6, %ymm6
	vpsubd	-128(%r14,%rax,4), %ymm7, %ymm7
	vpabsd	%ymm4, %ymm4
	vpaddd	%ymm0, %ymm4, %ymm0
	vpabsd	%ymm5, %ymm4
	vpaddd	%ymm1, %ymm4, %ymm1
	vpabsd	%ymm6, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpabsd	%ymm7, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	vmovdqu	-96(%r12,%rax,4), %ymm4
	vmovdqu	-64(%r12,%rax,4), %ymm5
	vmovdqu	-32(%r12,%rax,4), %ymm6
	vmovdqu	(%r12,%rax,4), %ymm7
	vpsubd	-96(%r14,%rax,4), %ymm4, %ymm4
	vpsubd	-64(%r14,%rax,4), %ymm5, %ymm5
	vpsubd	-32(%r14,%rax,4), %ymm6, %ymm6
	vpsubd	(%r14,%rax,4), %ymm7, %ymm7
	vpabsd	%ymm4, %ymm4
	vpaddd	%ymm0, %ymm4, %ymm0
	vpabsd	%ymm5, %ymm4
	vpaddd	%ymm1, %ymm4, %ymm1
	vpabsd	%ymm6, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpabsd	%ymm7, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	addq	$64, %rax
	cmpq	$10296, %rax                    # imm = 0x2838
	jne	.LBB7_21
# %bb.22:                               # %middle.block152
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
	movl	$.L.str.11, %edi
	xorl	%eax, %eax
	vzeroupper
	callq	printf
	movq	%r12, %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
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
