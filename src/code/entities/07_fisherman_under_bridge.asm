Data_007_4234::
    db   $00, $F0, $78, $01, $00, $F8, $7A, $01, $00, $00, $70, $01, $00, $08, $72, $01
    db   $00, $F0, $7C, $01, $00, $F8, $7E, $01, $00, $00, $70, $01, $00, $08, $72, $01
    db   $00, $F0, $78, $01, $00, $F8, $7A, $01, $00, $00, $74, $01, $00, $08, $76, $01
    db   $FC, $F0, $64, $01, $FC, $F8, $66, $01, $00, $00, $60, $01, $00, $08, $62, $01
    db   $FC, $F0, $64, $01, $FC, $F8, $66, $01, $00, $00, $74, $01, $00, $08, $76, $01

FishermanUnderBridgeEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 07:4284 $21 $B0 $C2
    add  hl, bc                                   ;; 07:4287 $09
    ld   a, [hl]                                  ;; 07:4288 $7E
    cp   $02                                      ;; 07:4289 $FE $02
    jp   z, label_007_45F7                        ;; 07:428B $CA $F7 $45

    and  a                                        ;; 07:428E $A7
    jr   nz, .jr_42C4                             ;; 07:428F $20 $33

    inc  [hl]                                     ;; 07:4291 $34
    ld   hl, wEntitiesPosYTable                   ;; 07:4292 $21 $10 $C2
    add  hl, bc                                   ;; 07:4295 $09
    ld   a, [hl]                                  ;; 07:4296 $7E
    add  $08                                      ;; 07:4297 $C6 $08
    ld   [hl], a                                  ;; 07:4299 $77
    ld   a, ENTITY_FISHERMAN_UNDER_BRIDGE         ;; 07:429A $3E $B8
    call SpawnNewEntity_trampoline                ;; 07:429C $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 07:429F $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 07:42A1 $21 $00 $C2
    add  hl, de                                   ;; 07:42A4 $19
    add  $06                                      ;; 07:42A5 $C6 $06
    ld   [hl], a                                  ;; 07:42A7 $77
    ldh  a, [hMultiPurpose1]                      ;; 07:42A8 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 07:42AA $21 $10 $C2
    add  hl, de                                   ;; 07:42AD $19
    add  $10                                      ;; 07:42AE $C6 $10
    ld   [hl], a                                  ;; 07:42B0 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 07:42B1 $21 $B0 $C2
    add  hl, de                                   ;; 07:42B4 $19
    ld   [hl], $02                                ;; 07:42B5 $36 $02
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:42B7 $21 $50 $C3
    add  hl, de                                   ;; 07:42BA $19
    ld   [hl], $AC                                ;; 07:42BB $36 $AC
    push bc                                       ;; 07:42BD $C5
    ld   c, e                                     ;; 07:42BE $4B
    ld   b, d                                     ;; 07:42BF $42
    call ConfigureEntityHitbox                    ;; 07:42C0 $CD $EA $3A
    pop  bc                                       ;; 07:42C3 $C1

.jr_42C4
    ldh  a, [hActiveEntityState]                  ;; 07:42C4 $F0 $F0
    cp   $06                                      ;; 07:42C6 $FE $06
    jr   nc, jr_007_42DC                          ;; 07:42C8 $30 $12

    ld   a, [wDialogState]                        ;; 07:42CA $FA $9F $C1
    and  a                                        ;; 07:42CD $A7
    jr   z, jr_007_42DC                           ;; 07:42CE $28 $0C

    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:42D0 $F0 $F1
    cp   $03                                      ;; 07:42D2 $FE $03
    ld   a, $02                                   ;; 07:42D4 $3E $02
    jr   nz, .jr_42DA                             ;; 07:42D6 $20 $02

    ld   a, $04                                   ;; 07:42D8 $3E $04

.jr_42DA
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:42DA $E0 $F1

jr_007_42DC:
    call func_007_4594                            ;; 07:42DC $CD $94 $45
    ldh  a, [hActiveEntityState]                  ;; 07:42DF $F0 $F0
    cp   $0A                                      ;; 07:42E1 $FE $0A
    jr   c, .jr_42E8                              ;; 07:42E3 $38 $03

    call func_007_43FD                            ;; 07:42E5 $CD $FD $43

