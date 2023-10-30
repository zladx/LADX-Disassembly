; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Bushcrawler2SpriteVariants::
.variant0
    db $7C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $7E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $7C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BushcrawlerOutdoorSpriteVariants::
.variant0
    db $F4, OAM_GBC_PAL_6 | OAMF_PAL1
    db $F6, OAM_GBC_PAL_6 | OAMF_PAL1
.variant1
    db $F0, OAM_GBC_PAL_7 | OAMF_PAL1
    db $F2, OAM_GBC_PAL_7 | OAMF_PAL1

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BushcrawlerIndoorSpriteVariants::
.variant0
    db $F4, OAM_GBC_PAL_6 | OAMF_PAL1
    db $F6, OAM_GBC_PAL_6 | OAMF_PAL1
.variant1
    db $F0, OAM_GBC_PAL_6 | OAMF_PAL1
    db $F2, OAM_GBC_PAL_6 | OAMF_PAL1

BushCrawlerEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4022: $21 $B0 $C2
    add  hl, bc                                   ; $4025: $09
    ld   a, [hl]                                  ; $4026: $7E
    cp   $02                                      ; $4027: $FE $02
    jp   z, label_007_41F0                        ; $4029: $CA $F0 $41

    and  a                                        ; $402C: $A7
    jr   nz, .jr_4053                             ; $402D: $20 $24

    inc  [hl]                                     ; $402F: $34
    ldh  a, [hActiveEntityPosX]                   ; $4030: $F0 $EE
    rla                                           ; $4032: $17
    rla                                           ; $4033: $17
    and  $40                                      ; $4034: $E6 $40
    push af                                       ; $4036: $F5
    ld   hl, wEntitiesOptions1Table               ; $4037: $21 $30 $C4
    add  hl, bc                                   ; $403A: $09
    or   [hl]                                     ; $403B: $B6
    ld   [hl], a                                  ; $403C: $77
    pop  af                                       ; $403D: $F1
    sla  a                                        ; $403E: $CB $27
    ld   hl, wEntitiesHitboxFlagsTable            ; $4040: $21 $50 $C3
    add  hl, bc                                   ; $4043: $09
    or   [hl]                                     ; $4044: $B6
    ld   [hl], a                                  ; $4045: $77
    ldh  a, [hActiveEntityPosX]                   ; $4046: $F0 $EE
    rra                                           ; $4048: $1F
    rra                                           ; $4049: $1F
    rra                                           ; $404A: $1F
    rra                                           ; $404B: $1F
    and  $01                                      ; $404C: $E6 $01
    ld   hl, wEntitiesPrivateState4Table          ; $404E: $21 $40 $C4
    add  hl, bc                                   ; $4051: $09
    ld   [hl], a                                  ; $4052: $77

.jr_4053
    ld   hl, wEntitiesPrivateState2Table          ; $4053: $21 $C0 $C2
    add  hl, bc                                   ; $4056: $09
    ldh  a, [hActiveEntityVisualPosY]             ; $4057: $F0 $EC
    sub  [hl]                                     ; $4059: $96
    ldh  [hActiveEntityVisualPosY], a             ; $405A: $E0 $EC
    ld   hl, wEntitiesPrivateState4Table          ; $405C: $21 $40 $C4
    add  hl, bc                                   ; $405F: $09
    ld   a, [hl]                                  ; $4060: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $4061: $E0 $F1
    ld   de, BushcrawlerOutdoorSpriteVariants     ; $4063: $11 $12 $40
    ld   a, [wIsIndoor]                           ; $4066: $FA $A5 $DB
    and  a                                        ; $4069: $A7
    jr   z, .render                               ; $406A: $28 $03

    ld   de, BushcrawlerIndoorSpriteVariants      ; $406C: $11 $1A $40

.render:
    call RenderActiveEntitySpritesPair            ; $406F: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4072: $CD $8A $3D
    ld   hl, wEntitiesPrivateState2Table          ; $4075: $21 $C0 $C2
    add  hl, bc                                   ; $4078: $09
    ld   a, [hl]                                  ; $4079: $7E
    and  a                                        ; $407A: $A7
    jr   z, .jr_408A                              ; $407B: $28 $0D

    ld   hl, wEntitiesSpriteVariantTable          ; $407D: $21 $B0 $C3
    add  hl, bc                                   ; $4080: $09
    ld   a, [hl]                                  ; $4081: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $4082: $E0 $F1
    ld   de, Bushcrawler2SpriteVariants           ; $4084: $11 $0A $40
    call RenderActiveEntitySpritesPair            ; $4087: $CD $C0 $3B

