; Note: this entity, unlike most others, use all 4 spriteslots available.
;
; Normally only 2 spriteslots can be loaded on a map transition, but this
; boss is behind a warp. And warps will load all 4 tileslots at once.
AnglerFishEntityHandler::
    ld   hl, wEntitiesPrivateState3Table          ;; 05:5576 $21 $D0 $C2
    add  hl, bc                                   ;; 05:5579 $09
    ld   a, [hl]                                  ;; 05:557A $7E
    JP_TABLE                                      ;; 05:557B
._00 dw func_005_5584                             ;; 05:557C
._01 dw func_005_593A                             ;; 05:557E
._02 dw func_005_5901                             ;; 05:5580
._03 dw func_005_5984                             ;; 05:5582

func_005_5584::
    call BossIntro                                ;; 05:5584 $CD $E8 $3E
    call func_005_58D4                            ;; 05:5587 $CD $D4 $58
    ldh  a, [hActiveEntityStatus]                 ;; 05:558A $F0 $EA
    cp   $05                                      ;; 05:558C $FE $05
    jr   z, func_005_55CA                         ;; 05:558E $28 $3A

    ld   [wC1C6], a                               ;; 05:5590 $EA $C6 $C1
    ld   hl, wEntitiesPrivateState2Table          ;; 05:5593 $21 $C0 $C2
    add  hl, bc                                   ;; 05:5596 $09
    ld   a, [hl]                                  ;; 05:5597 $7E
    JP_TABLE                                      ;; 05:5598
._00 dw func_005_559D                             ;; 05:5599
._01 dw func_005_55AB                             ;; 05:559B

func_005_559D::
    call GetEntityTransitionCountdown             ;; 05:559D $CD $05 $0C
    ld   [hl], $FF                                ;; 05:55A0 $36 $FF
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:55A2 $21 $20 $C4
    add  hl, bc                                   ;; 05:55A5 $09
    ld   [hl], $FF                                ;; 05:55A6 $36 $FF
    jp   label_005_6347                           ;; 05:55A8 $C3 $47 $63

func_005_55AB::
    call GetEntityTransitionCountdown             ;; 05:55AB $CD $05 $0C
    jp   z, label_005_55BC                        ;; 05:55AE $CA $BC $55

    ld   hl, wEntitiesFlashCountdownTable         ;; 05:55B1 $21 $20 $C4
    add  hl, bc                                   ;; 05:55B4 $09
    ld   [hl], a                                  ;; 05:55B5 $77
    cp   $80                                      ;; 05:55B6 $FE $80
    ret  nc                                       ;; 05:55B8 $D0

    jp   label_005_7550                           ;; 05:55B9 $C3 $50 $75

label_005_55BC:
    call DropHeartContainer_05                    ;; 05:55BC $CD $85 $75
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 05:55BF $21 $80 $C4
    add  hl, de                                   ;; 05:55C2 $19
    ld   [hl], $08                                ;; 05:55C3 $36 $08
    ret                                           ;; 05:55C5 $C9

Data_005_55C6::
    db   $F8, $A8

Data_005_55C8::
    db   $08, $F8

