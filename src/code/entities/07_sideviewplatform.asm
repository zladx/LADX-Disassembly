Data_007_6348::
    db   $00, $00, $50, $07, $00, $08, $52, $07, $00, $10, $52, $27, $00, $18, $50, $27

SideViewPlatformHorizontalEntityHandler::
SideViewPlatformVerticalEntityHandler::
    ld   hl, Data_007_6348                        ;; 07:6358 $21 $48 $63
    ld   c, $04                                   ;; 07:635B $0E $04
    call RenderActiveEntitySpritesRect            ;; 07:635D $CD $E6 $3C
    call ReturnIfNonInteractive_07                ;; 07:6360 $CD $96 $7D
    call GetEntityTransitionCountdown             ;; 07:6363 $CD $05 $0C
    ld   e, a                                     ;; 07:6366 $5F
    ld   hl, wEntitiesInertiaTable                ;; 07:6367 $21 $D0 $C3
    add  hl, bc                                   ;; 07:636A $09
    inc  [hl]                                     ;; 07:636B $34
    ld   a, [hl]                                  ;; 07:636C $7E
    and  $03                                      ;; 07:636D $E6 $03
    or   e                                        ;; 07:636F $B3
    jr   nz, func_007_639E                        ;; 07:6370 $20 $2C

    ldh  a, [hActiveEntityType]                   ;; 07:6372 $F0 $EB
    cp   ENTITY_SIDE_VIEW_PLATFORM_VERTICAL       ;; 07:6374 $FE $A4
    jp   z, label_007_63FB                        ;; 07:6376 $CA $FB $63

    ld   hl, wEntitiesPrivateState1Table          ;; 07:6379 $21 $B0 $C2
    add  hl, bc                                   ;; 07:637C $09
    ld   e, [hl]                                  ;; 07:637D $5E
    ld   d, b                                     ;; 07:637E $50
    ld   hl, Data_007_63F7                        ;; 07:637F $21 $F7 $63
    add  hl, de                                   ;; 07:6382 $19
    ld   a, [hl]                                  ;; 07:6383 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:6384 $21 $40 $C2
    add  hl, bc                                   ;; 07:6387 $09
    add  [hl]                                     ;; 07:6388 $86
    ld   [hl], a                                  ;; 07:6389 $77
    ld   hl, Data_007_63F9                        ;; 07:638A $21 $F9 $63
    add  hl, de                                   ;; 07:638D $19
    cp   [hl]                                     ;; 07:638E $BE
    jr   nz, func_007_639E                        ;; 07:638F $20 $0D

    ld   hl, wEntitiesPrivateState1Table          ;; 07:6391 $21 $B0 $C2
    add  hl, bc                                   ;; 07:6394 $09
    ld   a, [hl]                                  ;; 07:6395 $7E
    xor  $01                                      ;; 07:6396 $EE $01
    ld   [hl], a                                  ;; 07:6398 $77
    call GetEntityTransitionCountdown             ;; 07:6399 $CD $05 $0C
    ld   [hl], $6A                                ;; 07:639C $36 $6A