.jr_42E8
    call ReturnIfNonInteractive_07                ;; 07:42E8 $CD $96 $7D
    ld   a, [wPhotos1]                            ;; 07:42EB $FA $0C $DC
    bit  0, a                                     ;; 07:42EE $CB $47
    jp   z, label_007_4328                        ;; 07:42F0 $CA $28 $43

    bit  7, a                                     ;; 07:42F3 $CB $7F
    jp   nz, label_007_4328                       ;; 07:42F5 $C2 $28 $43

    ld   a, [wTradeSequenceItem]                  ;; 07:42F8 $FA $0E $DB
    cp   TRADING_ITEM_SCALE                       ; $42FB: $FE $0D ; does the photo happen after scale trade?  
    jp   c, label_007_4328                        ;; 07:42FD $DA $28 $43

    ldh  a, [hActiveEntityState]                  ;; 07:4300 $F0 $F0
    cp   $02                                      ;; 07:4302 $FE $02
    jr   c, .jr_4309                              ;; 07:4304 $38 $03

    call func_007_434E                            ;; 07:4306 $CD $4E $43

.jr_4309
    ldh  a, [hActiveEntityState]                  ;; 07:4309 $F0 $F0
    JP_TABLE                                      ;; 07:430B
._00 dw func_007_4335                             ;; 07:430C
._01 dw func_007_4356                             ;; 07:430E
._02 dw func_007_4373                             ;; 07:4310
._03 dw func_007_4377                             ;; 07:4312
._04 dw func_007_4382                             ;; 07:4314
._05 dw func_007_438C                             ;; 07:4316
._06 dw func_007_4509                             ;; 07:4318
._07 dw func_007_43AD                             ;; 07:431A
._08 dw func_007_43C5                             ;; 07:431C
._09 dw func_007_441A                             ;; 07:431E
._0A dw func_007_4454                             ;; 07:4320
._0B dw func_007_4454                             ;; 07:4322
._0C dw func_007_4475                             ;; 07:4324
._0D dw func_007_4499                             ;; 07:4326

label_007_4328:
    ldh  a, [hActiveEntityState]                  ;; 07:4328 $F0 $F0
    JP_TABLE                                      ;; 07:432A
._00 dw func_007_44B0                             ;; 07:432B
._01 dw func_007_44E8                             ;; 07:432D
._02 dw func_007_4509                             ;; 07:432F
._03 dw func_007_4537                             ;; 07:4331
._04 dw func_007_458B                             ;; 07:4333

func_007_4335::
    ld   hl, wEntitiesTypeTable                   ;; 07:4335 $21 $A0 $C3

.loop_4338
    ld   a, [hl+]                                 ;; 07:4338 $2A
    cp   $FA                                      ;; 07:4339 $FE $FA
    jr   z, .jr_4342                              ;; 07:433B $28 $05

    ld   a, l                                     ;; 07:433D $7D
    and  $0F                                      ;; 07:433E $E6 $0F
    jr   nz, .loop_4338                           ;; 07:4340 $20 $F6

.jr_4342
    ld   a, l                                     ;; 07:4342 $7D
    dec  a                                        ;; 07:4343 $3D
    and  $0F                                      ;; 07:4344 $E6 $0F
    ld   hl, wEntitiesPrivateState5Table          ;; 07:4346 $21 $90 $C3
    add  hl, bc                                   ;; 07:4349 $09
    ld   [hl], a                                  ;; 07:434A $77
    jp   IncrementEntityState                     ;; 07:434B $C3 $12 $3B

func_007_434E::
    ld   a, $02                                   ;; 07:434E $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:4350 $E0 $A1
    ld   [wC167], a                               ;; 07:4352 $EA $67 $C1
    ret                                           ;; 07:4355 $C9

func_007_4356::
    call func_007_7D43                            ;; 07:4356 $CD $43 $7D
    jp   nc, func_007_44DC                        ;; 07:4359 $D2 $DC $44

    ldh  a, [hLinkAnimationState]                 ;; 07:435C $F0 $9D
    cp   LINK_ANIMATION_STATE_STANDING_LEFT       ;; 07:435E $FE $06
    jp   nz, func_007_44DC                        ;; 07:4360 $C2 $DC $44

    call func_007_434E                            ;; 07:4363 $CD $4E $43
    ld   a, $02                                   ;; 07:4366 $3E $02
    call SetEntitySpriteVariant                   ;; 07:4368 $CD $0C $3B
    ld_dialog_low a, Dialog125                    ;; 07:436B $3E $25

