; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MarinAtTalTalAndInStoreSpriteVariants::
.variant0
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant5
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0
.variant6
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

MarinAtTalTalHeightsEntityHandler::
    ld   a, [wHasInstrument7]                     ;; 18:5ED7 $FA $6B $DB
    and  $02                                      ;; 18:5EDA $E6 $02
    jp   z, ClearEntityStatusBank18               ;; 18:5EDC $CA $08 $7F

    ld   a, [wIsRoosterFollowingLink]             ;; 18:5EDF $FA $7B $DB
    and  a                                        ;; 18:5EE2 $A7
    jp   nz, ClearEntityStatusBank18              ;; 18:5EE3 $C2 $08 $7F

    ldh  a, [hRoomStatus]                         ;; 18:5EE6 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 18:5EE8 $E6 $10
    jp   nz, ClearEntityStatusBank18              ;; 18:5EEA $C2 $08 $7F

    ld   hl, wEntitiesPrivateState2Table          ;; 18:5EED $21 $C0 $C2
    add  hl, bc                                   ;; 18:5EF0 $09
    ld   a, [hl]                                  ;; 18:5EF1 $7E
    and  a                                        ;; 18:5EF2 $A7
    jp   nz, TarinAtTalTalHeights                 ;; 18:5EF3 $C2 $F5 $60

    ld   a, c                                     ;; 18:5EF6 $79
    ld   [wMarinEntityIndex], a                   ;; 18:5EF7 $EA $0F $C5
    ld   de, MarinAtTalTalAndInStoreSpriteVariants ;; 18:5EFA $11 $B7 $5E
    call RenderActiveEntitySpritesPair            ;; 18:5EFD $CD $C0 $3B
    call SetEntityVariantForDirection_18          ;; 18:5F00 $CD $60 $7D
    call AddEntityZSpeedToPos_18                  ;; 18:5F03 $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 18:5F06 $21 $20 $C3
    add  hl, bc                                   ;; 18:5F09 $09
    dec  [hl]                                     ;; 18:5F0A $35
    dec  [hl]                                     ;; 18:5F0B $35
    ld   hl, wEntitiesPosZTable                   ;; 18:5F0C $21 $10 $C3
    add  hl, bc                                   ;; 18:5F0F $09
    ld   a, [hl]                                  ;; 18:5F10 $7E
    and  a                                        ;; 18:5F11 $A7
    ldh  [hMultiPurposeG], a                      ;; 18:5F12 $E0 $E8
    jr   z, .jr_5F1A                              ;; 18:5F14 $28 $04

    and  $80                                      ;; 18:5F16 $E6 $80
    jr   z, jr_018_5F20                           ;; 18:5F18 $28 $06

.jr_5F1A
    ld   [hl], b                                  ;; 18:5F1A $70
    ld   hl, wEntitiesSpeedZTable                 ;; 18:5F1B $21 $20 $C3
    add  hl, bc                                   ;; 18:5F1E $09
    ld   [hl], b                                  ;; 18:5F1F $70

jr_018_5F20:
    ldh  a, [hActiveEntityState]                  ;; 18:5F20 $F0 $F0
    JP_TABLE                                      ;; 18:5F22
._00 dw MarinAtTalTalHeightsState0Handler
._01 dw MarinAtTalTalHeightsState1Handler
._02 dw MarinAtTalTalHeightsState2Handler
._03 dw MarinAtTalTalHeightsState3Handler
._04 dw MarinAtTalTalHeightsState4Handler
._05 dw MarinAtTalTalHeightsState5Handler
._06 dw MarinAtTalTalHeightsState6Handler
._07 dw MarinAtTalTalHeightsState7Handler
._08 dw MarinAtTalTalHeightsState8Handler
._09 dw MarinAtTalTalHeightsState9Handler
._0A dw MarinAtTalTalHeightsStateAHandler
._0B dw MarinAtTalTalHeightsStateBHandler
._0C dw MarinAtTalTalHeightsStateCHandler

