	.text
	.intel_syntax noprefix
	.file	"sum.c"
	.section	.rodata.cst8,"aM",@progbits,8

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI2_0:
	.long	0x3f800000                      # float 1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI2_1:
	.quad	0x408f400000000000              # double 1000
.LCPI2_2:
	.quad	0x41cdcd6500000000              # double 1.0E+9
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	sub	rsp, 88
	.cfi_def_cfa_offset 144
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	eax, 10240
	cmp	edi, 2
	jl	.LBB2_2
# %bb.1:                                # %if.then
	mov	rdi, qword ptr [rsi + 8]
	xor	esi, esi
	mov	edx, 10
	call	strtol
.LBB2_2:                                # %if.end
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	imul	eax, eax
	lea	ebx, [rax + 4*rax]
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	lea	r13, [4*rax]
	mov	rdi, r13
	call	malloc
	mov	r14, rax
	shl	rbx, 2
	mov	rdi, rbx
	call	malloc
	mov	r15, rax
	mov	rdi, rbx
	call	malloc
	mov	rbx, rax
	mov	rdi, r13
	call	malloc
	mov	qword ptr [rsp + 16], rax       # 8-byte Spill
	mov	rdi, r13
	call	malloc
	mov	r8, qword ptr [rsp + 8]         # 8-byte Reload
	mov	r12, rax
	test	r8d, r8d
	jle	.LBB2_3
# %bb.4:                                # %for.cond18.preheader.lr.ph
	lea	eax, [r8 - 1]
	lea	ecx, [r8 + 1]
	mov	qword ptr [rsp + 32], rcx       # 8-byte Spill
	mov	ecx, 1
	sub	ecx, r8d
	mov	qword ptr [rsp + 64], rcx       # 8-byte Spill
	mov	rcx, r14
	add	rcx, 4
	mov	qword ptr [rsp + 56], rcx       # 8-byte Spill
	xor	ecx, ecx
	xor	edi, edi
	xor	edx, edx
	mov	qword ptr [rsp + 80], r14       # 8-byte Spill
	mov	qword ptr [rsp + 72], r12       # 8-byte Spill
	jmp	.LBB2_5
	.p2align	4, 0x90
.LBB2_23:                               # %for.inc69.loopexit
                                        #   in Loop: Header=BB2_5 Depth=1
	add	r11, r10
	mov	rcx, r11
	mov	r14, qword ptr [rsp + 80]       # 8-byte Reload
	mov	r12, qword ptr [rsp + 72]       # 8-byte Reload
	mov	r8, qword ptr [rsp + 8]         # 8-byte Reload
.LBB2_24:                               # %for.inc69
                                        #   in Loop: Header=BB2_5 Depth=1
	inc	edi
	cmp	edi, r8d
	je	.LBB2_25
.LBB2_5:                                # %for.body21.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_15 Depth 2
	movsxd	r11, ecx
	mov	dword ptr [r14 + 4*r11], edx
	test	edi, edi
	je	.LBB2_7
# %bb.6:                                # %if.then25.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movsxd	rsi, edx
	mov	ebp, ecx
	sub	ebp, r8d
	mov	dword ptr [r15 + 4*rsi], ebp
	mov	dword ptr [rbx + 4*rsi], -1082130432
	inc	edx
.LBB2_7:                                # %if.end40.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	lea	esi, [rdx + 1]
	movsxd	rbp, edx
	mov	dword ptr [r15 + 4*rbp], ecx
	mov	dword ptr [rbx + 4*rbp], 1082130432
	cmp	r8d, 2
	jl	.LBB2_9
# %bb.8:                                # %if.then49.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movsxd	rsi, esi
	lea	ebp, [rcx + 1]
	mov	dword ptr [r15 + 4*rsi], ebp
	mov	dword ptr [rbx + 4*rsi], -1082130432
	add	edx, 2
	mov	esi, edx
.LBB2_9:                                # %if.end55.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	cmp	edi, eax
	jge	.LBB2_10
# %bb.11:                               # %if.then59.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	movsxd	rdx, esi
	lea	esi, [r8 + rcx]
	mov	dword ptr [r15 + 4*rdx], esi
	mov	dword ptr [rbx + 4*rdx], -1082130432
	inc	edx
	jmp	.LBB2_12
	.p2align	4, 0x90
.LBB2_10:                               #   in Loop: Header=BB2_5 Depth=1
	mov	edx, esi
