	.section	__TEXT,__text,regular,pure_instructions
	.intel_syntax noprefix
	.globl	_get_sel
	.p2align	4, 0x90
_get_sel:
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	call	L0$pb
L0$pb:
	pop	ecx
	mov	eax, dword ptr [ecx + SYM(test_dynamic_sel[CRATE_ID]::get_sel::CACHED_SEL, 0)-L0$pb]
	test	eax, eax
	je	LBB0_1
	add	esp, 8
	pop	ebp
	ret
LBB0_1:
	sub	esp, 8
	lea	eax, [ecx + l_anon.[ID].0-L0$pb]
	lea	ecx, [ecx + SYM(test_dynamic_sel[CRATE_ID]::get_sel::CACHED_SEL, 0)-L0$pb]
	push	eax
	push	ecx
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	add	esp, 24
	pop	ebp
	ret

	.globl	_get_same_sel
	.p2align	4, 0x90
_get_same_sel:
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	call	L1$pb
L1$pb:
	pop	ecx
	mov	eax, dword ptr [ecx + SYM(test_dynamic_sel[CRATE_ID]::get_same_sel::CACHED_SEL, 0)-L1$pb]
	test	eax, eax
	je	LBB1_1
	add	esp, 8
	pop	ebp
	ret
LBB1_1:
	sub	esp, 8
	lea	eax, [ecx + l_anon.[ID].0-L1$pb]
	lea	ecx, [ecx + SYM(test_dynamic_sel[CRATE_ID]::get_same_sel::CACHED_SEL, 0)-L1$pb]
	push	eax
	push	ecx
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	add	esp, 24
	pop	ebp
	ret

	.globl	_get_common_twice
	.p2align	4, 0x90
_get_common_twice:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	edi
	push	esi
	sub	esp, 12
	call	L2$pb
L2$pb:
	pop	ebx
	mov	edi, dword ptr [ebx + LSYM(objc2::__macro_helpers::common_selectors::alloc_sel::CACHED_SEL::GENERATED_ID, 0)$non_lazy_ptr-L2$pb]
	mov	esi, dword ptr [edi]
	test	esi, esi
	je	LBB2_1
	mov	edx, dword ptr [edi]
	test	edx, edx
	je	LBB2_3
LBB2_4:
	mov	eax, esi
	add	esp, 12
	pop	esi
	pop	edi
	pop	ebx
	pop	ebp
	ret
LBB2_1:
	sub	esp, 8
	lea	eax, [ebx + l_anon.[ID].1-L2$pb]
	push	eax
	push	edi
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	add	esp, 16
	mov	esi, eax
	mov	edx, dword ptr [edi]
	test	edx, edx
	jne	LBB2_4
LBB2_3:
	sub	esp, 8
	lea	eax, [ebx + l_anon.[ID].1-L2$pb]
	push	eax
	push	edi
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	add	esp, 16
	mov	edx, eax
	jmp	LBB2_4

	.globl	_get_different_sel
	.p2align	4, 0x90
_get_different_sel:
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	call	L3$pb
L3$pb:
	pop	ecx
	mov	eax, dword ptr [ecx + SYM(test_dynamic_sel[CRATE_ID]::get_different_sel::CACHED_SEL, 0)-L3$pb]
	test	eax, eax
	je	LBB3_1
	add	esp, 8
	pop	ebp
	ret
LBB3_1:
	sub	esp, 8
	lea	eax, [ecx + L_anon.[ID].2-L3$pb]
	lea	ecx, [ecx + SYM(test_dynamic_sel[CRATE_ID]::get_different_sel::CACHED_SEL, 0)-L3$pb]
	push	eax
	push	ecx
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	add	esp, 24
	pop	ebp
	ret

	.globl	_unused_sel
	.p2align	4, 0x90
_unused_sel:
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	call	L4$pb
L4$pb:
	pop	eax
	mov	ecx, dword ptr [eax + SYM(test_dynamic_sel[CRATE_ID]::unused_sel::CACHED_SEL, 0)-L4$pb]
	test	ecx, ecx
	je	LBB4_1
	add	esp, 8
	pop	ebp
	ret
LBB4_1:
	sub	esp, 8
	lea	ecx, [eax + l_anon.[ID].3-L4$pb]
	lea	eax, [eax + SYM(test_dynamic_sel[CRATE_ID]::unused_sel::CACHED_SEL, 0)-L4$pb]
	push	ecx
	push	eax
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	add	esp, 24
	pop	ebp
	ret

	.globl	_use_fns
	.p2align	4, 0x90
