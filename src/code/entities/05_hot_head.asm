EntityInitHotHead::
    call GetEntityTransitionCountdown             ;; 05:6302 $CD $05 $0C
    ld   [hl], $40                                ;; 05:6305 $36 $40
    ld   hl, wEntitiesSpriteVariantTable          ;; 05:6307 $21 $B0 $C3
    add  hl, bc                                   ;; 05:630A $09
    ld   [hl], $FF                                ;; 05:630B $36 $FF
    ld   hl, wEntitiesHealthTable                 ;; 05:630D $21 $60 $C3
    add  hl, bc                                   ;; 05:6310 $09
    ld   [hl], $FF                                ;; 05:6311 $36 $FF
    ret

HotHeadEntityHandler::
    call label_394D                               ;; 05:6314 $CD $4D $39
    call BossIntro                                ;; 05:6317 $CD $E8 $3E
    ld   hl, wEntitiesPrivateState1Table          ;; 05:631A $21 $B0 $C2
    add  hl, bc                                   ;; 05:631D $09
    ld   a, [hl]                                  ;; 05:631E $7E
    and  a                                        ;; 05:631F $A7
    jr   z, .jr_632F                              ;; 05:6320 $28 $0D

    cp   $01                                      ;; 05:6322 $FE $01
    jp   z, label_005_6776                        ;; 05:6324 $CA $76 $67

    cp   $02                                      ;; 05:6327 $FE $02
    jp   z, label_005_6798                        ;; 05:6329 $CA $98 $67

    jp   label_005_67EA                           ;; 05:632C $C3 $EA $67

.jr_632F
    call func_005_6705                            ;; 05:632F $CD $05 $67
    ldh  a, [hActiveEntityStatus]                 ;; 05:6332 $F0 $EA
    cp   $01                                      ;; 05:6334 $FE $01
    jr   nz, jr_005_6375                          ;; 05:6336 $20 $3D

    ld   hl, wEntitiesPrivateState2Table          ;; 05:6338 $21 $C0 $C2
    add  hl, bc                                   ;; 05:633B $09
    ld   a, [hl]                                  ;; 05:633C $7E
    JP_TABLE                                      ;; 05:633D
._00 dw func_005_6342                             ;; 05:633E
._01 dw func_005_634D                             ;; 05:6340

func_005_6342::
    call GetEntityTransitionCountdown             ;; 05:6342 $CD $05 $0C
    ld   [hl], $FF                                ;; 05:6345 $36 $FF

label_005_6347:
    ld   hl, wEntitiesPrivateState2Table          ;; 05:6347 $21 $C0 $C2
    add  hl, bc                                   ;; 05:634A $09
    inc  [hl]                                     ;; 05:634B $34
    ret                                           ;; 05:634C $C9

func_005_634D::
    call GetEntityTransitionCountdown             ;; 05:634D $CD $05 $0C
    jp   z, label_005_635E                        ;; 05:6350 $CA $5E $63

    ld   hl, wEntitiesFlashCountdownTable         ;; 05:6353 $21 $20 $C4
    add  hl, bc                                   ;; 05:6356 $09
    ld   [hl], a                                  ;; 05:6357 $77
    cp   $80                                      ;; 05:6358 $FE $80
    ret  nc                                       ;; 05:635A $D0

    jp   label_005_7550                           ;; 05:635B $C3 $50 $75

label_005_635E:
    call DropHeartContainer_05                    ;; 05:635E $CD $85 $75
    ld   hl, wEntitiesPosXTable                   ;; 05:6361 $21 $00 $C2
    add  hl, de                                   ;; 05:6364 $19
    ldh  a, [hLinkPositionX]                      ;; 05:6365 $F0 $98
    ld   [hl], a                                  ;; 05:6367 $77
    ld   hl, wEntitiesPosYTable                   ;; 05:6368 $21 $10 $C2
    add  hl, de                                   ;; 05:636B $19
    ld   [hl], $70                                ;; 05:636C $36 $70
    ld   hl, wEntitiesPosZTable                   ;; 05:636E $21 $10 $C3
    add  hl, de                                   ;; 05:6371 $19
    ld   [hl], $70                                ;; 05:6372 $36 $70
    ret                                           ;; 05:6374 $C9

jr_005_6375:
    call ReturnIfNonInteractive_05                ;; 05:6375 $CD $3A $7A
    call DecrementEntityIgnoreHitsCountdown       ;; 05:6378 $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ;; 05:637B $F0 $F0
    JP_TABLE                                      ;; 05:637D
._00 dw func_005_63A8                             ;; 05:637E
._01 dw func_005_63EB                             ;; 05:6380
._02 dw func_005_648E                             ;; 05:6382
._03 dw func_005_6534                             ;; 05:6384
._04 dw func_005_6579                             ;; 05:6386

Data_005_6388::
    db   $28, $38, $58, $68, $28, $38, $58, $68

Data_005_6390::
IF __PATCH_0__
    db   $38, $30, $30, $38, $48, $58, $58, $48
ELSE
    db   $38, $30, $30, $38, $50, $58, $58, $50
ENDC

Data_005_6398::
    db   $10, $10, $F0, $F0, $10, $10, $F0, $F0

Data_005_63A0::
    db   $FD, $03, $03, $FD, $03, $FD, $FD, $03

