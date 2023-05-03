Data_019_7193::
    db   $00, $06, $0C, $13, $19, $20, $26, $2C, $33, $39, $00, $00, $00, $00, $00, $00
    db   $40, $43, $46, $49, $4C, $4F, $52, $55, $58, $5C, $00, $00, $00, $00, $00, $00
    db   $60, $60, $60, $60, $60, $60, $60, $60, $60

SeashellMansionEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $71BC: $21 $B0 $C2
    add  hl, bc                                   ; $71BF: $09

.jr_71C0
    ld   a, [hl]                                  ; $71C0: $7E
    cp   $02                                      ; $71C1: $FE $02
    jp   z, func_019_787D                         ; $71C3: $CA $7D $78

    and  a                                        ; $71C6: $A7
    jp   nz, label_019_74D8                       ; $71C7: $C2 $D8 $74

    ld   a, [wSeashellsCount]                     ; $71CA: $FA $0F $DB
    cp   $20                                      ; $71CD: $FE $20
    jr   z, jr_019_71FD                           ; $71CF: $28 $2C

    cp   $05                                      ; $71D1: $FE $05
    jr   nc, jr_019_71FD                          ; $71D3: $30 $28

    ld   hl, wEntitiesPrivateState5Table          ; $71D5: $21 $90 $C3
    add  hl, bc                                   ; $71D8: $09
    ld   a, [hl]                                  ; $71D9: $7E
    and  $02                                      ; $71DA: $E6 $02
    jr   nz, jr_019_71FD                          ; $71DC: $20 $1F

    ldh  a, [hLinkPositionX]                      ; $71DE: $F0 $98
    cp   $18                                      ; $71E0: $FE $18
    jr   c, jr_019_71FD                           ; $71E2: $38 $19

    ld   a, [hl]                                  ; $71E4: $7E
    and  a                                        ; $71E5: $A7
    jr   nz, .jr_71F6                             ; $71E6: $20 $0E

    ld   a, [wSwordLevel]                         ; $71E8: $FA $4E $DB
    and  $02                                      ; $71EB: $E6 $02
    jr   nz, jr_019_71FD                          ; $71ED: $20 $0E

    call_open_dialog Dialog179                    ; $71EF
    inc  [hl]                                     ; $71F4: $34
    ret                                           ; $71F5: $C9

.jr_71F6
    ld   a, [wDialogState]                        ; $71F6: $FA $9F $C1
    and  a                                        ; $71F9: $A7
    ret  nz                                       ; $71FA: $C0

    inc  [hl]                                     ; $71FB: $34
    ret                                           ; $71FC: $C9

jr_019_71FD:
    ldh  a, [hLinkPositionX]                      ; $71FD: $F0 $98
    cp   $38                                      ; $71FF: $FE $38
    jr   nc, .jr_7215                             ; $7201: $30 $12

    cp   $20                                      ; $7203: $FE $20
    jr   c, .jr_7215                              ; $7205: $38 $0E

    ld   hl, wC11E                                ; $7207: $21 $1E $C1
    set  7, [hl]                                  ; $720A: $CB $FE
    cp   $24                                      ; $720C: $FE $24
    jr   c, .jr_7215                              ; $720E: $38 $05

    ld   hl, wC11D                                ; $7210: $21 $1D $C1
    set  7, [hl]                                  ; $7213: $CB $FE

.jr_7215
    ld   a, [wSeashellsCount]                     ; $7215: $FA $0F $DB
    and  a                                        ; $7218: $A7
    ret  z                                        ; $7219: $C8

    ld   e, a                                     ; $721A: $5F
    ld   d, b                                     ; $721B: $50
    ld   hl, Data_019_7193                        ; $721C: $21 $93 $71
    add  hl, de                                   ; $721F: $19
    ld   a, [hl]                                  ; $7220: $7E
    ldh  [hMultiPurposeG], a                      ; $7221: $E0 $E8
    ldh  a, [hRoomStatus]                         ; $7223: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $7225: $E6 $10
    call func_019_73BD                            ; $7227: $CD $BD $73
    ldh  a, [hActiveEntityState]                  ; $722A: $F0 $F0
    JP_TABLE                                      ; $722C
._00 dw SeashellMansionState0Handler
._01 dw SeashellMansionState1Handler
._02 dw SeashellMansionState2Handler
._03 dw SeashellMansionState3Handler
._04 dw SeashellMansionState4Handler
._05 dw SeashellMansionState5Handler
._06 dw SeashellMansionState6Handler
._07 dw SeashellMansionState7Handler
._08 dw SeashellMansionState8Handler
._09 dw SeashellMansionState9Handler

SeashellMansionState0Handler::
    ldh  a, [hLinkPositionX]                      ; $7241: $F0 $98
    cp   $3C                                      ; $7243: $FE $3C
    jr   c, .ret_7255                             ; $7245: $38 $0E

    call ClearLinkPositionIncrement               ; $7247: $CD $8E $17
    call ResetSpinAttack                          ; $724A: $CD $AF $0C
    call IncrementEntityState                     ; $724D: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7250: $CD $05 $0C
    ld   [hl], $58                                ; $7253: $36 $58

.ret_7255
    ret                                           ; $7255: $C9

SeashellMansionState1Handler::
    ld   a, $01                                   ; $7256: $3E $01
    ld   [wC167], a                               ; $7258: $EA $67 $C1
    ld   a, [wIsLinkInTheAir]                     ; $725B: $FA $46 $C1
    and  a                                        ; $725E: $A7
    jp   z, IncrementEntityState                  ; $725F: $CA $12 $3B

    ret                                           ; $7262: $C9

