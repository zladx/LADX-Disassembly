ArmosKnightEntityHandler::
    ld   hl, wEntitiesLoadOrderTable              ;; 06:52DE $21 $60 $C4
    add  hl, bc                                   ;; 06:52E1 $09
    ld   [hl], $FF                                ;; 06:52E2 $36 $FF
    ld   hl, wEntitiesDroppedItemTable            ;; 06:52E4 $21 $E0 $C4
    add  hl, bc                                   ;; 06:52E7 $09
    ld   [hl], ENTITY_KEY_DROP_POINT              ;; 06:52E8 $36 $30
    ld   hl, wEntitiesHealthTable                 ;; 06:52EA $21 $60 $C3
    add  hl, bc                                   ;; 06:52ED $09
    ld   a, [hl]                                  ;; 06:52EE $7E
    cp   $08                                      ;; 06:52EF $FE $08
    jr   nc, jr_006_52FF                          ;; 06:52F1 $30 $0C

    ld   e, $02                                   ;; 06:52F3 $1E $02
    cp   $04                                      ;; 06:52F5 $FE $04
    jr   nc, .jr_52FB                             ;; 06:52F7 $30 $02

    ld   e, $03                                   ;; 06:52F9 $1E $03

.jr_52FB
    ld   a, e                                     ;; 06:52FB $7B
    call SetEntitySpriteVariant                   ;; 06:52FC $CD $0C $3B

jr_006_52FF:
    call func_006_55B3                            ;; 06:52FF $CD $B3 $55
    ldh  a, [hActiveEntityStatus]                 ;; 06:5302 $F0 $EA
    cp   $05                                      ;; 06:5304 $FE $05
    jr   z, jr_006_5361                           ;; 06:5306 $28 $59

label_006_5308:
    ld   hl, wEntitiesPrivateState2Table          ;; 06:5308 $21 $C0 $C2
    add  hl, bc                                   ;; 06:530B $09
    ld   a, [hl]                                  ;; 06:530C $7E
    JP_TABLE                                      ;; 06:530D
._00 dw ArmosKnightPrivateState0Handler                             ;; 06:530E
._01 dw ArmosKnightPrivateState1Handler                             ;; 06:5310
._02 dw ArmosKnightPrivateState2Handler                             ;; 06:5312
._03 dw ArmosKnightPrivateState3Handler                             ;; 06:5314

ArmosKnightPrivateState0Handler::
    call GetEntityTransitionCountdown             ;; 06:5316 $CD $05 $0C
    ld   [hl], $A0                                ;; 06:5319 $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ;; 06:531B $21 $20 $C4
    add  hl, bc                                   ;; 06:531E $09
    ld   [hl], $FF                                ;; 06:531F $36 $FF
    jp   IncrementEntityPrivateState2             ;; 06:5321 $C3 $34 $56

ArmosKnightPrivateState1Handler::
    call GetEntityTransitionCountdown             ;; 06:5324 $CD $05 $0C
    ret  nz                                       ;; 06:5327 $C0

    ld   [hl], $C0                                ;; 06:5328 $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ;; 06:532A $21 $20 $C4
    add  hl, bc                                   ;; 06:532D $09
    ld   [hl], $FF                                ;; 06:532E $36 $FF
    jp   IncrementEntityPrivateState2             ;; 06:5330 $C3 $34 $56

ArmosKnightPrivateState2Handler::
    call GetEntityTransitionCountdown             ;; 06:5333 $CD $05 $0C
    jr   nz, jr_006_535D                          ;; 06:5336 $20 $25

    ld   a, NOISE_SFX_BOSS_EXPLOSION              ;; 06:5338 $3E $1A
    ldh  [hNoiseSfx], a                           ;; 06:533A $E0 $F4
    call label_27DD                               ;; 06:533C $CD $DD $27
    call DidKillEnemy                             ;; 06:533F $CD $50 $3F
    ldh  a, [hActiveEntityType]                   ;; 06:5342 $F0 $EB
    cp   ENTITY_ARMOS_KNIGHT                      ;; 06:5344 $FE $88
    ret  z                                        ;; 06:5346 $C8

    ldh  a, [hActiveEntityType]                   ;; 06:5347 $F0 $EB
    cp   ENTITY_HINOX                             ;; 06:5349 $FE $89
    jr   z, .jr_5355                              ;; 06:534B $28 $08

    cp   ENTITY_CUE_BALL                          ;; 06:534D $FE $8E
    jr   z, .jr_5355                              ;; 06:534F $28 $04

    cp   ENTITY_SMASHER                           ;; 06:5351 $FE $92
    jr   nz, jr_006_535A                          ;; 06:5353 $20 $05

