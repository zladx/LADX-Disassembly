LiftableStatueSpriteRect::
    db   $F0, $00, $48, $06, $F0, $08, $48, $26, $00, $00, $4A, $06, $00, $08, $4A, $26

LiftableStatueSpriteRect_BottleGrotto::
    db   $F0, $00, $78, $06, $F0, $08, $78, $26, $00, $00, $7A, $06, $00, $08, $7A, $26

LiftableStatueRubbleSprite::
    db   $16, $01

LiftableStatueEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 19:4022 $21 $B0 $C2
    add  hl, bc                                   ;; 19:4025 $09
    ld   a, [hl]                                  ;; 19:4026 $7E
    and  a                                        ;; 19:4027 $A7
    jr   z, .notRubblePiece                       ;; 19:4028 $28 $20

    ld   de, LiftableStatueRubbleSprite           ;; 19:402A $11 $20 $40
    call RenderActiveEntitySprite                 ;; 19:402D $CD $77 $3C
    call ReturnIfNonInteractive_19                ;; 19:4030 $CD $3D $7D
    call UpdateEntityPosWithSpeed_19              ;; 19:4033 $CD $B8 $7D
    call AddEntityZSpeedToPos_19                  ;; 19:4036 $CD $F1 $7D
    ld   hl, wEntitiesSpeedZTable                 ;; 19:4039 $21 $20 $C3
    add  hl, bc                                   ;; 19:403C $09
    dec  [hl]                                     ;; 19:403D $35
    dec  [hl]                                     ;; 19:403E $35
    ld   hl, wEntitiesPosZTable                   ;; 19:403F $21 $10 $C3
    add  hl, bc                                   ;; 19:4042 $09
    ld   a, [hl]                                  ;; 19:4043 $7E
    and  $80                                      ;; 19:4044 $E6 $80
    jp   nz, ClearEntityStatus_19                 ;; 19:4046 $C2 $61 $7E

    ret                                           ;; 19:4049 $C9

.notRubblePiece
    ld   hl, LiftableStatueSpriteRect             ;; 19:404A $21 $00 $40
    ldh  a, [hMapId]                              ;; 19:404D $F0 $F7
    cp   MAP_BOTTLE_GROTTO                        ;; 19:404F $FE $01
    jr   nz, .jr_4056                             ;; 19:4051 $20 $03

    ld   hl, LiftableStatueSpriteRect_BottleGrotto ;; 19:4053 $21 $10 $40

.jr_4056
    ld   c, $04                                   ;; 19:4056 $0E $04
    call RenderActiveEntitySpritesRect            ;; 19:4058 $CD $E6 $3C
    call label_3CD9                               ;; 19:405B $CD $D9 $3C
    call ReturnIfNonInteractive_19                ;; 19:405E $CD $3D $7D
    call DecrementEntityIgnoreHitsCountdown       ;; 19:4061 $CD $56 $0C
    call label_3B70                               ;; 19:4064 $CD $70 $3B
    ldh  a, [hActiveEntityState]                  ;; 19:4067 $F0 $F0
    JP_TABLE                                      ;; 19:4069
._00 dw LiftableStatueState_Standing
._01 dw LiftableStatueState_Lifted_Thrown
._02 dw LiftableStatueState_Lifted_Thrown

LiftableStatueState_Standing::
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:4070 $CD $23 $3B
    call PushLinkOutOfEntity_19                   ;; 19:4073 $CD $A2 $7C
    call EntityLinkPositionXDifference_19         ;; 19:4076 $CD $0B $7E
    add  $10                                      ;; 19:4079 $C6 $10
    cp   $20                                      ;; 19:407B $FE $20
    jp   nc, .notBeingLifted                      ;; 19:407D $D2 $1C $41

    call EntityLinkPositionYDifference_19         ;; 19:4080 $CD $1B $7E
    add  $20                                      ;; 19:4083 $C6 $20
    cp   $30                                      ;; 19:4085 $FE $30
    jp   nc, .notBeingLifted                      ;; 19:4087 $D2 $1C $41

    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 19:408A $FA $9B $C1
    and  a                                        ;; 19:408D $A7
    jp   nz, .notBeingLifted                      ;; 19:408E $C2 $1C $41

    ld   a, [wInventoryItems.BButtonSlot]         ;; 19:4091 $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 19:4094 $FE $03
    jr   nz, .powerBraceletNotOnB                 ;; 19:4096 $20 $08

    ldh  a, [hPressedButtonsMask]                 ;; 19:4098 $F0 $CB
    and  J_B                                      ;; 19:409A $E6 $20
    jr   nz, .usePowerBracelet                    ;; 19:409C $20 $0F

    jr   .notBeingLifted                          ;; 19:409E $18 $7C

