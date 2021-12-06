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
	ldr	d0, [sp]
	scvtf	d0, d0
	ldr	h1, [sp, #8]
                                        // implicit-def: $d2
	mov	v2.16b, v1.16b
	ucvtf	d2, d2
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	fmov	d3, x8
	fdiv	d2, d2, d3
	fadd	d0, d0, d2
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
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
	sub	sp, sp, #64                     // =64
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	add	x29, sp, #48                    // =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	str	w3, [sp, #20]
	str	w4, [sp, #16]
	ldur	x1, [x29, #-8]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	mov	w8, wzr
	str	w8, [sp, #12]
	b	.LBB1_1
.LBB1_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_3 Depth 2
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	b.ge	.LBB1_8
	b	.LBB1_2
.LBB1_2:                                //   in Loop: Header=BB1_1 Depth=1
	mov	w8, wzr
	str	w8, [sp, #8]
	b	.LBB1_3
.LBB1_3:                                //   Parent Loop BB1_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #16]
	subs	w8, w8, w9
	b.ge	.LBB1_6
	b	.LBB1_4
.LBB1_4:                                //   in Loop: Header=BB1_3 Depth=2
	ldur	x1, [x29, #-16]
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #8]
	ldr	x10, [sp, #24]
	ldr	w11, [sp, #16]
	mul	w11, w8, w11
	add	w11, w11, w9
	ldr	d0, [x10, w11, sxtw #3]
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	mov	w2, w8
	mov	w3, w9
	bl	printf
	b	.LBB1_5
.LBB1_5:                                //   in Loop: Header=BB1_3 Depth=2
	ldr	w8, [sp, #8]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #8]
	b	.LBB1_3
.LBB1_6:                                //   in Loop: Header=BB1_1 Depth=1
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	printf
	b	.LBB1_7
.LBB1_7:                                //   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #12]
	b	.LBB1_1
.LBB1_8:
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	printf
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	add	sp, sp, #64                     // =64
	ret
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
	sub	sp, sp, #208                    // =208
	stp	x29, x30, [sp, #192]            // 16-byte Folded Spill
	add	x29, sp, #192                   // =192
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	sub	x8, x29, #40                    // =40
	mov	w9, wzr
	stur	w9, [x29, #-4]
	stur	w0, [x29, #-8]
	str	x1, [x8, #24]
	mov	w9, #10240
	stur	w9, [x29, #-76]
	ldur	w9, [x29, #-8]
	subs	w9, w9, #2                      // =2
	str	x8, [sp, #8]                    // 8-byte Folded Spill
	b.lt	.LBB2_2
	b	.LBB2_1
.LBB2_1:
	ldr	x8, [sp, #8]                    // 8-byte Folded Reload
	ldr	x9, [x8, #24]
	ldr	x0, [x9, #8]
	bl	atoi
	stur	w0, [x29, #-76]
	b	.LBB2_2
.LBB2_2:
	ldur	w8, [x29, #-76]
	mul	w8, w8, w8
	stur	w8, [x29, #-88]
	ldur	w8, [x29, #-88]
	add	w8, w8, w8, lsl #2
	stur	w8, [x29, #-80]
	ldursw	x9, [x29, #-88]
	lsl	x0, x9, #2
	bl	malloc
	ldr	x9, [sp, #8]                    // 8-byte Folded Reload
	str	x0, [x9, #16]
	ldursw	x10, [x29, #-80]
	lsl	x0, x10, #2
	bl	malloc
	ldr	x9, [sp, #8]                    // 8-byte Folded Reload
	str	x0, [x9, #8]
	ldursw	x10, [x29, #-80]
	lsl	x0, x10, #3
	bl	malloc
	ldr	x9, [sp, #8]                    // 8-byte Folded Reload
	str	x0, [x9]
	ldursw	x10, [x29, #-88]
	lsl	x0, x10, #3
	bl	malloc
	stur	x0, [x29, #-48]
	ldursw	x9, [x29, #-88]
	lsl	x0, x9, #3
	bl	malloc
	stur	x0, [x29, #-56]
	mov	w8, wzr
	stur	w8, [x29, #-60]
	stur	w8, [x29, #-84]
	stur	w8, [x29, #-64]
	b	.LBB2_3
.LBB2_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_5 Depth 2
	ldur	w8, [x29, #-64]
	ldur	w9, [x29, #-76]
	subs	w8, w8, w9
	b.ge	.LBB2_18
	b	.LBB2_4
.LBB2_4:                                //   in Loop: Header=BB2_3 Depth=1
	mov	w8, wzr
	stur	w8, [x29, #-68]
	b	.LBB2_5
.LBB2_5:                                //   Parent Loop BB2_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-68]
	ldur	w9, [x29, #-76]
	subs	w8, w8, w9
	b.ge	.LBB2_16
	b	.LBB2_6
.LBB2_6:                                //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-84]
	ldr	x9, [sp, #8]                    // 8-byte Folded Reload
	ldr	x10, [x9, #16]
	ldursw	x11, [x29, #-60]
	str	w8, [x10, x11, lsl #2]
	ldur	w8, [x29, #-64]
	subs	w8, w8, #1                      // =1
	b.lt	.LBB2_8
	b	.LBB2_7
.LBB2_7:                                //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-60]
	ldur	w9, [x29, #-76]
	subs	w8, w8, w9
	ldr	x10, [sp, #8]                   // 8-byte Folded Reload
	ldr	x11, [x10, #8]
	ldursw	x12, [x29, #-84]
	str	w8, [x11, x12, lsl #2]
	ldr	x11, [x10]
	ldursw	x12, [x29, #-84]
	mov	x13, #-4616189618054758400
	str	x13, [x11, x12, lsl #3]
	ldur	w8, [x29, #-84]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-84]
	b	.LBB2_8
.LBB2_8:                                //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-68]
	subs	w8, w8, #1                      // =1
	b.lt	.LBB2_10
	b	.LBB2_9
.LBB2_9:                                //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-60]
	subs	w8, w8, #1                      // =1
	ldr	x9, [sp, #8]                    // 8-byte Folded Reload
	ldr	x10, [x9, #8]
	ldursw	x11, [x29, #-84]
	str	w8, [x10, x11, lsl #2]
	ldr	x10, [x9]
	ldursw	x11, [x29, #-84]
	mov	x12, #-4616189618054758400
	str	x12, [x10, x11, lsl #3]
	ldur	w8, [x29, #-84]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-84]
	b	.LBB2_10
.LBB2_10:                               //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-60]
	ldr	x9, [sp, #8]                    // 8-byte Folded Reload
	ldr	x10, [x9, #8]
	ldursw	x11, [x29, #-84]
	str	w8, [x10, x11, lsl #2]
	ldr	x10, [x9]
	ldursw	x11, [x29, #-84]
	mov	x12, #4616189618054758400
	str	x12, [x10, x11, lsl #3]
	ldur	w8, [x29, #-84]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-84]
	ldur	w8, [x29, #-68]
	ldur	w13, [x29, #-76]
	subs	w13, w13, #1                    // =1
	subs	w8, w8, w13
	b.ge	.LBB2_12
	b	.LBB2_11
.LBB2_11:                               //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-60]
	add	w8, w8, #1                      // =1
	ldr	x9, [sp, #8]                    // 8-byte Folded Reload
	ldr	x10, [x9, #8]
	ldursw	x11, [x29, #-84]
	str	w8, [x10, x11, lsl #2]
	ldr	x10, [x9]
	ldursw	x11, [x29, #-84]
	mov	x12, #-4616189618054758400
	str	x12, [x10, x11, lsl #3]
	ldur	w8, [x29, #-84]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-84]
	b	.LBB2_12
.LBB2_12:                               //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-64]
	ldur	w9, [x29, #-76]
	subs	w9, w9, #1                      // =1
	subs	w8, w8, w9
	b.ge	.LBB2_14
	b	.LBB2_13
.LBB2_13:                               //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-60]
	ldur	w9, [x29, #-76]
	add	w8, w8, w9
	ldr	x10, [sp, #8]                   // 8-byte Folded Reload
	ldr	x11, [x10, #8]
	ldursw	x12, [x29, #-84]
	str	w8, [x11, x12, lsl #2]
	ldr	x11, [x10]
	ldursw	x12, [x29, #-84]
	mov	x13, #-4616189618054758400
	str	x13, [x11, x12, lsl #3]
	ldur	w8, [x29, #-84]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-84]
	b	.LBB2_14
.LBB2_14:                               //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-60]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-60]
	b	.LBB2_15
.LBB2_15:                               //   in Loop: Header=BB2_5 Depth=2
	ldur	w8, [x29, #-68]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-68]
	b	.LBB2_5
.LBB2_16:                               //   in Loop: Header=BB2_3 Depth=1
	b	.LBB2_17
.LBB2_17:                               //   in Loop: Header=BB2_3 Depth=1
	ldur	w8, [x29, #-64]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-64]
	b	.LBB2_3
.LBB2_18:
	ldur	w8, [x29, #-84]
	ldr	x9, [sp, #8]                    // 8-byte Folded Reload
	ldr	x10, [x9, #16]
	ldursw	x11, [x29, #-60]
	str	w8, [x10, x11, lsl #2]
	mov	w8, wzr
	stur	w8, [x29, #-64]
	b	.LBB2_19
.LBB2_19:                               // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-64]
	ldur	w9, [x29, #-88]
	subs	w8, w8, w9
	b.ge	.LBB2_22
	b	.LBB2_20
.LBB2_20:                               //   in Loop: Header=BB2_19 Depth=1
	ldur	x8, [x29, #-48]
	ldursw	x9, [x29, #-64]
	mov	x10, #4607182418800017408
	str	x10, [x8, x9, lsl #3]
	b	.LBB2_21
.LBB2_21:                               //   in Loop: Header=BB2_19 Depth=1
	ldur	w8, [x29, #-64]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-64]
	b	.LBB2_19
.LBB2_22:
	bl	read_timer
	str	d0, [sp, #72]
	mov	w8, wzr
	stur	w8, [x29, #-60]
	b	.LBB2_23
.LBB2_23:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_26 Depth 2
	ldur	w8, [x29, #-60]
	ldur	w9, [x29, #-88]
	subs	w8, w8, w9
	b.ge	.LBB2_33
	b	.LBB2_24
.LBB2_24:                               //   in Loop: Header=BB2_23 Depth=1
	mov	x8, xzr
	str	x8, [sp, #64]
	ldr	x8, [sp, #8]                    // 8-byte Folded Reload
	ldr	x9, [x8, #16]
	ldursw	x10, [x29, #-60]
	ldr	w11, [x9, x10, lsl #2]
	str	w11, [sp, #56]
	ldr	x9, [x8, #16]
	ldur	w11, [x29, #-60]
	add	w11, w11, #1                    // =1
	ldr	w11, [x9, w11, sxtw #2]
	str	w11, [sp, #52]
	ldr	w11, [sp, #52]
	ldr	w12, [sp, #56]
	mvn	w12, w12
	add	w11, w12, w11
	str	w11, [sp, #48]
	ldr	w11, [sp, #56]
	str	w11, [sp, #44]
	ldr	w11, [sp, #56]
	ldr	w12, [sp, #52]
	subs	w11, w11, w12
	b.ge	.LBB2_31
	b	.LBB2_25
.LBB2_25:                               //   in Loop: Header=BB2_23 Depth=1
	mov	w8, wzr
	str	w8, [sp, #40]
	mov	x9, xzr
	str	x9, [sp, #24]
	b	.LBB2_26
.LBB2_26:                               //   Parent Loop BB2_23 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #40]
	ldr	w9, [sp, #48]
	add	w9, w9, #1                      // =1
	subs	w8, w8, w9
	b.hs	.LBB2_30
	b	.LBB2_27
.LBB2_27:                               //   in Loop: Header=BB2_26 Depth=2
	ldr	w8, [sp, #56]
	ldr	w9, [sp, #40]
	add	w8, w8, w9
	str	w8, [sp, #36]
	ldr	x10, [sp, #8]                   // 8-byte Folded Reload
	ldr	x11, [x10]
	ldrsw	x12, [sp, #36]
	ldr	d0, [x11, x12, lsl #3]
	ldur	x11, [x29, #-48]
	ldr	x13, [x10, #8]
	ldrsw	x12, [x13, x12, lsl #2]
	ldr	d1, [x11, x12, lsl #3]
	fmul	d0, d0, d1
	ldr	d1, [sp, #24]
	fadd	d0, d1, d0
	str	d0, [sp, #24]
	b	.LBB2_28
.LBB2_28:                               //   in Loop: Header=BB2_26 Depth=2
	b	.LBB2_29
.LBB2_29:                               //   in Loop: Header=BB2_26 Depth=2
	ldr	w8, [sp, #40]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #40]
	b	.LBB2_26
.LBB2_30:                               //   in Loop: Header=BB2_23 Depth=1
	ldr	w8, [sp, #52]
	stur	w8, [x29, #-72]
	ldr	d0, [sp, #64]
	ldr	d1, [sp, #24]
	fadd	d0, d0, d1
	str	d0, [sp, #64]
	b	.LBB2_31
.LBB2_31:                               //   in Loop: Header=BB2_23 Depth=1
	ldr	d0, [sp, #64]
	ldur	x8, [x29, #-56]
	ldursw	x9, [x29, #-60]
	str	d0, [x8, x9, lsl #3]
	b	.LBB2_32
.LBB2_32:                               //   in Loop: Header=BB2_23 Depth=1
	ldur	w8, [x29, #-60]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-60]
	b	.LBB2_23
.LBB2_33:
	bl	read_timer
	ldr	d1, [sp, #72]
	fsub	d0, d0, d1
	str	d0, [sp, #72]
	ldr	d0, [sp, #72]
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	bl	printf
	mov	w8, wzr
	str	w8, [sp, #20]
	stur	w8, [x29, #-60]
	b	.LBB2_34
.LBB2_34:                               // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-60]
	ldur	w9, [x29, #-88]
	subs	w8, w8, w9
	b.ge	.LBB2_39
	b	.LBB2_35
.LBB2_35:                               //   in Loop: Header=BB2_34 Depth=1
	ldur	x8, [x29, #-56]
	ldursw	x9, [x29, #-60]
	ldr	d0, [x8, x9, lsl #3]
	fcmp	d0, #0.0
	b.pl	.LBB2_37
	b	.LBB2_36
.LBB2_36:                               //   in Loop: Header=BB2_34 Depth=1
	ldr	w8, [sp, #20]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #20]
	b	.LBB2_37
.LBB2_37:                               //   in Loop: Header=BB2_34 Depth=1
	b	.LBB2_38
.LBB2_38:                               //   in Loop: Header=BB2_34 Depth=1
	ldur	w8, [x29, #-60]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-60]
	b	.LBB2_34
.LBB2_39:
	ldr	w1, [sp, #20]
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	printf
	ldr	x8, [sp, #8]                    // 8-byte Folded Reload
	ldr	x9, [x8, #16]
	str	w0, [sp, #4]                    // 4-byte Folded Spill
	mov	x0, x9
	bl	free
	ldr	x8, [sp, #8]                    // 8-byte Folded Reload
	ldr	x0, [x8, #8]
	bl	free
	ldr	x8, [sp, #8]                    // 8-byte Folded Reload
	ldr	x0, [x8]
	bl	free
	ldur	x0, [x29, #-48]
	bl	free
	ldur	x0, [x29, #-56]
	bl	free
	mov	w1, wzr
	mov	w0, w1
	ldp	x29, x30, [sp, #192]            // 16-byte Folded Reload
	add	sp, sp, #208                    // =208
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

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"\n"
	.size	.L.str.2, 2

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
	.addrsig_sym read_timer
	.addrsig_sym ftime
	.addrsig_sym printf
	.addrsig_sym atoi
	.addrsig_sym malloc
	.addrsig_sym free
