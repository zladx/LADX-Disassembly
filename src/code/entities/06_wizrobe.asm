; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
WizrobeSpriteVariants::
.variant0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

Data_006_7618::
    db   $08, $F8, $00, $00

Data_006_761C::
    db   $00, $00, $F8, $08

Data_006_7620::
    db   $20, $E0, $00, $00

Data_006_7624::
    db   $00, $00, $E0, $20

WizrobeEntityHandler::
    ld   de, WizrobeSpriteVariants                ;; 06:7628 $11 $04 $76
    call RenderActiveEntitySpritesPair            ;; 06:762B $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:762E $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:7631 $CD $F7 $64
    call UpdateEntityPosWithSpeed_06              ;; 06:7634 $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:7637 $CD $23 $3B
    ld   hl, wEntitiesStateTable                  ;; 06:763A $21 $90 $C2
    add  hl, bc                                   ;; 06:763D $09
    ld   a, [hl]                                  ;; 06:763E $7E
    JP_TABLE                                      ;; 06:763F
._00 dw WizrobeState0Handler                      ;; 06:7640
._01 dw WizrobeState1Handler                      ;; 06:7642
._02 dw WizrobeState2Handler                      ;; 06:7644
._03 dw WizrobeState3Handler                      ;; 06:7646

WizrobeState0Handler::
    ld   hl, wEntitiesTransitionCountdownTable    ;; 06:7648 $21 $E0 $C2
    add  hl, bc                                   ;; 06:764B $09
    ld   a, [hl]                                  ;; 06:764C $7E
    and  a                                        ;; 06:764D $A7
    jr   nz, .jr_765E                             ;; 06:764E $20 $0E

    call IncrementEntityState                     ;; 06:7650 $CD $12 $3B
    ld   hl, wEntitiesPrivateState1Table          ;; 06:7653 $21 $B0 $C2
    add  hl, bc                                   ;; 06:7656 $09
    ld   [hl], $01                                ;; 06:7657 $36 $01
    call GetEntityPrivateCountdown1               ;; 06:7659 $CD $00 $0C
    ld   [hl], $20                                ;; 06:765C $36 $20

.jr_765E
    jr   jr_006_767E                              ;; 06:765E $18 $1E

WizrobeState1Handler::
    call GetEntityPrivateCountdown1               ;; 06:7660 $CD $00 $0C
    jr   nz, jr_006_7679                          ;; 06:7663 $20 $14

    ld   hl, wEntitiesPrivateState1Table          ;; 06:7665 $21 $B0 $C2
    add  hl, bc                                   ;; 06:7668 $09
    ld   a, [hl]                                  ;; 06:7669 $7E
    ld   hl, wEntitiesStateTable                  ;; 06:766A $21 $90 $C2
    add  hl, bc                                   ;; 06:766D $09
    add  [hl]                                     ;; 06:766E $86

.jr_766F
    ld   [hl], a                                  ;; 06:766F $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 06:7670 $21 $E0 $C2
    add  hl, bc                                   ;; 06:7673 $09
    ld   [hl], $30                                ;; 06:7674 $36 $30
    jp   label_006_7735                           ;; 06:7676 $C3 $35 $77

jr_006_7679:
    ld   a, [hl]                                  ;; 06:7679 $7E
    and  $02                                      ;; 06:767A $E6 $02
    jr   nz, jr_006_7686                          ;; 06:767C $20 $08

jr_006_767E:
    ld   a, $FF                                   ;; 06:767E $3E $FF
    call SetEntitySpriteVariant                   ;; 06:7680 $CD $0C $3B
    jp   label_006_7735                           ;; 06:7683 $C3 $35 $77

jr_006_7686:
    xor  a                                        ;; 06:7686 $AF
    call SetEntitySpriteVariant                   ;; 06:7687 $CD $0C $3B
    jp   label_006_7735                           ;; 06:768A $C3 $35 $77

WizrobeState2Handler::
    xor  a                                        ;; 06:768D $AF
    call SetEntitySpriteVariant                   ;; 06:768E $CD $0C $3B
    call GetEntityPrivateCountdown1               ;; 06:7691 $CD $00 $0C
    cp   $02                                      ;; 06:7694 $FE $02
    jr   nc, jr_006_76B6                          ;; 06:7696 $30 $1E

    ld   a, [hl]                                  ;; 06:7698 $7E
    cp   $01                                      ;; 06:7699 $FE $01
    jr   z, .jr_76A2                              ;; 06:769B $28 $05

    ld   [hl], $18                                ;; 06:769D $36 $18
    jp   label_006_7735                           ;; 06:769F $C3 $35 $77

.jr_76A2
    ld   hl, wEntitiesPrivateState1Table          ;; 06:76A2 $21 $B0 $C2
    add  hl, bc                                   ;; 06:76A5 $09
    ld   a, [hl]                                  ;; 06:76A6 $7E
    ld   hl, wEntitiesStateTable                  ;; 06:76A7 $21 $90 $C2
    add  hl, bc                                   ;; 06:76AA $09
    add  [hl]                                     ;; 06:76AB $86
    ld   [hl], a                                  ;; 06:76AC $77
    cp   $01                                      ;; 06:76AD $FE $01
    jr   nz, jr_006_76B6                          ;; 06:76AF $20 $05

    call GetEntityPrivateCountdown1               ;; 06:76B1 $CD $00 $0C
    ld   [hl], $20                                ;; 06:76B4 $36 $20

