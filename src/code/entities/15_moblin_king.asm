MoblinKingEntityHandler::
    ld   a, [wIsBowWowFollowingLink]              ;; 15:46B6 $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ;; 15:46B9 $FE $80
    jp   nz, ClearEntityStatus_15                 ;; 15:46BB $C2 $31 $7C

    ld   hl, wEntitiesDirectionTable              ;; 15:46BE $21 $80 $C3
    add  hl, bc                                   ;; 15:46C1 $09
    ld   a, [hl]                                  ;; 15:46C2 $7E
    and  a                                        ;; 15:46C3 $A7
    jr   nz, .jr_46D0                             ;; 15:46C4 $20 $0A

    ldh  a, [hActiveEntitySpriteVariant]          ;; 15:46C6 $F0 $F1
    cp   $0C                                      ;; 15:46C8 $FE $0C
    jr   nc, .jr_46D0                             ;; 15:46CA $30 $04

    add  $06                                      ;; 15:46CC $C6 $06
    ldh  [hActiveEntitySpriteVariant], a          ;; 15:46CE $E0 $F1

.jr_46D0
    call func_015_4AC9                            ;; 15:46D0 $CD $C9 $4A
    ldh  a, [hActiveEntityStatus]                 ;; 15:46D3 $F0 $EA
    cp   $01                                      ;; 15:46D5 $FE $01
    jr   nz, .jr_46E1                             ;; 15:46D7 $20 $08

    ld   a, $0C                                   ;; 15:46D9 $3E $0C
    call func_015_48B6                            ;; 15:46DB $CD $B6 $48
    jp   label_015_7C37                           ;; 15:46DE $C3 $37 $7C

.jr_46E1
    call label_394D                               ;; 15:46E1 $CD $4D $39
    call ReturnIfNonInteractive_15                ;; 15:46E4 $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ;; 15:46E7 $CD $3E $7B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 15:46EA $CD $39 $3B
    ld   hl, wEntitiesOptions1Table               ;; 15:46ED $21 $30 $C4
    add  hl, bc                                   ;; 15:46F0 $09
    set  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ;; 15:46F1 $CB $F6
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 15:46F3 $21 $40 $C3
    add  hl, bc                                   ;; 15:46F6 $09
    res  ENTITY_PHYSICS_B_HARMLESS, [hl]          ;; 15:46F7 $CB $BE
    call UpdateEntityPosWithSpeed_15              ;; 15:46F9 $CD $88 $7B
    call ApplyEntityInteractionWithBackground_trampoline ;; 15:46FC $CD $23 $3B
    call AddEntityZSpeedToPos_15                  ;; 15:46FF $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ;; 15:4702 $21 $20 $C3
    add  hl, bc                                   ;; 15:4705 $09
    dec  [hl]                                     ;; 15:4706 $35
    dec  [hl]                                     ;; 15:4707 $35
    dec  [hl]                                     ;; 15:4708 $35
    ld   hl, wEntitiesPosZTable                   ;; 15:4709 $21 $10 $C3
    add  hl, bc                                   ;; 15:470C $09
    ld   a, [hl]                                  ;; 15:470D $7E
    and  $80                                      ;; 15:470E $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 15:4710 $E0 $E8
    jr   z, .jr_471A                              ;; 15:4712 $28 $06

    ld   [hl], b                                  ;; 15:4714 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 15:4715 $21 $20 $C3
    add  hl, bc                                   ;; 15:4718 $09
    ld   [hl], b                                  ;; 15:4719 $70

.jr_471A
    ld   hl, wEntitiesStateTable                  ;; 15:471A $21 $90 $C2
    add  hl, bc                                   ;; 15:471D $09
    ld   a, [hl]                                  ;; 15:471E $7E
    JP_TABLE                                      ;; 15:471F
._00 dw func_015_4734                             ;; 15:4720
._01 dw func_015_4750                             ;; 15:4722
._02 dw func_015_4780                             ;; 15:4724
._03 dw func_015_483F                             ;; 15:4726
._04 dw func_015_4873                             ;; 15:4728
._05 dw func_015_48CF                             ;; 15:472A
._06 dw func_015_494C                             ;; 15:472C
._07 dw func_015_4977                             ;; 15:472E
._08 dw func_015_499C                             ;; 15:4730
._09 dw func_015_49C2                             ;; 15:4732