func_018_5F3D::
    ld   hl, wEntitiesInertiaTable                ;; 18:5F3D $21 $D0 $C3
    add  hl, bc                                   ;; 18:5F40 $09
    ld   [hl], b                                  ;; 18:5F41 $70
    ret                                           ;; 18:5F42 $C9

MarinAtTalTalHeightsState0Handler::
    call func_018_5F5E                            ;; 18:5F43 $CD $5E $5F
    call ReturnIfNonInteractive_18                ;; 18:5F46 $CD $E8 $7D
    call func_018_7EB2                            ;; 18:5F49 $CD $B2 $7E
    ld   hl, wEntitiesDirectionTable              ;; 18:5F4C $21 $80 $C3
    add  hl, bc                                   ;; 18:5F4F $09
    ld   [hl], e                                  ;; 18:5F50 $73
    ldh  a, [hLinkPositionX]                      ;; 18:5F51 $F0 $98
    cp   $90                                      ;; 18:5F53 $FE $90
    ret  nc                                       ;; 18:5F55 $D0

    call_open_dialog Dialog235                    ;; 18:5F56
    jp   IncrementEntityState                     ;; 18:5F5B $C3 $12 $3B

func_018_5F5E::
    ldh  a, [hMultiPurposeG]                      ;; 18:5F5E $F0 $E8
    and  a                                        ;; 18:5F60 $A7
    jr   z, .jr_5F66                              ;; 18:5F61 $28 $03

    and  $80                                      ;; 18:5F63 $E6 $80
    ret  z                                        ;; 18:5F65 $C8

.jr_5F66
    ldh  a, [hFrameCounter]                       ;; 18:5F66 $F0 $E7
    and  $3F                                      ;; 18:5F68 $E6 $3F
    jr   nz, .ret_5F72                            ;; 18:5F6A $20 $06

    ld   hl, wEntitiesSpeedZTable                 ;; 18:5F6C $21 $20 $C3
    add  hl, bc                                   ;; 18:5F6F $09
    ld   [hl], $10                                ;; 18:5F70 $36 $10

.ret_5F72
    ret                                           ;; 18:5F72 $C9

MarinAtTalTalHeightsState1Handler::
    call func_018_5F5E                            ;; 18:5F73 $CD $5E $5F
    call ReturnIfNonInteractive_18                ;; 18:5F76 $CD $E8 $7D
    call_open_dialog Dialog236                    ;; 18:5F79
    jp   IncrementEntityState                     ;; 18:5F7E $C3 $12 $3B

MarinAtTalTalHeightsState2Handler::
    call func_018_5F5E                            ;; 18:5F81 $CD $5E $5F
    call ReturnIfNonInteractive_18                ;; 18:5F84 $CD $E8 $7D
    call func_018_7EB2                            ;; 18:5F87 $CD $B2 $7E
    add  $08                                      ;; 18:5F8A $C6 $08
    cp   $10                                      ;; 18:5F8C $FE $10
    ret  nc                                       ;; 18:5F8E $D0

    call func_018_7EC2                            ;; 18:5F8F $CD $C2 $7E
    add  $10                                      ;; 18:5F92 $C6 $10
    cp   $20                                      ;; 18:5F94 $FE $20
    ret  nc                                       ;; 18:5F96 $D0

    jp   IncrementEntityState                     ;; 18:5F97 $C3 $12 $3B

