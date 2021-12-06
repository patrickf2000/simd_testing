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
.LBB1_1:                                // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	subs	w8, w8, #2500, lsl #12          // =10240000
	b.ge	.LBB1_4
	b	.LBB1_2
.LBB1_2:                                //   in Loop: Header=BB1_1 Depth=1
	bl	rand
	scvtf	s0, w0
	mov	w8, #52429
	movk	w8, #19788, lsl #16
	fmov	s1, w8
	fdiv	s0, s0, s1
	ldr	x9, [sp, #8]
	ldrsw	x10, [sp, #4]
	str	s0, [x9, x10, lsl #2]
	b	.LBB1_3
.LBB1_3:                                //   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #4]
	b	.LBB1_1
.LBB1_4:
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32                     // =32
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
	sub	sp, sp, #32                     // =32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	mov	w8, wzr
	str	w8, [sp, #20]
	str	w8, [sp, #12]
	str	w8, [sp, #4]
	b	.LBB2_1
.LBB2_1:                                // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	subs	w8, w8, #2500, lsl #12          // =10240000
	b.ge	.LBB2_5
	b	.LBB2_2
.LBB2_2:                                //   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #12]
	str	w8, [sp, #8]
	ldr	x9, [sp, #24]
	ldrsw	x10, [sp, #8]
	ldr	s0, [x9, x10, lsl #2]
	ldr	s1, [sp, #4]
	fadd	s0, s1, s0
	str	s0, [sp, #4]
	b	.LBB2_3
.LBB2_3:                                //   in Loop: Header=BB2_1 Depth=1
	b	.LBB2_4
.LBB2_4:                                //   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #12]
	b	.LBB2_1
.LBB2_5:
	mov	w8, #16384
	movk	w8, #156, lsl #16
	str	w8, [sp, #8]
	ldr	s0, [sp, #20]
	ldr	s1, [sp, #4]
	fadd	s0, s0, s1
	str	s0, [sp, #20]
	ldr	s0, [sp, #20]
	add	sp, sp, #32                     // =32
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
	sub	sp, sp, #16                     // =16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	mov	w8, wzr
	str	w8, [sp, #4]
	str	w8, [sp]
	b	.LBB3_1
.LBB3_1:                                // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp]
	subs	w8, w8, #2500, lsl #12          // =10240000
	b.ge	.LBB3_4
	b	.LBB3_2
.LBB3_2:                                //   in Loop: Header=BB3_1 Depth=1
	ldr	x8, [sp, #8]
	ldrsw	x9, [sp]
	ldr	s0, [x8, x9, lsl #2]
	ldr	s1, [sp, #4]
	fadd	s0, s1, s0
	str	s0, [sp, #4]
	b	.LBB3_3
.LBB3_3:                                //   in Loop: Header=BB3_1 Depth=1
	ldr	w8, [sp]
	add	w8, w8, #1                      // =1
	str	w8, [sp]
	b	.LBB3_1
.LBB3_4:
	ldr	s0, [sp, #4]
	add	sp, sp, #16                     // =16
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
	sub	sp, sp, #32                     // =32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16                    // =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	mov	w8, wzr
	str	w8, [sp, #4]
	b	.LBB4_1
.LBB4_1:                                // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	subs	w8, w8, #7                      // =7
	b.gt	.LBB4_4
	b	.LBB4_2
.LBB4_2:                                //   in Loop: Header=BB4_1 Depth=1
	ldr	x8, [sp, #8]
	ldrsw	x9, [sp, #4]
	ldr	s0, [x8, x9, lsl #2]
	fcvt	d0, s0
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	b	.LBB4_3
.LBB4_3:                                //   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1                      // =1
	str	w8, [sp, #4]
	b	.LBB4_1
.LBB4_4:
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	puts
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32                     // =32
	ret
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
	sub	sp, sp, #192                    // =192
	stp	x29, x30, [sp, #176]            // 16-byte Folded Spill
	add	x29, sp, #176                   // =176
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, wzr
	stur	w8, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	mov	w9, #40960000
	mov	w0, w9
	str	w8, [sp, #76]                   // 4-byte Folded Spill
	bl	malloc
	stur	x0, [x29, #-24]
	mov	x10, xzr
	mov	x0, x10
	str	x10, [sp, #64]                  // 8-byte Folded Spill
	bl	time
                                        // kill: def $w0 killed $w0 killed $x0
	bl	srand
	ldur	x0, [x29, #-24]
	bl	init
	ldur	x0, [x29, #-24]
	bl	sum
	stur	s0, [x29, #-28]
	ldur	x0, [x29, #-24]
	bl	sum_serial
	stur	s0, [x29, #-32]
	ldr	x10, [sp, #64]                  // 8-byte Folded Reload
	stur	x10, [x29, #-40]
	bl	read_timer
	stur	d0, [x29, #-48]
	ldr	w8, [sp, #76]                   // 4-byte Folded Reload
	stur	w8, [x29, #-52]
	b	.LBB5_1
.LBB5_1:                                // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-52]
	subs	w8, w8, #19                     // =19
	b.gt	.LBB5_4
	b	.LBB5_2
.LBB5_2:                                //   in Loop: Header=BB5_1 Depth=1
	ldur	x0, [x29, #-24]
	bl	sum
	stur	s0, [x29, #-28]
	b	.LBB5_3
.LBB5_3:                                //   in Loop: Header=BB5_1 Depth=1
	ldur	w8, [x29, #-52]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-52]
	b	.LBB5_1
.LBB5_4:
	bl	read_timer
	ldur	d1, [x29, #-48]
	fsub	d0, d0, d1
	ldur	d1, [x29, #-40]
	fadd	d0, d1, d0
	stur	d0, [x29, #-40]
	mov	x8, xzr
	stur	x8, [x29, #-64]
	bl	read_timer
	stur	d0, [x29, #-72]
	mov	w9, wzr
	stur	w9, [x29, #-76]
	b	.LBB5_5
.LBB5_5:                                // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-76]
	subs	w8, w8, #19                     // =19
	b.gt	.LBB5_8
	b	.LBB5_6
.LBB5_6:                                //   in Loop: Header=BB5_5 Depth=1
	ldur	x0, [x29, #-24]
	bl	sum_serial
	stur	s0, [x29, #-32]
	b	.LBB5_7
.LBB5_7:                                //   in Loop: Header=BB5_5 Depth=1
	ldur	w8, [x29, #-76]
	add	w8, w8, #1                      // =1
	stur	w8, [x29, #-76]
	b	.LBB5_5
.LBB5_8:
	bl	read_timer
	ldur	d1, [x29, #-72]
	fsub	d0, d0, d1
	ldur	d1, [x29, #-64]
	fadd	d0, d1, d0
	stur	d0, [x29, #-64]
	ldur	x0, [x29, #-24]
	bl	print_vector
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	bl	puts
	ldur	s2, [x29, #-28]
	fcvt	d0, s2
	adrp	x8, .L.str.4
	add	x8, x8, :lo12:.L.str.4
	str	w0, [sp, #60]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	adrp	x8, .L.str.5
	add	x8, x8, :lo12:.L.str.5
	str	w0, [sp, #56]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	puts
	ldur	s2, [x29, #-32]
	fcvt	d0, s2
	adrp	x8, .L.str.6
	add	x8, x8, :lo12:.L.str.6
	str	w0, [sp, #52]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldur	d0, [x29, #-40]
	mov	x8, #225833675390976
	movk	x8, #16845, lsl #48
	fmov	d1, x8
	fmul	d0, d0, d1
	mov	x8, #225833675390976
	movk	x8, #17197, lsl #48
	fmov	d3, x8
	fdiv	d0, d3, d0
	str	d0, [sp, #88]
	ldur	d0, [x29, #-64]
	fmul	d0, d0, d1
	fdiv	d0, d3, d0
	str	d0, [sp, #80]
	adrp	x8, .L.str.7
	add	x8, x8, :lo12:.L.str.7
	str	w0, [sp, #48]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	adrp	x8, .L.str.8
	add	x8, x8, :lo12:.L.str.8
	str	w0, [sp, #44]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	adrp	x8, .L.str.9
	add	x8, x8, :lo12:.L.str.9
	str	w0, [sp, #40]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldur	d0, [x29, #-40]
	fmov	d1, #20.00000000
	fdiv	d0, d0, d1
	ldr	d3, [sp, #88]
	adrp	x8, .L.str.10
	add	x8, x8, :lo12:.L.str.10
	str	w0, [sp, #36]                   // 4-byte Folded Spill
	mov	x0, x8
	str	d1, [sp, #24]                   // 8-byte Folded Spill
	mov	v1.16b, v3.16b
	bl	printf
	ldur	d0, [x29, #-64]
	ldr	d1, [sp, #24]                   // 8-byte Folded Reload
	fdiv	d0, d0, d1
	ldr	d1, [sp, #80]
	adrp	x8, .L.str.11
	add	x8, x8, :lo12:.L.str.11
	str	w0, [sp, #20]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldur	s2, [x29, #-32]
	ldur	s4, [x29, #-28]
	fsub	s2, s2, s4
	fcvt	d0, s2
	adrp	x8, .L.str.12
	add	x8, x8, :lo12:.L.str.12
	str	w0, [sp, #16]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	printf
	ldur	x8, [x29, #-24]
	str	w0, [sp, #12]                   // 4-byte Folded Spill
	mov	x0, x8
	bl	free
	mov	w1, wzr
	mov	w0, w1
	ldp	x29, x30, [sp, #176]            // 16-byte Folded Reload
	add	sp, sp, #192                    // =192
	ret
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"["
	.size	.L.str, 2

	.type	.L.str.1,@object                // @.str.1
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

	.type	.L.str.7,@object                // @.str.7
.L.str.7:
	.asciz	"==================================================================\n"
	.size	.L.str.7, 68

	.type	.L.str.8,@object                // @.str.8
.L.str.8:
	.asciz	"Performance:\t\t\tRuntime (s)\t GFLOPS\n"
	.size	.L.str.8, 36

	.type	.L.str.9,@object                // @.str.9
.L.str.9:
	.asciz	"------------------------------------------------------------------\n"
	.size	.L.str.9, 68

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

	.ident	"Arm C/C++/Fortran Compiler version 21.0 (build number 879) (based on LLVM 11.0.0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym read_timer
	.addrsig_sym ftime
	.addrsig_sym init
	.addrsig_sym rand
	.addrsig_sym sum
	.addrsig_sym sum_serial
	.addrsig_sym print_vector
	.addrsig_sym printf
	.addrsig_sym puts
	.addrsig_sym malloc
	.addrsig_sym srand
	.addrsig_sym time
	.addrsig_sym free
