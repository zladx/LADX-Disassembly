; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
FlameShooterSpriteVariants::
.variant0
    db $70, $02
    db $70, $22
.variant1
    db $72, $03
    db $72, $23

FlameShooterEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 15:4D43 $21 $B0 $C2
    add  hl, bc                                   ;; 15:4D46 $09
    ld   a, [hl]                                  ;; 15:4D47 $7E
    and  a                                        ;; 15:4D48 $A7
    jp   nz, label_015_4DB5                       ;; 15:4D49 $C2 $B5 $4D

    ld   de, FlameShooterSpriteVariants           ;; 15:4D4C $11 $3B $4D
    call RenderActiveEntitySpritesPair            ;; 15:4D4F $CD $C0 $3B
    call GetEntityPrivateCountdown1               ;; 15:4D52 $CD $00 $0C
    ld   e, $00                                   ;; 15:4D55 $1E $00
    and  a                                        ;; 15:4D57 $A7
    jr   z, .jr_4D5B                              ;; 15:4D58 $28 $01

    inc  e                                        ;; 15:4D5A $1C

.jr_4D5B
    ld   a, e                                     ;; 15:4D5B $7B
    call SetEntitySpriteVariant                   ;; 15:4D5C $CD $0C $3B
    call ReturnIfNonInteractive_15                ;; 15:4D5F $CD $0D $7B
    ld   hl, wEntitiesInertiaTable                ;; 15:4D62 $21 $D0 $C3
    add  hl, bc                                   ;; 15:4D65 $09
    inc  [hl]                                     ;; 15:4D66 $34
    ld   a, [hl]                                  ;; 15:4D67 $7E
    and  $0F                                      ;; 15:4D68 $E6 $0F
    jr   nz, .ret_4D9C                            ;; 15:4D6A $20 $30

    call GetEntityPrivateCountdown1               ;; 15:4D6C $CD $00 $0C
    ld   [hl], $08                                ;; 15:4D6F $36 $08

    ld   a, ENTITY_FLAME_SHOOTER                  ;; 15:4D71 $3E $E2
    call SpawnNewEntity_trampoline                ;; 15:4D73 $CD $86 $3B
    ret  c                                        ;; 15:4D76 $D8

    ld   a, NOISE_SFX_BURSTING_FLAME              ;; 15:4D77 $3E $12
    ldh  [hNoiseSfx], a                           ;; 15:4D79 $E0 $F4
    ldh  a, [hMultiPurpose0]                      ;; 15:4D7B $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 15:4D7D $21 $00 $C2
    add  hl, de                                   ;; 15:4D80 $19
    ld   [hl], a                                  ;; 15:4D81 $77
    ldh  a, [hMultiPurpose1]                      ;; 15:4D82 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 15:4D84 $21 $10 $C2
    add  hl, de                                   ;; 15:4D87 $19
    add  $04                                      ;; 15:4D88 $C6 $04
    ld   [hl], a                                  ;; 15:4D8A $77
    ld   hl, wEntitiesPrivateState1Table          ;; 15:4D8B $21 $B0 $C2
    add  hl, de                                   ;; 15:4D8E $19
    inc  [hl]                                     ;; 15:4D8F $34
    ld   hl, wEntitiesSpeedYTable                 ;; 15:4D90 $21 $50 $C2
    add  hl, de                                   ;; 15:4D93 $19
    ld   [hl], $10                                ;; 15:4D94 $36 $10
    ld   hl, wEntitiesTransitionCountdownTable    ;; 15:4D96 $21 $E0 $C2
    add  hl, de                                   ;; 15:4D99 $19
    ld   [hl], $30                                ;; 15:4D9A $36 $30

.ret_4D9C
    ret                                           ;; 15:4D9C $C9

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
    cp   $02                                      ;; 15:4DB5 $FE $02
    jp   z, label_015_4E62                        ;; 15:4DB7 $CA $62 $4E

    ldh  a, [hFrameCounter]                       ;; 15:4DBA $F0 $E7
    rla                                           ;; 15:4DBC $17
    rla                                           ;; 15:4DBD $17
    and  OAMF_PAL1                                ;; 15:4DBE $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ;; 15:4DC0 $E0 $ED
    ld   de, Unknown045SpriteVariants             ;; 15:4DC2 $11 $9D $4D
    call RenderActiveEntitySpritesPair            ;; 15:4DC5 $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:4DC8 $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ;; 15:4DCB $CD $56 $0C
    call label_3B70                               ;; 15:4DCE $CD $70 $3B
    ld   a, [wInvincibilityCounter]               ;; 15:4DD1 $FA $C7 $DB
    push af                                       ;; 15:4DD4 $F5
    call CheckLinkCollisionWithEnemy_trampoline   ;; 15:4DD5 $CD $5A $3B
    pop  af                                       ;; 15:4DD8 $F1
    ld   e, a                                     ;; 15:4DD9 $5F
    ld   a, [wInvincibilityCounter]               ;; 15:4DDA $FA $C7 $DB
    cp   e                                        ;; 15:4DDD $BB
    jr   z, .jr_4DF2                              ;; 15:4DDE $28 $12

    cp   $20                                      ;; 15:4DE0 $FE $20
    jr   c, .jr_4DF2                              ;; 15:4DE2 $38 $0E

    ld   a, $1F                                   ;; 15:4DE4 $3E $1F
    ld   [wInvincibilityCounter], a               ;; 15:4DE6 $EA $C7 $DB
    ld   a, $30                                   ;; 15:4DE9 $3E $30
    call GetVectorTowardsLink_trampoline          ;; 15:4DEB $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 15:4DEE $F0 $D7
    ldh  [hLinkSpeedY], a                         ;; 15:4DF0 $E0 $9B

