Data_019_7193::
    db   $00, $06, $0C, $13, $19, $20, $26, $2C, $33, $39, $00, $00, $00, $00, $00, $00
    db   $40, $43, $46, $49, $4C, $4F, $52, $55, $58, $5C, $00, $00, $00, $00, $00, $00
    db   $60, $60, $60, $60, $60, $60, $60, $60, $60

SeashellMansionEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 19:71BC $21 $B0 $C2
    add  hl, bc                                   ;; 19:71BF $09

.jr_71C0
    ld   a, [hl]                                  ;; 19:71C0 $7E
    cp   $02                                      ;; 19:71C1 $FE $02
    jp   z, func_019_787D                         ;; 19:71C3 $CA $7D $78

    and  a                                        ;; 19:71C6 $A7
    jp   nz, label_019_74D8                       ;; 19:71C7 $C2 $D8 $74

    ld   a, [wSeashellsCount]                     ;; 19:71CA $FA $0F $DB
    cp   $20                                      ;; 19:71CD $FE $20
    jr   z, jr_019_71FD                           ;; 19:71CF $28 $2C

    cp   $05                                      ;; 19:71D1 $FE $05
    jr   nc, jr_019_71FD                          ;; 19:71D3 $30 $28

    ld   hl, wEntitiesPrivateState5Table          ;; 19:71D5 $21 $90 $C3
    add  hl, bc                                   ;; 19:71D8 $09
    ld   a, [hl]                                  ;; 19:71D9 $7E
    and  $02                                      ;; 19:71DA $E6 $02
    jr   nz, jr_019_71FD                          ;; 19:71DC $20 $1F

    ldh  a, [hLinkPositionX]                      ;; 19:71DE $F0 $98
    cp   $18                                      ;; 19:71E0 $FE $18
    jr   c, jr_019_71FD                           ;; 19:71E2 $38 $19

    ld   a, [hl]                                  ;; 19:71E4 $7E
    and  a                                        ;; 19:71E5 $A7
    jr   nz, .jr_71F6                             ;; 19:71E6 $20 $0E

    ld   a, [wSwordLevel]                         ;; 19:71E8 $FA $4E $DB
    and  $02                                      ;; 19:71EB $E6 $02
    jr   nz, jr_019_71FD                          ;; 19:71ED $20 $0E

    call_open_dialog Dialog179                    ;; 19:71EF
    inc  [hl]                                     ;; 19:71F4 $34
    ret                                           ;; 19:71F5 $C9

.jr_71F6
    ld   a, [wDialogState]                        ;; 19:71F6 $FA $9F $C1
    and  a                                        ;; 19:71F9 $A7
    ret  nz                                       ;; 19:71FA $C0

    inc  [hl]                                     ;; 19:71FB $34
    ret                                           ;; 19:71FC $C9

jr_019_71FD:
    ldh  a, [hLinkPositionX]                      ;; 19:71FD $F0 $98
    cp   $38                                      ;; 19:71FF $FE $38
    jr   nc, .jr_7215                             ;; 19:7201 $30 $12

    cp   $20                                      ;; 19:7203 $FE $20
    jr   c, .jr_7215                              ;; 19:7205 $38 $0E

    ld   hl, wC11E                                ;; 19:7207 $21 $1E $C1
    set  7, [hl]                                  ;; 19:720A $CB $FE
    cp   $24                                      ;; 19:720C $FE $24
    jr   c, .jr_7215                              ;; 19:720E $38 $05

    ld   hl, wC11D                                ;; 19:7210 $21 $1D $C1
    set  7, [hl]                                  ;; 19:7213 $CB $FE

.jr_7215
    ld   a, [wSeashellsCount]                     ;; 19:7215 $FA $0F $DB
    and  a                                        ;; 19:7218 $A7
    ret  z                                        ;; 19:7219 $C8

    ld   e, a                                     ;; 19:721A $5F
    ld   d, b                                     ;; 19:721B $50
    ld   hl, Data_019_7193                        ;; 19:721C $21 $93 $71
    add  hl, de                                   ;; 19:721F $19
    ld   a, [hl]                                  ;; 19:7220 $7E
    ldh  [hMultiPurposeG], a                      ;; 19:7221 $E0 $E8
    ldh  a, [hRoomStatus]                         ;; 19:7223 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 19:7225 $E6 $10
    call func_019_73BD                            ;; 19:7227 $CD $BD $73
    ldh  a, [hActiveEntityState]                  ;; 19:722A $F0 $F0
    JP_TABLE                                      ;; 19:722C
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
    ldh  a, [hLinkPositionX]                      ;; 19:7241 $F0 $98
    cp   $3C                                      ;; 19:7243 $FE $3C
    jr   c, .ret_7255                             ;; 19:7245 $38 $0E

    call ClearLinkPositionIncrement               ;; 19:7247 $CD $8E $17
    call ResetSpinAttack                          ;; 19:724A $CD $AF $0C
    call IncrementEntityState                     ;; 19:724D $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 19:7250 $CD $05 $0C
    ld   [hl], $58                                ;; 19:7253 $36 $58

.ret_7255
    ret                                           ;; 19:7255 $C9

SeashellMansionState1Handler::
    ld   a, $01                                   ;; 19:7256 $3E $01
    ld   [wC167], a                               ;; 19:7258 $EA $67 $C1
    ld   a, [wIsLinkInTheAir]                     ;; 19:725B $FA $46 $C1
    and  a                                        ;; 19:725E $A7
    jp   z, IncrementEntityState                  ;; 19:725F $CA $12 $3B

    ret                                           ;; 19:7262 $C9

