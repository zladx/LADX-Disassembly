; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SpikedBeetle1SpriteVariants:: ;; 07:7784
.variant0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SpikedBeetle2SpriteVariants::
.variant0
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

SpikedBeetleEntityHandler::
    ld   de, SpikedBeetle1SpriteVariants          ;; 07:77A4 $11 $84 $77
    ldh  a, [hMapId]                              ;; 07:77A7 $F0 $F7
    cp   MAP_ANGLERS_TUNNEL                       ;; 07:77A9 $FE $03
    jr   nz, .render                              ;; 07:77AB $20 $03

    ld   de, SpikedBeetle2SpriteVariants          ;; 07:77AD $11 $94 $77

.render
    call RenderActiveEntitySpritesPair            ;; 07:77B0 $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:77B3 $CD $96 $7D
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 07:77B6 $21 $10 $C4
    add  hl, bc                                   ;; 07:77B9 $09
    ld   a, [hl]                                  ;; 07:77BA $7E
    and  a                                        ;; 07:77BB $A7
    jr   z, .jr_77C1                              ;; 07:77BC $28 $03

    call ClearEntitySpeed                         ;; 07:77BE $CD $7F $3D

.jr_77C1
    call ApplyRecoilIfNeeded_07                   ;; 07:77C1 $CD $C3 $7D
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:77C4 $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ;; 07:77C7 $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ;; 07:77CA $CD $43 $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:77CD $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                 ;; 07:77D0 $21 $20 $C3
    add  hl, bc                                   ;; 07:77D3 $09
    dec  [hl]                                     ;; 07:77D4 $35
    dec  [hl]                                     ;; 07:77D5 $35
    ld   hl, wEntitiesPosZTable                   ;; 07:77D6 $21 $10 $C3
    add  hl, bc                                   ;; 07:77D9 $09
    ld   a, [hl]                                  ;; 07:77DA $7E
    bit  7, a                                     ;; 07:77DB $CB $7F
    jr   nz, .negativeZ                           ;; 07:77DD $20 $03

    and  a                                        ;; 07:77DF $A7
    jr   nz, .bounceEnd                           ;; 07:77E0 $20 $2B

.negativeZ
    ld   [hl], b                                  ;; 07:77E2 $70
    ldh  a, [hActiveEntityState]                  ;; 07:77E3 $F0 $F0
    cp   $03                                      ;; 07:77E5 $FE $03
    jr   nz, .notFlipped                          ;; 07:77E7 $20 $1F

    ld   hl, wEntitiesSpeedXTable                 ;; 07:77E9 $21 $40 $C2
    add  hl, bc                                   ;; 07:77EC $09
    sra  [hl]                                     ;; 07:77ED $CB $2E
    call GetEntitySpeedYAddress                   ;; 07:77EF $CD $05 $40
    sra  [hl]                                     ;; 07:77F2 $CB $2E
    ld   hl, wEntitiesSpeedZTable                 ;; 07:77F4 $21 $20 $C3
    add  hl, bc                                   ;; 07:77F7 $09
    ld   a, [hl]                                  ;; 07:77F8 $7E
    sra  a                                        ;; 07:77F9 $CB $2F
    cpl                                           ;; 07:77FB $2F
    ld   [hl], a                                  ;; 07:77FC $77
    cp   $07                                      ;; 07:77FD $FE $07
    jp   nc, .bounceEnd                           ;; 07:77FF $D2 $0D $78

    ld   [hl], b                                  ;; 07:7802 $70
    call ClearEntitySpeed                         ;; 07:7803 $CD $7F $3D
    jr   .bounceEnd                               ;; 07:7806 $18 $05

.notFlipped
    ld   hl, wEntitiesSpeedZTable                 ;; 07:7808 $21 $20 $C3
    add  hl, bc                                   ;; 07:780B $09
    ld   [hl], b                                  ;; 07:780C $70

.bounceEnd
    ldh  a, [hActiveEntityState]                  ;; 07:780D $F0 $F0
    cp   $04                                      ;; 07:780F $FE $04
    jr   c, .state4End                            ;; 07:7811 $38 $01

    ret                                           ;; 07:7813 $C9

.state4End
    JP_TABLE                                      ;; 07:7814
._00 dw SpikedBeetleRestingHandler                 ;; 07:7815
._01 dw SpikedBeetleWalkingHandler                ;; 07:7817
._02 dw SpikedBeetleDashingHandler                ;; 07:7819
._03 dw SpikedBeetleFlippedHandler                ;; 07:781B

SpikedBeetleWalkingXSpeeds::
    db   $06, $FA, $00, $00

SpikedBeetleWalkingYSpeeds::
    db   $00, $00, $FA, $06

