; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SideViewPotSpriteVariants::
.variant0
    db $5E, $06
    db $5E, $26

SideViewPotEntityHandler::
    ld   de, SideViewPotSpriteVariants
    call RenderActiveEntitySpritesPair            ;; 19:58E0 $CD $C0 $3B
    call ReturnIfNonInteractive_19                ;; 19:58E3 $CD $3D $7D
    ldh  a, [hActiveEntityState]                  ;; 19:58E6 $F0 $F0
    JP_TABLE                                      ;; 19:58E8
._00 dw SideViewPotState0Handler
._01 dw SideViewPotState1And2Handler
._02 dw SideViewPotState1And2Handler

SideViewPotState0Handler::
    call CheckLinkCollisionWithEnemy_trampoline   ;; 19:58EF $CD $5A $3B
    jr   nc, jr_019_5922                          ;; 19:58F2 $30 $2E

    call EntityLinkPositionYDifference_19         ;; 19:58F4 $CD $1B $7E
    ld   e, a                                     ;; 19:58F7 $5F
    add  $03                                      ;; 19:58F8 $C6 $03
    cp   $06                                      ;; 19:58FA $FE $06
    jr   nc, .jr_5901                             ;; 19:58FC $30 $03

    call func_019_599B                            ;; 19:58FE $CD $9B $59

.jr_5901
    ldh  a, [hLinkSpeedY]                         ;; 19:5901 $F0 $9B
    and  $80                                      ;; 19:5903 $E6 $80
    jr   nz, jr_019_5922                          ;; 19:5905 $20 $1B

    call EntityLinkPositionYDifference_19         ;; 19:5907 $CD $1B $7E
    add  $08                                      ;; 19:590A $C6 $08
    bit  7, a                                     ;; 19:590C $CB $7F
    jr   z, jr_019_5922                           ;; 19:590E $28 $12

    ld   hl, wEntitiesPosYTable                   ;; 19:5910 $21 $10 $C2
    add  hl, bc                                   ;; 19:5913 $09
    ld   a, [hl]                                  ;; 19:5914 $7E
    sub  $10                                      ;; 19:5915 $D6 $10
    ldh  [hLinkPositionY], a                      ;; 19:5917 $E0 $99
    ld   a, $02                                   ;; 19:5919 $3E $02
    ldh  [hLinkSpeedY], a                         ;; 19:591B $E0 $9B
    ld   a, $01                                   ;; 19:591D $3E $01
    ld   [wC147], a                               ;; 19:591F $EA $47 $C1

jr_019_5922:
    call EntityLinkPositionXDifference_19         ;; 19:5922 $CD $0B $7E
    add  $12                                      ;; 19:5925 $C6 $12
    cp   $24                                      ;; 19:5927 $FE $24
    ret  nc                                       ;; 19:5929 $D0

    call EntityLinkPositionYDifference_19         ;; 19:592A $CD $1B $7E
    add  $12                                      ;; 19:592D $C6 $12
    cp   $24                                      ;; 19:592F $FE $24
    ret  nc                                       ;; 19:5931 $D0

    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 19:5932 $FA $9B $C1
    and  a                                        ;; 19:5935 $A7
    ret  nz                                       ;; 19:5936 $C0

    ld   a, [wInventoryItems.BButtonSlot]         ;; 19:5937 $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 19:593A $FE $03
    jr   nz, .noBraceletB                         ;; 19:593C $20 $07

    ldh  a, [hJoypadState]                        ;; 19:593E $F0 $CC
    and  J_B                                      ;; 19:5940 $E6 $20
    jr   nz, jr_019_5950                          ;; 19:5942 $20 $0C

    ret                                           ;; 19:5944 $C9

.noBraceletB
    ld   a, [wInventoryItems.AButtonSlot]         ;; 19:5945 $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 19:5948 $FE $03
    ret  nz                                       ;; 19:594A $C0

    ldh  a, [hJoypadState]                        ;; 19:594B $F0 $CC
    and  J_A                                      ;; 19:594D $E6 $10
    ret  z                                        ;; 19:594F $C8

