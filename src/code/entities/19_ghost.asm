; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
GhostSpriteVariants::
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
    db $48, $03
    db $4A, $03
.variant5
    db $4C, $03
    db $4E, $03

; Z positions of the ghost, new index every 8 frames.
GhostZPositionTable::
    db   $10, $11, $12, $13, $13, $12, $11, $10

; Friendly ghost following Link after Dungeon 4
GhostEntityHandler::
    ld   a, [wIsGhostFollowingLink]               ; $5E18: $FA $79 $DB
    cp   $01                                      ; $5E1B: $FE $01
    jp   nz, ClearEntityStatus_19                 ; $5E1D: $C2 $61 $7E

    ldh  a, [hMapRoom]                            ; $5E20: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $5E22: $21 $E0 $C3
    add  hl, bc                                   ; $5E25: $09
    ld   [hl], a                                  ; $5E26: $77
    ld   hl, wEntitiesPosXSignTable               ; $5E27: $21 $20 $C2
    add  hl, bc                                   ; $5E2A: $09
    ld   [hl], b                                  ; $5E2B: $70
    ld   hl, wEntitiesPosYSignTable               ; $5E2C: $21 $30 $C2
    add  hl, bc                                   ; $5E2F: $09
    ld   [hl], b                                  ; $5E30: $70
    ldh  a, [hFrameCounter]                       ; $5E31: $F0 $E7
    xor  c                                        ; $5E33: $A9
    and  $01                                      ; $5E34: $E6 $01
    jr   nz, .skipDraw                            ; $5E36: $20 $06

    ld   de, GhostSpriteVariants                  ; $5E38: $11 $F8 $5D
    call RenderActiveEntitySpritesPair            ; $5E3B: $CD $C0 $3B

.skipDraw
    ld   hl, wEntitiesPrivateState2Table          ; $5E3E: $21 $C0 $C2
    add  hl, bc                                   ; $5E41: $09
    ld   a, [hl]                                  ; $5E42: $7E
    and  a                                        ; $5E43: $A7
    jr   nz, .jr_5E5B                             ; $5E44: $20 $15

    ldh  a, [hFrameCounter]                       ; $5E46: $F0 $E7
    rra                                           ; $5E48: $1F
    rra                                           ; $5E49: $1F
    rra                                           ; $5E4A: $1F
    and  $07                                      ; $5E4B: $E6 $07
    ld   e, a                                     ; $5E4D: $5F
    ld   d, b                                     ; $5E4E: $50
    ld   hl, GhostZPositionTable                  ; $5E4F: $21 $10 $5E
    add  hl, de                                   ; $5E52: $19
    ld   a, [hl]                                  ; $5E53: $7E
    sub  $04                                      ; $5E54: $D6 $04
    ld   hl, wEntitiesPosZTable                   ; $5E56: $21 $10 $C3
    add  hl, bc                                   ; $5E59: $09
    ld   [hl], a                                  ; $5E5A: $77

.jr_5E5B
    ldh  a, [hActiveEntityState]                  ; $5E5B: $F0 $F0
    and  a                                        ; $5E5D: $A7
    jr   nz, jr_019_5EAF                          ; $5E5E: $20 $4F

    call func_019_7E3A                            ; $5E60: $CD $3A $7E
    ld   a, e                                     ; $5E63: $7B
    cp   $02                                      ; $5E64: $FE $02
    ld   e, $04                                   ; $5E66: $1E $04
    jr   z, .jr_5E6F                              ; $5E68: $28 $05

    call EntityLinkPositionXDifference_19         ; $5E6A: $CD $0B $7E
    sla  e                                        ; $5E6D: $CB $23

