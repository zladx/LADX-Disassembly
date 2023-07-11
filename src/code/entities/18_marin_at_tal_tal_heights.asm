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
    ld   a, [wHasInstrument7]                     ; $5ED7: $FA $6B $DB
    and  $02                                      ; $5EDA: $E6 $02
    jp   z, ClearEntityStatusBank18               ; $5EDC: $CA $08 $7F

    ld   a, [wIsRoosterFollowingLink]             ; $5EDF: $FA $7B $DB
    and  a                                        ; $5EE2: $A7
    jp   nz, ClearEntityStatusBank18              ; $5EE3: $C2 $08 $7F

    ldh  a, [hRoomStatus]                         ; $5EE6: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $5EE8: $E6 $10
    jp   nz, ClearEntityStatusBank18              ; $5EEA: $C2 $08 $7F

    ld   hl, wEntitiesPrivateState2Table          ; $5EED: $21 $C0 $C2
    add  hl, bc                                   ; $5EF0: $09
    ld   a, [hl]                                  ; $5EF1: $7E
    and  a                                        ; $5EF2: $A7
    jp   nz, TarinAtTalTalHeights                 ; $5EF3: $C2 $F5 $60

    ld   a, c                                     ; $5EF6: $79
    ld   [wMarinEntityIndex], a                   ; $5EF7: $EA $0F $C5
    ld   de, MarinAtTalTalAndInStoreSpriteVariants ; $5EFA: $11 $B7 $5E
    call RenderActiveEntitySpritesPair            ; $5EFD: $CD $C0 $3B
    call func_018_7D60                            ; $5F00: $CD $60 $7D
    call AddEntityZSpeedToPos_18                  ; $5F03: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $5F06: $21 $20 $C3
    add  hl, bc                                   ; $5F09: $09
    dec  [hl]                                     ; $5F0A: $35
    dec  [hl]                                     ; $5F0B: $35
    ld   hl, wEntitiesPosZTable                   ; $5F0C: $21 $10 $C3
    add  hl, bc                                   ; $5F0F: $09
    ld   a, [hl]                                  ; $5F10: $7E
    and  a                                        ; $5F11: $A7
    ldh  [hMultiPurposeG], a                      ; $5F12: $E0 $E8
    jr   z, .jr_5F1A                              ; $5F14: $28 $04

    and  $80                                      ; $5F16: $E6 $80
    jr   z, jr_018_5F20                           ; $5F18: $28 $06

.jr_5F1A
    ld   [hl], b                                  ; $5F1A: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5F1B: $21 $20 $C3
    add  hl, bc                                   ; $5F1E: $09
    ld   [hl], b                                  ; $5F1F: $70

jr_018_5F20:
    ldh  a, [hActiveEntityState]                  ; $5F20: $F0 $F0
    JP_TABLE                                      ; $5F22
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
    ld   hl, wEntitiesInertiaTable                ; $5F3D: $21 $D0 $C3
    add  hl, bc                                   ; $5F40: $09
    ld   [hl], b                                  ; $5F41: $70
    ret                                           ; $5F42: $C9

MarinAtTalTalHeightsState0Handler::
    call func_018_5F5E                            ; $5F43: $CD $5E $5F
    call ReturnIfNonInteractive_18                ; $5F46: $CD $E8 $7D
    call func_018_7EB2                            ; $5F49: $CD $B2 $7E
    ld   hl, wEntitiesDirectionTable              ; $5F4C: $21 $80 $C3
    add  hl, bc                                   ; $5F4F: $09
    ld   [hl], e                                  ; $5F50: $73
    ldh  a, [hLinkPositionX]                      ; $5F51: $F0 $98
    cp   $90                                      ; $5F53: $FE $90
    ret  nc                                       ; $5F55: $D0

    call_open_dialog Dialog235                    ; $5F56
    jp   IncrementEntityState                     ; $5F5B: $C3 $12 $3B

func_018_5F5E::
    ldh  a, [hMultiPurposeG]                      ; $5F5E: $F0 $E8
    and  a                                        ; $5F60: $A7
    jr   z, .jr_5F66                              ; $5F61: $28 $03

    and  $80                                      ; $5F63: $E6 $80
    ret  z                                        ; $5F65: $C8