SeashellMansionState2Handler::
    ld   a, $02                                   ;; 19:7263 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:7265 $E0 $A1
    call GetEntityTransitionCountdown             ;; 19:7267 $CD $05 $0C
    ret  nz                                       ;; 19:726A $C0

    ld   hl, wEntitiesInertiaTable                ;; 19:726B $21 $D0 $C3
    add  hl, bc                                   ;; 19:726E $09
    ldh  a, [hMultiPurposeG]                      ;; 19:726F $F0 $E8
    sub  [hl]                                     ;; 19:7271 $96
    jr   nc, .jr_727A                             ;; 19:7272 $30 $06

    ldh  a, [hMultiPurposeG]                      ;; 19:7274 $F0 $E8
    ld   [hl], a                                  ;; 19:7276 $77
    jp   IncrementEntityState                     ;; 19:7277 $C3 $12 $3B

.jr_727A
    ld   e, a                                     ;; 19:727A $5F
    ldh  a, [hFrameCounter]                       ;; 19:727B $F0 $E7
    and  $03                                      ;; 19:727D $E6 $03
    jr   nz, ret_019_729A                         ;; 19:727F $20 $19

    call GetRandomByte                            ;; 19:7281 $CD $0D $28
    and  $01                                      ;; 19:7284 $E6 $01
    jr   nz, ret_019_729A                         ;; 19:7286 $20 $12

    ld   a, e                                     ;; 19:7288 $7B
    rra                                           ;; 19:7289 $1F
    rra                                           ;; 19:728A $1F
    rra                                           ;; 19:728B $1F
    rra                                           ;; 19:728C $1F
    and  $0F                                      ;; 19:728D $E6 $0F
    and  a                                        ;; 19:728F $A7
    jr   nz, .jr_7294                             ;; 19:7290 $20 $02

    ld   a, $01                                   ;; 19:7292 $3E $01

.jr_7294
    add  [hl]                                     ;; 19:7294 $86
    ld   [hl], a                                  ;; 19:7295 $77
    ld   a, WAVE_SFX_HEART_PICKED_UP              ;; 19:7296 $3E $06
    ldh  [hWaveSfx], a                            ;; 19:7298 $E0 $F3

ret_019_729A:
    ret                                           ;; 19:729A $C9

SeashellMansionState3Handler::
    ld   a, $02                                   ;; 19:729B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:729D $E0 $A1
    ld   [wC167], a                               ;; 19:729F $EA $67 $C1
    ld   a, [wSeashellsCount]                     ;; 19:72A2 $FA $0F $DB
    cp   $20                                      ;; 19:72A5 $FE $20
    jr   c, jr_019_72C9                           ;; 19:72A7 $38 $20

    call GetEntityTransitionCountdown             ;; 19:72A9 $CD $05 $0C

; Sea shell mansion music player
.jr_72AC
    ld   [hl], $40                                ;; 19:72AC $36 $40
    call IncrementEntityState                     ;; 19:72AE $CD $12 $3B
    call func_019_7921                            ;; 19:72B1 $CD $21 $79
    ld   hl, wEntitiesPrivateState2Table          ;; 19:72B4 $21 $C0 $C2
    add  hl, bc                                   ;; 19:72B7 $09
    ld   [hl], $01                                ;; 19:72B8 $36 $01
    ld   a, MUSIC_L2_SWORD                        ;; 19:72BA $3E $56
    ld   [wMusicTrackToPlay], a                   ;; 19:72BC $EA $68 $D3

label_019_72BF:
    xor  a                                        ;; 19:72BF $AF
    ld   [wC167], a                               ;; 19:72C0 $EA $67 $C1
    call GetEntityPrivateCountdown1               ;; 19:72C3 $CD $00 $0C
    ld   [hl], $3F                                ;; 19:72C6 $36 $3F
    ret                                           ;; 19:72C8 $C9

jr_019_72C9:
    ld   hl, wIndoorBRoomStatus + $E9             ;; 19:72C9 $21 $E9 $DA
    cp   $05                                      ;; 19:72CC $FE $05
    jr   nz, .jr_72E0                             ;; 19:72CE $20 $10

    bit  5, [hl]                                  ;; 19:72D0 $CB $6E
    jr   nz, jr_019_72F4                          ;; 19:72D2 $20 $20

    call IncrementEntityState                     ;; 19:72D4 $CD $12 $3B
    ld   [hl], $06                                ;; 19:72D7 $36 $06
    ld   a, JINGLE_DUNGEON_OPENED                 ;; 19:72D9 $3E $23
    ldh  [hJingle], a                             ;; 19:72DB $E0 $F2
    jp   label_019_72BF                           ;; 19:72DD $C3 $BF $72

.jr_72E0
    cp   $10                                      ;; 19:72E0 $FE $10
    jr   nz, jr_019_72F4                          ;; 19:72E2 $20 $10

    bit  6, [hl]                                  ;; 19:72E4 $CB $76
    jr   nz, jr_019_72F4                          ;; 19:72E6 $20 $0C

    call IncrementEntityState                     ;; 19:72E8 $CD $12 $3B
    ld   [hl], $06                                ;; 19:72EB $36 $06
    ld   a, JINGLE_DUNGEON_OPENED                 ;; 19:72ED $3E $23
    ldh  [hJingle], a                             ;; 19:72EF $E0 $F2
    jp   label_019_72BF                           ;; 19:72F1 $C3 $BF $72

jr_019_72F4:
    ld   a, JINGLE_WRONG_ANSWER                   ;; 19:72F4 $3E $1D
    ldh  [hJingle], a                             ;; 19:72F6 $E0 $F2
    call IncrementEntityState                     ;; 19:72F8 $CD $12 $3B
    ld   [hl], $05                                ;; 19:72FB $36 $05
    call GetEntityPrivateCountdown1               ;; 19:72FD $CD $00 $0C
    ld   [hl], $3F                                ;; 19:7300 $36 $3F
    xor  a                                        ;; 19:7302 $AF
    ld   [wC167], a                               ;; 19:7303 $EA $67 $C1
    ret                                           ;; 19:7306 $C9