func_005_55CA::
    call ReturnIfNonInteractive_05
    ld   hl, wEntitiesPrivateCountdown2Table
    add  hl, bc                                   ;; 05:55D0 $09
    ld   a, [hl]                                  ;; 05:55D1 $7E
    and  a                                        ;; 05:55D2 $A7
    jr   z, jr_005_561E                           ;; 05:55D3 $28 $49

    and  $3F                                      ;; 05:55D5 $E6 $3F
    jr   nz, jr_005_561E                          ;; 05:55D7 $20 $45

    ld   a, ENTITY_ANGLER_FISH                    ;; 05:55D9 $3E $65
    ld   e, $04                                   ;; 05:55DB $1E $04
    call SpawnNewEntityInRange_trampoline         ;; 05:55DD $CD $98 $3B
    jr   c, jr_005_5650                           ;; 05:55E0 $38 $6E

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 05:55E2 $21 $40 $C3
    add  hl, de                                   ;; 05:55E5 $19
    ld   [hl], 2                                  ;; 05:55E6 $36 $02
    ld   hl, wEntitiesHitboxFlagsTable            ;; 05:55E8 $21 $50 $C3
    add  hl, de                                   ;; 05:55EB $19
    ld   [hl], $80                                ;; 05:55EC $36 $80
    ld   hl, wEntitiesOptions1Table               ;; 05:55EE $21 $30 $C4
    add  hl, de                                   ;; 05:55F1 $19
    ld   [hl], ENTITY_OPT1_SWORD_CLINK_OFF        ;; 05:55F2 $36 $40
    ld   hl, wEntitiesPrivateState3Table          ;; 05:55F4 $21 $D0 $C2
    add  hl, de                                   ;; 05:55F7 $19
    ld   [hl], $01                                ;; 05:55F8 $36 $01
    ld   hl, wEntitiesPosXTable                   ;; 05:55FA $21 $00 $C2
    add  hl, de                                   ;; 05:55FD $19
    ld   a, [wD202]                               ;; 05:55FE $FA $02 $D2
    ld   [hl], a                                  ;; 05:5601 $77
    add  $20                                      ;; 05:5602 $C6 $20
    ld   [wD202], a                               ;; 05:5604 $EA $02 $D2
    cp   $A8                                      ;; 05:5607 $FE $A8
    jr   c, .jr_5610                              ;; 05:5609 $38 $05

    ld   a, $08                                   ;; 05:560B $3E $08
    ld   [wD202], a                               ;; 05:560D $EA $02 $D2

.jr_5610
    call GetRandomByte                            ;; 05:5610 $CD $0D $28
    ld   hl, wEntitiesInertiaTable                ;; 05:5613 $21 $D0 $C3
    add  hl, de                                   ;; 05:5616 $19
    ld   [hl], a                                  ;; 05:5617 $77
    ld   hl, wEntitiesPosYTable                   ;; 05:5618 $21 $10 $C2
    add  hl, de                                   ;; 05:561B $19
    ld   [hl], $00                                ;; 05:561C $36 $00

jr_005_561E:
    ld   a, [wD201]                               ;; 05:561E $FA $01 $D2
    inc  a                                        ;; 05:5621 $3C
    ld   [wD201], a                               ;; 05:5622 $EA $01 $D2
    and  $7F                                      ;; 05:5625 $E6 $7F
    jr   nz, jr_005_5650                          ;; 05:5627 $20 $27

    ld   a, ENTITY_ANGLER_FISH                    ;; 05:5629 $3E $65
    ld   e, $04                                   ;; 05:562B $1E $04
    call SpawnNewEntityInRange_trampoline         ;; 05:562D $CD $98 $3B
    jr   c, jr_005_5650                           ;; 05:5630 $38 $1E

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 05:5632 $21 $40 $C3
    add  hl, de                                   ;; 05:5635 $19
    ld   [hl], 1 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 05:5636 $36 $41
    ld   hl, wEntitiesPrivateState3Table          ;; 05:5638 $21 $D0 $C2
    add  hl, de                                   ;; 05:563B $19
    ld   [hl], $02                                ;; 05:563C $36 $02
    ldh  a, [hMultiPurpose0]                      ;; 05:563E $F0 $D7
    sub  $14                                      ;; 05:5640 $D6 $14
    ld   hl, wEntitiesPosXTable                   ;; 05:5642 $21 $00 $C2
    add  hl, de                                   ;; 05:5645 $19
    ld   [hl], a                                  ;; 05:5646 $77
    ldh  a, [hMultiPurpose1]                      ;; 05:5647 $F0 $D8
    sub  $04                                      ;; 05:5649 $D6 $04
    ld   hl, wEntitiesPosYTable                   ;; 05:564B $21 $10 $C2
    add  hl, de                                   ;; 05:564E $19
    ld   [hl], a                                  ;; 05:564F $77

