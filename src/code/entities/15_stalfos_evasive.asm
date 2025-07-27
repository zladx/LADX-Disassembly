; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
StalfosEvasive2SpriteVariants::
.variant0
    db $4A, $01
    db $4C, $01
.variant1
    db $4C, $21
    db $4A, $21
.variant2
    db $4E, $01
    db $4E, $21

Data_015_4E89::
    db   $00, $06, $FA, $FA, $06

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
StalfosEvasive1SpriteVariants::
.variant0
    db $48, $01
    db $48, $61
.variant1
    db $48, $41
    db $48, $21

StalfosEvasiveEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 15:4E96 $21 $B0 $C2
    add  hl, bc                                   ;; 15:4E99 $09
    ld   a, [hl]                                  ;; 15:4E9A $7E
    and  a                                        ;; 15:4E9B $A7
    jr   z, jr_015_4EEE                           ;; 15:4E9C $28 $50

    ld   de, StalfosEvasive1SpriteVariants        ;; 15:4E9E $11 $8E $4E
    call RenderActiveEntitySpritesPair            ;; 15:4EA1 $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:4EA4 $CD $0D $7B
    ldh  a, [hFrameCounter]                       ;; 15:4EA7 $F0 $E7
    rra                                           ;; 15:4EA9 $1F
    rra                                           ;; 15:4EAA $1F
    rra                                           ;; 15:4EAB $1F
    and  $01                                      ;; 15:4EAC $E6 $01
    call SetEntitySpriteVariant                   ;; 15:4EAE $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ;; 15:4EB1 $CD $88 $7B
    call ApplyEntityInteractionWithBackground_trampoline ;; 15:4EB4 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 15:4EB7 $21 $A0 $C2
    add  hl, bc                                   ;; 15:4EBA $09
    ld   a, [hl]                                  ;; 15:4EBB $7E
    and  a                                        ;; 15:4EBC $A7
    jp   nz, label_015_4ECB                       ;; 15:4EBD $C2 $CB $4E

    call DefaultEnemyDamageCollisionHandler_trampoline ;; 15:4EC0 $CD $39 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 15:4EC3 $21 $10 $C4
    add  hl, bc                                   ;; 15:4EC6 $09
    ld   a, [hl]                                  ;; 15:4EC7 $7E
    and  a                                        ;; 15:4EC8 $A7
    jr   z, jr_015_4EDF                           ;; 15:4EC9 $28 $14

label_015_4ECB:
    ldh  a, [hActiveEntityPosX]                   ;; 15:4ECB $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 15:4ECD $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 15:4ECF $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 15:4ED1 $E0 $D8
    ld   a, JINGLE_SWORD_POKING                   ;; 15:4ED3 $3E $07
    ldh  [hJingle], a                             ;; 15:4ED5 $E0 $F2
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ;; 15:4ED7 $3E $05
    call AddTranscientVfx                         ;; 15:4ED9 $CD $C7 $0C
    jp   ClearEntityStatus_15                     ;; 15:4EDC $C3 $31 $7C

jr_015_4EDF:
    ldh  a, [hActiveEntityPosX]                   ;; 15:4EDF $F0 $EE
    cp   $A8                                      ;; 15:4EE1 $FE $A8
    jp   nc, ClearEntityStatus_15                 ;; 15:4EE3 $D2 $31 $7C

    ldh  a, [hActiveEntityVisualPosY]             ;; 15:4EE6 $F0 $EC
    cp   $84                                      ;; 15:4EE8 $FE $84
    jp   nc, ClearEntityStatus_15                 ;; 15:4EEA $D2 $31 $7C

    ret                                           ;; 15:4EED $C9

jr_015_4EEE:
    ld   de, StalfosEvasive2SpriteVariants        ;; 15:4EEE $11 $7D $4E
    call RenderActiveEntitySpritesPair            ;; 15:4EF1 $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:4EF4 $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ;; 15:4EF7 $CD $3E $7B
    call GetEntityTransitionCountdown             ;; 15:4EFA $CD $05 $0C
    jr   nz, .jr_4F02                             ;; 15:4EFD $20 $03

    call DefaultEnemyDamageCollisionHandler_trampoline ;; 15:4EFF $CD $39 $3B

