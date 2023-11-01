; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown069SpriteVariants::
.variant0
    db $9A, $15
    db $9C, $15

label_019_6CE7:
    ld   de, Unknown069SpriteVariants             ; $6CE7: $11 $E3 $6C
    call RenderActiveEntitySpritesPair            ; $6CEA: $CD $C0 $3B
    call AddEntityZSpeedToPos_19                  ; $6CED: $CD $F1 $7D
    ld   hl, wEntitiesSpeedZTable                 ; $6CF0: $21 $20 $C3
    add  hl, bc                                   ; $6CF3: $09
    dec  [hl]                                     ; $6CF4: $35
    ld   hl, wEntitiesPosZTable                   ; $6CF5: $21 $10 $C3
    add  hl, bc                                   ; $6CF8: $09
    ld   a, [hl]                                  ; $6CF9: $7E
    and  $80                                      ; $6CFA: $E6 $80
    jp   nz, ClearEntityStatus_19                 ; $6CFC: $C2 $61 $7E

    ret                                           ; $6CFF: $C9

label_019_6D00:
    push bc                                       ; $6D00: $C5
    sla  c                                        ; $6D01: $CB $21
    sla  c                                        ; $6D03: $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ; $6D05: $21 $80 $D5
    add  hl, bc                                   ; $6D08: $09
    ld   a, $0B                                   ; $6D09: $3E $0B
    ld   [hl+], a                                 ; $6D0B: $22
    ld   a, $09                                   ; $6D0C: $3E $09
    ld   [hl+], a                                 ; $6D0E: $22
    ld   a, $08                                   ; $6D0F: $3E $08
    ld   [hl+], a                                 ; $6D11: $22
    ld   a, $0B                                   ; $6D12: $3E $0B
    ld   [hl], a                                  ; $6D14: $77
    pop  bc                                       ; $6D15: $C1
    ld   hl, wEntitiesPrivateState1Table          ; $6D16: $21 $B0 $C2
    add  hl, bc                                   ; $6D19: $09
    ld   a, [hl]                                  ; $6D1A: $7E
    and  a                                        ; $6D1B: $A7
    jp   nz, label_019_6CE7                       ; $6D1C: $C2 $E7 $6C

    call func_019_6EC5                            ; $6D1F: $CD $C5 $6E
    call PushLinkOutOfEntity_19                   ; $6D22: $CD $A2 $7C
    ld   a, [wGameplayType]                       ; $6D25: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $6D28: $FE $0B
    ret  nz                                       ; $6D2A: $C0

    ld   a, [wTransitionSequenceCounter]          ; $6D2B: $FA $6B $C1
    cp   $04                                      ; $6D2E: $FE $04
    ret  nz                                       ; $6D30: $C0

    ldh  a, [hActiveEntityState]                  ; $6D31: $F0 $F0
    JP_TABLE                                      ; $6D33
._00 dw BananasSchuleState0Handler
._01 dw BananasSchuleState1Handler
._02 dw BananasSchuleState2Handler
._03 dw BananasSchuleState3Handler

BananasSchuleState0Handler::
    call func_019_7CF0                            ; $6D3C: $CD $F0 $7C
    jr   nc, jr_019_6D67                          ; $6D3F: $30 $26

    ld_dialog_low e, Dialog1CD                    ; $6D41: $1E $CD
    ldh  a, [hRoomStatus]                         ; $6D43: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $6D45: $E6 $20
    jr   nz, .jr_6D63                             ; $6D47: $20 $1A

    ld_dialog_low e, Dialog1CC                    ; $6D49: $1E $CC
    ld   a, [wIndoorBRoomStatus + $FE]            ; $6D4B: $FA $FE $DA
    and  $20                                      ; $6D4E: $E6 $20
    jr   nz, .jr_6D63                             ; $6D50: $20 $11

    ld_dialog_low e, Dialog1C6                    ; $6D52: $1E $C6
    ld   a, [wTradeSequenceItem]                  ; $6D54: $FA $0E $DB
    cp   $03                                      ; $6D57: $FE $03
    jr   nz, .jr_6D63                             ; $6D59: $20 $08

    call_open_dialog Dialog1C7                    ; $6D5B
    jp   IncrementEntityState                     ; $6D60: $C3 $12 $3B

