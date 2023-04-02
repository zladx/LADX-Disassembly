RollingBonesEntityHandler::
    ld   a, c                                     ; $6C6D: $79
    ld   [wD202], a                               ; $6C6E: $EA $02 $D2
    ldh  a, [hMapId]                              ; $6C71: $F0 $F7
    cp   MAP_TURTLE_ROCK                          ; $6C73: $FE $07
    jr   nz, .jr_6C7B                             ; $6C75: $20 $04

    ld   a, $10                                   ; $6C77: $3E $10
    ldh  [hActiveEntityTilesOffset], a            ; $6C79: $E0 $F5

.jr_6C7B
    call func_006_6E7E                            ; $6C7B: $CD $7E $6E
    call BossIntro                                ; $6C7E: $CD $E8 $3E
    call label_394D                               ; $6C81: $CD $4D $39
    ldh  a, [hActiveEntityStatus]                 ; $6C84: $F0 $EA
    cp   $05                                      ; $6C86: $FE $05
    jr   z, jr_006_6CE8                           ; $6C88: $28 $5E

    ld   hl, wEntitiesOptions1Table               ; $6C8A: $21 $30 $C4
    add  hl, bc                                   ; $6C8D: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS                ; $6C8E: $36 $80
    ld   hl, wEntitiesPrivateState1Table          ; $6C90: $21 $B0 $C2
    add  hl, bc                                   ; $6C93: $09
    ld   a, [hl]                                  ; $6C94: $7E
    JP_TABLE                                      ; $6C95
._00 dw func_006_6C9A                             ; $6C96
._01 dw func_006_6CAB                             ; $6C98

func_006_6C9A::
    call GetEntityTransitionCountdown             ; $6C9A: $CD $05 $0C
    ld   [hl], $FF                                ; $6C9D: $36 $FF
    ld   hl, wEntitiesFlashCountdownTable         ; $6C9F: $21 $20 $C4
    add  hl, bc                                   ; $6CA2: $09
    ld   [hl], $FF                                ; $6CA3: $36 $FF
    ld   hl, wEntitiesPrivateState1Table          ; $6CA5: $21 $B0 $C2
    add  hl, bc                                   ; $6CA8: $09
    inc  [hl]                                     ; $6CA9: $34
    ret                                           ; $6CAA: $C9

func_006_6CAB::
    call GetEntityTransitionCountdown             ; $6CAB: $CD $05 $0C
    jp   z, label_006_6CBE                        ; $6CAE: $CA $BE $6C

    ld   hl, wEntitiesFlashCountdownTable         ; $6CB1: $21 $20 $C4
    add  hl, bc                                   ; $6CB4: $09
    ld   [hl], a                                  ; $6CB5: $77
    cp   $80                                      ; $6CB6: $FE $80
    jr   nc, .ret_6CBD                            ; $6CB8: $30 $03

    call func_006_700A                            ; $6CBA: $CD $0A $70

.ret_6CBD
    ret                                           ; $6CBD: $C9

label_006_6CBE:
    call label_27DD                               ; $6CBE: $CD $DD $27
    call DidKillEnemy                             ; $6CC1: $CD $50 $3F
    ldh  a, [hMapId]                              ; $6CC4: $F0 $F7
    cp   MAP_TURTLE_ROCK                          ; $6CC6: $FE $07
    ret  z                                        ; $6CC8: $C8

label_006_6CC9:
    ld   hl, wIndoorARoomStatus                   ; $6CC9: $21 $00 $D9
    ldh  a, [hMapRoom]                            ; $6CCC: $F0 $F6
    ld   e, a                                     ; $6CCE: $5F
    ld   d, b                                     ; $6CCF: $50
    ldh  a, [hMapId]                              ; $6CD0: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $6CD2: $FE $FF
    jr   nz, .jr_6CDB                             ; $6CD4: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $6CD6: $21 $E0 $DD
    jr   jr_006_6CE4                              ; $6CD9: $18 $09

