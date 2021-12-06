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
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	.LCPI1_0(%rip), %xmm0
	movsd	%xmm0, (%r14,%rbx,8)
	addq	$1, %rbx
	cmpq	$10240000, %rbx                 # imm = 0x9C4000
	jne	.LBB1_1
# %bb.2:                                # %for.cond.cleanup
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
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
	xorpd	%xmm0, %xmm0
	movl	$18, %eax
	xorpd	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movupd	-144(%rdi,%rax,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	-128(%rdi,%rax,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	-112(%rdi,%rax,8), %xmm1
	addpd	%xmm2, %xmm1
	movupd	-96(%rdi,%rax,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	-80(%rdi,%rax,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	-64(%rdi,%rax,8), %xmm1
	addpd	%xmm2, %xmm1
	movupd	-48(%rdi,%rax,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	-32(%rdi,%rax,8), %xmm3
	addpd	%xmm1, %xmm3
	movupd	-16(%rdi,%rax,8), %xmm0
	addpd	%xmm2, %xmm0
	movupd	(%rdi,%rax,8), %xmm1
	addpd	%xmm3, %xmm1
	addq	$20, %rax
	cmpq	$10240018, %rax                 # imm = 0x9C4012
	jne	.LBB2_1
# %bb.2:                                # %middle.block
	addpd	%xmm0, %xmm1
	movapd	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm2                    # xmm2 = xmm2[1],xmm1[1]
	addsd	%xmm1, %xmm2
	xorpd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
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
	xorpd	%xmm0, %xmm0
	movl	$7, %eax
	.p2align	4, 0x90
.LBB3_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	addsd	-56(%rdi,%rax,8), %xmm0
	addsd	-48(%rdi,%rax,8), %xmm0
	addsd	-40(%rdi,%rax,8), %xmm0
	addsd	-32(%rdi,%rax,8), %xmm0
	addsd	-24(%rdi,%rax,8), %xmm0
	addsd	-16(%rdi,%rax,8), %xmm0
	addsd	-8(%rdi,%rax,8), %xmm0
	addsd	(%rdi,%rax,8), %xmm0
	addq	$8, %rax
	cmpq	$10240007, %rax                 # imm = 0x9C4007
	jne	.LBB3_1
# %bb.2:                                # %for.cond.cleanup
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$91, %edi
	callq	putchar@PLT
	movsd	(%rbx), %xmm0                   # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movsd	8(%rbx), %xmm0                  # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movsd	16(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movsd	24(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movsd	32(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movsd	40(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movsd	48(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movsd	56(%rbx), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.2, %edi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	puts                            # TAILCALL
.Lfunc_end4:
	.size	print_vector, .Lfunc_end4-print_vector
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI5_0:
	.quad	0x41a9999999666666              # double 214748364.69999999
.LCPI5_1:
	.quad	0x408f400000000000              # double 1000
.LCPI5_2:
	.quad	0x41cdcd6500000000              # double 1.0E+9
.LCPI5_3:
	.quad	0x432dcd6500000000              # double 4.194304E+15
.LCPI5_4:
	.quad	0x4034000000000000              # double 20
.LCPI5_5:
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$80, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$81920000, %edi                 # imm = 0x4E20000
	callq	malloc
	movq	%rax, %rbx
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	.p2align	4, 0x90
.LBB5_1:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	callq	rand
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	.LCPI5_0(%rip), %xmm0
	movsd	%xmm0, (%rbx,%rbp,8)
	addq	$1, %rbp
	cmpq	$10240000, %rbp                 # imm = 0x9C4000
	jne	.LBB5_1
# %bb.2:                                # %iter.check
	movq	%rsp, %rdi
	callq	ftime
	movq	(%rsp), %r14
	movzwl	8(%rsp), %r15d
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_3
# %bb.4:                                # %vector.body125.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_5:                                # %vector.body125
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_5
# %bb.6:                                # %vector.body144.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_7:                                # %vector.body144
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_7
# %bb.8:                                # %vector.body163.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_9:                                # %vector.body163
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_9
# %bb.10:                               # %vector.body182.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_11:                               # %vector.body182
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_11
# %bb.12:                               # %vector.body201.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_13:                               # %vector.body201
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_13
# %bb.14:                               # %vector.body220.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_15:                               # %vector.body220
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_15
# %bb.16:                               # %vector.body239.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_17:                               # %vector.body239
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_17
# %bb.18:                               # %vector.body258.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_19:                               # %vector.body258
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_19
# %bb.20:                               # %vector.body277.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_21:                               # %vector.body277
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_21
# %bb.22:                               # %vector.body296.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_23:                               # %vector.body296
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_23
# %bb.24:                               # %vector.body315.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_25:                               # %vector.body315
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_25
# %bb.26:                               # %vector.body334.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_27:                               # %vector.body334
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_27
# %bb.28:                               # %vector.body353.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_29:                               # %vector.body353
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_29
# %bb.30:                               # %vector.body372.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_31:                               # %vector.body372
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_31
# %bb.32:                               # %vector.body391.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_33:                               # %vector.body391
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_33
# %bb.34:                               # %vector.body410.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_35:                               # %vector.body410
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_35
# %bb.36:                               # %vector.body429.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_37:                               # %vector.body429
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_37
# %bb.38:                               # %vector.body448.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_39:                               # %vector.body448
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_39
# %bb.40:                               # %vector.body467.preheader
	xorpd	%xmm3, %xmm3
	movl	$18, %eax
	xorpd	%xmm2, %xmm2
	.p2align	4, 0x90
.LBB5_41:                               # %vector.body467
                                        # =>This Inner Loop Header: Depth=1
	movupd	-144(%rbx,%rax,8), %xmm0
	addpd	%xmm3, %xmm0
	movupd	-128(%rbx,%rax,8), %xmm1
	addpd	%xmm2, %xmm1
	movupd	-112(%rbx,%rax,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	-96(%rbx,%rax,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	-80(%rbx,%rax,8), %xmm1
	addpd	%xmm2, %xmm1
	movupd	-64(%rbx,%rax,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	-48(%rbx,%rax,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	-32(%rbx,%rax,8), %xmm1
	addpd	%xmm2, %xmm1
	movupd	-16(%rbx,%rax,8), %xmm3
	addpd	%xmm0, %xmm3
	movupd	(%rbx,%rax,8), %xmm2
	addpd	%xmm1, %xmm2
	addq	$20, %rax
	cmpq	$10240018, %rax                 # imm = 0x9C4012
	jne	.LBB5_41
# %bb.42:                               # %middle.block466
	movapd	%xmm3, 32(%rsp)                 # 16-byte Spill
	movapd	%xmm2, 48(%rsp)                 # 16-byte Spill
	movq	%rsp, %rdi
	callq	ftime
	movq	(%rsp), %r12
	movzwl	8(%rsp), %ebp
	movq	%rsp, %rdi
	callq	ftime
	movq	(%rsp), %rax
	movzwl	8(%rsp), %ecx
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_43:                               # %for.body.i72
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_43
# %bb.44:                               # %for.body.i72.1.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_45:                               # %for.body.i72.1
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_45
# %bb.46:                               # %for.body.i72.2.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	movapd	48(%rsp), %xmm1                 # 16-byte Reload
	movapd	32(%rsp), %xmm0                 # 16-byte Reload
	.p2align	4, 0x90
.LBB5_47:                               # %for.body.i72.2
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_47
# %bb.48:                               # %for.body.i72.3.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_49:                               # %for.body.i72.3
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_49
# %bb.50:                               # %for.body.i72.4.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_51:                               # %for.body.i72.4
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_51
# %bb.52:                               # %for.body.i72.5.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_53:                               # %for.body.i72.5
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_53
# %bb.54:                               # %for.body.i72.6.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_55:                               # %for.body.i72.6
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_55
# %bb.56:                               # %for.body.i72.7.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_57:                               # %for.body.i72.7
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_57
# %bb.58:                               # %for.body.i72.8.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_59:                               # %for.body.i72.8
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_59
# %bb.60:                               # %for.body.i72.9.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_61:                               # %for.body.i72.9
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_61
# %bb.62:                               # %for.body.i72.10.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_63:                               # %for.body.i72.10
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_63
# %bb.64:                               # %for.body.i72.11.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_65:                               # %for.body.i72.11
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_65
# %bb.66:                               # %for.body.i72.12.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_67:                               # %for.body.i72.12
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_67
# %bb.68:                               # %for.body.i72.13.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_69:                               # %for.body.i72.13
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_69
# %bb.70:                               # %for.body.i72.14.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_71:                               # %for.body.i72.14
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_71
# %bb.72:                               # %for.body.i72.15.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_73:                               # %for.body.i72.15
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_73
# %bb.74:                               # %for.body.i72.16.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_75:                               # %for.body.i72.16
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_75
# %bb.76:                               # %for.body.i72.17.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_77:                               # %for.body.i72.17
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_77
# %bb.78:                               # %for.body.i72.18.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_79:                               # %for.body.i72.18
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_79
# %bb.80:                               # %for.body.i72.19.preheader
	xorpd	%xmm2, %xmm2
	movl	$7, %edx
	.p2align	4, 0x90
.LBB5_81:                               # %for.body.i72.19
                                        # =>This Inner Loop Header: Depth=1
	addsd	-56(%rbx,%rdx,8), %xmm2
	addsd	-48(%rbx,%rdx,8), %xmm2
	addsd	-40(%rbx,%rdx,8), %xmm2
	addsd	-32(%rbx,%rdx,8), %xmm2
	addsd	-24(%rbx,%rdx,8), %xmm2
	addsd	-16(%rbx,%rdx,8), %xmm2
	addsd	-8(%rbx,%rdx,8), %xmm2
	addsd	(%rbx,%rdx,8), %xmm2
	addq	$8, %rdx
	cmpq	$10240007, %rdx                 # imm = 0x9C4007
	jne	.LBB5_81
# %bb.82:                               # %sum_serial.exit.19
	addpd	%xmm0, %xmm1
	movapd	%xmm1, %xmm3
	unpckhpd	%xmm1, %xmm3                    # xmm3 = xmm3[1],xmm1[1]
	movzwl	%bp, %edx
	cvtsi2sd	%edx, %xmm0
	addsd	%xmm1, %xmm3
	movsd	.LCPI5_1(%rip), %xmm5           # xmm5 = mem[0],zero
	cvtsi2sd	%r12, %xmm4
	divsd	%xmm5, %xmm0
	movzwl	%r15w, %edx
	xorps	%xmm1, %xmm1
	cvtsi2sd	%edx, %xmm1
	addsd	%xmm0, %xmm4
	divsd	%xmm5, %xmm1
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r14, %xmm0
	addsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm4
	xorpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm3
	movapd	%xmm3, 48(%rsp)                 # 16-byte Spill
	addsd	%xmm0, %xmm4
	movsd	%xmm4, 24(%rsp)                 # 8-byte Spill
	movzwl	%cx, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%ecx, %xmm0
	divsd	%xmm5, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2sd	%rax, %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	movq	%rsp, %rdi
	movsd	%xmm2, 32(%rsp)                 # 8-byte Spill
	callq	ftime
	xorps	%xmm0, %xmm0
	cvtsi2sdq	(%rsp), %xmm0
	movzwl	8(%rsp), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	divsd	.LCPI5_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	subsd	16(%rsp), %xmm1                 # 8-byte Folded Reload
	addsd	.LCPI5_5, %xmm1
	movsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	movq	%rbx, %rdi
	callq	print_vector
	movl	$.L.str.3, %edi
	callq	puts
	movl	$.L.str.4, %edi
	movaps	48(%rsp), %xmm0                 # 16-byte Reload
	movb	$1, %al
	callq	printf
	movl	$.L.str.5, %edi
	callq	puts
	movl	$.L.str.6, %edi
	movsd	32(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	printf
	movsd	.LCPI5_2(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movsd	.LCPI5_3(%rip), %xmm2           # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm3
	divsd	%xmm1, %xmm3
	movsd	%xmm3, 64(%rsp)                 # 8-byte Spill
	mulsd	16(%rsp), %xmm0                 # 8-byte Folded Reload
	divsd	%xmm0, %xmm2
	movsd	%xmm2, 72(%rsp)                 # 8-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	movl	$.Lstr.13, %edi
	callq	puts
	movl	$.Lstr.14, %edi
	callq	puts
	movsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	.LCPI5_4(%rip), %xmm0
	movl	$.L.str.10, %edi
	movsd	64(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	movsd	16(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	.LCPI5_4(%rip), %xmm0
	movl	$.L.str.11, %edi
	movsd	72(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$2, %al
	callq	printf
	movsd	32(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	48(%rsp), %xmm0                 # 16-byte Folded Reload
	movl	$.L.str.12, %edi
	movb	$1, %al
	callq	printf
	movq	%rbx, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$80, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
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

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"=================================================================="
	.size	.Lstr, 67

	.type	.Lstr.13,@object                # @str.13
.Lstr.13:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.13, 35

	.type	.Lstr.14,@object                # @str.14
.Lstr.14:
	.asciz	"------------------------------------------------------------------"
	.size	.Lstr.14, 67

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
