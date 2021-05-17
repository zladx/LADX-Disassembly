IF __PATCH_1__
GENIE_VAR_A = $02
GENIE_VAR_B = $06
ELSE
GENIE_VAR_A = $03
GENIE_VAR_B = $08
ENDC

GenieEntityHandler::
    call label_394D                               ; $4000: $CD $4D $39
    call BossIntro                                ; $4003: $CD $E8 $3E
    ld   hl, wEntitiesPrivateState1Table          ; $4006: $21 $B0 $C2
    add  hl, bc                                   ; $4009: $09
    ld   a, [hl]                                  ; $400A: $7E
    JP_TABLE                                      ; $400B: $C7
._00 dw GenieState0Handler
._01 dw GenieState1Handler
._02 dw GenieState2Handler
._03 dw GenieState3Handler
._04 dw GenieState4Handler

GenieState0Handler::
    ld   hl, wEntitiesUnknowTableP                ; $4016: $21 $40 $C4
    add  hl, bc                                   ; $4019: $09
    ld   a, [hl]                                  ; $401A: $7E
    cp   GENIE_VAR_A                              ; $401B: $FE $03
    jr   c, jr_004_404E                           ; $401D: $38 $2F

    ld   a, ENTITY_GENIE                          ; $401F: $3E $5C
    call SpawnNewEntity_trampoline                ; $4021: $CD $86 $3B

    ldh  a, [hMultiPurpose0]                      ; $4024: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $4026: $21 $00 $C2
    add  hl, de                                   ; $4029: $19
    ld   [hl], a                                  ; $402A: $77
    ldh  a, [hMultiPurpose1]                      ; $402B: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $402D: $21 $10 $C2
    add  hl, de                                   ; $4030: $19
    sub  $18                                      ; $4031: $D6 $18
    ld   [hl], a                                  ; $4033: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4034: $21 $B0 $C2
    add  hl, de                                   ; $4037: $19
    ld   [hl], $02                                ; $4038: $36 $02
    ld   hl, wEntitiesTransitionCountdownTable           ; $403A: $21 $E0 $C2
    add  hl, de                                   ; $403D: $19
    ld   [hl], $27                                ; $403E: $36 $27
    ld   hl, wEntitiesHealthTable                                ; $4040: $21 $60 $C3
    add  hl, de                                   ; $4043: $19
    ld   [hl], $08                                ; $4044: $36 $08
    call label_3E34                               ; $4046: $CD $34 $3E
    ld   a, $29                                   ; $4049: $3E $29
    ldh  [hNoiseSfx], a                            ; $404B: $E0 $F4
    ret                                           ; $404D: $C9

jr_004_404E:
    ld   hl, wEntitiesHealthTable                                ; $404E: $21 $60 $C3
    add  hl, bc                                   ; $4051: $09
    ld   [hl], $20                                ; $4052: $36 $20
    ld   a, c                                     ; $4054: $79
    ld   [wIntroSubTimer], a                      ; $4055: $EA $02 $D0
    call func_004_42B3                            ; $4058: $CD $B3 $42
    call func_004_7FA3                            ; $405B: $CD $A3 $7F
    ld   hl, wEntitiesPhysicsFlagsTable                ; $405E: $21 $40 $C3
    add  hl, bc                                   ; $4061: $09
    ld   [hl], $81                                ; $4062: $36 $81
    ld   hl, wEntitiesHitboxFlagsTable                ; $4064: $21 $50 $C3
    add  hl, bc                                   ; $4067: $09
    ld   [hl], $80                                ; $4068: $36 $80
    call AddEntityZSpeedToPos_04                  ; $406A: $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                                ; $406D: $21 $20 $C3
    add  hl, bc                                   ; $4070: $09
    dec  [hl]                                     ; $4071: $35
    dec  [hl]                                     ; $4072: $35
    ld   hl, wEntitiesPosZTable                                ; $4073: $21 $10 $C3
    add  hl, bc                                   ; $4076: $09
    ld   a, [hl]                                  ; $4077: $7E
    ldh  [hMultiPurposeG], a                               ; $4078: $E0 $E8
    and  $80                                      ; $407A: $E6 $80
    jr   z, jr_004_4085                           ; $407C: $28 $07

    xor  a                                        ; $407E: $AF
    ld   [hl], a                                  ; $407F: $77
    ld   hl, wEntitiesSpeedZTable                                ; $4080: $21 $20 $C3
    add  hl, bc                                   ; $4083: $09
    ld   [hl], b                                  ; $4084: $70

jr_004_4085:
    ldh  a, [hActiveEntityState]                  ; $4085: $F0 $F0
    JP_TABLE                                      ; $4087: $C7
._00 dw func_004_4090
._01 dw func_004_40A3
._02 dw func_004_4155
._03 dw func_004_4214

func_004_4090::
    ldh  a, [hLinkPositionY]                      ; $4090: $F0 $99
    cp   $70                                      ; $4092: $FE $70
    jr   nc, jr_004_409E                          ; $4094: $30 $08

    call IncrementEntityState                     ; $4096: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $4099: $CD $05 $0C
    ld   [hl], $FF                                ; $409C: $36 $FF

jr_004_409E:
    ret                                           ; $409E: $C9

Data_004_409F::
    db   $00, $01, $00, $02

func_004_40A3::
    call DecrementEntityIgnoreHitsCountdown       ; $40A3: $CD $56 $0C
    call label_3B70                               ; $40A6: $CD $70 $3B
    call label_3B44                               ; $40A9: $CD $44 $3B
    jr   nc, jr_004_40C7                          ; $40AC: $30 $19

    call ResetPegasusBoots                                ; $40AE: $CD $B6 $0C
    ld   a, JINGLE_BUMP                           ; $40B1: $3E $09
    ldh  [hJingle], a                             ; $40B3: $E0 $F2
    ld   a, $10                                   ; $40B5: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $40B7: $EA $3E $C1
    ld   a, $14                                   ; $40BA: $3E $14
    call GetVectorTowardsLink_trampoline          ; $40BC: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                               ; $40BF: $F0 $D7
    ldh  [hLinkSpeedY], a                               ; $40C1: $E0 $9B
    ldh  a, [hMultiPurpose1]                               ; $40C3: $F0 $D8
    ldh  [hLinkSpeedX], a                               ; $40C5: $E0 $9A

jr_004_40C7:
    ld   hl, wEntitiesUnknownTableD               ; $40C7: $21 $D0 $C2
    add  hl, bc                                   ; $40CA: $09
    ld   a, [hl]                                  ; $40CB: $7E
    and  a                                        ; $40CC: $A7
    jr   nz, jr_004_4118                          ; $40CD: $20 $49

    ldh  a, [hMultiPurposeG]                               ; $40CF: $F0 $E8
    and  $80                                      ; $40D1: $E6 $80
    jr   z, jr_004_40DF                           ; $40D3: $28 $0A

    ld   hl, wEntitiesSpeedZTable                                ; $40D5: $21 $20 $C3
    add  hl, bc                                   ; $40D8: $09
    ld   [hl], $10                                ; $40D9: $36 $10
    ld   a, JINGLE_BIG_BUMP                       ; $40DB: $3E $20
    ldh  [hJingle], a                             ; $40DD: $E0 $F2

jr_004_40DF:
    ldh  a, [hLinkPositionX]                      ; $40DF: $F0 $98
    push af                                       ; $40E1: $F5
    ld   a, $50                                   ; $40E2: $3E $50
    ldh  [hLinkPositionX], a                      ; $40E4: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $40E6: $F0 $99
    push af                                       ; $40E8: $F5
    ld   a, $48                                   ; $40E9: $3E $48
    ldh  [hLinkPositionY], a                      ; $40EB: $E0 $99
    ld   a, $08                                   ; $40ED: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $40EF: $CD $AA $3B
    ldh  a, [hActiveEntityPosX]                               ; $40F2: $F0 $EE
    ld   hl, hLinkPositionX                       ; $40F4: $21 $98 $FF
    sub  [hl]                                     ; $40F7: $96
    add  $02                                      ; $40F8: $C6 $02
    cp   $04                                      ; $40FA: $FE $04
    jr   nc, jr_004_410F                          ; $40FC: $30 $11

    ldh  a, [hActiveEntityPosY]                   ; $40FE: $F0 $EF
    ld   hl, hLinkPositionY                       ; $4100: $21 $99 $FF
    sub  [hl]                                     ; $4103: $96
    add  $02                                      ; $4104: $C6 $02
    cp   $04                                      ; $4106: $FE $04
    jr   nc, jr_004_410F                          ; $4108: $30 $05

    ld   hl, wEntitiesUnknownTableD               ; $410A: $21 $D0 $C2
    add  hl, bc                                   ; $410D: $09
    inc  [hl]                                     ; $410E: $34