.jr_6D63
    ld   a, e                                     ; $6D63: $7B
    call OpenDialogInTable1                       ; $6D64: $CD $73 $23

jr_019_6D67:
    ldh  a, [hFrameCounter]                       ; $6D67: $F0 $E7
    rra                                           ; $6D69: $1F
    rra                                           ; $6D6A: $1F
    rra                                           ; $6D6B: $1F
    rra                                           ; $6D6C: $1F
    and  $01                                      ; $6D6D: $E6 $01
    jp   SetEntitySpriteVariant                   ; $6D6F: $C3 $0C $3B

BananasSchuleState1Handler::
    ld   a, [wDialogState]                        ; $6D72: $FA $9F $C1
    and  a                                        ; $6D75: $A7
    ret  nz                                       ; $6D76: $C0

    call IncrementEntityState                     ; $6D77: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ; $6D7A: $FA $77 $C1
    and  a                                        ; $6D7D: $A7
    jr   z, .jr_6D86                              ; $6D7E: $28 $06

    ld   [hl], b                                  ; $6D80: $70
    jp_open_dialog Dialog1C9                      ; $6D81

.jr_6D86
    jp_open_dialog Dialog1C8                      ; $6D86

BananasSchuleState2Handler::
    ld   a, [wDialogState]                        ; $6D8B: $FA $9F $C1
    and  a                                        ; $6D8E: $A7
    ret  nz                                       ; $6D8F: $C0

    ld   a, ENTITY_BANANAS_SCHULE_SALE            ; $6D90: $3E $CD
    call SpawnNewEntity_trampoline                ; $6D92: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $6D95: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $6D97: $21 $00 $C2
    add  hl, de                                   ; $6D9A: $19
    sub  $02                                      ; $6D9B: $D6 $02
    ld   [hl], a                                  ; $6D9D: $77
    ldh  a, [hMultiPurpose1]                      ; $6D9E: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6DA0: $21 $10 $C2
    add  hl, de                                   ; $6DA3: $19
    ld   [hl], a                                  ; $6DA4: $77
    ld   hl, wEntitiesPrivateState1Table          ; $6DA5: $21 $B0 $C2
    add  hl, de                                   ; $6DA8: $19
    ld   [hl], $01                                ; $6DA9: $36 $01
    ld   hl, wEntitiesSpeedZTable                 ; $6DAB: $21 $20 $C3
    add  hl, de                                   ; $6DAE: $19
    ld   [hl], $20                                ; $6DAF: $36 $20
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6DB1: $21 $40 $C3
    add  hl, de                                   ; $6DB4: $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $6DB5: $36 $C2
    ld   a, JINGLE_JUMP                           ; $6DB7: $3E $24
    ldh  [hJingle], a                             ; $6DB9: $E0 $F2
    ldh  a, [hIsGBC]                              ; $6DBB: $F0 $FE
    and  a                                        ; $6DBD: $A7
    jr   z, .jr_6DD4                              ; $6DBE: $28 $14

    ld   hl, wObjPal6 + 1*2                       ; $6DC0: $21 $7A $DC
    ld   a, $FF                                   ; $6DC3: $3E $FF
    ld   [hl+], a                                 ; $6DC5: $22
    ld   a, $7F                                   ; $6DC6: $3E $7F
    ld   [hl+], a                                 ; $6DC8: $22
    ld   a, $31                                   ; $6DC9: $3E $31
    ld   [hl+], a                                 ; $6DCB: $22
    ld   a, $52                                   ; $6DCC: $3E $52
    ld   [hl+], a                                 ; $6DCE: $22
    ld   a, $02                                   ; $6DCF: $3E $02
    ld   [wPaletteDataFlags], a                   ; $6DD1: $EA $D1 $DD

