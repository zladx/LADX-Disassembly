IF __WEAK_GENIE__
    DEF JAR_HEALTH = $02
    DEF GENIE_HEALTH = $06
ELSE
    DEF JAR_HEALTH = $03
    DEF GENIE_HEALTH = $08
ENDC

GenieEntityHandler::
    call label_394D                               ;; 04:4000 $CD $4D $39
    call BossIntro                                ;; 04:4003 $CD $E8 $3E
    ld   hl, wEntitiesPrivateState1Table          ;; 04:4006 $21 $B0 $C2
    add  hl, bc                                   ;; 04:4009 $09
    ld   a, [hl]                                  ;; 04:400A $7E
    JP_TABLE                                      ;; 04:400B $C7
._00 dw GenieState0Handler
._01 dw GenieState1Handler
._02 dw GenieState2Handler
._03 dw GenieState3Handler
._04 dw GenieState4Handler

GenieState0Handler::
    ld   hl, wEntitiesPrivateState4Table          ;; 04:4016 $21 $40 $C4
    add  hl, bc                                   ;; 04:4019 $09
    ld   a, [hl]                                  ;; 04:401A $7E
    cp   JAR_HEALTH                               ;; 04:401B $FE $03
    jr   c, .jr_404E                              ;; 04:401D $38 $2F

    ld   a, ENTITY_GENIE                          ;; 04:401F $3E $5C
    call SpawnNewEntity_trampoline                ;; 04:4021 $CD $86 $3B

    ldh  a, [hMultiPurpose0]                      ;; 04:4024 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 04:4026 $21 $00 $C2
    add  hl, de                                   ;; 04:4029 $19
    ld   [hl], a                                  ;; 04:402A $77
    ldh  a, [hMultiPurpose1]                      ;; 04:402B $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 04:402D $21 $10 $C2
    add  hl, de                                   ;; 04:4030 $19
    sub  $18                                      ;; 04:4031 $D6 $18
    ld   [hl], a                                  ;; 04:4033 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 04:4034 $21 $B0 $C2
    add  hl, de                                   ;; 04:4037 $19
    ld   [hl], $02                                ;; 04:4038 $36 $02
    ld   hl, wEntitiesTransitionCountdownTable    ;; 04:403A $21 $E0 $C2
    add  hl, de                                   ;; 04:403D $19
    ld   [hl], $27                                ;; 04:403E $36 $27
    ld   hl, wEntitiesHealthTable                 ;; 04:4040 $21 $60 $C3
    add  hl, de                                   ;; 04:4043 $19
    ld   [hl], $08                                ;; 04:4044 $36 $08
    call label_3E34                               ;; 04:4046 $CD $34 $3E
    ld   a, NOISE_SFX_BREAK                       ;; 04:4049 $3E $29
    ldh  [hNoiseSfx], a                           ;; 04:404B $E0 $F4
    ret                                           ;; 04:404D $C9

.jr_404E
    ld   hl, wEntitiesHealthTable                 ;; 04:404E $21 $60 $C3
    add  hl, bc                                   ;; 04:4051 $09
    ld   [hl], $20                                ;; 04:4052 $36 $20
    ld   a, c                                     ;; 04:4054 $79
    ld   [wIntroSubTimer], a                      ;; 04:4055 $EA $02 $D0
    call func_004_42B3                            ;; 04:4058 $CD $B3 $42
    call ReturnIfNonInteractive_04                ;; 04:405B $CD $A3 $7F
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:405E $21 $40 $C3
    add  hl, bc                                   ;; 04:4061 $09
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS        ;; 04:4062 $36 $81
    ld   hl, wEntitiesHitboxFlagsTable            ;; 04:4064 $21 $50 $C3
    add  hl, bc                                   ;; 04:4067 $09
    ld   [hl], $80                                ;; 04:4068 $36 $80
    call AddEntityZSpeedToPos_04                  ;; 04:406A $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                 ;; 04:406D $21 $20 $C3
    add  hl, bc                                   ;; 04:4070 $09
    dec  [hl]                                     ;; 04:4071 $35
    dec  [hl]                                     ;; 04:4072 $35
    ld   hl, wEntitiesPosZTable                   ;; 04:4073 $21 $10 $C3
    add  hl, bc                                   ;; 04:4076 $09
    ld   a, [hl]                                  ;; 04:4077 $7E
    ldh  [hMultiPurposeG], a                      ;; 04:4078 $E0 $E8
    and  $80                                      ;; 04:407A $E6 $80
    jr   z, .jr_4085                              ;; 04:407C $28 $07

    xor  a                                        ;; 04:407E $AF
    ld   [hl], a                                  ;; 04:407F $77
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4080 $21 $20 $C3
    add  hl, bc                                   ;; 04:4083 $09
    ld   [hl], b                                  ;; 04:4084 $70

.jr_4085
    ldh  a, [hActiveEntityState]                  ;; 04:4085 $F0 $F0
    JP_TABLE                                      ;; 04:4087 $C7
._00 dw func_004_4090
._01 dw func_004_40A3
._02 dw func_004_4155
._03 dw func_004_4214

func_004_4090::
    ldh  a, [hLinkPositionY]                      ;; 04:4090 $F0 $99
    cp   $70                                      ;; 04:4092 $FE $70
    jr   nc, .ret_409E                            ;; 04:4094 $30 $08

    call IncrementEntityState                     ;; 04:4096 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 04:4099 $CD $05 $0C
    ld   [hl], $FF                                ;; 04:409C $36 $FF

.ret_409E
    ret                                           ;; 04:409E $C9

Data_004_409F::
    db   $00, $01, $00, $02

func_004_40A3::
    call DecrementEntityIgnoreHitsCountdown       ;; 04:40A3 $CD $56 $0C
    call label_3B70                               ;; 04:40A6 $CD $70 $3B
    call label_3B44                               ;; 04:40A9 $CD $44 $3B
    jr   nc, .jr_40C7                             ;; 04:40AC $30 $19

    call ResetPegasusBoots                        ;; 04:40AE $CD $B6 $0C
    ld   a, JINGLE_BUMP                           ;; 04:40B1 $3E $09
    ldh  [hJingle], a                             ;; 04:40B3 $E0 $F2
    ld   a, $10                                   ;; 04:40B5 $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 04:40B7 $EA $3E $C1
    ld   a, $14                                   ;; 04:40BA $3E $14
    call GetVectorTowardsLink_trampoline          ;; 04:40BC $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 04:40BF $F0 $D7
    ldh  [hLinkSpeedY], a                         ;; 04:40C1 $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 04:40C3 $F0 $D8
    ldh  [hLinkSpeedX], a                         ;; 04:40C5 $E0 $9A

.jr_40C7
    ld   hl, wEntitiesPrivateState3Table          ;; 04:40C7 $21 $D0 $C2
    add  hl, bc                                   ;; 04:40CA $09
    ld   a, [hl]                                  ;; 04:40CB $7E
    and  a                                        ;; 04:40CC $A7
    jr   nz, jr_004_4118                          ;; 04:40CD $20 $49

    ldh  a, [hMultiPurposeG]                      ;; 04:40CF $F0 $E8
    and  $80                                      ;; 04:40D1 $E6 $80
    jr   z, .jr_40DF                              ;; 04:40D3 $28 $0A

    ld   hl, wEntitiesSpeedZTable                 ;; 04:40D5 $21 $20 $C3
    add  hl, bc                                   ;; 04:40D8 $09
    ld   [hl], $10                                ;; 04:40D9 $36 $10
    ld   a, JINGLE_BOUNCE                         ;; 04:40DB $3E $20
    ldh  [hJingle], a                             ;; 04:40DD $E0 $F2

.jr_40DF
    ldh  a, [hLinkPositionX]                      ;; 04:40DF $F0 $98
    push af                                       ;; 04:40E1 $F5
    ld   a, $50                                   ;; 04:40E2 $3E $50
    ldh  [hLinkPositionX], a                      ;; 04:40E4 $E0 $98
    ldh  a, [hLinkPositionY]                      ;; 04:40E6 $F0 $99
    push af                                       ;; 04:40E8 $F5
    ld   a, $48                                   ;; 04:40E9 $3E $48
    ldh  [hLinkPositionY], a                      ;; 04:40EB $E0 $99
    ld   a, $08                                   ;; 04:40ED $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 04:40EF $CD $AA $3B
    ldh  a, [hActiveEntityPosX]                   ;; 04:40F2 $F0 $EE
    ld   hl, hLinkPositionX                       ;; 04:40F4 $21 $98 $FF
    sub  [hl]                                     ;; 04:40F7 $96
    add  $02                                      ;; 04:40F8 $C6 $02
    cp   $04                                      ;; 04:40FA $FE $04
    jr   nc, .jr_410F                             ;; 04:40FC $30 $11

    ldh  a, [hActiveEntityPosY]                   ;; 04:40FE $F0 $EF
    ld   hl, hLinkPositionY                       ;; 04:4100 $21 $99 $FF
    sub  [hl]                                     ;; 04:4103 $96
    add  $02                                      ;; 04:4104 $C6 $02
    cp   $04                                      ;; 04:4106 $FE $04
    jr   nc, .jr_410F                             ;; 04:4108 $30 $05

    ld   hl, wEntitiesPrivateState3Table          ;; 04:410A $21 $D0 $C2
    add  hl, bc                                   ;; 04:410D $09
    inc  [hl]                                     ;; 04:410E $34

