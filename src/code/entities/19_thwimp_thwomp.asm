
Data_019_554B::
    db   $00, $00, $50, $02, $00, $08, $52, $02, $00, $10, $52, $22, $00, $18, $50, $22
    db   $10, $00, $54, $02, $10, $08, $56, $02, $10, $10, $56, $22, $10, $18, $54, $22

Data_019_556B::
    db   $00, $00, $50, $03, $00, $08, $52, $03, $00, $10, $52, $23, $00, $18, $50, $23
    db   $10, $00, $54, $03, $10, $08, $56, $03, $10, $10, $56, $23, $10, $18, $54, $23

ThwompRammableEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:558B $F0 $F1
    and  a                                        ;; 19:558D $A7
    ld   a, $00                                   ;; 19:558E $3E $00
    jr   z, .jr_5594                              ;; 19:5590 $28 $02

    ld   a, $08                                   ;; 19:5592 $3E $08

.jr_5594
    ldh  [hActiveEntityTilesOffset], a            ;; 19:5594 $E0 $F5
    ld   hl, Data_019_554B                        ;; 19:5596 $21 $4B $55
    ldh  a, [hActiveEntityState]                  ;; 19:5599 $F0 $F0
    and  a                                        ;; 19:559B $A7
    jr   z, .jr_55A1                              ;; 19:559C $28 $03

    ld   hl, Data_019_556B                        ;; 19:559E $21 $6B $55

.jr_55A1
    ld   c, $08                                   ;; 19:55A1 $0E $08
    call RenderActiveEntitySpritesRect            ;; 19:55A3 $CD $E6 $3C
    call ReturnIfNonInteractive_19                ;; 19:55A6 $CD $3D $7D
    call DecrementEntityIgnoreHitsCountdown       ;; 19:55A9 $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ;; 19:55AC $F0 $F0
    JP_TABLE                                      ;; 19:55AE
._00 dw ThwompRammableState0Handler
._01 dw ThwompRammableState1Handler
._02 dw ThwompRammableState2Handler

ThwompRammableState0Handler::
    call PushLinkOutOfEntity_19                   ;; 19:55B5 $CD $A2 $7C
    ret  nc                                       ;; 19:55B8 $D0

    and  a                                        ;; 19:55B9 $A7
    ret  z                                        ;; 19:55BA $C8

    call ResetSpinAttack                          ;; 19:55BB $CD $AF $0C

.jr_55BE
    ldh  a, [hLinkSpeedX]                         ;; 19:55BE $F0 $9A
    cpl                                           ;; 19:55C0 $2F
    inc  a                                        ;; 19:55C1 $3C
    sra  a                                        ;; 19:55C2 $CB $2F
    sra  a                                        ;; 19:55C4 $CB $2F
    ldh  [hLinkSpeedX], a                         ;; 19:55C6 $E0 $9A
    ld   a, $E8                                   ;; 19:55C8 $3E $E8

.jr_55CA
    ldh  [hLinkSpeedY], a                         ;; 19:55CA $E0 $9B
    call GetEntityTransitionCountdown             ;; 19:55CC $CD $05 $0C
    ld   [hl], $20                                ;; 19:55CF $36 $20
    ld   a, $01                                   ;; 19:55D1 $3E $01
    call SetEntitySpriteVariant                   ;; 19:55D3 $CD $0C $3B
    ld   a, JINGLE_STRONG_BUMP                    ;; 19:55D6 $3E $0B
    ldh  [hJingle], a                             ;; 19:55D8 $E0 $F2
    jp   IncrementEntityState                     ;; 19:55DA $C3 $12 $3B

ThwompRammableState1Handler::
    call PushLinkOutOfEntity_19                   ;; 19:55DD $CD $A2 $7C
    call GetEntityTransitionCountdown             ;; 19:55E0 $CD $05 $0C
    cp   $01                                      ;; 19:55E3 $FE $01
    jr   nz, .jr_55EC                             ;; 19:55E5 $20 $05

    ld   hl, hJingle                              ;; 19:55E7 $21 $F2 $FF
    ld   [hl], JINGLE_FALL_DOWN                   ;; 19:55EA $36 $08

