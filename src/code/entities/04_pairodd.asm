; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PairoddSpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $74, OAM_GBC_PAL_1 | OAMF_PAL0
    db $74, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $00, OAM_GBC_PAL_0 | OAMF_PAL0
    db $00, OAM_GBC_PAL_0 | OAMF_PAL0
.variant4
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0
.variant6
    db $76, OAM_GBC_PAL_1 | OAMF_PAL0
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0
.variant7
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $76, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

PairoddEntityHandler::
    ; If the sprite variant is 3, draw sprite variants 6 and 7 side-by-side instead.
    ldh  a, [hActiveEntitySpriteVariant]          ;; 04:5DF1 $F0 $F1
    cp   $03                                      ;; 04:5DF3 $FE $03
    jr   nz, .spriteVariant3SpecialCaseEnd        ;; 04:5DF5 $20 $25

    ldh  a, [hActiveEntityPosX]                   ;; 04:5DF7 $F0 $EE
    sub  $08                                      ;; 04:5DF9 $D6 $08
    ldh  [hActiveEntityPosX], a                   ;; 04:5DFB $E0 $EE
    ld   a, $06                                   ;; 04:5DFD $3E $06
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:5DFF $E0 $F1
    ld   de, PairoddSpriteVariants                ;; 04:5E01 $11 $D1 $5D
    call RenderActiveEntitySpritesPair            ;; 04:5E04 $CD $C0 $3B
    ldh  a, [hActiveEntityPosX]                   ;; 04:5E07 $F0 $EE
    add  $10                                      ;; 04:5E09 $C6 $10
    ldh  [hActiveEntityPosX], a                   ;; 04:5E0B $E0 $EE
    ld   a, $07                                   ;; 04:5E0D $3E $07
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:5E0F $E0 $F1
    ld   de, PairoddSpriteVariants                ;; 04:5E11 $11 $D1 $5D
    call RenderActiveEntitySpritesPair            ;; 04:5E14 $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 04:5E17 $CD $8A $3D
    jr   .renderEnd                               ;; 04:5E1A $18 $06

.spriteVariant3SpecialCaseEnd
    ld   de, PairoddSpriteVariants                ;; 04:5E1C $11 $D1 $5D
    call RenderActiveEntitySpritesPair            ;; 04:5E1F $CD $C0 $3B

.renderEnd
    call ReturnIfNonInteractive_04                ;; 04:5E22 $CD $A3 $7F
    call ApplyRecoilIfNeeded_04                   ;; 04:5E25 $CD $80 $6D

    ldh  a, [hActiveEntityState]                  ;; 04:5E28 $F0 $F0
    JP_TABLE                                      ;; 04:5E2A
._00 dw PairoddRestingHandler                     ;; 04:5E2B
._01 dw PairoddDisappearingHandler                ;; 04:5E2D
._02 dw PairoddReappearingHandler                 ;; 04:5E2F

PairoddRestingHandler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:5E31 $CD $39 $3B
    ldh  a, [hFrameCounter]                       ;; 04:5E34 $F0 $E7
    rra                                           ;; 04:5E36 $1F
    rra                                           ;; 04:5E37 $1F
    rra                                           ;; 04:5E38 $1F
    rra                                           ;; 04:5E39 $1F
    and  $01                                      ;; 04:5E3A $E6 $01
    call SetEntitySpriteVariant                   ;; 04:5E3C $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 04:5E3F $CD $05 $0C
    cp   $18                                      ;; 04:5E42 $FE $18
    jr   nz, .projectileEnd                       ;; 04:5E44 $20 $04

    call SpawnPairoddProjectile                   ;; 04:5E46 $CD $C6 $5E
    and  a                                        ;; 04:5E49 $A7

