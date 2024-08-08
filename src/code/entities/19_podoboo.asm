
; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PodobooSpriteVariants::
.variant0
    db $7A, $42
    db $7A, $62
.variant1
    db $7A, $54
    db $7A, $74
.variant2
    db $7A, $02
    db $7A, $22
.variant3
    db $7A, $14
    db $7A, $34

PodobooEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 19:53F0 $21 $B0 $C2
    add  hl, bc                                   ;; 19:53F3 $09
    ld   a, [hl]                                  ;; 19:53F4 $7E
    and  a                                        ;; 19:53F5 $A7
    jp   nz, label_019_54FD                       ;; 19:53F6 $C2 $FD $54

    ldh  a, [hActiveEntityState]                  ;; 19:53F9 $F0 $F0
    JP_TABLE                                      ;; 19:53FB
._00 dw PodobooState0Handler
._01 dw PodobooState1Handler
._02 dw PodobooState2Handler

PodobooState0Handler::
    call GetEntityTransitionCountdown             ;; 19:5402 $CD $05 $0C
    call GetRandomByte                            ;; 19:5405 $CD $0D $28
    and  $3F                                      ;; 19:5408 $E6 $3F
    add  $30                                      ;; 19:540A $C6 $30
    ld   [hl], a                                  ;; 19:540C $77
    jp   IncrementEntityState                     ;; 19:540D $C3 $12 $3B

Data_019_5410::
    db   $FF, $01

Data_019_5412::
    db   $FD, $03

Data_019_5414::
    db   $F4, $F4

PodobooState1Handler::
    call GetEntityTransitionCountdown             ;; 19:5416 $CD $05 $0C
    jr   nz, ret_019_546E                         ;; 19:5419 $20 $53

    ld   a, [wC5A1]                               ;; 19:541B $FA $A1 $C5
    cp   $02                                      ;; 19:541E $FE $02
    ret  nc                                       ;; 19:5420 $D0

    ld   hl, wEntitiesSpeedYTable                 ;; 19:5421 $21 $50 $C2
    add  hl, bc                                   ;; 19:5424 $09
    ld   [hl], $D0                                ;; 19:5425 $36 $D0
    call IncrementEntityState                     ;; 19:5427 $CD $12 $3B

func_019_542A::
    ld   a, $01                                   ;; 19:542A $3E $01

.loop_542C
    ldh  [hMultiPurposeH], a                      ;; 19:542C $E0 $E9
    ld   a, ENTITY_PODOBOO                        ;; 19:542E $3E $DA
    call SpawnNewEntity_trampoline                ;; 19:5430 $CD $86 $3B
    ret  c                                        ;; 19:5433 $D8

    ldh  a, [hMultiPurpose1]                      ;; 19:5434 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 19:5436 $21 $10 $C2
    add  hl, de                                   ;; 19:5439 $19
    ld   [hl], a                                  ;; 19:543A $77
    ld   hl, wEntitiesPrivateState1Table          ;; 19:543B $21 $B0 $C2
    add  hl, de                                   ;; 19:543E $19
    ld   [hl], $02                                ;; 19:543F $36 $02
    push bc                                       ;; 19:5441 $C5
    ldh  a, [hMultiPurposeH]                      ;; 19:5442 $F0 $E9
    ld   c, a                                     ;; 19:5444 $4F
    ld   hl, Data_019_5410                        ;; 19:5445 $21 $10 $54
    add  hl, bc                                   ;; 19:5448 $09
    ldh  a, [hMultiPurpose0]                      ;; 19:5449 $F0 $D7
    add  [hl]                                     ;; 19:544B $86
    ld   hl, wEntitiesPosXTable                   ;; 19:544C $21 $00 $C2
    add  hl, de                                   ;; 19:544F $19
    ld   [hl], a                                  ;; 19:5450 $77
    ld   hl, Data_019_5412                        ;; 19:5451 $21 $12 $54
    add  hl, bc                                   ;; 19:5454 $09
    ld   a, [hl]                                  ;; 19:5455 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 19:5456 $21 $40 $C2
    add  hl, de                                   ;; 19:5459 $19
    ld   [hl], a                                  ;; 19:545A $77
    ld   hl, Data_019_5414                        ;; 19:545B $21 $14 $54
    add  hl, bc                                   ;; 19:545E $09
    ld   a, [hl]                                  ;; 19:545F $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 19:5460 $21 $50 $C2
    add  hl, de                                   ;; 19:5463 $19
    ld   [hl], a                                  ;; 19:5464 $77
    pop  bc                                       ;; 19:5465 $C1
    ldh  a, [hMultiPurposeH]                      ;; 19:5466 $F0 $E9
    dec  a                                        ;; 19:5468 $3D
    cp   $FF                                      ;; 19:5469 $FE $FF
    jr   nz, .loop_542C                           ;; 19:546B $20 $BF

    ret                                           ;; 19:546D $C9