SeashellMansionState2Handler::
    ld   a, $02                                   ; $7263: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7265: $E0 $A1
    call GetEntityTransitionCountdown             ; $7267: $CD $05 $0C
    ret  nz                                       ; $726A: $C0

    ld   hl, wEntitiesInertiaTable                ; $726B: $21 $D0 $C3
    add  hl, bc                                   ; $726E: $09
    ldh  a, [hMultiPurposeG]                      ; $726F: $F0 $E8
    sub  [hl]                                     ; $7271: $96
    jr   nc, .jr_727A                             ; $7272: $30 $06

    ldh  a, [hMultiPurposeG]                      ; $7274: $F0 $E8
    ld   [hl], a                                  ; $7276: $77
    jp   IncrementEntityState                     ; $7277: $C3 $12 $3B

.jr_727A
    ld   e, a                                     ; $727A: $5F
    ldh  a, [hFrameCounter]                       ; $727B: $F0 $E7
    and  $03                                      ; $727D: $E6 $03
    jr   nz, ret_019_729A                         ; $727F: $20 $19

    call GetRandomByte                            ; $7281: $CD $0D $28
    and  $01                                      ; $7284: $E6 $01
    jr   nz, ret_019_729A                         ; $7286: $20 $12

    ld   a, e                                     ; $7288: $7B
    rra                                           ; $7289: $1F
    rra                                           ; $728A: $1F
    rra                                           ; $728B: $1F
    rra                                           ; $728C: $1F
    and  $0F                                      ; $728D: $E6 $0F
    and  a                                        ; $728F: $A7
    jr   nz, .jr_7294                             ; $7290: $20 $02

    ld   a, $01                                   ; $7292: $3E $01

.jr_7294
    add  [hl]                                     ; $7294: $86
    ld   [hl], a                                  ; $7295: $77
    ld   a, WAVE_SFX_HEART_PICKED_UP              ; $7296: $3E $06
    ldh  [hWaveSfx], a                            ; $7298: $E0 $F3

ret_019_729A:
    ret                                           ; $729A: $C9

SeashellMansionState3Handler::
    ld   a, $02                                   ; $729B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $729D: $E0 $A1
    ld   [wC167], a                               ; $729F: $EA $67 $C1
    ld   a, [wSeashellsCount]                     ; $72A2: $FA $0F $DB
    cp   $20                                      ; $72A5: $FE $20
    jr   c, jr_019_72C9                           ; $72A7: $38 $20

    call GetEntityTransitionCountdown             ; $72A9: $CD $05 $0C

; Sea shell mansion music player
.jr_72AC
    ld   [hl], $40                                ; $72AC: $36 $40
    call IncrementEntityState                     ; $72AE: $CD $12 $3B
    call func_019_7921                            ; $72B1: $CD $21 $79
    ld   hl, wEntitiesPrivateState2Table          ; $72B4: $21 $C0 $C2
    add  hl, bc                                   ; $72B7: $09
    ld   [hl], $01                                ; $72B8: $36 $01
    ld   a, MUSIC_L2_SWORD                        ; $72BA: $3E $56
    ld   [wMusicTrackToPlay], a                   ; $72BC: $EA $68 $D3

label_019_72BF:
    xor  a                                        ; $72BF: $AF
    ld   [wC167], a                               ; $72C0: $EA $67 $C1
    call GetEntityPrivateCountdown1               ; $72C3: $CD $00 $0C
    ld   [hl], $3F                                ; $72C6: $36 $3F
    ret                                           ; $72C8: $C9

jr_019_72C9:
    ld   hl, wIndoorBRoomStatus + $E9             ; $72C9: $21 $E9 $DA
    cp   $05                                      ; $72CC: $FE $05
    jr   nz, .jr_72E0                             ; $72CE: $20 $10

    bit  5, [hl]                                  ; $72D0: $CB $6E
    jr   nz, jr_019_72F4                          ; $72D2: $20 $20

    call IncrementEntityState                     ; $72D4: $CD $12 $3B
    ld   [hl], $06                                ; $72D7: $36 $06
    ld   a, JINGLE_DUNGEON_OPENED                 ; $72D9: $3E $23
    ldh  [hJingle], a                             ; $72DB: $E0 $F2
    jp   label_019_72BF                           ; $72DD: $C3 $BF $72

.jr_72E0
    cp   $10                                      ; $72E0: $FE $10
    jr   nz, jr_019_72F4                          ; $72E2: $20 $10

    bit  6, [hl]                                  ; $72E4: $CB $76
    jr   nz, jr_019_72F4                          ; $72E6: $20 $0C

    call IncrementEntityState                     ; $72E8: $CD $12 $3B
    ld   [hl], $06                                ; $72EB: $36 $06
    ld   a, JINGLE_DUNGEON_OPENED                 ; $72ED: $3E $23
    ldh  [hJingle], a                             ; $72EF: $E0 $F2
    jp   label_019_72BF                           ; $72F1: $C3 $BF $72

jr_019_72F4:
    ld   a, JINGLE_WRONG_ANSWER                   ; $72F4: $3E $1D
    ldh  [hJingle], a                             ; $72F6: $E0 $F2
    call IncrementEntityState                     ; $72F8: $CD $12 $3B
    ld   [hl], $05                                ; $72FB: $36 $05
    call GetEntityPrivateCountdown1               ; $72FD: $CD $00 $0C
    ld   [hl], $3F                                ; $7300: $36 $3F
    xor  a                                        ; $7302: $AF
    ld   [wC167], a                               ; $7303: $EA $67 $C1
    ret                                           ; $7306: $C9

SeashellMansionState4Handler::
    ld   a, $02                                   ; $7307: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7309: $E0 $A1
    ld   [wC167], a                               ; $730B: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $730E: $CD $05 $0C
    cp   $3E                                      ; $7311: $FE $3E
    jr   nz, .jr_731A                             ; $7313: $20 $05

    ld   hl, hJingle                              ; $7315: $21 $F2 $FF
    ld   [hl], JINGLE_DUNGEON_OPENED              ; $7318: $36 $23

.jr_731A
    and  a                                        ; $731A: $A7
    jr   nz, .ret_7327                            ; $731B: $20 $0A

    call_open_dialog Dialog17B                    ; $731D
    call IncrementEntityState                     ; $7322: $CD $12 $3B
    ld   [hl], $08                                ; $7325: $36 $08

