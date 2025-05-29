; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
RoosterSpriteVariants::
.variant0
    db $42, $23
    db $40, $23
.variant1
    db $46, $23
    db $44, $23
.variant2
    db $40, $03
    db $42, $03
.variant3
    db $44, $03
    db $46, $03
.variant4
    db $4C, $03
    db $4C, $23
.variant5
    db $4E, $03
    db $4E, $23
.variant6
    db $48, $03
    db $48, $23
.variant7
    db $4A, $03
    db $4A, $23

RoosterEntityHandler::
    ld   a, [wIsRoosterFollowingLink]             ;; 19:59DC $FA $7B $DB
    and  a                                        ;; 19:59DF $A7
    jp   z, ClearEntityStatus_19                  ;; 19:59E0 $CA $61 $7E

    ldh  a, [hMapRoom]                            ;; 19:59E3 $F0 $F6
    ld   hl, wEntitiesRoomTable                   ;; 19:59E5 $21 $E0 $C3
    add  hl, bc                                   ;; 19:59E8 $09
    ld   [hl], a                                  ;; 19:59E9 $77
    ld   hl, wEntitiesPosXSignTable               ;; 19:59EA $21 $20 $C2
    add  hl, bc                                   ;; 19:59ED $09
    ld   [hl], b                                  ;; 19:59EE $70
    ld   hl, wEntitiesPosYSignTable               ;; 19:59EF $21 $30 $C2
    add  hl, bc                                   ;; 19:59F2 $09
    ld   [hl], b                                  ;; 19:59F3 $70
    ld   de, RoosterSpriteVariants                ;; 19:59F4 $11 $BC $59
    call RenderActiveEntitySpritesPair            ;; 19:59F7 $CD $C0 $3B
    ldh  a, [hActiveEntityStatus]                 ;; 19:59FA $F0 $EA
    cp   $07                                      ;; 19:59FC $FE $07
    jp   z, label_019_5B3C                        ;; 19:59FE $CA $3C $5B

    ld   a, [wLinkMotionState]                    ;; 19:5A01 $FA $1C $C1
    cp   LINK_MOTION_SWIMMING                     ;; 19:5A04 $FE $01
    jr   nz, .jr_5A0D                             ;; 19:5A06 $20 $05

    call func_019_5B00                            ;; 19:5A08 $CD $00 $5B
    jr   jr_019_5A31                              ;; 19:5A0B $18 $24

.jr_5A0D
    call AddEntityZSpeedToPos_19                  ;; 19:5A0D $CD $F1 $7D
    ld   hl, wEntitiesSpeedZTable                 ;; 19:5A10 $21 $20 $C3
    add  hl, bc                                   ;; 19:5A13 $09
    dec  [hl]                                     ;; 19:5A14 $35
    ld   hl, wEntitiesPosZTable                   ;; 19:5A15 $21 $10 $C3
    add  hl, bc                                   ;; 19:5A18 $09
    ld   a, [hl]                                  ;; 19:5A19 $7E
    and  $80                                      ;; 19:5A1A $E6 $80
    jr   z, jr_019_5A35                           ;; 19:5A1C $28 $17

    ld   [hl], b                                  ;; 19:5A1E $70
    ld   hl, wEntitiesSpeedZTable                 ;; 19:5A1F $21 $20 $C3
    add  hl, bc                                   ;; 19:5A22 $09
    ld   [hl], $10                                ;; 19:5A23 $36 $10
    ld   a, [wIsLinkInTheAir]                     ;; 19:5A25 $FA $46 $C1
    ld   e, a                                     ;; 19:5A28 $5F
    ld   a, [wIsRunningWithPegasusBoots]          ;; 19:5A29 $FA $4A $C1
    or   e                                        ;; 19:5A2C $B3
    jr   z, jr_019_5A31                           ;; 19:5A2D $28 $02

    ld   [hl], $20                                ;; 19:5A2F $36 $20

jr_019_5A31:
    call IncrementEntityState                     ;; 19:5A31 $CD $12 $3B
    ld   [hl], b                                  ;; 19:5A34 $70