.jr_5E6F
    ldh  a, [hFrameCounter]                       ; $5E6F: $F0 $E7
    rra                                           ; $5E71: $1F
    rra                                           ; $5E72: $1F
    rra                                           ; $5E73: $1F
    rra                                           ; $5E74: $1F
    and  $01                                      ; $5E75: $E6 $01
    add  e                                        ; $5E77: $83
    call SetEntitySpriteVariant                   ; $5E78: $CD $0C $3B
    call EntityLinkPositionXDifference_19         ; $5E7B: $CD $0B $7E
    add  $18                                      ; $5E7E: $C6 $18
    cp   $30                                      ; $5E80: $FE $30
    jr   nc, .jr_5E99                             ; $5E82: $30 $15

    ldh  a, [hLinkPositionY]                      ; $5E84: $F0 $99
    push af                                       ; $5E86: $F5
    add  $0C                                      ; $5E87: $C6 $0C
    ldh  [hLinkPositionY], a                      ; $5E89: $E0 $99
    call EntityLinkPositionYDifference_19         ; $5E8B: $CD $1B $7E
    ld   e, a                                     ; $5E8E: $5F
    pop  af                                       ; $5E8F: $F1
    ldh  [hLinkPositionY], a                      ; $5E90: $E0 $99
    ld   a, e                                     ; $5E92: $7B
    add  $18                                      ; $5E93: $C6 $18
    cp   $30                                      ; $5E95: $FE $30
    jr   c, jr_019_5EAF                           ; $5E97: $38 $16

.jr_5E99
    ldh  a, [hFrameCounter]                       ; $5E99: $F0 $E7
    and  $03                                      ; $5E9B: $E6 $03
    jr   nz, jr_019_5EAC                          ; $5E9D: $20 $0D

    ld   a, [wIsRunningWithPegasusBoots]          ; $5E9F: $FA $4A $C1
    and  a                                        ; $5EA2: $A7
    ; Set the speed at which the ghost follows you.
    ld   a, $08                                   ; $5EA3: $3E $08
    jr   z, .jr_5EA9                              ; $5EA5: $28 $02
    ld   a, $18                                   ; $5EA7: $3E $18

.jr_5EA9
    call ApplyVectorTowardsLink_trampoline        ; $5EA9: $CD $AA $3B

jr_019_5EAC:
    call UpdateEntityPosWithSpeed_19              ; $5EAC: $CD $B8 $7D

jr_019_5EAF:
    ld   a, [wIsIndoor]                           ; $5EAF: $FA $A5 $DB
    and  a                                        ; $5EB2: $A7
    jp   nz, GhostInHouseSequence                 ; $5EB3: $C2 $BF $5F

    ld   a, [wGhostSeeksGrave]                    ; $5EB6: $FA $7A $DB
    and  a                                        ; $5EB9: $A7
    jp   z, label_019_5F5F                        ; $5EBA: $CA $5F $5F

    ldh  a, [hMapRoom]                            ; $5EBD: $F0 $F6
    cp   UNKNOWN_ROOM_64                          ; $5EBF: $FE $64
    jp   nz, label_019_5F84                       ; $5EC1: $C2 $84 $5F

    ldh  a, [hActiveEntityState]                  ; $5EC4: $F0 $F0
    JP_TABLE                                      ; $5EC6
._00 dw GhostState0Handler
._01 dw GhostState1Handler
._02 dw GhostState2Handler

GhostState0Handler::
    call ReturnIfNonInteractive_19                ; $5ECD: $CD $3D $7D
    ldh  a, [hLinkPositionX]                      ; $5ED0: $F0 $98
    cp   $3C                                      ; $5ED2: $FE $3C
    ret  nc                                       ; $5ED4: $D0

    ldh  a, [hLinkPositionY]                      ; $5ED5: $F0 $99
    cp   $7A                                      ; $5ED7: $FE $7A
    ret  nc                                       ; $5ED9: $D0

    ld   [wC167], a                               ; $5EDA: $EA $67 $C1
    jp   IncrementEntityState                     ; $5EDD: $C3 $12 $3B