.ret_7327
    ret                                           ; $7327: $C9

SeashellMansionState5Handler::
    call GetEntityPrivateCountdown1               ; $7328: $CD $00 $0C
    ret  nz                                       ; $732B: $C0

    call_open_dialog Dialog17A                    ; $732C
    call IncrementEntityState                     ; $7331: $CD $12 $3B
    ld   [hl], $07                                ; $7334: $36 $07
    ret                                           ; $7336: $C9

SeashellMansionState6Handler::
    call GetEntityPrivateCountdown1               ; $7337: $CD $00 $0C
    jr   nz, .ret_7373                            ; $733A: $20 $37

    call IncrementEntityState                     ; $733C: $CD $12 $3B
    ld   a, ENTITY_SEASHELL_MANSION               ; $733F: $3E $CF
    call SpawnNewEntity_trampoline                ; $7341: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $7344: $21 $00 $C2
    add  hl, de                                   ; $7347: $19
    ld   [hl], $50                                ; $7348: $36 $50
    ld   hl, wEntitiesPosYTable                   ; $734A: $21 $10 $C2
    add  hl, de                                   ; $734D: $19
    ld   [hl], $48                                ; $734E: $36 $48
    ld   hl, wEntitiesPrivateState1Table          ; $7350: $21 $B0 $C2
    add  hl, de                                   ; $7353: $19
    ld   [hl], $02                                ; $7354: $36 $02
    ld   hl, wEntitiesTransitionCountdownTable    ; $7356: $21 $E0 $C2
    add  hl, de                                   ; $7359: $19
    ld   [hl], $14                                ; $735A: $36 $14
    ld   a, ENTITY_BOMB                           ; $735C: $3E $02
    call SpawnNewEntity_trampoline                ; $735E: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $7361: $21 $00 $C2
    add  hl, de                                   ; $7364: $19
    ld   [hl], $50                                ; $7365: $36 $50
    ld   hl, wEntitiesPosYTable                   ; $7367: $21 $10 $C2
    add  hl, de                                   ; $736A: $19
    ld   [hl], $48                                ; $736B: $36 $48
    ld   hl, wEntitiesTransitionCountdownTable    ; $736D: $21 $E0 $C2
    add  hl, de                                   ; $7370: $19
    ld   [hl], $20                                ; $7371: $36 $20

.ret_7373
    ret                                           ; $7373: $C9

SeashellMansionState7Handler::
    ret                                           ; $7374: $C9

SeashellMansionState8Handler::
    ld   a, [wDialogState]                        ; $7375: $FA $9F $C1
    and  a                                        ; $7378: $A7
    ret  nz                                       ; $7379: $C0

    call GetEntityPrivateCountdown1               ; $737A: $CD $00 $0C
    ld   [hl], $20                                ; $737D: $36 $20
    jp   IncrementEntityState                     ; $737F: $C3 $12 $3B

SeashellMansionState9Handler::
    call GetEntityPrivateCountdown1               ; $7382: $CD $00 $0C
    ret  nz                                       ; $7385: $C0

    ld   a, ENTITY_SEASHELL_MANSION               ; $7386: $3E $CF
    call SpawnNewEntity_trampoline                ; $7388: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $738B: $21 $00 $C2
    add  hl, de                                   ; $738E: $19
    ld   [hl], $50                                ; $738F: $36 $50
    ld   hl, wEntitiesPosYTable                   ; $7391: $21 $10 $C2
    add  hl, de                                   ; $7394: $19
    ld   [hl], $48                                ; $7395: $36 $48
    ld   hl, wEntitiesPrivateState1Table          ; $7397: $21 $B0 $C2
    add  hl, de                                   ; $739A: $19
    ld   [hl], $01                                ; $739B: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $739D: $21 $E0 $C2
    add  hl, de                                   ; $73A0: $19
    ld   [hl], $4F                                ; $73A1: $36 $4F
    call IncrementEntityState                     ; $73A3: $CD $12 $3B
    ld   [hl], $07                                ; $73A6: $36 $07
    ret                                           ; $73A8: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown070SpriteVariants::
.variant0
    db $50, $00
    db $50, $20

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown071SpriteVariants::
.variant0
    db $3C, $00
    db $3C, $20
.variant1
    db $3A, $00
    db $3A, $20
.variant2
    db $1E, $00
    db $1E, $60
.variant3
    db $1E, $10
    db $1E, $70

func_019_73BD::
    ld   hl, wEntitiesPrivateState2Table          ; $73BD: $21 $C0 $C2
    add  hl, bc                                   ; $73C0: $09
    ld   a, [hl]                                  ; $73C1: $7E
    and  a                                        ; $73C2: $A7
    jr   nz, jr_019_73EE                          ; $73C3: $20 $29

    ld   a, $88                                   ; $73C5: $3E $88
    ldh  [hActiveEntityPosX], a                   ; $73C7: $E0 $EE
    ld   a, $80                                   ; $73C9: $3E $80
    ldh  [hActiveEntityVisualPosY], a             ; $73CB: $E0 $EC
    ld   de, Unknown070SpriteVariants             ; $73CD: $11 $A9 $73
    call RenderActiveEntitySpritesPair            ; $73D0: $CD $C0 $3B
    ld   hl, wEntitiesInertiaTable                ; $73D3: $21 $D0 $C3
    add  hl, bc                                   ; $73D6: $09
    ld   a, [hl]                                  ; $73D7: $7E
    ld   e, a                                     ; $73D8: $5F
    ld   a, $80                                   ; $73D9: $3E $80
    sub  e                                        ; $73DB: $93
    ldh  [hActiveEntityVisualPosY], a             ; $73DC: $E0 $EC

jr_019_73DE:
    ld   de, Unknown070SpriteVariants             ; $73DE: $11 $A9 $73
    call RenderActiveEntitySpritesPair            ; $73E1: $CD $C0 $3B
    ldh  a, [hActiveEntityVisualPosY]             ; $73E4: $F0 $EC
    add  $10                                      ; $73E6: $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $73E8: $E0 $EC