SeashellMansionState4Handler::
    ld   a, $02                                   ;; 19:7307 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:7309 $E0 $A1
    ld   [wC167], a                               ;; 19:730B $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 19:730E $CD $05 $0C
    cp   $3E                                      ;; 19:7311 $FE $3E
    jr   nz, .jr_731A                             ;; 19:7313 $20 $05

    ld   hl, hJingle                              ;; 19:7315 $21 $F2 $FF
    ld   [hl], JINGLE_DUNGEON_OPENED              ;; 19:7318 $36 $23

.jr_731A
    and  a                                        ;; 19:731A $A7
    jr   nz, .ret_7327                            ;; 19:731B $20 $0A

    call_open_dialog Dialog17B                    ;; 19:731D
    call IncrementEntityState                     ;; 19:7322 $CD $12 $3B
    ld   [hl], $08                                ;; 19:7325 $36 $08

.ret_7327
    ret                                           ;; 19:7327 $C9

SeashellMansionState5Handler::
    call GetEntityPrivateCountdown1               ;; 19:7328 $CD $00 $0C
    ret  nz                                       ;; 19:732B $C0

    call_open_dialog Dialog17A                    ;; 19:732C
    call IncrementEntityState                     ;; 19:7331 $CD $12 $3B
    ld   [hl], $07                                ;; 19:7334 $36 $07
    ret                                           ;; 19:7336 $C9

SeashellMansionState6Handler::
    call GetEntityPrivateCountdown1               ;; 19:7337 $CD $00 $0C
    jr   nz, .ret_7373                            ;; 19:733A $20 $37

    call IncrementEntityState                     ;; 19:733C $CD $12 $3B
    ld   a, ENTITY_SEASHELL_MANSION               ;; 19:733F $3E $CF
    call SpawnNewEntity_trampoline                ;; 19:7341 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 19:7344 $21 $00 $C2
    add  hl, de                                   ;; 19:7347 $19
    ld   [hl], $50                                ;; 19:7348 $36 $50
    ld   hl, wEntitiesPosYTable                   ;; 19:734A $21 $10 $C2
    add  hl, de                                   ;; 19:734D $19
    ld   [hl], $48                                ;; 19:734E $36 $48
    ld   hl, wEntitiesPrivateState1Table          ;; 19:7350 $21 $B0 $C2
    add  hl, de                                   ;; 19:7353 $19
    ld   [hl], $02                                ;; 19:7354 $36 $02
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:7356 $21 $E0 $C2
    add  hl, de                                   ;; 19:7359 $19
    ld   [hl], $14                                ;; 19:735A $36 $14
    ld   a, ENTITY_BOMB                           ;; 19:735C $3E $02
    call SpawnNewEntity_trampoline                ;; 19:735E $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 19:7361 $21 $00 $C2
    add  hl, de                                   ;; 19:7364 $19
    ld   [hl], $50                                ;; 19:7365 $36 $50
    ld   hl, wEntitiesPosYTable                   ;; 19:7367 $21 $10 $C2
    add  hl, de                                   ;; 19:736A $19
    ld   [hl], $48                                ;; 19:736B $36 $48
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:736D $21 $E0 $C2
    add  hl, de                                   ;; 19:7370 $19
    ld   [hl], $20                                ;; 19:7371 $36 $20

.ret_7373
    ret                                           ;; 19:7373 $C9

SeashellMansionState7Handler::
    ret                                           ;; 19:7374 $C9

SeashellMansionState8Handler::
    ld   a, [wDialogState]                        ;; 19:7375 $FA $9F $C1
    and  a                                        ;; 19:7378 $A7
    ret  nz                                       ;; 19:7379 $C0

    call GetEntityPrivateCountdown1               ;; 19:737A $CD $00 $0C
    ld   [hl], $20                                ;; 19:737D $36 $20
    jp   IncrementEntityState                     ;; 19:737F $C3 $12 $3B

SeashellMansionState9Handler::
    call GetEntityPrivateCountdown1               ;; 19:7382 $CD $00 $0C
    ret  nz                                       ;; 19:7385 $C0

    ld   a, ENTITY_SEASHELL_MANSION               ;; 19:7386 $3E $CF
    call SpawnNewEntity_trampoline                ;; 19:7388 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 19:738B $21 $00 $C2
    add  hl, de                                   ;; 19:738E $19
    ld   [hl], $50                                ;; 19:738F $36 $50
    ld   hl, wEntitiesPosYTable                   ;; 19:7391 $21 $10 $C2
    add  hl, de                                   ;; 19:7394 $19
    ld   [hl], $48                                ;; 19:7395 $36 $48
    ld   hl, wEntitiesPrivateState1Table          ;; 19:7397 $21 $B0 $C2
    add  hl, de                                   ;; 19:739A $19
    ld   [hl], $01                                ;; 19:739B $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:739D $21 $E0 $C2
    add  hl, de                                   ;; 19:73A0 $19
    ld   [hl], $4F                                ;; 19:73A1 $36 $4F
    call IncrementEntityState                     ;; 19:73A3 $CD $12 $3B
    ld   [hl], $07                                ;; 19:73A6 $36 $07
    ret                                           ;; 19:73A8 $C9

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
    ld   hl, wEntitiesPrivateState2Table          ;; 19:73BD $21 $C0 $C2
    add  hl, bc                                   ;; 19:73C0 $09
    ld   a, [hl]                                  ;; 19:73C1 $7E
    and  a                                        ;; 19:73C2 $A7
    jr   nz, jr_019_73EE                          ;; 19:73C3 $20 $29

    ld   a, $88                                   ;; 19:73C5 $3E $88
    ldh  [hActiveEntityPosX], a                   ;; 19:73C7 $E0 $EE
    ld   a, $80                                   ;; 19:73C9 $3E $80
    ldh  [hActiveEntityVisualPosY], a             ;; 19:73CB $E0 $EC
    ld   de, Unknown070SpriteVariants             ;; 19:73CD $11 $A9 $73
    call RenderActiveEntitySpritesPair            ;; 19:73D0 $CD $C0 $3B
    ld   hl, wEntitiesInertiaTable                ;; 19:73D3 $21 $D0 $C3
    add  hl, bc                                   ;; 19:73D6 $09
    ld   a, [hl]                                  ;; 19:73D7 $7E
    ld   e, a                                     ;; 19:73D8 $5F
    ld   a, $80                                   ;; 19:73D9 $3E $80
    sub  e                                        ;; 19:73DB $93
    ldh  [hActiveEntityVisualPosY], a             ;; 19:73DC $E0 $EC

