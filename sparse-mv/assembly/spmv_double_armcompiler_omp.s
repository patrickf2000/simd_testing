	.text
	.file	"spmv_double.c"
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
	.globl	print_array                     // -- Begin function print_array
	.p2align	5
	.type	print_array,@function
print_array:                            // @print_array
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-96]!           // 16-byte Folded Spill
	str	x27, [sp, #16]                  // 8-byte Folded Spill
	stp	x26, x25, [sp, #32]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 96
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	mov	x21, x1
	mov	x1, x0
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	mov	w19, w4
	mov	w23, w3
	mov	x20, x2
	bl	printf
	cmp	w23, #1                         // =1
	b.lt	.LBB1_6
// %bb.1:
	mov	w25, w23
	adrp	x23, .L.str.1
	mov	x22, xzr
	mov	w26, w19
	sbfiz	x27, x19, #3, #32
	add	x23, x23, :lo12:.L.str.1
	b	.LBB1_3
	.p2align	5
.LBB1_2:                                //   in Loop: Header=BB1_3 Depth=1
	mov	w0, #10
	bl	putchar
	add	x22, x22, #1                    // =1
	cmp	x22, x25
	add	x20, x20, x27
	b.eq	.LBB1_6
.LBB1_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_5 Depth 2
	cmp	w19, #1                         // =1
	b.lt	.LBB1_2
// %bb.4:                               //   in Loop: Header=BB1_3 Depth=1
	mov	x24, xzr
	.p2align	5
.LBB1_5:                                //   Parent Loop BB1_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	d0, [x20, x24, lsl #3]
	mov	x0, x23
	mov	x1, x21
	mov	w2, w22
	mov	w3, w24
	bl	printf
	add	x24, x24, #1                    // =1
	cmp	x26, x24
	b.ne	.LBB1_5
	b	.LBB1_2
.LBB1_6:
	ldp	x20, x19, [sp, #80]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             // 16-byte Folded Reload
	ldr	x27, [sp, #16]                  // 8-byte Folded Reload
	mov	w0, #10
	ldp	x29, x30, [sp], #96             // 16-byte Folded Reload
	b	putchar
.Lfunc_end1:
	.size	print_array, .Lfunc_end1-print_array
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	5
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #96                     // =96
	str	d8, [sp, #16]                   // 8-byte Folded Spill
	stp	x29, x30, [sp, #24]             // 16-byte Folded Spill
	str	x25, [sp, #40]                  // 8-byte Folded Spill
	stp	x24, x23, [sp, #48]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 80
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
	cmp	w0, #1                          // =1
	b.le	.LBB2_2
// %bb.1:
	ldr	x0, [x1, #8]
	mov	w2, #10
	mov	x1, xzr
	bl	strtol
	mov	x24, x0
	b	.LBB2_3
.LBB2_2:
	mov	w24, #10240
.LBB2_3:
	mul	w25, w24, w24
	lsl	x0, x25, #2
	add	w21, w25, w25, lsl #2
	bl	malloc
	mov	x19, x0
	lsl	x0, x21, #2
	bl	malloc
	mov	x20, x0
	lsl	x0, x21, #3
	bl	malloc
	lsl	x23, x25, #3
	mov	x21, x0
	mov	x0, x23
	bl	malloc
	mov	x22, x0
	mov	x0, x23
	bl	malloc
	subs	w8, w24, #1                     // =1
	mov	x23, x0
	b.lt	.LBB2_25
// %bb.4:
	mov	w15, #1
	mov	x11, xzr
	mov	w9, wzr
	mov	w12, wzr
	add	w10, w24, #1                    // =1
	add	x13, x19, #4                    // =4
	mov	x14, #4616189618054758400
	sub	w15, w15, w24
	mov	x16, #-4616189618054758400
	b	.LBB2_7
	.p2align	5
.LBB2_5:                                //   in Loop: Header=BB2_7 Depth=1
	add	x11, x17, x18
.LBB2_6:                                //   in Loop: Header=BB2_7 Depth=1
	add	w9, w9, #1                      // =1
	cmp	w9, w24
	b.eq	.LBB2_24
.LBB2_7:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_18 Depth 2
	lsl	x17, x11, #32
	sbfiz	x18, x11, #2, #32
	lsr	x17, x17, #32
	str	w12, [x19, x18]
	cbz	w9, .LBB2_9
// %bb.8:                               //   in Loop: Header=BB2_7 Depth=1
	sub	w18, w17, w24
	str	x16, [x21, w12, sxtw #3]
	str	w18, [x20, w12, sxtw #2]
	add	w12, w12, #1                    // =1
.LBB2_9:                                //   in Loop: Header=BB2_7 Depth=1
	sxtw	x18, w12
	cmp	w24, #2                         // =2
	add	x18, x18, #1                    // =1
	str	w17, [x20, w12, sxtw #2]
	str	x14, [x21, w12, sxtw #3]
	b.lt	.LBB2_11
// %bb.10:                              //   in Loop: Header=BB2_7 Depth=1
	add	w0, w17, #1                     // =1
	str	x16, [x21, x18, lsl #3]
	str	w0, [x20, x18, lsl #2]
	add	w18, w12, #2                    // =2
.LBB2_11:                               //   in Loop: Header=BB2_7 Depth=1
	cmp	w9, w8
	sxtw	x0, w11
	b.ge	.LBB2_13
// %bb.12:                              //   in Loop: Header=BB2_7 Depth=1
	add	w12, w24, w17
	str	w12, [x20, w18, sxtw #2]
	add	w12, w18, #1                    // =1
	str	x16, [x21, w18, sxtw #3]
	b	.LBB2_14
	.p2align	5
.LBB2_13:                               //   in Loop: Header=BB2_7 Depth=1
	mov	w12, w18
.LBB2_14:                               //   in Loop: Header=BB2_7 Depth=1
	cmp	w24, #1                         // =1
	add	x17, x0, #1                     // =1
	b.ne	.LBB2_16
// %bb.15:                              //   in Loop: Header=BB2_7 Depth=1
	mov	x11, x17
	b	.LBB2_6
	.p2align	5
.LBB2_16:                               //   in Loop: Header=BB2_7 Depth=1
	add	x2, x13, x17, lsl #2
	mov	x18, xzr
	add	w0, w10, w11
	add	w1, w15, w11
	sub	x2, x2, #4                      // =4
	b	.LBB2_18
	.p2align	5
.LBB2_17:                               //   in Loop: Header=BB2_18 Depth=2
	add	x18, x18, #1                    // =1
	cmp	w8, w18
	b.eq	.LBB2_5
.LBB2_18:                               //   Parent Loop BB2_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x3, x18, #1                     // =1
	str	w12, [x2, x18, lsl #2]
	cbz	w9, .LBB2_20
// %bb.19:                              //   in Loop: Header=BB2_18 Depth=2
	add	w4, w1, w18
	str	x16, [x21, w12, sxtw #3]
	str	w4, [x20, w12, sxtw #2]
	add	w12, w12, #1                    // =1
.LBB2_20:                               //   in Loop: Header=BB2_18 Depth=2
	sxtw	x4, w12
	add	w5, w11, w18
	cmp	w3, w8
	add	x3, x4, #1                      // =1
	str	x16, [x21, w12, sxtw #3]
	add	w6, w5, #1                      // =1
	str	w5, [x20, w12, sxtw #2]
	add	w12, w3, #1                     // =1
	str	w6, [x20, x3, lsl #2]
	str	x14, [x21, x3, lsl #3]
	b.ge	.LBB2_22
// %bb.21:                              //   in Loop: Header=BB2_18 Depth=2
	add	w4, w11, w18
	add	w4, w4, #2                      // =2
	str	x16, [x21, w12, sxtw #3]
	str	w4, [x20, w12, sxtw #2]
	add	w12, w3, #2                     // =2
.LBB2_22:                               //   in Loop: Header=BB2_18 Depth=2
	cmp	w9, w8
	b.ge	.LBB2_17
// %bb.23:                              //   in Loop: Header=BB2_18 Depth=2
	add	w3, w0, w18
	str	x16, [x21, w12, sxtw #3]
	str	w3, [x20, w12, sxtw #2]
	add	w12, w12, #1                    // =1
	b	.LBB2_17
.LBB2_24:
	sxtw	x8, w11
	str	w12, [x19, x8, lsl #2]
	cbnz	w25, .LBB2_26
	b	.LBB2_28
.LBB2_25:
	mov	w12, wzr
	mov	x8, xzr
	str	w12, [x19, x8, lsl #2]
	cbz	w25, .LBB2_28
.LBB2_26:
	mov	x8, xzr
	whilelo	p0.d, xzr, x25
	fmov	z0.d, #1.00000000
	.p2align	5
.LBB2_27:                               // =>This Inner Loop Header: Depth=1
	st1d	{ z0.d }, p0, [x22, x8, lsl #3]
	incd	x8
	whilelo	p0.d, x8, x25
	b.mi	.LBB2_27
.LBB2_28:
	mov	x0, sp
	bl	ftime
	ldr	h1, [sp, #8]
	ldr	d0, [sp]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	ucvtf	d1, d1
	fmov	d2, x8
	scvtf	d0, d0
	fdiv	d1, d1, d2
	fadd	d8, d1, d0
	cbz	w25, .LBB2_40
// %bb.29:
	ldr	w12, [x19]
	cntd	x9
	mov	x8, xzr
	fmov	d0, xzr
	mvn	w9, w9
	index	z1.d, #0, #1
	b	.LBB2_33
.LBB2_30:                               //   in Loop: Header=BB2_33 Depth=1
	fmov	d2, xzr
.LBB2_31:                               //   in Loop: Header=BB2_33 Depth=1
	fadd	d2, d2, d0
.LBB2_32:                               //   in Loop: Header=BB2_33 Depth=1
	cmp	x10, x25
	str	d2, [x23, x8, lsl #3]
	mov	w12, w11
	mov	x8, x10
	b.eq	.LBB2_40
.LBB2_33:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_39 Depth 2
                                        //     Child Loop BB2_37 Depth 2
	add	x10, x8, #1                     // =1
	ldr	w11, [x19, x10, lsl #2]
	fmov	d2, xzr
	subs	w13, w11, w12
	b.le	.LBB2_32
// %bb.34:                              //   in Loop: Header=BB2_33 Depth=1
	cbz	w13, .LBB2_30
// %bb.35:                              //   in Loop: Header=BB2_33 Depth=1
	cmp	w13, w9
	b.ls	.LBB2_38
// %bb.36:                              //   in Loop: Header=BB2_33 Depth=1
	fmov	d2, xzr
	.p2align	5
.LBB2_37:                               //   Parent Loop BB2_33 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldrsw	x13, [x20, w12, sxtw #2]
	ldr	d3, [x21, w12, sxtw #3]
	add	w12, w12, #1                    // =1
	cmp	w11, w12
	ldr	d4, [x22, x13, lsl #3]
	fmul	d3, d3, d4
	fadd	d2, d2, d3
	b.ne	.LBB2_37
	b	.LBB2_31
.LBB2_38:                               //   in Loop: Header=BB2_33 Depth=1
	mov	w14, wzr
	whilelo	p0.d, wzr, w13
	mov	z3.d, x12
	fmov	d2, xzr
	mov	z4.d, z1.d
	.p2align	5
.LBB2_39:                               //   Parent Loop BB2_33 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	z5.d, z4.d, z3.d
	ld1d	{ z6.d }, p0/z, [x21, z5.d, sxtw #3]
	ld1sw	{ z5.d }, p0/z, [x20, z5.d, sxtw #2]
	incd	x14
	incd	z4.d
	ld1d	{ z5.d }, p0/z, [x22, z5.d, lsl #3]
	fmul	z5.d, z6.d, z5.d
	fadda	d2, p0, d2, z5.d
	whilelo	p0.d, w14, w13
	b.mi	.LBB2_39
	b	.LBB2_31
.LBB2_40:
	mov	x0, sp
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
	adrp	x0, .L.str.3
	fsub	d0, d0, d8
	add	x0, x0, :lo12:.L.str.3
	bl	printf
	cbz	w25, .LBB2_44
// %bb.41:
	mov	x8, xzr
	whilelo	p0.d, xzr, x25
	mov	z0.d, #0                        // =0x0
	ptrue	p2.d
	.p2align	5
.LBB2_42:                               // =>This Inner Loop Header: Depth=1
	ld1d	{ z1.d }, p0/z, [x23, x8, lsl #3]
	incd	x8
	fcmlt	p1.d, p2/z, z1.d, #0.0
	and	p0.b, p2/z, p0.b, p1.b
	mov	z1.d, p0/z, #1                  // =0x1
	whilelo	p0.d, x8, x25
	add	z0.d, z0.d, z1.d
	b.mi	.LBB2_42
// %bb.43:
	uaddv	d0, p2, z0.d
	fmov	x1, d0
	b	.LBB2_45
.LBB2_44:
	mov	w1, wzr
.LBB2_45:
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
                                        // kill: def $w1 killed $w1 killed $x1
	bl	printf
	mov	x0, x19
	bl	free
	mov	x0, x20
	bl	free
	mov	x0, x21
	bl	free
	mov	x0, x22
	bl	free
	mov	x0, x23
	bl	free
	ldp	x20, x19, [sp, #80]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             // 16-byte Folded Reload
	ldr	x25, [sp, #40]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #24]             // 16-byte Folded Reload
	ldr	d8, [sp, #16]                   // 8-byte Folded Reload
	mov	w0, wzr
	add	sp, sp, #96                     // =96
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s:\n"
	.size	.L.str, 5

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"%s[%d][%d]:%f  "
	.size	.L.str.1, 16

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"seq elasped time(s): %.4f\n"
	.size	.L.str.3, 27

	.type	.L.str.4,@object                // @.str.4
.L.str.4:
	.asciz	"Errors: %d\n"
	.size	.L.str.4, 12

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