.jr_73EA
    cp   $80                                      ; $73EA: $FE $80

.jr_73EC
    jr   c, jr_019_73DE                           ; $73EC: $38 $F0

jr_019_73EE:
    call GetEntityPrivateCountdown1               ; $73EE: $CD $00 $0C
    ret  z                                        ; $73F1: $C8

    rra                                           ; $73F2: $1F
    rra                                           ; $73F3: $1F
    rra                                           ; $73F4: $1F
    and  $03                                      ; $73F5: $E6 $03
    ldh  [hActiveEntitySpriteVariant], a          ; $73F7: $E0 $F1
    ld   hl, wEntitiesInertiaTable                ; $73F9: $21 $D0 $C3
    add  hl, bc                                   ; $73FC: $09
    ld   a, [hl]                                  ; $73FD: $7E
    ld   e, a                                     ; $73FE: $5F
    ld   a, $80                                   ; $73FF: $3E $80
    sub  e                                        ; $7401: $93
    ldh  [hActiveEntityVisualPosY], a             ; $7402: $E0 $EC
    ld   a, $78                                   ; $7404: $3E $78
    ldh  [hActiveEntityPosX], a                   ; $7406: $E0 $EE
    ld   de, Unknown071SpriteVariants             ; $7408: $11 $AD $73
    call RenderActiveEntitySpritesPair            ; $740B: $CD $C0 $3B
    ld   a, $98                                   ; $740E: $3E $98
    ldh  [hActiveEntityPosX], a                   ; $7410: $E0 $EE
    ld   de, Unknown071SpriteVariants             ; $7412: $11 $AD $73
    jp   RenderActiveEntitySpritesPair            ; $7415: $C3 $C0 $3B

Data_019_7418::
    db   $D8, $E8, $7C, $40, $D8, $F0, $7C, $20, $E8, $E8, $7C, $00, $E8, $F0, $7C, $60
    db   $F8, $F8, $7C, $00, $F8, $00, $7C, $60, $08, $08, $7C, $00, $08, $10, $7C, $60
    db   $18, $18, $7C, $00, $18, $20, $7C, $60, $28, $18, $7C, $40, $28, $20, $7C, $20
    db   $D8, $F8, $7C, $00, $D8, $00, $7C, $60, $E8, $08, $7C, $00, $E8, $10, $7C, $60
    db   $F8, $08, $7C, $40, $F8, $10, $7C, $20, $08, $F8, $7C, $40, $08, $00, $7C, $20
    db   $18, $F8, $7C, $00, $18, $00, $7C, $60, $28, $08, $7C, $00, $28, $10, $7C, $60
    db   $D8, $08, $7C, $40, $D8, $10, $7C, $20, $E8, $F8, $7C, $40, $E8, $00, $7C, $20
    db   $F8, $F8, $7C, $00, $F8, $00, $7C, $60, $08, $08, $7C, $00, $08, $10, $7C, $60
    db   $18, $08, $7C, $40, $18, $10, $7C, $20, $28, $F8, $7C, $40, $28, $00, $7C, $20
    db   $D8, $18, $7C, $00, $D8, $20, $7C, $60, $E8, $18, $7C, $40, $E8, $20, $7C, $20
    db   $F8, $08, $7C, $40, $F8, $10, $7C, $20, $08, $F8, $7C, $40, $08, $00, $7C, $20
    db   $18, $E8, $7C, $40, $18, $F0, $7C, $20, $28, $E8, $7C, $00, $28, $F0, $7C, $60

label_019_74D8:
    ldh  a, [hActiveEntityState]                  ; $74D8: $F0 $F0
    JP_TABLE                                      ; $74DA
._00 dw func_019_74EB                             ; $74DB
._01 dw func_019_7511                             ; $74DD
._02 dw func_019_756F                             ; $74DF
._03 dw func_019_7640                             ; $74E1
._04 dw func_019_767B                             ; $74E3
._05 dw func_019_76B1                             ; $74E5
._06 dw func_019_76CB                             ; $74E7
._07 dw func_019_7744                             ; $74E9

func_019_74EB::
    ld   a, $02                                   ; $74EB: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $74ED: $E0 $A1
    ld   [wC167], a                               ; $74EF: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $74F2: $CD $05 $0C
    jr   z, jr_019_7509                           ; $74F5: $28 $12

    cp   $30                                      ; $74F7: $FE $30

.jr_74F9
    ret  c                                        ; $74F9: $D8

    sub  $30                                      ; $74FA: $D6 $30
    rra                                           ; $74FC: $1F
    rra                                           ; $74FD: $1F
    rra                                           ; $74FE: $1F
    and  $03                                      ; $74FF: $E6 $03
    ldh  [hActiveEntitySpriteVariant], a          ; $7501: $E0 $F1
    ld   de, Unknown071SpriteVariants             ; $7503: $11 $AD $73
    jp   RenderActiveEntitySpritesPair            ; $7506: $C3 $C0 $3B

jr_019_7509:
    call GetEntityTransitionCountdown             ; $7509: $CD $05 $0C
    ld   [hl], $A0                                ; $750C: $36 $A0
    jp   IncrementEntityState                     ; $750E: $C3 $12 $3B

func_019_7511::
    ld   a, $02                                   ; $7511: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7513: $E0 $A1
    ld   [wC167], a                               ; $7515: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $7518: $CD $05 $0C
    jr   nz, func_019_7526                        ; $751B: $20 $09

    ld   [hl], $FF                                ; $751D: $36 $FF
    ld   a, WAVE_SFX_L2_SWORD_APPEAR              ; $751F: $3E $1E
    ldh  [hWaveSfx], a                            ; $7521: $E0 $F3
    call IncrementEntityState                     ; $7523: $CD $12 $3B

func_019_7526::
    call GetEntityTransitionCountdown             ; $7526: $CD $05 $0C
    and  $04                                      ; $7529: $E6 $04

.jr_752B
    ld   e, $E4                                   ; $752B: $1E $E4
    jr   z, .jr_7531                              ; $752D: $28 $02

    ld   e, $84                                   ; $752F: $1E $84