.jr_5F66
    ldh  a, [hFrameCounter]                       ; $5F66: $F0 $E7
    and  $3F                                      ; $5F68: $E6 $3F
    jr   nz, .ret_5F72                            ; $5F6A: $20 $06

    ld   hl, wEntitiesSpeedZTable                 ; $5F6C: $21 $20 $C3
    add  hl, bc                                   ; $5F6F: $09
    ld   [hl], $10                                ; $5F70: $36 $10

.ret_5F72
    ret                                           ; $5F72: $C9

MarinAtTalTalHeightsState1Handler::
    call func_018_5F5E                            ; $5F73: $CD $5E $5F
    call ReturnIfNonInteractive_18                ; $5F76: $CD $E8 $7D
    call_open_dialog Dialog236                    ; $5F79
    jp   IncrementEntityState                     ; $5F7E: $C3 $12 $3B

MarinAtTalTalHeightsState2Handler::
    call func_018_5F5E                            ; $5F81: $CD $5E $5F
    call ReturnIfNonInteractive_18                ; $5F84: $CD $E8 $7D
    call func_018_7EB2                            ; $5F87: $CD $B2 $7E
    add  $08                                      ; $5F8A: $C6 $08
    cp   $10                                      ; $5F8C: $FE $10
    ret  nc                                       ; $5F8E: $D0

    call func_018_7EC2                            ; $5F8F: $CD $C2 $7E
    add  $10                                      ; $5F92: $C6 $10
    cp   $20                                      ; $5F94: $FE $20
    ret  nc                                       ; $5F96: $D0

    jp   IncrementEntityState                     ; $5F97: $C3 $12 $3B

MarinAtTalTalHeightsState3Handler::
    call func_018_5F3D                            ; $5F9A: $CD $3D $5F
    call ReturnIfNonInteractive_18                ; $5F9D: $CD $E8 $7D
    call func_018_7EB2                            ; $5FA0: $CD $B2 $7E
    ld   hl, wEntitiesDirectionTable              ; $5FA3: $21 $80 $C3
    add  hl, bc                                   ; $5FA6: $09
    ld   [hl], e                                  ; $5FA7: $73
    ld   a, [wC1A4]                               ; $5FA8: $FA $A4 $C1
    and  a                                        ; $5FAB: $A7
    jr   z, .jr_5FBF                              ; $5FAC: $28 $11

    ldh  a, [hLinkPositionX]                      ; $5FAE: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $5FB0: $21 $00 $C2
    add  hl, bc                                   ; $5FB3: $09
    add  $10                                      ; $5FB4: $C6 $10
    ld   [hl], a                                  ; $5FB6: $77
    ldh  a, [hLinkPositionY]                      ; $5FB7: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $5FB9: $21 $10 $C2
    add  hl, bc                                   ; $5FBC: $09
    ld   [hl], a                                  ; $5FBD: $77
    ret                                           ; $5FBE: $C9

.jr_5FBF
    xor  a                                        ; $5FBF: $AF
    ld   [wLinkAttackStepAnimationCountdown], a   ; $5FC0: $EA $9B $C1

    call GetEntityTransitionCountdown             ; $5FC3: $CD $05 $0C
    ld   [hl], $10                                ; $5FC6: $36 $10
    jp   IncrementEntityState                     ; $5FC8: $C3 $12 $3B

MarinAtTalTalHeightsState4Handler::
    call func_018_5F3D                            ; $5FCB: $CD $3D $5F
    call ReturnIfNonInteractive_18                ; $5FCE: $CD $E8 $7D
    ld   a, $02                                   ; $5FD1: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5FD3: $E0 $A1
    ld   [wC167], a                               ; $5FD5: $EA $67 $C1
    ld   a, $00                                   ; $5FD8: $3E $00
    ldh  [hLinkDirection], a                      ; $5FDA: $E0 $9E
    push bc                                       ; $5FDC: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $5FDD: $CD $F0 $0B
    pop  bc                                       ; $5FE0: $C1
    call GetEntityTransitionCountdown             ; $5FE1: $CD $05 $0C
    ret  nz                                       ; $5FE4: $C0

    call_open_dialog Dialog237                    ; $5FE5
    jp   IncrementEntityState                     ; $5FEA: $C3 $12 $3B