jr_005_5650:
    ld   hl, wEntitiesHealthTable                 ;; 05:5650 $21 $60 $C3
    add  hl, bc                                   ;; 05:5653 $09
    ld   a, [hl]                                  ;; 05:5654 $7E
    cp   $0A                                      ;; 05:5655 $FE $0A
    jr   nc, .jr_56B1                             ;; 05:5657 $30 $58

    ld   a, [wD201]                               ;; 05:5659 $FA $01 $D2
    add  $40                                      ;; 05:565C $C6 $40
    and  $FF                                      ;; 05:565E $E6 $FF
    jr   nz, .jr_56B1                             ;; 05:5660 $20 $4F

    ld   a, ENTITY_ANGLER_FISH                    ;; 05:5662 $3E $65
    ld   e, $04                                   ;; 05:5664 $1E $04
    call SpawnNewEntityInRange_trampoline         ;; 05:5666 $CD $98 $3B
    jr   c, .jr_56B1                              ;; 05:5669 $38 $46

    ld   hl, wEntitiesHealthGroup                 ;; 05:566B $21 $D0 $C4
    add  hl, de                                   ;; 05:566E $19
    ld   [hl], d                                  ;; 05:566F $72
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 05:5670 $21 $40 $C3
    add  hl, de                                   ;; 05:5673 $19
    ld   [hl], 2                                  ;; 05:5674 $36 $02
    ld   hl, wEntitiesOptions1Table               ;; 05:5676 $21 $30 $C4
    add  hl, de                                   ;; 05:5679 $19
    ld   [hl], d                                  ;; 05:567A $72
    ld   hl, wEntitiesHealthTable                 ;; 05:567B $21 $60 $C3
    add  hl, de                                   ;; 05:567E $19
    ld   [hl], d                                  ;; 05:567F $72
    ld   hl, wEntitiesPrivateState3Table          ;; 05:5680 $21 $D0 $C2
    add  hl, de                                   ;; 05:5683 $19
    ld   [hl], $03                                ;; 05:5684 $36 $03
    call GetRandomByte                            ;; 05:5686 $CD $0D $28
    and  $3F                                      ;; 05:5689 $E6 $3F
    add  $20                                      ;; 05:568B $C6 $20
    ld   hl, wEntitiesPosYTable                   ;; 05:568D $21 $10 $C2
    add  hl, de                                   ;; 05:5690 $19
    ld   [hl], a                                  ;; 05:5691 $77
    push bc                                       ;; 05:5692 $C5
    and  $01                                      ;; 05:5693 $E6 $01
    ld   c, a                                     ;; 05:5695 $4F
    ld   hl, Data_005_55C6                        ;; 05:5696 $21 $C6 $55
    add  hl, bc                                   ;; 05:5699 $09
    ld   a, [hl]                                  ;; 05:569A $7E
    ld   hl, wEntitiesPosXTable                   ;; 05:569B $21 $00 $C2
    add  hl, de                                   ;; 05:569E $19
    ld   [hl], a                                  ;; 05:569F $77
    ld   hl, Data_005_55C8                        ;; 05:56A0 $21 $C8 $55
    add  hl, bc                                   ;; 05:56A3 $09
    ld   a, [hl]                                  ;; 05:56A4 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:56A5 $21 $40 $C2
    add  hl, de                                   ;; 05:56A8 $19
    ld   [hl], a                                  ;; 05:56A9 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 05:56AA $21 $E0 $C2
    add  hl, de                                   ;; 05:56AD $19
    ld   [hl], $40                                ;; 05:56AE $36 $40
    pop  bc                                       ;; 05:56B0 $C1

.jr_56B1
    call DecrementEntityIgnoreHitsCountdown       ;; 05:56B1 $CD $56 $0C
    ld   hl, wEntitiesInertiaTable                ;; 05:56B4 $21 $D0 $C3
    add  hl, bc                                   ;; 05:56B7 $09
    ld   a, [hl]                                  ;; 05:56B8 $7E
    inc  [hl]                                     ;; 05:56B9 $34
    rra                                           ;; 05:56BA $1F
    rra                                           ;; 05:56BB $1F
    rra                                           ;; 05:56BC $1F
    rra                                           ;; 05:56BD $1F
    and  $01                                      ;; 05:56BE $E6 $01
    ld   hl, wEntitiesSpriteVariantTable          ;; 05:56C0 $21 $B0 $C3
    add  hl, bc                                   ;; 05:56C3 $09
    ld   [hl], a                                  ;; 05:56C4 $77
    ldh  a, [hActiveEntityPosX]                   ;; 05:56C5 $F0 $EE