.jr_6DD4
    call GetEntityTransitionCountdown             ; $6DD4: $CD $05 $0C
    ld   [hl], $C0                                ; $6DD7: $36 $C0
    jp   IncrementEntityState                     ; $6DD9: $C3 $12 $3B

Data_019_6DDC::
    db   $00, $01, $02, $01

BananasSchuleState3Handler::
    ld   a, $02                                   ; $6DE0: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6DE2: $E0 $A1
    ld   [wC167], a                               ; $6DE4: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $6DE7: $CD $05 $0C
    jr   nz, .jr_6E01                             ; $6DEA: $20 $15

    xor  a                                        ; $6DEC: $AF
    ld   [wC167], a                               ; $6DED: $EA $67 $C1
    ld   a, $04                                   ; $6DF0: $3E $04
    ld   [wTradeSequenceItem], a                  ; $6DF2: $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ; $6DF5: $3E $0D
    ldh  [hReplaceTiles], a                       ; $6DF7: $E0 $A5
    call CreateTradingItemEntity                  ; $6DF9: $CD $0C $0C
    call IncrementEntityState                     ; $6DFC: $CD $12 $3B
    ld   [hl], b                                  ; $6DFF: $70
    ret                                           ; $6E00: $C9

.jr_6E01
    cp   $80                                      ; $6E01: $FE $80
    jr   c, .jr_6E0A                              ; $6E03: $38 $05

    ld   a, $03                                   ; $6E05: $3E $03
    jp   SetEntitySpriteVariant                   ; $6E07: $C3 $0C $3B

.jr_6E0A
    cp   $08                                      ; $6E0A: $FE $08
    jr   nz, .jr_6E14                             ; $6E0C: $20 $06

    dec  [hl]                                     ; $6E0E: $35
    call_open_dialog Dialog1CA                    ; $6E0F

.jr_6E14
    ldh  a, [hFrameCounter]                       ; $6E14: $F0 $E7
    rra                                           ; $6E16: $1F
    rra                                           ; $6E17: $1F
    rra                                           ; $6E18: $1F
    and  $03                                      ; $6E19: $E6 $03
    ld   e, a                                     ; $6E1B: $5F
    ld   d, b                                     ; $6E1C: $50
    ld   hl, Data_019_6DDC                        ; $6E1D: $21 $DC $6D
    add  hl, de                                   ; $6E20: $19
    ld   a, [hl]                                  ; $6E21: $7E
    jp   SetEntitySpriteVariant                   ; $6E22: $C3 $0C $3B

Data_019_6E25::
    db   $00, $00, $50, $03, $00, $08, $52, $03, $00, $10, $54, $03, $10, $00, $56, $03
    db   $10, $08, $58, $03, $10, $10, $5A, $03, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $50, $03, $00, $08, $52, $03, $00, $10, $5C, $03, $10, $00, $56, $03
    db   $10, $08, $58, $03, $10, $10, $5E, $03, $10, $18, $60, $03, $FF, $FF, $FF, $FF
    db   $00, $00, $62, $03, $00, $08, $64, $03, $00, $10, $66, $03, $10, $00, $68, $03
    db   $10, $08, $58, $03, $10, $10, $5E, $03, $10, $18, $60, $03, $FF, $FF, $FF, $FF
    db   $00, $00, $6A, $03, $00, $08, $6C, $03, $00, $10, $6E, $03, $10, $00, $68, $03
    db   $10, $08, $58, $03, $10, $10, $5E, $03, $10, $18, $60, $03, $FF, $FF, $FF, $FF

Data_019_6EA5::
    db   $10, $00, $74, $07, $10, $08, $76, $07, $10, $10, $74, $07, $10, $18, $76, $07
    db   $00, $10, $74, $07, $00, $18, $76, $07, $00, $00, $74, $07, $00, $08, $76, $07