func_007_639E::
    ld   hl, wEntitiesPrivateState2Table          ;; 07:639E $21 $C0 $C2
    add  hl, bc                                   ;; 07:63A1 $09
    ld   [hl], b                                  ;; 07:63A2 $70
    ldh  a, [hActiveEntityPosX]                   ;; 07:63A3 $F0 $EE
    push af                                       ;; 07:63A5 $F5
    call UpdateEntityPosWithSpeed_07              ;; 07:63A6 $CD $0A $7E
    pop  af                                       ;; 07:63A9 $F1
    ld   e, a                                     ;; 07:63AA $5F
    ld   hl, wEntitiesPosXTable                   ;; 07:63AB $21 $00 $C2
    add  hl, bc                                   ;; 07:63AE $09
    ld   a, [hl]                                  ;; 07:63AF $7E
    sub  e                                        ;; 07:63B0 $93
    ldh  [hMultiPurposeG], a                      ;; 07:63B1 $E0 $E8
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:63B3 $CD $23 $3B
    call CheckLinkCollisionWithEnemy_trampoline   ;; 07:63B6 $CD $5A $3B
    jr   nc, .ret_63F6                            ;; 07:63B9 $30 $3B

    ldh  a, [hLinkSpeedY]                         ;; 07:63BB $F0 $9B
    and  $80                                      ;; 07:63BD $E6 $80
    jr   nz, .ret_63F6                            ;; 07:63BF $20 $35

    call GetEntityYDistanceToLink_07              ;; 07:63C1 $CD $6D $7E
    add  $08                                      ;; 07:63C4 $C6 $08
    bit  7, a                                     ;; 07:63C6 $CB $7F
    jr   z, .ret_63F6                             ;; 07:63C8 $28 $2C

    ld   hl, wEntitiesPosYTable                   ;; 07:63CA $21 $10 $C2
    add  hl, bc                                   ;; 07:63CD $09
    ld   a, [hl]                                  ;; 07:63CE $7E
    sub  $10                                      ;; 07:63CF $D6 $10
    ldh  [hLinkPositionY], a                      ;; 07:63D1 $E0 $99
    ldh  a, [hLinkSpeedX]                         ;; 07:63D3 $F0 $9A
    push af                                       ;; 07:63D5 $F5
    ldh  a, [hMultiPurposeG]                      ;; 07:63D6 $F0 $E8
    ldh  [hLinkSpeedX], a                         ;; 07:63D8 $E0 $9A
    ld   hl, hLinkPositionX                       ;; 07:63DA $21 $98 $FF
    add  [hl]                                     ;; 07:63DD $86
    ld   [hl], a                                  ;; 07:63DE $77
    push bc                                       ;; 07:63DF $C5
    call CheckPositionForMapTransition_trampoline ;; 07:63E0 $CD $19 $3E
    pop  bc                                       ;; 07:63E3 $C1
    pop  af                                       ;; 07:63E4 $F1
    ldh  [hLinkSpeedX], a                         ;; 07:63E5 $E0 $9A
    ld   a, $02                                   ;; 07:63E7 $3E $02
    ldh  [hLinkSpeedY], a                         ;; 07:63E9 $E0 $9B
    ld   a, $01                                   ;; 07:63EB $3E $01
    ld   [wC147], a                               ;; 07:63ED $EA $47 $C1
    ld   hl, wEntitiesPrivateState2Table          ;; 07:63F0 $21 $C0 $C2
    add  hl, bc                                   ;; 07:63F3 $09
    ld   [hl], $10                                ;; 07:63F4 $36 $10

.ret_63F6
    ret                                           ;; 07:63F6 $C9

Data_007_63F7::
    db   $01, $FF

Data_007_63F9::
    db   $06, $FA

label_007_63FB:
    ld   hl, wEntitiesPrivateState1Table          ;; 07:63FB $21 $B0 $C2
    add  hl, bc                                   ;; 07:63FE $09
    ld   e, [hl]                                  ;; 07:63FF $5E
    ld   d, b                                     ;; 07:6400 $50
    ld   hl, Data_007_63F7                        ;; 07:6401 $21 $F7 $63
    add  hl, de                                   ;; 07:6404 $19
    ld   a, [hl]                                  ;; 07:6405 $7E
    call GetEntitySpeedYAddress                   ;; 07:6406 $CD $05 $40
    add  [hl]                                     ;; 07:6409 $86
    ld   [hl], a                                  ;; 07:640A $77
    ld   hl, Data_007_63F9                        ;; 07:640B $21 $F9 $63
    add  hl, de                                   ;; 07:640E $19
    cp   [hl]                                     ;; 07:640F $BE
    jr   nz, .jr_641F                             ;; 07:6410 $20 $0D

    ld   hl, wEntitiesPrivateState1Table          ;; 07:6412 $21 $B0 $C2
    add  hl, bc                                   ;; 07:6415 $09
    ld   a, [hl]                                  ;; 07:6416 $7E
    xor  $01                                      ;; 07:6417 $EE $01
    ld   [hl], a                                  ;; 07:6419 $77
    call GetEntityTransitionCountdown             ;; 07:641A $CD $05 $0C
    ld   [hl], $6A                                ;; 07:641D $36 $6A

