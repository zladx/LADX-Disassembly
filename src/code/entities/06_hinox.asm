Data_006_4FB0::
    db   $08, $F8, $00, $00

Data_006_4FB4::
    db   $00, $00, $F8, $08

HinoxEntityHandler::
    call func_006_52BA                            ; $4FB8: $CD $BA $52
    xor  a                                        ; $4FBB: $AF
    ld   [wC167], a                               ; $4FBC: $EA $67 $C1
    ldh  a, [hActiveEntityStatus]                 ; $4FBF: $F0 $EA
    cp   $05                                      ; $4FC1: $FE $05
    jp   nz, label_006_5308                       ; $4FC3: $C2 $08 $53

    call ReturnIfNonInteractive_06                ; $4FC6: $CD $C6 $64
    call BossIntro                                ; $4FC9: $CD $E8 $3E
    call ApplyRecoilIfNeeded_06                   ; $4FCC: $CD $F7 $64
    call GetEntityPrivateCountdown1               ; $4FCF: $CD $00 $0C
    jr   z, .jr_4FD7                              ; $4FD2: $28 $03

    call func_006_51B0                            ; $4FD4: $CD $B0 $51

.jr_4FD7
    ldh  a, [hActiveEntityState]                  ; $4FD7: $F0 $F0
    cp   $04                                      ; $4FD9: $FE $04
    jr   nc, .jr_4FF1                             ; $4FDB: $30 $14

    ld   hl, wEntitiesFlashCountdownTable         ; $4FDD: $21 $20 $C4
    add  hl, bc                                   ; $4FE0: $09
    ld   a, [hl]                                  ; $4FE1: $7E
    cp   $03                                      ; $4FE2: $FE $03
    jr   nz, .jr_4FF1                             ; $4FE4: $20 $0B

    call IncrementEntityState                     ; $4FE6: $CD $12 $3B
    ld   [hl], $05                                ; $4FE9: $36 $05
    call GetEntityTransitionCountdown             ; $4FEB: $CD $05 $0C
    ld   [hl], $20                                ; $4FEE: $36 $20
    ret                                           ; $4FF0: $C9

.jr_4FF1
    ldh  a, [hActiveEntityState]                  ; $4FF1: $F0 $F0
    JP_TABLE                                      ; $4FF3
._00 dw HinoxState0Handler                             ; $4FF4
._01 dw HinoxState1Handler                             ; $4FF6
._02 dw HinoxState2Handler                             ; $4FF8
._03 dw HinoxState3Handler                             ; $4FFA
._04 dw HinoxState4Handler                             ; $4FFC
._05 dw HinoxState5Handler                             ; $4FFE

HinoxState1Handler::
    call label_3B39                               ; $5000: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $5003: $CD $05 $0C
    jr   z, jr_006_501A                           ; $5006: $28 $12

    cp   $0A                                      ; $5008: $FE $0A
    jr   nz, .jr_5017                             ; $500A: $20 $0B

    call func_006_65B4                            ; $500C: $CD $B4 $65
    ld   hl, wEntitiesDirectionTable              ; $500F: $21 $80 $C3
    add  hl, bc                                   ; $5012: $09
    ld   a, e                                     ; $5013: $7B
    cp   [hl]                                     ; $5014: $BE
    jr   nz, .jr_5017                             ; $5015: $20 $00

.jr_5017
    jp   label_3B23                               ; $5017: $C3 $23 $3B

jr_006_501A:
    ld   hl, wEntitiesPrivateState3Table          ; $501A: $21 $D0 $C2
    add  hl, bc                                   ; $501D: $09
    inc  [hl]                                     ; $501E: $34
    ld   a, [hl]                                  ; $501F: $7E
    cp   $02                                      ; $5020: $FE $02
    jr   nz, .jr_5037                             ; $5022: $20 $13

    ld   [hl], b                                  ; $5024: $70
    call GetRandomByte                            ; $5025: $CD $0D $28
    and  $01                                      ; $5028: $E6 $01
    jr   nz, .jr_5037                             ; $502A: $20 $0B

    call IncrementEntityState                     ; $502C: $CD $12 $3B
    ld   [hl], $02                                ; $502F: $36 $02
    call GetEntityTransitionCountdown             ; $5031: $CD $05 $0C
    ld   [hl], $30                                ; $5034: $36 $30
    ret                                           ; $5036: $C9