func_019_6EC5::
    ldh  a, [hActiveEntitySpriteVariant]          ; $6EC5: $F0 $F1
    rla                                           ; $6EC7: $17
    rla                                           ; $6EC8: $17
    rla                                           ; $6EC9: $17
    rla                                           ; $6ECA: $17
    rla                                           ; $6ECB: $17
    and  $E0                                      ; $6ECC: $E6 $E0
    ld   e, a                                     ; $6ECE: $5F
    ld   d, b                                     ; $6ECF: $50
    ld   hl, Data_019_6E25                        ; $6ED0: $21 $25 $6E
    add  hl, de                                   ; $6ED3: $19
    ldh  a, [hActiveEntityPosX]                   ; $6ED4: $F0 $EE
    add  $03                                      ; $6ED6: $C6 $03
    ldh  [hActiveEntityPosX], a                   ; $6ED8: $E0 $EE
    ld   c, $07                                   ; $6EDA: $0E $07
    call RenderActiveEntitySpritesRect            ; $6EDC: $CD $E6 $3C
    ld   a, $02                                   ; $6EDF: $3E $02
    call func_015_7964_trampoline                 ; $6EE1: $CD $A0 $3D
    ld   a, $78                                   ; $6EE4: $3E $78
    ldh  [hActiveEntityPosX], a                   ; $6EE6: $E0 $EE
    ld   a, $5C                                   ; $6EE8: $3E $5C
    ldh  [hActiveEntityVisualPosY], a             ; $6EEA: $E0 $EC
    ld   hl, Data_019_6EA5                        ; $6EEC: $21 $A5 $6E
    ld   c, $08                                   ; $6EEF: $0E $08
    ld   a, [wTradeSequenceItem]                  ; $6EF1: $FA $0E $DB
    cp   $04                                      ; $6EF4: $FE $04
    jr   nz, .jr_6EFA                             ; $6EF6: $20 $02

    dec  c                                        ; $6EF8: $0D
    dec  c                                        ; $6EF9: $0D

.jr_6EFA
    call RenderActiveEntitySpritesRect            ; $6EFA: $CD $E6 $3C
    ld   a, $03                                   ; $6EFD: $3E $03
    call func_015_7964_trampoline                 ; $6EFF: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $6F02: $C3 $8A $3D

Data_019_6F05::
    db   $08, $04, $70, $01, $08, $0C, $72, $01, $08, $14, $70, $21

BananasSchuleSaleEntityHandler::
    ld   a, [wIsIndoor]                           ; $6F11: $FA $A5 $DB
    and  a                                        ; $6F14: $A7
    jr   nz, .jr_6F25                             ; $6F15: $20 $0E

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6F17: $21 $40 $C3
    add  hl, bc                                   ; $6F1A: $09
    ld   [hl], 3 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $6F1B: $36 $C3
    ld   hl, Data_019_6F05                        ; $6F1D: $21 $05 $6F
    ld   c, $03                                   ; $6F20: $0E $03
    jp   RenderActiveEntitySpritesRect            ; $6F22: $C3 $E6 $3C

