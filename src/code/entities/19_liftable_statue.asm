LiftableStatueSpriteRect::
    db   $F0, $00, $48, $06, $F0, $08, $48, $26, $00, $00, $4A, $06, $00, $08, $4A, $26

LiftableStatueSpriteRect_BottleGrotto::
    db   $F0, $00, $78, $06, $F0, $08, $78, $26, $00, $00, $7A, $06, $00, $08, $7A, $26

LiftableStatueRubbleSprite::
    db   $16, $01

LiftableStatueEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4022: $21 $B0 $C2
    add  hl, bc                                   ; $4025: $09
    ld   a, [hl]                                  ; $4026: $7E
    and  a                                        ; $4027: $A7
    jr   z, .notRubblePiece                       ; $4028: $28 $20

    ld   de, LiftableStatueRubbleSprite           ; $402A: $11 $20 $40
    call RenderActiveEntitySprite                 ; $402D: $CD $77 $3C
    call ReturnIfNonInteractive_19                ; $4030: $CD $3D $7D
    call UpdateEntityPosWithSpeed_19              ; $4033: $CD $B8 $7D
    call AddEntityZSpeedToPos_19                  ; $4036: $CD $F1 $7D
    ld   hl, wEntitiesSpeedZTable                 ; $4039: $21 $20 $C3
    add  hl, bc                                   ; $403C: $09
    dec  [hl]                                     ; $403D: $35
    dec  [hl]                                     ; $403E: $35
    ld   hl, wEntitiesPosZTable                   ; $403F: $21 $10 $C3
    add  hl, bc                                   ; $4042: $09
    ld   a, [hl]                                  ; $4043: $7E
    and  $80                                      ; $4044: $E6 $80
    jp   nz, ClearEntityStatus_19                 ; $4046: $C2 $61 $7E

    ret                                           ; $4049: $C9

.notRubblePiece
    ld   hl, LiftableStatueSpriteRect             ; $404A: $21 $00 $40
    ldh  a, [hMapId]                              ; $404D: $F0 $F7
    cp   MAP_BOTTLE_GROTTO                        ; $404F: $FE $01
    jr   nz, .jr_4056                             ; $4051: $20 $03

    ld   hl, LiftableStatueSpriteRect_BottleGrotto ; $4053: $21 $10 $40

.jr_4056
    ld   c, $04                                   ; $4056: $0E $04
    call RenderActiveEntitySpritesRect            ; $4058: $CD $E6 $3C
    call label_3CD9                               ; $405B: $CD $D9 $3C
    call ReturnIfNonInteractive_19                ; $405E: $CD $3D $7D
    call DecrementEntityIgnoreHitsCountdown       ; $4061: $CD $56 $0C
    call label_3B70                               ; $4064: $CD $70 $3B
    ldh  a, [hActiveEntityState]                  ; $4067: $F0 $F0
    JP_TABLE                                      ; $4069
._00 dw LiftableStatueState_Standing
._01 dw LiftableStatueState_Lifted_Thrown
._02 dw LiftableStatueState_Lifted_Thrown

LiftableStatueState_Standing::
    call label_3B23                               ; $4070: $CD $23 $3B
    call PushLinkOutOfEntity_19                   ; $4073: $CD $A2 $7C
    call EntityLinkPositionXDifference_19         ; $4076: $CD $0B $7E
    add  $10                                      ; $4079: $C6 $10
    cp   $20                                      ; $407B: $FE $20
    jp   nc, .notBeingLifted                      ; $407D: $D2 $1C $41

    call EntityLinkPositionYDifference_19         ; $4080: $CD $1B $7E
    add  $20                                      ; $4083: $C6 $20
    cp   $30                                      ; $4085: $FE $30
    jp   nc, .notBeingLifted                      ; $4087: $D2 $1C $41

    ld   a, [wLinkAttackStepAnimationCountdown]   ; $408A: $FA $9B $C1
    and  a                                        ; $408D: $A7
    jp   nz, .notBeingLifted                      ; $408E: $C2 $1C $41

    ld   a, [wInventoryItems.BButtonSlot]         ; $4091: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $4094: $FE $03
    jr   nz, .powerBraceletNotOnB                 ; $4096: $20 $08

    ldh  a, [hPressedButtonsMask]                 ; $4098: $F0 $CB
    and  J_B                                      ; $409A: $E6 $20
    jr   nz, .usePowerBracelet                    ; $409C: $20 $0F

    jr   .notBeingLifted                          ; $409E: $18 $7C

.powerBraceletNotOnB
    ld   a, [wInventoryItems.AButtonSlot]         ; $40A0: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $40A3: $FE $03
    jr   nz, .notBeingLifted                      ; $40A5: $20 $75

    ldh  a, [hPressedButtonsMask]                 ; $40A7: $F0 $CB
    and  J_A                                      ; $40A9: $E6 $10
    jr   z, .notBeingLifted                       ; $40AB: $28 $6F