func_005_63A8::
    call GetEntityTransitionCountdown             ;; 05:63A8 $CD $05 $0C
    ret  nz                                       ;; 05:63AB $C0

    call GetRandomByte                            ;; 05:63AC $CD $0D $28
    and  $07                                      ;; 05:63AF $E6 $07
    ld   e, a                                     ;; 05:63B1 $5F
    ld   d, b                                     ;; 05:63B2 $50
    ld   hl, Data_005_6388                        ;; 05:63B3 $21 $88 $63
    add  hl, de                                   ;; 05:63B6 $19
    ld   a, [hl]                                  ;; 05:63B7 $7E
    ld   hl, wEntitiesPosXTable                   ;; 05:63B8 $21 $00 $C2
    add  hl, bc                                   ;; 05:63BB $09
    ld   [hl], a                                  ;; 05:63BC $77
    ld   hl, Data_005_6390                        ;; 05:63BD $21 $90 $63
    add  hl, de                                   ;; 05:63C0 $19
    ld   a, [hl]                                  ;; 05:63C1 $7E

.jr_63C2
    ld   hl, wEntitiesPosYTable                   ;; 05:63C2 $21 $10 $C2
    add  hl, bc                                   ;; 05:63C5 $09

.jr_63C6
    ld   [hl], a                                  ;; 05:63C6 $77
    ld   hl, Data_005_6398                        ;; 05:63C7 $21 $98 $63
    add  hl, de                                   ;; 05:63CA $19
    ld   a, [hl]                                  ;; 05:63CB $7E

.jr_63CC
    ld   hl, wEntitiesSpeedXTable                 ;; 05:63CC $21 $40 $C2
    add  hl, bc                                   ;; 05:63CF $09
    ld   [hl], a                                  ;; 05:63D0 $77
    ld   hl, Data_005_63A0                        ;; 05:63D1 $21 $A0 $63
    add  hl, de                                   ;; 05:63D4 $19
    ld   a, [hl]                                  ;; 05:63D5 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:63D6 $21 $50 $C2
    add  hl, bc                                   ;; 05:63D9 $09
    ld   [hl], a                                  ;; 05:63DA $77
    ld   hl, wEntitiesSpeedZTable                 ;; 05:63DB $21 $20 $C3
    add  hl, bc                                   ;; 05:63DE $09
    ld   [hl], $18                                ;; 05:63DF $36 $18
    ld   a, WAVE_SFX_BOSS_GROWL                   ;; 05:63E1 $3E $16
    ldh  [hWaveSfx], a                            ;; 05:63E3 $E0 $F3
    call func_005_65D9                            ;; 05:63E5 $CD $D9 $65
    jp   IncrementEntityState                     ;; 05:63E8 $C3 $12 $3B

func_005_63EB::
    ld   hl, wEntitiesSpeedXTable                 ;; 05:63EB $21 $40 $C2
    add  hl, bc                                   ;; 05:63EE $09
    ld   a, [hl]                                  ;; 05:63EF $7E
    and  a                                        ;; 05:63F0 $A7
    jr   z, jr_005_6444                           ;; 05:63F1 $28 $51

    ld   hl, wEntitiesFlashCountdownTable         ;; 05:63F3 $21 $20 $C4
    add  hl, bc                                   ;; 05:63F6 $09
    ld   a, [hl]                                  ;; 05:63F7 $7E
    cp   $0B                                      ;; 05:63F8 $FE $0B
    jr   c, jr_005_6444                           ;; 05:63FA $38 $48

    ld   hl, wEntitiesInertiaTable                ;; 05:63FC $21 $D0 $C3
    add  hl, bc                                   ;; 05:63FF $09
    ld   a, [hl]                                  ;; 05:6400 $7E
    cp   $05                                      ;; 05:6401 $FE $05
    jr   nc, ret_005_6443                         ;; 05:6403 $30 $3E

    call IncrementEntityState                     ;; 05:6405 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 05:6408 $CD $05 $0C
    ld   [hl], $40                                ;; 05:640B $36 $40
    ld   hl, wEntitiesSpeedXTable                 ;; 05:640D $21 $40 $C2
    add  hl, bc                                   ;; 05:6410 $09
    ld   [hl], $18                                ;; 05:6411 $36 $18
    ld   hl, wEntitiesSpeedYTable                 ;; 05:6413 $21 $50 $C2
    add  hl, bc                                   ;; 05:6416 $09
    ld   [hl], $18                                ;; 05:6417 $36 $18
    ld   hl, wEntitiesSpeedZTable                 ;; 05:6419 $21 $20 $C3
    add  hl, bc                                   ;; 05:641C $09
    ld   [hl], b                                  ;; 05:641D $70
    call GetEntitySlowTransitionCountdown         ;; 05:641E $CD $FB $0B
    ld   [hl], $40                                ;; 05:6421 $36 $40
    ldh  a, [hActiveEntityPosX]                   ;; 05:6423 $F0 $EE
    add  $F8                                      ;; 05:6425 $C6 $F8
    ldh  [hMultiPurpose0], a                      ;; 05:6427 $E0 $D7
    call func_005_6432                            ;; 05:6429 $CD $32 $64
    ldh  a, [hActiveEntityPosX]                   ;; 05:642C $F0 $EE
    add  $08                                      ;; 05:642E $C6 $08
    ldh  [hMultiPurpose0], a                      ;; 05:6430 $E0 $D7