.powerBraceletNotOnB
    ld   a, [wInventoryItems.AButtonSlot]         ;; 19:40A0 $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 19:40A3 $FE $03
    jr   nz, .notBeingLifted                      ;; 19:40A5 $20 $75

    ldh  a, [hPressedButtonsMask]                 ;; 19:40A7 $F0 $CB
    and  J_A                                      ;; 19:40A9 $E6 $10
    jr   z, .notBeingLifted                       ;; 19:40AB $28 $6F

.usePowerBracelet
    ld   a, [wC3CF]                               ;; 19:40AD $FA $CF $C3
    and  a                                        ;; 19:40B0 $A7
    jr   nz, .notBeingLifted                      ;; 19:40B1 $20 $69

    ld   a, $01                                   ;; 19:40B3 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:40B5 $E0 $A1
    ld   [wC3CF], a                               ;; 19:40B7 $EA $CF $C3
    ldh  a, [hLinkDirection]                      ;; 19:40BA $F0 $9E
    ld   e, a                                     ;; 19:40BC $5F
    ld   d, $00                                   ;; 19:40BD $16 $00
    ld   hl, LinkDirectionToLinkAnimationState_2  ;; 19:40BF $21 $51 $1F
    add  hl, de                                   ;; 19:40C2 $19
    ld   a, [hl]                                  ;; 19:40C3 $7E
    ldh  [hLinkAnimationState], a                 ;; 19:40C4 $E0 $9D
    ld   hl, LinkDirectionToLiftDirectionButton   ;; 19:40C6 $21 $55 $1F
    add  hl, de                                   ;; 19:40C9 $19
    ldh  a, [hPressedButtonsMask]                 ;; 19:40CA $F0 $CB
    and  [hl]                                     ;; 19:40CC $A6
    jr   z, .notBeingLifted                       ;; 19:40CD $28 $4D

    ld   hl, data_1F59                            ;; 19:40CF $21 $59 $1F
    add  hl, de                                   ;; 19:40D2 $19
    ld   a, [hl]                                  ;; 19:40D3 $7E
    ld   [wC13C], a                               ;; 19:40D4 $EA $3C $C1
    ld   hl, data_1F5D                            ;; 19:40D7 $21 $5D $1F
    add  hl, de                                   ;; 19:40DA $19
    ld   a, [hl]                                  ;; 19:40DB $7E
    ld   [wC13B], a                               ;; 19:40DC $EA $3B $C1
    ld   hl, hLinkAnimationState                  ;; 19:40DF $21 $9D $FF
    inc  [hl]                                     ;; 19:40E2 $34
    ld   a, [wPowerBraceletLevel]                 ;; 19:40E3 $FA $43 $DB
    cp   $02                                      ;; 19:40E6 $FE $02
    jr   nz, .notBeingLifted                      ;; 19:40E8 $20 $32

    ld   e, $08                                   ;; 19:40EA $1E $08
    ld   a, [wActivePowerUp]                      ;; 19:40EC $FA $7C $D4
    and  a                                        ;; 19:40EF $A7
    jr   z, .notLiftFaster                        ;; 19:40F0 $28 $02
    ld   e, $03                                   ;; 19:40F2 $1E $03
.notLiftFaster
    ld   hl, wEntitiesInertiaTable                ;; 19:40F4 $21 $D0 $C3
    add  hl, bc                                   ;; 19:40F7 $09
    inc  [hl]                                     ;; 19:40F8 $34
    ld   a, [hl]                                  ;; 19:40F9 $7E
    cp   e                                        ;; 19:40FA $BB
    jr   c, .ret                                  ;; 19:40FB $38 $25

    call IncrementEntityState                     ;; 19:40FD $CD $12 $3B
    ld   [hl], $02                                ;; 19:4100 $36 $02
    ld   hl, wEntitiesStatusTable                 ;; 19:4102 $21 $80 $C2
    add  hl, bc                                   ;; 19:4105 $09
    ld   [hl], $07                                ;; 19:4106 $36 $07
    ld   hl, wEntitiesLiftedTable                 ;; 19:4108 $21 $90 $C4
    add  hl, bc                                   ;; 19:410B $09
    ld   [hl], b                                  ;; 19:410C $70
    ldh  a, [hLinkDirection]                      ;; 19:410D $F0 $9E
    ld   [wC15D], a                               ;; 19:410F $EA $5D $C1
    call GetEntityTransitionCountdown             ;; 19:4112 $CD $05 $0C
    ld   [hl], $02                                ;; 19:4115 $36 $02
    ld   hl, hWaveSfx                             ;; 19:4117 $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ;; 19:411A $36 $02