MarinAtTalTalHeightsState3Handler::
    call func_018_5F3D                            ;; 18:5F9A $CD $3D $5F
    call ReturnIfNonInteractive_18                ;; 18:5F9D $CD $E8 $7D
    call func_018_7EB2                            ;; 18:5FA0 $CD $B2 $7E
    ld   hl, wEntitiesDirectionTable              ;; 18:5FA3 $21 $80 $C3
    add  hl, bc                                   ;; 18:5FA6 $09
    ld   [hl], e                                  ;; 18:5FA7 $73
    ld   a, [wC1A4]                               ;; 18:5FA8 $FA $A4 $C1
    and  a                                        ;; 18:5FAB $A7
    jr   z, .jr_5FBF                              ;; 18:5FAC $28 $11

    ldh  a, [hLinkPositionX]                      ;; 18:5FAE $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 18:5FB0 $21 $00 $C2
    add  hl, bc                                   ;; 18:5FB3 $09
    add  $10                                      ;; 18:5FB4 $C6 $10
    ld   [hl], a                                  ;; 18:5FB6 $77
    ldh  a, [hLinkPositionY]                      ;; 18:5FB7 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 18:5FB9 $21 $10 $C2
    add  hl, bc                                   ;; 18:5FBC $09
    ld   [hl], a                                  ;; 18:5FBD $77
    ret                                           ;; 18:5FBE $C9

.jr_5FBF
    xor  a                                        ;; 18:5FBF $AF
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 18:5FC0 $EA $9B $C1

    call GetEntityTransitionCountdown             ;; 18:5FC3 $CD $05 $0C
    ld   [hl], $10                                ;; 18:5FC6 $36 $10
    jp   IncrementEntityState                     ;; 18:5FC8 $C3 $12 $3B

MarinAtTalTalHeightsState4Handler::
    call func_018_5F3D                            ;; 18:5FCB $CD $3D $5F
    call ReturnIfNonInteractive_18                ;; 18:5FCE $CD $E8 $7D
    ld   a, $02                                   ;; 18:5FD1 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:5FD3 $E0 $A1
    ld   [wC167], a                               ;; 18:5FD5 $EA $67 $C1
    ld   a, $00                                   ;; 18:5FD8 $3E $00
    ldh  [hLinkDirection], a                      ;; 18:5FDA $E0 $9E
    push bc                                       ;; 18:5FDC $C5
    call UpdateLinkWalkingAnimation_trampoline    ;; 18:5FDD $CD $F0 $0B
    pop  bc                                       ;; 18:5FE0 $C1
    call GetEntityTransitionCountdown             ;; 18:5FE1 $CD $05 $0C
    ret  nz                                       ;; 18:5FE4 $C0

    call_open_dialog Dialog237                    ;; 18:5FE5
    jp   IncrementEntityState                     ;; 18:5FEA $C3 $12 $3B

MarinAtTalTalHeightsState5Handler::
    call func_018_5F3D                            ;; 18:5FED $CD $3D $5F
    call ReturnIfNonInteractive_18                ;; 18:5FF0 $CD $E8 $7D
    ld   a, $02                                   ;; 18:5FF3 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:5FF5 $E0 $A1
    call_open_dialog Dialog238                    ;; 18:5FF7
    jp   IncrementEntityState                     ;; 18:5FFC $C3 $12 $3B

MarinAtTalTalHeightsState6Handler::
    call func_018_5F3D                            ;; 18:5FFF $CD $3D $5F
    ld   a, $02                                   ;; 18:6002 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:6004 $E0 $A1
    call ReturnIfNonInteractive_18                ;; 18:6006 $CD $E8 $7D
    call_open_dialog Dialog239                    ;; 18:6009
    ld   hl, wEntitiesPrivateState1Table          ;; 18:600E $21 $B0 $C2
    add  hl, bc                                   ;; 18:6011 $09
    ld   [hl], b                                  ;; 18:6012 $70
    jp   IncrementEntityState                     ;; 18:6013 $C3 $12 $3B

MarinAtTalTalHeightsState7Handler::
    call func_018_5F3D                            ;; 18:6016 $CD $3D $5F
    ld   a, $02                                   ;; 18:6019 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:601B $E0 $A1
    call ReturnIfNonInteractive_18                ;; 18:601D $CD $E8 $7D
    ld   hl, wEntitiesPrivateState1Table          ;; 18:6020 $21 $B0 $C2
    add  hl, bc                                   ;; 18:6023 $09
    inc  [hl]                                     ;; 18:6024 $34
    ld   a, [hl]                                  ;; 18:6025 $7E
    cp   $A0                                      ;; 18:6026 $FE $A0
    ret  nz                                       ;; 18:6028 $C0

    jp   IncrementEntityState                     ;; 18:6029 $C3 $12 $3B