.usePowerBracelet
    ld   a, [wC3CF]                               ; $40AD: $FA $CF $C3
    and  a                                        ; $40B0: $A7
    jr   nz, .notBeingLifted                      ; $40B1: $20 $69

    ld   a, $01                                   ; $40B3: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $40B5: $E0 $A1
    ld   [wC3CF], a                               ; $40B7: $EA $CF $C3
    ldh  a, [hLinkDirection]                      ; $40BA: $F0 $9E
    ld   e, a                                     ; $40BC: $5F
    ld   d, $00                                   ; $40BD: $16 $00
    ld   hl, LinkDirectionToLinkAnimationState_2  ; $40BF: $21 $51 $1F
    add  hl, de                                   ; $40C2: $19
    ld   a, [hl]                                  ; $40C3: $7E
    ldh  [hLinkAnimationState], a                 ; $40C4: $E0 $9D
    ld   hl, LinkDirectionToLiftDirectionButton   ; $40C6: $21 $55 $1F
    add  hl, de                                   ; $40C9: $19
    ldh  a, [hPressedButtonsMask]                 ; $40CA: $F0 $CB
    and  [hl]                                     ; $40CC: $A6
    jr   z, .notBeingLifted                       ; $40CD: $28 $4D

    ld   hl, data_1F59                            ; $40CF: $21 $59 $1F
    add  hl, de                                   ; $40D2: $19
    ld   a, [hl]                                  ; $40D3: $7E
    ld   [wC13C], a                               ; $40D4: $EA $3C $C1
    ld   hl, data_1F5D                            ; $40D7: $21 $5D $1F
    add  hl, de                                   ; $40DA: $19
    ld   a, [hl]                                  ; $40DB: $7E
    ld   [wC13B], a                               ; $40DC: $EA $3B $C1
    ld   hl, hLinkAnimationState                  ; $40DF: $21 $9D $FF
    inc  [hl]                                     ; $40E2: $34
    ld   a, [wPowerBraceletLevel]                 ; $40E3: $FA $43 $DB
    cp   $02                                      ; $40E6: $FE $02
    jr   nz, .notBeingLifted                      ; $40E8: $20 $32

    ld   e, $08                                   ; $40EA: $1E $08
    ld   a, [wActivePowerUp]                      ; $40EC: $FA $7C $D4
    and  a                                        ; $40EF: $A7
    jr   z, .notLiftFaster                        ; $40F0: $28 $02
    ld   e, $03                                   ; $40F2: $1E $03
.notLiftFaster
    ld   hl, wEntitiesInertiaTable                ; $40F4: $21 $D0 $C3
    add  hl, bc                                   ; $40F7: $09
    inc  [hl]                                     ; $40F8: $34
    ld   a, [hl]                                  ; $40F9: $7E
    cp   e                                        ; $40FA: $BB
    jr   c, .ret                                  ; $40FB: $38 $25

    call IncrementEntityState                     ; $40FD: $CD $12 $3B
    ld   [hl], $02                                ; $4100: $36 $02
    ld   hl, wEntitiesStatusTable                 ; $4102: $21 $80 $C2
    add  hl, bc                                   ; $4105: $09
    ld   [hl], $07                                ; $4106: $36 $07
    ld   hl, wEntitiesLiftedTable                 ; $4108: $21 $90 $C4
    add  hl, bc                                   ; $410B: $09
    ld   [hl], b                                  ; $410C: $70
    ldh  a, [hLinkDirection]                      ; $410D: $F0 $9E
    ld   [wC15D], a                               ; $410F: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $4112: $CD $05 $0C
    ld   [hl], $02                                ; $4115: $36 $02
    ld   hl, hWaveSfx                             ; $4117: $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ; $411A: $36 $02

.notBeingLifted:
    ld   hl, wEntitiesInertiaTable                ; $411C: $21 $D0 $C3
    add  hl, bc                                   ; $411F: $09
    ld   [hl], b                                  ; $4120: $70
    ret                                           ; $4121: $C9

.ret:
    ret                                           ; $4122: $C9

LiftableStatueState_Lifted_Thrown::
    call UpdateEntityPosWithSpeed_19              ; $4123: $CD $B8 $7D
    call AddEntityZSpeedToPos_19                  ; $4126: $CD $F1 $7D
    call label_3B23                               ; $4129: $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                 ; $412C: $21 $20 $C3
    add  hl, bc                                   ; $412F: $09
    dec  [hl]                                     ; $4130: $35
    dec  [hl]                                     ; $4131: $35
    ld   hl, wEntitiesCollisionsTable             ; $4132: $21 $A0 $C2
    add  hl, bc                                   ; $4135: $09
    ld   a, [hl]                                  ; $4136: $7E
    and  $0F                                      ; $4137: $E6 $0F
    jr   nz, .jr_4143                             ; $4139: $20 $08

    ld   hl, wEntitiesPosZTable                   ; $413B: $21 $10 $C3
    add  hl, bc                                   ; $413E: $09
    ld   a, [hl]                                  ; $413F: $7E
    and  $80                                      ; $4140: $E6 $80
    ret  z                                        ; $4142: $C8

