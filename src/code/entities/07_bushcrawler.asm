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
    ld   hl, wEntitiesPrivateState1Table          ;; 07:4022 $21 $B0 $C2
    add  hl, bc                                   ;; 07:4025 $09
    ld   a, [hl]                                  ;; 07:4026 $7E
    cp   $02                                      ;; 07:4027 $FE $02
    jp   z, label_007_41F0                        ;; 07:4029 $CA $F0 $41

    and  a                                        ;; 07:402C $A7
    jr   nz, .jr_4053                             ;; 07:402D $20 $24

    inc  [hl]                                     ;; 07:402F $34
    ldh  a, [hActiveEntityPosX]                   ;; 07:4030 $F0 $EE
    rla                                           ;; 07:4032 $17
    rla                                           ;; 07:4033 $17
    and  $40                                      ;; 07:4034 $E6 $40
    push af                                       ;; 07:4036 $F5
    ld   hl, wEntitiesOptions1Table               ;; 07:4037 $21 $30 $C4
    add  hl, bc                                   ;; 07:403A $09
    or   [hl]                                     ;; 07:403B $B6
    ld   [hl], a                                  ;; 07:403C $77
    pop  af                                       ;; 07:403D $F1
    sla  a                                        ;; 07:403E $CB $27
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:4040 $21 $50 $C3
    add  hl, bc                                   ;; 07:4043 $09
    or   [hl]                                     ;; 07:4044 $B6
    ld   [hl], a                                  ;; 07:4045 $77
    ldh  a, [hActiveEntityPosX]                   ;; 07:4046 $F0 $EE
    rra                                           ;; 07:4048 $1F
    rra                                           ;; 07:4049 $1F
    rra                                           ;; 07:404A $1F
    rra                                           ;; 07:404B $1F
    and  $01                                      ;; 07:404C $E6 $01
    ld   hl, wEntitiesPrivateState4Table          ;; 07:404E $21 $40 $C4
    add  hl, bc                                   ;; 07:4051 $09
    ld   [hl], a                                  ;; 07:4052 $77

.jr_4053
    ld   hl, wEntitiesPrivateState2Table          ;; 07:4053 $21 $C0 $C2
    add  hl, bc                                   ;; 07:4056 $09
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:4057 $F0 $EC
    sub  [hl]                                     ;; 07:4059 $96
    ldh  [hActiveEntityVisualPosY], a             ;; 07:405A $E0 $EC
    ld   hl, wEntitiesPrivateState4Table          ;; 07:405C $21 $40 $C4
    add  hl, bc                                   ;; 07:405F $09
    ld   a, [hl]                                  ;; 07:4060 $7E
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:4061 $E0 $F1
    ld   de, BushcrawlerOutdoorSpriteVariants     ;; 07:4063 $11 $12 $40
    ld   a, [wIsIndoor]                           ;; 07:4066 $FA $A5 $DB
    and  a                                        ;; 07:4069 $A7
    jr   z, .render                               ;; 07:406A $28 $03

    ld   de, BushcrawlerIndoorSpriteVariants      ;; 07:406C $11 $1A $40

.render:
    call RenderActiveEntitySpritesPair            ;; 07:406F $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 07:4072 $CD $8A $3D
    ld   hl, wEntitiesPrivateState2Table          ;; 07:4075 $21 $C0 $C2
    add  hl, bc                                   ;; 07:4078 $09
    ld   a, [hl]                                  ;; 07:4079 $7E
    and  a                                        ;; 07:407A $A7
    jr   z, .jr_408A                              ;; 07:407B $28 $0D

    ld   hl, wEntitiesSpriteVariantTable          ;; 07:407D $21 $B0 $C3
    add  hl, bc                                   ;; 07:4080 $09
    ld   a, [hl]                                  ;; 07:4081 $7E
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:4082 $E0 $F1
    ld   de, Bushcrawler2SpriteVariants           ;; 07:4084 $11 $0A $40
    call RenderActiveEntitySpritesPair            ;; 07:4087 $CD $C0 $3B

