AntiKirbyEntityHandler::
    call func_006_44B6                            ;; 06:423A $CD $B6 $44
    call ReturnIfNonInteractive_06                ;; 06:423D $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:4240 $CD $F7 $64
    call AddEntityZSpeedToPos_06                  ;; 06:4243 $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:4246 $21 $20 $C3
    add  hl, bc                                   ;; 06:4249 $09
    dec  [hl]                                     ;; 06:424A $35
    dec  [hl]                                     ;; 06:424B $35
    dec  [hl]                                     ;; 06:424C $35
    ld   hl, wEntitiesPosZTable                   ;; 06:424D $21 $10 $C3
    add  hl, bc                                   ;; 06:4250 $09
    ld   a, [hl]                                  ;; 06:4251 $7E
    and  $80                                      ;; 06:4252 $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 06:4254 $E0 $E8
    jr   z, .jr_425E                              ;; 06:4256 $28 $06

    ld   [hl], b                                  ;; 06:4258 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 06:4259 $21 $20 $C3
    add  hl, bc                                   ;; 06:425C $09
    ld   [hl], b                                  ;; 06:425D $70

.jr_425E
    ldh  a, [hActiveEntityState]                  ;; 06:425E $F0 $F0
    JP_TABLE                                      ;; 06:4260
._00 dw AntiKirbyState0Handler
._01 dw AntiKirbyState1Handler
._02 dw AntiKirbyState2Handler
._03 dw AntiKirbyState3Handler
._04 dw AntiKirbyState4Handler

AntiKirbyState0Handler::
    call GetEntityTransitionCountdown             ;; 06:426B $CD $05 $0C
    jr   nz, label_006_42A2                       ;; 06:426E $20 $32

    call ClearEntitySpeed                         ;; 06:4270 $CD $7F $3D
    call GetEntitySlowTransitionCountdown         ;; 06:4273 $CD $FB $0B
    jr   nz, .jr_4294                             ;; 06:4276 $20 $1C

    call GetEntityXDistanceToLink_06              ;; 06:4278 $CD $94 $65
    ld   hl, wEntitiesDirectionTable              ;; 06:427B $21 $80 $C3
    add  hl, bc                                   ;; 06:427E $09
    ld   a, [hl]                                  ;; 06:427F $7E
    and  $01                                      ;; 06:4280 $E6 $01
    cp   e                                        ;; 06:4282 $BB
    jr   nz, .jr_4294                             ;; 06:4283 $20 $0F

    call IncrementEntityState                     ;; 06:4285 $CD $12 $3B
    ld   [hl], $02                                ;; 06:4288 $36 $02
    call GetEntityTransitionCountdown             ;; 06:428A $CD $05 $0C
    ld   [hl], $FF                                ;; 06:428D $36 $FF
    ld   a, NOISE_SFX_KIRBY_INHALE                ;; 06:428F $3E $3B
    ldh  [hNoiseSfx], a                           ;; 06:4291 $E0 $F4
    ret                                           ;; 06:4293 $C9

.jr_4294
    call GetEntityTransitionCountdown             ;; 06:4294 $CD $05 $0C
    call GetRandomByte                            ;; 06:4297 $CD $0D $28
    and  $1F                                      ;; 06:429A $E6 $1F
    add  $10                                      ;; 06:429C $C6 $10
    ld   [hl], a                                  ;; 06:429E $77
    call IncrementEntityState                     ;; 06:429F $CD $12 $3B

label_006_42A2:
    ldh  a, [hMultiPurposeG]                      ;; 06:42A2 $F0 $E8
    and  a                                        ;; 06:42A4 $A7
    jr   z, .jr_42AD                              ;; 06:42A5 $28 $06

    ld   hl, wEntitiesSpeedZTable                 ;; 06:42A7 $21 $20 $C3
    add  hl, bc                                   ;; 06:42AA $09
    ld   [hl], $10                                ;; 06:42AB $36 $10

.jr_42AD
    call UpdateEntityPosWithSpeed_06              ;; 06:42AD $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:42B0 $CD $23 $3B
    ld   hl, wEntitiesDirectionTable              ;; 06:42B3 $21 $80 $C3
    add  hl, bc                                   ;; 06:42B6 $09
    ld   a, [hl]                                  ;; 06:42B7 $7E
    rla                                           ;; 06:42B8 $17
    and  $06                                      ;; 06:42B9 $E6 $06
    call SetEntitySpriteVariant                   ;; 06:42BB $CD $0C $3B
    jp   DefaultEnemyDamageCollisionHandler_trampoline ;; 06:42BE $C3 $39 $3B

