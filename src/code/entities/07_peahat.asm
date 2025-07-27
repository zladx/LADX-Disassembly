; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PeaHatSpriteVariants::
.variant0
    db $40, OAM_GBC_PAL_2 | OAMF_PAL0
    db $40, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $42, OAM_GBC_PAL_2 | OAMF_PAL0
    db $42, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

PeaHatEntityHandler::
    ld   de, PeaHatSpriteVariants                 ;; 07:6709 $11 $01 $67
    call RenderActiveEntitySpritesPair            ;; 07:670C $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:670F $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ;; 07:6712 $CD $C3 $7D
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:6715 $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ;; 07:6718 $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ;; 07:671B $CD $43 $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:671E $CD $23 $3B
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:6721 $21 $50 $C3
    add  hl, bc                                   ;; 07:6724 $09
    set  7, [hl]                                  ;; 07:6725 $CB $FE
    ld   hl, wEntitiesOptions1Table               ;; 07:6727 $21 $30 $C4
    add  hl, bc                                   ;; 07:672A $09
    set  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ;; 07:672B $CB $F6
    ldh  a, [hActiveEntityState]                  ;; 07:672D $F0 $F0
    JP_TABLE                                      ;; 07:672F
._00 dw PeaHatRestingHandler                      ;; 07:6730
._01 dw PeaHatTakingOffHandler                    ;; 07:6732
._02 dw PeaHatFlyingHandler                       ;; 07:6734

PeaHatRestingHandler::
    ld   hl, wEntitiesPosZTable                   ;; 07:6736 $21 $10 $C3
    add  hl, bc                                   ;; 07:6739 $09
    ld   a, [hl]                                  ;; 07:673A $7E
    and  a                                        ;; 07:673B $A7
    jr   z, .grounded                             ;; 07:673C $28 $09

    ldh  a, [hFrameCounter]                       ;; 07:673E $F0 $E7
    and  $07                                      ;; 07:6740 $E6 $07
    jr   nz, .groundedEnd                         ;; 07:6742 $20 $0F

    dec  [hl]                                     ;; 07:6744 $35
    jr   .groundedEnd                             ;; 07:6745 $18 $0C

.grounded
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:6747 $21 $50 $C3
    add  hl, bc                                   ;; 07:674A $09
    res  7, [hl]                                  ;; 07:674B $CB $BE
    ld   hl, wEntitiesOptions1Table               ;; 07:674D $21 $30 $C4
    add  hl, bc                                   ;; 07:6750 $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ;; 07:6751 $CB $B6

.groundedEnd
    ldh  a, [hFrameCounter]                       ;; 07:6753 $F0 $E7
    and  $07                                      ;; 07:6755 $E6 $07
    jr   nz, .updateYSpeedEnd                     ;; 07:6757 $20 $1D

    ld   hl, wEntitiesSpeedXTable                 ;; 07:6759 $21 $40 $C2
    add  hl, bc                                   ;; 07:675C $09
    ld   a, [hl]                                  ;; 07:675D $7E
    and  a                                        ;; 07:675E $A7
    jr   z, .updateXSpeedEnd                      ;; 07:675F $28 $07

    and  $80                                      ;; 07:6761 $E6 $80
    jr   z, .positiveX                            ;; 07:6763 $28 $02

    inc  [hl]                                     ;; 07:6765 $34
    inc  [hl]                                     ;; 07:6766 $34

.positiveX
    dec  [hl]                                     ;; 07:6767 $35

.updateXSpeedEnd
    call GetEntitySpeedYAddress                   ;; 07:6768 $CD $05 $40
    ld   a, [hl]                                  ;; 07:676B $7E
    and  a                                        ;; 07:676C $A7
    jr   z, .updateYSpeedEnd                      ;; 07:676D $28 $07

    and  $80                                      ;; 07:676F $E6 $80
    jr   z, .positiveY                            ;; 07:6771 $28 $02

    inc  [hl]                                     ;; 07:6773 $34
    inc  [hl]                                     ;; 07:6774 $34