.projectileEnd
    jr   nc, .return                              ;; 04:5E4A $30 $26

    call GetEntityXDistanceToLink_04              ;; 04:5E4C $CD $35 $6E
    add  $20                                      ;; 04:5E4F $C6 $20
    cp   $40                                      ;; 04:5E51 $FE $40
    jr   nc, .return                              ;; 04:5E53 $30 $1D

    call GetEntityYDistanceToLink_04              ;; 04:5E55 $CD $45 $6E
    add  $20                                      ;; 04:5E58 $C6 $20
    cp   $40                                      ;; 04:5E5A $FE $40
    jr   nc, .return                              ;; 04:5E5C $30 $14

    ld   hl, wEntitiesFlashCountdownTable         ;; 04:5E5E $21 $20 $C4
    add  hl, bc                                   ;; 04:5E61 $09
    ld   a, [hl]                                  ;; 04:5E62 $7E
    and  a                                        ;; 04:5E63 $A7
    jr   nz, .return                              ;; 04:5E64 $20 $0C

    call GetEntityTransitionCountdown             ;; 04:5E66 $CD $05 $0C
    ld   [hl], $20                                ;; 04:5E69 $36 $20
    call IncrementEntityState                     ;; 04:5E6B $CD $12 $3B
    ld   a, JINGLE_PAIRODD_TELEPORT               ;; 04:5E6E $3E $3C
    ldh  [hJingle], a                             ;; 04:5E70 $E0 $F2

.return
    ret                                           ;; 04:5E72 $C9

; Indexed by transition countdown / 8
PairoddDisappearingSpriteVariantIndexes::
    db   $04, $03, $02

PairoddDisappearingHandler::
    call GetEntityTransitionCountdown             ;; 04:5E76 $CD $05 $0C
    cp   $18                                      ;; 04:5E79 $FE $18
    jp   nc, DefaultEnemyDamageCollisionHandler_trampoline ;; 04:5E7B $D2 $39 $3B

    and  a                                        ;; 04:5E7E $A7
    jr   nz, .skipIncrementState                  ;; 04:5E7F $20 $23

    ld   [hl], $40                                ;; 04:5E81 $36 $40
    call IncrementEntityState                     ;; 04:5E83 $CD $12 $3B
    ld   a, $FF                                   ;; 04:5E86 $3E $FF
    call SetEntitySpriteVariant                   ;; 04:5E88 $CD $0C $3B
    ld   hl, wEntitiesPosYTable                   ;; 04:5E8B $21 $10 $C2
    add  hl, bc                                   ;; 04:5E8E $09
    ld   a, [hl]                                  ;; 04:5E8F $7E
    sub  $48                                      ;; 04:5E90 $D6 $48
    ld   e, a                                     ;; 04:5E92 $5F
    ld   a, $48                                   ;; 04:5E93 $3E $48
    sub  e                                        ;; 04:5E95 $93
    ld   [hl], a                                  ;; 04:5E96 $77
    ld   hl, wEntitiesPosXTable                   ;; 04:5E97 $21 $00 $C2
    add  hl, bc                                   ;; 04:5E9A $09
    ld   a, [hl]                                  ;; 04:5E9B $7E
    sub  $50                                      ;; 04:5E9C $D6 $50
    ld   e, a                                     ;; 04:5E9E $5F
    ld   a, $50                                   ;; 04:5E9F $3E $50
    sub  e                                        ;; 04:5EA1 $93
    ld   [hl], a                                  ;; 04:5EA2 $77
    ret                                           ;; 04:5EA3 $C9

.skipIncrementState
    rra                                           ;; 04:5EA4 $1F
    rra                                           ;; 04:5EA5 $1F
    rra                                           ;; 04:5EA6 $1F
    and  $03                                      ;; 04:5EA7 $E6 $03
    ld   e, a                                     ;; 04:5EA9 $5F
    ld   d, b                                     ;; 04:5EAA $50
    ld   hl, PairoddDisappearingSpriteVariantIndexes ;; 04:5EAB $21 $73 $5E
    add  hl, de                                   ;; 04:5EAE $19
    ld   a, [hl]                                  ;; 04:5EAF $7E
    jp   SetEntitySpriteVariant                   ;; 04:5EB0 $C3 $0C $3B

; Indexed by transition countdown / 8
PairoddReappearingSpriteVariantIndexes::
    db   $02, $03, $04