.jr_55EC
    and  a                                        ;; 19:55EC $A7
    ret  nz                                       ;; 19:55ED $C0

    call UpdateEntityYPosWithSpeed_19             ;; 19:55EE $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                 ;; 19:55F1 $21 $50 $C2
    add  hl, bc                                   ;; 19:55F4 $09
    ld   a, [hl]                                  ;; 19:55F5 $7E
    cp   $70                                      ;; 19:55F6 $FE $70
    jr   nc, .jr_55FD                             ;; 19:55F8 $30 $03

    add  $03                                      ;; 19:55FA $C6 $03
    ld   [hl], a                                  ;; 19:55FC $77

.jr_55FD
    ld   hl, wEntitiesPosYTable                   ;; 19:55FD $21 $10 $C2
    add  hl, bc                                   ;; 19:5600 $09
    ld   a, [hl]                                  ;; 19:5601 $7E
    add  $10                                      ;; 19:5602 $C6 $10
    ld   [hl], a                                  ;; 19:5604 $77
    ldh  a, [hActiveEntityPosY]                   ;; 19:5605 $F0 $EF
    add  $10                                      ;; 19:5607 $C6 $10
    ldh  [hActiveEntityPosY], a                   ;; 19:5609 $E0 $EF

.jr_560B
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:560B $CD $23 $3B
    ld   hl, wEntitiesPosYTable                   ;; 19:560E $21 $10 $C2
    add  hl, bc                                   ;; 19:5611 $09
    ld   a, [hl]                                  ;; 19:5612 $7E
    sub  $10                                      ;; 19:5613 $D6 $10
    ld   [hl], a                                  ;; 19:5615 $77
    ldh  a, [hActiveEntityPosY]                   ;; 19:5616 $F0 $EF
    sub  $10                                      ;; 19:5618 $D6 $10
    ldh  [hActiveEntityPosY], a                   ;; 19:561A $E0 $EF
    ld   hl, wEntitiesCollisionsTable             ;; 19:561C $21 $A0 $C2
    add  hl, bc                                   ;; 19:561F $09
    ld   a, [hl]                                  ;; 19:5620 $7E
    and  a                                        ;; 19:5621 $A7
    ret  z                                        ;; 19:5622 $C8

    call PlayBombExplosionSfx                     ;; 19:5623 $CD $4B $0C
    call GetEntityTransitionCountdown             ;; 19:5626 $CD $05 $0C
    ld   [hl], $30                                ;; 19:5629 $36 $30
    ld   a, $30                                   ;; 19:562B $3E $30
    ld   [wScreenShakeCountdown], a               ;; 19:562D $EA $57 $C1
    ld   a, $04                                   ;; 19:5630 $3E $04
    ld   [wC158], a                               ;; 19:5632 $EA $58 $C1
    jp   IncrementEntityState                     ;; 19:5635 $C3 $12 $3B

ThwompRammableState2Handler::
    jp   func_019_58A2                            ;; 19:5638 $C3 $A2 $58

Data_019_563B::
    db   $00, $00, $01, $01, $01, $02, $02, $02, $00, $00, $0F, $0F, $0F, $0E, $0E, $0E
    db   $08, $08, $07, $07, $07, $06, $06, $06, $08, $08, $09, $09, $09, $0A, $0A, $0A

Data_019_565B::
    db   $04, $04, $03, $03, $03, $02, $02, $02, $0C, $0C, $0D, $0D, $0D, $0E, $0E, $0E
    db   $04, $04, $05, $05, $05, $06, $06, $06, $0C, $0C, $0B, $0B, $0B, $0A, $0A, $0A