.jr_641F
    jp   func_007_639E                            ;; 07:641F $C3 $9E $63

Data_007_6422::
    db   $00, $00, $50, $07, $00, $08, $52, $07, $00, $10, $52, $27, $00, $18, $50, $27

SideViewPlatformEntityHandler::
    call GetEntityPrivateCountdown1               ;; 07:6432 $CD $00 $0C
    jr   z, .jr_643B                              ;; 07:6435 $28 $04

    ld   a, $04                                   ;; 07:6437 $3E $04
    ldh  [hActiveEntityTilesOffset], a            ;; 07:6439 $E0 $F5

.jr_643B
    ld   hl, Data_007_6422                        ;; 07:643B $21 $22 $64
    ld   c, $04                                   ;; 07:643E $0E $04
    call RenderActiveEntitySpritesRect            ;; 07:6440 $CD $E6 $3C
    call ReturnIfNonInteractive_07                ;; 07:6443 $CD $96 $7D
    call func_007_639E                            ;; 07:6446 $CD $9E $63
    ld   hl, wEntitiesPrivateState2Table          ;; 07:6449 $21 $C0 $C2
    add  hl, bc                                   ;; 07:644C $09
    ld   a, [hl]                                  ;; 07:644D $7E
    and  a                                        ;; 07:644E $A7
    jr   z, jr_007_6489                           ;; 07:644F $28 $38

    ld   e, $04                                   ;; 07:6451 $1E $04
    ldh  a, [hMapRoom]                            ;; 07:6453 $F0 $F6
    cp   UNKNOWN_ROOM_3B                          ;; 07:6455 $FE $3B
    jr   z, .jr_6466                              ;; 07:6457 $28 $0D

    call GetEntityPrivateCountdown1               ;; 07:6459 $CD $00 $0C
    ld   [hl], $08                                ;; 07:645C $36 $08
    ld   a, [wC3CF]                               ;; 07:645E $FA $CF $C3
    and  a                                        ;; 07:6461 $A7
    jr   z, jr_007_6489                           ;; 07:6462 $28 $25

    ld   e, $04                                   ;; 07:6464 $1E $04

.jr_6466
    ld   hl, wEntitiesPrivateState4Table          ;; 07:6466 $21 $40 $C4
    add  hl, bc                                   ;; 07:6469 $09
    ld   a, [hl]                                  ;; 07:646A $7E
    cp   $04                                      ;; 07:646B $FE $04
    jr   z, .jr_6478                              ;; 07:646D $28 $09

    inc  [hl]                                     ;; 07:646F $34
    cp   $03                                      ;; 07:6470 $FE $03
    jr   nz, .jr_6478                             ;; 07:6472 $20 $04

    ld   a, NOISE_SFX_RUMBLE                      ;; 07:6474 $3E $11
    ldh  [hNoiseSfx], a                           ;; 07:6476 $E0 $F4

.jr_6478
    ldh  a, [hFrameCounter]                       ;; 07:6478 $F0 $E7
    and  $03                                      ;; 07:647A $E6 $03
    jr   nz, ret_007_6488                         ;; 07:647C $20 $0A

    call GetEntitySpeedYAddress                   ;; 07:647E $CD $05 $40

.jr_6481
    ld   a, [hl]                                  ;; 07:6481 $7E
    sub  e                                        ;; 07:6482 $93
    and  $80                                      ;; 07:6483 $E6 $80
    jr   z, ret_007_6488                          ;; 07:6485 $28 $01

    inc  [hl]                                     ;; 07:6487 $34

ret_007_6488:
    ret                                           ;; 07:6488 $C9

jr_007_6489:
    call GetEntitySpeedYAddress                   ;; 07:6489 $CD $05 $40
    ld   [hl], b                                  ;; 07:648C $70
    ld   hl, wEntitiesPrivateState4Table          ;; 07:648D $21 $40 $C4
    add  hl, bc                                   ;; 07:6490 $09
    ld   [hl], b                                  ;; 07:6491 $70
    ret                                           ;; 07:6492 $C9