.jr_5037
    call GetEntityTransitionCountdown             ; $5037: $CD $05 $0C
    call GetRandomByte                            ; $503A: $CD $0D $28
    and  $1F                                      ; $503D: $E6 $1F
    or   $20                                      ; $503F: $F6 $20
    ld   [hl], a                                  ; $5041: $77
    call IncrementEntityState                     ; $5042: $CD $12 $3B
    ld   [hl], b                                  ; $5045: $70
    ld   hl, wEntitiesPrivateState1Table          ; $5046: $21 $B0 $C2
    add  hl, bc                                   ; $5049: $09
    ld   a, [hl]                                  ; $504A: $7E
    inc  a                                        ; $504B: $3C
    and  $03                                      ; $504C: $E6 $03
    ld   [hl], a                                  ; $504E: $77
    cp   $00                                      ; $504F: $FE $00
    jr   nz, .jr_5058                             ; $5051: $20 $05

    call func_006_65B4                            ; $5053: $CD $B4 $65
    jr   jr_006_505B                              ; $5056: $18 $03

.jr_5058
    call GetRandomByte                            ; $5058: $CD $0D $28

jr_006_505B:
    and  $03                                      ; $505B: $E6 $03
    ld   e, a                                     ; $505D: $5F
    ld   d, b                                     ; $505E: $50
    ld   hl, Data_006_4FB0                        ; $505F: $21 $B0 $4F
    add  hl, de                                   ; $5062: $19
    ld   a, [hl]                                  ; $5063: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5064: $21 $40 $C2
    add  hl, bc                                   ; $5067: $09
    ld   [hl], a                                  ; $5068: $77
    ld   hl, Data_006_4FB4                        ; $5069: $21 $B4 $4F
    add  hl, de                                   ; $506C: $19
    ld   a, [hl]                                  ; $506D: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $506E: $21 $50 $C2
    add  hl, bc                                   ; $5071: $09
    ld   [hl], a                                  ; $5072: $77
    ret                                           ; $5073: $C9

HinoxState0Handler::
    call label_3B39                               ; $5074: $CD $39 $3B
    ld   hl, wEntitiesCollisionsTable             ; $5077: $21 $A0 $C2
    add  hl, bc                                   ; $507A: $09
    ld   a, [hl]                                  ; $507B: $7E
    and  $0F                                      ; $507C: $E6 $0F
    jr   nz, .jr_5085                             ; $507E: $20 $05

    call GetEntityTransitionCountdown             ; $5080: $CD $05 $0C
    jr   nz, jr_006_5093                          ; $5083: $20 $0E

.jr_5085
    call GetRandomByte                            ; $5085: $CD $0D $28
    and  $0F                                      ; $5088: $E6 $0F
    or   $10                                      ; $508A: $F6 $10
    ld   [hl], a                                  ; $508C: $77
    call IncrementEntityState                     ; $508D: $CD $12 $3B
    call ClearEntitySpeed                         ; $5090: $CD $7F $3D

jr_006_5093:
    call UpdateEntityPosWithSpeed_06              ; $5093: $CD $41 $65
    call label_3B23                               ; $5096: $CD $23 $3B

func_006_5099::
    ld   hl, wEntitiesInertiaTable                ; $5099: $21 $D0 $C3
    add  hl, bc                                   ; $509C: $09
    inc  [hl]                                     ; $509D: $34
    ld   a, [hl]                                  ; $509E: $7E
    rra                                           ; $509F: $1F
    rra                                           ; $50A0: $1F
    rra                                           ; $50A1: $1F
    rra                                           ; $50A2: $1F
    and  $01                                      ; $50A3: $E6 $01
    jp   SetEntitySpriteVariant                   ; $50A5: $C3 $0C $3B

HinoxState2Handler::
    call label_3B39                               ; $50A8: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $50AB: $CD $05 $0C
    jr   nz, jr_006_50BA                          ; $50AE: $20 $0A

    ld   [hl], $20                                ; $50B0: $36 $20
    call IncrementEntityState                     ; $50B2: $CD $12 $3B
    ld   a, $18                                   ; $50B5: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $50B7: $CD $AA $3B