.jr_6CDB
    cp   $1A                                      ; $6CDB: $FE $1A
    jr   nc, jr_006_6CE4                          ; $6CDD: $30 $05

    cp   $06                                      ; $6CDF: $FE $06
    jr   c, jr_006_6CE4                           ; $6CE1: $38 $01

    inc  d                                        ; $6CE3: $14

jr_006_6CE4:
    add  hl, de                                   ; $6CE4: $19
    set  5, [hl]                                  ; $6CE5: $CB $EE
    ret                                           ; $6CE7: $C9

jr_006_6CE8:
    call ReturnIfNonInteractive_06                ; $6CE8: $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ; $6CEB: $CD $F7 $64
    call label_3B39                               ; $6CEE: $CD $39 $3B
    ld   hl, wEntitiesHealthTable                 ; $6CF1: $21 $60 $C3
    add  hl, bc                                   ; $6CF4: $09
    ld   a, [hl]                                  ; $6CF5: $7E
    ldh  [hIndexOfObjectBelowLink], a             ; $6CF6: $E0 $E9
    ld   hl, wEntitiesSpeedXTable                 ; $6CF8: $21 $40 $C2
    add  hl, bc                                   ; $6CFB: $09
    ld   a, [hl]                                  ; $6CFC: $7E
    and  a                                        ; $6CFD: $A7
    jr   z, jr_006_6D0D                           ; $6CFE: $28 $0D

    ld   e, $00                                   ; $6D00: $1E $00
    and  $80                                      ; $6D02: $E6 $80
    jr   nz, .jr_6D08                             ; $6D04: $20 $02

    ld   e, $03                                   ; $6D06: $1E $03

.jr_6D08
    ld   hl, wEntitiesDirectionTable              ; $6D08: $21 $80 $C3
    add  hl, bc                                   ; $6D0B: $09
    ld   [hl], e                                  ; $6D0C: $73

jr_006_6D0D:
    call AddEntityZSpeedToPos_06                  ; $6D0D: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $6D10: $21 $20 $C3
    add  hl, bc                                   ; $6D13: $09
    dec  [hl]                                     ; $6D14: $35
    dec  [hl]                                     ; $6D15: $35
    nop                                           ; $6D16: $00
    nop                                           ; $6D17: $00
    ld   hl, wEntitiesPosZTable                   ; $6D18: $21 $10 $C3
    add  hl, bc                                   ; $6D1B: $09
    ld   a, [hl]                                  ; $6D1C: $7E
    and  $80                                      ; $6D1D: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $6D1F: $E0 $E8
    jr   z, .jr_6D32                              ; $6D21: $28 $0F

    ld   [hl], b                                  ; $6D23: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6D24: $21 $20 $C3
    add  hl, bc                                   ; $6D27: $09
    ld   a, [hl]                                  ; $6D28: $7E
    ld   [hl], b                                  ; $6D29: $70
    cp   $F2                                      ; $6D2A: $FE $F2
    jr   nc, .jr_6D32                             ; $6D2C: $30 $04

    ld   a, JINGLE_BOUNCE                         ; $6D2E: $3E $20
    ldh  [hJingle], a                             ; $6D30: $E0 $F2

.jr_6D32
    ldh  a, [hActiveEntityState]                  ; $6D32: $F0 $F0
    JP_TABLE                                      ; $6D34
._00 dw RollingBonesState0Handler
._01 dw RollingBonesState1Handler
._02 dw RollingBonesState2Handler
._03 dw RollingBonesState3Handler

RollingBonesState0Handler::
    call GetEntityTransitionCountdown             ; $6D3D: $CD $05 $0C
    ret  nz                                       ; $6D40: $C0

    ld   a, [wD201]                               ; $6D41: $FA $01 $D2
    ld   e, a                                     ; $6D44: $5F
    ld   d, b                                     ; $6D45: $50
    ld   hl, wEntitiesPosXTable                   ; $6D46: $21 $00 $C2
    add  hl, de                                   ; $6D49: $19
    ldh  a, [hActiveEntityPosX]                   ; $6D4A: $F0 $EE
    sub  [hl]                                     ; $6D4C: $96
    ld   e, $08                                   ; $6D4D: $1E $08
    bit  7, a                                     ; $6D4F: $CB $7F
    jr   nz, .jr_6D55                             ; $6D51: $20 $02

    ld   e, $F8                                   ; $6D53: $1E $F8