.jr_6F25
    ldh  a, [hMapRoom]                            ; $6F25: $F0 $F6
    cp   UNKNOWN_ROOM_FE                          ; $6F27: $FE $FE
    jp   z, label_019_6D00                        ; $6F29: $CA $00 $6D

    ldh  a, [hActiveEntityPosX]                   ; $6F2C: $F0 $EE
    cp   $30                                      ; $6F2E: $FE $30
    jp   c, label_019_70A9                        ; $6F30: $DA $A9 $70

    ldh  a, [hActiveEntityState]                  ; $6F33: $F0 $F0
    and  a                                        ; $6F35: $A7
    jr   nz, .jr_6F66                             ; $6F36: $20 $2E

    call IncrementEntityState                     ; $6F38: $CD $12 $3B
    ld   hl, wEntitiesPosYTable                   ; $6F3B: $21 $10 $C2
    add  hl, bc                                   ; $6F3E: $09
    ld   [hl], $48                                ; $6F3F: $36 $48
    ld   hl, wEntitiesPosXTable                   ; $6F41: $21 $00 $C2
    add  hl, bc                                   ; $6F44: $09
    ld   a, [hl]                                  ; $6F45: $7E
    sub  $04                                      ; $6F46: $D6 $04
    ld   [hl], a                                  ; $6F48: $77
    ld   a, ENTITY_BANANAS_SCHULE_SALE            ; $6F49: $3E $CD
    call SpawnNewEntity_trampoline                ; $6F4B: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $6F4E: $21 $00 $C2
    add  hl, de                                   ; $6F51: $19
    ld   [hl], $28                                ; $6F52: $36 $28
    ld   hl, wEntitiesPosYTable                   ; $6F54: $21 $10 $C2
    add  hl, de                                   ; $6F57: $19
    ld   [hl], $28                                ; $6F58: $36 $28
    ld   hl, wEntitiesPrivateState1Table          ; $6F5A: $21 $B0 $C2
    add  hl, de                                   ; $6F5D: $19
    ld   [hl], $01                                ; $6F5E: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $6F60: $21 $E0 $C2
    add  hl, de                                   ; $6F63: $19
    ld   [hl], $40                                ; $6F64: $36 $40

.jr_6F66
    push bc                                       ; $6F66: $C5
    sla  c                                        ; $6F67: $CB $21
    sla  c                                        ; $6F69: $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ; $6F6B: $21 $80 $D5
    add  hl, bc                                   ; $6F6E: $09
    ld   a, $0A                                   ; $6F6F: $3E $0A
    ld   [hl+], a                                 ; $6F71: $22
    ld   a, $08                                   ; $6F72: $3E $08
    ld   [hl+], a                                 ; $6F74: $22
    ld   a, $FF                                   ; $6F75: $3E $FF
    ld   [hl+], a                                 ; $6F77: $22
    ld   a, $09                                   ; $6F78: $3E $09
    ld   [hl], a                                  ; $6F7A: $77
    pop  bc                                       ; $6F7B: $C1
    call func_019_7039                            ; $6F7C: $CD $39 $70
    call PushLinkOutOfEntity_19                   ; $6F7F: $CD $A2 $7C
    ldh  a, [hActiveEntityState]                  ; $6F82: $F0 $F0
    JP_TABLE                                      ; $6F84
._00 dw func_019_6F8B                             ; $6F85
._01 dw func_019_6F8C                             ; $6F87
._02 dw func_019_6FC5                             ; $6F89

func_019_6F8B::
    ret                                           ; $6F8B: $C9

func_019_6F8C::
    call GetEntityDropTimer                       ; $6F8C: $CD $FB $0B
    ret  nz                                       ; $6F8F: $C0

    call func_019_7CF0                            ; $6F90: $CD $F0 $7C
    jr   nc, jr_019_6FB8                          ; $6F93: $30 $23

    ld   a, [wTradeSequenceItem]                  ; $6F95: $FA $0E $DB
    cp   $0D                                      ; $6F98: $FE $0D
    jr   nz, .jr_6FA0                             ; $6F9A: $20 $04

    ld_dialog_low a, Dialog18F                    ; $6F9C: $3E $8F
    jr   jr_019_6FAD                              ; $6F9E: $18 $0D

.jr_6FA0
    cp   $0E                                      ; $6FA0: $FE $0E
    jr   nz, .jr_6FAB                             ; $6FA2: $20 $07

    call_open_dialog Dialog0D8                    ; $6FA4
    jr   jr_019_6FB0                              ; $6FA9: $18 $05

