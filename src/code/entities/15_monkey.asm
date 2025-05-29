Data_015_764B::
    db   $00, $00, $74, $02, $00, $08, $74, $22, $00, $00, $FF, $02, $F0, $08, $7A, $02
    db   $00, $00, $76, $02, $00, $08, $78, $02, $F0, $00, $7A, $22, $00, $00, $78, $22
    db   $00, $08, $76, $22, $00, $00, $74, $42, $00, $08, $74, $62, $00, $00, $FF, $02

MonkeyEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 15:767B $21 $B0 $C2
    add  hl, bc                                   ;; 15:767E $09
    ld   a, [hl]                                  ;; 15:767F $7E
    and  a                                        ;; 15:7680 $A7
    jp   nz, label_015_7825                       ;; 15:7681 $C2 $25 $78

    ld   hl, Data_015_764B                        ;; 15:7684 $21 $4B $76
    ldh  a, [hActiveEntitySpriteVariant]          ;; 15:7687 $F0 $F1
    rla                                           ;; 15:7689 $17
    rla                                           ;; 15:768A $17
    and  $FC                                      ;; 15:768B $E6 $FC
    ld   e, a                                     ;; 15:768D $5F
    rla                                           ;; 15:768E $17
    add  e                                        ;; 15:768F $83
    ld   e, a                                     ;; 15:7690 $5F
    ld   d, b                                     ;; 15:7691 $50
    add  hl, de                                   ;; 15:7692 $19
    ld   c, $03                                   ;; 15:7693 $0E $03
    call RenderActiveEntitySpritesRect            ;; 15:7695 $CD $E6 $3C
    call label_3CD9                               ;; 15:7698 $CD $D9 $3C
    ldh  a, [hActiveEntityState]                  ;; 15:769B $F0 $F0
    cp   $02                                      ;; 15:769D $FE $02
    jr   nc, .jr_76EF                             ;; 15:769F $30 $4E

    ld   a, [wScreenShakeCountdown]               ;; 15:76A1 $FA $57 $C1
    and  a                                        ;; 15:76A4 $A7
    jr   z, .jr_76EF                              ;; 15:76A5 $28 $48

    ld   a, [wPegasusBootsCollisionCountdown]     ;; 15:76A7 $FA $78 $C1
    and  a                                        ;; 15:76AA $A7
    jr   z, .jr_76EF                              ;; 15:76AB $28 $42

    ldh  a, [hActiveEntityPosX]                   ;; 15:76AD $F0 $EE
    add  $08                                      ;; 15:76AF $C6 $08
    ld   hl, wPegasusBootsCollisionPosX           ;; 15:76B1 $21 $79 $C1
    sub  [hl]                                     ;; 15:76B4 $96
    add  $10                                      ;; 15:76B5 $C6 $10
    cp   $20                                      ;; 15:76B7 $FE $20
    jr   nc, .jr_76EF                             ;; 15:76B9 $30 $34

    ldh  a, [hActiveEntityPosY]                   ;; 15:76BB $F0 $EF
    add  $08                                      ;; 15:76BD $C6 $08
    ld   hl, wPegasusBootsCollisionPosY           ;; 15:76BF $21 $7A $C1
    sub  [hl]                                     ;; 15:76C2 $96
    add  $10                                      ;; 15:76C3 $C6 $10
    cp   $20                                      ;; 15:76C5 $FE $20
    jr   nc, .jr_76EF                             ;; 15:76C7 $30 $26

    ld   hl, wEntitiesPosYTable                   ;; 15:76C9 $21 $10 $C2
    add  hl, bc                                   ;; 15:76CC $09
    ld   a, [hl]                                  ;; 15:76CD $7E
    add  $18                                      ;; 15:76CE $C6 $18
    ld   [hl], a                                  ;; 15:76D0 $77
    ld   hl, wEntitiesPosZTable                   ;; 15:76D1 $21 $10 $C3
    add  hl, bc                                   ;; 15:76D4 $09
    ld   [hl], $18                                ;; 15:76D5 $36 $18
    call IncrementEntityState                     ;; 15:76D7 $CD $12 $3B
    ld   [hl], $02                                ;; 15:76DA $36 $02
    ld   hl, wEntitiesSpeedZTable                 ;; 15:76DC $21 $20 $C3
    add  hl, bc                                   ;; 15:76DF $09
    ld   [hl], $15                                ;; 15:76E0 $36 $15
    ld   hl, wEntitiesSpeedYTable                 ;; 15:76E2 $21 $50 $C2
    add  hl, bc                                   ;; 15:76E5 $09
    ld   [hl], $0C                                ;; 15:76E6 $36 $0C
    ld   hl, wEntitiesSpeedXTable                 ;; 15:76E8 $21 $40 $C2
    add  hl, bc                                   ;; 15:76EB $09
    ld   [hl], $FA                                ;; 15:76EC $36 $FA
    ret                                           ;; 15:76EE $C9