.jr_410F
    pop  af                                       ;; 04:410F $F1
    ldh  [hLinkPositionY], a                      ;; 04:4110 $E0 $99
    pop  af                                       ;; 04:4112 $F1
    ldh  [hLinkPositionX], a                      ;; 04:4113 $E0 $98
    call UpdateEntityPosWithSpeed_04              ;; 04:4115 $CD $CA $6D

jr_004_4118:
    call GetEntityTransitionCountdown             ;; 04:4118 $CD $05 $0C
    cp   $01                                      ;; 04:411B $FE $01
    jr   nz, jr_004_4144                          ;; 04:411D $20 $25

    ld   a, ENTITY_GENIE                          ;; 04:411F $3E $5C
    call SpawnNewEntity_trampoline                ;; 04:4121 $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 04:4124 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 04:4126 $21 $00 $C2
    add  hl, de                                   ;; 04:4129 $19
    ld   [hl], a                                  ;; 04:412A $77
    ldh  a, [hMultiPurpose1]                      ;; 04:412B $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 04:412D $21 $10 $C2
    add  hl, de                                   ;; 04:4130 $19
    sub  $26                                      ;; 04:4131 $D6 $26
    ld   [hl], a                                  ;; 04:4133 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 04:4134 $21 $B0 $C2
    add  hl, de                                   ;; 04:4137 $19
    ld   [hl], $02                                ;; 04:4138 $36 $02
    ld   hl, wEntitiesTransitionCountdownTable    ;; 04:413A $21 $E0 $C2
    add  hl, de                                   ;; 04:413D $19
    ld   [hl], $47                                ;; 04:413E $36 $47
    ld   a, JINGLE_GENIE_APPEAR                   ;; 04:4140 $3E $06
    ldh  [hJingle], a                             ;; 04:4142 $E0 $F2

label_004_4144:
jr_004_4144:
    ldh  a, [hFrameCounter]                       ;; 04:4144 $F0 $E7
    rra                                           ;; 04:4146 $1F
    rra                                           ;; 04:4147 $1F
    rra                                           ;; 04:4148 $1F
    and  $03                                      ;; 04:4149 $E6 $03
    ld   e, a                                     ;; 04:414B $5F
    ld   d, b                                     ;; 04:414C $50
    ld   hl, Data_004_409F                        ;; 04:414D $21 $9F $40
    add  hl, de                                   ;; 04:4150 $19
    ld   a, [hl]                                  ;; 04:4151 $7E
    jp   SetEntitySpriteVariant                   ;; 04:4152 $C3 $0C $3B

func_004_4155::
    call GetEntityTransitionCountdown             ;; 04:4155 $CD $05 $0C
    jr   z, jr_004_41AC                           ;; 04:4158 $28 $52

    dec  a                                        ;; 04:415A $3D
    jr   nz, .jr_4163                             ;; 04:415B $20 $06

    call IncrementEntityState                     ;; 04:415D $CD $12 $3B
    ld   [hl], $03                                ;; 04:4160 $36 $03
    ret                                           ;; 04:4162 $C9

.jr_4163
    ld   hl, wEntitiesPosZTable                   ;; 04:4163 $21 $10 $C3
    add  hl, bc                                   ;; 04:4166 $09
    ld   a, [hl]                                  ;; 04:4167 $7E
    and  a                                        ;; 04:4168 $A7
    jr   nz, jr_004_41A6                          ;; 04:4169 $20 $3B

    call GetEntityTransitionCountdown             ;; 04:416B $CD $05 $0C
    cp   $28                                      ;; 04:416E $FE $28
    jr   c, .jr_418D                              ;; 04:4170 $38 $1B

    ld   hl, wEntitiesSpeedXTable                 ;; 04:4172 $21 $40 $C2
    add  hl, bc                                   ;; 04:4175 $09
    ld   a, [hl]                                  ;; 04:4176 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:4177 $21 $50 $C2
    add  hl, bc                                   ;; 04:417A $09
    or   [hl]                                     ;; 04:417B $B6
    jr   z, .jr_418D                              ;; 04:417C $28 $0F

    ld   hl, wEntitiesPrivateState5Table          ;; 04:417E $21 $90 $C3
    add  hl, bc                                   ;; 04:4181 $09
    ld   a, [hl]                                  ;; 04:4182 $7E
    and  $01                                      ;; 04:4183 $E6 $01
    jr   nz, .jr_418D                             ;; 04:4185 $20 $06

    inc  [hl]                                     ;; 04:4187 $34
    call_open_dialog Dialog17F                    ;; 04:4188

.jr_418D
    call ClearEntitySpeed                         ;; 04:418D $CD $7F $3D
    call GetEntityTransitionCountdown             ;; 04:4190 $CD $05 $0C
    cp   $28                                      ;; 04:4193 $FE $28
    jr   nc, jr_004_41A9                          ;; 04:4195 $30 $12

    ld   e, $08                                   ;; 04:4197 $1E $08
    ldh  a, [hFrameCounter]                       ;; 04:4199 $F0 $E7
    and  $04                                      ;; 04:419B $E6 $04
    jr   z, .jr_41A1                              ;; 04:419D $28 $02

    ld   e, $F8                                   ;; 04:419F $1E $F8

.jr_41A1
    ld   hl, wEntitiesSpeedXTable                 ;; 04:41A1 $21 $40 $C2
    add  hl, bc                                   ;; 04:41A4 $09
    ld   [hl], e                                  ;; 04:41A5 $73

jr_004_41A6:
    call UpdateEntityPosWithSpeed_04              ;; 04:41A6 $CD $CA $6D

jr_004_41A9:
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:41A9 $CD $23 $3B

jr_004_41AC:
    call DecrementEntityIgnoreHitsCountdown       ;; 04:41AC $CD $56 $0C
    call label_3B70                               ;; 04:41AF $CD $70 $3B
    call PushLinkOutOfEntity_04                   ;; 04:41B2 $CD $E3 $7B
    ldh  a, [hActiveEntityPosX]                   ;; 04:41B5 $F0 $EE
    ld   hl, hLinkPositionX                       ;; 04:41B7 $21 $98 $FF
    sub  [hl]                                     ;; 04:41BA $96
    add  $10                                      ;; 04:41BB $C6 $10
    cp   $20                                      ;; 04:41BD $FE $20
    jr   nc, jr_004_4210                          ;; 04:41BF $30 $4F

    ldh  a, [hActiveEntityVisualPosY]             ;; 04:41C1 $F0 $EC
    ld   hl, hLinkPositionY                       ;; 04:41C3 $21 $99 $FF
    sub  [hl]                                     ;; 04:41C6 $96
    add  $10                                      ;; 04:41C7 $C6 $10
    cp   $20                                      ;; 04:41C9 $FE $20
    jr   nc, jr_004_4210                          ;; 04:41CB $30 $43

    call ResetPegasusBoots                        ;; 04:41CD $CD $B6 $0C
    ld   a, [wInventoryItems.BButtonSlot]         ;; 04:41D0 $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 04:41D3 $FE $03
    jr   nz, .checkAButtonSlot                    ;; 04:41D5 $20 $08

    ldh  a, [hPressedButtonsMask]                 ;; 04:41D7 $F0 $CB
    and  J_B                                      ;; 04:41D9 $E6 $20
    jr   nz, jr_004_41EC                          ;; 04:41DB $20 $0F

    jr   jr_004_4210                              ;; 04:41DD $18 $31

.checkAButtonSlot
    ld   a, [wInventoryItems.AButtonSlot]         ;; 04:41DF $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 04:41E2 $FE $03
    jr   nz, jr_004_4210                          ;; 04:41E4 $20 $2A

    ldh  a, [hPressedButtonsMask]                 ;; 04:41E6 $F0 $CB
    and  J_A                                      ;; 04:41E8 $E6 $10
    jr   z, jr_004_4210                           ;; 04:41EA $28 $24

jr_004_41EC:
    ld   a, [wC3CF]                               ;; 04:41EC $FA $CF $C3
    and  a                                        ;; 04:41EF $A7
    jr   nz, jr_004_4210                          ;; 04:41F0 $20 $1E

    inc  a                                        ;; 04:41F2 $3C
    ld   [wC3CF], a                               ;; 04:41F3 $EA $CF $C3
    ld   hl, wEntitiesStatusTable                 ;; 04:41F6 $21 $80 $C2
    add  hl, bc                                   ;; 04:41F9 $09
    ld   [hl], $07                                ;; 04:41FA $36 $07
    ld   hl, wEntitiesLiftedTable                 ;; 04:41FC $21 $90 $C4
    add  hl, bc                                   ;; 04:41FF $09
    ld   [hl], b                                  ;; 04:4200 $70
    ldh  a, [hLinkDirection]                      ;; 04:4201 $F0 $9E
    ld   [wC15D], a                               ;; 04:4203 $EA $5D $C1
    ld   hl, hWaveSfx                             ;; 04:4206 $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ;; 04:4209 $36 $02
    call GetEntityTransitionCountdown             ;; 04:420B $CD $05 $0C
    ld   [hl], $08                                ;; 04:420E $36 $08

jr_004_4210:
    xor  a                                        ;; 04:4210 $AF
    jp   SetEntitySpriteVariant                   ;; 04:4211 $C3 $0C $3B