.jr_7531
    ld   a, e                                     ; $7531: $7B
    ld   [wBGPalette], a                          ; $7532: $EA $97 $DB
    ldh  a, [hFrameCounter]                       ; $7535: $F0 $E7
    and  $07                                      ; $7537: $E6 $07
    jr   nz, .jr_7547                             ; $7539: $20 $0C

    ld   a, NOISE_SFX_L2_SWORD_SPARKS             ; $753B: $3E $33
    ldh  [hNoiseSfx], a                           ; $753D: $E0 $F4
    call GetRandomByte                            ; $753F: $CD $0D $28
    and  $03                                      ; $7542: $E6 $03
    call SetEntitySpriteVariant                   ; $7544: $CD $0C $3B

.jr_7547
    ldh  a, [hFrameCounter]                       ; $7547: $F0 $E7
    ld   hl, wEntitiesFlashCountdownTable         ; $7549: $21 $20 $C4
    add  hl, bc                                   ; $754C: $09
    ld   [hl], a                                  ; $754D: $77
    ldh  a, [hActiveEntitySpriteVariant]          ; $754E: $F0 $F1
    rla                                           ; $7550: $17
    rla                                           ; $7551: $17
    rla                                           ; $7552: $17
    rla                                           ; $7553: $17
    and  $F0                                      ; $7554: $E6 $F0
    ld   e, a                                     ; $7556: $5F
    rla                                           ; $7557: $17
    and  $E0                                      ; $7558: $E6 $E0
    add  e                                        ; $755A: $83
    ld   e, a                                     ; $755B: $5F
    ld   d, b                                     ; $755C: $50
    ld   hl, Data_019_7418                        ; $755D: $21 $18 $74
    add  hl, de                                   ; $7560: $19
    ld   c, $0C                                   ; $7561: $0E $0C
    call RenderActiveEntitySpritesRect            ; $7563: $CD $E6 $3C
    ld   a, $0A                                   ; $7566: $3E $0A
    jp   func_015_7964_trampoline                 ; $7568: $C3 $A0 $3D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown072SpriteVariants::
.variant0
    db $7A, $00
    db $7A, $20

func_019_756F::
    ld   a, $02                                   ; $756F: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7571: $E0 $A1
    ld   [wC167], a                               ; $7573: $EA $67 $C1
    call func_019_7526                            ; $7576: $CD $26 $75
    call GetEntityTransitionCountdown             ; $7579: $CD $05 $0C
    jr   nz, .jr_7586                             ; $757C: $20 $08

    call GetEntityDropTimer                       ; $757E: $CD $FB $0B
    ld   [hl], $28                                ; $7581: $36 $28
    jp   IncrementEntityState                     ; $7583: $C3 $12 $3B

.jr_7586
    cp   $50                                      ; $7586: $FE $50
    jr   nc, .jr_7597                             ; $7588: $30 $0D

    ld   hl, Data_019_7620                        ; $758A: $21 $20 $76
    ld   c, $08                                   ; $758D: $0E $08
    call RenderActiveEntitySpritesRect            ; $758F: $CD $E6 $3C
    ld   a, $06                                   ; $7592: $3E $06
    jp   func_015_7964_trampoline                 ; $7594: $C3 $A0 $3D

.jr_7597
    xor  a                                        ; $7597: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $7598: $E0 $F1
    ld   de, Unknown072SpriteVariants             ; $759A: $11 $6B $75
    jp   RenderActiveEntitySpritesPair            ; $759D: $C3 $C0 $3B

Data_019_75A0::
    db   $F8, $00, $6E, $00, $F8, $08, $6E, $20, $F8, $00, $6E, $00, $F8, $08, $6E, $20
    db   $08, $00, $70, $00, $08, $08, $70, $20, $08, $00, $70, $00, $08, $08, $70, $20
    db   $F8, $F8, $68, $00, $F8, $00, $6A, $00, $F8, $08, $6A, $20, $F8, $10, $68, $20
    db   $08, $00, $6C, $00, $08, $08, $6C, $20, $08, $00, $6C, $00, $08, $08, $6C, $20
    db   $F8, $F8, $62, $00, $F8, $00, $64, $00, $F8, $08, $64, $20, $F8, $10, $62, $20
    db   $08, $00, $66, $00, $08, $08, $66, $20, $08, $00, $66, $00, $08, $08, $66, $20
    db   $F8, $F8, $5A, $00, $F8, $00, $5C, $00, $F8, $08, $5C, $20, $F8, $10, $5A, $20
    db   $08, $F8, $5E, $00, $08, $00, $60, $00, $08, $08, $60, $20, $08, $10, $5E, $20

Data_019_7620::
    db   $F8, $F8, $56, $00, $F8, $00, $58, $00, $F8, $08, $58, $20, $F8, $10, $56, $20
    db   $08, $F8, $56, $40, $08, $00, $58, $40, $08, $08, $58, $60, $08, $10, $56, $60

func_019_7640::
    ld   a, $02                                   ; $7640: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7642: $E0 $A1
    ld   [wC167], a                               ; $7644: $EA $67 $C1
    ldh  a, [hFrameCounter]                       ; $7647: $F0 $E7
    and  $0F                                      ; $7649: $E6 $0F
    or   $20                                      ; $764B: $F6 $20
    ld   hl, wEntitiesFlashCountdownTable         ; $764D: $21 $20 $C4
    add  hl, bc                                   ; $7650: $09
    ld   [hl], a                                  ; $7651: $77
    call GetEntityDropTimer                       ; $7652: $CD $FB $0B
    jr   nz, .jr_765A                             ; $7655: $20 $03

    jp   IncrementEntityState                     ; $7657: $C3 $12 $3B

.jr_765A
    rra                                           ; $765A: $1F
    rra                                           ; $765B: $1F
    and  $0F                                      ; $765C: $E6 $0F
    cp   $04                                      ; $765E: $FE $04
    jr   c, .jr_7664                              ; $7660: $38 $02

    ld   a, $04                                   ; $7662: $3E $04

