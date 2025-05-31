; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
KeeseSpriteVariants:: ;; 06:6708
.variant0
    db $42, OAM_GBC_PAL_0 | OAMF_PAL0
    db $42, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $40, OAM_GBC_PAL_0 | OAMF_PAL0
    db $40, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
KeeseCaveBSpriteVariants::
.variant0
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

; Approximately 0x0E * sin(pi/8 * index)
KeeseYSpeeds::
    db   $00, $05, $0A, $0D

; Approximately 0x0E * cos(pi/8 * index)
KeeseXSpeeds::
    db   $0E, $0D, $0A, $05, $00, $FB, $F6, $F3, $F2, $F3, $F6, $FB, $00, $05, $0A, $0D

; Basically the initial movement angle, used to index the two tables above.
KeeseInitialSpeedIndexPerDirection::
    db   $0C, $04, $08, $00

KeeseEntityHandler::
    ld   de, KeeseSpriteVariants                  ;; 06:6730 $11 $08 $67
    ldh  a, [hMapId]                              ;; 06:6733 $F0 $F7
    cp   MAP_CAVE_B                               ;; 06:6735 $FE $0A
    jr   nz, .render                              ;; 06:6737 $20 $03

    ld   de, KeeseCaveBSpriteVariants             ;; 06:6739 $11 $10 $67

.render:
    call RenderActiveEntitySpritesPair            ;; 06:673C $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:673F $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:6742 $CD $F7 $64
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:6745 $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ;; 06:6748 $F0 $F0
    JP_TABLE                                      ;; 06:674A
._00 dw KeeseRestingHandler
._01 dw KeeseFlyingHandler

KeeseRestingHandler::
    call GetEntityTransitionCountdown             ;; 06:674F $CD $05 $0C
    jp   nz, AnimateKeese                         ;; 06:6752 $C2 $E6 $67

    call GetEntityXDistanceToLink_06              ;; 06:6755 $CD $94 $65
    add  $20                                      ;; 06:6758 $C6 $20
    cp   $40                                      ;; 06:675A $FE $40
    jp   nc, AnimateKeese                         ;; 06:675C $D2 $E6 $67

    call GetEntityYDistanceToLink_06              ;; 06:675F $CD $A4 $65
    add  $20                                      ;; 06:6762 $C6 $20
    cp   $40                                      ;; 06:6764 $FE $40
    jp   nc, AnimateKeese                         ;; 06:6766 $D2 $E6 $67

    call GetEntityDirectionToLink_06              ;; 06:6769 $CD $B4 $65
    ld   d, $00                                   ;; 06:676C $16 $00
    ld   hl, KeeseInitialSpeedIndexPerDirection   ;; 06:676E $21 $2C $67
    add  hl, de                                   ;; 06:6771 $19
    ld   a, [hl]                                  ;; 06:6772 $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 06:6773 $21 $B0 $C2
    add  hl, bc                                   ;; 06:6776 $09
    ld   [hl], a                                  ;; 06:6777 $77
    call GetEntityTransitionCountdown             ;; 06:6778 $CD $05 $0C
    call GetRandomByte                            ;; 06:677B $CD $0D $28
    and  $3F                                      ;; 06:677E $E6 $3F
    add  $50                                      ;; 06:6780 $C6 $50
    ld   [hl], a                                  ;; 06:6782 $77
    ld   hl, wEntitiesPrivateState2Table          ;; 06:6783 $21 $C0 $C2
    add  hl, bc                                   ;; 06:6786 $09
    ld   [hl], $01                                ;; 06:6787 $36 $01
    call IncrementEntityState                     ;; 06:6789 $CD $12 $3B
    jp   AnimateKeese                             ;; 06:678C $C3 $E6 $67

KeeseFlyingHandler::
    call UpdateEntityPosWithSpeed_06              ;; 06:678F $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:6792 $CD $23 $3B
    call GetEntityTransitionCountdown             ;; 06:6795 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 06:6798 $20 $08

    ld   [hl], $20                                ;; 06:679A $36 $20
    call IncrementEntityState                     ;; 06:679C $CD $12 $3B
    ld   [hl], b                                  ;; 06:679F $70
    jr   AnimateKeese                             ;; 06:67A0 $18 $44

.skipIncrementState
    ld   hl, wEntitiesPrivateState3Table          ;; 06:67A2 $21 $D0 $C2
    add  hl, bc                                   ;; 06:67A5 $09
    inc  [hl]                                     ;; 06:67A6 $34
    ld   a, [hl]                                  ;; 06:67A7 $7E
    cp   $0A                                      ;; 06:67A8 $FE $0A
    jr   c, AnimateKeese                          ;; 06:67AA $38 $3A

    ; Every 0x0A frames, update movement angle and speed
    ld   [hl], b                                  ;; 06:67AC $70
    ld   hl, wEntitiesPrivateState2Table          ;; 06:67AD $21 $C0 $C2
    add  hl, bc                                   ;; 06:67B0 $09
    ld   a, [hl]                                  ;; 06:67B1 $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 06:67B2 $21 $B0 $C2
    add  hl, bc                                   ;; 06:67B5 $09
    add  [hl]                                     ;; 06:67B6 $86
    and  $0F                                      ;; 06:67B7 $E6 $0F
    ld   [hl], a                                  ;; 06:67B9 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 06:67BA $21 $B0 $C2
    add  hl, bc                                   ;; 06:67BD $09
    ld   e, [hl]                                  ;; 06:67BE $5E
    ld   d, b                                     ;; 06:67BF $50
    ld   hl, KeeseYSpeeds                         ;; 06:67C0 $21 $18 $67
    add  hl, de                                   ;; 06:67C3 $19
    ld   a, [hl]                                  ;; 06:67C4 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:67C5 $21 $50 $C2
    add  hl, bc                                   ;; 06:67C8 $09
    ld   [hl], a                                  ;; 06:67C9 $77
    ld   hl, KeeseXSpeeds                         ;; 06:67CA $21 $1C $67
    add  hl, de                                   ;; 06:67CD $19
    ld   a, [hl]                                  ;; 06:67CE $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:67CF $21 $40 $C2
    add  hl, bc                                   ;; 06:67D2 $09
    ld   [hl], a                                  ;; 06:67D3 $77
    call GetRandomByte                            ;; 06:67D4 $CD $0D $28
    and  $1F                                      ;; 06:67D7 $E6 $1F
    jr   nz, AnimateKeese                         ;; 06:67D9 $20 $0B

    call GetRandomByte                            ;; 06:67DB $CD $0D $28
    and  $02                                      ;; 06:67DE $E6 $02
    dec  a                                        ;; 06:67E0 $3D
    ld   hl, wEntitiesPrivateState2Table          ;; 06:67E1 $21 $C0 $C2
    add  hl, bc                                   ;; 06:67E4 $09
    ld   [hl], a                                  ;; 06:67E5 $77

AnimateKeese:
    ldh  a, [hActiveEntityState]                  ;; 06:67E6 $F0 $F0
    and  a                                        ;; 06:67E8 $A7
    jr   z, .resting                              ;; 06:67E9 $28 $07

    ldh  a, [hFrameCounter]                       ;; 06:67EB $F0 $E7
    rra                                           ;; 06:67ED $1F
    rra                                           ;; 06:67EE $1F
    rra                                           ;; 06:67EF $1F
    and  $01                                      ;; 06:67F0 $E6 $01

.resting
    jp   SetEntitySpriteVariant                   ;; 06:67F2 $C3 $0C $3B