func_015_4734::
    call GetEntityTransitionCountdown
    ld   [hl], $20                                ;; 15:4737 $36 $20
    xor  a                                        ;; 15:4739 $AF
    ld   [wD228], a                               ;; 15:473A $EA $28 $D2
    call SetEntitySpriteVariant                   ;; 15:473D $CD $0C $3B
    call IncrementEntityState                     ;; 15:4740 $CD $12 $3B

func_015_4743::
    call GetEntityXDistanceToLink_15              ;; 15:4743 $CD $DB $7B
    ld   a, e                                     ;; 15:4746 $7B
    ld   [wD227], a                               ;; 15:4747 $EA $27 $D2
    ld   hl, wEntitiesDirectionTable              ;; 15:474A $21 $80 $C3
    add  hl, bc                                   ;; 15:474D $09

.jr_474E
    ld   [hl], a                                  ;; 15:474E $77
    ret                                           ;; 15:474F $C9

func_015_4750::
    call GetEntityTransitionCountdown             ;; 15:4750 $CD $05 $0C
    ret  nz                                       ;; 15:4753 $C0

    call_open_dialog Dialog191                    ;; 15:4754
    ld   hl, wDialogState                         ;; 15:4759 $21 $9F $C1

.jr_475C
    res  DIALOG_BOX_BOTTOM_BIT, [hl]              ;; 15:475C $CB $BE
    call IncrementEntityState                     ;; 15:475E $CD $12 $3B
    call GetEntitySlowTransitionCountdown         ;; 15:4761 $CD $FB $0B
    ld   [hl], $30                                ;; 15:4764 $36 $30
    ld   hl, wEntitiesOptions1Table               ;; 15:4766 $21 $30 $C4
    add  hl, bc                                   ;; 15:4769 $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_IS_MINI_BOSS ;; 15:476A $36 $84
    ld   a, $01                                   ;; 15:476C $3E $01
    ld   [wD228], a                               ;; 15:476E $EA $28 $D2
    ld   a, $01                                   ;; 15:4771 $3E $01
    jp   SetEntitySpriteVariant                   ;; 15:4773 $C3 $0C $3B

Data_015_4776::
    db   $08, $F8

Data_015_4778::
    db   $FC, $FC

Data_015_477A::
    db   $20, $E0

Data_015_477C::
    db   $00, $00

Data_015_477E::
    db   $D0, $30

func_015_4780::
    call GetEntityPrivateCountdown1               ;; 15:4780 $CD $00 $0C
    jr   z, jr_015_47E3                           ;; 15:4783 $28 $5E

    cp   $0C                                      ;; 15:4785 $FE $0C
    jr   nz, .jr_47D1                             ;; 15:4787 $20 $48

    ld   a, ENTITY_MOBLIN_ARROW                   ;; 15:4789 $3E $0C
    call SpawnNewEntity_trampoline                ;; 15:478B $CD $86 $3B
    jr   c, .jr_47D1                              ;; 15:478E $38 $41

    ld   a, NOISE_SFX_WHOOSH                      ;; 15:4790 $3E $0A
    ldh  [hNoiseSfx], a                           ;; 15:4792 $E0 $F4
    push bc                                       ;; 15:4794 $C5
    ldh  a, [hMultiPurpose2]                      ;; 15:4795 $F0 $D9
    ld   c, a                                     ;; 15:4797 $4F
    ld   hl, Data_015_4776                        ;; 15:4798 $21 $76 $47
    add  hl, bc                                   ;; 15:479B $09
    ldh  a, [hMultiPurpose0]                      ;; 15:479C $F0 $D7
    add  [hl]                                     ;; 15:479E $86
    ld   hl, wEntitiesPosXTable                   ;; 15:479F $21 $00 $C2
    add  hl, de                                   ;; 15:47A2 $19
    ld   [hl], a                                  ;; 15:47A3 $77
    ld   hl, Data_015_4778                        ;; 15:47A4 $21 $78 $47
    add  hl, bc                                   ;; 15:47A7 $09
    ldh  a, [hMultiPurpose1]                      ;; 15:47A8 $F0 $D8
    add  [hl]                                     ;; 15:47AA $86
    ld   hl, wEntitiesPosYTable                   ;; 15:47AB $21 $10 $C2
    add  hl, de                                   ;; 15:47AE $19
    ld   [hl], a                                  ;; 15:47AF $77
    ld   hl, Data_015_477A                        ;; 15:47B0 $21 $7A $47
    add  hl, bc                                   ;; 15:47B3 $09
    ld   a, [hl]                                  ;; 15:47B4 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 15:47B5 $21 $40 $C2
    add  hl, de                                   ;; 15:47B8 $19
    ld   [hl], a                                  ;; 15:47B9 $77
    ld   hl, Data_015_477C                        ;; 15:47BA $21 $7C $47
    add  hl, bc                                   ;; 15:47BD $09
    ld   a, [hl]                                  ;; 15:47BE $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 15:47BF $21 $50 $C2
    add  hl, de                                   ;; 15:47C2 $19
    ld   [hl], a                                  ;; 15:47C3 $77
    ldh  a, [hMultiPurpose2]                      ;; 15:47C4 $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable          ;; 15:47C6 $21 $B0 $C3
    add  hl, de                                   ;; 15:47C9 $19
    ld   [hl], a                                  ;; 15:47CA $77
    ld   hl, wEntitiesDirectionTable              ;; 15:47CB $21 $80 $C3
    add  hl, de                                   ;; 15:47CE $19
    ld   [hl], a                                  ;; 15:47CF $77
    pop  bc                                       ;; 15:47D0 $C1

