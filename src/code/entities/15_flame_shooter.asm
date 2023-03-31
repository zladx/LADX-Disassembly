; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
FlameShooterSpriteVariants::
.variant0
    db $70, $02
    db $70, $22
.variant1
    db $72, $03
    db $72, $23

FlameShooterEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4D43: $21 $B0 $C2
    add  hl, bc                                   ; $4D46: $09
    ld   a, [hl]                                  ; $4D47: $7E
    and  a                                        ; $4D48: $A7
    jp   nz, label_015_4DB5                       ; $4D49: $C2 $B5 $4D

    ld   de, FlameShooterSpriteVariants           ; $4D4C: $11 $3B $4D
    call RenderActiveEntitySpritesPair            ; $4D4F: $CD $C0 $3B
    call GetEntityPrivateCountdown1               ; $4D52: $CD $00 $0C
    ld   e, $00                                   ; $4D55: $1E $00
    and  a                                        ; $4D57: $A7
    jr   z, .jr_4D5B                              ; $4D58: $28 $01

    inc  e                                        ; $4D5A: $1C

.jr_4D5B
    ld   a, e                                     ; $4D5B: $7B
    call SetEntitySpriteVariant                   ; $4D5C: $CD $0C $3B
    call ReturnIfNonInteractive_15                ; $4D5F: $CD $0D $7B
    ld   hl, wEntitiesInertiaTable                ; $4D62: $21 $D0 $C3
    add  hl, bc                                   ; $4D65: $09
    inc  [hl]                                     ; $4D66: $34
    ld   a, [hl]                                  ; $4D67: $7E
    and  $0F                                      ; $4D68: $E6 $0F
    jr   nz, .ret_4D9C                            ; $4D6A: $20 $30

    call GetEntityPrivateCountdown1               ; $4D6C: $CD $00 $0C
    ld   [hl], $08                                ; $4D6F: $36 $08

    ld   a, ENTITY_FLAME_SHOOTER                  ; $4D71: $3E $E2
    call SpawnNewEntity_trampoline                ; $4D73: $CD $86 $3B
    ret  c                                        ; $4D76: $D8

    ld   a, NOISE_SFX_BURSTING_FLAME              ; $4D77: $3E $12
    ldh  [hNoiseSfx], a                           ; $4D79: $E0 $F4
    ldh  a, [hMultiPurpose0]                      ; $4D7B: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4D7D: $21 $00 $C2
    add  hl, de                                   ; $4D80: $19
    ld   [hl], a                                  ; $4D81: $77
    ldh  a, [hMultiPurpose1]                      ; $4D82: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4D84: $21 $10 $C2
    add  hl, de                                   ; $4D87: $19
    add  $04                                      ; $4D88: $C6 $04
    ld   [hl], a                                  ; $4D8A: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4D8B: $21 $B0 $C2
    add  hl, de                                   ; $4D8E: $19
    inc  [hl]                                     ; $4D8F: $34
    ld   hl, wEntitiesSpeedYTable                 ; $4D90: $21 $50 $C2
    add  hl, de                                   ; $4D93: $19
    ld   [hl], $10                                ; $4D94: $36 $10
    ld   hl, wEntitiesTransitionCountdownTable    ; $4D96: $21 $E0 $C2
    add  hl, de                                   ; $4D99: $19
    ld   [hl], $30                                ; $4D9A: $36 $30

.ret_4D9C
    ret                                           ; $4D9C: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown045SpriteVariants::
.variant0
    db $78, $02
    db $78, $22
.variant1
    db $76, $02
    db $76, $22
.variant2
    db $74, $02
    db $74, $22

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown046SpriteVariants::
.variant0
    db $7A, $02
    db $7C, $02
.variant1
    db $7C, $22
    db $7A, $22

Data_015_4DB1::
    db   $FC, $04

Data_015_4DB3::
    db   $F4, $0C

label_015_4DB5:
    cp   $02                                      ; $4DB5: $FE $02
    jp   z, label_015_4E62                        ; $4DB7: $CA $62 $4E

    ldh  a, [hFrameCounter]                       ; $4DBA: $F0 $E7
    rla                                           ; $4DBC: $17
    rla                                           ; $4DBD: $17
    and  OAMF_PAL1                                ; $4DBE: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $4DC0: $E0 $ED
    ld   de, Unknown045SpriteVariants             ; $4DC2: $11 $9D $4D
    call RenderActiveEntitySpritesPair            ; $4DC5: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $4DC8: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $4DCB: $CD $56 $0C
    call label_3B70                               ; $4DCE: $CD $70 $3B
    ld   a, [wInvincibilityCounter]               ; $4DD1: $FA $C7 $DB
    push af                                       ; $4DD4: $F5
    call CheckLinkCollisionWithEnemy_trampoline   ; $4DD5: $CD $5A $3B
    pop  af                                       ; $4DD8: $F1
    ld   e, a                                     ; $4DD9: $5F
    ld   a, [wInvincibilityCounter]               ; $4DDA: $FA $C7 $DB
    cp   e                                        ; $4DDD: $BB
    jr   z, .jr_4DF2                              ; $4DDE: $28 $12

    cp   $20                                      ; $4DE0: $FE $20
    jr   c, .jr_4DF2                              ; $4DE2: $38 $0E

    ld   a, $1F                                   ; $4DE4: $3E $1F
    ld   [wInvincibilityCounter], a               ; $4DE6: $EA $C7 $DB
    ld   a, $30                                   ; $4DE9: $3E $30
    call GetVectorTowardsLink_trampoline          ; $4DEB: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $4DEE: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $4DF0: $E0 $9B