func_019_567B::
    ldh  a, [hMultiPurpose0]                      ;; 19:567B $F0 $D7
    rlca                                          ;; 19:567D $07
    and  $01                                      ;; 19:567E $E6 $01
    ld   e, a                                     ;; 19:5680 $5F
    ldh  a, [hMultiPurpose1]                      ;; 19:5681 $F0 $D8
    rlca                                          ;; 19:5683 $07
    rla                                           ;; 19:5684 $17
    and  $02                                      ;; 19:5685 $E6 $02
    or   e                                        ;; 19:5687 $B3
    rla                                           ;; 19:5688 $17
    rla                                           ;; 19:5689 $17
    rla                                           ;; 19:568A $17
    and  $18                                      ;; 19:568B $E6 $18
    ld   h, a                                     ;; 19:568D $67
    ldh  a, [hMultiPurpose1]                      ;; 19:568E $F0 $D8
    bit  7, a                                     ;; 19:5690 $CB $7F
    jr   z, .jr_5696                              ;; 19:5692 $28 $02

    cpl                                           ;; 19:5694 $2F
    inc  a                                        ;; 19:5695 $3C

.jr_5696
    ld   d, a                                     ;; 19:5696 $57
    ldh  a, [hMultiPurpose0]                      ;; 19:5697 $F0 $D7
    bit  7, a                                     ;; 19:5699 $CB $7F
    jr   z, .jr_569F                              ;; 19:569B $28 $02

    cpl                                           ;; 19:569D $2F
    inc  a                                        ;; 19:569E $3C

.jr_569F
    cp   d                                        ;; 19:569F $BA
    jr   nc, .jr_56AF                             ;; 19:56A0 $30 $0D

    sra  a                                        ;; 19:56A2 $CB $2F
    sra  a                                        ;; 19:56A4 $CB $2F
    add  h                                        ;; 19:56A6 $84
    ld   e, a                                     ;; 19:56A7 $5F
    ld   d, b                                     ;; 19:56A8 $50
    ld   hl, Data_019_563B                        ;; 19:56A9 $21 $3B $56
    add  hl, de                                   ;; 19:56AC $19
    ld   a, [hl]                                  ;; 19:56AD $7E
    ret                                           ;; 19:56AE $C9

.jr_56AF
    ld   a, d                                     ;; 19:56AF $7A
    sra  a                                        ;; 19:56B0 $CB $2F
    sra  a                                        ;; 19:56B2 $CB $2F
    add  h                                        ;; 19:56B4 $84
    ld   e, a                                     ;; 19:56B5 $5F
    ld   d, b                                     ;; 19:56B6 $50
    ld   hl, Data_019_565B                        ;; 19:56B7 $21 $5B $56
    add  hl, de                                   ;; 19:56BA $19
    ld   a, [hl]                                  ;; 19:56BB $7E
    ret                                           ;; 19:56BC $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
ThwimpSpriteVariants::
.variant0
    db $5A, $03
    db $5A, $23
.variant1
    db $58, $02
    db $58, $22

ThwimpEntityHandler::
    ld   de, ThwimpSpriteVariants                 ;; 19:56C5 $11 $BD $56
    call RenderActiveEntitySpritesPair            ;; 19:56C8 $CD $C0 $3B
    call ReturnIfNonInteractive_19                ;; 19:56CB $CD $3D $7D
    call DecrementEntityIgnoreHitsCountdown       ;; 19:56CE $CD $56 $0C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 19:56D1 $CD $39 $3B
    xor  a                                        ;; 19:56D4 $AF
    call SetEntitySpriteVariant                   ;; 19:56D5 $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ;; 19:56D8 $F0 $F0
    JP_TABLE                                      ;; 19:56DA
._00 dw ThwimpState0Handler
._01 dw ThwimpState1Handler
._02 dw ThwimpState2Handler
._03 dw ThwimpState3Handler

