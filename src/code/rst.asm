; rst vectors are single-byte calls.

; Here, they're used as pseudoinstructions for bank management.
; This is not the only way the rst instructions can be used.


section "rst Bankswitch", rom0 [Bankswitch]
	jp rst_Bankswitch

section "rst FarCall", rom0 [FarCall]
	jp rst_FarCall


section "Bankswitch", rom0

rst_Bankswitch:
	ld [hTemp], a
	ld a, l
	ld [hTemp + 1], a
	ld a, h
	ld [hTemp + 2], a

	pop hl
	ld a, [hli]
	push hl

	ld [hRomBank], a
	ld [MBC3RomBank], a

	ld hl, hTemp + 2
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, [hTemp]
	ret


BankswitchHome:
	ld [hRomBank], a
	ld [MBC3RomBank], a
	ret


section "FarCall", rom0

rst_FarCall:
	push af
	ld [hTemp], a
	ld a, l
	ld [hTemp + 1], a
	ld a, h
	ld [hTemp + 2], a
	pop af

	; Grab the return address.
	pop hl
	ld a, $c3 ; jp
	ld [hCodeTemp + 0], a
	ld a, [hli]
	ld [hCodeTemp + 1], a
	ld a, [hli]
	ld [hCodeTemp + 2], a
	ld a, [hli]
	rst Bankswitch
	; Put it back, skipping past the arguments.
	push hl

	ld a, [hRomBank]
	push af

	ld hl, hTemp + 2
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, [hTemp]

	call hCodeTemp

	push af
	ld a, b
	ld [hTemp], a
	ld a, c
	ld [hTemp + 1], a
	pop af

	pop bc

	push af
	ld a, b
	rst Bankswitch
	ld a, [hTemp]
	ld b, a
	ld a, [hTemp + 1]
	ld c, a
	pop af

	ret
