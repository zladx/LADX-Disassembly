Data_018_72F5::
    db   $7A, $16, $7E, $36, $7A, $36, $7E, $16, $7C, $16, $7C, $36

TurtleRockHeadEntityHandler::
    ldh  a, [hRoomStatus]                         ; $7301: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $7303: $E6 $20
    jp   nz, ClearEntityStatusBank18              ; $7305: $C2 $08 $7F

    ld   hl, wEntitiesPrivateState1Table          ; $7308: $21 $B0 $C2
    add  hl, bc                                   ; $730B: $09
    ld   a, [hl]                                  ; $730C: $7E
    and  a                                        ; $730D: $A7
    jr   z, .jr_7330                              ; $730E: $28 $20

    ld   de, Data_018_72F5                        ; $7310: $11 $F5 $72
    call RenderActiveEntitySprite                 ; $7313: $CD $77 $3C
    call ReturnIfNonInteractive_18                ; $7316: $CD $E8 $7D
    call UpdateEntityPosWithSpeed_18              ; $7319: $CD $5F $7E
    call AddEntityZSpeedToPos_18                  ; $731C: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $731F: $21 $20 $C3
    add  hl, bc                                   ; $7322: $09
    dec  [hl]                                     ; $7323: $35
    dec  [hl]                                     ; $7324: $35
    ld   hl, wEntitiesPosZTable                   ; $7325: $21 $10 $C3
    add  hl, bc                                   ; $7328: $09
    ld   a, [hl]                                  ; $7329: $7E
    and  $80                                      ; $732A: $E6 $80
    jp   nz, ClearEntityStatusBank18              ; $732C: $C2 $08 $7F

    ret                                           ; $732F: $C9

.jr_7330
    ld   hl, wEntitiesFlashCountdownTable         ; $7330: $21 $20 $C4
    add  hl, bc                                   ; $7333: $09
    ld   a, [hl]                                  ; $7334: $7E
    and  a                                        ; $7335: $A7
    jr   z, .jr_733C                              ; $7336: $28 $04

    ld   a, $07                                   ; $7338: $3E $07
    ldh  [hActiveEntitySpriteVariant], a          ; $733A: $E0 $F1

.jr_733C
    call func_018_766A                            ; $733C: $CD $6A $76
    ldh  a, [hActiveEntityState]                  ; $733F: $F0 $F0
    and  a                                        ; $7341: $A7
    jr   nz, .jr_7363                             ; $7342: $20 $1F

    ld   a, [wSelectedSongIndex]                  ; $7344: $FA $4A $DB
    cp   $02                                      ; $7347: $FE $02
    jr   nz, .jr_7363                             ; $7349: $20 $18

    ld   a, [wLinkPlayingOcarinaCountdown]        ; $734B: $FA $66 $C1
    and  a                                        ; $734E: $A7
    jr   z, .jr_7363                              ; $734F: $28 $12

    call IncrementEntityState                     ; $7351: $CD $12 $3B
    ld   hl, wEntitiesOptions1Table               ; $7354: $21 $30 $C4
    add  hl, bc                                   ; $7357: $09
    set  ENTITY_OPT1_B_IS_BOSS, [hl]              ; $7358: $CB $FE
    set  2, [hl]                                  ; $735A: $CB $D6
    ld   hl, wEntitiesHealthTable                 ; $735C: $21 $60 $C3
    add  hl, bc                                   ; $735F: $09
    ld   [hl], $10                                ; $7360: $36 $10
    ret                                           ; $7362: $C9