.jr_5355
    ldh  a, [hMapId]                              ;; 06:5355 $F0 $F7
    cp   MAP_EAGLES_TOWER                         ;; 06:5357 $FE $06
    ret  nc                                       ;; 06:5359 $D0

jr_006_535A:
    jp   label_006_6CC9                           ;; 06:535A $C3 $C9 $6C

jr_006_535D:
    jp   func_006_700A                            ;; 06:535D $C3 $0A $70

ArmosKnightPrivateState3Handler::
    ret                                           ;; 06:5360 $C9

jr_006_5361:
    call ReturnIfNonInteractive_06                ;; 06:5361 $CD $C6 $64
    call BossIntro                                ;; 06:5364 $CD $E8 $3E
    call label_3B70                               ;; 06:5367 $CD $70 $3B
    call PushLinkOutOfEntity_06                   ;; 06:536A $CD $1A $64
    call AddEntityZSpeedToPos_06                  ;; 06:536D $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:5370 $21 $20 $C3
    add  hl, bc                                   ;; 06:5373 $09
    dec  [hl]                                     ;; 06:5374 $35
    dec  [hl]                                     ;; 06:5375 $35
    ld   hl, wEntitiesPosZTable                   ;; 06:5376 $21 $10 $C3
    add  hl, bc                                   ;; 06:5379 $09
    ld   a, [hl]                                  ;; 06:537A $7E
    and  $80                                      ;; 06:537B $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 06:537D $E0 $E8
    jr   z, .jr_5387                              ;; 06:537F $28 $06

    ld   [hl], b                                  ;; 06:5381 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 06:5382 $21 $20 $C3
    add  hl, bc                                   ;; 06:5385 $09
    ld   [hl], b                                  ;; 06:5386 $70

.jr_5387
    call GetEntityPrivateCountdown1               ;; 06:5387 $CD $00 $0C
    jr   z, .jr_5394                              ;; 06:538A $28 $08

    ld   a, $02                                   ;; 06:538C $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 06:538E $E0 $A1
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ;; 06:5390 $3E $6A
    ldh  [hLinkAnimationState], a                 ;; 06:5392 $E0 $9D

.jr_5394
    ld   hl, wEntitiesHealthTable                 ;; 06:5394 $21 $60 $C3
    add  hl, bc                                   ;; 06:5397 $09
    ld   a, [hl]                                  ;; 06:5398 $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 06:5399 $21 $B0 $C2
    add  hl, bc                                   ;; 06:539C $09
    cp   [hl]                                     ;; 06:539D $BE
    ld   [hl], a                                  ;; 06:539E $77
    jp   z, label_006_5411                        ;; 06:539F $CA $11 $54

    cp   $08                                      ;; 06:53A2 $FE $08
    jr   nc, label_006_5411                       ;; 06:53A4 $30 $6B

    cp   $04                                      ;; 06:53A6 $FE $04
    jr   nc, .jr_53D3                             ;; 06:53A8 $30 $29

    ld   hl, wEntitiesInertiaTable                ;; 06:53AA $21 $D0 $C3
    add  hl, bc                                   ;; 06:53AD $09
    ld   a, [hl]                                  ;; 06:53AE $7E
    cp   $02                                      ;; 06:53AF $FE $02
    jr   nc, label_006_5411                       ;; 06:53B1 $30 $5E

    inc  [hl]                                     ;; 06:53B3 $34
    ld   a, ENTITY_LIFTABLE_ROCK                  ;; 06:53B4 $3E $05
    call SpawnNewEntity_trampoline                ;; 06:53B6 $CD $86 $3B
    jr   c, label_006_5411                        ;; 06:53B9 $38 $56

    ldh  a, [hMultiPurpose0]                      ;; 06:53BB $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 06:53BD $21 $00 $C2
    add  hl, de                                   ;; 06:53C0 $19
    dec  a                                        ;; 06:53C1 $3D
    ld   [hl], a                                  ;; 06:53C2 $77
    ldh  [hMultiPurpose0], a                      ;; 06:53C3 $E0 $D7
    ldh  a, [hMultiPurpose1]                      ;; 06:53C5 $F0 $D8
    ld   hl, hMultiPurpose3                       ;; 06:53C7 $21 $DA $FF
    sub  [hl]                                     ;; 06:53CA $96
    ld   hl, wEntitiesPosYTable                   ;; 06:53CB $21 $10 $C2
    add  hl, de                                   ;; 06:53CE $19
    sub  $10                                      ;; 06:53CF $D6 $10
    jr   jr_006_53F9                              ;; 06:53D1 $18 $26

