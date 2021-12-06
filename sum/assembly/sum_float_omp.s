	.text
	.file	"sum_float.c"
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
	cvtsi2ss	%eax, %xmm0
	divss	.LCPI1_0(%rip), %xmm0
	movss	%xmm0, (%r14,%rbx,4)
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
	xorps	%xmm0, %xmm0
	movl	$36, %eax
	xorps	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movups	-144(%rdi,%rax,4), %xmm2
	addps	%xmm0, %xmm2
	movups	-128(%rdi,%rax,4), %xmm0
	addps	%xmm1, %xmm0
	movups	-112(%rdi,%rax,4), %xmm1
	addps	%xmm2, %xmm1
	movups	-96(%rdi,%rax,4), %xmm2
	addps	%xmm0, %xmm2
	movups	-80(%rdi,%rax,4), %xmm0
	addps	%xmm1, %xmm0
	movups	-64(%rdi,%rax,4), %xmm1
	addps	%xmm2, %xmm1
	movups	-48(%rdi,%rax,4), %xmm2
	addps	%xmm0, %xmm2
	movups	-32(%rdi,%rax,4), %xmm3
	addps	%xmm1, %xmm3
	movups	-16(%rdi,%rax,4), %xmm0
	addps	%xmm2, %xmm0
	movups	(%rdi,%rax,4), %xmm1
	addps	%xmm3, %xmm1
	addq	$40, %rax
	cmpq	$10240036, %rax                 # imm = 0x9C4024
	jne	.LBB2_1
# %bb.2:                                # %middle.block
	addps	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	shufps	$85, %xmm1, %xmm0               # xmm0 = xmm0[1,1],xmm1[1,1]
	addss	%xmm1, %xmm0
	movaps	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm2                    # xmm2 = xmm2[1],xmm1[1]
	addss	%xmm0, %xmm2
	shufps	$255, %xmm1, %xmm1              # xmm1 = xmm1[3,3,3,3]
	addss	%xmm2, %xmm1
	xorps	%xmm0, %xmm0
	addss	%xmm1, %xmm0
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
	xorps	%xmm0, %xmm0
	movl	$7, %eax
	.p2align	4, 0x90
.LBB3_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	addss	-28(%rdi,%rax,4), %xmm0
	addss	-24(%rdi,%rax,4), %xmm0
	addss	-20(%rdi,%rax,4), %xmm0
	addss	-16(%rdi,%rax,4), %xmm0
	addss	-12(%rdi,%rax,4), %xmm0
	addss	-8(%rdi,%rax,4), %xmm0
	addss	-4(%rdi,%rax,4), %xmm0
	addss	(%rdi,%rax,4), %xmm0
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
.Lfunc_end4:
	.size	print_vector, .Lfunc_end4-print_vector
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI5_0:
	.long	0x4d4ccccd                      # float 214748368
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
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
	movl	$40960000, %edi                 # imm = 0x2710000
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
	cvtsi2ss	%eax, %xmm0
	divss	.LCPI5_0(%rip), %xmm0
	movss	%xmm0, (%rbx,%rbp,4)
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
# %bb.4:                                # %vector.body128.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_5:                                # %vector.body128
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_5
# %bb.6:                                # %vector.body147.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_7:                                # %vector.body147
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_7
# %bb.8:                                # %vector.body166.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_9:                                # %vector.body166
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_9
# %bb.10:                               # %vector.body185.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_11:                               # %vector.body185
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_11
# %bb.12:                               # %vector.body204.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_13:                               # %vector.body204
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_13
# %bb.14:                               # %vector.body223.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_15:                               # %vector.body223
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_15
# %bb.16:                               # %vector.body242.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_17:                               # %vector.body242
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_17
# %bb.18:                               # %vector.body261.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_19:                               # %vector.body261
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_19
# %bb.20:                               # %vector.body280.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_21:                               # %vector.body280
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_21
# %bb.22:                               # %vector.body299.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_23:                               # %vector.body299
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_23
# %bb.24:                               # %vector.body318.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_25:                               # %vector.body318
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_25
# %bb.26:                               # %vector.body337.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_27:                               # %vector.body337
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_27
# %bb.28:                               # %vector.body356.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_29:                               # %vector.body356
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_29
# %bb.30:                               # %vector.body375.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_31:                               # %vector.body375
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_31
# %bb.32:                               # %vector.body394.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_33:                               # %vector.body394
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_33
# %bb.34:                               # %vector.body413.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_35:                               # %vector.body413
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_35
# %bb.36:                               # %vector.body432.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_37:                               # %vector.body432
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_37
# %bb.38:                               # %vector.body451.preheader
	movl	$10240000, %eax                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_39:                               # %vector.body451
                                        # =>This Inner Loop Header: Depth=1
	addq	$-800, %rax                     # imm = 0xFCE0
	jne	.LBB5_39
# %bb.40:                               # %vector.body470.preheader
	xorps	%xmm3, %xmm3
	movl	$36, %eax
	xorps	%xmm2, %xmm2
	.p2align	4, 0x90
.LBB5_41:                               # %vector.body470
                                        # =>This Inner Loop Header: Depth=1
	movups	-144(%rbx,%rax,4), %xmm0
	addps	%xmm3, %xmm0
	movups	-128(%rbx,%rax,4), %xmm1
	addps	%xmm2, %xmm1
	movups	-112(%rbx,%rax,4), %xmm2
	addps	%xmm0, %xmm2
	movups	-96(%rbx,%rax,4), %xmm0
	addps	%xmm1, %xmm0
	movups	-80(%rbx,%rax,4), %xmm1
	addps	%xmm2, %xmm1
	movups	-64(%rbx,%rax,4), %xmm2
	addps	%xmm0, %xmm2
	movups	-48(%rbx,%rax,4), %xmm0
	addps	%xmm1, %xmm0
	movups	-32(%rbx,%rax,4), %xmm1
	addps	%xmm2, %xmm1
	movups	-16(%rbx,%rax,4), %xmm3
	addps	%xmm0, %xmm3
	movups	(%rbx,%rax,4), %xmm2
	addps	%xmm1, %xmm2
	addq	$40, %rax
	cmpq	$10240036, %rax                 # imm = 0x9C4024
	jne	.LBB5_41