.jr_4DF2
    call UpdateEntityYPosWithSpeed_15             ; $4DF2: $CD $8B $7B
    ldh  a, [hActiveEntityState]                  ; $4DF5: $F0 $F0
    and  a                                        ; $4DF7: $A7
    jr   z, jr_015_4E49                           ; $4DF8: $28 $4F

    xor  a                                        ; $4DFA: $AF

.loop_4DFB
    ldh  [hMultiPurposeG], a                      ; $4DFB: $E0 $E8
    ld   a, ENTITY_FLAME_SHOOTER                  ; $4DFD: $3E $E2
    call SpawnNewEntity_trampoline                ; $4DFF: $CD $86 $3B
    jr   c, .jr_4E46                              ; $4E02: $38 $42

    ld   hl, wEntitiesPrivateState1Table          ; $4E04: $21 $B0 $C2
    add  hl, de                                   ; $4E07: $19
    ld   [hl], $02                                ; $4E08: $36 $02
    push bc                                       ; $4E0A: $C5
    ldh  a, [hMultiPurposeG]                      ; $4E0B: $F0 $E8
    ld   c, a                                     ; $4E0D: $4F
    ld   hl, wEntitiesSpriteVariantTable          ; $4E0E: $21 $B0 $C3
    add  hl, de                                   ; $4E11: $19
    ld   [hl], a                                  ; $4E12: $77
    ld   hl, Data_015_4DB1                        ; $4E13: $21 $B1 $4D
    add  hl, bc                                   ; $4E16: $09
    ldh  a, [hMultiPurpose0]                      ; $4E17: $F0 $D7
    add  [hl]                                     ; $4E19: $86
    ld   hl, wEntitiesPosXTable                   ; $4E1A: $21 $00 $C2
    add  hl, de                                   ; $4E1D: $19
    ld   [hl], a                                  ; $4E1E: $77
    ld   hl, Data_015_4DB3                        ; $4E1F: $21 $B3 $4D
    add  hl, bc                                   ; $4E22: $09
    ld   a, [hl]                                  ; $4E23: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4E24: $21 $40 $C2
    add  hl, de                                   ; $4E27: $19
    ld   [hl], a                                  ; $4E28: $77
    ldh  a, [hMultiPurpose1]                      ; $4E29: $F0 $D8
    add  $00                                      ; $4E2B: $C6 $00
    ld   hl, wEntitiesPosYTable                   ; $4E2D: $21 $10 $C2
    add  hl, de                                   ; $4E30: $19
    ld   [hl], a                                  ; $4E31: $77
    ld   hl, wEntitiesSpeedYTable                 ; $4E32: $21 $50 $C2
    add  hl, de                                   ; $4E35: $19
    ld   [hl], $0C                                ; $4E36: $36 $0C
    ld   hl, wEntitiesTransitionCountdownTable    ; $4E38: $21 $E0 $C2
    add  hl, de                                   ; $4E3B: $19
    ld   [hl], $20                                ; $4E3C: $36 $20
    pop  bc                                       ; $4E3E: $C1
    ldh  a, [hMultiPurposeG]                      ; $4E3F: $F0 $E8
    inc  a                                        ; $4E41: $3C
    cp   $02                                      ; $4E42: $FE $02
    jr   c, .loop_4DFB                            ; $4E44: $38 $B5

.jr_4E46
    jp   ClearEntityStatus_15                     ; $4E46: $C3 $31 $7C

jr_015_4E49:
    call GetEntityTransitionCountdown             ; $4E49: $CD $05 $0C
    jp   z, ClearEntityStatus_15                  ; $4E4C: $CA $31 $7C

    ld   hl, wEntitiesSpriteVariantTable          ; $4E4F: $21 $B0 $C3
    add  hl, bc                                   ; $4E52: $09
    cp   $10                                      ; $4E53: $FE $10
    jr   z, .jr_4E5B                              ; $4E55: $28 $04

    cp   $20                                      ; $4E57: $FE $20
    jr   nz, ret_015_4E61                         ; $4E59: $20 $06

.jr_4E5B
    ld   a, [hl]                                  ; $4E5B: $7E
    cp   $02                                      ; $4E5C: $FE $02
    jr   z, ret_015_4E61                          ; $4E5E: $28 $01

    inc  [hl]                                     ; $4E60: $34

ret_015_4E61:
    ret                                           ; $4E61: $C9

label_015_4E62:
    ldh  a, [hFrameCounter]                       ; $4E62: $F0 $E7
    rla                                           ; $4E64: $17
    rla                                           ; $4E65: $17
    and  OAMF_PAL1                                ; $4E66: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $4E68: $E0 $ED
    ld   de, Unknown046SpriteVariants             ; $4E6A: $11 $A9 $4D
    call RenderActiveEntitySpritesPair            ; $4E6D: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $4E70: $CD $0D $7B
    call UpdateEntityPosWithSpeed_15              ; $4E73: $CD $88 $7B
    call GetEntityTransitionCountdown             ; $4E76: $CD $05 $0C
    jp   z, ClearEntityStatus_15                  ; $4E79: $CA $31 $7C

    ret                                           ; $4E7C: $C9