.jr_76EF
    ldh  a, [hActiveEntityState]                  ;; 15:76EF $F0 $F0
    JP_TABLE                                      ;; 15:76F1
._00 dw func_015_76FA                             ;; 15:76F2
._01 dw func_015_770A                             ;; 15:76F4
._02 dw func_015_7793                             ;; 15:76F6
._03 dw func_015_77BF                             ;; 15:76F8

func_015_76FA::
    ld   hl, wEntitiesPosXTable                   ;; 15:76FA $21 $00 $C2
    add  hl, bc                                   ;; 15:76FD $09
    ld   a, [hl]                                  ;; 15:76FE $7E
    add  $08                                      ;; 15:76FF $C6 $08
    ld   [hl], a                                  ;; 15:7701 $77
    call GetEntityTransitionCountdown             ;; 15:7702 $CD $05 $0C
    ld   [hl], $80                                ;; 15:7705 $36 $80
    jp   IncrementEntityState                     ;; 15:7707 $C3 $12 $3B

func_015_770A::
    call ReturnIfNonInteractive_15                ;; 15:770A $CD $0D $7B
    call GetEntityTransitionCountdown             ;; 15:770D $CD $05 $0C
    ret  nz                                       ;; 15:7710 $C0

    ld   [hl], $50                                ;; 15:7711 $36 $50
    ld   hl, wEntitiesSpriteVariantTable          ;; 15:7713 $21 $B0 $C3
    add  hl, bc                                   ;; 15:7716 $09
    ld   a, [hl]                                  ;; 15:7717 $7E
    inc  a                                        ;; 15:7718 $3C
    cp   $03                                      ;; 15:7719 $FE $03
    jr   nz, .jr_771E                             ;; 15:771B $20 $01

    xor  a                                        ;; 15:771D $AF

.jr_771E
    ld   [hl], a                                  ;; 15:771E $77
    ldh  [hActiveEntitySpriteVariant], a          ;; 15:771F $E0 $F1
    cp   $00                                      ;; 15:7721 $FE $00
    jr   z, ret_015_7792                          ;; 15:7723 $28 $6D

    call GetEntityTransitionCountdown             ;; 15:7725 $CD $05 $0C
    ld   [hl], $28                                ;; 15:7728 $36 $28
    ld   hl, wEntitiesInertiaTable                ;; 15:772A $21 $D0 $C3
    add  hl, bc                                   ;; 15:772D $09
    inc  [hl]                                     ;; 15:772E $34
    ld   a, [hl]                                  ;; 15:772F $7E
    and  $0F                                      ;; 15:7730 $E6 $0F
    jr   nz, .jr_7738                             ;; 15:7732 $20 $04

    ld   a, ENTITY_BOMB                           ;; 15:7734 $3E $02
    jr   jr_015_773A                              ;; 15:7736 $18 $02

.jr_7738
    ld   a, ENTITY_MONKEY                         ;; 15:7738 $3E $E0