.jr_408A
    call ReturnIfNonInteractive_07                ; $408A: $CD $96 $7D
    ld   hl, wEntitiesHealthTable                 ; $408D: $21 $60 $C3
    add  hl, bc                                   ; $4090: $09
    ld   [hl], $04                                ; $4091: $36 $04
    ld   hl, wEntitiesFlashCountdownTable         ; $4093: $21 $20 $C4
    add  hl, bc                                   ; $4096: $09
    ld   a, [hl]                                  ; $4097: $7E
    and  a                                        ; $4098: $A7
    jr   z, .jr_40C1                              ; $4099: $28 $26

    ld   [hl], b                                  ; $409B: $70
    ld   hl, wEntitiesPrivateState4Table          ; $409C: $21 $40 $C4
    add  hl, bc                                   ; $409F: $09
    ld   a, [hl]                                  ; $40A0: $7E
    xor  $01                                      ; $40A1: $EE $01
    call SetEntitySpriteVariant                   ; $40A3: $CD $0C $3B
    ld   hl, wEntitiesTypeTable                   ; $40A6: $21 $A0 $C3
    add  hl, bc                                   ; $40A9: $09
    ld   [hl], $05                                ; $40AA: $36 $05
    ld   hl, hNoiseSfx                            ; $40AC: $21 $F4 $FF
    ld   [hl], NOISE_SFX_CUT_GRASS                ; $40AF: $36 $05
    call GetEntityPrivateCountdown1               ; $40B1: $CD $00 $0C
    ld   [hl], $1F                                ; $40B4: $36 $1F
    ld   hl, wEntitiesPhysicsFlagsTable           ; $40B6: $21 $40 $C3
    add  hl, bc                                   ; $40B9: $09
    ld   a, [hl]                                  ; $40BA: $7E
    add  2                                        ; $40BB: $C6 $02
    ld   [hl], a                                  ; $40BD: $77
    jp   label_007_4198                           ; $40BE: $C3 $98 $41

.jr_40C1
    call DecrementEntityIgnoreHitsCountdown       ; $40C1: $CD $56 $0C
    call label_3B39                               ; $40C4: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $40C7: $F0 $F0
  JP_TABLE                                        ; $40C9
._00 dw BushCrawlerState0Handler                  ; $40CA
._01 dw BushCrawlerState1Handler                  ; $40CC

Data_007_40CE::
    db   $10, $F0, $00, $00

Data_007_40D2::
    db   $00, $00, $F0, $10

BushCrawlerState0Handler::
    ld   hl, wEntitiesPrivateState2Table          ; $40D6: $21 $C0 $C2
    add  hl, bc                                   ; $40D9: $09
    ld   [hl], b                                  ; $40DA: $70
    call GetEntityTransitionCountdown             ; $40DB: $CD $05 $0C
    jr   nz, jr_007_4128                          ; $40DE: $20 $48

    call EntityLinkPositionYDifference_07         ; $40E0: $CD $6D $7E
    add  $08                                      ; $40E3: $C6 $08
    cp   $10                                      ; $40E5: $FE $10
    jr   c, .jr_40F9                              ; $40E7: $38 $10

    push de                                       ; $40E9: $D5
    call EntityLinkPositionXDifference_07         ; $40EA: $CD $5D $7E
    add  $08                                      ; $40ED: $C6 $08
    pop  de                                       ; $40EF: $D1
    cp   $10                                      ; $40F0: $FE $10
    jr   nc, jr_007_4128                          ; $40F2: $30 $34

    ld   a, e                                     ; $40F4: $7B
    cp   $02                                      ; $40F5: $FE $02
    jr   z, jr_007_4128                           ; $40F7: $28 $2F

.jr_40F9
    call IncrementEntityState                     ; $40F9: $CD $12 $3B
    call func_007_7E7D                            ; $40FC: $CD $7D $7E
    ld   d, b                                     ; $40FF: $50
    ld   hl, Data_007_40CE                        ; $4100: $21 $CE $40
    add  hl, de                                   ; $4103: $19
    ld   a, [hl]                                  ; $4104: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4105: $21 $40 $C2
    add  hl, bc                                   ; $4108: $09
    ld   [hl], a                                  ; $4109: $77
    ld   hl, Data_007_40D2                        ; $410A: $21 $D2 $40
    add  hl, de                                   ; $410D: $19
    ld   a, [hl]                                  ; $410E: $7E
    call GetEntitySpeedYAddress                   ; $410F: $CD $05 $40
    ld   [hl], a                                  ; $4112: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4113: $21 $40 $C3
    add  hl, bc                                   ; $4116: $09
    res  ENTITY_PHYSICS_B_HARMLESS, [hl]          ; $4117: $CB $BE
    ld   hl, wEntitiesHitboxFlagsTable            ; $4119: $21 $50 $C3
    add  hl, bc                                   ; $411C: $09
    res  2, [hl]                                  ; $411D: $CB $96
    call ConfigureEntityHitbox                    ; $411F: $CD $EA $3A
    call GetEntityTransitionCountdown             ; $4122: $CD $05 $0C
    ld   [hl], $30                                ; $4125: $36 $30
    ret                                           ; $4127: $C9

