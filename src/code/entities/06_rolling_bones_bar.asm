; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
RollingBonesSpriteVariants::
.variant0
    db $6C, OAM_GBC_PAL_7 | OAMF_PAL0
    db $6C, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $6C, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_YFLIP
    db $6C, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

Data_006_6EDD::
    db   $70, $60, $50, $40, $30, $20

RollingBonesBarEntityHandler::
    ldh  a, [hMapId]                              ; $6EE3: $F0 $F7
    cp   MAP_TURTLE_ROCK                          ; $6EE5: $FE $07
    jr   nz, .jr_6EED                             ; $6EE7: $20 $04

    ld   a, $10                                   ; $6EE9: $3E $10
    ldh  [hActiveEntityTilesOffset], a            ; $6EEB: $E0 $F5

.jr_6EED
    ldh  a, [hRoomStatus]                         ; $6EED: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $6EEF: $E6 $20
    jp   nz, ClearEntityStatus_06                 ; $6EF1: $C2 $DB $65

    ld   a, c                                     ; $6EF4: $79
    ld   [wD201], a                               ; $6EF5: $EA $01 $D2
    call func_006_6FEA                            ; $6EF8: $CD $EA $6F
    call ReturnIfNonInteractive_06                ; $6EFB: $CD $C6 $64
    ld   a, [wD202]                               ; $6EFE: $FA $02 $D2
    ld   e, a                                     ; $6F01: $5F
    ld   d, b                                     ; $6F02: $50

.jr_6F03
    ld   hl, wEntitiesStatusTable                 ; $6F03: $21 $80 $C2
    add  hl, de                                   ; $6F06: $19
    ld   a, [hl]                                  ; $6F07: $7E
    cp   $01                                      ; $6F08: $FE $01
    ret  z                                        ; $6F0A: $C8

    and  a                                        ; $6F0B: $A7
    jr   nz, jr_006_6F48                          ; $6F0C: $20 $3A

    call GetEntityTransitionCountdown             ; $6F0E: $CD $05 $0C
    jr   nz, ret_006_6F47                         ; $6F11: $20 $34

    ld   [hl], $03                                ; $6F13: $36 $03
    ld   hl, wEntitiesPrivateState1Table          ; $6F15: $21 $B0 $C2
    add  hl, bc                                   ; $6F18: $09
    ldh  a, [hActiveEntityPosX]                   ; $6F19: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $6F1B: $E0 $D7
    ld   e, [hl]                                  ; $6F1D: $5E
    inc  [hl]                                     ; $6F1E: $34
    ld   a, [hl]                                  ; $6F1F: $7E
    cp   $06                                      ; $6F20: $FE $06
    jr   nz, .jr_6F3C                             ; $6F22: $20 $18

    call ClearEntityStatus_06                     ; $6F24: $CD $DB $65
    ld   hl, wEntitiesLoadOrderTable              ; $6F27: $21 $60 $C4
    add  hl, bc                                   ; $6F2A: $09
    ld   e, [hl]                                  ; $6F2B: $5E
    ld   d, b                                     ; $6F2C: $50
    ld   hl, data_3F48                            ; $6F2D: $21 $48 $3F
    add  hl, de                                   ; $6F30: $19
    ldh  a, [hMapRoom]                            ; $6F31: $F0 $F6
    ld   e, a                                     ; $6F33: $5F
    ld   d, b                                     ; $6F34: $50
    ld   a, [hl]                                  ; $6F35: $7E
    ld   hl, wEntitiesClearedRooms                ; $6F36: $21 $00 $CF
    add  hl, de                                   ; $6F39: $19
    or   [hl]                                     ; $6F3A: $B6
    ld   [hl], a                                  ; $6F3B: $77

.jr_6F3C
    ld   d, b                                     ; $6F3C: $50
    ld   hl, Data_006_6EDD                        ; $6F3D: $21 $DD $6E
    add  hl, de                                   ; $6F40: $19
    ld   a, [hl]                                  ; $6F41: $7E
    ldh  [hMultiPurpose1], a                      ; $6F42: $E0 $D8
    jp   label_006_7035                           ; $6F44: $C3 $35 $70

ret_006_6F47:
    ret                                           ; $6F47: $C9

jr_006_6F48:
    call DecrementEntityIgnoreHitsCountdown       ; $6F48: $CD $56 $0C
    ldh  a, [hLinkPositionZ]                      ; $6F4B: $F0 $A2
    and  a                                        ; $6F4D: $A7
    jr   nz, .jr_6F53                             ; $6F4E: $20 $03

    call label_3B39                               ; $6F50: $CD $39 $3B

.jr_6F53
    call AddEntitySpeedToPos_06                   ; $6F53: $CD $4E $65
    call label_3B23                               ; $6F56: $CD $23 $3B
    ld   hl, wEntitiesSpeedXTable                 ; $6F59: $21 $40 $C2
    add  hl, bc                                   ; $6F5C: $09
    ld   a, [hl]                                  ; $6F5D: $7E
    and  a                                        ; $6F5E: $A7
    jr   z, jr_006_6F86                           ; $6F5F: $28 $25

    bit  7, a                                     ; $6F61: $CB $7F
    jr   z, .jr_6F67                              ; $6F63: $28 $02

    cpl                                           ; $6F65: $2F
    inc  a                                        ; $6F66: $3C

.jr_6F67
    ld   e, $04                                   ; $6F67: $1E $04
    cp   $08                                      ; $6F69: $FE $08
    jr   nc, .jr_6F6F                             ; $6F6B: $30 $02

    ld   e, $08                                   ; $6F6D: $1E $08

.jr_6F6F
    cp   $04                                      ; $6F6F: $FE $04
    jr   nc, .jr_6F75                             ; $6F71: $30 $02

    ld   e, $10                                   ; $6F73: $1E $10