jr_015_773A:
    call SpawnNewEntity_trampoline                ;; 15:773A $CD $86 $3B
    ret  c                                        ;; 15:773D $D8

    ldh  a, [hMultiPurpose0]                      ;; 15:773E $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 15:7740 $21 $00 $C2
    add  hl, de                                   ;; 15:7743 $19
    ld   [hl], a                                  ;; 15:7744 $77
    ldh  a, [hMultiPurpose1]                      ;; 15:7745 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 15:7747 $21 $10 $C2
    add  hl, de                                   ;; 15:774A $19
    sub  $0C                                      ;; 15:774B $D6 $0C
    add  $18                                      ;; 15:774D $C6 $18
    ld   [hl], a                                  ;; 15:774F $77
    ld   hl, wEntitiesPosZTable                   ;; 15:7750 $21 $10 $C3
    add  hl, de                                   ;; 15:7753 $19
    ld   [hl], $18                                ;; 15:7754 $36 $18
    ld   hl, wEntitiesPrivateState1Table          ;; 15:7756 $21 $B0 $C2
    add  hl, de                                   ;; 15:7759 $19
    inc  [hl]                                     ;; 15:775A $34
    ld   hl, wEntitiesSpeedZTable                 ;; 15:775B $21 $20 $C3
    add  hl, de                                   ;; 15:775E $19
    ld   [hl], $20                                ;; 15:775F $36 $20
    ldh  a, [hActiveEntitySpriteVariant]          ;; 15:7761 $F0 $F1
    cp   $01                                      ;; 15:7763 $FE $01
    ld   a, $F8                                   ;; 15:7765 $3E $F8
    jr   z, .jr_776B                              ;; 15:7767 $28 $02

    ld   a, $08                                   ;; 15:7769 $3E $08

.jr_776B
    ld   hl, wEntitiesSpeedXTable                 ;; 15:776B $21 $40 $C2
    add  hl, de                                   ;; 15:776E $19
    ld   [hl], a                                  ;; 15:776F $77
    ld   hl, wEntitiesSpeedYTable                 ;; 15:7770 $21 $50 $C2
    add  hl, de                                   ;; 15:7773 $19
    ld   [hl], $0C                                ;; 15:7774 $36 $0C
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 15:7776 $21 $40 $C3
    add  hl, de                                   ;; 15:7779 $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 15:777A $36 $12
    ld   hl, wEntitiesOptions1Table               ;; 15:777C $21 $30 $C4
    add  hl, de                                   ;; 15:777F $19
    set  ENTITY_OPT1_B_NO_WALL_COLLISION, [hl]    ;; 15:7780 $CB $C6
    ld   a, JINGLE_FALL_DOWN                      ;; 15:7782 $3E $08
    ldh  [hJingle], a                             ;; 15:7784 $E0 $F2
    ld   hl, wEntitiesTransitionCountdownTable    ;; 15:7786 $21 $E0 $C2
    add  hl, de                                   ;; 15:7789 $19
    ld   [hl], $60                                ;; 15:778A $36 $60
    ld   hl, wEntitiesPrivateState4Table          ;; 15:778C $21 $40 $C4
    add  hl, de                                   ;; 15:778F $19
    ld   [hl], $01                                ;; 15:7790 $36 $01

ret_015_7792:
    ret                                           ;; 15:7792 $C9

