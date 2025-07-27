SmasherEntityHandler::
    ld   hl, wEntitiesPrivateState4Table          ;; 06:4509 $21 $40 $C4
    add  hl, bc                                   ;; 06:450C $09
    ld   a, [hl]                                  ;; 06:450D $7E
    and  a                                        ;; 06:450E $A7
    jp   nz, label_006_4781                       ;; 06:450F $C2 $81 $47

    ld   a, c                                     ;; 06:4512 $79
    ld   [wD202], a                               ;; 06:4513 $EA $02 $D2
    ld   hl, wEntitiesPrivateState3Table          ;; 06:4516 $21 $D0 $C2
    add  hl, bc                                   ;; 06:4519 $09
    ld   a, [hl]                                  ;; 06:451A $7E
    and  a                                        ;; 06:451B $A7
    jr   nz, .jr_453F                             ;; 06:451C $20 $21

    inc  [hl]                                     ;; 06:451E $34
    ld   a, ENTITY_SMASHER                        ;; 06:451F $3E $92
    call SpawnNewEntity_trampoline                ;; 06:4521 $CD $86 $3B
    ld   a, e                                     ;; 06:4524 $7B
    ld   [wD201], a                               ;; 06:4525 $EA $01 $D2
    ldh  a, [hMultiPurpose1]                      ;; 06:4528 $F0 $D8
    add  $10                                      ;; 06:452A $C6 $10
    ld   hl, wEntitiesPosYTable                   ;; 06:452C $21 $10 $C2
    add  hl, de                                   ;; 06:452F $19
    ld   [hl], a                                  ;; 06:4530 $77
    ldh  a, [hMultiPurpose0]                      ;; 06:4531 $F0 $D7
    add  $30                                      ;; 06:4533 $C6 $30
    ld   hl, wEntitiesPosXTable                   ;; 06:4535 $21 $00 $C2
    add  hl, de                                   ;; 06:4538 $19
    ld   [hl], a                                  ;; 06:4539 $77
    ld   hl, wEntitiesPrivateState4Table          ;; 06:453A $21 $40 $C4
    add  hl, de                                   ;; 06:453D $19
    inc  [hl]                                     ;; 06:453E $34

.jr_453F
    call func_006_4767                            ;; 06:453F $CD $67 $47
    call BossIntro                                ;; 06:4542 $CD $E8 $3E
    ldh  a, [hActiveEntityStatus]                 ;; 06:4545 $F0 $EA
    cp   $05                                      ;; 06:4547 $FE $05
    jp   nz, label_006_5308                       ;; 06:4549 $C2 $08 $53

    call ReturnIfNonInteractive_06                ;; 06:454C $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:454F $CD $F7 $64
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:4552 $CD $39 $3B
    call AddEntityZSpeedToPos_06                  ;; 06:4555 $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:4558 $21 $20 $C3
    add  hl, bc                                   ;; 06:455B $09
    dec  [hl]                                     ;; 06:455C $35
    dec  [hl]                                     ;; 06:455D $35
    dec  [hl]                                     ;; 06:455E $35
    ld   hl, wEntitiesPosZTable                   ;; 06:455F $21 $10 $C3
    add  hl, bc                                   ;; 06:4562 $09
    ld   a, [hl]                                  ;; 06:4563 $7E
    and  $80                                      ;; 06:4564 $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 06:4566 $E0 $E8
    jr   z, .jr_4570                              ;; 06:4568 $28 $06

    ld   [hl], b                                  ;; 06:456A $70
    ld   hl, wEntitiesSpeedZTable                 ;; 06:456B $21 $20 $C3
    add  hl, bc                                   ;; 06:456E $09
    ld   [hl], b                                  ;; 06:456F $70

.jr_4570
    ldh  a, [hActiveEntityState]                  ;; 06:4570 $F0 $F0
    JP_TABLE                                      ;; 06:4572
._00 dw SmasherState0Handler
._01 dw SmasherState1Handler
._02 dw SmasherState2Handler
._03 dw SmasherState3Handler
._04 dw SmasherState4Handler