jr_007_436D:
    call OpenDialogInTable1                       ;; 07:436D $CD $73 $23
    jp   IncrementEntityState                     ;; 07:4370 $C3 $12 $3B

func_007_4373::
    ld_dialog_low a, Dialog1E9                    ;; 07:4373 $3E $E9
    jr   jr_007_436D                              ;; 07:4375 $18 $F6

func_007_4377::
    call GetEntityTransitionCountdown             ;; 07:4377 $CD $05 $0C
    ld   [hl], $40                                ;; 07:437A $36 $40
    call IncrementEntityState                     ;; 07:437C $CD $12 $3B
    jp   func_007_44DC                            ;; 07:437F $C3 $DC $44

func_007_4382::
    call func_007_44DC                            ;; 07:4382 $CD $DC $44
    call GetEntityTransitionCountdown             ;; 07:4385 $CD $05 $0C
    ret  nz                                       ;; 07:4388 $C0

    jp   IncrementEntityState                     ;; 07:4389 $C3 $12 $3B

func_007_438C::
    call func_007_44DC                            ;; 07:438C $CD $DC $44
    ld   hl, wEntitiesPrivateState5Table          ;; 07:438F $21 $90 $C3
    add  hl, bc                                   ;; 07:4392 $09
    ld   e, [hl]                                  ;; 07:4393 $5E
    ld   d, $00                                   ;; 07:4394 $16 $00
    ld   hl, wEntitiesPosXTable                   ;; 07:4396 $21 $00 $C2
    add  hl, de                                   ;; 07:4399 $19
    ld   a, [hl]                                  ;; 07:439A $7E
    cp   $2A                                      ;; 07:439B $FE $2A
    ret  nz                                       ;; 07:439D $C0

    ld   a, $08                                   ;; 07:439E $3E $08
    ld   hl, wEntitiesStateTable                  ;; 07:43A0 $21 $90 $C2
    add  hl, de                                   ;; 07:43A3 $19
    ld   [hl], a                                  ;; 07:43A4 $77
    call GetEntityTransitionCountdown             ;; 07:43A5 $CD $05 $0C
    ld   [hl], $C0                                ;; 07:43A8 $36 $C0
    jp   IncrementEntityState                     ;; 07:43AA $C3 $12 $3B

func_007_43AD::
    ldh  a, [hFrameCounter]                       ;; 07:43AD $F0 $E7
    and  $07                                      ;; 07:43AF $E6 $07
    ret  nz                                       ;; 07:43B1 $C0

    ld   hl, wEntitiesPrivateState5Table          ;; 07:43B2 $21 $90 $C3
    add  hl, bc                                   ;; 07:43B5 $09
    ld   e, [hl]                                  ;; 07:43B6 $5E
    ld   d, $00                                   ;; 07:43B7 $16 $00
    ld   hl, wEntitiesPosYTable                   ;; 07:43B9 $21 $10 $C2
    add  hl, de                                   ;; 07:43BC $19
    dec  [hl]                                     ;; 07:43BD $35
    ld   a, [hl]                                  ;; 07:43BE $7E
    cp   $50                                      ;; 07:43BF $FE $50
    ret  nc                                       ;; 07:43C1 $D0

    jp   IncrementEntityState                     ;; 07:43C2 $C3 $12 $3B

func_007_43C5::
    ld   hl, wEntitiesPrivateState5Table          ;; 07:43C5 $21 $90 $C3
    add  hl, bc                                   ;; 07:43C8 $09
    ld   e, [hl]                                  ;; 07:43C9 $5E
    ld   d, $00                                   ;; 07:43CA $16 $00
    ldh  a, [hFrameCounter]                       ;; 07:43CC $F0 $E7
    and  $07                                      ;; 07:43CE $E6 $07
    jr   nz, .jr_43D7                             ;; 07:43D0 $20 $05

    ld   hl, wEntitiesPosXTable                   ;; 07:43D2 $21 $00 $C2
    add  hl, de                                   ;; 07:43D5 $19
    inc  [hl]                                     ;; 07:43D6 $34