jr_007_4128:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4128: $21 $40 $C3
    add  hl, bc                                   ; $412B: $09
    set  ENTITY_PHYSICS_B_HARMLESS, [hl]          ; $412C: $CB $FE
    ld   hl, wEntitiesHitboxFlagsTable            ; $412E: $21 $50 $C3
    add  hl, bc                                   ; $4131: $09
    set  2, [hl]                                  ; $4132: $CB $D6
    call ConfigureEntityHitbox                    ; $4134: $CD $EA $3A
    call CheckLinkCollisionWithEnemy_trampoline   ; $4137: $CD $5A $3B
    ret  nc                                       ; $413A: $D0

    ld   a, [wLinkAttackStepAnimationCountdown]   ; $413B: $FA $9B $C1
    and  a                                        ; $413E: $A7
    ret  nz                                       ; $413F: $C0

    ld   a, [wInventoryItems.BButtonSlot]         ; $4140: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $4143: $FE $03
    jr   nz, .jr_414E                             ; $4145: $20 $07

    ldh  a, [hJoypadState]                        ; $4147: $F0 $CC
    and  J_B                                      ; $4149: $E6 $20
    jr   nz, jr_007_415A                          ; $414B: $20 $0D

    ret                                           ; $414D: $C9

.jr_414E
    ld   a, [wInventoryItems.AButtonSlot]         ; $414E: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $4151: $FE $03
    ret  nz                                       ; $4153: $C0

    ldh  a, [hJoypadState]                        ; $4154: $F0 $CC
    and  J_A                                      ; $4156: $E6 $10
    jr   z, ret_007_41B8                          ; $4158: $28 $5E

jr_007_415A:
    ld   a, [wC3CF]                               ; $415A: $FA $CF $C3
    and  a                                        ; $415D: $A7
    ret  nz                                       ; $415E: $C0

    inc  a                                        ; $415F: $3C
    ld   [wC3CF], a                               ; $4160: $EA $CF $C3
    call IncrementEntityState                     ; $4163: $CD $12 $3B
    ld   [hl], $02                                ; $4166: $36 $02
    ld   hl, wEntitiesStatusTable                 ; $4168: $21 $80 $C2
    add  hl, bc                                   ; $416B: $09
    ld   [hl], $07                                ; $416C: $36 $07
    ld   hl, wEntitiesPrivateState5Table          ; $416E: $21 $90 $C3
    add  hl, bc                                   ; $4171: $09
    ld   [hl], $01                                ; $4172: $36 $01
    ld   hl, wEntitiesLiftedTable                 ; $4174: $21 $90 $C4
    add  hl, bc                                   ; $4177: $09
    ld   [hl], b                                  ; $4178: $70
    ldh  a, [hLinkDirection]                      ; $4179: $F0 $9E
    ld   [wC15D], a                               ; $417B: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $417E: $CD $05 $0C
    ld   [hl], $02                                ; $4181: $36 $02
    ld   hl, hWaveSfx                             ; $4183: $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ; $4186: $36 $02
    ld   hl, wEntitiesTypeTable                   ; $4188: $21 $A0 $C3
    add  hl, bc                                   ; $418B: $09
    ld   [hl], $05                                ; $418C: $36 $05
    ld   hl, wEntitiesPrivateState4Table          ; $418E: $21 $40 $C4
    add  hl, bc                                   ; $4191: $09
    ld   a, [hl]                                  ; $4192: $7E
    xor  $01                                      ; $4193: $EE $01
    call SetEntitySpriteVariant                   ; $4195: $CD $0C $3B

