Data_019_44FC::
    db   $00, $00, $08, $20, $00, $08, $06, $20, $00, $00, $06, $00, $00, $08, $08, $00
    db   $00, $04, $04, $40, $FF, $FF, $FF, $FF, $00, $04, $04, $00, $FF, $FF, $FF, $FF

Data_019_451C::
    db   $00, $00, $FC, $04

Data_019_4520::
    db   $01, $01, $00, $00

SwordBeamEntityHandler::
    ld   hl, wActiveProjectileCount               ;; 19:4524 $21 $4D $C1
    inc  [hl]                                     ;; 19:4527 $34
    ldh  a, [hActiveEntityState]                  ;; 19:4528 $F0 $F0
    and  a                                        ;; 19:452A $A7
    jr   nz, .jr_4562                             ;; 19:452B $20 $35

    ldh  a, [hLinkDirection]                      ;; 19:452D $F0 $9E
    ld   e, a                                     ;; 19:452F $5F
    ld   d, b                                     ;; 19:4530 $50
    ld   hl, Data_019_451C                        ;; 19:4531 $21 $1C $45
    add  hl, de                                   ;; 19:4534 $19
    ldh  a, [hLinkPositionX]                      ;; 19:4535 $F0 $98
    add  [hl]                                     ;; 19:4537 $86
    ld   hl, wEntitiesPosXTable                   ;; 19:4538 $21 $00 $C2
    add  hl, bc                                   ;; 19:453B $09
    ld   [hl], a                                  ;; 19:453C $77
    ld   hl, Data_019_4520                        ;; 19:453D $21 $20 $45
    add  hl, de                                   ;; 19:4540 $19
    ldh  a, [hLinkPositionY]                      ;; 19:4541 $F0 $99
    add  [hl]                                     ;; 19:4543 $86
    ld   hl, wEntitiesPosYTable                   ;; 19:4544 $21 $10 $C2
    add  hl, bc                                   ;; 19:4547 $09
    ld   [hl], a                                  ;; 19:4548 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 19:4549 $21 $40 $C2
    add  hl, bc                                   ;; 19:454C $09
    sla  [hl]                                     ;; 19:454D $CB $26
    ld   hl, wEntitiesSpeedYTable                 ;; 19:454F $21 $50 $C2
    add  hl, bc                                   ;; 19:4552 $09
    sla  [hl]                                     ;; 19:4553 $CB $26
    ld   hl, wEntitiesFlashCountdownTable         ;; 19:4555 $21 $20 $C4
    add  hl, bc                                   ;; 19:4558 $09
    ld   [hl], $FF                                ;; 19:4559 $36 $FF
    ld   a, JINGLE_SWORD_BEAM                     ;; 19:455B $3E $3B
    ldh  [hJingle], a                             ;; 19:455D $E0 $F2
    jp   IncrementEntityState                     ;; 19:455F $C3 $12 $3B

.jr_4562
    call func_019_45B2                            ;; 19:4562 $CD $B2 $45
    call ReturnIfNonInteractive_19                ;; 19:4565 $CD $3D $7D
    ld   a, $01                                   ;; 19:4568 $3E $01
    ld   [wC19E], a                               ;; 19:456A $EA $9E $C1
    call label_3B7B                               ;; 19:456D $CD $7B $3B
    call UpdateEntityPosWithSpeed_19              ;; 19:4570 $CD $B8 $7D
    call label_3B2E                               ;; 19:4573 $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ;; 19:4576 $21 $A0 $C2
    add  hl, bc                                   ;; 19:4579 $09
    ld   a, [hl]                                  ;; 19:457A $7E
    and  a                                        ;; 19:457B $A7
    jr   nz, jr_019_45A0                          ;; 19:457C $20 $22

    ldh  a, [hFrameCounter]                       ;; 19:457E $F0 $E7
    inc  a                                        ;; 19:4580 $3C
    and  $03                                      ;; 19:4581 $E6 $03
    jr   nz, .ret_459F                            ;; 19:4583 $20 $1A

    ldh  a, [hActiveEntityPosX]                   ;; 19:4585 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 19:4587 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:4589 $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 19:458B $E0 $D8
    ld   a, TRANSCIENT_VFX_SWORD_BEAM             ;; 19:458D $3E $0D
    call AddTranscientVfx                         ;; 19:458F $CD $C7 $0C
    ld   hl, wTranscientVfxCountdownTable         ;; 19:4592 $21 $20 $C5
    add  hl, de                                   ;; 19:4595 $19
    ld   [hl], $08                                ;; 19:4596 $36 $08
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:4598 $F0 $F1
    ld   hl, wC590                                ;; 19:459A $21 $90 $C5
    add  hl, de                                   ;; 19:459D $19
    ld   [hl], a                                  ;; 19:459E $77

.ret_459F
    ret                                           ;; 19:459F $C9

jr_019_45A0:
    call ClearEntityStatus_19                     ;; 19:45A0 $CD $61 $7E

func_019_45A3:: ; Also called from the boomang code.
    ldh  a, [hActiveEntityPosX]                   ;; 19:45A3 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 19:45A5 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:45A7 $F0 $EC
    add  $03                                      ;; 19:45A9 $C6 $03
    ldh  [hMultiPurpose1], a                      ;; 19:45AB $E0 $D8
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ;; 19:45AD $3E $05
    jp   AddTranscientVfx                         ;; 19:45AF $C3 $C7 $0C

func_019_45B2::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:45B2 $F0 $F1
    rla                                           ;; 19:45B4 $17
    rla                                           ;; 19:45B5 $17
    rla                                           ;; 19:45B6 $17
    and  $F8                                      ;; 19:45B7 $E6 $F8
    ld   e, a                                     ;; 19:45B9 $5F
    ld   d, b                                     ;; 19:45BA $50
    ld   hl, Data_019_44FC                        ;; 19:45BB $21 $FC $44
    add  hl, de                                   ;; 19:45BE $19
    ld   c, $02                                   ;; 19:45BF $0E $02
    jp   RenderActiveEntitySpritesRect            ;; 19:45C1 $C3 $E6 $3C