.LBB2_12:                               # %if.end66.peel
                                        #   in Loop: Header=BB2_5 Depth=1
	inc	r11
	cmp	r8d, 1
	jne	.LBB2_14
# %bb.13:                               #   in Loop: Header=BB2_5 Depth=1
	mov	rcx, r11
	jmp	.LBB2_24
	.p2align	4, 0x90
.LBB2_14:                               # %for.body21.preheader
                                        #   in Loop: Header=BB2_5 Depth=1
	mov	rsi, qword ptr [rsp + 32]       # 8-byte Reload
	lea	r14d, [rsi + rcx]
	mov	rsi, qword ptr [rsp + 64]       # 8-byte Reload
	lea	r12d, [rsi + rcx]
	mov	rsi, qword ptr [rsp + 56]       # 8-byte Reload
	lea	r8, [rsi + 4*r11]
	add	r8, -4
	xor	r9d, r9d
	jmp	.LBB2_15
	.p2align	4, 0x90
.LBB2_21:                               # %if.then59
                                        #   in Loop: Header=BB2_15 Depth=2
	movsxd	rdx, r13d
	add	r9d, r14d
	mov	dword ptr [r15 + 4*rdx], r9d
	mov	dword ptr [rbx + 4*rdx], -1082130432
	inc	edx
.LBB2_22:                               # %if.end66
                                        #   in Loop: Header=BB2_15 Depth=2
	mov	r9, r10
	cmp	eax, r10d
	je	.LBB2_23
.LBB2_15:                               # %for.body21
                                        #   Parent Loop BB2_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lea	r10, [r9 + 1]
	mov	dword ptr [r8 + 4*r9], edx
	test	edi, edi
	je	.LBB2_17
# %bb.16:                               # %if.then25
                                        #   in Loop: Header=BB2_15 Depth=2
	movsxd	rbp, edx
	lea	esi, [r12 + r9]
	mov	dword ptr [r15 + 4*rbp], esi
	mov	dword ptr [rbx + 4*rbp], -1082130432
	inc	edx
.LBB2_17:                               # %if.then33
                                        #   in Loop: Header=BB2_15 Depth=2
	movsxd	rsi, edx
	lea	ebp, [rcx + r9]
	mov	dword ptr [r15 + 4*rsi], ebp
	mov	dword ptr [rbx + 4*rsi], -1082130432
	lea	ebp, [rcx + r9]
	inc	ebp
	mov	dword ptr [r15 + 4*rsi + 4], ebp
	mov	dword ptr [rbx + 4*rsi + 4], 1082130432
	lea	r13d, [rdx + 2]
	cmp	r10d, eax
	jge	.LBB2_19
# %bb.18:                               # %if.then49
                                        #   in Loop: Header=BB2_15 Depth=2
	inc	edx
	movsxd	rsi, r13d
	lea	ebp, [rcx + r9]
	add	ebp, 2
	mov	dword ptr [r15 + 4*rsi], ebp
	mov	dword ptr [rbx + 4*rsi], -1082130432
	add	edx, 2
	mov	r13d, edx
.LBB2_19:                               # %if.end55
                                        #   in Loop: Header=BB2_15 Depth=2
	cmp	edi, eax
	jl	.LBB2_21
# %bb.20:                               #   in Loop: Header=BB2_15 Depth=2
	mov	edx, r13d
	jmp	.LBB2_22
.LBB2_25:                               # %for.end71.loopexit
	movsxd	rax, ecx
	jmp	.LBB2_26
.LBB2_3:
	xor	edx, edx
	xor	eax, eax
.LBB2_26:                               # %for.end71
	mov	rbp, qword ptr [rsp + 24]       # 8-byte Reload
	mov	r8, qword ptr [rsp + 16]        # 8-byte Reload
	mov	dword ptr [r14 + 4*rax], edx
	test	ebp, ebp
	je	.LBB2_38
# %bb.27:                               # %for.body77.preheader
	cmp	ebp, 32
	jae	.LBB2_29
# %bb.28:
	xor	eax, eax
	jmp	.LBB2_37
.LBB2_29:                               # %vector.ph
	mov	eax, ebp
	and	eax, -32
	lea	rsi, [rax - 32]
	mov	rdx, rsi
	shr	rdx, 5
	inc	rdx
	mov	ecx, edx
	and	ecx, 7
	cmp	rsi, 224
	jae	.LBB2_31
# %bb.30:
	xor	esi, esi
	jmp	.LBB2_33
