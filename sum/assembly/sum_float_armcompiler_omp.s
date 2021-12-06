	.text
	.file	"sum_float.c"
	.globl	read_timer                      // -- Begin function read_timer
	.p2align	5
	.type	read_timer,@function
read_timer:                             // @read_timer
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #32                     // =32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x0, sp
	bl	ftime
	ldr	h1, [sp, #8]
	ldr	d0, [sp]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	ucvtf	d1, d1
	fmov	d2, x8
	scvtf	d0, d0
	fdiv	d1, d1, d2
	fadd	d0, d1, d0
	add	sp, sp, #32                     // =32
	ret
.Lfunc_end0:
	.size	read_timer, .Lfunc_end0-read_timer
	.cfi_endproc
                                        // -- End function
	.globl	init                            // -- Begin function init
	.p2align	5
	.type	init,@function
init:                                   // @init
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-48]!           // 16-byte Folded Spill
	str	x21, [sp, #16]                  // 8-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	mov	w21, #52429
	mov	x19, x0
	mov	x20, xzr
	movk	w21, #19788, lsl #16
	.p2align	5
.LBB1_1:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	scvtf	s0, w0
	fmov	s1, w21
	fdiv	s0, s0, s1
	str	s0, [x19, x20, lsl #2]
	add	x20, x20, #1                    // =1
	cmp	x20, #2500, lsl #12             // =10240000
	b.ne	.LBB1_1
// %bb.2:
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldr	x21, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        // -- End function
	.globl	sum                             // -- Begin function sum
	.p2align	5
	.type	sum,@function
sum:                                    // @sum
	.cfi_startproc
// %bb.0:
	mov	w9, #16384
	movk	w9, #156, lsl #16
	mov	x8, xzr
	fmov	s0, wzr
	whilelo	p1.s, xzr, x9
	ptrue	p0.s
	.p2align	5
.LBB2_1:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p1/z, [x0, x8, lsl #2]
	incw	x8
	whilelo	p1.s, x8, x9
	fadda	s0, p0, s0, z1.s
	b.mi	.LBB2_1
// %bb.2:
	fmov	s1, wzr
	fadd	s0, s0, s1
	ret
.Lfunc_end2:
	.size	sum, .Lfunc_end2-sum
	.cfi_endproc
                                        // -- End function
	.globl	sum_serial                      // -- Begin function sum_serial
	.p2align	5
	.type	sum_serial,@function
sum_serial:                             // @sum_serial
	.cfi_startproc
// %bb.0:
	mov	w9, #16384
	movk	w9, #156, lsl #16
	mov	x8, xzr
	fmov	s0, wzr
	whilelo	p1.s, xzr, x9
	ptrue	p0.s
	.p2align	5
.LBB3_1:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p1/z, [x0, x8, lsl #2]
	incw	x8
	whilelo	p1.s, x8, x9
	fadda	s0, p0, s0, z1.s
	b.mi	.LBB3_1
// %bb.2:
                                        // kill: def $s0 killed $s0 killed $z0
	ret
.Lfunc_end3:
	.size	sum_serial, .Lfunc_end3-sum_serial
	.cfi_endproc
                                        // -- End function
	.globl	print_vector                    // -- Begin function print_vector
	.p2align	5
	.type	print_vector,@function
print_vector:                           // @print_vector
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	mov	x19, x0
	mov	w0, #91
	bl	putchar
	ldr	s0, [x19]
	adrp	x20, .L.str.1
	add	x20, x20, :lo12:.L.str.1
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #4]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #8]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #12]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #16]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #20]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #24]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldr	s0, [x19, #28]
	mov	x0, x20
	fcvt	d0, s0
	bl	printf
	ldp	x20, x19, [sp, #16]             // 16-byte Folded Reload
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	b	puts
.Lfunc_end4:
	.size	print_vector, .Lfunc_end4-print_vector
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	5
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	stp	d13, d12, [sp, #-128]!          // 16-byte Folded Spill
	stp	d11, d10, [sp, #16]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	str	x28, [sp, #64]                  // 8-byte Folded Spill
	stp	x24, x23, [sp, #80]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            // 16-byte Folded Spill
	mov	x29, sp
	addvl	sp, sp, #-1
	sub	sp, sp, #16                     // =16
	.cfi_def_cfa w29, 128
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w28, -64
	.cfi_offset w30, -72
	.cfi_offset w29, -80
	.cfi_offset b8, -88
	.cfi_offset b9, -96
	.cfi_offset b10, -104
	.cfi_offset b11, -112
	.cfi_offset b12, -120
	.cfi_offset b13, -128
	mov	w20, #16384
	mov	w0, #40960000
	movk	w20, #156, lsl #16
	bl	malloc
	mov	x19, x0
	mov	x0, xzr
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	mov	w22, #52429
	mov	x21, xzr
	movk	w22, #19788, lsl #16
	.p2align	5
.LBB5_1:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	scvtf	s0, w0
	fmov	s1, w22
	fdiv	s0, s0, s1
	str	s0, [x19, x21, lsl #2]
	add	x21, x21, #1                    // =1
	cmp	x21, x20
	b.ne	.LBB5_1
// %bb.2:
	mov	x0, sp
	bl	ftime
	ldr	x21, [sp]
	ldrh	w22, [sp, #8]
	mov	x8, xzr
	.p2align	5
.LBB5_3:                                // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_3
// %bb.4:
	mov	x8, xzr
	.p2align	5
.LBB5_5:                                // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_5
// %bb.6:
	mov	x8, xzr
	.p2align	5
.LBB5_7:                                // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_7
// %bb.8:
	mov	x8, xzr
	.p2align	5
.LBB5_9:                                // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_9
// %bb.10:
	mov	x8, xzr
	.p2align	5
.LBB5_11:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_11
// %bb.12:
	mov	x8, xzr
	.p2align	5
.LBB5_13:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_13
// %bb.14:
	mov	x8, xzr
	.p2align	5
.LBB5_15:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_15
// %bb.16:
	mov	x8, xzr
	.p2align	5
.LBB5_17:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_17
// %bb.18:
	mov	x8, xzr
	.p2align	5
.LBB5_19:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_19
// %bb.20:
	mov	x8, xzr
	.p2align	5
.LBB5_21:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_21
// %bb.22:
	mov	x8, xzr
	.p2align	5
.LBB5_23:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_23
// %bb.24:
	mov	x8, xzr
	.p2align	5
.LBB5_25:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_25
// %bb.26:
	mov	x8, xzr
	.p2align	5
.LBB5_27:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_27
// %bb.28:
	mov	x8, xzr
	.p2align	5
.LBB5_29:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_29
// %bb.30:
	mov	x8, xzr
	.p2align	5
.LBB5_31:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_31
// %bb.32:
	mov	x8, xzr
	.p2align	5
.LBB5_33:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_33
// %bb.34:
	mov	x8, xzr
	.p2align	5
.LBB5_35:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_35
// %bb.36:
	mov	x8, xzr
	.p2align	5
.LBB5_37:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_37
// %bb.38:
	mov	x8, xzr
	.p2align	5
.LBB5_39:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x20
	b.lo	.LBB5_39
// %bb.40:
	mov	x8, xzr
	whilelo	p0.s, xzr, x20
	fmov	s0, wzr
	ptrue	p1.s
	.p2align	5
.LBB5_41:                               // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p0/z, [x19, x8, lsl #2]
	incw	x8
	whilelo	p0.s, x8, x20
	fadda	s0, p1, s0, z1.s
	b.mi	.LBB5_41
// %bb.42:
	fmov	s1, wzr
	mov	x0, sp
	fadd	s10, s0, s1
	bl	ftime
	ldr	x23, [sp]
	ldrh	w24, [sp, #8]
	mov	x0, sp
	bl	ftime
	ldr	x8, [sp]
	ldrh	w9, [sp, #8]
	mov	x10, xzr
	.p2align	5
.LBB5_43:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_43
// %bb.44:
	mov	x10, xzr
	.p2align	5
.LBB5_45:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_45
// %bb.46:
	mov	x10, xzr
	ptrue	p1.s
	.p2align	5
.LBB5_47:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_47
// %bb.48:
	mov	x10, xzr
	.p2align	5
.LBB5_49:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_49
// %bb.50:
	mov	x10, xzr
	.p2align	5
.LBB5_51:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_51
// %bb.52:
	mov	x10, xzr
	.p2align	5
.LBB5_53:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_53
// %bb.54:
	mov	x10, xzr
	.p2align	5
.LBB5_55:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_55
// %bb.56:
	mov	x10, xzr
	.p2align	5
.LBB5_57:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_57
// %bb.58:
	mov	x10, xzr
	.p2align	5
.LBB5_59:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_59
// %bb.60:
	mov	x10, xzr
	.p2align	5
.LBB5_61:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_61
// %bb.62:
	mov	x10, xzr
	.p2align	5
.LBB5_63:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_63
// %bb.64:
	mov	x10, xzr
	.p2align	5
.LBB5_65:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_65
// %bb.66:
	mov	x10, xzr
	.p2align	5
.LBB5_67:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_67
// %bb.68:
	mov	x10, xzr
	.p2align	5
.LBB5_69:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_69
// %bb.70:
	mov	x10, xzr
	.p2align	5
.LBB5_71:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_71
// %bb.72:
	mov	x10, xzr
	.p2align	5
.LBB5_73:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_73
// %bb.74:
	mov	x10, xzr
	.p2align	5
.LBB5_75:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_75
// %bb.76:
	mov	x10, xzr
	.p2align	5
.LBB5_77:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_77
// %bb.78:
	mov	x10, xzr
	.p2align	5
.LBB5_79:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x20
	b.lo	.LBB5_79
// %bb.80:
	mov	x10, xzr
	whilelo	p0.s, xzr, x20
	fmov	s1, wzr
	.p2align	5
.LBB5_81:                               // =>This Inner Loop Header: Depth=1
	ld1w	{ z0.s }, p0/z, [x19, x10, lsl #2]
	incw	x10
	whilelo	p0.s, x10, x20
	fadda	s1, p1, s1, z0.s
	b.mi	.LBB5_81
// %bb.82:
	mov	x10, #70368744177664
	movk	x10, #16527, lsl #48
	ucvtf	d0, w24
	fmov	d8, x10
	str	z1, [x29, #-1, mul vl]          // 16-byte Folded Spill
	scvtf	d1, x23
	ucvtf	d2, w22
	fdiv	d0, d0, d8
	scvtf	d3, x21
	fadd	d0, d0, d1
	fdiv	d1, d2, d8
	fadd	d1, d1, d3
	ucvtf	d2, w9
	fmov	d9, xzr
	fsub	d0, d0, d1
	scvtf	d1, x8
	fdiv	d2, d2, d8
	mov	x0, sp
	fadd	d11, d0, d9
	fadd	d12, d2, d1
	bl	ftime
	ldr	h1, [sp, #8]
	ldr	d0, [sp]
	mov	x0, x19
	ucvtf	d1, d1
	scvtf	d0, d0
	fdiv	d1, d1, d8
	fadd	d0, d1, d0
	fsub	d0, d0, d12
	fadd	d12, d0, d9
	bl	print_vector
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	bl	puts
	adrp	x0, .L.str.4
	fcvt	d0, s10
	add	x0, x0, :lo12:.L.str.4
	bl	printf
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	puts
	ldr	z0, [x29, #-1, mul vl]          // 16-byte Folded Reload
	adrp	x0, .L.str.6
	add	x0, x0, :lo12:.L.str.6
	fcvt	d0, s0
	bl	printf
	mov	x8, #225833675390976
	movk	x8, #16845, lsl #48
	mov	x9, #225833675390976
	movk	x9, #17197, lsl #48
	fmov	d0, x8
	adrp	x0, .Lstr
	fmul	d1, d11, d0
	fmov	d2, x9
	fmul	d0, d12, d0
	add	x0, x0, :lo12:.Lstr
	fdiv	d8, d2, d1
	fdiv	d9, d2, d0
	bl	puts
	adrp	x0, .Lstr.13
	add	x0, x0, :lo12:.Lstr.13
	bl	puts
	adrp	x0, .Lstr.14
	add	x0, x0, :lo12:.Lstr.14
	bl	puts
	fmov	d13, #20.00000000
	adrp	x0, .L.str.10
	fdiv	d0, d11, d13
	add	x0, x0, :lo12:.L.str.10
	mov	v1.16b, v8.16b
	bl	printf
	adrp	x0, .L.str.11
	fdiv	d0, d12, d13
	add	x0, x0, :lo12:.L.str.11
	mov	v1.16b, v9.16b
	bl	printf
	ldr	z0, [x29, #-1, mul vl]          // 16-byte Folded Reload
	adrp	x0, .L.str.12
	add	x0, x0, :lo12:.L.str.12
	fsub	s0, s0, s10
	fcvt	d0, s0
	bl	printf
	mov	x0, x19
	bl	free
	mov	w0, wzr
	addvl	sp, sp, #1
	add	sp, sp, #16                     // =16
	ldp	x20, x19, [sp, #112]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             // 16-byte Folded Reload
	ldr	x28, [sp, #64]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             // 16-byte Folded Reload
	ldp	d13, d12, [sp], #128            // 16-byte Folded Reload
	ret
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str.1,@object                // @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"%.2f "
	.size	.L.str.1, 6

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"]"
	.size	.L.str.2, 2

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"=\n"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                // @.str.4
.L.str.4:
	.asciz	"SIMD: %f\n"
	.size	.L.str.4, 10

	.type	.L.str.5,@object                // @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.6,@object                // @.str.6
.L.str.6:
	.asciz	"Serial: %f\n"
	.size	.L.str.6, 12

	.type	.L.str.10,@object               // @.str.10
.L.str.10:
	.asciz	"Sum (SIMD):\t\t%4f\t%4f\n"
	.size	.L.str.10, 22

	.type	.L.str.11,@object               // @.str.11
.L.str.11:
	.asciz	"Sum (Serial):\t\t%4f\t%4f\n"
	.size	.L.str.11, 24

	.type	.L.str.12,@object               // @.str.12
.L.str.12:
	.asciz	"Correctness check: %f\n"
	.size	.L.str.12, 23

	.type	.Lstr,@object                   // @str
.Lstr:
	.asciz	"=================================================================="
	.size	.Lstr, 67

	.type	.Lstr.13,@object                // @str.13
.Lstr.13:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.13, 35

	.type	.Lstr.14,@object                // @str.14
.Lstr.14:
	.asciz	"------------------------------------------------------------------"
	.size	.Lstr.14, 67

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