# %bb.42:                               # %middle.block469
	movaps	%xmm3, 32(%rsp)                 # 16-byte Spill
	movaps	%xmm2, 48(%rsp)                 # 16-byte Spill
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
.LBB5_43:                               # %for.body.i75
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_43
# %bb.44:                               # %for.body.i75.1.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_45:                               # %for.body.i75.1
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_45
# %bb.46:                               # %for.body.i75.2.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	movaps	48(%rsp), %xmm2                 # 16-byte Reload
	movaps	32(%rsp), %xmm0                 # 16-byte Reload
	.p2align	4, 0x90
.LBB5_47:                               # %for.body.i75.2
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_47
# %bb.48:                               # %for.body.i75.3.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_49:                               # %for.body.i75.3
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_49
# %bb.50:                               # %for.body.i75.4.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_51:                               # %for.body.i75.4
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_51
# %bb.52:                               # %for.body.i75.5.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_53:                               # %for.body.i75.5
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_53
# %bb.54:                               # %for.body.i75.6.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_55:                               # %for.body.i75.6
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_55
# %bb.56:                               # %for.body.i75.7.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_57:                               # %for.body.i75.7
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_57
# %bb.58:                               # %for.body.i75.8.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_59:                               # %for.body.i75.8
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_59
# %bb.60:                               # %for.body.i75.9.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_61:                               # %for.body.i75.9
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_61
# %bb.62:                               # %for.body.i75.10.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_63:                               # %for.body.i75.10
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_63
# %bb.64:                               # %for.body.i75.11.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_65:                               # %for.body.i75.11
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_65
# %bb.66:                               # %for.body.i75.12.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_67:                               # %for.body.i75.12
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_67
# %bb.68:                               # %for.body.i75.13.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_69:                               # %for.body.i75.13
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_69
# %bb.70:                               # %for.body.i75.14.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_71:                               # %for.body.i75.14
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_71
# %bb.72:                               # %for.body.i75.15.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_73:                               # %for.body.i75.15
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_73
# %bb.74:                               # %for.body.i75.16.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_75:                               # %for.body.i75.16
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_75
# %bb.76:                               # %for.body.i75.17.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_77:                               # %for.body.i75.17
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_77
# %bb.78:                               # %for.body.i75.18.preheader
	movl	$10240000, %edx                 # imm = 0x9C4000
	.p2align	4, 0x90
.LBB5_79:                               # %for.body.i75.18
                                        # =>This Inner Loop Header: Depth=1
	addq	$-25, %rdx
	jne	.LBB5_79
# %bb.80:                               # %for.body.i75.19.preheader
	xorps	%xmm1, %xmm1
	movl	$7, %edx
	.p2align	4, 0x90
.LBB5_81:                               # %for.body.i75.19
                                        # =>This Inner Loop Header: Depth=1
	addss	-28(%rbx,%rdx,4), %xmm1
	addss	-24(%rbx,%rdx,4), %xmm1
	addss	-20(%rbx,%rdx,4), %xmm1
	addss	-16(%rbx,%rdx,4), %xmm1
	addss	-12(%rbx,%rdx,4), %xmm1
	addss	-8(%rbx,%rdx,4), %xmm1
	addss	-4(%rbx,%rdx,4), %xmm1
	addss	(%rbx,%rdx,4), %xmm1
	addq	$8, %rdx
	cmpq	$10240007, %rdx                 # imm = 0x9C4007
	jne	.LBB5_81
# %bb.82:                               # %sum_serial.exit.19
	addps	%xmm0, %xmm2
	movaps	%xmm2, %xmm0
	shufps	$85, %xmm2, %xmm0               # xmm0 = xmm0[1,1],xmm2[1,1]
	addss	%xmm2, %xmm0
	movss	%xmm1, 48(%rsp)                 # 4-byte Spill
	movaps	%xmm2, %xmm1
	unpckhpd	%xmm2, %xmm1                    # xmm1 = xmm1[1],xmm2[1]
	addss	%xmm0, %xmm1
	shufps	$255, %xmm2, %xmm2              # xmm2 = xmm2[3,3,3,3]
	addss	%xmm1, %xmm2
	movzwl	%bp, %edx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movsd	.LCPI5_1(%rip), %xmm1           # xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	cvtsi2sd	%r12, %xmm3
	addsd	%xmm0, %xmm3
	movzwl	%r15w, %edx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm1, %xmm4
	xorps	%xmm1, %xmm1
	cvtsi2sd	%r14, %xmm1
	addsd	%xmm0, %xmm1
	subsd	%xmm1, %xmm3
	xorpd	%xmm0, %xmm0
	addss	%xmm2, %xmm0
	movss	%xmm0, 32(%rsp)                 # 4-byte Spill
	xorps	%xmm0, %xmm0
	addsd	%xmm0, %xmm3
	movsd	%xmm3, 24(%rsp)                 # 8-byte Spill
	movzwl	%cx, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%ecx, %xmm0
	divsd	%xmm4, %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2sd	%rax, %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	movq	%rsp, %rdi
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
	movss	32(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.5, %edi
	callq	puts
	movss	48(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str.6, %edi
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
	movss	48(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	subss	32(%rsp), %xmm0                 # 4-byte Folded Reload
	cvtss2sd	%xmm0, %xmm0
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
