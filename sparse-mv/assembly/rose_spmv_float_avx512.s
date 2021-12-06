	.text
	.file	"rose_spmv_float_avx512.c"
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
	shlq	$2, %r13
	xorl	%ebp, %ebp
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_5:                                # %for.end
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	$10, %edi
	callq	putchar@PLT
	incq	%rbp
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
	vmovss	(%r12,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movq	%r15, %rsi
	movl	%ebp, %edx
	movl	%ebx, %ecx
	movb	$1, %al
	callq	printf
	incq	%rbx
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
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI2_0:
	.long	0x3f800000                      # float 1
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
	movq	%rax, 32(%rsp)                  # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	imull	%eax, %eax
	leal	(%rax,%rax,4), %ebx
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	leaq	(,%rax,4), %r13
	movq	%r13, %rdi
	callq	malloc
	movq	%rax, %r14
	shlq	$2, %rbx
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %r15
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %rbx
	movq	%r13, %rdi
	callq	malloc
	movq	%rax, %r12
	movq	%r13, %rdi
	callq	malloc
	movq	32(%rsp), %rbp                  # 8-byte Reload
	testl	%ebp, %ebp
	movq	%r14, 8(%rsp)                   # 8-byte Spill
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	jle	.LBB2_3
# %bb.4:                                # %for.cond18.preheader.lr.ph
	leal	-1(%rbp), %eax
	leal	1(%rbp), %ecx
	movq	%rcx, 80(%rsp)                  # 8-byte Spill
	movl	$1, %ecx
	subl	%ebp, %ecx
	movl	%ecx, 28(%rsp)                  # 4-byte Spill
	movq	%r14, %rcx
	addq	$4, %rcx
	movq	%rcx, 72(%rsp)                  # 8-byte Spill
	xorl	%edx, %edx
	xorl	%edi, %edi
	xorl	%r13d, %r13d
	jmp	.LBB2_5
	.p2align	4, 0x90
.LBB2_22:                               # %for.inc69.loopexit
                                        #   in Loop: Header=BB2_5 Depth=1
	movq	16(%rsp), %rcx                  # 8-byte Reload
	addq	%r10, %rcx
	movq	8(%rsp), %r14                   # 8-byte Reload
	movq	32(%rsp), %rbp                  # 8-byte Reload
.LBB2_23:                               # %for.inc69
                                        #   in Loop: Header=BB2_5 Depth=1
	incl	%edi
	movl	%ecx, %edx
	cmpl	%ebp, %edi
	je	.LBB2_24
.LBB2_5:                                # %for.body21.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_14 Depth 2
	movslq	%edx, %r8
	movl	%r13d, (%r14,%r8,4)
	testl	%edi, %edi
	je	.LBB2_7
# %bb.6:                                # %if.then25.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movl	%edx, %ecx
	subl	%ebp, %ecx
	movslq	%r13d, %rsi
	movl	%ecx, (%r15,%rsi,4)
	movl	$-1082130432, (%rbx,%rsi,4)     # imm = 0xBF800000
	incl	%r13d
.LBB2_7:                                # %if.end40.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%r13), %ecx
	movslq	%r13d, %rsi
	movl	%edx, (%r15,%rsi,4)
	movl	$1082130432, (%rbx,%rsi,4)      # imm = 0x40800000
	cmpl	$1, %ebp
	je	.LBB2_9
# %bb.8:                                # %if.then49.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	1(%rdx), %esi
	movslq	%ecx, %rcx
	movl	%esi, (%r15,%rcx,4)
	movl	$-1082130432, (%rbx,%rcx,4)     # imm = 0xBF800000
	addl	$2, %r13d
	movl	%r13d, %ecx
.LBB2_9:                                # %if.end55.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	cmpl	%eax, %edi
	jge	.LBB2_10
# %bb.11:                               # %if.then59.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leal	(%rdx,%rbp), %esi
	movslq	%ecx, %r13
	movl	%esi, (%r15,%r13,4)
	movl	$-1082130432, (%rbx,%r13,4)     # imm = 0xBF800000
	incl	%r13d
	jmp	.LBB2_12
	.p2align	4, 0x90
.LBB2_10:                               #   in Loop: Header=BB2_5 Depth=1
	movl	%ecx, %r13d
.LBB2_12:                               # %if.end66.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	leaq	1(%r8), %rcx
	cmpl	$1, %ebp
	je	.LBB2_23
# %bb.13:                               # %for.body21.preheader
                                        #   in Loop: Header=BB2_5 Depth=1
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	movl	%edx, %ebp
	movq	80(%rsp), %rcx                  # 8-byte Reload
	leal	(%rcx,%rdx), %r11d
	addl	28(%rsp), %edx                  # 4-byte Folded Reload
	movq	72(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%r8,4), %r8
	xorl	%r9d, %r9d
	jmp	.LBB2_14
	.p2align	4, 0x90
.LBB2_20:                               # %if.then59
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%ecx, %r13
	addl	%r11d, %r9d
	movl	%r9d, (%r15,%r13,4)
	movl	$-1082130432, (%rbx,%r13,4)     # imm = 0xBF800000
	incl	%r13d
.LBB2_21:                               # %if.end66
                                        #   in Loop: Header=BB2_14 Depth=2
	movq	%r10, %r9
	cmpl	%r10d, %eax
	je	.LBB2_22
.LBB2_14:                               # %for.body21
                                        #   Parent Loop BB2_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	1(%r9), %r10
	movl	%r13d, (%r8,%r9,4)
	testl	%edi, %edi
	je	.LBB2_16
# %bb.15:                               # %if.then25
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r13d, %rcx
	leal	(%rdx,%r9), %r14d
	movl	%r14d, (%r15,%rcx,4)
	movl	$-1082130432, (%rbx,%rcx,4)     # imm = 0xBF800000
	incl	%r13d
.LBB2_16:                               # %if.end40
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%r13d, %rcx
	leal	(%r9,%rbp), %esi
	movl	%esi, (%r15,%rcx,4)
	movl	$-1082130432, (%rbx,%rcx,4)     # imm = 0xBF800000
	leal	(%r9,%rbp), %esi
	incl	%esi
	movl	%esi, 4(%r15,%rcx,4)
	movl	$1082130432, 4(%rbx,%rcx,4)     # imm = 0x40800000
	addl	$2, %ecx
	cmpl	%eax, %r10d
	jge	.LBB2_18
# %bb.17:                               # %if.then49
                                        #   in Loop: Header=BB2_14 Depth=2
	movslq	%ecx, %rcx
	leal	(%r9,%rbp), %esi
	addl	$2, %esi
	movl	%esi, (%r15,%rcx,4)
	movl	$-1082130432, (%rbx,%rcx,4)     # imm = 0xBF800000
	addl	$3, %r13d
	movl	%r13d, %ecx
.LBB2_18:                               # %if.end55
                                        #   in Loop: Header=BB2_14 Depth=2
	cmpl	%eax, %edi
	jl	.LBB2_20
# %bb.19:                               #   in Loop: Header=BB2_14 Depth=2
	movl	%ecx, %r13d
	jmp	.LBB2_21
.LBB2_24:                               # %for.end71.loopexit
	movslq	%ecx, %rax
	jmp	.LBB2_25
.LBB2_3:
	xorl	%r13d, %r13d
	xorl	%eax, %eax
.LBB2_25:                               # %for.end71
	movl	%r13d, (%r14,%rax,4)
	movq	64(%rsp), %r14                  # 8-byte Reload
	testl	%r14d, %r14d
	movq	56(%rsp), %r13                  # 8-byte Reload
	je	.LBB2_37
# %bb.26:                               # %for.body77.preheader
	cmpl	$32, %r14d
	jae	.LBB2_28
# %bb.27:
	xorl	%eax, %eax
	jmp	.LBB2_36
.LBB2_28:                               # %vector.ph
	movl	%r14d, %eax
	andl	$-32, %eax
	leaq	-32(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$5, %rdx
	incq	%rdx
	movl	%edx, %ecx
	andl	$7, %ecx
	cmpq	$224, %rsi
	jae	.LBB2_30
# %bb.29:
	xorl	%esi, %esi
	jmp	.LBB2_32
.LBB2_30:                               # %vector.ph.new
	leaq	992(%r12), %rdi
	andq	$-8, %rdx
	negq	%rdx
	xorl	%esi, %esi
	vbroadcastss	.LCPI2_0(%rip), %ymm0   # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_31:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm0, -992(%rdi,%rsi,4)
	vmovupd	%ymm0, -960(%rdi,%rsi,4)
	vmovupd	%ymm0, -928(%rdi,%rsi,4)
	vmovupd	%ymm0, -896(%rdi,%rsi,4)
	vmovupd	%ymm0, -864(%rdi,%rsi,4)
	vmovupd	%ymm0, -832(%rdi,%rsi,4)
	vmovupd	%ymm0, -800(%rdi,%rsi,4)
	vmovupd	%ymm0, -768(%rdi,%rsi,4)
	vmovupd	%ymm0, -736(%rdi,%rsi,4)
	vmovupd	%ymm0, -704(%rdi,%rsi,4)
	vmovupd	%ymm0, -672(%rdi,%rsi,4)
	vmovupd	%ymm0, -640(%rdi,%rsi,4)
	vmovupd	%ymm0, -608(%rdi,%rsi,4)
	vmovupd	%ymm0, -576(%rdi,%rsi,4)
	vmovupd	%ymm0, -544(%rdi,%rsi,4)
	vmovupd	%ymm0, -512(%rdi,%rsi,4)
	vmovupd	%ymm0, -480(%rdi,%rsi,4)
	vmovupd	%ymm0, -448(%rdi,%rsi,4)
	vmovupd	%ymm0, -416(%rdi,%rsi,4)
	vmovupd	%ymm0, -384(%rdi,%rsi,4)
	vmovupd	%ymm0, -352(%rdi,%rsi,4)
	vmovupd	%ymm0, -320(%rdi,%rsi,4)
	vmovupd	%ymm0, -288(%rdi,%rsi,4)
	vmovupd	%ymm0, -256(%rdi,%rsi,4)
	vmovupd	%ymm0, -224(%rdi,%rsi,4)
	vmovupd	%ymm0, -192(%rdi,%rsi,4)
	vmovupd	%ymm0, -160(%rdi,%rsi,4)
	vmovupd	%ymm0, -128(%rdi,%rsi,4)
	vmovupd	%ymm0, -96(%rdi,%rsi,4)
	vmovupd	%ymm0, -64(%rdi,%rsi,4)
	vmovupd	%ymm0, -32(%rdi,%rsi,4)
	vmovupd	%ymm0, (%rdi,%rsi,4)
	addq	$256, %rsi                      # imm = 0x100
	addq	$8, %rdx
	jne	.LBB2_31
.LBB2_32:                               # %middle.block.unr-lcssa
	testq	%rcx, %rcx
	je	.LBB2_35
# %bb.33:                               # %vector.body.epil.preheader
	leaq	(%r12,%rsi,4), %rdx
	addq	$96, %rdx
	shlq	$7, %rcx
	xorl	%esi, %esi
	vbroadcastss	.LCPI2_0(%rip), %ymm0   # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_34:                               # %vector.body.epil
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm0, -96(%rdx,%rsi)
	vmovupd	%ymm0, -64(%rdx,%rsi)
	vmovupd	%ymm0, -32(%rdx,%rsi)
	vmovupd	%ymm0, (%rdx,%rsi)
	subq	$-128, %rsi
	cmpq	%rsi, %rcx
	jne	.LBB2_34
.LBB2_35:                               # %middle.block
	cmpq	%r14, %rax
	je	.LBB2_37
	.p2align	4, 0x90
.LBB2_36:                               # %for.body77
                                        # =>This Inner Loop Header: Depth=1
	movl	$1065353216, (%r12,%rax,4)      # imm = 0x3F800000
	incq	%rax
	cmpq	%rax, %r14
	jne	.LBB2_36
.LBB2_37:                               # %for.end82
	leaq	40(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	40(%rsp), %xmm1, %xmm0
	movzwl	48(%rsp), %eax
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vdivsd	.LCPI2_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	testl	%r14d, %r14d
	je	.LBB2_45
# %bb.38:                               # %for.body87.preheader
	movq	8(%rsp), %r8                    # 8-byte Reload
	movl	(%r8), %edx
	cmpl	$1, %r14d
	jne	.LBB2_47
# %bb.39:
	xorl	%eax, %eax
.LBB2_40:                               # %for.end125.loopexit.unr-lcssa
	testb	$1, %r14b
	je	.LBB2_45
# %bb.41:                               # %for.body87.epil
	movq	8(%rsp), %rcx                   # 8-byte Reload
	movslq	4(%rcx,%rax,4), %rcx
	vxorpd	%xmm0, %xmm0, %xmm0
	cmpl	%ecx, %edx
	jge	.LBB2_44
# %bb.42:                               # %for.body100.lr.ph.epil
	movslq	%edx, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_43:                               # %for.body100.epil
                                        # =>This Inner Loop Header: Depth=1
	vmovups	(%r15,%rdx,4), %zmm1
	vxorps	%xmm2, %xmm2, %xmm2
	kxorw	%k0, %k0, %k1
	vgatherdps	(%r12,%zmm1,4), %zmm2 {%k1}
	vmulps	(%rbx,%rdx,4), %zmm2, %zmm1
	vaddps	%zmm1, %zmm0, %zmm0
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jl	.LBB2_43
.LBB2_44:                               # %for.end111.epil
	vextractf64x4	$1, %zmm0, %ymm1
	vaddps	%ymm1, %ymm0, %ymm0
	vhaddps	%ymm0, %ymm0, %ymm0
	vhaddps	%ymm0, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vpermilpd	$1, %xmm1, %xmm1        # xmm1 = xmm1[1,0]
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%r13,%rax,4)
.LBB2_45:                               # %for.end125
	leaq	40(%rsp), %rdi
	vzeroupper
	callq	ftime
	vcvtsi2sdq	40(%rsp), %xmm3, %xmm0
	movzwl	48(%rsp), %eax
	vcvtsi2sd	%eax, %xmm3, %xmm1
	vdivsd	.LCPI2_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vsubsd	16(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	movl	$.L.str.3, %edi
	movb	$1, %al
	callq	printf
	testl	%r14d, %r14d
	je	.LBB2_46
# %bb.55:                               # %for.body132.preheader
	cmpl	$32, %r14d
	jae	.LBB2_57
# %bb.56:
	xorl	%eax, %eax
	xorl	%esi, %esi
	jmp	.LBB2_64
.LBB2_46:
	xorl	%esi, %esi
	jmp	.LBB2_66
.LBB2_47:                               # %for.body87.preheader.new
	movl	%r14d, %ecx
	andl	$-2, %ecx
	xorl	%eax, %eax
	jmp	.LBB2_48
	.p2align	4, 0x90
.LBB2_54:                               # %for.end111.1
                                        #   in Loop: Header=BB2_48 Depth=1
	addq	$2, %rax
	vextractf64x4	$1, %zmm0, %ymm1
	vaddps	%ymm1, %ymm0, %ymm0
	vhaddps	%ymm0, %ymm0, %ymm0
	vhaddps	%ymm0, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vpermilpd	$1, %xmm1, %xmm1        # xmm1 = xmm1[1,0]
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%r13,%rsi,4)
	addq	$-2, %rcx
	je	.LBB2_40
.LBB2_48:                               # %for.body87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_50 Depth 2
                                        #     Child Loop BB2_53 Depth 2
	movq	%rax, %rsi
	orq	$1, %rsi
	movslq	(%r8,%rsi,4), %rdi
	vxorpd	%xmm0, %xmm0, %xmm0
	cmpl	%edi, %edx
	jge	.LBB2_51
# %bb.49:                               # %for.body100.lr.ph
                                        #   in Loop: Header=BB2_48 Depth=1
	movslq	%edx, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_50:                               # %for.body100
                                        #   Parent Loop BB2_48 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovups	(%r15,%rdx,4), %zmm1
	kxorw	%k0, %k0, %k1
	vxorps	%xmm2, %xmm2, %xmm2
	vgatherdps	(%r12,%zmm1,4), %zmm2 {%k1}
	vmulps	(%rbx,%rdx,4), %zmm2, %zmm1
	vaddps	%zmm1, %zmm0, %zmm0
	addq	$16, %rdx
	cmpq	%rdi, %rdx
	jl	.LBB2_50
.LBB2_51:                               # %for.end111
                                        #   in Loop: Header=BB2_48 Depth=1
	vextractf64x4	$1, %zmm0, %ymm1
	vaddps	%ymm1, %ymm0, %ymm0
	vhaddps	%ymm0, %ymm0, %ymm0
	vhaddps	%ymm0, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vpermilpd	$1, %xmm1, %xmm1        # xmm1 = xmm1[1,0]
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%r13,%rax,4)
	movl	8(%r8,%rax,4), %edx
	vxorps	%xmm0, %xmm0, %xmm0
	cmpl	%edx, %edi
	jge	.LBB2_54
# %bb.52:                               # %for.body100.lr.ph.1
                                        #   in Loop: Header=BB2_48 Depth=1
	movslq	%edx, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_53:                               # %for.body100.1
                                        #   Parent Loop BB2_48 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovups	(%r15,%rdi,4), %zmm1
	kxorw	%k0, %k0, %k1
	vxorps	%xmm2, %xmm2, %xmm2
	vgatherdps	(%r12,%zmm1,4), %zmm2 {%k1}
	vmulps	(%rbx,%rdi,4), %zmm2, %zmm1
	vaddps	%zmm1, %zmm0, %zmm0
	addq	$16, %rdi
	cmpq	%rbp, %rdi
	jl	.LBB2_53
	jmp	.LBB2_54
.LBB2_57:                               # %vector.ph330
	movl	%r14d, %eax
	andl	$-32, %eax
	leaq	-32(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$5, %rcx
	incq	%rcx
	testq	%rdx, %rdx
	je	.LBB2_58
# %bb.59:                               # %vector.ph330.new
	movq	%rcx, %rsi
	andq	$-2, %rsi
	negq	%rsi
	vxorps	%xmm4, %xmm4, %xmm4
	xorl	%edx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB2_60:                               # %vector.body328
                                        # =>This Inner Loop Header: Depth=1
	vmovups	(%r13,%rdx,4), %ymm5
	vmovups	32(%r13,%rdx,4), %ymm6
	vmovups	64(%r13,%rdx,4), %ymm7
	vmovups	96(%r13,%rdx,4), %ymm8
	vcmpltps	%ymm4, %ymm5, %ymm5
	vpsubd	%ymm5, %ymm0, %ymm0
	vcmpltps	%ymm4, %ymm6, %ymm5
	vpsubd	%ymm5, %ymm1, %ymm1
	vcmpltps	%ymm4, %ymm7, %ymm5
	vpsubd	%ymm5, %ymm2, %ymm2
	vcmpltps	%ymm4, %ymm8, %ymm5
	vpsubd	%ymm5, %ymm3, %ymm3
	vmovups	128(%r13,%rdx,4), %ymm5
	vmovups	160(%r13,%rdx,4), %ymm6
	vmovups	192(%r13,%rdx,4), %ymm7
	vmovups	224(%r13,%rdx,4), %ymm8
	vcmpltps	%ymm4, %ymm5, %ymm5
	vpsubd	%ymm5, %ymm0, %ymm0
	vcmpltps	%ymm4, %ymm6, %ymm5
	vpsubd	%ymm5, %ymm1, %ymm1
	vcmpltps	%ymm4, %ymm7, %ymm5
	vpsubd	%ymm5, %ymm2, %ymm2
	vcmpltps	%ymm4, %ymm8, %ymm5
	vpsubd	%ymm5, %ymm3, %ymm3
	addq	$64, %rdx
	addq	$2, %rsi
	jne	.LBB2_60
# %bb.61:                               # %middle.block326.unr-lcssa
	testb	$1, %cl
	je	.LBB2_63
.LBB2_62:                               # %vector.body328.epil
	vmovups	(%r13,%rdx,4), %ymm4
	vmovups	32(%r13,%rdx,4), %ymm5
	vmovups	64(%r13,%rdx,4), %ymm6
	vmovups	96(%r13,%rdx,4), %ymm7
	vxorps	%xmm8, %xmm8, %xmm8
	vcmpltps	%ymm8, %ymm7, %ymm7
	vpsubd	%ymm7, %ymm3, %ymm3
	vcmpltps	%ymm8, %ymm6, %ymm6
	vpsubd	%ymm6, %ymm2, %ymm2
	vcmpltps	%ymm8, %ymm5, %ymm5
	vpsubd	%ymm5, %ymm1, %ymm1
	vcmpltps	%ymm8, %ymm4, %ymm4
	vpsubd	%ymm4, %ymm0, %ymm0
.LBB2_63:                               # %middle.block326
	vpaddd	%ymm3, %ymm1, %ymm1
	vpaddd	%ymm2, %ymm0, %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %esi
	cmpq	%r14, %rax
	je	.LBB2_66
.LBB2_64:                               # %for.body132.preheader345
	vpxor	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_65:                               # %for.body132
                                        # =>This Inner Loop Header: Depth=1
	xorl	%ecx, %ecx
	vucomiss	(%r13,%rax,4), %xmm0
	seta	%cl
	addl	%ecx, %esi
	incq	%rax
	cmpq	%rax, %r14
	jne	.LBB2_65
.LBB2_66:                               # %for.end142
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	vzeroupper
	callq	printf
	movq	8(%rsp), %rdi                   # 8-byte Reload
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%r13, %rdi
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
.LBB2_58:
	.cfi_def_cfa_offset 144
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%edx, %edx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	testb	$1, %cl
	jne	.LBB2_62
	jmp	.LBB2_63
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