.jr_53D3
    ld   hl, wEntitiesInertiaTable                ;; 06:53D3 $21 $D0 $C3
    add  hl, bc                                   ;; 06:53D6 $09
    ld   a, [hl]                                  ;; 06:53D7 $7E
    cp   $01                                      ;; 06:53D8 $FE $01
    jr   nc, label_006_5411                       ;; 06:53DA $30 $35

    inc  [hl]                                     ;; 06:53DC $34
    ld   a, ENTITY_LIFTABLE_ROCK                  ;; 06:53DD $3E $05
    call SpawnNewEntity_trampoline                ;; 06:53DF $CD $86 $3B
    jr   c, label_006_5411                        ;; 06:53E2 $38 $2D

    ldh  a, [hMultiPurpose0]                      ;; 06:53E4 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 06:53E6 $21 $00 $C2
    add  hl, de                                   ;; 06:53E9 $19
    add  $07                                      ;; 06:53EA $C6 $07
    ld   [hl], a                                  ;; 06:53EC $77
    ldh  [hMultiPurpose0], a                      ;; 06:53ED $E0 $D7
    ldh  a, [hMultiPurpose1]                      ;; 06:53EF $F0 $D8
    ld   hl, hMultiPurpose3                       ;; 06:53F1 $21 $DA $FF
    sub  [hl]                                     ;; 06:53F4 $96
    ld   hl, wEntitiesPosYTable                   ;; 06:53F5 $21 $10 $C2
    add  hl, de                                   ;; 06:53F8 $19

jr_006_53F9:
    ld   [hl], a                                  ;; 06:53F9 $77
    ldh  [hMultiPurpose1], a                      ;; 06:53FA $E0 $D8
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 06:53FC $21 $F0 $C2
    add  hl, de                                   ;; 06:53FF $19
    ld   [hl], $0F                                ;; 06:5400 $36 $0F
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:5402 $21 $40 $C3
    add  hl, de                                   ;; 06:5405 $19
    ld   [hl], 4 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 06:5406 $36 $C4
    ld   a, TRANSCIENT_VFX_POOF                   ;; 06:5408 $3E $02
    call AddTranscientVfx                         ;; 06:540A $CD $C7 $0C
    ld   a, NOISE_SFX_BREAK                       ;; 06:540D $3E $29
    ldh  [hNoiseSfx], a                           ;; 06:540F $E0 $F4

label_006_5411:
    ldh  a, [hActiveEntityState]                  ;; 06:5411 $F0 $F0
    JP_TABLE                                      ;; 06:5413
._00 dw ArmosKnightState0Handler
._01 dw ArmosKnightState1Handler
._02 dw ArmosKnightState2Handler
._03 dw ArmosKnightState3Handler
._04 dw ArmosKnightState4Handler
._05 dw ArmosKnightState5Handler
._06 dw ArmosKnightState6Handler
._07 dw ArmosKnightState7Handler

