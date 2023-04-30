; Tarin picking up the honeycomb
; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TarinBeekeeperSpriteVariants::
.variant0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $5E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $5C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant3
    db $5C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_2 | OAMF_PAL0
.variant4
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0
.variant5
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
.variant7
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant8
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0

TarinBeekeeperEntityHandler::
    ld   a, c                                     ; $4EB1: $79
    ld   [wD204], a                               ; $4EB2: $EA $04 $D2
    ld   hl, wEntitiesPrivateState5Table          ; $4EB5: $21 $90 $C3
    add  hl, bc                                   ; $4EB8: $09
    ld   a, [hl]                                  ; $4EB9: $7E
    and  a                                        ; $4EBA: $A7
    jr   nz, .jr_4EC5                             ; $4EBB: $20 $08

    inc  [hl]                                     ; $4EBD: $34
    ldh  a, [hRoomStatus]                         ; $4EBE: $F0 $F8
    and  ROOM_STATUS_EVENT_3                      ; $4EC0: $E6 $40
    jp   nz, ClearEntityStatus_07                 ; $4EC2: $C2 $A4 $7E

.jr_4EC5
    ld   a, [wHasInstrument3]                     ; $4EC5: $FA $67 $DB
    and  $02                                      ; $4EC8: $E6 $02
    jp   z, ClearEntityStatus_07                  ; $4ECA: $CA $A4 $7E

    ld   de, TarinBeekeeperSpriteVariants         ; $4ECD: $11 $8D $4E
    call RenderActiveEntitySpritesPair            ; $4ED0: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $4ED3: $CD $96 $7D
    call AddEntityZSpeedToPos_07                  ; $4ED6: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $4ED9: $21 $20 $C3
    add  hl, bc                                   ; $4EDC: $09
    dec  [hl]                                     ; $4EDD: $35
    dec  [hl]                                     ; $4EDE: $35
    ld   hl, wEntitiesPosZTable                   ; $4EDF: $21 $10 $C3
    add  hl, bc                                   ; $4EE2: $09
    ld   a, [hl]                                  ; $4EE3: $7E
    and  $80                                      ; $4EE4: $E6 $80
    jr   z, .jr_4EEE                              ; $4EE6: $28 $06

    ld   [hl], b                                  ; $4EE8: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4EE9: $21 $20 $C3
    add  hl, bc                                   ; $4EEC: $09
    ld   [hl], b                                  ; $4EED: $70

.jr_4EEE
    ldh  a, [hActiveEntityState]                  ; $4EEE: $F0 $F0
    JP_TABLE                                      ; $4EF0
._00 dw func_007_4EFF                             ; $4EF1
._01 dw func_007_4F1F                             ; $4EF3
._02 dw func_007_4F56                             ; $4EF5
._03 dw func_007_4FC6                             ; $4EF7
._04 dw func_007_504E                             ; $4EF9
._05 dw func_007_50B4                             ; $4EFB
._06 dw func_007_50E3                             ; $4EFD

func_007_4EFF::
    ld   a, $02                                   ; $4EFF: $3E $02
    call SetEntitySpriteVariant                   ; $4F01: $CD $0C $3B
    ld   hl, wEntitiesPosXTable                   ; $4F04: $21 $00 $C2
    add  hl, bc                                   ; $4F07: $09
    ld   [hl], $60                                ; $4F08: $36 $60
    ld   hl, wEntitiesPosYTable                   ; $4F0A: $21 $10 $C2
    add  hl, bc                                   ; $4F0D: $09
    ld   [hl], $58                                ; $4F0E: $36 $58
    call PushLinkOutOfEntity_07                   ; $4F10: $CD $F0 $7C
    call func_007_7D43                            ; $4F13: $CD $43 $7D
    ret  nc                                       ; $4F16: $D0

    call_open_dialog Dialog1C0                    ; $4F17
    jp   IncrementEntityState                     ; $4F1C: $C3 $12 $3B

func_007_4F1F::
    call PushLinkOutOfEntity_07                   ; $4F1F: $CD $F0 $7C
    ld   a, [wDialogState]                        ; $4F22: $FA $9F $C1
    and  a                                        ; $4F25: $A7
    jr   nz, ret_007_4F4D                         ; $4F26: $20 $25

    ld   a, [wDialogAskSelectionIndex]            ; $4F28: $FA $77 $C1
    and  a                                        ; $4F2B: $A7
    jr   nz, .jr_4F44                             ; $4F2C: $20 $16

    ld   a, $02                                   ; $4F2E: $3E $02
    ld   [wExchangingTradeSequenceItem], a        ; $4F30: $EA $7F $DB
    ld   hl, wOverworldRoomStatus + $87           ; $4F33: $21 $87 $D8
    set  OW_ROOM_STATUS_FLAG_UNKNOWN_6, [hl]      ; $4F36: $CB $F6
    call GetEntityTransitionCountdown             ; $4F38: $CD $05 $0C
    ld   [hl], $A0                                ; $4F3B: $36 $A0
    ld   a, JINGLE_TREASURE_FOUND                 ; $4F3D: $3E $01
    ldh  [hJingle], a                             ; $4F3F: $E0 $F2
    jp   IncrementEntityState                     ; $4F41: $C3 $12 $3B