.positiveY
    dec  [hl]                                     ;; 07:6775 $35

.updateYSpeedEnd
    call GetEntitySlowTransitionCountdown         ;; 07:6776 $CD $FB $0B
    jr   nz, .skipIncrementState                  ;; 07:6779 $20 $03

    call IncrementEntityState                     ;; 07:677B $CD $12 $3B

.skipIncrementState
    ld   hl, wEntitiesPrivateState1Table          ;; 07:677E $21 $B0 $C2
    add  hl, bc                                   ;; 07:6781 $09
    ld   a, [hl]                                  ;; 07:6782 $7E
    and  a                                        ;; 07:6783 $A7
    jr   z, .decAnimationSpeedEnd                 ;; 07:6784 $28 $07

    ldh  a, [hFrameCounter]                       ;; 07:6786 $F0 $E7
    and  $1F                                      ;; 07:6788 $E6 $1F
    jr   nz, .decAnimationSpeedEnd                ;; 07:678A $20 $01

    dec  [hl]                                     ;; 07:678C $35

.decAnimationSpeedEnd
    jp   AnimatePeaHat                            ;; 07:678D $C3 $AE $67

PeaHatTakingOffHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 07:6790 $21 $B0 $C2
    add  hl, bc                                   ;; 07:6793 $09
    ld   a, [hl]                                  ;; 07:6794 $7E
    cp   $08                                      ;; 07:6795 $FE $08
    jr   c, .skipIncrementState                   ;; 07:6797 $38 $0E

    call GetEntitySlowTransitionCountdown         ;; 07:6799 $CD $FB $0B
    call GetRandomByte                            ;; 07:679C $CD $0D $28
    and  $1F                                      ;; 07:679F $E6 $1F
    add  $80                                      ;; 07:67A1 $C6 $80
    ld   [hl], a                                  ;; 07:67A3 $77
    jp   IncrementEntityState                     ;; 07:67A4 $C3 $12 $3B

.skipIncrementState
    ldh  a, [hFrameCounter]                       ;; 07:67A7 $F0 $E7
    and  $0F                                      ;; 07:67A9 $E6 $0F
    jr   nz, AnimatePeaHat                        ;; 07:67AB $20 $01

    inc  [hl]                                     ;; 07:67AD $34

AnimatePeaHat::
    ld   hl, wEntitiesPrivateState1Table          ;; 07:67AE $21 $B0 $C2
    add  hl, bc                                   ;; 07:67B1 $09
    ld   a, [hl]                                  ;; 07:67B2 $7E
    ld   hl, wEntitiesInertiaTable                ;; 07:67B3 $21 $D0 $C3
    add  hl, bc                                   ;; 07:67B6 $09
    add  [hl]                                     ;; 07:67B7 $86
    ld   [hl], a                                  ;; 07:67B8 $77
    rra                                           ;; 07:67B9 $1F
    rra                                           ;; 07:67BA $1F
    rra                                           ;; 07:67BB $1F
    rra                                           ;; 07:67BC $1F
    rra                                           ;; 07:67BD $1F
    and  $01                                      ;; 07:67BE $E6 $01
    jp   SetEntitySpriteVariant                   ;; 07:67C0 $C3 $0C $3B

; Approximately 0x0E * sin(pi/8 * index)
PeaHatYSpeeds::
    db   $00, $05, $0A, $0D

; Approximately 0x0E * cos(pi/8 * index)
PeaHatXSpeeds::
    db   $0E, $0D, $0A, $05, $00, $FB, $F6, $F3, $F2, $F3, $F6, $FB, $00, $05, $0A, $0D