.jr_43D7
    ldh  a, [hFrameCounter]                       ;; 07:43D7 $F0 $E7
    and  $01                                      ;; 07:43D9 $E6 $01
    ret  nz                                       ;; 07:43DB $C0

    ld   hl, wEntitiesPosYTable                   ;; 07:43DC $21 $10 $C2
    add  hl, de                                   ;; 07:43DF $19
    dec  [hl]                                     ;; 07:43E0 $35
    ld   e, [hl]                                  ;; 07:43E1 $5E
    ld   hl, wEntitiesPosYTable                   ;; 07:43E2 $21 $10 $C2
    add  hl, bc                                   ;; 07:43E5 $09
    ld   a, [hl]                                  ;; 07:43E6 $7E
    add  $02                                      ;; 07:43E7 $C6 $02
    cp   e                                        ;; 07:43E9 $BB
    ret  c                                        ;; 07:43EA $D8

    call_open_dialog Dialog124                    ;; 07:43EB
    ld   a, $04                                   ;; 07:43F0 $3E $04
    call SetEntitySpriteVariant                   ;; 07:43F2 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 07:43F5 $CD $05 $0C
    ld   [hl], $50                                ;; 07:43F8 $36 $50
    jp   IncrementEntityState                     ;; 07:43FA $C3 $12 $3B

func_007_43FD::
    push bc                                       ;; 07:43FD $C5
    ld   bc, wOAMBuffer+$10                       ;; 07:43FE $01 $10 $C0
    ldh  a, [hLinkPositionY]                      ;; 07:4401 $F0 $99
    ldh  [hMultiPurpose0], a                      ;; 07:4403 $E0 $D7
    ldh  a, [hLinkPositionX]                      ;; 07:4405 $F0 $98
    ldh  [hMultiPurpose1], a                      ;; 07:4407 $E0 $D8
    ld   a, $06                                   ;; 07:4409 $3E $06
    ldh  [hMultiPurpose2], a                      ;; 07:440B $E0 $D9
    ld   h, $F0                                   ;; 07:440D $26 $F0
    ld   l, $FC                                   ;; 07:440F $2E $FC
    call func_1819                                ;; 07:4411 $CD $19 $18
    pop  bc                                       ;; 07:4414 $C1
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ;; 07:4415 $3E $6C
    ldh  [hLinkAnimationState], a                 ;; 07:4417 $E0 $9D
    ret                                           ;; 07:4419 $C9

func_007_441A::
    ld   a, $04                                   ;; 07:441A $3E $04
    call SetEntitySpriteVariant                   ;; 07:441C $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 07:441F $CD $05 $0C
    jr   nz, func_007_4429                        ;; 07:4422 $20 $05

    ld   [hl], $30                                ;; 07:4424 $36 $30
    call IncrementEntityState                     ;; 07:4426 $CD $12 $3B

func_007_4429::
    ldh  a, [hActiveEntityState]                  ;; 07:4429 $F0 $F0
    cp   $0C                                      ;; 07:442B $FE $0C
    jr   c, .jr_4436                              ;; 07:442D $38 $07

    call GetEntitySpeedYAddress                   ;; 07:442F $CD $05 $40
    ld   a, [hl]                                  ;; 07:4432 $7E
    bit  7, a                                     ;; 07:4433 $CB $7F
    ret  z                                        ;; 07:4435 $C8

.jr_4436
    ld   hl, wEntitiesPrivateState5Table          ;; 07:4436 $21 $90 $C3
    add  hl, bc                                   ;; 07:4439 $09
    ld   e, [hl]                                  ;; 07:443A $5E
    ld   d, $00                                   ;; 07:443B $16 $00
    ld   hl, wEntitiesPosYTable                   ;; 07:443D $21 $10 $C2
    add  hl, bc                                   ;; 07:4440 $09
    ld   a, [hl]                                  ;; 07:4441 $7E
    ld   hl, wEntitiesPosYTable                   ;; 07:4442 $21 $10 $C2
    add  hl, de                                   ;; 07:4445 $19
    ld   [hl], a                                  ;; 07:4446 $77
    ld   hl, wEntitiesPosXTable                   ;; 07:4447 $21 $00 $C2
    add  hl, bc                                   ;; 07:444A $09
    ld   a, [hl]                                  ;; 07:444B $7E
    sub  $1A                                      ;; 07:444C $D6 $1A
    ld   hl, wEntitiesPosXTable                   ;; 07:444E $21 $00 $C2
    add  hl, de                                   ;; 07:4451 $19
    ld   [hl], a                                  ;; 07:4452 $77
    ret                                           ;; 07:4453 $C9