.jr_408A
    call ReturnIfNonInteractive_07                ;; 07:408A $CD $96 $7D
    ld   hl, wEntitiesHealthTable                 ;; 07:408D $21 $60 $C3
    add  hl, bc                                   ;; 07:4090 $09
    ld   [hl], $04                                ;; 07:4091 $36 $04
    ld   hl, wEntitiesFlashCountdownTable         ;; 07:4093 $21 $20 $C4
    add  hl, bc                                   ;; 07:4096 $09
    ld   a, [hl]                                  ;; 07:4097 $7E
    and  a                                        ;; 07:4098 $A7
    jr   z, .jr_40C1                              ;; 07:4099 $28 $26

    ld   [hl], b                                  ;; 07:409B $70
    ld   hl, wEntitiesPrivateState4Table          ;; 07:409C $21 $40 $C4
    add  hl, bc                                   ;; 07:409F $09
    ld   a, [hl]                                  ;; 07:40A0 $7E
    xor  $01                                      ;; 07:40A1 $EE $01
    call SetEntitySpriteVariant                   ;; 07:40A3 $CD $0C $3B
    ld   hl, wEntitiesTypeTable                   ;; 07:40A6 $21 $A0 $C3
    add  hl, bc                                   ;; 07:40A9 $09
    ld   [hl], $05                                ;; 07:40AA $36 $05
    ld   hl, hNoiseSfx                            ;; 07:40AC $21 $F4 $FF
    ld   [hl], NOISE_SFX_CUT_GRASS                ;; 07:40AF $36 $05
    call GetEntityPrivateCountdown1               ;; 07:40B1 $CD $00 $0C
    ld   [hl], $1F                                ;; 07:40B4 $36 $1F
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:40B6 $21 $40 $C3
    add  hl, bc                                   ;; 07:40B9 $09
    ld   a, [hl]                                  ;; 07:40BA $7E
    add  2                                        ;; 07:40BB $C6 $02
    ld   [hl], a                                  ;; 07:40BD $77
    jp   label_007_4198                           ;; 07:40BE $C3 $98 $41

.jr_40C1
    call DecrementEntityIgnoreHitsCountdown       ;; 07:40C1 $CD $56 $0C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:40C4 $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ;; 07:40C7 $F0 $F0
  JP_TABLE                                        ;; 07:40C9
._00 dw BushCrawlerState0Handler                  ;; 07:40CA
._01 dw BushCrawlerState1Handler                  ;; 07:40CC

Data_007_40CE::
    db   $10, $F0, $00, $00

Data_007_40D2::
    db   $00, $00, $F0, $10

BushCrawlerState0Handler::
    ld   hl, wEntitiesPrivateState2Table          ;; 07:40D6 $21 $C0 $C2
    add  hl, bc                                   ;; 07:40D9 $09
    ld   [hl], b                                  ;; 07:40DA $70
    call GetEntityTransitionCountdown             ;; 07:40DB $CD $05 $0C
    jr   nz, jr_007_4128                          ;; 07:40DE $20 $48

    call GetEntityYDistanceToLink_07              ;; 07:40E0 $CD $6D $7E
    add  $08                                      ;; 07:40E3 $C6 $08
    cp   $10                                      ;; 07:40E5 $FE $10
    jr   c, .jr_40F9                              ;; 07:40E7 $38 $10

    push de                                       ;; 07:40E9 $D5
    call GetEntityXDistanceToLink_07              ;; 07:40EA $CD $5D $7E
    add  $08                                      ;; 07:40ED $C6 $08
    pop  de                                       ;; 07:40EF $D1
    cp   $10                                      ;; 07:40F0 $FE $10
    jr   nc, jr_007_4128                          ;; 07:40F2 $30 $34

    ld   a, e                                     ;; 07:40F4 $7B
    cp   $02                                      ;; 07:40F5 $FE $02
    jr   z, jr_007_4128                           ;; 07:40F7 $28 $2F

.jr_40F9
    call IncrementEntityState                     ;; 07:40F9 $CD $12 $3B
    call GetEntityDirectionToLink_07              ;; 07:40FC $CD $7D $7E
    ld   d, b                                     ;; 07:40FF $50
    ld   hl, Data_007_40CE                        ;; 07:4100 $21 $CE $40
    add  hl, de                                   ;; 07:4103 $19
    ld   a, [hl]                                  ;; 07:4104 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:4105 $21 $40 $C2
    add  hl, bc                                   ;; 07:4108 $09
    ld   [hl], a                                  ;; 07:4109 $77
    ld   hl, Data_007_40D2                        ;; 07:410A $21 $D2 $40
    add  hl, de                                   ;; 07:410D $19
    ld   a, [hl]                                  ;; 07:410E $7E
    call GetEntitySpeedYAddress                   ;; 07:410F $CD $05 $40
    ld   [hl], a                                  ;; 07:4112 $77
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:4113 $21 $40 $C3
    add  hl, bc                                   ;; 07:4116 $09
    res  ENTITY_PHYSICS_B_HARMLESS, [hl]          ;; 07:4117 $CB $BE
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:4119 $21 $50 $C3
    add  hl, bc                                   ;; 07:411C $09
    res  2, [hl]                                  ;; 07:411D $CB $96
    call ConfigureEntityHitbox                    ;; 07:411F $CD $EA $3A
    call GetEntityTransitionCountdown             ;; 07:4122 $CD $05 $0C
    ld   [hl], $30                                ;; 07:4125 $36 $30
    ret                                           ;; 07:4127 $C9