SmasherState0Handler::
    ld   a, [wD201]                               ;; 06:457D $FA $01 $D2
    ld   e, a                                     ;; 06:4580 $5F
    ld   d, b                                     ;; 06:4581 $50
    ld   hl, wEntitiesStateTable                  ;; 06:4582 $21 $90 $C2
    add  hl, de                                   ;; 06:4585 $19
    ld   a, [hl]                                  ;; 06:4586 $7E
    cp   $00                                      ;; 06:4587 $FE $00
    jr   nz, jr_006_45E2                          ;; 06:4589 $20 $57

    ldh  a, [hLinkPositionX]                      ;; 06:458B $F0 $98
    push af                                       ;; 06:458D $F5
    ldh  a, [hLinkPositionY]                      ;; 06:458E $F0 $99
    push af                                       ;; 06:4590 $F5
    ld   hl, wEntitiesPosXTable                   ;; 06:4591 $21 $00 $C2
    add  hl, de                                   ;; 06:4594 $19
    ld   a, [hl]                                  ;; 06:4595 $7E
    ldh  [hLinkPositionX], a                      ;; 06:4596 $E0 $98
    ld   hl, wEntitiesPosYTable                   ;; 06:4598 $21 $10 $C2
    add  hl, de                                   ;; 06:459B $19
    ld   a, [hl]                                  ;; 06:459C $7E
    ldh  [hLinkPositionY], a                      ;; 06:459D $E0 $99
    ld   a, $10                                   ;; 06:459F $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 06:45A1 $CD $AA $3B
    call UpdateEntityPosWithSpeed_06              ;; 06:45A4 $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:45A7 $CD $23 $3B
    call GetEntityXDistanceToLink_06              ;; 06:45AA $CD $94 $65
    ld   hl, wEntitiesDirectionTable              ;; 06:45AD $21 $80 $C3
    add  hl, bc                                   ;; 06:45B0 $09
    ld   [hl], e                                  ;; 06:45B1 $73
    add  $0C                                      ;; 06:45B2 $C6 $0C
    cp   $18                                      ;; 06:45B4 $FE $18
    jr   nc, .jr_45DA                             ;; 06:45B6 $30 $22

    call GetEntityYDistanceToLink_06              ;; 06:45B8 $CD $A4 $65
    add  $0C                                      ;; 06:45BB $C6 $0C
    cp   $18                                      ;; 06:45BD $FE $18
    jr   nc, .jr_45DA                             ;; 06:45BF $30 $19

    call IncrementEntityState                     ;; 06:45C1 $CD $12 $3B
    ld   [hl], $02                                ;; 06:45C4 $36 $02
    ld   a, [wD201]                               ;; 06:45C6 $FA $01 $D2
    ld   e, a                                     ;; 06:45C9 $5F
    ld   d, b                                     ;; 06:45CA $50
    ld   hl, wEntitiesStateTable                  ;; 06:45CB $21 $90 $C2
    add  hl, de                                   ;; 06:45CE $19
    ld   [hl], $01                                ;; 06:45CF $36 $01
    call GetEntityTransitionCountdown             ;; 06:45D1 $CD $05 $0C
    ld   [hl], $1F                                ;; 06:45D4 $36 $1F
    ld   a, WAVE_SFX_ROVER_CRY                    ;; 06:45D6 $3E $1C
    ldh  [hWaveSfx], a                            ;; 06:45D8 $E0 $F3

.jr_45DA
    pop  af                                       ;; 06:45DA $F1
    ldh  [hLinkPositionY], a                      ;; 06:45DB $E0 $99
    pop  af                                       ;; 06:45DD $F1
    ldh  [hLinkPositionX], a                      ;; 06:45DE $E0 $98
    jr   func_006_45E5                            ;; 06:45E0 $18 $03

jr_006_45E2:
    call IncrementEntityState                     ;; 06:45E2 $CD $12 $3B

func_006_45E5::
    ldh  a, [hMultiPurposeG]                      ;; 06:45E5 $F0 $E8
    and  a                                        ;; 06:45E7 $A7
    jr   z, .jr_45F0                              ;; 06:45E8 $28 $06

    ld   hl, wEntitiesSpeedZTable                 ;; 06:45EA $21 $20 $C3
    add  hl, bc                                   ;; 06:45ED $09
    ld   [hl], $10                                ;; 06:45EE $36 $10

.jr_45F0
    ld   hl, wEntitiesDirectionTable              ;; 06:45F0 $21 $80 $C3
    add  hl, bc                                   ;; 06:45F3 $09
    ld   a, [hl]                                  ;; 06:45F4 $7E
    and  $01                                      ;; 06:45F5 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 06:45F7 $C3 $0C $3B

Data_006_45FA::
    db   $0C, $F4, $0C, $F4