ArmosKnightState0Handler::
    call DecrementEntityIgnoreHitsCountdown       ;; 06:5424 $CD $56 $0C
    call GetEntityXDistanceToLink_06              ;; 06:5427 $CD $94 $65
    add  $20                                      ;; 06:542A $C6 $20
    cp   $40                                      ;; 06:542C $FE $40
    jr   nc, .ret_5441                            ;; 06:542E $30 $11

    call GetEntityYDistanceToLink_06              ;; 06:5430 $CD $A4 $65
    add  $20                                      ;; 06:5433 $C6 $20
    cp   $40                                      ;; 06:5435 $FE $40
    jr   nc, .ret_5441                            ;; 06:5437 $30 $08

    call IncrementEntityState                     ;; 06:5439 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 06:543C $CD $05 $0C
    ld   [hl], $30                                ;; 06:543F $36 $30

.ret_5441
    ret                                           ;; 06:5441 $C9

ArmosKnightState1Handler::
    call DecrementEntityIgnoreHitsCountdown       ;; 06:5442 $CD $56 $0C
    call GetEntityTransitionCountdown             ;; 06:5445 $CD $05 $0C
    jr   nz, .jr_544F                             ;; 06:5448 $20 $05

    ld   [hl], $80                                ;; 06:544A $36 $80
    call IncrementEntityState                     ;; 06:544C $CD $12 $3B

.jr_544F
    rra                                           ;; 06:544F $1F
    rra                                           ;; 06:5450 $1F
    and  $01                                      ;; 06:5451 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 06:5453 $C3 $0C $3B

ArmosKnightState2Handler::
    call DecrementEntityIgnoreHitsCountdown       ;; 06:5456 $CD $56 $0C
    call GetEntityTransitionCountdown             ;; 06:5459 $CD $05 $0C
    jr   nz, .jr_5476                             ;; 06:545C $20 $18

    ld   [hl], $50                                ;; 06:545E $36 $50
    call IncrementEntityState                     ;; 06:5460 $CD $12 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:5463 $21 $40 $C3
    add  hl, bc                                   ;; 06:5466 $09
    res  ENTITY_PHYSICS_B_HARMLESS, [hl]          ;; 06:5467 $CB $BE
    ld   hl, wEntitiesHitboxFlagsTable            ;; 06:5469 $21 $50 $C3
    add  hl, bc                                   ;; 06:546C $09
    res  7, [hl]                                  ;; 06:546D $CB $BE
    ld   hl, wEntitiesOptions1Table               ;; 06:546F $21 $30 $C4
    add  hl, bc                                   ;; 06:5472 $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ;; 06:5473 $CB $B6
    ret                                           ;; 06:5475 $C9

.jr_5476
    ld   e, $08                                   ;; 06:5476 $1E $08
    and  $04                                      ;; 06:5478 $E6 $04
    jr   z, .jr_547E                              ;; 06:547A $28 $02

    ld   e, $F8                                   ;; 06:547C $1E $F8

.jr_547E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:547E $21 $40 $C2
    add  hl, bc                                   ;; 06:5481 $09
    ld   [hl], e                                  ;; 06:5482 $73
    jp   AddEntitySpeedToPos_06                   ;; 06:5483 $C3 $4E $65

ArmosKnightState3Handler::
    call ApplyRecoilIfNeeded_06                   ;; 06:5486 $CD $F7 $64
    call GetEntityTransitionCountdown             ;; 06:5489 $CD $05 $0C
    jr   nz, .jr_549C                             ;; 06:548C $20 $0E

    ld   hl, wEntitiesSpeedZTable                 ;; 06:548E $21 $20 $C3
    add  hl, bc                                   ;; 06:5491 $09
    ld   [hl], $30                                ;; 06:5492 $36 $30
    call IncrementEntityState                     ;; 06:5494 $CD $12 $3B
    ld   a, JINGLE_JUMP                           ;; 06:5497 $3E $24
    ldh  [hJingle], a                             ;; 06:5499 $E0 $F2
    ret                                           ;; 06:549B $C9