.jr_47D1
    call GetEntityPrivateCountdown1               ;; 15:47D1 $CD $00 $0C
    ld   e, $00                                   ;; 15:47D4 $1E $00
    cp   $0C                                      ;; 15:47D6 $FE $0C
    jr   c, .jr_47DC                              ;; 15:47D8 $38 $02

    ld   e, $02                                   ;; 15:47DA $1E $02

.jr_47DC
    ld   a, e                                     ;; 15:47DC $7B
    call SetEntitySpriteVariant                   ;; 15:47DD $CD $0C $3B
    jp   ClearEntitySpeed                         ;; 15:47E0 $C3 $7F $3D

jr_015_47E3:
    call GetEntitySlowTransitionCountdown         ;; 15:47E3 $CD $FB $0B
    jr   nz, .jr_47F3                             ;; 15:47E6 $20 $0B

    call GetEntityTransitionCountdown             ;; 15:47E8 $CD $05 $0C
    ld   [hl], $30                                ;; 15:47EB $36 $30
    call ClearEntitySpeed                         ;; 15:47ED $CD $7F $3D
    jp   IncrementEntityState                     ;; 15:47F0 $C3 $12 $3B

.jr_47F3
    ldh  a, [hMultiPurposeG]                      ;; 15:47F3 $F0 $E8
    and  a                                        ;; 15:47F5 $A7
    jr   z, .jr_4816                              ;; 15:47F6 $28 $1E

    ldh  a, [hLinkPositionX]                      ;; 15:47F8 $F0 $98
    push af                                       ;; 15:47FA $F5
    call GetEntityXDistanceToLink_15              ;; 15:47FB $CD $DB $7B
    ld   d, b                                     ;; 15:47FE $50
    ld   hl, Data_015_477E                        ;; 15:47FF $21 $7E $47
    add  hl, de                                   ;; 15:4802 $19
    ldh  a, [hLinkPositionX]                      ;; 15:4803 $F0 $98
    add  [hl]                                     ;; 15:4805 $86
    ldh  [hLinkPositionX], a                      ;; 15:4806 $E0 $98
    ld   a, $0C                                   ;; 15:4808 $3E $0C
    call ApplyVectorTowardsLink_trampoline        ;; 15:480A $CD $AA $3B
    pop  af                                       ;; 15:480D $F1
    ldh  [hLinkPositionX], a                      ;; 15:480E $E0 $98
    ld   hl, wEntitiesSpeedZTable                 ;; 15:4810 $21 $20 $C3
    add  hl, bc                                   ;; 15:4813 $09
    ld   [hl], $10                                ;; 15:4814 $36 $10

