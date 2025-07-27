BouldersEntityHandler::
    ldh  a, [hActiveEntityState]                  ;; 15:4365 $F0 $F0
    and  a                                        ;; 15:4367 $A7
    jp   nz, label_015_43CA                       ;; 15:4368 $C2 $CA $43

    call ReturnIfNonInteractive_15                ;; 15:436B $CD $0D $7B
    call GetEntityTransitionCountdown             ;; 15:436E $CD $05 $0C
    jr   nz, .ret_43AD                            ;; 15:4371 $20 $3A

    call GetRandomByte                            ;; 15:4373 $CD $0D $28
    and  $3F                                      ;; 15:4376 $E6 $3F
    add  $30                                      ;; 15:4378 $C6 $30
    ld   [hl], a                                  ;; 15:437A $77
    ldh  a, [hLinkPositionY]                      ;; 15:437B $F0 $99
    cp   $18                                      ;; 15:437D $FE $18
    ret  c                                        ;; 15:437F $D8

    ld   a, ENTITY_BOULDERS                       ;; 15:4380 $3E $45
    call SpawnNewEntity_trampoline                ;; 15:4382 $CD $86 $3B
    ret  c                                        ;; 15:4385 $D8

    call GetRandomByte                            ;; 15:4386 $CD $0D $28
    rla                                           ;; 15:4389 $17
    rla                                           ;; 15:438A $17
    rla                                           ;; 15:438B $17
    rla                                           ;; 15:438C $17
    and  $70                                      ;; 15:438D $E6 $70
    add  $18                                      ;; 15:438F $C6 $18
    ld   hl, wEntitiesPosXTable                   ;; 15:4391 $21 $00 $C2
    add  hl, de                                   ;; 15:4394 $19
    ld   [hl], a                                  ;; 15:4395 $77
    ld   hl, wEntitiesPosYTable                   ;; 15:4396 $21 $10 $C2
    add  hl, de                                   ;; 15:4399 $19
    ld   [hl], $10                                ;; 15:439A $36 $10
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 15:439C $21 $40 $C3
    add  hl, de                                   ;; 15:439F $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 15:43A0 $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ;; 15:43A2 $21 $50 $C3
    add  hl, de                                   ;; 15:43A5 $19
    set  7, [hl]                                  ;; 15:43A6 $CB $FE
    ld   hl, wEntitiesStateTable                  ;; 15:43A8 $21 $90 $C2
    add  hl, de                                   ;; 15:43AB $19
    inc  [hl]                                     ;; 15:43AC $34

.ret_43AD
    ret                                           ;; 15:43AD $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown043SpriteVariants:: ;; 15:43AE
.variant0
    db $5C, $00
    db $5E, $00
.variant1
    db $5E, $20
    db $5C, $20
.variant2
    db $5E, $60
    db $5C, $60
.variant3
    db $5C, $40
    db $5E, $40

Data_015_43BE::
    db   $0C, $F4, $05, $FB

Data_015_43C2::
    db   $08, $0A, $06, $0C

Data_015_43C6::
    db   $18, $20, $1C, $28

label_015_43CA:
    ld   de, Unknown043SpriteVariants             ;; 15:43CA $11 $AE $43
    call RenderActiveEntitySpritesPair            ;; 15:43CD $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:43D0 $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ;; 15:43D3 $CD $56 $0C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 15:43D6 $CD $39 $3B
    ldh  a, [hFrameCounter]                       ;; 15:43D9 $F0 $E7
    rra                                           ;; 15:43DB $1F

.jr_43DC
    rra                                           ;; 15:43DC $1F
    rra                                           ;; 15:43DD $1F
    and  $03                                      ;; 15:43DE $E6 $03
    call SetEntitySpriteVariant                   ;; 15:43E0 $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ;; 15:43E3 $CD $88 $7B
    call AddEntityZSpeedToPos_15                  ;; 15:43E6 $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ;; 15:43E9 $21 $20 $C3
    add  hl, bc                                   ;; 15:43EC $09
    dec  [hl]                                     ;; 15:43ED $35
    dec  [hl]                                     ;; 15:43EE $35
    ld   hl, wEntitiesPosZTable                   ;; 15:43EF $21 $10 $C3
    add  hl, bc                                   ;; 15:43F2 $09
    ld   a, [hl]                                  ;; 15:43F3 $7E
    and  $80                                      ;; 15:43F4 $E6 $80
    jr   z, jr_015_4430                           ;; 15:43F6 $28 $38

    ld   [hl], b                                  ;; 15:43F8 $70
    call GetRandomByte                            ;; 15:43F9 $CD $0D $28
    and  $03                                      ;; 15:43FC $E6 $03
    ld   e, a                                     ;; 15:43FE $5F
    ld   d, b                                     ;; 15:43FF $50
    ld   hl, Data_015_43BE                        ;; 15:4400 $21 $BE $43
    add  hl, de                                   ;; 15:4403 $19
    ld   a, [hl]                                  ;; 15:4404 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4405 $21 $40 $C2
    add  hl, bc                                   ;; 15:4408 $09
    ld   [hl], a                                  ;; 15:4409 $77
    call GetRandomByte                            ;; 15:440A $CD $0D $28
    and  $03                                      ;; 15:440D $E6 $03
    ld   e, a                                     ;; 15:440F $5F
    ld   d, b                                     ;; 15:4410 $50

.jr_4411
    ld   hl, Data_015_43C2                        ;; 15:4411 $21 $C2 $43
    add  hl, de                                   ;; 15:4414 $19

.jr_4415
    ld   a, [hl]                                  ;; 15:4415 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 15:4416 $21 $50 $C2
    add  hl, bc                                   ;; 15:4419 $09
    ld   [hl], a                                  ;; 15:441A $77
    call GetRandomByte                            ;; 15:441B $CD $0D $28
    and  $03                                      ;; 15:441E $E6 $03
    ld   e, a                                     ;; 15:4420 $5F
    ld   d, b                                     ;; 15:4421 $50
    ld   hl, Data_015_43C6                        ;; 15:4422 $21 $C6 $43
    add  hl, de                                   ;; 15:4425 $19
    ld   a, [hl]                                  ;; 15:4426 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 15:4427 $21 $20 $C3
    add  hl, bc                                   ;; 15:442A $09
    ld   [hl], a                                  ;; 15:442B $77
    ld   a, JINGLE_BOUNCE                         ;; 15:442C $3E $20
    ldh  [hJingle], a                             ;; 15:442E $E0 $F2

jr_015_4430:
    ldh  a, [hActiveEntityPosX]                   ;; 15:4430 $F0 $EE
    cp   $A8                                      ;; 15:4432 $FE $A8
    jp   nc, ClearEntityStatus_15                 ;; 15:4434 $D2 $31 $7C

    ldh  a, [hActiveEntityVisualPosY]             ;; 15:4437 $F0 $EC
    cp   $84                                      ;; 15:4439 $FE $84
    jp   nc, ClearEntityStatus_15                 ;; 15:443B $D2 $31 $7C

    ret                                           ;; 15:443E $C9