MarinAtTalTalHeightsState8Handler::
    call func_018_5F3D                            ;; 18:602C $CD $3D $5F
    ld   a, $02                                   ;; 18:602F $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:6031 $E0 $A1
    call ReturnIfNonInteractive_18                ;; 18:6033 $CD $E8 $7D
    ld   a, ENTITY_MARIN_AT_TAL_TAL_HEIGHTS       ;; 18:6036 $3E $C2
    call SpawnNewEntity_trampoline                ;; 18:6038 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 18:603B $21 $00 $C2
    add  hl, de                                   ;; 18:603E $19
    ld   [hl], $12                                ;; 18:603F $36 $12
    ld   hl, wEntitiesPosYTable                   ;; 18:6041 $21 $10 $C2
    add  hl, de                                   ;; 18:6044 $19
    ld   [hl], $88                                ;; 18:6045 $36 $88
    ld   hl, wEntitiesPrivateState2Table          ;; 18:6047 $21 $C0 $C2
    add  hl, de                                   ;; 18:604A $19
    inc  [hl]                                     ;; 18:604B $34
    jp   IncrementEntityState                     ;; 18:604C $C3 $12 $3B

MarinAtTalTalHeightsState9Handler::
    call func_018_5F3D                            ;; 18:604F $CD $3D $5F
    ld   a, $02                                   ;; 18:6052 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:6054 $E0 $A1
    ret                                           ;; 18:6056 $C9

MarinAtTalTalHeightsStateAHandler::
    ld   a, $02                                   ;; 18:6057 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:6059 $E0 $A1
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:605B $F0 $EC
    cp   $3E                                      ;; 18:605D $FE $3E
    jr   c, .jr_6064                              ;; 18:605F $38 $03

    jp   IncrementEntityState                     ;; 18:6061 $C3 $12 $3B

.jr_6064
    ld   hl, wEntitiesSpeedYTable                 ;; 18:6064 $21 $50 $C2
    add  hl, bc                                   ;; 18:6067 $09
    ld   [hl], $06                                ;; 18:6068 $36 $06
    ld   hl, wEntitiesDirectionTable              ;; 18:606A $21 $80 $C3
    add  hl, bc                                   ;; 18:606D $09
    ld   [hl], $03                                ;; 18:606E $36 $03
    jp   UpdateEntityYPosWithSpeed_18             ;; 18:6070 $C3 $62 $7E

MarinAtTalTalHeightsStateBHandler::
    ld   a, $02                                   ;; 18:6073 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:6075 $E0 $A1
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6077 $21 $40 $C2
    add  hl, bc                                   ;; 18:607A $09
    ld   [hl], $FA                                ;; 18:607B $36 $FA
    ld   hl, wEntitiesDirectionTable              ;; 18:607D $21 $80 $C3
    add  hl, bc                                   ;; 18:6080 $09
    ld   [hl], $01                                ;; 18:6081 $36 $01
    call AddEntitySpeedToPos_18                   ;; 18:6083 $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ;; 18:6086 $F0 $EE
    cp   $18                                      ;; 18:6088 $FE $18
    ret  nc                                       ;; 18:608A $D0

    call GetEntityTransitionCountdown             ;; 18:608B $CD $05 $0C
    ld   [hl], $60                                ;; 18:608E $36 $60
    jp   IncrementEntityState                     ;; 18:6090 $C3 $12 $3B

