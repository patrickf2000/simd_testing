	.text
	.file	"sum_int.c"
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
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	mov	x19, x0
	mov	x20, xzr
	.p2align	5
.LBB1_1:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	str	w0, [x19, x20, lsl #2]
	add	x20, x20, #1                    // =1
	cmp	x20, #2500, lsl #12             // =10240000
	b.ne	.LBB1_1
// %bb.2:
	ldp	x20, x19, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
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
	mov	z0.s, #0                        // =0x0
	whilelo	p1.s, xzr, x9
	ptrue	p0.s
	.p2align	5
.LBB2_1:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p1/z, [x0, x8, lsl #2]
	incw	x8
	whilelo	p1.s, x8, x9
	add	z0.s, z0.s, z1.s
	b.mi	.LBB2_1
// %bb.2:
	uaddv	d0, p0, z0.s
	fmov	x0, d0
                                        // kill: def $w0 killed $w0 killed $x0
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
	mov	z0.s, #0                        // =0x0
	whilelo	p1.s, xzr, x9
	ptrue	p0.s
	.p2align	5
.LBB3_1:                                // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p1/z, [x0, x8, lsl #2]
	incw	x8
	whilelo	p1.s, x8, x9
	add	z0.s, z0.s, z1.s
	b.mi	.LBB3_1
// %bb.2:
	uaddv	d0, p0, z0.s
	fmov	x0, d0
                                        // kill: def $w0 killed $w0 killed $x0
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
	ldr	w1, [x19]
	adrp	x20, .L.str.1
	add	x20, x20, :lo12:.L.str.1
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #4]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #8]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #12]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #16]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #20]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #24]
	mov	x0, x20
	bl	printf
	ldr	w1, [x19, #28]
	mov	x0, x20
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
	sub	sp, sp, #128                    // =128
	str	d12, [sp, #16]                  // 8-byte Folded Spill
	stp	d11, d10, [sp, #24]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #40]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #56]             // 16-byte Folded Spill
	str	x25, [sp, #72]                  // 8-byte Folded Spill
	stp	x24, x23, [sp, #80]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 112
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w30, -64
	.cfi_offset w29, -72
	.cfi_offset b8, -80
	.cfi_offset b9, -88
	.cfi_offset b10, -96
	.cfi_offset b11, -104
	.cfi_offset b12, -112
	mov	w21, #16384
	mov	w0, #40960000
	movk	w21, #156, lsl #16
	bl	malloc
	mov	x19, x0
	mov	x0, xzr
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	mov	x20, xzr
	.p2align	5
.LBB5_1:                                // =>This Inner Loop Header: Depth=1
	bl	rand
	str	w0, [x19, x20, lsl #2]
	add	x20, x20, #1                    // =1
	cmp	x20, x21
	b.ne	.LBB5_1
// %bb.2:
	mov	x0, sp
	bl	ftime
	ldr	x22, [sp]
	ldrh	w23, [sp, #8]
	mov	x8, xzr
	.p2align	5
.LBB5_3:                                // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_3
// %bb.4:
	mov	x8, xzr
	.p2align	5
.LBB5_5:                                // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_5
// %bb.6:
	mov	x8, xzr
	.p2align	5
.LBB5_7:                                // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_7
// %bb.8:
	mov	x8, xzr
	.p2align	5
.LBB5_9:                                // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_9
// %bb.10:
	mov	x8, xzr
	.p2align	5
.LBB5_11:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_11
// %bb.12:
	mov	x8, xzr
	.p2align	5
.LBB5_13:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_13
// %bb.14:
	mov	x8, xzr
	.p2align	5
.LBB5_15:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_15
// %bb.16:
	mov	x8, xzr
	.p2align	5
.LBB5_17:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_17
// %bb.18:
	mov	x8, xzr
	.p2align	5
.LBB5_19:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_19
// %bb.20:
	mov	x8, xzr
	.p2align	5
.LBB5_21:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_21
// %bb.22:
	mov	x8, xzr
	.p2align	5
.LBB5_23:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_23
// %bb.24:
	mov	x8, xzr
	.p2align	5
.LBB5_25:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_25
// %bb.26:
	mov	x8, xzr
	.p2align	5
.LBB5_27:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_27
// %bb.28:
	mov	x8, xzr
	.p2align	5
.LBB5_29:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_29
// %bb.30:
	mov	x8, xzr
	.p2align	5
.LBB5_31:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_31
// %bb.32:
	mov	x8, xzr
	.p2align	5
.LBB5_33:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_33
// %bb.34:
	mov	x8, xzr
	.p2align	5
.LBB5_35:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_35
// %bb.36:
	mov	x8, xzr
	.p2align	5
.LBB5_37:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_37
// %bb.38:
	mov	x8, xzr
	.p2align	5
.LBB5_39:                               // =>This Inner Loop Header: Depth=1
	addvl	x8, x8, #1
	cmp	x8, x21
	b.lo	.LBB5_39
// %bb.40:
	mov	x8, xzr
	whilelo	p0.s, xzr, x21
	mov	z0.s, #0                        // =0x0
	ptrue	p1.s
	.p2align	5
.LBB5_41:                               // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p0/z, [x19, x8, lsl #2]
	incw	x8
	whilelo	p0.s, x8, x21
	add	z0.s, z0.s, z1.s
	b.mi	.LBB5_41
// %bb.42:
	uaddv	d0, p1, z0.s
	mov	x0, sp
	fmov	x20, d0
	bl	ftime
	ldr	x24, [sp]
	ldrh	w25, [sp, #8]
	mov	x0, sp
	bl	ftime
	ldr	x8, [sp]
	ldrh	w9, [sp, #8]
	mov	x10, xzr
	.p2align	5
.LBB5_43:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_43
// %bb.44:
	mov	x10, xzr
	.p2align	5
.LBB5_45:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_45
// %bb.46:
	mov	x10, xzr
	ptrue	p1.s
	.p2align	5
.LBB5_47:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_47
// %bb.48:
	mov	x10, xzr
	.p2align	5
.LBB5_49:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_49
// %bb.50:
	mov	x10, xzr
	.p2align	5
.LBB5_51:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_51
// %bb.52:
	mov	x10, xzr
	.p2align	5
.LBB5_53:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_53
// %bb.54:
	mov	x10, xzr
	.p2align	5
.LBB5_55:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_55
// %bb.56:
	mov	x10, xzr
	.p2align	5
.LBB5_57:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_57
// %bb.58:
	mov	x10, xzr
	.p2align	5
.LBB5_59:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_59
// %bb.60:
	mov	x10, xzr
	.p2align	5
.LBB5_61:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_61
// %bb.62:
	mov	x10, xzr
	.p2align	5
.LBB5_63:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_63
// %bb.64:
	mov	x10, xzr
	.p2align	5
.LBB5_65:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_65
// %bb.66:
	mov	x10, xzr
	.p2align	5
.LBB5_67:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_67
// %bb.68:
	mov	x10, xzr
	.p2align	5
.LBB5_69:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_69
// %bb.70:
	mov	x10, xzr
	.p2align	5
.LBB5_71:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_71
// %bb.72:
	mov	x10, xzr
	.p2align	5
.LBB5_73:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_73
// %bb.74:
	mov	x10, xzr
	.p2align	5
.LBB5_75:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_75
// %bb.76:
	mov	x10, xzr
	.p2align	5
.LBB5_77:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_77
// %bb.78:
	mov	x10, xzr
	.p2align	5
.LBB5_79:                               // =>This Inner Loop Header: Depth=1
	addvl	x10, x10, #1
	cmp	x10, x21
	b.lo	.LBB5_79
// %bb.80:
	mov	x10, xzr
	whilelo	p0.s, xzr, x21
	mov	z0.s, #0                        // =0x0
	.p2align	5
.LBB5_81:                               // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p0/z, [x19, x10, lsl #2]
	incw	x10
	whilelo	p0.s, x10, x21
	add	z0.s, z0.s, z1.s
	b.mi	.LBB5_81
// %bb.82:
	mov	x10, #70368744177664
	movk	x10, #16527, lsl #48
	ucvtf	d1, w25
	fmov	d8, x10
	uaddv	d0, p1, z0.s
	scvtf	d2, x24
	ucvtf	d3, w23
	fdiv	d1, d1, d8
	fmov	x21, d0
	scvtf	d0, x22
	fadd	d1, d1, d2
	fdiv	d2, d3, d8
	fadd	d0, d2, d0
	ucvtf	d2, w9
	fmov	d9, xzr
	fsub	d0, d1, d0
	scvtf	d1, x8
	fdiv	d2, d2, d8
	mov	x0, sp
	fadd	d10, d0, d9
	fadd	d11, d2, d1
	bl	ftime
	ldr	h1, [sp, #8]
	ldr	d0, [sp]
	mov	x0, x19
	ucvtf	d1, d1
	scvtf	d0, d0
	fdiv	d1, d1, d8
	fadd	d0, d1, d0
	fsub	d0, d0, d11
	fadd	d11, d0, d9
	bl	print_vector
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	bl	puts
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	mov	w1, w20
	bl	printf
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	puts
	adrp	x0, .L.str.6
	add	x0, x0, :lo12:.L.str.6
	mov	w1, w21
	bl	printf
	mov	x8, #225833675390976
	movk	x8, #16845, lsl #48
	mov	x9, #225833675390976
	movk	x9, #17197, lsl #48
	fmov	d0, x8
	adrp	x0, .Lstr
	fmul	d1, d10, d0
	fmov	d2, x9
	fmul	d0, d11, d0
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
	fmov	d12, #20.00000000
	adrp	x0, .L.str.10
	fdiv	d0, d10, d12
	add	x0, x0, :lo12:.L.str.10
	mov	v1.16b, v8.16b
	bl	printf
	adrp	x0, .L.str.11
	fdiv	d0, d11, d12
	add	x0, x0, :lo12:.L.str.11
	mov	v1.16b, v9.16b
	bl	printf
	adrp	x0, .L.str.12
	sub	w1, w21, w20
	add	x0, x0, :lo12:.L.str.12
	bl	printf
	mov	x0, x19
	bl	free
	ldp	x20, x19, [sp, #112]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             // 16-byte Folded Reload
	ldr	x25, [sp, #72]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #56]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #40]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #24]             // 16-byte Folded Reload
	ldr	d12, [sp, #16]                  // 8-byte Folded Reload
	mov	w0, wzr
	add	sp, sp, #128                    // =128
	ret
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str.1,@object                // @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"%d "
	.size	.L.str.1, 4

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
	.asciz	"SIMD: %d\n"
	.size	.L.str.4, 10

	.type	.L.str.5,@object                // @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.6,@object                // @.str.6
.L.str.6:
	.asciz	"Serial: %d\n"
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
	.asciz	"Correctness check: %d\n"
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
