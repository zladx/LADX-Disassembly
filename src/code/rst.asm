; rst vectors are single-byte calls.

; Here, they're used as pseudoinstructions for bank management.
; This is not the only way the rst instructions can be used.


section "rst Bankswitch", rom0 [Bankswitch]
;	jp rst_Bankswitch
    jp   $28C0

section "rst FarCall", rom0 [FarCall]
;	jp rst_FarCall


section "Bankswitch", rom0

    db   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $C3, $6C, 4
    db   0, 0, 0, 0, 0, $C3, $88, 3, 0, 0, 0, 0, 0, $D9, 0, 0
    db   0, 0, 0, 0, 0, $C3, 8, 4, 0, 0, 0, 0, 0, $D9, 0, $21
    db   0, $69, $11, $A0, $89, $18, $16, $21, $30, $69, $11, $D0, $89, $18, $E, $21
    db   $D0, $49, $11, $D0, $89, $18, 6, $21, $A0, $49, $11, $A0, $89, 1, $30, 0
    db   $CD, $14, $29, $AF, $E0, $90, $E0, $92, $3E, $C, $EA, 0, $21, $C9, 0, 0
    db   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db   0, 0, 0, 0, 0, 0, 0, 0


;rst_Bankswitch:
;	ld [hTemp], a
;	ld a, l
;	ld [hTemp + 1], a
;	ld a, h
;	ld [hTemp + 2], a
;
;	pop hl
;	ld a, [hli]
;	push hl
;
;	ld [hRomBank], a
;	ld [MBC3RomBank], a
;
;	ld hl, hTemp + 2
;	ld a, [hld]
;	ld l, [hl]
;	ld h, a
;	ld a, [hTemp]
;	ret
;
;
;BankswitchHome:
;	ld [hRomBank], a
;	ld [MBC3RomBank], a
;	ret
;
;
;section "FarCall", rom0
;
;rst_FarCall:
;	push af
;	ld [hTemp], a
;	ld a, l
;	ld [hTemp + 1], a
;	ld a, h
;	ld [hTemp + 2], a
;	pop af
;
;	; Grab the return address.
;	pop hl
;	ld a, $c3 ; jp
;	ld [hCodeTemp + 0], a
;	ld a, [hli]
;	ld [hCodeTemp + 1], a
;	ld a, [hli]
;	ld [hCodeTemp + 2], a
;	ld a, [hli]
;	rst Bankswitch
;	; Put it back, skipping past the arguments.
;	push hl
;
;	ld a, [hRomBank]
;	push af
;
;	ld hl, hTemp + 2
;	ld a, [hld]
;	ld l, [hl]
;	ld h, a
;	ld a, [hTemp]
;
;	call hCodeTemp
;
;	push af
;	ld a, b
;	ld [hTemp], a
;	ld a, c
;	ld [hTemp + 1], a
;	pop af
;
;	pop bc
;
;	push af
;	ld a, b
;	rst Bankswitch
;	ld a, [hTemp]
;	ld b, a
;	ld a, [hTemp + 1]
;	ld c, a
;	pop af
;
;	ret