jr_006_50BA:
    call func_006_5099                            ; $50BA: $CD $99 $50
    call func_006_5099                            ; $50BD: $CD $99 $50
    ldh  a, [hFrameCounter]                       ; $50C0: $F0 $E7
    and  $0F                                      ; $50C2: $E6 $0F
    jr   nz, .ret_50CA                            ; $50C4: $20 $04

    ld   a, JINGLE_BOUNCE                         ; $50C6: $3E $20
    ldh  [hJingle], a                             ; $50C8: $E0 $F2

.ret_50CA
    ret                                           ; $50CA: $C9

HinoxState3Handler::
    call label_3B39                               ; $50CB: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $50CE: $CD $05 $0C
    jr   nz, .jr_50D7                             ; $50D1: $20 $04

    call IncrementEntityState                     ; $50D3: $CD $12 $3B
    ld   [hl], b                                  ; $50D6: $70

.jr_50D7
    call UpdateEntityPosWithSpeed_06              ; $50D7: $CD $41 $65
    call label_3B23                               ; $50DA: $CD $23 $3B
    call func_006_6594                            ; $50DD: $CD $94 $65
    add  $18                                      ; $50E0: $C6 $18
    cp   $30                                      ; $50E2: $FE $30
    jr   nc, .jr_5102                             ; $50E4: $30 $1C

    call func_006_65A4                            ; $50E6: $CD $A4 $65
    add  $18                                      ; $50E9: $C6 $18
    cp   $30                                      ; $50EB: $FE $30
    jr   nc, .jr_5102                             ; $50ED: $30 $13

    ld   a, [wLinkMotionState]                    ; $50EF: $FA $1C $C1
    cp   LINK_MOTION_DEFAULT                      ; $50F2: $FE $00
    jr   nz, .jr_5102                             ; $50F4: $20 $0C

    call IncrementEntityState                     ; $50F6: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $50F9: $CD $05 $0C
    ld   [hl], $4F                                ; $50FC: $36 $4F
    ld   a, WAVE_SFX_BOSS_GROWL                   ; $50FE: $3E $16
    ldh  [hWaveSfx], a                            ; $5100: $E0 $F3

.jr_5102
    ldh  a, [hFrameCounter]                       ; $5102: $F0 $E7
    and  $07                                      ; $5104: $E6 $07
    jr   nz, .jr_5117                             ; $5106: $20 $0F

    ldh  a, [hActiveEntityPosX]                   ; $5108: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $510A: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $510C: $F0 $EC
    add  $0A                                      ; $510E: $C6 $0A
    ldh  [hMultiPurpose1], a                      ; $5110: $E0 $D8
    ld   a, TRANSCIENT_VFX_PEGASUS_DUST           ; $5112: $3E $0B
    call AddTranscientVfx                         ; $5114: $CD $C7 $0C

.jr_5117
    jr   jr_006_50BA                              ; $5117: $18 $A1

Data_006_5119::
    db   $00, $00, $00, $00, $01, $01, $01, $01, $00, $00

Data_006_5123::
    db   $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $F3, $F7, $FB, $00

Data_006_512F::
    db   $15, $15, $15, $15, $15, $14, $14, $14, $10, $08, $04, $00

HinoxState4Handler::
    call GetEntityTransitionCountdown             ; $513B: $CD $05 $0C
    jr   nz, .jr_5145                             ; $513E: $20 $05

    call IncrementEntityState                     ; $5140: $CD $12 $3B
    ld   [hl], b                                  ; $5143: $70
    ret                                           ; $5144: $C9

.jr_5145
    cp   $20                                      ; $5145: $FE $20
    jr   nz, jr_006_5179                          ; $5147: $20 $30

    ld   a, $20                                   ; $5149: $3E $20
    ldh  [hLinkSpeedY], a                         ; $514B: $E0 $9B
    ldh  a, [hLinkPositionX]                      ; $514D: $F0 $98
    cp   $50                                      ; $514F: $FE $50
    ld   a, $E0                                   ; $5151: $3E $E0
    jr   nc, .jr_5157                             ; $5153: $30 $02

    ld   a, $20                                   ; $5155: $3E $20