.jr_6FAB
    ld_dialog_low a, Dialog19B                    ; $6FAB: $3E $9B

jr_019_6FAD:
    call OpenDialogInTable1                       ; $6FAD: $CD $73 $23

jr_019_6FB0:
    ld   hl, wDialogState                         ; $6FB0: $21 $9F $C1
    set  DIALOG_BOX_BOTTOM_BIT, [hl]              ; $6FB3: $CB $FE
    call IncrementEntityState                     ; $6FB5: $CD $12 $3B

jr_019_6FB8:
    ldh  a, [hFrameCounter]                       ; $6FB8: $F0 $E7
    ld   e, $00                                   ; $6FBA: $1E $00
    and  $20                                      ; $6FBC: $E6 $20
    jr   z, .jr_6FC1                              ; $6FBE: $28 $01

    inc  e                                        ; $6FC0: $1C

.jr_6FC1
    ld   a, e                                     ; $6FC1: $7B
    jp   SetEntitySpriteVariant                   ; $6FC2: $C3 $0C $3B

func_019_6FC5::
    ld   a, [wDialogState]                        ; $6FC5: $FA $9F $C1
    and  a                                        ; $6FC8: $A7
    jr   nz, .jr_6FD0                             ; $6FC9: $20 $05

    call IncrementEntityState                     ; $6FCB: $CD $12 $3B
    ld   [hl], $01                                ; $6FCE: $36 $01

.jr_6FD0
    call EntityLinkPositionXDifference_19         ; $6FD0: $CD $0B $7E
    ld   a, e                                     ; $6FD3: $7B
    add  $02                                      ; $6FD4: $C6 $02
    jp   SetEntitySpriteVariant                   ; $6FD6: $C3 $0C $3B

Data_019_6FD9::
    db   $F8, $F8, $5A, $02, $F8, $00, $5C, $02, $F8, $08, $5E, $02, $08, $00, $60, $02
    db   $08, $08, $62, $02, $F8, $10, $5A, $22, $F8, $00, $5E, $22, $F8, $08, $5C, $22
    db   $08, $00, $62, $22, $08, $08, $60, $22, $00, $10, $50, $22, $F8, $00, $54, $22
    db   $F8, $08, $52, $22, $08, $00, $58, $22, $08, $08, $56, $22, $00, $F8, $50, $02
    db   $F8, $00, $52, $02, $F8, $08, $54, $02, $08, $00, $56, $02, $08, $08, $58, $02

Data_019_7029::
    db   $F0, $00, $76, $01, $F0, $08, $76, $21, $00, $00, $78, $01, $00, $08, $78, $21