jr_007_4128:
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:4128 $21 $40 $C3
    add  hl, bc                                   ;; 07:412B $09
    set  ENTITY_PHYSICS_B_HARMLESS, [hl]          ;; 07:412C $CB $FE
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:412E $21 $50 $C3
    add  hl, bc                                   ;; 07:4131 $09
    set  2, [hl]                                  ;; 07:4132 $CB $D6
    call ConfigureEntityHitbox                    ;; 07:4134 $CD $EA $3A
    call CheckLinkCollisionWithEnemy_trampoline   ;; 07:4137 $CD $5A $3B
    ret  nc                                       ;; 07:413A $D0

    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 07:413B $FA $9B $C1
    and  a                                        ;; 07:413E $A7
    ret  nz                                       ;; 07:413F $C0

    ld   a, [wInventoryItems.BButtonSlot]         ;; 07:4140 $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 07:4143 $FE $03
    jr   nz, .checkAButtonSlot                    ;; 07:4145 $20 $07

    ldh  a, [hJoypadState]                        ;; 07:4147 $F0 $CC
    and  J_B                                      ;; 07:4149 $E6 $20
    jr   nz, jr_007_415A                          ;; 07:414B $20 $0D

    ret                                           ;; 07:414D $C9

.checkAButtonSlot
    ld   a, [wInventoryItems.AButtonSlot]         ;; 07:414E $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 07:4151 $FE $03
    ret  nz                                       ;; 07:4153 $C0

    ldh  a, [hJoypadState]                        ;; 07:4154 $F0 $CC
    and  J_A                                      ;; 07:4156 $E6 $10
    jr   z, ret_007_41B8                          ;; 07:4158 $28 $5E

jr_007_415A:
    ld   a, [wC3CF]                               ;; 07:415A $FA $CF $C3
    and  a                                        ;; 07:415D $A7
    ret  nz                                       ;; 07:415E $C0

    inc  a                                        ;; 07:415F $3C
    ld   [wC3CF], a                               ;; 07:4160 $EA $CF $C3
    call IncrementEntityState                     ;; 07:4163 $CD $12 $3B
    ld   [hl], $02                                ;; 07:4166 $36 $02
    ld   hl, wEntitiesStatusTable                 ;; 07:4168 $21 $80 $C2
    add  hl, bc                                   ;; 07:416B $09
    ld   [hl], $07                                ;; 07:416C $36 $07
    ld   hl, wEntitiesPrivateState5Table          ;; 07:416E $21 $90 $C3
    add  hl, bc                                   ;; 07:4171 $09
    ld   [hl], $01                                ;; 07:4172 $36 $01
    ld   hl, wEntitiesLiftedTable                 ;; 07:4174 $21 $90 $C4
    add  hl, bc                                   ;; 07:4177 $09
    ld   [hl], b                                  ;; 07:4178 $70
    ldh  a, [hLinkDirection]                      ;; 07:4179 $F0 $9E
    ld   [wC15D], a                               ;; 07:417B $EA $5D $C1
    call GetEntityTransitionCountdown             ;; 07:417E $CD $05 $0C
    ld   [hl], $02                                ;; 07:4181 $36 $02
    ld   hl, hWaveSfx                             ;; 07:4183 $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ;; 07:4186 $36 $02
    ld   hl, wEntitiesTypeTable                   ;; 07:4188 $21 $A0 $C3
    add  hl, bc                                   ;; 07:418B $09
    ld   [hl], $05                                ;; 07:418C $36 $05
    ld   hl, wEntitiesPrivateState4Table          ;; 07:418E $21 $40 $C4
    add  hl, bc                                   ;; 07:4191 $09
    ld   a, [hl]                                  ;; 07:4192 $7E
    xor  $01                                      ;; 07:4193 $EE $01
    call SetEntitySpriteVariant                   ;; 07:4195 $CD $0C $3B