jr_019_73DE:
    ld   de, Unknown070SpriteVariants             ;; 19:73DE $11 $A9 $73
    call RenderActiveEntitySpritesPair            ;; 19:73E1 $CD $C0 $3B
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:73E4 $F0 $EC
    add  $10                                      ;; 19:73E6 $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ;; 19:73E8 $E0 $EC

.jr_73EA
    cp   $80                                      ;; 19:73EA $FE $80

.jr_73EC
    jr   c, jr_019_73DE                           ;; 19:73EC $38 $F0

jr_019_73EE:
    call GetEntityPrivateCountdown1               ;; 19:73EE $CD $00 $0C
    ret  z                                        ;; 19:73F1 $C8

    rra                                           ;; 19:73F2 $1F
    rra                                           ;; 19:73F3 $1F
    rra                                           ;; 19:73F4 $1F
    and  $03                                      ;; 19:73F5 $E6 $03
    ldh  [hActiveEntitySpriteVariant], a          ;; 19:73F7 $E0 $F1
    ld   hl, wEntitiesInertiaTable                ;; 19:73F9 $21 $D0 $C3
    add  hl, bc                                   ;; 19:73FC $09
    ld   a, [hl]                                  ;; 19:73FD $7E
    ld   e, a                                     ;; 19:73FE $5F
    ld   a, $80                                   ;; 19:73FF $3E $80
    sub  e                                        ;; 19:7401 $93
    ldh  [hActiveEntityVisualPosY], a             ;; 19:7402 $E0 $EC
    ld   a, $78                                   ;; 19:7404 $3E $78
    ldh  [hActiveEntityPosX], a                   ;; 19:7406 $E0 $EE
    ld   de, Unknown071SpriteVariants             ;; 19:7408 $11 $AD $73
    call RenderActiveEntitySpritesPair            ;; 19:740B $CD $C0 $3B
    ld   a, $98                                   ;; 19:740E $3E $98
    ldh  [hActiveEntityPosX], a                   ;; 19:7410 $E0 $EE
    ld   de, Unknown071SpriteVariants             ;; 19:7412 $11 $AD $73
    jp   RenderActiveEntitySpritesPair            ;; 19:7415 $C3 $C0 $3B

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
    ldh  a, [hActiveEntityState]                  ;; 19:74D8 $F0 $F0
    JP_TABLE                                      ;; 19:74DA
._00 dw func_019_74EB                             ;; 19:74DB
._01 dw func_019_7511                             ;; 19:74DD
._02 dw func_019_756F                             ;; 19:74DF
._03 dw func_019_7640                             ;; 19:74E1
._04 dw func_019_767B                             ;; 19:74E3
._05 dw func_019_76B1                             ;; 19:74E5
._06 dw func_019_76CB                             ;; 19:74E7
._07 dw func_019_7744                             ;; 19:74E9

func_019_74EB::
    ld   a, $02                                   ;; 19:74EB $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:74ED $E0 $A1
    ld   [wC167], a                               ;; 19:74EF $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 19:74F2 $CD $05 $0C
    jr   z, jr_019_7509                           ;; 19:74F5 $28 $12

    cp   $30                                      ;; 19:74F7 $FE $30

.jr_74F9
    ret  c                                        ;; 19:74F9 $D8

    sub  $30                                      ;; 19:74FA $D6 $30
    rra                                           ;; 19:74FC $1F
    rra                                           ;; 19:74FD $1F
    rra                                           ;; 19:74FE $1F
    and  $03                                      ;; 19:74FF $E6 $03
    ldh  [hActiveEntitySpriteVariant], a          ;; 19:7501 $E0 $F1
    ld   de, Unknown071SpriteVariants             ;; 19:7503 $11 $AD $73
    jp   RenderActiveEntitySpritesPair            ;; 19:7506 $C3 $C0 $3B

jr_019_7509:
    call GetEntityTransitionCountdown             ;; 19:7509 $CD $05 $0C
    ld   [hl], $A0                                ;; 19:750C $36 $A0
    jp   IncrementEntityState                     ;; 19:750E $C3 $12 $3B

func_019_7511::
    ld   a, $02                                   ;; 19:7511 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:7513 $E0 $A1
    ld   [wC167], a                               ;; 19:7515 $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 19:7518 $CD $05 $0C
    jr   nz, func_019_7526                        ;; 19:751B $20 $09

    ld   [hl], $FF                                ;; 19:751D $36 $FF
    ld   a, WAVE_SFX_L2_SWORD_APPEAR              ;; 19:751F $3E $1E
    ldh  [hWaveSfx], a                            ;; 19:7521 $E0 $F3
    call IncrementEntityState                     ;; 19:7523 $CD $12 $3B

func_019_7526::
    call GetEntityTransitionCountdown             ;; 19:7526 $CD $05 $0C
    and  $04                                      ;; 19:7529 $E6 $04

.jr_752B
    ld   e, $E4                                   ;; 19:752B $1E $E4
    jr   z, .jr_7531                              ;; 19:752D $28 $02

    ld   e, $84                                   ;; 19:752F $1E $84

