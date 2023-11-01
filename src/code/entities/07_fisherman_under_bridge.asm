Data_007_4234::
    db   $00, $F0, $78, $01, $00, $F8, $7A, $01, $00, $00, $70, $01, $00, $08, $72, $01
    db   $00, $F0, $7C, $01, $00, $F8, $7E, $01, $00, $00, $70, $01, $00, $08, $72, $01
    db   $00, $F0, $78, $01, $00, $F8, $7A, $01, $00, $00, $74, $01, $00, $08, $76, $01
    db   $FC, $F0, $64, $01, $FC, $F8, $66, $01, $00, $00, $60, $01, $00, $08, $62, $01
    db   $FC, $F0, $64, $01, $FC, $F8, $66, $01, $00, $00, $74, $01, $00, $08, $76, $01

FishermanUnderBridgeEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4284: $21 $B0 $C2
    add  hl, bc                                   ; $4287: $09
    ld   a, [hl]                                  ; $4288: $7E
    cp   $02                                      ; $4289: $FE $02
    jp   z, label_007_45F7                        ; $428B: $CA $F7 $45

    and  a                                        ; $428E: $A7
    jr   nz, .jr_42C4                             ; $428F: $20 $33

    inc  [hl]                                     ; $4291: $34
    ld   hl, wEntitiesPosYTable                   ; $4292: $21 $10 $C2
    add  hl, bc                                   ; $4295: $09
    ld   a, [hl]                                  ; $4296: $7E
    add  $08                                      ; $4297: $C6 $08
    ld   [hl], a                                  ; $4299: $77
    ld   a, ENTITY_FISHERMAN_UNDER_BRIDGE         ; $429A: $3E $B8
    call SpawnNewEntity_trampoline                ; $429C: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $429F: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $42A1: $21 $00 $C2
    add  hl, de                                   ; $42A4: $19
    add  $06                                      ; $42A5: $C6 $06
    ld   [hl], a                                  ; $42A7: $77
    ldh  a, [hMultiPurpose1]                      ; $42A8: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $42AA: $21 $10 $C2
    add  hl, de                                   ; $42AD: $19
    add  $10                                      ; $42AE: $C6 $10
    ld   [hl], a                                  ; $42B0: $77
    ld   hl, wEntitiesPrivateState1Table          ; $42B1: $21 $B0 $C2
    add  hl, de                                   ; $42B4: $19
    ld   [hl], $02                                ; $42B5: $36 $02
    ld   hl, wEntitiesHitboxFlagsTable            ; $42B7: $21 $50 $C3
    add  hl, de                                   ; $42BA: $19
    ld   [hl], $AC                                ; $42BB: $36 $AC
    push bc                                       ; $42BD: $C5
    ld   c, e                                     ; $42BE: $4B
    ld   b, d                                     ; $42BF: $42
    call ConfigureEntityHitbox                    ; $42C0: $CD $EA $3A
    pop  bc                                       ; $42C3: $C1

.jr_42C4
    ldh  a, [hActiveEntityState]                  ; $42C4: $F0 $F0
    cp   $06                                      ; $42C6: $FE $06
    jr   nc, jr_007_42DC                          ; $42C8: $30 $12

    ld   a, [wDialogState]                        ; $42CA: $FA $9F $C1
    and  a                                        ; $42CD: $A7
    jr   z, jr_007_42DC                           ; $42CE: $28 $0C

    ldh  a, [hActiveEntitySpriteVariant]          ; $42D0: $F0 $F1
    cp   $03                                      ; $42D2: $FE $03
    ld   a, $02                                   ; $42D4: $3E $02
    jr   nz, .jr_42DA                             ; $42D6: $20 $02

    ld   a, $04                                   ; $42D8: $3E $04

.jr_42DA
    ldh  [hActiveEntitySpriteVariant], a          ; $42DA: $E0 $F1