jr_004_410F:
    pop  af                                       ; $410F: $F1
    ldh  [hLinkPositionY], a                      ; $4110: $E0 $99
    pop  af                                       ; $4112: $F1
    ldh  [hLinkPositionX], a                      ; $4113: $E0 $98
    call UpdateEntityPosWithSpeed_04              ; $4115: $CD $CA $6D

jr_004_4118:
    call GetEntityTransitionCountdown                 ; $4118: $CD $05 $0C
    cp   $01                                      ; $411B: $FE $01
    jr   nz, jr_004_4144                          ; $411D: $20 $25

    ld   a, ENTITY_GENIE                          ; $411F: $3E $5C
    call SpawnNewEntity_trampoline                ; $4121: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                               ; $4124: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $4126: $21 $00 $C2
    add  hl, de                                   ; $4129: $19
    ld   [hl], a                                  ; $412A: $77
    ldh  a, [hMultiPurpose1]                               ; $412B: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $412D: $21 $10 $C2
    add  hl, de                                   ; $4130: $19
    sub  $26                                      ; $4131: $D6 $26
    ld   [hl], a                                  ; $4133: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4134: $21 $B0 $C2
    add  hl, de                                   ; $4137: $19
    ld   [hl], $02                                ; $4138: $36 $02
    ld   hl, wEntitiesTransitionCountdownTable           ; $413A: $21 $E0 $C2
    add  hl, de                                   ; $413D: $19
    ld   [hl], $47                                ; $413E: $36 $47
    ld   a, JINGLE_ENEMY_MORPH_IN                 ; $4140: $3E $06
    ldh  [hJingle], a                             ; $4142: $E0 $F2

label_004_4144:
jr_004_4144:
    ldh  a, [hFrameCounter]                       ; $4144: $F0 $E7
    rra                                           ; $4146: $1F
    rra                                           ; $4147: $1F
    rra                                           ; $4148: $1F
    and  $03                                      ; $4149: $E6 $03
    ld   e, a                                     ; $414B: $5F
    ld   d, b                                     ; $414C: $50
    ld   hl, Data_004_409F                        ; $414D: $21 $9F $40
    add  hl, de                                   ; $4150: $19
    ld   a, [hl]                                  ; $4151: $7E
    jp   SetEntitySpriteVariant                   ; $4152: $C3 $0C $3B

func_004_4155::
    call GetEntityTransitionCountdown             ; $4155: $CD $05 $0C
    jr   z, jr_004_41AC                           ; $4158: $28 $52

    dec  a                                        ; $415A: $3D
    jr   nz, jr_004_4163                          ; $415B: $20 $06

    call IncrementEntityState                     ; $415D: $CD $12 $3B
    ld   [hl], $03                                ; $4160: $36 $03
    ret                                           ; $4162: $C9

jr_004_4163:
    ld   hl, wEntitiesPosZTable                                ; $4163: $21 $10 $C3
    add  hl, bc                                   ; $4166: $09
    ld   a, [hl]                                  ; $4167: $7E
    and  a                                        ; $4168: $A7
    jr   nz, jr_004_41A6                          ; $4169: $20 $3B

    call GetEntityTransitionCountdown                 ; $416B: $CD $05 $0C
    cp   $28                                      ; $416E: $FE $28
    jr   c, jr_004_418D                           ; $4170: $38 $1B

    ld   hl, wEntitiesSpeedXTable                                ; $4172: $21 $40 $C2
    add  hl, bc                                   ; $4175: $09
    ld   a, [hl]                                  ; $4176: $7E
    ld   hl, wEntitiesSpeedYTable                                ; $4177: $21 $50 $C2
    add  hl, bc                                   ; $417A: $09
    or   [hl]                                     ; $417B: $B6
    jr   z, jr_004_418D                           ; $417C: $28 $0F

    ld   hl, wEntitiesUnknowTableR                ; $417E: $21 $90 $C3
    add  hl, bc                                   ; $4181: $09
    ld   a, [hl]                                  ; $4182: $7E
    and  $01                                      ; $4183: $E6 $01
    jr   nz, jr_004_418D                          ; $4185: $20 $06

    inc  [hl]                                     ; $4187: $34
    call_open_dialog $17F                         ; $4188

jr_004_418D:
    call ClearEntitySpeed                         ; $418D: $CD $7F $3D
    call GetEntityTransitionCountdown                 ; $4190: $CD $05 $0C
    cp   $28                                      ; $4193: $FE $28
    jr   nc, jr_004_41A9                          ; $4195: $30 $12

    ld   e, $08                                   ; $4197: $1E $08
    ldh  a, [hFrameCounter]                       ; $4199: $F0 $E7
    and  $04                                      ; $419B: $E6 $04
    jr   z, jr_004_41A1                           ; $419D: $28 $02

    ld   e, $F8                                   ; $419F: $1E $F8

jr_004_41A1:
    ld   hl, wEntitiesSpeedXTable                                ; $41A1: $21 $40 $C2
    add  hl, bc                                   ; $41A4: $09
    ld   [hl], e                                  ; $41A5: $73

jr_004_41A6:
    call UpdateEntityPosWithSpeed_04              ; $41A6: $CD $CA $6D

jr_004_41A9:
    call label_3B23                               ; $41A9: $CD $23 $3B

jr_004_41AC:
    call DecrementEntityIgnoreHitsCountdown       ; $41AC: $CD $56 $0C
    call label_3B70                               ; $41AF: $CD $70 $3B
    call func_004_7BE3                            ; $41B2: $CD $E3 $7B
    ldh  a, [hActiveEntityPosX]                   ; $41B5: $F0 $EE
    ld   hl, hLinkPositionX                       ; $41B7: $21 $98 $FF
    sub  [hl]                                     ; $41BA: $96
    add  $10                                      ; $41BB: $C6 $10
    cp   $20                                      ; $41BD: $FE $20
    jr   nc, jr_004_4210                          ; $41BF: $30 $4F

    ldh  a, [hActiveEntityVisualPosY]             ; $41C1: $F0 $EC
    ld   hl, hLinkPositionY                       ; $41C3: $21 $99 $FF
    sub  [hl]                                     ; $41C6: $96
    add  $10                                      ; $41C7: $C6 $10
    cp   $20                                      ; $41C9: $FE $20
    jr   nc, jr_004_4210                          ; $41CB: $30 $43

    call ResetPegasusBoots                        ; $41CD: $CD $B6 $0C
    ld   a, [wBButtonSlot]                        ; $41D0: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $41D3: $FE $03
    jr   nz, jr_004_41DF                          ; $41D5: $20 $08

    ldh  a, [hPressedButtonsMask]                 ; $41D7: $F0 $CB
    and  $20                                      ; $41D9: $E6 $20
    jr   nz, jr_004_41EC                          ; $41DB: $20 $0F

    jr   jr_004_4210                              ; $41DD: $18 $31

jr_004_41DF:
    ld   a, [wAButtonSlot]                        ; $41DF: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $41E2: $FE $03
    jr   nz, jr_004_4210                          ; $41E4: $20 $2A

    ldh  a, [hPressedButtonsMask]                 ; $41E6: $F0 $CB
    and  $10                                      ; $41E8: $E6 $10
    jr   z, jr_004_4210                           ; $41EA: $28 $24

jr_004_41EC:
    ld   a, [wC3CF]                               ; $41EC: $FA $CF $C3
    and  a                                        ; $41EF: $A7
    jr   nz, jr_004_4210                          ; $41F0: $20 $1E

    inc  a                                        ; $41F2: $3C
    ld   [wC3CF], a                               ; $41F3: $EA $CF $C3
    ld   hl, wEntitiesStatusTable                   ; $41F6: $21 $80 $C2
    add  hl, bc                                   ; $41F9: $09
    ld   [hl], $07                                ; $41FA: $36 $07
    ld   hl, wEntitiesUnknowTableW                ; $41FC: $21 $90 $C4
    add  hl, bc                                   ; $41FF: $09
    ld   [hl], b                                  ; $4200: $70
    ldh  a, [hLinkDirection]                      ; $4201: $F0 $9E
    ld   [wC15D], a                               ; $4203: $EA $5D $C1
    ld   hl, hWaveSfx                                 ; $4206: $21 $F3 $FF
    ld   [hl], $02                                ; $4209: $36 $02
    call GetEntityTransitionCountdown                 ; $420B: $CD $05 $0C
    ld   [hl], $08                                ; $420E: $36 $08

jr_004_4210:
    xor  a                                        ; $4210: $AF
    jp   SetEntitySpriteVariant                   ; $4211: $C3 $0C $3B