.notBeingLifted:
    ld   hl, wEntitiesInertiaTable                ;; 19:411C $21 $D0 $C3
    add  hl, bc                                   ;; 19:411F $09
    ld   [hl], b                                  ;; 19:4120 $70
    ret                                           ;; 19:4121 $C9

.ret:
    ret                                           ;; 19:4122 $C9

LiftableStatueState_Lifted_Thrown::
    call UpdateEntityPosWithSpeed_19              ;; 19:4123 $CD $B8 $7D
    call AddEntityZSpeedToPos_19                  ;; 19:4126 $CD $F1 $7D
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:4129 $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                 ;; 19:412C $21 $20 $C3
    add  hl, bc                                   ;; 19:412F $09
    dec  [hl]                                     ;; 19:4130 $35
    dec  [hl]                                     ;; 19:4131 $35
    ld   hl, wEntitiesCollisionsTable             ;; 19:4132 $21 $A0 $C2
    add  hl, bc                                   ;; 19:4135 $09
    ld   a, [hl]                                  ;; 19:4136 $7E
    and  $0F                                      ;; 19:4137 $E6 $0F
    jr   nz, .jr_4143                             ;; 19:4139 $20 $08

    ld   hl, wEntitiesPosZTable                   ;; 19:413B $21 $10 $C3
    add  hl, bc                                   ;; 19:413E $09
    ld   a, [hl]                                  ;; 19:413F $7E
    and  $80                                      ;; 19:4140 $E6 $80
    ret  z                                        ;; 19:4142 $C8

.jr_4143
    call LiftableStatue_SpawnRubble               ;; 19:4143 $CD $83 $41
    ld   a, [wRoomEvent]                          ;; 19:4146 $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ;; 19:4149 $E6 $1F
    cp   TRIGGER_THROW_AT_DOOR                    ;; 19:414B $FE $0B
    ret  nz                                       ;; 19:414D $C0

    ld   a, [wEntityVerticallyCollidedObject]     ;; 19:414E $FA $0D $C5
    cp   $35                                      ;; 19:4151 $FE $35
    jr   c, .jr_4159                              ;; 19:4153 $38 $04

    cp   $3D                                      ;; 19:4155 $FE $3D
    jr   c, jr_019_4162                           ;; 19:4157 $38 $09

.jr_4159
    ld   a, [wEntityHorizontallyCollidedObject]   ;; 19:4159 $FA $03 $C5
    cp   $35                                      ;; 19:415C $FE $35
    ret  c                                        ;; 19:415E $D8

    cp   $3D                                      ;; 19:415F $FE $3D
    ret  nc                                       ;; 19:4161 $D0

jr_019_4162:
    jp   MarkTriggerAsResolved                    ;; 19:4162 $C3 $60 $0C

LiftableStatue_RubbleX::
    db   $00, $08, $00, $08, $00, $08

LiftableStatue_RubbleY::
    db   $F8, $F8, $00, $00, $08, $08

LiftableStatue_RubbleSpeedX::
    db   $FC, $05, $FA, $06, $FB, $04

LiftableStatue_RubbleSpeedY::
    db   $FC, $F8, $FE, $FF, $03, $02

LiftableStatue_RubbleSpeedZ::
    db   $18, $14, $13, $16, $12, $14

LiftableStatue_SpawnRubble::
    ld   a, $00                                   ;; 19:4183 $3E $00

.spawnLoop:
    ldh  [hMultiPurposeG], a                      ;; 19:4185 $E0 $E8
    ld   a, ENTITY_LIFTABLE_STATUE                ;; 19:4187 $3E $9D
    call SpawnNewEntity_trampoline                ;; 19:4189 $CD $86 $3B
    jr   c, .spawnFailed                          ;; 19:418C $38 $54

    ld   hl, wEntitiesPrivateState1Table          ;; 19:418E $21 $B0 $C2
    add  hl, de                                   ;; 19:4191 $19
    inc  [hl]                                     ;; 19:4192 $34

