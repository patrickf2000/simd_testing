	.text
	.file	"spmv_int.c"
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
	sbfiz	x27, x19, #2, #32
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
	ldr	w4, [x20, x24, lsl #2]
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
	lsl	x23, x25, #2
	mov	x0, x23
	add	w20, w25, w25, lsl #2
	bl	malloc
	lsl	x21, x20, #2
	mov	x19, x0
	mov	x0, x21
	bl	malloc
	mov	x20, x0
	mov	x0, x21
	bl	malloc
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
	mov	w14, #1
	mov	x11, xzr
	mov	w9, wzr
	mov	w16, wzr
	add	w10, w24, #1                    // =1
	add	x12, x19, #4                    // =4
	mov	w13, #4
	sub	w14, w14, w24
	mov	w15, #-1
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
	str	w16, [x19, x18]
	cbz	w9, .LBB2_9
// %bb.8:                               //   in Loop: Header=BB2_7 Depth=1
	sbfiz	x18, x16, #2, #32
	sub	w0, w17, w24
	add	w16, w16, #1                    // =1
	str	w0, [x20, x18]
	str	w15, [x21, x18]
.LBB2_9:                                //   in Loop: Header=BB2_7 Depth=1
	sxtw	x18, w16
	sbfiz	x0, x16, #2, #32
	cmp	w24, #2                         // =2
	add	x18, x18, #1                    // =1
	str	w17, [x20, x0]
	str	w13, [x21, x0]
	b.lt	.LBB2_11
// %bb.10:                              //   in Loop: Header=BB2_7 Depth=1
	lsl	x18, x18, #2
	add	w0, w17, #1                     // =1
	str	w0, [x20, x18]
	str	w15, [x21, x18]
	add	w18, w16, #2                    // =2
.LBB2_11:                               //   in Loop: Header=BB2_7 Depth=1
	cmp	w9, w8
	sxtw	x0, w11
	b.ge	.LBB2_13
// %bb.12:                              //   in Loop: Header=BB2_7 Depth=1
	sbfiz	x16, x18, #2, #32
	add	w17, w24, w17
	str	w17, [x20, x16]
	str	w15, [x21, x16]
	add	w16, w18, #1                    // =1
	b	.LBB2_14
	.p2align	5
.LBB2_13:                               //   in Loop: Header=BB2_7 Depth=1
	mov	w16, w18
.LBB2_14:                               //   in Loop: Header=BB2_7 Depth=1
	cmp	w24, #1                         // =1
	add	x17, x0, #1                     // =1
	b.ne	.LBB2_16
// %bb.15:                              //   in Loop: Header=BB2_7 Depth=1
	mov	x11, x17
	b	.LBB2_6
	.p2align	5
.LBB2_16:                               //   in Loop: Header=BB2_7 Depth=1
	add	x2, x12, x17, lsl #2
	mov	x18, xzr
	add	w0, w10, w11
	add	w1, w14, w11
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
	str	w16, [x2, x18, lsl #2]
	cbz	w9, .LBB2_20
// %bb.19:                              //   in Loop: Header=BB2_18 Depth=2
	sbfiz	x4, x16, #2, #32
	add	w5, w1, w18
	add	w16, w16, #1                    // =1
	str	w5, [x20, x4]
	str	w15, [x21, x4]
.LBB2_20:                               //   in Loop: Header=BB2_18 Depth=2
	sxtw	x4, w16
	sbfiz	x16, x16, #2, #32
	add	w5, w11, w18
	cmp	w3, w8
	add	x3, x4, #1                      // =1
	add	w6, w5, #1                      // =1
	str	w5, [x20, x16]
	str	w15, [x21, x16]
	lsl	x16, x3, #2
	str	w6, [x20, x16]
	str	w13, [x21, x16]
	add	w16, w3, #1                     // =1
	b.ge	.LBB2_22
// %bb.21:                              //   in Loop: Header=BB2_18 Depth=2
	add	w4, w11, w18
	sbfiz	x16, x16, #2, #32
	add	w4, w4, #2                      // =2
	str	w15, [x21, x16]
	str	w4, [x20, x16]
	add	w16, w3, #2                     // =2
.LBB2_22:                               //   in Loop: Header=BB2_18 Depth=2
	cmp	w9, w8
	b.ge	.LBB2_17
// %bb.23:                              //   in Loop: Header=BB2_18 Depth=2
	sbfiz	x3, x16, #2, #32
	add	w4, w0, w18
	add	w16, w16, #1                    // =1
	str	w4, [x20, x3]
	str	w15, [x21, x3]
	b	.LBB2_17
.LBB2_24:
	sxtw	x8, w11
	str	w16, [x19, x8, lsl #2]
	cbnz	w25, .LBB2_26
	b	.LBB2_28
.LBB2_25:
	mov	w16, wzr
	mov	x8, xzr
	str	w16, [x19, x8, lsl #2]
	cbz	w25, .LBB2_28
.LBB2_26:
	mov	x8, xzr
	whilelo	p0.s, xzr, x25
	mov	z0.s, #1                        // =0x1
	.p2align	5
.LBB2_27:                               // =>This Inner Loop Header: Depth=1
	st1w	{ z0.s }, p0, [x22, x8, lsl #2]
	incw	x8
	whilelo	p0.s, x8, x25
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
	cbz	w25, .LBB2_39
// %bb.29:
	ldr	w13, [x19]
	cntw	x9
	mov	x8, xzr
	mov	z0.s, #0                        // =0x0
	mvn	w10, w9
	index	z1.s, #0, #1
	ptrue	p1.s
	b	.LBB2_31
	.p2align	5
.LBB2_30:                               //   in Loop: Header=BB2_31 Depth=1
	cmp	x11, x25
	str	w15, [x23, x8, lsl #2]
	mov	w13, w12
	mov	x8, x11
	b.eq	.LBB2_39
.LBB2_31:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_37 Depth 2
                                        //     Child Loop BB2_35 Depth 2
	add	x11, x8, #1                     // =1
	ldr	w12, [x19, x11, lsl #2]
	mov	w15, wzr
	subs	w14, w12, w13
	b.le	.LBB2_30
// %bb.32:                              //   in Loop: Header=BB2_31 Depth=1
	cbz	w14, .LBB2_30
// %bb.33:                              //   in Loop: Header=BB2_31 Depth=1
	cmp	w14, w10
	b.ls	.LBB2_36
// %bb.34:                              //   in Loop: Header=BB2_31 Depth=1
	mov	w15, wzr
	.p2align	5
.LBB2_35:                               //   Parent Loop BB2_31 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	sbfiz	x14, x13, #2, #32
	ldrsw	x16, [x20, x14]
	ldr	w14, [x21, x14]
	add	w13, w13, #1                    // =1
	cmp	w12, w13
	ldr	w16, [x22, x16, lsl #2]
	madd	w15, w16, w14, w15
	b.ne	.LBB2_35
	b	.LBB2_30
	.p2align	5
.LBB2_36:                               //   in Loop: Header=BB2_31 Depth=1
	whilelo	p0.s, wzr, w14
	mov	z2.s, w13
	mov	w13, w9
	mov	z3.d, z0.d
	mov	z4.d, z1.d
	.p2align	5
.LBB2_37:                               //   Parent Loop BB2_31 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	z5.s, z4.s, z2.s
	ld1w	{ z6.s }, p0/z, [x21, z5.s, sxtw #2]
	ld1w	{ z5.s }, p0/z, [x20, z5.s, sxtw #2]
	incw	z4.s
	ld1w	{ z5.s }, p0/z, [x22, z5.s, sxtw #2]
	mla	z3.s, p0/m, z5.s, z6.s
	whilelo	p0.s, w13, w14
	incw	x13
	b.mi	.LBB2_37
// %bb.38:                              //   in Loop: Header=BB2_31 Depth=1
	uaddv	d2, p1, z3.s
	fmov	x15, d2
	b	.LBB2_30
.LBB2_39:
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
	cbz	w25, .LBB2_43
// %bb.40:
	mov	x8, xzr
	whilelo	p0.s, xzr, x25
	mov	z0.s, #0                        // =0x0
	.p2align	5
.LBB2_41:                               // =>This Inner Loop Header: Depth=1
	ld1w	{ z1.s }, p0/z, [x23, x8, lsl #2]
	incw	x8
	lsr	z1.s, z1.s, #31
	add	z0.s, p0/m, z0.s, z1.s
	whilelo	p0.s, x8, x25
	b.mi	.LBB2_41
// %bb.42:
	ptrue	p0.s
	uaddv	d0, p0, z0.s
	fmov	x1, d0
	b	.LBB2_44
.LBB2_43:
	mov	w1, wzr
.LBB2_44:
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
	.asciz	"%s[%d][%d]:%d  "
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
