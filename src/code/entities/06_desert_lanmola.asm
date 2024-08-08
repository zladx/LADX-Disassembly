Data_006_55E3::
    db   $00, $04

Data_006_55E5::
    db   $FC, $08, $F8

DesertLanmolaEntityHandler::
    ld   hl, wEntitiesPrivateState3Table          ;; 06:55E8 $21 $D0 $C2
    add  hl, bc                                   ;; 06:55EB $09
    ld   a, [hl]                                  ;; 06:55EC $7E
    cp   $02                                      ;; 06:55ED $FE $02
    jp   z, label_006_5988                        ;; 06:55EF $CA $88 $59

    cp   $00                                      ;; 06:55F2 $FE $00
    jr   nz, jr_006_5611                          ;; 06:55F4 $20 $1B

    inc  [hl]                                     ;; 06:55F6 $34
    ld   a, MUSIC_MINIBOSS                        ;; 06:55F7 $3E $50
    ldh  [hDefaultMusicTrack], a                  ;; 06:55F9 $E0 $B0
    ld   hl, wEntitiesPosZTable                   ;; 06:55FB $21 $10 $C3
    add  hl, bc                                   ;; 06:55FE $09
    ld   [hl], $FF                                ;; 06:55FF $36 $FF
    call GetEntityTransitionCountdown             ;; 06:5601 $CD $05 $0C
    ld   [hl], $50                                ;; 06:5604 $36 $50
    ld   e, $00                                   ;; 06:5606 $1E $00
    ld   a, $FF                                   ;; 06:5608 $3E $FF
    ld   hl, wD200                                ;; 06:560A $21 $00 $D2

.loop_560D
    ld   [hl+], a                                 ;; 06:560D $22
    dec  e                                        ;; 06:560E $1D
    jr   nz, .loop_560D                           ;; 06:560F $20 $FC

jr_006_5611:
    call func_006_58C9                            ;; 06:5611 $CD $C9 $58
    ldh  a, [hActiveEntityStatus]                 ;; 06:5614 $F0 $EA
    cp   $01                                      ;; 06:5616 $FE $01
    jp   nz, label_006_56C8                       ;; 06:5618 $C2 $C8 $56

    ld   hl, wEntitiesPrivateState2Table          ;; 06:561B $21 $C0 $C2
    add  hl, bc                                   ;; 06:561E $09
    ld   a, [hl]                                  ;; 06:561F $7E
    JP_TABLE                                      ;; 06:5620
._00 dw func_006_5629                             ;; 06:5621
._01 dw func_006_563A                             ;; 06:5623
._02 dw func_006_564B                             ;; 06:5625
._03 dw func_006_56C7                             ;; 06:5627

func_006_5629::
    ld   hl, wEntitiesFlashCountdownTable         ;; 06:5629 $21 $20 $C4
    add  hl, bc                                   ;; 06:562C $09
    ld   [hl], $FF                                ;; 06:562D $36 $FF
    call GetEntityTransitionCountdown             ;; 06:562F $CD $05 $0C
    ld   [hl], $60                                ;; 06:5632 $36 $60

IncrementEntityPrivateState2::
    ld   hl, wEntitiesPrivateState2Table          ;; 06:5634 $21 $C0 $C2
    add  hl, bc                                   ;; 06:5637 $09
    inc  [hl]                                     ;; 06:5638 $34
    ret                                           ;; 06:5639 $C9

func_006_563A::
    call GetEntityTransitionCountdown             ;; 06:563A $CD $05 $0C
    jr   nz, .ret_564A                            ;; 06:563D $20 $0B

    ld   [hl], $CF                                ;; 06:563F $36 $CF
    call IncrementEntityPrivateState2             ;; 06:5641 $CD $34 $56
    ld   hl, wEntitiesPrivateState4Table          ;; 06:5644 $21 $40 $C4
    add  hl, bc                                   ;; 06:5647 $09
    ld   [hl], $05                                ;; 06:5648 $36 $05

.ret_564A
    ret                                           ;; 06:564A $C9