func_005_6432::
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:6432 $F0 $EC
    sub  $10                                      ;; 05:6434 $D6 $10
    ldh  [hMultiPurpose1], a                      ;; 05:6436 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 05:6438 $3E $02
    call AddTranscientVfx                         ;; 05:643A $CD $C7 $0C
    ld   hl, wTranscientVfxCountdownTable         ;; 05:643D $21 $20 $C5
    add  hl, de                                   ;; 05:6440 $19
    ld   [hl], $0F                                ;; 05:6441 $36 $0F

ret_005_6443:
    ret                                           ;; 05:6443 $C9

jr_005_6444:
    call UpdateEntityPosWithSpeed_05              ;; 05:6444 $CD $B1 $7A
    call AddEntityZSpeedToPos_05                  ;; 05:6447 $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ;; 05:644A $21 $20 $C3
    add  hl, bc                                   ;; 05:644D $09
    dec  [hl]                                     ;; 05:644E $35
    ld   hl, wEntitiesPosZTable                   ;; 05:644F $21 $10 $C3
    add  hl, bc                                   ;; 05:6452 $09
    ld   a, [hl]                                  ;; 05:6453 $7E
    and  $80                                      ;; 05:6454 $E6 $80
    jr   z, .jr_6471                              ;; 05:6456 $28 $19

    ld   [hl], b                                  ;; 05:6458 $70
    call GetEntityTransitionCountdown             ;; 05:6459 $CD $05 $0C
    ld   [hl], $40                                ;; 05:645C $36 $40
    call IncrementEntityState                     ;; 05:645E $CD $12 $3B
    ld   [hl], b                                  ;; 05:6461 $70
    call func_005_6611                            ;; 05:6462 $CD $11 $66
    call func_005_65D9                            ;; 05:6465 $CD $D9 $65
    ld   a, JINGLE_HOT_HEAD_SPLASH                ;; 05:6468 $3E $32
    ldh  [hJingle], a                             ;; 05:646A $E0 $F2
    ld   a, $FF                                   ;; 05:646C $3E $FF
    jp   SetEntitySpriteVariant                   ;; 05:646E $C3 $0C $3B

.jr_6471
    ld   hl, wEntitiesInertiaTable                ;; 05:6471 $21 $D0 $C3
    add  hl, bc                                   ;; 05:6474 $09
    ld   a, [hl]                                  ;; 05:6475 $7E
    cp   $05                                      ;; 05:6476 $FE $05
    jp   nc, jr_005_656D                          ;; 05:6478 $D2 $6D $65

    ld   hl, wEntitiesSpeedXTable                 ;; 05:647B $21 $40 $C2
    add  hl, bc                                   ;; 05:647E $09
    ld   a, [hl]                                  ;; 05:647F $7E
    and  a                                        ;; 05:6480 $A7
    jr   z, .ret_648D                             ;; 05:6481 $28 $0A

    ldh  a, [hFrameCounter]                       ;; 05:6483 $F0 $E7
    rra                                           ;; 05:6485 $1F
    rra                                           ;; 05:6486 $1F
    rra                                           ;; 05:6487 $1F
    and  $01                                      ;; 05:6488 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 05:648A $C3 $0C $3B

.ret_648D
    ret                                           ;; 05:648D $C9

func_005_648E::
    ld   a, $02                                   ;; 05:648E $3E $02
    call SetEntitySpriteVariant                   ;; 05:6490 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 05:6493 $CD $05 $0C
    jr   z, jr_005_64AF                           ;; 05:6496 $28 $17

    and  $02                                      ;; 05:6498 $E6 $02
    ld   e, $08                                   ;; 05:649A $1E $08
    jr   z, .jr_64A0                              ;; 05:649C $28 $02

    ld   e, $F8                                   ;; 05:649E $1E $F8

.jr_64A0
    ld   hl, wEntitiesSpeedXTable                 ;; 05:64A0 $21 $40 $C2
    add  hl, bc                                   ;; 05:64A3 $09
    push hl                                       ;; 05:64A4 $E5
    ld   a, [hl]                                  ;; 05:64A5 $7E
    push af                                       ;; 05:64A6 $F5
    ld   [hl], e                                  ;; 05:64A7 $73
    call AddEntitySpeedToPos_05                   ;; 05:64A8 $CD $BE $7A
    pop  af                                       ;; 05:64AB $F1
    pop  hl                                       ;; 05:64AC $E1
    ld   [hl], a                                  ;; 05:64AD $77
    ret                                           ;; 05:64AE $C9

jr_005_64AF:
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 05:64AF $CD $39 $3B
    call GetEntitySlowTransitionCountdown         ;; 05:64B2 $CD $FB $0B
    jr   nz, .jr_64CC                             ;; 05:64B5 $20 $15

    ldh  a, [hActiveEntityPosX]                   ;; 05:64B7 $F0 $EE
    cp   $70                                      ;; 05:64B9 $FE $70
    jr   nc, .jr_64CC                             ;; 05:64BB $30 $0F

    ldh  a, [hActiveEntityVisualPosY]             ;; 05:64BD $F0 $EC
