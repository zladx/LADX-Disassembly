; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
CuccoSpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_1 | OAMF_PAL0
    db $52, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $54, OAM_GBC_PAL_1 | OAMF_PAL0
    db $56, OAM_GBC_PAL_1 | OAMF_PAL0
.variant2
    db $52, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $50, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $56, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $54, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

CuccoEntityHandler::
    ld   hl, wEntitiesHealthTable                 ;; 05:4524 $21 $60 $C3
    add  hl, bc                                   ;; 05:4527 $09
    ld   [hl], $4C                                ;; 05:4528 $36 $4C
    ld   hl, wEntitiesDirectionTable              ;; 05:452A $21 $80 $C3
    add  hl, bc                                   ;; 05:452D $09
    ld   a, [hl]                                  ;; 05:452E $7E
    and  a                                        ;; 05:452F $A7
    jr   nz, .jr_4538                             ;; 05:4530 $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:4532 $F0 $F1
    add  $02                                      ;; 05:4534 $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:4536 $E0 $F1

.jr_4538
    ld   de, CuccoSpriteVariants                  ;; 05:4538 $11 $14 $45
    call RenderActiveEntitySpritesPair            ;; 05:453B $CD $C0 $3B
    ldh  a, [hActiveEntityStatus]                 ;; 05:453E $F0 $EA
    cp   $07                                      ;; 05:4540 $FE $07
    jr   nz, jr_005_4557                          ;; 05:4542 $20 $13

    ldh  a, [hFrameCounter]                       ;; 05:4544 $F0 $E7
    and  $1F                                      ;; 05:4546 $E6 $1F
    jr   nz, .jr_454E                             ;; 05:4548 $20 $04

    ld   a, WAVE_SFX_CUCCO_HURT                   ;; 05:454A $3E $13
    ldh  [hWaveSfx], a                            ;; 05:454C $E0 $F3

.jr_454E
    ldh  a, [hFrameCounter]                       ;; 05:454E $F0 $E7
    rra                                           ;; 05:4550 $1F
    rra                                           ;; 05:4551 $1F
    and  $01                                      ;; 05:4552 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 05:4554 $C3 $0C $3B

jr_005_4557:
    call ReturnIfNonInteractive_05                ;; 05:4557 $CD $3A $7A
    call label_3B70                               ;; 05:455A $CD $70 $3B
    call DecrementEntityIgnoreHitsCountdown       ;; 05:455D $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ;; 05:4560 $F0 $F0
    cp   $03                                      ;; 05:4562 $FE $03
    jr   z, .jr_4580                              ;; 05:4564 $28 $1A

    call AddEntityZSpeedToPos_05                  ;; 05:4566 $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ;; 05:4569 $21 $20 $C3
    add  hl, bc                                   ;; 05:456C $09
    dec  [hl]                                     ;; 05:456D $35
    ld   hl, wEntitiesPosZTable                   ;; 05:456E $21 $10 $C3
    add  hl, bc                                   ;; 05:4571 $09
    ld   a, [hl]                                  ;; 05:4572 $7E
    and  $80                                      ;; 05:4573 $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 05:4575 $E0 $E8
    jr   z, .jr_4580                              ;; 05:4577 $28 $07

    xor  a                                        ;; 05:4579 $AF
    ld   [hl], a                                  ;; 05:457A $77
    ld   hl, wEntitiesSpeedZTable                 ;; 05:457B $21 $20 $C3
    add  hl, bc                                   ;; 05:457E $09
    ld   [hl], a                                  ;; 05:457F $77

.jr_4580
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:4580 $21 $20 $C4
    add  hl, bc                                   ;; 05:4583 $09
    ld   a, [hl]                                  ;; 05:4584 $7E
    and  a                                        ;; 05:4585 $A7
    jr   z, jr_005_45BF                           ;; 05:4586 $28 $37

    cp   $08                                      ;; 05:4588 $FE $08
    jr   nz, jr_005_45B7                          ;; 05:458A $20 $2B

    ld   a, [wIsMarinFollowingLink]               ;; 05:458C $FA $73 $DB
    and  a                                        ;; 05:458F $A7
    jr   z, jr_005_45AD                           ;; 05:4590 $28 $1B

    dec  [hl]                                     ;; 05:4592 $35
    ld   a, [wTransitionSequenceCounter]          ;; 05:4593 $FA $6B $C1
    cp   $04                                      ;; 05:4596 $FE $04
    jr   nz, jr_005_45AD                          ;; 05:4598 $20 $13

    call GetRandomByte                            ;; 05:459A $CD $0D $28
    and  $3F                                      ;; 05:459D $E6 $3F
    jr   nz, .jr_45A8                             ;; 05:459F $20 $07

    call_open_dialog Dialog276                    ;; 05:45A1
    jr   jr_005_45AD                              ;; 05:45A6 $18 $05