func_006_564B::
    call GetEntityTransitionCountdown             ;; 06:564B $CD $05 $0C
    jr   nz, .jr_568A                             ;; 06:564E $20 $3A

    call label_27DD                               ;; 06:5650 $CD $DD $27
    ld   a, ENTITY_KEY_DROP_POINT                 ;; 06:5653 $3E $30
    call SpawnNewEntity_trampoline                ;; 06:5655 $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:5658 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 06:565A $21 $00 $C2
    add  hl, de                                   ;; 06:565D $19
    ld   [hl], a                                  ;; 06:565E $77
    ldh  a, [hMultiPurpose1]                      ;; 06:565F $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 06:5661 $21 $10 $C2
    add  hl, de                                   ;; 06:5664 $19
    ld   [hl], a                                  ;; 06:5665 $77
    ldh  a, [hMultiPurpose3]                      ;; 06:5666 $F0 $DA
    ld   hl, wEntitiesPosZTable                   ;; 06:5668 $21 $10 $C3
    add  hl, de                                   ;; 06:566B $19
    ld   [hl], a                                  ;; 06:566C $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 06:566D $21 $B0 $C3
    add  hl, de                                   ;; 06:5670 $19
    ld   [hl], $02                                ;; 06:5671 $36 $02
    ld   hl, wEntitiesSpeedZTable                 ;; 06:5673 $21 $20 $C3
    add  hl, de                                   ;; 06:5676 $19
    ld   [hl], $10                                ;; 06:5677 $36 $10
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 06:5679 $21 $F0 $C2
    add  hl, de                                   ;; 06:567C $19
    ld   [hl], $10                                ;; 06:567D $36 $10
    call ClearEntityStatus_06                     ;; 06:567F $CD $DB $65
    ldh  a, [hActiveEntityPosX]                   ;; 06:5682 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 06:5684 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:5686 $F0 $EC
    jr   jr_006_56BB                              ;; 06:5688 $18 $31

.jr_568A
    and  $1F                                      ;; 06:568A $E6 $1F
    jr   nz, ret_006_56C6                         ;; 06:568C $20 $38

    ld   hl, wEntitiesInertiaTable                ;; 06:568E $21 $D0 $C3
    add  hl, bc                                   ;; 06:5691 $09
    ld   a, [hl]                                  ;; 06:5692 $7E
    ld   hl, wEntitiesPrivateState4Table          ;; 06:5693 $21 $40 $C4
    add  hl, bc                                   ;; 06:5696 $09
    ld   e, [hl]                                  ;; 06:5697 $5E
    dec  [hl]                                     ;; 06:5698 $35
    ld   d, b                                     ;; 06:5699 $50
    ld   hl, Data_006_58C3                        ;; 06:569A $21 $C3 $58
    add  hl, de                                   ;; 06:569D $19
    sub  [hl]                                     ;; 06:569E $96
    ld   e, a                                     ;; 06:569F $5F
    ld   d, b                                     ;; 06:56A0 $50
    ld   hl, wIsFileSelectionArrowShifted         ;; 06:56A1 $21 $00 $D0
    add  hl, de                                   ;; 06:56A4 $19
    ld   a, [hl]                                  ;; 06:56A5 $7E
    ldh  [hMultiPurpose0], a                      ;; 06:56A6 $E0 $D7
    ld   hl, wD200                                ;; 06:56A8 $21 $00 $D2
    add  hl, de                                   ;; 06:56AB $19
    ld   a, [hl]                                  ;; 06:56AC $7E
    and  $80                                      ;; 06:56AD $E6 $80
    jr   nz, ret_006_56C6                         ;; 06:56AF $20 $15

    push hl                                       ;; 06:56B1 $E5
    ld   hl, wD100                                ;; 06:56B2 $21 $00 $D1
    add  hl, de                                   ;; 06:56B5 $19
    ld   a, [hl]                                  ;; 06:56B6 $7E
    pop  hl                                       ;; 06:56B7 $E1
    sub  [hl]                                     ;; 06:56B8 $96
    ld   [hl], $FF                                ;; 06:56B9 $36 $FF

jr_006_56BB:
    ldh  [hMultiPurpose1], a                      ;; 06:56BB $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 06:56BD $3E $02
    call AddTranscientVfx                         ;; 06:56BF $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ;; 06:56C2 $3E $13
    ldh  [hNoiseSfx], a                           ;; 06:56C4 $E0 $F4

ret_006_56C6:
    ret                                           ;; 06:56C6 $C9

func_006_56C7::
    ret                                           ;; 06:56C7 $C9