func_004_4214::
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:4214 $21 $20 $C4
    add  hl, bc                                   ;; 04:4217 $09
    ld   a, [hl]                                  ;; 04:4218 $7E
    and  a                                        ;; 04:4219 $A7
    jr   z, .jr_4245                              ;; 04:421A $28 $29

    ld   [hl], b                                  ;; 04:421C $70
    call IncrementEntityState                     ;; 04:421D $CD $12 $3B
    ld   [hl], $02                                ;; 04:4220 $36 $02
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4222 $21 $20 $C3
    add  hl, bc                                   ;; 04:4225 $09
    ld   [hl], $20                                ;; 04:4226 $36 $20
    ld   a, $08                                   ;; 04:4228 $3E $08
    call GetVectorTowardsLink_trampoline          ;; 04:422A $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 04:422D $F0 $D7
    cpl                                           ;; 04:422F $2F
    inc  a                                        ;; 04:4230 $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 04:4231 $21 $50 $C2
    add  hl, bc                                   ;; 04:4234 $09
    ld   [hl], a                                  ;; 04:4235 $77
    ldh  a, [hMultiPurpose1]                      ;; 04:4236 $F0 $D8
    cpl                                           ;; 04:4238 $2F
    inc  a                                        ;; 04:4239 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 04:423A $21 $40 $C2
    add  hl, bc                                   ;; 04:423D $09
    ld   [hl], a                                  ;; 04:423E $77
    call GetEntityTransitionCountdown             ;; 04:423F $CD $05 $0C
    ld   [hl], $C0                                ;; 04:4242 $36 $C0
    ret                                           ;; 04:4244 $C9

.jr_4245
    call ApplyRecoilIfNeeded_04                   ;; 04:4245 $CD $80 $6D
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:4248 $21 $40 $C3
    add  hl, bc                                   ;; 04:424B $09
    ld   [hl], $01                                ;; 04:424C $36 $01
    ld   hl, wEntitiesHitboxFlagsTable            ;; 04:424E $21 $50 $C3
    add  hl, bc                                   ;; 04:4251 $09
    ld   [hl], $00                                ;; 04:4252 $36 $00
    ld   hl, wEntitiesOptions1Table               ;; 04:4254 $21 $30 $C4
    add  hl, bc                                   ;; 04:4257 $09
    ld   [hl], ENTITY_OPT1_NONE                   ;; 04:4258 $36 $00
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:425A $CD $39 $3B
    ld   hl, wEntitiesOptions1Table               ;; 04:425D $21 $30 $C4
    add  hl, bc                                   ;; 04:4260 $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_NO_GROUND_INTERACTION ;; 04:4261 $36 $D0
    ldh  a, [hMultiPurposeG]                      ;; 04:4263 $F0 $E8
    and  $80                                      ;; 04:4265 $E6 $80
    jr   z, .jr_4278                              ;; 04:4267 $28 $0F

    ld   hl, wEntitiesSpeedZTable                 ;; 04:4269 $21 $20 $C3
    add  hl, bc                                   ;; 04:426C $09
    ld   [hl], $10                                ;; 04:426D $36 $10
    ld   a, JINGLE_BOUNCE                         ;; 04:426F $3E $20
    ldh  [hJingle], a                             ;; 04:4271 $E0 $F2
    ld   a, $0C                                   ;; 04:4273 $3E $0C
    call ApplyVectorTowardsLink_trampoline        ;; 04:4275 $CD $AA $3B

.jr_4278
    call UpdateEntityPosWithSpeed_04              ;; 04:4278 $CD $CA $6D
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:427B $CD $23 $3B
    jp   label_004_4144                           ;; 04:427E $C3 $44 $41

Data_004_4281::
    db   $F0, $00, $76, $06, $F0, $08, $76, $26   ;; 04:4281
    db   $00, $00, $78, $06, $00, $08, $78, $26   ;; 04:4289
    db   $F0, $00, $7A, $06, $F0, $08, $7C, $06   ;; 04:4291
    db   $00, $00, $7E, $06, $00, $08, $7E, $26   ;; 04:4299
    db   $F0, $00, $7C, $26, $F0, $08, $7A, $26   ;; 04:42A1
    db   $00, $00, $7E, $06, $00, $08, $7E, $26   ;; 04:42A9

Data_004_42B1::
    db   $26, $00                                 ;; 04:42B1

func_004_42B3::
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:42B3 $21 $B0 $C3
    add  hl, bc                                   ;; 04:42B6 $09
    ld   a, [hl]                                  ;; 04:42B7 $7E
    rla                                           ;; 04:42B8 $17
    rla                                           ;; 04:42B9 $17
    rla                                           ;; 04:42BA $17
    rla                                           ;; 04:42BB $17
    and  $F0                                      ;; 04:42BC $E6 $F0
    ld   e, a                                     ;; 04:42BE $5F
    ld   d, b                                     ;; 04:42BF $50
    ld   hl, Data_004_4281                        ;; 04:42C0 $21 $81 $42
    add  hl, de                                   ;; 04:42C3 $19
    ld   c, $04                                   ;; 04:42C4 $0E $04
    call RenderActiveEntitySpritesRect            ;; 04:42C6 $CD $E6 $3C
    ld   a, $04                                   ;; 04:42C9 $3E $04
    call func_015_7964_trampoline                 ;; 04:42CB $CD $A0 $3D
    ld   hl, wEntitiesPosZTable                   ;; 04:42CE $21 $10 $C3
    add  hl, bc                                   ;; 04:42D1 $09
    ld   a, [hl]                                  ;; 04:42D2 $7E
    and  a                                        ;; 04:42D3 $A7
    ret  z                                        ;; 04:42D4 $C8

    ldh  a, [hActiveEntityPosY]                   ;; 04:42D5 $F0 $EF
    add  $0A                                      ;; 04:42D7 $C6 $0A
    ldh  [hActiveEntityVisualPosY], a             ;; 04:42D9 $E0 $EC
    xor  a                                        ;; 04:42DB $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:42DC $E0 $F1
    ld   de, Data_004_42B1                        ;; 04:42DE $11 $B1 $42
    call RenderActiveEntitySprite                 ;; 04:42E1 $CD $77 $3C
    jp   CopyEntityPositionToActivePosition       ;; 04:42E4 $C3 $8A $3D

; Called by TableJump above for Level 2 Boss
GenieState1Handler::
    call func_004_46F9                            ;; 04:42E7 $CD $F9 $46
    ldh  a, [hActiveEntityStatus]                 ;; 04:42EA $F0 $EA
    cp   $05                                      ;; 04:42EC $FE $05
    jr   z, jr_004_431A                           ;; 04:42EE $28 $2A

; Level 2 Boss killed
label_004_42F0:
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:42F0 $21 $20 $C4
    add  hl, bc                                   ;; 04:42F3 $09
    ldh  a, [hFrameCounter]                       ;; 04:42F4 $F0 $E7
    ld   [hl], a                                  ;; 04:42F6 $77

    ldh  a, [hActiveEntityState]                  ;; 04:42F7 $F0 $F0
    JP_TABLE                                      ;; 04:42F9 $C7
._00 dw GenieKilledHandler0
._01 dw GenieKilledHandler1
._02 dw GenieKilledHandler2

GenieKilledHandler0::
    call GetEntityTransitionCountdown             ;; 04:4300 $CD $05 $0C
    ld   [hl], $40                                ;; 04:4303 $36 $40
    jp   IncrementEntityState                     ;; 04:4305 $C3 $12 $3B

GenieKilledHandler1::
    call GetEntityTransitionCountdown             ;; 04:4308 $CD $05 $0C
    ret  nz                                       ;; 04:430B $C0

    ld   [hl], $A0                                ;; 04:430C $36 $A0
    jp   IncrementEntityState                     ;; 04:430E $C3 $12 $3B

GenieKilledHandler2::
    call GetEntityTransitionCountdown             ;; 04:4311 $CD $05 $0C
    jp   z, DropHeartContainer_04                 ;; 04:4314 $CA $51 $57

    jp   BossDeathRandomExplosion                 ;; 04:4317 $C3 $EF $50

jr_004_431A:
    call ReturnIfNonInteractive_04                ;; 04:431A $CD $A3 $7F
    ld   hl, wEntitiesSpeedXTable                 ;; 04:431D $21 $40 $C2
    add  hl, bc                                   ;; 04:4320 $09
    ld   a, [hl]                                  ;; 04:4321 $7E
    ld   [wIsFileSelectionArrowShifted], a        ;; 04:4322 $EA $00 $D0
    ld   hl, wEntitiesSpeedYTable                 ;; 04:4325 $21 $50 $C2
    add  hl, bc                                   ;; 04:4328 $09
    ld   a, [hl]                                  ;; 04:4329 $7E
    ld   [wIntroTimer], a                         ;; 04:432A $EA $01 $D0
    ldh  a, [hActiveEntityState]                  ;; 04:432D $F0 $F0
    cp   $05                                      ;; 04:432F $FE $05
    jr   z, .jr_4336                              ;; 04:4331 $28 $03

    call label_3B44                               ;; 04:4333 $CD $44 $3B

.jr_4336
    ldh  a, [hActiveEntityState]                  ;; 04:4336 $F0 $F0
    JP_TABLE                                      ;; 04:4338
._00 dw func_004_4345                             ;; 04:4339
._01 dw func_004_4380                             ;; 04:433B
._02 dw func_004_449F                             ;; 04:433D
._03 dw func_004_44E9                             ;; 04:433F
._04 dw func_004_4517                             ;; 04:4341
._05 dw func_004_4575                             ;; 04:4343