MarinAtTalTalHeightsState5Handler::
    call func_018_5F3D                            ; $5FED: $CD $3D $5F
    call ReturnIfNonInteractive_18                ; $5FF0: $CD $E8 $7D
    ld   a, $02                                   ; $5FF3: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5FF5: $E0 $A1
    call_open_dialog Dialog238                    ; $5FF7
    jp   IncrementEntityState                     ; $5FFC: $C3 $12 $3B

MarinAtTalTalHeightsState6Handler::
    call func_018_5F3D                            ; $5FFF: $CD $3D $5F
    ld   a, $02                                   ; $6002: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6004: $E0 $A1
    call ReturnIfNonInteractive_18                ; $6006: $CD $E8 $7D
    call_open_dialog Dialog239                    ; $6009
    ld   hl, wEntitiesPrivateState1Table          ; $600E: $21 $B0 $C2
    add  hl, bc                                   ; $6011: $09
    ld   [hl], b                                  ; $6012: $70
    jp   IncrementEntityState                     ; $6013: $C3 $12 $3B

MarinAtTalTalHeightsState7Handler::
    call func_018_5F3D                            ; $6016: $CD $3D $5F
    ld   a, $02                                   ; $6019: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $601B: $E0 $A1
    call ReturnIfNonInteractive_18                ; $601D: $CD $E8 $7D
    ld   hl, wEntitiesPrivateState1Table          ; $6020: $21 $B0 $C2
    add  hl, bc                                   ; $6023: $09
    inc  [hl]                                     ; $6024: $34
    ld   a, [hl]                                  ; $6025: $7E
    cp   $A0                                      ; $6026: $FE $A0
    ret  nz                                       ; $6028: $C0

    jp   IncrementEntityState                     ; $6029: $C3 $12 $3B

MarinAtTalTalHeightsState8Handler::
    call func_018_5F3D                            ; $602C: $CD $3D $5F
    ld   a, $02                                   ; $602F: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6031: $E0 $A1
    call ReturnIfNonInteractive_18                ; $6033: $CD $E8 $7D
    ld   a, ENTITY_MARIN_AT_TAL_TAL_HEIGHTS       ; $6036: $3E $C2
    call SpawnNewEntity_trampoline                ; $6038: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $603B: $21 $00 $C2
    add  hl, de                                   ; $603E: $19
    ld   [hl], $12                                ; $603F: $36 $12
    ld   hl, wEntitiesPosYTable                   ; $6041: $21 $10 $C2
    add  hl, de                                   ; $6044: $19
    ld   [hl], $88                                ; $6045: $36 $88
    ld   hl, wEntitiesPrivateState2Table          ; $6047: $21 $C0 $C2
    add  hl, de                                   ; $604A: $19
    inc  [hl]                                     ; $604B: $34
    jp   IncrementEntityState                     ; $604C: $C3 $12 $3B

MarinAtTalTalHeightsState9Handler::
    call func_018_5F3D                            ; $604F: $CD $3D $5F
    ld   a, $02                                   ; $6052: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6054: $E0 $A1
    ret                                           ; $6056: $C9

MarinAtTalTalHeightsStateAHandler::
    ld   a, $02                                   ; $6057: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6059: $E0 $A1
    ldh  a, [hActiveEntityVisualPosY]             ; $605B: $F0 $EC
    cp   $3E                                      ; $605D: $FE $3E
    jr   c, .jr_6064                              ; $605F: $38 $03

    jp   IncrementEntityState                     ; $6061: $C3 $12 $3B

.jr_6064
    ld   hl, wEntitiesSpeedYTable                 ; $6064: $21 $50 $C2
    add  hl, bc                                   ; $6067: $09
    ld   [hl], $06                                ; $6068: $36 $06
    ld   hl, wEntitiesDirectionTable              ; $606A: $21 $80 $C3
    add  hl, bc                                   ; $606D: $09
    ld   [hl], $03                                ; $606E: $36 $03
    jp   UpdateEntityYPosWithSpeed_18             ; $6070: $C3 $62 $7E