PeaHatFlyingHandler::
    call AnimatePeaHat                            ;; 07:67D7 $CD $AE $67
    ld   hl, wEntitiesPosZTable                   ;; 07:67DA $21 $10 $C3
    add  hl, bc                                   ;; 07:67DD $09
    ld   a, [hl]                                  ;; 07:67DE $7E
    cp   $10                                      ;; 07:67DF $FE $10
    jr   z, .reachedMaxHeight                     ;; 07:67E1 $28 $08

    ldh  a, [hFrameCounter]                       ;; 07:67E3 $F0 $E7
    and  $07                                      ;; 07:67E5 $E6 $07
    jr   nz, .return                              ;; 07:67E7 $20 $01

    inc  [hl]                                     ;; 07:67E9 $34

.return
    ret                                           ;; 07:67EA $C9

.reachedMaxHeight
    call GetEntitySlowTransitionCountdown         ;; 07:67EB $CD $FB $0B
    jr   nz, .skipIncrementState                  ;; 07:67EE $20 $06

    ld   [hl], $60                                ;; 07:67F0 $36 $60
    call IncrementEntityState                     ;; 07:67F2 $CD $12 $3B
    ld   [hl], b                                  ;; 07:67F5 $70

.skipIncrementState
    ld   hl, wEntitiesPrivateState3Table          ;; 07:67F6 $21 $D0 $C2
    add  hl, bc                                   ;; 07:67F9 $09
    inc  [hl]                                     ;; 07:67FA $34
    ld   a, [hl]                                  ;; 07:67FB $7E
    cp   $18                                      ;; 07:67FC $FE $18
    jr   c, .updateSpeedEnd                       ;; 07:67FE $38 $3D

    ld   [hl], b                                  ;; 07:6800 $70
    ld   hl, wEntitiesPrivateState2Table          ;; 07:6801 $21 $C0 $C2
    add  hl, bc                                   ;; 07:6804 $09
    ld   a, [hl]                                  ;; 07:6805 $7E
    ld   hl, wEntitiesPrivateState4Table          ;; 07:6806 $21 $40 $C4
    add  hl, bc                                   ;; 07:6809 $09
    add  [hl]                                     ;; 07:680A $86
    and  $0F                                      ;; 07:680B $E6 $0F
    ld   [hl], a                                  ;; 07:680D $77
    ld   hl, wEntitiesPrivateState4Table          ;; 07:680E $21 $40 $C4
    add  hl, bc                                   ;; 07:6811 $09
    ld   e, [hl]                                  ;; 07:6812 $5E
    ld   d, b                                     ;; 07:6813 $50
    ld   hl, PeaHatYSpeeds                        ;; 07:6814 $21 $C3 $67
    add  hl, de                                   ;; 07:6817 $19
    ld   a, [hl]                                  ;; 07:6818 $7E
    sra  a                                        ;; 07:6819 $CB $2F
    call GetEntitySpeedYAddress                   ;; 07:681B $CD $05 $40
    ld   [hl], a                                  ;; 07:681E $77
    ld   hl, PeaHatXSpeeds                        ;; 07:681F $21 $C7 $67
    add  hl, de                                   ;; 07:6822 $19
    ld   a, [hl]                                  ;; 07:6823 $7E
    sra  a                                        ;; 07:6824 $CB $2F
    ld   hl, wEntitiesSpeedXTable                 ;; 07:6826 $21 $40 $C2
    add  hl, bc                                   ;; 07:6829 $09
    ld   [hl], a                                  ;; 07:682A $77
    call GetRandomByte                            ;; 07:682B $CD $0D $28
    and  $07                                      ;; 07:682E $E6 $07
    jr   nz, .updateSpeedEnd                      ;; 07:6830 $20 $0B

    call GetRandomByte                            ;; 07:6832 $CD $0D $28
    and  $02                                      ;; 07:6835 $E6 $02
    dec  a                                        ;; 07:6837 $3D
    ld   hl, wEntitiesPrivateState2Table          ;; 07:6838 $21 $C0 $C2
    add  hl, bc                                   ;; 07:683B $09
    ld   [hl], a                                  ;; 07:683C $77

.updateSpeedEnd
    ret                                           ;; 07:683D $C9