Data_006_42C1::
    db   $08, $F8, $08, $F8

Data_006_42C5::
    db   $F8, $F8, $08, $08

AntiKirbyState1Handler::
    call GetEntityTransitionCountdown             ;; 06:42C9 $CD $05 $0C
    jr   nz, jr_006_4310                          ;; 06:42CC $20 $42

    call GetRandomByte                            ;; 06:42CE $CD $0D $28
    and  $1F                                      ;; 06:42D1 $E6 $1F
    add  $20                                      ;; 06:42D3 $C6 $20
    ld   [hl], a                                  ;; 06:42D5 $77
    call IncrementEntityState                     ;; 06:42D6 $CD $12 $3B
    ld   [hl], b                                  ;; 06:42D9 $70
    call GetRandomByte                            ;; 06:42DA $CD $0D $28
    bit  2, a                                     ;; 06:42DD $CB $57
    jr   z, .jr_42E5                              ;; 06:42DF $28 $04

    and  $03                                      ;; 06:42E1 $E6 $03
    jr   jr_006_42F5                              ;; 06:42E3 $18 $10

.jr_42E5
    call GetEntityXDistanceToLink_06              ;; 06:42E5 $CD $94 $65
    push de                                       ;; 06:42E8 $D5
    call GetEntityYDistanceToLink_06              ;; 06:42E9 $CD $A4 $65
    ld   a, e                                     ;; 06:42EC $7B
    and  $03                                      ;; 06:42ED $E6 $03
    dec  a                                        ;; 06:42EF $3D
    dec  a                                        ;; 06:42F0 $3D
    sla  a                                        ;; 06:42F1 $CB $27
    pop  de                                       ;; 06:42F3 $D1
    or   e                                        ;; 06:42F4 $B3

jr_006_42F5:
    ld   e, a                                     ;; 06:42F5 $5F
    ld   hl, wEntitiesDirectionTable              ;; 06:42F6 $21 $80 $C3
    add  hl, bc                                   ;; 06:42F9 $09
    ld   [hl], e                                  ;; 06:42FA $73
    ld   d, b                                     ;; 06:42FB $50
    ld   hl, Data_006_42C1                        ;; 06:42FC $21 $C1 $42
    add  hl, de                                   ;; 06:42FF $19
    ld   a, [hl]                                  ;; 06:4300 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:4301 $21 $40 $C2
    add  hl, bc                                   ;; 06:4304 $09
    ld   [hl], a                                  ;; 06:4305 $77
    ld   hl, Data_006_42C5                        ;; 06:4306 $21 $C5 $42
    add  hl, de                                   ;; 06:4309 $19
    ld   a, [hl]                                  ;; 06:430A $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:430B $21 $50 $C2
    add  hl, bc                                   ;; 06:430E $09
    ld   [hl], a                                  ;; 06:430F $77

jr_006_4310:
    jp   label_006_42A2                           ;; 06:4310 $C3 $A2 $42

AntiKirbyState2Handler::
    call label_3B70                               ;; 06:4313 $CD $70 $3B
    call GetEntityTransitionCountdown             ;; 06:4316 $CD $05 $0C
    jr   nz, jr_006_432B                          ;; 06:4319 $20 $10

label_006_431B:
    call IncrementEntityState                     ;; 06:431B $CD $12 $3B
    ld   [hl], b                                  ;; 06:431E $70
    call GetEntitySlowTransitionCountdown         ;; 06:431F $CD $FB $0B
    call GetRandomByte                            ;; 06:4322 $CD $0D $28
    and  $1F                                      ;; 06:4325 $E6 $1F
    add  $08                                      ;; 06:4327 $C6 $08
    ld   [hl], a                                  ;; 06:4329 $77
    ret                                           ;; 06:432A $C9

jr_006_432B:
    ld   a, $01                                   ;; 06:432B $3E $01
    ld   [wD3E6], a                               ;; 06:432D $EA $E6 $D3
    ld   hl, wEntitiesSpeedZTable                 ;; 06:4330 $21 $20 $C3
    add  hl, bc                                   ;; 06:4333 $09
    ld   [hl], b                                  ;; 06:4334 $70
    ldh  a, [hFrameCounter]                       ;; 06:4335 $F0 $E7
    and  $03                                      ;; 06:4337 $E6 $03
    jr   nz, jr_006_434B                          ;; 06:4339 $20 $10

    ld   hl, wEntitiesPosZTable                   ;; 06:433B $21 $10 $C3
    add  hl, bc                                   ;; 06:433E $09
    ld   a, [hl]                                  ;; 06:433F $7E
    sub  $0C                                      ;; 06:4340 $D6 $0C
    jr   z, jr_006_434B                           ;; 06:4342 $28 $07

    and  $80                                      ;; 06:4344 $E6 $80
    jr   z, .jr_434A                              ;; 06:4346 $28 $02

    inc  [hl]                                     ;; 06:4348 $34
    inc  [hl]                                     ;; 06:4349 $34