.jr_45A8
    call_open_dialog Dialog08F                    ;; 05:45A8

jr_005_45AD:
    ld   hl, wEntitiesPrivateState1Table          ;; 05:45AD $21 $B0 $C2
    add  hl, bc                                   ;; 05:45B0 $09
    ld   a, [hl]                                  ;; 05:45B1 $7E
    cp   $23                                      ;; 05:45B2 $FE $23
    jr   z, jr_005_45B7                           ;; 05:45B4 $28 $01

    inc  [hl]                                     ;; 05:45B6 $34

jr_005_45B7:
    call IncrementEntityState                     ;; 05:45B7 $CD $12 $3B
    ld   a, $02                                   ;; 05:45BA $3E $02
    ld   [hl], a                                  ;; 05:45BC $77
    ldh  [hActiveEntityState], a                  ;; 05:45BD $E0 $F0

jr_005_45BF:
    call CheckLinkCollisionWithEnemy_trampoline   ;; 05:45BF $CD $5A $3B
    jr   nc, jr_005_4611                          ;; 05:45C2 $30 $4D

    ldh  a, [hActiveEntityState]                  ;; 05:45C4 $F0 $F0
    cp   $03                                      ;; 05:45C6 $FE $03
    jr   z, jr_005_4611                           ;; 05:45C8 $28 $47

    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 05:45CA $FA $9B $C1
    and  a                                        ;; 05:45CD $A7
    jr   nz, jr_005_4611                          ;; 05:45CE $20 $41

    ld   a, [wInventoryItems.BButtonSlot]         ;; 05:45D0 $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 05:45D3 $FE $03
    jr   nz, .checkAButtonSlot                    ;; 05:45D5 $20 $08

    ldh  a, [hJoypadState]                        ;; 05:45D7 $F0 $CC
    and  J_B                                      ;; 05:45D9 $E6 $20
    jr   nz, jr_005_45EC                          ;; 05:45DB $20 $0F

    jr   jr_005_4611                              ;; 05:45DD $18 $32

.checkAButtonSlot
    ld   a, [wInventoryItems.AButtonSlot]         ;; 05:45DF $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 05:45E2 $FE $03
    jr   nz, jr_005_4611                          ;; 05:45E4 $20 $2B

    ldh  a, [hJoypadState]                        ;; 05:45E6 $F0 $CC
    and  J_A                                      ;; 05:45E8 $E6 $10
    jr   z, jr_005_4611                           ;; 05:45EA $28 $25

jr_005_45EC:
    ld   a, [wC3CF]                               ;; 05:45EC $FA $CF $C3
    and  a                                        ;; 05:45EF $A7
    jr   nz, jr_005_4611                          ;; 05:45F0 $20 $1F

    inc  a                                        ;; 05:45F2 $3C
    ld   [wC3CF], a                               ;; 05:45F3 $EA $CF $C3
    ld   hl, wEntitiesStatusTable                 ;; 05:45F6 $21 $80 $C2
    add  hl, bc                                   ;; 05:45F9 $09
    ld   [hl], $07                                ;; 05:45FA $36 $07
    ld   hl, wEntitiesLiftedTable                 ;; 05:45FC $21 $90 $C4
    add  hl, bc                                   ;; 05:45FF $09
    ld   [hl], b                                  ;; 05:4600 $70
    ldh  a, [hLinkDirection]                      ;; 05:4601 $F0 $9E
    ld   [wC15D], a                               ;; 05:4603 $EA $5D $C1
    call GetEntityTransitionCountdown             ;; 05:4606 $CD $05 $0C
    ld   [hl], $02                                ;; 05:4609 $36 $02
    ld   hl, hWaveSfx                             ;; 05:460B $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ;; 05:460E $36 $02
    ret                                           ;; 05:4610 $C9