func_007_4454::
    call func_007_4429                            ;; 07:4454 $CD $29 $44
    call GetEntityTransitionCountdown             ;; 07:4457 $CD $05 $0C
    ret  nz                                       ;; 07:445A $C0

    ld   [hl], $10                                ;; 07:445B $36 $10
    ld   a, $04                                   ;; 07:445D $3E $04
    call SetEntitySpriteVariant                   ;; 07:445F $CD $0C $3B
    call IncrementEntityState                     ;; 07:4462 $CD $12 $3B
    ld   a, [hl]                                  ;; 07:4465 $7E
    cp   $0C                                      ;; 07:4466 $FE $0C
    ret  nz                                       ;; 07:4468 $C0

    ld   hl, wEntitiesSpeedXTable                 ;; 07:4469 $21 $40 $C2
    add  hl, bc                                   ;; 07:446C $09
    ld   [hl], $F8                                ;; 07:446D $36 $F8
    call GetEntitySpeedYAddress                   ;; 07:446F $CD $05 $40
    ld   [hl], $F8                                ;; 07:4472 $36 $F8
    ret                                           ;; 07:4474 $C9

func_007_4475::
    call func_007_4429                            ;; 07:4475 $CD $29 $44
    ld   hl, wEntitiesPosYTable                   ;; 07:4478 $21 $10 $C2
    add  hl, bc                                   ;; 07:447B $09
    ld   a, [hl]                                  ;; 07:447C $7E
    cp   $4C                                      ;; 07:447D $FE $4C
    jr   c, .jr_4491                              ;; 07:447F $38 $10

    call func_007_48FD                            ;; 07:4481 $CD $FD $48
    call_open_dialog Dialog117                    ;; 07:4484
    ld   a, $04                                   ;; 07:4489 $3E $04
    call SetEntitySpriteVariant                   ;; 07:448B $CD $0C $3B
    jp   IncrementEntityState                     ;; 07:448E $C3 $12 $3B

.jr_4491
    call UpdateEntityPosWithSpeed_07              ;; 07:4491 $CD $0A $7E
    call GetEntitySpeedYAddress                   ;; 07:4494 $CD $05 $40
    inc  [hl]                                     ;; 07:4497 $34
    ret                                           ;; 07:4498 $C9

func_007_4499::
    call func_007_4429                            ;; 07:4499 $CD $29 $44
    ld   a, NOISE_SFX_PHOTO                       ;; 07:449C $3E $40
    ldh  [hNoiseSfx], a                           ;; 07:449E $E0 $F4
    ld   a, GAMEPLAY_PHOTO_FISHERMAN              ;; 07:44A0 $3E $16
    ld   [wGameplayType], a                       ;; 07:44A2 $EA $95 $DB
    xor  a                                        ;; 07:44A5 $AF
    ld   [wGameplaySubtype], a                    ;; 07:44A6 $EA $96 $DB
    ld   [wTransitionSequenceCounter], a          ;; 07:44A9 $EA $6B $C1
    ld   [wC16C], a                               ;; 07:44AC $EA $6C $C1
    ret                                           ;; 07:44AF $C9

func_007_44B0::
    call func_007_7D43                            ;; 07:44B0 $CD $43 $7D
    jr   nc, func_007_44DC                        ;; 07:44B3 $30 $27

    ldh  a, [hLinkAnimationState]                 ;; 07:44B5 $F0 $9D
    cp   LINK_ANIMATION_STATE_STANDING_SIDE_SCROLL_LEFT_DOWN ;; 07:44B7 $FE $58
    jr   c, .jr_44BF                              ;; 07:44B9 $38 $04

    cp   $5E                                      ;; 07:44BB $FE $5E
    jr   c, func_007_44DC                         ;; 07:44BD $38 $1D

.jr_44BF
    ld   a, [wTradeSequenceItem]                  ;; 07:44BF $FA $0E $DB
    cp   TRADING_ITEM_FISHING_HOOK                ;; 07:44C2 $FE $0B
    jr   nz, .jr_44CE                             ;; 07:44C4 $20 $08

    call_open_dialog Dialog1E8                    ;; 07:44C6
    jp   IncrementEntityState                     ;; 07:44CB $C3 $12 $3B