ThwimpState0Handler::
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:56E3 $F0 $EC
    ld   hl, wEntitiesPrivateState1Table          ;; 19:56E5 $21 $B0 $C2
    add  hl, bc                                   ;; 19:56E8 $09
    ld   [hl], a                                  ;; 19:56E9 $77
    call IncrementEntityState                     ;; 19:56EA $CD $12 $3B

ThwimpState1Handler::
    call GetEntityTransitionCountdown             ;; 19:56ED $CD $05 $0C
    ret  nz                                       ;; 19:56F0 $C0

    call EntityLinkPositionXDifference_19         ;; 19:56F1 $CD $0B $7E
    ld   e, a                                     ;; 19:56F4 $5F
    add  $28                                      ;; 19:56F5 $C6 $28
    cp   $50                                      ;; 19:56F7 $FE $50
    ret  nc                                       ;; 19:56F9 $D0

    ld   a, $01                                   ;; 19:56FA $3E $01
    call SetEntitySpriteVariant                   ;; 19:56FC $CD $0C $3B
    ld   a, e                                     ;; 19:56FF $7B
    add  $18                                      ;; 19:5700 $C6 $18
    cp   $30                                      ;; 19:5702 $FE $30
    ret  nc                                       ;; 19:5704 $D0

    call ClearEntitySpeed                         ;; 19:5705 $CD $7F $3D
    call GetEntityTransitionCountdown             ;; 19:5708 $CD $05 $0C
    ld   [hl], $08                                ;; 19:570B $36 $08
    jp   IncrementEntityState                     ;; 19:570D $C3 $12 $3B

ThwimpState2Handler::
    ld   a, $01                                   ;; 19:5710 $3E $01
    call SetEntitySpriteVariant                   ;; 19:5712 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 19:5715 $CD $05 $0C
    cp   $01                                      ;; 19:5718 $FE $01
    jr   nz, .jr_5721                             ;; 19:571A $20 $05

    ld   hl, hJingle                              ;; 19:571C $21 $F2 $FF
    ld   [hl], JINGLE_FALL_DOWN                   ;; 19:571F $36 $08

.jr_5721
    and  a                                        ;; 19:5721 $A7
    ret  nz                                       ;; 19:5722 $C0

    call UpdateEntityYPosWithSpeed_19             ;; 19:5723 $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                 ;; 19:5726 $21 $50 $C2
    add  hl, bc                                   ;; 19:5729 $09
    ld   a, [hl]                                  ;; 19:572A $7E
    cp   $70                                      ;; 19:572B $FE $70
    jr   nc, .jr_5732                             ;; 19:572D $30 $03

    add  $03                                      ;; 19:572F $C6 $03
    ld   [hl], a                                  ;; 19:5731 $77

.jr_5732
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:5732 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 19:5735 $21 $A0 $C2
    add  hl, bc                                   ;; 19:5738 $09
    ld   a, [hl]                                  ;; 19:5739 $7E
    and  a                                        ;; 19:573A $A7
    ret  z                                        ;; 19:573B $C8

    ld   a, JINGLE_BUMP                           ;; 19:573C $3E $09
    ldh  [hJingle], a                             ;; 19:573E $E0 $F2
    call GetEntityTransitionCountdown             ;; 19:5740 $CD $05 $0C
    ld   [hl], $30                                ;; 19:5743 $36 $30
    jp   IncrementEntityState                     ;; 19:5745 $C3 $12 $3B

ThwimpState3Handler::
    call GetEntityTransitionCountdown             ;; 19:5748 $CD $05 $0C
    ret  nz                                       ;; 19:574B $C0

    ld   hl, wEntitiesPrivateState1Table          ;; 19:574C $21 $B0 $C2
    add  hl, bc                                   ;; 19:574F $09
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:5750 $F0 $EC
    cp   [hl]                                     ;; 19:5752 $BE
    jr   nz, .jr_575F                             ;; 19:5753 $20 $0A

    call IncrementEntityState                     ;; 19:5755 $CD $12 $3B
    ld   [hl], b                                  ;; 19:5758 $70
    call GetEntityTransitionCountdown             ;; 19:5759 $CD $05 $0C
    ld   [hl], $20                                ;; 19:575C $36 $20
    ret                                           ;; 19:575E $C9