.jr_56C7
    sub  $10                                      ;; 05:56C7 $D6 $10
    ldh  [hActiveEntityPosX], a                   ;; 05:56C9 $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:56CB $F0 $EC
    sub  $10                                      ;; 05:56CD $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ;; 05:56CF $E0 $EC
    ld   hl, wEntitiesHitboxFlagsTable            ;; 05:56D1 $21 $50 $C3
    add  hl, bc                                   ;; 05:56D4 $09
    ld   [hl], $00                                ;; 05:56D5 $36 $00
    call ConfigureEntityHitbox                    ;; 05:56D7 $CD $EA $3A
    call label_3B70                               ;; 05:56DA $CD $70 $3B
    call CopyEntityPositionToActivePosition       ;; 05:56DD $CD $8A $3D
    ld   hl, wEntitiesHitboxFlagsTable            ;; 05:56E0 $21 $50 $C3
    add  hl, bc                                   ;; 05:56E3 $09
    ld   [hl], $14                                ;; 05:56E4 $36 $14
    call ConfigureEntityHitbox                    ;; 05:56E6 $CD $EA $3A
    call label_3B44                               ;; 05:56E9 $CD $44 $3B
    ldh  a, [hActiveEntityState]                  ;; 05:56EC $F0 $F0
    JP_TABLE                                      ;; 05:56EE
._00 dw func_005_56F9                             ;; 05:56EF
._01 dw func_005_5737                             ;; 05:56F1
._02 dw func_005_576E                             ;; 05:56F3

Data_005_56F5::
    db   $08, $F8

Data_005_56F7::
    db   $60, $18

func_005_56F9::
    call  GetEntitySlowTransitionCountdown
    jr   nz, .jr_5713                             ;; 05:56FC $20 $15

    call GetEntityTransitionCountdown             ;; 05:56FE $CD $05 $0C
    ld   [hl], $80                                ;; 05:5701 $36 $80
    call IncrementEntityState                     ;; 05:5703 $CD $12 $3B
    call GetRandomByte                            ;; 05:5706 $CD $0D $28
    and  $1F                                      ;; 05:5709 $E6 $1F
    add  $60                                      ;; 05:570B $C6 $60
    ld   hl, wEntitiesPrivateState1Table          ;; 05:570D $21 $B0 $C2
    add  hl, bc                                   ;; 05:5710 $09
    ld   [hl], a                                  ;; 05:5711 $77
    ret                                           ;; 05:5712 $C9

.jr_5713
    ld   hl, wEntitiesDirectionTable              ;; 05:5713 $21 $80 $C3
    add  hl, bc                                   ;; 05:5716 $09
    ld   e, [hl]                                  ;; 05:5717 $5E
    ld   d, b                                     ;; 05:5718 $50
    ld   hl, Data_005_56F7                        ;; 05:5719 $21 $F7 $56
    add  hl, de                                   ;; 05:571C $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:571D $F0 $EC
    cp   [hl]                                     ;; 05:571F $BE
    jr   nz, .jr_572A                             ;; 05:5720 $20 $08

    ld   a, e                                     ;; 05:5722 $7B
    xor  $01                                      ;; 05:5723 $EE $01
    ld   hl, wEntitiesDirectionTable              ;; 05:5725 $21 $80 $C3
    add  hl, bc                                   ;; 05:5728 $09
    ld   [hl], a                                  ;; 05:5729 $77

.jr_572A
    ld   hl, Data_005_56F5                        ;; 05:572A $21 $F5 $56
    add  hl, de                                   ;; 05:572D $19
    ld   a, [hl]                                  ;; 05:572E $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:572F $21 $50 $C2
    add  hl, bc                                   ;; 05:5732 $09
    ld   [hl], a                                  ;; 05:5733 $77
    jp   UpdateEntityYPosWithSpeed_05             ;; 05:5734 $C3 $B4 $7A