MarinAtTalTalHeightsStateCHandler::
    ld   a, $02                                   ;; 18:6093 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:6095 $E0 $A1
    call GetEntityTransitionCountdown             ;; 18:6097 $CD $05 $0C
    jr   z, .jr_60A3                              ;; 18:609A $28 $07

    ld   hl, wEntitiesDirectionTable              ;; 18:609C $21 $80 $C3
    add  hl, bc                                   ;; 18:609F $09
    ld   [hl], $02                                ;; 18:60A0 $36 $02
    ret                                           ;; 18:60A2 $C9

.jr_60A3
    ld   hl, wEntitiesSpeedXTable                 ;; 18:60A3 $21 $40 $C2
    add  hl, bc                                   ;; 18:60A6 $09
    ld   [hl], $F4                                ;; 18:60A7 $36 $F4
    ld   hl, wEntitiesDirectionTable              ;; 18:60A9 $21 $80 $C3
    add  hl, bc                                   ;; 18:60AC $09
    ld   [hl], $01                                ;; 18:60AD $36 $01
    call AddEntitySpeedToPos_18                   ;; 18:60AF $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ;; 18:60B2 $F0 $EE
    cp   $F0                                      ;; 18:60B4 $FE $F0
    jr   nz, .jr_60C7                             ;; 18:60B6 $20 $0F

    xor  a                                        ;; 18:60B8 $AF
    ld   [wC167], a                               ;; 18:60B9 $EA $67 $C1
IF __PATCH_0__
    ld   [wIsMarinInAnimalVillage], a
ENDC
    ld   hl, wOverworldRoomStatus + $08           ;; 18:60BC $21 $08 $D8
    set  OW_ROOM_STATUS_FLAG_CHANGED, [hl]        ;; 18:60BF $CB $E6
    ld   a, [hl]                                  ;; 18:60C1 $7E
    ldh  [hRoomStatus], a                         ;; 18:60C2 $E0 $F8
    jp   ClearEntityStatusBank18                  ;; 18:60C4 $C3 $08 $7F

.jr_60C7
    call func_018_7EB2                            ;; 18:60C7 $CD $B2 $7E
    ld   a, e                                     ;; 18:60CA $7B
    xor  $01                                      ;; 18:60CB $EE $01
    ldh  [hLinkDirection], a                      ;; 18:60CD $E0 $9E
    push bc                                       ;; 18:60CF $C5
    call UpdateLinkWalkingAnimation_trampoline    ;; 18:60D0 $CD $F0 $0B
    pop  bc                                       ;; 18:60D3 $C1
    ret                                           ;; 18:60D4 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MarinAtTalTal2SpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0
.variant3
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant5
    db $5C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_2 | OAMF_PAL0
.variant6
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $5E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $5C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

TarinAtTalTalHeights:
    ld   de, MarinAtTalTal2SpriteVariants         ;; 18:60F5 $11 $D5 $60
    call RenderActiveEntitySpritesPair            ;; 18:60F8 $CD $C0 $3B
    call SetEntityVariantForDirection_18          ;; 18:60FB $CD $60 $7D
    ldh  a, [hActiveEntityState]                  ;; 18:60FE $F0 $F0
    JP_TABLE                                      ;; 18:6100
._00 dw TarinAtTalTalHeightsState0Handler         ;; 18:6101
._01 dw TarinAtTalTalHeightsState1Handler         ;; 18:6103
._02 dw TarinAtTalTalHeightsState2Handler         ;; 18:6105
._03 dw TarinAtTalTalHeightsState3Handler         ;; 18:6107