.jr_4F44
    call_open_dialog Dialog1C2                    ; $4F44
    call IncrementEntityState                     ; $4F49: $CD $12 $3B
    ld   [hl], b                                  ; $4F4C: $70

ret_007_4F4D:
    ret                                           ; $4F4D: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown102SpriteVariants::
.variant0
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0

func_007_4F56::
    ld   a, $01                                   ; $4F56: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4F58: $E0 $A1
    ld   [wC167], a                               ; $4F5A: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $4F5D: $CD $05 $0C
    cp   $30                                      ; $4F60: $FE $30
    jr   c, .jr_4F7B                              ; $4F62: $38 $17

    xor  a                                        ; $4F64: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4F65: $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ; $4F67: $F0 $EC
    sub  $10                                      ; $4F69: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $4F6B: $E0 $EC
    ld   de, Unknown102SpriteVariants             ; $4F6D: $11 $4E $4F
    call RenderActiveEntitySpritesPair            ; $4F70: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4F73: $CD $8A $3D
    ld   a, $08                                   ; $4F76: $3E $08
    jp   SetEntitySpriteVariant                   ; $4F78: $C3 $0C $3B

; Tarin beehive cutscene related
.jr_4F7B
    cp   $18                                      ; $4F7B: $FE $18
    jr   nc, .jr_4FA5                             ; $4F7D: $30 $26

    ld   a, $02                                   ; $4F7F: $3E $02
    ldh  [hLinkDirection], a                      ; $4F81: $E0 $9E
    ld   hl, wEntitiesSpeedXTable                 ; $4F83: $21 $40 $C2
    add  hl, bc                                   ; $4F86: $09
    ld   [hl], $FE                                ; $4F87: $36 $FE
    call GetEntitySpeedYAddress                   ; $4F89: $CD $05 $40
    ld   [hl], $F4                                ; $4F8C: $36 $F4
    call UpdateEntityPosWithSpeed_07              ; $4F8E: $CD $0A $7E
    call GetEntityTransitionCountdown             ; $4F91: $CD $05 $0C
    jr   nz, .jr_4FA5                             ; $4F94: $20 $0F

    ld   a, MUSIC_TARIN_BEES                      ; $4F96: $3E $34
    ld   [wMusicTrackToPlay], a                   ; $4F98: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $4F9B: $E0 $B0
    call GetEntityTransitionCountdown             ; $4F9D: $CD $05 $0C
    ld   [hl], $C0                                ; $4FA0: $36 $C0
    jp   IncrementEntityState                     ; $4FA2: $C3 $12 $3B

.jr_4FA5
    ld   a, $01                                   ; $4FA5: $3E $01
    ldh  [hActiveEntitySpriteVariant], a          ; $4FA7: $E0 $F1
    ldh  a, [hActiveEntityPosX]                   ; $4FA9: $F0 $EE
    sub  $0C                                      ; $4FAB: $D6 $0C
    ldh  [hActiveEntityPosX], a                   ; $4FAD: $E0 $EE
    ld   de, Unknown102SpriteVariants             ; $4FAF: $11 $4E $4F
    call RenderActiveEntitySpritesPair            ; $4FB2: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4FB5: $CD $8A $3D
    call GetEntityTransitionCountdown             ; $4FB8: $CD $05 $0C
    rra                                           ; $4FBB: $1F
    rra                                           ; $4FBC: $1F
    rra                                           ; $4FBD: $1F
    rra                                           ; $4FBE: $1F
    and  $01                                      ; $4FBF: $E6 $01
    add  $02                                      ; $4FC1: $C6 $02
    jp   SetEntitySpriteVariant                   ; $4FC3: $C3 $0C $3B

func_007_4FC6::
    ld   a, $01                                   ; $4FC6: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4FC8: $E0 $A1
    call GetEntityTransitionCountdown             ; $4FCA: $CD $05 $0C
    jr   nz, .jr_4FD4                             ; $4FCD: $20 $05

    ld   [hl], $0C                                ; $4FCF: $36 $0C
    call IncrementEntityState                     ; $4FD1: $CD $12 $3B