.jr_549C
    ldh  a, [hMultiPurposeG]                      ;; 06:549C $F0 $E8
    and  a                                        ;; 06:549E $A7
    jr   z, jr_006_54BB                           ;; 06:549F $28 $1A

    ld   hl, wEntitiesSpeedZTable                 ;; 06:54A1 $21 $20 $C3
    add  hl, bc                                   ;; 06:54A4 $09
    ld   [hl], $0C                                ;; 06:54A5 $36 $0C
    ld   hl, wEntitiesHealthTable                 ;; 06:54A7 $21 $60 $C3
    add  hl, bc                                   ;; 06:54AA $09
    ld   a, [hl]                                  ;; 06:54AB $7E
    cp   $05                                      ;; 06:54AC $FE $05
    ld   a, $08                                   ;; 06:54AE $3E $08
    jr   nc, .jr_54B4                             ;; 06:54B0 $30 $02

    ld   a, $0C                                   ;; 06:54B2 $3E $0C

.jr_54B4
    call ApplyVectorTowardsLink_trampoline        ;; 06:54B4 $CD $AA $3B
    ld   a, JINGLE_BOUNCE                         ;; 06:54B7 $3E $20
    ldh  [hJingle], a                             ;; 06:54B9 $E0 $F2

jr_006_54BB:
    jp   UpdateEntityPosWithSpeed_06              ;; 06:54BB $C3 $41 $65

ArmosKnightState4Handler::
    call ApplyRecoilIfNeeded_06                   ;; 06:54BE $CD $F7 $64
    ld   hl, wEntitiesSpeedZTable                 ;; 06:54C1 $21 $20 $C3
    add  hl, bc                                   ;; 06:54C4 $09
    ld   a, [hl]                                  ;; 06:54C5 $7E
    and  $FE                                      ;; 06:54C6 $E6 $FE
    jr   nz, .jr_54D5                             ;; 06:54C8 $20 $0B

    call GetEntityTransitionCountdown             ;; 06:54CA $CD $05 $0C
    ld   [hl], $10                                ;; 06:54CD $36 $10
    call ClearEntitySpeed                         ;; 06:54CF $CD $7F $3D
    call IncrementEntityState                     ;; 06:54D2 $CD $12 $3B

.jr_54D5
    jp   UpdateEntityPosWithSpeed_06              ;; 06:54D5 $C3 $41 $65

ArmosKnightState5Handler::
    call ApplyRecoilIfNeeded_06                   ;; 06:54D8 $CD $F7 $64
    call GetEntityTransitionCountdown             ;; 06:54DB $CD $05 $0C
    ld   a, $00                                   ;; 06:54DE $3E $00
    jr   nz, .jr_54E7                             ;; 06:54E0 $20 $05

    call IncrementEntityState                     ;; 06:54E2 $CD $12 $3B
    ld   a, $B0                                   ;; 06:54E5 $3E $B0

.jr_54E7
    ld   hl, wEntitiesSpeedZTable                 ;; 06:54E7 $21 $20 $C3
    add  hl, bc                                   ;; 06:54EA $09
    ld   [hl], a                                  ;; 06:54EB $77
    ret                                           ;; 06:54EC $C9

ArmosKnightState6Handler::
    call ApplyRecoilIfNeeded_06                   ;; 06:54ED $CD $F7 $64
    ldh  a, [hMultiPurposeG]                      ;; 06:54F0 $F0 $E8
    and  a                                        ;; 06:54F2 $A7
    ret  z                                        ;; 06:54F3 $C8

    ld   a, $30                                   ;; 06:54F4 $3E $30
    ld   [wScreenShakeCountdown], a               ;; 06:54F6 $EA $57 $C1
    ld   a, $04                                   ;; 06:54F9 $3E $04
    ld   [wC158], a                               ;; 06:54FB $EA $58 $C1
    ld   a, JINGLE_STRONG_BUMP                    ;; 06:54FE $3E $0B
    ldh  [hJingle], a                             ;; 06:5500 $E0 $F2
    call GetEntityTransitionCountdown             ;; 06:5502 $CD $05 $0C
    ld   [hl], $30                                ;; 06:5505 $36 $30
    ld   a, [wIsLinkInTheAir]                     ;; 06:5507 $FA $46 $C1
    and  a                                        ;; 06:550A $A7
    jr   nz, .jr_5512                             ;; 06:550B $20 $05

    call GetEntityPrivateCountdown1               ;; 06:550D $CD $00 $0C
    ld   [hl], $40                                ;; 06:5510 $36 $40