.jr_7664
    rla                                           ; $7664: $17
    rla                                           ; $7665: $17
    rla                                           ; $7666: $17
    rla                                           ; $7667: $17
    rla                                           ; $7668: $17
    and  $E0                                      ; $7669: $E6 $E0
    ld   e, a                                     ; $766B: $5F
    ld   d, b                                     ; $766C: $50
    ld   hl, Data_019_75A0                        ; $766D: $21 $A0 $75
    add  hl, de                                   ; $7670: $19
    ld   c, $08                                   ; $7671: $0E $08
    call RenderActiveEntitySpritesRect            ; $7673: $CD $E6 $3C
    ld   a, $06                                   ; $7676: $3E $06
    jp   func_015_7964_trampoline                 ; $7678: $C3 $A0 $3D

func_019_767B::
    ld   a, $02                                   ; $767B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $767D: $E0 $A1
    ld   [wC167], a                               ; $767F: $EA $67 $C1
    call func_019_78F1                            ; $7682: $CD $F1 $78
    call UpdateEntityYPosWithSpeed_19             ; $7685: $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                 ; $7688: $21 $50 $C2
    add  hl, bc                                   ; $768B: $09
    inc  [hl]                                     ; $768C: $34
    ld   a, [hl]                                  ; $768D: $7E
    and  $80                                      ; $768E: $E6 $80
    jr   nz, .ret_76B0                            ; $7690: $20 $1E

    ld   hl, wEntitiesPosYTable                   ; $7692: $21 $10 $C2
    add  hl, bc                                   ; $7695: $09
    ld   a, [hl]                                  ; $7696: $7E
    cp   $70                                      ; $7697: $FE $70
    jr   c, .ret_76B0                             ; $7699: $38 $15

    ld   [hl], $70                                ; $769B: $36 $70
    ld   a, NOISE_SFX_CLINK                       ; $769D: $3E $17
    ldh  [hNoiseSfx], a                           ; $769F: $E0 $F4
    ld   hl, wEntitiesSpeedYTable                 ; $76A1: $21 $50 $C2
    add  hl, bc                                   ; $76A4: $09
    ld   a, [hl]                                  ; $76A5: $7E
    cp   $04                                      ; $76A6: $FE $04
    jp   c, IncrementEntityState                  ; $76A8: $DA $12 $3B

    cpl                                           ; $76AB: $2F
    inc  a                                        ; $76AC: $3C
    sra  a                                        ; $76AD: $CB $2F
    ld   [hl], a                                  ; $76AF: $77

.ret_76B0
    ret                                           ; $76B0: $C9

func_019_76B1::
    xor  a                                        ; $76B1: $AF
    ld   [wC167], a                               ; $76B2: $EA $67 $C1
    call func_019_78F1                            ; $76B5: $CD $F1 $78
    call CheckLinkCollisionWithEnemy_trampoline   ; $76B8: $CD $5A $3B
    jr   nc, .ret_76CA                            ; $76BB: $30 $0D

    call IncrementEntityState                     ; $76BD: $CD $12 $3B
    ld   a, MUSIC_OBTAIN_SWORD                    ; $76C0: $3E $0F
    ld   [wMusicTrackToPlay], a                   ; $76C2: $EA $68 $D3
    call GetEntityTransitionCountdown             ; $76C5: $CD $05 $0C
    ld   [hl], $FF                                ; $76C8: $36 $FF

.ret_76CA
    ret                                           ; $76CA: $C9

func_019_76CB::
    call GetEntityTransitionCountdown             ; $76CB: $CD $05 $0C
    and  $08                                      ; $76CE: $E6 $08
    ld   e, $E4                                   ; $76D0: $1E $E4
    jr   z, .jr_76D6                              ; $76D2: $28 $02

    ld   e, $84                                   ; $76D4: $1E $84

; Sea shell house LVL 2 sword awarding script?
.jr_76D6
    ld   a, e                                     ; $76D6: $7B
    ld   [wBGPalette], a                          ; $76D7: $EA $97 $DB
    call GetEntityTransitionCountdown             ; $76DA: $CD $05 $0C
    jr   nz, .jr_7709                             ; $76DD: $20 $2A

    ld   [hl], $20                                ; $76DF: $36 $20
    ld   a, MUSIC_OBTAIN_ITEM                     ; $76E1: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $76E3: $EA $68 $D3
    call_open_dialog Dialog09F                    ; $76E6
    ld   a, [wIndoorBRoomStatus + $E9]            ; $76EB: $FA $E9 $DA
    or   $10                                      ; $76EE: $F6 $10
    ld   [wIndoorBRoomStatus + $E9], a            ; $76F0: $EA $E9 $DA
    ldh  [hRoomStatus], a                         ; $76F3: $E0 $F8
    ld   a, $02                                   ; $76F5: $3E $02
    ld   [wSwordLevel], a                         ; $76F7: $EA $4E $DB
    ld   a, $FF                                   ; $76FA: $3E $FF
    ld   [wAddHealthBuffer], a                    ; $76FC: $EA $93 $DB
    xor  a                                        ; $76FF: $AF
    ld   [wSeashellsCount], a                     ; $7700: $EA $0F $DB
    ld   [wC167], a                               ; $7703: $EA $67 $C1
    call IncrementEntityState                     ; $7706: $CD $12 $3B