.jr_6D55
    ld   hl, wEntitiesSpeedXTable                 ; $6D55: $21 $40 $C2
    add  hl, bc                                   ; $6D58: $09
    ld   [hl], e                                  ; $6D59: $73
    add  $10                                      ; $6D5A: $C6 $10
    cp   $20                                      ; $6D5C: $FE $20
    jr   nc, .jr_6D68                             ; $6D5E: $30 $08

    call GetEntityTransitionCountdown             ; $6D60: $CD $05 $0C
    ld   [hl], $18                                ; $6D63: $36 $18
    jp   IncrementEntityState                     ; $6D65: $C3 $12 $3B

.jr_6D68
    call AddEntitySpeedToPos_06                   ; $6D68: $CD $4E $65
    ldh  a, [hMultiPurposeG]                      ; $6D6B: $F0 $E8
    and  a                                        ; $6D6D: $A7
    jr   z, .jr_6D76                              ; $6D6E: $28 $06

    ld   hl, wEntitiesSpeedZTable                 ; $6D70: $21 $20 $C3
    add  hl, bc                                   ; $6D73: $09
    ld   [hl], $0C                                ; $6D74: $36 $0C

.jr_6D76
    ld   a, $01                                   ; $6D76: $3E $01
    jp   SetEntitySpriteVariant                   ; $6D78: $C3 $0C $3B

RollingBonesState1Handler::
    call GetEntityTransitionCountdown             ; $6D7B: $CD $05 $0C
    ret  nz                                       ; $6D7E: $C0

    ld   hl, wEntitiesDirectionTable              ; $6D7F: $21 $80 $C3
    add  hl, bc                                   ; $6D82: $09
    ld   a, [hl]                                  ; $6D83: $7E
    and  a                                        ; $6D84: $A7
    ld   a, $10                                   ; $6D85: $3E $10
    jr   nz, .jr_6D8B                             ; $6D87: $20 $02

    ld   a, $F0                                   ; $6D89: $3E $F0

.jr_6D8B
    push af                                       ; $6D8B: $F5
    ld   a, [wD201]                               ; $6D8C: $FA $01 $D2
    ld   e, a                                     ; $6D8F: $5F
    ld   d, b                                     ; $6D90: $50
    ld   hl, wEntitiesSpeedXTable                 ; $6D91: $21 $40 $C2
    add  hl, de                                   ; $6D94: $19
    pop  af                                       ; $6D95: $F1
    ld   [hl], a                                  ; $6D96: $77
    ld   hl, wEntitiesStateTable                  ; $6D97: $21 $90 $C2
    add  hl, de                                   ; $6D9A: $19
    ld   [hl], $01                                ; $6D9B: $36 $01
    call GetEntityTransitionCountdown             ; $6D9D: $CD $05 $0C
    ld   [hl], $20                                ; $6DA0: $36 $20
    call IncrementEntityState                     ; $6DA2: $CD $12 $3B
    xor  a                                        ; $6DA5: $AF
    jp   SetEntitySpriteVariant                   ; $6DA6: $C3 $0C $3B

RollingBonesState2Handler::
    call GetEntityTransitionCountdown             ; $6DA9: $CD $05 $0C
    ret  nz                                       ; $6DAC: $C0

    jp   IncrementEntityState                     ; $6DAD: $C3 $12 $3B

RollingBonesState3Handler::
    ld   hl, wEntitiesPosZTable                   ; $6DB0: $21 $10 $C3
    add  hl, bc                                   ; $6DB3: $09
    ld   a, [hl]                                  ; $6DB4: $7E
    cp   $08                                      ; $6DB5: $FE $08
    ld   a, $01                                   ; $6DB7: $3E $01
    jr   c, .jr_6DBC                              ; $6DB9: $38 $01

    inc  a                                        ; $6DBB: $3C

