Data_003_69AA::
    db   $36, $02, $36, $22, $36, $12, $36, $32   ; $69AA

MagicRodFireballEntityHandler::
    ld   hl, wActiveProjectileCount               ; $69B2: $21 $4D $C1
    inc  [hl]                                     ; $69B5: $34
    ld   a, $0A                                   ; $69B6: $3E $0A
    ld   [wC19E], a                               ; $69B8: $EA $9E $C1
    call func_003_75A2                            ; $69BB: $CD $A2 $75
    ldh  a, [hFrameCounter]                       ; $69BE: $F0 $E7
    rra                                           ; $69C0: $1F
    rra                                           ; $69C1: $1F
    rra                                           ; $69C2: $1F
    and  $01                                      ; $69C3: $E6 $01
    ld   hl, wEntitiesSpriteVariantTable               ; $69C5: $21 $B0 $C3
    add  hl, bc                                   ; $69C8: $09
    ld   [hl], a                                  ; $69C9: $77
    call GetEntityPrivateCountdown1                                      ; $69CA: $CD $00 $0C
    jr   z, jr_003_69D9                           ; $69CD: $28 $0A

    dec  a                                        ; $69CF: $3D
    jp   z, UnloadEntity                          ; $69D0: $CA $8D $3F

    ld   de, EntityExplosionDisplayList           ; $69D3: $11 $44 $4C
    jp   RenderActiveEntitySpritesPair            ; $69D6: $C3 $C0 $3B

jr_003_69D9:
    ld   de, Data_003_69AA                        ; $69D9: $11 $AA $69
    call func_003_6AD7                            ; $69DC: $CD $D7 $6A
    call ReturnIfNonInteractive_03                ; $69DF: $CD $78 $7F
    ld   a, [wIsIndoor]                           ; $69E2: $FA $A5 $DB
    and  a                                        ; $69E5: $A7
    ldh  a, [hObjectUnderEntity]                  ; $69E6: $F0 $AF
    jr   z, jr_003_69F0                           ; $69E8: $28 $06

    cp   $8A                                      ; $69EA: $FE $8A
    jr   z, jr_003_69F8                           ; $69EC: $28 $0A

    jr   jr_003_6A1D                              ; $69EE: $18 $2D

jr_003_69F0:
    cp   $D3                                      ; $69F0: $FE $D3
    jr   z, jr_003_69F8                           ; $69F2: $28 $04

    cp   $5C                                      ; $69F4: $FE $5C
    jr   nz, jr_003_6A1D                          ; $69F6: $20 $25

jr_003_69F8:
    ld   hl, wEntitiesCollisionsTable             ; $69F8: $21 $A0 $C2
    add  hl, bc                                   ; $69FB: $09
    ld   [hl], b                                  ; $69FC: $70
    call GetEntityPrivateCountdown1                                      ; $69FD: $CD $00 $0C
    ld   [hl], b                                  ; $6A00: $70
    ldh  a, [hMultiPurposeH]                               ; $6A01: $F0 $E9
    ld   e, a                                     ; $6A03: $5F
    ld   d, b                                     ; $6A04: $50
    call func_014_5526_trampoline                 ; $6A05: $CD $78 $21
    ldh  a, [hIntersectedObjectLeft]              ; $6A08: $F0 $CE
    add  $08                                      ; $6A0A: $C6 $08
    ldh  [hMultiPurpose0], a                      ; $6A0C: $E0 $D7
    ldh  a, [hIntersectedObjectTop]               ; $6A0E: $F0 $CD
    add  $10                                      ; $6A10: $C6 $10
    ldh  [hMultiPurpose1], a                      ; $6A12: $E0 $D8
    ld   a, $08                                   ; $6A14: $3E $08
    call AddTranscientVfx                         ; $6A16: $CD $C7 $0C
    ld   a, $13                                   ; $6A19: $3E $13
    ldh  [hNoiseSfx], a                            ; $6A1B: $E0 $F4

ret_003_6A1D:
    ret                                           ; $6A1D: $C9