.jr_4FD4
    call GetEntityTransitionCountdown             ; $4FD4: $CD $05 $0C
    cp   $20                                      ; $4FD7: $FE $20
    jr   nz, .jr_4FE5                             ; $4FD9: $20 $0A

    ld   hl, wEntitiesSpeedZTable                 ; $4FDB: $21 $20 $C3
    add  hl, bc                                   ; $4FDE: $09
    ld   [hl], $18                                ; $4FDF: $36 $18
    call func_007_733F                            ; $4FE1: $CD $3F $73
    xor  a                                        ; $4FE4: $AF

.jr_4FE5
    cp   $60                                      ; $4FE5: $FE $60
    jr   nz, .jr_4FED                             ; $4FE7: $20 $04

    ld   hl, wD202                                ; $4FE9: $21 $02 $D2
    inc  [hl]                                     ; $4FEC: $34

.jr_4FED
    cp   $A0                                      ; $4FED: $FE $A0
    jr   nz, .jr_4FFC                             ; $4FEF: $20 $0B

    ld   a, [wD201]                               ; $4FF1: $FA $01 $D2
    ld   e, a                                     ; $4FF4: $5F
    ld   d, b                                     ; $4FF5: $50
    ld   hl, wEntitiesTransitionCountdownTable    ; $4FF6: $21 $E0 $C2
    add  hl, de                                   ; $4FF9: $19
    ld   [hl], $A0                                ; $4FFA: $36 $A0

.jr_4FFC
    and  $20                                      ; $4FFC: $E6 $20
    jr   z, .jr_5012                              ; $4FFE: $28 $12

    ld   a, $01                                   ; $5000: $3E $01
    ldh  [hActiveEntitySpriteVariant], a          ; $5002: $E0 $F1
    ldh  a, [hActiveEntityPosX]                   ; $5004: $F0 $EE
    sub  $0E                                      ; $5006: $D6 $0E
    ldh  [hActiveEntityPosX], a                   ; $5008: $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ; $500A: $F0 $EC
    sub  $08                                      ; $500C: $D6 $08
    ldh  [hActiveEntityVisualPosY], a             ; $500E: $E0 $EC
    jr   jr_007_501B                              ; $5010: $18 $09

.jr_5012
    xor  a                                        ; $5012: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $5013: $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ; $5015: $F0 $EC
    sub  $10                                      ; $5017: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $5019: $E0 $EC

jr_007_501B:
    ld   de, Unknown102SpriteVariants             ; $501B: $11 $4E $4F
    call RenderActiveEntitySpritesPair            ; $501E: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $5021: $CD $8A $3D
    call GetEntityTransitionCountdown             ; $5024: $CD $05 $0C
    ld   e, $02                                   ; $5027: $1E $02
    and  $20                                      ; $5029: $E6 $20
    jr   z, .jr_502E                              ; $502B: $28 $01

    inc  e                                        ; $502D: $1C

.jr_502E
    ld   a, e                                     ; $502E: $7B
    jp   SetEntitySpriteVariant                   ; $502F: $C3 $0C $3B

Data_007_5032::
    db   $20, $00, $E0, $00

Data_007_5036::
    db   $00, $E0, $00, $20

Data_007_503A::
    db   $00, $02, $01

Data_007_503D::
    db   $03, $16, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28

Data_007_504A::
    db   $00, $02, $04, $06

func_007_504E::
    ld   a, $01                                   ; $504E: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5050: $E0 $A1
    call GetEntityTransitionCountdown             ; $5052: $CD $05 $0C
    jr   nz, jr_007_506E                          ; $5055: $20 $17

    ld   hl, wEntitiesInertiaTable                ; $5057: $21 $D0 $C3
    add  hl, bc                                   ; $505A: $09
    ld   a, [hl]                                  ; $505B: $7E
    inc  a                                        ; $505C: $3C
    ld   [hl], a                                  ; $505D: $77
    cp   $0B                                      ; $505E: $FE $0B
    jp   z, IncrementEntityState                  ; $5060: $CA $12 $3B

    ld   e, a                                     ; $5063: $5F
    ld   d, b                                     ; $5064: $50
    ld   hl, Data_007_503D                        ; $5065: $21 $3D $50
    add  hl, de                                   ; $5068: $19

.jr_5069
    ld   e, [hl]                                  ; $5069: $5E
    call GetEntityTransitionCountdown             ; $506A: $CD $05 $0C

.jr_506D
    ld   [hl], e                                  ; $506D: $73

jr_007_506E:
    ld   hl, wEntitiesInertiaTable                ; $506E: $21 $D0 $C3