label_007_4198:
    ld   a, ENTITY_BUSH_CRAWLER                   ;; 07:4198 $3E $BB
    call SpawnNewEntity_trampoline                ;; 07:419A $CD $86 $3B
    ret  c                                        ;; 07:419D $D8

    ldh  a, [hMultiPurpose0]                      ;; 07:419E $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 07:41A0 $21 $00 $C2
    add  hl, de                                   ;; 07:41A3 $19
    ld   [hl], a                                  ;; 07:41A4 $77
    ldh  a, [hMultiPurpose1]                      ;; 07:41A5 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 07:41A7 $21 $10 $C2
    add  hl, de                                   ;; 07:41AA $19
    ld   [hl], a                                  ;; 07:41AB $77
    ld   hl, wEntitiesPrivateState1Table          ;; 07:41AC $21 $B0 $C2
    add  hl, de                                   ;; 07:41AF $19
    ld   [hl], $02                                ;; 07:41B0 $36 $02
    ld   hl, wEntitiesTransitionCountdownTable    ;; 07:41B2 $21 $E0 $C2
    add  hl, de                                   ;; 07:41B5 $19
    ld   [hl], $40                                ;; 07:41B6 $36 $40

ret_007_41B8:
    ret                                           ;; 07:41B8 $C9

BushCrawlerState1Handler::
    call GetEntityTransitionCountdown             ;; 07:41B9 $CD $05 $0C
    jr   nz, jr_007_41C8                          ;; 07:41BC $20 $0A

jr_007_41BE:
    call GetEntityTransitionCountdown             ;; 07:41BE $CD $05 $0C
    ld   [hl], $20                                ;; 07:41C1 $36 $20
    call IncrementEntityState                     ;; 07:41C3 $CD $12 $3B
    ld   [hl], b                                  ;; 07:41C6 $70
    ret                                           ;; 07:41C7 $C9

jr_007_41C8:
    call UpdateEntityPosWithSpeed_07              ;; 07:41C8 $CD $0A $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:41CB $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 07:41CE $21 $A0 $C2
    add  hl, bc                                   ;; 07:41D1 $09
    ld   a, [hl]                                  ;; 07:41D2 $7E
    and  a                                        ;; 07:41D3 $A7
    jr   nz, jr_007_41BE                          ;; 07:41D4 $20 $E8

    ld   hl, wEntitiesPrivateState2Table          ;; 07:41D6 $21 $C0 $C2
    add  hl, bc                                   ;; 07:41D9 $09
    ld   [hl], $04                                ;; 07:41DA $36 $04
    ldh  a, [hFrameCounter]                       ;; 07:41DC $F0 $E7
    rra                                           ;; 07:41DE $1F
    rra                                           ;; 07:41DF $1F
    rra                                           ;; 07:41E0 $1F
    and  $01                                      ;; 07:41E1 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 07:41E3 $C3 $0C $3B

Data_007_41E6::
    db   $F0, $F4

Data_007_41E8::
    db   $00, $0C, $10, $0C, $00, $F4, $F0, $F4

label_007_41F0:
    ld   de, Bushcrawler2SpriteVariants           ;; 07:41F0 $11 $0A $40
    call RenderActiveEntitySpritesPair            ;; 07:41F3 $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:41F6 $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ;; 07:41F9 $CD $C3 $7D
    ldh  a, [hFrameCounter]                       ;; 07:41FC $F0 $E7
    rra                                           ;; 07:41FE $1F
    rra                                           ;; 07:41FF $1F
    rra                                           ;; 07:4200 $1F
    and  $01                                      ;; 07:4201 $E6 $01
    call SetEntitySpriteVariant                   ;; 07:4203 $CD $0C $3B
    call UpdateEntityPosWithSpeed_07              ;; 07:4206 $CD $0A $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:4209 $CD $23 $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:420C $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 07:420F $CD $05 $0C
    jr   nz, .ret_4233                            ;; 07:4212 $20 $1F

    call GetRandomByte                            ;; 07:4214 $CD $0D $28
    and  $1F                                      ;; 07:4217 $E6 $1F
    add  $20                                      ;; 07:4219 $C6 $20
    ld   [hl], a                                  ;; 07:421B $77
    and  $07                                      ;; 07:421C $E6 $07
    ld   e, a                                     ;; 07:421E $5F
    ld   d, b                                     ;; 07:421F $50
    ld   hl, Data_007_41E8                        ;; 07:4220 $21 $E8 $41
    add  hl, de                                   ;; 07:4223 $19
    ld   a, [hl]                                  ;; 07:4224 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:4225 $21 $40 $C2
    add  hl, bc                                   ;; 07:4228 $09
    ld   [hl], a                                  ;; 07:4229 $77
    ld   hl, Data_007_41E6                        ;; 07:422A $21 $E6 $41
    add  hl, de                                   ;; 07:422D $19
    ld   a, [hl]                                  ;; 07:422E $7E
    call GetEntitySpeedYAddress                   ;; 07:422F $CD $05 $40
    ld   [hl], a                                  ;; 07:4232 $77

.ret_4233
    ret                                           ;; 07:4233 $C9