.jr_7363
    ldh  a, [hActiveEntityStatus]                 ; $7363: $F0 $EA
    cp   $05                                      ; $7365: $FE $05
    jr   z, jr_018_737E                           ; $7367: $28 $15

    call AnimateBossAgony_18                      ; $7369: $CD $0F $7F
    ld   hl, wEntitiesStatusTable                 ; $736C: $21 $80 $C2
    add  hl, bc                                   ; $736F: $09
    ld   a, [hl]                                  ; $7370: $7E
    and  a                                        ; $7371: $A7
    jr   nz, .ret_737D                            ; $7372: $20 $09

    ld   hl, wOverworldRoomStatus + $10           ; $7374: $21 $10 $D8
    set  OW_ROOM_STATUS_FLAG_OWL_TALKED, [hl]     ; $7377: $CB $EE
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $7379: $3E $02
    ldh  [hJingle], a                             ; $737B: $E0 $F2

.ret_737D
    ret                                           ; $737D: $C9

jr_018_737E:
    call ReturnIfNonInteractive_18                ; $737E: $CD $E8 $7D
    call DecrementEntityIgnoreHitsCountdown       ; $7381: $CD $56 $0C
    call label_3B70                               ; $7384: $CD $70 $3B
    ldh  a, [hActiveEntityState]                  ; $7387: $F0 $F0
    cp   $05                                      ; $7389: $FE $05
    jr   nc, .jr_7392                             ; $738B: $30 $05

    call PushLinkOutOfEntity_18                   ; $738D: $CD $36 $7D
    jr   jr_018_7395                              ; $7390: $18 $03

.jr_7392
    call label_3B44                               ; $7392: $CD $44 $3B

jr_018_7395:
    ldh  a, [hActiveEntityState]                  ; $7395: $F0 $F0
    JP_TABLE                                      ; $7397
._00 dw TurtleRockHeadState0Handler
._01 dw TurtleRockHeadState1Handler
._02 dw TurtleRockHeadState2Handler
._03 dw TurtleRockHeadState3Handler
._04 dw TurtleRockHeadState4Handler
._05 dw TurtleRockHeadState5Handler
._06 dw TurtleRockHeadState6Handler
._07 dw TurtleRockHeadState7Handler
._08 dw TurtleRockHeadState8Handler
._09 dw TurtleRockHeadState9Handler
._0A dw TurtleRockHeadStateAHandler
._0B dw TurtleRockHeadStateBHandler

TurtleRockHeadState0Handler::
    ret                                           ; $73B0: $C9

TurtleRockHeadState1Handler::
    call GetEntityTransitionCountdown             ; $73B1: $CD $05 $0C
    ld   [hl], $80                                ; $73B4: $36 $80
    ld   a, MUSIC_TURTLE_ROCK_ENTRANCE_BOSS       ; $73B6: $3E $39
    ld   [wMusicTrackToPlay], a                   ; $73B8: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $73BB: $E0 $B0
    ldh  [hDefaultMusicTrackAlt], a               ; $73BD: $E0 $BD
    ldh  [hNextDefaultMusicTrack], a              ; $73BF: $E0 $BF
    jp   IncrementEntityState                     ; $73C1: $C3 $12 $3B

TurtleRockHeadState2Handler::
    ldh  a, [hActiveEntityPosX]                   ; $73C4: $F0 $EE
    ld   hl, wEntitiesPrivateState4Table          ; $73C6: $21 $40 $C4
    add  hl, bc                                   ; $73C9: $09
    ld   [hl], a                                  ; $73CA: $77
    ldh  a, [hActiveEntityVisualPosY]             ; $73CB: $F0 $EC
    ld   hl, wEntitiesPrivateState3Table          ; $73CD: $21 $D0 $C2
    add  hl, bc                                   ; $73D0: $09
    sub  $14                                      ; $73D1: $D6 $14
    ld   [hl], a                                  ; $73D3: $77
    call GetEntityTransitionCountdown             ; $73D4: $CD $05 $0C
    jr   nz, .jr_73DE                             ; $73D7: $20 $05

    ld   [hl], $FF                                ; $73D9: $36 $FF
    jp   IncrementEntityState                     ; $73DB: $C3 $12 $3B