Data_006_45FE::
    db   $FC, $FC, $04, $04

SmasherState1Handler::
    ld   a, [wD201]                               ;; 06:4602 $FA $01 $D2
    ld   e, a                                     ;; 06:4605 $5F
    ld   d, b                                     ;; 06:4606 $50
    ld   hl, wEntitiesStateTable                  ;; 06:4607 $21 $90 $C2
    add  hl, de                                   ;; 06:460A $19
    ld   a, [hl]                                  ;; 06:460B $7E
    cp   $00                                      ;; 06:460C $FE $00
    jr   nz, .jr_4614                             ;; 06:460E $20 $04

    call IncrementEntityState                     ;; 06:4610 $CD $12 $3B
    ld   [hl], b                                  ;; 06:4613 $70

.jr_4614
    call GetEntityTransitionCountdown             ;; 06:4614 $CD $05 $0C
    jr   nz, .jr_463E                             ;; 06:4617 $20 $25

    call GetRandomByte                            ;; 06:4619 $CD $0D $28
    and  $1F                                      ;; 06:461C $E6 $1F
    add  $10                                      ;; 06:461E $C6 $10
    ld   [hl], a                                  ;; 06:4620 $77
    and  $03                                      ;; 06:4621 $E6 $03
    ld   hl, wEntitiesDirectionTable              ;; 06:4623 $21 $80 $C3
    add  hl, bc                                   ;; 06:4626 $09
    ld   [hl], a                                  ;; 06:4627 $77
    ld   e, a                                     ;; 06:4628 $5F
    ld   d, b                                     ;; 06:4629 $50
    ld   hl, Data_006_45FA                        ;; 06:462A $21 $FA $45
    add  hl, de                                   ;; 06:462D $19
    ld   a, [hl]                                  ;; 06:462E $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:462F $21 $40 $C2
    add  hl, bc                                   ;; 06:4632 $09
    ld   [hl], a                                  ;; 06:4633 $77
    ld   hl, Data_006_45FE                        ;; 06:4634 $21 $FE $45
    add  hl, de                                   ;; 06:4637 $19
    ld   a, [hl]                                  ;; 06:4638 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:4639 $21 $50 $C2
    add  hl, bc                                   ;; 06:463C $09
    ld   [hl], a                                  ;; 06:463D $77

.jr_463E
    call UpdateEntityPosWithSpeed_06              ;; 06:463E $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:4641 $CD $23 $3B
    call func_006_45E5                            ;; 06:4644 $CD $E5 $45
    ldh  a, [hFrameCounter]                       ;; 06:4647 $F0 $E7
    and  $08                                      ;; 06:4649 $E6 $08
    jr   z, .ret_464F                             ;; 06:464B $28 $02

    inc  [hl]                                     ;; 06:464D $34
    inc  [hl]                                     ;; 06:464E $34

.ret_464F
    ret                                           ;; 06:464F $C9

Data_006_4650::
    db   $00, $02, $04, $06, $08, $0A, $0C, $0E, $00, $FE, $FC, $FA, $F8, $F6, $F4, $F2

Data_006_4660::
    db   $F0, $F1, $F2, $F4, $F6, $F8, $FA, $FE, $F0, $F1, $F2, $F4, $F6, $F8, $FA, $FE

SmasherState2Handler::
    ld   hl, wEntitiesDirectionTable              ;; 06:4670 $21 $80 $C3
    add  hl, bc                                   ;; 06:4673 $09
    ld   a, [hl]                                  ;; 06:4674 $7E
    and  $01                                      ;; 06:4675 $E6 $01
    rla                                           ;; 06:4677 $17
    rla                                           ;; 06:4678 $17
    rla                                           ;; 06:4679 $17
    and  $08                                      ;; 06:467A $E6 $08
    ld   e, a                                     ;; 06:467C $5F
    call GetEntityTransitionCountdown             ;; 06:467D $CD $05 $0C
    jr   nz, .jr_4687                             ;; 06:4680 $20 $05

    ld   [hl], $20                                ;; 06:4682 $36 $20
    jp   IncrementEntityState                     ;; 06:4684 $C3 $12 $3B

.jr_4687
    rra                                           ;; 06:4687 $1F
    rra                                           ;; 06:4688 $1F
    and  $07                                      ;; 06:4689 $E6 $07
    or   e                                        ;; 06:468B $B3