jr_007_42DC:
    call func_007_4594                            ; $42DC: $CD $94 $45
    ldh  a, [hActiveEntityState]                  ; $42DF: $F0 $F0
    cp   $0A                                      ; $42E1: $FE $0A
    jr   c, .jr_42E8                              ; $42E3: $38 $03

    call func_007_43FD                            ; $42E5: $CD $FD $43

.jr_42E8
    call ReturnIfNonInteractive_07                ; $42E8: $CD $96 $7D
    ld   a, [wPhotos1]                            ; $42EB: $FA $0C $DC
    bit  0, a                                     ; $42EE: $CB $47
    jp   z, label_007_4328                        ; $42F0: $CA $28 $43

    bit  7, a                                     ; $42F3: $CB $7F
    jp   nz, label_007_4328                       ; $42F5: $C2 $28 $43

    ld   a, [wTradeSequenceItem]                  ; $42F8: $FA $0E $DB
    cp   $0D                                      ; $42FB: $FE $0D
    jp   c, label_007_4328                        ; $42FD: $DA $28 $43

    ldh  a, [hActiveEntityState]                  ; $4300: $F0 $F0
    cp   $02                                      ; $4302: $FE $02
    jr   c, .jr_4309                              ; $4304: $38 $03

    call func_007_434E                            ; $4306: $CD $4E $43

.jr_4309
    ldh  a, [hActiveEntityState]                  ; $4309: $F0 $F0
    JP_TABLE                                      ; $430B
._00 dw func_007_4335                             ; $430C
._01 dw func_007_4356                             ; $430E
._02 dw func_007_4373                             ; $4310
._03 dw func_007_4377                             ; $4312
._04 dw func_007_4382                             ; $4314
._05 dw func_007_438C                             ; $4316
._06 dw func_007_4509                             ; $4318
._07 dw func_007_43AD                             ; $431A
._08 dw func_007_43C5                             ; $431C
._09 dw func_007_441A                             ; $431E
._0A dw func_007_4454                             ; $4320
._0B dw func_007_4454                             ; $4322
._0C dw func_007_4475                             ; $4324
._0D dw func_007_4499                             ; $4326

label_007_4328:
    ldh  a, [hActiveEntityState]                  ; $4328: $F0 $F0
    JP_TABLE                                      ; $432A
._00 dw func_007_44B0                             ; $432B
._01 dw func_007_44E8                             ; $432D
._02 dw func_007_4509                             ; $432F
._03 dw func_007_4537                             ; $4331
._04 dw func_007_458B                             ; $4333

func_007_4335::
    ld   hl, wEntitiesTypeTable                   ; $4335: $21 $A0 $C3

.loop_4338
    ld   a, [hl+]                                 ; $4338: $2A
    cp   $FA                                      ; $4339: $FE $FA
    jr   z, .jr_4342                              ; $433B: $28 $05

    ld   a, l                                     ; $433D: $7D
    and  $0F                                      ; $433E: $E6 $0F
    jr   nz, .loop_4338                           ; $4340: $20 $F6

.jr_4342
    ld   a, l                                     ; $4342: $7D
    dec  a                                        ; $4343: $3D
    and  $0F                                      ; $4344: $E6 $0F
    ld   hl, wEntitiesPrivateState5Table          ; $4346: $21 $90 $C3
    add  hl, bc                                   ; $4349: $09
    ld   [hl], a                                  ; $434A: $77
    jp   IncrementEntityState                     ; $434B: $C3 $12 $3B

func_007_434E::
    ld   a, $02                                   ; $434E: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4350: $E0 $A1
    ld   [wC167], a                               ; $4352: $EA $67 $C1
    ret                                           ; $4355: $C9

func_007_4356::
    call func_007_7D43                            ; $4356: $CD $43 $7D
    jp   nc, func_007_44DC                        ; $4359: $D2 $DC $44

    ldh  a, [hLinkAnimationState]                 ; $435C: $F0 $9D
    cp   LINK_ANIMATION_STATE_STANDING_LEFT       ; $435E: $FE $06
    jp   nz, func_007_44DC                        ; $4360: $C2 $DC $44

    call func_007_434E                            ; $4363: $CD $4E $43
    ld   a, $02                                   ; $4366: $3E $02
    call SetEntitySpriteVariant                   ; $4368: $CD $0C $3B
    ld_dialog_low a, Dialog125                    ; $436B: $3E $25