_use_fns:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	edi
	push	esi
	sub	esp, 12
	call	L5$pb
L5$pb:
	pop	edi
	mov	ecx, dword ptr [edi + SYM(test_dynamic_sel[CRATE_ID]::get_sel::CACHED_SEL, 0)-L5$pb]
	test	ecx, ecx
	je	LBB5_1
	mov	edx, dword ptr [edi + SYM(test_dynamic_sel[CRATE_ID]::get_same_sel::CACHED_SEL, 0)-L5$pb]
	test	edx, edx
	je	LBB5_3
LBB5_4:
	mov	ebx, dword ptr [ebp + 8]
	mov	esi, dword ptr [edi + SYM(test_dynamic_sel[CRATE_ID]::get_different_sel::CACHED_SEL, 0)-L5$pb]
	test	esi, esi
	je	LBB5_5
LBB5_6:
	mov	eax, dword ptr [edi + SYM(test_dynamic_sel[CRATE_ID]::use_fns::CACHED_SEL, 0)-L5$pb]
	test	eax, eax
	je	LBB5_7
LBB5_8:
	mov	dword ptr [ebx], ecx
	mov	dword ptr [ebx + 4], edx
	mov	dword ptr [ebx + 8], esi
	mov	dword ptr [ebx + 12], eax
	mov	eax, ebx
	add	esp, 12
	pop	esi
	pop	edi
	pop	ebx
	pop	ebp
	ret	4
LBB5_1:
	sub	esp, 8
	lea	eax, [edi + l_anon.[ID].0-L5$pb]
	lea	ecx, [edi + SYM(test_dynamic_sel[CRATE_ID]::get_sel::CACHED_SEL, 0)-L5$pb]
	push	eax
	push	ecx
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	add	esp, 16
	mov	ecx, eax
	mov	edx, dword ptr [edi + SYM(test_dynamic_sel[CRATE_ID]::get_same_sel::CACHED_SEL, 0)-L5$pb]
	test	edx, edx
	jne	LBB5_4
LBB5_3:
	sub	esp, 8
	lea	eax, [edi + l_anon.[ID].0-L5$pb]
	mov	esi, ecx
	lea	ecx, [edi + SYM(test_dynamic_sel[CRATE_ID]::get_same_sel::CACHED_SEL, 0)-L5$pb]
	push	eax
	push	ecx
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	mov	ecx, esi
	add	esp, 16
	mov	edx, eax
	mov	ebx, dword ptr [ebp + 8]
	mov	esi, dword ptr [edi + SYM(test_dynamic_sel[CRATE_ID]::get_different_sel::CACHED_SEL, 0)-L5$pb]
	test	esi, esi
	jne	LBB5_6
LBB5_5:
	sub	esp, 8
	lea	eax, [edi + L_anon.[ID].2-L5$pb]
	mov	dword ptr [ebp - 16], ecx
	lea	ecx, [edi + SYM(test_dynamic_sel[CRATE_ID]::get_different_sel::CACHED_SEL, 0)-L5$pb]
	push	eax
	push	ecx
	mov	esi, edx
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	mov	edx, esi
	mov	ecx, dword ptr [ebp - 16]
	add	esp, 16
	mov	esi, eax
	mov	eax, dword ptr [edi + SYM(test_dynamic_sel[CRATE_ID]::use_fns::CACHED_SEL, 0)-L5$pb]
	test	eax, eax
	jne	LBB5_8
LBB5_7:
	sub	esp, 8
	lea	eax, [edi + l_anon.[ID].4-L5$pb]
	mov	dword ptr [ebp - 16], ecx
	lea	ecx, [edi + SYM(test_dynamic_sel[CRATE_ID]::use_fns::CACHED_SEL, 0)-L5$pb]
	push	eax
	push	ecx
	mov	edi, edx
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	mov	edx, edi
	mov	ecx, dword ptr [ebp - 16]
	add	esp, 16
	jmp	LBB5_8

	.globl	_use_same_twice
	.p2align	4, 0x90
_use_same_twice:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	edi
	push	esi
	sub	esp, 12
	call	L6$pb
L6$pb:
	pop	ebx
	mov	esi, dword ptr [ebp + 8]
	mov	edi, dword ptr [ebx + SYM(test_dynamic_sel[CRATE_ID]::get_sel::CACHED_SEL, 0)-L6$pb]
	test	edi, edi
	je	LBB6_1
	mov	eax, dword ptr [ebx + SYM(test_dynamic_sel[CRATE_ID]::get_sel::CACHED_SEL, 0)-L6$pb]
	test	eax, eax
	je	LBB6_3