.jr_575F
    ld   hl, wEntitiesSpeedYTable                 ;; 19:575F $21 $50 $C2
    add  hl, bc                                   ;; 19:5762 $09
    ld   [hl], $F8                                ;; 19:5763 $36 $F8
    jp   UpdateEntityYPosWithSpeed_19             ;; 19:5765 $C3 $BB $7D

Data_019_5768::
    db   $00, $00, $70, $07, $00, $08, $72, $07, $00, $10, $72, $27, $00, $18, $70, $27
    db   $10, $00, $74, $07, $10, $08, $76, $07, $10, $10, $76, $27, $10, $18, $74, $27

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
ThwompSpriteVariants::
.variant0
    db $FF, $07
    db $FF, $07
.variant1
    db $6E, $07
    db $7E, $07
.variant2
    db $7A, $07
    db $7A, $27
.variant3
    db $7E, $27
    db $6E, $27
.variant4
    db $7E, $27
    db $7C, $27
.variant5
    db $7E, $27
    db $6C, $27
.variant6
    db $78, $07
    db $78, $27
.variant7
    db $6C, $07
    db $7E, $07
.variant8
    db $7C, $07
    db $7E, $07

Data_019_57AC::
    db   $04, $05, $06, $07, $08, $01, $02, $03

ThwompEntityHandler::
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:57B4 $F0 $EC
    add  $08                                      ;; 19:57B6 $C6 $08
    ldh  [hActiveEntityVisualPosY], a             ;; 19:57B8 $E0 $EC
    ldh  a, [hActiveEntityPosX]                   ;; 19:57BA $F0 $EE
    add  $08                                      ;; 19:57BC $C6 $08
    ldh  [hActiveEntityPosX], a                   ;; 19:57BE $E0 $EE
    ld   de, ThwompSpriteVariants                 ;; 19:57C0 $11 $88 $57
    call RenderActiveEntitySpritesPair            ;; 19:57C3 $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 19:57C6 $CD $8A $3D
    ld   hl, Data_019_5768                        ;; 19:57C9 $21 $68 $57
    ld   c, $08                                   ;; 19:57CC $0E $08
    call RenderActiveEntitySpritesRect            ;; 19:57CE $CD $E6 $3C
    ld   a, $06                                   ;; 19:57D1 $3E $06
    call func_015_7964_trampoline                 ;; 19:57D3 $CD $A0 $3D
    call ReturnIfNonInteractive_19                ;; 19:57D6 $CD $3D $7D
    call DecrementEntityIgnoreHitsCountdown       ;; 19:57D9 $CD $56 $0C
    call label_3B70                               ;; 19:57DC $CD $70 $3B
    call func_019_58A2                            ;; 19:57DF $CD $A2 $58
    ldh  a, [hActiveEntityState]                  ;; 19:57E2 $F0 $F0
    JP_TABLE                                      ;; 19:57E4
._00 dw ThwompState0Handler
._01 dw ThwompState1Handler
._02 dw ThwompState2Handler
._03 dw ThwompState3Handler

ThwompState0Handler::
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:57ED $F0 $EC
    ld   hl, wEntitiesPrivateState1Table          ;; 19:57EF $21 $B0 $C2
    add  hl, bc                                   ;; 19:57F2 $09
    ld   [hl], a                                  ;; 19:57F3 $77
    call IncrementEntityState                     ;; 19:57F4 $CD $12 $3B

ThwompState1Handler::
    call GetEntityTransitionCountdown             ;; 19:57F7 $CD $05 $0C
    ret  nz                                       ;; 19:57FA $C0