GhostState1Handler::
    ld   a, $02                                   ; $5EE0: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5EE2: $E0 $A1
    ldh  a, [hLinkPositionY]                      ; $5EE4: $F0 $99
    push af                                       ; $5EE6: $F5
    ldh  a, [hLinkPositionX]                      ; $5EE7: $F0 $98
    push af                                       ; $5EE9: $F5
    ld   hl, wEntitiesPosZTable                   ; $5EEA: $21 $10 $C3
    add  hl, bc                                   ; $5EED: $09
    ld   a, $60                                   ; $5EEE: $3E $60
    sub  [hl]                                     ; $5EF0: $96
    ldh  [hLinkPositionY], a                      ; $5EF1: $E0 $99
    ld   a, $28                                   ; $5EF3: $3E $28
    ldh  [hLinkPositionX], a                      ; $5EF5: $E0 $98
    ld   a, $08                                   ; $5EF7: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $5EF9: $CD $AA $3B
    call EntityLinkPositionXDifference_19         ; $5EFC: $CD $0B $7E
    push af                                       ; $5EFF: $F5
    ld   a, e                                     ; $5F00: $7B
    sla  a                                        ; $5F01: $CB $27
    ld   hl, wEntitiesDirectionTable              ; $5F03: $21 $80 $C3
    add  hl, bc                                   ; $5F06: $09
    ld   [hl], a                                  ; $5F07: $77
    pop  af                                       ; $5F08: $F1
    add  $03                                      ; $5F09: $C6 $03
    cp   $06                                      ; $5F0B: $FE $06
    jr   nc, .jr_5F30                             ; $5F0D: $30 $21

    call EntityLinkPositionYDifference_19         ; $5F0F: $CD $1B $7E
    add  $0C                                      ; $5F12: $C6 $0C
    cp   $18                                      ; $5F14: $FE $18
    jr   nc, .jr_5F30                             ; $5F16: $30 $18

    pop  af                                       ; $5F18: $F1
    ldh  [hLinkPositionX], a                      ; $5F19: $E0 $98
    pop  af                                       ; $5F1B: $F1
    ldh  [hLinkPositionY], a                      ; $5F1C: $E0 $99
    call_open_dialog Dialog216                    ; $5F1E
    ld   a, JINGLE_GHOST_PRESENCE                 ; $5F23: $3E $2D
    ldh  [hJingle], a                             ; $5F25: $E0 $F2
    call IncrementEntityState                     ; $5F27: $CD $12 $3B
    ld   hl, wEntitiesPrivateState2Table          ; $5F2A: $21 $C0 $C2
    add  hl, bc                                   ; $5F2D: $09
    inc  [hl]                                     ; $5F2E: $34
    ret                                           ; $5F2F: $C9

.jr_5F30
    pop  af                                       ; $5F30: $F1
    ldh  [hLinkPositionX], a                      ; $5F31: $E0 $98
    pop  af                                       ; $5F33: $F1
    ldh  [hLinkPositionY], a                      ; $5F34: $E0 $99
    call UpdateEntityPosWithSpeed_19              ; $5F36: $CD $B8 $7D
    jp   label_019_6053                           ; $5F39: $C3 $53 $60

GhostState2Handler::
    ld   a, $02                                   ; $5F3C: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5F3E: $E0 $A1
    call ReturnIfNonInteractive_19                ; $5F40: $CD $3D $7D
    ld   hl, wEntitiesPosZTable                   ; $5F43: $21 $10 $C3
    add  hl, bc                                   ; $5F46: $09
    dec  [hl]                                     ; $5F47: $35
    jr   nz, .jr_5F5C                             ; $5F48: $20 $12

    xor  a                                        ; $5F4A: $AF
    ld   [wIsGhostFollowingLink], a               ; $5F4B: $EA $79 $DB
    ld   [wGhostSeeksGrave], a                    ; $5F4E: $EA $7A $DB
    ld   [wC167], a                               ; $5F51: $EA $67 $C1
    ld   hl, wIndoorARoomStatus + $E3             ; $5F54: $21 $E3 $D9
    set  6, [hl]                                  ; $5F57: $CB $F6
    jp   ClearEntityStatus_19                     ; $5F59: $C3 $61 $7E