func_005_5737::
    ld   hl, wEntitiesInertiaTable                ;; 05:5737 $21 $D0 $C3
    add  hl, bc                                   ;; 05:573A $09
    ld   a, [hl]                                  ;; 05:573B $7E
    inc  [hl]                                     ;; 05:573C $34
    inc  [hl]                                     ;; 05:573D $34
    call GetEntityTransitionCountdown             ;; 05:573E $CD $05 $0C
    cp   $60                                      ;; 05:5741 $FE $60
    jr   nz, .jr_574A                             ;; 05:5743 $20 $05

    ld   hl, hWaveSfx                             ;; 05:5745 $21 $F3 $FF
    ld   [hl], WAVE_SFX_ANGLER_DASH               ;; 05:5748 $36 $0D

.jr_574A
    ret  nc                                       ;; 05:574A $D0

    ld   hl, wEntitiesSpeedXTable                 ;; 05:574B $21 $40 $C2
    add  hl, bc                                   ;; 05:574E $09
    ld   [hl], $D0                                ;; 05:574F $36 $D0
    call AddEntitySpeedToPos_05                   ;; 05:5751 $CD $BE $7A
    ldh  a, [hActiveEntityPosX]                   ;; 05:5754 $F0 $EE
    cp   $18                                      ;; 05:5756 $FE $18
    ret  nc                                       ;; 05:5758 $D0

    ld   a, $30                                   ;; 05:5759 $3E $30
    ld   [wScreenShakeCountdown], a               ;; 05:575B $EA $57 $C1
    xor  a                                        ;; 05:575E $AF
    ld   [wC158], a                               ;; 05:575F $EA $58 $C1
    call PlayBombExplosionSfx                     ;; 05:5762 $CD $4B $0C
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:5765 $21 $00 $C3
    add  hl, bc                                   ;; 05:5768 $09
    ld   [hl], $FF                                ;; 05:5769 $36 $FF
    jp   IncrementEntityState                     ;; 05:576B $C3 $12 $3B

func_005_576E::
    ld   hl, wEntitiesInertiaTable                ;; 05:576E $21 $D0 $C3
    add  hl, bc                                   ;; 05:5771 $09
    ld   a, [hl]                                  ;; 05:5772 $7E
    inc  [hl]                                     ;; 05:5773 $34
    ld   a, [wScreenShakeCountdown]               ;; 05:5774 $FA $57 $C1
    and  a                                        ;; 05:5777 $A7
    jr   nz, .ret_579B                            ;; 05:5778 $20 $21

    ld   hl, wEntitiesSpeedXTable                 ;; 05:577A $21 $40 $C2
    add  hl, bc                                   ;; 05:577D $09
    ld   [hl], $20                                ;; 05:577E $36 $20
    call AddEntitySpeedToPos_05                   ;; 05:5780 $CD $BE $7A
    ld   hl, wEntitiesPrivateState1Table          ;; 05:5783 $21 $B0 $C2
    add  hl, bc                                   ;; 05:5786 $09
    ldh  a, [hActiveEntityPosX]                   ;; 05:5787 $F0 $EE
    cp   [hl]                                     ;; 05:5789 $BE
    jr   c, .ret_579B                             ;; 05:578A $38 $0F

    call GetEntitySlowTransitionCountdown         ;; 05:578C $CD $FB $0B
    call GetRandomByte                            ;; 05:578F $CD $0D $28
    and  $1F                                      ;; 05:5792 $E6 $1F
    add  $40                                      ;; 05:5794 $C6 $40
    ld   [hl], a                                  ;; 05:5796 $77
    call IncrementEntityState                     ;; 05:5797 $CD $12 $3B
    ld   [hl], b                                  ;; 05:579A $70

.ret_579B
    ret                                           ;; 05:579B $C9