func_006_468C::
    push bc                                       ;; 06:468C $C5
    ld   c, a                                     ;; 06:468D $4F
    ld   a, [wD201]                               ;; 06:468E $FA $01 $D2
    ld   e, a                                     ;; 06:4691 $5F
    ld   d, b                                     ;; 06:4692 $50
    ldh  a, [hActiveEntityPosX]                   ;; 06:4693 $F0 $EE
    ld   hl, Data_006_4650                        ;; 06:4695 $21 $50 $46
    add  hl, bc                                   ;; 06:4698 $09
    add  [hl]                                     ;; 06:4699 $86
    ld   hl, wEntitiesPosXTable                   ;; 06:469A $21 $00 $C2
    add  hl, de                                   ;; 06:469D $19
    ld   [hl], a                                  ;; 06:469E $77
    ld   hl, Data_006_4660                        ;; 06:469F $21 $60 $46
    add  hl, bc                                   ;; 06:46A2 $09
    ld   a, [hl]                                  ;; 06:46A3 $7E
    cpl                                           ;; 06:46A4 $2F
    inc  a                                        ;; 06:46A5 $3C
    pop  bc                                       ;; 06:46A6 $C1
    ld   hl, wEntitiesPosZTable                   ;; 06:46A7 $21 $10 $C3
    add  hl, bc                                   ;; 06:46AA $09
    add  [hl]                                     ;; 06:46AB $86
    ld   hl, wEntitiesPosZTable                   ;; 06:46AC $21 $10 $C3
    add  hl, de                                   ;; 06:46AF $19
    ld   [hl], a                                  ;; 06:46B0 $77
    ld   hl, wEntitiesPosYTable                   ;; 06:46B1 $21 $10 $C2
    add  hl, bc                                   ;; 06:46B4 $09
    ld   a, [hl]                                  ;; 06:46B5 $7E
    add  $02                                      ;; 06:46B6 $C6 $02
    ld   hl, wEntitiesPosYTable                   ;; 06:46B8 $21 $10 $C2
    add  hl, de                                   ;; 06:46BB $19
    ld   [hl], a                                  ;; 06:46BC $77

func_006_46BD::
    ld   hl, wEntitiesDirectionTable              ;; 06:46BD $21 $80 $C3
    add  hl, bc                                   ;; 06:46C0 $09
    ld   a, [hl]                                  ;; 06:46C1 $7E
    and  $01                                      ;; 06:46C2 $E6 $01
    or   $02                                      ;; 06:46C4 $F6 $02
    jp   SetEntitySpriteVariant                   ;; 06:46C6 $C3 $0C $3B

SmasherState3Handler::
    xor  a                                        ;; 06:46C9 $AF
    call func_006_468C                            ;; 06:46CA $CD $8C $46
    call GetEntityTransitionCountdown             ;; 06:46CD $CD $05 $0C
    jr   nz, .jr_46FB                             ;; 06:46D0 $20 $29

    ld   [hl], $20                                ;; 06:46D2 $36 $20
    ld   a, [wD201]                               ;; 06:46D4 $FA $01 $D2
    ld   e, a                                     ;; 06:46D7 $5F
    ld   d, b                                     ;; 06:46D8 $50
    ld   hl, wEntitiesStateTable                  ;; 06:46D9 $21 $90 $C2
    add  hl, de                                   ;; 06:46DC $19
    ld   [hl], $04                                ;; 06:46DD $36 $04
    push bc                                       ;; 06:46DF $C5
    ld   c, e                                     ;; 06:46E0 $4B
    ld   b, d                                     ;; 06:46E1 $42
    ld   a, $20                                   ;; 06:46E2 $3E $20
    call ApplyVectorTowardsLink_trampoline        ;; 06:46E4 $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ;; 06:46E7 $21 $20 $C3
    add  hl, bc                                   ;; 06:46EA $09
    ld   [hl], $18                                ;; 06:46EB $36 $18
    pop  bc                                       ;; 06:46ED $C1
    ld   hl, wEntitiesSpeedZTable                 ;; 06:46EE $21 $20 $C3
    add  hl, bc                                   ;; 06:46F1 $09
    ld   [hl], $20                                ;; 06:46F2 $36 $20
    ld   a, JINGLE_FALL_DOWN                      ;; 06:46F4 $3E $08
    ldh  [hJingle], a                             ;; 06:46F6 $E0 $F2
    jp   IncrementEntityState                     ;; 06:46F8 $C3 $12 $3B