.jr_4F02
    call GetEntityPrivateCountdown1               ;; 15:4F02 $CD $00 $0C
    cp   $01                                      ;; 15:4F05 $FE $01
    jr   nz, .jr_4F50                             ;; 15:4F07 $20 $47

    ldh  a, [hMapId]                              ;; 15:4F09 $F0 $F7
    cp   MAP_ANGLERS_TUNNEL                       ;; 15:4F0B $FE $03
    ret  c                                        ;; 15:4F0D $D8

    ld   a, ENTITY_STALFOS_EVASIVE                ;; 15:4F0E $3E $1E
    call SpawnNewEntity_trampoline                ;; 15:4F10 $CD $86 $3B
    ret  c                                        ;; 15:4F13 $D8

    ld   a, NOISE_SFX_WHOOSH                      ;; 15:4F14 $3E $0A
    ldh  [hNoiseSfx], a                           ;; 15:4F16 $E0 $F4
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 15:4F18 $21 $10 $C4
    add  hl, de                                   ;; 15:4F1B $19
    ld   [hl], b                                  ;; 15:4F1C $70
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 15:4F1D $21 $40 $C3
    add  hl, de                                   ;; 15:4F20 $19
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 15:4F21 $CB $F6
    set  ENTITY_PHYSICS_B_SHADOW, [hl]            ;; 15:4F23 $CB $E6
    ld   hl, wEntitiesOptions1Table               ;; 15:4F25 $21 $30 $C4
    add  hl, de                                   ;; 15:4F28 $19
    set  ENTITY_OPT1_B_EXCLUDED_FROM_KILL_ALL, [hl] ;; 15:4F29 $CB $CE
    set  4, [hl]                                  ;; 15:4F2B $CB $E6
    ldh  a, [hMultiPurpose0]                      ;; 15:4F2D $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 15:4F2F $21 $00 $C2
    add  hl, de                                   ;; 15:4F32 $19
    ld   [hl], a                                  ;; 15:4F33 $77
    ldh  a, [hMultiPurpose1]                      ;; 15:4F34 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 15:4F36 $21 $10 $C2
    add  hl, de                                   ;; 15:4F39 $19
    ld   [hl], a                                  ;; 15:4F3A $77
    ldh  a, [hMultiPurpose3]                      ;; 15:4F3B $F0 $DA
    ld   hl, wEntitiesPosZTable                   ;; 15:4F3D $21 $10 $C3
    add  hl, de                                   ;; 15:4F40 $19
    ld   [hl], a                                  ;; 15:4F41 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 15:4F42 $21 $B0 $C2
    add  hl, de                                   ;; 15:4F45 $19
    inc  [hl]                                     ;; 15:4F46 $34
    push bc                                       ;; 15:4F47 $C5
    ld   c, e                                     ;; 15:4F48 $4B
    ld   b, d                                     ;; 15:4F49 $42
    ld   a, $18                                   ;; 15:4F4A $3E $18
    call ApplyVectorTowardsLink_trampoline        ;; 15:4F4C $CD $AA $3B
    pop  bc                                       ;; 15:4F4F $C1

.jr_4F50
    ld   hl, wEntitiesInertiaTable                ;; 15:4F50 $21 $D0 $C3
    add  hl, bc                                   ;; 15:4F53 $09
    ld   a, [hl]                                  ;; 15:4F54 $7E
    JP_TABLE                                      ;; 15:4F55
._00 dw func_015_4F5A                             ;; 15:4F56
._01 dw func_015_501A                             ;; 15:4F58