label_006_56C8:
    call ReturnIfNonInteractive_06                ;; 06:56C8 $CD $C6 $64
    call BossIntro                                ;; 06:56CB $CD $E8 $3E
    call GetEntityPrivateCountdown1               ;; 06:56CE $CD $00 $0C
    jr   z, jr_006_5726                           ;; 06:56D1 $28 $53

    and  $0F                                      ;; 06:56D3 $E6 $0F
    jr   nz, jr_006_5726                          ;; 06:56D5 $20 $4F

    ld   a, $02                                   ;; 06:56D7 $3E $02

.loop_56D9
    ldh  [hMultiPurposeG], a                      ;; 06:56D9 $E0 $E8
    ld   a, ENTITY_DESERT_LANMOLA                 ;; 06:56DB $3E $87
    call SpawnNewEntity_trampoline                ;; 06:56DD $CD $86 $3B
    jr   c, jr_006_5726                           ;; 06:56E0 $38 $44

    push bc                                       ;; 06:56E2 $C5
    ldh  a, [hMultiPurposeG]                      ;; 06:56E3 $F0 $E8
    ld   c, a                                     ;; 06:56E5 $4F
    ld   hl, wEntitiesSpriteVariantTable          ;; 06:56E6 $21 $B0 $C3
    add  hl, de                                   ;; 06:56E9 $19
    and  $02                                      ;; 06:56EA $E6 $02
    ld   [hl], a                                  ;; 06:56EC $77
    ld   a, [wC1CD]                               ;; 06:56ED $FA $CD $C1
    ld   hl, Data_006_55E3                        ;; 06:56F0 $21 $E3 $55
    add  hl, bc                                   ;; 06:56F3 $09
    add  [hl]                                     ;; 06:56F4 $86
    ld   hl, wEntitiesPosXTable                   ;; 06:56F5 $21 $00 $C2
    add  hl, de                                   ;; 06:56F8 $19
    ld   [hl], a                                  ;; 06:56F9 $77
    ld   hl, Data_006_55E5                        ;; 06:56FA $21 $E5 $55
    add  hl, bc                                   ;; 06:56FD $09
    ld   a, [hl]                                  ;; 06:56FE $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:56FF $21 $40 $C2
    add  hl, de                                   ;; 06:5702 $19
    ld   [hl], a                                  ;; 06:5703 $77
    ld   a, [wC1CE]                               ;; 06:5704 $FA $CE $C1
    add  $00                                      ;; 06:5707 $C6 $00
    ld   hl, wEntitiesPosYTable                   ;; 06:5709 $21 $10 $C2
    add  hl, de                                   ;; 06:570C $19
    ld   [hl], a                                  ;; 06:570D $77
    ld   hl, wEntitiesSpeedYTable                 ;; 06:570E $21 $50 $C2
    add  hl, de                                   ;; 06:5711 $19
    ld   [hl], $F0                                ;; 06:5712 $36 $F0
    ld   hl, wEntitiesPrivateState3Table          ;; 06:5714 $21 $D0 $C2
    add  hl, de                                   ;; 06:5717 $19
    ld   [hl], $02                                ;; 06:5718 $36 $02
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:571A $21 $40 $C3
    add  hl, de                                   ;; 06:571D $19
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 06:571E $36 $C1
    pop  bc                                       ;; 06:5720 $C1
    ldh  a, [hMultiPurposeG]                      ;; 06:5721 $F0 $E8
    dec  a                                        ;; 06:5723 $3D
    jr   nz, .loop_56D9                           ;; 06:5724 $20 $B3

jr_006_5726:
    call func_006_594C                            ;; 06:5726 $CD $4C $59
    call DecrementEntityIgnoreHitsCountdown       ;; 06:5729 $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ;; 06:572C $F0 $F0
    cp   $02                                      ;; 06:572E $FE $02
    jr   c, .jr_5754                              ;; 06:5730 $38 $22

    ld   hl, wEntitiesInertiaTable                ;; 06:5732 $21 $D0 $C3
    add  hl, bc                                   ;; 06:5735 $09
    ld   a, [hl]                                  ;; 06:5736 $7E
    inc  [hl]                                     ;; 06:5737 $34
    and  $FF                                      ;; 06:5738 $E6 $FF
    ld   e, a                                     ;; 06:573A $5F
    ld   d, b                                     ;; 06:573B $50
    ld   hl, wIsFileSelectionArrowShifted         ;; 06:573C $21 $00 $D0
    add  hl, de                                   ;; 06:573F $19
    ldh  a, [hActiveEntityPosX]                   ;; 06:5740 $F0 $EE
    ld   [hl], a                                  ;; 06:5742 $77
    ld   hl, wD100                                ;; 06:5743 $21 $00 $D1
    add  hl, de                                   ;; 06:5746 $19
    ldh  a, [hActiveEntityPosY]                   ;; 06:5747 $F0 $EF
    ld   [hl], a                                  ;; 06:5749 $77
    ld   hl, wEntitiesPosZTable                   ;; 06:574A $21 $10 $C3
    add  hl, bc                                   ;; 06:574D $09
    ld   a, [hl]                                  ;; 06:574E $7E
    ld   hl, wD200                                ;; 06:574F $21 $00 $D2
    add  hl, de                                   ;; 06:5752 $19
    ld   [hl], a                                  ;; 06:5753 $77