PairoddReappearingHandler::
    call GetEntityTransitionCountdown             ;; 04:5EB6 $CD $05 $0C
    cp   $18                                      ;; 04:5EB9 $FE $18
    ret  nc                                       ;; 04:5EBB $D0

    and  a                                        ;; 04:5EBC $A7
    jr   nz, PairoddReappearingAnimation          ;; 04:5EBD $20 $26

    ld   [hl], $30                                ;; 04:5EBF $36 $30
    call IncrementEntityState                     ;; 04:5EC1 $CD $12 $3B
    ld   [hl], b                                  ;; 04:5EC4 $70
    ret                                           ;; 04:5EC5 $C9

SpawnPairoddProjectile::
    ld   a, ENTITY_PAIRODD_PROJECTILE             ;; 04:5EC6 $3E $58
    call SpawnNewEntity_trampoline                ;; 04:5EC8 $CD $86 $3B
    jr   c, .return                               ;; 04:5ECB $38 $17

    ld   hl, wEntitiesPosXTable                   ;; 04:5ECD $21 $00 $C2
    add  hl, de                                   ;; 04:5ED0 $19
    ldh  a, [hMultiPurpose0]                      ;; 04:5ED1 $F0 $D7
    ld   [hl], a                                  ;; 04:5ED3 $77
    ld   hl, wEntitiesPosYTable                   ;; 04:5ED4 $21 $10 $C2
    add  hl, de                                   ;; 04:5ED7 $19
    ldh  a, [hMultiPurpose1]                      ;; 04:5ED8 $F0 $D8
    ld   [hl], a                                  ;; 04:5EDA $77
    push bc                                       ;; 04:5EDB $C5
    ld   c, e                                     ;; 04:5EDC $4B
    ld   b, d                                     ;; 04:5EDD $42
    ld   a, $18                                   ;; 04:5EDE $3E $18
    call ApplyVectorTowardsLink_trampoline        ;; 04:5EE0 $CD $AA $3B
    pop  bc                                       ;; 04:5EE3 $C1

.return
    ret                                           ;; 04:5EE4 $C9

PairoddReappearingAnimation:
    rra                                           ;; 04:5EE5 $1F
    rra                                           ;; 04:5EE6 $1F
    rra                                           ;; 04:5EE7 $1F
    and  $03                                      ;; 04:5EE8 $E6 $03
    ld   e, a                                     ;; 04:5EEA $5F
    ld   d, b                                     ;; 04:5EEB $50
    ld   hl, PairoddReappearingSpriteVariantIndexes ;; 04:5EEC $21 $B3 $5E
    add  hl, de                                   ;; 04:5EEF $19
    ld   a, [hl]                                  ;; 04:5EF0 $7E
    jp   SetEntitySpriteVariant                   ;; 04:5EF1 $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PairoddProjectileSpriteVariants::
.variant0
    db $7C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $7E, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

PairoddProjectileEntityHandler::
    ld   de, PairoddProjectileSpriteVariants      ;; 04:5EFC $11 $F4 $5E
    call RenderActiveEntitySpritesPair            ;; 04:5EFF $CD $C0 $3B
    call ReturnIfNonInteractive_04                ;; 04:5F02 $CD $A3 $7F
    ldh  a, [hFrameCounter]                       ;; 04:5F05 $F0 $E7
    rra                                           ;; 04:5F07 $1F
    rra                                           ;; 04:5F08 $1F
    rra                                           ;; 04:5F09 $1F
    and  $01                                      ;; 04:5F0A $E6 $01
    call SetEntitySpriteVariant                   ;; 04:5F0C $CD $0C $3B
    call UpdateEntityPosWithSpeed_04              ;; 04:5F0F $CD $CA $6D
    call label_3B2E                               ;; 04:5F12 $CD $2E $3B
    call CheckLinkCollisionWithProjectile_trampoline ;; 04:5F15 $CD $4F $3B
    call label_3B70                               ;; 04:5F18 $CD $70 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 04:5F1B $21 $A0 $C2
    add  hl, bc                                   ;; 04:5F1E $09
    ld   a, [hl]                                  ;; 04:5F1F $7E
    and  a                                        ;; 04:5F20 $A7
    ret  z                                        ;; 04:5F21 $C8

    call ClearEntityStatusBank04                  ;; 04:5F22 $CD $7A $6D
    jp   func_004_6BE1.createSwordPokeVfx         ;; 04:5F25 $C3 $20 $6C