jr_007_436D:
    call OpenDialogInTable1                       ; $436D: $CD $73 $23
    jp   IncrementEntityState                     ; $4370: $C3 $12 $3B

func_007_4373::
    ld_dialog_low a, Dialog1E9                    ; $4373: $3E $E9
    jr   jr_007_436D                              ; $4375: $18 $F6

func_007_4377::
    call GetEntityTransitionCountdown             ; $4377: $CD $05 $0C
    ld   [hl], $40                                ; $437A: $36 $40
    call IncrementEntityState                     ; $437C: $CD $12 $3B
    jp   func_007_44DC                            ; $437F: $C3 $DC $44

func_007_4382::
    call func_007_44DC                            ; $4382: $CD $DC $44
    call GetEntityTransitionCountdown             ; $4385: $CD $05 $0C
    ret  nz                                       ; $4388: $C0

    jp   IncrementEntityState                     ; $4389: $C3 $12 $3B

func_007_438C::
    call func_007_44DC                            ; $438C: $CD $DC $44
    ld   hl, wEntitiesPrivateState5Table          ; $438F: $21 $90 $C3
    add  hl, bc                                   ; $4392: $09
    ld   e, [hl]                                  ; $4393: $5E
    ld   d, $00                                   ; $4394: $16 $00
    ld   hl, wEntitiesPosXTable                   ; $4396: $21 $00 $C2
    add  hl, de                                   ; $4399: $19
    ld   a, [hl]                                  ; $439A: $7E
    cp   $2A                                      ; $439B: $FE $2A
    ret  nz                                       ; $439D: $C0

    ld   a, $08                                   ; $439E: $3E $08
    ld   hl, wEntitiesStateTable                  ; $43A0: $21 $90 $C2
    add  hl, de                                   ; $43A3: $19
    ld   [hl], a                                  ; $43A4: $77
    call GetEntityTransitionCountdown             ; $43A5: $CD $05 $0C
    ld   [hl], $C0                                ; $43A8: $36 $C0
    jp   IncrementEntityState                     ; $43AA: $C3 $12 $3B

func_007_43AD::
    ldh  a, [hFrameCounter]                       ; $43AD: $F0 $E7
    and  $07                                      ; $43AF: $E6 $07
    ret  nz                                       ; $43B1: $C0

    ld   hl, wEntitiesPrivateState5Table          ; $43B2: $21 $90 $C3
    add  hl, bc                                   ; $43B5: $09
    ld   e, [hl]                                  ; $43B6: $5E
    ld   d, $00                                   ; $43B7: $16 $00
    ld   hl, wEntitiesPosYTable                   ; $43B9: $21 $10 $C2
    add  hl, de                                   ; $43BC: $19
    dec  [hl]                                     ; $43BD: $35
    ld   a, [hl]                                  ; $43BE: $7E
    cp   $50                                      ; $43BF: $FE $50
    ret  nc                                       ; $43C1: $D0

    jp   IncrementEntityState                     ; $43C2: $C3 $12 $3B

func_007_43C5::
    ld   hl, wEntitiesPrivateState5Table          ; $43C5: $21 $90 $C3
    add  hl, bc                                   ; $43C8: $09
    ld   e, [hl]                                  ; $43C9: $5E
    ld   d, $00                                   ; $43CA: $16 $00
    ldh  a, [hFrameCounter]                       ; $43CC: $F0 $E7
    and  $07                                      ; $43CE: $E6 $07
    jr   nz, .jr_43D7                             ; $43D0: $20 $05

    ld   hl, wEntitiesPosXTable                   ; $43D2: $21 $00 $C2
    add  hl, de                                   ; $43D5: $19
    inc  [hl]                                     ; $43D6: $34