func_004_4214::
    ld   hl, wEntitiesFlashCountdownTable         ; $4214: $21 $20 $C4
    add  hl, bc                                   ; $4217: $09
    ld   a, [hl]                                  ; $4218: $7E
    and  a                                        ; $4219: $A7
    jr   z, jr_004_4245                           ; $421A: $28 $29

    ld   [hl], b                                  ; $421C: $70
    call IncrementEntityState                     ; $421D: $CD $12 $3B
    ld   [hl], $02                                ; $4220: $36 $02
    ld   hl, wEntitiesSpeedZTable                                ; $4222: $21 $20 $C3
    add  hl, bc                                   ; $4225: $09
    ld   [hl], $20                                ; $4226: $36 $20
    ld   a, $08                                   ; $4228: $3E $08
    call GetVectorTowardsLink_trampoline          ; $422A: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                               ; $422D: $F0 $D7
    cpl                                           ; $422F: $2F
    inc  a                                        ; $4230: $3C
    ld   hl, wEntitiesSpeedYTable                                ; $4231: $21 $50 $C2
    add  hl, bc                                   ; $4234: $09
    ld   [hl], a                                  ; $4235: $77
    ldh  a, [hMultiPurpose1]                               ; $4236: $F0 $D8
    cpl                                           ; $4238: $2F
    inc  a                                        ; $4239: $3C
    ld   hl, wEntitiesSpeedXTable                                ; $423A: $21 $40 $C2
    add  hl, bc                                   ; $423D: $09
    ld   [hl], a                                  ; $423E: $77
    call GetEntityTransitionCountdown                 ; $423F: $CD $05 $0C
    ld   [hl], $C0                                ; $4242: $36 $C0
    ret                                           ; $4244: $C9

jr_004_4245:
    call func_004_6D80                            ; $4245: $CD $80 $6D
    ld   hl, wEntitiesPhysicsFlagsTable                ; $4248: $21 $40 $C3
    add  hl, bc                                   ; $424B: $09
    ld   [hl], $01                                ; $424C: $36 $01
    ld   hl, wEntitiesHitboxFlagsTable                ; $424E: $21 $50 $C3
    add  hl, bc                                   ; $4251: $09
    ld   [hl], $00                                ; $4252: $36 $00
    ld   hl, wEntitiesOptions1Table               ; $4254: $21 $30 $C4
    add  hl, bc                                   ; $4257: $09
    ld   [hl], ENTITY_OPT1_NONE                   ; $4258: $36 $00
    call label_3B39                               ; $425A: $CD $39 $3B
    ld   hl, wEntitiesOptions1Table               ; $425D: $21 $30 $C4
    add  hl, bc                                   ; $4260: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_IMMUNE_WATER_PIT                                ; $4261: $36 $D0
    ldh  a, [hMultiPurposeG]                               ; $4263: $F0 $E8
    and  $80                                      ; $4265: $E6 $80
    jr   z, jr_004_4278                           ; $4267: $28 $0F

    ld   hl, wEntitiesSpeedZTable                                ; $4269: $21 $20 $C3
    add  hl, bc                                   ; $426C: $09
    ld   [hl], $10                                ; $426D: $36 $10
    ld   a, JINGLE_BIG_BUMP                       ; $426F: $3E $20
    ldh  [hJingle], a                             ; $4271: $E0 $F2
    ld   a, $0C                                   ; $4273: $3E $0C
    call ApplyVectorTowardsLink_trampoline        ; $4275: $CD $AA $3B

jr_004_4278:
    call UpdateEntityPosWithSpeed_04              ; $4278: $CD $CA $6D
    call label_3B23                               ; $427B: $CD $23 $3B
    jp   label_004_4144                           ; $427E: $C3 $44 $41

Data_004_4281::
    db   $F0, $00, $76, $06, $F0, $08, $76, $26   ; $4281
    db   $00, $00, $78, $06, $00, $08, $78, $26   ; $4289
    db   $F0, $00, $7A, $06, $F0, $08, $7C, $06   ; $4291
    db   $00, $00, $7E, $06, $00, $08, $7E, $26   ; $4299
    db   $F0, $00, $7C, $26, $F0, $08, $7A, $26   ; $42A1
    db   $00, $00, $7E, $06, $00, $08, $7E, $26   ; $42A9

Data_004_42B1::
    db   $26, $00                                 ; $42B1

func_004_42B3::
    ld   hl, wEntitiesSpriteVariantTable                                ; $42B3: $21 $B0 $C3
    add  hl, bc                                   ; $42B6: $09
    ld   a, [hl]                                  ; $42B7: $7E
    rla                                           ; $42B8: $17
    rla                                           ; $42B9: $17
    rla                                           ; $42BA: $17
    rla                                           ; $42BB: $17
    and  $F0                                      ; $42BC: $E6 $F0
    ld   e, a                                     ; $42BE: $5F
    ld   d, b                                     ; $42BF: $50
    ld   hl, Data_004_4281                        ; $42C0: $21 $81 $42
    add  hl, de                                   ; $42C3: $19
    ld   c, $04                                   ; $42C4: $0E $04
    call RenderActiveEntitySpritesRect            ; $42C6: $CD $E6 $3C
    ld   a, $04                                   ; $42C9: $3E $04
    call label_3DA0                               ; $42CB: $CD $A0 $3D
    ld   hl, wEntitiesPosZTable                                ; $42CE: $21 $10 $C3
    add  hl, bc                                   ; $42D1: $09
    ld   a, [hl]                                  ; $42D2: $7E
    and  a                                        ; $42D3: $A7
    ret  z                                        ; $42D4: $C8

    ldh  a, [hActiveEntityPosY]                   ; $42D5: $F0 $EF
    add  $0A                                      ; $42D7: $C6 $0A
    ldh  [hActiveEntityVisualPosY], a             ; $42D9: $E0 $EC
    xor  a                                        ; $42DB: $AF
    ldh  [hActiveEntitySpriteVariant], a                               ; $42DC: $E0 $F1
    ld   de, Data_004_42B1                        ; $42DE: $11 $B1 $42
    call RenderActiveEntitySprite                 ; $42E1: $CD $77 $3C
    jp   CopyEntityPositionToActivePosition       ; $42E4: $C3 $8A $3D

; Called by TableJump above for Level 2 Boss
GenieState1Handler::
    call func_004_46F9                            ; $42E7: $CD $F9 $46
    ldh  a, [hActiveEntityStatus]                   ; $42EA: $F0 $EA
    cp   $05                                      ; $42EC: $FE $05
    jr   z, jr_004_431A                           ; $42EE: $28 $2A

; Level 2 Boss killed
label_004_42F0:
    ld   hl, wEntitiesFlashCountdownTable         ; $42F0: $21 $20 $C4
    add  hl, bc                                   ; $42F3: $09
    ldh  a, [hFrameCounter]                       ; $42F4: $F0 $E7
    ld   [hl], a                                  ; $42F6: $77

    ldh  a, [hActiveEntityState]                  ; $42F7: $F0 $F0
    JP_TABLE                                      ; $42F9: $C7
._00 dw GenieKilledHandler0
._01 dw GenieKilledHandler1
._02 dw GenieKilledHandler2

GenieKilledHandler0::
    call GetEntityTransitionCountdown                 ; $4300: $CD $05 $0C
    ld   [hl], $40                                ; $4303: $36 $40
    jp   IncrementEntityState                     ; $4305: $C3 $12 $3B

GenieKilledHandler1::
    call GetEntityTransitionCountdown                 ; $4308: $CD $05 $0C
    ret  nz                                       ; $430B: $C0

    ld   [hl], $A0                                ; $430C: $36 $A0
    jp   IncrementEntityState                     ; $430E: $C3 $12 $3B

GenieKilledHandler2::
    call GetEntityTransitionCountdown                 ; $4311: $CD $05 $0C
    jp   z, DropHeartContainer                    ; $4314: $CA $51 $57

    jp   label_004_50EF                           ; $4317: $C3 $EF $50

jr_004_431A:
    call func_004_7FA3                            ; $431A: $CD $A3 $7F
    ld   hl, wEntitiesSpeedXTable                                ; $431D: $21 $40 $C2
    add  hl, bc                                   ; $4320: $09
    ld   a, [hl]                                  ; $4321: $7E
    ld   [wIsFileSelectionArrowShifted], a                               ; $4322: $EA $00 $D0
    ld   hl, wEntitiesSpeedYTable                                ; $4325: $21 $50 $C2
    add  hl, bc                                   ; $4328: $09
    ld   a, [hl]                                  ; $4329: $7E
    ld   [wIntroTimer], a                         ; $432A: $EA $01 $D0
    ldh  a, [hActiveEntityState]                               ; $432D: $F0 $F0
    cp   $05                                      ; $432F: $FE $05
    jr   z, jr_004_4336                           ; $4331: $28 $03

    call label_3B44                               ; $4333: $CD $44 $3B