.jr_5F5C
    jp   label_019_6053                           ; $5F5C: $C3 $53 $60

label_019_5F5F:
    call ReturnIfNonInteractive_19                ; $5F5F: $CD $3D $7D
    ld   hl, wEntitiesPrivateState3Table          ; $5F62: $21 $D0 $C2
    add  hl, bc                                   ; $5F65: $09
    ld   a, [hl]                                  ; $5F66: $7E
    and  a                                        ; $5F67: $A7
    ret  nz                                       ; $5F68: $C0

    ldh  a, [hMapRoom]                            ; $5F69: $F0 $F6
    cp   UNKNOWN_ROOM_F6                          ; $5F6B: $FE $F6
    jp   nz, label_019_5F84                       ; $5F6D: $C2 $84 $5F

    ldh  a, [hLinkPositionY]                      ; $5F70: $F0 $99
    cp   $40                                      ; $5F72: $FE $40
    ret  c                                        ; $5F74: $D8

    ldh  a, [hLinkPositionX]                      ; $5F75: $F0 $98
    cp   $78                                      ; $5F77: $FE $78
    ret  nc                                       ; $5F79: $D0

    inc  [hl]                                     ; $5F7A: $34
    ld   a, JINGLE_GHOST_PRESENCE                 ; $5F7B: $3E $2D
    ldh  [hJingle], a                             ; $5F7D: $E0 $F2
    jp_open_dialog Dialog213                      ; $5F7F

label_019_5F84:
    call ReturnIfNonInteractive_19                ; $5F84: $CD $3D $7D
    ld   hl, wEntitiesPrivateState3Table          ; $5F87: $21 $D0 $C2
    add  hl, bc                                   ; $5F8A: $09
    ld   a, [hl]                                  ; $5F8B: $7E
    and  a                                        ; $5F8C: $A7
    ret  nz                                       ; $5F8D: $C0

    ld   a, [wTransitionSequenceCounter]          ; $5F8E: $FA $6B $C1
    cp   $04                                      ; $5F91: $FE $04
    ret  nz                                       ; $5F93: $C0

    ldh  a, [hFrameCounter]                       ; $5F94: $F0 $E7
    and  $01                                      ; $5F96: $E6 $01
    ret  nz                                       ; $5F98: $C0

    ld   hl, wEntitiesPrivateState4Table          ; $5F99: $21 $40 $C4
    add  hl, bc                                   ; $5F9C: $09
    dec  [hl]                                     ; $5F9D: $35
    ret  nz                                       ; $5F9E: $C0

    call GetRandomByte                            ; $5F9F: $CD $0D $28
    and  $03                                      ; $5FA2: $E6 $03
    ld   hl, wIsMarinSinging                      ; $5FA4: $21 $C8 $C3
    or   [hl]                                     ; $5FA7: $B6
    ret  nz                                       ; $5FA8: $C0

IF __PATCH_0__
    ld   a, [wGameplayType]
    cp   GAMEPLAY_WORLD
    ret  nz
ENDC

    ld   hl, wEntitiesPrivateState3Table          ; $5FA9: $21 $D0 $C2
    add  hl, bc                                   ; $5FAC: $09
    inc  [hl]                                     ; $5FAD: $34

    ld   a, JINGLE_GHOST_PRESENCE                 ; $5FAE: $3E $2D
    ldh  [hJingle], a                             ; $5FB0: $E0 $F2

    ld   a, [wGhostSeeksGrave]                    ; $5FB2: $FA $7A $DB
    and  a                                        ; $5FB5: $A7
    ld_dialog_low a, Dialog211 ; "the house…"     ; $5FB6: $3E $11
    jr   z, .endIf                                ; $5FB8: $28 $02
    ld_dialog_low a, Dialog210 ; "my grave…"      ; $5FBA: $3E $10