.jr_43D7
    ldh  a, [hFrameCounter]                       ; $43D7: $F0 $E7
    and  $01                                      ; $43D9: $E6 $01
    ret  nz                                       ; $43DB: $C0

    ld   hl, wEntitiesPosYTable                   ; $43DC: $21 $10 $C2
    add  hl, de                                   ; $43DF: $19
    dec  [hl]                                     ; $43E0: $35
    ld   e, [hl]                                  ; $43E1: $5E
    ld   hl, wEntitiesPosYTable                   ; $43E2: $21 $10 $C2
    add  hl, bc                                   ; $43E5: $09
    ld   a, [hl]                                  ; $43E6: $7E
    add  $02                                      ; $43E7: $C6 $02
    cp   e                                        ; $43E9: $BB
    ret  c                                        ; $43EA: $D8

    call_open_dialog Dialog124                    ; $43EB
    ld   a, $04                                   ; $43F0: $3E $04
    call SetEntitySpriteVariant                   ; $43F2: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $43F5: $CD $05 $0C
    ld   [hl], $50                                ; $43F8: $36 $50
    jp   IncrementEntityState                     ; $43FA: $C3 $12 $3B

func_007_43FD::
    push bc                                       ; $43FD: $C5
    ld   bc, wOAMBuffer+$10                       ; $43FE: $01 $10 $C0
    ldh  a, [hLinkPositionY]                      ; $4401: $F0 $99
    ldh  [hMultiPurpose0], a                      ; $4403: $E0 $D7
    ldh  a, [hLinkPositionX]                      ; $4405: $F0 $98
    ldh  [hMultiPurpose1], a                      ; $4407: $E0 $D8
    ld   a, $06                                   ; $4409: $3E $06
    ldh  [hMultiPurpose2], a                      ; $440B: $E0 $D9
    ld   h, $F0                                   ; $440D: $26 $F0
    ld   l, $FC                                   ; $440F: $2E $FC
    call func_1819                                ; $4411: $CD $19 $18
    pop  bc                                       ; $4414: $C1
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ; $4415: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $4417: $E0 $9D
    ret                                           ; $4419: $C9

func_007_441A::
    ld   a, $04                                   ; $441A: $3E $04
    call SetEntitySpriteVariant                   ; $441C: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $441F: $CD $05 $0C
    jr   nz, func_007_4429                        ; $4422: $20 $05

    ld   [hl], $30                                ; $4424: $36 $30
    call IncrementEntityState                     ; $4426: $CD $12 $3B

func_007_4429::
    ldh  a, [hActiveEntityState]                  ; $4429: $F0 $F0
    cp   $0C                                      ; $442B: $FE $0C
    jr   c, .jr_4436                              ; $442D: $38 $07

    call GetEntitySpeedYAddress                   ; $442F: $CD $05 $40
    ld   a, [hl]                                  ; $4432: $7E
    bit  7, a                                     ; $4433: $CB $7F
    ret  z                                        ; $4435: $C8

.jr_4436
    ld   hl, wEntitiesPrivateState5Table          ; $4436: $21 $90 $C3
    add  hl, bc                                   ; $4439: $09
    ld   e, [hl]                                  ; $443A: $5E
    ld   d, $00                                   ; $443B: $16 $00
    ld   hl, wEntitiesPosYTable                   ; $443D: $21 $10 $C2
    add  hl, bc                                   ; $4440: $09
    ld   a, [hl]                                  ; $4441: $7E
    ld   hl, wEntitiesPosYTable                   ; $4442: $21 $10 $C2
    add  hl, de                                   ; $4445: $19
    ld   [hl], a                                  ; $4446: $77
    ld   hl, wEntitiesPosXTable                   ; $4447: $21 $00 $C2
    add  hl, bc                                   ; $444A: $09
    ld   a, [hl]                                  ; $444B: $7E
    sub  $1A                                      ; $444C: $D6 $1A
    ld   hl, wEntitiesPosXTable                   ; $444E: $21 $00 $C2
    add  hl, de                                   ; $4451: $19
    ld   [hl], a                                  ; $4452: $77
    ret                                           ; $4453: $C9