.jr_434A
    dec  [hl]                                     ;; 06:434A $35

jr_006_434B:
    ldh  a, [hLinkAnimationState]                 ;; 06:434B $F0 $9D
    cp   LINK_ANIMATION_STATE_HIDDEN              ;; 06:434D $FE $FF
    jr   z, label_006_43B8                        ;; 06:434F $28 $67

    call GetEntityXDistanceToLink_06              ;; 06:4351 $CD $94 $65
    ld   hl, wEntitiesDirectionTable              ;; 06:4354 $21 $80 $C3
    add  hl, bc                                   ;; 06:4357 $09
    ld   a, [hl]                                  ;; 06:4358 $7E
    and  $01                                      ;; 06:4359 $E6 $01
    cp   e                                        ;; 06:435B $BB
    jr   nz, label_006_43B8                       ;; 06:435C $20 $5A

    call GetEntityXDistanceToLink_06              ;; 06:435E $CD $94 $65
    add  $40                                      ;; 06:4361 $C6 $40
    cp   $80                                      ;; 06:4363 $FE $80
    jr   nc, label_006_43B8                       ;; 06:4365 $30 $51

    ld   hl, wEntitiesPosYTable                   ;; 06:4367 $21 $10 $C2
    add  hl, bc                                   ;; 06:436A $09
    ld   a, [hl]                                  ;; 06:436B $7E
    push hl                                       ;; 06:436C $E5
    push af                                       ;; 06:436D $F5
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:436E $F0 $EC
    ld   [hl], a                                  ;; 06:4370 $77
    call GetEntityYDistanceToLink_06              ;; 06:4371 $CD $A4 $65
    ld   e, a                                     ;; 06:4374 $5F
    pop  af                                       ;; 06:4375 $F1
    pop  hl                                       ;; 06:4376 $E1
    ld   [hl], a                                  ;; 06:4377 $77
    ld   a, e                                     ;; 06:4378 $7B
    add  $30                                      ;; 06:4379 $C6 $30
    cp   $60                                      ;; 06:437B $FE $60
    jr   nc, label_006_43B8                       ;; 06:437D $30 $39

    ld   a, $08                                   ;; 06:437F $3E $08
    call GetVectorTowardsLink_trampoline          ;; 06:4381 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:4384 $F0 $D7
    cpl                                           ;; 06:4386 $2F
    inc  a                                        ;; 06:4387 $3C
    ldh  [hLinkSpeedY], a                         ;; 06:4388 $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 06:438A $F0 $D8
    cpl                                           ;; 06:438C $2F
    inc  a                                        ;; 06:438D $3C
    ldh  [hLinkSpeedX], a                         ;; 06:438E $E0 $9A
    push bc                                       ;; 06:4390 $C5
    call UpdateFinalLinkPosition                  ;; 06:4391 $CD $A8 $21
    call CheckPositionForMapTransition_trampoline ;; 06:4394 $CD $19 $3E
    pop  bc                                       ;; 06:4397 $C1
    ld   hl, hActiveEntityPosX                    ;; 06:4398 $21 $EE $FF
    ldh  a, [hLinkPositionX]                      ;; 06:439B $F0 $98
    sub  [hl]                                     ;; 06:439D $96
    add  $04                                      ;; 06:439E $C6 $04
    cp   $08                                      ;; 06:43A0 $FE $08
    jr   nc, label_006_43B8                       ;; 06:43A2 $30 $14

    ld   hl, hActiveEntityVisualPosY              ;; 06:43A4 $21 $EC $FF
    ldh  a, [hLinkPositionY]                      ;; 06:43A7 $F0 $99
    sub  [hl]                                     ;; 06:43A9 $96
    add  $04                                      ;; 06:43AA $C6 $04
    cp   $08                                      ;; 06:43AC $FE $08
    jr   nc, label_006_43B8                       ;; 06:43AE $30 $08

    call GetEntityTransitionCountdown             ;; 06:43B0 $CD $05 $0C
    ld   [hl], $80                                ;; 06:43B3 $36 $80
    call IncrementEntityState                     ;; 06:43B5 $CD $12 $3B