func_004_4345::
    call GetEntityTransitionCountdown             ;; 04:4345 $CD $05 $0C
    ret  nz                                       ;; 04:4348 $C0

    call IncrementEntityState                     ;; 04:4349 $CD $12 $3B
    call GetEntityPrivateCountdown1               ;; 04:434C $CD $00 $0C
    ld   [hl], $FF                                ;; 04:434F $36 $FF
    ld   a, [wIntroSubTimer]                      ;; 04:4351 $FA $02 $D0
    ld   e, a                                     ;; 04:4354 $5F
    ld   d, b                                     ;; 04:4355 $50
    ld   hl, wEntitiesStatusTable                 ;; 04:4356 $21 $80 $C2
    add  hl, de                                   ;; 04:4359 $19
    ld   a, [hl]                                  ;; 04:435A $7E
    and  a                                        ;; 04:435B $A7
    ld_dialog_low a, Dialog052                    ;; 04:435C $3E $52
    jr   nz, .jr_436D                             ;; 04:435E $20 $0D

    call IncrementEntityState                     ;; 04:4360 $CD $12 $3B
    ld   [hl], $04                                ;; 04:4363 $36 $04
    ld   hl, wEntitiesHealthTable                 ;; 04:4365 $21 $60 $C3
    add  hl, bc                                   ;; 04:4368 $09
    ld   [hl], GENIE_HEALTH                       ;; 04:4369 $36 $08
    ld_dialog_low a, Dialog053                    ;; 04:436B $3E $53

.jr_436D
    jp   OpenDialogInTable0                       ;; 04:436D $C3 $85 $23

Data_004_4370::
    db   $10, $14, $18, $20, $28, $30, $38, $40
    db   $FF, $FF

Data_004_437A::
    db   $60, $40

Data_004_437C::
    db   1, -1

Data_004_437E::
    db   8, -8

func_004_4380::
    call UpdateEntityPosWithSpeed_04              ;; 04:4380 $CD $CA $6D
    ld   hl, wEntitiesDirectionTable              ;; 04:4383 $21 $80 $C3
    add  hl, bc                                   ;; 04:4386 $09
    ld   e, [hl]                                  ;; 04:4387 $5E
    ld   d, b                                     ;; 04:4388 $50
    ldh  a, [hFrameCounter]                       ;; 04:4389 $F0 $E7
    and  $07                                      ;; 04:438B $E6 $07
    jr   nz, jr_004_43A6                          ;; 04:438D $20 $17

    ld   hl, wEntitiesSpeedXTable                 ;; 04:438F $21 $40 $C2
    add  hl, bc                                   ;; 04:4392 $09
    ld   a, [hl]                                  ;; 04:4393 $7E

.jr_4394
    ld   hl, Data_004_437E                        ;; 04:4394 $21 $7E $43
    add  hl, de                                   ;; 04:4397 $19
    cp   [hl]                                     ;; 04:4398 $BE
    jr   z, jr_004_43A6                           ;; 04:4399 $28 $0B

    ld   hl, Data_004_437C                        ;; 04:439B $21 $7C $43
    add  hl, de                                   ;; 04:439E $19
    ld   a, [hl]                                  ;; 04:439F $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:43A0 $21 $40 $C2
    add  hl, bc                                   ;; 04:43A3 $09
    add  [hl]                                     ;; 04:43A4 $86
    ld   [hl], a                                  ;; 04:43A5 $77

jr_004_43A6:
    ld   hl, Data_004_437A                        ;; 04:43A6 $21 $7A $43
    add  hl, de                                   ;; 04:43A9 $19
    ldh  a, [hActiveEntityPosX]                   ;; 04:43AA $F0 $EE
    cp   [hl]                                     ;; 04:43AC $BE
    jr   nz, .jr_43B7                             ;; 04:43AD $20 $08

    ld   hl, wEntitiesDirectionTable              ;; 04:43AF $21 $80 $C3
    add  hl, bc                                   ;; 04:43B2 $09
    ld   a, [hl]                                  ;; 04:43B3 $7E
    xor  $01                                      ;; 04:43B4 $EE $01
    ld   [hl], a                                  ;; 04:43B6 $77

.jr_43B7
    ldh  a, [hFrameCounter]                       ;; 04:43B7 $F0 $E7
    and  $01                                      ;; 04:43B9 $E6 $01
    jr   nz, .jr_43DD                             ;; 04:43BB $20 $20

    ld   hl, wEntitiesPrivateState2Table          ;; 04:43BD $21 $C0 $C2
    add  hl, bc                                   ;; 04:43C0 $09
    ld   e, [hl]                                  ;; 04:43C1 $5E
    ld   d, b                                     ;; 04:43C2 $50
    ld   hl, Data_004_437C                        ;; 04:43C3 $21 $7C $43
    add  hl, de                                   ;; 04:43C6 $19
    ld   a, [hl]                                  ;; 04:43C7 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:43C8 $21 $50 $C2
    add  hl, bc                                   ;; 04:43CB $09
    add  [hl]                                     ;; 04:43CC $86
    ld   [hl], a                                  ;; 04:43CD $77
    ld   hl, Data_004_437E                        ;; 04:43CE $21 $7E $43
    add  hl, de                                   ;; 04:43D1 $19
    cp   [hl]                                     ;; 04:43D2 $BE
    jr   nz, .jr_43DD                             ;; 04:43D3 $20 $08

    ld   hl, wEntitiesPrivateState2Table          ;; 04:43D5 $21 $C0 $C2
    add  hl, bc                                   ;; 04:43D8 $09
    ld   a, [hl]                                  ;; 04:43D9 $7E
    xor  $01                                      ;; 04:43DA $EE $01
    ld   [hl], a                                  ;; 04:43DC $77

.jr_43DD
    ldh  a, [hFrameCounter]                       ;; 04:43DD $F0 $E7
    rra                                           ;; 04:43DF $1F
    rra                                           ;; 04:43E0 $1F
    rra                                           ;; 04:43E1 $1F
    rra                                           ;; 04:43E2 $1F
    and  $01                                      ;; 04:43E3 $E6 $01
    call SetEntitySpriteVariant                   ;; 04:43E5 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 04:43E8 $CD $05 $0C
    jr   nz, jr_004_4438                          ;; 04:43EB $20 $4B

    push hl                                       ;; 04:43ED $E5
    ld   hl, wEntitiesInertiaTable                ;; 04:43EE $21 $D0 $C3
    add  hl, bc                                   ;; 04:43F1 $09
    ld   a, [hl]                                  ;; 04:43F2 $7E
    ld   e, a                                     ;; 04:43F3 $5F
    cp   $08                                      ;; 04:43F4 $FE $08
    jr   c, .jr_43FF                              ;; 04:43F6 $38 $07

    call IncrementEntityState                     ;; 04:43F8 $CD $12 $3B
    pop  hl                                       ;; 04:43FB $E1
    ld   [hl], $30                                ;; 04:43FC $36 $30
    ret                                           ;; 04:43FE $C9

.jr_43FF
    ld   d, b                                     ;; 04:43FF $50
    ld   hl, Data_004_4370                        ;; 04:4400 $21 $70 $43
    add  hl, de                                   ;; 04:4403 $19
    ld   a, [hl]                                  ;; 04:4404 $7E
    pop  hl                                       ;; 04:4405 $E1
    ld   [hl], a                                  ;; 04:4406 $77

    ld   a, ENTITY_GENIE                          ;; 04:4407 $3E $5C
    call SpawnNewEntity_trampoline                ;; 04:4409 $CD $86 $3B
    jr   c, jr_004_4438                           ;; 04:440C $38 $2A

    ldh  a, [hMultiPurpose0]                      ;; 04:440E $F0 $D7
    sub  $0C                                      ;; 04:4410 $D6 $0C
    ld   hl, wEntitiesPosXTable                   ;; 04:4412 $21 $00 $C2
    add  hl, de                                   ;; 04:4415 $19
    ld   [hl], a                                  ;; 04:4416 $77
    ldh  a, [hMultiPurpose1]                      ;; 04:4417 $F0 $D8
    sub  $14                                      ;; 04:4419 $D6 $14
    ld   hl, wEntitiesPosYTable                   ;; 04:441B $21 $10 $C2
    add  hl, de                                   ;; 04:441E $19
    ld   [hl], a                                  ;; 04:441F $77
    ld   hl, wEntitiesPrivateState1Table          ;; 04:4420 $21 $B0 $C2
    add  hl, de                                   ;; 04:4423 $19
    ld   [hl], $03                                ;; 04:4424 $36 $03
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4426 $21 $20 $C3
    add  hl, de                                   ;; 04:4429 $19
    ld   [hl], $20                                ;; 04:442A $36 $20
    ld   hl, wEntitiesSpeedXTable                 ;; 04:442C $21 $40 $C2
    add  hl, de                                   ;; 04:442F $19
    ld   [hl], $0C                                ;; 04:4430 $36 $0C
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:4432 $21 $40 $C3
    add  hl, de                                   ;; 04:4435 $19
    ld   [hl], 2 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 04:4436 $36 $42

