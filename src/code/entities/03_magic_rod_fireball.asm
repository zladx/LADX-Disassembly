; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MagicRodFireballSpriteVariants::
.variant0 ;; 03:69AA
    db $36, OAM_GBC_PAL_2 | OAMF_PAL0
    db $36, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1 ;; 03:69AE
    db $36, OAM_GBC_PAL_2 | OAMF_PAL1
    db $36, OAM_GBC_PAL_2 | OAMF_PAL1 | OAMF_XFLIP

MagicRodFireballEntityHandler::
    ld   hl, wActiveProjectileCount               ;; 03:69B2 $21 $4D $C1
    inc  [hl]                                     ;; 03:69B5 $34
    ld   a, DAMAGE_TYPE_MAGIC_ROD                 ;; 03:69B6 $3E $0A
    ld   [wAttackDamageType], a                   ;; 03:69B8 $EA $9E $C1
    call func_003_75A2                            ;; 03:69BB $CD $A2 $75
    ldh  a, [hFrameCounter]                       ;; 03:69BE $F0 $E7
    rra                                           ;; 03:69C0 $1F
    rra                                           ;; 03:69C1 $1F
    rra                                           ;; 03:69C2 $1F
    and  $01                                      ;; 03:69C3 $E6 $01
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:69C5 $21 $B0 $C3
    add  hl, bc                                   ;; 03:69C8 $09
    ld   [hl], a                                  ;; 03:69C9 $77
    call GetEntityPrivateCountdown1               ;; 03:69CA $CD $00 $0C
    jr   z, .beforeHittingWall                    ;; 03:69CD $28 $0A

    ; If the fireball has hit a wall, just draw fire.
    dec  a                                        ;; 03:69CF $3D
    jp   z, UnloadEntity                          ;; 03:69D0 $CA $8D $3F

    ld   de, FireSpriteVariants                   ;; 03:69D3 $11 $44 $4C
    jp   RenderActiveEntitySpritesPair            ;; 03:69D6 $C3 $C0 $3B

.beforeHittingWall
    ld   de, MagicRodFireballSpriteVariants       ;; 03:69D9 $11 $AA $69
    call ArrowRenderAndMove.skipLoadingSprites    ;; 03:69DC $CD $D7 $6A
    call ReturnIfNonInteractive_03                ;; 03:69DF $CD $78 $7F
    ld   a, [wIsIndoor]                           ;; 03:69E2 $FA $A5 $DB
    and  a                                        ;; 03:69E5 $A7
    ldh  a, [hObjectUnderEntity]                  ;; 03:69E6 $F0 $AF
    jr   z, .outdoors                             ;; 03:69E8 $28 $06

    cp   OBJECT_FROZEN_BLOCK                      ;; 03:69EA $FE $8A
    jr   z, .burnObject                           ;; 03:69EC $28 $0A

    jr   .return                                  ;; 03:69EE $18 $2D

.outdoors
    cp   OBJECT_BUSH_GROUND_STAIRS                ;; 03:69F0 $FE $D3
    jr   z, .burnObject                           ;; 03:69F2 $28 $04

    cp   OBJECT_BUSH                              ;; 03:69F4 $FE $5C
    jr   nz, .return                              ;; 03:69F6 $20 $25

.burnObject
    ld   hl, wEntitiesCollisionsTable             ;; 03:69F8 $21 $A0 $C2
    add  hl, bc                                   ;; 03:69FB $09
    ld   [hl], b                                  ;; 03:69FC $70
    call GetEntityPrivateCountdown1               ;; 03:69FD $CD $00 $0C
    ld   [hl], b                                  ;; 03:6A00 $70
    ldh  a, [hIndexOfObjectBelowLink]             ;; 03:6A01 $F0 $E9
    ld   e, a                                     ;; 03:6A03 $5F
    ld   d, b                                     ;; 03:6A04 $50
    call RevealObjectUnderObject_trampoline       ;; 03:6A05 $CD $78 $21
    ldh  a, [hIntersectedObjectLeft]              ;; 03:6A08 $F0 $CE
    add  $08                                      ;; 03:6A0A $C6 $08
    ldh  [hMultiPurpose0], a                      ;; 03:6A0C $E0 $D7
    ldh  a, [hIntersectedObjectTop]               ;; 03:6A0E $F0 $CD
    add  $10                                      ;; 03:6A10 $C6 $10
    ldh  [hMultiPurpose1], a                      ;; 03:6A12 $E0 $D8
    ld   a, TRANSCIENT_VFX_SMOKE                  ;; 03:6A14 $3E $08
    call AddTranscientVfx                         ;; 03:6A16 $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ;; 03:6A19 $3E $13
    ldh  [hNoiseSfx], a                           ;; 03:6A1B $E0 $F4

.return
    ret                                           ;; 03:6A1D $C9