label_007_4198:
    ld   a, ENTITY_BUSH_CRAWLER                   ; $4198: $3E $BB
    call SpawnNewEntity_trampoline                ; $419A: $CD $86 $3B
    ret  c                                        ; $419D: $D8

    ldh  a, [hMultiPurpose0]                      ; $419E: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $41A0: $21 $00 $C2
    add  hl, de                                   ; $41A3: $19
    ld   [hl], a                                  ; $41A4: $77
    ldh  a, [hMultiPurpose1]                      ; $41A5: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $41A7: $21 $10 $C2
    add  hl, de                                   ; $41AA: $19
    ld   [hl], a                                  ; $41AB: $77
    ld   hl, wEntitiesPrivateState1Table          ; $41AC: $21 $B0 $C2
    add  hl, de                                   ; $41AF: $19
    ld   [hl], $02                                ; $41B0: $36 $02
    ld   hl, wEntitiesTransitionCountdownTable    ; $41B2: $21 $E0 $C2
    add  hl, de                                   ; $41B5: $19
    ld   [hl], $40                                ; $41B6: $36 $40

ret_007_41B8:
    ret                                           ; $41B8: $C9

BushCrawlerState1Handler::
    call GetEntityTransitionCountdown             ; $41B9: $CD $05 $0C
    jr   nz, jr_007_41C8                          ; $41BC: $20 $0A

jr_007_41BE:
    call GetEntityTransitionCountdown             ; $41BE: $CD $05 $0C
    ld   [hl], $20                                ; $41C1: $36 $20
    call IncrementEntityState                     ; $41C3: $CD $12 $3B
    ld   [hl], b                                  ; $41C6: $70
    ret                                           ; $41C7: $C9

jr_007_41C8:
    call UpdateEntityPosWithSpeed_07              ; $41C8: $CD $0A $7E
    call label_3B23                               ; $41CB: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $41CE: $21 $A0 $C2
    add  hl, bc                                   ; $41D1: $09
    ld   a, [hl]                                  ; $41D2: $7E
    and  a                                        ; $41D3: $A7
    jr   nz, jr_007_41BE                          ; $41D4: $20 $E8

    ld   hl, wEntitiesPrivateState2Table          ; $41D6: $21 $C0 $C2
    add  hl, bc                                   ; $41D9: $09
    ld   [hl], $04                                ; $41DA: $36 $04
    ldh  a, [hFrameCounter]                       ; $41DC: $F0 $E7
    rra                                           ; $41DE: $1F
    rra                                           ; $41DF: $1F
    rra                                           ; $41E0: $1F
    and  $01                                      ; $41E1: $E6 $01
    jp   SetEntitySpriteVariant                   ; $41E3: $C3 $0C $3B

Data_007_41E6::
    db   $F0, $F4

Data_007_41E8::
    db   $00, $0C, $10, $0C, $00, $F4, $F0, $F4

label_007_41F0:
    ld   de, Bushcrawler2SpriteVariants           ; $41F0: $11 $0A $40
    call RenderActiveEntitySpritesPair            ; $41F3: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $41F6: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $41F9: $CD $C3 $7D
    ldh  a, [hFrameCounter]                       ; $41FC: $F0 $E7
    rra                                           ; $41FE: $1F
    rra                                           ; $41FF: $1F
    rra                                           ; $4200: $1F
    and  $01                                      ; $4201: $E6 $01
    call SetEntitySpriteVariant                   ; $4203: $CD $0C $3B
    call UpdateEntityPosWithSpeed_07              ; $4206: $CD $0A $7E
    call label_3B23                               ; $4209: $CD $23 $3B
    call label_3B39                               ; $420C: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $420F: $CD $05 $0C
    jr   nz, .ret_4233                            ; $4212: $20 $1F

    call GetRandomByte                            ; $4214: $CD $0D $28
    and  $1F                                      ; $4217: $E6 $1F
    add  $20                                      ; $4219: $C6 $20
    ld   [hl], a                                  ; $421B: $77
    and  $07                                      ; $421C: $E6 $07
    ld   e, a                                     ; $421E: $5F
    ld   d, b                                     ; $421F: $50
    ld   hl, Data_007_41E8                        ; $4220: $21 $E8 $41
    add  hl, de                                   ; $4223: $19
    ld   a, [hl]                                  ; $4224: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4225: $21 $40 $C2
    add  hl, bc                                   ; $4228: $09
    ld   [hl], a                                  ; $4229: $77
    ld   hl, Data_007_41E6                        ; $422A: $21 $E6 $41
    add  hl, de                                   ; $422D: $19
    ld   a, [hl]                                  ; $422E: $7E
    call GetEntitySpeedYAddress                   ; $422F: $CD $05 $40
    ld   [hl], a                                  ; $4232: $77

.ret_4233
    ret                                           ; $4233: $C9
