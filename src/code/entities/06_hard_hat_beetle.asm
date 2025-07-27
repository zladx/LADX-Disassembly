; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HardHatBeetleSpriteVariants::
.variant0
    db $44, OAM_GBC_PAL_1 | OAMF_PAL0
    db $44, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $46, OAM_GBC_PAL_1 | OAMF_PAL0
    db $46, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HardHatBeetleCaveBSpriteVariants::
.variant0
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

HardHatBeetleEntityHandler::
    ld   de, HardHatBeetleSpriteVariants          ;; 06:4F3C $11 $2C $4F
    ldh  a, [hMapId]                              ;; 06:4F3F $F0 $F7
    cp   MAP_CAVE_B                               ;; 06:4F41 $FE $0A
    jr   nz, .render                              ;; 06:4F43 $20 $03

    ld   de, HardHatBeetleCaveBSpriteVariants     ;; 06:4F45 $11 $34 $4F

.render:
    call RenderActiveEntitySpritesPair            ;; 06:4F48 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:4F4B $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:4F4E $CD $F7 $64
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:4F51 $CD $39 $3B
    call UpdateEntityPosWithSpeed_06              ;; 06:4F54 $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:4F57 $CD $23 $3B
    ldh  a, [hFrameCounter]                       ;; 06:4F5A $F0 $E7
    rra                                           ;; 06:4F5C $1F
    rra                                           ;; 06:4F5D $1F
    rra                                           ;; 06:4F5E $1F
    and  $01                                      ;; 06:4F5F $E6 $01
    call SetEntitySpriteVariant                   ;; 06:4F61 $CD $0C $3B
    ldh  a, [hFrameCounter]                       ;; 06:4F64 $F0 $E7
    xor  c                                        ;; 06:4F66 $A9
    and  $03                                      ;; 06:4F67 $E6 $03
    jr   nz, HardhatBeetleUpdateSpeed.return      ;; 06:4F69 $20 $44

    call GetRandomByte                            ;; 06:4F6B $CD $0D $28
    xor  c                                        ;; 06:4F6E $A9
    and  $07                                      ;; 06:4F6F $E6 $07
    add  $04                                      ;; 06:4F71 $C6 $04
    call GetVectorTowardsLink_trampoline          ;; 06:4F73 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:4F76 $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ;; 06:4F78 $21 $50 $C2
    call HardhatBeetleUpdateSpeed                 ;; 06:4F7B $CD $A3 $4F
    ld   hl, wEntitiesCollisionsTable             ;; 06:4F7E $21 $A0 $C2
    add  hl, bc                                   ;; 06:4F81 $09
    ld   a, [hl]                                  ;; 06:4F82 $7E
    and  $0C                                      ;; 06:4F83 $E6 $0C
    jr   z, .noCollisionY                         ;; 06:4F85 $28 $05

    ld   hl, wEntitiesSpeedYTable                 ;; 06:4F87 $21 $50 $C2
    add  hl, bc                                   ;; 06:4F8A $09
    ld   [hl], b                                  ;; 06:4F8B $70

.noCollisionY
    ldh  a, [hMultiPurpose1]                      ;; 06:4F8C $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ;; 06:4F8E $21 $40 $C2
    call HardhatBeetleUpdateSpeed                 ;; 06:4F91 $CD $A3 $4F
    ld   hl, wEntitiesCollisionsTable             ;; 06:4F94 $21 $A0 $C2
    add  hl, bc                                   ;; 06:4F97 $09
    ld   a, [hl]                                  ;; 06:4F98 $7E
    and  $03                                      ;; 06:4F99 $E6 $03
    jr   z, .noCollisionX                         ;; 06:4F9B $28 $05

    ld   hl, wEntitiesSpeedXTable                 ;; 06:4F9D $21 $40 $C2
    add  hl, bc                                   ;; 06:4FA0 $09
    ld   [hl], b                                  ;; 06:4FA1 $70

.noCollisionX
    ret                                           ;; 06:4FA2 $C9

HardhatBeetleUpdateSpeed::
    add  hl, bc                                   ;; 06:4FA3 $09
    sub  [hl]                                     ;; 06:4FA4 $96
    jr   z, .return                               ;; 06:4FA5 $28 $08

    bit  7, a                                     ;; 06:4FA7 $CB $7F
    jr   z, .positive                             ;; 06:4FA9 $28 $03

    dec  [hl]                                     ;; 06:4FAB $35
    jr   .return                                  ;; 06:4FAC $18 $01

.positive
    inc  [hl]                                     ;; 06:4FAE $34

.return:
    ret                                           ;; 06:4FAF $C9