jr_005_4611:
    ldh  a, [hActiveEntityState]                  ;; 05:4611 $F0 $F0
    JP_TABLE                                      ;; 05:4613
._00 dw func_005_4624                             ;; 05:4614
._01 dw func_005_4663                             ;; 05:4616
._02 dw func_005_46AF                             ;; 05:4618
._03 dw func_005_474E                             ;; 05:461A

Data_005_461C::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

func_005_4624::
    xor  a                                        ;; 05:4624 $AF
    call SetEntitySpriteVariant                   ;; 05:4625 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 05:4628 $CD $05 $0C
    ret  nz                                       ;; 05:462B $C0

    call GetRandomByte                            ;; 05:462C $CD $0D $28
    and  $07                                      ;; 05:462F $E6 $07
    ld   e, a                                     ;; 05:4631 $5F
    ld   d, b                                     ;; 05:4632 $50
    ld   hl, Data_005_461C                        ;; 05:4633 $21 $1C $46
    add  hl, de                                   ;; 05:4636 $19
    ld   a, [hl]                                  ;; 05:4637 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:4638 $21 $40 $C2
    add  hl, bc                                   ;; 05:463B $09
    ld   [hl], a                                  ;; 05:463C $77
    ld   a, e                                     ;; 05:463D $7B
    and  $04                                      ;; 05:463E $E6 $04
    ld   hl, wEntitiesDirectionTable              ;; 05:4640 $21 $80 $C3
    add  hl, bc                                   ;; 05:4643 $09
    ld   [hl], a                                  ;; 05:4644 $77
    call GetRandomByte                            ;; 05:4645 $CD $0D $28
    and  $07                                      ;; 05:4648 $E6 $07
    ld   e, a                                     ;; 05:464A $5F
    ld   hl, Data_005_461C                        ;; 05:464B $21 $1C $46
    add  hl, de                                   ;; 05:464E $19
    ld   a, [hl]                                  ;; 05:464F $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:4650 $21 $50 $C2
    add  hl, bc                                   ;; 05:4653 $09
    ld   [hl], a                                  ;; 05:4654 $77
    call GetEntityTransitionCountdown             ;; 05:4655 $CD $05 $0C
    call GetRandomByte                            ;; 05:4658 $CD $0D $28
    and  $1F                                      ;; 05:465B $E6 $1F
    add  $30                                      ;; 05:465D $C6 $30
    ld   [hl], a                                  ;; 05:465F $77
    jp   IncrementEntityState                     ;; 05:4660 $C3 $12 $3B

func_005_4663::
    call UpdateEntityPosWithSpeed_05              ;; 05:4663 $CD $B1 $7A
    call ApplyEntityInteractionWithBackground_trampoline ;; 05:4666 $CD $23 $3B
    ldh  a, [hMultiPurposeG]                      ;; 05:4669 $F0 $E8
    and  a                                        ;; 05:466B $A7
    jr   z, jr_005_4685                           ;; 05:466C $28 $17

    call GetEntityTransitionCountdown             ;; 05:466E $CD $05 $0C
    jr   nz, .jr_467A                             ;; 05:4671 $20 $07

    ld   [hl], $30                                ;; 05:4673 $36 $30
    call IncrementEntityState                     ;; 05:4675 $CD $12 $3B
    ld   [hl], b                                  ;; 05:4678 $70
    ret                                           ;; 05:4679 $C9

.jr_467A
    ld   hl, wEntitiesSpeedZTable                 ;; 05:467A $21 $20 $C3
    add  hl, bc                                   ;; 05:467D $09
    ld   [hl], $05                                ;; 05:467E $36 $05
    ld   hl, wEntitiesPosZTable                   ;; 05:4680 $21 $10 $C3
    add  hl, bc                                   ;; 05:4683 $09
    inc  [hl]                                     ;; 05:4684 $34

jr_005_4685:
    ldh  a, [hFrameCounter]                       ;; 05:4685 $F0 $E7
    rra                                           ;; 05:4687 $1F
    rra                                           ;; 05:4688 $1F
    rra                                           ;; 05:4689 $1F
    and  $01                                      ;; 05:468A $E6 $01
    jp   SetEntitySpriteVariant                   ;; 05:468C $C3 $0C $3B