jr_004_4336:
    ldh  a, [hActiveEntityState]                               ; $4336: $F0 $F0
    JP_TABLE                                      ; $4338
._00 dw func_004_4345                             ; $4339
._01 dw func_004_4380                             ; $433B
._02 dw func_004_449F                             ; $433D
._03 dw func_004_44E9                             ; $433F
._04 dw func_004_4517                             ; $4341
._05 dw func_004_4575                             ; $4343

func_004_4345::
    call GetEntityTransitionCountdown                 ; $4345: $CD $05 $0C
    ret  nz                                       ; $4348: $C0

    call IncrementEntityState                     ; $4349: $CD $12 $3B
    call GetEntityPrivateCountdown1                                      ; $434C: $CD $00 $0C
    ld   [hl], $FF                                ; $434F: $36 $FF
    ld   a, [wIntroSubTimer]                      ; $4351: $FA $02 $D0
    ld   e, a                                     ; $4354: $5F
    ld   d, b                                     ; $4355: $50
    ld   hl, wEntitiesStatusTable                   ; $4356: $21 $80 $C2
    add  hl, de                                   ; $4359: $19
    ld   a, [hl]                                  ; $435A: $7E
    and  a                                        ; $435B: $A7
    ld   a, $52                                   ; $435C: $3E $52
    jr   nz, jr_004_436D                          ; $435E: $20 $0D

    call IncrementEntityState                     ; $4360: $CD $12 $3B
    ld   [hl], $04                                ; $4363: $36 $04
    ld   hl, wEntitiesHealthTable                                ; $4365: $21 $60 $C3
    add  hl, bc                                   ; $4368: $09
    ld   [hl], GENIE_VAR_B                        ; $4369: $36 $08
    ld   a, $53                                   ; $436B: $3E $53

jr_004_436D:
    jp   OpenDialog                               ; $436D: $C3 $85 $23

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
    db   $CD
    db   $CA, $6D, $21                            ; $4381: $CA $6D $21

    add  b                                        ; $4384: $80
    jp   label_004_5E09                           ; $4385: $C3 $09 $5E

    ld   d, b                                     ; $4388: $50
    ldh  a, [hFrameCounter]                       ; $4389: $F0 $E7
    and  $07                                      ; $438B: $E6 $07
    jr   nz, jr_004_43A6                          ; $438D: $20 $17

    ld   hl, wEntitiesSpeedXTable                                ; $438F: $21 $40 $C2
    add  hl, bc                                   ; $4392: $09
    ld   a, [hl]                                  ; $4393: $7E

jr_004_4394:
    ld   hl, Data_004_437E                        ; $4394: $21 $7E $43
    add  hl, de                                   ; $4397: $19
    cp   [hl]                                     ; $4398: $BE
    jr   z, jr_004_43A6                           ; $4399: $28 $0B

    ld   hl, Data_004_437C                        ; $439B: $21 $7C $43
    add  hl, de                                   ; $439E: $19
    ld   a, [hl]                                  ; $439F: $7E
    ld   hl, wEntitiesSpeedXTable                                ; $43A0: $21 $40 $C2
    add  hl, bc                                   ; $43A3: $09
    add  [hl]                                     ; $43A4: $86
    ld   [hl], a                                  ; $43A5: $77

jr_004_43A6:
    ld   hl, Data_004_437A                        ; $43A6: $21 $7A $43
    add  hl, de                                   ; $43A9: $19
    ldh  a, [hActiveEntityPosX]                               ; $43AA: $F0 $EE
    cp   [hl]                                     ; $43AC: $BE
    jr   nz, jr_004_43B7                          ; $43AD: $20 $08

    ld   hl, wEntitiesDirectionTable              ; $43AF: $21 $80 $C3
    add  hl, bc                                   ; $43B2: $09
    ld   a, [hl]                                  ; $43B3: $7E
    xor  $01                                      ; $43B4: $EE $01
    ld   [hl], a                                  ; $43B6: $77

jr_004_43B7:
    ldh  a, [hFrameCounter]                       ; $43B7: $F0 $E7
    and  $01                                      ; $43B9: $E6 $01
    jr   nz, jr_004_43DD                          ; $43BB: $20 $20

    ld   hl, wEntitiesPrivateState2Table          ; $43BD: $21 $C0 $C2
    add  hl, bc                                   ; $43C0: $09
    ld   e, [hl]                                  ; $43C1: $5E
    ld   d, b                                     ; $43C2: $50
    ld   hl, Data_004_437C                        ; $43C3: $21 $7C $43
    add  hl, de                                   ; $43C6: $19
    ld   a, [hl]                                  ; $43C7: $7E
    ld   hl, wEntitiesSpeedYTable                                ; $43C8: $21 $50 $C2
    add  hl, bc                                   ; $43CB: $09
    add  [hl]                                     ; $43CC: $86
    ld   [hl], a                                  ; $43CD: $77
    ld   hl, Data_004_437E                        ; $43CE: $21 $7E $43
    add  hl, de                                   ; $43D1: $19
    cp   [hl]                                     ; $43D2: $BE
    jr   nz, jr_004_43DD                          ; $43D3: $20 $08

    ld   hl, wEntitiesPrivateState2Table          ; $43D5: $21 $C0 $C2
    add  hl, bc                                   ; $43D8: $09
    ld   a, [hl]                                  ; $43D9: $7E
    xor  $01                                      ; $43DA: $EE $01
    ld   [hl], a                                  ; $43DC: $77

jr_004_43DD:
    ldh  a, [hFrameCounter]                       ; $43DD: $F0 $E7
    rra                                           ; $43DF: $1F
    rra                                           ; $43E0: $1F
    rra                                           ; $43E1: $1F
    rra                                           ; $43E2: $1F
    and  $01                                      ; $43E3: $E6 $01
    call SetEntitySpriteVariant                   ; $43E5: $CD $0C $3B
    call GetEntityTransitionCountdown                 ; $43E8: $CD $05 $0C
    jr   nz, jr_004_4438                          ; $43EB: $20 $4B

    push hl                                       ; $43ED: $E5
    ld   hl, wEntitiesUnknowTableY                ; $43EE: $21 $D0 $C3
    add  hl, bc                                   ; $43F1: $09
    ld   a, [hl]                                  ; $43F2: $7E
    ld   e, a                                     ; $43F3: $5F
    cp   $08                                      ; $43F4: $FE $08
    jr   c, jr_004_43FF                           ; $43F6: $38 $07

    call IncrementEntityState                     ; $43F8: $CD $12 $3B
    pop  hl                                       ; $43FB: $E1
    ld   [hl], $30                                ; $43FC: $36 $30
    ret                                           ; $43FE: $C9

jr_004_43FF:
    ld   d, b                                     ; $43FF: $50
    ld   hl, Data_004_4370                        ; $4400: $21 $70 $43
    add  hl, de                                   ; $4403: $19
    ld   a, [hl]                                  ; $4404: $7E
    pop  hl                                       ; $4405: $E1
    ld   [hl], a                                  ; $4406: $77

    ld   a, ENTITY_GENIE                          ; $4407: $3E $5C
    call SpawnNewEntity_trampoline                ; $4409: $CD $86 $3B
    jr   c, jr_004_4438                           ; $440C: $38 $2A

    ldh  a, [hMultiPurpose0]                               ; $440E: $F0 $D7
    sub  $0C                                      ; $4410: $D6 $0C
    ld   hl, wEntitiesPosXTable                         ; $4412: $21 $00 $C2
    add  hl, de                                   ; $4415: $19
    ld   [hl], a                                  ; $4416: $77
    ldh  a, [hMultiPurpose1]                               ; $4417: $F0 $D8
    sub  $14                                      ; $4419: $D6 $14
    ld   hl, wEntitiesPosYTable                   ; $441B: $21 $10 $C2
    add  hl, de                                   ; $441E: $19
    ld   [hl], a                                  ; $441F: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4420: $21 $B0 $C2
    add  hl, de                                   ; $4423: $19
    ld   [hl], $03                                ; $4424: $36 $03
    ld   hl, wEntitiesSpeedZTable                                ; $4426: $21 $20 $C3
    add  hl, de                                   ; $4429: $19
    ld   [hl], $20                                ; $442A: $36 $20
    ld   hl, wEntitiesSpeedXTable                                ; $442C: $21 $40 $C2
    add  hl, de                                   ; $442F: $19
    ld   [hl], $0C                                ; $4430: $36 $0C
    ld   hl, wEntitiesPhysicsFlagsTable                ; $4432: $21 $40 $C3
    add  hl, de                                   ; $4435: $19
    ld   [hl], $42                                ; $4436: $36 $42