.jr_44CE
    cp   $0C                                      ;; 07:44CE $FE $0C
    jr   nc, .jr_44D7                             ;; 07:44D0 $30 $05

    jp_open_dialog Dialog1E7                      ;; 07:44D2

.jr_44D7
    jp_open_dialog Dialog1ED                      ;; 07:44D7

func_007_44DC::
    ldh  a, [hFrameCounter]                       ;; 07:44DC $F0 $E7
    and  $30                                      ;; 07:44DE $E6 $30
    ld   e, b                                     ;; 07:44E0 $58
    jr   z, .jr_44E4                              ;; 07:44E1 $28 $01

    inc  e                                        ;; 07:44E3 $1C

.jr_44E4
    ld   a, e                                     ;; 07:44E4 $7B
    jp   SetEntitySpriteVariant                   ;; 07:44E5 $C3 $0C $3B

func_007_44E8::
    call IncrementEntityState                     ;; 07:44E8 $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 07:44EB $FA $77 $C1
    and  a                                        ;; 07:44EE $A7
    jr   nz, .jr_4503                             ;; 07:44EF $20 $12

    ld   a, $01                                   ;; 07:44F1 $3E $01
    ld   [wExchangingTradeSequenceItem], a        ;; 07:44F3 $EA $7F $DB
    ld   [wC167], a                               ;; 07:44F6 $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 07:44F9 $CD $05 $0C
    ld   [hl], $D0                                ;; 07:44FC $36 $D0
    jp_open_dialog Dialog1E9                      ;; 07:44FE

.jr_4503
    ld   [hl], b                                  ;; 07:4503 $70
    jp_open_dialog Dialog1EA                      ;; 07:4504

func_007_4509::
    ld   a, $02                                   ;; 07:4509 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:450B $E0 $A1
    ld   a, $01                                   ;; 07:450D $3E $01
    ld   [wMusicTrackTiming], a                   ;; 07:450F $EA $0B $C1
    call GetEntityTransitionCountdown             ;; 07:4512 $CD $05 $0C
    jr   nz, .jr_4521                             ;; 07:4515 $20 $0A

    ld   [hl], $20                                ;; 07:4517 $36 $20
    call_open_dialog Dialog1EB                    ;; 07:4519
    call IncrementEntityState                     ;; 07:451E $CD $12 $3B

.jr_4521
    ld   e, $03                                   ;; 07:4521 $1E $03
    cp   $30                                      ;; 07:4523 $FE $30
    jr   c, .jr_4533                              ;; 07:4525 $38 $0C

    cp   $80                                      ;; 07:4527 $FE $80
    jr   nc, func_007_44DC                        ;; 07:4529 $30 $B1

    ldh  a, [hFrameCounter]                       ;; 07:452B $F0 $E7
    and  $18                                      ;; 07:452D $E6 $18
    ld   e, b                                     ;; 07:452F $58
    jr   z, .jr_4533                              ;; 07:4530 $28 $01

    inc  e                                        ;; 07:4532 $1C

.jr_4533
    ld   a, e                                     ;; 07:4533 $7B
    jp   SetEntitySpriteVariant                   ;; 07:4534 $C3 $0C $3B

