	.text
	.file	"rose_matmul_float_sve.c"
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
	.globl	init                            // -- Begin function init
	.p2align	2
	.type	init,@function
init:                                   // @init
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-48]!           // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	mov	w21, #52429
	mov	x19, x0
	mov	x20, xzr
	movk	w21, #19788, lsl #16
.LBB1_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_2 Depth 2
	mov	x22, xzr
.LBB1_2:                                //   Parent Loop BB1_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	bl	rand
	ldr	x8, [x19, x20, lsl #3]
	scvtf	s0, w0
	fmov	s1, w21
	fdiv	s0, s0, s1
	str	s0, [x8, x22]
	add	x22, x22, #4                    // =4
	cmp	x22, #1, lsl #12                // =4096
	b.ne	.LBB1_2
// %bb.3:                               //   in Loop: Header=BB1_1 Depth=1
	add	x20, x20, #1                    // =1
	cmp	x20, #1024                      // =1024
	b.ne	.LBB1_1
// %bb.4:
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        // -- End function
	.globl	matmul_simd                     // -- Begin function matmul_simd
	.p2align	2
	.type	matmul_simd,@function
matmul_simd:                            // @matmul_simd
	.cfi_startproc
// %bb.0:
	mov	w9, #1023
	mov	x8, xzr
	whilelt	p0.s, wzr, w9
	cntw	x10
.LBB2_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_2 Depth 2
                                        //       Child Loop BB2_3 Depth 3
	lsl	x12, x8, #3
	ldr	x11, [x0, x12]
	ldr	x12, [x2, x12]
	mov	x13, xzr
.LBB2_2:                                //   Parent Loop BB2_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB2_3 Depth 3
	ldr	x16, [x1, x13, lsl #3]
	mov	x14, xzr
	mov	w15, wzr
	fmov	s0, wzr
	mov	p1.b, p0.b
.LBB2_3:                                //   Parent Loop BB2_1 Depth=1
                                        //     Parent Loop BB2_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x17, x11, x14
	add	x18, x16, x14
	ld1w	{ z1.s }, p1/z, [x17]
	ld1w	{ z2.s }, p1/z, [x18]
	addvl	x14, x14, #1
	fmul	z2.s, p1/m, z2.s, z1.s
	faddv	s1, p1, z2.s
	whilelt	p1.s, w15, w9
	add	w15, w15, w10
	fadd	s0, s0, s1
	cmp	w15, #1024                      // =1024
	b.lt	.LBB2_3
// %bb.4:                               //   in Loop: Header=BB2_2 Depth=2
	str	s0, [x12, x13, lsl #2]
	add	x13, x13, #1                    // =1
	cmp	x13, #1024                      // =1024
	b.ne	.LBB2_2
// %bb.5:                               //   in Loop: Header=BB2_1 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB2_1
// %bb.6:
	ret
.Lfunc_end2:
	.size	matmul_simd, .Lfunc_end2-matmul_simd
	.cfi_endproc
                                        // -- End function
	.globl	print_matrix                    // -- Begin function print_matrix
	.p2align	2
	.type	print_matrix,@function
print_matrix:                           // @print_matrix
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-48]!           // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	adrp	x20, .L.str.1
	adrp	x21, .L.str.2
	mov	x19, x0
	mov	x22, xzr
	add	x20, x20, :lo12:.L.str.1
	add	x21, x21, :lo12:.L.str.2
.LBB3_1:                                // =>This Inner Loop Header: Depth=1
	mov	w0, #91
	bl	putchar
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	s0, [x8]
	fcvt	d0, s0
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	s0, [x8, #4]
	fcvt	d0, s0
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	s0, [x8, #8]
	fcvt	d0, s0
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	s0, [x8, #12]
	fcvt	d0, s0
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	s0, [x8, #16]
	fcvt	d0, s0
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	s0, [x8, #20]
	fcvt	d0, s0
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	s0, [x8, #24]
	fcvt	d0, s0
	bl	printf
	ldr	x8, [x19, x22]
	mov	x0, x20
	ldr	s0, [x8, #28]
	fcvt	d0, s0
	bl	printf
	mov	x0, x21
	bl	puts
	add	x22, x22, #8                    // =8
	cmp	x22, #64                        // =64
	b.ne	.LBB3_1
// %bb.2:
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	mov	w0, #10
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
	b	putchar
.Lfunc_end3:
	.size	print_matrix, .Lfunc_end3-print_matrix
	.cfi_endproc
                                        // -- End function
	.globl	matmul_serial                   // -- Begin function matmul_serial
	.p2align	2
	.type	matmul_serial,@function
matmul_serial:                          // @matmul_serial
	.cfi_startproc
// %bb.0:
	mov	x8, xzr
	mov	w9, #1024
.LBB4_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB4_2 Depth 2
                                        //       Child Loop BB4_3 Depth 3
	lsl	x11, x8, #3
	ldr	x10, [x0, x11]
	ldr	x11, [x2, x11]
	mov	x12, xzr
.LBB4_2:                                //   Parent Loop BB4_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB4_3 Depth 3
	ldr	x14, [x1, x12, lsl #3]
	mov	x13, xzr
	whilelo	p0.s, xzr, x9
	fmov	s0, wzr
.LBB4_3:                                //   Parent Loop BB4_1 Depth=1
                                        //     Parent Loop BB4_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1w	{ z1.s }, p0/z, [x10, x13, lsl #2]
	ld1w	{ z2.s }, p0/z, [x14, x13, lsl #2]
	incw	x13
	fmul	z1.s, z1.s, z2.s
	fadda	s0, p0, s0, z1.s
	whilelo	p0.s, x13, x9
	b.mi	.LBB4_3
// %bb.4:                               //   in Loop: Header=BB4_2 Depth=2
	str	s0, [x11, x12, lsl #2]
	add	x12, x12, #1                    // =1
	cmp	x12, #1024                      // =1024
	b.ne	.LBB4_2
// %bb.5:                               //   in Loop: Header=BB4_1 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB4_1
// %bb.6:
	ret
.Lfunc_end4:
	.size	matmul_serial, .Lfunc_end4-matmul_serial
	.cfi_endproc
                                        // -- End function
	.globl	check                           // -- Begin function check
	.p2align	2
	.type	check,@function
check:                                  // @check
	.cfi_startproc
// %bb.0:
	mov	x8, xzr
	fmov	s0, wzr
	mov	w9, #1024
.LBB5_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB5_2 Depth 2
	lsl	x12, x8, #3
	ldr	x11, [x0, x12]
	ldr	x12, [x1, x12]
	mov	x10, xzr
	whilelo	p0.s, xzr, x9
.LBB5_2:                                //   Parent Loop BB5_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z1.s }, p0/z, [x11, x10, lsl #2]
	ld1w	{ z2.s }, p0/z, [x12, x10, lsl #2]
	incw	x10
	fsub	z1.s, z1.s, z2.s
	fadda	s0, p0, s0, z1.s
	whilelo	p0.s, x10, x9
	b.mi	.LBB5_2
// %bb.3:                               //   in Loop: Header=BB5_1 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB5_1
// %bb.4:
                                        // kill: def $s0 killed $s0 killed $z0
	ret
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	str	d12, [sp, #-128]!               // 8-byte Folded Spill
	stp	d11, d10, [sp, #8]              // 16-byte Folded Spill
	stp	d9, d8, [sp, #24]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #40]             // 16-byte Folded Spill
	str	x28, [sp, #56]                  // 8-byte Folded Spill
	stp	x26, x25, [sp, #64]             // 16-byte Folded Spill
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
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w28, -72
	.cfi_offset w30, -80
	.cfi_offset w29, -88
	.cfi_offset b8, -96
	.cfi_offset b9, -104
	.cfi_offset b10, -112
	.cfi_offset b11, -120
	.cfi_offset b12, -128
	mov	w0, #8192
	bl	malloc
	mov	x21, x0
	mov	w0, #8192
	bl	malloc
	mov	x23, x0
	mov	w0, #8192
	bl	malloc
	mov	x19, x0
	mov	w0, #8192
	bl	malloc
	mov	x20, x0
	mov	w0, #8192
	bl	malloc
	mov	x22, x0
	mov	x24, xzr
.LBB6_1:                                // =>This Inner Loop Header: Depth=1
	mov	w0, #4096
	bl	malloc
	str	x0, [x21, x24]
	mov	w0, #4096
	bl	malloc
	str	x0, [x23, x24]
	mov	w0, #4096
	bl	malloc
	str	x0, [x19, x24]
	mov	w0, #4096
	bl	malloc
	str	x0, [x20, x24]
	mov	w0, #4096
	bl	malloc
	str	x0, [x22, x24]
	add	x24, x24, #8                    // =8
	cmp	x24, #2, lsl #12                // =8192
	b.ne	.LBB6_1
// %bb.2:
	mov	x0, xzr
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	mov	w25, #52429
	mov	x24, xzr
	movk	w25, #19788, lsl #16
.LBB6_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_4 Depth 2
	mov	x26, xzr
.LBB6_4:                                //   Parent Loop BB6_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	bl	rand
	ldr	x8, [x21, x24, lsl #3]
	scvtf	s0, w0
	fmov	s1, w25
	fdiv	s0, s0, s1
	str	s0, [x8, x26]
	add	x26, x26, #4                    // =4
	cmp	x26, #1, lsl #12                // =4096
	b.ne	.LBB6_4
// %bb.5:                               //   in Loop: Header=BB6_3 Depth=1
	add	x24, x24, #1                    // =1
	cmp	x24, #1024                      // =1024
	b.ne	.LBB6_3
// %bb.6:
	mov	w25, #52429
	mov	x24, xzr
	movk	w25, #19788, lsl #16
.LBB6_7:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_8 Depth 2
	mov	x26, xzr
.LBB6_8:                                //   Parent Loop BB6_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	bl	rand
	ldr	x8, [x23, x24, lsl #3]
	scvtf	s0, w0
	fmov	s1, w25
	fdiv	s0, s0, s1
	str	s0, [x8, x26]
	add	x26, x26, #4                    // =4
	cmp	x26, #1, lsl #12                // =4096
	b.ne	.LBB6_8
// %bb.9:                               //   in Loop: Header=BB6_7 Depth=1
	add	x24, x24, #1                    // =1
	cmp	x24, #1024                      // =1024
	b.ne	.LBB6_7
// %bb.10:
	mov	x8, xzr
.LBB6_11:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_12 Depth 2
	ldr	x9, [x22, x8, lsl #3]
	mov	x10, xzr
.LBB6_12:                               //   Parent Loop BB6_11 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x11, [x23, x10, lsl #3]
	ldr	w11, [x11, x8, lsl #2]
	str	w11, [x9, x10, lsl #2]
	add	x10, x10, #1                    // =1
	cmp	x10, #1024                      // =1024
	b.ne	.LBB6_12
// %bb.13:                              //   in Loop: Header=BB6_11 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB6_11
// %bb.14:
	mov	w9, #1023
	mov	x8, xzr
	whilelt	p1.s, wzr, w9
	cntw	x23
.LBB6_15:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_16 Depth 2
                                        //       Child Loop BB6_17 Depth 3
	lsl	x11, x8, #3
	ldr	x10, [x21, x11]
	ldr	x11, [x19, x11]
	mov	x12, xzr
.LBB6_16:                               //   Parent Loop BB6_15 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB6_17 Depth 3
	ldr	x15, [x22, x12, lsl #3]
	mov	x13, xzr
	mov	w14, wzr
	fmov	s0, wzr
	mov	p0.b, p1.b
.LBB6_17:                               //   Parent Loop BB6_15 Depth=1
                                        //     Parent Loop BB6_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x16, x10, x13
	add	x17, x15, x13
	ld1w	{ z1.s }, p0/z, [x16]
	ld1w	{ z2.s }, p0/z, [x17]
	addvl	x13, x13, #1
	fmul	z2.s, p0/m, z2.s, z1.s
	faddv	s1, p0, z2.s
	whilelt	p0.s, w14, w9
	add	w14, w14, w23
	fadd	s0, s0, s1
	cmp	w14, #1024                      // =1024
	b.lt	.LBB6_17
// %bb.18:                              //   in Loop: Header=BB6_16 Depth=2
	str	s0, [x11, x12, lsl #2]
	add	x12, x12, #1                    // =1
	cmp	x12, #1024                      // =1024
	b.ne	.LBB6_16
// %bb.19:                              //   in Loop: Header=BB6_15 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB6_15
// %bb.20:
	mov	x8, xzr
	mov	w9, #1024
.LBB6_21:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_22 Depth 2
                                        //       Child Loop BB6_23 Depth 3
	lsl	x11, x8, #3
	ldr	x10, [x21, x11]
	ldr	x11, [x20, x11]
	mov	x12, xzr
.LBB6_22:                               //   Parent Loop BB6_21 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB6_23 Depth 3
	ldr	x14, [x22, x12, lsl #3]
	mov	x13, xzr
	whilelo	p0.s, xzr, x9
	fmov	s0, wzr
.LBB6_23:                               //   Parent Loop BB6_21 Depth=1
                                        //     Parent Loop BB6_22 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1w	{ z1.s }, p0/z, [x10, x13, lsl #2]
	ld1w	{ z2.s }, p0/z, [x14, x13, lsl #2]
	incw	x13
	fmul	z1.s, z1.s, z2.s
	fadda	s0, p0, s0, z1.s
	whilelo	p0.s, x13, x9
	b.mi	.LBB6_23
// %bb.24:                              //   in Loop: Header=BB6_22 Depth=2
	str	s0, [x11, x12, lsl #2]
	add	x12, x12, #1                    // =1
	cmp	x12, #1024                      // =1024
	b.ne	.LBB6_22
// %bb.25:                              //   in Loop: Header=BB6_21 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB6_21
// %bb.26:
	mov	x0, sp
	str	p1, [x29, #-1, mul vl]          // 2-byte Folded Spill
	bl	ftime
	ldr	h0, [sp, #8]
	ldr	p1, [x29, #-1, mul vl]          // 2-byte Folded Reload
	mov	x10, #70368744177664
	ldr	x9, [sp]
	movk	x10, #16527, lsl #48
	fmov	d1, x10
	ucvtf	d0, d0
	mov	w8, wzr
	fdiv	d0, d0, d1
	mov	w10, #1023
.LBB6_27:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_28 Depth 2
                                        //       Child Loop BB6_29 Depth 3
                                        //         Child Loop BB6_30 Depth 4
	mov	x11, xzr
.LBB6_28:                               //   Parent Loop BB6_27 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB6_29 Depth 3
                                        //         Child Loop BB6_30 Depth 4
	lsl	x13, x11, #3
	ldr	x12, [x21, x13]
	ldr	x13, [x19, x13]
	mov	x14, xzr
.LBB6_29:                               //   Parent Loop BB6_27 Depth=1
                                        //     Parent Loop BB6_28 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB6_30 Depth 4
	ldr	x17, [x22, x14, lsl #3]
	mov	x15, xzr
	mov	w16, wzr
	fmov	s1, wzr
	mov	p0.b, p1.b
.LBB6_30:                               //   Parent Loop BB6_27 Depth=1
                                        //     Parent Loop BB6_28 Depth=2
                                        //       Parent Loop BB6_29 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x18, x12, x15
	add	x0, x17, x15
	ld1w	{ z2.s }, p0/z, [x18]
	ld1w	{ z3.s }, p0/z, [x0]
	addvl	x15, x15, #1
	fmul	z3.s, p0/m, z3.s, z2.s
	faddv	s2, p0, z3.s
	whilelt	p0.s, w16, w10
	add	w16, w16, w23
	fadd	s1, s1, s2
	cmp	w16, #1024                      // =1024
	b.lt	.LBB6_30
// %bb.31:                              //   in Loop: Header=BB6_29 Depth=3
	str	s1, [x13, x14, lsl #2]
	add	x14, x14, #1                    // =1
	cmp	x14, #1024                      // =1024
	b.ne	.LBB6_29
// %bb.32:                              //   in Loop: Header=BB6_28 Depth=2
	add	x11, x11, #1                    // =1
	cmp	x11, #1024                      // =1024
	b.ne	.LBB6_28
// %bb.33:                              //   in Loop: Header=BB6_27 Depth=1
	add	w8, w8, #1                      // =1
	cmp	w8, #20                         // =20
	b.ne	.LBB6_27
// %bb.34:
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
	mov	w10, #1024
	ucvtf	d0, d0
	fdiv	d0, d0, d9
.LBB6_35:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_36 Depth 2
                                        //       Child Loop BB6_37 Depth 3
                                        //         Child Loop BB6_38 Depth 4
	mov	x11, xzr
.LBB6_36:                               //   Parent Loop BB6_35 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB6_37 Depth 3
                                        //         Child Loop BB6_38 Depth 4
	lsl	x13, x11, #3
	ldr	x12, [x21, x13]
	ldr	x13, [x20, x13]
	mov	x14, xzr
.LBB6_37:                               //   Parent Loop BB6_35 Depth=1
                                        //     Parent Loop BB6_36 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB6_38 Depth 4
	ldr	x16, [x22, x14, lsl #3]
	mov	x15, xzr
	whilelo	p0.s, xzr, x10
	fmov	s1, wzr
.LBB6_38:                               //   Parent Loop BB6_35 Depth=1
                                        //     Parent Loop BB6_36 Depth=2
                                        //       Parent Loop BB6_37 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ld1w	{ z2.s }, p0/z, [x12, x15, lsl #2]
	ld1w	{ z3.s }, p0/z, [x16, x15, lsl #2]
	incw	x15
	fmul	z2.s, z2.s, z3.s
	fadda	s1, p0, s1, z2.s
	whilelo	p0.s, x15, x10
	b.mi	.LBB6_38
// %bb.39:                              //   in Loop: Header=BB6_37 Depth=3
	str	s1, [x13, x14, lsl #2]
	add	x14, x14, #1                    // =1
	cmp	x14, #1024                      // =1024
	b.ne	.LBB6_37
// %bb.40:                              //   in Loop: Header=BB6_36 Depth=2
	add	x11, x11, #1                    // =1
	cmp	x11, #1024                      // =1024
	b.ne	.LBB6_36
// %bb.41:                              //   in Loop: Header=BB6_35 Depth=1
	add	w9, w9, #1                      // =1
	cmp	w9, #20                         // =20
	b.ne	.LBB6_35
// %bb.42:
	fmov	d9, xzr
	scvtf	d1, x8
	mov	x0, sp
	fadd	d10, d8, d9
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
	mov	x0, x21
	fadd	d11, d0, d9
	bl	print_matrix
	mov	x0, x22
	bl	print_matrix
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	puts
	mov	x0, x19
	bl	print_matrix
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	puts
	mov	x0, x20
	bl	print_matrix
	mov	x8, #225833675390976
	movk	x8, #16845, lsl #48
	mov	x9, #4765934305664827392
	fmov	d0, x8
	adrp	x0, .Lstr
	fmul	d1, d10, d0
	fmov	d2, x9
	fmul	d0, d11, d0
	add	x0, x0, :lo12:.Lstr
	fdiv	d8, d2, d1
	fdiv	d9, d2, d0
	bl	puts
	adrp	x0, .L.str.7
	add	x0, x0, :lo12:.L.str.7
	mov	w1, #1024
	mov	w22, #1024
	bl	printf
	adrp	x21, .Lstr.15
	add	x21, x21, :lo12:.Lstr.15
	mov	x0, x21
	bl	puts
	adrp	x0, .Lstr.14
	add	x0, x0, :lo12:.Lstr.14
	bl	puts
	mov	x0, x21
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
	mov	x8, xzr
	fmov	s0, wzr
.LBB6_43:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_44 Depth 2
	lsl	x11, x8, #3
	ldr	x10, [x19, x11]
	ldr	x11, [x20, x11]
	mov	x9, xzr
	whilelo	p0.s, xzr, x22
.LBB6_44:                               //   Parent Loop BB6_43 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z1.s }, p0/z, [x10, x9, lsl #2]
	ld1w	{ z2.s }, p0/z, [x11, x9, lsl #2]
	incw	x9
	fsub	z1.s, z1.s, z2.s
	fadda	s0, p0, s0, z1.s
	whilelo	p0.s, x9, x22
	b.mi	.LBB6_44
// %bb.45:                              //   in Loop: Header=BB6_43 Depth=1
	add	x8, x8, #1                      // =1
	cmp	x8, #1024                       // =1024
	b.ne	.LBB6_43
// %bb.46:
	adrp	x0, .L.str.12
	fcvt	d0, s0
	add	x0, x0, :lo12:.L.str.12
	bl	printf
	mov	w0, wzr
	addvl	sp, sp, #1
	add	sp, sp, #16                     // =16
	ldp	x20, x19, [sp, #112]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]             // 16-byte Folded Reload
	ldr	x28, [sp, #56]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #40]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #24]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #8]              // 16-byte Folded Reload
	ldr	d12, [sp], #128                 // 8-byte Folded Reload
	ret
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
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

	.type	.L.str.7,@object                // @.str.7
.L.str.7:
	.asciz	"\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n"
	.size	.L.str.7, 59

	.type	.L.str.10,@object               // @.str.10
.L.str.10:
	.asciz	"matmul_omp:\t\t%4f\t%4f\n"
	.size	.L.str.10, 22

	.type	.L.str.11,@object               // @.str.11
.L.str.11:
	.asciz	"matmul_serial:\t\t%4f\t%4f\n"
	.size	.L.str.11, 25

	.type	.L.str.12,@object               // @.str.12
.L.str.12:
	.asciz	"Correctness check: %f\n"
	.size	.L.str.12, 23

	.type	.Lstr,@object                   // @str
.Lstr:
	.asciz	"======================================================================================================"
	.size	.Lstr, 103

	.type	.Lstr.14,@object                // @str.14
.Lstr.14:
	.asciz	"Performance:\t\tRuntime (s)\t GFLOPS"
	.size	.Lstr.14, 34

	.type	.Lstr.15,@object                // @str.15
.Lstr.15:
	.asciz	"------------------------------------------------------------------------------------------------------"
	.size	.Lstr.15, 103

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