.jr_5754
    ldh  a, [hActiveEntityState]                  ;; 06:5754 $F0 $F0
    JP_TABLE                                      ;; 06:5756
._00 dw func_006_5773                             ;; 06:5757
._01 dw func_006_57A8                             ;; 06:5759
._02 dw func_006_57ED                             ;; 06:575B
._03 dw func_006_580C                             ;; 06:575D
._04 dw func_006_5835                             ;; 06:575F
._05 dw DesertLanmolaSpriteVariants               ;; 06:5761

Data_006_5763::
    db   $28, $38, $48, $58, $68, $78, $88, $28

Data_006_576B::
    db   $30, $40, $50, $60, $70, $30, $40, $50

func_006_5773::
    call GetEntityTransitionCountdown             ;; 06:5773 $CD $05 $0C
    ret  nz                                       ;; 06:5776 $C0

    call GetEntityTransitionCountdown             ;; 06:5777 $CD $05 $0C
    ld   [hl], $18                                ;; 06:577A $36 $18
    call GetRandomByte                            ;; 06:577C $CD $0D $28
    and  $07                                      ;; 06:577F $E6 $07
    ld   e, a                                     ;; 06:5781 $5F
    ld   d, b                                     ;; 06:5782 $50
    ld   hl, Data_006_5763                        ;; 06:5783 $21 $63 $57
    add  hl, de                                   ;; 06:5786 $19
    ld   a, [hl]                                  ;; 06:5787 $7E
    ld   hl, wEntitiesPosXTable                   ;; 06:5788 $21 $00 $C2
    add  hl, bc                                   ;; 06:578B $09
    ld   [hl], a                                  ;; 06:578C $77
    call GetRandomByte                            ;; 06:578D $CD $0D $28
    and  $07                                      ;; 06:5790 $E6 $07
    ld   e, a                                     ;; 06:5792 $5F
    ld   hl, Data_006_576B                        ;; 06:5793 $21 $6B $57
    add  hl, de                                   ;; 06:5796 $19
    ld   a, [hl]                                  ;; 06:5797 $7E
    ld   hl, wEntitiesPosYTable                   ;; 06:5798 $21 $10 $C2
    add  hl, bc                                   ;; 06:579B $09

.jr_579C
    ld   [hl], a                                  ;; 06:579C $77

.jr_579D
    ld   hl, wEntitiesPosZTable                   ;; 06:579D $21 $10 $C3
    add  hl, bc                                   ;; 06:57A0 $09
    ld   [hl], b                                  ;; 06:57A1 $70
    call CopyEntityPositionToActivePosition       ;; 06:57A2 $CD $8A $3D
    jp   IncrementEntityState                     ;; 06:57A5 $C3 $12 $3B

func_006_57A8::
    call GetEntityTransitionCountdown             ;; 06:57A8 $CD $05 $0C
    jr   nz, jr_006_57E0                          ;; 06:57AB $20 $33

    ld   [hl], $20                                ;; 06:57AD $36 $20
    ldh  a, [hLinkPositionX]                      ;; 06:57AF $F0 $98
    push af                                       ;; 06:57B1 $F5

