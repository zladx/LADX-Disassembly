; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
LikeLikeSpriteVariants::
.variant0
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $7E, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

LikeLikeEntityHandler::
    ld   de, LikeLikeSpriteVariants               ;; 06:7DDC $11 $D4 $7D
    call RenderActiveEntitySpritesPair            ;; 06:7DDF $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:7DE2 $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:7DE5 $CD $F7 $64
    ld   hl, wEntitiesPrivateState3Table          ;; 06:7DE8 $21 $D0 $C2
    add  hl, bc                                   ;; 06:7DEB $09
    ld   a, [hl]                                  ;; 06:7DEC $7E
    JP_TABLE                                      ;; 06:7DED
._00 dw LikeLikeState0Handler
._01 dw LikeLikeState1Handler

LikeLikeState0Handler::
    call GetEntitySlowTransitionCountdown         ;; 06:7DF2 $CD $FB $0B
    jr   nz, .jr_7E06                             ;; 06:7DF5 $20 $0F

    call label_3B44                               ;; 06:7DF7 $CD $44 $3B
    jr   nc, .jr_7E06                             ;; 06:7DFA $30 $0A

    ld   hl, wEntitiesPrivateState3Table          ;; 06:7DFC $21 $D0 $C2
    add  hl, bc                                   ;; 06:7DFF $09
    inc  [hl]                                     ;; 06:7E00 $34
    ld   hl, wEntitiesInertiaTable                ;; 06:7E01 $21 $D0 $C3
    add  hl, bc                                   ;; 06:7E04 $09
    ld   [hl], b                                  ;; 06:7E05 $70

.jr_7E06
    call label_3B70                               ;; 06:7E06 $CD $70 $3B
    jp   LikeLikeGibdoWalk                        ;; 06:7E09 $C3 $9D $7E

LikeLikeState1Handler::
    ldh  a, [hJoypadState]                        ;; 06:7E0C $F0 $CC
    and  J_A | J_B                                ;; 06:7E0E $E6 $30
    jr   z, .jr_7E27                              ;; 06:7E10 $28 $15

    ld   hl, wEntitiesInertiaTable                ;; 06:7E12 $21 $D0 $C3
    add  hl, bc                                   ;; 06:7E15 $09
    inc  [hl]                                     ;; 06:7E16 $34
    ld   a, [hl]                                  ;; 06:7E17 $7E
    cp   $08                                      ;; 06:7E18 $FE $08
    jr   c, .jr_7E27                              ;; 06:7E1A $38 $0B

    call GetEntitySlowTransitionCountdown         ;; 06:7E1C $CD $FB $0B
    ld   [hl], $15                                ;; 06:7E1F $36 $15
    ld   hl, wEntitiesPrivateState3Table          ;; 06:7E21 $21 $D0 $C2
    add  hl, bc                                   ;; 06:7E24 $09
    ld   [hl], b                                  ;; 06:7E25 $70
    ret                                           ;; 06:7E26 $C9

.jr_7E27
    ld   a, LINK_ANIMATION_STATE_HIDDEN           ;; 06:7E27 $3E $FF
    ldh  [hLinkAnimationState], a                 ;; 06:7E29 $E0 $9D
    ld   hl, wEntitiesPrivateState1Table          ;; 06:7E2B $21 $B0 $C2
    add  hl, bc                                   ;; 06:7E2E $09
    ld   a, [hl]                                  ;; 06:7E2F $7E
    and  a                                        ;; 06:7E30 $A7
    jr   nz, jr_006_7E55                          ;; 06:7E31 $20 $22

    ld   hl, wInventoryItems.BButtonSlot          ;; 06:7E33 $21 $00 $DB
    ld   e, b                                     ;; 06:7E36 $58

jr_006_7E37:
    ld   a, [hl]                                  ;; 06:7E37 $7E
    cp   INVENTORY_SHIELD                         ;; 06:7E38 $FE $04
    jr   nz, .jr_7E4E                             ;; 06:7E3A $20 $12

    ld   a, [wShieldLevel]                        ;; 06:7E3C $FA $44 $DB
    cp   $02                                      ;; 06:7E3F $FE $02
    jr   nc, jr_006_7E55                          ;; 06:7E41 $30 $12

    ld   [hl], b                                  ;; 06:7E43 $70
    ld   hl, wEntitiesPrivateState1Table          ;; 06:7E44 $21 $B0 $C2
    add  hl, bc                                   ;; 06:7E47 $09
    ld   a, [wShieldLevel]                        ;; 06:7E48 $FA $44 $DB
    ld   [hl], a                                  ;; 06:7E4B $77
    jr   jr_006_7E55                              ;; 06:7E4C $18 $07

.jr_7E4E
    inc  hl                                       ;; 06:7E4E $23
    inc  e                                        ;; 06:7E4F $1C
    ld   a, e                                     ;; 06:7E50 $7B
    cp   $02                                      ;; 06:7E51 $FE $02
    jr   nz, jr_006_7E37                          ;; 06:7E53 $20 $E2

jr_006_7E55:
    ld   a, [wLinkMotionState]                    ;; 06:7E55 $FA $1C $C1
    cp   LINK_MOTION_DEFAULT                      ;; 06:7E58 $FE $00
    ret  nz                                       ;; 06:7E5A $C0

    ldh  a, [hActiveEntityPosX]                   ;; 06:7E5B $F0 $EE
    ldh  [hLinkPositionX], a                      ;; 06:7E5D $E0 $98
    ldh  a, [hActiveEntityPosY]                   ;; 06:7E5F $F0 $EF
    ldh  [hLinkPositionY], a                      ;; 06:7E61 $E0 $99
    xor  a                                        ;; 06:7E63 $AF
    ld   [wIsLinkInTheAir], a                     ;; 06:7E64 $EA $46 $C1
    ldh  [hLinkPositionZ], a                      ;; 06:7E67 $E0 $A2
    call func_006_7F05                            ;; 06:7E69 $CD $05 $7F
    jp   func_006_7F05                            ;; 06:7E6C $C3 $05 $7F