.jr_4143
    call LiftableStatue_SpawnRubble               ; $4143: $CD $83 $41
    ld   a, [wRoomEvent]                          ; $4146: $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ; $4149: $E6 $1F
    cp   TRIGGER_THROW_AT_DOOR                    ; $414B: $FE $0B
    ret  nz                                       ; $414D: $C0

    ld   a, [wC50D]                               ; $414E: $FA $0D $C5
    cp   $35                                      ; $4151: $FE $35
    jr   c, .jr_4159                              ; $4153: $38 $04

    cp   $3D                                      ; $4155: $FE $3D
    jr   c, jr_019_4162                           ; $4157: $38 $09

.jr_4159
    ld   a, [wC503]                               ; $4159: $FA $03 $C5
    cp   $35                                      ; $415C: $FE $35
    ret  c                                        ; $415E: $D8

    cp   $3D                                      ; $415F: $FE $3D
    ret  nc                                       ; $4161: $D0

jr_019_4162:
    jp   MarkTriggerAsResolved                    ; $4162: $C3 $60 $0C

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
    ld   a, $00                                   ; $4183: $3E $00

.spawnLoop:
    ldh  [hMultiPurposeG], a                      ; $4185: $E0 $E8
    ld   a, ENTITY_LIFTABLE_STATUE                ; $4187: $3E $9D
    call SpawnNewEntity_trampoline                ; $4189: $CD $86 $3B
    jr   c, .spawnFailed                          ; $418C: $38 $54

    ld   hl, wEntitiesPrivateState1Table          ; $418E: $21 $B0 $C2
    add  hl, de                                   ; $4191: $19
    inc  [hl]                                     ; $4192: $34

.jr_4193
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4193: $21 $40 $C3
    add  hl, de                                   ; $4196: $19
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $4197: $36 $C1
    push bc                                       ; $4199: $C5
    ldh  a, [hMultiPurposeG]                      ; $419A: $F0 $E8
    ld   c, a                                     ; $419C: $4F
    ld   hl, LiftableStatue_RubbleX               ; $419D: $21 $65 $41
    add  hl, bc                                   ; $41A0: $09
    ldh  a, [hMultiPurpose0]                      ; $41A1: $F0 $D7
    add  [hl]                                     ; $41A3: $86
    ld   hl, wEntitiesPosXTable                   ; $41A4: $21 $00 $C2
    add  hl, de                                   ; $41A7: $19
    ld   [hl], a                                  ; $41A8: $77
    ld   hl, LiftableStatue_RubbleY               ; $41A9: $21 $6B $41
    add  hl, bc                                   ; $41AC: $09
    ldh  a, [hMultiPurpose1]                      ; $41AD: $F0 $D8
    add  [hl]                                     ; $41AF: $86
    ld   hl, wEntitiesPosYTable                   ; $41B0: $21 $10 $C2
    add  hl, de                                   ; $41B3: $19
    ld   [hl], a                                  ; $41B4: $77
    ldh  a, [hMultiPurpose3]                      ; $41B5: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $41B7: $21 $10 $C3
    add  hl, de                                   ; $41BA: $19
    ld   [hl], a                                  ; $41BB: $77
    ld   hl, LiftableStatue_RubbleSpeedX          ; $41BC: $21 $71 $41
    add  hl, bc                                   ; $41BF: $09
    ld   a, [hl]                                  ; $41C0: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $41C1: $21 $40 $C2
    add  hl, de                                   ; $41C4: $19
    ld   [hl], a                                  ; $41C5: $77
    ld   hl, LiftableStatue_RubbleSpeedY          ; $41C6: $21 $77 $41
    add  hl, bc                                   ; $41C9: $09
    ld   a, [hl]                                  ; $41CA: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $41CB: $21 $50 $C2
    add  hl, de                                   ; $41CE: $19
    ld   [hl], a                                  ; $41CF: $77
    ld   hl, LiftableStatue_RubbleSpeedZ          ; $41D0: $21 $7D $41
    add  hl, bc                                   ; $41D3: $09
    ld   a, [hl]                                  ; $41D4: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $41D5: $21 $20 $C3
    add  hl, de                                   ; $41D8: $19
    ld   [hl], a                                  ; $41D9: $77
    pop  bc                                       ; $41DA: $C1
    ldh  a, [hMultiPurposeG]                      ; $41DB: $F0 $E8
    inc  a                                        ; $41DD: $3C
    cp   $06                                      ; $41DE: $FE $06
    jr   nz, .spawnLoop                           ; $41E0: $20 $A3

.spawnFailed:
    ld   a, NOISE_SFX_BREAK                       ; $41E2: $3E $29
    ldh  [hNoiseSfx], a                           ; $41E4: $E0 $F4
    ldh  a, [hActiveEntityPosX]                   ; $41E6: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $41E8: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $41EA: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $41EC: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $41EE: $3E $02
    call AddTranscientVfx                         ; $41F0: $CD $C7 $0C
    ldh  a, [hActiveEntityVisualPosY]             ; $41F3: $F0 $EC
    sub  $10                                      ; $41F5: $D6 $10
    ldh  [hMultiPurpose1], a                      ; $41F7: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $41F9: $3E $02
    call AddTranscientVfx                         ; $41FB: $CD $C7 $0C
    jp   ClearEntityStatus_19                     ; $41FE: $C3 $61 $7E