func_019_7039::
    ldh  a, [hActiveEntitySpriteVariant]          ; $7039: $F0 $F1
    rla                                           ; $703B: $17
    rla                                           ; $703C: $17
    and  $FC                                      ; $703D: $E6 $FC
    ld   e, a                                     ; $703F: $5F
    rla                                           ; $7040: $17
    rla                                           ; $7041: $17
    and  $F0                                      ; $7042: $E6 $F0
    add  e                                        ; $7044: $83
    ld   e, a                                     ; $7045: $5F
    ld   d, b                                     ; $7046: $50
    ld   hl, Data_019_6FD9                        ; $7047: $21 $D9 $6F
    add  hl, de                                   ; $704A: $19
    ldh  a, [hActiveEntityPosX]                   ; $704B: $F0 $EE
    add  $04                                      ; $704D: $C6 $04
    ldh  [hActiveEntityPosX], a                   ; $704F: $E0 $EE
    ld   c, $05                                   ; $7051: $0E $05
    call RenderActiveEntitySpritesRect            ; $7053: $CD $E6 $3C
    ldh  a, [hActiveEntityPosX]                   ; $7056: $F0 $EE
    add  $10                                      ; $7058: $C6 $10
    ldh  [hActiveEntityPosX], a                   ; $705A: $E0 $EE
    ld   hl, Data_019_7029                        ; $705C: $21 $29 $70
    ld   c, $04                                   ; $705F: $0E $04
    call RenderActiveEntitySpritesRect            ; $7061: $CD $E6 $3C
    call PushLinkOutOfEntity_19                   ; $7064: $CD $A2 $7C
    ldh  a, [hLinkPositionX]                      ; $7067: $F0 $98
    sub  $68                                      ; $7069: $D6 $68
    add  $04                                      ; $706B: $C6 $04
    cp   $08                                      ; $706D: $FE $08
    jr   nc, .jr_70A6                             ; $706F: $30 $35

    ldh  a, [hLinkPositionY]                      ; $7071: $F0 $99
    sub  $50                                      ; $7073: $D6 $50
    add  $04                                      ; $7075: $C6 $04
    cp   $08                                      ; $7077: $FE $08
    jr   nc, .jr_70A6                             ; $7079: $30 $2B

    ldh  a, [hLinkDirection]                      ; $707B: $F0 $9E
    cp   $02                                      ; $707D: $FE $02
    jr   nz, .jr_70A6                             ; $707F: $20 $25

    call func_019_7D16                            ; $7081: $CD $16 $7D
    jr   nc, .jr_70A6                             ; $7084: $30 $20

    call GetEntityDropTimer                       ; $7086: $CD $FB $0B
    jr   nz, .jr_70A6                             ; $7089: $20 $1B

    ld   a, [wTransitionSequenceCounter]          ; $708B: $FA $6B $C1
    cp   $04                                      ; $708E: $FE $04
    jr   nz, .jr_70A6                             ; $7090: $20 $14

    ld   a, GAMEPLAY_CUTSCENE                     ; $7092: $3E $08
    ld   [wGameplayType], a                       ; $7094: $EA $95 $DB
    xor  a                                        ; $7097: $AF
    ld   [wTransitionSequenceCounter], a          ; $7098: $EA $6B $C1
    ld   [wC16C], a                               ; $709B: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $709E: $EA $96 $DB
    call GetEntityDropTimer                       ; $70A1: $CD $FB $0B
    ld   [hl], $08                                ; $70A4: $36 $08

.jr_70A6
    jp   CopyEntityPositionToActivePosition       ; $70A6: $C3 $8A $3D

label_019_70A9:
    push bc                                       ; $70A9: $C5
    sla  c                                        ; $70AA: $CB $21
    sla  c                                        ; $70AC: $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ; $70AE: $21 $80 $D5
    add  hl, bc                                   ; $70B1: $09
    inc  hl                                       ; $70B2: $23
    inc  hl                                       ; $70B3: $23
    inc  hl                                       ; $70B4: $23
    ld   a, $09                                   ; $70B5: $3E $09
    ld   [hl], a                                  ; $70B7: $77
    pop  bc                                       ; $70B8: $C1
    call GetEntityTransitionCountdown             ; $70B9: $CD $05 $0C
    jr   z, .jr_70C2                              ; $70BC: $28 $04

    ld   a, $00                                   ; $70BE: $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ; $70C0: $E0 $F1

.jr_70C2
    call func_019_717C                            ; $70C2: $CD $7C $71
    call PushLinkOutOfEntity_19                   ; $70C5: $CD $A2 $7C
    ld   hl, wEntitiesDirectionTable              ; $70C8: $21 $80 $C3
    add  hl, bc                                   ; $70CB: $09
    ldh  a, [hFrameCounter]                       ; $70CC: $F0 $E7
    rra                                           ; $70CE: $1F
    rra                                           ; $70CF: $1F
    rra                                           ; $70D0: $1F
    and  $01                                      ; $70D1: $E6 $01
    inc  a                                        ; $70D3: $3C
    add  [hl]                                     ; $70D4: $86
    call SetEntitySpriteVariant                   ; $70D5: $CD $0C $3B
    call EntityLinkPositionYDifference_19         ; $70D8: $CD $1B $7E
    add  $13                                      ; $70DB: $C6 $13
    cp   $26                                      ; $70DD: $FE $26
    jr   nc, .jr_70F2                             ; $70DF: $30 $11

    call EntityLinkPositionXDifference_19         ; $70E1: $CD $0B $7E
    add  $13                                      ; $70E4: $C6 $13
    cp   $26                                      ; $70E6: $FE $26
    jr   nc, .jr_70F2                             ; $70E8: $30 $08

    ld   a, e                                     ; $70EA: $7B
    sla  a                                        ; $70EB: $CB $27
    ld   hl, wEntitiesDirectionTable              ; $70ED: $21 $80 $C3
    add  hl, bc                                   ; $70F0: $09
    ld   [hl], a                                  ; $70F1: $77