.jr_57B2
    ldh  a, [hLinkPositionY]                      ;; 06:57B2 $F0 $99
    push af                                       ;; 06:57B4 $F5
    ld   a, $58                                   ;; 06:57B5 $3E $58
    ldh  [hLinkPositionX], a                      ;; 06:57B7 $E0 $98
    ld   a, $50                                   ;; 06:57B9 $3E $50
    ldh  [hLinkPositionY], a                      ;; 06:57BB $E0 $99
    ld   a, $08                                   ;; 06:57BD $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 06:57BF $CD $AA $3B
    pop  af                                       ;; 06:57C2 $F1
    ldh  [hLinkPositionY], a                      ;; 06:57C3 $E0 $99
    pop  af                                       ;; 06:57C5 $F1
    ldh  [hLinkPositionX], a                      ;; 06:57C6 $E0 $98
    ld   hl, wEntitiesSpeedZTable                 ;; 06:57C8 $21 $20 $C3
    add  hl, bc                                   ;; 06:57CB $09
    ld   [hl], $08                                ;; 06:57CC $36 $08
    ldh  a, [hActiveEntityPosX]                   ;; 06:57CE $F0 $EE
    ld   [wC1CD], a                               ;; 06:57D0 $EA $CD $C1
    ldh  a, [hActiveEntityPosY]                   ;; 06:57D3 $F0 $EF
    ld   [wC1CE], a                               ;; 06:57D5 $EA $CE $C1
    call GetEntityPrivateCountdown1               ;; 06:57D8 $CD $00 $0C
    ld   [hl], $61                                ;; 06:57DB $36 $61
    call IncrementEntityState                     ;; 06:57DD $CD $12 $3B

jr_006_57E0:
    ldh  a, [hFrameCounter]                       ;; 06:57E0 $F0 $E7
    rra                                           ;; 06:57E2 $1F
    rra                                           ;; 06:57E3 $1F
    rra                                           ;; 06:57E4 $1F
    rra                                           ;; 06:57E5 $1F
    and  $01                                      ;; 06:57E6 $E6 $01
    add  $05                                      ;; 06:57E8 $C6 $05
    jp   SetEntitySpriteVariant                   ;; 06:57EA $C3 $0C $3B

func_006_57ED::
    call GetEntityTransitionCountdown             ;; 06:57ED $CD $05 $0C
    jr   nz, .jr_5803                             ;; 06:57F0 $20 $11

    call GetRandomByte                            ;; 06:57F2 $CD $0D $28
    and  $1F                                      ;; 06:57F5 $E6 $1F
    add  $20                                      ;; 06:57F7 $C6 $20
    ld   [hl], a                                  ;; 06:57F9 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 06:57FA $21 $B0 $C2
    add  hl, bc                                   ;; 06:57FD $09
    ld   [hl], $20                                ;; 06:57FE $36 $20
    call IncrementEntityState                     ;; 06:5800 $CD $12 $3B

.jr_5803
    call UpdateEntityPosWithSpeed_06              ;; 06:5803 $CD $41 $65
    call AddEntityZSpeedToPos_06                  ;; 06:5806 $CD $7A $65
    jp   DefaultEnemyDamageCollisionHandler_trampoline ;; 06:5809 $C3 $39 $3B

func_006_580C::
    call GetEntityTransitionCountdown             ;; 06:580C $CD $05 $0C
    jr   nz, .jr_5816                             ;; 06:580F $20 $05

    ld   [hl], $80                                ;; 06:5811 $36 $80
    call IncrementEntityState                     ;; 06:5813 $CD $12 $3B

.jr_5816
    ld   hl, wEntitiesPrivateState1Table          ;; 06:5816 $21 $B0 $C2
    add  hl, bc                                   ;; 06:5819 $09
    ld   a, [hl]                                  ;; 06:581A $7E
    inc  [hl]                                     ;; 06:581B $34
    ld   a, [hl]                                  ;; 06:581C $7E
    bit  0, a                                     ;; 06:581D $CB $47
    jr   nz, jr_006_582C                          ;; 06:581F $20 $0B

    ld   hl, wEntitiesSpeedZTable                 ;; 06:5821 $21 $20 $C3
    add  hl, bc                                   ;; 06:5824 $09
    and  $20                                      ;; 06:5825 $E6 $20
    jr   nz, .jr_582B                             ;; 06:5827 $20 $02

    inc  [hl]                                     ;; 06:5829 $34
    inc  [hl]                                     ;; 06:582A $34

.jr_582B
    dec  [hl]                                     ;; 06:582B $35

jr_006_582C:
    call UpdateEntityPosWithSpeed_06              ;; 06:582C $CD $41 $65
    call AddEntityZSpeedToPos_06                  ;; 06:582F $CD $7A $65
    jp   DefaultEnemyDamageCollisionHandler_trampoline ;; 06:5832 $C3 $39 $3B