label_006_43B8:
    ld   hl, wEntitiesDirectionTable              ;; 06:43B8 $21 $80 $C3
    add  hl, bc                                   ;; 06:43BB $09
    ld   a, [hl]                                  ;; 06:43BC $7E
    rla                                           ;; 06:43BD $17
    and  $06                                      ;; 06:43BE $E6 $06
    or   $01                                      ;; 06:43C0 $F6 $01
    jp   SetEntitySpriteVariant                   ;; 06:43C2 $C3 $0C $3B

AntiKirbyState3Handler::
    call GetEntityTransitionCountdown             ;; 06:43C5 $CD $05 $0C
    jr   z, jr_006_43F5                           ;; 06:43C8 $28 $2B

    ldh  a, [hMultiPurposeG]                      ;; 06:43CA $F0 $E8
    and  a                                        ;; 06:43CC $A7
    jr   z, .jr_43E2                              ;; 06:43CD $28 $13

    ld   hl, wEntitiesPrivateState1Table          ;; 06:43CF $21 $B0 $C2
    add  hl, bc                                   ;; 06:43D2 $09
    ld   a, [hl]                                  ;; 06:43D3 $7E
    and  a                                        ;; 06:43D4 $A7
    jr   nz, .jr_43E2                             ;; 06:43D5 $20 $0B

    inc  [hl]                                     ;; 06:43D7 $34
    ld   hl, wEntitiesSpeedZTable                 ;; 06:43D8 $21 $20 $C3
    add  hl, bc                                   ;; 06:43DB $09
    ld   [hl], $0C                                ;; 06:43DC $36 $0C
    ld   a, JINGLE_BUMP                           ;; 06:43DE $3E $09
    ldh  [hJingle], a                             ;; 06:43E0 $E0 $F2

.jr_43E2
    ld   hl, wEntitiesDirectionTable              ;; 06:43E2 $21 $80 $C3
    add  hl, bc                                   ;; 06:43E5 $09
    ld   a, [hl]                                  ;; 06:43E6 $7E
    add  $08                                      ;; 06:43E7 $C6 $08
    call SetEntitySpriteVariant                   ;; 06:43E9 $CD $0C $3B
    ld   a, LINK_ANIMATION_STATE_HIDDEN           ;; 06:43EC $3E $FF
    ldh  [hLinkAnimationState], a                 ;; 06:43EE $E0 $9D
    ld   a, $02                                   ;; 06:43F0 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 06:43F2 $E0 $A1
    ret                                           ;; 06:43F4 $C9

jr_006_43F5:
    ld   [hl], $0C                                ;; 06:43F5 $36 $0C
    ld   hl, wEntitiesPrivateState1Table          ;; 06:43F7 $21 $B0 $C2
    add  hl, bc                                   ;; 06:43FA $09
    ld   [hl], b                                  ;; 06:43FB $70
    xor  a                                        ;; 06:43FC $AF
    ldh  [hLinkSpeedY], a                         ;; 06:43FD $E0 $9B
    ld   hl, wEntitiesDirectionTable              ;; 06:43FF $21 $80 $C3
    add  hl, bc                                   ;; 06:4402 $09
    ld   a, [hl]                                  ;; 06:4403 $7E
    and  $01                                      ;; 06:4404 $E6 $01
    ld   a, $18                                   ;; 06:4406 $3E $18
    jr   z, .jr_440C                              ;; 06:4408 $28 $02

    ld   a, $E8                                   ;; 06:440A $3E $E8

.jr_440C
    ldh  [hLinkSpeedX], a                         ;; 06:440C $E0 $9A
    ld   a, $10                                   ;; 06:440E $3E $10
    ldh  [hLinkVelocityZ], a                      ;; 06:4410 $E0 $A3
    ld   a, $20                                   ;; 06:4412 $3E $20
    ld   [wInvincibilityCounter], a               ;; 06:4414 $EA $C7 $DB
    ld   a, $02                                   ;; 06:4417 $3E $02
    ld   [wIsLinkInTheAir], a                     ;; 06:4419 $EA $46 $C1
    ld   a, $02                                   ;; 06:441C $3E $02
    ld   [wSubtractHealthBuffer], a               ;; 06:441E $EA $94 $DB
    ld   a, JINGLE_FALL_DOWN                      ;; 06:4421 $3E $08
    ldh  [hJingle], a                             ;; 06:4423 $E0 $F2
    jp   IncrementEntityState                     ;; 06:4425 $C3 $12 $3B