MarinAtTalTalHeightsStateBHandler::
    ld   a, $02                                   ; $6073: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6075: $E0 $A1
    ld   hl, wEntitiesSpeedXTable                 ; $6077: $21 $40 $C2
    add  hl, bc                                   ; $607A: $09
    ld   [hl], $FA                                ; $607B: $36 $FA
    ld   hl, wEntitiesDirectionTable              ; $607D: $21 $80 $C3
    add  hl, bc                                   ; $6080: $09
    ld   [hl], $01                                ; $6081: $36 $01
    call AddEntitySpeedToPos_18                   ; $6083: $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ; $6086: $F0 $EE
    cp   $18                                      ; $6088: $FE $18
    ret  nc                                       ; $608A: $D0

    call GetEntityTransitionCountdown             ; $608B: $CD $05 $0C
    ld   [hl], $60                                ; $608E: $36 $60
    jp   IncrementEntityState                     ; $6090: $C3 $12 $3B

MarinAtTalTalHeightsStateCHandler::
    ld   a, $02                                   ; $6093: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6095: $E0 $A1
    call GetEntityTransitionCountdown             ; $6097: $CD $05 $0C
    jr   z, .jr_60A3                              ; $609A: $28 $07

    ld   hl, wEntitiesDirectionTable              ; $609C: $21 $80 $C3
    add  hl, bc                                   ; $609F: $09
    ld   [hl], $02                                ; $60A0: $36 $02
    ret                                           ; $60A2: $C9

.jr_60A3
    ld   hl, wEntitiesSpeedXTable                 ; $60A3: $21 $40 $C2
    add  hl, bc                                   ; $60A6: $09
    ld   [hl], $F4                                ; $60A7: $36 $F4
    ld   hl, wEntitiesDirectionTable              ; $60A9: $21 $80 $C3
    add  hl, bc                                   ; $60AC: $09
    ld   [hl], $01                                ; $60AD: $36 $01
    call AddEntitySpeedToPos_18                   ; $60AF: $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ; $60B2: $F0 $EE
    cp   $F0                                      ; $60B4: $FE $F0
    jr   nz, .jr_60C7                             ; $60B6: $20 $0F

    xor  a                                        ; $60B8: $AF
    ld   [wC167], a                               ; $60B9: $EA $67 $C1
IF __PATCH_0__
    ld   [wIsMarinInAnimalVillage], a
ENDC
    ld   hl, wOverworldRoomStatus + $08           ; $60BC: $21 $08 $D8
    set  OW_ROOM_STATUS_FLAG_CHANGED, [hl]        ; $60BF: $CB $E6
    ld   a, [hl]                                  ; $60C1: $7E
    ldh  [hRoomStatus], a                         ; $60C2: $E0 $F8
    jp   ClearEntityStatusBank18                  ; $60C4: $C3 $08 $7F

.jr_60C7
    call func_018_7EB2                            ; $60C7: $CD $B2 $7E
    ld   a, e                                     ; $60CA: $7B
    xor  $01                                      ; $60CB: $EE $01
    ldh  [hLinkDirection], a                      ; $60CD: $E0 $9E
    push bc                                       ; $60CF: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $60D0: $CD $F0 $0B
    pop  bc                                       ; $60D3: $C1
    ret                                           ; $60D4: $C9

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
    ld   de, MarinAtTalTal2SpriteVariants         ; $60F5: $11 $D5 $60
    call RenderActiveEntitySpritesPair            ; $60F8: $CD $C0 $3B
    call func_018_7D60                            ; $60FB: $CD $60 $7D
    ldh  a, [hActiveEntityState]                  ; $60FE: $F0 $F0
    JP_TABLE                                      ; $6100
._00 dw TarinAtTalTalHeightsState0Handler         ; $6101
._01 dw TarinAtTalTalHeightsState1Handler         ; $6103
._02 dw TarinAtTalTalHeightsState2Handler         ; $6105
._03 dw TarinAtTalTalHeightsState3Handler         ; $6107