Data_005_579C::
    db   $F0, $F0, $40, $07, $F0, $F8, $42, $07, $F0, $00, $44, $07, $F0, $08, $46, $16
    db   $F0, $10, $48, $16, $F0, $18, $4A, $16, $00, $F0, $4C, $07, $00, $F8, $4E, $07
    db   $00, $00, $50, $16, $00, $08, $52, $16, $00, $10, $54, $16, $00, $18, $56, $16
    db   $00, $20, $58, $16, $10, $F8, $5A, $16, $10, $00, $5C, $16, $10, $08, $5E, $16
    db   $10, $10, $60, $16, $10, $18, $62, $16, $10, $20, $64, $16, $00, $00, $FF, $00
    db   $F0, $F0, $66, $07, $F0, $F8, $42, $07, $F0, $00, $44, $07, $F0, $08, $46, $16
    db   $F0, $10, $48, $16, $F0, $18, $4A, $16, $00, $F0, $68, $07, $00, $F8, $4E, $07
    db   $00, $00, $50, $16, $00, $08, $52, $16, $00, $10, $54, $16, $00, $18, $56, $16
    db   $00, $20, $6A, $16, $10, $F8, $5A, $16, $10, $00, $5C, $16, $10, $08, $5E, $16
    db   $10, $10, $60, $16, $10, $18, $62, $16, $10, $20, $6C, $16

Data_005_5838::
    db   $F0, $18, $4A, $16, $F0, $08, $46, $16   ;; 05:5838
    db   $F0, $10, $48, $16, $F0, $F8, $42, $07   ;; 05:5840
    db   $F0, $00, $44, $07, $F0, $F0, $40, $07   ;; 05:5848
    db   $00, $20, $58, $16, $00, $08, $52, $16   ;; 05:5850
    db   $00, $10, $54, $16, $00, $18, $56, $16   ;; 05:5858
    db   $00, $F8, $4E, $07, $00, $00, $50, $16   ;; 05:5860
    db   $00, $F0, $4C, $07, $10, $20, $64, $16   ;; 05:5868
    db   $10, $10, $60, $16, $10, $18, $62, $16   ;; 05:5870
    db   $10, $00, $5C, $16, $10, $08, $5E, $16   ;; 05:5878
    db   $10, $F8, $5A, $16, $00, $00, $FF, $00   ;; 05:5880
    db   $F0, $18, $4A, $16, $F0, $08, $46, $16   ;; 05:5888
    db   $F0, $10, $48, $16, $F0, $F8, $42, $07   ;; 05:5890
    db   $F0, $00, $44, $07, $F0, $F0, $66, $07   ;; 05:5898
    db   $00, $20, $6A, $16, $00, $08, $52, $16   ;; 05:58A0
    db   $00, $10, $54, $16, $00, $18, $56, $16   ;; 05:58A8
    db   $00, $F8, $4E, $07, $00, $00, $50, $16   ;; 05:58B0
    db   $00, $F0, $68, $07, $10, $20, $6C, $16   ;; 05:58B8
    db   $10, $10, $60, $16, $10, $18, $62, $16   ;; 05:58C0
    db   $10, $00, $5C, $16, $10, $08, $5E, $16   ;; 05:58C8
    db   $10, $F8, $5A, $16                       ;; 05:58D0

func_005_58D4::
    ldh  a, [hActiveEntitySpriteVariant]
    sla  a                                        ;; 05:58D6 $CB $27
    sla  a                                        ;; 05:58D8 $CB $27
    sla  a                                        ;; 05:58DA $CB $27
    sla  a                                        ;; 05:58DC $CB $27
    ld   e, a                                     ;; 05:58DE $5F
    sla  a                                        ;; 05:58DF $CB $27
    sla  a                                        ;; 05:58E1 $CB $27
    add  e                                        ;; 05:58E3 $83
    ld   e, a                                     ;; 05:58E4 $5F
    ld   d, b                                     ;; 05:58E5 $50
    ld   hl, Data_005_579C                        ;; 05:58E6 $21 $9C $57
    ldh  a, [hFrameCounter]                       ;; 05:58E9 $F0 $E7
    and  $01                                      ;; 05:58EB $E6 $01
    jr   z, .jr_58F2                              ;; 05:58ED $28 $03

    ld   hl, Data_005_5838                        ;; 05:58EF $21 $38 $58