.jr_5157
    ldh  [hLinkSpeedX], a                         ; $5157: $E0 $9A
    ld   a, $10                                   ; $5159: $3E $10
    ldh  [hLinkVelocityZ], a                      ; $515B: $E0 $A3
    ld   a, $02                                   ; $515D: $3E $02
    ld   [wIsLinkInTheAir], a                     ; $515F: $EA $46 $C1
    ld   a, JINGLE_FALL_DOWN                      ; $5162: $3E $08
    ldh  [hJingle], a                             ; $5164: $E0 $F2
    ld   a, $08                                   ; $5166: $3E $08
    ld   [wSubtractHealthBuffer], a               ; $5168: $EA $94 $DB
    ldh  a, [hActiveEntityPosX]                   ; $516B: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $516D: $E0 $98
    ldh  a, [hActiveEntityPosY]                   ; $516F: $F0 $EF
    ldh  [hLinkPositionY], a                      ; $5171: $E0 $99
    call GetEntityPrivateCountdown1               ; $5173: $CD $00 $0C
    ld   [hl], $50                                ; $5176: $36 $50
    ret                                           ; $5178: $C9

jr_006_5179:
    rra                                           ; $5179: $1F
    rra                                           ; $517A: $1F
    rra                                           ; $517B: $1F
    and  $0F                                      ; $517C: $E6 $0F
    ld   e, a                                     ; $517E: $5F
    ld   d, b                                     ; $517F: $50
    ld   hl, Data_006_5119                        ; $5180: $21 $19 $51
    add  hl, de                                   ; $5183: $19
    ld   a, [hl]                                  ; $5184: $7E
    call SetEntitySpriteVariant                   ; $5185: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5188: $CD $05 $0C
    cp   $20                                      ; $518B: $FE $20
    jr   c, ret_006_51BB                          ; $518D: $38 $2C

    sub  $20                                      ; $518F: $D6 $20
    rra                                           ; $5191: $1F
    rra                                           ; $5192: $1F
    and  $0F                                      ; $5193: $E6 $0F
    ld   e, a                                     ; $5195: $5F
    ld   d, b                                     ; $5196: $50
    ld   hl, Data_006_5123                        ; $5197: $21 $23 $51
    add  hl, de                                   ; $519A: $19
    ldh  a, [hActiveEntityPosX]                   ; $519B: $F0 $EE
    add  [hl]                                     ; $519D: $86
    ldh  [hLinkPositionX], a                      ; $519E: $E0 $98
    ld   hl, Data_006_512F                        ; $51A0: $21 $2F $51
    add  hl, de                                   ; $51A3: $19
    ld   a, [hl]                                  ; $51A4: $7E
    ldh  [hLinkPositionZ], a                      ; $51A5: $E0 $A2
    ld   a, $02                                   ; $51A7: $3E $02
    ld   [wIsLinkInTheAir], a                     ; $51A9: $EA $46 $C1
    ldh  a, [hActiveEntityPosY]                   ; $51AC: $F0 $EF
    ldh  [hLinkPositionY], a                      ; $51AE: $E0 $99

func_006_51B0::
    ld   a, $01                                   ; $51B0: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $51B2: $E0 $A1
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ; $51B4: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $51B6: $E0 $9D
    ld   [wC167], a                               ; $51B8: $EA $67 $C1

ret_006_51BB:
    ret                                           ; $51BB: $C9

HinoxState5Handler::
    call label_3B39                               ; $51BC: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $51BF: $CD $05 $0C
    jr   nz, .jr_51C9                             ; $51C2: $20 $05

    call IncrementEntityState                     ; $51C4: $CD $12 $3B
    ld   [hl], b                                  ; $51C7: $70
    ret                                           ; $51C8: $C9

.jr_51C9
    ld   e, $00                                   ; $51C9: $1E $00
    cp   $10                                      ; $51CB: $FE $10
    jr   c, .jr_51D0                              ; $51CD: $38 $01

    inc  e                                        ; $51CF: $1C