jr_019_5950:
    ld   a, [wC3CF]                               ;; 19:5950 $FA $CF $C3
    and  a                                        ;; 19:5953 $A7
    ret  nz                                       ;; 19:5954 $C0

    inc  a                                        ;; 19:5955 $3C
    ld   [wC3CF], a                               ;; 19:5956 $EA $CF $C3
    ld   hl, wEntitiesStatusTable                 ;; 19:5959 $21 $80 $C2
    add  hl, bc                                   ;; 19:595C $09
    ld   [hl], $07                                ;; 19:595D $36 $07
    ld   hl, wEntitiesLiftedTable                 ;; 19:595F $21 $90 $C4
    add  hl, bc                                   ;; 19:5962 $09
    ld   [hl], b                                  ;; 19:5963 $70
    call GetEntityTransitionCountdown             ;; 19:5964 $CD $05 $0C
    ld   [hl], $02                                ;; 19:5967 $36 $02
    ld   hl, hWaveSfx                             ;; 19:5969 $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ;; 19:596C $36 $02
    call IncrementEntityState                     ;; 19:596E $CD $12 $3B
    ld   [hl], $02                                ;; 19:5971 $36 $02
    ldh  a, [hLinkDirection]                      ;; 19:5973 $F0 $9E
    ld   [wC15D], a                               ;; 19:5975 $EA $5D $C1
    ret                                           ;; 19:5978 $C9

SideViewPotState1And2Handler::
    call UpdateEntityPosWithSpeed_19              ;; 19:5979 $CD $B8 $7D
    ld   hl, wEntitiesSpeedYTable                 ;; 19:597C $21 $50 $C2
    add  hl, bc                                   ;; 19:597F $09
    ld   a, [hl]                                  ;; 19:5980 $7E
    bit  7, a                                     ;; 19:5981 $CB $7F
    jr   nz, .jr_5989                             ;; 19:5983 $20 $04

    cp   $40                                      ;; 19:5985 $FE $40
    jr   nc, jr_019_598B                          ;; 19:5987 $30 $02

.jr_5989
    inc  [hl]                                     ;; 19:5989 $34
    inc  [hl]                                     ;; 19:598A $34

jr_019_598B:
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:598B $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 19:598E $21 $A0 $C2
    add  hl, bc                                   ;; 19:5991 $09
    ld   a, [hl]                                  ;; 19:5992 $7E
    and  a                                        ;; 19:5993 $A7
    ret  z                                        ;; 19:5994 $C8

    call label_3E34                               ;; 19:5995 $CD $34 $3E
    jp   ClearEntityStatus_19                     ;; 19:5998 $C3 $61 $7E

func_019_599B::
    call ResetPegasusBoots                        ;; 19:599B $CD $B6 $0C
    ld   a, [wIsLinkInTheAir]                     ;; 19:599E $FA $46 $C1
    and  a                                        ;; 19:59A1 $A7
    jr   nz, jr_019_59B7                          ;; 19:59A2 $20 $13

    ld   a, $02                                   ;; 19:59A4 $3E $02
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 19:59A6 $EA $3E $C1
    call EntityLinkPositionXDifference_19         ;; 19:59A9 $CD $0B $7E
    ld   a, e                                     ;; 19:59AC $7B
    and  a                                        ;; 19:59AD $A7
    ld   a, $10                                   ;; 19:59AE $3E $10
    jr   z, .jr_59B4                              ;; 19:59B0 $28 $02

    ld   a, $F0                                   ;; 19:59B2 $3E $F0

.jr_59B4
    ldh  [hLinkSpeedX], a                         ;; 19:59B4 $E0 $9A
    ret                                           ;; 19:59B6 $C9

jr_019_59B7:
    ldh  a, [hLinkFinalPositionX]                 ;; 19:59B7 $F0 $9F
    ldh  [hLinkPositionX], a                      ;; 19:59B9 $E0 $98
    ret                                           ;; 19:59BB $C9