func_007_4454::
    call func_007_4429                            ; $4454: $CD $29 $44
    call GetEntityTransitionCountdown             ; $4457: $CD $05 $0C
    ret  nz                                       ; $445A: $C0

    ld   [hl], $10                                ; $445B: $36 $10
    ld   a, $04                                   ; $445D: $3E $04
    call SetEntitySpriteVariant                   ; $445F: $CD $0C $3B
    call IncrementEntityState                     ; $4462: $CD $12 $3B
    ld   a, [hl]                                  ; $4465: $7E
    cp   $0C                                      ; $4466: $FE $0C
    ret  nz                                       ; $4468: $C0

    ld   hl, wEntitiesSpeedXTable                 ; $4469: $21 $40 $C2
    add  hl, bc                                   ; $446C: $09
    ld   [hl], $F8                                ; $446D: $36 $F8
    call GetEntitySpeedYAddress                   ; $446F: $CD $05 $40
    ld   [hl], $F8                                ; $4472: $36 $F8
    ret                                           ; $4474: $C9

func_007_4475::
    call func_007_4429                            ; $4475: $CD $29 $44
    ld   hl, wEntitiesPosYTable                   ; $4478: $21 $10 $C2
    add  hl, bc                                   ; $447B: $09
    ld   a, [hl]                                  ; $447C: $7E
    cp   $4C                                      ; $447D: $FE $4C
    jr   c, .jr_4491                              ; $447F: $38 $10

    call func_007_48FD                            ; $4481: $CD $FD $48
    call_open_dialog Dialog117                    ; $4484
    ld   a, $04                                   ; $4489: $3E $04
    call SetEntitySpriteVariant                   ; $448B: $CD $0C $3B
    jp   IncrementEntityState                     ; $448E: $C3 $12 $3B

.jr_4491
    call UpdateEntityPosWithSpeed_07              ; $4491: $CD $0A $7E
    call GetEntitySpeedYAddress                   ; $4494: $CD $05 $40
    inc  [hl]                                     ; $4497: $34
    ret                                           ; $4498: $C9

func_007_4499::
    call func_007_4429                            ; $4499: $CD $29 $44
    ld   a, NOISE_SFX_PHOTO                       ; $449C: $3E $40
    ldh  [hNoiseSfx], a                           ; $449E: $E0 $F4
    ld   a, GAMEPLAY_PHOTO_FISHERMAN              ; $44A0: $3E $16
    ld   [wGameplayType], a                       ; $44A2: $EA $95 $DB
    xor  a                                        ; $44A5: $AF
    ld   [wGameplaySubtype], a                    ; $44A6: $EA $96 $DB
    ld   [wTransitionSequenceCounter], a          ; $44A9: $EA $6B $C1
    ld   [wC16C], a                               ; $44AC: $EA $6C $C1
    ret                                           ; $44AF: $C9

func_007_44B0::
    call func_007_7D43                            ; $44B0: $CD $43 $7D
    jr   nc, func_007_44DC                        ; $44B3: $30 $27

    ldh  a, [hLinkAnimationState]                 ; $44B5: $F0 $9D
    cp   LINK_ANIMATION_STATE_STANDING_SIDE_SCROLL_LEFT_DOWN ; $44B7: $FE $58
    jr   c, .jr_44BF                              ; $44B9: $38 $04

    cp   $5E                                      ; $44BB: $FE $5E
    jr   c, func_007_44DC                         ; $44BD: $38 $1D

.jr_44BF
    ld   a, [wTradeSequenceItem]                  ; $44BF: $FA $0E $DB
    cp   $0B                                      ; $44C2: $FE $0B
    jr   nz, .jr_44CE                             ; $44C4: $20 $08

    call_open_dialog Dialog1E8                    ; $44C6
    jp   IncrementEntityState                     ; $44CB: $C3 $12 $3B