.jr_5512
    jp   IncrementEntityState                     ;; 06:5512 $C3 $12 $3B

ArmosKnightState7Handler::
    call ApplyRecoilIfNeeded_06                   ;; 06:5515 $CD $F7 $64
    call GetEntityTransitionCountdown             ;; 06:5518 $CD $05 $0C
    jr   nz, .ret_5522                            ;; 06:551B $20 $05

    call IncrementEntityState                     ;; 06:551D $CD $12 $3B
    ld   [hl], $02                                ;; 06:5520 $36 $02

.ret_5522
    ret                                           ;; 06:5522 $C9

Data_006_5523::
    db   $F4, $F8, $70, $03, $F4, $00, $72, $03, $F4, $08, $72, $23, $F4, $10, $70, $23
    db   $04, $F8, $74, $03, $04, $00, $76, $03, $04, $08, $7A, $03, $04, $10, $7A, $23
    db   $F4, $F8, $70, $02, $F4, $00, $78, $02, $F4, $08, $78, $22, $F4, $10, $70, $22
    db   $04, $F8, $74, $02, $04, $00, $76, $02, $04, $08, $7A, $02, $04, $10, $7A, $22
    db   $F4, $F8, $70, $02, $F4, $00, $72, $02, $F4, $08, $72, $22, $F4, $10, $70, $22
    db   $04, $F8, $74, $02, $04, $00, $76, $02, $04, $08, $76, $22, $04, $10, $74, $22
    db   $F4, $F8, $7C, $02, $F4, $00, $7E, $02, $F4, $08, $7E, $22, $F4, $10, $7C, $22
    db   $04, $F8, $74, $02, $04, $00, $76, $02, $04, $08, $76, $22, $04, $10, $74, $22

Data_006_55A3::
    db   $0C, $FB, $26, $00, $0C, $01, $26, $00, $0C, $07, $26, $00, $0C, $0D, $26, $00

func_006_55B3::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 06:55B3 $F0 $F1
    rla                                           ;; 06:55B5 $17
    rla                                           ;; 06:55B6 $17
    rla                                           ;; 06:55B7 $17
    rla                                           ;; 06:55B8 $17
    rla                                           ;; 06:55B9 $17
    and  $E0                                      ;; 06:55BA $E6 $E0
    ld   e, a                                     ;; 06:55BC $5F
    ld   d, b                                     ;; 06:55BD $50
    ld   hl, Data_006_5523                        ;; 06:55BE $21 $23 $55
    add  hl, de                                   ;; 06:55C1 $19
    ld   c, $08                                   ;; 06:55C2 $0E $08
    call RenderActiveEntitySpritesRect            ;; 06:55C4 $CD $E6 $3C
    ld   a, $04                                   ;; 06:55C7 $3E $04
    call func_015_7964_trampoline                 ;; 06:55C9 $CD $A0 $3D
    ld   hl, wEntitiesPosZTable                   ;; 06:55CC $21 $10 $C3
    add  hl, bc                                   ;; 06:55CF $09
    ld   a, [hl]                                  ;; 06:55D0 $7E
    and  a                                        ;; 06:55D1 $A7
    jr   z, .jr_55E0                              ;; 06:55D2 $28 $0C

    ldh  a, [hActiveEntityPosY]                   ;; 06:55D4 $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ;; 06:55D6 $E0 $EC
    ld   hl, Data_006_55A3                        ;; 06:55D8 $21 $A3 $55
    ld   c, $04                                   ;; 06:55DB $0E $04
    call RenderActiveEntitySpritesRect            ;; 06:55DD $CD $E6 $3C

.jr_55E0
    jp   CopyEntityPositionToActivePosition       ;; 06:55E0 $C3 $8A $3D