.jr_4816
    ldh  a, [hFrameCounter]                       ;; 15:4816 $F0 $E7
    rra                                           ;; 15:4818 $1F
    rra                                           ;; 15:4819 $1F
    rra                                           ;; 15:481A $1F
    rra                                           ;; 15:481B $1F
    and  $01                                      ;; 15:481C $E6 $01
    call SetEntitySpriteVariant                   ;; 15:481E $CD $0C $3B
    ld   [wD228], a                               ;; 15:4821 $EA $28 $D2
    call func_015_4743                            ;; 15:4824 $CD $43 $47
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 15:4827 $21 $00 $C3
    add  hl, bc                                   ;; 15:482A $09
    ld   a, [hl]                                  ;; 15:482B $7E
    and  a                                        ;; 15:482C $A7
    jr   nz, .ret_483C                            ;; 15:482D $20 $0D

    call GetRandomByte                            ;; 15:482F $CD $0D $28
    and  $3F                                      ;; 15:4832 $E6 $3F
    add  $30                                      ;; 15:4834 $C6 $30
    ld   [hl], a                                  ;; 15:4836 $77
    call GetEntityPrivateCountdown1               ;; 15:4837 $CD $00 $0C
    ld   [hl], $18                                ;; 15:483A $36 $18

.ret_483C
    ret                                           ;; 15:483C $C9

Data_015_483D::
    db   $28, $D8

func_015_483F::
    call GetEntityTransitionCountdown             ;; 15:483F $CD $05 $0C
    jr   nz, .jr_485C                             ;; 15:4842 $20 $18

    ld   [hl], $22                                ;; 15:4844 $36 $22
    call ClearEntitySpeed                         ;; 15:4846 $CD $7F $3D
    ld   hl, wEntitiesDirectionTable              ;; 15:4849 $21 $80 $C3
    add  hl, bc                                   ;; 15:484C $09
    ld   e, [hl]                                  ;; 15:484D $5E
    ld   d, b                                     ;; 15:484E $50
    ld   hl, Data_015_483D                        ;; 15:484F $21 $3D $48
    add  hl, de                                   ;; 15:4852 $19
    ld   a, [hl]                                  ;; 15:4853 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4854 $21 $40 $C2
    add  hl, bc                                   ;; 15:4857 $09
    ld   [hl], a                                  ;; 15:4858 $77
    jp   IncrementEntityState                     ;; 15:4859 $C3 $12 $3B

.jr_485C
    and  $07                                      ;; 15:485C $E6 $07
    jr   nz, .jr_4864                             ;; 15:485E $20 $04

    ld   a, JINGLE_BUMP                           ;; 15:4860 $3E $09
    ldh  [hJingle], a                             ;; 15:4862 $E0 $F2

.jr_4864
    call ClearEntitySpeed                         ;; 15:4864 $CD $7F $3D
    ldh  a, [hFrameCounter]                       ;; 15:4867 $F0 $E7
    rra                                           ;; 15:4869 $1F
    rra                                           ;; 15:486A $1F
    rra                                           ;; 15:486B $1F
    and  $01                                      ;; 15:486C $E6 $01
    add  $02                                      ;; 15:486E $C6 $02
    jp   SetEntitySpriteVariant                   ;; 15:4870 $C3 $0C $3B

func_015_4873::
    call GetEntityTransitionCountdown             ;; 15:4873 $CD $05 $0C
    jr   nz, .jr_487E                             ;; 15:4876 $20 $06

    call IncrementEntityState                     ;; 15:4878 $CD $12 $3B
    jp   IncrementEntityState                     ;; 15:487B $C3 $12 $3B

.jr_487E
    ld   hl, wEntitiesCollisionsTable             ;; 15:487E $21 $A0 $C2
    add  hl, bc                                   ;; 15:4881 $09
    ld   a, [hl]                                  ;; 15:4882 $7E
    and  $03                                      ;; 15:4883 $E6 $03
    jr   z, .jr_48AE                              ;; 15:4885 $28 $27

    xor  a                                        ;; 15:4887 $AF
    ld   [wC158], a                               ;; 15:4888 $EA $58 $C1
    ld   a, $20                                   ;; 15:488B $3E $20
    ld   [wScreenShakeCountdown], a               ;; 15:488D $EA $57 $C1
    ld   a, JINGLE_STRONG_BUMP                    ;; 15:4890 $3E $0B
    ldh  [hJingle], a                             ;; 15:4892 $E0 $F2
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4894 $21 $40 $C2
    add  hl, bc                                   ;; 15:4897 $09
    sra  [hl]                                     ;; 15:4898 $CB $2E
    sra  [hl]                                     ;; 15:489A $CB $2E
    ld   a, [hl]                                  ;; 15:489C $7E
    cpl                                           ;; 15:489D $2F
    inc  a                                        ;; 15:489E $3C
    ld   [hl], a                                  ;; 15:489F $77
    ld   hl, wEntitiesSpeedZTable                 ;; 15:48A0 $21 $20 $C3
    add  hl, bc                                   ;; 15:48A3 $09
    ld   [hl], $28                                ;; 15:48A4 $36 $28
    call IncrementEntityState                     ;; 15:48A6 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 15:48A9 $CD $05 $0C
    ld   [hl], $60                                ;; 15:48AC $36 $60

