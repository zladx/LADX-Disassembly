; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
FishSpriteVariants::
.variant0
    db $FF, $00
    db $FF, $00
.variant1
    db $54, $00
    db $56, $00
.variant2
    db $58, $00
    db $5A, $00
.variant3
    db $56, $20
    db $54, $20
.variant4
    db $5A, $20
    db $58, $20

Data_015_44B3::
    db   $5C, $00, $5C, $20, $5E, $00, $5E, $00

FishEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 15:44BB $F0 $F1
    cp   $FF                                      ;; 15:44BD $FE $FF
    jr   z, jr_015_44D7                           ;; 15:44BF $28 $16

    cp   $05                                      ;; 15:44C1 $FE $05
    jr   c, .jr_44D1                              ;; 15:44C3 $38 $0C

    sub  $05                                      ;; 15:44C5 $D6 $05
    ldh  [hActiveEntitySpriteVariant], a          ;; 15:44C7 $E0 $F1
    ld   de, Data_015_44B3                        ;; 15:44C9 $11 $B3 $44
    call RenderActiveEntitySprite                 ;; 15:44CC $CD $77 $3C
    jr   jr_015_44D7                              ;; 15:44CF $18 $06

.jr_44D1
    ld   de, FishSpriteVariants                   ;; 15:44D1 $11 $9F $44
    call RenderActiveEntitySpritesPair            ;; 15:44D4 $CD $C0 $3B

jr_015_44D7:
    call ReturnIfNonInteractive_15                ;; 15:44D7 $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ;; 15:44DA $CD $3E $7B
    call UpdateEntityPosWithSpeed_15              ;; 15:44DD $CD $88 $7B
    call ApplyEntityInteractionWithBackground_trampoline ;; 15:44E0 $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ;; 15:44E3 $F0 $F0
    JP_TABLE                                      ;; 15:44E5
._00 dw func_015_44EC                             ;; 15:44E6
._01 dw func_015_4500                             ;; 15:44E8
._02 dw func_015_4553                             ;; 15:44EA

func_015_44EC::
    ld   hl, wEntitiesSpeedXTable                 ;; 15:44EC $21 $40 $C2
    add  hl, bc                                   ;; 15:44EF $09
    ld   [hl], $08                                ;; 15:44F0 $36 $08
    call GetEntityTransitionCountdown             ;; 15:44F2 $CD $05 $0C
    call GetRandomByte                            ;; 15:44F5 $CD $0D $28
    and  $7F                                      ;; 15:44F8 $E6 $7F
    add  $40                                      ;; 15:44FA $C6 $40
    ld   [hl], a                                  ;; 15:44FC $77
    jp   IncrementEntityState                     ;; 15:44FD $C3 $12 $3B

func_015_4500::
    call label_3B44                               ;; 15:4500 $CD $44 $3B
    call GetEntityTransitionCountdown             ;; 15:4503 $CD $05 $0C
    jr   nz, jr_015_4530                          ;; 15:4506 $20 $28

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 15:4508 $21 $40 $C3
    add  hl, bc                                   ;; 15:450B $09
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 15:450C $36 $12
    ld   hl, wEntitiesSpeedZTable                 ;; 15:450E $21 $20 $C3
    add  hl, bc                                   ;; 15:4511 $09
    ld   [hl], $18                                ;; 15:4512 $36 $18
    call IncrementEntityState                     ;; 15:4514 $CD $12 $3B
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4517 $21 $40 $C2
    add  hl, bc                                   ;; 15:451A $09
    sla  [hl]                                     ;; 15:451B $CB $26

func_015_451D::
    ld   a, JINGLE_WATER_SPLASH                   ;; 15:451D $3E $0E
    ldh  [hJingle], a                             ;; 15:451F $E0 $F2
    ldh  a, [hActiveEntityPosX]                   ;; 15:4521 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 15:4523 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 15:4525 $F0 $EC
    add  $00                                      ;; 15:4527 $C6 $00
    ldh  [hMultiPurpose1], a                      ;; 15:4529 $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ;; 15:452B $3E $01
    jp   AddTranscientVfx                         ;; 15:452D $C3 $C7 $0C