SpikedBeetleRestingHandler::
    call ClearEntitySpeed                         ;; 07:7825 $CD $7F $3D
    call GetEntityTransitionCountdown             ;; 07:7828 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 07:782B $20 $31

    call GetRandomByte                            ;; 07:782D $CD $0D $28
    and  $1F                                      ;; 07:7830 $E6 $1F
    add  $30                                      ;; 07:7832 $C6 $30
    ld   [hl], a                                  ;; 07:7834 $77
    call IncrementEntityState                     ;; 07:7835 $CD $12 $3B
    call GetRandomByte                            ;; 07:7838 $CD $0D $28
    and  $06                                      ;; 07:783B $E6 $06
    jr   nz, .chooseRandomDirection               ;; 07:783D $20 $05

    call GetEntityDirectionToLink_07              ;; 07:783F $CD $7D $7E
    jr   .chooseRandomDirectionEnd                ;; 07:7842 $18 $06

.chooseRandomDirection
    call GetRandomByte                            ;; 07:7844 $CD $0D $28
    and  $03                                      ;; 07:7847 $E6 $03
    ld   e, a                                     ;; 07:7849 $5F

.chooseRandomDirectionEnd
    ld   d, b                                     ;; 07:784A $50
    ld   hl, SpikedBeetleWalkingXSpeeds           ;; 07:784B $21 $1D $78
    add  hl, de                                   ;; 07:784E $19
    ld   a, [hl]                                  ;; 07:784F $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:7850 $21 $40 $C2
    add  hl, bc                                   ;; 07:7853 $09
    ld   [hl], a                                  ;; 07:7854 $77
    ld   hl, SpikedBeetleWalkingYSpeeds           ;; 07:7855 $21 $21 $78
    add  hl, de                                   ;; 07:7858 $19
    ld   a, [hl]                                  ;; 07:7859 $7E
    call GetEntitySpeedYAddress                   ;; 07:785A $CD $05 $40
    ld   [hl], a                                  ;; 07:785D $77

.skipIncrementState
    jr   SpikedBeetleNotFlipped                   ;; 07:785E $18 $0E

SpikedBeetleWalkingHandler::
    call GetEntityTransitionCountdown             ;; 07:7860 $CD $05 $0C
    jr   nz, .skipSetState0                       ;; 07:7863 $20 $06

    ld   [hl], $18                                ;; 07:7865 $36 $18
    call IncrementEntityState                     ;; 07:7867 $CD $12 $3B
    ld   [hl], b                                  ;; 07:786A $70

.skipSetState0
    call SpikedBeetleWalk                         ;; 07:786B $CD $E1 $78

SpikedBeetleNotFlipped:
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:786E $21 $50 $C3
    add  hl, bc                                   ;; 07:7871 $09
    ld   [hl], $80                                ;; 07:7872 $36 $80
    ld   hl, wEntitiesOptions1Table               ;; 07:7874 $21 $30 $C4
    add  hl, bc                                   ;; 07:7877 $09
    ld   [hl], ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_SPLASH_IN_WATER ;; 07:7878 $36 $48
    call GetEntityXDistanceToLink_07              ;; 07:787A $CD $5D $7E
    add  $06                                      ;; 07:787D $C6 $06
    cp   $0A                                      ;; 07:787F $FE $0A
    jr   c, .startDash                            ;; 07:7881 $38 $09

    call GetEntityYDistanceToLink_07              ;; 07:7883 $CD $6D $7E
    add  $06                                      ;; 07:7886 $C6 $06
    cp   $0A                                      ;; 07:7888 $FE $0A
    jr   nc, .return                              ;; 07:788A $30 $10

.startDash
    call GetEntityDirectionToLink_07              ;; 07:788C $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ;; 07:788F $21 $80 $C3
    add  hl, bc                                   ;; 07:7892 $09
    ld   [hl], e                                  ;; 07:7893 $73
    call IncrementEntityState                     ;; 07:7894 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 07:7897 $CD $05 $0C
    ld   [hl], $FF                                ;; 07:789A $36 $FF

.return
    ret                                           ;; 07:789C $C9

SpikedBeetleDashingXSpeeds::
    db   $18, $E8, $00, $00

SpikedBeetleDashingYSpeeds::
    db   $00, $00, $E8, $18

SpikedBeetleDashingHandler::
    call GetEntityTransitionCountdown             ;; 07:78A5 $CD $05 $0C
    jr   z, .setState0                            ;; 07:78A8 $28 $33

    ld   hl, wEntitiesDirectionTable              ;; 07:78AA $21 $80 $C3
    add  hl, bc                                   ;; 07:78AD $09
    ld   e, [hl]                                  ;; 07:78AE $5E
    ld   d, b                                     ;; 07:78AF $50
    ld   hl, SpikedBeetleDashingXSpeeds           ;; 07:78B0 $21 $9D $78
    add  hl, de                                   ;; 07:78B3 $19
    ld   a, [hl]                                  ;; 07:78B4 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:78B5 $21 $40 $C2
    add  hl, bc                                   ;; 07:78B8 $09
    sub  [hl]                                     ;; 07:78B9 $96
    jr   z, .updateXSpeedEnd                      ;; 07:78BA $28 $07

    and  $80                                      ;; 07:78BC $E6 $80
    jr   nz, .positiveDifferenceX                 ;; 07:78BE $20 $02

    inc  [hl]                                     ;; 07:78C0 $34
    inc  [hl]                                     ;; 07:78C1 $34