.jr_48AE
    ldh  a, [hFrameCounter]                       ;; 15:48AE $F0 $E7
    rra                                           ;; 15:48B0 $1F
    rra                                           ;; 15:48B1 $1F
    and  $01                                      ;; 15:48B2 $E6 $01
    add  $04                                      ;; 15:48B4 $C6 $04

func_015_48B6::
    call SetEntitySpriteVariant                   ;; 15:48B6 $CD $0C $3B
    ld   a, $FF                                   ;; 15:48B9 $3E $FF
    ld   [wD228], a                               ;; 15:48BB $EA $28 $D2
    ret                                           ;; 15:48BE $C9

Data_015_48BF::
    db   $00, $FE, $FD, $FE, $00, $02, $03, $02

Data_015_48C7::
    db   $00, $04, $08, $0C, $10, $0C, $08, $04

func_015_48CF::
    ld   hl, wEntitiesOptions1Table               ;; 15:48CF $21 $30 $C4
    add  hl, bc                                   ;; 15:48D2 $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ;; 15:48D3 $CB $B6
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 15:48D5 $21 $40 $C3
    add  hl, bc                                   ;; 15:48D8 $09
    set  ENTITY_PHYSICS_B_HARMLESS, [hl]          ;; 15:48D9 $CB $FE
    call GetEntityTransitionCountdown             ;; 15:48DB $CD $05 $0C
    jr   nz, .jr_48F0                             ;; 15:48DE $20 $10

    ld   [hl], $40                                ;; 15:48E0 $36 $40
    call IncrementEntityState                     ;; 15:48E2 $CD $12 $3B
    call IncrementEntityState                     ;; 15:48E5 $CD $12 $3B
    ld   a, $00                                   ;; 15:48E8 $3E $00
    ld   [wD228], a                               ;; 15:48EA $EA $28 $D2
    jp   SetEntitySpriteVariant                   ;; 15:48ED $C3 $0C $3B

.jr_48F0
    ldh  a, [hMultiPurposeG]                      ;; 15:48F0 $F0 $E8
    and  a                                        ;; 15:48F2 $A7
    jr   z, .jr_48F8                              ;; 15:48F3 $28 $03

    call ClearEntitySpeed                         ;; 15:48F5 $CD $7F $3D

.jr_48F8
    ldh  a, [hFrameCounter]                       ;; 15:48F8 $F0 $E7
    rra                                           ;; 15:48FA $1F
    rra                                           ;; 15:48FB $1F
    rra                                           ;; 15:48FC $1F
    and  $01                                      ;; 15:48FD $E6 $01
    add  $0C                                      ;; 15:48FF $C6 $0C
    call SetEntitySpriteVariant                   ;; 15:4901 $CD $0C $3B
    ld   a, [wOAMNextAvailableSlot]               ;; 15:4904 $FA $C0 $C3
    ld   e, a                                     ;; 15:4907 $5F
    ld   d, b                                     ;; 15:4908 $50
    ld   hl, wDynamicOAMBuffer                    ;; 15:4909 $21 $30 $C0
    add  hl, de                                   ;; 15:490C $19
    ldh  a, [hFrameCounter]                       ;; 15:490D $F0 $E7
    rra                                           ;; 15:490F $1F
    rra                                           ;; 15:4910 $1F
    rra                                           ;; 15:4911 $1F
    and  $07                                      ;; 15:4912 $E6 $07
    call func_015_491C                            ;; 15:4914 $CD $1C $49
    ld   a, $02                                   ;; 15:4917 $3E $02
    jp   func_015_7964_trampoline                 ;; 15:4919 $C3 $A0 $3D