.jr_73DE
    ld   e, $08                                   ; $73DE: $1E $08
    and  $04                                      ; $73E0: $E6 $04
    jr   z, .jr_73E6                              ; $73E2: $28 $02

    ld   e, $F8                                   ; $73E4: $1E $F8

.jr_73E6
    ld   hl, wEntitiesSpeedXTable                 ; $73E6: $21 $40 $C2
    add  hl, bc                                   ; $73E9: $09
    ld   [hl], e                                  ; $73EA: $73
    jp   AddEntitySpeedToPos_18                   ; $73EB: $C3 $6C $7E

Data_018_73EE::
    db   $F8, $08, $10, $00, $00, $08

Data_018_73F4::
    db   $F0, $00, $F0, $00, $F0, $F0

Data_018_73FA::
    db   $F8, $08, $08, $F8, $F8, $08

Data_018_7400::
    db   $FC, $02, $FC, $02, $FC, $FC

Data_018_7406::
    db   $10, $10, $10, $10, $10, $10

TurtleRockHeadState3Handler::
    call GetEntityTransitionCountdown             ; $740C: $CD $05 $0C
    jr   nz, .jr_7416                             ; $740F: $20 $05

    ld   [hl], $80                                ; $7411: $36 $80
    jp   IncrementEntityState                     ; $7413: $C3 $12 $3B

.jr_7416
    and  $1F                                      ; $7416: $E6 $1F
    jr   nz, ret_018_7479                         ; $7418: $20 $5F

    ldh  a, [hActiveEntitySpriteVariant]          ; $741A: $F0 $F1
    cp   $06                                      ; $741C: $FE $06
    jr   z, .jr_746E                              ; $741E: $28 $4E

    ld   a, NOISE_SFX_ENEMY_DESTROYED             ; $7420: $3E $13
    ldh  [hNoiseSfx], a                           ; $7422: $E0 $F4
    ld   a, ENTITY_TURTLE_ROCK_HEAD               ; $7424: $3E $7F
    call SpawnNewEntity_trampoline                ; $7426: $CD $86 $3B
    push bc                                       ; $7429: $C5
    ldh  a, [hActiveEntitySpriteVariant]          ; $742A: $F0 $F1
    ld   c, a                                     ; $742C: $4F
    ld   hl, wEntitiesSpriteVariantTable          ; $742D: $21 $B0 $C3
    add  hl, de                                   ; $7430: $19
    ld   [hl], a                                  ; $7431: $77
    ld   hl, Data_018_73EE                        ; $7432: $21 $EE $73
    add  hl, bc                                   ; $7435: $09
    ldh  a, [hMultiPurpose0]                      ; $7436: $F0 $D7
    add  [hl]                                     ; $7438: $86
    ld   hl, wEntitiesPosXTable                   ; $7439: $21 $00 $C2
    add  hl, de                                   ; $743C: $19
    ld   [hl], a                                  ; $743D: $77
    ld   hl, Data_018_73F4                        ; $743E: $21 $F4 $73
    add  hl, bc                                   ; $7441: $09
    ldh  a, [hMultiPurpose1]                      ; $7442: $F0 $D8
    add  [hl]                                     ; $7444: $86
    ld   hl, wEntitiesPosYTable                   ; $7445: $21 $10 $C2
    add  hl, de                                   ; $7448: $19
    ld   [hl], a                                  ; $7449: $77
    ld   hl, Data_018_73FA                        ; $744A: $21 $FA $73
    add  hl, bc                                   ; $744D: $09
    ld   a, [hl]                                  ; $744E: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $744F: $21 $40 $C2
    add  hl, de                                   ; $7452: $19
    ld   [hl], a                                  ; $7453: $77
    ld   hl, Data_018_7400                        ; $7454: $21 $00 $74
    add  hl, bc                                   ; $7457: $09
    ld   a, [hl]                                  ; $7458: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7459: $21 $50 $C2
    add  hl, de                                   ; $745C: $19
    ld   [hl], a                                  ; $745D: $77
    ld   hl, Data_018_7406                        ; $745E: $21 $06 $74
    add  hl, bc                                   ; $7461: $09
    ld   a, [hl]                                  ; $7462: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $7463: $21 $20 $C3
    add  hl, de                                   ; $7466: $19
    ld   [hl], a                                  ; $7467: $77
    ld   hl, wEntitiesPrivateState1Table          ; $7468: $21 $B0 $C2
    add  hl, de                                   ; $746B: $19
    ld   [hl], a                                  ; $746C: $77
    pop  bc                                       ; $746D: $C1