.jr_44CE
    cp   $0C                                      ; $44CE: $FE $0C
    jr   nc, .jr_44D7                             ; $44D0: $30 $05

    jp_open_dialog Dialog1E7                      ; $44D2

.jr_44D7
    jp_open_dialog Dialog1ED                      ; $44D7

func_007_44DC::
    ldh  a, [hFrameCounter]                       ; $44DC: $F0 $E7
    and  $30                                      ; $44DE: $E6 $30
    ld   e, b                                     ; $44E0: $58
    jr   z, .jr_44E4                              ; $44E1: $28 $01

    inc  e                                        ; $44E3: $1C

.jr_44E4
    ld   a, e                                     ; $44E4: $7B
    jp   SetEntitySpriteVariant                   ; $44E5: $C3 $0C $3B

func_007_44E8::
    call IncrementEntityState                     ; $44E8: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ; $44EB: $FA $77 $C1
    and  a                                        ; $44EE: $A7
    jr   nz, .jr_4503                             ; $44EF: $20 $12

    ld   a, $01                                   ; $44F1: $3E $01
    ld   [wExchangingTradeSequenceItem], a        ; $44F3: $EA $7F $DB
    ld   [wC167], a                               ; $44F6: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $44F9: $CD $05 $0C
    ld   [hl], $D0                                ; $44FC: $36 $D0
    jp_open_dialog Dialog1E9                      ; $44FE

.jr_4503
    ld   [hl], b                                  ; $4503: $70
    jp_open_dialog Dialog1EA                      ; $4504

func_007_4509::
    ld   a, $02                                   ; $4509: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $450B: $E0 $A1
    ld   a, $01                                   ; $450D: $3E $01
    ld   [wMusicTrackTiming], a                   ; $450F: $EA $0B $C1
    call GetEntityTransitionCountdown             ; $4512: $CD $05 $0C
    jr   nz, .jr_4521                             ; $4515: $20 $0A

    ld   [hl], $20                                ; $4517: $36 $20
    call_open_dialog Dialog1EB                    ; $4519
    call IncrementEntityState                     ; $451E: $CD $12 $3B

.jr_4521
    ld   e, $03                                   ; $4521: $1E $03
    cp   $30                                      ; $4523: $FE $30
    jr   c, .jr_4533                              ; $4525: $38 $0C

    cp   $80                                      ; $4527: $FE $80
    jr   nc, func_007_44DC                        ; $4529: $30 $B1

    ldh  a, [hFrameCounter]                       ; $452B: $F0 $E7
    and  $18                                      ; $452D: $E6 $18
    ld   e, b                                     ; $452F: $58
    jr   z, .jr_4533                              ; $4530: $28 $01

    inc  e                                        ; $4532: $1C

.jr_4533
    ld   a, e                                     ; $4533: $7B
    jp   SetEntitySpriteVariant                   ; $4534: $C3 $0C $3B