.jr_51D0
    cp   $10                                      ; $51D0: $FE $10
    jr   nz, .jr_51F6                             ; $51D2: $20 $22

    ld   a, ENTITY_BOMB                           ; $51D4: $3E $02
    call SpawnNewEntity_trampoline                ; $51D6: $CD $86 $3B
    jr   c, .jr_51F6                              ; $51D9: $38 $1B

    ldh  a, [hMultiPurpose0]                      ; $51DB: $F0 $D7
    sub  $0C                                      ; $51DD: $D6 $0C
    ld   hl, wEntitiesPosXTable                   ; $51DF: $21 $00 $C2
    add  hl, de                                   ; $51E2: $19
    ld   [hl], a                                  ; $51E3: $77
    ldh  a, [hMultiPurpose1]                      ; $51E4: $F0 $D8
    sub  $00                                      ; $51E6: $D6 $00
    ld   hl, wEntitiesPosYTable                   ; $51E8: $21 $10 $C2
    add  hl, de                                   ; $51EB: $19
    ld   [hl], a                                  ; $51EC: $77
    ld   hl, wEntitiesPosZTable                   ; $51ED: $21 $10 $C3
    add  hl, de                                   ; $51F0: $19
    ld   [hl], $10                                ; $51F1: $36 $10
    jp   label_006_41F8                           ; $51F3: $C3 $F8 $41

.jr_51F6
    ld   a, e                                     ; $51F6: $7B
    jp   SetEntitySpriteVariant                   ; $51F7: $C3 $0C $3B

Data_006_51FA::
    db   $F4, $F8, $60, $01, $F4, $00, $62, $01, $F4, $08, $64, $01, $F4, $10, $66, $01
    db   $04, $F8, $68, $01, $04, $00, $6A, $01, $04, $08, $6C, $01, $04, $10, $6E, $01
    db   $F4, $F8, $66, $21, $F4, $00, $64, $21, $F4, $08, $62, $21, $F4, $10, $60, $21
    db   $04, $F8, $6E, $21, $04, $00, $6C, $21, $04, $08, $6A, $21, $04, $10, $68, $21

Data_006_523A::
    db   $F4, $F8, $60, $02, $F4, $00, $62, $02, $F4, $08, $64, $02, $F4, $10, $66, $02
    db   $04, $F8, $68, $02, $04, $00, $6A, $02, $04, $08, $6C, $02, $04, $10, $6E, $02
    db   $F4, $F8, $66, $22, $F4, $00, $64, $22, $F4, $08, $62, $22, $F4, $10, $60, $22
    db   $04, $F8, $6E, $22, $04, $00, $6C, $22, $04, $08, $6A, $22, $04, $10, $68, $22

Data_006_527A::
    db   $F4, $F8, $60, $03, $F4, $00, $62, $03, $F4, $08, $64, $03, $F4, $10, $66, $03
    db   $04, $F8, $68, $03, $04, $00, $6A, $03, $04, $08, $6C, $03, $04, $10, $6E, $03
    db   $F4, $F8, $66, $23, $F4, $00, $64, $23, $F4, $08, $62, $23, $F4, $10, $60, $23
    db   $04, $F8, $6E, $23, $04, $00, $6C, $23, $04, $08, $6A, $23, $04, $10, $68, $23

func_006_52BA::
    ldh  a, [hActiveEntitySpriteVariant]          ; $52BA: $F0 $F1
    rla                                           ; $52BC: $17
    rla                                           ; $52BD: $17
    rla                                           ; $52BE: $17
    rla                                           ; $52BF: $17
    rla                                           ; $52C0: $17
    and  $E0                                      ; $52C1: $E6 $E0
    ld   e, a                                     ; $52C3: $5F
    ld   d, b                                     ; $52C4: $50
    ld   hl, Data_006_527A                        ; $52C5: $21 $7A $52
    ldh  a, [hMapId]                              ; $52C8: $F0 $F7
    cp   MAP_TURTLE_ROCK                          ; $52CA: $FE $07
    jr   z, .jr_52D8                              ; $52CC: $28 $0A

    ld   hl, Data_006_523A                        ; $52CE: $21 $3A $52
    cp   $06                                      ; $52D1: $FE $06
    jr   z, .jr_52D8                              ; $52D3: $28 $03

    ld   hl, Data_006_51FA                        ; $52D5: $21 $FA $51

.jr_52D8
    add  hl, de                                   ; $52D8: $19
    ld   c, $08                                   ; $52D9: $0E $08
    jp   RenderActiveEntitySpritesRect            ; $52DB: $C3 $E6 $3C