.endIf
    jp   OpenDialogInTable2                       ; $5FBC: $C3 $7C $23

GhostInHouseSequence:
    call ReturnIfNonInteractive_19                ; $5FBF: $CD $3D $7D
    ldh  a, [hMapId]                              ; $5FC2: $F0 $F7
    cp   MAP_GHOST_HOUSE                          ; $5FC4: $FE $1E
    ret  nz                                       ; $5FC6: $C0

    ldh  a, [hMapRoom]                            ; $5FC7: $F0 $F6
    cp   UNKNOWN_ROOM_E3                          ; $5FC9: $FE $E3
    ret  nz                                       ; $5FCB: $C0

    ldh  a, [hRoomStatus]                         ; $5FCC: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $5FCE: $E6 $20
    ret  nz                                       ; $5FD0: $C0

    ld   a, $02                                   ; $5FD1: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5FD3: $E0 $A1
    ld   [wC167], a                               ; $5FD5: $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ; $5FD8: $F0 $F0
    JP_TABLE                                      ; $5FDA
._00 dw func_019_5FE7                             ; $5FDB
._01 dw func_019_5FFF                             ; $5FDD
._02 dw func_019_6037                             ; $5FDF
._03 dw func_019_6064                             ; $5FE1
._04 dw func_019_6080                             ; $5FE3
._05 dw func_019_60A5                             ; $5FE5

func_019_5FE7::
    call GetEntityTransitionCountdown             ; $5FE7: $CD $05 $0C
    ld   [hl], $40                                ; $5FEA: $36 $40
    jp   IncrementEntityState                     ; $5FEC: $C3 $12 $3B

Data_019_5FEF::
    db   $60, $28, $28, $68

Data_019_5FF3::
    db   $00, $F8, $FC, $08

Data_019_5FF7::
    db   $F8, $FC, $F8, $02

Data_019_5FFB::
    db   $04, $02, $04, $00

func_019_5FFF::
    call GetEntityTransitionCountdown             ; $5FFF: $CD $05 $0C
    jr   nz, .jr_6035                             ; $6002: $20 $31

    ld   hl, wEntitiesInertiaTable                ; $6004: $21 $D0 $C3
    add  hl, bc                                   ; $6007: $09
    ld   e, [hl]                                  ; $6008: $5E
    ld   d, b                                     ; $6009: $50
    ld   hl, Data_019_5FEF                        ; $600A: $21 $EF $5F
    add  hl, de                                   ; $600D: $19
    ld   a, [hl]                                  ; $600E: $7E
    ld   hl, wEntitiesTransitionCountdownTable    ; $600F: $21 $E0 $C2
    add  hl, bc                                   ; $6012: $09
    ld   [hl], a                                  ; $6013: $77
    ld   hl, Data_019_5FF3                        ; $6014: $21 $F3 $5F
    add  hl, de                                   ; $6017: $19
    ld   a, [hl]                                  ; $6018: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6019: $21 $40 $C2
    add  hl, bc                                   ; $601C: $09
    ld   [hl], a                                  ; $601D: $77
    ld   hl, Data_019_5FF7                        ; $601E: $21 $F7 $5F
    add  hl, de                                   ; $6021: $19
    ld   a, [hl]                                  ; $6022: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $6023: $21 $50 $C2
    add  hl, bc                                   ; $6026: $09
    ld   [hl], a                                  ; $6027: $77
    ld   hl, Data_019_5FFB                        ; $6028: $21 $FB $5F
    add  hl, de                                   ; $602B: $19
    ld   a, [hl]                                  ; $602C: $7E
    ld   hl, wEntitiesDirectionTable              ; $602D: $21 $80 $C3
    add  hl, bc                                   ; $6030: $09
    ld   [hl], a                                  ; $6031: $77
    call IncrementEntityState                     ; $6032: $CD $12 $3B

.jr_6035
    jr   label_019_6053                           ; $6035: $18 $1C