.jr_7709
    ldh  a, [hLinkPositionX]                      ; $7709: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $770B: $21 $00 $C2
    add  hl, bc                                   ; $770E: $09
    sub  $04                                      ; $770F: $D6 $04
    ld   [hl], a                                  ; $7711: $77
    ldh  a, [hLinkPositionY]                      ; $7712: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7714: $21 $10 $C2
    add  hl, bc                                   ; $7717: $09
    sub  $13                                      ; $7718: $D6 $13
    ld   [hl], a                                  ; $771A: $77
    call CopyEntityPositionToActivePosition       ; $771B: $CD $8A $3D
    ldh  a, [hLinkPositionZ]                      ; $771E: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $7720: $21 $10 $C3
    add  hl, bc                                   ; $7723: $09
    ld   [hl], a                                  ; $7724: $77
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6B       ; $7725: $3E $6B
    ldh  [hLinkAnimationState], a                 ; $7727: $E0 $9D
    ld   a, $02                                   ; $7729: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $772B: $E0 $A1
    ld   a, $03                                   ; $772D: $3E $03
    ldh  [hLinkDirection], a                      ; $772F: $E0 $9E
    ; reset sword parameter
    xor  a                                        ; $7731: $AF
    ld   [wSwordAnimationState], a                ; $7732: $EA $37 $C1
    ld   [wC16A], a                               ; $7735: $EA $6A $C1
    ld   [wSwordCharge], a                        ; $7738: $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ; $773B: $EA $21 $C1
    call func_019_784F                            ; $773E: $CD $4F $78
    jp   func_019_78EC                            ; $7741: $C3 $EC $78

func_019_7744::
    call func_019_78EC                            ; $7744: $CD $EC $78
    ld   a, [wDialogState]                        ; $7747: $FA $9F $C1
    and  a                                        ; $774A: $A7
    ret  nz                                       ; $774B: $C0

    jp   ClearEntityStatus_19                     ; $774C: $C3 $61 $7E

Data_019_774F::
    db   $00, $04, $72, $00, $E0, $04, $72, $00   ; $774F
    db   $00, $F0, $78, $20, $00, $F8, $78, $40   ; $7757
    db   $00, $10, $78, $60, $00, $18, $78, $00   ; $775F
    db   $F0, $E8, $76, $20, $F0, $F0, $76, $40   ; $7767
    db   $F0, $18, $76, $60, $F0, $20, $76, $00   ; $776F
    db   $E8, $F4, $74, $20, $E8, $14, $74, $00   ; $7777

Data_019_777F::
    db   $F8, $04, $72, $00, $D8, $04, $72, $00   ; $777F
    db   $FC, $E8, $78, $20, $FC, $F0, $78, $40   ; $7787
    db   $FC, $18, $78, $60, $FC, $20, $78, $00   ; $778F
    db   $E8, $E0, $76, $20, $E8, $E8, $76, $40   ; $7797
    db   $E8, $20, $76, $60, $E8, $28, $76, $00   ; $779F
    db   $E0, $F0, $74, $20, $E0, $18, $74, $00   ; $77A7
    db   $00, $00, $74, $20, $00, $08, $74, $00   ; $77AF

Data_019_77B7::
    db   $F0, $04, $72, $00, $D0, $04, $72, $00   ; $77B7
    db   $F8, $E0, $78, $20, $F8, $E8, $78, $40   ; $77BF
    db   $F8, $20, $78, $60, $F8, $28, $78, $00   ; $77C7
    db   $E0, $D8, $76, $20, $E0, $E0, $76, $40   ; $77CF
    db   $E0, $28, $76, $60, $E0, $30, $76, $00   ; $77D7
    db   $D8, $EC, $74, $20, $D8, $1C, $74, $00   ; $77DF
    db   $F8, $FC, $74, $20, $F8, $0C, $74, $00   ; $77E7
    db   $00, $F8, $76, $20, $00, $00, $76, $40   ; $77EF
    db   $00, $08, $76, $60, $00, $10, $76, $00   ; $77F7

Data_019_77FF::
    db   $E4, $04, $72, $00, $00, $F8, $78, $20   ; $77FF
    db   $00, $00, $78, $40, $00, $08, $78, $60   ; $7807
    db   $00, $10, $78, $00, $F4, $F0, $76, $20   ; $780F
    db   $F4, $F8, $76, $40, $F4, $10, $76, $60   ; $7817
    db   $F4, $18, $76, $00, $EC, $F8, $74, $20   ; $781F
    db   $EC, $10, $74, $00, $F0, $D8, $78, $20   ; $7827
    db   $F0, $E0, $78, $40, $F0, $28, $78, $60   ; $782F
    db   $F0, $30, $78, $00, $CC, $E8, $74, $20   ; $7837
    db   $CC, $20, $74, $00                       ; $783F

Data_019_7843::
    dw   Data_019_774F
    dw   Data_019_777F
    dw   Data_019_77B7
    dw   Data_019_77FF

Data_019_784B::
    db   $0C, $0E, $12, $11

func_019_784F::
    ldh  a, [hActiveEntityVisualPosY]             ; $784F: $F0 $EC
    sub  $00                                      ; $7851: $D6 $00
    ldh  [hActiveEntityVisualPosY], a             ; $7853: $E0 $EC
    ldh  a, [hFrameCounter]                       ; $7855: $F0 $E7
    rra                                           ; $7857: $1F
    rra                                           ; $7858: $1F
    nop                                           ; $7859: $00
    push af                                       ; $785A: $F5
    and  $03                                      ; $785B: $E6 $03
    ld   e, a                                     ; $785D: $5F
    ld   d, b                                     ; $785E: $50
    ld   hl, Data_019_784B                        ; $785F: $21 $4B $78
    add  hl, de                                   ; $7862: $19
    ld   c, [hl]                                  ; $7863: $4E
    pop  af                                       ; $7864: $F1
    rla                                           ; $7865: $17
    and  $06                                      ; $7866: $E6 $06
    ld   e, a                                     ; $7868: $5F
    ld   d, b                                     ; $7869: $50
    ld   hl, Data_019_7843                        ; $786A: $21 $43 $78
    add  hl, de                                   ; $786D: $19
    ld   a, [hl+]                                 ; $786E: $2A
    ld   h, [hl]                                  ; $786F: $66
    ld   l, a                                     ; $7870: $6F
    call RenderActiveEntitySpritesRect            ; $7871: $CD $E6 $3C
    ld   a, $10                                   ; $7874: $3E $10
    jp   func_015_7964_trampoline                 ; $7876: $C3 $A0 $3D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown073SpriteVariants::