func_006_5835::
    call GetEntityTransitionCountdown             ;; 06:5835 $CD $05 $0C
    jr   nz, .jr_5841                             ;; 06:5838 $20 $07

    ld   [hl], $60                                ;; 06:583A $36 $60
    call IncrementEntityState                     ;; 06:583C $CD $12 $3B
    ld   [hl], b                                  ;; 06:583F $70
    ret                                           ;; 06:5840 $C9

.jr_5841
    cp   $78                                      ;; 06:5841 $FE $78
    jr   nz, .jr_5858                             ;; 06:5843 $20 $13

    ldh  a, [hActiveEntityPosX]                   ;; 06:5845 $F0 $EE
    ld   [wC1CD], a                               ;; 06:5847 $EA $CD $C1
    ldh  a, [hActiveEntityPosY]                   ;; 06:584A $F0 $EF
    ld   [wC1CE], a                               ;; 06:584C $EA $CE $C1
    call GetEntityPrivateCountdown1               ;; 06:584F $CD $00 $0C
    ld   [hl], $60                                ;; 06:5852 $36 $60
    ld   a, NOISE_SFX_LANMOLA_BURROW              ;; 06:5854 $3E $23
    ldh  [hNoiseSfx], a                           ;; 06:5856 $E0 $F4

.jr_5858
    ld   hl, wEntitiesSpeedZTable                 ;; 06:5858 $21 $20 $C3
    add  hl, bc                                   ;; 06:585B $09
    ld   a, [hl]                                  ;; 06:585C $7E
    sub  $F4                                      ;; 06:585D $D6 $F4
    and  $80                                      ;; 06:585F $E6 $80
    jr   nz, .jr_5864                             ;; 06:5861 $20 $01

    dec  [hl]                                     ;; 06:5863 $35

.jr_5864
    ldh  a, [hFrameCounter]                       ;; 06:5864 $F0 $E7
    and  $07                                      ;; 06:5866 $E6 $07
    jr   nz, jr_006_5888                          ;; 06:5868 $20 $1E

    ld   hl, wEntitiesSpeedXTable                 ;; 06:586A $21 $40 $C2
    add  hl, bc                                   ;; 06:586D $09
    ld   a, [hl]                                  ;; 06:586E $7E
    and  a                                        ;; 06:586F $A7
    jr   z, jr_006_5879                           ;; 06:5870 $28 $07

    and  $80                                      ;; 06:5872 $E6 $80
    jr   z, .jr_5878                              ;; 06:5874 $28 $02

    inc  [hl]                                     ;; 06:5876 $34
    inc  [hl]                                     ;; 06:5877 $34

.jr_5878
    dec  [hl]                                     ;; 06:5878 $35

jr_006_5879:
    ld   hl, wEntitiesSpeedYTable                 ;; 06:5879 $21 $50 $C2
    add  hl, bc                                   ;; 06:587C $09
    ld   a, [hl]                                  ;; 06:587D $7E
    and  a                                        ;; 06:587E $A7
    jr   z, jr_006_5888                           ;; 06:587F $28 $07

    and  $80                                      ;; 06:5881 $E6 $80
    jr   z, .jr_5887                              ;; 06:5883 $28 $02

    inc  [hl]                                     ;; 06:5885 $34
    inc  [hl]                                     ;; 06:5886 $34

.jr_5887
    dec  [hl]                                     ;; 06:5887 $35

jr_006_5888:
    call UpdateEntityPosWithSpeed_06              ;; 06:5888 $CD $41 $65
    call AddEntityZSpeedToPos_06                  ;; 06:588B $CD $7A $65
    ld   hl, wEntitiesPosZTable                   ;; 06:588E $21 $10 $C3
    add  hl, bc                                   ;; 06:5891 $09
    ld   a, [hl]                                  ;; 06:5892 $7E
    and  $80                                      ;; 06:5893 $E6 $80
    jr   nz, .jr_589A                             ;; 06:5895 $20 $03

    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:5897 $CD $39 $3B

.jr_589A
    ld   a, $02                                   ;; 06:589A $3E $02
    jp   SetEntitySpriteVariant                   ;; 06:589C $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
DesertLanmolaSpriteVariants::
.variant0
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0
    db $74, OAM_GBC_PAL_3 | OAMF_PAL0
.variant1
    db $74, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant4
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant6
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_YFLIP
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant8
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

Data_006_58C3::
    db   $0C, $18, $24, $30, $3C, $48