jr_004_4438:
    call GetEntityPrivateCountdown1               ;; 04:4438 $CD $00 $0C
    jr   nz, .jr_4487                             ;; 04:443B $20 $4A

    ld   [hl], $30                                ;; 04:443D $36 $30

    ld   a, ENTITY_GENIE                          ;; 04:443F $3E $5C
    call SpawnNewEntity_trampoline                ;; 04:4441 $CD $86 $3B
    jr   c, .jr_4487                              ;; 04:4444 $38 $41

    push bc                                       ;; 04:4446 $C5
    ld   hl, wEntitiesInertiaTable                ;; 04:4447 $21 $D0 $C3
    add  hl, bc                                   ;; 04:444A $09
    ld   a, [hl]                                  ;; 04:444B $7E
    inc  [hl]                                     ;; 04:444C $34
    and  $01                                      ;; 04:444D $E6 $01
    ld   c, a                                     ;; 04:444F $4F
    ld   hl, Data_004_449D                        ;; 04:4450 $21 $9D $44
    add  hl, bc                                   ;; 04:4453 $09
    ldh  a, [hMultiPurpose0]                      ;; 04:4454 $F0 $D7
    add  [hl]                                     ;; 04:4456 $86
    ld   hl, wEntitiesPosXTable                   ;; 04:4457 $21 $00 $C2
    add  hl, de                                   ;; 04:445A $19
    ld   [hl], a                                  ;; 04:445B $77
    ldh  a, [hMultiPurpose1]                      ;; 04:445C $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 04:445E $21 $10 $C2
    add  hl, de                                   ;; 04:4461 $19
    ld   [hl], a                                  ;; 04:4462 $77
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4463 $21 $20 $C3
    add  hl, de                                   ;; 04:4466 $19
    ld   [hl], $24                                ;; 04:4467 $36 $24
    ld   hl, wEntitiesPrivateState1Table          ;; 04:4469 $21 $B0 $C2
    add  hl, de                                   ;; 04:446C $19
    ld   [hl], $04                                ;; 04:446D $36 $04
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:446F $21 $40 $C3
    add  hl, de                                   ;; 04:4472 $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 04:4473 $36 $12
    ld   c, e                                     ;; 04:4475 $4B
    ld   b, d                                     ;; 04:4476 $42
    ld   a, $1F                                   ;; 04:4477 $3E $1F
    call ApplyVectorTowardsLink_trampoline        ;; 04:4479 $CD $AA $3B
    pop  bc                                       ;; 04:447C $C1
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 04:447D $21 $00 $C3
    add  hl, bc                                   ;; 04:4480 $09
    ld   [hl], $10                                ;; 04:4481 $36 $10
    ld   a, NOISE_SFX_GENIE_FIREBALL              ;; 04:4483 $3E $28
    ldh  [hNoiseSfx], a                           ;; 04:4485 $E0 $F4

.jr_4487
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 04:4487 $21 $00 $C3
    add  hl, bc                                   ;; 04:448A $09
    ld   a, [hl]                                  ;; 04:448B $7E
    and  a                                        ;; 04:448C $A7
    ret  z                                        ;; 04:448D $C8

    ld   hl, wEntitiesInertiaTable                ;; 04:448E $21 $D0 $C3
    add  hl, bc                                   ;; 04:4491 $09
    ld   a, [hl]                                  ;; 04:4492 $7E
    and  $01                                      ;; 04:4493 $E6 $01
    ld   a, $02                                   ;; 04:4495 $3E $02
    jr   z, .jr_449A                              ;; 04:4497 $28 $01

    inc  a                                        ;; 04:4499 $3C

.jr_449A
    jp   SetEntitySpriteVariant                   ;; 04:449A $C3 $0C $3B

Data_004_449D::
    db   $F4, $0C

func_004_449F::
    ld   a, [wIntroSubTimer]                      ;; 04:449F $FA $02 $D0
    ld   e, a                                     ;; 04:44A2 $5F
    ld   d, b                                     ;; 04:44A3 $50
    ldh  a, [hLinkPositionX]                      ;; 04:44A4 $F0 $98
    push af                                       ;; 04:44A6 $F5
    ld   hl, wEntitiesPosXTable                   ;; 04:44A7 $21 $00 $C2
    add  hl, de                                   ;; 04:44AA $19
    ld   a, [hl]                                  ;; 04:44AB $7E
    ldh  [hLinkPositionX], a                      ;; 04:44AC $E0 $98
    ldh  a, [hLinkPositionY]                      ;; 04:44AE $F0 $99
    push af                                       ;; 04:44B0 $F5
    ld   hl, wEntitiesPosYTable                   ;; 04:44B1 $21 $10 $C2
    add  hl, de                                   ;; 04:44B4 $19
    ld   a, [hl]                                  ;; 04:44B5 $7E
    sub  $20                                      ;; 04:44B6 $D6 $20
    ldh  [hLinkPositionY], a                      ;; 04:44B8 $E0 $99
    ld   a, $10                                   ;; 04:44BA $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 04:44BC $CD $AA $3B
    call UpdateEntityPosWithSpeed_04              ;; 04:44BF $CD $CA $6D
    ld   hl, hLinkPositionX                       ;; 04:44C2 $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ;; 04:44C5 $F0 $EE
    sub  [hl]                                     ;; 04:44C7 $96
    add  $03                                      ;; 04:44C8 $C6 $03
    cp   $06                                      ;; 04:44CA $FE $06
    jr   nc, .jr_44E2                             ;; 04:44CC $30 $14

    ld   hl, hLinkPositionY                       ;; 04:44CE $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:44D1 $F0 $EC
    sub  [hl]                                     ;; 04:44D3 $96
    add  $03                                      ;; 04:44D4 $C6 $03
    cp   $06                                      ;; 04:44D6 $FE $06
    jr   nc, .jr_44E2                             ;; 04:44D8 $30 $08

    call GetEntityTransitionCountdown             ;; 04:44DA $CD $05 $0C
    ld   [hl], $10                                ;; 04:44DD $36 $10
    call IncrementEntityState                     ;; 04:44DF $CD $12 $3B

.jr_44E2
    pop  af                                       ;; 04:44E2 $F1
    ldh  [hLinkPositionY], a                      ;; 04:44E3 $E0 $99
    pop  af                                       ;; 04:44E5 $F1
    ldh  [hLinkPositionX], a                      ;; 04:44E6 $E0 $98
    ret                                           ;; 04:44E8 $C9

func_004_44E9::
    call GetEntityTransitionCountdown             ;; 04:44E9 $CD $05 $0C
    jp   z, ClearEntityStatusBank04               ;; 04:44EC $CA $7A $6D

    cp   $04                                      ;; 04:44EF $FE $04
    jr   nz, .ret_4516                            ;; 04:44F1 $20 $23

    ld   a, ENTITY_GENIE                          ;; 04:44F3 $3E $5C
    call SpawnNewEntity_trampoline                ;; 04:44F5 $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 04:44F8 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 04:44FA $21 $00 $C2
    add  hl, de                                   ;; 04:44FD $19
    ld   [hl], a                                  ;; 04:44FE $77
    ldh  a, [hMultiPurpose1]                      ;; 04:44FF $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 04:4501 $21 $10 $C2
    add  hl, de                                   ;; 04:4504 $19
    ld   [hl], a                                  ;; 04:4505 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 04:4506 $21 $B0 $C2
    add  hl, de                                   ;; 04:4509 $19
    ld   [hl], $02                                ;; 04:450A $36 $02
    ld   hl, wEntitiesTransitionCountdownTable    ;; 04:450C $21 $E0 $C2
    add  hl, de                                   ;; 04:450F $19
    ld   [hl], $C7                                ;; 04:4510 $36 $C7
    ld   a, JINGLE_GENIE_DISAPPEAR                ;; 04:4512 $3E $1F
    ldh  [hJingle], a                             ;; 04:4514 $E0 $F2

.ret_4516
    ret                                           ;; 04:4516 $C9

func_004_4517::
    ld   hl, wEntitiesHitboxFlagsTable            ;; 04:4517 $21 $50 $C3
    add  hl, bc                                   ;; 04:451A $09
    ld   [hl], $0C                                ;; 04:451B $36 $0C
    ld   hl, wEntitiesOptions1Table               ;; 04:451D $21 $30 $C4
    add  hl, bc                                   ;; 04:4520 $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_NO_WALL_COLLISION ;; 04:4521 $36 $81
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:4523 $21 $20 $C4
    add  hl, bc                                   ;; 04:4526 $09
    ld   a, [hl]                                  ;; 04:4527 $7E
    cp   $02                                      ;; 04:4528 $FE $02
    jr   nz, .jr_4535                             ;; 04:452A $20 $09

    call IncrementEntityState                     ;; 04:452C $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 04:452F $CD $05 $0C
    ld   [hl], $80                                ;; 04:4532 $36 $80
    ret                                           ;; 04:4534 $C9

.jr_4535
    call ApplyRecoilIfNeeded_04                   ;; 04:4535 $CD $80 $6D
    call label_3B70                               ;; 04:4538 $CD $70 $3B
    call UpdateEntityPosWithSpeed_04              ;; 04:453B $CD $CA $6D
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:453E $CD $23 $3B
    ldh  a, [hFrameCounter]                       ;; 04:4541 $F0 $E7
    and  $03                                      ;; 04:4543 $E6 $03
    jr   nz, jr_004_4568                          ;; 04:4545 $20 $21

    ld   a, $10                                   ;; 04:4547 $3E $10
    call GetVectorTowardsLink_trampoline          ;; 04:4549 $CD $B5 $3B
    ld   hl, wEntitiesSpeedXTable                 ;; 04:454C $21 $40 $C2
    add  hl, bc                                   ;; 04:454F $09
    ldh  a, [hMultiPurpose1]                      ;; 04:4550 $F0 $D8
    sub  [hl]                                     ;; 04:4552 $96
    and  $80                                      ;; 04:4553 $E6 $80
    jr   z, .jr_4559                              ;; 04:4555 $28 $02

    dec  [hl]                                     ;; 04:4557 $35
    dec  [hl]                                     ;; 04:4558 $35