.jr_7531
    ld   a, e                                     ;; 19:7531 $7B
    ld   [wBGPalette], a                          ;; 19:7532 $EA $97 $DB
    ldh  a, [hFrameCounter]                       ;; 19:7535 $F0 $E7
    and  $07                                      ;; 19:7537 $E6 $07
    jr   nz, .jr_7547                             ;; 19:7539 $20 $0C

    ld   a, NOISE_SFX_L2_SWORD_SPARKS             ;; 19:753B $3E $33
    ldh  [hNoiseSfx], a                           ;; 19:753D $E0 $F4
    call GetRandomByte                            ;; 19:753F $CD $0D $28
    and  $03                                      ;; 19:7542 $E6 $03
    call SetEntitySpriteVariant                   ;; 19:7544 $CD $0C $3B

.jr_7547
    ldh  a, [hFrameCounter]                       ;; 19:7547 $F0 $E7
    ld   hl, wEntitiesFlashCountdownTable         ;; 19:7549 $21 $20 $C4
    add  hl, bc                                   ;; 19:754C $09
    ld   [hl], a                                  ;; 19:754D $77
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:754E $F0 $F1
    rla                                           ;; 19:7550 $17
    rla                                           ;; 19:7551 $17
    rla                                           ;; 19:7552 $17
    rla                                           ;; 19:7553 $17
    and  $F0                                      ;; 19:7554 $E6 $F0
    ld   e, a                                     ;; 19:7556 $5F
    rla                                           ;; 19:7557 $17
    and  $E0                                      ;; 19:7558 $E6 $E0
    add  e                                        ;; 19:755A $83
    ld   e, a                                     ;; 19:755B $5F
    ld   d, b                                     ;; 19:755C $50
    ld   hl, Data_019_7418                        ;; 19:755D $21 $18 $74
    add  hl, de                                   ;; 19:7560 $19
    ld   c, $0C                                   ;; 19:7561 $0E $0C
    call RenderActiveEntitySpritesRect            ;; 19:7563 $CD $E6 $3C
    ld   a, $0A                                   ;; 19:7566 $3E $0A
    jp   func_015_7964_trampoline                 ;; 19:7568 $C3 $A0 $3D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown072SpriteVariants::
.variant0
    db $7A, $00
    db $7A, $20

func_019_756F::
    ld   a, $02                                   ;; 19:756F $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:7571 $E0 $A1
    ld   [wC167], a                               ;; 19:7573 $EA $67 $C1
    call func_019_7526                            ;; 19:7576 $CD $26 $75
    call GetEntityTransitionCountdown             ;; 19:7579 $CD $05 $0C
    jr   nz, .jr_7586                             ;; 19:757C $20 $08

    call GetEntitySlowTransitionCountdown         ;; 19:757E $CD $FB $0B
    ld   [hl], $28                                ;; 19:7581 $36 $28
    jp   IncrementEntityState                     ;; 19:7583 $C3 $12 $3B

.jr_7586
    cp   $50                                      ;; 19:7586 $FE $50
    jr   nc, .jr_7597                             ;; 19:7588 $30 $0D

    ld   hl, Data_019_7620                        ;; 19:758A $21 $20 $76
    ld   c, $08                                   ;; 19:758D $0E $08
    call RenderActiveEntitySpritesRect            ;; 19:758F $CD $E6 $3C
    ld   a, $06                                   ;; 19:7592 $3E $06
    jp   func_015_7964_trampoline                 ;; 19:7594 $C3 $A0 $3D

.jr_7597
    xor  a                                        ;; 19:7597 $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 19:7598 $E0 $F1
    ld   de, Unknown072SpriteVariants             ;; 19:759A $11 $6B $75
    jp   RenderActiveEntitySpritesPair            ;; 19:759D $C3 $C0 $3B

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
    ld   a, $02                                   ;; 19:7640 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:7642 $E0 $A1
    ld   [wC167], a                               ;; 19:7644 $EA $67 $C1
    ldh  a, [hFrameCounter]                       ;; 19:7647 $F0 $E7
    and  $0F                                      ;; 19:7649 $E6 $0F
    or   $20                                      ;; 19:764B $F6 $20
    ld   hl, wEntitiesFlashCountdownTable         ;; 19:764D $21 $20 $C4
    add  hl, bc                                   ;; 19:7650 $09
    ld   [hl], a                                  ;; 19:7651 $77
    call GetEntitySlowTransitionCountdown         ;; 19:7652 $CD $FB $0B
    jr   nz, .jr_765A                             ;; 19:7655 $20 $03

    jp   IncrementEntityState                     ;; 19:7657 $C3 $12 $3B

.jr_765A
    rra                                           ;; 19:765A $1F
    rra                                           ;; 19:765B $1F
    and  $0F                                      ;; 19:765C $E6 $0F
    cp   $04                                      ;; 19:765E $FE $04
    jr   c, .jr_7664                              ;; 19:7660 $38 $02

    ld   a, $04                                   ;; 19:7662 $3E $04

.jr_7664
    rla                                           ;; 19:7664 $17
    rla                                           ;; 19:7665 $17
    rla                                           ;; 19:7666 $17
    rla                                           ;; 19:7667 $17
    rla                                           ;; 19:7668 $17
    and  $E0                                      ;; 19:7669 $E6 $E0
    ld   e, a                                     ;; 19:766B $5F
    ld   d, b                                     ;; 19:766C $50
    ld   hl, Data_019_75A0                        ;; 19:766D $21 $A0 $75
    add  hl, de                                   ;; 19:7670 $19
    ld   c, $08                                   ;; 19:7671 $0E $08
    call RenderActiveEntitySpritesRect            ;; 19:7673 $CD $E6 $3C
    ld   a, $06                                   ;; 19:7676 $3E $06
    jp   func_015_7964_trampoline                 ;; 19:7678 $C3 $A0 $3D