Data_005_468F::
    db   $28, $48, $68, $88, $18, $38, $58, $78, $00, $00, $00, $00, $A0, $A0, $A0, $A0

Data_005_469F::
    db   $00, $00, $00, $00, $90, $90, $90, $90, $20, $40, $60, $80, $20, $40, $60, $80

func_005_46AF::
    ld   hl, wEntitiesPosZTable                   ;; 05:46AF $21 $10 $C3
    add  hl, bc                                   ;; 05:46B2 $09
    ldh  a, [hFrameCounter]                       ;; 05:46B3 $F0 $E7
    xor  c                                        ;; 05:46B5 $A9
    and  $1F                                      ;; 05:46B6 $E6 $1F
    or   [hl]                                     ;; 05:46B8 $B6
    jr   nz, jr_005_46D2                          ;; 05:46B9 $20 $17

    ld   a, $0C                                   ;; 05:46BB $3E $0C
    call GetVectorTowardsLink_trampoline          ;; 05:46BD $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 05:46C0 $F0 $D7
    cpl                                           ;; 05:46C2 $2F
    inc  a                                        ;; 05:46C3 $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 05:46C4 $21 $50 $C2
    add  hl, bc                                   ;; 05:46C7 $09
    ld   [hl], a                                  ;; 05:46C8 $77
    ldh  a, [hMultiPurpose1]                      ;; 05:46C9 $F0 $D8
    cpl                                           ;; 05:46CB $2F
    inc  a                                        ;; 05:46CC $3C

.jr_46CD
    ld   hl, wEntitiesSpeedXTable                 ;; 05:46CD $21 $40 $C2
    add  hl, bc                                   ;; 05:46D0 $09
    ld   [hl], a                                  ;; 05:46D1 $77

jr_005_46D2:
    call UpdateEntityPosWithSpeed_05              ;; 05:46D2 $CD $B1 $7A
    call ApplyEntityInteractionWithBackground_trampoline ;; 05:46D5 $CD $23 $3B
    ldh  a, [hFrameCounter]                       ;; 05:46D8 $F0 $E7
    rra                                           ;; 05:46DA $1F
    rra                                           ;; 05:46DB $1F
    and  $01                                      ;; 05:46DC $E6 $01
    call SetEntitySpriteVariant                   ;; 05:46DE $CD $0C $3B
    call GetEntityToLinkPositionDeltaX_05         ;; 05:46E1 $CD $04 $7B
    ld   hl, wEntitiesDirectionTable              ;; 05:46E4 $21 $80 $C3
    add  hl, bc                                   ;; 05:46E7 $09
    ld   a, e                                     ;; 05:46E8 $7B

