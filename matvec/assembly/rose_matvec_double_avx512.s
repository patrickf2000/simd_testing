	.text
	.file	"rose_matvec_double_avx512.c"
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
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vdivsd	.LCPI1_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpq	$10240, %rbx                    # imm = 0x2800
	jne	.LBB1_2
# %bb.3:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB1_1 Depth=1
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vmovsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%r15,8)
	incq	%r15
	addq	$81920, %r12                    # imm = 0x14000
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
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	$-8, %rcx
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovupd	-384(%rdi,%rcx,8), %zmm1
	vmovupd	-320(%rdi,%rcx,8), %zmm2
	vmovupd	-256(%rdi,%rcx,8), %zmm3
	vmovupd	-192(%rdi,%rcx,8), %zmm4
	vmulpd	64(%rsi,%rcx,8), %zmm1, %zmm1
	vmulpd	128(%rsi,%rcx,8), %zmm2, %zmm2
	vaddpd	%zmm1, %zmm0, %zmm0
	vaddpd	%zmm2, %zmm0, %zmm0
	vmulpd	192(%rsi,%rcx,8), %zmm3, %zmm1
	vmulpd	256(%rsi,%rcx,8), %zmm4, %zmm2
	vaddpd	%zmm1, %zmm0, %zmm0
	vaddpd	%zmm2, %zmm0, %zmm0
	vmovupd	-128(%rdi,%rcx,8), %zmm1
	vmulpd	320(%rsi,%rcx,8), %zmm1, %zmm1
	vaddpd	%zmm1, %zmm0, %zmm0
	vmovupd	-64(%rdi,%rcx,8), %zmm1
	vmulpd	384(%rsi,%rcx,8), %zmm1, %zmm1
	vaddpd	%zmm1, %zmm0, %zmm0
	vmovupd	(%rdi,%rcx,8), %zmm1
	vmulpd	448(%rsi,%rcx,8), %zmm1, %zmm1
	vmovupd	64(%rdi,%rcx,8), %zmm2
	vaddpd	%zmm1, %zmm0, %zmm0
	vmulpd	512(%rsi,%rcx,8), %zmm2, %zmm1
	vaddpd	%zmm1, %zmm0, %zmm0
	addq	$64, %rcx
	cmpq	$10232, %rcx                    # imm = 0x27F8
	jb	.LBB2_2
# %bb.3:                                # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	vextractf64x4	$1, %zmm0, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vhaddpd	%ymm0, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	addq	$81920, %rdi                    # imm = 0x14000
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
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$7, %ecx
	.p2align	4, 0x90