IF __PATCH_0__
    cp   $58
ELSE
    cp   $50                                      ;; 05:64BF $FE $50
ENDC
    jr   nc, .jr_64CC                             ;; 05:64C1 $30 $09

    call ClearEntitySpeed                         ;; 05:64C3 $CD $7F $3D
    call IncrementEntityState                     ;; 05:64C6 $CD $12 $3B
    ld   [hl], $01                                ;; 05:64C9 $36 $01
    ret                                           ;; 05:64CB $C9

.jr_64CC
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:64CC $21 $20 $C4
    add  hl, bc                                   ;; 05:64CF $09
    ld   a, [hl]                                  ;; 05:64D0 $7E
    cp   $08                                      ;; 05:64D1 $FE $08
    jr   nz, .jr_64F7                             ;; 05:64D3 $20 $22

    ldh  a, [hActiveEntityPosX]                   ;; 05:64D5 $F0 $EE
    cp   $70                                      ;; 05:64D7 $FE $70
    jr   nc, .jr_64F7                             ;; 05:64D9 $30 $1C

    ldh  a, [hActiveEntityVisualPosY]             ;; 05:64DB $F0 $EC
IF __PATCH_0__
    cp   $58
ELSE
    cp   $50                                      ;; 05:64DD $FE $50
ENDC
    jr   nc, .jr_64F7                             ;; 05:64DF $30 $16

    ld   hl, wEntitiesInertiaTable                ;; 05:64E1 $21 $D0 $C3
    add  hl, bc                                   ;; 05:64E4 $09
    inc  [hl]                                     ;; 05:64E5 $34
    ld   a, [hl]                                  ;; 05:64E6 $7E
    cp   $05                                      ;; 05:64E7 $FE $05
    jr   c, .jr_64F7                              ;; 05:64E9 $38 $0C

    call IncrementEntityState                     ;; 05:64EB $CD $12 $3B
    call ClearEntitySpeed                         ;; 05:64EE $CD $7F $3D
    call GetEntityTransitionCountdown             ;; 05:64F1 $CD $05 $0C
    ld   [hl], $80                                ;; 05:64F4 $36 $80
    ret                                           ;; 05:64F6 $C9

.jr_64F7
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:64F7 $21 $20 $C4
    add  hl, bc                                   ;; 05:64FA $09
    ld   a, [hl]                                  ;; 05:64FB $7E
    cp   $0B                                      ;; 05:64FC $FE $0B
    ret  nc                                       ;; 05:64FE $D0

    call UpdateEntityPosWithSpeed_05              ;; 05:64FF $CD $B1 $7A
    call ApplyEntityInteractionWithBackground_trampoline ;; 05:6502 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 05:6505 $21 $A0 $C2
    add  hl, bc                                   ;; 05:6508 $09
    ld   a, [hl]                                  ;; 05:6509 $7E
    push af                                       ;; 05:650A $F5
    and  $03                                      ;; 05:650B $E6 $03
    jr   z, .jr_6515                              ;; 05:650D $28 $06

    ld   hl, wEntitiesSpeedXTable                 ;; 05:650F $21 $40 $C2
    call func_005_651D                            ;; 05:6512 $CD $1D $65

.jr_6515
    pop  af                                       ;; 05:6515 $F1
    and  $0C                                      ;; 05:6516 $E6 $0C
    jr   z, jr_005_6522                           ;; 05:6518 $28 $08

    ld   hl, wEntitiesSpeedYTable                 ;; 05:651A $21 $50 $C2

func_005_651D::
    add  hl, bc                                   ;; 05:651D $09
    ld   a, [hl]                                  ;; 05:651E $7E
    cpl                                           ;; 05:651F $2F
    inc  a                                        ;; 05:6520 $3C
    ld   [hl], a                                  ;; 05:6521 $77

jr_005_6522:
    ldh  a, [hFrameCounter]                       ;; 05:6522 $F0 $E7
    and  $07                                      ;; 05:6524 $E6 $07
    ret  nz                                       ;; 05:6526 $C0

    ldh  a, [hActiveEntityPosX]                   ;; 05:6527 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 05:6529 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:652B $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 05:652D $E0 $D8
    ld   a, TRANSCIENT_VFX_LAVA_SPLASH            ;; 05:652F $3E $0A
    jp   AddTranscientVfx                         ;; 05:6531 $C3 $C7 $0C

func_005_6534::
    call GetEntityTransitionCountdown             ;; 05:6534 $CD $05 $0C
    cp   $40                                      ;; 05:6537 $FE $40
    jr   c, jr_005_655B                           ;; 05:6539 $38 $20

    jr   nz, .jr_6544                             ;; 05:653B $20 $07

    ld   a, NOISE_SFX_BREAK                       ;; 05:653D $3E $29
    ldh  [hNoiseSfx], a                           ;; 05:653F $E0 $F4
    call func_005_657F                            ;; 05:6541 $CD $7F $65

.jr_6544
    and  $02                                      ;; 05:6544 $E6 $02
    ld   e, $10                                   ;; 05:6546 $1E $10
    jr   z, .jr_654C                              ;; 05:6548 $28 $02

    ld   e, $F0                                   ;; 05:654A $1E $F0