jr_004_4438:
    call GetEntityPrivateCountdown1                                      ; $4438: $CD $00 $0C
    jr   nz, jr_004_4487                          ; $443B: $20 $4A

    ld   [hl], $30                                ; $443D: $36 $30

    ld   a, ENTITY_GENIE                          ; $443F: $3E $5C
    call SpawnNewEntity_trampoline                ; $4441: $CD $86 $3B
    jr   c, jr_004_4487                           ; $4444: $38 $41

    push bc                                       ; $4446: $C5
    ld   hl, wEntitiesUnknowTableY                ; $4447: $21 $D0 $C3
    add  hl, bc                                   ; $444A: $09
    ld   a, [hl]                                  ; $444B: $7E
    inc  [hl]                                     ; $444C: $34
    and  $01                                      ; $444D: $E6 $01
    ld   c, a                                     ; $444F: $4F
    ld   hl, Data_004_449D                        ; $4450: $21 $9D $44
    add  hl, bc                                   ; $4453: $09
    ldh  a, [hMultiPurpose0]                               ; $4454: $F0 $D7
    add  [hl]                                     ; $4456: $86
    ld   hl, wEntitiesPosXTable                         ; $4457: $21 $00 $C2
    add  hl, de                                   ; $445A: $19
    ld   [hl], a                                  ; $445B: $77
    ldh  a, [hMultiPurpose1]                               ; $445C: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $445E: $21 $10 $C2
    add  hl, de                                   ; $4461: $19
    ld   [hl], a                                  ; $4462: $77
    ld   hl, wEntitiesSpeedZTable                                ; $4463: $21 $20 $C3
    add  hl, de                                   ; $4466: $19
    ld   [hl], $24                                ; $4467: $36 $24
    ld   hl, wEntitiesPrivateState1Table          ; $4469: $21 $B0 $C2
    add  hl, de                                   ; $446C: $19
    ld   [hl], $04                                ; $446D: $36 $04
    ld   hl, wEntitiesPhysicsFlagsTable                ; $446F: $21 $40 $C3
    add  hl, de                                   ; $4472: $19
    ld   [hl], $12                                ; $4473: $36 $12
    ld   c, e                                     ; $4475: $4B
    ld   b, d                                     ; $4476: $42
    ld   a, $1F                                   ; $4477: $3E $1F
    call ApplyVectorTowardsLink_trampoline        ; $4479: $CD $AA $3B
    pop  bc                                       ; $447C: $C1
    ld   hl, wEntitiesPrivateCountdown2Table                                ; $447D: $21 $00 $C3
    add  hl, bc                                   ; $4480: $09
    ld   [hl], $10                                ; $4481: $36 $10
    ld   a, $28                                   ; $4483: $3E $28
    ldh  [hNoiseSfx], a                            ; $4485: $E0 $F4

jr_004_4487:
    ld   hl, wEntitiesPrivateCountdown2Table                                ; $4487: $21 $00 $C3
    add  hl, bc                                   ; $448A: $09
    ld   a, [hl]                                  ; $448B: $7E
    and  a                                        ; $448C: $A7
    ret  z                                        ; $448D: $C8

    ld   hl, wEntitiesUnknowTableY                ; $448E: $21 $D0 $C3
    add  hl, bc                                   ; $4491: $09
    ld   a, [hl]                                  ; $4492: $7E
    and  $01                                      ; $4493: $E6 $01
    ld   a, $02                                   ; $4495: $3E $02
    jr   z, jr_004_449A                           ; $4497: $28 $01

    inc  a                                        ; $4499: $3C

jr_004_449A:
    jp   SetEntitySpriteVariant                   ; $449A: $C3 $0C $3B

Data_004_449D::
    db   $F4, $0C

func_004_449F::
    ld   a, [wIntroSubTimer]                      ; $449F: $FA $02 $D0
    ld   e, a                                     ; $44A2: $5F
    ld   d, b                                     ; $44A3: $50
    ldh  a, [hLinkPositionX]                      ; $44A4: $F0 $98
    push af                                       ; $44A6: $F5
    ld   hl, wEntitiesPosXTable                         ; $44A7: $21 $00 $C2
    add  hl, de                                   ; $44AA: $19
    ld   a, [hl]                                  ; $44AB: $7E
    ldh  [hLinkPositionX], a                      ; $44AC: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $44AE: $F0 $99
    push af                                       ; $44B0: $F5
    ld   hl, wEntitiesPosYTable                   ; $44B1: $21 $10 $C2
    add  hl, de                                   ; $44B4: $19
    ld   a, [hl]                                  ; $44B5: $7E
    sub  $20                                      ; $44B6: $D6 $20
    ldh  [hLinkPositionY], a                      ; $44B8: $E0 $99
    ld   a, $10                                   ; $44BA: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $44BC: $CD $AA $3B
    call UpdateEntityPosWithSpeed_04              ; $44BF: $CD $CA $6D
    ld   hl, hLinkPositionX                       ; $44C2: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                               ; $44C5: $F0 $EE
    sub  [hl]                                     ; $44C7: $96
    add  $03                                      ; $44C8: $C6 $03
    cp   $06                                      ; $44CA: $FE $06
    jr   nc, jr_004_44E2                          ; $44CC: $30 $14

    ld   hl, hLinkPositionY                       ; $44CE: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $44D1: $F0 $EC
    sub  [hl]                                     ; $44D3: $96
    add  $03                                      ; $44D4: $C6 $03
    cp   $06                                      ; $44D6: $FE $06
    jr   nc, jr_004_44E2                          ; $44D8: $30 $08

    call GetEntityTransitionCountdown                 ; $44DA: $CD $05 $0C
    ld   [hl], $10                                ; $44DD: $36 $10
    call IncrementEntityState                     ; $44DF: $CD $12 $3B

jr_004_44E2:
    pop  af                                       ; $44E2: $F1
    ldh  [hLinkPositionY], a                      ; $44E3: $E0 $99
    pop  af                                       ; $44E5: $F1
    ldh  [hLinkPositionX], a                      ; $44E6: $E0 $98
    ret                                           ; $44E8: $C9

func_004_44E9::
    call GetEntityTransitionCountdown             ; $44E9: $CD $05 $0C
    jp   z, func_004_6D7A                         ; $44EC: $CA $7A $6D

    cp   $04                                      ; $44EF: $FE $04
    jr   nz, jr_004_4516                          ; $44F1: $20 $23

    ld   a, ENTITY_GENIE                          ; $44F3: $3E $5C
    call SpawnNewEntity_trampoline                ; $44F5: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                               ; $44F8: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $44FA: $21 $00 $C2
    add  hl, de                                   ; $44FD: $19
    ld   [hl], a                                  ; $44FE: $77
    ldh  a, [hMultiPurpose1]                               ; $44FF: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4501: $21 $10 $C2
    add  hl, de                                   ; $4504: $19
    ld   [hl], a                                  ; $4505: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4506: $21 $B0 $C2
    add  hl, de                                   ; $4509: $19
    ld   [hl], $02                                ; $450A: $36 $02
    ld   hl, wEntitiesTransitionCountdownTable           ; $450C: $21 $E0 $C2
    add  hl, de                                   ; $450F: $19
    ld   [hl], $C7                                ; $4510: $36 $C7
    ld   a, JINGLE_ENEMY_MORPH_OUT                ; $4512: $3E $1F
    ldh  [hJingle], a                             ; $4514: $E0 $F2

jr_004_4516:
    ret                                           ; $4516: $C9

func_004_4517::
    ld   hl, wEntitiesHitboxFlagsTable            ; $4517: $21 $50 $C3
    add  hl, bc                                   ; $451A: $09
    ld   [hl], $0C                                ; $451B: $36 $0C
    ld   hl, wEntitiesOptions1Table               ; $451D: $21 $30 $C4
    add  hl, bc                                   ; $4520: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_MOVE_PIT_WATER                                ; $4521: $36 $81
    ld   hl, wEntitiesFlashCountdownTable         ; $4523: $21 $20 $C4
    add  hl, bc                                   ; $4526: $09
    ld   a, [hl]                                  ; $4527: $7E
    cp   $02                                      ; $4528: $FE $02
    jr   nz, jr_004_4535                          ; $452A: $20 $09

    call IncrementEntityState                     ; $452C: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $452F: $CD $05 $0C
    ld   [hl], $80                                ; $4532: $36 $80
    ret                                           ; $4534: $C9

jr_004_4535:
    call func_004_6D80                            ; $4535: $CD $80 $6D
    call label_3B70                               ; $4538: $CD $70 $3B
    call UpdateEntityPosWithSpeed_04              ; $453B: $CD $CA $6D
    call label_3B23                               ; $453E: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $4541: $F0 $E7
    and  $03                                      ; $4543: $E6 $03
    jr   nz, jr_004_4568                          ; $4545: $20 $21

    ld   a, $10                                   ; $4547: $3E $10
    call GetVectorTowardsLink_trampoline          ; $4549: $CD $B5 $3B
    ld   hl, wEntitiesSpeedXTable                                ; $454C: $21 $40 $C2
    add  hl, bc                                   ; $454F: $09
    ldh  a, [hMultiPurpose1]                               ; $4550: $F0 $D8
    sub  [hl]                                     ; $4552: $96
    and  $80                                      ; $4553: $E6 $80
    jr   z, jr_004_4559                           ; $4555: $28 $02

    dec  [hl]                                     ; $4557: $35
    dec  [hl]                                     ; $4558: $35