func_015_491C::
    call func_015_4928                            ;; 15:491C $CD $28 $49
    ldh  a, [hFrameCounter]                       ;; 15:491F $F0 $E7
    rra                                           ;; 15:4921 $1F
    rra                                           ;; 15:4922 $1F
    rra                                           ;; 15:4923 $1F
    add  $04                                      ;; 15:4924 $C6 $04
    and  $07                                      ;; 15:4926 $E6 $07

func_015_4928::
    push bc                                       ;; 15:4928 $C5
    push hl                                       ;; 15:4929 $E5
    ld   e, a                                     ;; 15:492A $5F
    ld   d, $00                                   ;; 15:492B $16 $00
    ld   hl, Data_015_48BF                        ;; 15:492D $21 $BF $48
    add  hl, de                                   ;; 15:4930 $19
    ld   b, [hl]                                  ;; 15:4931 $46
    ld   hl, Data_015_48C7                        ;; 15:4932 $21 $C7 $48
    add  hl, de                                   ;; 15:4935 $19
    ld   c, [hl]                                  ;; 15:4936 $4E
    pop  hl                                       ;; 15:4937 $E1
    ldh  a, [hActiveEntityVisualPosY]             ;; 15:4938 $F0 $EC
    add  b                                        ;; 15:493A $80
    add  $F6                                      ;; 15:493B $C6 $F6
    ld   [hl+], a                                 ;; 15:493D $22
    ldh  a, [hActiveEntityPosX]                   ;; 15:493E $F0 $EE
    add  c                                        ;; 15:4940 $81
    add  $FC                                      ;; 15:4941 $C6 $FC
    ld   [hl+], a                                 ;; 15:4943 $22
    ld   [hl], $24                                ;; 15:4944 $36 $24
    inc  hl                                       ;; 15:4946 $23
    ld   [hl], $00                                ;; 15:4947 $36 $00
    inc  hl                                       ;; 15:4949 $23
    pop  bc                                       ;; 15:494A $C1
    ret                                           ;; 15:494B $C9

func_015_494C::
    ld   hl, wEntitiesSpeedXTable                 ;; 15:494C $21 $40 $C2
    add  hl, bc                                   ;; 15:494F $09
    ld   a, [hl]                                  ;; 15:4950 $7E
    and  $FE                                      ;; 15:4951 $E6 $FE
    jr   nz, .jr_4960                             ;; 15:4953 $20 $0B

    call ClearEntitySpeed                         ;; 15:4955 $CD $7F $3D
    call GetEntityTransitionCountdown             ;; 15:4958 $CD $05 $0C
    ld   [hl], $40                                ;; 15:495B $36 $40
    jp   IncrementEntityState                     ;; 15:495D $C3 $12 $3B

.jr_4960
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4960 $21 $40 $C2
    add  hl, bc                                   ;; 15:4963 $09
    ld   a, [hl]                                  ;; 15:4964 $7E
    and  $80                                      ;; 15:4965 $E6 $80
    jr   z, .jr_496D                              ;; 15:4967 $28 $04

    inc  [hl]                                     ;; 15:4969 $34
    inc  [hl]                                     ;; 15:496A $34
    inc  [hl]                                     ;; 15:496B $34
    inc  [hl]                                     ;; 15:496C $34

.jr_496D
    dec  [hl]                                     ;; 15:496D $35
    dec  [hl]                                     ;; 15:496E $35
    ld   a, $00                                   ;; 15:496F $3E $00
    ld   [wD228], a                               ;; 15:4971 $EA $28 $D2
    jp   SetEntitySpriteVariant                   ;; 15:4974 $C3 $0C $3B

func_015_4977::
    call ClearEntitySpeed                         ;; 15:4977 $CD $7F $3D
    call GetEntityTransitionCountdown             ;; 15:497A $CD $05 $0C
    jr   nz, jr_015_4990                          ;; 15:497D $20 $11

label_015_497F:
    call GetEntitySlowTransitionCountdown         ;; 15:497F $CD $FB $0B
    call GetRandomByte                            ;; 15:4982 $CD $0D $28
    and  $1F                                      ;; 15:4985 $E6 $1F
    add  $20                                      ;; 15:4987 $C6 $20
    ld   [hl], a                                  ;; 15:4989 $77
    call IncrementEntityState                     ;; 15:498A $CD $12 $3B
    ld   [hl], $02                                ;; 15:498D $36 $02
    ret                                           ;; 15:498F $C9