func_006_58C9::
    ld   hl, wEntitiesPosZTable                   ;; 06:58C9 $21 $10 $C3
    add  hl, bc                                   ;; 06:58CC $09
    ld   a, [hl]                                  ;; 06:58CD $7E
    and  $80                                      ;; 06:58CE $E6 $80
    jr   nz, .jr_58D8                             ;; 06:58D0 $20 $06

    ld   de, DesertLanmolaSpriteVariants          ;; 06:58D2 $11 $9F $58
    call RenderActiveEntitySpritesPair            ;; 06:58D5 $CD $C0 $3B

.jr_58D8
    ld   hl, wEntitiesInertiaTable                ;; 06:58D8 $21 $D0 $C3
    add  hl, bc                                   ;; 06:58DB $09
    ld   a, [hl]                                  ;; 06:58DC $7E
    ldh  [hMultiPurpose0], a                      ;; 06:58DD $E0 $D7
    ldh  a, [hFrameCounter]                       ;; 06:58DF $F0 $E7
    and  $01                                      ;; 06:58E1 $E6 $01
    jr   z, .jr_58ED                              ;; 06:58E3 $28 $08

    ld   a, $06                                   ;; 06:58E5 $3E $06
    ldh  [hIndexOfObjectBelowLink], a             ;; 06:58E7 $E0 $E9
    ld   a, $00                                   ;; 06:58E9 $3E $00
    jr   jr_006_58F3                              ;; 06:58EB $18 $06

.jr_58ED
    ld   a, $FF                                   ;; 06:58ED $3E $FF
    ldh  [hIndexOfObjectBelowLink], a             ;; 06:58EF $E0 $E9
    ld   a, $05                                   ;; 06:58F1 $3E $05

jr_006_58F3:
    ldh  [hMultiPurposeG], a                      ;; 06:58F3 $E0 $E8
    ld   e, a                                     ;; 06:58F5 $5F
    ld   d, b                                     ;; 06:58F6 $50
    ld   hl, Data_006_58C3                        ;; 06:58F7 $21 $C3 $58
    add  hl, de                                   ;; 06:58FA $19
    ldh  a, [hMultiPurpose0]                      ;; 06:58FB $F0 $D7
    sub  [hl]                                     ;; 06:58FD $96
    and  $FF                                      ;; 06:58FE $E6 $FF
    ld   e, a                                     ;; 06:5900 $5F
    ld   d, $00                                   ;; 06:5901 $16 $00
    ld   hl, wIsFileSelectionArrowShifted         ;; 06:5903 $21 $00 $D0
    add  hl, de                                   ;; 06:5906 $19
    ld   a, [hl]                                  ;; 06:5907 $7E
    ldh  [hActiveEntityPosX], a                   ;; 06:5908 $E0 $EE
    ld   hl, wD100                                ;; 06:590A $21 $00 $D1
    add  hl, de                                   ;; 06:590D $19
    ld   a, [hl]                                  ;; 06:590E $7E
    ldh  [hActiveEntityPosY], a                   ;; 06:590F $E0 $EF
    ld   hl, wD200                                ;; 06:5911 $21 $00 $D2
    add  hl, de                                   ;; 06:5914 $19
    sub  [hl]                                     ;; 06:5915 $96
    ldh  [hActiveEntityVisualPosY], a             ;; 06:5916 $E0 $EC
    ld   a, [hl]                                  ;; 06:5918 $7E
    and  $80                                      ;; 06:5919 $E6 $80
    jr   nz, jr_006_5936                          ;; 06:591B $20 $19

    ldh  a, [hMultiPurposeG]                      ;; 06:591D $F0 $E8
    cp   $05                                      ;; 06:591F $FE $05
    ld   a, $04                                   ;; 06:5921 $3E $04
    jr   nz, .jr_592E                             ;; 06:5923 $20 $09

    ldh  a, [hFrameCounter]                       ;; 06:5925 $F0 $E7
    rra                                           ;; 06:5927 $1F
    rra                                           ;; 06:5928 $1F
    rra                                           ;; 06:5929 $1F
    and  $01                                      ;; 06:592A $E6 $01
    add  $07                                      ;; 06:592C $C6 $07

.jr_592E
    ldh  [hActiveEntitySpriteVariant], a          ;; 06:592E $E0 $F1
    ld   de, DesertLanmolaSpriteVariants          ;; 06:5930 $11 $9F $58
    call RenderActiveEntitySpritesPair            ;; 06:5933 $CD $C0 $3B