.jr_4559
    inc  [hl]                                     ;; 04:4559 $34
    ld   hl, wEntitiesSpeedYTable                 ;; 04:455A $21 $50 $C2
    add  hl, bc                                   ;; 04:455D $09
    ldh  a, [hMultiPurpose0]                      ;; 04:455E $F0 $D7
    sub  [hl]                                     ;; 04:4560 $96
    and  $80                                      ;; 04:4561 $E6 $80
    jr   z, .jr_4567                              ;; 04:4563 $28 $02

    dec  [hl]                                     ;; 04:4565 $35
    dec  [hl]                                     ;; 04:4566 $35

.jr_4567
    inc  [hl]                                     ;; 04:4567 $34

label_004_4568:
jr_004_4568:
    ldh  a, [hFrameCounter]                       ;; 04:4568 $F0 $E7
    rra                                           ;; 04:456A $1F
    rra                                           ;; 04:456B $1F
    rra                                           ;; 04:456C $1F
    rra                                           ;; 04:456D $1F
    and  $01                                      ;; 04:456E $E6 $01
    add  $02                                      ;; 04:4570 $C6 $02
    jp   SetEntitySpriteVariant                   ;; 04:4572 $C3 $0C $3B

func_004_4575::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:4575 $21 $40 $C3
    add  hl, bc                                   ;; 04:4578 $09
    ld   [hl], 1 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 04:4579 $36 $41
    call GetEntityTransitionCountdown             ;; 04:457B $CD $05 $0C
    jr   nz, jr_004_45F1                          ;; 04:457E $20 $71

    call IncrementEntityState                     ;; 04:4580 $CD $12 $3B
    ld   [hl], $04                                ;; 04:4583 $36 $04
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:4585 $21 $40 $C3
    add  hl, bc                                   ;; 04:4588 $09
    ld   [hl], 1                                  ;; 04:4589 $36 $01
    call GetRandomByte                            ;; 04:458B $CD $0D $28
    and  $01                                      ;; 04:458E $E6 $01
    jr   nz, .jr_45A6                             ;; 04:4590 $20 $14

    ld   hl, wEntitiesPrivateState3Table          ;; 04:4592 $21 $D0 $C2
    add  hl, bc                                   ;; 04:4595 $09
    ld   a, [hl]                                  ;; 04:4596 $7E
    ld   hl, wEntitiesPosYTable                   ;; 04:4597 $21 $10 $C2
    add  hl, bc                                   ;; 04:459A $09
    ld   [hl], a                                  ;; 04:459B $77
    ld   hl, wEntitiesPrivateState4Table          ;; 04:459C $21 $40 $C4
    add  hl, bc                                   ;; 04:459F $09
    ld   a, [hl]                                  ;; 04:45A0 $7E
    ld   hl, wEntitiesPosXTable                   ;; 04:45A1 $21 $00 $C2
    add  hl, bc                                   ;; 04:45A4 $09
    ld   [hl], a                                  ;; 04:45A5 $77

.jr_45A6
    call ClearEntitySpeed                         ;; 04:45A6 $CD $7F $3D
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 04:45A9 $21 $10 $C4
    add  hl, bc                                   ;; 04:45AC $09
    ld   [hl], b                                  ;; 04:45AD $70
    ld   a, ENTITY_GENIE                          ;; 04:45AE $3E $5C
    call SpawnNewEntity_trampoline                ;; 04:45B0 $CD $86 $3B
    jr   c, .ret_45F0                             ;; 04:45B3 $38 $3B

    push bc                                       ;; 04:45B5 $C5
    ld   hl, wEntitiesInertiaTable                ;; 04:45B6 $21 $D0 $C3
    add  hl, bc                                   ;; 04:45B9 $09
    ld   a, [hl]                                  ;; 04:45BA $7E
    inc  [hl]                                     ;; 04:45BB $34
    and  $01                                      ;; 04:45BC $E6 $01
    ld   c, a                                     ;; 04:45BE $4F
    ld   hl, Data_004_449D                        ;; 04:45BF $21 $9D $44
    add  hl, bc                                   ;; 04:45C2 $09
    ldh  a, [hMultiPurpose0]                      ;; 04:45C3 $F0 $D7
    add  [hl]                                     ;; 04:45C5 $86
    ld   hl, wEntitiesPosXTable                   ;; 04:45C6 $21 $00 $C2
    add  hl, de                                   ;; 04:45C9 $19
    ld   [hl], a                                  ;; 04:45CA $77
    ldh  a, [hMultiPurpose1]                      ;; 04:45CB $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 04:45CD $21 $10 $C2
    add  hl, de                                   ;; 04:45D0 $19
    ld   [hl], a                                  ;; 04:45D1 $77
    ld   hl, wEntitiesSpeedZTable                 ;; 04:45D2 $21 $20 $C3
    add  hl, de                                   ;; 04:45D5 $19
    ld   [hl], $24                                ;; 04:45D6 $36 $24
    ld   hl, wEntitiesPrivateState1Table          ;; 04:45D8 $21 $B0 $C2
    add  hl, de                                   ;; 04:45DB $19
    ld   [hl], $04                                ;; 04:45DC $36 $04
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:45DE $21 $40 $C3
    add  hl, de                                   ;; 04:45E1 $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 04:45E2 $36 $12
    ld   c, e                                     ;; 04:45E4 $4B
    ld   b, d                                     ;; 04:45E5 $42
    ld   a, $1F                                   ;; 04:45E6 $3E $1F
    call ApplyVectorTowardsLink_trampoline        ;; 04:45E8 $CD $AA $3B
    pop  bc                                       ;; 04:45EB $C1
    ld   a, NOISE_SFX_GENIE_FIREBALL              ;; 04:45EC $3E $28
    ldh  [hNoiseSfx], a                           ;; 04:45EE $E0 $F4

.ret_45F0
    ret                                           ;; 04:45F0 $C9

jr_004_45F1:
    ldh  a, [hLinkPositionX]                      ;; 04:45F1 $F0 $98
    push af                                       ;; 04:45F3 $F5
    ld   a, $50                                   ;; 04:45F4 $3E $50
    ldh  [hLinkPositionX], a                      ;; 04:45F6 $E0 $98
    ldh  a, [hLinkPositionY]                      ;; 04:45F8 $F0 $99
    push af                                       ;; 04:45FA $F5
    ld   a, $48                                   ;; 04:45FB $3E $48
    ldh  [hLinkPositionY], a                      ;; 04:45FD $E0 $99
    ld   a, $20                                   ;; 04:45FF $3E $20
    call GetVectorTowardsLink_trampoline          ;; 04:4601 $CD $B5 $3B
    ldh  a, [hMultiPurpose1]                      ;; 04:4604 $F0 $D8
    cpl                                           ;; 04:4606 $2F
    inc  a                                        ;; 04:4607 $3C
    push af                                       ;; 04:4608 $F5
    ldh  a, [hMultiPurpose0]                      ;; 04:4609 $F0 $D7
    push af                                       ;; 04:460B $F5
    ld   a, $04                                   ;; 04:460C $3E $04
    call GetVectorTowardsLink_trampoline          ;; 04:460E $CD $B5 $3B
    ld   hl, hMultiPurpose1                       ;; 04:4611 $21 $D8 $FF
    pop  af                                       ;; 04:4614 $F1
    add  [hl]                                     ;; 04:4615 $86
    ld   hl, wEntitiesSpeedXTable                 ;; 04:4616 $21 $40 $C2
    add  hl, bc                                   ;; 04:4619 $09
    ld   [hl], a                                  ;; 04:461A $77
    ld   hl, hMultiPurpose0                       ;; 04:461B $21 $D7 $FF
    pop  af                                       ;; 04:461E $F1
    add  [hl]                                     ;; 04:461F $86
    ld   hl, wEntitiesSpeedYTable                 ;; 04:4620 $21 $50 $C2
    add  hl, bc                                   ;; 04:4623 $09
    ld   [hl], a                                  ;; 04:4624 $77
    pop  af                                       ;; 04:4625 $F1
    ldh  [hLinkPositionY], a                      ;; 04:4626 $E0 $99
    pop  af                                       ;; 04:4628 $F1
    ldh  [hLinkPositionX], a                      ;; 04:4629 $E0 $98
    call UpdateEntityPosWithSpeed_04              ;; 04:462B $CD $CA $6D
    call func_004_4634                            ;; 04:462E $CD $34 $46
    jp   label_004_4568                           ;; 04:4631 $C3 $68 $45

func_004_4634::
    ld   hl, wEntitiesPosYTable                   ;; 04:4634 $21 $10 $C2
    add  hl, bc                                   ;; 04:4637 $09
    ld   a, [hl]                                  ;; 04:4638 $7E
    sub  $48                                      ;; 04:4639 $D6 $48
    ld   e, a                                     ;; 04:463B $5F
    ld   a, $48                                   ;; 04:463C $3E $48
    sub  e                                        ;; 04:463E $93
    ld   hl, wEntitiesPrivateState3Table          ;; 04:463F $21 $D0 $C2
    add  hl, bc                                   ;; 04:4642 $09
    ld   [hl], a                                  ;; 04:4643 $77
    ld   hl, wEntitiesPosXTable                   ;; 04:4644 $21 $00 $C2
    add  hl, bc                                   ;; 04:4647 $09
    ld   a, [hl]                                  ;; 04:4648 $7E
    sub  $50                                      ;; 04:4649 $D6 $50
    ld   e, a                                     ;; 04:464B $5F
    ld   a, $50                                   ;; 04:464C $3E $50
    sub  e                                        ;; 04:464E $93
    ld   hl, wEntitiesPrivateState4Table          ;; 04:464F $21 $40 $C4
    add  hl, bc                                   ;; 04:4652 $09
    ld   [hl], a                                  ;; 04:4653 $77
    ret                                           ;; 04:4654 $C9