func_007_4537::
    ld   a, $02                                   ;; 07:4537 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:4539 $E0 $A1
    call GetEntityTransitionCountdown             ;; 07:453B $CD $05 $0C
    jr   nz, .jr_4586                             ;; 07:453E $20 $46

    ld   [wMusicTrackTiming], a                   ;; 07:4540 $EA $0B $C1
    call IncrementEntityState                     ;; 07:4543 $CD $12 $3B
    ld   a, ENTITY_FISHERMAN_FISHING_GAME         ;; 07:4546 $3E $54
    call SpawnNewEntity_trampoline                ;; 07:4548 $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 07:454B $F0 $D7
    sub  $20                                      ;; 07:454D $D6 $20
    ld   hl, wEntitiesPosXTable                   ;; 07:454F $21 $00 $C2
    add  hl, de                                   ;; 07:4552 $19
    ld   [hl], a                                  ;; 07:4553 $77
    ldh  [hActiveEntityPosX], a                   ;; 07:4554 $E0 $EE
    ldh  a, [hMultiPurpose1]                      ;; 07:4556 $F0 $D8
    add  $08                                      ;; 07:4558 $C6 $08
    ld   hl, wEntitiesPosYTable                   ;; 07:455A $21 $10 $C2
    add  hl, de                                   ;; 07:455D $19
    ld   [hl], a                                  ;; 07:455E $77
    ldh  [hActiveEntityVisualPosY], a             ;; 07:455F $E0 $EC
    ld   hl, wEntitiesSpeedZTable                 ;; 07:4561 $21 $20 $C3
    add  hl, de                                   ;; 07:4564 $19
    ld   [hl], $20                                ;; 07:4565 $36 $20
    ld   hl, wEntitiesPrivateState4Table          ;; 07:4567 $21 $40 $C4
    add  hl, de                                   ;; 07:456A $19
    ld   [hl], $01                                ;; 07:456B $36 $01
    push bc                                       ;; 07:456D $C5
    ld   c, e                                     ;; 07:456E $4B
    ld   b, d                                     ;; 07:456F $42
    ld   a, $0A                                   ;; 07:4570 $3E $0A
    call ApplyVectorTowardsLink_trampoline        ;; 07:4572 $CD $AA $3B
    pop  bc                                       ;; 07:4575 $C1
    call func_007_48FD                            ;; 07:4576 $CD $FD $48
    ld   a, JINGLE_FALL_DOWN                      ;; 07:4579 $3E $08
    ldh  [hJingle], a                             ;; 07:457B $E0 $F2
    ld   a, TRADING_ITEM_NECKLACE                 ;; 07:457D $3E $0C
    ld   [wTradeSequenceItem], a                  ;; 07:457F $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 07:4582 $3E $0D
    ldh  [hReplaceTiles], a                       ;; 07:4584 $E0 $A5

.jr_4586
    ld   a, $03                                   ;; 07:4586 $3E $03
    jp   SetEntitySpriteVariant                   ;; 07:4588 $C3 $0C $3B

func_007_458B::
    ld   a, $02                                   ;; 07:458B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:458D $E0 $A1
    call IncrementEntityState                     ;; 07:458F $CD $12 $3B
    ld   [hl], b                                  ;; 07:4592 $70
    ret                                           ;; 07:4593 $C9

func_007_4594::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:4594 $F0 $F1
    rla                                           ;; 07:4596 $17
    rla                                           ;; 07:4597 $17
    rla                                           ;; 07:4598 $17
    rla                                           ;; 07:4599 $17
    and  $F0                                      ;; 07:459A $E6 $F0
    ld   e, a                                     ;; 07:459C $5F
    ld   d, b                                     ;; 07:459D $50
    ld   hl, Data_007_4234                        ;; 07:459E $21 $34 $42
    add  hl, de                                   ;; 07:45A1 $19
    ld   c, $04                                   ;; 07:45A2 $0E $04
    jp   RenderActiveEntitySpritesRect            ;; 07:45A4 $C3 $E6 $3C

; Unused data
; (Maybe was intended to be the Fisherman bobbing positions)
Data_007_45A7::
    db   -02, -02, -02, -02, -01, -01, -01, -01   ;; 07:45A7
    db   -01,  00,  00,  01,  01,  01,  01,  01   ;; 07:45AF
    db    02,  02,  02,  02,  02,  02,  02,  02   ;; 07:45B7
    db    02,  02,  02,  02,  02,  02,  02,  02   ;; 07:45BF
    db    02,  02,  01,  00,  00, -01, -02, -02   ;; 07:45C7
    db    01,  01,  01,  00,  00, -01, -01, -01   ;; 07:45CF
    db    00,  00,  00,  00,  00,  00,  00,  00   ;; 07:45D7
    db   -01, -01, -01,  00,  00,  01,  01,  01   ;; 07:45DF
    db   -02, -02, -01,  00,  00,  01,  02,  02   ;; 07:45E7

Data_007_45EF::
    db   $00, $00, $01, $02, $02, $02, $01, $00