jr_004_4559:
    inc  [hl]                                     ; $4559: $34
    ld   hl, wEntitiesSpeedYTable                                ; $455A: $21 $50 $C2
    add  hl, bc                                   ; $455D: $09
    ldh  a, [hMultiPurpose0]                               ; $455E: $F0 $D7
    sub  [hl]                                     ; $4560: $96
    and  $80                                      ; $4561: $E6 $80
    jr   z, jr_004_4567                           ; $4563: $28 $02

    dec  [hl]                                     ; $4565: $35
    dec  [hl]                                     ; $4566: $35

jr_004_4567:
    inc  [hl]                                     ; $4567: $34

label_004_4568:
jr_004_4568:
    ldh  a, [hFrameCounter]                       ; $4568: $F0 $E7
    rra                                           ; $456A: $1F
    rra                                           ; $456B: $1F
    rra                                           ; $456C: $1F
    rra                                           ; $456D: $1F
    and  $01                                      ; $456E: $E6 $01
    add  $02                                      ; $4570: $C6 $02
    jp   SetEntitySpriteVariant                   ; $4572: $C3 $0C $3B

func_004_4575::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4575: $21 $40 $C3
    add  hl, bc                                   ; $4578: $09
    ld   [hl], $41                                ; $4579: $36 $41
    call GetEntityTransitionCountdown             ; $457B: $CD $05 $0C
    jr   nz, jr_004_45F1                          ; $457E: $20 $71

    call IncrementEntityState                     ; $4580: $CD $12 $3B
    ld   [hl], $04                                ; $4583: $36 $04
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4585: $21 $40 $C3
    add  hl, bc                                   ; $4588: $09
    ld   [hl], $01                                ; $4589: $36 $01
    call GetRandomByte                            ; $458B: $CD $0D $28
    and  $01                                      ; $458E: $E6 $01
    jr   nz, jr_004_45A6                          ; $4590: $20 $14

    ld   hl, wEntitiesUnknownTableD               ; $4592: $21 $D0 $C2
    add  hl, bc                                   ; $4595: $09
    ld   a, [hl]                                  ; $4596: $7E
    ld   hl, wEntitiesPosYTable                   ; $4597: $21 $10 $C2
    add  hl, bc                                   ; $459A: $09
    ld   [hl], a                                  ; $459B: $77
    ld   hl, wEntitiesUnknowTableP                ; $459C: $21 $40 $C4
    add  hl, bc                                   ; $459F: $09
    ld   a, [hl]                                  ; $45A0: $7E
    ld   hl, wEntitiesPosXTable                         ; $45A1: $21 $00 $C2
    add  hl, bc                                   ; $45A4: $09
    ld   [hl], a                                  ; $45A5: $77

jr_004_45A6:
    call ClearEntitySpeed                         ; $45A6: $CD $7F $3D
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $45A9: $21 $10 $C4
    add  hl, bc                                   ; $45AC: $09
    ld   [hl], b                                  ; $45AD: $70
    ld   a, ENTITY_GENIE                          ; $45AE: $3E $5C
    call SpawnNewEntity_trampoline                ; $45B0: $CD $86 $3B
    jr   c, jr_004_45F0                           ; $45B3: $38 $3B

    push bc                                       ; $45B5: $C5
    ld   hl, wEntitiesUnknowTableY                ; $45B6: $21 $D0 $C3
    add  hl, bc                                   ; $45B9: $09
    ld   a, [hl]                                  ; $45BA: $7E
    inc  [hl]                                     ; $45BB: $34
    and  $01                                      ; $45BC: $E6 $01
    ld   c, a                                     ; $45BE: $4F
    ld   hl, Data_004_449D                        ; $45BF: $21 $9D $44
    add  hl, bc                                   ; $45C2: $09
    ldh  a, [hMultiPurpose0]                               ; $45C3: $F0 $D7
    add  [hl]                                     ; $45C5: $86
    ld   hl, wEntitiesPosXTable                         ; $45C6: $21 $00 $C2
    add  hl, de                                   ; $45C9: $19
    ld   [hl], a                                  ; $45CA: $77
    ldh  a, [hMultiPurpose1]                               ; $45CB: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $45CD: $21 $10 $C2
    add  hl, de                                   ; $45D0: $19
    ld   [hl], a                                  ; $45D1: $77
    ld   hl, wEntitiesSpeedZTable                                ; $45D2: $21 $20 $C3
    add  hl, de                                   ; $45D5: $19
    ld   [hl], $24                                ; $45D6: $36 $24
    ld   hl, wEntitiesPrivateState1Table          ; $45D8: $21 $B0 $C2
    add  hl, de                                   ; $45DB: $19
    ld   [hl], $04                                ; $45DC: $36 $04
    ld   hl, wEntitiesPhysicsFlagsTable                ; $45DE: $21 $40 $C3
    add  hl, de                                   ; $45E1: $19
    ld   [hl], $12                                ; $45E2: $36 $12
    ld   c, e                                     ; $45E4: $4B
    ld   b, d                                     ; $45E5: $42
    ld   a, $1F                                   ; $45E6: $3E $1F
    call ApplyVectorTowardsLink_trampoline        ; $45E8: $CD $AA $3B
    pop  bc                                       ; $45EB: $C1
    ld   a, $28                                   ; $45EC: $3E $28
    ldh  [hNoiseSfx], a                            ; $45EE: $E0 $F4

jr_004_45F0:
    ret                                           ; $45F0: $C9

jr_004_45F1:
    ldh  a, [hLinkPositionX]                      ; $45F1: $F0 $98
    push af                                       ; $45F3: $F5
    ld   a, $50                                   ; $45F4: $3E $50
    ldh  [hLinkPositionX], a                      ; $45F6: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $45F8: $F0 $99
    push af                                       ; $45FA: $F5
    ld   a, $48                                   ; $45FB: $3E $48
    ldh  [hLinkPositionY], a                      ; $45FD: $E0 $99
    ld   a, $20                                   ; $45FF: $3E $20
    call GetVectorTowardsLink_trampoline          ; $4601: $CD $B5 $3B
    ldh  a, [hMultiPurpose1]                               ; $4604: $F0 $D8
    cpl                                           ; $4606: $2F
    inc  a                                        ; $4607: $3C
    push af                                       ; $4608: $F5
    ldh  a, [hMultiPurpose0]                               ; $4609: $F0 $D7
    push af                                       ; $460B: $F5
    ld   a, $04                                   ; $460C: $3E $04
    call GetVectorTowardsLink_trampoline          ; $460E: $CD $B5 $3B
    ld   hl, hMultiPurpose1                                ; $4611: $21 $D8 $FF
    pop  af                                       ; $4614: $F1
    add  [hl]                                     ; $4615: $86
    ld   hl, wEntitiesSpeedXTable                                ; $4616: $21 $40 $C2
    add  hl, bc                                   ; $4619: $09
    ld   [hl], a                                  ; $461A: $77
    ld   hl, hMultiPurpose0                                ; $461B: $21 $D7 $FF
    pop  af                                       ; $461E: $F1
    add  [hl]                                     ; $461F: $86
    ld   hl, wEntitiesSpeedYTable                                ; $4620: $21 $50 $C2
    add  hl, bc                                   ; $4623: $09
    ld   [hl], a                                  ; $4624: $77
    pop  af                                       ; $4625: $F1
    ldh  [hLinkPositionY], a                      ; $4626: $E0 $99
    pop  af                                       ; $4628: $F1
    ldh  [hLinkPositionX], a                      ; $4629: $E0 $98
    call UpdateEntityPosWithSpeed_04              ; $462B: $CD $CA $6D
    call func_004_4634                            ; $462E: $CD $34 $46
    jp   label_004_4568                           ; $4631: $C3 $68 $45