.LBB3_2:                                # %for.body4
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovsd	-56(%rdi,%rcx,8), %xmm1         # xmm1 = mem[0],zero
	vmovsd	-48(%rdi,%rcx,8), %xmm2         # xmm2 = mem[0],zero
	vmulsd	-56(%rsi,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	-48(%rsi,%rcx,8), %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-40(%rdi,%rcx,8), %xmm1         # xmm1 = mem[0],zero
	vmulsd	-40(%rsi,%rcx,8), %xmm1, %xmm1
	vmovsd	-32(%rdi,%rcx,8), %xmm2         # xmm2 = mem[0],zero
	vmulsd	-32(%rsi,%rcx,8), %xmm2, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	-24(%rdi,%rcx,8), %xmm1         # xmm1 = mem[0],zero
	vmulsd	-24(%rsi,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-16(%rdi,%rcx,8), %xmm1         # xmm1 = mem[0],zero
	vmulsd	-16(%rsi,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-8(%rdi,%rcx,8), %xmm1          # xmm1 = mem[0],zero
	vmulsd	-8(%rsi,%rcx,8), %xmm1, %xmm1
	vmovsd	(%rdi,%rcx,8), %xmm2            # xmm2 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	(%rsi,%rcx,8), %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$8, %rcx
	cmpq	$10247, %rcx                    # imm = 0x2807
	jne	.LBB3_2
# %bb.3:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB3_1 Depth=1
	vmovsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	addq	$81920, %rdi                    # imm = 0x14000
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
	movl	$56, %ebx
	.p2align	4, 0x90
.LBB4_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$91, %edi
	callq	putchar@PLT
	vmovsd	-56(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	-48(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	-40(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	-32(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	-24(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	-16(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	-8(%r14,%rbx), %xmm0            # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	(%r14,%rbx), %xmm0              # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.2, %edi
	callq	puts
	addq	$81920, %rbx                    # imm = 0x14000
	cmpq	$655416, %rbx                   # imm = 0xA0038
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
	vmovsd	(%rbx), %xmm0                   # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	8(%rbx), %xmm0                  # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	16(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	24(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	32(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	40(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	48(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	vmovsd	56(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.2, %edi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	puts                            # TAILCALL
.Lfunc_end5:
	.size	print_vector, .Lfunc_end5-print_vector
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function check
.LCPI6_0:
	.long	0x7fffffff                      # float NaN
	.text
	.globl	check
	.p2align	4, 0x90
	.type	check,@function
check:                                  # @check
	.cfi_startproc
# %bb.0:                                # %entry
	vxorps	%xmm0, %xmm0, %xmm0
	movl	$4, %eax
	vbroadcastss	.LCPI6_0(%rip), %xmm1   # xmm1 = [NaN,NaN,NaN,NaN]
	.p2align	4, 0x90
.LBB6_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	-32(%rdi,%rax,8), %xmm2         # xmm2 = mem[0],zero
	vmovsd	-24(%rdi,%rax,8), %xmm3         # xmm3 = mem[0],zero
	vsubsd	-32(%rsi,%rax,8), %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vandps	%xmm1, %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vsubsd	-24(%rsi,%rax,8), %xmm3, %xmm3
	vcvtsd2ss	%xmm3, %xmm3, %xmm3
	vandps	%xmm1, %xmm3, %xmm3
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vmovsd	-16(%rdi,%rax,8), %xmm4         # xmm4 = mem[0],zero
	vsubsd	-16(%rsi,%rax,8), %xmm4, %xmm4
	vaddsd	%xmm2, %xmm0, %xmm0
	vcvtsd2ss	%xmm4, %xmm4, %xmm2
	vandps	%xmm1, %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm3, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	-8(%rdi,%rax,8), %xmm2          # xmm2 = mem[0],zero
	vsubsd	-8(%rsi,%rax,8), %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vandps	%xmm1, %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	(%rdi,%rax,8), %xmm2            # xmm2 = mem[0],zero
	vsubsd	(%rsi,%rax,8), %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vandps	%xmm1, %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	addq	$5, %rax
	cmpq	$10244, %rax                    # imm = 0x2804
	jne	.LBB6_1
# %bb.2:                                # %for.cond.cleanup
	retq
.Lfunc_end6:
	.size	check, .Lfunc_end6-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI7_0:
	.quad	0x41a9999999666666              # double 214748364.69999999
.LCPI7_1:
	.quad	0x408f400000000000              # double 1000
.LCPI7_2:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI7_3:
	.quad	0x41ef400000000000              # double 4194304000
.LCPI7_4:
	.quad	0x4034000000000000              # double 20
.LCPI7_6:
	.quad	0x0000000000000000              # double 0
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI7_5:
	.long	0x7fffffff                      # float NaN
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
	movl	$81920, %edi                    # imm = 0x14000
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
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vdivsd	.LCPI7_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%r13,8)
	incq	%r13
	cmpq	$10240, %r13                    # imm = 0x2800
	jne	.LBB7_2
# %bb.3:                                # %for.cond.cleanup3.i
                                        #   in Loop: Header=BB7_1 Depth=1
	callq	rand
	vcvtsi2sd	%eax, %xmm2, %xmm0
	vmovsd	.LCPI7_0(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rbx,%rbp,8)
	incq	%rbp
	addq	$81920, %r15                    # imm = 0x14000
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
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	$-8, %rdx
	.p2align	4, 0x90
.LBB7_6:                                # %for.body3.i
                                        #   Parent Loop BB7_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovupd	-384(%rax,%rdx,8), %zmm1
	vmovupd	-320(%rax,%rdx,8), %zmm2
	vmovupd	-256(%rax,%rdx,8), %zmm3
	vmovupd	-192(%rax,%rdx,8), %zmm4
	vmulpd	64(%rbx,%rdx,8), %zmm1, %zmm1
	vmulpd	128(%rbx,%rdx,8), %zmm2, %zmm2
	vaddpd	%zmm1, %zmm0, %zmm0
	vaddpd	%zmm2, %zmm0, %zmm0
	vmulpd	192(%rbx,%rdx,8), %zmm3, %zmm1
	vmulpd	256(%rbx,%rdx,8), %zmm4, %zmm2
	vaddpd	%zmm1, %zmm0, %zmm0
	vaddpd	%zmm2, %zmm0, %zmm0
	vmovupd	-128(%rax,%rdx,8), %zmm1
	vmulpd	320(%rbx,%rdx,8), %zmm1, %zmm1
	vaddpd	%zmm1, %zmm0, %zmm0
	vmovupd	-64(%rax,%rdx,8), %zmm1
	vmulpd	384(%rbx,%rdx,8), %zmm1, %zmm1
	vaddpd	%zmm1, %zmm0, %zmm0
	vmovupd	(%rax,%rdx,8), %zmm1
	vmulpd	448(%rbx,%rdx,8), %zmm1, %zmm1
	vmovupd	64(%rax,%rdx,8), %zmm2
	vaddpd	%zmm1, %zmm0, %zmm0
	vmulpd	512(%rbx,%rdx,8), %zmm2, %zmm1
	vaddpd	%zmm1, %zmm0, %zmm0
	addq	$64, %rdx
	cmpq	$10232, %rdx                    # imm = 0x27F8
	jb	.LBB7_6
# %bb.7:                                # %for.end.i
                                        #   in Loop: Header=BB7_5 Depth=1
	vextractf64x4	$1, %zmm0, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vhaddpd	%ymm0, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rcx,8)
	incq	%rcx
	addq	$81920, %rax                    # imm = 0x14000
	cmpq	$10240, %rcx                    # imm = 0x2800
	jne	.LBB7_5
# %bb.8:                                # %matvec_simd.exit
	leaq	8(%rsp), %rdi
	vzeroupper
	callq	ftime
	movq	8(%rsp), %rax
	movzwl	16(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm5, %xmm0
	vdivsd	.LCPI7_1(%rip), %xmm0, %xmm0
	addq	$448, %rbp                      # imm = 0x1C0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_9:                                # %for.cond1.preheader.i97.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_10 Depth 2
                                        #       Child Loop BB7_11 Depth 3
	movq	%rbp, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB7_10:                               # %for.cond1.preheader.i97
                                        #   Parent Loop BB7_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_11 Depth 3
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	$-8, %rdi
	.p2align	4, 0x90
.LBB7_11:                               # %for.body3.i108
                                        #   Parent Loop BB7_9 Depth=1
                                        #     Parent Loop BB7_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovupd	-384(%rdx,%rdi,8), %zmm2
	vmovupd	-320(%rdx,%rdi,8), %zmm3
	vmovupd	-256(%rdx,%rdi,8), %zmm4
	vmovupd	-192(%rdx,%rdi,8), %zmm5
	vmulpd	64(%rbx,%rdi,8), %zmm2, %zmm2
	vmulpd	128(%rbx,%rdi,8), %zmm3, %zmm3
	vaddpd	%zmm2, %zmm1, %zmm1
	vaddpd	%zmm3, %zmm1, %zmm1
	vmulpd	192(%rbx,%rdi,8), %zmm4, %zmm2
	vmulpd	256(%rbx,%rdi,8), %zmm5, %zmm3
	vaddpd	%zmm2, %zmm1, %zmm1
	vaddpd	%zmm3, %zmm1, %zmm1
	vmovupd	-128(%rdx,%rdi,8), %zmm2
	vmulpd	320(%rbx,%rdi,8), %zmm2, %zmm2
	vaddpd	%zmm2, %zmm1, %zmm1
	vmovupd	-64(%rdx,%rdi,8), %zmm2
	vmulpd	384(%rbx,%rdi,8), %zmm2, %zmm2
	vaddpd	%zmm2, %zmm1, %zmm1
	vmovupd	(%rdx,%rdi,8), %zmm2
	vmulpd	448(%rbx,%rdi,8), %zmm2, %zmm2
	vmovupd	64(%rdx,%rdi,8), %zmm3
	vaddpd	%zmm2, %zmm1, %zmm1
	vmulpd	512(%rbx,%rdi,8), %zmm3, %zmm2
	vaddpd	%zmm2, %zmm1, %zmm1
	addq	$64, %rdi
	cmpq	$10232, %rdi                    # imm = 0x27F8
	jb	.LBB7_11
# %bb.12:                               # %for.end.i118
                                        #   in Loop: Header=BB7_10 Depth=2
	vextractf64x4	$1, %zmm1, %ymm2
	vaddpd	%ymm2, %ymm1, %ymm1
	vhaddpd	%ymm1, %ymm1, %ymm1
	vextractf128	$1, %ymm1, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, (%r12,%rsi,8)
	incq	%rsi
	addq	$81920, %rdx                    # imm = 0x14000
	cmpq	$10240, %rsi                    # imm = 0x2800
	jne	.LBB7_10
# %bb.13:                               # %matvec_simd.exit119
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
	vdivsd	.LCPI7_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	(%rsp), %xmm0, %xmm0            # 8-byte Folded Reload
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %rax
	movzwl	16(%rsp), %ecx
	vcvtsi2sd	%ecx, %xmm6, %xmm0
	vdivsd	.LCPI7_1(%rip), %xmm0, %xmm0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_15:                               # %for.cond1.preheader.i120.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_16 Depth 2
                                        #       Child Loop BB7_17 Depth 3
	movq	%r15, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB7_16:                               # %for.cond1.preheader.i120
                                        #   Parent Loop BB7_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_17 Depth 3
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$7, %edi
	.p2align	4, 0x90
.LBB7_17:                               # %for.body4.i127
                                        #   Parent Loop BB7_15 Depth=1
                                        #     Parent Loop BB7_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovsd	-56(%rdx,%rdi,8), %xmm2         # xmm2 = mem[0],zero
	vmovsd	-48(%rdx,%rdi,8), %xmm3         # xmm3 = mem[0],zero
	vmulsd	-56(%rbx,%rdi,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	-48(%rbx,%rdi,8), %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	-40(%rdx,%rdi,8), %xmm2         # xmm2 = mem[0],zero
	vmulsd	-40(%rbx,%rdi,8), %xmm2, %xmm2
	vmovsd	-32(%rdx,%rdi,8), %xmm3         # xmm3 = mem[0],zero
	vmulsd	-32(%rbx,%rdi,8), %xmm3, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vmovsd	-24(%rdx,%rdi,8), %xmm2         # xmm2 = mem[0],zero
	vmulsd	-24(%rbx,%rdi,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	-16(%rdx,%rdi,8), %xmm2         # xmm2 = mem[0],zero
	vmulsd	-16(%rbx,%rdi,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	-8(%rdx,%rdi,8), %xmm2          # xmm2 = mem[0],zero
	vmulsd	-8(%rbx,%rdi,8), %xmm2, %xmm2
	vmovsd	(%rdx,%rdi,8), %xmm3            # xmm3 = mem[0],zero
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	(%rbx,%rdi,8), %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	addq	$8, %rdi
	cmpq	$10247, %rdi                    # imm = 0x2807
	jne	.LBB7_17
# %bb.18:                               # %for.cond.cleanup3.i121
                                        #   in Loop: Header=BB7_16 Depth=2
	vmovsd	%xmm1, (%r14,%rsi,8)
	incq	%rsi
	addq	$81920, %rdx                    # imm = 0x14000
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
	vcvtsi2sd	%rax, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	vcvtsi2sdq	8(%rsp), %xmm6, %xmm0
	movzwl	16(%rsp), %eax
	vcvtsi2sd	%eax, %xmm6, %xmm1
	vdivsd	.LCPI7_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	24(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vaddsd	.LCPI7_6, %xmm0, %xmm0
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
	vmovsd	.LCPI7_2(%rip), %xmm0           # xmm0 = mem[0],zero
	vmulsd	(%rsp), %xmm0, %xmm1            # 8-byte Folded Reload
	vmovsd	.LCPI7_3(%rip), %xmm2           # xmm2 = mem[0],zero
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
	vdivsd	.LCPI7_4(%rip), %xmm0, %xmm0
	movl	$.L.str.9, %edi
	vmovsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vdivsd	.LCPI7_4(%rip), %xmm0, %xmm0
	movl	$.L.str.10, %edi
	vmovsd	40(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$4, %eax
	vbroadcastss	.LCPI7_5(%rip), %xmm4   # xmm4 = [NaN,NaN,NaN,NaN]
	.p2align	4, 0x90
.LBB7_21:                               # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	-32(%r12,%rax,8), %xmm1         # xmm1 = mem[0],zero
	vmovsd	-24(%r12,%rax,8), %xmm2         # xmm2 = mem[0],zero
	vsubsd	-32(%r14,%rax,8), %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vandps	%xmm4, %xmm1, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vsubsd	-24(%r14,%rax,8), %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vandps	%xmm4, %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vmovsd	-16(%r12,%rax,8), %xmm3         # xmm3 = mem[0],zero
	vsubsd	-16(%r14,%rax,8), %xmm3, %xmm3
	vaddsd	%xmm1, %xmm0, %xmm1
	vcvtsd2ss	%xmm3, %xmm3, %xmm3
	vandps	%xmm4, %xmm3, %xmm3
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vmovsd	-8(%r12,%rax,8), %xmm2          # xmm2 = mem[0],zero
	vsubsd	-8(%r14,%rax,8), %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vandps	%xmm4, %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	(%r12,%rax,8), %xmm2            # xmm2 = mem[0],zero
	vsubsd	(%r14,%rax,8), %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vandps	%xmm4, %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm0
	addq	$5, %rax
	cmpq	$10244, %rax                    # imm = 0x2804
	jne	.LBB7_21
# %bb.22:                               # %check.exit
	movl	$.L.str.11, %edi
	movb	$1, %al
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
	.asciz	"Correctness check: %f\n"
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