Data_004_4655::
    db   $F0, $F4, $60, $02, $F0, $FC, $62, $02   ;; 04:4655
    db   $F0, $04, $64, $02, $F0, $0C, $62, $22   ;; 04:465D
    db   $F0, $14, $60, $22, $00, $F4, $66, $02   ;; 04:4665
    db   $00, $FC, $68, $02, $00, $04, $6A, $02   ;; 04:466D
    db   $00, $0C, $68, $22, $00, $14, $66, $22   ;; 04:4675
    db   $F0, $F4, $60, $02, $F0, $FC, $62, $02   ;; 04:467D
    db   $F0, $04, $64, $22, $F0, $0C, $62, $22   ;; 04:4685
    db   $F0, $14, $60, $22, $00, $F4, $66, $02   ;; 04:468D
    db   $00, $FC, $68, $02, $00, $04, $6A, $22   ;; 04:4695
    db   $00, $0C, $68, $22, $00, $14, $66, $22   ;; 04:469D
    db   $F0, $F4, $60, $02, $F0, $FC, $62, $02   ;; 04:46A5
    db   $F0, $04, $64, $02, $F0, $0C, $6C, $02   ;; 04:46AD
    db   $F0, $14, $6E, $02, $00, $F4, $66, $02   ;; 04:46B5
    db   $00, $FC, $68, $02, $00, $04, $6A, $02   ;; 04:46BD
    db   $00, $0C, $70, $02, $00, $14, $72, $02   ;; 04:46C5
    db   $F0, $F4, $6E, $22, $F0, $FC, $6C, $22   ;; 04:46CD
    db   $F0, $04, $64, $22, $F0, $0C, $62, $22   ;; 04:46D5
    db   $F0, $14, $60, $22, $00, $F4, $72, $22   ;; 04:46DD
    db   $00, $FC, $70, $22, $00, $04, $6A, $22   ;; 04:46E5
    db   $00, $0C, $68, $22, $00, $14, $66, $22   ;; 04:46ED

Data_004_46F5::
    db   $74, $02, $74, $22                       ;; 04:46F5

func_004_46F9::
    ldh  a, [hActiveEntityState]                  ;; 04:46F9 $F0 $F0
    cp   $05                                      ;; 04:46FB $FE $05
    jr   nz, .jr_4713                             ;; 04:46FD $20 $14

    ldh  a, [hFrameCounter]                       ;; 04:46FF $F0 $E7
    and  $01                                      ;; 04:4701 $E6 $01
    jr   nz, .jr_4713                             ;; 04:4703 $20 $0E

    ld   hl, wEntitiesPrivateState3Table          ;; 04:4705 $21 $D0 $C2
    add  hl, bc                                   ;; 04:4708 $09
    ld   a, [hl]                                  ;; 04:4709 $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 04:470A $E0 $EC
    ld   hl, wEntitiesPrivateState4Table          ;; 04:470C $21 $40 $C4
    add  hl, bc                                   ;; 04:470F $09
    ld   a, [hl]                                  ;; 04:4710 $7E
    ldh  [hActiveEntityPosX], a                   ;; 04:4711 $E0 $EE

.jr_4713
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:4713 $21 $B0 $C3
    add  hl, bc                                   ;; 04:4716 $09
    ld   a, [hl]                                  ;; 04:4717 $7E
    ld   e, a                                     ;; 04:4718 $5F
    ld   d, b                                     ;; 04:4719 $50
    sla  e                                        ;; 04:471A $CB $23
    sla  e                                        ;; 04:471C $CB $23
    sla  e                                        ;; 04:471E $CB $23
    ld   a, e                                     ;; 04:4720 $7B
    sla  e                                        ;; 04:4721 $CB $23
    sla  e                                        ;; 04:4723 $CB $23
    add  e                                        ;; 04:4725 $83
    ld   e, a                                     ;; 04:4726 $5F
    ld   hl, Data_004_4655                        ;; 04:4727 $21 $55 $46
    add  hl, de                                   ;; 04:472A $19
    ld   c, $0A                                   ;; 04:472B $0E $0A
    call RenderActiveEntitySpritesRect            ;; 04:472D $CD $E6 $3C
    ld   a, $0A                                   ;; 04:4730 $3E $0A
    call func_015_7964_trampoline                 ;; 04:4732 $CD $A0 $3D
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:4735 $F0 $EC
    add  $10                                      ;; 04:4737 $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ;; 04:4739 $E0 $EC
    ldh  a, [hFrameCounter]                       ;; 04:473B $F0 $E7
    rra                                           ;; 04:473D $1F
    rra                                           ;; 04:473E $1F
    rra                                           ;; 04:473F $1F
    and  $01                                      ;; 04:4740 $E6 $01
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:4742 $E0 $F1
    ld   de, Data_004_46F5                        ;; 04:4744 $11 $F5 $46
    call RenderActiveEntitySprite                 ;; 04:4747 $CD $77 $3C
    jp   CopyEntityPositionToActivePosition       ;; 04:474A $C3 $8A $3D

Data_004_474D::
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ;; 04:474D
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ;; 04:4755
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ;; 04:475D
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ;; 04:4765
    db   $08, $00, $30, $01, $08, $08, $30, $61   ;; 04:476D
    db   $08, $00, $30, $01, $08, $08, $30, $61   ;; 04:4775
    db   $08, $00, $30, $01, $08, $08, $30, $61   ;; 04:477D
    db   $08, $00, $30, $01, $08, $08, $30, $61   ;; 04:4785
    db   $04, $00, $30, $01, $04, $08, $30, $61   ;; 04:478D
    db   $14, $00, $1E, $01, $14, $08, $1E, $61   ;; 04:4795
    db   $14, $00, $1E, $01, $14, $08, $1E, $61   ;; 04:479D
    db   $14, $00, $1E, $01, $14, $08, $1E, $61   ;; 04:47A5
    db   $00, $00, $30, $01, $00, $08, $30, $61   ;; 04:47AD
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ;; 04:47B5
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ;; 04:47BD
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ;; 04:47C5
    db   $F2, $FA, $30, $01, $F2, $02, $30, $61   ;; 04:47CD
    db   $F2, $06, $30, $01, $F2, $0E, $30, $61   ;; 04:47D5
    db   $FE, $FA, $30, $01, $FE, $02, $30, $61   ;; 04:47DD
    db   $FE, $06, $30, $01, $FE, $0E, $30, $61   ;; 04:47E5
    db   $F0, $F8, $30, $41, $F0, $00, $30, $21   ;; 04:47ED
    db   $F0, $08, $30, $41, $F0, $10, $30, $21   ;; 04:47F5
    db   $00, $F8, $30, $41, $00, $00, $30, $21   ;; 04:47FD
    db   $00, $08, $30, $41, $00, $10, $30, $21   ;; 04:4805
    db   $F0, $F8, $32, $01, $F0, $00, $32, $61   ;; 04:480D
    db   $F0, $08, $32, $01, $F0, $10, $32, $61   ;; 04:4815
    db   $00, $F8, $32, $01, $00, $00, $32, $61   ;; 04:481D
    db   $00, $08, $32, $01, $00, $10, $32, $61   ;; 04:4825

Data_004_482D::
    db   $06, $05, $04, $05, $04, $03, $02, $01, $00 ;; 04:482D

Data_004_4836::
    db   $00, $01, $02, $03, $04, $05, $04, $05, $06 ;; 04:4836

GenieState2Handler::
    db   $CD                                      ;; 04:483F
    cp   b                                        ;; 04:4840 $B8
    ld   c, b                                     ;; 04:4841 $48
    call ReturnIfNonInteractive_04                ;; 04:4842 $CD $A3 $7F
    call GetEntityTransitionCountdown             ;; 04:4845 $CD $05 $0C
    bit  7, a                                     ;; 04:4848 $CB $7F
    jr   z, jr_004_486D                           ;; 04:484A $28 $21

    and  $7F                                      ;; 04:484C $E6 $7F
    jr   nz, .jr_485E                             ;; 04:484E $20 $0E

    ld   a, [wIntroSubTimer]                      ;; 04:4850 $FA $02 $D0
    ld   e, a                                     ;; 04:4853 $5F
    ld   d, b                                     ;; 04:4854 $50
    ld   hl, wEntitiesStateTable                  ;; 04:4855 $21 $90 $C2
    add  hl, de                                   ;; 04:4858 $19
    ld   [hl], $03                                ;; 04:4859 $36 $03
    jp   ClearEntityStatusBank04                  ;; 04:485B $C3 $7A $6D

.jr_485E
    rra                                           ;; 04:485E $1F
    rra                                           ;; 04:485F $1F
    rra                                           ;; 04:4860 $1F
    and  $0F                                      ;; 04:4861 $E6 $0F
    ld   e, a                                     ;; 04:4863 $5F
    ld   d, b                                     ;; 04:4864 $50
    ld   hl, Data_004_4836                        ;; 04:4865 $21 $36 $48
    add  hl, de                                   ;; 04:4868 $19
    ld   a, [hl]                                  ;; 04:4869 $7E
    jp   SetEntitySpriteVariant                   ;; 04:486A $C3 $0C $3B