.jr_654C
    ld   hl, wEntitiesSpeedXTable                 ;; 05:654C $21 $40 $C2
    add  hl, bc                                   ;; 05:654F $09
    push hl                                       ;; 05:6550 $E5
    ld   a, [hl]                                  ;; 05:6551 $7E
    push af                                       ;; 05:6552 $F5
    ld   [hl], e                                  ;; 05:6553 $73
    call AddEntitySpeedToPos_05                   ;; 05:6554 $CD $BE $7A
    pop  af                                       ;; 05:6557 $F1
    pop  hl                                       ;; 05:6558 $E1
    ld   [hl], a                                  ;; 05:6559 $77
    ret                                           ;; 05:655A $C9

jr_005_655B:
    and  a                                        ;; 05:655B $A7
    jr   nz, jr_005_656D                          ;; 05:655C $20 $0F

    call IncrementEntityState                     ;; 05:655E $CD $12 $3B
    ld   [hl], $01                                ;; 05:6561 $36 $01
    call ClearEntitySpeed                         ;; 05:6563 $CD $7F $3D
    ld   hl, wEntitiesHealthTable                 ;; 05:6566 $21 $60 $C3
    add  hl, bc                                   ;; 05:6569 $09
    ld   [hl], $08                                ;; 05:656A $36 $08
    ret                                           ;; 05:656C $C9

jr_005_656D:
    ldh  a, [hFrameCounter]                       ;; 05:656D $F0 $E7
    rra                                           ;; 05:656F $1F
    rra                                           ;; 05:6570 $1F
    rra                                           ;; 05:6571 $1F
    and  $01                                      ;; 05:6572 $E6 $01
    add  $03                                      ;; 05:6574 $C6 $03
    jp   SetEntitySpriteVariant                   ;; 05:6576 $C3 $0C $3B

func_005_6579::
    ret                                           ;; 05:6579 $C9

Data_005_657A::
    db   $C9, $F8

Data_005_657C::
    db   $08, $F8, $08

func_005_657F::
    ld   a, $02                                   ;; 05:657F $3E $02

jr_005_6581:
    ldh  [hMultiPurposeG], a                      ;; 05:6581 $E0 $E8
    ld   a, ENTITY_HOT_HEAD                       ;; 05:6583 $3E $62
    call SpawnNewEntity_trampoline                ;; 05:6585 $CD $86 $3B
    jr   c, .jr_65D3                              ;; 05:6588 $38 $49

    ld   hl, wEntitiesPrivateState1Table          ;; 05:658A $21 $B0 $C2
    add  hl, de                                   ;; 05:658D $19
    ld   [hl], $03                                ;; 05:658E $36 $03
    push bc                                       ;; 05:6590 $C5
    ldh  a, [hMultiPurposeG]                      ;; 05:6591 $F0 $E8
    ld   c, a                                     ;; 05:6593 $4F
    ld   hl, Data_005_657A                        ;; 05:6594 $21 $7A $65
    add  hl, bc                                   ;; 05:6597 $09
    ldh  a, [hMultiPurpose0]                      ;; 05:6598 $F0 $D7
    add  [hl]                                     ;; 05:659A $86
    ld   hl, wEntitiesPosXTable                   ;; 05:659B $21 $00 $C2
    add  hl, de                                   ;; 05:659E $19
    ld   [hl], a                                  ;; 05:659F $77
    ldh  a, [hMultiPurpose1]                      ;; 05:65A0 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 05:65A2 $21 $10 $C2
    add  hl, de                                   ;; 05:65A5 $19
    ld   [hl], a                                  ;; 05:65A6 $77
    ldh  a, [hMultiPurpose3]                      ;; 05:65A7 $F0 $DA
    ld   hl, wEntitiesPosZTable                   ;; 05:65A9 $21 $10 $C3
    add  hl, de                                   ;; 05:65AC $19
    ld   [hl], a                                  ;; 05:65AD $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 05:65AE $21 $B0 $C3
    add  hl, de                                   ;; 05:65B1 $19
    ldh  a, [hMultiPurposeG]                      ;; 05:65B2 $F0 $E8
    dec  a                                        ;; 05:65B4 $3D
    ld   [hl], a                                  ;; 05:65B5 $77
    ld   hl, Data_005_657C                        ;; 05:65B6 $21 $7C $65
    add  hl, bc                                   ;; 05:65B9 $09
    ld   a, [hl]                                  ;; 05:65BA $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:65BB $21 $40 $C2
    add  hl, de                                   ;; 05:65BE $19
    ld   [hl], a                                  ;; 05:65BF $77
    ld   hl, wEntitiesSpeedYTable                 ;; 05:65C0 $21 $50 $C2
    add  hl, de                                   ;; 05:65C3 $19
    ld   [hl], $04                                ;; 05:65C4 $36 $04
    pop  bc                                       ;; 05:65C6 $C1
    ld   hl, wEntitiesSpeedZTable                 ;; 05:65C7 $21 $20 $C3
    add  hl, de                                   ;; 05:65CA $19
    ld   [hl], $08                                ;; 05:65CB $36 $08
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 05:65CD $21 $40 $C3
    add  hl, de                                   ;; 05:65D0 $19
    ld   [hl], 2 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 05:65D1 $36 $42