func_015_7793::
    ld   a, $03                                   ;; 15:7793 $3E $03
    call SetEntitySpriteVariant                   ;; 15:7795 $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ;; 15:7798 $CD $88 $7B
    call AddEntityZSpeedToPos_15                  ;; 15:779B $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ;; 15:779E $21 $20 $C3
    add  hl, bc                                   ;; 15:77A1 $09
    dec  [hl]                                     ;; 15:77A2 $35
    dec  [hl]                                     ;; 15:77A3 $35
    ld   hl, wEntitiesPosZTable                   ;; 15:77A4 $21 $10 $C3
    add  hl, bc                                   ;; 15:77A7 $09
    ld   a, [hl]                                  ;; 15:77A8 $7E
    and  $80                                      ;; 15:77A9 $E6 $80
    jr   z, ret_015_77BE                          ;; 15:77AB $28 $11

    ld   [hl], b                                  ;; 15:77AD $70
    ld   hl, wEntitiesSpeedZTable                 ;; 15:77AE $21 $20 $C3
    add  hl, bc                                   ;; 15:77B1 $09
    ld   [hl], $20                                ;; 15:77B2 $36 $20
    call ClearEntitySpeed                         ;; 15:77B4 $CD $7F $3D
    call IncrementEntityState                     ;; 15:77B7 $CD $12 $3B

jr_015_77BA:
    ld   a, WAVE_SFX_MONKEY                       ;; 15:77BA $3E $14
    ldh  [hWaveSfx], a                            ;; 15:77BC $E0 $F3

ret_015_77BE:
    ret                                           ;; 15:77BE $C9

func_015_77BF::
    ld   a, $00                                   ;; 15:77BF $3E $00
    call SetEntitySpriteVariant                   ;; 15:77C1 $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ;; 15:77C4 $CD $88 $7B
    call AddEntityZSpeedToPos_15                  ;; 15:77C7 $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ;; 15:77CA $21 $20 $C3
    add  hl, bc                                   ;; 15:77CD $09
    dec  [hl]                                     ;; 15:77CE $35
    dec  [hl]                                     ;; 15:77CF $35
    ld   hl, wEntitiesPosZTable                   ;; 15:77D0 $21 $10 $C3
    add  hl, bc                                   ;; 15:77D3 $09
    ld   a, [hl]                                  ;; 15:77D4 $7E
    and  $80                                      ;; 15:77D5 $E6 $80
    jr   z, .jr_77FE                              ;; 15:77D7 $28 $25

    ld   [hl], $01                                ;; 15:77D9 $36 $01
    call GetRandomByte                            ;; 15:77DB $CD $0D $28
    and  $0F                                      ;; 15:77DE $E6 $0F
    add  $08                                      ;; 15:77E0 $C6 $08
    ld   hl, wEntitiesSpeedZTable                 ;; 15:77E2 $21 $20 $C3
    add  hl, bc                                   ;; 15:77E5 $09
    ld   [hl], a                                  ;; 15:77E6 $77
    ld   a, $10                                   ;; 15:77E7 $3E $10
    call GetVectorTowardsLink_trampoline          ;; 15:77E9 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 15:77EC $F0 $D7
    cpl                                           ;; 15:77EE $2F
    inc  a                                        ;; 15:77EF $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 15:77F0 $21 $50 $C2
    add  hl, bc                                   ;; 15:77F3 $09
    ld   [hl], a                                  ;; 15:77F4 $77
    ldh  a, [hMultiPurpose1]                      ;; 15:77F5 $F0 $D8
    cpl                                           ;; 15:77F7 $2F
    inc  a                                        ;; 15:77F8 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 15:77F9 $21 $40 $C2
    add  hl, bc                                   ;; 15:77FC $09
    ld   [hl], a                                  ;; 15:77FD $77

.jr_77FE
    ldh  a, [hActiveEntityPosX]                   ;; 15:77FE $F0 $EE
    cp   $A8                                      ;; 15:7800 $FE $A8
    jp   nc, ClearEntityStatus_15                 ;; 15:7802 $D2 $31 $7C

    ldh  a, [hActiveEntityVisualPosY]             ;; 15:7805 $F0 $EC
    cp   $80                                      ;; 15:7807 $FE $80
    jp   nc, ClearEntityStatus_15                 ;; 15:7809 $D2 $31 $7C

    ldh  a, [hFrameCounter]                       ;; 15:780C $F0 $E7
    and  $0F                                      ;; 15:780E $E6 $0F
    jr   z, jr_015_77BA                           ;; 15:7810 $28 $A8

    ret                                           ;; 15:7812 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown057SpriteVariants::