func_019_767B::
    ld   a, $02                                   ;; 19:767B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:767D $E0 $A1
    ld   [wC167], a                               ;; 19:767F $EA $67 $C1
    call func_019_78F1                            ;; 19:7682 $CD $F1 $78
    call UpdateEntityYPosWithSpeed_19             ;; 19:7685 $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                 ;; 19:7688 $21 $50 $C2
    add  hl, bc                                   ;; 19:768B $09
    inc  [hl]                                     ;; 19:768C $34
    ld   a, [hl]                                  ;; 19:768D $7E
    and  $80                                      ;; 19:768E $E6 $80
    jr   nz, .ret_76B0                            ;; 19:7690 $20 $1E

    ld   hl, wEntitiesPosYTable                   ;; 19:7692 $21 $10 $C2
    add  hl, bc                                   ;; 19:7695 $09
    ld   a, [hl]                                  ;; 19:7696 $7E
    cp   $70                                      ;; 19:7697 $FE $70
    jr   c, .ret_76B0                             ;; 19:7699 $38 $15

    ld   [hl], $70                                ;; 19:769B $36 $70
    ld   a, NOISE_SFX_CLINK                       ;; 19:769D $3E $17
    ldh  [hNoiseSfx], a                           ;; 19:769F $E0 $F4
    ld   hl, wEntitiesSpeedYTable                 ;; 19:76A1 $21 $50 $C2
    add  hl, bc                                   ;; 19:76A4 $09
    ld   a, [hl]                                  ;; 19:76A5 $7E
    cp   $04                                      ;; 19:76A6 $FE $04
    jp   c, IncrementEntityState                  ;; 19:76A8 $DA $12 $3B

    cpl                                           ;; 19:76AB $2F
    inc  a                                        ;; 19:76AC $3C
    sra  a                                        ;; 19:76AD $CB $2F
    ld   [hl], a                                  ;; 19:76AF $77

.ret_76B0
    ret                                           ;; 19:76B0 $C9

func_019_76B1::
    xor  a                                        ;; 19:76B1 $AF
    ld   [wC167], a                               ;; 19:76B2 $EA $67 $C1
    call func_019_78F1                            ;; 19:76B5 $CD $F1 $78
    call CheckLinkCollisionWithEnemy_trampoline   ;; 19:76B8 $CD $5A $3B
    jr   nc, .ret_76CA                            ;; 19:76BB $30 $0D

    call IncrementEntityState                     ;; 19:76BD $CD $12 $3B
    ld   a, MUSIC_OBTAIN_SWORD                    ;; 19:76C0 $3E $0F
    ld   [wMusicTrackToPlay], a                   ;; 19:76C2 $EA $68 $D3
    call GetEntityTransitionCountdown             ;; 19:76C5 $CD $05 $0C
    ld   [hl], $FF                                ;; 19:76C8 $36 $FF

.ret_76CA
    ret                                           ;; 19:76CA $C9

func_019_76CB::
    call GetEntityTransitionCountdown             ;; 19:76CB $CD $05 $0C
    and  $08                                      ;; 19:76CE $E6 $08
    ld   e, $E4                                   ;; 19:76D0 $1E $E4
    jr   z, .jr_76D6                              ;; 19:76D2 $28 $02

    ld   e, $84                                   ;; 19:76D4 $1E $84

; Sea shell house LVL 2 sword awarding script?
.jr_76D6
    ld   a, e                                     ;; 19:76D6 $7B
    ld   [wBGPalette], a                          ;; 19:76D7 $EA $97 $DB
    call GetEntityTransitionCountdown             ;; 19:76DA $CD $05 $0C
    jr   nz, .jr_7709                             ;; 19:76DD $20 $2A

    ld   [hl], $20                                ;; 19:76DF $36 $20
    ld   a, MUSIC_OBTAIN_ITEM                     ;; 19:76E1 $3E $10
    ld   [wMusicTrackToPlay], a                   ;; 19:76E3 $EA $68 $D3
    call_open_dialog Dialog09F                    ;; 19:76E6
    ld   a, [wIndoorBRoomStatus + $E9]            ;; 19:76EB $FA $E9 $DA
    or   $10                                      ;; 19:76EE $F6 $10
    ld   [wIndoorBRoomStatus + $E9], a            ;; 19:76F0 $EA $E9 $DA
    ldh  [hRoomStatus], a                         ;; 19:76F3 $E0 $F8
    ld   a, $02                                   ;; 19:76F5 $3E $02
    ld   [wSwordLevel], a                         ;; 19:76F7 $EA $4E $DB
    ld   a, $FF                                   ;; 19:76FA $3E $FF
    ld   [wAddHealthBuffer], a                    ;; 19:76FC $EA $93 $DB
    xor  a                                        ;; 19:76FF $AF
    ld   [wSeashellsCount], a                     ;; 19:7700 $EA $0F $DB
    ld   [wC167], a                               ;; 19:7703 $EA $67 $C1
    call IncrementEntityState                     ;; 19:7706 $CD $12 $3B

.jr_7709
    ldh  a, [hLinkPositionX]                      ;; 19:7709 $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 19:770B $21 $00 $C2
    add  hl, bc                                   ;; 19:770E $09
    sub  $04                                      ;; 19:770F $D6 $04
    ld   [hl], a                                  ;; 19:7711 $77
    ldh  a, [hLinkPositionY]                      ;; 19:7712 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 19:7714 $21 $10 $C2
    add  hl, bc                                   ;; 19:7717 $09
    sub  $13                                      ;; 19:7718 $D6 $13
    ld   [hl], a                                  ;; 19:771A $77
    call CopyEntityPositionToActivePosition       ;; 19:771B $CD $8A $3D
    ldh  a, [hLinkPositionZ]                      ;; 19:771E $F0 $A2
    ld   hl, wEntitiesPosZTable                   ;; 19:7720 $21 $10 $C3
    add  hl, bc                                   ;; 19:7723 $09
    ld   [hl], a                                  ;; 19:7724 $77
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6B       ;; 19:7725 $3E $6B
    ldh  [hLinkAnimationState], a                 ;; 19:7727 $E0 $9D
    ld   a, $02                                   ;; 19:7729 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:772B $E0 $A1
    ld   a, $03                                   ;; 19:772D $3E $03
    ldh  [hLinkDirection], a                      ;; 19:772F $E0 $9E
    ; reset sword parameter
    xor  a                                        ;; 19:7731 $AF
    ld   [wSwordAnimationState], a                ;; 19:7732 $EA $37 $C1
    ld   [wC16A], a                               ;; 19:7735 $EA $6A $C1
    ld   [wSwordCharge], a                        ;; 19:7738 $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ;; 19:773B $EA $21 $C1
    call func_019_784F                            ;; 19:773E $CD $4F $78
    jp   func_019_78EC                            ;; 19:7741 $C3 $EC $78

