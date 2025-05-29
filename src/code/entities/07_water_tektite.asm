; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
WaterTektiteSpriteVariants::
.variant0
    db $70, $00
    db $70, $20
.variant1
    db $72, $00
    db $72, $20

WaterTektiteEntityHandler::
    ld   de, WaterTektiteSpriteVariants           ;; 07:7535 $11 $2D $75
    call RenderActiveEntitySpritesPair            ;; 07:7538 $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:753B $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ;; 07:753E $CD $C3 $7D
    ldh  a, [hFrameCounter]                       ;; 07:7541 $F0 $E7
    rra                                           ;; 07:7543 $1F
    rra                                           ;; 07:7544 $1F
    rra                                           ;; 07:7545 $1F
    rra                                           ;; 07:7546 $1F

.jr_7547
    and  $01                                      ;; 07:7547 $E6 $01
    call SetEntitySpriteVariant                   ;; 07:7549 $CD $0C $3B
    call UpdateEntityPosWithSpeed_07              ;; 07:754C $CD $0A $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:754F $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 07:7552 $21 $A0 $C2
    add  hl, bc                                   ;; 07:7555 $09
    ld   a, [hl]                                  ;; 07:7556 $7E
    and  $0F                                      ;; 07:7557 $E6 $0F
    jr   z, .jr_756A                              ;; 07:7559 $28 $0F

    call GetEntityTransitionCountdown             ;; 07:755B $CD $05 $0C
    ld   [hl], $10                                ;; 07:755E $36 $10
    call ClearEntitySpeed                         ;; 07:7560 $CD $7F $3D
    call IncrementEntityState                     ;; 07:7563 $CD $12 $3B
    xor  a                                        ;; 07:7566 $AF
    ld   [hl], a                                  ;; 07:7567 $77
    ldh  [hActiveEntityState], a                  ;; 07:7568 $E0 $F0

.jr_756A
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:756A $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ;; 07:756D $F0 $F0
    JP_TABLE                                      ;; 07:756F
._00 dw func_007_7576                             ;; 07:7570
._01 dw func_007_7597                             ;; 07:7572
._02 dw func_007_75B7                             ;; 07:7574

func_007_7576::
    call GetEntityTransitionCountdown             ;; 07:7576 $CD $05 $0C
    jr   nz, .ret_7596                            ;; 07:7579 $20 $1B

    ld   [hl], $20                                ;; 07:757B $36 $20
    call IncrementEntityState                     ;; 07:757D $CD $12 $3B
    call GetRandomByte                            ;; 07:7580 $CD $0D $28
    and  $02                                      ;; 07:7583 $E6 $02
    dec  a                                        ;; 07:7585 $3D
    ld   hl, wEntitiesPrivateState1Table          ;; 07:7586 $21 $B0 $C2
    add  hl, bc                                   ;; 07:7589 $09
    ld   [hl], a                                  ;; 07:758A $77
    call GetRandomByte                            ;; 07:758B $CD $0D $28
    and  $02                                      ;; 07:758E $E6 $02
    dec  a                                        ;; 07:7590 $3D
    ld   hl, wEntitiesPrivateState2Table          ;; 07:7591 $21 $C0 $C2
    add  hl, bc                                   ;; 07:7594 $09
    ld   [hl], a                                  ;; 07:7595 $77

.ret_7596
    ret                                           ;; 07:7596 $C9

func_007_7597::
    call GetEntityTransitionCountdown             ;; 07:7597 $CD $05 $0C
    jp   z, IncrementEntityState                  ;; 07:759A $CA $12 $3B

    and  $01                                      ;; 07:759D $E6 $01
    jr   nz, ret_007_75B6                         ;; 07:759F $20 $15

    ld   hl, wEntitiesPrivateState1Table          ;; 07:75A1 $21 $B0 $C2

.jr_75A4
    add  hl, bc                                   ;; 07:75A4 $09
    ld   a, [hl]                                  ;; 07:75A5 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:75A6 $21 $40 $C2
    add  hl, bc                                   ;; 07:75A9 $09
    add  [hl]                                     ;; 07:75AA $86
    ld   [hl], a                                  ;; 07:75AB $77
    ld   hl, wEntitiesPrivateState2Table          ;; 07:75AC $21 $C0 $C2
    add  hl, bc                                   ;; 07:75AF $09
    ld   a, [hl]                                  ;; 07:75B0 $7E
    call GetEntitySpeedYAddress                   ;; 07:75B1 $CD $05 $40
    add  [hl]                                     ;; 07:75B4 $86
    ld   [hl], a                                  ;; 07:75B5 $77

ret_007_75B6:
    ret                                           ;; 07:75B6 $C9

func_007_75B7::
    ldh  a, [hFrameCounter]                       ;; 07:75B7 $F0 $E7
    and  $01                                      ;; 07:75B9 $E6 $01
    jr   nz, ret_007_75DD                         ;; 07:75BB $20 $20

    ld   hl, wEntitiesSpeedXTable                 ;; 07:75BD $21 $40 $C2
    add  hl, bc                                   ;; 07:75C0 $09
    ld   a, [hl]                                  ;; 07:75C1 $7E
    and  a                                        ;; 07:75C2 $A7
    jr   nz, .jr_75CF                             ;; 07:75C3 $20 $0A

    call IncrementEntityState                     ;; 07:75C5 $CD $12 $3B
    ld   [hl], b                                  ;; 07:75C8 $70
    call GetEntityTransitionCountdown             ;; 07:75C9 $CD $05 $0C
    ld   [hl], $10                                ;; 07:75CC $36 $10
    ret                                           ;; 07:75CE $C9

.jr_75CF
    call func_007_75D6                            ;; 07:75CF $CD $D6 $75
    call GetEntitySpeedYAddress                   ;; 07:75D2 $CD $05 $40
    ld   a, [hl]                                  ;; 07:75D5 $7E

func_007_75D6::
    bit  7, a                                     ;; 07:75D6 $CB $7F
    jr   z, .jr_75DC                              ;; 07:75D8 $28 $02

    inc  [hl]                                     ;; 07:75DA $34
    inc  [hl]                                     ;; 07:75DB $34

.jr_75DC
    dec  [hl]                                     ;; 07:75DC $35

ret_007_75DD:
    ret                                           ;; 07:75DD $C9