.variant0
    db $7E, $00
    db $7E, $20

func_019_787D::
    call GetEntityTransitionCountdown
    ret  nz                                       ; $7880: $C0

    ld   de, Unknown073SpriteVariants             ; $7881: $11 $79 $78
    call RenderActiveEntitySpritesPair            ; $7884: $CD $C0 $3B
    call UpdateEntityYPosWithSpeed_19             ; $7887: $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                 ; $788A: $21 $50 $C2
    add  hl, bc                                   ; $788D: $09
    inc  [hl]                                     ; $788E: $34
    ld   a, [hl]                                  ; $788F: $7E
    and  $80                                      ; $7890: $E6 $80
    jr   nz, ret_019_78CB                         ; $7892: $20 $37

    ld   hl, wEntitiesPosYTable                   ; $7894: $21 $10 $C2
    add  hl, bc                                   ; $7897: $09

.jr_7898
    ld   a, [hl]                                  ; $7898: $7E
    cp   $70                                      ; $7899: $FE $70
    jr   c, ret_019_78CB                          ; $789B: $38 $2E

    ld   [hl], $70                                ; $789D: $36 $70
    ld   hl, wEntitiesSpeedYTable                 ; $789F: $21 $50 $C2
    add  hl, bc                                   ; $78A2: $09
    ld   [hl], b                                  ; $78A3: $70
    call CheckLinkCollisionWithEnemy_trampoline   ; $78A4: $CD $5A $3B
    jr   nc, ret_019_78CB                         ; $78A7: $30 $22

    ld   a, WAVE_SFX_SEASHELL                     ; $78A9: $3E $01
    ldh  [hWaveSfx], a                            ; $78AB: $E0 $F3
    call ClearEntityStatus_19                     ; $78AD: $CD $61 $7E
    ld   hl, wIndoorBRoomStatus + $E9             ; $78B0: $21 $E9 $DA
    ld   a, [wSeashellsCount]                     ; $78B3: $FA $0F $DB

.jr_78B6
    cp   $05                                      ; $78B6: $FE $05
    jr   nz, .jr_78BE                             ; $78B8: $20 $04

    set  5, [hl]                                  ; $78BA: $CB $EE
    jr   jr_019_78C0                              ; $78BC: $18 $02

.jr_78BE
    set  6, [hl]                                  ; $78BE: $CB $F6

jr_019_78C0:
    add  $01                                      ; $78C0: $C6 $01
    daa                                           ; $78C2: $27
    ld   [wSeashellsCount], a                     ; $78C3: $EA $0F $DB
    call_open_dialog Dialog0EF                    ; $78C6

ret_019_78CB:
    ret                                           ; $78CB: $C9

Data_019_78CC::
    db   $F8, $00, $52, $00, $F8, $08, $52, $20, $08, $00, $54, $00, $08, $08, $54, $20

Data_019_78DC::
    db   $F8, $00, $54, $40, $F8, $08, $54, $60, $08, $00, $52, $40, $08, $08, $52, $60

func_019_78EC::
    ld   hl, Data_019_78DC                        ; $78EC: $21 $DC $78
    jr   jr_019_78F4                              ; $78EF: $18 $03

func_019_78F1::
    ld   hl, Data_019_78CC                        ; $78F1: $21 $CC $78

jr_019_78F4:
    ld   c, $04                                   ; $78F4: $0E $04
    call RenderActiveEntitySpritesRect            ; $78F6: $CD $E6 $3C
    ld   a, $02                                   ; $78F9: $3E $02
    jp   func_015_7964_trampoline                 ; $78FB: $C3 $A0 $3D

Data_019_78FE::
    db   $98, $50, $8D, $6C, $6E, $6C, $6E, $6C, $6E, $6C, $6E, $6C, $6E, $6C, $6E, $6C
    db   $6E, $98, $51, $8D, $6D, $6F, $6D, $6F, $6D, $6F, $6D, $6F, $6D, $6F, $6D, $6F
    db   $6D, $6F, $00

IF __PATCH_0__
Data_019_78FE_B:
    db   $98, $50, $CD, $00
    db   $98, $51, $CD, $00
    db   $00
.end
ENDC

func_019_7921::
    push bc                                       ; $7921: $C5
    ld   c, $23                                   ; $7922: $0E $23
    ld   a, $22                                   ; $7924: $3E $22
    ld   [wDrawCommandsSize], a                   ; $7926: $EA $00 $D6
    ld   hl, wDrawCommand                         ; $7929: $21 $01 $D6
    ld   de, Data_019_78FE                        ; $792C: $11 $FE $78

.loop_792F
    ld   a, [de]                                  ; $792F: $1A
    inc  de                                       ; $7930: $13
    ld   [hl+], a                                 ; $7931: $22
    dec  c                                        ; $7932: $0D
    jr   nz, .loop_792F                           ; $7933: $20 $FA

IF __PATCH_0__
    ld   c, Data_019_78FE_B.end - Data_019_78FE_B
    ld   a, $08
    ld   [wDrawCommandsAltSize], a
    ld   hl, wDrawCommandAlt
    ld   de, Data_019_78FE_B

.loop_7951
    ld   a, [de]
    inc  de
    ld   [hl+], a
    dec  c
    jr   nz, .loop_7951
ENDC

    pop  bc                                       ; $7935: $C1
    ld   a, $89                                   ; $7936: $3E $89
    ld   [wRoomObjects + $18], a                  ; $7938: $EA $29 $D7
    ld   [wRoomObjects + $28], a                  ; $793B: $EA $39 $D7
    ld   [wRoomObjects + $38], a                  ; $793E: $EA $49 $D7
    ld   [wRoomObjects + $48], a                  ; $7941: $EA $59 $D7
    ld   [wRoomObjects + $58], a                  ; $7944: $EA $69 $D7
    ld   [wRoomObjects + $68], a                  ; $7947: $EA $79 $D7
    ld   [wRoomObjects + $78], a                  ; $794A: $EA $89 $D7
    ret                                           ; $794D: $C9