.jr_46FB
    call func_006_45E5                            ;; 06:46FB $CD $E5 $45
    ld   a, $04                                   ;; 06:46FE $3E $04
    call ApplyVectorTowardsLink_trampoline        ;; 06:4700 $CD $AA $3B
    call GetEntityXDistanceToLink_06              ;; 06:4703 $CD $94 $65
    ld   hl, wEntitiesDirectionTable              ;; 06:4706 $21 $80 $C3
    add  hl, bc                                   ;; 06:4709 $09
    ld   [hl], e                                  ;; 06:470A $73
    call func_006_46BD                            ;; 06:470B $CD $BD $46
    call UpdateEntityPosWithSpeed_06              ;; 06:470E $CD $41 $65
    jp   ApplyEntityInteractionWithBackground_trampoline ;; 06:4711 $C3 $23 $3B

SmasherState4Handler::
    call GetEntityTransitionCountdown             ;; 06:4714 $CD $05 $0C
    jr   nz, .jr_471D                             ;; 06:4717 $20 $04

    call IncrementEntityState                     ;; 06:4719 $CD $12 $3B
    ld   [hl], b                                  ;; 06:471C $70

.jr_471D
    ld   hl, wEntitiesDirectionTable              ;; 06:471D $21 $80 $C3
    add  hl, bc                                   ;; 06:4720 $09
    ld   a, [hl]                                  ;; 06:4721 $7E
    and  $01                                      ;; 06:4722 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 06:4724 $C3 $0C $3B

Data_006_4727::
    db   $00, $FC, $64, $21, $00, $04, $62, $21, $00, $0C, $60, $21, $F0, $FC, $6C, $21
    db   $00, $FC, $60, $01, $00, $04, $62, $01, $00, $0C, $64, $01, $F0, $0C, $6C, $01
    db   $00, $FC, $6A, $21, $00, $04, $68, $21, $00, $0C, $66, $21, $F0, $FC, $6C, $01
    db   $00, $FC, $66, $01, $00, $04, $68, $01, $00, $0C, $6A, $01, $F0, $0C, $6C, $21

func_006_4767::
    ldh  a, [hActiveEntitySpriteVariant]          ; $4767: $F0 F1
    rla                                           ;; 06:4769 $17
    rla                                           ;; 06:476A $17
    rla                                           ;; 06:476B $17
    rla                                           ;; 06:476C $17
    and  $F0                                      ;; 06:476D $E6 $F0
    ld   e, a                                     ;; 06:476F $5F
    ld   d, b                                     ;; 06:4770 $50

func_006_4771::
    ld   hl, Data_006_4727                        ;; 06:4771 $21 $27 $47
    add  hl, de                                   ;; 06:4774 $19
    ld   c, $04                                   ;; 06:4775 $0E $04
    call RenderActiveEntitySpritesRect            ;; 06:4777 $CD $E6 $3C
    jp   label_3CD9                               ;; 06:477A $C3 $D9 $3C

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SmasherSpriteVariants::
.variant0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

label_006_4781:
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:4781 $21 $40 $C3
    add  hl, bc                                   ;; 06:4784 $09
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_SHADOW ;; 06:4785 $36 $92
    ld   hl, wEntitiesThrownDirectionTable        ;; 06:4787 $21 $D0 $C5
    add  hl, bc                                   ;; 06:478A $09
    ld   [hl], $FF                                ;; 06:478B $36 $FF
    ld   de, SmasherSpriteVariants                ;; 06:478D $11 $7D $47
    call RenderActiveEntitySpritesPair            ;; 06:4790 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:4793 $CD $C6 $64
    call DecrementEntityIgnoreHitsCountdown       ;; 06:4796 $CD $56 $0C
    call label_3B70                               ;; 06:4799 $CD $70 $3B
    call UpdateEntityPosWithSpeed_06              ;; 06:479C $CD $41 $65
    call AddEntityZSpeedToPos_06                  ;; 06:479F $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:47A2 $21 $20 $C3
    add  hl, bc                                   ;; 06:47A5 $09
    dec  [hl]                                     ;; 06:47A6 $35
    dec  [hl]                                     ;; 06:47A7 $35
    ld   hl, wEntitiesPosZTable                   ;; 06:47A8 $21 $10 $C3
    add  hl, bc                                   ;; 06:47AB $09
    ld   a, [hl]                                  ;; 06:47AC $7E
    ldh  [hIndexOfObjectBelowLink], a             ;; 06:47AD $E0 $E9
    and  $80                                      ;; 06:47AF $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 06:47B1 $E0 $E8
    jr   z, jr_006_47DA                           ;; 06:47B3 $28 $25

    ld   [hl], b                                  ;; 06:47B5 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 06:47B6 $21 $20 $C3
    add  hl, bc                                   ;; 06:47B9 $09
    ld   a, [hl]                                  ;; 06:47BA $7E
    sra  a                                        ;; 06:47BB $CB $2F
    cpl                                           ;; 06:47BD $2F
    cp   $07                                      ;; 06:47BE $FE $07
    jr   nc, .jr_47C5                             ;; 06:47C0 $30 $03

    xor  a                                        ;; 06:47C2 $AF
    jr   jr_006_47C9                              ;; 06:47C3 $18 $04