.LBB2_31:                               # %vector.ph.new
	lea	rdi, [r8 + 992]
	and	rdx, -8
	neg	rdx
	xor	esi, esi
	vbroadcastss	ymm0, dword ptr [rip + .LCPI2_0] # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_32:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	ymmword ptr [rdi + 4*rsi - 992], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 960], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 928], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 896], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 864], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 832], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 800], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 768], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 736], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 704], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 672], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 640], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 608], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 576], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 544], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 512], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 480], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 448], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 416], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 384], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 352], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 320], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 288], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 256], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 224], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 192], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 160], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 128], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 96], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 64], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi - 32], ymm0
	vmovupd	ymmword ptr [rdi + 4*rsi], ymm0
	add	rsi, 256
	add	rdx, 8
	jne	.LBB2_32
.LBB2_33:                               # %middle.block.unr-lcssa
	test	rcx, rcx
	je	.LBB2_36
# %bb.34:                               # %vector.body.epil.preheader
	lea	rdx, [r8 + 4*rsi]
	add	rdx, 96
	neg	rcx
	vbroadcastss	ymm0, dword ptr [rip + .LCPI2_0] # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	.p2align	4, 0x90
.LBB2_35:                               # %vector.body.epil
                                        # =>This Inner Loop Header: Depth=1
	vmovupd	ymmword ptr [rdx - 96], ymm0
	vmovupd	ymmword ptr [rdx - 64], ymm0
	vmovupd	ymmword ptr [rdx - 32], ymm0
	vmovupd	ymmword ptr [rdx], ymm0
	sub	rdx, -128
	inc	rcx
	jne	.LBB2_35
.LBB2_36:                               # %middle.block
	cmp	rax, rbp
	je	.LBB2_38
	.p2align	4, 0x90
.LBB2_37:                               # %for.body77
                                        # =>This Inner Loop Header: Depth=1
	mov	dword ptr [r8 + 4*rax], 1065353216
	inc	rax
	cmp	rbp, rax
	jne	.LBB2_37
.LBB2_38:                               # %for.end82
	lea	rdi, [rsp + 40]
	vzeroupper
	call	ftime
	mov	r8, qword ptr [rsp + 24]        # 8-byte Reload
	vcvtsi2sd	xmm0, xmm1, qword ptr [rsp + 40]
	movzx	eax, word ptr [rsp + 48]
	vcvtsi2sd	xmm1, xmm1, eax
	vdivsd	xmm1, xmm1, qword ptr [rip + .LCPI2_1]
	vaddsd	xmm0, xmm1, xmm0
	test	r8d, r8d
	vmovsd	qword ptr [rsp + 8], xmm0       # 8-byte Spill
	je	.LBB2_39
# %bb.40:                               # %for.body87.lr.ph
	mov	edx, dword ptr [r14]
	xor	eax, eax
	vxorpd	xmm0, xmm0, xmm0
	xor	esi, esi
	mov	rcx, qword ptr [rsp + 16]       # 8-byte Reload
	jmp	.LBB2_41
	.p2align	4, 0x90
.LBB2_44:                               # %for.end118
                                        #   in Loop: Header=BB2_41 Depth=1
	vextracti64x4	ymm3, zmm2, 1
	vpaddd	ymm2, ymm3, ymm2
	vphaddd	ymm2, ymm2, ymm2
	vphaddd	ymm2, ymm2, ymm2
	vpermq	ymm3, ymm2, 231                 # ymm3 = ymm2[3,1,2,3]
	vpaddd	xmm2, xmm3, xmm2
	vmovd	esi, xmm2
	vextractf64x4	ymm2, zmm1, 1
	vaddps	ymm1, ymm1, ymm2
	vhaddps	ymm1, ymm1, ymm1
	vhaddps	ymm1, ymm1, ymm1
	vextractf128	xmm2, ymm1, 1
	vpermilpd	xmm2, xmm2, 1           # xmm2 = xmm2[1,0]
	vaddss	xmm1, xmm1, xmm2
	vmovss	dword ptr [r12 + 4*rax], xmm1
	mov	edx, ebp
	mov	rax, r9
	cmp	r9, r8
	je	.LBB2_45
.LBB2_41:                               # %for.body87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_43 Depth 2
	lea	r9, [rax + 1]
	mov	ebp, dword ptr [r14 + 4*rax + 4]
	vpxor	xmm2, xmm2, xmm2
	vxorpd	xmm1, xmm1, xmm1
	cmp	edx, ebp
	jge	.LBB2_44