.jr_46E9
    xor  $01                                      ;; 05:46E9 $EE $01
    ld   [hl], a                                  ;; 05:46EB $77
    ld   hl, wEntitiesPrivateState1Table          ;; 05:46EC $21 $B0 $C2
    add  hl, bc                                   ;; 05:46EF $09
    ld   a, [hl]                                  ;; 05:46F0 $7E
    cp   $23                                      ;; 05:46F1 $FE $23
    jr   nz, .ret_474D                            ;; 05:46F3 $20 $58

    ld   hl, wIsIndoor                            ;; 05:46F5 $21 $A5 $DB
    ldh  a, [hFrameCounter]                       ;; 05:46F8 $F0 $E7
    and  $0F                                      ;; 05:46FA $E6 $0F
    or   [hl]                                     ;; 05:46FC $B6
    jr   nz, .ret_474D                            ;; 05:46FD $20 $4E

    ld   a, ENTITY_CUCCO                          ;; 05:46FF $3E $6C
    ld   e, $07                                   ;; 05:4701 $1E $07
    call SpawnNewEntityInRange_trampoline         ;; 05:4703 $CD $98 $3B
    jr   c, .ret_474D                             ;; 05:4706 $38 $45

    ld   a, WAVE_SFX_CUCCO_HURT                   ;; 05:4708 $3E $13
    ldh  [hWaveSfx], a                            ;; 05:470A $E0 $F3
    ld   hl, wEntitiesStateTable                  ;; 05:470C $21 $90 $C2
    add  hl, de                                   ;; 05:470F $19
    ld   [hl], $03                                ;; 05:4710 $36 $03
    ld   hl, wEntitiesPosZTable                   ;; 05:4712 $21 $10 $C3
    add  hl, de                                   ;; 05:4715 $19
    ld   [hl], $10                                ;; 05:4716 $36 $10
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 05:4718 $21 $40 $C3
    add  hl, de                                   ;; 05:471B $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 05:471C $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ;; 05:471E $21 $50 $C3
    add  hl, de                                   ;; 05:4721 $19
    ld   [hl], $80                                ;; 05:4722 $36 $80
    ld   hl, wEntitiesOptions1Table               ;; 05:4724 $21 $30 $C4
    add  hl, de                                   ;; 05:4727 $19
    ld   [hl], ENTITY_OPT1_SWORD_CLINK_OFF        ;; 05:4728 $36 $40
    push bc                                       ;; 05:472A $C5
    call GetRandomByte                            ;; 05:472B $CD $0D $28
    and  $0F                                      ;; 05:472E $E6 $0F
    ld   c, a                                     ;; 05:4730 $4F
    ld   hl, Data_005_468F                        ;; 05:4731 $21 $8F $46
    add  hl, bc                                   ;; 05:4734 $09
    ld   a, [hl]                                  ;; 05:4735 $7E
    ld   hl, wEntitiesPosXTable                   ;; 05:4736 $21 $00 $C2
    add  hl, de                                   ;; 05:4739 $19
    ld   [hl], a                                  ;; 05:473A $77
    ld   hl, Data_005_469F                        ;; 05:473B $21 $9F $46
    add  hl, bc                                   ;; 05:473E $09
    ld   a, [hl]                                  ;; 05:473F $7E
    ld   hl, wEntitiesPosYTable                   ;; 05:4740 $21 $10 $C2
    add  hl, de                                   ;; 05:4743 $19
    ld   [hl], a                                  ;; 05:4744 $77
    ld   c, e                                     ;; 05:4745 $4B
    ld   b, d                                     ;; 05:4746 $42
    ld   a, $18                                   ;; 05:4747 $3E $18
    call ApplyVectorTowardsLink_trampoline        ;; 05:4749 $CD $AA $3B
    pop  bc                                       ;; 05:474C $C1

.ret_474D
    ret                                           ;; 05:474D $C9

func_005_474E::
    call label_3B44                               ;; 05:474E $CD $44 $3B
    call UpdateEntityPosWithSpeed_05              ;; 05:4751 $CD $B1 $7A
    ldh  a, [hActiveEntityPosX]                   ;; 05:4754 $F0 $EE
    cp   $A9                                      ;; 05:4756 $FE $A9
    jp   nc, ClearEntityStatus_05                 ;; 05:4758 $D2 $4B $7B

    ldh  a, [hActiveEntityVisualPosY]             ;; 05:475B $F0 $EC
    cp   $91                                      ;; 05:475D $FE $91
    jp   nc, ClearEntityStatus_05                 ;; 05:475F $D2 $4B $7B

    ldh  a, [hFrameCounter]                       ;; 05:4762 $F0 $E7
    rra                                           ;; 05:4764 $1F
    rra                                           ;; 05:4765 $1F
    and  $01                                      ;; 05:4766 $E6 $01
    call SetEntitySpriteVariant                   ;; 05:4768 $CD $0C $3B
    ld   e, $00                                   ;; 05:476B $1E $00
    ld   hl, wEntitiesSpeedXTable                 ;; 05:476D $21 $40 $C2
    add  hl, bc                                   ;; 05:4770 $09
    ld   a, [hl]                                  ;; 05:4771 $7E
    and  $80                                      ;; 05:4772 $E6 $80
    jr   z, .jr_4777                              ;; 05:4774 $28 $01

    inc  e                                        ;; 05:4776 $1C

.jr_4777
    ld   hl, wEntitiesDirectionTable              ;; 05:4777 $21 $80 $C3
    add  hl, bc                                   ;; 05:477A $09
    ld   [hl], e                                  ;; 05:477B $73
    jp   PlayBoomerangSfx_trampoline              ;; 05:477C $C3 $F8 $29

    ret                                           ;; 05:477F $C9