ret_019_546E:
    ret                                           ;; 19:546E $C9

PodobooState2Handler::
    ld   hl, wC5A0                                ;; 19:546F $21 $A0 $C5
    inc  [hl]                                     ;; 19:5472 $34
    ld   de, PodobooSpriteVariants                ;; 19:5473 $11 $E0 $53
    call RenderActiveEntitySpritesPair            ;; 19:5476 $CD $C0 $3B
    call ReturnIfNonInteractive_19                ;; 19:5479 $CD $3D $7D
    call label_3B44                               ;; 19:547C $CD $44 $3B
    call UpdateEntityYPosWithSpeed_19             ;; 19:547F $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                 ;; 19:5482 $21 $50 $C2
    add  hl, bc                                   ;; 19:5485 $09
    inc  [hl]                                     ;; 19:5486 $34
    ld   e, $00                                   ;; 19:5487 $1E $00
    ld   a, [hl]                                  ;; 19:5489 $7E
    and  $80                                      ;; 19:548A $E6 $80
    jr   nz, .jr_5490                             ;; 19:548C $20 $02

    ld   e, $02                                   ;; 19:548E $1E $02

.jr_5490
    ldh  a, [hFrameCounter]                       ;; 19:5490 $F0 $E7
    rra                                           ;; 19:5492 $1F
    rra                                           ;; 19:5493 $1F
    and  $01                                      ;; 19:5494 $E6 $01
    add  e                                        ;; 19:5496 $83
    call SetEntitySpriteVariant                   ;; 19:5497 $CD $0C $3B
    ld   hl, wEntitiesPosYTable                   ;; 19:549A $21 $10 $C2
    add  hl, bc                                   ;; 19:549D $09
    ld   a, [hl]                                  ;; 19:549E $7E
    cp   $70                                      ;; 19:549F $FE $70
    jr   c, .jr_54AC                              ;; 19:54A1 $38 $09

    ld   [hl], $70                                ;; 19:54A3 $36 $70
    call IncrementEntityState                     ;; 19:54A5 $CD $12 $3B
    ld   [hl], b                                  ;; 19:54A8 $70
    call func_019_542A                            ;; 19:54A9 $CD $2A $54

.jr_54AC
    ldh  a, [hFrameCounter]                       ;; 19:54AC $F0 $E7
    xor  c                                        ;; 19:54AE $A9
    and  $0F                                      ;; 19:54AF $E6 $0F
    ret  nz                                       ;; 19:54B1 $C0

    ld   a, ENTITY_PODOBOO                        ;; 19:54B2 $3E $DA
    call SpawnNewEntity_trampoline                ;; 19:54B4 $CD $86 $3B
    ret  c                                        ;; 19:54B7 $D8

    ldh  a, [hMultiPurpose0]                      ;; 19:54B8 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 19:54BA $21 $00 $C2
    add  hl, de                                   ;; 19:54BD $19
    ld   [hl], a                                  ;; 19:54BE $77
    ldh  a, [hMultiPurpose1]                      ;; 19:54BF $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 19:54C1 $21 $10 $C2
    add  hl, de                                   ;; 19:54C4 $19
    ld   [hl], a                                  ;; 19:54C5 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:54C6 $21 $E0 $C2
    add  hl, de                                   ;; 19:54C9 $19
    ld   [hl], $18                                ;; 19:54CA $36 $18
    ld   hl, wEntitiesPrivateState1Table          ;; 19:54CC $21 $B0 $C2
    add  hl, de                                   ;; 19:54CF $19
    ld   [hl], $01                                ;; 19:54D0 $36 $01
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:54D2 $F0 $F1
    rla                                           ;; 19:54D4 $17
    and  $04                                      ;; 19:54D5 $E6 $04
    ld   hl, wEntitiesSpriteVariantTable          ;; 19:54D7 $21 $B0 $C3
    add  hl, de                                   ;; 19:54DA $19
    ld   [hl], a                                  ;; 19:54DB $77
    ret                                           ;; 19:54DC $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown067SpriteVariants::