.jr_47C5
    ld   a, JINGLE_BUMP                           ;; 06:47C5 $3E $09
    ldh  [hJingle], a                             ;; 06:47C7 $E0 $F2

jr_006_47C9:
    ld   [hl], a                                  ;; 06:47C9 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 06:47CA $21 $40 $C2
    add  hl, bc                                   ;; 06:47CD $09
    sra  [hl]                                     ;; 06:47CE $CB $2E
    sra  [hl]                                     ;; 06:47D0 $CB $2E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:47D2 $21 $50 $C2
    add  hl, bc                                   ;; 06:47D5 $09
    sra  [hl]                                     ;; 06:47D6 $CB $2E
    sra  [hl]                                     ;; 06:47D8 $CB $2E

jr_006_47DA:
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:47DA $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ;; 06:47DD $F0 $F0
    JP_TABLE                                      ;; 06:47DF
._00 dw func_006_47EA                             ;; 06:47E0
._01 dw func_006_4853                             ;; 06:47E2
._02 dw func_006_4854                             ;; 06:47E4
._03 dw func_006_4855                             ;; 06:47E6
._04 dw func_006_48DD                             ;; 06:47E8

func_006_47EA::
    ldh  a, [hMultiPurposeH]                      ;; 06:47EA $F0 $E9
    dec  a                                        ;; 06:47EC $3D
    and  $80                                      ;; 06:47ED $E6 $80
    jr   z, jr_006_4806                           ;; 06:47EF $28 $15

    ld   hl, wEntitiesSpeedYTable                 ;; 06:47F1 $21 $50 $C2
    call func_006_47FA                            ;; 06:47F4 $CD $FA $47
    ld   hl, wEntitiesSpeedXTable                 ;; 06:47F7 $21 $40 $C2

func_006_47FA::
    add  hl, bc                                   ;; 06:47FA $09
    ld   a, [hl]                                  ;; 06:47FB $7E
    and  a                                        ;; 06:47FC $A7
    jr   z, jr_006_4806                           ;; 06:47FD $28 $07

    and  $80                                      ;; 06:47FF $E6 $80
    jr   z, .jr_4805                              ;; 06:4801 $28 $02

    inc  [hl]                                     ;; 06:4803 $34
    inc  [hl]                                     ;; 06:4804 $34

.jr_4805
    dec  [hl]                                     ;; 06:4805 $35

jr_006_4806:
    call CheckLinkCollisionWithEnemy_trampoline   ;; 06:4806 $CD $5A $3B
    jr   nc, ret_006_4852                         ;; 06:4809 $30 $47

    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 06:480B $FA $9B $C1
    and  a                                        ;; 06:480E $A7
    jr   nz, ret_006_4852                         ;; 06:480F $20 $41

    ld   a, [wInventoryItems.BButtonSlot]         ;; 06:4811 $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 06:4814 $FE $03
    jr   nz, .checkAButtonSlot                    ;; 06:4816 $20 $08

    ldh  a, [hJoypadState]                        ;; 06:4818 $F0 $CC
    and  J_B                                      ;; 06:481A $E6 $20
    jr   nz, jr_006_482D                          ;; 06:481C $20 $0F

    jr   ret_006_4852                             ;; 06:481E $18 $32

.checkAButtonSlot
    ld   a, [wInventoryItems.AButtonSlot]         ;; 06:4820 $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 06:4823 $FE $03
    jr   nz, ret_006_4852                         ;; 06:4825 $20 $2B

    ldh  a, [hJoypadState]                        ;; 06:4827 $F0 $CC
    and  J_A                                      ;; 06:4829 $E6 $10
    jr   z, ret_006_4852                          ;; 06:482B $28 $25