TarinAtTalTalHeightsState0Handler::
    ld   hl, wEntitiesDirectionTable              ;; 18:6109 $21 $80 $C3
    add  hl, bc                                   ;; 18:610C $09
    ld   [hl], $02                                ;; 18:610D $36 $02
    ld   hl, wEntitiesSpeedYTable                 ;; 18:610F $21 $50 $C2
    add  hl, bc                                   ;; 18:6112 $09
    ld   [hl], $F4                                ;; 18:6113 $36 $F4
    call UpdateEntityYPosWithSpeed_18             ;; 18:6115 $CD $62 $7E
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:6118 $F0 $EC
    cp   $70                                      ;; 18:611A $FE $70
    ret  nc                                       ;; 18:611C $D0

    call_open_dialog Dialog23B                    ;; 18:611D
    ld   a, $03                                   ;; 18:6122 $3E $03
    ldh  [hLinkDirection], a                      ;; 18:6124 $E0 $9E
    ld   a, [wMarinEntityIndex]                   ;; 18:6126 $FA $0F $C5
    ld   e, a                                     ;; 18:6129 $5F
    ld   d, b                                     ;; 18:612A $50
    ld   hl, wEntitiesDirectionTable              ;; 18:612B $21 $80 $C3
    add  hl, de                                   ;; 18:612E $19
    ld   [hl], $03                                ;; 18:612F $36 $03
    push bc                                       ;; 18:6131 $C5
    call UpdateLinkWalkingAnimation_trampoline    ;; 18:6132 $CD $F0 $0B
    pop  bc                                       ;; 18:6135 $C1
    jp   IncrementEntityState                     ;; 18:6136 $C3 $12 $3B

TarinAtTalTalHeightsState1Handler::
    ld   a, [wMarinEntityIndex]                   ;; 18:6139 $FA $0F $C5
    ld   e, a                                     ;; 18:613C $5F
    ld   d, b                                     ;; 18:613D $50
    ld   hl, wEntitiesDirectionTable              ;; 18:613E $21 $80 $C3
    add  hl, de                                   ;; 18:6141 $19
    ld   [hl], $03                                ;; 18:6142 $36 $03
    call ReturnIfNonInteractive_18                ;; 18:6144 $CD $E8 $7D
    call_open_dialog Dialog23A                    ;; 18:6147
    jp   IncrementEntityState                     ;; 18:614C $C3 $12 $3B

TarinAtTalTalHeightsState2Handler::
    ld   a, [wMarinEntityIndex]                   ;; 18:614F $FA $0F $C5
    ld   e, a                                     ;; 18:6152 $5F
    ld   d, b                                     ;; 18:6153 $50
    ld   hl, wEntitiesDirectionTable              ;; 18:6154 $21 $80 $C3
    add  hl, de                                   ;; 18:6157 $19
    ld   [hl], $03                                ;; 18:6158 $36 $03
    ld   a, [wDialogCharacterIndex]               ;; 18:615A $FA $70 $C1
    cp   $22                                      ;; 18:615D $FE $22
    jr   c, .jr_6163                              ;; 18:615F $38 $02

    ld   [hl], $01                                ;; 18:6161 $36 $01

.jr_6163
    call ReturnIfNonInteractive_18                ;; 18:6163 $CD $E8 $7D
    ld   a, [wMarinEntityIndex]                   ;; 18:6166 $FA $0F $C5
    ld   e, a                                     ;; 18:6169 $5F
    ld   d, b                                     ;; 18:616A $50
    ld   hl, wEntitiesStateTable                  ;; 18:616B $21 $90 $C2
    add  hl, de                                   ;; 18:616E $19
    inc  [hl]                                     ;; 18:616F $34
    jp   IncrementEntityState                     ;; 18:6170 $C3 $12 $3B

TarinAtTalTalHeightsState3Handler::
    ld   hl, wEntitiesDirectionTable              ;; 18:6173 $21 $80 $C3
    add  hl, bc                                   ;; 18:6176 $09
    ld   [hl], $01                                ;; 18:6177 $36 $01
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6179 $21 $40 $C2
    add  hl, bc                                   ;; 18:617C $09
    ld   [hl], $F8                                ;; 18:617D $36 $F8
    call AddEntitySpeedToPos_18                   ;; 18:617F $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ;; 18:6182 $F0 $EE
    cp   $E0                                      ;; 18:6184 $FE $E0
    ret  nz                                       ;; 18:6186 $C0

    jp   ClearEntityStatusBank18                  ;; 18:6187 $C3 $08 $7F
