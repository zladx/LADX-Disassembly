BeetleSpawnerEntityHandler::
    ld   hl, wEntitiesPrivateState3Table          ;; 15:750D $21 $D0 $C2
    add  hl, bc                                   ;; 15:7510 $09
    ld   a, [hl]                                  ;; 15:7511 $7E
    and  a                                        ;; 15:7512 $A7
    jp   nz, BeetleSpawnerBeetleHandler           ;; 15:7513 $C2 $7F $75

    call ReturnIfNonInteractive_15                ;; 15:7516 $CD $0D $7B
    call GetEntityXDistanceToLink_15              ;; 15:7519 $CD $DB $7B
    add  $20                                      ;; 15:751C $C6 $20
    cp   $40                                      ;; 15:751E $FE $40
    jr   nc, .ret_756E                            ;; 15:7520 $30 $4C

    call GetEntityRealYDistanceToLink_15          ;; 15:7522 $CD $EB $7B
    add  $20                                      ;; 15:7525 $C6 $20
    cp   $40                                      ;; 15:7527 $FE $40
    jr   nc, .ret_756E                            ;; 15:7529 $30 $43

    ld   hl, wEntitiesInertiaTable                ;; 15:752B $21 $D0 $C3
    add  hl, bc                                   ;; 15:752E $09
    ld   a, [hl]                                  ;; 15:752F $7E
    inc  a                                        ;; 15:7530 $3C
    ld   [hl], a                                  ;; 15:7531 $77
    and  $3F                                      ;; 15:7532 $E6 $3F
    jr   nz, .ret_756E                            ;; 15:7534 $20 $38

    ld   a, ENTITY_BEETLE_SPAWNER                 ;; 15:7536 $3E $B2
    ld   e, $04                                   ;; 15:7538 $1E $04
    call SpawnNewEntityInRange_trampoline         ;; 15:753A $CD $98 $3B
    jr   c, .ret_756E                             ;; 15:753D $38 $2F

    ldh  a, [hMultiPurpose0]                      ;; 15:753F $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 15:7541 $21 $00 $C2
    add  hl, de                                   ;; 15:7544 $19
    ld   [hl], a                                  ;; 15:7545 $77
    ldh  a, [hMultiPurpose1]                      ;; 15:7546 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 15:7548 $21 $10 $C2
    add  hl, de                                   ;; 15:754B $19
    ld   [hl], a                                  ;; 15:754C $77
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 15:754D $21 $40 $C3
    add  hl, de                                   ;; 15:7550 $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 15:7551 $36 $12
    ld   hl, wEntitiesPrivateState3Table          ;; 15:7553 $21 $D0 $C2
    add  hl, de                                   ;; 15:7556 $19
    ld   [hl], $01                                ;; 15:7557 $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ;; 15:7559 $21 $E0 $C2
    add  hl, de                                   ;; 15:755C $19
    ld   [hl], $18                                ;; 15:755D $36 $18
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 15:755F $21 $F0 $C2
    add  hl, de                                   ;; 15:7562 $19
    ld   [hl], $20                                ;; 15:7563 $36 $20
    push bc                                       ;; 15:7565 $C5
    ld   c, e                                     ;; 15:7566 $4B
    ld   b, d                                     ;; 15:7567 $42
    ld   a, $08                                   ;; 15:7568 $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 15:756A $CD $AA $3B
    pop  bc                                       ;; 15:756D $C1

.ret_756E
    ret                                           ;; 15:756E $C9

BeetleXSpeeds::
    db   $08, $F8, $00, $00

BeetleYSpeeds::
    db   $00, $00, $F8, $08

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BeetleSpriteVariants::
.variant0
    db $70, $00
    db $72, $00
.variant1
    db $72, $20
    db $70, $20

BeetleSpawnerBeetleHandler:
    ld   de, BeetleSpriteVariants                 ;; 15:757F $11 $77 $75
    call RenderActiveEntitySpritesPair            ;; 15:7582 $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:7585 $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ;; 15:7588 $CD $3E $7B
    ldh  a, [hFrameCounter]                       ;; 15:758B $F0 $E7
    rra                                           ;; 15:758D $1F
    rra                                           ;; 15:758E $1F
    rra                                           ;; 15:758F $1F
    and  $01                                      ;; 15:7590 $E6 $01
    call SetEntitySpriteVariant                   ;; 15:7592 $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ;; 15:7595 $CD $88 $7B
    call GetEntityPrivateCountdown1               ;; 15:7598 $CD $00 $0C
    jr   nz, .jr_75A0                             ;; 15:759B $20 $03

    call ApplyEntityInteractionWithBackground_trampoline ;; 15:759D $CD $23 $3B

.jr_75A0
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 15:75A0 $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 15:75A3 $CD $05 $0C
    jr   nz, .jr_75CB                             ;; 15:75A6 $20 $23

    call GetRandomByte                            ;; 15:75A8 $CD $0D $28
    and  $1F                                      ;; 15:75AB $E6 $1F
    add  $20                                      ;; 15:75AD $C6 $20
    ld   [hl], a                                  ;; 15:75AF $77
    call GetRandomByte                            ;; 15:75B0 $CD $0D $28
    and  $03                                      ;; 15:75B3 $E6 $03
    ld   e, a                                     ;; 15:75B5 $5F
    ld   d, b                                     ;; 15:75B6 $50
    ld   hl, BeetleXSpeeds                        ;; 15:75B7 $21 $6F $75
    add  hl, de                                   ;; 15:75BA $19
    ld   a, [hl]                                  ;; 15:75BB $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 15:75BC $21 $40 $C2
    add  hl, bc                                   ;; 15:75BF $09
    ld   [hl], a                                  ;; 15:75C0 $77
    ld   hl, BeetleYSpeeds                        ;; 15:75C1 $21 $73 $75
    add  hl, de                                   ;; 15:75C4 $19
    ld   a, [hl]                                  ;; 15:75C5 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 15:75C6 $21 $50 $C2
    add  hl, bc                                   ;; 15:75C9 $09
    ld   [hl], a                                  ;; 15:75CA $77

.jr_75CB
    ret                                           ;; 15:75CB $C9

    ld   a, $01                                   ;; 15:75CC $3E $01