TarinAtTalTalHeightsState0Handler::
    ld   hl, wEntitiesDirectionTable              ; $6109: $21 $80 $C3
    add  hl, bc                                   ; $610C: $09
    ld   [hl], $02                                ; $610D: $36 $02
    ld   hl, wEntitiesSpeedYTable                 ; $610F: $21 $50 $C2
    add  hl, bc                                   ; $6112: $09
    ld   [hl], $F4                                ; $6113: $36 $F4
    call UpdateEntityYPosWithSpeed_18             ; $6115: $CD $62 $7E
    ldh  a, [hActiveEntityVisualPosY]             ; $6118: $F0 $EC
    cp   $70                                      ; $611A: $FE $70
    ret  nc                                       ; $611C: $D0

    call_open_dialog Dialog23B                    ; $611D
    ld   a, $03                                   ; $6122: $3E $03
    ldh  [hLinkDirection], a                      ; $6124: $E0 $9E
    ld   a, [wMarinEntityIndex]                   ; $6126: $FA $0F $C5
    ld   e, a                                     ; $6129: $5F
    ld   d, b                                     ; $612A: $50
    ld   hl, wEntitiesDirectionTable              ; $612B: $21 $80 $C3
    add  hl, de                                   ; $612E: $19
    ld   [hl], $03                                ; $612F: $36 $03
    push bc                                       ; $6131: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $6132: $CD $F0 $0B
    pop  bc                                       ; $6135: $C1
    jp   IncrementEntityState                     ; $6136: $C3 $12 $3B

TarinAtTalTalHeightsState1Handler::
    ld   a, [wMarinEntityIndex]                   ; $6139: $FA $0F $C5
    ld   e, a                                     ; $613C: $5F
    ld   d, b                                     ; $613D: $50
    ld   hl, wEntitiesDirectionTable              ; $613E: $21 $80 $C3
    add  hl, de                                   ; $6141: $19
    ld   [hl], $03                                ; $6142: $36 $03
    call ReturnIfNonInteractive_18                ; $6144: $CD $E8 $7D
    call_open_dialog Dialog23A                    ; $6147
    jp   IncrementEntityState                     ; $614C: $C3 $12 $3B

TarinAtTalTalHeightsState2Handler::
    ld   a, [wMarinEntityIndex]                   ; $614F: $FA $0F $C5
    ld   e, a                                     ; $6152: $5F
    ld   d, b                                     ; $6153: $50
    ld   hl, wEntitiesDirectionTable              ; $6154: $21 $80 $C3
    add  hl, de                                   ; $6157: $19
    ld   [hl], $03                                ; $6158: $36 $03
    ld   a, [wDialogCharacterIndex]               ; $615A: $FA $70 $C1
    cp   $22                                      ; $615D: $FE $22
    jr   c, .jr_6163                              ; $615F: $38 $02

    ld   [hl], $01                                ; $6161: $36 $01

.jr_6163
    call ReturnIfNonInteractive_18                ; $6163: $CD $E8 $7D
    ld   a, [wMarinEntityIndex]                   ; $6166: $FA $0F $C5
    ld   e, a                                     ; $6169: $5F
    ld   d, b                                     ; $616A: $50
    ld   hl, wEntitiesStateTable                  ; $616B: $21 $90 $C2
    add  hl, de                                   ; $616E: $19
    inc  [hl]                                     ; $616F: $34
    jp   IncrementEntityState                     ; $6170: $C3 $12 $3B

TarinAtTalTalHeightsState3Handler::
    ld   hl, wEntitiesDirectionTable              ; $6173: $21 $80 $C3
    add  hl, bc                                   ; $6176: $09
    ld   [hl], $01                                ; $6177: $36 $01
    ld   hl, wEntitiesSpeedXTable                 ; $6179: $21 $40 $C2
    add  hl, bc                                   ; $617C: $09
    ld   [hl], $F8                                ; $617D: $36 $F8
    call AddEntitySpeedToPos_18                   ; $617F: $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ; $6182: $F0 $EE
    cp   $E0                                      ; $6184: $FE $E0
    ret  nz                                       ; $6186: $C0

    jp   ClearEntityStatusBank18                  ; $6187: $C3 $08 $7F