func_015_4F5A::
    call UpdateEntityPosWithSpeed_15              ;; 15:4F5A $CD $88 $7B
    call ApplyEntityInteractionWithBackground_trampoline ;; 15:4F5D $CD $23 $3B
    ldh  a, [hJoypadState]                        ;; 15:4F60 $F0 $CC
    and  J_A | J_B                                ;; 15:4F62 $E6 $30
    jr   z, .jr_4FAE                              ;; 15:4F64 $28 $48

    call GetEntityXDistanceToLink_15              ;; 15:4F66 $CD $DB $7B
    add  $24                                      ;; 15:4F69 $C6 $24
    cp   $48                                      ;; 15:4F6B $FE $48
    jr   nc, .jr_4FAE                             ;; 15:4F6D $30 $3F

    call GetEntityRealYDistanceToLink_15          ;; 15:4F6F $CD $EB $7B
    add  $24                                      ;; 15:4F72 $C6 $24
    cp   $48                                      ;; 15:4F74 $FE $48
    jr   nc, .jr_4FAE                             ;; 15:4F76 $30 $36

    call GetEntityTransitionCountdown             ;; 15:4F78 $CD $05 $0C
    ld   [hl], $08                                ;; 15:4F7B $36 $08
    call GetEntityPrivateCountdown1               ;; 15:4F7D $CD $00 $0C
    ld   [hl], b                                  ;; 15:4F80 $70
    ld   hl, wEntitiesInertiaTable                ;; 15:4F81 $21 $D0 $C3
    add  hl, bc                                   ;; 15:4F84 $09
    inc  [hl]                                     ;; 15:4F85 $34
    ld   hl, wEntitiesSpeedZTable                 ;; 15:4F86 $21 $20 $C3
    add  hl, bc                                   ;; 15:4F89 $09
    ld   [hl], $15                                ;; 15:4F8A $36 $15
    ld   a, JINGLE_JUMP                           ;; 15:4F8C $3E $24
    ldh  [hJingle], a                             ;; 15:4F8E $E0 $F2
    ld   a, $12                                   ;; 15:4F90 $3E $12
    call GetVectorTowardsLink_trampoline          ;; 15:4F92 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 15:4F95 $F0 $D7
    cpl                                           ;; 15:4F97 $2F
    inc  a                                        ;; 15:4F98 $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 15:4F99 $21 $50 $C2
    add  hl, bc                                   ;; 15:4F9C $09
    ld   [hl], a                                  ;; 15:4F9D $77
    ldh  a, [hMultiPurpose1]                      ;; 15:4F9E $F0 $D8
    cpl                                           ;; 15:4FA0 $2F
    inc  a                                        ;; 15:4FA1 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4FA2 $21 $40 $C2
    add  hl, bc                                   ;; 15:4FA5 $09
    ld   [hl], a                                  ;; 15:4FA6 $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 15:4FA7 $21 $B0 $C3
    add  hl, bc                                   ;; 15:4FAA $09
    ld   [hl], $02                                ;; 15:4FAB $36 $02
    ret                                           ;; 15:4FAD $C9

.jr_4FAE
    ld   hl, wEntitiesCollisionsTable             ;; 15:4FAE $21 $A0 $C2
    add  hl, bc                                   ;; 15:4FB1 $09
    ld   a, [hl]                                  ;; 15:4FB2 $7E
    and  $03                                      ;; 15:4FB3 $E6 $03
    jr   nz, .jr_4FC6                             ;; 15:4FB5 $20 $0F

    ld   a, [hl]                                  ;; 15:4FB7 $7E
    and  $0C                                      ;; 15:4FB8 $E6 $0C
    jr   z, jr_015_4FCE                           ;; 15:4FBA $28 $12

    ld   hl, wEntitiesSpeedYTable                 ;; 15:4FBC $21 $50 $C2
    add  hl, bc                                   ;; 15:4FBF $09
    ld   a, [hl]                                  ;; 15:4FC0 $7E
    xor  $F0                                      ;; 15:4FC1 $EE $F0
    ld   [hl], a                                  ;; 15:4FC3 $77
    jr   jr_015_4FCE                              ;; 15:4FC4 $18 $08

.jr_4FC6
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4FC6 $21 $40 $C2
    add  hl, bc                                   ;; 15:4FC9 $09
    ld   a, [hl]                                  ;; 15:4FCA $7E
    xor  $F0                                      ;; 15:4FCB $EE $F0
    ld   [hl], a                                  ;; 15:4FCD $77

jr_015_4FCE:
    ld   hl, wEntitiesStateTable                  ;; 15:4FCE $21 $90 $C2
    add  hl, bc                                   ;; 15:4FD1 $09
    ld   a, [hl]                                  ;; 15:4FD2 $7E
    and  a                                        ;; 15:4FD3 $A7
    jr   nz, .jr_4FDD                             ;; 15:4FD4 $20 $07

    call GetRandomByte                            ;; 15:4FD6 $CD $0D $28
    and  $2F                                      ;; 15:4FD9 $E6 $2F
    jr   nz, jr_015_500A                          ;; 15:4FDB $20 $2D