jr_006_482D:
    ld   a, [wC3CF]                               ;; 06:482D $FA $CF $C3
    and  a                                        ;; 06:4830 $A7
    jr   nz, ret_006_4852                         ;; 06:4831 $20 $1F

    call IncrementEntityState                     ;; 06:4833 $CD $12 $3B
    ld   [hl], $02                                ;; 06:4836 $36 $02
    ld   hl, wEntitiesStatusTable                 ;; 06:4838 $21 $80 $C2
    add  hl, bc                                   ;; 06:483B $09
    ld   [hl], $07                                ;; 06:483C $36 $07
    ld   hl, wEntitiesLiftedTable                 ;; 06:483E $21 $90 $C4
    add  hl, bc                                   ;; 06:4841 $09
    ld   [hl], b                                  ;; 06:4842 $70
    ldh  a, [hLinkDirection]                      ;; 06:4843 $F0 $9E
    ld   [wC15D], a                               ;; 06:4845 $EA $5D $C1
    call GetEntityTransitionCountdown             ;; 06:4848 $CD $05 $0C
    ld   [hl], $02                                ;; 06:484B $36 $02
    ld   hl, hWaveSfx                             ;; 06:484D $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ;; 06:4850 $36 $02

ret_006_4852:
    ret                                           ;; 06:4852 $C9

func_006_4853::
    ret                                           ;; 06:4853 $C9

func_006_4854::
    ret                                           ;; 06:4854 $C9

func_006_4855::
    ld   a, [wD202]                               ;; 06:4855 $FA $02 $D2
    ld   e, a                                     ;; 06:4858 $5F
    ld   d, b                                     ;; 06:4859 $50
    ld   hl, wEntitiesPosXTable                   ;; 06:485A $21 $00 $C2
    add  hl, de                                   ;; 06:485D $19
    ldh  a, [hActiveEntityPosX]                   ;; 06:485E $F0 $EE
    sub  [hl]                                     ;; 06:4860 $96
    add  $0C                                      ;; 06:4861 $C6 $0C
    cp   $18                                      ;; 06:4863 $FE $18
    jp   nc, label_006_48DB                       ;; 06:4865 $D2 $DB $48

    ld   hl, wEntitiesPosYTable                   ;; 06:4868 $21 $10 $C2
    add  hl, de                                   ;; 06:486B $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:486C $F0 $EC
    sub  [hl]                                     ;; 06:486E $96
    add  $0C                                      ;; 06:486F $C6 $0C
    cp   $18                                      ;; 06:4871 $FE $18
    jr   nc, label_006_48DB                       ;; 06:4873 $30 $66

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 06:4875 $21 $10 $C4
    add  hl, de                                   ;; 06:4878 $19
    ld   [hl], $10                                ;; 06:4879 $36 $10
    ld   hl, wEntitiesFlashCountdownTable         ;; 06:487B $21 $20 $C4
    add  hl, de                                   ;; 06:487E $19
    ld   [hl], $20                                ;; 06:487F $36 $20
    ld   hl, wEntitiesSpeedXTable                 ;; 06:4881 $21 $40 $C2
    add  hl, bc                                   ;; 06:4884 $09
    ld   a, [hl]                                  ;; 06:4885 $7E
    push hl                                       ;; 06:4886 $E5
    ld   hl, wEntitiesRecoilVelocityX             ;; 06:4887 $21 $F0 $C3
    add  hl, de                                   ;; 06:488A $19
    ld   [hl], a                                  ;; 06:488B $77
    pop  hl                                       ;; 06:488C $E1
    cpl                                           ;; 06:488D $2F
    inc  a                                        ;; 06:488E $3C
    sra  a                                        ;; 06:488F $CB $2F
    ld   [hl], a                                  ;; 06:4891 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 06:4892 $21 $50 $C2
    add  hl, bc                                   ;; 06:4895 $09
    ld   a, [hl]                                  ;; 06:4896 $7E
    push hl                                       ;; 06:4897 $E5
    ld   hl, wEntitiesRecoilVelocityY             ;; 06:4898 $21 $00 $C4
    add  hl, de                                   ;; 06:489B $19
    ld   [hl], a                                  ;; 06:489C $77
    pop  hl                                       ;; 06:489D $E1
    cpl                                           ;; 06:489E $2F
    inc  a                                        ;; 06:489F $3C
    sra  a                                        ;; 06:48A0 $CB $2F
    ld   [hl], a                                  ;; 06:48A2 $77
    ld   a, WAVE_SFX_BOSS_HURT                    ;; 06:48A3 $3E $07
    ldh  [hWaveSfx], a                            ;; 06:48A5 $E0 $F3
    ld   hl, wEntitiesHealthTable                 ;; 06:48A7 $21 $60 $C3
    add  hl, de                                   ;; 06:48AA $19
    ld   a, [hl]                                  ;; 06:48AB $7E
    sub  $02                                      ;; 06:48AC $D6 $02
    ld   [hl], a                                  ;; 06:48AE $77
    dec  a                                        ;; 06:48AF $3D
    and  $80                                      ;; 06:48B0 $E6 $80
    jr   z, .jr_48D7                              ;; 06:48B2 $28 $23

    ld   hl, wEntitiesStatusTable                 ;; 06:48B4 $21 $80 $C2
    add  hl, de                                   ;; 06:48B7 $19
    ld   [hl], $01                                ;; 06:48B8 $36 $01
    ld   hl, wEntitiesStatusTable                 ;; 06:48BA $21 $80 $C2
    add  hl, bc                                   ;; 06:48BD $09
    ld   [hl], $01                                ;; 06:48BE $36 $01
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 06:48C0 $21 $80 $C4
    add  hl, bc                                   ;; 06:48C3 $09
    ld   [hl], $1F                                ;; 06:48C4 $36 $1F
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:48C6 $21 $40 $C3
    add  hl, bc                                   ;; 06:48C9 $09
    ld   a, [hl]                                  ;; 06:48CA $7E
    ld   [hl], $04                                ;; 06:48CB $36 $04
    ld   hl, wEntitiesOptions1Table               ;; 06:48CD $21 $30 $C4
    add  hl, bc                                   ;; 06:48D0 $09
    res  ENTITY_OPT1_B_IS_BOSS, [hl]              ;; 06:48D1 $CB $BE
    ld   a, WAVE_SFX_BOSS_DEATH_CRY               ;; 06:48D3 $3E $10
    ldh  [hWaveSfx], a                            ;; 06:48D5 $E0 $F3