.jr_57FB
    call EntityLinkPositionXDifference_19         ;; 19:57FB $CD $0B $7E
    add  $F8                                      ;; 19:57FE $C6 $F8
    ld   e, a                                     ;; 19:5800 $5F
    add  $28                                      ;; 19:5801 $C6 $28
    cp   $50                                      ;; 19:5803 $FE $50
    jr   nc, .jr_581D                             ;; 19:5805 $30 $16

    ld   a, e                                     ;; 19:5807 $7B
    add  $18                                      ;; 19:5808 $C6 $18
    cp   $30                                      ;; 19:580A $FE $30
    jr   nc, .jr_581D                             ;; 19:580C $30 $0F

    call ClearEntitySpeed                         ;; 19:580E $CD $7F $3D
    ld   a, JINGLE_FALL_DOWN                      ;; 19:5811 $3E $08
    ldh  [hJingle], a                             ;; 19:5813 $E0 $F2
    ld   a, $00                                   ;; 19:5815 $3E $00
    call SetEntitySpriteVariant                   ;; 19:5817 $CD $0C $3B
    jp   IncrementEntityState                     ;; 19:581A $C3 $12 $3B

.jr_581D
    ldh  a, [hFrameCounter]                       ;; 19:581D $F0 $E7
    and  $07                                      ;; 19:581F $E6 $07
    ret  nz                                       ;; 19:5821 $C0

    ld   a, $1F                                   ;; 19:5822 $3E $1F
    call GetVectorTowardsLink_trampoline          ;; 19:5824 $CD $B5 $3B
    call func_019_567B                            ;; 19:5827 $CD $7B $56
    rra                                           ;; 19:582A $1F
    and  $07                                      ;; 19:582B $E6 $07
    ld   e, a                                     ;; 19:582D $5F
    ld   d, b                                     ;; 19:582E $50
    ld   hl, Data_019_57AC                        ;; 19:582F $21 $AC $57
    add  hl, de                                   ;; 19:5832 $19
    ld   a, [hl]                                  ;; 19:5833 $7E
    jp   SetEntitySpriteVariant                   ;; 19:5834 $C3 $0C $3B

ThwompState2Handler::
    call UpdateEntityYPosWithSpeed_19             ;; 19:5837 $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                 ;; 19:583A $21 $50 $C2
    add  hl, bc                                   ;; 19:583D $09
    ld   a, [hl]                                  ;; 19:583E $7E
    cp   $70                                      ;; 19:583F $FE $70
    jr   nc, .jr_5846                             ;; 19:5841 $30 $03

    add  $03                                      ;; 19:5843 $C6 $03
    ld   [hl], a                                  ;; 19:5845 $77

.jr_5846
    ld   hl, wEntitiesPosYTable                   ;; 19:5846 $21 $10 $C2
    add  hl, bc                                   ;; 19:5849 $09
    ld   a, [hl]                                  ;; 19:584A $7E
    add  $10                                      ;; 19:584B $C6 $10
    ld   [hl], a                                  ;; 19:584D $77
    ldh  a, [hActiveEntityPosY]                   ;; 19:584E $F0 $EF
    add  $10                                      ;; 19:5850 $C6 $10
    ldh  [hActiveEntityPosY], a                   ;; 19:5852 $E0 $EF
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:5854 $CD $23 $3B
    ld   hl, wEntitiesPosYTable                   ;; 19:5857 $21 $10 $C2
    add  hl, bc                                   ;; 19:585A $09
    ld   a, [hl]                                  ;; 19:585B $7E
    sub  $10                                      ;; 19:585C $D6 $10
    ld   [hl], a                                  ;; 19:585E $77
    ldh  a, [hActiveEntityPosY]                   ;; 19:585F $F0 $EF
    sub  $10                                      ;; 19:5861 $D6 $10
    ldh  [hActiveEntityPosY], a                   ;; 19:5863 $E0 $EF
    ld   hl, wEntitiesCollisionsTable             ;; 19:5865 $21 $A0 $C2
    add  hl, bc                                   ;; 19:5868 $09
    ld   a, [hl]                                  ;; 19:5869 $7E
    and  a                                        ;; 19:586A $A7
    ret  z                                        ;; 19:586B $C8

    call PlayBombExplosionSfx                     ;; 19:586C $CD $4B $0C
    call GetEntityTransitionCountdown             ;; 19:586F $CD $05 $0C
    ld   [hl], $30                                ;; 19:5872 $36 $30
    ld   a, $30                                   ;; 19:5874 $3E $30
    ld   [wScreenShakeCountdown], a               ;; 19:5876 $EA $57 $C1
    ld   a, $04                                   ;; 19:5879 $3E $04
    ld   [wC158], a                               ;; 19:587B $EA $58 $C1
    jp   IncrementEntityState                     ;; 19:587E $C3 $12 $3B