AntiKirbyState4Handler::
    call GetEntityTransitionCountdown             ;; 06:4428 $CD $05 $0C
    jp   z, label_006_431B                        ;; 06:442B $CA $1B $43

    ld   hl, wEntitiesSpeedZTable                 ;; 06:442E $21 $20 $C3
    add  hl, bc                                   ;; 06:4431 $09
    ld   [hl], b                                  ;; 06:4432 $70
    jp   label_006_43B8                           ;; 06:4433 $C3 $B8 $43

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
AntiKirbySpriteVariants::
.variant0
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0
.variant4
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0
.variant7
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0

Data_006_4456::
    db   $00, $FC, $62, $21, $00, $04, $6A, $21, $00, $0C, $64, $21, $00, $FC, $64, $01
    db   $00, $04, $6A, $01, $00, $0C, $62, $01, $00, $FC, $62, $21, $00, $04, $6A, $21
    db   $00, $0C, $64, $21, $00, $FC, $64, $01, $00, $04, $6A, $01, $00, $0C, $62, $01

Data_006_4486::
    db   $00, $0E, $24, $01, $F8, $18, $24, $01, $08, $18, $24, $01, $FE, $13, $24, $01
    db   $03, $13, $24, $01, $03, $13, $FF, $01, $00, $FA, $24, $01, $F8, $F0, $24, $01
    db   $08, $F0, $24, $01, $FE, $F5, $24, $01, $03, $F5, $24, $01, $03, $F5, $FF, $01

func_006_44B6::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 06:44B6
    cp   $08                                      ;; 06:44B8 $FE $08
    jr   nc, .jr_44F1                             ;; 06:44BA $30 $35

    ld   de, AntiKirbySpriteVariants              ;; 06:44BC $11 $36 $44
    call RenderActiveEntitySpritesPair            ;; 06:44BF $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ;; 06:44C2 $F0 $F0
    cp   $02                                      ;; 06:44C4 $FE $02
    ret  nz                                       ;; 06:44C6 $C0

    ld   hl, wEntitiesDirectionTable              ;; 06:44C7 $21 $80 $C3
    add  hl, bc                                   ;; 06:44CA $09
    ld   a, [hl]                                  ;; 06:44CB $7E
    rla                                           ;; 06:44CC $17
    and  $02                                      ;; 06:44CD $E6 $02
    ld   e, a                                     ;; 06:44CF $5F
    ldh  a, [hFrameCounter]                       ;; 06:44D0 $F0 $E7
    rra                                           ;; 06:44D2 $1F
    rra                                           ;; 06:44D3 $1F
    rra                                           ;; 06:44D4 $1F
    and  $01                                      ;; 06:44D5 $E6 $01
    or   e                                        ;; 06:44D7 $B3
    rla                                           ;; 06:44D8 $17
    rla                                           ;; 06:44D9 $17
    and  $FC                                      ;; 06:44DA $E6 $FC
    ld   e, a                                     ;; 06:44DC $5F
    rla                                           ;; 06:44DD $17
    and  $F8                                      ;; 06:44DE $E6 $F8
    add  e                                        ;; 06:44E0 $83
    ld   e, a                                     ;; 06:44E1 $5F
    ld   d, b                                     ;; 06:44E2 $50
    ld   hl, Data_006_4486                        ;; 06:44E3 $21 $86 $44
    add  hl, de                                   ;; 06:44E6 $19
    ld   c, $03                                   ;; 06:44E7 $0E $03
    call RenderActiveEntitySpritesRect            ;; 06:44E9 $CD $E6 $3C
    ld   a, $03                                   ;; 06:44EC $3E $03
    jp   func_015_7964_trampoline                 ;; 06:44EE $C3 $A0 $3D

.jr_44F1
    sub  $08                                      ;; 06:44F1 $D6 $08
    rla                                           ;; 06:44F3 $17
    rla                                           ;; 06:44F4 $17
    and  $FC                                      ;; 06:44F5 $E6 $FC
    ld   e, a                                     ;; 06:44F7 $5F
    sla  a                                        ;; 06:44F8 $CB $27
    add  e                                        ;; 06:44FA $83
    ld   e, a                                     ;; 06:44FB $5F
    ld   d, b                                     ;; 06:44FC $50
    ld   hl, Data_006_4456                        ;; 06:44FD $21 $56 $44
    add  hl, de                                   ;; 06:4500 $19
    ld   c, $03                                   ;; 06:4501 $0E $03
    call RenderActiveEntitySpritesRect            ;; 06:4503 $CD $E6 $3C
    jp   label_3CD9                               ;; 06:4506 $C3 $D9 $3C