.jr_746E
    ld   hl, wEntitiesSpriteVariantTable          ; $746E: $21 $B0 $C3
    add  hl, bc                                   ; $7471: $09
    ld   a, [hl]                                  ; $7472: $7E
    cp   $07                                      ; $7473: $FE $07
    jr   z, ret_018_7479                          ; $7475: $28 $02

    inc  a                                        ; $7477: $3C
    ld   [hl], a                                  ; $7478: $77

ret_018_7479:
    ret                                           ; $7479: $C9

TurtleRockHeadState4Handler::
    call GetEntityTransitionCountdown             ; $747A: $CD $05 $0C
    jr   nz, .jr_7484                             ; $747D: $20 $05

    ld   [hl], $80                                ; $747F: $36 $80
    jp   IncrementEntityState                     ; $7481: $C3 $12 $3B

.jr_7484
    ld   e, $07                                   ; $7484: $1E $07
    cp   $60                                      ; $7486: $FE $60
    jr   nc, .jr_7496                             ; $7488: $30 $0C

    cp   $40                                      ; $748A: $FE $40
    jr   nc, jr_018_7497                          ; $748C: $30 $09

    cp   $30                                      ; $748E: $FE $30
    jr   c, .jr_7496                              ; $7490: $38 $04

    cp   $20                                      ; $7492: $FE $20
    jr   c, jr_018_7497                           ; $7494: $38 $01

.jr_7496
    inc  e                                        ; $7496: $1C

jr_018_7497:
    ld   a, e                                     ; $7497: $7B
    jp   SetEntitySpriteVariant                   ; $7498: $C3 $0C $3B

TurtleRockHeadState5Handler::
    call GetEntityTransitionCountdown             ; $749B: $CD $05 $0C
    jr   nz, .jr_74BC                             ; $749E: $20 $1C

    ld   [hl], $40                                ; $74A0: $36 $40
    ld   hl, wEntitiesPhysicsFlagsTable           ; $74A2: $21 $40 $C3
    add  hl, bc                                   ; $74A5: $09
    res  ENTITY_PHYSICS_B_HARMLESS, [hl]          ; $74A6: $CB $BE
    ld   hl, wEntitiesOptions1Table               ; $74A8: $21 $30 $C4
    add  hl, bc                                   ; $74AB: $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $74AC: $CB $B6
    call IncrementEntityState                     ; $74AE: $CD $12 $3B
    ldh  a, [hActiveEntityPosX]                   ; $74B1: $F0 $EE
    ld   [wD201], a                               ; $74B3: $EA $01 $D2
    ldh  a, [hActiveEntityVisualPosY]             ; $74B6: $F0 $EC
    ld   [wD202], a                               ; $74B8: $EA $02 $D2
    ret                                           ; $74BB: $C9

.jr_74BC
    ld   hl, wEntitiesSpeedYTable                 ; $74BC: $21 $50 $C2
    add  hl, bc                                   ; $74BF: $09
    ld   [hl], $04                                ; $74C0: $36 $04
    jp   UpdateEntityYPosWithSpeed_18             ; $74C2: $C3 $62 $7E

