	.text
	.file	"rose_matvec_double_sve.c"
	.globl	read_timer                      // -- Begin function read_timer
	.p2align	2
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
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               // -- Begin function init
.LCPI1_0:
	.xword	0x41a9999999666666              // double 214748364.69999999
	.text
	.globl	init
	.p2align	2
	.type	init,@function
init:                                   // @init
	.cfi_startproc
// %bb.0:
	str	d8, [sp, #-64]!                 // 8-byte Folded Spill
	stp	x29, x30, [sp, #8]              // 16-byte Folded Spill
	str	x23, [sp, #24]                  // 8-byte Folded Spill
	stp	x22, x21, [sp, #32]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 64
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w30, -48
	.cfi_offset w29, -56
	.cfi_offset b8, -64
	adrp	x8, .LCPI1_0
	ldr	d8, [x8, :lo12:.LCPI1_0]
	mov	x19, x1
	mov	x20, x0
	mov	x21, xzr
	mov	w22, #10240
.LBB1_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_2 Depth 2
	bl	rand
	scvtf	d0, w0
	mov	x23, xzr
	fdiv	d0, d0, d8
.LBB1_2:                                //   Parent Loop BB1_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	str	d0, [x20, x23]
	bl	rand
	scvtf	d0, w0
	add	x23, x23, #8                    // =8
	cmp	x23, #20, lsl #12               // =81920
	fdiv	d0, d0, d8
	b.ne	.LBB1_2
// %bb.3:                               //   in Loop: Header=BB1_1 Depth=1
	str	d0, [x19, x21, lsl #3]
	add	x21, x21, #1                    // =1
	cmp	x21, x22
	add	x20, x20, #20, lsl #12          // =81920
	b.ne	.LBB1_1
// %bb.4:
	ldp	x20, x19, [sp, #48]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             // 16-byte Folded Reload
	ldr	x23, [sp, #24]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #8]              // 16-byte Folded Reload
	ldr	d8, [sp], #64                   // 8-byte Folded Reload
	ret
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        // -- End function
	.globl	matvec_simd                     // -- Begin function matvec_simd
	.p2align	2
	.type	matvec_simd,@function
matvec_simd:                            // @matvec_simd
	.cfi_startproc
// %bb.0:
	mov	w9, #10239
	mov	x8, xzr
	cntd	x10
	whilelt	p0.d, wzr, w9
	mov	w11, #10240
.LBB2_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_2 Depth 2
	add	w14, w8, w8, lsl #2
	lsl	x14, x14, #43
	mov	x12, xzr
	mov	w13, wzr
	add	x14, x0, x14, asr #29
	fmov	d0, xzr
	mov	p1.b, p0.b
.LBB2_2:                                //   Parent Loop BB2_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x15, x14, x12
	add	x16, x1, x12
	ld1d	{ z1.d }, p1/z, [x15]
	ld1d	{ z2.d }, p1/z, [x16]
	addvl	x12, x12, #1
	fmul	z2.d, p1/m, z2.d, z1.d
	faddv	d1, p1, z2.d
	whilelt	p1.d, w13, w9
	add	w13, w13, w10
	fadd	d0, d0, d1
	cmp	w13, w11
	b.lt	.LBB2_2
// %bb.3:                               //   in Loop: Header=BB2_1 Depth=1
	str	d0, [x2, x8, lsl #3]
	add	x8, x8, #1                      // =1
	cmp	x8, x11
	b.ne	.LBB2_1
// %bb.4:
	ret
.Lfunc_end2:
	.size	matvec_simd, .Lfunc_end2-matvec_simd
	.cfi_endproc
                                        // -- End function
	.globl	matvec_serial                   // -- Begin function matvec_serial
	.p2align	2
	.type	matvec_serial,@function
matvec_serial:                          // @matvec_serial
	.cfi_startproc
// %bb.0:
	mov	x8, xzr
	mov	w9, #10240
.LBB3_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB3_2 Depth 2
	mov	x10, xzr
	whilelo	p0.d, xzr, x9
	fmov	d0, xzr
.LBB3_2:                                //   Parent Loop BB3_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1d	{ z1.d }, p0/z, [x0, x10, lsl #3]
	ld1d	{ z2.d }, p0/z, [x1, x10, lsl #3]
	incd	x10
	fmul	z1.d, z1.d, z2.d
	fadda	d0, p0, d0, z1.d
	whilelo	p0.d, x10, x9
	b.mi	.LBB3_2
// %bb.3:                               //   in Loop: Header=BB3_1 Depth=1
	str	d0, [x2, x8, lsl #3]
	add	x8, x8, #1                      // =1
	cmp	x8, x9
	add	x0, x0, #20, lsl #12            // =81920
	b.ne	.LBB3_1
// %bb.4:
	ret
.Lfunc_end3:
	.size	matvec_serial, .Lfunc_end3-matvec_serial
	.cfi_endproc
                                        // -- End function
	.globl	print_matrix                    // -- Begin function print_matrix
	.p2align	2
	.type	print_matrix,@function
print_matrix:                           // @print_matrix
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-64]!           // 16-byte Folded Spill
	str	x23, [sp, #16]                  // 8-byte Folded Spill
	stp	x22, x21, [sp, #32]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 64
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -48
	.cfi_offset w30, -56
	.cfi_offset w29, -64
	adrp	x19, .L.str.1
	adrp	x20, .L.str.2
	mov	x21, xzr
	add	x22, x0, #32                    // =32
	add	x19, x19, :lo12:.L.str.1
	add	x20, x20, :lo12:.L.str.2
.LBB4_1:                                // =>This Inner Loop Header: Depth=1
	mov	w0, #91
	bl	putchar
	add	x23, x22, x21
	ldur	d0, [x23, #-32]
	mov	x0, x19
	bl	printf
	ldur	d0, [x23, #-24]
	mov	x0, x19
	bl	printf
	ldur	d0, [x23, #-16]
	mov	x0, x19
	bl	printf
	ldur	d0, [x23, #-8]
	mov	x0, x19
	bl	printf
	ldr	d0, [x23]
	mov	x0, x19
	bl	printf
	ldr	d0, [x23, #8]
	mov	x0, x19
	bl	printf
	ldr	d0, [x23, #16]
	mov	x0, x19
	bl	printf
	ldr	d0, [x23, #24]
	mov	x0, x19
	bl	printf
	mov	x0, x20
	bl	puts
	add	x21, x21, #20, lsl #12          // =81920
	cmp	x21, #160, lsl #12              // =655360
	b.ne	.LBB4_1
// %bb.2:
	ldp	x20, x19, [sp, #48]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             // 16-byte Folded Reload
	ldr	x23, [sp, #16]                  // 8-byte Folded Reload
	mov	w0, #10
	ldp	x29, x30, [sp], #64             // 16-byte Folded Reload
	b	putchar
.Lfunc_end4:
	.size	print_matrix, .Lfunc_end4-print_matrix
	.cfi_endproc
                                        // -- End function
	.globl	print_vector                    // -- Begin function print_vector
	.p2align	2
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
	ldr	d0, [x19]
	adrp	x20, .L.str.1
	add	x20, x20, :lo12:.L.str.1
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #8]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #16]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #24]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #32]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #40]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #48]
	mov	x0, x20
	bl	printf
	ldr	d0, [x19, #56]
	mov	x0, x20
	bl	printf
	ldp	x20, x19, [sp, #16]             // 16-byte Folded Reload
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	b	puts
.Lfunc_end5:
	.size	print_vector, .Lfunc_end5-print_vector
	.cfi_endproc
                                        // -- End function
	.globl	check                           // -- Begin function check
	.p2align	2
	.type	check,@function
check:                                  // @check
	.cfi_startproc
// %bb.0:
	mov	w9, #10240
	mov	x8, xzr
	fmov	d0, xzr
	whilelo	p1.d, xzr, x9
	ptrue	p0.d
.LBB6_1:                                // =>This Inner Loop Header: Depth=1
	ld1d	{ z1.d }, p1/z, [x0, x8, lsl #3]
	ld1d	{ z2.d }, p1/z, [x1, x8, lsl #3]
	incd	x8
	fsub	z1.d, z1.d, z2.d
	fcvt	z1.s, p0/m, z1.d
	fabs	z1.s, p0/m, z1.s
	fcvt	z1.d, p0/m, z1.s
	fadda	d0, p1, d0, z1.d
	whilelo	p1.d, x8, x9
	b.mi	.LBB6_1
// %bb.2:
                                        // kill: def $d0 killed $d0 killed $z0
	ret
.Lfunc_end6:
	.size	check, .Lfunc_end6-check
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               // -- Begin function main
.LCPI7_0:
	.xword	0x41a9999999666666              // double 214748364.69999999
	.text
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	str	d12, [sp, #-144]!               // 8-byte Folded Spill
	stp	d11, d10, [sp, #16]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	stp	x28, x27, [sp, #64]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            // 16-byte Folded Spill
	mov	x29, sp
	addvl	sp, sp, #-1
	sub	sp, sp, #16                     // =16
	.cfi_def_cfa w29, 144
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -144
	mov	w0, #16384
	mov	w23, #16384
	movk	w0, #1, lsl #16
	movk	w23, #1, lsl #16
	bl	malloc
	mov	x19, x0
	mov	w0, #16384
	movk	w0, #1, lsl #16
	bl	malloc
	mov	x20, x0
	mov	w0, #838860800
	bl	malloc
	mov	x21, x0
	mov	w0, #16384
	movk	w0, #1, lsl #16
	bl	malloc
	mov	x22, x0
	mov	x0, xzr
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	adrp	x8, .LCPI7_0
	ldr	d8, [x8, :lo12:.LCPI7_0]
	mov	x24, xzr
	mov	w25, #10240
	mov	x26, x21
.LBB7_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_2 Depth 2
	bl	rand
	scvtf	d0, w0
	mov	x27, xzr
	fdiv	d0, d0, d8
.LBB7_2:                                //   Parent Loop BB7_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	str	d0, [x26, x27]
	bl	rand
	scvtf	d0, w0
	add	x27, x27, #8                    // =8
	cmp	x27, x23
	fdiv	d0, d0, d8
	b.ne	.LBB7_2
// %bb.3:                               //   in Loop: Header=BB7_1 Depth=1
	str	d0, [x22, x24, lsl #3]
	add	x24, x24, #1                    // =1
	cmp	x24, x25
	add	x26, x26, #20, lsl #12          // =81920
	b.ne	.LBB7_1
// %bb.4:
	mov	w9, #10239
	mov	x8, xzr
	cntd	x23
	whilelt	p1.d, wzr, w9
	mov	w10, #10240
.LBB7_5:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_6 Depth 2
	add	w13, w8, w8, lsl #2
	lsl	x13, x13, #43
	mov	x11, xzr
	mov	w12, wzr
	add	x13, x21, x13, asr #29
	fmov	d0, xzr
	mov	p0.b, p1.b
.LBB7_6:                                //   Parent Loop BB7_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x14, x13, x11
	add	x15, x22, x11
	ld1d	{ z1.d }, p0/z, [x14]
	ld1d	{ z2.d }, p0/z, [x15]
	addvl	x11, x11, #1
	fmul	z2.d, p0/m, z2.d, z1.d
	faddv	d1, p0, z2.d
	whilelt	p0.d, w12, w9
	add	w12, w12, w23
	fadd	d0, d0, d1
	cmp	w12, w10
	b.lt	.LBB7_6
// %bb.7:                               //   in Loop: Header=BB7_5 Depth=1
	str	d0, [x19, x8, lsl #3]
	add	x8, x8, #1                      // =1
	cmp	x8, x10
	b.ne	.LBB7_5
// %bb.8:
	mov	x0, sp
	str	p1, [x29, #-1, mul vl]          // 2-byte Folded Spill
	bl	ftime
	ldr	h0, [sp, #8]
	ldr	p1, [x29, #-1, mul vl]          // 2-byte Folded Reload
	ldr	x9, [sp]
	mov	x11, #70368744177664
	movk	x11, #16527, lsl #48
	fmov	d1, x11
	ucvtf	d0, d0
	mov	w8, wzr
	mov	w10, #10239
	fdiv	d0, d0, d1
	mov	w11, #10240
.LBB7_9:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_10 Depth 2
                                        //       Child Loop BB7_11 Depth 3
	mov	x12, xzr
.LBB7_10:                               //   Parent Loop BB7_9 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB7_11 Depth 3
	add	w15, w12, w12, lsl #2
	lsl	x15, x15, #43
	mov	x13, xzr
	mov	w14, wzr
	add	x15, x21, x15, asr #29
	fmov	d1, xzr
	mov	p0.b, p1.b
.LBB7_11:                               //   Parent Loop BB7_9 Depth=1
                                        //     Parent Loop BB7_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x16, x15, x13
	add	x17, x22, x13
	ld1d	{ z2.d }, p0/z, [x16]
	ld1d	{ z3.d }, p0/z, [x17]
	addvl	x13, x13, #1
	fmul	z3.d, p0/m, z3.d, z2.d
	faddv	d2, p0, z3.d
	whilelt	p0.d, w14, w10
	add	w14, w14, w23
	fadd	d1, d1, d2
	cmp	w14, w11
	b.lt	.LBB7_11
// %bb.12:                              //   in Loop: Header=BB7_10 Depth=2
	str	d1, [x19, x12, lsl #3]
	add	x12, x12, #1                    // =1
	cmp	x12, x11
	b.ne	.LBB7_10
// %bb.13:                              //   in Loop: Header=BB7_9 Depth=1
	add	w8, w8, #1                      // =1
	cmp	w8, #20                         // =20
	b.ne	.LBB7_9
// %bb.14:
	scvtf	d1, x9
	mov	x0, sp
	fadd	d8, d0, d1
	bl	ftime
	ldr	h1, [sp, #8]
	ldr	d0, [sp]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	ucvtf	d1, d1
	fmov	d9, x8
	scvtf	d0, d0
	fdiv	d1, d1, d9
	fadd	d0, d1, d0
	mov	x0, sp
	fsub	d8, d0, d8
	bl	ftime
	ldr	h0, [sp, #8]
	ldr	x8, [sp]
	mov	w9, wzr
	mov	w10, #10240
	ucvtf	d0, d0
	fdiv	d0, d0, d9
.LBB7_15:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_16 Depth 2
                                        //       Child Loop BB7_17 Depth 3
	mov	x11, xzr
	mov	x12, x21
.LBB7_16:                               //   Parent Loop BB7_15 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB7_17 Depth 3
	mov	x13, xzr
	whilelo	p0.d, xzr, x10
	fmov	d1, xzr
.LBB7_17:                               //   Parent Loop BB7_15 Depth=1
                                        //     Parent Loop BB7_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1d	{ z2.d }, p0/z, [x12, x13, lsl #3]
	ld1d	{ z3.d }, p0/z, [x22, x13, lsl #3]
	incd	x13
	fmul	z2.d, z2.d, z3.d
	fadda	d1, p0, d1, z2.d
	whilelo	p0.d, x13, x10
	b.mi	.LBB7_17
// %bb.18:                              //   in Loop: Header=BB7_16 Depth=2
	str	d1, [x20, x11, lsl #3]
	add	x11, x11, #1                    // =1
	cmp	x11, x10
	add	x12, x12, #20, lsl #12          // =81920
	b.ne	.LBB7_16
// %bb.19:                              //   in Loop: Header=BB7_15 Depth=1
	add	w9, w9, #1                      // =1
	cmp	w9, #20                         // =20
	b.ne	.LBB7_15
// %bb.20:
	fmov	d2, xzr
	scvtf	d1, x8
	mov	x0, sp
	fadd	d10, d8, d2
	fadd	d8, d0, d1
	bl	ftime
	ldr	h1, [sp, #8]
	ldr	d0, [sp]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	ucvtf	d1, d1
	fmov	d2, x8
	scvtf	d0, d0
	fdiv	d1, d1, d2
	fadd	d0, d1, d0
	fsub	d0, d0, d8
	fmov	d1, xzr
	mov	x0, x21
	fadd	d11, d0, d1
	bl	print_matrix
	mov	x0, x22
	bl	print_vector
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	puts
	mov	x0, x19
	bl	print_vector
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	puts
	mov	x0, x20
	bl	print_vector
	mov	x8, #225833675390976
	movk	x8, #16845, lsl #48
	mov	x9, #70368744177664
	movk	x9, #16879, lsl #48
	fmov	d0, x8
	adrp	x0, .Lstr
	fmul	d1, d10, d0
	fmov	d2, x9
	fmul	d0, d11, d0
	add	x0, x0, :lo12:.Lstr
	fdiv	d8, d2, d1
	fdiv	d9, d2, d0
	bl	puts
	adrp	x0, .Lstr.12
	add	x0, x0, :lo12:.Lstr.12
	bl	puts
	adrp	x0, .Lstr.13
	add	x0, x0, :lo12:.Lstr.13
	bl	puts
	fmov	d12, #20.00000000
	adrp	x0, .L.str.9
	fdiv	d0, d10, d12
	add	x0, x0, :lo12:.L.str.9
	mov	v1.16b, v8.16b
	bl	printf
	adrp	x0, .L.str.10
	fdiv	d0, d11, d12
	add	x0, x0, :lo12:.L.str.10
	mov	v1.16b, v9.16b
	bl	printf
	mov	w9, #10240
	fmov	d0, xzr
	ptrue	p1.d
	mov	x8, xzr
	whilelo	p0.d, xzr, x9
.LBB7_21:                               // =>This Inner Loop Header: Depth=1
	ld1d	{ z2.d }, p0/z, [x19, x8, lsl #3]
	ld1d	{ z1.d }, p0/z, [x20, x8, lsl #3]
	incd	x8
	fsub	z1.d, z2.d, z1.d
	fcvt	z1.s, p1/m, z1.d
	fabs	z1.s, p1/m, z1.s
	fcvt	z1.d, p1/m, z1.s
	fadda	d0, p0, d0, z1.d
	whilelo	p0.d, x8, x9
	b.mi	.LBB7_21
// %bb.22:
	adrp	x0, .L.str.11
	add	x0, x0, :lo12:.L.str.11
                                        // kill: def $d0 killed $d0 killed $z0
	bl	printf
	mov	x0, x19
	bl	free
	mov	x0, x20
	bl	free
	mov	x0, x21
	bl	free
	mov	x0, x22
	bl	free
	mov	w0, wzr
	addvl	sp, sp, #1
	add	sp, sp, #16                     // =16
	ldp	x20, x19, [sp, #128]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             // 16-byte Folded Reload
	ldr	d12, [sp], #144                 // 8-byte Folded Reload
	ret
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
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

	.type	.L.str.4,@object                // @.str.4
.L.str.4:
	.asciz	"=\n"
	.size	.L.str.4, 3

	.type	.L.str.5,@object                // @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.9,@object                // @.str.9
.L.str.9:
	.asciz	"Matrix-vector (SIMD):\t\t%4f\t%4f\n"
	.size	.L.str.9, 32

	.type	.L.str.10,@object               // @.str.10
.L.str.10:
	.asciz	"Matrix-vector (Serial):\t\t%4f\t%4f\n"
	.size	.L.str.10, 34

	.type	.L.str.11,@object               // @.str.11
.L.str.11:
	.asciz	"Correctness check: %f\n"
	.size	.L.str.11, 23

	.type	.Lstr,@object                   // @str
.Lstr:
	.asciz	"=================================================================="
	.size	.Lstr, 67

	.type	.Lstr.12,@object                // @str.12
.Lstr.12:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.12, 35

	.type	.Lstr.13,@object                // @str.13
.Lstr.13:
	.asciz	"------------------------------------------------------------------"
	.size	.Lstr.13, 67

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
