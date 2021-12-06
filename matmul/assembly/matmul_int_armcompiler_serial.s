	.text
	.file	"matmul_int.c"
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
	.globl	init                            // -- Begin function init
	.p2align	5
	.type	init,@function
init:                                   // @init
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #32                     // =32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	mov	w8, wzr
	str	w8, [sp, #4]
	b	.LBB1_1
.LBB1_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_3 Depth 2
	ldr	w8, [sp, #4]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB1_8
	b	.LBB1_2
.LBB1_2:                                //   in Loop: Header=BB1_1 Depth=1
	mov	w8, wzr
	str	w8, [sp]
	b	.LBB1_3
.LBB1_3:                                //   Parent Loop BB1_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB1_6
	b	.LBB1_4
.LBB1_4:                                //   in Loop: Header=BB1_3 Depth=2
	bl	rand
	mov	w8, #11
	movk	w8, #40960, lsl #16
	smull	x9, w0, w8
	lsr	x9, x9, #32
                                        // kill: def $w9 killed $w9 killed $x9
	add	w8, w9, w0
	asr	w9, w8, #27
	add	w8, w9, w8, lsr #31
	ldr	x10, [sp, #8]
	ldrsw	x11, [sp, #4]
	ldr	x10, [x10, x11, lsl #3]
	ldrsw	x11, [sp]
	str	w8, [x10, x11, lsl #2]
	b	.LBB1_5
.LBB1_5:                                //   in Loop: Header=BB1_3 Depth=2
	ldr	w8, [sp]
	add	w8, w8, #1                      // =1
	str	w8, [sp]
	b	.LBB1_3
.LBB1_6:                                //   in Loop: Header=BB1_1 Depth=1
	b	.LBB1_7
.LBB1_7:                                //   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #4]
	b	.LBB1_1
.LBB1_8:
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32                     // =32
	ret
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc
                                        // -- End function
	.globl	matmul_simd                     // -- Begin function matmul_simd
	.p2align	5
	.type	matmul_simd,@function
matmul_simd:                            // @matmul_simd
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #64                     // =64
	.cfi_def_cfa_offset 64
	str	x0, [sp, #56]
	str	x1, [sp, #48]
	str	x2, [sp, #40]
	mov	w8, wzr
	str	w8, [sp, #36]
	b	.LBB2_1
.LBB2_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_3 Depth 2
                                        //       Child Loop BB2_5 Depth 3
	ldr	w8, [sp, #36]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB2_13
	b	.LBB2_2
.LBB2_2:                                //   in Loop: Header=BB2_1 Depth=1
	mov	w8, wzr
	str	w8, [sp, #32]
	b	.LBB2_3
.LBB2_3:                                //   Parent Loop BB2_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB2_5 Depth 3
	ldr	w8, [sp, #32]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB2_11
	b	.LBB2_4
.LBB2_4:                                //   in Loop: Header=BB2_3 Depth=2
	mov	w8, wzr
	str	w8, [sp, #24]
	str	w8, [sp, #16]
	str	w8, [sp, #8]
	b	.LBB2_5
.LBB2_5:                                //   Parent Loop BB2_1 Depth=1
                                        //     Parent Loop BB2_3 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	w8, [sp, #16]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB2_9
	b	.LBB2_6
.LBB2_6:                                //   in Loop: Header=BB2_5 Depth=3
	ldr	w8, [sp, #16]
	str	w8, [sp, #12]
	ldr	x9, [sp, #56]
	ldrsw	x10, [sp, #36]
	ldr	x9, [x9, x10, lsl #3]
	ldrsw	x10, [sp, #12]
	lsl	x10, x10, #2
	ldr	w8, [x9, x10]
	ldr	x9, [sp, #48]
	ldrsw	x11, [sp, #32]
	ldr	x9, [x9, x11, lsl #3]
	ldr	w12, [x9, x10]
	mul	w8, w8, w12
	ldr	w12, [sp, #8]
	add	w8, w12, w8
	str	w8, [sp, #8]
	b	.LBB2_7
.LBB2_7:                                //   in Loop: Header=BB2_5 Depth=3
	b	.LBB2_8
.LBB2_8:                                //   in Loop: Header=BB2_5 Depth=3
	ldr	w8, [sp, #16]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #16]
	b	.LBB2_5
.LBB2_9:                                //   in Loop: Header=BB2_3 Depth=2
	mov	w8, #1024
	str	w8, [sp, #28]
	ldr	w8, [sp, #24]
	ldr	w9, [sp, #8]
	add	w8, w8, w9
	str	w8, [sp, #24]
	ldr	w8, [sp, #24]
	ldr	x10, [sp, #40]
	ldrsw	x11, [sp, #36]
	ldr	x10, [x10, x11, lsl #3]
	ldrsw	x11, [sp, #32]
	str	w8, [x10, x11, lsl #2]
	b	.LBB2_10
.LBB2_10:                               //   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #32]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #32]
	b	.LBB2_3
.LBB2_11:                               //   in Loop: Header=BB2_1 Depth=1
	b	.LBB2_12
.LBB2_12:                               //   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #36]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #36]
	b	.LBB2_1
.LBB2_13:
	add	sp, sp, #64                     // =64
	ret
.Lfunc_end2:
	.size	matmul_simd, .Lfunc_end2-matmul_simd
	.cfi_endproc
                                        // -- End function
	.globl	print_matrix                    // -- Begin function print_matrix
	.p2align	5
	.type	print_matrix,@function
print_matrix:                           // @print_matrix
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #32                     // =32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	mov	w8, wzr
	str	w8, [sp, #4]
	b	.LBB3_1
.LBB3_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB3_3 Depth 2
	ldr	w8, [sp, #4]
	subs	w8, w8, #7                      // =7
	b.gt	.LBB3_8
	b	.LBB3_2
.LBB3_2:                                //   in Loop: Header=BB3_1 Depth=1
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	mov	w8, wzr
	str	w8, [sp]
	b	.LBB3_3
.LBB3_3:                                //   Parent Loop BB3_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp]
	subs	w8, w8, #7                      // =7
	b.gt	.LBB3_6
	b	.LBB3_4
.LBB3_4:                                //   in Loop: Header=BB3_3 Depth=2
	ldr	x8, [sp, #8]
	ldrsw	x9, [sp, #4]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp]
	ldr	w1, [x8, x9, lsl #2]
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	b	.LBB3_5
.LBB3_5:                                //   in Loop: Header=BB3_3 Depth=2
	ldr	w8, [sp]
	add	w8, w8, #1                      // =1
	str	w8, [sp]
	b	.LBB3_3
.LBB3_6:                                //   in Loop: Header=BB3_1 Depth=1
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	puts
	b	.LBB3_7
.LBB3_7:                                //   in Loop: Header=BB3_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #4]
	b	.LBB3_1
.LBB3_8:
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	bl	puts
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32                     // =32
	ret
.Lfunc_end3:
	.size	print_matrix, .Lfunc_end3-print_matrix
	.cfi_endproc
                                        // -- End function
	.globl	matmul_serial                   // -- Begin function matmul_serial
	.p2align	5
	.type	matmul_serial,@function
matmul_serial:                          // @matmul_serial
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #48                     // =48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #40]
	str	x1, [sp, #32]
	str	x2, [sp, #24]
	mov	w8, wzr
	str	w8, [sp, #20]
	b	.LBB4_1
.LBB4_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB4_3 Depth 2
                                        //       Child Loop BB4_5 Depth 3
	ldr	w8, [sp, #20]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB4_12
	b	.LBB4_2
.LBB4_2:                                //   in Loop: Header=BB4_1 Depth=1
	mov	w8, wzr
	str	w8, [sp, #16]
	b	.LBB4_3
.LBB4_3:                                //   Parent Loop BB4_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB4_5 Depth 3
	ldr	w8, [sp, #16]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB4_10
	b	.LBB4_4
.LBB4_4:                                //   in Loop: Header=BB4_3 Depth=2
	mov	w8, wzr
	str	w8, [sp, #8]
	str	w8, [sp, #12]
	b	.LBB4_5
.LBB4_5:                                //   Parent Loop BB4_1 Depth=1
                                        //     Parent Loop BB4_3 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	w8, [sp, #12]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB4_8
	b	.LBB4_6
.LBB4_6:                                //   in Loop: Header=BB4_5 Depth=3
	ldr	x8, [sp, #40]
	ldrsw	x9, [sp, #20]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp, #12]
	lsl	x9, x9, #2
	ldr	w10, [x8, x9]
	ldr	x8, [sp, #32]
	ldrsw	x11, [sp, #16]
	ldr	x8, [x8, x11, lsl #3]
	ldr	w12, [x8, x9]
	mul	w10, w10, w12
	ldr	w12, [sp, #8]
	add	w10, w12, w10
	str	w10, [sp, #8]
	b	.LBB4_7
.LBB4_7:                                //   in Loop: Header=BB4_5 Depth=3
	ldr	w8, [sp, #12]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #12]
	b	.LBB4_5
.LBB4_8:                                //   in Loop: Header=BB4_3 Depth=2
	ldr	w8, [sp, #8]
	ldr	x9, [sp, #24]
	ldrsw	x10, [sp, #20]
	ldr	x9, [x9, x10, lsl #3]
	ldrsw	x10, [sp, #16]
	str	w8, [x9, x10, lsl #2]
	b	.LBB4_9
.LBB4_9:                                //   in Loop: Header=BB4_3 Depth=2
	ldr	w8, [sp, #16]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #16]
	b	.LBB4_3
.LBB4_10:                               //   in Loop: Header=BB4_1 Depth=1
	b	.LBB4_11
.LBB4_11:                               //   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #20]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #20]
	b	.LBB4_1
.LBB4_12:
	add	sp, sp, #48                     // =48
	ret
.Lfunc_end4:
	.size	matmul_serial, .Lfunc_end4-matmul_serial
	.cfi_endproc
                                        // -- End function
	.globl	check                           // -- Begin function check
	.p2align	5
	.type	check,@function
check:                                  // @check
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #32                     // =32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	mov	w8, wzr
	str	w8, [sp, #12]
	str	w8, [sp, #8]
	b	.LBB5_1
.LBB5_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB5_3 Depth 2
	ldr	w8, [sp, #8]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB5_8
	b	.LBB5_2
.LBB5_2:                                //   in Loop: Header=BB5_1 Depth=1
	mov	w8, wzr
	str	w8, [sp, #4]
	b	.LBB5_3
.LBB5_3:                                //   Parent Loop BB5_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #4]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB5_6
	b	.LBB5_4
.LBB5_4:                                //   in Loop: Header=BB5_3 Depth=2
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #8]
	lsl	x9, x9, #3
	ldr	x8, [x8, x9]
	ldrsw	x10, [sp, #4]
	lsl	x10, x10, #2
	ldr	w11, [x8, x10]
	ldr	x8, [sp, #16]
	ldr	x8, [x8, x9]
	ldr	w12, [x8, x10]
	subs	w11, w11, w12
	ldr	w12, [sp, #12]
	add	w11, w12, w11
	str	w11, [sp, #12]
	b	.LBB5_5
.LBB5_5:                                //   in Loop: Header=BB5_3 Depth=2
	ldr	w8, [sp, #4]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #4]
	b	.LBB5_3
.LBB5_6:                                //   in Loop: Header=BB5_1 Depth=1
	b	.LBB5_7
.LBB5_7:                                //   in Loop: Header=BB5_1 Depth=1
	ldr	w8, [sp, #8]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #8]
	b	.LBB5_1
.LBB5_8:
	ldr	w0, [sp, #12]
	add	sp, sp, #32                     // =32
	ret
.Lfunc_end5:
	.size	check, .Lfunc_end5-check
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	5
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #224                    // =224
	stp	x29, x30, [sp, #208]            // 16-byte Folded Spill
	add	x29, sp, #208                   // =208
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, wzr
	stur	w8, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	mov	w9, #8192
	mov	w1, w9
	mov	x0, x1
	str	w8, [sp, #76]                   // 4-byte Folded Spill
	str	x1, [sp, #64]                   // 8-byte Folded Spill
	bl	malloc
	stur	x0, [x29, #-24]
	ldr	x0, [sp, #64]                   // 8-byte Folded Reload
	bl	malloc
	stur	x0, [x29, #-32]
	ldr	x0, [sp, #64]                   // 8-byte Folded Reload
	bl	malloc
	stur	x0, [x29, #-40]
	ldr	x0, [sp, #64]                   // 8-byte Folded Reload
	bl	malloc
	stur	x0, [x29, #-48]
	ldr	x0, [sp, #64]                   // 8-byte Folded Reload
	bl	malloc
	stur	x0, [x29, #-56]
	ldr	w8, [sp, #76]                   // 4-byte Folded Reload
	stur	w8, [x29, #-60]
	b	.LBB6_1
.LBB6_1:                                // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-60]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB6_4
	b	.LBB6_2
.LBB6_2:                                //   in Loop: Header=BB6_1 Depth=1
	mov	w8, #4096
	mov	w0, w8
	str	x0, [sp, #56]                   // 8-byte Folded Spill
	bl	malloc
	ldur	x9, [x29, #-24]
	ldursw	x10, [x29, #-60]
	str	x0, [x9, x10, lsl #3]
	ldr	x0, [sp, #56]                   // 8-byte Folded Reload
	bl	malloc
	ldur	x9, [x29, #-32]
	ldursw	x10, [x29, #-60]
	str	x0, [x9, x10, lsl #3]
	ldr	x0, [sp, #56]                   // 8-byte Folded Reload
	bl	malloc
	ldur	x9, [x29, #-40]
	ldursw	x10, [x29, #-60]
	str	x0, [x9, x10, lsl #3]
	ldr	x0, [sp, #56]                   // 8-byte Folded Reload
	bl	malloc
	ldur	x9, [x29, #-48]
	ldursw	x10, [x29, #-60]
	str	x0, [x9, x10, lsl #3]
	ldr	x0, [sp, #56]                   // 8-byte Folded Reload
	bl	malloc
	ldur	x9, [x29, #-56]
	ldursw	x10, [x29, #-60]
	str	x0, [x9, x10, lsl #3]
	b	.LBB6_3
.LBB6_3:                                //   in Loop: Header=BB6_1 Depth=1
	ldur	w8, [x29, #-60]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-60]
	b	.LBB6_1
.LBB6_4:
	mov	x0, xzr
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	ldur	x0, [x29, #-24]
	bl	init
	ldur	x0, [x29, #-32]
	bl	init
	mov	w8, wzr
	stur	w8, [x29, #-64]
	b	.LBB6_5
.LBB6_5:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB6_7 Depth 2
	ldur	w8, [x29, #-64]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB6_12
	b	.LBB6_6
.LBB6_6:                                //   in Loop: Header=BB6_5 Depth=1
	mov	w8, wzr
	stur	w8, [x29, #-68]
	b	.LBB6_7
.LBB6_7:                                //   Parent Loop BB6_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-68]
	subs	w8, w8, #1023                   // =1023
	b.gt	.LBB6_10
	b	.LBB6_8
.LBB6_8:                                //   in Loop: Header=BB6_7 Depth=2
	ldur	x8, [x29, #-32]
	ldursw	x9, [x29, #-68]
	ldr	x8, [x8, x9, lsl #3]
	ldursw	x10, [x29, #-64]
	ldr	w11, [x8, x10, lsl #2]
	ldur	x8, [x29, #-56]
	ldr	x8, [x8, x10, lsl #3]
	str	w11, [x8, x9, lsl #2]
	b	.LBB6_9
.LBB6_9:                                //   in Loop: Header=BB6_7 Depth=2
	ldur	w8, [x29, #-68]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-68]
	b	.LBB6_7
.LBB6_10:                               //   in Loop: Header=BB6_5 Depth=1
	b	.LBB6_11
.LBB6_11:                               //   in Loop: Header=BB6_5 Depth=1
	ldur	w8, [x29, #-64]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-64]
	b	.LBB6_5
.LBB6_12:
	mov	w8, #20
	stur	w8, [x29, #-76]
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-56]
	ldur	x2, [x29, #-40]
	bl	matmul_simd
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-56]
	ldur	x2, [x29, #-48]
	bl	matmul_serial
	mov	x9, xzr
	stur	x9, [x29, #-88]
	bl	read_timer
	stur	d0, [x29, #-96]
	mov	w8, wzr
	stur	w8, [x29, #-72]
	b	.LBB6_13
.LBB6_13:                               // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-72]
	ldur	w9, [x29, #-76]
	subs	w8, w8, w9
	b.ge	.LBB6_16
	b	.LBB6_14
.LBB6_14:                               //   in Loop: Header=BB6_13 Depth=1
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-56]
	ldur	x2, [x29, #-40]
	bl	matmul_simd
	b	.LBB6_15
.LBB6_15:                               //   in Loop: Header=BB6_13 Depth=1
	ldur	w8, [x29, #-72]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-72]
	b	.LBB6_13
.LBB6_16:
	bl	read_timer
	ldur	d1, [x29, #-96]
	fsub	d0, d0, d1
	ldur	d1, [x29, #-88]
	fadd	d0, d1, d0
	stur	d0, [x29, #-88]
	mov	x8, xzr
	str	x8, [sp, #104]
	bl	read_timer
	str	d0, [sp, #96]
	mov	w9, wzr
	stur	w9, [x29, #-72]
	b	.LBB6_17
.LBB6_17:                               // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-72]
	ldur	w9, [x29, #-76]
	subs	w8, w8, w9
	b.ge	.LBB6_20
	b	.LBB6_18
.LBB6_18:                               //   in Loop: Header=BB6_17 Depth=1
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-56]
	ldur	x2, [x29, #-48]
	bl	matmul_serial
	b	.LBB6_19
.LBB6_19:                               //   in Loop: Header=BB6_17 Depth=1
	ldur	w8, [x29, #-72]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-72]
	b	.LBB6_17
.LBB6_20:
	bl	read_timer
	ldr	d1, [sp, #96]
	fsub	d0, d0, d1
	ldr	d1, [sp, #104]
	fadd	d0, d1, d0
	str	d0, [sp, #104]
	ldur	x0, [x29, #-24]
	bl	print_matrix
	ldur	x0, [x29, #-56]
	bl	print_matrix
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	puts
	ldur	x8, [x29, #-40]
	str	w0, [sp, #52]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	print_matrix
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	puts
	ldur	x8, [x29, #-48]
	str	w0, [sp, #48]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	print_matrix
	ldur	s2, [x29, #-76]
                                        // implicit-def: $d0
	mov	v0.16b, v2.16b
	sshll	v3.2d, v0.2s, #0
                                        // kill: def $d3 killed $d3 killed $q3
	scvtf	d0, d3
	mov	x8, #4746794007248502784
	fmov	d1, x8
	fmul	d0, d0, d1
	ldur	d3, [x29, #-88]
	mov	x8, #225833675390976
	movk	x8, #16845, lsl #48
	fmov	d4, x8
	fmul	d3, d3, d4
	fdiv	d0, d0, d3
	str	d0, [sp, #88]
	ldur	s2, [x29, #-76]
                                        // implicit-def: $d0
	mov	v0.16b, v2.16b
	sshll	v5.2d, v0.2s, #0
                                        // kill: def $d5 killed $d5 killed $q5
	scvtf	d0, d5
	fmul	d0, d0, d1
	ldr	d1, [sp, #104]
	fmul	d1, d1, d4
	fdiv	d0, d0, d1
	str	d0, [sp, #80]
	adrp	x0, .L.str.6
	add	x0, x0, :lo12:.L.str.6
	bl	printf
	adrp	x8, .L.str.7
	add	x8, x8, :lo12:.L.str.7
	mov	w1, #1024
	str	w0, [sp, #44]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	adrp	x8, .L.str.8
	add	x8, x8, :lo12:.L.str.8
	str	w0, [sp, #40]                   // 4-byte Folded Spill
	mov	x0, x8
	str	x8, [sp, #32]                   // 8-byte Folded Spill
	bl	printf
	adrp	x8, .L.str.9
	add	x8, x8, :lo12:.L.str.9
	str	w0, [sp, #28]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldr	x8, [sp, #32]                   // 8-byte Folded Reload
	str	w0, [sp, #24]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldur	d0, [x29, #-88]
	ldur	s2, [x29, #-76]
                                        // implicit-def: $d1
	mov	v1.16b, v2.16b
	sshll	v6.2d, v1.2s, #0
                                        // kill: def $d6 killed $d6 killed $q6
	scvtf	d1, d6
	fdiv	d0, d0, d1
	ldr	d1, [sp, #88]
	adrp	x8, .L.str.10
	add	x8, x8, :lo12:.L.str.10
	str	w0, [sp, #20]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldr	d0, [sp, #104]
	ldur	s2, [x29, #-76]
                                        // implicit-def: $d1
	mov	v1.16b, v2.16b
	sshll	v7.2d, v1.2s, #0
                                        // kill: def $d7 killed $d7 killed $q7
	scvtf	d1, d7
	fdiv	d0, d0, d1
	ldr	d1, [sp, #80]
	adrp	x8, .L.str.11
	add	x8, x8, :lo12:.L.str.11
	str	w0, [sp, #16]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldur	x8, [x29, #-40]
	ldur	x1, [x29, #-48]
	str	w0, [sp, #12]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	check
	adrp	x8, .L.str.12
	add	x8, x8, :lo12:.L.str.12
	str	w0, [sp, #8]                    // 4-byte Folded Spill
	mov	x0, x8
	ldr	w1, [sp, #8]                    // 4-byte Folded Reload
	bl	printf
	mov	w1, wzr
	str	w0, [sp, #4]                    // 4-byte Folded Spill
	mov	w0, w1
	ldp	x29, x30, [sp, #208]            // 16-byte Folded Reload
	add	sp, sp, #224                    // =224
	ret
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"["
	.size	.L.str, 2

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"%d "
	.size	.L.str.1, 4

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"]"
	.size	.L.str.2, 2

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.zero	1
	.size	.L.str.3, 1

	.type	.L.str.4,@object                // @.str.4
.L.str.4:
	.asciz	"=\n"
	.size	.L.str.4, 3

	.type	.L.str.5,@object                // @.str.5
.L.str.5:
	.asciz	"---------------------------------"
	.size	.L.str.5, 34

	.type	.L.str.6,@object                // @.str.6
.L.str.6:
	.asciz	"======================================================================================================\n"
	.size	.L.str.6, 104

	.type	.L.str.7,@object                // @.str.7
.L.str.7:
	.asciz	"\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n"
	.size	.L.str.7, 59

	.type	.L.str.8,@object                // @.str.8
.L.str.8:
	.asciz	"------------------------------------------------------------------------------------------------------\n"
	.size	.L.str.8, 104

	.type	.L.str.9,@object                // @.str.9
.L.str.9:
	.asciz	"Performance:\t\tRuntime (s)\t GFLOPS\n"
	.size	.L.str.9, 35

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
	.asciz	"Correctness check: %d\n"
	.size	.L.str.12, 23

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym read_timer
	.addrsig_sym ftime
	.addrsig_sym init
	.addrsig_sym rand
	.addrsig_sym matmul_simd
	.addrsig_sym print_matrix
	.addrsig_sym printf
	.addrsig_sym puts
	.addrsig_sym matmul_serial
	.addrsig_sym check
	.addrsig_sym malloc
	.addrsig_sym srand
	.addrsig_sym time