jr_006_76B6:
    jp   label_006_7735                           ;; 06:76B6 $C3 $35 $77

WizrobeState3Handler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:76B9 $CD $39 $3B
    call GetEntityPrivateCountdown1               ;; 06:76BC $CD $00 $0C
    cp   $28                                      ;; 06:76BF $FE $28
    jr   z, jr_006_76E9                           ;; 06:76C1 $28 $26

    cp   $02                                      ;; 06:76C3 $FE $02
    jr   nc, jr_006_772D                          ;; 06:76C5 $30 $66

    ld   a, [hl]                                  ;; 06:76C7 $7E
    cp   $01                                      ;; 06:76C8 $FE $01
    jr   z, .jr_76DD                              ;; 06:76CA $28 $11

    ld   [hl], $40                                ;; 06:76CC $36 $40
    call GetEntityDirectionToLink_06              ;; 06:76CE $CD $B4 $65
    ld   hl, wEntitiesDirectionTable              ;; 06:76D1 $21 $80 $C3
    add  hl, bc                                   ;; 06:76D4 $09
    ld   [hl], a                                  ;; 06:76D5 $77
    inc  a                                        ;; 06:76D6 $3C
    ld   hl, wEntitiesSpriteVariantTable          ;; 06:76D7 $21 $B0 $C3
    add  hl, bc                                   ;; 06:76DA $09
    ld   [hl], a                                  ;; 06:76DB $77
    ret                                           ;; 06:76DC $C9

.jr_76DD
    ld   hl, wEntitiesPrivateState1Table          ;; 06:76DD $21 $B0 $C2
    add  hl, bc                                   ;; 06:76E0 $09
    ld   [hl], $FF                                ;; 06:76E1 $36 $FF
    ld   hl, wEntitiesStateTable                  ;; 06:76E3 $21 $90 $C2
    add  hl, bc                                   ;; 06:76E6 $09
    dec  [hl]                                     ;; 06:76E7 $35
    ret                                           ;; 06:76E8 $C9

jr_006_76E9:
    ld   a, ENTITY_WIZROBE_PROJECTILE             ;; 06:76E9 $3E $22
    call SpawnNewEntity_trampoline                ;; 06:76EB $CD $86 $3B
    jr   c, jr_006_772D                           ;; 06:76EE $38 $3D

    push bc                                       ;; 06:76F0 $C5
    ldh  a, [hMultiPurpose2]                      ;; 06:76F1 $F0 $D9
    ld   hl, wEntitiesDirectionTable              ;; 06:76F3 $21 $80 $C3
    add  hl, de                                   ;; 06:76F6 $19
    ld   [hl], a                                  ;; 06:76F7 $77
    ld   c, a                                     ;; 06:76F8 $4F
    ld   hl, Data_006_7618                        ;; 06:76F9 $21 $18 $76
    add  hl, bc                                   ;; 06:76FC $09
    ldh  a, [hMultiPurpose0]                      ;; 06:76FD $F0 $D7
    add  [hl]                                     ;; 06:76FF $86
    ld   hl, wEntitiesPosXTable                   ;; 06:7700 $21 $00 $C2
    add  hl, de                                   ;; 06:7703 $19
    ld   [hl], a                                  ;; 06:7704 $77
    ld   hl, Data_006_761C                        ;; 06:7705 $21 $1C $76
    add  hl, bc                                   ;; 06:7708 $09

label_006_7709:
    ldh  a, [hMultiPurpose1]                      ;; 06:7709 $F0 $D8
    add  [hl]                                     ;; 06:770B $86
    ld   hl, wEntitiesPosYTable                   ;; 06:770C $21 $10 $C2
    add  hl, de                                   ;; 06:770F $19
    ld   [hl], a                                  ;; 06:7710 $77
    ld   hl, Data_006_7620                        ;; 06:7711 $21 $20 $76
    add  hl, bc                                   ;; 06:7714 $09
    ld   a, [hl]                                  ;; 06:7715 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:7716 $21 $40 $C2
    add  hl, de                                   ;; 06:7719 $19
    ld   [hl], a                                  ;; 06:771A $77
    ld   hl, Data_006_7624                        ;; 06:771B $21 $24 $76
    add  hl, bc                                   ;; 06:771E $09
    ld   a, [hl]                                  ;; 06:771F $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:7720 $21 $50 $C2
    add  hl, de                                   ;; 06:7723 $19
    ld   [hl], a                                  ;; 06:7724 $77

.jr_7725
    pop  bc                                       ;; 06:7725 $C1
    ldh  a, [hMultiPurpose2]                      ;; 06:7726 $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable          ;; 06:7728 $21 $B0 $C3
    add  hl, de                                   ;; 06:772B $19
    ld   [hl], a                                  ;; 06:772C $77

jr_006_772D:
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:772D $21 $40 $C3
    add  hl, bc                                   ;; 06:7730 $09
    ld   a, 2                                     ;; 06:7731 $3E $02
    ld   [hl], a                                  ;; 06:7733 $77
    ret                                           ;; 06:7734 $C9

label_006_7735:
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:7735 $21 $40 $C3
    add  hl, bc                                   ;; 06:7738 $09
    ld   [hl], 2 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 06:7739 $36 $42
    ret                                           ;; 06:773B $C9