.jr_65D3
    ldh  a, [hMultiPurposeG]                      ;; 05:65D3 $F0 $E8
    dec  a                                        ;; 05:65D5 $3D
    jr   nz, jr_005_6581                          ;; 05:65D6 $20 $A9

    ret                                           ;; 05:65D8 $C9

func_005_65D9::
    ld   a, ENTITY_HOT_HEAD                       ;; 05:65D9 $3E $62
    call SpawnNewEntity_trampoline                ;; 05:65DB $CD $86 $3B
    jr   c, Data_005_6601 - 1                     ;; 05:65DE $38 $20

    ld   hl, wEntitiesPrivateState1Table          ;; 05:65E0 $21 $B0 $C2
    add  hl, de                                   ;; 05:65E3 $19
    ld   [hl], $01                                ;; 05:65E4 $36 $01
    ldh  a, [hMultiPurpose0]                      ;; 05:65E6 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 05:65E8 $21 $00 $C2
    add  hl, de                                   ;; 05:65EB $19
    ld   [hl], a                                  ;; 05:65EC $77
    ldh  a, [hMultiPurpose1]                      ;; 05:65ED $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 05:65EF $21 $10 $C2
    add  hl, de                                   ;; 05:65F2 $19
    ld   [hl], a                                  ;; 05:65F3 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 05:65F4 $21 $E0 $C2
    add  hl, de                                   ;; 05:65F7 $19
    ld   [hl], $14                                ;; 05:65F8 $36 $14
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 05:65FA $21 $40 $C3
    add  hl, de                                   ;; 05:65FD $19
    ld   [hl], 4 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 05:65FE $36 $C4
    ret                                           ;; 05:6600 $C9

Data_005_6601::
    db   $F8, $08, $F8, $08

Data_005_6605::
    db   $FC, $FC, $04, $04

Data_005_6609::
    db   $F4, $0C, $F4, $0C

Data_005_660D::
    db   $F4, $F4, $0C, $0C

func_005_6611::
    ld   a, $04                                   ;; 05:6611 $3E $04

jr_005_6613:
    ldh  [hMultiPurposeG], a                      ;; 05:6613 $E0 $E8
    ld   a, ENTITY_HOT_HEAD                       ;; 05:6615 $3E $62
    call SpawnNewEntity_trampoline                ;; 05:6617 $CD $86 $3B
    jr   c, .jr_665F                              ;; 05:661A $38 $43

    ld   hl, wEntitiesPrivateState1Table          ;; 05:661C $21 $B0 $C2
    add  hl, de                                   ;; 05:661F $19
    ld   [hl], $02                                ;; 05:6620 $36 $02
    push bc                                       ;; 05:6622 $C5
    ldh  a, [hMultiPurposeG]                      ;; 05:6623 $F0 $E8
    ld   c, a                                     ;; 05:6625 $4F
    ld   hl, Data_005_6601 - 1                    ;; 05:6626 $21 $00 $66
    add  hl, bc                                   ;; 05:6629 $09
    ldh  a, [hMultiPurpose0]                      ;; 05:662A $F0 $D7
    add  [hl]                                     ;; 05:662C $86
    ld   hl, wEntitiesPosXTable                   ;; 05:662D $21 $00 $C2
    add  hl, de                                   ;; 05:6630 $19
    ld   [hl], a                                  ;; 05:6631 $77
    ld   hl, Data_005_6605 - 1                    ;; 05:6632 $21 $04 $66
    add  hl, bc                                   ;; 05:6635 $09
    ldh  a, [hMultiPurpose1]                      ;; 05:6636 $F0 $D8
    add  [hl]                                     ;; 05:6638 $86
    ld   hl, wEntitiesPosYTable                   ;; 05:6639 $21 $10 $C2
    add  hl, de                                   ;; 05:663C $19
    ld   [hl], a                                  ;; 05:663D $77
    ld   hl, Data_005_6609 - 1                    ;; 05:663E $21 $08 $66
    add  hl, bc                                   ;; 05:6641 $09
    ld   a, [hl]                                  ;; 05:6642 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:6643 $21 $40 $C2
    add  hl, de                                   ;; 05:6646 $19
    ld   [hl], a                                  ;; 05:6647 $77
    ld   hl, Data_005_660D - 1                    ;; 05:6648 $21 $0C $66
    add  hl, bc                                   ;; 05:664B $09
    ld   a, [hl]                                  ;; 05:664C $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:664D $21 $50 $C2
    add  hl, de                                   ;; 05:6650 $19
    ld   [hl], a                                  ;; 05:6651 $77
    pop  bc                                       ;; 05:6652 $C1
    ld   hl, wEntitiesSpeedZTable                 ;; 05:6653 $21 $20 $C3
    add  hl, de                                   ;; 05:6656 $19
    ld   [hl], $13                                ;; 05:6657 $36 $13
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 05:6659 $21 $40 $C3
    add  hl, de                                   ;; 05:665C $19
    ld   [hl], 2 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 05:665D $36 $42

.jr_665F
    ldh  a, [hMultiPurposeG]                      ;; 05:665F $F0 $E8
    dec  a                                        ;; 05:6661 $3D
    jr   nz, jr_005_6613                          ;; 05:6662 $20 $AF

    ret                                           ;; 05:6664 $C9