.jr_6DBC
    call SetEntitySpriteVariant                   ; $6DBC: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $6DBF: $CD $05 $0C
    cp   $01                                      ; $6DC2: $FE $01
    jr   z, .jr_6DD4                              ; $6DC4: $28 $0E

    cp   $00                                      ; $6DC6: $FE $00
    ret  nz                                       ; $6DC8: $C0

    ldh  a, [hMultiPurposeG]                      ; $6DC9: $F0 $E8
    and  a                                        ; $6DCB: $A7
    jr   z, jr_006_6E04                           ; $6DCC: $28 $36

    call GetEntityTransitionCountdown             ; $6DCE: $CD $05 $0C
    ld   [hl], $10                                ; $6DD1: $36 $10
    ret                                           ; $6DD3: $C9

.jr_6DD4
    ld   e, $10                                   ; $6DD4: $1E $10
    ld   hl, wEntitiesSpeedZTable                 ; $6DD6: $21 $20 $C3
    add  hl, bc                                   ; $6DD9: $09
    ld   [hl], $19                                ; $6DDA: $36 $19
    ldh  a, [hIndexOfObjectBelowLink]             ; $6DDC: $F0 $E9
    cp   $05                                      ; $6DDE: $FE $05
    jr   nc, .jr_6DE6                             ; $6DE0: $30 $04

    ld   e, $14                                   ; $6DE2: $1E $14
    ld   [hl], $16                                ; $6DE4: $36 $16

.jr_6DE6
    ld   hl, wEntitiesDirectionTable              ; $6DE6: $21 $80 $C3
    add  hl, bc                                   ; $6DE9: $09
    ld   a, [hl]                                  ; $6DEA: $7E
    and  a                                        ; $6DEB: $A7
    ld   a, e                                     ; $6DEC: $7B
    jr   nz, .jr_6DF1                             ; $6DED: $20 $02

    cpl                                           ; $6DEF: $2F
    inc  a                                        ; $6DF0: $3C

.jr_6DF1
    ld   hl, wEntitiesSpeedXTable                 ; $6DF1: $21 $40 $C2
    add  hl, bc                                   ; $6DF4: $09
    ld   [hl], a                                  ; $6DF5: $77
    ldh  a, [hActiveEntityVisualPosY]             ; $6DF6: $F0 $EC
    cp   $50                                      ; $6DF8: $FE $50
    ld   a, e                                     ; $6DFA: $7B
    jr   c, .jr_6DFF                              ; $6DFB: $38 $02

    cpl                                           ; $6DFD: $2F
    inc  a                                        ; $6DFE: $3C

.jr_6DFF
    ld   hl, wEntitiesSpeedYTable                 ; $6DFF: $21 $50 $C2
    add  hl, bc                                   ; $6E02: $09
    ld   [hl], a                                  ; $6E03: $77

jr_006_6E04:
    call UpdateEntityPosWithSpeed_06              ; $6E04: $CD $41 $65
    call label_3B23                               ; $6E07: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6E0A: $21 $A0 $C2
    add  hl, bc                                   ; $6E0D: $09
    ld   a, [hl]                                  ; $6E0E: $7E
    and  $03                                      ; $6E0F: $E6 $03
    ret  z                                        ; $6E11: $C8

    call IncrementEntityState                     ; $6E12: $CD $12 $3B
    ld   [hl], b                                  ; $6E15: $70
    call GetEntityTransitionCountdown             ; $6E16: $CD $05 $0C
    ld   [hl], $08                                ; $6E19: $36 $08
    jp   ClearEntitySpeed                         ; $6E1B: $C3 $7F $3D