jr_015_4990:
    ldh  a, [hFrameCounter]                       ;; 15:4990 $F0 $E7
    rra                                           ;; 15:4992 $1F
    rra                                           ;; 15:4993 $1F
    rra                                           ;; 15:4994 $1F
    rra                                           ;; 15:4995 $1F
    and  $01                                      ;; 15:4996 $E6 $01
    ld   [wD227], a                               ;; 15:4998 $EA $27 $D2
    ret                                           ;; 15:499B $C9

func_015_499C::
    call IncrementEntityState                     ;; 15:499C $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 15:499F $CD $05 $0C
    ld   [hl], $60                                ;; 15:49A2 $36 $60
    ld   hl, wEntitiesSpeedXTable                 ;; 15:49A4 $21 $40 $C2
    add  hl, bc                                   ;; 15:49A7 $09
    ld   a, [hl]                                  ;; 15:49A8 $7E
    ldh  [hLinkSpeedX], a                         ;; 15:49A9 $E0 $9A
    ld   a, $28                                   ;; 15:49AB $3E $28
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 15:49AD $EA $3E $C1
    ld   a, $40                                   ;; 15:49B0 $3E $40
    ld   [wInvincibilityCounter], a               ;; 15:49B2 $EA $C7 $DB
    ld   a, [wSubtractHealthBuffer]               ;; 15:49B5 $FA $94 $DB
    add  $08                                      ;; 15:49B8 $C6 $08
    ld   [wSubtractHealthBuffer], a               ;; 15:49BA $EA $94 $DB
    ld   a, JINGLE_STRONG_BUMP                    ;; 15:49BD $3E $0B
    ldh  [hJingle], a                             ;; 15:49BF $E0 $F2
    ret                                           ;; 15:49C1 $C9

func_015_49C2::
    call ClearEntitySpeed                         ;; 15:49C2 $CD $7F $3D
    call GetEntityTransitionCountdown             ;; 15:49C5 $CD $05 $0C
    jr   nz, .jr_49CD                             ;; 15:49C8 $20 $03

    jp   label_015_497F                           ;; 15:49CA $C3 $7F $49

.jr_49CD
    cp   $40                                      ;; 15:49CD $FE $40
    ld   a, $00                                   ;; 15:49CF $3E $00
    jr   nc, .jr_49DC                             ;; 15:49D1 $30 $09

    ldh  a, [hFrameCounter]                       ;; 15:49D3 $F0 $E7
    rra                                           ;; 15:49D5 $1F
    rra                                           ;; 15:49D6 $1F
    rra                                           ;; 15:49D7 $1F
    rra                                           ;; 15:49D8 $1F
    rra                                           ;; 15:49D9 $1F
    and  $01                                      ;; 15:49DA $E6 $01

.jr_49DC
    call SetEntitySpriteVariant                   ;; 15:49DC $CD $0C $3B
    ld   [wD228], a                               ;; 15:49DF $EA $28 $D2
    jp   func_015_4743                            ;; 15:49E2 $C3 $43 $47

Data_015_49E5::
    db   $F8, $FC, $54, $22, $F8, $04, $52, $22, $F8, $0C, $50, $22, $F7, $FC, $54, $22
    db   $F7, $04, $52, $22, $F7, $0C, $50, $22, $F8, $FC, $50, $02, $F8, $04, $52, $02
    db   $F8, $0C, $54, $02, $F7, $FC, $50, $02, $F7, $04, $52, $02, $F7, $0C, $54, $02