.variant0
    db $7C, $42
    db $7C, $62
.variant1
    db $7C, $54
    db $7C, $74
.variant2
    db $7E, $42
    db $7E, $62
.variant3
    db $7E, $54
    db $7E, $74
.variant4
    db $7C, $02
    db $7C, $22
.variant5
    db $7C, $14
    db $7C, $34

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown068SpriteVariants::
.variant0
    db $7E, $02
    db $7E, $22
.variant1
    db $7E, $14
    db $7E, $34

label_019_54FD:
    cp   $02                                      ;; 19:54FD $FE $02
    jr   z, jr_019_552D                           ;; 19:54FF $28 $2C

    ldh  a, [hFrameCounter]                       ;; 19:5501 $F0 $E7
    xor  c                                        ;; 19:5503 $A9
    rra                                           ;; 19:5504 $1F
    jr   c, .jr_5519                              ;; 19:5505 $38 $12

    ldh  a, [hFrameCounter]                       ;; 19:5507 $F0 $E7
    rra                                           ;; 19:5509 $1F
    rra                                           ;; 19:550A $1F
    and  $01                                      ;; 19:550B $E6 $01
    ld   e, a                                     ;; 19:550D $5F
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:550E $F0 $F1
    add  e                                        ;; 19:5510 $83
    ldh  [hActiveEntitySpriteVariant], a          ;; 19:5511 $E0 $F1
    ld   de, Unknown067SpriteVariants             ;; 19:5513 $11 $DD $54
    call RenderActiveEntitySpritesPair            ;; 19:5516 $CD $C0 $3B

.jr_5519
    call ReturnIfNonInteractive_19                ;; 19:5519 $CD $3D $7D
    call GetEntityTransitionCountdown             ;; 19:551C $CD $05 $0C
    jp   z, ClearEntityStatus_19                  ;; 19:551F $CA $61 $7E

    cp   $08                                      ;; 19:5522 $FE $08
    jr   nz, .ret_552C                            ;; 19:5524 $20 $06

    ld   hl, wEntitiesSpriteVariantTable          ;; 19:5526 $21 $B0 $C3
    add  hl, bc                                   ;; 19:5529 $09
    inc  [hl]                                     ;; 19:552A $34
    inc  [hl]                                     ;; 19:552B $34

.ret_552C
    ret                                           ;; 19:552C $C9

jr_019_552D:
    ld   de, Unknown068SpriteVariants             ;; 19:552D $11 $F5 $54
    call RenderActiveEntitySpritesPair            ;; 19:5530 $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ;; 19:5533 $F0 $E7
    rra                                           ;; 19:5535 $1F
    rra                                           ;; 19:5536 $1F
    and  $01                                      ;; 19:5537 $E6 $01
    call SetEntitySpriteVariant                   ;; 19:5539 $CD $0C $3B
    call UpdateEntityPosWithSpeed_19              ;; 19:553C $CD $B8 $7D
    ld   hl, wEntitiesSpeedYTable                 ;; 19:553F $21 $50 $C2
    add  hl, bc                                   ;; 19:5542 $09
    inc  [hl]                                     ;; 19:5543 $34
    ld   a, [hl]                                  ;; 19:5544 $7E
    cp   $10                                      ;; 19:5545 $FE $10
    ret  nz                                       ;; 19:5547 $C0

    jp   ClearEntityStatus_19                     ;; 19:5548 $C3 $61 $7E