.jr_58F2
    add  hl, de                                   ;; 05:58F2 $19
    ld   c, $13                                   ;; 05:58F3 $0E $13
    call RenderActiveEntitySpritesRect            ;; 05:58F5 $CD $E6 $3C
    ld   a, $13                                   ;; 05:58F8 $3E $13
    jp   func_015_7964_trampoline                 ;; 05:58FA $C3 $A0 $3D

Data_005_58FD::
    db   $72, $00, $72, $20

func_005_5901::
    ld   de, Data_005_58FD
    call RenderActiveEntitySprite                 ;; 05:5904 $CD $77 $3C
    call ReturnIfNonInteractive_05                ;; 05:5907 $CD $3A $7A
    ld   hl, wEntitiesInertiaTable                ;; 05:590A $21 $D0 $C3

.jr_590D
    add  hl, bc                                   ;; 05:590D $09
    inc  [hl]                                     ;; 05:590E $34
    ld   a, [hl]                                  ;; 05:590F $7E
    rra                                           ;; 05:5910 $1F
    rra                                           ;; 05:5911 $1F
    rra                                           ;; 05:5912 $1F

.jr_5913
    and  $01                                      ;; 05:5913 $E6 $01
    call SetEntitySpriteVariant                   ;; 05:5915 $CD $0C $3B
    ld   hl, wEntitiesInertiaTable                ;; 05:5918 $21 $D0 $C3
    add  hl, bc                                   ;; 05:591B $09
    ld   a, [hl]                                  ;; 05:591C $7E
    and  $30                                      ;; 05:591D $E6 $30
    jr   z, .jr_592A                              ;; 05:591F $28 $09

    ld   hl, wEntitiesSpeedYTable                 ;; 05:5921 $21 $50 $C2
    add  hl, bc                                   ;; 05:5924 $09
    ld   [hl], $F8                                ;; 05:5925 $36 $F8
    call UpdateEntityYPosWithSpeed_05             ;; 05:5927 $CD $B4 $7A

.jr_592A
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:592A $F0 $EC
    cp   $10                                      ;; 05:592C $FE $10
    jp   c, ClearEntityStatus_05                  ;; 05:592E $DA $4B $7B

    ret                                           ;; 05:5931 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown013SpriteVariants::
.variant0
    db $74, OAM_GBC_PAL_5 | OAMF_PAL0
    db $76, OAM_GBC_PAL_5 | OAMF_PAL0
.variant1
    db $76, OAM_GBC_PAL_5 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_5 | OAMF_PAL0 | OAMF_XFLIP

func_005_593A::
    ld   de, Unknown013SpriteVariants             ;; 05:593A $11 $32 $59
    call RenderActiveEntitySpritesPair            ;; 05:593D $CD $C0 $3B
    call ReturnIfNonInteractive_05                ;; 05:5940 $CD $3A $7A
    call DecrementEntityIgnoreHitsCountdown       ;; 05:5943 $CD $56 $0C
    ld   hl, wEntitiesInertiaTable                ;; 05:5946 $21 $D0 $C3
    add  hl, bc                                   ;; 05:5949 $09
    inc  [hl]                                     ;; 05:594A $34
    ld   a, [hl]                                  ;; 05:594B $7E
    push af                                       ;; 05:594C $F5
    rra                                           ;; 05:594D $1F
    rra                                           ;; 05:594E $1F
    rra                                           ;; 05:594F $1F
    rra                                           ;; 05:5950 $1F
    and  $01                                      ;; 05:5951 $E6 $01
    call SetEntitySpriteVariant                   ;; 05:5953 $CD $0C $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 05:5956 $CD $39 $3B
    pop  af                                       ;; 05:5959 $F1
    ld   e, $FC                                   ;; 05:595A $1E $FC
    and  $10                                      ;; 05:595C $E6 $10
    jr   z, .jr_5962                              ;; 05:595E $28 $02

    ld   e, $04                                   ;; 05:5960 $1E $04