Data_005_6665::
    db   $F0, $F8, $60, $02, $F0, $00, $62, $02, $F0, $08, $64, $02, $F0, $10, $66, $02
    db   $00, $F8, $68, $02, $00, $00, $6A, $02, $00, $08, $6A, $22, $00, $10, $68, $22
    db   $F0, $F8, $66, $21, $F0, $00, $64, $21, $F0, $08, $62, $21, $F0, $10, $60, $21
    db   $00, $F8, $68, $01, $00, $00, $6A, $01, $00, $08, $6A, $21, $00, $10, $68, $21

Data_005_66A5::
    db   $00, $F8, $6C, $02, $00, $00, $6E, $02, $00, $08, $6E, $22, $00, $10, $6C, $22
    db   $00, $FC, $7C, $02, $00, $04, $7E, $02, $00, $0C, $7C, $22, $00, $00, $FF, $00
    db   $00, $FC, $7C, $02, $00, $04, $7E, $22, $00, $0C, $7C, $22, $00, $00, $FF, $00
    db   $00, $F8, $74, $02, $00, $00, $76, $02, $00, $08, $76, $22, $00, $10, $74, $22
    db   $00, $F8, $70, $02, $00, $00, $72, $02, $00, $08, $72, $22, $00, $10, $70, $22

Data_005_66F5::
    db   $0A, $FB, $26, $02, $0A, $01, $26, $02, $0A, $06, $26, $02, $0A, $0C, $26, $02

func_005_6705::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:6705 $F0 $F1
    cp   $02                                      ;; 05:6707 $FE $02
    jr   nc, label_005_6754                       ;; 05:6709 $30 $49

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 05:670B $21 $40 $C3
    add  hl, bc                                   ;; 05:670E $09
    ld   a, [hl]                                  ;; 05:670F $7E
    and  ENTITY_PHYSICS_MASK                      ;; 05:6710 $E6 $F0
    or   8                                        ;; 05:6712 $F6 $08
    ld   [hl], a                                  ;; 05:6714 $77
    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:6715 $F0 $F1
    rla                                           ;; 05:6717 $17
    rla                                           ;; 05:6718 $17
    rla                                           ;; 05:6719 $17
    rla                                           ;; 05:671A $17
    rla                                           ;; 05:671B $17
    and  $E0                                      ;; 05:671C $E6 $E0
    ld   e, a                                     ;; 05:671E $5F
    ld   d, b                                     ;; 05:671F $50
    ld   hl, Data_005_6665                        ;; 05:6720 $21 $65 $66
    add  hl, de                                   ;; 05:6723 $19
    ld   c, $08                                   ;; 05:6724 $0E $08
    call RenderActiveEntitySpritesRect            ;; 05:6726 $CD $E6 $3C
    nop                                           ;; 05:6729 $00

label_005_672A:
    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:672A $F0 $F1
    cp   $05                                      ;; 05:672C $FE $05
    ret  nc                                       ;; 05:672E $D0

    ld   hl, wEntitiesPosZTable                   ;; 05:672F $21 $10 $C3
    add  hl, bc                                   ;; 05:6732 $09
    ld   a, [hl]                                  ;; 05:6733 $7E
    dec  a                                        ;; 05:6734 $3D
    cp   $08                                      ;; 05:6735 $FE $08
    ret  c                                        ;; 05:6737 $D8

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 05:6738 $21 $40 $C3
    add  hl, bc                                   ;; 05:673B $09
    ld   a, [hl]                                  ;; 05:673C $7E
    and  ENTITY_PHYSICS_MASK                      ;; 05:673D $E6 $F0
    or   4                                        ;; 05:673F $F6 $04
    ld   [hl], a                                  ;; 05:6741 $77
    ldh  a, [hActiveEntityPosY]                   ;; 05:6742 $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ;; 05:6744 $E0 $EC
    xor  a                                        ;; 05:6746 $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:6747 $E0 $F1
    ld   hl, Data_005_66F5                        ;; 05:6749 $21 $F5 $66
    ld   c, $04                                   ;; 05:674C $0E $04
    call RenderActiveEntitySpritesRect            ;; 05:674E $CD $E6 $3C
    jp   CopyEntityPositionToActivePosition       ;; 05:6751 $C3 $8A $3D

label_005_6754:
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 05:6754 $21 $40 $C3
    add  hl, bc                                   ;; 05:6757 $09
    ld   a, [hl]                                  ;; 05:6758 $7E
    and  ENTITY_PHYSICS_MASK                      ;; 05:6759 $E6 $F0
    or   4                                        ;; 05:675B $F6 $04
    ld   [hl], a                                  ;; 05:675D $77
    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:675E $F0 $F1
    dec  a                                        ;; 05:6760 $3D
    dec  a                                        ;; 05:6761 $3D
    rla                                           ;; 05:6762 $17
    rla                                           ;; 05:6763 $17
    rla                                           ;; 05:6764 $17
    rla                                           ;; 05:6765 $17
    and  $F0                                      ;; 05:6766 $E6 $F0
    ld   e, a                                     ;; 05:6768 $5F
    ld   d, b                                     ;; 05:6769 $50
    ld   hl, Data_005_66A5                        ;; 05:676A $21 $A5 $66
    add  hl, de                                   ;; 05:676D $19
    ld   c, $04                                   ;; 05:676E $0E $04
    call RenderActiveEntitySpritesRect            ;; 05:6770 $CD $E6 $3C
    jp   label_005_672A                           ;; 05:6773 $C3 $2A $67