jr_019_5A35:
    call ReturnIfNonInteractive_19                ;; 19:5A35 $CD $3D $7D
    ldh  a, [hActiveEntityState]                  ;; 19:5A38 $F0 $F0
    and  a                                        ;; 19:5A3A $A7
    jr   nz, jr_019_5A85                          ;; 19:5A3B $20 $48

    call func_019_7E3A                            ;; 19:5A3D $CD $3A $7E
    sla  e                                        ;; 19:5A40 $CB $23
    ldh  a, [hFrameCounter]                       ;; 19:5A42 $F0 $E7
    rra                                           ;; 19:5A44 $1F
    rra                                           ;; 19:5A45 $1F
    rra                                           ;; 19:5A46 $1F
    and  $01                                      ;; 19:5A47 $E6 $01
    add  e                                        ;; 19:5A49 $83
    call SetEntitySpriteVariant                   ;; 19:5A4A $CD $0C $3B
    call EntityLinkPositionXDifference_19         ;; 19:5A4D $CD $0B $7E
    add  $12                                      ;; 19:5A50 $C6 $12
    cp   $24                                      ;; 19:5A52 $FE $24
    jr   nc, .jr_5A5F                             ;; 19:5A54 $30 $09

    call EntityLinkPositionYDifference_19         ;; 19:5A56 $CD $1B $7E
    add  $12                                      ;; 19:5A59 $C6 $12
    cp   $24                                      ;; 19:5A5B $FE $24
    jr   c, jr_019_5A9F                           ;; 19:5A5D $38 $40

.jr_5A5F
    ldh  a, [hFrameCounter]                       ;; 19:5A5F $F0 $E7
    and  $07                                      ;; 19:5A61 $E6 $07
    jr   nz, jr_019_5A7F                          ;; 19:5A63 $20 $1A

    ld   a, [wIsRunningWithPegasusBoots]          ;; 19:5A65 $FA $4A $C1
    and  a                                        ;; 19:5A68 $A7
    ld   a, $0C                                   ;; 19:5A69 $3E $0C
    jr   z, .jr_5A6F                              ;; 19:5A6B $28 $02

    ld   a, $20                                   ;; 19:5A6D $3E $20

.jr_5A6F
    ld   e, a                                     ;; 19:5A6F $5F
    ld   hl, wEntitiesPosZTable                   ;; 19:5A70 $21 $10 $C3
    add  hl, bc                                   ;; 19:5A73 $09
    ld   a, [hl]                                  ;; 19:5A74 $7E
    push af                                       ;; 19:5A75 $F5
    push hl                                       ;; 19:5A76 $E5
    ld   [hl], b                                  ;; 19:5A77 $70
    ld   a, e                                     ;; 19:5A78 $7B
    call ApplyVectorTowardsLink_trampoline        ;; 19:5A79 $CD $AA $3B
    pop  hl                                       ;; 19:5A7C $E1
    pop  af                                       ;; 19:5A7D $F1
    ld   [hl], a                                  ;; 19:5A7E $77

jr_019_5A7F:
    call UpdateEntityPosWithSpeed_19              ;; 19:5A7F $CD $B8 $7D
    jp   ApplyEntityInteractionWithBackground_trampoline ;; 19:5A82 $C3 $23 $3B

jr_019_5A85:
    ld   hl, wEntitiesSpeedXTable                 ;; 19:5A85 $21 $40 $C2
    add  hl, bc                                   ;; 19:5A88 $09
    ld   a, [hl]                                  ;; 19:5A89 $7E
    and  $80                                      ;; 19:5A8A $E6 $80
    jr   z, .jr_5A90                              ;; 19:5A8C $28 $02

    inc  [hl]                                     ;; 19:5A8E $34
    inc  [hl]                                     ;; 19:5A8F $34

.jr_5A90
    dec  [hl]                                     ;; 19:5A90 $35
    ld   hl, wEntitiesSpeedYTable                 ;; 19:5A91 $21 $50 $C2
    add  hl, bc                                   ;; 19:5A94 $09
    ld   a, [hl]                                  ;; 19:5A95 $7E
    and  $80                                      ;; 19:5A96 $E6 $80
    jr   z, .jr_5A9C                              ;; 19:5A98 $28 $02

    inc  [hl]                                     ;; 19:5A9A $34
    inc  [hl]                                     ;; 19:5A9B $34

.jr_5A9C
    dec  [hl]                                     ;; 19:5A9C $35
    jr   jr_019_5A7F                              ;; 19:5A9D $18 $E0

jr_019_5A9F:
    call ClearEntitySpeed                         ;; 19:5A9F $CD $7F $3D
    call CheckLinkCollisionWithEnemy_trampoline   ;; 19:5AA2 $CD $5A $3B
    ret  nc                                       ;; 19:5AA5 $D0

    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 19:5AA6 $FA $9B $C1
    and  a                                        ;; 19:5AA9 $A7
    ret  nz                                       ;; 19:5AAA $C0

    ld   a, [wInventoryItems.BButtonSlot]         ;; 19:5AAB $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 19:5AAE $FE $03
    jr   nz, .noBraceletB                         ;; 19:5AB0 $20 $07

    ldh  a, [hJoypadState]                        ;; 19:5AB2 $F0 $CC
    and  J_B                                      ;; 19:5AB4 $E6 $20
    jr   nz, jr_019_5AC4                          ;; 19:5AB6 $20 $0C

    ret                                           ;; 19:5AB8 $C9