TurtleRockHeadState6Handler::
    call GetEntityTransitionCountdown             ; $74C5: $CD $05 $0C
    ret  nz                                       ; $74C8: $C0

    ld   [hl], $20                                ; $74C9: $36 $20
    ld   hl, wEntitiesSpeedXTable                 ; $74CB: $21 $40 $C2
    add  hl, bc                                   ; $74CE: $09
    ld   [hl], $08                                ; $74CF: $36 $08
    jp   IncrementEntityState                     ; $74D1: $C3 $12 $3B

TurtleRockHeadState7Handler::
    call GetEntityTransitionCountdown             ; $74D4: $CD $05 $0C
    jr   nz, .jr_74E7                             ; $74D7: $20 $0E

    call GetEntityTransitionCountdown             ; $74D9: $CD $05 $0C
    call GetRandomByte                            ; $74DC: $CD $0D $28
    and  $1F                                      ; $74DF: $E6 $1F
    add  $08                                      ; $74E1: $C6 $08
    ld   [hl], a                                  ; $74E3: $77
    call IncrementEntityState                     ; $74E4: $CD $12 $3B

.jr_74E7
    jp   AddEntitySpeedToPos_18                   ; $74E7: $C3 $6C $7E

TurtleRockHeadState8Handler::
    call GetEntityTransitionCountdown             ; $74EA: $CD $05 $0C
    jr   nz, ret_018_751E                         ; $74ED: $20 $2F

    ld   hl, wEntitiesPrivateState5Table          ; $74EF: $21 $90 $C3
    add  hl, bc                                   ; $74F2: $09
    inc  [hl]                                     ; $74F3: $34
    ld   a, [hl]                                  ; $74F4: $7E
    cp   $03                                      ; $74F5: $FE $03
    jr   c, .jr_750C                              ; $74F7: $38 $13

    call GetRandomByte                            ; $74F9: $CD $0D $28
    and  $01                                      ; $74FC: $E6 $01
    jr   nz, .jr_750C                             ; $74FE: $20 $0C

    call IncrementEntityState                     ; $7500: $CD $12 $3B
    ld   a, $09                                   ; $7503: $3E $09
    ld   [hl], a                                  ; $7505: $77
    call GetEntityTransitionCountdown             ; $7506: $CD $05 $0C
    ld   [hl], $20                                ; $7509: $36 $20
    ret                                           ; $750B: $C9

.jr_750C
    call GetEntityTransitionCountdown             ; $750C: $CD $05 $0C
    ld   [hl], $40                                ; $750F: $36 $40
    call IncrementEntityState                     ; $7511: $CD $12 $3B
    dec  [hl]                                     ; $7514: $35
    dec  [hl]                                     ; $7515: $35
    ld   hl, wEntitiesSpeedXTable                 ; $7516: $21 $40 $C2
    add  hl, bc                                   ; $7519: $09
    ld   a, [hl]                                  ; $751A: $7E
    cpl                                           ; $751B: $2F
    inc  a                                        ; $751C: $3C
    ld   [hl], a                                  ; $751D: $77

ret_018_751E:
    ret                                           ; $751E: $C9

TurtleRockHeadState9Handler::
    call GetEntityTransitionCountdown             ; $751F: $CD $05 $0C
    ret  nz                                       ; $7522: $C0

    ld   [hl], $20                                ; $7523: $36 $20
    ld   a, $18                                   ; $7525: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $7527: $CD $AA $3B
    ld   hl, wEntitiesSpeedYTable                 ; $752A: $21 $50 $C2
    add  hl, bc                                   ; $752D: $09
    ld   a, [hl]                                  ; $752E: $7E
    bit  7, [hl]                                  ; $752F: $CB $7E
    jr   z, .jr_7536                              ; $7531: $28 $03

    cpl                                           ; $7533: $2F
    inc  a                                        ; $7534: $3C
    ld   [hl], a                                  ; $7535: $77

.jr_7536
    jp   IncrementEntityState                     ; $7536: $C3 $12 $3B