func_007_4537::
    ld   a, $02                                   ; $4537: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4539: $E0 $A1
    call GetEntityTransitionCountdown             ; $453B: $CD $05 $0C
    jr   nz, .jr_4586                             ; $453E: $20 $46

    ld   [wMusicTrackTiming], a                   ; $4540: $EA $0B $C1
    call IncrementEntityState                     ; $4543: $CD $12 $3B
    ld   a, ENTITY_FISHERMAN_FISHING_GAME         ; $4546: $3E $54
    call SpawnNewEntity_trampoline                ; $4548: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $454B: $F0 $D7
    sub  $20                                      ; $454D: $D6 $20
    ld   hl, wEntitiesPosXTable                   ; $454F: $21 $00 $C2
    add  hl, de                                   ; $4552: $19
    ld   [hl], a                                  ; $4553: $77
    ldh  [hActiveEntityPosX], a                   ; $4554: $E0 $EE
    ldh  a, [hMultiPurpose1]                      ; $4556: $F0 $D8
    add  $08                                      ; $4558: $C6 $08
    ld   hl, wEntitiesPosYTable                   ; $455A: $21 $10 $C2
    add  hl, de                                   ; $455D: $19
    ld   [hl], a                                  ; $455E: $77
    ldh  [hActiveEntityVisualPosY], a             ; $455F: $E0 $EC
    ld   hl, wEntitiesSpeedZTable                 ; $4561: $21 $20 $C3
    add  hl, de                                   ; $4564: $19
    ld   [hl], $20                                ; $4565: $36 $20
    ld   hl, wEntitiesPrivateState4Table          ; $4567: $21 $40 $C4
    add  hl, de                                   ; $456A: $19
    ld   [hl], $01                                ; $456B: $36 $01
    push bc                                       ; $456D: $C5
    ld   c, e                                     ; $456E: $4B
    ld   b, d                                     ; $456F: $42
    ld   a, $0A                                   ; $4570: $3E $0A
    call ApplyVectorTowardsLink_trampoline        ; $4572: $CD $AA $3B
    pop  bc                                       ; $4575: $C1
    call func_007_48FD                            ; $4576: $CD $FD $48
    ld   a, JINGLE_FALL_DOWN                      ; $4579: $3E $08
    ldh  [hJingle], a                             ; $457B: $E0 $F2
    ld   a, TRADING_ITEM_NECKLACE                 ; $457D: $3E $0C
    ld   [wTradeSequenceItem], a                  ; $457F: $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ; $4582: $3E $0D
    ldh  [hReplaceTiles], a                       ; $4584: $E0 $A5

.jr_4586
    ld   a, $03                                   ; $4586: $3E $03
    jp   SetEntitySpriteVariant                   ; $4588: $C3 $0C $3B

func_007_458B::
    ld   a, $02                                   ; $458B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $458D: $E0 $A1
    call IncrementEntityState                     ; $458F: $CD $12 $3B
    ld   [hl], b                                  ; $4592: $70
    ret                                           ; $4593: $C9

func_007_4594::
    ldh  a, [hActiveEntitySpriteVariant]          ; $4594: $F0 $F1
    rla                                           ; $4596: $17
    rla                                           ; $4597: $17
    rla                                           ; $4598: $17
    rla                                           ; $4599: $17
    and  $F0                                      ; $459A: $E6 $F0
    ld   e, a                                     ; $459C: $5F
    ld   d, b                                     ; $459D: $50
    ld   hl, Data_007_4234                        ; $459E: $21 $34 $42
    add  hl, de                                   ; $45A1: $19
    ld   c, $04                                   ; $45A2: $0E $04
    jp   RenderActiveEntitySpritesRect            ; $45A4: $C3 $E6 $3C

; Unused data
; (Maybe was intended to be the Fisherman bobbing positions)
Data_007_45A7::
    db   -02, -02, -02, -02, -01, -01, -01, -01   ; $45A7
    db   -01,  00,  00,  01,  01,  01,  01,  01   ; $45AF
    db    02,  02,  02,  02,  02,  02,  02,  02   ; $45B7
    db    02,  02,  02,  02,  02,  02,  02,  02   ; $45BF
    db    02,  02,  01,  00,  00, -01, -02, -02   ; $45C7
    db    01,  01,  01,  00,  00, -01, -01, -01   ; $45CF
    db    00,  00,  00,  00,  00,  00,  00,  00   ; $45D7
    db   -01, -01, -01,  00,  00,  01,  01,  01   ; $45DF
    db   -02, -02, -01,  00,  00,  01,  02,  02   ; $45E7

Data_007_45EF::
    db   $00, $00, $01, $02, $02, $02, $01, $00