.jr_4DF2
    call UpdateEntityYPosWithSpeed_15             ;; 15:4DF2 $CD $8B $7B
    ldh  a, [hActiveEntityState]                  ;; 15:4DF5 $F0 $F0
    and  a                                        ;; 15:4DF7 $A7
    jr   z, jr_015_4E49                           ;; 15:4DF8 $28 $4F

    xor  a                                        ;; 15:4DFA $AF

.loop_4DFB
    ldh  [hMultiPurposeG], a                      ;; 15:4DFB $E0 $E8
    ld   a, ENTITY_FLAME_SHOOTER                  ;; 15:4DFD $3E $E2
    call SpawnNewEntity_trampoline                ;; 15:4DFF $CD $86 $3B
    jr   c, .jr_4E46                              ;; 15:4E02 $38 $42

    ld   hl, wEntitiesPrivateState1Table          ;; 15:4E04 $21 $B0 $C2
    add  hl, de                                   ;; 15:4E07 $19
    ld   [hl], $02                                ;; 15:4E08 $36 $02
    push bc                                       ;; 15:4E0A $C5
    ldh  a, [hMultiPurposeG]                      ;; 15:4E0B $F0 $E8
    ld   c, a                                     ;; 15:4E0D $4F
    ld   hl, wEntitiesSpriteVariantTable          ;; 15:4E0E $21 $B0 $C3
    add  hl, de                                   ;; 15:4E11 $19
    ld   [hl], a                                  ;; 15:4E12 $77
    ld   hl, Data_015_4DB1                        ;; 15:4E13 $21 $B1 $4D
    add  hl, bc                                   ;; 15:4E16 $09
    ldh  a, [hMultiPurpose0]                      ;; 15:4E17 $F0 $D7
    add  [hl]                                     ;; 15:4E19 $86
    ld   hl, wEntitiesPosXTable                   ;; 15:4E1A $21 $00 $C2
    add  hl, de                                   ;; 15:4E1D $19
    ld   [hl], a                                  ;; 15:4E1E $77
    ld   hl, Data_015_4DB3                        ;; 15:4E1F $21 $B3 $4D
    add  hl, bc                                   ;; 15:4E22 $09
    ld   a, [hl]                                  ;; 15:4E23 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4E24 $21 $40 $C2
    add  hl, de                                   ;; 15:4E27 $19
    ld   [hl], a                                  ;; 15:4E28 $77
    ldh  a, [hMultiPurpose1]                      ;; 15:4E29 $F0 $D8
    add  $00                                      ;; 15:4E2B $C6 $00
    ld   hl, wEntitiesPosYTable                   ;; 15:4E2D $21 $10 $C2
    add  hl, de                                   ;; 15:4E30 $19
    ld   [hl], a                                  ;; 15:4E31 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 15:4E32 $21 $50 $C2
    add  hl, de                                   ;; 15:4E35 $19
    ld   [hl], $0C                                ;; 15:4E36 $36 $0C
    ld   hl, wEntitiesTransitionCountdownTable    ;; 15:4E38 $21 $E0 $C2
    add  hl, de                                   ;; 15:4E3B $19
    ld   [hl], $20                                ;; 15:4E3C $36 $20
    pop  bc                                       ;; 15:4E3E $C1
    ldh  a, [hMultiPurposeG]                      ;; 15:4E3F $F0 $E8
    inc  a                                        ;; 15:4E41 $3C
    cp   $02                                      ;; 15:4E42 $FE $02
    jr   c, .loop_4DFB                            ;; 15:4E44 $38 $B5

.jr_4E46
    jp   ClearEntityStatus_15                     ;; 15:4E46 $C3 $31 $7C

jr_015_4E49:
    call GetEntityTransitionCountdown             ;; 15:4E49 $CD $05 $0C
    jp   z, ClearEntityStatus_15                  ;; 15:4E4C $CA $31 $7C

    ld   hl, wEntitiesSpriteVariantTable          ;; 15:4E4F $21 $B0 $C3
    add  hl, bc                                   ;; 15:4E52 $09
    cp   $10                                      ;; 15:4E53 $FE $10
    jr   z, .jr_4E5B                              ;; 15:4E55 $28 $04

    cp   $20                                      ;; 15:4E57 $FE $20
    jr   nz, ret_015_4E61                         ;; 15:4E59 $20 $06

.jr_4E5B
    ld   a, [hl]                                  ;; 15:4E5B $7E
    cp   $02                                      ;; 15:4E5C $FE $02
    jr   z, ret_015_4E61                          ;; 15:4E5E $28 $01

    inc  [hl]                                     ;; 15:4E60 $34

ret_015_4E61:
    ret                                           ;; 15:4E61 $C9

label_015_4E62:
    ldh  a, [hFrameCounter]                       ;; 15:4E62 $F0 $E7
    rla                                           ;; 15:4E64 $17
    rla                                           ;; 15:4E65 $17
    and  OAMF_PAL1                                ;; 15:4E66 $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ;; 15:4E68 $E0 $ED
    ld   de, Unknown046SpriteVariants             ;; 15:4E6A $11 $A9 $4D
    call RenderActiveEntitySpritesPair            ;; 15:4E6D $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:4E70 $CD $0D $7B
    call UpdateEntityPosWithSpeed_15              ;; 15:4E73 $CD $88 $7B
    call GetEntityTransitionCountdown             ;; 15:4E76 $CD $05 $0C
    jp   z, ClearEntityStatus_15                  ;; 15:4E79 $CA $31 $7C

    ret                                           ;; 15:4E7C $C9