func_019_7744::
    call func_019_78EC                            ;; 19:7744 $CD $EC $78
    ld   a, [wDialogState]                        ;; 19:7747 $FA $9F $C1
    and  a                                        ;; 19:774A $A7
    ret  nz                                       ;; 19:774B $C0

    jp   ClearEntityStatus_19                     ;; 19:774C $C3 $61 $7E

Data_019_774F::
    db   $00, $04, $72, $00, $E0, $04, $72, $00   ;; 19:774F
    db   $00, $F0, $78, $20, $00, $F8, $78, $40   ;; 19:7757
    db   $00, $10, $78, $60, $00, $18, $78, $00   ;; 19:775F
    db   $F0, $E8, $76, $20, $F0, $F0, $76, $40   ;; 19:7767
    db   $F0, $18, $76, $60, $F0, $20, $76, $00   ;; 19:776F
    db   $E8, $F4, $74, $20, $E8, $14, $74, $00   ;; 19:7777

Data_019_777F::
    db   $F8, $04, $72, $00, $D8, $04, $72, $00   ;; 19:777F
    db   $FC, $E8, $78, $20, $FC, $F0, $78, $40   ;; 19:7787
    db   $FC, $18, $78, $60, $FC, $20, $78, $00   ;; 19:778F
    db   $E8, $E0, $76, $20, $E8, $E8, $76, $40   ;; 19:7797
    db   $E8, $20, $76, $60, $E8, $28, $76, $00   ;; 19:779F
    db   $E0, $F0, $74, $20, $E0, $18, $74, $00   ;; 19:77A7
    db   $00, $00, $74, $20, $00, $08, $74, $00   ;; 19:77AF

Data_019_77B7::
    db   $F0, $04, $72, $00, $D0, $04, $72, $00   ;; 19:77B7
    db   $F8, $E0, $78, $20, $F8, $E8, $78, $40   ;; 19:77BF
    db   $F8, $20, $78, $60, $F8, $28, $78, $00   ;; 19:77C7
    db   $E0, $D8, $76, $20, $E0, $E0, $76, $40   ;; 19:77CF
    db   $E0, $28, $76, $60, $E0, $30, $76, $00   ;; 19:77D7
    db   $D8, $EC, $74, $20, $D8, $1C, $74, $00   ;; 19:77DF
    db   $F8, $FC, $74, $20, $F8, $0C, $74, $00   ;; 19:77E7
    db   $00, $F8, $76, $20, $00, $00, $76, $40   ;; 19:77EF
    db   $00, $08, $76, $60, $00, $10, $76, $00   ;; 19:77F7

Data_019_77FF::
    db   $E4, $04, $72, $00, $00, $F8, $78, $20   ;; 19:77FF
    db   $00, $00, $78, $40, $00, $08, $78, $60   ;; 19:7807
    db   $00, $10, $78, $00, $F4, $F0, $76, $20   ;; 19:780F
    db   $F4, $F8, $76, $40, $F4, $10, $76, $60   ;; 19:7817
    db   $F4, $18, $76, $00, $EC, $F8, $74, $20   ;; 19:781F
    db   $EC, $10, $74, $00, $F0, $D8, $78, $20   ;; 19:7827
    db   $F0, $E0, $78, $40, $F0, $28, $78, $60   ;; 19:782F
    db   $F0, $30, $78, $00, $CC, $E8, $74, $20   ;; 19:7837
    db   $CC, $20, $74, $00                       ;; 19:783F

Data_019_7843::
    dw   Data_019_774F
    dw   Data_019_777F
    dw   Data_019_77B7
    dw   Data_019_77FF

Data_019_784B::
    db   $0C, $0E, $12, $11

func_019_784F::
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:784F $F0 $EC
    sub  $00                                      ;; 19:7851 $D6 $00
    ldh  [hActiveEntityVisualPosY], a             ;; 19:7853 $E0 $EC
    ldh  a, [hFrameCounter]                       ;; 19:7855 $F0 $E7
    rra                                           ;; 19:7857 $1F
    rra                                           ;; 19:7858 $1F
    nop                                           ;; 19:7859 $00
    push af                                       ;; 19:785A $F5
    and  $03                                      ;; 19:785B $E6 $03
    ld   e, a                                     ;; 19:785D $5F
    ld   d, b                                     ;; 19:785E $50
    ld   hl, Data_019_784B                        ;; 19:785F $21 $4B $78
    add  hl, de                                   ;; 19:7862 $19
    ld   c, [hl]                                  ;; 19:7863 $4E
    pop  af                                       ;; 19:7864 $F1
    rla                                           ;; 19:7865 $17
    and  $06                                      ;; 19:7866 $E6 $06
    ld   e, a                                     ;; 19:7868 $5F
    ld   d, b                                     ;; 19:7869 $50
    ld   hl, Data_019_7843                        ;; 19:786A $21 $43 $78
    add  hl, de                                   ;; 19:786D $19
    ld   a, [hl+]                                 ;; 19:786E $2A
    ld   h, [hl]                                  ;; 19:786F $66
    ld   l, a                                     ;; 19:7870 $6F
    call RenderActiveEntitySpritesRect            ;; 19:7871 $CD $E6 $3C
    ld   a, $10                                   ;; 19:7874 $3E $10
    jp   func_015_7964_trampoline                 ;; 19:7876 $C3 $A0 $3D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown073SpriteVariants::