# %bb.42:                               # %for.body102.lr.ph
                                        #   in Loop: Header=BB2_41 Depth=1
	movsxd	rdi, ebp
	add	esi, 2
	vpbroadcastd	zmm3, esi
	movsxd	rdx, edx
	vpxor	xmm2, xmm2, xmm2
	vxorpd	xmm1, xmm1, xmm1
	.p2align	4, 0x90
.LBB2_43:                               # %for.body102
                                        #   Parent Loop BB2_41 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddd	zmm2, zmm2, zmm3
	vmovups	zmm4, zmmword ptr [r15 + 4*rdx]
	kxorw	k1, k0, k0
	vxorps	xmm5, xmm5, xmm5
	vgatherdps	zmm5 {k1}, zmmword ptr [rcx + 4*zmm4]
	vmulps	zmm4, zmm5, zmmword ptr [rbx + 4*rdx]
	vaddps	zmm4, zmm4, zmm0
	vaddps	zmm1, zmm1, zmm4
	add	rdx, 16
	cmp	rdx, rdi
	jl	.LBB2_43
	jmp	.LBB2_44
.LBB2_45:                               # %for.end142.loopexit
	vcvtsi2sd	xmm0, xmm6, esi
	jmp	.LBB2_46
.LBB2_39:
	vxorpd	xmm0, xmm0, xmm0
.LBB2_46:                               # %for.end142
	vmovsd	qword ptr [rsp + 32], xmm0      # 8-byte Spill
	lea	rdi, [rsp + 40]
	vzeroupper
	call	ftime
	vcvtsi2sd	xmm0, xmm6, qword ptr [rsp + 40]
	movzx	eax, word ptr [rsp + 48]
	vcvtsi2sd	xmm1, xmm6, eax
	vdivsd	xmm1, xmm1, qword ptr [rip + .LCPI2_1]
	vaddsd	xmm0, xmm1, xmm0
	vsubsd	xmm0, xmm0, qword ptr [rsp + 8] # 8-byte Folded Reload
	vmulsd	xmm1, xmm0, qword ptr [rip + .LCPI2_2]
	vmovsd	xmm2, qword ptr [rsp + 32]      # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vdivsd	xmm1, xmm2, xmm1
	vmovsd	qword ptr [rsp + 8], xmm1       # 8-byte Spill
	mov	edi, offset .L.str.3
	mov	al, 1
	call	printf
	mov	edi, offset .L.str.4
	vmovq	xmm0, qword ptr [rsp + 8]       # 8-byte Folded Reload
                                        # xmm0 = mem[0],zero
	mov	al, 1
	call	printf
	mov	rdi, qword ptr [rsp + 24]       # 8-byte Reload
	test	edi, edi
	je	.LBB2_47
# %bb.48:                               # %for.body152.preheader
	cmp	edi, 32
	jae	.LBB2_50
# %bb.49:
	xor	eax, eax
	xor	esi, esi
	jmp	.LBB2_57
.LBB2_47:
	xor	esi, esi
	jmp	.LBB2_59
.LBB2_50:                               # %vector.ph375
	mov	eax, edi
	and	eax, -32
	lea	rdx, [rax - 32]
	mov	rcx, rdx
	shr	rcx, 5
	inc	rcx
	test	rdx, rdx
	je	.LBB2_51
# %bb.52:                               # %vector.ph375.new
	mov	rsi, rcx
	and	rsi, -2
	neg	rsi
	vxorps	xmm4, xmm4, xmm4
	xor	edx, edx
	vpxor	xmm0, xmm0, xmm0
	vxorpd	xmm1, xmm1, xmm1
	vxorpd	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	.p2align	4, 0x90