func_004_4634::
    ld   hl, wEntitiesPosYTable                   ; $4634: $21 $10 $C2
    add  hl, bc                                   ; $4637: $09
    ld   a, [hl]                                  ; $4638: $7E
    sub  $48                                      ; $4639: $D6 $48
    ld   e, a                                     ; $463B: $5F
    ld   a, $48                                   ; $463C: $3E $48
    sub  e                                        ; $463E: $93
    ld   hl, wEntitiesUnknownTableD               ; $463F: $21 $D0 $C2
    add  hl, bc                                   ; $4642: $09
    ld   [hl], a                                  ; $4643: $77
    ld   hl, wEntitiesPosXTable                         ; $4644: $21 $00 $C2
    add  hl, bc                                   ; $4647: $09
    ld   a, [hl]                                  ; $4648: $7E
    sub  $50                                      ; $4649: $D6 $50
    ld   e, a                                     ; $464B: $5F
    ld   a, $50                                   ; $464C: $3E $50
    sub  e                                        ; $464E: $93
    ld   hl, wEntitiesUnknowTableP                ; $464F: $21 $40 $C4
    add  hl, bc                                   ; $4652: $09
    ld   [hl], a                                  ; $4653: $77
    ret                                           ; $4654: $C9

Data_004_4655::
    db   $F0, $F4, $60, $02, $F0, $FC, $62, $02   ; $4655
    db   $F0, $04, $64, $02, $F0, $0C, $62, $22   ; $465D
    db   $F0, $14, $60, $22, $00, $F4, $66, $02   ; $4665
    db   $00, $FC, $68, $02, $00, $04, $6A, $02   ; $466D
    db   $00, $0C, $68, $22, $00, $14, $66, $22   ; $4675
    db   $F0, $F4, $60, $02, $F0, $FC, $62, $02   ; $467D
    db   $F0, $04, $64, $22, $F0, $0C, $62, $22   ; $4685
    db   $F0, $14, $60, $22, $00, $F4, $66, $02   ; $468D
    db   $00, $FC, $68, $02, $00, $04, $6A, $22   ; $4695
    db   $00, $0C, $68, $22, $00, $14, $66, $22   ; $469D
    db   $F0, $F4, $60, $02, $F0, $FC, $62, $02   ; $46A5
    db   $F0, $04, $64, $02, $F0, $0C, $6C, $02   ; $46AD
    db   $F0, $14, $6E, $02, $00, $F4, $66, $02   ; $46B5
    db   $00, $FC, $68, $02, $00, $04, $6A, $02   ; $46BD
    db   $00, $0C, $70, $02, $00, $14, $72, $02   ; $46C5
    db   $F0, $F4, $6E, $22, $F0, $FC, $6C, $22   ; $46CD
    db   $F0, $04, $64, $22, $F0, $0C, $62, $22   ; $46D5
    db   $F0, $14, $60, $22, $00, $F4, $72, $22   ; $46DD
    db   $00, $FC, $70, $22, $00, $04, $6A, $22   ; $46E5
    db   $00, $0C, $68, $22, $00, $14, $66, $22   ; $46ED

Data_004_46F5::
    db   $74, $02, $74, $22                       ; $46F5

func_004_46F9::
    ldh  a, [hActiveEntityState]                  ; $46F9: $F0 $F0
    cp   $05                                      ; $46FB: $FE $05
    jr   nz, jr_004_4713                          ; $46FD: $20 $14

    ldh  a, [hFrameCounter]                       ; $46FF: $F0 $E7
    and  $01                                      ; $4701: $E6 $01
    jr   nz, jr_004_4713                          ; $4703: $20 $0E

    ld   hl, wEntitiesUnknownTableD               ; $4705: $21 $D0 $C2
    add  hl, bc                                   ; $4708: $09
    ld   a, [hl]                                  ; $4709: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $470A: $E0 $EC
    ld   hl, wEntitiesUnknowTableP                ; $470C: $21 $40 $C4
    add  hl, bc                                   ; $470F: $09
    ld   a, [hl]                                  ; $4710: $7E
    ldh  [hActiveEntityPosX], a                               ; $4711: $E0 $EE

jr_004_4713:
    ld   hl, wEntitiesSpriteVariantTable                                ; $4713: $21 $B0 $C3
    add  hl, bc                                   ; $4716: $09
    ld   a, [hl]                                  ; $4717: $7E
    ld   e, a                                     ; $4718: $5F
    ld   d, b                                     ; $4719: $50
    sla  e                                        ; $471A: $CB $23
    sla  e                                        ; $471C: $CB $23
    sla  e                                        ; $471E: $CB $23
    ld   a, e                                     ; $4720: $7B
    sla  e                                        ; $4721: $CB $23
    sla  e                                        ; $4723: $CB $23
    add  e                                        ; $4725: $83
    ld   e, a                                     ; $4726: $5F
    ld   hl, Data_004_4655                        ; $4727: $21 $55 $46
    add  hl, de                                   ; $472A: $19
    ld   c, $0A                                   ; $472B: $0E $0A
    call RenderActiveEntitySpritesRect            ; $472D: $CD $E6 $3C
    ld   a, $0A                                   ; $4730: $3E $0A
    call label_3DA0                               ; $4732: $CD $A0 $3D
    ldh  a, [hActiveEntityVisualPosY]             ; $4735: $F0 $EC
    add  $10                                      ; $4737: $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $4739: $E0 $EC
    ldh  a, [hFrameCounter]                       ; $473B: $F0 $E7
    rra                                           ; $473D: $1F
    rra                                           ; $473E: $1F
    rra                                           ; $473F: $1F
    and  $01                                      ; $4740: $E6 $01
    ldh  [hActiveEntitySpriteVariant], a                               ; $4742: $E0 $F1
    ld   de, Data_004_46F5                        ; $4744: $11 $F5 $46
    call RenderActiveEntitySprite                 ; $4747: $CD $77 $3C
    jp   CopyEntityPositionToActivePosition       ; $474A: $C3 $8A $3D

Data_004_474D::
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ; $474D
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ; $4755
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ; $475D
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ; $4765
    db   $08, $00, $30, $01, $08, $08, $30, $61   ; $476D
    db   $08, $00, $30, $01, $08, $08, $30, $61   ; $4775
    db   $08, $00, $30, $01, $08, $08, $30, $61   ; $477D
    db   $08, $00, $30, $01, $08, $08, $30, $61   ; $4785
    db   $04, $00, $30, $01, $04, $08, $30, $61   ; $478D
    db   $14, $00, $1E, $01, $14, $08, $1E, $61   ; $4795
    db   $14, $00, $1E, $01, $14, $08, $1E, $61   ; $479D
    db   $14, $00, $1E, $01, $14, $08, $1E, $61   ; $47A5
    db   $00, $00, $30, $01, $00, $08, $30, $61   ; $47AD
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ; $47B5
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ; $47BD
    db   $10, $00, $1E, $01, $10, $08, $1E, $61   ; $47C5
    db   $F2, $FA, $30, $01, $F2, $02, $30, $61   ; $47CD
    db   $F2, $06, $30, $01, $F2, $0E, $30, $61   ; $47D5
    db   $FE, $FA, $30, $01, $FE, $02, $30, $61   ; $47DD
    db   $FE, $06, $30, $01, $FE, $0E, $30, $61   ; $47E5
    db   $F0, $F8, $30, $41, $F0, $00, $30, $21   ; $47ED
    db   $F0, $08, $30, $41, $F0, $10, $30, $21   ; $47F5
    db   $00, $F8, $30, $41, $00, $00, $30, $21   ; $47FD
    db   $00, $08, $30, $41, $00, $10, $30, $21   ; $4805
    db   $F0, $F8, $32, $01, $F0, $00, $32, $61   ; $480D
    db   $F0, $08, $32, $01, $F0, $10, $32, $61   ; $4815
    db   $00, $F8, $32, $01, $00, $00, $32, $61   ; $481D
    db   $00, $08, $32, $01, $00, $10, $32, $61   ; $4825

Data_004_482D::
    db   $06, $05, $04, $05, $04, $03, $02, $01, $00 ; $482D

Data_004_4836::
    db   $00, $01, $02, $03, $04, $05, $04, $05, $06 ; $4836

GenieState2Handler::
    db   $CD                                      ; $483F
    cp   b                                        ; $4840: $B8
    ld   c, b                                     ; $4841: $48
    call func_004_7FA3                            ; $4842: $CD $A3 $7F
    call GetEntityTransitionCountdown                 ; $4845: $CD $05 $0C
    bit  7, a                                     ; $4848: $CB $7F
    jr   z, jr_004_486D                           ; $484A: $28 $21

    and  $7F                                      ; $484C: $E6 $7F
    jr   nz, jr_004_485E                          ; $484E: $20 $0E

    ld   a, [wIntroSubTimer]                      ; $4850: $FA $02 $D0
    ld   e, a                                     ; $4853: $5F
    ld   d, b                                     ; $4854: $50
    ld   hl, wEntitiesStateTable                  ; $4855: $21 $90 $C2
    add  hl, de                                   ; $4858: $19
    ld   [hl], $03                                ; $4859: $36 $03
    jp   func_004_6D7A                            ; $485B: $C3 $7A $6D