ThwompState3Handler::
    call GetEntityTransitionCountdown             ;; 19:5881 $CD $05 $0C
    ret  nz                                       ;; 19:5884 $C0

    ld   hl, wEntitiesPrivateState1Table          ;; 19:5885 $21 $B0 $C2
    add  hl, bc                                   ;; 19:5888 $09
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:5889 $F0 $EC
    cp   [hl]                                     ;; 19:588B $BE
    jr   nz, .jr_5899                             ;; 19:588C $20 $0B

    call IncrementEntityState                     ;; 19:588E $CD $12 $3B
    ld   [hl], $01                                ;; 19:5891 $36 $01
    call GetEntityTransitionCountdown             ;; 19:5893 $CD $05 $0C
    ld   [hl], $20                                ;; 19:5896 $36 $20
    ret                                           ;; 19:5898 $C9

.jr_5899
    ld   hl, wEntitiesSpeedYTable                 ;; 19:5899 $21 $50 $C2
    add  hl, bc                                   ;; 19:589C $09
    ld   [hl], $F8                                ;; 19:589D $36 $F8
    jp   UpdateEntityYPosWithSpeed_19             ;; 19:589F $C3 $BB $7D

func_019_58A2::
    call CheckLinkCollisionWithEnemy_trampoline   ;; 19:58A2 $CD $5A $3B
    ret  nc                                       ;; 19:58A5 $D0

    call EntityLinkPositionYDifference_19         ;; 19:58A6 $CD $1B $7E
    add  $08                                      ;; 19:58A9 $C6 $08
    bit  7, a                                     ;; 19:58AB $CB $7F
    jr   nz, .jr_58C0                             ;; 19:58AD $20 $11

    call HurtBySpikes_trampoline                  ;; 19:58AF $CD $18 $3B
    ld   a, $10                                   ;; 19:58B2 $3E $10
    call GetVectorTowardsLink_trampoline          ;; 19:58B4 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 19:58B7 $F0 $D7
    ldh  [hLinkSpeedY], a                         ;; 19:58B9 $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 19:58BB $F0 $D8
    ldh  [hLinkSpeedX], a                         ;; 19:58BD $E0 $9A
    ret                                           ;; 19:58BF $C9

.jr_58C0
    ldh  a, [hLinkSpeedY]                         ;; 19:58C0 $F0 $9B
    and  $80                                      ;; 19:58C2 $E6 $80
    jr   nz, .ret_58D8                            ;; 19:58C4 $20 $12

    ld   hl, wEntitiesPosYTable                   ;; 19:58C6 $21 $10 $C2
    add  hl, bc                                   ;; 19:58C9 $09
    ld   a, [hl]                                  ;; 19:58CA $7E
    sub  $10                                      ;; 19:58CB $D6 $10
    ldh  [hLinkPositionY], a                      ;; 19:58CD $E0 $99
    ld   a, $02                                   ;; 19:58CF $3E $02
    ldh  [hLinkSpeedY], a                         ;; 19:58D1 $E0 $9B
    ld   a, $01                                   ;; 19:58D3 $3E $01
    ld   [wC147], a                               ;; 19:58D5 $EA $47 $C1

.ret_58D8
    ret                                           ;; 19:58D8 $C9