label_005_6776:
    call GetEntityTransitionCountdown             ;; 05:6776 $CD $05 $0C
    jp   z, ClearEntityStatus_05                  ;; 05:6779 $CA $4B $7B

    cp   $0A                                      ;; 05:677C $FE $0A
    ld   a, $05                                   ;; 05:677E $3E $05
    jr   c, .jr_6783                              ;; 05:6780 $38 $01

    inc  a                                        ;; 05:6782 $3C

.jr_6783
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:6783 $E0 $F1
    jp   label_005_6754                           ;; 05:6785 $C3 $54 $67

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HotHead1SpriteVariants::
.variant0
    db $1E, OAM_GBC_PAL_2 | OAMF_PAL0
    db $1E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant1
    db $1E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $1E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

label_005_6798:
    ld   de, HotHead1SpriteVariants               ;; 05:6798 $11 $88 $67
    call RenderActiveEntitySpritesPair            ;; 05:679B $CD $C0 $3B
    call ReturnIfNonInteractive_05                ;; 05:679E $CD $3A $7A
    call label_3B44                               ;; 05:67A1 $CD $44 $3B
    ldh  a, [hActiveEntityState]                  ;; 05:67A4 $F0 $F0
    JP_TABLE                                      ;; 05:67A6
._00 dw func_005_67AB                             ;; 05:67A7
._01 dw func_005_67D2                             ;; 05:67A9

func_005_67AB::
    call UpdateEntityPosWithSpeed_05
    call AddEntityZSpeedToPos_05                  ;; 05:67AE $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ;; 05:67B1 $21 $20 $C3
    add  hl, bc                                   ;; 05:67B4 $09
    dec  [hl]                                     ;; 05:67B5 $35
    ld   hl, wEntitiesPosZTable                   ;; 05:67B6 $21 $10 $C3
    add  hl, bc                                   ;; 05:67B9 $09
    ld   a, [hl]                                  ;; 05:67BA $7E
    and  $80                                      ;; 05:67BB $E6 $80
    jr   z, .jr_67C8                              ;; 05:67BD $28 $09

    ld   [hl], b                                  ;; 05:67BF $70
    call IncrementEntityState                     ;; 05:67C0 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 05:67C3 $CD $05 $0C
    ld   [hl], $0F                                ;; 05:67C6 $36 $0F

.jr_67C8
    ldh  a, [hFrameCounter]                       ;; 05:67C8 $F0 $E7
    rra                                           ;; 05:67CA $1F
    rra                                           ;; 05:67CB $1F
    rra                                           ;; 05:67CC $1F
    and  $01                                      ;; 05:67CD $E6 $01
    jp   SetEntitySpriteVariant                   ;; 05:67CF $C3 $0C $3B

func_005_67D2::
    call GetEntityTransitionCountdown             ;; 05:67D2 $CD $05 $0C
    jp   z, ClearEntityStatus_05                  ;; 05:67D5 $CA $4B $7B

    rra                                           ;; 05:67D8 $1F
    rra                                           ;; 05:67D9 $1F
    rra                                           ;; 05:67DA $1F
    and  $01                                      ;; 05:67DB $E6 $01
    inc  a                                        ;; 05:67DD $3C
    inc  a                                        ;; 05:67DE $3C
    jp   SetEntitySpriteVariant                   ;; 05:67DF $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HotHead2SpriteVariants::
.variant0
    db $6C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $6E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

label_005_67EA:
    ld   de, HotHead2SpriteVariants               ;; 05:67EA $11 $E2 $67
    call RenderActiveEntitySpritesPair            ;; 05:67ED $CD $C0 $3B
    call ReturnIfNonInteractive_05                ;; 05:67F0 $CD $3A $7A
    call UpdateEntityPosWithSpeed_05              ;; 05:67F3 $CD $B1 $7A
    call AddEntityZSpeedToPos_05                  ;; 05:67F6 $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ;; 05:67F9 $21 $20 $C3
    add  hl, bc                                   ;; 05:67FC $09
    dec  [hl]                                     ;; 05:67FD $35
    ld   hl, wEntitiesPosZTable                   ;; 05:67FE $21 $10 $C3
    add  hl, bc                                   ;; 05:6801 $09
    ld   a, [hl]                                  ;; 05:6802 $7E
    and  $80                                      ;; 05:6803 $E6 $80
    ret  z                                        ;; 05:6805 $C8

    xor  a                                        ;; 05:6806 $AF
    ld   [hl], a                                  ;; 05:6807 $77
    call GetEntityTransitionCountdown             ;; 05:6808 $CD $05 $0C
    ld   [hl], $0F                                ;; 05:680B $36 $0F
    ld   hl, wEntitiesPrivateState1Table          ;; 05:680D $21 $B0 $C2
    add  hl, bc                                   ;; 05:6810 $09
    ld   [hl], $02                                ;; 05:6811 $36 $02
    ld   a, $FF                                   ;; 05:6813 $3E $FF
    jp   SetEntitySpriteVariant                   ;; 05:6815 $C3 $0C $3B