jr_004_485E:
    rra                                           ; $485E: $1F
    rra                                           ; $485F: $1F
    rra                                           ; $4860: $1F
    and  $0F                                      ; $4861: $E6 $0F
    ld   e, a                                     ; $4863: $5F
    ld   d, b                                     ; $4864: $50
    ld   hl, Data_004_4836                        ; $4865: $21 $36 $48
    add  hl, de                                   ; $4868: $19
    ld   a, [hl]                                  ; $4869: $7E
    jp   SetEntitySpriteVariant                   ; $486A: $C3 $0C $3B

jr_004_486D:
    and  a                                        ; $486D: $A7
    jp   z, func_004_6D7A                         ; $486E: $CA $7A $6D

    cp   $06                                      ; $4871: $FE $06
    jr   nz, jr_004_48A6                          ; $4873: $20 $31

    ld   a, ENTITY_GENIE                          ; $4875: $3E $5C
    call SpawnNewEntity_trampoline                ; $4877: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                               ; $487A: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $487C: $21 $00 $C2
    add  hl, de                                   ; $487F: $19
    ld   [hl], a                                  ; $4880: $77
    ldh  a, [hMultiPurpose1]                               ; $4881: $F0 $D8
    cp   $14                                      ; $4883: $FE $14
    jr   nc, jr_004_4889                          ; $4885: $30 $02

    ld   a, $14                                   ; $4887: $3E $14

jr_004_4889:
    ld   hl, wEntitiesPosYTable                   ; $4889: $21 $10 $C2
    add  hl, de                                   ; $488C: $19
    ld   [hl], a                                  ; $488D: $77
    ld   hl, wEntitiesPrivateState1Table          ; $488E: $21 $B0 $C2
    add  hl, de                                   ; $4891: $19
    ld   [hl], $01                                ; $4892: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable           ; $4894: $21 $E0 $C2
    add  hl, de                                   ; $4897: $19
    ld   [hl], $40                                ; $4898: $36 $40
    ld   hl, wEntitiesPhysicsFlagsTable                ; $489A: $21 $40 $C3
    add  hl, de                                   ; $489D: $19
    ld   [hl], $01                                ; $489E: $36 $01
    ld   hl, wEntitiesHitboxFlagsTable                ; $48A0: $21 $50 $C3
    add  hl, de                                   ; $48A3: $19
    ld   [hl], $8C                                ; $48A4: $36 $8C

jr_004_48A6:
    call GetEntityTransitionCountdown                 ; $48A6: $CD $05 $0C
    rra                                           ; $48A9: $1F
    rra                                           ; $48AA: $1F
    rra                                           ; $48AB: $1F
    and  $0F                                      ; $48AC: $E6 $0F
    ld   e, a                                     ; $48AE: $5F
    ld   d, b                                     ; $48AF: $50
    ld   hl, Data_004_482D                        ; $48B0: $21 $2D $48
    add  hl, de                                   ; $48B3: $19
    ld   a, [hl]                                  ; $48B4: $7E
    jp   SetEntitySpriteVariant                   ; $48B5: $C3 $0C $3B

    ldh  a, [hActiveEntitySpriteVariant]                               ; $48B8: $F0 $F1
    rla                                           ; $48BA: $17
    rla                                           ; $48BB: $17
    rla                                           ; $48BC: $17
    rla                                           ; $48BD: $17
    rla                                           ; $48BE: $17
    and  $E0                                      ; $48BF: $E6 $E0
    ld   e, a                                     ; $48C1: $5F
    ld   d, b                                     ; $48C2: $50
    ld   hl, Data_004_474D                        ; $48C3: $21 $4D $47
    add  hl, de                                   ; $48C6: $19
    ld   c, $08                                   ; $48C7: $0E $08
    call RenderActiveEntitySpritesRect            ; $48C9: $CD $E6 $3C
    ld   a, $08                                   ; $48CC: $3E $08
    jp   label_3DA0                               ; $48CE: $C3 $A0 $3D

Data_004_48D1::
    db   $34, $02, $34, $22, $34, $12, $34, $32   ; $48D1

GenieState3Handler::
    ld   de, Data_004_48D1                        ; $48D9: $11 $D1 $48
    call RenderActiveEntitySpritesPair            ; $48DC: $CD $C0 $3B
    call func_004_7FA3                            ; $48DF: $CD $A3 $7F
    ldh  a, [hFrameCounter]                       ; $48E2: $F0 $E7
    rra                                           ; $48E4: $1F
    rra                                           ; $48E5: $1F
    rra                                           ; $48E6: $1F
    and  $01                                      ; $48E7: $E6 $01
    call SetEntitySpriteVariant                   ; $48E9: $CD $0C $3B
    ld   hl, wEntitiesSpeedXTable                                ; $48EC: $21 $40 $C2
    add  hl, bc                                   ; $48EF: $09
    ld   a, [hl]                                  ; $48F0: $7E
    push af                                       ; $48F1: $F5
    ld   a, [wIsFileSelectionArrowShifted]                               ; $48F2: $FA $00 $D0
    add  [hl]                                     ; $48F5: $86
    ld   [hl], a                                  ; $48F6: $77
    ld   hl, wEntitiesSpeedYTable                                ; $48F7: $21 $50 $C2
    add  hl, bc                                   ; $48FA: $09
    ld   a, [hl]                                  ; $48FB: $7E
    push af                                       ; $48FC: $F5
    ld   a, [wIntroTimer]                         ; $48FD: $FA $01 $D0
    add  [hl]                                     ; $4900: $86
    ld   [hl], a                                  ; $4901: $77
    call UpdateEntityPosWithSpeed_04              ; $4902: $CD $CA $6D
    pop  af                                       ; $4905: $F1
    ld   hl, wEntitiesSpeedYTable                                ; $4906: $21 $50 $C2
    add  hl, bc                                   ; $4909: $09
    ld   [hl], a                                  ; $490A: $77
    pop  af                                       ; $490B: $F1
    ld   hl, wEntitiesSpeedXTable                                ; $490C: $21 $40 $C2
    add  hl, bc                                   ; $490F: $09
    ld   [hl], a                                  ; $4910: $77
    ldh  a, [hActiveEntityState]                               ; $4911: $F0 $F0
    and  a                                        ; $4913: $A7
    jr   nz, jr_004_4938                          ; $4914: $20 $22

    call AddEntityZSpeedToPos_04                  ; $4916: $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                                ; $4919: $21 $20 $C3
    add  hl, bc                                   ; $491C: $09
    dec  [hl]                                     ; $491D: $35
    dec  [hl]                                     ; $491E: $35
    ld   hl, wEntitiesPosZTable                                ; $491F: $21 $10 $C3
    add  hl, bc                                   ; $4922: $09
    ld   a, [hl]                                  ; $4923: $7E
    and  $80                                      ; $4924: $E6 $80
    jr   z, jr_004_4937                           ; $4926: $28 $0F

    ld   [hl], b                                  ; $4928: $70
    call IncrementEntityState                     ; $4929: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $492C: $CD $05 $0C
    ld   [hl], $08                                ; $492F: $36 $08
    ld   hl, wEntitiesSpeedXTable                                ; $4931: $21 $40 $C2
    add  hl, bc                                   ; $4934: $09
    ld   [hl], $E0                                ; $4935: $36 $E0

jr_004_4937:
    ret                                           ; $4937: $C9

jr_004_4938:
    call GetEntityTransitionCountdown                 ; $4938: $CD $05 $0C
    jp   z, func_004_6D7A                         ; $493B: $CA $7A $6D

GenieState4Handler::
    ld   de, Data_004_48D1                        ; $493E: $11 $D1 $48
    call RenderActiveEntitySpritesPair            ; $4941: $CD $C0 $3B
    call func_004_7FA3                            ; $4944: $CD $A3 $7F
    ldh  a, [hFrameCounter]                       ; $4947: $F0 $E7
    rra                                           ; $4949: $1F
    rra                                           ; $494A: $1F
    rra                                           ; $494B: $1F
    and  $01                                      ; $494C: $E6 $01
    call SetEntitySpriteVariant                   ; $494E: $CD $0C $3B
    call label_3B44                               ; $4951: $CD $44 $3B
    call UpdateEntityPosWithSpeed_04              ; $4954: $CD $CA $6D
    call AddEntityZSpeedToPos_04                  ; $4957: $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                                ; $495A: $21 $20 $C3
    add  hl, bc                                   ; $495D: $09
    dec  [hl]                                     ; $495E: $35
    dec  [hl]                                     ; $495F: $35
    ld   hl, wEntitiesPosZTable                                ; $4960: $21 $10 $C3
    add  hl, bc                                   ; $4963: $09
    ld   a, [hl]                                  ; $4964: $7E
    and  $80                                      ; $4965: $E6 $80
    jp   nz, func_004_6D7A                        ; $4967: $C2 $7A $6D

    ret                                           ; $496A: $C9