.jr_4193
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 19:4193 $21 $40 $C3
    add  hl, de                                   ;; 19:4196 $19
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 19:4197 $36 $C1
    push bc                                       ;; 19:4199 $C5
    ldh  a, [hMultiPurposeG]                      ;; 19:419A $F0 $E8
    ld   c, a                                     ;; 19:419C $4F
    ld   hl, LiftableStatue_RubbleX               ;; 19:419D $21 $65 $41
    add  hl, bc                                   ;; 19:41A0 $09
    ldh  a, [hMultiPurpose0]                      ;; 19:41A1 $F0 $D7
    add  [hl]                                     ;; 19:41A3 $86
    ld   hl, wEntitiesPosXTable                   ;; 19:41A4 $21 $00 $C2
    add  hl, de                                   ;; 19:41A7 $19
    ld   [hl], a                                  ;; 19:41A8 $77
    ld   hl, LiftableStatue_RubbleY               ;; 19:41A9 $21 $6B $41
    add  hl, bc                                   ;; 19:41AC $09
    ldh  a, [hMultiPurpose1]                      ;; 19:41AD $F0 $D8
    add  [hl]                                     ;; 19:41AF $86
    ld   hl, wEntitiesPosYTable                   ;; 19:41B0 $21 $10 $C2
    add  hl, de                                   ;; 19:41B3 $19
    ld   [hl], a                                  ;; 19:41B4 $77
    ldh  a, [hMultiPurpose3]                      ;; 19:41B5 $F0 $DA
    ld   hl, wEntitiesPosZTable                   ;; 19:41B7 $21 $10 $C3
    add  hl, de                                   ;; 19:41BA $19
    ld   [hl], a                                  ;; 19:41BB $77
    ld   hl, LiftableStatue_RubbleSpeedX          ;; 19:41BC $21 $71 $41
    add  hl, bc                                   ;; 19:41BF $09
    ld   a, [hl]                                  ;; 19:41C0 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 19:41C1 $21 $40 $C2
    add  hl, de                                   ;; 19:41C4 $19
    ld   [hl], a                                  ;; 19:41C5 $77
    ld   hl, LiftableStatue_RubbleSpeedY          ;; 19:41C6 $21 $77 $41
    add  hl, bc                                   ;; 19:41C9 $09
    ld   a, [hl]                                  ;; 19:41CA $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 19:41CB $21 $50 $C2
    add  hl, de                                   ;; 19:41CE $19
    ld   [hl], a                                  ;; 19:41CF $77
    ld   hl, LiftableStatue_RubbleSpeedZ          ;; 19:41D0 $21 $7D $41
    add  hl, bc                                   ;; 19:41D3 $09
    ld   a, [hl]                                  ;; 19:41D4 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 19:41D5 $21 $20 $C3
    add  hl, de                                   ;; 19:41D8 $19
    ld   [hl], a                                  ;; 19:41D9 $77
    pop  bc                                       ;; 19:41DA $C1
    ldh  a, [hMultiPurposeG]                      ;; 19:41DB $F0 $E8
    inc  a                                        ;; 19:41DD $3C
    cp   $06                                      ;; 19:41DE $FE $06
    jr   nz, .spawnLoop                           ;; 19:41E0 $20 $A3

.spawnFailed:
    ld   a, NOISE_SFX_BREAK                       ;; 19:41E2 $3E $29
    ldh  [hNoiseSfx], a                           ;; 19:41E4 $E0 $F4
    ldh  a, [hActiveEntityPosX]                   ;; 19:41E6 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 19:41E8 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:41EA $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 19:41EC $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 19:41EE $3E $02
    call AddTranscientVfx                         ;; 19:41F0 $CD $C7 $0C
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:41F3 $F0 $EC
    sub  $10                                      ;; 19:41F5 $D6 $10
    ldh  [hMultiPurpose1], a                      ;; 19:41F7 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 19:41F9 $3E $02
    call AddTranscientVfx                         ;; 19:41FB $CD $C7 $0C
    jp   ClearEntityStatus_19                     ;; 19:41FE $C3 $61 $7E