LBB6_4:
	mov	dword ptr [esi], edi
	mov	dword ptr [esi + 4], eax
	mov	eax, esi
	add	esp, 12
	pop	esi
	pop	edi
	pop	ebx
	pop	ebp
	ret	4
LBB6_1:
	sub	esp, 8
	lea	eax, [ebx + l_anon.[ID].0-L6$pb]
	lea	ecx, [ebx + SYM(test_dynamic_sel[CRATE_ID]::get_sel::CACHED_SEL, 0)-L6$pb]
	push	eax
	push	ecx
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	add	esp, 16
	mov	edi, eax
	mov	eax, dword ptr [ebx + SYM(test_dynamic_sel[CRATE_ID]::get_sel::CACHED_SEL, 0)-L6$pb]
	test	eax, eax
	jne	LBB6_4
LBB6_3:
	sub	esp, 8
	lea	eax, [ebx + l_anon.[ID].0-L6$pb]
	lea	ecx, [ebx + SYM(test_dynamic_sel[CRATE_ID]::get_sel::CACHED_SEL, 0)-L6$pb]
	push	eax
	push	ecx
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	add	esp, 16
	jmp	LBB6_4

	.globl	_use_in_loop
	.p2align	4, 0x90
_use_in_loop:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	edi
	push	esi
	sub	esp, 12
	call	L7$pb
L7$pb:
	pop	esi
	mov	edi, dword ptr [ebp + 8]
	test	edi, edi
	je	LBB7_5
	lea	ebx, [esi + SYM(test_dynamic_sel[CRATE_ID]::use_in_loop::CACHED_SEL, 0)-L7$pb]
	jmp	LBB7_2
	.p2align	4, 0x90
LBB7_4:
	dec	edi
	je	LBB7_5
LBB7_2:
	mov	eax, dword ptr [esi + SYM(test_dynamic_sel[CRATE_ID]::use_in_loop::CACHED_SEL, 0)-L7$pb]
	test	eax, eax
	jne	LBB7_4
	sub	esp, 8
	lea	eax, [esi + l_anon.[ID].5-L7$pb]
	push	eax
	push	ebx
	call	SYM(objc2::__macro_helpers::cache::CachedSel::fetch::GENERATED_ID, 0)
	add	esp, 16
	jmp	LBB7_4
LBB7_5:
	add	esp, 12
	pop	esi
	pop	edi
	pop	ebx
	pop	ebp
	ret

	.section	__TEXT,__const
l_anon.[ID].0:
	.asciz	"simple"

l_anon.[ID].1:
	.asciz	"alloc"

	.section	__TEXT,__literal16,16byte_literals
L_anon.[ID].2:
	.asciz	"i:am:different:"

	.section	__TEXT,__const
l_anon.[ID].3:
	.asciz	"unused"

l_anon.[ID].4:
	.asciz	"fourthSel"

l_anon.[ID].5:
	.asciz	"loopedSelector"

.zerofill __DATA,__bss,SYM(test_dynamic_sel[CRATE_ID]::get_sel::CACHED_SEL, 0),4,2
.zerofill __DATA,__bss,SYM(test_dynamic_sel[CRATE_ID]::get_same_sel::CACHED_SEL, 0),4,2
.zerofill __DATA,__bss,SYM(test_dynamic_sel[CRATE_ID]::get_different_sel::CACHED_SEL, 0),4,2
.zerofill __DATA,__bss,SYM(test_dynamic_sel[CRATE_ID]::unused_sel::CACHED_SEL, 0),4,2
.zerofill __DATA,__bss,SYM(test_dynamic_sel[CRATE_ID]::use_fns::CACHED_SEL, 0),4,2
.zerofill __DATA,__bss,SYM(test_dynamic_sel[CRATE_ID]::use_in_loop::CACHED_SEL, 0),4,2
	.section	__IMPORT,__pointers,non_lazy_symbol_pointers
LSYM(objc2::__macro_helpers::common_selectors::alloc_sel::CACHED_SEL::GENERATED_ID, 0)$non_lazy_ptr:
	.indirect_symbol	SYM(objc2::__macro_helpers::common_selectors::alloc_sel::CACHED_SEL::GENERATED_ID, 0)
	.long	0

.subsections_via_symbols