.noBraceletB
    ld   a, [wInventoryItems.AButtonSlot]         ;; 19:5AB9 $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 19:5ABC $FE $03
    ret  nz                                       ;; 19:5ABE $C0

    ldh  a, [hJoypadState]                        ;; 19:5ABF $F0 $CC
    and  J_A                                      ;; 19:5AC1 $E6 $10
    ret  z                                        ;; 19:5AC3 $C8

jr_019_5AC4:
    ; If Link is not interactive, return
    ld   a, [wLinkMotionState]                    ;; 19:5AC4 $FA $1C $C1
    cp   LINK_MOTION_TYPE_NON_INTERACTIVE         ;; 19:5AC7 $FE $02
    ret  nc                                       ;; 19:5AC9 $D0

    ld   a, [wC3CF]                               ;; 19:5ACA $FA $CF $C3
    and  a                                        ;; 19:5ACD $A7
    ret  nz                                       ;; 19:5ACE $C0

    ld   [wLinkMotionState], a                    ;; 19:5ACF $EA $1C $C1
    inc  a                                        ;; 19:5AD2 $3C
    ld   [wC3CF], a                               ;; 19:5AD3 $EA $CF $C3
    ld   hl, wEntitiesStatusTable                 ;; 19:5AD6 $21 $80 $C2
    add  hl, bc                                   ;; 19:5AD9 $09
    ld   [hl], $07                                ;; 19:5ADA $36 $07
    ld   hl, wEntitiesLiftedTable                 ;; 19:5ADC $21 $90 $C4
    add  hl, bc                                   ;; 19:5ADF $09
    ld   [hl], b                                  ;; 19:5AE0 $70
    call GetEntityTransitionCountdown             ;; 19:5AE1 $CD $05 $0C
    ld   [hl], $02                                ;; 19:5AE4 $36 $02
    ld   hl, hWaveSfx                             ;; 19:5AE6 $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ;; 19:5AE9 $36 $02
    call IncrementEntityState                     ;; 19:5AEB $CD $12 $3B
    ld   [hl], $01                                ;; 19:5AEE $36 $01
    ld   a, $02                                   ;; 19:5AF0 $3E $02
    ldh  [hLinkPositionZ], a                      ;; 19:5AF2 $E0 $A2
    ld   [wIsLinkInTheAir], a                     ;; 19:5AF4 $EA $46 $C1
    ret                                           ;; 19:5AF7 $C9

Data_019_5AF8::
    db   $06, $07, $08, $09, $09, $08, $07, $06

func_019_5B00::
    ld   hl, wEntitiesSpeedZTable                 ;; 19:5B00 $21 $20 $C3
    add  hl, bc                                   ;; 19:5B03 $09
    ld   [hl], b                                  ;; 19:5B04 $70
    ldh  a, [hFrameCounter]                       ;; 19:5B05 $F0 $E7
    rra                                           ;; 19:5B07 $1F
    rra                                           ;; 19:5B08 $1F
    rra                                           ;; 19:5B09 $1F
    and  $07                                      ;; 19:5B0A $E6 $07
    ld   e, a                                     ;; 19:5B0C $5F
    ld   d, b                                     ;; 19:5B0D $50
    ld   hl, Data_019_5AF8                        ;; 19:5B0E $21 $F8 $5A
    add  hl, de                                   ;; 19:5B11 $19
    ld   e, [hl]                                  ;; 19:5B12 $5E
    ld   hl, wEntitiesPosZTable                   ;; 19:5B13 $21 $10 $C3
    add  hl, bc                                   ;; 19:5B16 $09
    ld   a, [hl]                                  ;; 19:5B17 $7E
    sub  e                                        ;; 19:5B18 $93
    ret  z                                        ;; 19:5B19 $C8

    ld   e, a                                     ;; 19:5B1A $5F
    ldh  a, [hFrameCounter]                       ;; 19:5B1B $F0 $E7
    and  $01                                      ;; 19:5B1D $E6 $01
    ret  nz                                       ;; 19:5B1F $C0

    ld   a, e                                     ;; 19:5B20 $7B
    and  $80                                      ;; 19:5B21 $E6 $80
    jr   z, .jr_5B27                              ;; 19:5B23 $28 $02

    inc  [hl]                                     ;; 19:5B25 $34
    inc  [hl]                                     ;; 19:5B26 $34