TurtleRockHeadStateAHandler::
    ld   hl, wEntitiesFlashCountdownTable         ; $7539: $21 $20 $C4
    add  hl, bc                                   ; $753C: $09
    ld   a, [hl]                                  ; $753D: $7E
    and  a                                        ; $753E: $A7
    jr   nz, .jr_7546                             ; $753F: $20 $05

    call GetEntityTransitionCountdown             ; $7541: $CD $05 $0C
    jr   nz, jr_018_7549                          ; $7544: $20 $03

.jr_7546
    call IncrementEntityState                     ; $7546: $CD $12 $3B

jr_018_7549:
    jp   UpdateEntityPosWithSpeed_18              ; $7549: $C3 $5F $7E

TurtleRockHeadStateBHandler::
    ldh  a, [hLinkPositionX]                      ; $754C: $F0 $98
    push af                                       ; $754E: $F5
    ldh  a, [hLinkPositionY]                      ; $754F: $F0 $99
    push af                                       ; $7551: $F5
    ld   a, [wD201]                               ; $7552: $FA $01 $D2
    ldh  [hLinkPositionX], a                      ; $7555: $E0 $98
    ld   a, [wD202]                               ; $7557: $FA $02 $D2
    ldh  [hLinkPositionY], a                      ; $755A: $E0 $99
    ld   a, $08                                   ; $755C: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $755E: $CD $AA $3B
    ld   a, [wD201]                               ; $7561: $FA $01 $D2
    ld   hl, hActiveEntityPosX                    ; $7564: $21 $EE $FF
    sub  [hl]                                     ; $7567: $96
    add  $01                                      ; $7568: $C6 $01
    cp   $02                                      ; $756A: $FE $02
    jr   nc, .jr_7585                             ; $756C: $30 $17

    ld   a, [wD202]                               ; $756E: $FA $02 $D2
    ld   hl, hActiveEntityVisualPosY              ; $7571: $21 $EC $FF
    sub  [hl]                                     ; $7574: $96
    add  $01                                      ; $7575: $C6 $01
    cp   $02                                      ; $7577: $FE $02
    jr   nc, .jr_7585                             ; $7579: $30 $0A

    call IncrementEntityState                     ; $757B: $CD $12 $3B
    ld   [hl], $06                                ; $757E: $36 $06
    call GetEntityTransitionCountdown             ; $7580: $CD $05 $0C
    ld   [hl], $20                                ; $7583: $36 $20

.jr_7585
    pop  af                                       ; $7585: $F1
    ldh  [hLinkPositionY], a                      ; $7586: $E0 $99
    pop  af                                       ; $7588: $F1
    ldh  [hLinkPositionX], a                      ; $7589: $E0 $98
    jp   UpdateEntityPosWithSpeed_18              ; $758B: $C3 $5F $7E

Data_018_758E::
    db   $F0, $F8, $7A, $16, $F0, $00, $7C, $16, $F0, $08, $7C, $36, $F0, $10, $7A, $36
    db   $00, $00, $7E, $16, $00, $08, $7E, $36, $F0, $F8, $70, $07, $F0, $00, $7C, $16
    db   $F0, $08, $7C, $36, $F0, $10, $7A, $36, $00, $00, $7E, $16, $00, $08, $7E, $36
    db   $F0, $F8, $70, $07, $F0, $00, $7C, $16, $F0, $08, $7C, $36, $F0, $10, $7A, $36
    db   $00, $00, $7E, $16, $00, $08, $74, $27, $F0, $F8, $70, $07, $F0, $00, $7C, $16
    db   $F0, $08, $7C, $36, $F0, $10, $70, $27, $00, $00, $7E, $16, $00, $08, $74, $27
    db   $F0, $F8, $70, $07, $F0, $00, $7C, $16, $F0, $08, $7C, $36, $F0, $10, $70, $27
    db   $00, $00, $74, $07, $00, $08, $74, $27, $F0, $F8, $70, $07, $F0, $00, $78, $07
    db   $F0, $08, $7C, $36, $F0, $10, $70, $27, $00, $00, $74, $07, $00, $08, $74, $27
    db   $F0, $F8, $70, $07, $F0, $00, $78, $07, $F0, $08, $78, $27, $F0, $10, $70, $27
    db   $00, $00, $74, $07, $00, $08, $74, $27, $F0, $F8, $70, $07, $F0, $00, $78, $07
    db   $F0, $08, $78, $27, $F0, $10, $70, $27, $00, $00, $74, $07, $00, $08, $74, $27
    db   $F0, $F8, $70, $07, $F0, $00, $72, $07, $F0, $08, $72, $27, $F0, $10, $70, $27
    db   $00, $00, $74, $07, $00, $08, $74, $27

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TurtleRockHeadSpriteVariants::
.variant0
    db $76, OAM_GBC_PAL_7 | OAMF_PAL0
    db $76, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP

func_018_766A::
    ldh  a, [hActiveEntitySpriteVariant]          ; $766A: $F0 $F1
    rla                                           ; $766C: $17
    rla                                           ; $766D: $17
    rla                                           ; $766E: $17
    and  $F8                                      ; $766F: $E6 $F8
    ld   e, a                                     ; $7671: $5F
    rla                                           ; $7672: $17
    add  e                                        ; $7673: $83
    ld   e, a                                     ; $7674: $5F
    ld   d, b                                     ; $7675: $50
    ld   hl, Data_018_758E                        ; $7676: $21 $8E $75
    add  hl, de                                   ; $7679: $19
    ld   c, $06                                   ; $767A: $0E $06
    call RenderActiveEntitySpritesRect            ; $767C: $CD $E6 $3C
    ld   a, $06                                   ; $767F: $3E $06
    call func_015_7964_trampoline                 ; $7681: $CD $A0 $3D
    ldh  a, [hActiveEntityStatus]                 ; $7684: $F0 $EA
    cp   $01                                      ; $7686: $FE $01
    jr   z, .jr_7691                              ; $7688: $28 $07

    ldh  a, [hActiveEntityState]                  ; $768A: $F0 $F0
    cp   $05                                      ; $768C: $FE $05
    jp   c, label_018_7726                        ; $768E: $DA $26 $77

.jr_7691
    ld   hl, wEntitiesPrivateState4Table          ; $7691: $21 $40 $C4
    add  hl, bc                                   ; $7694: $09
    ld   a, [hl]                                  ; $7695: $7E
    ldh  [hMultiPurposeG], a                      ; $7696: $E0 $E8
    ldh  a, [hActiveEntityPosX]                   ; $7698: $F0 $EE
    sub  [hl]                                     ; $769A: $96
    sra  a                                        ; $769B: $CB $2F
    ldh  [hBGMapOffsetLow], a                     ; $769D: $E0 $E1
    sra  a                                        ; $769F: $CB $2F
    ldh  [hMultiPurposeB], a                      ; $76A1: $E0 $E2
    sra  a                                        ; $76A3: $CB $2F
    ldh  [hMultiPurposeC], a                      ; $76A5: $E0 $E3
    sra  a                                        ; $76A7: $CB $2F
    ldh  [hMultiPurposeD], a                      ; $76A9: $E0 $E4
    sra  a                                        ; $76AB: $CB $2F
    ldh  [hMultiPurposeE], a                      ; $76AD: $E0 $E5
    sra  a                                        ; $76AF: $CB $2F
    ldh  [hFreeWarpDataAddress], a                ; $76B1: $E0 $E6
    ld   hl, wEntitiesPrivateState3Table          ; $76B3: $21 $D0 $C2
    add  hl, bc                                   ; $76B6: $09
    ld   a, [hl]                                  ; $76B7: $7E
    ldh  [hMultiPurposeH], a                      ; $76B8: $E0 $E9
    ldh  a, [hActiveEntityVisualPosY]             ; $76BA: $F0 $EC
    sub  $20                                      ; $76BC: $D6 $20
    cp   [hl]                                     ; $76BE: $BE
    jr   c, label_018_7726                        ; $76BF: $38 $65

    ldh  [hActiveEntityVisualPosY], a             ; $76C1: $E0 $EC
    xor  a                                        ; $76C3: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $76C4: $E0 $F1
    ld   hl, hBGMapOffsetLow                      ; $76C6: $21 $E1 $FF