jr_004_486D:
    and  a                                        ;; 04:486D $A7
    jp   z, ClearEntityStatusBank04               ;; 04:486E $CA $7A $6D

    cp   $06                                      ;; 04:4871 $FE $06
    jr   nz, jr_004_48A6                          ;; 04:4873 $20 $31

    ld   a, ENTITY_GENIE                          ;; 04:4875 $3E $5C
    call SpawnNewEntity_trampoline                ;; 04:4877 $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 04:487A $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 04:487C $21 $00 $C2
    add  hl, de                                   ;; 04:487F $19
    ld   [hl], a                                  ;; 04:4880 $77
    ldh  a, [hMultiPurpose1]                      ;; 04:4881 $F0 $D8
    cp   $14                                      ;; 04:4883 $FE $14
    jr   nc, .jr_4889                             ;; 04:4885 $30 $02

    ld   a, $14                                   ;; 04:4887 $3E $14

.jr_4889
    ld   hl, wEntitiesPosYTable                   ;; 04:4889 $21 $10 $C2
    add  hl, de                                   ;; 04:488C $19
    ld   [hl], a                                  ;; 04:488D $77
    ld   hl, wEntitiesPrivateState1Table          ;; 04:488E $21 $B0 $C2
    add  hl, de                                   ;; 04:4891 $19
    ld   [hl], $01                                ;; 04:4892 $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ;; 04:4894 $21 $E0 $C2
    add  hl, de                                   ;; 04:4897 $19
    ld   [hl], $40                                ;; 04:4898 $36 $40
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:489A $21 $40 $C3
    add  hl, de                                   ;; 04:489D $19
    ld   [hl], 1                                  ;; 04:489E $36 $01
    ld   hl, wEntitiesHitboxFlagsTable            ;; 04:48A0 $21 $50 $C3
    add  hl, de                                   ;; 04:48A3 $19
    ld   [hl], $8C                                ;; 04:48A4 $36 $8C

jr_004_48A6:
    call GetEntityTransitionCountdown             ;; 04:48A6 $CD $05 $0C
    rra                                           ;; 04:48A9 $1F
    rra                                           ;; 04:48AA $1F
    rra                                           ;; 04:48AB $1F
    and  $0F                                      ;; 04:48AC $E6 $0F
    ld   e, a                                     ;; 04:48AE $5F
    ld   d, b                                     ;; 04:48AF $50
    ld   hl, Data_004_482D                        ;; 04:48B0 $21 $2D $48
    add  hl, de                                   ;; 04:48B3 $19
    ld   a, [hl]                                  ;; 04:48B4 $7E
    jp   SetEntitySpriteVariant                   ;; 04:48B5 $C3 $0C $3B

    ldh  a, [hActiveEntitySpriteVariant]          ;; 04:48B8 $F0 $F1
    rla                                           ;; 04:48BA $17
    rla                                           ;; 04:48BB $17
    rla                                           ;; 04:48BC $17
    rla                                           ;; 04:48BD $17
    rla                                           ;; 04:48BE $17
    and  $E0                                      ;; 04:48BF $E6 $E0
    ld   e, a                                     ;; 04:48C1 $5F
    ld   d, b                                     ;; 04:48C2 $50
    ld   hl, Data_004_474D                        ;; 04:48C3 $21 $4D $47
    add  hl, de                                   ;; 04:48C6 $19
    ld   c, $08                                   ;; 04:48C7 $0E $08
    call RenderActiveEntitySpritesRect            ;; 04:48C9 $CD $E6 $3C
    ld   a, $08                                   ;; 04:48CC $3E $08
    jp   func_015_7964_trampoline                 ;; 04:48CE $C3 $A0 $3D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown012SpriteVariants:: ;; 04:48D1
.variant0
    db $34, OAM_GBC_PAL_2 | OAMF_PAL0
    db $34, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $34, OAM_GBC_PAL_2 | OAMF_PAL1
    db $34, OAM_GBC_PAL_2 | OAMF_PAL1 | OAMF_XFLIP

GenieState3Handler::
    ld   de, Unknown012SpriteVariants             ;; 04:48D9 $11 $D1 $48
    call RenderActiveEntitySpritesPair            ;; 04:48DC $CD $C0 $3B
    call ReturnIfNonInteractive_04                ;; 04:48DF $CD $A3 $7F
    ldh  a, [hFrameCounter]                       ;; 04:48E2 $F0 $E7
    rra                                           ;; 04:48E4 $1F
    rra                                           ;; 04:48E5 $1F
    rra                                           ;; 04:48E6 $1F
    and  $01                                      ;; 04:48E7 $E6 $01
    call SetEntitySpriteVariant                   ;; 04:48E9 $CD $0C $3B
    ld   hl, wEntitiesSpeedXTable                 ;; 04:48EC $21 $40 $C2
    add  hl, bc                                   ;; 04:48EF $09
    ld   a, [hl]                                  ;; 04:48F0 $7E
    push af                                       ;; 04:48F1 $F5
    ld   a, [wIsFileSelectionArrowShifted]        ;; 04:48F2 $FA $00 $D0
    add  [hl]                                     ;; 04:48F5 $86
    ld   [hl], a                                  ;; 04:48F6 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 04:48F7 $21 $50 $C2
    add  hl, bc                                   ;; 04:48FA $09
    ld   a, [hl]                                  ;; 04:48FB $7E
    push af                                       ;; 04:48FC $F5
    ld   a, [wIntroTimer]                         ;; 04:48FD $FA $01 $D0
    add  [hl]                                     ;; 04:4900 $86
    ld   [hl], a                                  ;; 04:4901 $77
    call UpdateEntityPosWithSpeed_04              ;; 04:4902 $CD $CA $6D
    pop  af                                       ;; 04:4905 $F1
    ld   hl, wEntitiesSpeedYTable                 ;; 04:4906 $21 $50 $C2
    add  hl, bc                                   ;; 04:4909 $09
    ld   [hl], a                                  ;; 04:490A $77
    pop  af                                       ;; 04:490B $F1
    ld   hl, wEntitiesSpeedXTable                 ;; 04:490C $21 $40 $C2
    add  hl, bc                                   ;; 04:490F $09
    ld   [hl], a                                  ;; 04:4910 $77
    ldh  a, [hActiveEntityState]                  ;; 04:4911 $F0 $F0
    and  a                                        ;; 04:4913 $A7
    jr   nz, jr_004_4938                          ;; 04:4914 $20 $22

    call AddEntityZSpeedToPos_04                  ;; 04:4916 $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4919 $21 $20 $C3
    add  hl, bc                                   ;; 04:491C $09
    dec  [hl]                                     ;; 04:491D $35
    dec  [hl]                                     ;; 04:491E $35
    ld   hl, wEntitiesPosZTable                   ;; 04:491F $21 $10 $C3
    add  hl, bc                                   ;; 04:4922 $09
    ld   a, [hl]                                  ;; 04:4923 $7E
    and  $80                                      ;; 04:4924 $E6 $80
    jr   z, .ret_4937                             ;; 04:4926 $28 $0F

    ld   [hl], b                                  ;; 04:4928 $70
    call IncrementEntityState                     ;; 04:4929 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 04:492C $CD $05 $0C
    ld   [hl], $08                                ;; 04:492F $36 $08
    ld   hl, wEntitiesSpeedXTable                 ;; 04:4931 $21 $40 $C2
    add  hl, bc                                   ;; 04:4934 $09
    ld   [hl], $E0                                ;; 04:4935 $36 $E0

.ret_4937
    ret                                           ;; 04:4937 $C9

jr_004_4938:
    call GetEntityTransitionCountdown             ;; 04:4938 $CD $05 $0C
    jp   z, ClearEntityStatusBank04               ;; 04:493B $CA $7A $6D

GenieState4Handler::
    ld   de, Unknown012SpriteVariants             ;; 04:493E $11 $D1 $48
    call RenderActiveEntitySpritesPair            ;; 04:4941 $CD $C0 $3B
    call ReturnIfNonInteractive_04                ;; 04:4944 $CD $A3 $7F
    ldh  a, [hFrameCounter]                       ;; 04:4947 $F0 $E7
    rra                                           ;; 04:4949 $1F
    rra                                           ;; 04:494A $1F
    rra                                           ;; 04:494B $1F
    and  $01                                      ;; 04:494C $E6 $01
    call SetEntitySpriteVariant                   ;; 04:494E $CD $0C $3B
    call label_3B44                               ;; 04:4951 $CD $44 $3B
    call UpdateEntityPosWithSpeed_04              ;; 04:4954 $CD $CA $6D
    call AddEntityZSpeedToPos_04                  ;; 04:4957 $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                 ;; 04:495A $21 $20 $C3
    add  hl, bc                                   ;; 04:495D $09
    dec  [hl]                                     ;; 04:495E $35
    dec  [hl]                                     ;; 04:495F $35
    ld   hl, wEntitiesPosZTable                   ;; 04:4960 $21 $10 $C3
    add  hl, bc                                   ;; 04:4963 $09
    ld   a, [hl]                                  ;; 04:4964 $7E
    and  $80                                      ;; 04:4965 $E6 $80
    jp   nz, ClearEntityStatusBank04              ;; 04:4967 $C2 $7A $6D

    ret                                           ;; 04:496A $C9