jr_015_4530:
    ld   hl, wEntitiesCollisionsTable             ;; 15:4530 $21 $A0 $C2
    add  hl, bc                                   ;; 15:4533 $09
    ld   a, [hl]                                  ;; 15:4534 $7E
    and  $03                                      ;; 15:4535 $E6 $03
    jr   z, .jr_4541                              ;; 15:4537 $28 $08

    ld   hl, wEntitiesSpeedXTable                 ;; 15:4539 $21 $40 $C2
    add  hl, bc                                   ;; 15:453C $09
    ld   a, [hl]                                  ;; 15:453D $7E
    cpl                                           ;; 15:453E $2F
    inc  a                                        ;; 15:453F $3C
    ld   [hl], a                                  ;; 15:4540 $77

.jr_4541
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4541 $21 $40 $C2
    add  hl, bc                                   ;; 15:4544 $09
    ld   e, $06                                   ;; 15:4545 $1E $06
    ld   a, [hl]                                  ;; 15:4547 $7E
    and  $80                                      ;; 15:4548 $E6 $80
    jr   z, .jr_454E                              ;; 15:454A $28 $02

    ld   e, $05                                   ;; 15:454C $1E $05

.jr_454E
    ld   a, e                                     ;; 15:454E $7B
    jp   SetEntitySpriteVariant                   ;; 15:454F $C3 $0C $3B

    ret                                           ;; 15:4552 $C9

func_015_4553::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 15:4553 $CD $39 $3B
    call AddEntityZSpeedToPos_15                  ;; 15:4556 $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ;; 15:4559 $21 $20 $C3
    add  hl, bc                                   ;; 15:455C $09
    dec  [hl]                                     ;; 15:455D $35
    ld   hl, wEntitiesPosZTable                   ;; 15:455E $21 $10 $C3
    add  hl, bc                                   ;; 15:4561 $09
    ld   a, [hl]                                  ;; 15:4562 $7E
    and  $80                                      ;; 15:4563 $E6 $80
    jr   z, .jr_4588                              ;; 15:4565 $28 $21

    ld   [hl], b                                  ;; 15:4567 $70
    call func_015_451D                            ;; 15:4568 $CD $1D $45
    call GetEntityTransitionCountdown             ;; 15:456B $CD $05 $0C
    call GetRandomByte                            ;; 15:456E $CD $0D $28
    and  $7F                                      ;; 15:4571 $E6 $7F
    add  $50                                      ;; 15:4573 $C6 $50
    ld   [hl], a                                  ;; 15:4575 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4576 $21 $40 $C2
    add  hl, bc                                   ;; 15:4579 $09
    sra  [hl]                                     ;; 15:457A $CB $2E
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 15:457C $21 $40 $C3
    add  hl, bc                                   ;; 15:457F $09
    ld   [hl], 2 | ENTITY_PHYSICS_PROJECTILE_NOCLIP | ENTITY_PHYSICS_SHADOW ;; 15:4580 $36 $52
    call IncrementEntityState                     ;; 15:4582 $CD $12 $3B
    ld   [hl], $01                                ;; 15:4585 $36 $01
    ret                                           ;; 15:4587 $C9

.jr_4588
    ld   e, $01                                   ;; 15:4588 $1E $01
    ld   hl, wEntitiesSpeedXTable                 ;; 15:458A $21 $40 $C2
    add  hl, bc                                   ;; 15:458D $09
    ld   a, [hl]                                  ;; 15:458E $7E
    and  $80                                      ;; 15:458F $E6 $80
    jr   nz, .jr_4595                             ;; 15:4591 $20 $02

    ld   e, $03                                   ;; 15:4593 $1E $03

.jr_4595
    ld   hl, wEntitiesSpeedZTable                 ;; 15:4595 $21 $20 $C3
    add  hl, bc                                   ;; 15:4598 $09
    ld   a, [hl]                                  ;; 15:4599 $7E
    and  $80                                      ;; 15:459A $E6 $80
    jr   z, .jr_459F                              ;; 15:459C $28 $01

    inc  e                                        ;; 15:459E $1C

.jr_459F
    ld   a, e                                     ;; 15:459F $7B
    jp   SetEntitySpriteVariant                   ;; 15:45A0 $C3 $0C $3B