Data_015_4A15::
    db   $00, $FC, $56, $02, $00, $04, $58, $02, $00, $0C, $5A, $02, $00, $FC, $5C, $02
    db   $00, $04, $58, $02, $00, $0C, $5E, $02, $00, $FC, $5C, $02, $00, $04, $58, $02
    db   $00, $0C, $5A, $02, $00, $FC, $56, $02, $00, $04, $58, $02, $00, $0C, $5E, $02
    db   $00, $FC, $70, $02, $00, $04, $72, $02, $00, $0C, $74, $02, $01, $FC, $70, $02
    db   $00, $04, $76, $02, $00, $0C, $78, $02, $00, $FC, $5A, $22, $00, $04, $58, $22
    db   $00, $0C, $56, $22, $00, $FC, $5E, $22, $00, $04, $58, $22, $00, $0C, $5C, $22
    db   $00, $FC, $5A, $22, $00, $04, $58, $22, $00, $0C, $5C, $22, $00, $FC, $5E, $22
    db   $00, $04, $58, $22, $00, $0C, $56, $22, $00, $FC, $74, $22, $00, $04, $72, $22
    db   $00, $0C, $70, $22, $00, $FC, $78, $22, $00, $04, $76, $22, $01, $0C, $70, $22
    db   $00, $FC, $7A, $02, $00, $04, $7C, $02, $00, $0C, $7E, $02, $00, $FC, $7E, $22
    db   $00, $04, $7C, $22, $00, $0C, $7A, $22

Data_015_4ABD::
    db   $0C, $FF, $26, $02, $0C, $04, $26, $02, $0C, $09, $26, $02

func_015_4AC9::
    ld   a, [wD227]                               ;; 15:4AC9 $FA $27 $D2
    sla  a                                        ;; 15:4ACC $CB $27
    ld   e, a                                     ;; 15:4ACE $5F
    ld   a, [wD228]                               ;; 15:4ACF $FA $28 $D2
    cp   $FF                                      ;; 15:4AD2 $FE $FF
    jr   z, .jr_4AEB                              ;; 15:4AD4 $28 $15

    add  e                                        ;; 15:4AD6 $83
    rla                                           ;; 15:4AD7 $17
    rla                                           ;; 15:4AD8 $17
    and  $FC                                      ;; 15:4AD9 $E6 $FC
    ld   e, a                                     ;; 15:4ADB $5F
    rla                                           ;; 15:4ADC $17
    and  $F8                                      ;; 15:4ADD $E6 $F8
    add  e                                        ;; 15:4ADF $83
    ld   e, a                                     ;; 15:4AE0 $5F
    ld   d, b                                     ;; 15:4AE1 $50
    ld   hl, Data_015_49E5                        ;; 15:4AE2 $21 $E5 $49
    add  hl, de                                   ;; 15:4AE5 $19
    ld   c, $03                                   ;; 15:4AE6 $0E $03
    call RenderActiveEntitySpritesRect            ;; 15:4AE8 $CD $E6 $3C

.jr_4AEB
    ldh  a, [hActiveEntitySpriteVariant]          ;; 15:4AEB $F0 $F1
    rla                                           ;; 15:4AED $17
    rla                                           ;; 15:4AEE $17
    and  $FC                                      ;; 15:4AEF $E6 $FC
    ld   e, a                                     ;; 15:4AF1 $5F
    rla                                           ;; 15:4AF2 $17
    and  $F8                                      ;; 15:4AF3 $E6 $F8
    add  e                                        ;; 15:4AF5 $83
    ld   e, a                                     ;; 15:4AF6 $5F
    ld   d, b                                     ;; 15:4AF7 $50
    ld   hl, Data_015_4A15                        ;; 15:4AF8 $21 $15 $4A
    add  hl, de                                   ;; 15:4AFB $19
    ld   c, $03                                   ;; 15:4AFC $0E $03
    call RenderActiveEntitySpritesRect            ;; 15:4AFE $CD $E6 $3C
    ld   hl, wEntitiesPosZTable                   ;; 15:4B01 $21 $10 $C3
    add  hl, bc                                   ;; 15:4B04 $09
    ld   a, [hl]                                  ;; 15:4B05 $7E
    and  a                                        ;; 15:4B06 $A7
    ret  z                                        ;; 15:4B07 $C8

    ldh  a, [hActiveEntityPosY]                   ;; 15:4B08 $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ;; 15:4B0A $E0 $EC
    ld   hl, Data_015_4ABD                        ;; 15:4B0C $21 $BD $4A
    ld   c, $03                                   ;; 15:4B0F $0E $03
    call RenderActiveEntitySpritesRect            ;; 15:4B11 $CD $E6 $3C

.jr_4B14
    jp   CopyEntityPositionToActivePosition       ;; 15:4B14 $C3 $8A $3D