.variant0
    db $7E, $00
    db $7E, $20

func_019_787D::
    call GetEntityTransitionCountdown
    ret  nz                                       ;; 19:7880 $C0

    ld   de, Unknown073SpriteVariants             ;; 19:7881 $11 $79 $78
    call RenderActiveEntitySpritesPair            ;; 19:7884 $CD $C0 $3B
    call UpdateEntityYPosWithSpeed_19             ;; 19:7887 $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                 ;; 19:788A $21 $50 $C2
    add  hl, bc                                   ;; 19:788D $09
    inc  [hl]                                     ;; 19:788E $34
    ld   a, [hl]                                  ;; 19:788F $7E
    and  $80                                      ;; 19:7890 $E6 $80
    jr   nz, ret_019_78CB                         ;; 19:7892 $20 $37

    ld   hl, wEntitiesPosYTable                   ;; 19:7894 $21 $10 $C2
    add  hl, bc                                   ;; 19:7897 $09

.jr_7898
    ld   a, [hl]                                  ;; 19:7898 $7E
    cp   $70                                      ;; 19:7899 $FE $70
    jr   c, ret_019_78CB                          ;; 19:789B $38 $2E

    ld   [hl], $70                                ;; 19:789D $36 $70
    ld   hl, wEntitiesSpeedYTable                 ;; 19:789F $21 $50 $C2
    add  hl, bc                                   ;; 19:78A2 $09
    ld   [hl], b                                  ;; 19:78A3 $70
    call CheckLinkCollisionWithEnemy_trampoline   ;; 19:78A4 $CD $5A $3B
    jr   nc, ret_019_78CB                         ;; 19:78A7 $30 $22

    ld   a, WAVE_SFX_SEASHELL                     ;; 19:78A9 $3E $01
    ldh  [hWaveSfx], a                            ;; 19:78AB $E0 $F3
    call ClearEntityStatus_19                     ;; 19:78AD $CD $61 $7E
    ld   hl, wIndoorBRoomStatus + $E9             ;; 19:78B0 $21 $E9 $DA
    ld   a, [wSeashellsCount]                     ;; 19:78B3 $FA $0F $DB

.jr_78B6
    cp   $05                                      ;; 19:78B6 $FE $05
    jr   nz, .jr_78BE                             ;; 19:78B8 $20 $04

    set  5, [hl]                                  ;; 19:78BA $CB $EE
    jr   jr_019_78C0                              ;; 19:78BC $18 $02

.jr_78BE
    set  6, [hl]                                  ;; 19:78BE $CB $F6

jr_019_78C0:
    add  $01                                      ;; 19:78C0 $C6 $01
    daa                                           ;; 19:78C2 $27
    ld   [wSeashellsCount], a                     ;; 19:78C3 $EA $0F $DB
    call_open_dialog Dialog0EF                    ;; 19:78C6

ret_019_78CB:
    ret                                           ;; 19:78CB $C9

Data_019_78CC::
    db   $F8, $00, $52, $00, $F8, $08, $52, $20, $08, $00, $54, $00, $08, $08, $54, $20

Data_019_78DC::
    db   $F8, $00, $54, $40, $F8, $08, $54, $60, $08, $00, $52, $40, $08, $08, $52, $60

func_019_78EC::
    ld   hl, Data_019_78DC                        ;; 19:78EC $21 $DC $78
    jr   jr_019_78F4                              ;; 19:78EF $18 $03

func_019_78F1::
    ld   hl, Data_019_78CC                        ;; 19:78F1 $21 $CC $78

jr_019_78F4:
    ld   c, $04                                   ;; 19:78F4 $0E $04
    call RenderActiveEntitySpritesRect            ;; 19:78F6 $CD $E6 $3C
    ld   a, $02                                   ;; 19:78F9 $3E $02
    jp   func_015_7964_trampoline                 ;; 19:78FB $C3 $A0 $3D

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
    push bc                                       ;; 19:7921 $C5
    ld   c, $23                                   ;; 19:7922 $0E $23
    ld   a, $22                                   ;; 19:7924 $3E $22
    ld   [wDrawCommandsSize], a                   ;; 19:7926 $EA $00 $D6
    ld   hl, wDrawCommand                         ;; 19:7929 $21 $01 $D6
    ld   de, Data_019_78FE                        ;; 19:792C $11 $FE $78

.loop_792F
    ld   a, [de]                                  ;; 19:792F $1A
    inc  de                                       ;; 19:7930 $13
    ld   [hl+], a                                 ;; 19:7931 $22
    dec  c                                        ;; 19:7932 $0D
    jr   nz, .loop_792F                           ;; 19:7933 $20 $FA

IF __PATCH_0__
    ld   c, Data_019_78FE_B.end - Data_019_78FE_B
    ld   a, $08
    ld   [wDrawCommandsVRAM1Size], a
    ld   hl, wDrawCommandVRAM1
    ld   de, Data_019_78FE_B

.loop_7951
    ld   a, [de]
    inc  de
    ld   [hl+], a
    dec  c
    jr   nz, .loop_7951
ENDC

    pop  bc                                       ;; 19:7935 $C1
    ld   a, $89                                   ;; 19:7936 $3E $89
    ld   [wRoomObjects + $18], a                  ;; 19:7938 $EA $29 $D7
    ld   [wRoomObjects + $28], a                  ;; 19:793B $EA $39 $D7
    ld   [wRoomObjects + $38], a                  ;; 19:793E $EA $49 $D7
    ld   [wRoomObjects + $48], a                  ;; 19:7941 $EA $59 $D7
    ld   [wRoomObjects + $58], a                  ;; 19:7944 $EA $69 $D7
    ld   [wRoomObjects + $68], a                  ;; 19:7947 $EA $79 $D7
    ld   [wRoomObjects + $78], a                  ;; 19:794A $EA $89 $D7
    ret                                           ;; 19:794D $C9