.jr_4FDD
    xor  a                                        ;; 15:4FDD $AF
    ld   hl, wEntitiesSpeedYTable                 ;; 15:4FDE $21 $50 $C2
    add  hl, bc                                   ;; 15:4FE1 $09
    ld   [hl], a                                  ;; 15:4FE2 $77
    call GetRandomByte                            ;; 15:4FE3 $CD $0D $28
    and  $03                                      ;; 15:4FE6 $E6 $03
    ld   e, a                                     ;; 15:4FE8 $5F
    ld   d, b                                     ;; 15:4FE9 $50
    ld   hl, Data_015_4E89                        ;; 15:4FEA $21 $89 $4E
    add  hl, de                                   ;; 15:4FED $19
    ld   a, [hl]                                  ;; 15:4FEE $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 15:4FEF $21 $40 $C2
    add  hl, bc                                   ;; 15:4FF2 $09
    ld   [hl], a                                  ;; 15:4FF3 $77
    and  a                                        ;; 15:4FF4 $A7
    jr   nz, jr_015_500A                          ;; 15:4FF5 $20 $13

    call GetRandomByte                            ;; 15:4FF7 $CD $0D $28
    and  $01                                      ;; 15:4FFA $E6 $01
    add  $03                                      ;; 15:4FFC $C6 $03
    ld   e, a                                     ;; 15:4FFE $5F
    ld   d, b                                     ;; 15:4FFF $50
    ld   hl, Data_015_4E89                        ;; 15:5000 $21 $89 $4E
    add  hl, de                                   ;; 15:5003 $19
    ld   a, [hl]                                  ;; 15:5004 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 15:5005 $21 $50 $C2
    add  hl, bc                                   ;; 15:5008 $09
    ld   [hl], a                                  ;; 15:5009 $77

jr_015_500A:
    ld   hl, wEntitiesStateTable                  ;; 15:500A $21 $90 $C2
    add  hl, bc                                   ;; 15:500D $09
    xor  a                                        ;; 15:500E $AF
    ld   [hl], a                                  ;; 15:500F $77
    ldh  a, [hFrameCounter]                       ;; 15:5010 $F0 $E7
    rra                                           ;; 15:5012 $1F
    rra                                           ;; 15:5013 $1F
    rra                                           ;; 15:5014 $1F
    and  $01                                      ;; 15:5015 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 15:5017 $C3 $0C $3B

func_015_501A::
    call UpdateEntityPosWithSpeed_15              ;; 15:501A $CD $88 $7B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 15:501D $21 $10 $C4
    add  hl, bc                                   ;; 15:5020 $09
    ld   a, [hl]                                  ;; 15:5021 $7E
    push hl                                       ;; 15:5022 $E5
    ld   [hl], $01                                ;; 15:5023 $36 $01
    call ApplyEntityInteractionWithBackground_trampoline ;; 15:5025 $CD $23 $3B
    pop  hl                                       ;; 15:5028 $E1
    ld   [hl], b                                  ;; 15:5029 $70
    call AddEntityZSpeedToPos_15                  ;; 15:502A $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ;; 15:502D $21 $20 $C3
    add  hl, bc                                   ;; 15:5030 $09
    dec  [hl]                                     ;; 15:5031 $35
    ld   hl, wEntitiesPosZTable                   ;; 15:5032 $21 $10 $C3
    add  hl, bc                                   ;; 15:5035 $09
    ld   a, [hl]                                  ;; 15:5036 $7E
    and  $80                                      ;; 15:5037 $E6 $80
    jr   z, .ret_5057                             ;; 15:5039 $28 $1C

    ld   [hl], b                                  ;; 15:503B $70
    ld   hl, wEntitiesSpeedZTable                 ;; 15:503C $21 $20 $C3
    add  hl, bc                                   ;; 15:503F $09
    ld   [hl], b                                  ;; 15:5040 $70
    ld   hl, wEntitiesSpeedYTable                 ;; 15:5041 $21 $50 $C2
    add  hl, bc                                   ;; 15:5044 $09
    ld   [hl], $08                                ;; 15:5045 $36 $08
    ld   hl, wEntitiesSpeedXTable                 ;; 15:5047 $21 $40 $C2
    add  hl, bc                                   ;; 15:504A $09
    ld   [hl], $08                                ;; 15:504B $36 $08
    ld   hl, wEntitiesInertiaTable                ;; 15:504D $21 $D0 $C3
    add  hl, bc                                   ;; 15:5050 $09
    ld   [hl], b                                  ;; 15:5051 $70
    call GetEntityPrivateCountdown1               ;; 15:5052 $CD $00 $0C
    ld   [hl], $10                                ;; 15:5055 $36 $10

.ret_5057
    ret                                           ;; 15:5057 $C9