label_007_45F7:
    ld   hl, wEntitiesInertiaTable                ;; 07:45F7 $21 $D0 $C3
    add  hl, bc                                   ;; 07:45FA $09
    ld   a, [hl]                                  ;; 07:45FB $7E
    rra                                           ;; 07:45FC $1F
    rra                                           ;; 07:45FD $1F
    rra                                           ;; 07:45FE $1F
    and  $07                                      ;; 07:45FF $E6 $07
    ld   e, a                                     ;; 07:4601 $5F
    ld   d, b                                     ;; 07:4602 $50
    ld   hl, Data_007_45EF                        ;; 07:4603 $21 $EF $45
    add  hl, de                                   ;; 07:4606 $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:4607 $F0 $EC
    add  [hl]                                     ;; 07:4609 $86
    ldh  [hActiveEntityVisualPosY], a             ;; 07:460A $E0 $EC
    ld   a, [wEntitiesStateTable]                 ;; 07:460C $FA $90 $C2
    cp   $0C                                      ;; 07:460F $FE $0C
    jr   nc, .jr_461A                             ;; 07:4611 $30 $07

    ldh  a, [hActiveEntityVisualPosY]             ;; 07:4613 $F0 $EC
    sub  $10                                      ;; 07:4615 $D6 $10
    ld   [wEntitiesPosYTable], a                  ;; 07:4617 $EA $10 $C2

.jr_461A
    call func_007_467B                            ;; 07:461A $CD $7B $46
    call CheckLinkCollisionWithEnemy_trampoline   ;; 07:461D $CD $5A $3B
    jr   nc, .jr_4640                             ;; 07:4620 $30 $1E

    ldh  a, [hLinkSpeedY]                         ;; 07:4622 $F0 $9B
    and  $80                                      ;; 07:4624 $E6 $80
    jr   nz, .jr_4640                             ;; 07:4626 $20 $18

    call GetEntityYDistanceToLink_07              ;; 07:4628 $CD $6D $7E
    add  $08                                      ;; 07:462B $C6 $08
    bit  7, a                                     ;; 07:462D $CB $7F
    jr   z, .jr_4640                              ;; 07:462F $28 $0F

    ldh  a, [hActiveEntityVisualPosY]             ;; 07:4631 $F0 $EC
    sub  $0F                                      ;; 07:4633 $D6 $0F
    ldh  [hLinkPositionY], a                      ;; 07:4635 $E0 $99
    ld   a, $02                                   ;; 07:4637 $3E $02
    ldh  [hLinkSpeedY], a                         ;; 07:4639 $E0 $9B
    ld   a, $01                                   ;; 07:463B $3E $01
    ld   [wC147], a                               ;; 07:463D $EA $47 $C1

.jr_4640
    call ReturnIfNonInteractive_07                ;; 07:4640 $CD $96 $7D
    ld   hl, wEntitiesInertiaTable                ;; 07:4643 $21 $D0 $C3
    add  hl, bc                                   ;; 07:4646 $09
    inc  [hl]                                     ;; 07:4647 $34
    ld   a, [hl]                                  ;; 07:4648 $7E
    and  $07                                      ;; 07:4649 $E6 $07
    jr   nz, ret_007_4666                         ;; 07:464B $20 $19

    ld   e, $48                                   ;; 07:464D $1E $48
    ld   a, [wC147]                               ;; 07:464F $FA $47 $C1
    and  a                                        ;; 07:4652 $A7
    jr   z, .jr_4657                              ;; 07:4653 $28 $02

    ld   e, $4B                                   ;; 07:4655 $1E $4B

.jr_4657
    ld   hl, wEntitiesPosYTable                   ;; 07:4657 $21 $10 $C2
    add  hl, bc                                   ;; 07:465A $09
    ld   a, [hl]                                  ;; 07:465B $7E
    sub  e                                        ;; 07:465C $93
    jr   z, ret_007_4666                          ;; 07:465D $28 $07

    and  $80                                      ;; 07:465F $E6 $80
    jr   z, .jr_4665                              ;; 07:4661 $28 $02

    inc  [hl]                                     ;; 07:4663 $34
    inc  [hl]                                     ;; 07:4664 $34

.jr_4665
    dec  [hl]                                     ;; 07:4665 $35

ret_007_4666:
    ret                                           ;; 07:4666 $C9

Data_007_4667::
    db   $00, $F8, $68, $02, $00, $00, $6A, $02, $00, $08, $6A, $02, $00, $10, $6A, $02
    db   $00, $18, $6C, $02

func_007_467B::
    ld   hl, Data_007_4667                        ;; 07:467B $21 $67 $46
    ld   c, $05                                   ;; 07:467E $0E $05
    jp   RenderActiveEntitySpritesRect            ;; 07:4680 $C3 $E6 $3C
