; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
StalfosAggressiveSpriteVariants:: ;; 06:4AA8
.variant0
    db $4A, OAM_GBC_PAL_0 | OAMF_PAL0
    db $4C, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $4C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $4A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $4E, OAM_GBC_PAL_0 | OAMF_PAL0
    db $4E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

StalfosAggressiveEntityHandler::
    ld   de, StalfosAggressiveSpriteVariants
    call RenderActiveEntitySpritesPair            ;; 06:4AB7 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:4ABA $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:4ABD $CD $F7 $64
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:4AC0 $CD $39 $3B
    ldh  a, [hMapId]                              ;; 06:4AC3 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 06:4AC5 $FE $FF
    jr   nz, .jr_4ACE                             ;; 06:4AC7 $20 $05

    ld   a, $06                                   ;; 06:4AC9 $3E $06
    jp   func_036_4BE8_trampoline                 ;; 06:4ACB $C3 $8F $0A

.jr_4ACE
    ldh  a, [hActiveEntityState]                  ;; 06:4ACE $F0 $F0
    JP_TABLE                                      ;; 06:4AD0
._00 dw StalfosAggressiveState0Handler
._01 dw StalfosAggressiveState1Handler
._02 dw StalfosAggressiveState2Handler
._03 dw StalfosAggressiveState3Handler

StalfosAggressiveState0Handler::
    call GetEntityTransitionCountdown             ;; 06:4AD9 $CD $05 $0C
    ret  nz                                       ;; 06:4ADC $C0

    jp   IncrementEntityState                     ;; 06:4ADD $C3 $12 $3B

StalfosAggressiveState1Handler::
    ldh  a, [hFrameCounter]                       ;; 06:4AE0 $F0 $E7
    xor  c                                        ;; 06:4AE2 $A9
    and  $03                                      ;; 06:4AE3 $E6 $03
    jr   nz, .jr_4AEC                             ;; 06:4AE5 $20 $05

    ld   a, $08                                   ;; 06:4AE7 $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 06:4AE9 $CD $AA $3B

.jr_4AEC
    call GetEntityXDistanceToLink_06              ;; 06:4AEC $CD $94 $65
    add  $1C                                      ;; 06:4AEF $C6 $1C
    cp   $38                                      ;; 06:4AF1 $FE $38
    jr   nc, .jr_4B0C                             ;; 06:4AF3 $30 $17

    call GetEntityYDistanceToLink_06              ;; 06:4AF5 $CD $A4 $65
    add  $1C                                      ;; 06:4AF8 $C6 $1C
    cp   $38                                      ;; 06:4AFA $FE $38
    jr   nc, .jr_4B0C                             ;; 06:4AFC $30 $0E

    ld   hl, wEntitiesSpeedZTable                 ;; 06:4AFE $21 $20 $C3
    add  hl, bc                                   ;; 06:4B01 $09
    ld   [hl], $28                                ;; 06:4B02 $36 $28
    ld   a, $10                                   ;; 06:4B04 $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 06:4B06 $CD $AA $3B
    call IncrementEntityState                     ;; 06:4B09 $CD $12 $3B

.jr_4B0C
    call UpdateEntityPosWithSpeed_06              ;; 06:4B0C $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:4B0F $CD $23 $3B
    ldh  a, [hFrameCounter]                       ;; 06:4B12 $F0 $E7
    rra                                           ;; 06:4B14 $1F
    rra                                           ;; 06:4B15 $1F
    and  $01                                      ;; 06:4B16 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 06:4B18 $C3 $0C $3B

StalfosAggressiveState2Handler::
    call UpdateEntityPosWithSpeed_06              ;; 06:4B1B $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:4B1E $CD $23 $3B
    call AddEntityZSpeedToPos_06                  ;; 06:4B21 $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:4B24 $21 $20 $C3
    add  hl, bc                                   ;; 06:4B27 $09
    dec  [hl]                                     ;; 06:4B28 $35
    dec  [hl]                                     ;; 06:4B29 $35
    ld   a, [hl]                                  ;; 06:4B2A $7E
    cp   $02                                      ;; 06:4B2B $FE $02
    jr   nc, .jr_4B3C                             ;; 06:4B2D $30 $0D

    ld   [hl], $C0                                ;; 06:4B2F $36 $C0
    call GetEntityTransitionCountdown             ;; 06:4B31 $CD $05 $0C
    ld   [hl], $10                                ;; 06:4B34 $36 $10
    call ClearEntitySpeed                         ;; 06:4B36 $CD $7F $3D
    call IncrementEntityState                     ;; 06:4B39 $CD $12 $3B

.jr_4B3C
    ld   a, $02                                   ;; 06:4B3C $3E $02
    jp   SetEntitySpriteVariant                   ;; 06:4B3E $C3 $0C $3B

StalfosAggressiveState3Handler::
    call GetEntityTransitionCountdown             ;; 06:4B41 $CD $05 $0C
    ret  nz                                       ;; 06:4B44 $C0

    call AddEntityZSpeedToPos_06                  ;; 06:4B45 $CD $7A $65
    ld   hl, wEntitiesPosZTable                   ;; 06:4B48 $21 $10 $C3
    add  hl, bc                                   ;; 06:4B4B $09
    ld   a, [hl]                                  ;; 06:4B4C $7E
    and  a                                        ;; 06:4B4D $A7
    jr   z, .jr_4B53                              ;; 06:4B4E $28 $03

    and  $80                                      ;; 06:4B50 $E6 $80
    ret  z                                        ;; 06:4B52 $C8

.jr_4B53
    ld   [hl], b                                  ;; 06:4B53 $70
    call GetEntityTransitionCountdown             ;; 06:4B54 $CD $05 $0C
    ld   [hl], $20                                ;; 06:4B57 $36 $20
    call IncrementEntityState                     ;; 06:4B59 $CD $12 $3B
    ld   [hl], b                                  ;; 06:4B5C $70
    ld   hl, wEntitiesSpeedZTable                 ;; 06:4B5D $21 $20 $C3
    add  hl, bc                                   ;; 06:4B60 $09
    ld   a, [hl]                                  ;; 06:4B61 $7E
    ld   [hl], b                                  ;; 06:4B62 $70
    bit  7, a                                     ;; 06:4B63 $CB $7F
    ret  z                                        ;; 06:4B65 $C8

    cp   $D0                                      ;; 06:4B66 $FE $D0
    ret  nc                                       ;; 06:4B68 $D0

    ldh  a, [hActiveEntityPosX]                   ;; 06:4B69 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 06:4B6B $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:4B6D $F0 $EC
    add  $0C                                      ;; 06:4B6F $C6 $0C
    ldh  [hMultiPurpose1], a                      ;; 06:4B71 $E0 $D8
    jp   label_D15                                ;; 06:4B73 $C3 $15 $0D