Data_006_6E1E::
    db   $00, $F8, $60, $06, $00, $00, $62, $06, $00, $08, $64, $06, $F0, $00, $6E, $26
    db   $00, $F8, $66, $06, $00, $00, $68, $06, $00, $08, $6A, $06, $F0, $00, $6E, $06
    db   $00, $F8, $66, $06, $00, $00, $68, $06, $00, $08, $6A, $06, $F0, $06, $6E, $26
    db   $00, $00, $64, $26, $00, $08, $62, $26, $00, $10, $60, $26, $F0, $08, $6E, $06
    db   $00, $00, $6A, $26, $00, $08, $68, $26, $00, $10, $66, $26, $F0, $08, $6E, $26
    db   $00, $00, $6A, $26, $00, $08, $68, $26, $00, $10, $66, $26, $F0, $02, $6E, $06

func_006_6E7E::
    ld   hl, wEntitiesDirectionTable
    add  hl, bc
    ldh  a, [hActiveEntitySpriteVariant]
    add  [hl]                                     ; $6E84: $86
    rla                                           ; $6E85: $17
    rla                                           ; $6E86: $17
    rla                                           ; $6E87: $17
    rla                                           ; $6E88: $17
    and  $F0                                      ; $6E89: $E6 $F0
    ld   e, a                                     ; $6E8B: $5F
    ld   d, b                                     ; $6E8C: $50
    ld   hl, Data_006_6E1E                        ; $6E8D: $21 $1E $6E
    add  hl, de                                   ; $6E90: $19
    ld   c, $04                                   ; $6E91: $0E $04
    call RenderActiveEntitySpritesRect            ; $6E93: $CD $E6 $3C
    ld   a, $04                                   ; $6E96: $3E $04
    call func_015_7964_trampoline                 ; $6E98: $CD $A0 $3D
    ld   hl, wEntitiesPosZTable                   ; $6E9B: $21 $10 $C3
    add  hl, bc                                   ; $6E9E: $09
    ld   a, [hl]                                  ; $6E9F: $7E
    and  a                                        ; $6EA0: $A7
    ret  z                                        ; $6EA1: $C8

    ldh  a, [hFrameCounter]                       ; $6EA2: $F0 $E7
    and  $01                                      ; $6EA4: $E6 $01
    ret  nz                                       ; $6EA6: $C0

    ld   a, [wOAMNextAvailableSlot]               ; $6EA7: $FA $C0 $C3
    ld   e, a                                     ; $6EAA: $5F
    ld   d, b                                     ; $6EAB: $50
    ld   hl, wDynamicOAMBuffer                    ; $6EAC: $21 $30 $C0
    add  hl, de                                   ; $6EAF: $19
    ldh  a, [hActiveEntityPosY]                   ; $6EB0: $F0 $EF
    add  $0C                                      ; $6EB2: $C6 $0C
    ld   [hl+], a                                 ; $6EB4: $22
    ldh  a, [hActiveEntityPosX]                   ; $6EB5: $F0 $EE
    add  $02                                      ; $6EB7: $C6 $02
    ld   [hl+], a                                 ; $6EB9: $22
    ld   a, $26                                   ; $6EBA: $3E $26
    ld   [hl+], a                                 ; $6EBC: $22
    ld   a, $00                                   ; $6EBD: $3E $00
    ld   [hl+], a                                 ; $6EBF: $22
    ldh  a, [hActiveEntityPosY]                   ; $6EC0: $F0 $EF
    add  $0C                                      ; $6EC2: $C6 $0C
    ld   [hl+], a                                 ; $6EC4: $22
    ldh  a, [hActiveEntityPosX]                   ; $6EC5: $F0 $EE
    add  $04                                      ; $6EC7: $C6 $04
    ld   [hl+], a                                 ; $6EC9: $22
    ld   a, $26                                   ; $6ECA: $3E $26
    ld   [hl+], a                                 ; $6ECC: $22
    ld   a, $00                                   ; $6ECD: $3E $00
    ld   [hl+], a                                 ; $6ECF: $22
    ld   a, $02                                   ; $6ED0: $3E $02
    jp   func_015_7964_trampoline                 ; $6ED2: $C3 $A0 $3D