.jr_6F75
    cp   $02                                      ; $6F75: $FE $02
    jr   nc, .jr_6F7B                             ; $6F77: $30 $02

    ld   e, $20                                   ; $6F79: $1E $20

.jr_6F7B
    ld   d, b                                     ; $6F7B: $50
    ldh  a, [hFrameCounter]                       ; $6F7C: $F0 $E7
    and  e                                        ; $6F7E: $A3
    jr   z, .jr_6F82                              ; $6F7F: $28 $01

    inc  d                                        ; $6F81: $14

.jr_6F82
    ld   a, d                                     ; $6F82: $7A
    call SetEntitySpriteVariant                   ; $6F83: $CD $0C $3B

jr_006_6F86:
    ldh  a, [hActiveEntityState]                  ; $6F86: $F0 $F0
    JP_TABLE                                      ; $6F88
._00 dw RollingBonesBarRestingHandler
._01 dw RollingBonesBarRollingHandler
._02 dw RollingBonesBarDeceleratingHandler

RollingBonesBarRestingHandler::
    ret

RollingBonesBarRollingHandler::
    ld   hl, wEntitiesCollisionsTable             ; $6F90: $21 $A0 $C2
    add  hl, bc                                   ; $6F93: $09
    ld   a, [hl]                                  ; $6F94: $7E
    and  $03                                      ; $6F95: $E6 $03
    jr   z, .jr_6FB3                              ; $6F97: $28 $1A

    ld   hl, wEntitiesSpeedXTable                 ; $6F99: $21 $40 $C2
    add  hl, bc                                   ; $6F9C: $09
    ld   a, [hl]                                  ; $6F9D: $7E
    sra  a                                        ; $6F9E: $CB $2F
    cpl                                           ; $6FA0: $2F
    inc  a                                        ; $6FA1: $3C
    ld   [hl], a                                  ; $6FA2: $77
    ld   a, $20                                   ; $6FA3: $3E $20
    ld   [wC157], a                               ; $6FA5: $EA $57 $C1
    xor  a                                        ; $6FA8: $AF
    ld   [wC158], a                               ; $6FA9: $EA $58 $C1
    ld   a, JINGLE_STRONG_BUMP                    ; $6FAC: $3E $0B
    ldh  [hJingle], a                             ; $6FAE: $E0 $F2
    call IncrementEntityState                     ; $6FB0: $CD $12 $3B

.jr_6FB3
    ld   a, [wD210]                               ; $6FB3: $FA $10 $D2
    inc  a                                        ; $6FB6: $3C
    cp   $09                                      ; $6FB7: $FE $09
    jr   c, .jr_6FC0                              ; $6FB9: $38 $05

    ld   a, WAVE_SFX_ROLLING_SPIKE_BAR            ; $6FBB: $3E $1A
    ldh  [hWaveSfx], a                            ; $6FBD: $E0 $F3
    xor  a                                        ; $6FBF: $AF

.jr_6FC0
    ld   [wD210], a                               ; $6FC0: $EA $10 $D2
    ret                                           ; $6FC3: $C9

RollingBonesBarDeceleratingHandler::
    ldh  a, [hFrameCounter]                       ; $6FC4: $F0 $E7
    and  $07                                      ; $6FC6: $E6 $07
    jr   nz, ret_006_6FD9                         ; $6FC8: $20 $0F

    ld   hl, wEntitiesSpeedXTable                 ; $6FCA: $21 $40 $C2

.jr_6FCD
    add  hl, bc                                   ; $6FCD: $09
    ld   a, [hl]                                  ; $6FCE: $7E
    and  a                                        ; $6FCF: $A7
    jr   z, jr_006_6FDA                           ; $6FD0: $28 $08

    and  $80                                      ; $6FD2: $E6 $80
    jr   z, .jr_6FD8                              ; $6FD4: $28 $02

    inc  [hl]                                     ; $6FD6: $34
    inc  [hl]                                     ; $6FD7: $34

.jr_6FD8
    dec  [hl]                                     ; $6FD8: $35

ret_006_6FD9:
    ret                                           ; $6FD9: $C9

jr_006_6FDA:
    call IncrementEntityState                     ; $6FDA: $CD $12 $3B
    ld   [hl], b                                  ; $6FDD: $70
    call GetEntityTransitionCountdown             ; $6FDE: $CD $05 $0C
    ld   [hl], $50                                ; $6FE1: $36 $50
    ret                                           ; $6FE3: $C9

Data_006_6FE4::
    db    $80, $70, $60, $50, $40, $30

func_006_6FEA::
    ld   a, $20
    ldh  [hActiveEntityVisualPosY], a

.loop
    ld   de, RollingBonesSpriteVariants           ; $6FEE: $11 $D5 $6E
    call RenderActiveEntitySpritesPair            ; $6FF1: $CD $C0 $3B
    ldh  a, [hActiveEntityVisualPosY]             ; $6FF4: $F0 $EC
    add  $10                                      ; $6FF6: $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $6FF8: $E0 $EC
    ld   hl, wEntitiesPrivateState1Table          ; $6FFA: $21 $B0 $C2
    add  hl, bc                                   ; $6FFD: $09
    ld   e, [hl]                                  ; $6FFE: $5E
    ld   d, b                                     ; $6FFF: $50
    ld   hl, Data_006_6FE4                        ; $7000: $21 $E4 $6F
    add  hl, de                                   ; $7003: $19
    cp   [hl]                                     ; $7004: $BE
    jr   nz, .loop                                ; $7005: $20 $E7

    jp   CopyEntityPositionToActivePosition       ; $7007: $C3 $8A $3D
