	.text
	.file	"matvec_float.c"
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
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	divss	.LCPI1_0(%rip), %xmm0
	movss	%xmm0, (%r12,%rbx,4)
	addq	$1, %rbx
	cmpq	$10240, %rbx                    # imm = 0x2800
	jne	.LBB1_2
# %bb.3:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB1_1 Depth=1
	callq	rand
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm0
	movss	%xmm0, (%r14,%r15,4)
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
	xorps	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_1:                                # %omp.inner.for.cond.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	xorps	%xmm2, %xmm2
	movl	$12, %ecx
	xorps	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB2_2:                                # %vector.body
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movups	-48(%rdi,%rcx,4), %xmm3
	movups	-32(%rdi,%rcx,4), %xmm4
	movups	-16(%rdi,%rcx,4), %xmm5
	movups	(%rdi,%rcx,4), %xmm6
	movups	-48(%rsi,%rcx,4), %xmm7
	mulps	%xmm3, %xmm7
	addps	%xmm2, %xmm7
	movups	-32(%rsi,%rcx,4), %xmm3
	mulps	%xmm4, %xmm3
	addps	%xmm1, %xmm3
	movups	-16(%rsi,%rcx,4), %xmm2
	mulps	%xmm5, %xmm2
	addps	%xmm7, %xmm2
	movups	(%rsi,%rcx,4), %xmm1
	mulps	%xmm6, %xmm1
	addps	%xmm3, %xmm1
	addq	$16, %rcx
	cmpq	$10252, %rcx                    # imm = 0x280C
	jne	.LBB2_2
# %bb.3:                                # %middle.block
                                        #   in Loop: Header=BB2_1 Depth=1
	addps	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	shufps	$85, %xmm1, %xmm2               # xmm2 = xmm2[1,1],xmm1[1,1]
	addss	%xmm1, %xmm2
	movaps	%xmm1, %xmm3
	unpckhpd	%xmm1, %xmm3                    # xmm3 = xmm3[1],xmm1[1]
	addss	%xmm2, %xmm3
	shufps	$255, %xmm1, %xmm1              # xmm1 = xmm1[3,3,3,3]
	addss	%xmm3, %xmm1
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rdx,%rax,4)
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
	xorps	%xmm0, %xmm0
	movl	$3, %ecx
	.p2align	4, 0x90