.jr_5962
    ld   hl, wEntitiesSpeedXTable                 ;; 05:5962 $21 $40 $C2
    add  hl, bc                                   ;; 05:5965 $09
    ld   [hl], e                                  ;; 05:5966 $73
    ld   hl, wEntitiesSpeedYTable                 ;; 05:5967 $21 $50 $C2
    add  hl, bc                                   ;; 05:596A $09
    ld   [hl], $0C                                ;; 05:596B $36 $0C
    call UpdateEntityPosWithSpeed_05              ;; 05:596D $CD $B1 $7A
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:5970 $F0 $EC
    cp   $8B                                      ;; 05:5972 $FE $8B
    jp   nc, ClearEntityStatus_05                 ;; 05:5974 $D2 $4B $7B

    ret                                           ;; 05:5977 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown014SpriteVariants::
.variant0
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_3 | OAMF_PAL0
.variant1
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0

Data_005_5980::
    db   $01, $FF

Data_005_5982::
    db   $08, $F8

func_005_5984::
    ld   hl, wEntitiesSpeedXTable                 ;; 05:5984 $21 $40 $C2
    add  hl, bc                                   ;; 05:5987 $09
    ld   a, [hl]                                  ;; 05:5988 $7E
    cpl                                           ;; 05:5989 $2F
    rra                                           ;; 05:598A $1F
    rra                                           ;; 05:598B $1F
    and  OAMF_XFLIP                               ;; 05:598C $E6 $20
    ldh  [hActiveEntityFlipAttribute], a          ;; 05:598E $E0 $ED
    ld   de, Unknown014SpriteVariants             ;; 05:5990 $11 $78 $59
    call RenderActiveEntitySpritesPair            ;; 05:5993 $CD $C0 $3B
    call ReturnIfNonInteractive_05                ;; 05:5996 $CD $3A $7A
    call DecrementEntityIgnoreHitsCountdown       ;; 05:5999 $CD $56 $0C
    ldh  a, [hFrameCounter]                       ;; 05:599C $F0 $E7
    rra                                           ;; 05:599E $1F
    rra                                           ;; 05:599F $1F
    rra                                           ;; 05:59A0 $1F
    rra                                           ;; 05:59A1 $1F
    and  $01                                      ;; 05:59A2 $E6 $01
    call SetEntitySpriteVariant                   ;; 05:59A4 $CD $0C $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 05:59A7 $CD $39 $3B
    ldh  a, [hFrameCounter]                       ;; 05:59AA $F0 $E7
    and  $03                                      ;; 05:59AC $E6 $03
    jr   nz, .jr_59CE                             ;; 05:59AE $20 $1E

    ld   hl, wEntitiesStateTable                  ;; 05:59B0 $21 $90 $C2
    add  hl, bc                                   ;; 05:59B3 $09
    ld   a, [hl]                                  ;; 05:59B4 $7E
    and  $01                                      ;; 05:59B5 $E6 $01
    ld   e, a                                     ;; 05:59B7 $5F
    ld   d, b                                     ;; 05:59B8 $50
    ld   hl, Data_005_5980                        ;; 05:59B9 $21 $80 $59
    add  hl, de                                   ;; 05:59BC $19
    ld   a, [hl]                                  ;; 05:59BD $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:59BE $21 $50 $C2
    add  hl, bc                                   ;; 05:59C1 $09
    add  [hl]                                     ;; 05:59C2 $86
    ld   [hl], a                                  ;; 05:59C3 $77
    ld   hl, Data_005_5982                        ;; 05:59C4 $21 $82 $59
    add  hl, de                                   ;; 05:59C7 $19
    cp   [hl]                                     ;; 05:59C8 $BE
    jr   nz, .jr_59CE                             ;; 05:59C9 $20 $03

    call IncrementEntityState                     ;; 05:59CB $CD $12 $3B

.jr_59CE
    call UpdateEntityPosWithSpeed_05              ;; 05:59CE $CD $B1 $7A
    call GetEntityTransitionCountdown             ;; 05:59D1 $CD $05 $0C
    jr   nz, .ret_59DD                            ;; 05:59D4 $20 $07

    ldh  a, [hActiveEntityPosX]                   ;; 05:59D6 $F0 $EE
    cp   $A8                                      ;; 05:59D8 $FE $A8
    jp   nc, ClearEntityStatus_05                 ;; 05:59DA $D2 $4B $7B

.ret_59DD
    ret                                           ;; 05:59DD $C9