.jr_5071
    add  hl, bc                                   ; $5071: $09
    ld   a, [hl]                                  ; $5072: $7E
    and  $03                                      ; $5073: $E6 $03
    ld   e, a                                     ; $5075: $5F
    ld   d, b                                     ; $5076: $50
    ld   hl, Data_007_5032                        ; $5077: $21 $32 $50
    add  hl, de                                   ; $507A: $19
    ld   a, [hl]                                  ; $507B: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $507C: $21 $40 $C2
    add  hl, bc                                   ; $507F: $09
    ld   [hl], a                                  ; $5080: $77
    ld   hl, Data_007_5036                        ; $5081: $21 $36 $50
    add  hl, de                                   ; $5084: $19
    ld   a, [hl]                                  ; $5085: $7E
    call GetEntitySpeedYAddress                   ; $5086: $CD $05 $40
    ld   [hl], a                                  ; $5089: $77
    ld   hl, Data_007_503A                        ; $508A: $21 $3A $50
    add  hl, de                                   ; $508D: $19
    ld   a, [hl]                                  ; $508E: $7E
    ld   hl, wEntitiesDirectionTable              ; $508F: $21 $80 $C3
    add  hl, bc                                   ; $5092: $09
    ld   [hl], a                                  ; $5093: $77
    call func_007_7E7D                            ; $5094: $CD $7D $7E
    ld   a, e                                     ; $5097: $7B
    xor  $01                                      ; $5098: $EE $01

jr_007_509A:
    ldh  [hLinkDirection], a                      ; $509A: $E0 $9E
    call UpdateEntityPosWithSpeed_07              ; $509C: $CD $0A $7E
    ld   hl, wEntitiesDirectionTable              ; $509F: $21 $80 $C3
    add  hl, bc                                   ; $50A2: $09
    ld   e, [hl]                                  ; $50A3: $5E
    ld   d, b                                     ; $50A4: $50
    ld   hl, Data_007_504A                        ; $50A5: $21 $4A $50
    add  hl, de                                   ; $50A8: $19
    ldh  a, [hFrameCounter]                       ; $50A9: $F0 $E7
    rra                                           ; $50AB: $1F
    rra                                           ; $50AC: $1F
    rra                                           ; $50AD: $1F
    and  $01                                      ; $50AE: $E6 $01
    or   [hl]                                     ; $50B0: $B6
    jp   SetEntitySpriteVariant                   ; $50B1: $C3 $0C $3B

func_007_50B4::
    ld   a, $01                                   ; $50B4: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $50B6: $E0 $A1
    ld   hl, wEntitiesDirectionTable              ; $50B8: $21 $80 $C3
    add  hl, bc                                   ; $50BB: $09
    ld   a, $01                                   ; $50BC: $3E $01
    ld   [hl], a                                  ; $50BE: $77
    ld   hl, wEntitiesSpeedXTable                 ; $50BF: $21 $40 $C2
    add  hl, bc                                   ; $50C2: $09
    ld   [hl], $E4                                ; $50C3: $36 $E4
    call GetEntitySpeedYAddress                   ; $50C5: $CD $05 $40
    ld   [hl], $08                                ; $50C8: $36 $08
    call UpdateEntityPosWithSpeed_07              ; $50CA: $CD $0A $7E
    ldh  a, [hActiveEntityPosX]                   ; $50CD: $F0 $EE
    cp   $C0                                      ; $50CF: $FE $C0
    jr   c, label_007_50DF                        ; $50D1: $38 $0C

    cp   $C4                                      ; $50D3: $FE $C4
    jp   nc, label_007_50DF                       ; $50D5: $D2 $DF $50

    xor  a                                        ; $50D8: $AF
    ld   [wC167], a                               ; $50D9: $EA $67 $C1
    call IncrementEntityState                     ; $50DC: $CD $12 $3B

label_007_50DF:
    ld   a, $01                                   ; $50DF: $3E $01
    jr   jr_007_509A                              ; $50E1: $18 $B7

func_007_50E3::
    ld   a, [wD201]                               ; $50E3: $FA $01 $D2
    ld   e, a                                     ; $50E6: $5F
    ld   d, b                                     ; $50E7: $50
    ld   hl, wEntitiesStateTable                  ; $50E8: $21 $90 $C2
    add  hl, de                                   ; $50EB: $19
    inc  [hl]                                     ; $50EC: $34
    ld   hl, wEntitiesTransitionCountdownTable    ; $50ED: $21 $E0 $C2
    add  hl, de                                   ; $50F0: $19
    ld   [hl], $50                                ; $50F1: $36 $50
    ld   hl, wEntitiesPosYTable                   ; $50F3: $21 $10 $C2
    add  hl, de                                   ; $50F6: $19
    ld   a, [hl]                                  ; $50F7: $7E
    add  $10                                      ; $50F8: $C6 $10
    ld   [hl], a                                  ; $50FA: $77
    ld   hl, wEntitiesPosZTable                   ; $50FB: $21 $10 $C3
    add  hl, de                                   ; $50FE: $19
    ld   [hl], $10                                ; $50FF: $36 $10
    jp   ClearEntityStatus_07                     ; $5101: $C3 $A4 $7E