label_007_45F7:
    ld   hl, wEntitiesInertiaTable                ; $45F7: $21 $D0 $C3
    add  hl, bc                                   ; $45FA: $09
    ld   a, [hl]                                  ; $45FB: $7E
    rra                                           ; $45FC: $1F
    rra                                           ; $45FD: $1F
    rra                                           ; $45FE: $1F
    and  $07                                      ; $45FF: $E6 $07
    ld   e, a                                     ; $4601: $5F
    ld   d, b                                     ; $4602: $50
    ld   hl, Data_007_45EF                        ; $4603: $21 $EF $45
    add  hl, de                                   ; $4606: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $4607: $F0 $EC
    add  [hl]                                     ; $4609: $86
    ldh  [hActiveEntityVisualPosY], a             ; $460A: $E0 $EC
    ld   a, [wEntitiesStateTable]                 ; $460C: $FA $90 $C2
    cp   $0C                                      ; $460F: $FE $0C
    jr   nc, .jr_461A                             ; $4611: $30 $07

    ldh  a, [hActiveEntityVisualPosY]             ; $4613: $F0 $EC
    sub  $10                                      ; $4615: $D6 $10
    ld   [wEntitiesPosYTable], a                  ; $4617: $EA $10 $C2

.jr_461A
    call func_007_467B                            ; $461A: $CD $7B $46
    call CheckLinkCollisionWithEnemy_trampoline   ; $461D: $CD $5A $3B
    jr   nc, .jr_4640                             ; $4620: $30 $1E

    ldh  a, [hLinkSpeedY]                         ; $4622: $F0 $9B
    and  $80                                      ; $4624: $E6 $80
    jr   nz, .jr_4640                             ; $4626: $20 $18

    call EntityLinkPositionYDifference_07         ; $4628: $CD $6D $7E
    add  $08                                      ; $462B: $C6 $08
    bit  7, a                                     ; $462D: $CB $7F
    jr   z, .jr_4640                              ; $462F: $28 $0F

    ldh  a, [hActiveEntityVisualPosY]             ; $4631: $F0 $EC
    sub  $0F                                      ; $4633: $D6 $0F
    ldh  [hLinkPositionY], a                      ; $4635: $E0 $99
    ld   a, $02                                   ; $4637: $3E $02
    ldh  [hLinkSpeedY], a                         ; $4639: $E0 $9B
    ld   a, $01                                   ; $463B: $3E $01
    ld   [wC147], a                               ; $463D: $EA $47 $C1

.jr_4640
    call ReturnIfNonInteractive_07                ; $4640: $CD $96 $7D
    ld   hl, wEntitiesInertiaTable                ; $4643: $21 $D0 $C3
    add  hl, bc                                   ; $4646: $09
    inc  [hl]                                     ; $4647: $34
    ld   a, [hl]                                  ; $4648: $7E
    and  $07                                      ; $4649: $E6 $07
    jr   nz, ret_007_4666                         ; $464B: $20 $19

    ld   e, $48                                   ; $464D: $1E $48
    ld   a, [wC147]                               ; $464F: $FA $47 $C1
    and  a                                        ; $4652: $A7
    jr   z, .jr_4657                              ; $4653: $28 $02

    ld   e, $4B                                   ; $4655: $1E $4B

.jr_4657
    ld   hl, wEntitiesPosYTable                   ; $4657: $21 $10 $C2
    add  hl, bc                                   ; $465A: $09
    ld   a, [hl]                                  ; $465B: $7E
    sub  e                                        ; $465C: $93
    jr   z, ret_007_4666                          ; $465D: $28 $07

    and  $80                                      ; $465F: $E6 $80
    jr   z, .jr_4665                              ; $4661: $28 $02

    inc  [hl]                                     ; $4663: $34
    inc  [hl]                                     ; $4664: $34

.jr_4665
    dec  [hl]                                     ; $4665: $35

ret_007_4666:
    ret                                           ; $4666: $C9

Data_007_4667::
    db   $00, $F8, $68, $02, $00, $00, $6A, $02, $00, $08, $6A, $02, $00, $10, $6A, $02
    db   $00, $18, $6C, $02

func_007_467B::
    ld   hl, Data_007_4667                        ; $467B: $21 $67 $46
    ld   c, $05                                   ; $467E: $0E $05
    jp   RenderActiveEntitySpritesRect            ; $4680: $C3 $E6 $3C