.jr_70F2
    call func_019_7CF0                            ; $70F2: $CD $F0 $7C
    ret  nc                                       ; $70F5: $D0

    ld   hl, wEntitiesInertiaTable                ; $70F6: $21 $D0 $C3
    add  hl, bc                                   ; $70F9: $09
    ld   a, [hl]                                  ; $70FA: $7E
    inc  [hl]                                     ; $70FB: $34
    and  $01                                      ; $70FC: $E6 $01
    jr   z, .jr_7112                              ; $70FE: $28 $12

    ld_dialog_low e, Dialog0AF                    ; $7100: $1E $AF
    call GetRandomByte                            ; $7102: $CD $0D $28
    and  $3F                                      ; $7105: $E6 $3F
    jr   z, jr_019_7114                           ; $7107: $28 $0B

    ld_dialog_low e, Dialog0FB                    ; $7109: $1E $FB
    call GetRandomByte                            ; $710B: $CD $0D $28
    and  $07                                      ; $710E: $E6 $07
    jr   z, jr_019_7114                           ; $7110: $28 $02

.jr_7112
    ld_dialog_low e, Dialog0FA                    ; $7112: $1E $FA

jr_019_7114:
    ld   a, e                                     ; $7114: $7B
    jp   OpenDialogInTable0                       ; $7115: $C3 $85 $23

Data_019_7118::
    db   $F4, $00, $64, $03, $F4, $08, $66, $03, $04, $00, $68, $03, $04, $08, $6A, $03
    db   $FF, $FF, $FF, $FF, $04, $F8, $70, $03, $F4, $00, $6C, $03, $F4, $08, $6E, $03
    db   $04, $00, $72, $03, $04, $08, $74, $03, $04, $F8, $7A, $03, $F4, $00, $6C, $03
    db   $F4, $08, $6E, $03, $04, $00, $7C, $03, $04, $08, $74, $03, $04, $10, $70, $23
    db   $F4, $00, $6E, $23, $F4, $08, $6C, $23, $04, $00, $74, $23, $04, $08, $72, $23
    db   $04, $10, $7A, $23, $F4, $00, $6E, $23, $F4, $08, $6C, $23, $04, $00, $74, $23
    db   $04, $08, $7C, $23

func_019_717C::
    ldh  a, [hActiveEntitySpriteVariant]          ; $717C: $F0 $F1
    rla                                           ; $717E: $17
    rla                                           ; $717F: $17
    and  $FC                                      ; $7180: $E6 $FC
    ld   e, a                                     ; $7182: $5F
    rla                                           ; $7183: $17
    rla                                           ; $7184: $17
    and  $F0                                      ; $7185: $E6 $F0
    add  e                                        ; $7187: $83
    ld   e, a                                     ; $7188: $5F
    ld   d, b                                     ; $7189: $50
    ld   hl, Data_019_7118                        ; $718A: $21 $18 $71
    add  hl, de                                   ; $718D: $19
    ld   c, $05                                   ; $718E: $0E $05
    jp   RenderActiveEntitySpritesRect            ; $7190: $C3 $E6 $3C