.LBB2_53:                               # %vector.body373
                                        # =>This Inner Loop Header: Depth=1
	vmovups	ymm5, ymmword ptr [r12 + 4*rdx]
	vmovups	ymm6, ymmword ptr [r12 + 4*rdx + 32]
	vmovups	ymm7, ymmword ptr [r12 + 4*rdx + 64]
	vmovups	ymm8, ymmword ptr [r12 + 4*rdx + 96]
	vcmpltps	ymm5, ymm5, ymm4
	vpsubd	ymm0, ymm0, ymm5
	vcmpltps	ymm5, ymm6, ymm4
	vpsubd	ymm1, ymm1, ymm5
	vcmpltps	ymm5, ymm7, ymm4
	vpsubd	ymm2, ymm2, ymm5
	vcmpltps	ymm5, ymm8, ymm4
	vpsubd	ymm3, ymm3, ymm5
	vmovups	ymm5, ymmword ptr [r12 + 4*rdx + 128]
	vmovups	ymm6, ymmword ptr [r12 + 4*rdx + 160]
	vmovups	ymm7, ymmword ptr [r12 + 4*rdx + 192]
	vmovups	ymm8, ymmword ptr [r12 + 4*rdx + 224]
	vcmpltps	ymm5, ymm5, ymm4
	vpsubd	ymm0, ymm0, ymm5
	vcmpltps	ymm5, ymm6, ymm4
	vpsubd	ymm1, ymm1, ymm5
	vcmpltps	ymm5, ymm7, ymm4
	vpsubd	ymm2, ymm2, ymm5
	vcmpltps	ymm5, ymm8, ymm4
	vpsubd	ymm3, ymm3, ymm5
	add	rdx, 64
	add	rsi, 2
	jne	.LBB2_53
# %bb.54:                               # %middle.block371.unr-lcssa
	test	cl, 1
	je	.LBB2_56
.LBB2_55:                               # %vector.body373.epil
	vmovups	ymm4, ymmword ptr [r12 + 4*rdx]
	vmovups	ymm5, ymmword ptr [r12 + 4*rdx + 32]
	vmovups	ymm6, ymmword ptr [r12 + 4*rdx + 64]
	vmovups	ymm7, ymmword ptr [r12 + 4*rdx + 96]
	vxorps	xmm8, xmm8, xmm8
	vcmpltps	ymm7, ymm7, ymm8
	vpsubd	ymm3, ymm3, ymm7
	vcmpltps	ymm6, ymm6, ymm8
	vpsubd	ymm2, ymm2, ymm6
	vcmpltps	ymm5, ymm5, ymm8
	vpsubd	ymm1, ymm1, ymm5
	vcmpltps	ymm4, ymm4, ymm8
	vpsubd	ymm0, ymm0, ymm4
.LBB2_56:                               # %middle.block371
	vpaddd	ymm1, ymm1, ymm3
	vpaddd	ymm0, ymm0, ymm2
	vpaddd	ymm0, ymm0, ymm1
	vextracti128	xmm1, ymm0, 1
	vpaddd	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 78                  # xmm1 = xmm0[2,3,0,1]
	vpaddd	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 229                 # xmm1 = xmm0[1,1,2,3]
	vpaddd	xmm0, xmm0, xmm1
	vmovd	esi, xmm0
	cmp	rax, rdi
	je	.LBB2_59
.LBB2_57:                               # %for.body152.preheader391
	vpxor	xmm0, xmm0, xmm0
	.p2align	4, 0x90
.LBB2_58:                               # %for.body152
                                        # =>This Inner Loop Header: Depth=1
	xor	ecx, ecx
	vucomiss	xmm0, dword ptr [r12 + 4*rax]
	seta	cl
	add	esi, ecx
	inc	rax
	cmp	rdi, rax
	jne	.LBB2_58
.LBB2_59:                               # %for.end162
	mov	edi, offset .L.str.5
	xor	eax, eax
	vzeroupper
	call	printf
	mov	rdi, r14
	call	free
	mov	rdi, r15
	call	free
	mov	rdi, rbx
	call	free
	mov	rdi, qword ptr [rsp + 16]       # 8-byte Reload
	call	free
	mov	rdi, r12
	call	free
	xor	eax, eax
	add	rsp, 88
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.LBB2_51:
	.cfi_def_cfa_offset 144
	vpxor	xmm0, xmm0, xmm0
	xor	edx, edx
	vxorpd	xmm1, xmm1, xmm1
	vxorpd	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	test	cl, 1
	jne	.LBB2_55
	jmp	.LBB2_56
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s:\n"
	.size	.L.str, 5

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%s[%d][%d]:%f  "
	.size	.L.str.1, 16

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"seq elasped time(s): %.4f\n"
	.size	.L.str.3, 27

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"GFlops: %.4f\n"
	.size	.L.str.4, 14

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Errors: %d\n"
	.size	.L.str.5, 12

	.ident	"clang version 11.1.0 (https://github.com/llvm/llvm-project 3a8282376b6c2bb65a3bb580c10d4da1296d8df1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