.variant0
    db $7C, $01
    db $7E, $01
.variant1
    db $7E, $21
    db $7C, $21

Data_015_781B::
    db   $00, $0C

Data_015_781D::
    db   $10, $0C, $00, $F4, $F0, $F4, $00, $0C

; Monkey's coconut entity handler
label_015_7825:
    ld   de, Unknown057SpriteVariants             ;; 15:7825 $11 $13 $78
    call RenderActiveEntitySpritesPair            ;; 15:7828 $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:782B $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ;; 15:782E $CD $3E $7B
    ldh  a, [hFrameCounter]                       ;; 15:7831 $F0 $E7
    rra                                           ;; 15:7833 $1F
    rra                                           ;; 15:7834 $1F
    rra                                           ;; 15:7835 $1F
    rra                                           ;; 15:7836 $1F
    and  $01                                      ;; 15:7837 $E6 $01
    call SetEntitySpriteVariant                   ;; 15:7839 $CD $0C $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 15:783C $CD $39 $3B
    call UpdateEntityPosWithSpeed_15              ;; 15:783F $CD $88 $7B
    call AddEntityZSpeedToPos_15                  ;; 15:7842 $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ;; 15:7845 $21 $20 $C3
    add  hl, bc                                   ;; 15:7848 $09
    dec  [hl]                                     ;; 15:7849 $35
    dec  [hl]                                     ;; 15:784A $35
    ld   hl, wEntitiesPosZTable                   ;; 15:784B $21 $10 $C3
    add  hl, bc                                   ;; 15:784E $09
    ld   a, [hl]                                  ;; 15:784F $7E
    and  $80                                      ;; 15:7850 $E6 $80
    jr   z, .ret_788C                             ;; 15:7852 $28 $38

    ld   [hl], b                                  ;; 15:7854 $70
    call GetRandomByte                            ;; 15:7855 $CD $0D $28
    and  $0F                                      ;; 15:7858 $E6 $0F
    add  $10                                      ;; 15:785A $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ;; 15:785C $21 $20 $C3
    add  hl, bc                                   ;; 15:785F $09
    ld   [hl], a                                  ;; 15:7860 $77
    call GetRandomByte                            ;; 15:7861 $CD $0D $28
    and  $07                                      ;; 15:7864 $E6 $07
    ld   e, a                                     ;; 15:7866 $5F
    ld   d, b                                     ;; 15:7867 $50
    ld   hl, Data_015_781D                        ;; 15:7868 $21 $1D $78
    add  hl, de                                   ;; 15:786B $19
    ld   a, [hl]                                  ;; 15:786C $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 15:786D $21 $40 $C2
    add  hl, bc                                   ;; 15:7870 $09
    ld   [hl], a                                  ;; 15:7871 $77
    ld   hl, Data_015_781B                        ;; 15:7872 $21 $1B $78
    add  hl, de                                   ;; 15:7875 $19
    ld   a, [hl]                                  ;; 15:7876 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 15:7877 $21 $50 $C2
    add  hl, bc                                   ;; 15:787A $09
    ld   [hl], a                                  ;; 15:787B $77
    ld   hl, wEntitiesInertiaTable                ;; 15:787C $21 $D0 $C3
    add  hl, bc                                   ;; 15:787F $09
    ld   a, [hl]                                  ;; 15:7880 $7E
    inc  [hl]                                     ;; 15:7881 $34
    ld   a, [hl]                                  ;; 15:7882 $7E
    cp   $04                                      ;; 15:7883 $FE $04
    jp   z, ClearEntityStatus_15                  ;; 15:7885 $CA $31 $7C

    ld   a, JINGLE_BUMP                           ;; 15:7888 $3E $09
    ldh  [hJingle], a                             ;; 15:788A $E0 $F2

.ret_788C
    ret                                           ;; 15:788C $C9