jr_018_76C9:
    ldh  a, [hMultiPurposeG]                      ; $76C9: $F0 $E8
    add  [hl]                                     ; $76CB: $86
    ldh  [hActiveEntityPosX], a                   ; $76CC: $E0 $EE
    inc  hl                                       ; $76CE: $23
    push hl                                       ; $76CF: $E5
    ld   de, TurtleRockHeadSpriteVariants         ; $76D0: $11 $66 $76
    call RenderActiveEntitySpritesPair            ; $76D3: $CD $C0 $3B
    ld   a, [wInvincibilityCounter]               ; $76D6: $FA $C7 $DB
    and  a                                        ; $76D9: $A7
    jr   nz, jr_018_7717                          ; $76DA: $20 $3B

    ld   hl, hActiveEntityVisualPosY              ; $76DC: $21 $EC $FF
    ldh  a, [hLinkPositionY]                      ; $76DF: $F0 $99
    sub  [hl]                                     ; $76E1: $96
    add  $0C                                      ; $76E2: $C6 $0C
    cp   $18                                      ; $76E4: $FE $18
    jr   nc, jr_018_7717                          ; $76E6: $30 $2F

    ld   hl, hActiveEntityPosX                    ; $76E8: $21 $EE $FF
    ldh  a, [hLinkPositionX]                      ; $76EB: $F0 $98
    sub  [hl]                                     ; $76ED: $96
    ld   e, a                                     ; $76EE: $5F
    add  $0C                                      ; $76EF: $C6 $0C
    cp   $18                                      ; $76F1: $FE $18
    jr   nc, jr_018_7717                          ; $76F3: $30 $22

    ld   a, e                                     ; $76F5: $7B
    ld   e, $20                                   ; $76F6: $1E $20
    and  $80                                      ; $76F8: $E6 $80
    jr   z, .jr_76FE                              ; $76FA: $28 $02

    ld   e, $E0                                   ; $76FC: $1E $E0

.jr_76FE
    ld   a, e                                     ; $76FE: $7B
    ldh  [hLinkSpeedX], a                         ; $76FF: $E0 $9A
    xor  a                                        ; $7701: $AF
    ldh  [hLinkSpeedY], a                         ; $7702: $E0 $9B
    ld   a, $18                                   ; $7704: $3E $18
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $7706: $EA $3E $C1
    ld   a, $10                                   ; $7709: $3E $10
    ld   [wInvincibilityCounter], a               ; $770B: $EA $C7 $DB
    ld   a, $08                                   ; $770E: $3E $08
    ld   [wSubtractHealthBuffer], a               ; $7710: $EA $94 $DB
    ld   a, WAVE_SFX_LINK_HURT                    ; $7713: $3E $03
    ldh  [hWaveSfx], a                            ; $7715: $E0 $F3

jr_018_7717:
    pop  hl                                       ; $7717: $E1
    ldh  a, [hMultiPurposeH]                      ; $7718: $F0 $E9
    ld   e, a                                     ; $771A: $5F
    ldh  a, [hActiveEntityVisualPosY]             ; $771B: $F0 $EC
    sub  $10                                      ; $771D: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $771F: $E0 $EC
    sub  e                                        ; $7721: $93
    and  $80                                      ; $7722: $E6 $80
    jr   z, jr_018_76C9                           ; $7724: $28 $A3

label_018_7726:
    jp   CopyEntityPositionToActivePosition       ; $7726: $C3 $8A $3D
