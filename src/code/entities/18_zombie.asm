
Data_018_637D::
    db   $10, $20, $30, $40, $50, $60, $70, $80

Data_018_6385::
    db   $18, $28, $38, $48, $58, $68, $78, $88

ZombieEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 18:638D $21 $B0 $C2
    add  hl, bc                                   ;; 18:6390 $09
    ld   a, [hl]                                  ;; 18:6391 $7E
    and  a                                        ;; 18:6392 $A7
    jp   nz, label_018_640C                       ;; 18:6393 $C2 $0C $64

    call ReturnIfNonInteractive_18                ;; 18:6396 $CD $E8 $7D
    call GetEntityTransitionCountdown             ;; 18:6399 $CD $05 $0C
    jr   nz, ret_018_63F7                         ;; 18:639C $20 $59

    call GetRandomByte                            ;; 18:639E $CD $0D $28
    and  $07                                      ;; 18:63A1 $E6 $07
    ld   e, a                                     ;; 18:63A3 $5F
    ld   d, b                                     ;; 18:63A4 $50
    ld   hl, Data_018_6385                        ;; 18:63A5 $21 $85 $63
    add  hl, de                                   ;; 18:63A8 $19
    ld   a, [hl]                                  ;; 18:63A9 $7E
    ld   hl, wEntitiesPosXTable                   ;; 18:63AA $21 $00 $C2
    add  hl, bc                                   ;; 18:63AD $09
    ld   [hl], a                                  ;; 18:63AE $77

.jr_63AF
    ld   hl, Data_018_637D                        ;; 18:63AF $21 $7D $63
    add  hl, de                                   ;; 18:63B2 $19
    ld   a, [hl]                                  ;; 18:63B3 $7E
    ld   hl, wEntitiesPosYTable                   ;; 18:63B4 $21 $10 $C2
    add  hl, bc                                   ;; 18:63B7 $09
    ld   [hl], a                                  ;; 18:63B8 $77
    call func_018_6493                            ;; 18:63B9 $CD $93 $64
    ldh  a, [hMultiPurpose3]                      ;; 18:63BC $F0 $DA
    cp   $00                                      ;; 18:63BE $FE $00
    jr   z, .jr_63C9                              ;; 18:63C0 $28 $07

    cp   $06                                      ;; 18:63C2 $FE $06
    jr   z, .jr_63C9                              ;; 18:63C4 $28 $03

    cp   $09                                      ;; 18:63C6 $FE $09
    ret  nz                                       ;; 18:63C8 $C0

.jr_63C9
    call GetEntityTransitionCountdown             ;; 18:63C9 $CD $05 $0C
    call GetRandomByte                            ;; 18:63CC $CD $0D $28
    and  $3F                                      ;; 18:63CF $E6 $3F

.jr_63D1
    add  $40                                      ;; 18:63D1 $C6 $40
    ld   [hl], a                                  ;; 18:63D3 $77
    ld   a, ENTITY_ZOMBIE                         ;; 18:63D4 $3E $BF
    ld   e, $05                                   ;; 18:63D6 $1E $05
    call SpawnNewEntityInRange_trampoline         ;; 18:63D8 $CD $98 $3B
    jr   c, ret_018_63F7                          ;; 18:63DB $38 $1A

    ldh  a, [hMultiPurpose0]                      ;; 18:63DD $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 18:63DF $21 $00 $C2
    add  hl, de                                   ;; 18:63E2 $19
    ld   [hl], a                                  ;; 18:63E3 $77
    ldh  a, [hMultiPurpose1]                      ;; 18:63E4 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 18:63E6 $21 $10 $C2
    add  hl, de                                   ;; 18:63E9 $19
    ld   [hl], a                                  ;; 18:63EA $77
    ld   hl, wEntitiesPrivateState1Table          ;; 18:63EB $21 $B0 $C2
    add  hl, de                                   ;; 18:63EE $19
    ld   [hl], $01                                ;; 18:63EF $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 18:63F1 $21 $40 $C3
    add  hl, de                                   ;; 18:63F4 $19
    res  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 18:63F5 $CB $B6

ret_018_63F7:
    ret                                           ;; 18:63F7 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
ZombieSpriteVariants::
.variant0
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
.variant1
    db $6C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $6C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant3
    db $60, OAM_GBC_PAL_2 | OAMF_PAL0
    db $62, OAM_GBC_PAL_2 | OAMF_PAL0
.variant4
    db $64, OAM_GBC_PAL_2 | OAMF_PAL0
    db $66, OAM_GBC_PAL_2 | OAMF_PAL0

label_018_640C:
    ld   de, ZombieSpriteVariants                 ;; 18:640C $11 $F8 $63
    call RenderActiveEntitySpritesPair            ;; 18:640F $CD $C0 $3B
    call ReturnIfNonInteractive_18                ;; 18:6412 $CD $E8 $7D
    call ApplyRecoilIfNeeded_18                   ;; 18:6415 $CD $15 $7E
    ldh  a, [hActiveEntityState]                  ;; 18:6418 $F0 $F0
    JP_TABLE                                      ;; 18:641A
._00 dw ZombieState0Handler
._01 dw ZombieState1Handler
._02 dw ZombieState2Handler
._03 dw ZombieState3Handler

ZombieState0Handler::
    call GetEntityTransitionCountdown             ;; 18:6423 $CD $05 $0C
    ld   [hl], $30                                ;; 18:6426 $36 $30
    jp   IncrementEntityState                     ;; 18:6428 $C3 $12 $3B