.jr_48D7
    call IncrementEntityState                     ;; 06:48D7 $CD $12 $3B
    ld   [hl], b                                  ;; 06:48DA $70

label_006_48DB:
    jr   jr_006_48EC                              ;; 06:48DB $18 $0F

func_006_48DD::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:48DD $21 $40 $C3
    add  hl, bc                                   ;; 06:48E0 $09
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 06:48E1 $36 $12
    call label_3B44                               ;; 06:48E3 $CD $44 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:48E6 $21 $40 $C3
    add  hl, bc                                   ;; 06:48E9 $09
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_SHADOW ;; 06:48EA $36 $92

jr_006_48EC:
    ldh  a, [hMultiPurposeG]                      ;; 06:48EC $F0 $E8
    and  a                                        ;; 06:48EE $A7
    jr   nz, jr_006_490C                          ;; 06:48EF $20 $1B

    ld   hl, wEntitiesCollisionsTable             ;; 06:48F1 $21 $A0 $C2
    add  hl, bc                                   ;; 06:48F4 $09
    ld   a, [hl]                                  ;; 06:48F5 $7E
    and  a                                        ;; 06:48F6 $A7
    jr   z, ret_006_4910                          ;; 06:48F7 $28 $17

    and  $03                                      ;; 06:48F9 $E6 $03
    jr   z, .jr_4902                              ;; 06:48FB $28 $05

    ld   hl, wEntitiesSpeedXTable                 ;; 06:48FD $21 $40 $C2
    jr   jr_006_4905                              ;; 06:4900 $18 $03

.jr_4902
    ld   hl, wEntitiesSpeedYTable                 ;; 06:4902 $21 $50 $C2

jr_006_4905:
    add  hl, bc                                   ;; 06:4905 $09
    ld   a, [hl]                                  ;; 06:4906 $7E
    cpl                                           ;; 06:4907 $2F
    inc  a                                        ;; 06:4908 $3C
    sra  a                                        ;; 06:4909 $CB $2F
    ld   [hl], a                                  ;; 06:490B $77

jr_006_490C:
    call IncrementEntityState                     ;; 06:490C $CD $12 $3B
    ld   [hl], b                                  ;; 06:490F $70

ret_006_4910:
    ret                                           ;; 06:4910 $C9