.LBB3_2:                                # %for.body4
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	-12(%rdi,%rcx,4), %xmm1         # xmm1 = mem[0],zero,zero,zero
	movss	-8(%rdi,%rcx,4), %xmm2          # xmm2 = mem[0],zero,zero,zero
	mulss	-12(%rsi,%rcx,4), %xmm1
	mulss	-8(%rsi,%rcx,4), %xmm2
	addss	%xmm0, %xmm1
	movss	-4(%rdi,%rcx,4), %xmm3          # xmm3 = mem[0],zero,zero,zero
	mulss	-4(%rsi,%rcx,4), %xmm3
	addss	%xmm1, %xmm2
	movss	(%rdi,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	(%rsi,%rcx,4), %xmm0
	addss	%xmm2, %xmm3
	addss	%xmm3, %xmm0
	addq	$4, %rcx
	cmpq	$10243, %rcx                    # imm = 0x2803
	jne	.LBB3_2
# %bb.3:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB3_1 Depth=1
	movss	%xmm0, (%rdx,%rax,4)
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
	movss	-28(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	-24(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	-20(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	-16(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	-12(%r14,%rbx), %xmm0           # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	-8(%r14,%rbx), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	-4(%r14,%rbx), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	(%r14,%rbx), %xmm0              # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
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
	movss	(%rbx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	4(%rbx), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	8(%rbx), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	12(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	16(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	20(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	24(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movss	28(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
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
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function check
.LCPI6_0:
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.text
	.globl	check
	.p2align	4, 0x90
	.type	check,@function
check:                                  # @check
	.cfi_startproc
# %bb.0:                                # %entry
	xorps	%xmm0, %xmm0
	movl	$1, %eax
	movaps	.LCPI6_0(%rip), %xmm1           # xmm1 = [NaN,NaN,NaN,NaN]
	.p2align	4, 0x90
.LBB6_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movss	-4(%rdi,%rax,4), %xmm2          # xmm2 = mem[0],zero,zero,zero
	subss	-4(%rsi,%rax,4), %xmm2
	andps	%xmm1, %xmm2
	addss	%xmm0, %xmm2
	movss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	subss	(%rsi,%rax,4), %xmm0
	andps	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	addq	$2, %rax
	cmpq	$10241, %rax                    # imm = 0x2801
	jne	.LBB6_1
# %bb.2:                                # %for.cond.cleanup
	retq
.Lfunc_end6:
	.size	check, .Lfunc_end6-check
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI7_0:
	.long	0x4d4ccccd                      # float 214748368
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
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
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI7_5:
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
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
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	divss	.LCPI7_0(%rip), %xmm0
	movss	%xmm0, (%rbp,%r15,4)
	addq	$1, %r15
	cmpq	$10240, %r15                    # imm = 0x2800
	jne	.LBB7_2
# %bb.3:                                # %for.cond.cleanup3.i
                                        #   in Loop: Header=BB7_1 Depth=1
	callq	rand
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	.LCPI7_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rbx,%r13,4)
	addq	$1, %r13
	addq	$40960, %rbp                    # imm = 0xA000
	cmpq	$10240, %r13                    # imm = 0x2800
	jne	.LBB7_1
# %bb.4:                                # %omp.inner.for.cond.preheader.i.preheader
	xorl	%eax, %eax
	xorps	%xmm0, %xmm0
	movq	48(%rsp), %rbp                  # 8-byte Reload
	movq	%rbp, %rcx
	.p2align	4, 0x90
.LBB7_5:                                # %omp.inner.for.cond.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_6 Depth 2
	xorps	%xmm2, %xmm2
	movl	$12, %edx
	xorps	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB7_6:                                # %vector.body
                                        #   Parent Loop BB7_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movups	-48(%rcx,%rdx,4), %xmm3
	movups	-32(%rcx,%rdx,4), %xmm4
	movups	-16(%rcx,%rdx,4), %xmm5
	movups	(%rcx,%rdx,4), %xmm6
	movups	-48(%rbx,%rdx,4), %xmm7
	mulps	%xmm3, %xmm7
	addps	%xmm2, %xmm7
	movups	-32(%rbx,%rdx,4), %xmm3
	mulps	%xmm4, %xmm3
	addps	%xmm1, %xmm3
	movups	-16(%rbx,%rdx,4), %xmm2
	mulps	%xmm5, %xmm2
	addps	%xmm7, %xmm2
	movups	(%rbx,%rdx,4), %xmm1
	mulps	%xmm6, %xmm1
	addps	%xmm3, %xmm1
	addq	$16, %rdx
	cmpq	$10252, %rdx                    # imm = 0x280C
	jne	.LBB7_6
# %bb.7:                                # %middle.block
                                        #   in Loop: Header=BB7_5 Depth=1
	addps	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	shufps	$85, %xmm1, %xmm2               # xmm2 = xmm2[1,1],xmm1[1,1]
	addss	%xmm1, %xmm2
	movaps	%xmm1, %xmm3
	unpckhpd	%xmm1, %xmm3                    # xmm3 = xmm3[1],xmm1[1]
	addss	%xmm2, %xmm3
	shufps	$255, %xmm1, %xmm1              # xmm1 = xmm1[3,3,3,3]
	addss	%xmm3, %xmm1
	addss	%xmm0, %xmm1
	movss	%xmm1, (%r12,%rax,4)
	addq	$1, %rax
	addq	$40960, %rcx                    # imm = 0xA000
	cmpq	$10240, %rax                    # imm = 0x2800
	jne	.LBB7_5
# %bb.8:                                # %matvec_simd.exit
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %rax
	movzwl	16(%rsp), %ecx
	cvtsi2sd	%ecx, %xmm8
	divsd	.LCPI7_1(%rip), %xmm8
	xorl	%ecx, %ecx
	xorps	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB7_9:                                # %omp.inner.for.cond.preheader.i96.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_10 Depth 2
                                        #       Child Loop BB7_11 Depth 3
	movq	%rbp, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB7_10:                               # %omp.inner.for.cond.preheader.i96
                                        #   Parent Loop BB7_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_11 Depth 3
	xorps	%xmm2, %xmm2
	movl	$12, %edi
	xorps	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB7_11:                               # %vector.body141
                                        #   Parent Loop BB7_9 Depth=1
                                        #     Parent Loop BB7_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movups	-48(%rdx,%rdi,4), %xmm3
	movups	-32(%rdx,%rdi,4), %xmm4
	movups	-16(%rdx,%rdi,4), %xmm5
	movups	(%rdx,%rdi,4), %xmm6
	movups	-48(%rbx,%rdi,4), %xmm7
	mulps	%xmm3, %xmm7
	addps	%xmm2, %xmm7
	movups	-32(%rbx,%rdi,4), %xmm3
	mulps	%xmm4, %xmm3
	addps	%xmm1, %xmm3
	movups	-16(%rbx,%rdi,4), %xmm2
	mulps	%xmm5, %xmm2
	addps	%xmm7, %xmm2
	movups	(%rbx,%rdi,4), %xmm1
	mulps	%xmm6, %xmm1
	addps	%xmm3, %xmm1
	addq	$16, %rdi
	cmpq	$10252, %rdi                    # imm = 0x280C
	jne	.LBB7_11
# %bb.12:                               # %middle.block139
                                        #   in Loop: Header=BB7_10 Depth=2
	addps	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	shufps	$85, %xmm1, %xmm2               # xmm2 = xmm2[1,1],xmm1[1,1]
	addss	%xmm1, %xmm2
	movaps	%xmm1, %xmm3
	unpckhpd	%xmm1, %xmm3                    # xmm3 = xmm3[1],xmm1[1]
	addss	%xmm2, %xmm3
	shufps	$255, %xmm1, %xmm1              # xmm1 = xmm1[3,3,3,3]
	addss	%xmm3, %xmm1
	addss	%xmm0, %xmm1
	movss	%xmm1, (%r12,%rsi,4)
	addq	$1, %rsi
	addq	$40960, %rdx                    # imm = 0xA000
	cmpq	$10240, %rsi                    # imm = 0x2800
	jne	.LBB7_10
# %bb.13:                               # %matvec_simd.exit111
                                        #   in Loop: Header=BB7_9 Depth=1
	addl	$1, %ecx
	cmpl	$20, %ecx
	jne	.LBB7_9
# %bb.14:                               # %for.cond.cleanup
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rax, %xmm0
	addsd	%xmm0, %xmm8
	movsd	%xmm8, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	8(%rsp), %xmm0
	movzwl	16(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI7_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	subsd	(%rsp), %xmm1                   # 8-byte Folded Reload
	movsd	%xmm1, (%rsp)                   # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	movq	8(%rsp), %rax
	movzwl	16(%rsp), %ecx
	xorps	%xmm4, %xmm4
	cvtsi2sd	%ecx, %xmm4
	divsd	.LCPI7_1(%rip), %xmm4
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_15:                               # %for.cond1.preheader.i112.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_16 Depth 2
                                        #       Child Loop BB7_17 Depth 3
	movq	%rbp, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB7_16:                               # %for.cond1.preheader.i112
                                        #   Parent Loop BB7_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_17 Depth 3
	xorpd	%xmm0, %xmm0
	movl	$3, %edi
	.p2align	4, 0x90
.LBB7_17:                               # %for.body4.i118
                                        #   Parent Loop BB7_15 Depth=1
                                        #     Parent Loop BB7_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movss	-12(%rdx,%rdi,4), %xmm1         # xmm1 = mem[0],zero,zero,zero
	movss	-8(%rdx,%rdi,4), %xmm2          # xmm2 = mem[0],zero,zero,zero
	mulss	-12(%rbx,%rdi,4), %xmm1
	mulss	-8(%rbx,%rdi,4), %xmm2
	addss	%xmm0, %xmm1
	movss	-4(%rdx,%rdi,4), %xmm3          # xmm3 = mem[0],zero,zero,zero
	mulss	-4(%rbx,%rdi,4), %xmm3
	addss	%xmm1, %xmm2
	movss	(%rdx,%rdi,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	mulss	(%rbx,%rdi,4), %xmm0
	addss	%xmm2, %xmm3
	addss	%xmm3, %xmm0
	addq	$4, %rdi
	cmpq	$10243, %rdi                    # imm = 0x2803
	jne	.LBB7_17
# %bb.18:                               # %for.cond.cleanup3.i113
                                        #   in Loop: Header=BB7_16 Depth=2
	movss	%xmm0, (%r14,%rsi,4)
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
	addsd	%xmm0, %xmm4
	movsd	%xmm4, 24(%rsp)                 # 8-byte Spill
	leaq	8(%rsp), %rdi
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	8(%rsp), %xmm0
	movzwl	16(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI7_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	subsd	24(%rsp), %xmm1                 # 8-byte Folded Reload
	addsd	.LCPI7_6, %xmm1
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
	movsd	.LCPI7_2(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movsd	.LCPI7_3(%rip), %xmm2           # xmm2 = mem[0],zero
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
	divsd	.LCPI7_4(%rip), %xmm0
	movl	$.L.str.9, %edi
	movsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	movsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	.LCPI7_4(%rip), %xmm0
	movl	$.L.str.10, %edi
	movsd	40(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	xorps	%xmm1, %xmm1
	movl	$1, %eax
	movaps	.LCPI7_5(%rip), %xmm0           # xmm0 = [NaN,NaN,NaN,NaN]
	.p2align	4, 0x90
.LBB7_21:                               # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	movss	-4(%r12,%rax,4), %xmm2          # xmm2 = mem[0],zero,zero,zero
	subss	-4(%r14,%rax,4), %xmm2
	andps	%xmm0, %xmm2
	addss	%xmm1, %xmm2
	movss	(%r12,%rax,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	subss	(%r14,%rax,4), %xmm1
	andps	%xmm0, %xmm1
	addss	%xmm2, %xmm1
	addq	$2, %rax
	cmpq	$10241, %rax                    # imm = 0x2801
	jne	.LBB7_21
# %bb.22:                               # %check.exit
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	movl	$.L.str.11, %edi
	movb	$1, %al
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