ZombieState1Handler::
    call GetEntityTransitionCountdown             ;; 18:642B $CD $05 $0C
    jr   nz, .jr_6445                             ;; 18:642E $20 $15

    call GetRandomByte                            ;; 18:6430 $CD $0D $28
    and  $3F                                      ;; 18:6433 $E6 $3F
    add  $70                                      ;; 18:6435 $C6 $70
    ld   [hl], a                                  ;; 18:6437 $77
    call GetRandomByte                            ;; 18:6438 $CD $0D $28
    and  $07                                      ;; 18:643B $E6 $07
    add  $05                                      ;; 18:643D $C6 $05
    call ApplyVectorTowardsLink_trampoline        ;; 18:643F $CD $AA $3B
    call IncrementEntityState                     ;; 18:6442 $CD $12 $3B

.jr_6445
    ld   e, $01                                   ;; 18:6445 $1E $01
    cp   $18                                      ;; 18:6447 $FE $18
    jr   nc, .jr_644C                             ;; 18:6449 $30 $01

    inc  e                                        ;; 18:644B $1C

.jr_644C
    ld   a, e                                     ;; 18:644C $7B
    jp   SetEntitySpriteVariant                   ;; 18:644D $C3 $0C $3B

ZombieState2Handler::
    call UpdateEntityPosWithSpeed_18              ;; 18:6450 $CD $5F $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 18:6453 $CD $23 $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 18:6456 $CD $39 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 18:6459 $21 $A0 $C2
    add  hl, bc                                   ;; 18:645C $09
    ld   a, [hl]                                  ;; 18:645D $7E
    and  $0F                                      ;; 18:645E $E6 $0F
    jr   nz, .jr_6467                             ;; 18:6460 $20 $05

    call GetEntityTransitionCountdown             ;; 18:6462 $CD $05 $0C
    jr   nz, jr_018_6475                          ;; 18:6465 $20 $0E

.jr_6467
    call GetEntityTransitionCountdown             ;; 18:6467 $CD $05 $0C
    ld   [hl], $30                                ;; 18:646A $36 $30
    call IncrementEntityState                     ;; 18:646C $CD $12 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 18:646F $21 $40 $C3
    add  hl, bc                                   ;; 18:6472 $09
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 18:6473 $CB $F6

jr_018_6475:
    ldh  a, [hFrameCounter]                       ;; 18:6475 $F0 $E7
    rra                                           ;; 18:6477 $1F
    rra                                           ;; 18:6478 $1F
    rra                                           ;; 18:6479 $1F
    rra                                           ;; 18:647A $1F
    and  $01                                      ;; 18:647B $E6 $01
    add  $03                                      ;; 18:647D $C6 $03
    jp   SetEntitySpriteVariant                   ;; 18:647F $C3 $0C $3B

ZombieState3Handler::
    call GetEntityTransitionCountdown             ;; 18:6482 $CD $05 $0C
    jp   z, ClearEntityStatusBank18               ;; 18:6485 $CA $08 $7F

    ld   e, $01                                   ;; 18:6488 $1E $01
    cp   $18                                      ;; 18:648A $FE $18
    jr   c, .jr_648F                              ;; 18:648C $38 $01

    inc  e                                        ;; 18:648E $1C

.jr_648F
    ld   a, e                                     ;; 18:648F $7B
    jp   SetEntitySpriteVariant                   ;; 18:6490 $C3 $0C $3B

func_018_6493::
    push bc                                       ;; 18:6493 $C5
    ld   hl, wEntitiesPosXTable                   ;; 18:6494 $21 $00 $C2
    add  hl, bc                                   ;; 18:6497 $09
    ld   a, [hl]                                  ;; 18:6498 $7E
    sub  $01                                      ;; 18:6499 $D6 $01
    ldh  [hMultiPurpose4], a                      ;; 18:649B $E0 $DB
    and  $F0                                      ;; 18:649D $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 18:649F $E0 $CE
    swap a                                        ;; 18:64A1 $CB $37
    ld   hl, wEntitiesPosYTable                   ;; 18:64A3 $21 $10 $C2
    add  hl, bc                                   ;; 18:64A6 $09
    ld   c, a                                     ;; 18:64A7 $4F
    ld   a, [hl]                                  ;; 18:64A8 $7E
    sub  $07                                      ;; 18:64A9 $D6 $07
    ldh  [hMultiPurpose5], a                      ;; 18:64AB $E0 $DC
    and  $F0                                      ;; 18:64AD $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 18:64AF $E0 $CD
    or   c                                        ;; 18:64B1 $B1
    ld   c, a                                     ;; 18:64B2 $4F
    ld   b, $00                                   ;; 18:64B3 $06 $00
    ld   hl, wRoomObjects                         ;; 18:64B5 $21 $11 $D7
    ld   a, h                                     ;; 18:64B8 $7C
    add  hl, bc                                   ;; 18:64B9 $09
    ld   h, a                                     ;; 18:64BA $67
    pop  bc                                       ;; 18:64BB $C1
    ld   a, [hl]                                  ;; 18:64BC $7E
    ldh  [hObjectUnderEntity], a                  ;; 18:64BD $E0 $AF
    ld   e, a                                     ;; 18:64BF $5F
    ld   a, [wIsIndoor]                           ;; 18:64C0 $FA $A5 $DB
    ld   d, a                                     ;; 18:64C3 $57
    call GetObjectPhysicsFlags_trampoline         ;; 18:64C4 $CD $26 $2A
    ldh  [hMultiPurpose3], a                      ;; 18:64C7 $E0 $DA
    ret                                           ;; 18:64C9 $C9