.positiveDifferenceX
    dec  [hl]                                     ;; 07:78C2 $35

.updateXSpeedEnd
    ld   hl, SpikedBeetleDashingYSpeeds           ;; 07:78C3 $21 $A1 $78
    add  hl, de                                   ;; 07:78C6 $19
    ld   a, [hl]                                  ;; 07:78C7 $7E
    call GetEntitySpeedYAddress                   ;; 07:78C8 $CD $05 $40
    sub  [hl]                                     ;; 07:78CB $96
    jr   z, .updateYSpeedEnd                      ;; 07:78CC $28 $07

    and  $80                                      ;; 07:78CE $E6 $80
    jr   nz, .positiveDifferenceY                 ;; 07:78D0 $20 $02

    inc  [hl]                                     ;; 07:78D2 $34
    inc  [hl]                                     ;; 07:78D3 $34

.positiveDifferenceY
    dec  [hl]                                     ;; 07:78D4 $35

.updateYSpeedEnd
    ld   hl, wEntitiesCollisionsTable             ;; 07:78D5 $21 $A0 $C2
    add  hl, bc                                   ;; 07:78D8 $09
    ld   a, [hl]                                  ;; 07:78D9 $7E
    and  a                                        ;; 07:78DA $A7
    jr   z, SpikedBeetleWalk                      ;; 07:78DB $28 $04

.setState0
    call IncrementEntityState                     ;; 07:78DD $CD $12 $3B
    ld   [hl], b                                  ;; 07:78E0 $70

SpikedBeetleWalk::
    ldh  a, [hFrameCounter]                       ;; 07:78E1 $F0 $E7
    rra                                           ;; 07:78E3 $1F
    rra                                           ;; 07:78E4 $1F
    rra                                           ;; 07:78E5 $1F
    rra                                           ;; 07:78E6 $1F
    and  $01                                      ;; 07:78E7 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 07:78E9 $C3 $0C $3B

SpikedBeetleFlippedHandler::
    ld   hl, wEntitiesOptions1Table               ;; 07:78EC $21 $30 $C4
    add  hl, bc                                   ;; 07:78EF $09
    ld   [hl], ENTITY_OPT1_SPLASH_IN_WATER        ;; 07:78F0 $36 $08
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:78F2 $21 $50 $C3
    add  hl, bc                                   ;; 07:78F5 $09
    ld   [hl], $00                                ;; 07:78F6 $36 $00
    ldh  a, [hFrameCounter]                       ;; 07:78F8 $F0 $E7
    rra                                           ;; 07:78FA $1F
    rra                                           ;; 07:78FB $1F
    rra                                           ;; 07:78FC $1F
    rra                                           ;; 07:78FD $1F
    and  $01                                      ;; 07:78FE $E6 $01
    inc  a                                        ;; 07:7900 $3C
    inc  a                                        ;; 07:7901 $3C
    call SetEntitySpriteVariant                   ;; 07:7902 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 07:7905 $CD $05 $0C
    jr   nz, .skipSetState0                       ;; 07:7908 $20 $10

    call IncrementEntityState                     ;; 07:790A $CD $12 $3B
    ld   [hl], b                                  ;; 07:790D $70
    ld   hl, wEntitiesSpeedZTable                 ;; 07:790E $21 $20 $C3
    add  hl, bc                                   ;; 07:7911 $09
    ld   [hl], $18                                ;; 07:7912 $36 $18
    ld   hl, wEntitiesSpeedXTable                 ;; 07:7914 $21 $40 $C2
    add  hl, bc                                   ;; 07:7917 $09
    ld   [hl], b                                  ;; 07:7918 $70
    ret                                           ;; 07:7919 $C9

.skipSetState0
    cp   $60                                      ;; 07:791A $FE $60
    jr   nc, .shakeEnd                            ;; 07:791C $30 $0D

    and  $04                                      ;; 07:791E $E6 $04
    ld   a, $08                                   ;; 07:7920 $3E $08
    jr   nz, .shakeRight                          ;; 07:7922 $20 $02

    ld   a, $F8                                   ;; 07:7924 $3E $F8

.shakeRight
    ld   hl, wEntitiesSpeedXTable                 ;; 07:7926 $21 $40 $C2
    add  hl, bc                                   ;; 07:7929 $09
    ld   [hl], a                                  ;; 07:792A $77

.shakeEnd
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 07:792B $21 $10 $C4
    add  hl, bc                                   ;; 07:792E $09
    ld   a, [hl]                                  ;; 07:792F $7E
    push af                                       ;; 07:7930 $F5
    ld   [hl], $01                                ;; 07:7931 $36 $01
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:7933 $CD $23 $3B
    pop  af                                       ;; 07:7936 $F1
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 07:7937 $21 $10 $C4
    add  hl, bc                                   ;; 07:793A $09
    ld   [hl], a                                  ;; 07:793B $77
    ret                                           ;; 07:793C $C9