.jr_5B27
    dec  [hl]                                     ;; 19:5B27 $35
    ret                                           ;; 19:5B28 $C9

Data_019_5B29::
    db   $0F, $00, $01, $0F, $02, $0F, $0F, $0F, $03, $0F, $0F

Data_019_5B34::
    db   $14, $14, $15, $16, $17, $17, $16, $15

label_019_5B3C:
    ldh  a, [hLinkDirection]                      ;; 19:5B3C $F0 $9E
    rla                                           ;; 19:5B3E $17
    and  $06                                      ;; 19:5B3F $E6 $06
    ld   e, a                                     ;; 19:5B41 $5F
    ldh  a, [hFrameCounter]                       ;; 19:5B42 $F0 $E7
    rra                                           ;; 19:5B44 $1F
    rra                                           ;; 19:5B45 $1F
    and  $01                                      ;; 19:5B46 $E6 $01
    add  e                                        ;; 19:5B48 $83
    call SetEntitySpriteVariant                   ;; 19:5B49 $CD $0C $3B
    ld   a, $02                                   ;; 19:5B4C $3E $02
    ld   [wIsLinkInTheAir], a                     ;; 19:5B4E $EA $46 $C1
    xor  a                                        ;; 19:5B51 $AF
    ldh  [hLinkVelocityZ], a                      ;; 19:5B52 $E0 $A3
    ldh  a, [hFrameCounter]                       ;; 19:5B54 $F0 $E7
    and  $03                                      ;; 19:5B56 $E6 $03
    jr   nz, jr_019_5B75                          ;; 19:5B58 $20 $1B

    ldh  a, [hFrameCounter]                       ;; 19:5B5A $F0 $E7
    rra                                           ;; 19:5B5C $1F
    rra                                           ;; 19:5B5D $1F
    and  $07                                      ;; 19:5B5E $E6 $07
    ld   e, a                                     ;; 19:5B60 $5F
    ld   d, b                                     ;; 19:5B61 $50
    ld   hl, Data_019_5B34                        ;; 19:5B62 $21 $34 $5B
    add  hl, de                                   ;; 19:5B65 $19
    ld   e, [hl]                                  ;; 19:5B66 $5E
    ld   hl, hLinkPositionZ                       ;; 19:5B67 $21 $A2 $FF
    ld   a, [hl]                                  ;; 19:5B6A $7E
    sub  e                                        ;; 19:5B6B $93
    jr   z, jr_019_5B75                           ;; 19:5B6C $28 $07

    and  $80                                      ;; 19:5B6E $E6 $80
    jr   z, .jr_5B74                              ;; 19:5B70 $28 $02

    inc  [hl]                                     ;; 19:5B72 $34
    inc  [hl]                                     ;; 19:5B73 $34

.jr_5B74
    dec  [hl]                                     ;; 19:5B74 $35

jr_019_5B75:
    ldh  a, [hPressedButtonsMask]                 ;; 19:5B75 $F0 $CB
    and  $0F                                      ;; 19:5B77 $E6 $0F
    ld   e, a                                     ;; 19:5B79 $5F
    ld   d, b                                     ;; 19:5B7A $50
    ld   hl, Data_019_5B29                        ;; 19:5B7B $21 $29 $5B
    add  hl, de                                   ;; 19:5B7E $19
    ld   a, [hl]                                  ;; 19:5B7F $7E
    cp   $0F                                      ;; 19:5B80 $FE $0F
    jr   z, .jr_5B89                              ;; 19:5B82 $28 $05

    ldh  [hLinkDirection], a                      ;; 19:5B84 $E0 $9E
    ld   [wC15D], a                               ;; 19:5B86 $EA $5D $C1

.jr_5B89
    ld   a, [wCollisionType]                      ;; 19:5B89 $FA $33 $C1
    and  COLLISION_TYPE_VERTICAL                  ;; 19:5B8C $E6 $03
    jr   z, .jr_5B93                              ;; 19:5B8E $28 $03

    xor  a                                        ;; 19:5B90 $AF
    ldh  [hLinkSpeedY], a                         ;; 19:5B91 $E0 $9B

.jr_5B93
    ld   a, [wCollisionType]                      ;; 19:5B93 $FA $33 $C1
    and  COLLISION_TYPE_HORIZONTAL                ;; 19:5B96 $E6 $0C
    jr   z, .jr_5B9D                              ;; 19:5B98 $28 $03

    xor  a                                        ;; 19:5B9A $AF
    ldh  [hLinkSpeedX], a                         ;; 19:5B9B $E0 $9A

.jr_5B9D
    jp   PlayBoomerangSfx_trampoline              ;; 19:5B9D $C3 $F8 $29