func_019_6037::
    call GetEntityTransitionCountdown             ; $6037: $CD $05 $0C
    jr   nz, .jr_6050                             ; $603A: $20 $14

    ld   [hl], $50                                ; $603C: $36 $50
    call IncrementEntityState                     ; $603E: $CD $12 $3B
    ld   hl, wEntitiesInertiaTable                ; $6041: $21 $D0 $C3
    add  hl, bc                                   ; $6044: $09
    ld   a, [hl]                                  ; $6045: $7E
    inc  a                                        ; $6046: $3C
    ld   [hl], a                                  ; $6047: $77
    cp   $04                                      ; $6048: $FE $04
    jr   z, .jr_6050                              ; $604A: $28 $04

    call IncrementEntityState                     ; $604C: $CD $12 $3B
    ld   [hl], b                                  ; $604F: $70

.jr_6050
    call UpdateEntityPosWithSpeed_19              ; $6050: $CD $B8 $7D

label_019_6053:
    ld   hl, wEntitiesDirectionTable              ; $6053: $21 $80 $C3
    add  hl, bc                                   ; $6056: $09
    ld   e, [hl]                                  ; $6057: $5E
    ldh  a, [hFrameCounter]                       ; $6058: $F0 $E7
    rra                                           ; $605A: $1F
    rra                                           ; $605B: $1F
    rra                                           ; $605C: $1F
    rra                                           ; $605D: $1F
    and  $01                                      ; $605E: $E6 $01
    add  e                                        ; $6060: $83
    jp   SetEntitySpriteVariant                   ; $6061: $C3 $0C $3B

func_019_6064::
    call GetEntityTransitionCountdown             ; $6064: $CD $05 $0C
    jr   nz, .jr_607D                             ; $6067: $20 $14

    ld   [hl], $50                                ; $6069: $36 $50
    ldh  a, [hLinkPositionY]                      ; $606B: $F0 $99
    push af                                       ; $606D: $F5
    ld   a, $10                                   ; $606E: $3E $10
    ldh  [hLinkPositionY], a                      ; $6070: $E0 $99
    call_open_dialog Dialog214                    ; $6072
    pop  af                                       ; $6077: $F1
    ldh  [hLinkPositionY], a                      ; $6078: $E0 $99
    call IncrementEntityState                     ; $607A: $CD $12 $3B

.jr_607D
    jp   label_019_6053                           ; $607D: $C3 $53 $60

func_019_6080::
    call GetEntityTransitionCountdown             ; $6080: $CD $05 $0C
    jr   nz, .jr_608D                             ; $6083: $20 $08

    call_open_dialog Dialog215                    ; $6085
    call IncrementEntityState                     ; $608A: $CD $12 $3B

.jr_608D
    ld   hl, wEntitiesSpeedYTable                 ; $608D: $21 $50 $C2
    add  hl, bc                                   ; $6090: $09
    ld   [hl], $0A                                ; $6091: $36 $0A
    ld   hl, wEntitiesSpeedXTable                 ; $6093: $21 $40 $C2
    add  hl, bc                                   ; $6096: $09
    ld   [hl], $FC                                ; $6097: $36 $FC
    ld   hl, wEntitiesDirectionTable              ; $6099: $21 $80 $C3
    add  hl, bc                                   ; $609C: $09
    ld   [hl], $02                                ; $609D: $36 $02
    call UpdateEntityPosWithSpeed_19              ; $609F: $CD $B8 $7D
    jp   label_019_6053                           ; $60A2: $C3 $53 $60

func_019_60A5::
    ld   a, $01                                   ; $60A5: $3E $01
    ld   [wGhostSeeksGrave], a                    ; $60A7: $EA $7A $DB
    call func_019_7F0E                            ; $60AA: $CD $0E $7F
    call ClearEntityStatus_19                     ; $60AD: $CD $61 $7E
    jp   ApplyMapFadeOutTransitionWithNoise       ; $60B0: $C3 $7D $0C

    nop