jr_006_5936:
    ld   e, $FF                                   ;; 06:5936 $1E $FF
    ldh  a, [hFrameCounter]                       ;; 06:5938 $F0 $E7
    and  $01                                      ;; 06:593A $E6 $01
    jr   z, .jr_5940                              ;; 06:593C $28 $02

    ld   e, $01                                   ;; 06:593E $1E $01

.jr_5940
    ld   hl, hIndexOfObjectBelowLink              ;; 06:5940 $21 $E9 $FF
    ldh  a, [hMultiPurposeG]                      ;; 06:5943 $F0 $E8
    add  e                                        ;; 06:5945 $83
    cp   [hl]                                     ;; 06:5946 $BE
    jr   nz, jr_006_58F3                          ;; 06:5947 $20 $AA

    jp   CopyEntityPositionToActivePosition       ;; 06:5949 $C3 $8A $3D

func_006_594C::
    ld   hl, wEntitiesSpeedXTable                 ;; 06:594C $21 $40 $C2
    add  hl, bc                                   ;; 06:594F $09
    ld   a, [hl]                                  ;; 06:5950 $7E
    ld   d, a                                     ;; 06:5951 $57
    bit  7, a                                     ;; 06:5952 $CB $7F
    jr   z, .jr_5958                              ;; 06:5954 $28 $02

    cpl                                           ;; 06:5956 $2F
    inc  a                                        ;; 06:5957 $3C

.jr_5958
    ld   e, a                                     ;; 06:5958 $5F
    ld   hl, wEntitiesSpeedYTable                 ;; 06:5959 $21 $50 $C2
    add  hl, bc                                   ;; 06:595C $09
    ld   a, [hl]                                  ;; 06:595D $7E
    bit  7, a                                     ;; 06:595E $CB $7F
    jr   z, .jr_5964                              ;; 06:5960 $28 $02

    cpl                                           ;; 06:5962 $2F
    inc  a                                        ;; 06:5963 $3C

.jr_5964
    cp   e                                        ;; 06:5964 $BB
    jr   nc, jr_006_5973                          ;; 06:5965 $30 $0C

    bit  7, d                                     ;; 06:5967 $CB $7A
    jr   nz, .jr_596F                             ;; 06:5969 $20 $04

    ld   a, $01                                   ;; 06:596B $3E $01
    jr   jr_006_597D                              ;; 06:596D $18 $0E

.jr_596F
    ld   a, $00                                   ;; 06:596F $3E $00
    jr   jr_006_597D                              ;; 06:5971 $18 $0A

jr_006_5973:
    bit  7, [hl]                                  ;; 06:5973 $CB $7E
    jr   nz, .jr_597B                             ;; 06:5975 $20 $04

    ld   a, $02                                   ;; 06:5977 $3E $02
    jr   jr_006_597D                              ;; 06:5979 $18 $02

.jr_597B
    ld   a, $03                                   ;; 06:597B $3E $03

jr_006_597D:
    jp   SetEntitySpriteVariant                   ;; 06:597D $C3 $0C $3B

Data_006_5980::
    db   $7C, $21, $7E, $21, $7C, $01, $7E, $01

label_006_5988:
    ld   de, Data_006_5980                        ;; 06:5988 $11 $80 $59
    call RenderActiveEntitySprite                 ;; 06:598B $CD $77 $3C
    call ReturnIfNonInteractive_06                ;; 06:598E $CD $C6 $64
    call UpdateEntityPosWithSpeed_06              ;; 06:5991 $CD $41 $65
    ld   hl, wEntitiesSpeedYTable                 ;; 06:5994 $21 $50 $C2
    add  hl, bc                                   ;; 06:5997 $09
    inc  [hl]                                     ;; 06:5998 $34
    ld   a, [hl]                                  ;; 06:5999 $7E
    and  a                                        ;; 06:599A $A7
    jr   nz, .jr_59A2                             ;; 06:599B $20 $05

    ld   hl, wEntitiesSpriteVariantTable          ;; 06:599D $21 $B0 $C3
    add  hl, bc                                   ;; 06:59A0 $09
    inc  [hl]                                     ;; 06:59A1 $34

.jr_59A2
    cp   $10                                      ;; 06:59A2 $FE $10
    ret  nz                                       ;; 06:59A4 $C0

    jp   ClearEntityStatus_06                     ;; 06:59A5 $C3 $DB $65
