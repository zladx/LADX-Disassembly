; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

PlayDoorUnlockedSfx::
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ; $4000: $3E $04
    ldh  [hNoiseSfx], a                           ; $4002: $E0 $F4
    ret                                           ; $4004: $C9

GetEntitySpeedYAddress::
    ld   hl, wEntitiesSpeedYTable                 ; $4005: $21 $50 $C2
    add  hl, bc                                   ; $4008: $09
    ret                                           ; $4009: $C9

Data_007_400A::
    db   $7C, $02, $7E, $02, $7E, $22, $7C, $22

Data_007_4012::
    db   $F4, $16, $F6, $16, $F0, $17, $F2, $17

Data_007_401A::
    db   $F4, $16, $F6, $16, $F0, $16, $F2, $16

BushCrawlerEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4022: $21 $B0 $C2
    add  hl, bc                                   ; $4025: $09
    ld   a, [hl]                                  ; $4026: $7E
    cp   $02                                      ; $4027: $FE $02
    jp   z, label_007_41F0                        ; $4029: $CA $F0 $41

    and  a                                        ; $402C: $A7
    jr   nz, jr_007_4053                          ; $402D: $20 $24

    inc  [hl]                                     ; $402F: $34
    ldh  a, [hActiveEntityPosX]                   ; $4030: $F0 $EE
    rla                                           ; $4032: $17
    rla                                           ; $4033: $17
    and  $40                                      ; $4034: $E6 $40
    push af                                       ; $4036: $F5
    ld   hl, wEntitiesUnknowTableH                ; $4037: $21 $30 $C4
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
    ld   hl, wEntitiesUnknowTableP                ; $404E: $21 $40 $C4
    add  hl, bc                                   ; $4051: $09
    ld   [hl], a                                  ; $4052: $77

jr_007_4053:
    ld   hl, wEntitiesPrivateState2Table          ; $4053: $21 $C0 $C2
    add  hl, bc                                   ; $4056: $09
    ldh  a, [hActiveEntityVisualPosY]             ; $4057: $F0 $EC
    sub  [hl]                                     ; $4059: $96
    ldh  [hActiveEntityVisualPosY], a             ; $405A: $E0 $EC
    ld   hl, wEntitiesUnknowTableP                ; $405C: $21 $40 $C4
    add  hl, bc                                   ; $405F: $09
    ld   a, [hl]                                  ; $4060: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $4061: $E0 $F1
    ld   de, Data_007_4012                        ; $4063: $11 $12 $40
    ld   a, [wIsIndoor]                           ; $4066: $FA $A5 $DB
    and  a                                        ; $4069: $A7
    jr   z, jr_007_406F                           ; $406A: $28 $03

    ld   de, Data_007_401A                        ; $406C: $11 $1A $40

jr_007_406F:
    call RenderActiveEntitySpritesPair            ; $406F: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4072: $CD $8A $3D
    ld   hl, wEntitiesPrivateState2Table          ; $4075: $21 $C0 $C2
    add  hl, bc                                   ; $4078: $09
    ld   a, [hl]                                  ; $4079: $7E
    and  a                                        ; $407A: $A7
    jr   z, jr_007_408A                           ; $407B: $28 $0D

    ld   hl, wEntitiesSpriteVariantTable          ; $407D: $21 $B0 $C3
    add  hl, bc                                   ; $4080: $09
    ld   a, [hl]                                  ; $4081: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $4082: $E0 $F1
    ld   de, Data_007_400A                        ; $4084: $11 $0A $40
    call RenderActiveEntitySpritesPair            ; $4087: $CD $C0 $3B

jr_007_408A:
    call func_007_7D96                            ; $408A: $CD $96 $7D
    ld   hl, wEntitiesHealthTable                 ; $408D: $21 $60 $C3
    add  hl, bc                                   ; $4090: $09
    ld   [hl], $04                                ; $4091: $36 $04
    ld   hl, wEntitiesFlashCountdownTable         ; $4093: $21 $20 $C4
    add  hl, bc                                   ; $4096: $09
    ld   a, [hl]                                  ; $4097: $7E
    and  a                                        ; $4098: $A7
    jr   z, jr_007_40C1                           ; $4099: $28 $26

    ld   [hl], b                                  ; $409B: $70
    ld   hl, wEntitiesUnknowTableP                ; $409C: $21 $40 $C4
    add  hl, bc                                   ; $409F: $09
    ld   a, [hl]                                  ; $40A0: $7E
    xor  $01                                      ; $40A1: $EE $01
    call SetEntitySpriteVariant                   ; $40A3: $CD $0C $3B
    ld   hl, wEntitiesTypeTable                   ; $40A6: $21 $A0 $C3
    add  hl, bc                                   ; $40A9: $09
    ld   [hl], $05                                ; $40AA: $36 $05
    ld   hl, hNoiseSfx                            ; $40AC: $21 $F4 $FF
    ld   [hl], $05                                ; $40AF: $36 $05
    call GetEntityPrivateCountdown1               ; $40B1: $CD $00 $0C
    ld   [hl], $1F                                ; $40B4: $36 $1F
    ld   hl, wEntitiesPhysicsFlagsTable           ; $40B6: $21 $40 $C3
    add  hl, bc                                   ; $40B9: $09
    ld   a, [hl]                                  ; $40BA: $7E
    add  $02                                      ; $40BB: $C6 $02
    ld   [hl], a                                  ; $40BD: $77
    jp   label_007_4198                           ; $40BE: $C3 $98 $41

jr_007_40C1:
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

    call func_007_7E6D                            ; $40E0: $CD $6D $7E
    add  $08                                      ; $40E3: $C6 $08
    cp   $10                                      ; $40E5: $FE $10
    jr   c, jr_007_40F9                           ; $40E7: $38 $10

    push de                                       ; $40E9: $D5
    call func_007_7E5D                            ; $40EA: $CD $5D $7E
    add  $08                                      ; $40ED: $C6 $08
    pop  de                                       ; $40EF: $D1
    cp   $10                                      ; $40F0: $FE $10
    jr   nc, jr_007_4128                          ; $40F2: $30 $34

    ld   a, e                                     ; $40F4: $7B
    cp   $02                                      ; $40F5: $FE $02
    jr   z, jr_007_4128                           ; $40F7: $28 $2F

jr_007_40F9:
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
    res  7, [hl]                                  ; $4117: $CB $BE
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
    set  7, [hl]                                  ; $412C: $CB $FE
    ld   hl, wEntitiesHitboxFlagsTable            ; $412E: $21 $50 $C3
    add  hl, bc                                   ; $4131: $09
    set  2, [hl]                                  ; $4132: $CB $D6
    call ConfigureEntityHitbox                    ; $4134: $CD $EA $3A
    call CheckLinkCollisionWithEnemy_trampoline   ; $4137: $CD $5A $3B
    ret  nc                                       ; $413A: $D0

    ld   a, [$C19B]                               ; $413B: $FA $9B $C1
    and  a                                        ; $413E: $A7
    ret  nz                                       ; $413F: $C0

    ld   a, [wBButtonSlot]                        ; $4140: $FA $00 $DB
    cp   $03                                      ; $4143: $FE $03
    jr   nz, jr_007_414E                          ; $4145: $20 $07

    ldh  a, [hJoypadState]                        ; $4147: $F0 $CC
    and  $20                                      ; $4149: $E6 $20
    jr   nz, jr_007_415A                          ; $414B: $20 $0D

    ret                                           ; $414D: $C9

jr_007_414E:
    ld   a, [wAButtonSlot]                        ; $414E: $FA $01 $DB
    cp   $03                                      ; $4151: $FE $03
    ret  nz                                       ; $4153: $C0

    ldh  a, [hJoypadState]                        ; $4154: $F0 $CC
    and  $10                                      ; $4156: $E6 $10
    jr   z, jr_007_41B8                           ; $4158: $28 $5E

jr_007_415A:
    ld   a, [$C3CF]                               ; $415A: $FA $CF $C3
    and  a                                        ; $415D: $A7
    ret  nz                                       ; $415E: $C0

    inc  a                                        ; $415F: $3C
    ld   [$C3CF], a                               ; $4160: $EA $CF $C3
    call IncrementEntityState                     ; $4163: $CD $12 $3B
    ld   [hl], $02                                ; $4166: $36 $02
    ld   hl, wEntitiesStatusTable                 ; $4168: $21 $80 $C2
    add  hl, bc                                   ; $416B: $09
    ld   [hl], $07                                ; $416C: $36 $07
    ld   hl, wEntitiesUnknowTableR                ; $416E: $21 $90 $C3
    add  hl, bc                                   ; $4171: $09
    ld   [hl], $01                                ; $4172: $36 $01
    ld   hl, wEntitiesUnknowTableW                ; $4174: $21 $90 $C4
    add  hl, bc                                   ; $4177: $09
    ld   [hl], b                                  ; $4178: $70
    ldh  a, [hLinkDirection]                      ; $4179: $F0 $9E
    ld   [wC15D], a                               ; $417B: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $417E: $CD $05 $0C
    ld   [hl], $02                                ; $4181: $36 $02
    ld   hl, hWaveSfx                             ; $4183: $21 $F3 $FF
    ld   [hl], $02                                ; $4186: $36 $02
    ld   hl, wEntitiesTypeTable                   ; $4188: $21 $A0 $C3
    add  hl, bc                                   ; $418B: $09
    ld   [hl], $05                                ; $418C: $36 $05
    ld   hl, wEntitiesUnknowTableP                ; $418E: $21 $40 $C4
    add  hl, bc                                   ; $4191: $09
    ld   a, [hl]                                  ; $4192: $7E
    xor  $01                                      ; $4193: $EE $01
    call SetEntitySpriteVariant                   ; $4195: $CD $0C $3B

label_007_4198:
    ld   a, $BB                                   ; $4198: $3E $BB
    call SpawnNewEntity_trampoline                ; $419A: $CD $86 $3B
    ret  c                                        ; $419D: $D8

    ldh  a, [hScratch0]                           ; $419E: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $41A0: $21 $00 $C2
    add  hl, de                                   ; $41A3: $19
    ld   [hl], a                                  ; $41A4: $77
    ldh  a, [hScratch1]                           ; $41A5: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $41A7: $21 $10 $C2
    add  hl, de                                   ; $41AA: $19
    ld   [hl], a                                  ; $41AB: $77
    ld   hl, wEntitiesPrivateState1Table          ; $41AC: $21 $B0 $C2
    add  hl, de                                   ; $41AF: $19
    ld   [hl], $02                                ; $41B0: $36 $02
    ld   hl, wEntitiesTransitionCountdownTable    ; $41B2: $21 $E0 $C2
    add  hl, de                                   ; $41B5: $19
    ld   [hl], $40                                ; $41B6: $36 $40

jr_007_41B8:
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
    call func_007_7E0A                            ; $41C8: $CD $0A $7E
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
    ld   de, Data_007_400A                        ; $41F0: $11 $0A $40
    call RenderActiveEntitySpritesPair            ; $41F3: $CD $C0 $3B
    call func_007_7D96                            ; $41F6: $CD $96 $7D
    call func_007_7DC3                            ; $41F9: $CD $C3 $7D
    ldh  a, [hFrameCounter]                       ; $41FC: $F0 $E7
    rra                                           ; $41FE: $1F
    rra                                           ; $41FF: $1F
    rra                                           ; $4200: $1F
    and  $01                                      ; $4201: $E6 $01
    call SetEntitySpriteVariant                   ; $4203: $CD $0C $3B
    call func_007_7E0A                            ; $4206: $CD $0A $7E
    call label_3B23                               ; $4209: $CD $23 $3B
    call label_3B39                               ; $420C: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $420F: $CD $05 $0C
    jr   nz, jr_007_4233                          ; $4212: $20 $1F

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

jr_007_4233:
    ret                                           ; $4233: $C9

Data_007_4234::
    db   $00, $F0, $78, $01, $00, $F8, $7A, $01, $00, $00, $70, $01, $00, $08, $72, $01
    db   $00, $F0, $7C, $01, $00, $F8, $7E, $01, $00, $00, $70, $01, $00, $08, $72, $01
    db   $00, $F0, $78, $01, $00, $F8, $7A, $01, $00, $00, $74, $01, $00, $08, $76, $01
    db   $FC, $F0, $64, $01, $FC, $F8, $66, $01, $00, $00, $60, $01, $00, $08, $62, $01
    db   $FC, $F0, $64, $01, $FC, $F8, $66, $01, $00, $00, $74, $01, $00, $08, $76, $01

FishermanUnderBridgeEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4284: $21 $B0 $C2
    add  hl, bc                                   ; $4287: $09
    ld   a, [hl]                                  ; $4288: $7E
    cp   $02                                      ; $4289: $FE $02
    jp   z, label_007_45F7                        ; $428B: $CA $F7 $45

    and  a                                        ; $428E: $A7
    jr   nz, jr_007_42C4                          ; $428F: $20 $33

    inc  [hl]                                     ; $4291: $34
    ld   hl, wEntitiesPosYTable                   ; $4292: $21 $10 $C2
    add  hl, bc                                   ; $4295: $09
    ld   a, [hl]                                  ; $4296: $7E
    add  $08                                      ; $4297: $C6 $08
    ld   [hl], a                                  ; $4299: $77
    ld   a, $B8                                   ; $429A: $3E $B8
    call SpawnNewEntity_trampoline                ; $429C: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $429F: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $42A1: $21 $00 $C2
    add  hl, de                                   ; $42A4: $19
    add  $06                                      ; $42A5: $C6 $06
    ld   [hl], a                                  ; $42A7: $77
    ldh  a, [hScratch1]                           ; $42A8: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $42AA: $21 $10 $C2
    add  hl, de                                   ; $42AD: $19
    add  $10                                      ; $42AE: $C6 $10
    ld   [hl], a                                  ; $42B0: $77
    ld   hl, wEntitiesPrivateState1Table          ; $42B1: $21 $B0 $C2
    add  hl, de                                   ; $42B4: $19
    ld   [hl], $02                                ; $42B5: $36 $02
    ld   hl, wEntitiesHitboxFlagsTable            ; $42B7: $21 $50 $C3
    add  hl, de                                   ; $42BA: $19
    ld   [hl], $AC                                ; $42BB: $36 $AC
    push bc                                       ; $42BD: $C5
    ld   c, e                                     ; $42BE: $4B
    ld   b, d                                     ; $42BF: $42
    call ConfigureEntityHitbox                    ; $42C0: $CD $EA $3A
    pop  bc                                       ; $42C3: $C1

jr_007_42C4:
    ldh  a, [hActiveEntityState]                  ; $42C4: $F0 $F0
    cp   $06                                      ; $42C6: $FE $06
    jr   nc, jr_007_42DC                          ; $42C8: $30 $12

    ld   a, [wDialogState]                        ; $42CA: $FA $9F $C1
    and  a                                        ; $42CD: $A7
    jr   z, jr_007_42DC                           ; $42CE: $28 $0C

    ldh  a, [hActiveEntitySpriteVariant]          ; $42D0: $F0 $F1
    cp   $03                                      ; $42D2: $FE $03
    ld   a, $02                                   ; $42D4: $3E $02
    jr   nz, jr_007_42DA                          ; $42D6: $20 $02

    ld   a, $04                                   ; $42D8: $3E $04

jr_007_42DA:
    ldh  [hActiveEntitySpriteVariant], a          ; $42DA: $E0 $F1

jr_007_42DC:
    call func_007_4594                            ; $42DC: $CD $94 $45
    ldh  a, [hActiveEntityState]                  ; $42DF: $F0 $F0
    cp   $0A                                      ; $42E1: $FE $0A
    jr   c, jr_007_42E8                           ; $42E3: $38 $03

    call func_007_43FD                            ; $42E5: $CD $FD $43

jr_007_42E8:
    call func_007_7D96                            ; $42E8: $CD $96 $7D
    ld   a, [wPhotos1]                            ; $42EB: $FA $0C $DC
    bit  0, a                                     ; $42EE: $CB $47
    jp   z, label_007_4328                        ; $42F0: $CA $28 $43

    bit  7, a                                     ; $42F3: $CB $7F
    jp   nz, label_007_4328                       ; $42F5: $C2 $28 $43

    ld   a, [wTradeSequenceItem]                  ; $42F8: $FA $0E $DB
    cp   $0D                                      ; $42FB: $FE $0D
    jp   c, label_007_4328                        ; $42FD: $DA $28 $43

    ldh  a, [hActiveEntityState]                  ; $4300: $F0 $F0
    cp   $02                                      ; $4302: $FE $02
    jr   c, jr_007_4309                           ; $4304: $38 $03

    call func_007_434E                            ; $4306: $CD $4E $43

jr_007_4309:
    ldh  a, [hActiveEntityState]                  ; $4309: $F0 $F0
    JP_TABLE                                      ; $430B
._00 dw func_007_4335                             ; $430C
._01 dw func_007_4356                             ; $430E
._02 dw func_007_4373                             ; $4310
._03 dw func_007_4377                             ; $4312
._04 dw func_007_4382                             ; $4314
._05 dw func_007_438C                             ; $4316
._06 dw func_007_4509                             ; $4318
._07 dw func_007_43AD                             ; $431A
._08 dw func_007_43C5                             ; $431C
._09 dw func_007_441A                             ; $431E
._0A dw func_007_4454                             ; $4320
._0B dw func_007_4454                             ; $4322
._0C dw func_007_4475                             ; $4324
._0D dw func_007_4499                             ; $4326

label_007_4328:
    ldh  a, [hActiveEntityState]                  ; $4328: $F0 $F0
    JP_TABLE                                      ; $432A
._00 dw func_007_44B0                             ; $432B
._01 dw func_007_44E8                             ; $432D
._02 dw func_007_4509                             ; $432F
._03 dw func_007_4537                             ; $4331
._04 dw func_007_458B                             ; $4333

func_007_4335::
    ld   hl, wEntitiesTypeTable                   ; $4335: $21 $A0 $C3

jr_007_4338:
    ld   a, [hl+]                                 ; $4338: $2A
    cp   $FA                                      ; $4339: $FE $FA
    jr   z, jr_007_4342                           ; $433B: $28 $05

    ld   a, l                                     ; $433D: $7D
    and  $0F                                      ; $433E: $E6 $0F
    jr   nz, jr_007_4338                          ; $4340: $20 $F6

jr_007_4342:
    ld   a, l                                     ; $4342: $7D
    dec  a                                        ; $4343: $3D
    and  $0F                                      ; $4344: $E6 $0F
    ld   hl, wEntitiesUnknowTableR                ; $4346: $21 $90 $C3
    add  hl, bc                                   ; $4349: $09
    ld   [hl], a                                  ; $434A: $77
    jp   IncrementEntityState                     ; $434B: $C3 $12 $3B

func_007_434E::
    ld   a, $02                                   ; $434E: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4350: $E0 $A1
    ld   [wC167], a                               ; $4352: $EA $67 $C1
    ret                                           ; $4355: $C9

func_007_4356::
    call func_007_7D43                            ; $4356: $CD $43 $7D
    jp   nc, func_007_44DC                        ; $4359: $D2 $DC $44

    ldh  a, [hLinkAnimationState]                 ; $435C: $F0 $9D
    cp   $06                                      ; $435E: $FE $06
    jp   nz, func_007_44DC                        ; $4360: $C2 $DC $44

    call func_007_434E                            ; $4363: $CD $4E $43
    ld   a, $02                                   ; $4366: $3E $02
    call SetEntitySpriteVariant                   ; $4368: $CD $0C $3B
    ld   a, $25                                   ; $436B: $3E $25

jr_007_436D:
    call OpenDialogInTable1                       ; $436D: $CD $73 $23
    jp   IncrementEntityState                     ; $4370: $C3 $12 $3B

func_007_4373::
    ld   a, $E9                                   ; $4373: $3E $E9
    jr   jr_007_436D                              ; $4375: $18 $F6

func_007_4377::
    call GetEntityTransitionCountdown             ; $4377: $CD $05 $0C
    ld   [hl], $40                                ; $437A: $36 $40
    call IncrementEntityState                     ; $437C: $CD $12 $3B
    jp   func_007_44DC                            ; $437F: $C3 $DC $44

func_007_4382::
    call func_007_44DC                            ; $4382: $CD $DC $44
    call GetEntityTransitionCountdown             ; $4385: $CD $05 $0C
    ret  nz                                       ; $4388: $C0

    jp   IncrementEntityState                     ; $4389: $C3 $12 $3B

func_007_438C::
    call func_007_44DC                            ; $438C: $CD $DC $44
    ld   hl, wEntitiesUnknowTableR                ; $438F: $21 $90 $C3
    add  hl, bc                                   ; $4392: $09
    ld   e, [hl]                                  ; $4393: $5E
    ld   d, $00                                   ; $4394: $16 $00
    ld   hl, wEntitiesPosXTable                   ; $4396: $21 $00 $C2
    add  hl, de                                   ; $4399: $19
    ld   a, [hl]                                  ; $439A: $7E
    cp   $2A                                      ; $439B: $FE $2A
    ret  nz                                       ; $439D: $C0

    ld   a, $08                                   ; $439E: $3E $08
    ld   hl, wEntitiesStateTable                  ; $43A0: $21 $90 $C2
    add  hl, de                                   ; $43A3: $19
    ld   [hl], a                                  ; $43A4: $77
    call GetEntityTransitionCountdown             ; $43A5: $CD $05 $0C
    ld   [hl], $C0                                ; $43A8: $36 $C0
    jp   IncrementEntityState                     ; $43AA: $C3 $12 $3B

func_007_43AD::
    ldh  a, [hFrameCounter]                       ; $43AD: $F0 $E7
    and  $07                                      ; $43AF: $E6 $07
    ret  nz                                       ; $43B1: $C0

    ld   hl, wEntitiesUnknowTableR                ; $43B2: $21 $90 $C3
    add  hl, bc                                   ; $43B5: $09
    ld   e, [hl]                                  ; $43B6: $5E
    ld   d, $00                                   ; $43B7: $16 $00
    ld   hl, wEntitiesPosYTable                   ; $43B9: $21 $10 $C2
    add  hl, de                                   ; $43BC: $19
    dec  [hl]                                     ; $43BD: $35
    ld   a, [hl]                                  ; $43BE: $7E
    cp   $50                                      ; $43BF: $FE $50
    ret  nc                                       ; $43C1: $D0

    jp   IncrementEntityState                     ; $43C2: $C3 $12 $3B

func_007_43C5::
    ld   hl, wEntitiesUnknowTableR                ; $43C5: $21 $90 $C3
    add  hl, bc                                   ; $43C8: $09
    ld   e, [hl]                                  ; $43C9: $5E
    ld   d, $00                                   ; $43CA: $16 $00
    ldh  a, [hFrameCounter]                       ; $43CC: $F0 $E7
    and  $07                                      ; $43CE: $E6 $07
    jr   nz, jr_007_43D7                          ; $43D0: $20 $05

    ld   hl, wEntitiesPosXTable                   ; $43D2: $21 $00 $C2
    add  hl, de                                   ; $43D5: $19
    inc  [hl]                                     ; $43D6: $34

jr_007_43D7:
    ldh  a, [hFrameCounter]                       ; $43D7: $F0 $E7
    and  $01                                      ; $43D9: $E6 $01
    ret  nz                                       ; $43DB: $C0

    ld   hl, wEntitiesPosYTable                   ; $43DC: $21 $10 $C2
    add  hl, de                                   ; $43DF: $19
    dec  [hl]                                     ; $43E0: $35
    ld   e, [hl]                                  ; $43E1: $5E
    ld   hl, wEntitiesPosYTable                   ; $43E2: $21 $10 $C2
    add  hl, bc                                   ; $43E5: $09
    ld   a, [hl]                                  ; $43E6: $7E
    add  $02                                      ; $43E7: $C6 $02
    cp   e                                        ; $43E9: $BB
    ret  c                                        ; $43EA: $D8

    call_open_dialog $124                         ; $43EB
    ld   a, $04                                   ; $43F0: $3E $04
    call SetEntitySpriteVariant                   ; $43F2: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $43F5: $CD $05 $0C
    ld   [hl], $50                                ; $43F8: $36 $50
    jp   IncrementEntityState                     ; $43FA: $C3 $12 $3B

func_007_43FD::
    push bc                                       ; $43FD: $C5
    ld   bc, $C010                                ; $43FE: $01 $10 $C0
    ldh  a, [hLinkPositionY]                      ; $4401: $F0 $99
    ldh  [hScratch0], a                           ; $4403: $E0 $D7
    ldh  a, [hLinkPositionX]                      ; $4405: $F0 $98
    ldh  [hScratch1], a                           ; $4407: $E0 $D8
    ld   a, $06                                   ; $4409: $3E $06
    ldh  [hScratch2], a                           ; $440B: $E0 $D9
    ld   h, $F0                                   ; $440D: $26 $F0
    ld   l, $FC                                   ; $440F: $2E $FC
    call func_1819                               ; $4411: $CD $19 $18
    pop  bc                                       ; $4414: $C1
    ld   a, $6C                                   ; $4415: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $4417: $E0 $9D
    ret                                           ; $4419: $C9

func_007_441A::
    ld   a, $04                                   ; $441A: $3E $04
    call SetEntitySpriteVariant                   ; $441C: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $441F: $CD $05 $0C
    jr   nz, func_007_4429                        ; $4422: $20 $05

    ld   [hl], $30                                ; $4424: $36 $30
    call IncrementEntityState                     ; $4426: $CD $12 $3B

func_007_4429::
    ldh  a, [hActiveEntityState]                  ; $4429: $F0 $F0
    cp   $0C                                      ; $442B: $FE $0C
    jr   c, jr_007_4436                           ; $442D: $38 $07

    call GetEntitySpeedYAddress                   ; $442F: $CD $05 $40
    ld   a, [hl]                                  ; $4432: $7E
    bit  7, a                                     ; $4433: $CB $7F
    ret  z                                        ; $4435: $C8

jr_007_4436:
    ld   hl, wEntitiesUnknowTableR                ; $4436: $21 $90 $C3
    add  hl, bc                                   ; $4439: $09
    ld   e, [hl]                                  ; $443A: $5E
    ld   d, $00                                   ; $443B: $16 $00
    ld   hl, wEntitiesPosYTable                   ; $443D: $21 $10 $C2
    add  hl, bc                                   ; $4440: $09
    ld   a, [hl]                                  ; $4441: $7E
    ld   hl, wEntitiesPosYTable                   ; $4442: $21 $10 $C2
    add  hl, de                                   ; $4445: $19
    ld   [hl], a                                  ; $4446: $77
    ld   hl, wEntitiesPosXTable                   ; $4447: $21 $00 $C2
    add  hl, bc                                   ; $444A: $09
    ld   a, [hl]                                  ; $444B: $7E
    sub  $1A                                      ; $444C: $D6 $1A
    ld   hl, wEntitiesPosXTable                   ; $444E: $21 $00 $C2
    add  hl, de                                   ; $4451: $19
    ld   [hl], a                                  ; $4452: $77
    ret                                           ; $4453: $C9

func_007_4454::
    call func_007_4429                            ; $4454: $CD $29 $44
    call GetEntityTransitionCountdown             ; $4457: $CD $05 $0C
    ret  nz                                       ; $445A: $C0

    ld   [hl], $10                                ; $445B: $36 $10
    ld   a, $04                                   ; $445D: $3E $04
    call SetEntitySpriteVariant                   ; $445F: $CD $0C $3B
    call IncrementEntityState                     ; $4462: $CD $12 $3B
    ld   a, [hl]                                  ; $4465: $7E
    cp   $0C                                      ; $4466: $FE $0C
    ret  nz                                       ; $4468: $C0

    ld   hl, wEntitiesSpeedXTable                 ; $4469: $21 $40 $C2
    add  hl, bc                                   ; $446C: $09
    ld   [hl], $F8                                ; $446D: $36 $F8
    call GetEntitySpeedYAddress                   ; $446F: $CD $05 $40
    ld   [hl], $F8                                ; $4472: $36 $F8
    ret                                           ; $4474: $C9

func_007_4475::
    call func_007_4429                            ; $4475: $CD $29 $44
    ld   hl, wEntitiesPosYTable                   ; $4478: $21 $10 $C2
    add  hl, bc                                   ; $447B: $09
    ld   a, [hl]                                  ; $447C: $7E
    cp   $4C                                      ; $447D: $FE $4C
    jr   c, jr_007_4491                           ; $447F: $38 $10

    call func_007_48FD                            ; $4481: $CD $FD $48
    call_open_dialog $117                         ; $4484
    ld   a, $04                                   ; $4489: $3E $04
    call SetEntitySpriteVariant                   ; $448B: $CD $0C $3B
    jp   IncrementEntityState                     ; $448E: $C3 $12 $3B

jr_007_4491:
    call func_007_7E0A                            ; $4491: $CD $0A $7E
    call GetEntitySpeedYAddress                   ; $4494: $CD $05 $40
    inc  [hl]                                     ; $4497: $34
    ret                                           ; $4498: $C9

func_007_4499::
    call func_007_4429                            ; $4499: $CD $29 $44
    ld   a, $40                                   ; $449C: $3E $40
    ldh  [hNoiseSfx], a                           ; $449E: $E0 $F4
    ld   a, $16                                   ; $44A0: $3E $16
    ld   [wGameplayType], a                       ; $44A2: $EA $95 $DB
    xor  a                                        ; $44A5: $AF
    ld   [wGameplaySubtype], a                    ; $44A6: $EA $96 $DB
    ld   [wTransitionSequenceCounter], a          ; $44A9: $EA $6B $C1
    ld   [wC16C], a                               ; $44AC: $EA $6C $C1
    ret                                           ; $44AF: $C9

func_007_44B0::
    call func_007_7D43                            ; $44B0: $CD $43 $7D
    jr   nc, func_007_44DC                        ; $44B3: $30 $27

    ldh  a, [hLinkAnimationState]                 ; $44B5: $F0 $9D
    cp   $58                                      ; $44B7: $FE $58
    jr   c, jr_007_44BF                           ; $44B9: $38 $04

    cp   $5E                                      ; $44BB: $FE $5E
    jr   c, func_007_44DC                         ; $44BD: $38 $1D

jr_007_44BF:
    ld   a, [wTradeSequenceItem]                  ; $44BF: $FA $0E $DB
    cp   $0B                                      ; $44C2: $FE $0B
    jr   nz, jr_007_44CE                          ; $44C4: $20 $08

    call_open_dialog $1E8                         ; $44C6
    jp   IncrementEntityState                     ; $44CB: $C3 $12 $3B

jr_007_44CE:
    cp   $0C                                      ; $44CE: $FE $0C
    jr   nc, jr_007_44D7                          ; $44D0: $30 $05

    jp_open_dialog $1E7                           ; $44D2

jr_007_44D7:
    jp_open_dialog $1ED                           ; $44D7

func_007_44DC::
    ldh  a, [hFrameCounter]                       ; $44DC: $F0 $E7
    and  $30                                      ; $44DE: $E6 $30
    ld   e, b                                     ; $44E0: $58
    jr   z, jr_007_44E4                           ; $44E1: $28 $01

    inc  e                                        ; $44E3: $1C

jr_007_44E4:
    ld   a, e                                     ; $44E4: $7B
    jp   SetEntitySpriteVariant                   ; $44E5: $C3 $0C $3B

func_007_44E8::
    call IncrementEntityState                     ; $44E8: $CD $12 $3B
    ld   a, [wC177]                               ; $44EB: $FA $77 $C1
    and  a                                        ; $44EE: $A7
    jr   nz, jr_007_4503                          ; $44EF: $20 $12

    ld   a, $01                                   ; $44F1: $3E $01
    ld   [$DB7F], a                               ; $44F3: $EA $7F $DB
    ld   [wC167], a                               ; $44F6: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $44F9: $CD $05 $0C
    ld   [hl], $D0                                ; $44FC: $36 $D0
    jp_open_dialog $1E9                           ; $44FE

jr_007_4503:
    ld   [hl], b                                  ; $4503: $70
    jp_open_dialog $1EA                           ; $4504

func_007_4509::
    ld   a, $02                                   ; $4509: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $450B: $E0 $A1
    ld   a, $01                                   ; $450D: $3E $01
    ld   [wMusicTrackTiming], a                   ; $450F: $EA $0B $C1
    call GetEntityTransitionCountdown             ; $4512: $CD $05 $0C
    jr   nz, jr_007_4521                          ; $4515: $20 $0A

    ld   [hl], $20                                ; $4517: $36 $20
    call_open_dialog $1EB                         ; $4519
    call IncrementEntityState                     ; $451E: $CD $12 $3B

jr_007_4521:
    ld   e, $03                                   ; $4521: $1E $03
    cp   $30                                      ; $4523: $FE $30
    jr   c, jr_007_4533                           ; $4525: $38 $0C

    cp   $80                                      ; $4527: $FE $80
    jr   nc, func_007_44DC                        ; $4529: $30 $B1

    ldh  a, [hFrameCounter]                       ; $452B: $F0 $E7
    and  $18                                      ; $452D: $E6 $18
    ld   e, b                                     ; $452F: $58
    jr   z, jr_007_4533                           ; $4530: $28 $01

    inc  e                                        ; $4532: $1C

jr_007_4533:
    ld   a, e                                     ; $4533: $7B
    jp   SetEntitySpriteVariant                   ; $4534: $C3 $0C $3B

func_007_4537::
    ld   a, $02                                   ; $4537: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4539: $E0 $A1
    call GetEntityTransitionCountdown             ; $453B: $CD $05 $0C
    jr   nz, jr_007_4586                          ; $453E: $20 $46

    ld   [wMusicTrackTiming], a                   ; $4540: $EA $0B $C1
    call IncrementEntityState                     ; $4543: $CD $12 $3B
    ld   a, $54                                   ; $4546: $3E $54
    call SpawnNewEntity_trampoline                ; $4548: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $454B: $F0 $D7
    sub  $20                                      ; $454D: $D6 $20
    ld   hl, wEntitiesPosXTable                   ; $454F: $21 $00 $C2
    add  hl, de                                   ; $4552: $19
    ld   [hl], a                                  ; $4553: $77
    ldh  [hActiveEntityPosX], a                   ; $4554: $E0 $EE
    ldh  a, [hScratch1]                           ; $4556: $F0 $D8
    add  $08                                      ; $4558: $C6 $08
    ld   hl, wEntitiesPosYTable                   ; $455A: $21 $10 $C2
    add  hl, de                                   ; $455D: $19
    ld   [hl], a                                  ; $455E: $77
    ldh  [hActiveEntityVisualPosY], a             ; $455F: $E0 $EC
    ld   hl, wEntitiesSpeedZTable                 ; $4561: $21 $20 $C3
    add  hl, de                                   ; $4564: $19
    ld   [hl], $20                                ; $4565: $36 $20
    ld   hl, wEntitiesUnknowTableP                ; $4567: $21 $40 $C4
    add  hl, de                                   ; $456A: $19
    ld   [hl], $01                                ; $456B: $36 $01
    push bc                                       ; $456D: $C5
    ld   c, e                                     ; $456E: $4B
    ld   b, d                                     ; $456F: $42
    ld   a, $0A                                   ; $4570: $3E $0A
    call ApplyVectorTowardsLink_trampoline        ; $4572: $CD $AA $3B
    pop  bc                                       ; $4575: $C1
    call func_007_48FD                            ; $4576: $CD $FD $48
    ld   a, JINGLE_JUMP_DOWN                      ; $4579: $3E $08
    ldh  [hJingle], a                             ; $457B: $E0 $F2
    ld   a, $0C                                   ; $457D: $3E $0C
    ld   [wTradeSequenceItem], a                  ; $457F: $EA $0E $DB
    ld   a, $0D                                   ; $4582: $3E $0D
    ldh  [hFFA5], a                               ; $4584: $E0 $A5

jr_007_4586:
    ld   a, $03                                   ; $4586: $3E $03
    jp   SetEntitySpriteVariant                   ; $4588: $C3 $0C $3B

func_007_458B::
    ld   a, $02                                   ; $458B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $458D: $E0 $A1
    call IncrementEntityState                     ; $458F: $CD $12 $3B
    ld   [hl], b                                  ; $4592: $70
    ret                                           ; $4593: $C9

func_007_4594::
    ldh  a, [hActiveEntitySpriteVariant]          ; $4594: $F0 $F1
    rla                                           ; $4596: $17
    rla                                           ; $4597: $17
    rla                                           ; $4598: $17
    rla                                           ; $4599: $17
    and  $F0                                      ; $459A: $E6 $F0
    ld   e, a                                     ; $459C: $5F
    ld   d, b                                     ; $459D: $50
    ld   hl, Data_007_4234                        ; $459E: $21 $34 $42
    add  hl, de                                   ; $45A1: $19
    ld   c, $04                                   ; $45A2: $0E $04
    jp   RenderActiveEntitySpritesRect           ; $45A4: $C3 $E6 $3C

; Unused data
; (Maybe was intended to be the Fisherman bobbing positions)
Data_007_45A7::
    db   -02, -02, -02, -02, -01, -01, -01, -01   ; $45A7
    db   -01,  00,  00,  01,  01,  01,  01,  01   ; $45AF
    db    02,  02,  02,  02,  02,  02,  02,  02   ; $45B7
    db    02,  02,  02,  02,  02,  02,  02,  02   ; $45BF
    db    02,  02,  01,  00,  00, -01, -02, -02   ; $45C7
    db    01,  01,  01,  00,  00, -01, -01, -01   ; $45CF
    db    00,  00,  00,  00,  00,  00,  00,  00   ; $45D7
    db   -01, -01, -01,  00,  00,  01,  01,  01   ; $45DF
    db   -02, -02, -01,  00,  00,  01,  02,  02   ; $45E7

Data_007_45EF::
    db   $00, $00, $01, $02, $02, $02, $01, $00

label_007_45F7:
    ld   hl, wEntitiesUnknowTableY                ; $45F7: $21 $D0 $C3
    add  hl, bc                                   ; $45FA: $09
    ld   a, [hl]                                  ; $45FB: $7E
    rra                                           ; $45FC: $1F
    rra                                           ; $45FD: $1F
    rra                                           ; $45FE: $1F
    and  $07                                      ; $45FF: $E6 $07
    ld   e, a                                     ; $4601: $5F
    ld   d, b                                     ; $4602: $50
    ld   hl, Data_007_45EF                        ; $4603: $21 $EF $45
    add  hl, de                                   ; $4606: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $4607: $F0 $EC
    add  [hl]                                     ; $4609: $86
    ldh  [hActiveEntityVisualPosY], a             ; $460A: $E0 $EC
    ld   a, [wEntitiesStateTable]                 ; $460C: $FA $90 $C2
    cp   $0C                                      ; $460F: $FE $0C
    jr   nc, jr_007_461A                          ; $4611: $30 $07

    ldh  a, [hActiveEntityVisualPosY]             ; $4613: $F0 $EC
    sub  $10                                      ; $4615: $D6 $10
    ld   [wEntitiesPosYTable], a                  ; $4617: $EA $10 $C2

jr_007_461A:
    call func_007_467B                            ; $461A: $CD $7B $46
    call CheckLinkCollisionWithEnemy_trampoline   ; $461D: $CD $5A $3B
    jr   nc, jr_007_4640                          ; $4620: $30 $1E

    ldh  a, [hLinkPositionYIncrement]             ; $4622: $F0 $9B
    and  $80                                      ; $4624: $E6 $80
    jr   nz, jr_007_4640                          ; $4626: $20 $18

    call func_007_7E6D                            ; $4628: $CD $6D $7E
    add  $08                                      ; $462B: $C6 $08
    bit  7, a                                     ; $462D: $CB $7F
    jr   z, jr_007_4640                           ; $462F: $28 $0F

    ldh  a, [hActiveEntityVisualPosY]             ; $4631: $F0 $EC
    sub  $0F                                      ; $4633: $D6 $0F
    ldh  [hLinkPositionY], a                      ; $4635: $E0 $99
    ld   a, $02                                   ; $4637: $3E $02
    ldh  [hLinkPositionYIncrement], a             ; $4639: $E0 $9B
    ld   a, $01                                   ; $463B: $3E $01
    ld   [$C147], a                               ; $463D: $EA $47 $C1

jr_007_4640:
    call func_007_7D96                            ; $4640: $CD $96 $7D
    ld   hl, wEntitiesUnknowTableY                ; $4643: $21 $D0 $C3
    add  hl, bc                                   ; $4646: $09
    inc  [hl]                                     ; $4647: $34
    ld   a, [hl]                                  ; $4648: $7E
    and  $07                                      ; $4649: $E6 $07
    jr   nz, jr_007_4666                          ; $464B: $20 $19

    ld   e, $48                                   ; $464D: $1E $48
    ld   a, [$C147]                               ; $464F: $FA $47 $C1
    and  a                                        ; $4652: $A7
    jr   z, jr_007_4657                           ; $4653: $28 $02

    ld   e, $4B                                   ; $4655: $1E $4B

jr_007_4657:
    ld   hl, wEntitiesPosYTable                   ; $4657: $21 $10 $C2
    add  hl, bc                                   ; $465A: $09
    ld   a, [hl]                                  ; $465B: $7E
    sub  e                                        ; $465C: $93
    jr   z, jr_007_4666                           ; $465D: $28 $07

    and  $80                                      ; $465F: $E6 $80
    jr   z, jr_007_4665                           ; $4661: $28 $02

    inc  [hl]                                     ; $4663: $34
    inc  [hl]                                     ; $4664: $34

jr_007_4665:
    dec  [hl]                                     ; $4665: $35

jr_007_4666:
    ret                                           ; $4666: $C9

Data_007_4667::
    db   $00, $F8, $68, $02, $00, $00, $6A, $02, $00, $08, $6A, $02, $00, $10, $6A, $02
    db   $00, $18, $6C, $02

func_007_467B::
    ld   hl, Data_007_4667                        ; $467B: $21 $67 $46
    ld   c, $05                                   ; $467E: $0E $05
    jp   RenderActiveEntitySpritesRect           ; $4680: $C3 $E6 $3C

Data_007_4683::
    db   $72, $21, $70, $21, $70, $01, $72, $01, $76, $01, $78, $01, $78, $21, $76, $21

Data_007_4693::
    db   $74, $00, $74, $20, $74, $10, $74, $30

Data_007_469B::
    db   $00, $FC, $7A, $01, $00, $04, $7C, $01, $00, $0C, $7E, $01, $00, $FC, $7E, $21
    db   $00, $04, $7C, $21, $00, $0C, $7A, $21

Data_007_46B3::
    db   $00, $00, $01, $02, $02, $02, $01, $00

MermaidEntityHandler::
    ld   hl, wEntitiesUnknownTableD               ; $46BB: $21 $D0 $C2
    add  hl, bc                                   ; $46BE: $09
    ld   a, [hl]                                  ; $46BF: $7E
    and  a                                        ; $46C0: $A7
    jp   nz, label_007_490F                       ; $46C1: $C2 $0F $49

    ldh  a, [hActiveEntityState]                  ; $46C4: $F0 $F0
    cp   $02                                      ; $46C6: $FE $02
    jr   nc, jr_007_46E4                          ; $46C8: $30 $1A

    ldh  a, [hRoomStatus]                         ; $46CA: $F0 $F8
    and  $20                                      ; $46CC: $E6 $20
    jr   z, jr_007_46D2                           ; $46CE: $28 $02

    inc  [hl]                                     ; $46D0: $34
    ret                                           ; $46D1: $C9

jr_007_46D2:
    ldh  a, [hFrameCounter]                       ; $46D2: $F0 $E7
    rra                                           ; $46D4: $1F
    rra                                           ; $46D5: $1F
    rra                                           ; $46D6: $1F
    and  $07                                      ; $46D7: $E6 $07
    ld   e, a                                     ; $46D9: $5F
    ld   d, b                                     ; $46DA: $50
    ld   hl, Data_007_46B3                        ; $46DB: $21 $B3 $46
    add  hl, de                                   ; $46DE: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $46DF: $F0 $EC
    add  [hl]                                     ; $46E1: $86
    ldh  [hActiveEntityVisualPosY], a             ; $46E2: $E0 $EC

jr_007_46E4:
    ldh  a, [hActiveEntitySpriteVariant]          ; $46E4: $F0 $F1

jr_007_46E6:
    cp   $04                                      ; $46E6: $FE $04
    jr   c, jr_007_4702                           ; $46E8: $38 $18

    sub  $04                                      ; $46EA: $D6 $04
    rla                                           ; $46EC: $17
    rla                                           ; $46ED: $17
    and  $FC                                      ; $46EE: $E6 $FC
    ld   e, a                                     ; $46F0: $5F
    rla                                           ; $46F1: $17
    and  $F8                                      ; $46F2: $E6 $F8
    add  e                                        ; $46F4: $83
    ld   e, a                                     ; $46F5: $5F
    ld   d, b                                     ; $46F6: $50
    ld   hl, Data_007_469B                        ; $46F7: $21 $9B $46
    add  hl, de                                   ; $46FA: $19
    ld   c, $03                                   ; $46FB: $0E $03
    call RenderActiveEntitySpritesRect            ; $46FD: $CD $E6 $3C
    jr   jr_007_470B                              ; $4700: $18 $09

jr_007_4702:
    ld   de, Data_007_4683                        ; $4702: $11 $83 $46
    call RenderActiveEntitySpritesPair            ; $4705: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4708: $CD $8A $3D

jr_007_470B:
    ldh  a, [hActiveEntityState]                  ; $470B: $F0 $F0
    cp   $05                                      ; $470D: $FE $05
    jr   z, jr_007_4715                           ; $470F: $28 $04

    cp   $03                                      ; $4711: $FE $03
    jr   nc, jr_007_4727                          ; $4713: $30 $12

jr_007_4715:
    ldh  a, [hActiveEntityVisualPosY]             ; $4715: $F0 $EC
    add  $0B                                      ; $4717: $C6 $0B
    ldh  [hActiveEntityVisualPosY], a             ; $4719: $E0 $EC
    xor  a                                        ; $471B: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $471C: $E0 $F1
    ld   de, Data_007_4693                        ; $471E: $11 $93 $46
    call RenderActiveEntitySpritesPair            ; $4721: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4724: $CD $8A $3D

jr_007_4727:
    ldh  a, [hActiveEntityState]                  ; $4727: $F0 $F0
    cp   $07                                      ; $4729: $FE $07
    jr   c, jr_007_4734                           ; $472B: $38 $07

    ld   a, $02                                   ; $472D: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $472F: $E0 $A1
    ld   [wC167], a                               ; $4731: $EA $67 $C1

jr_007_4734:
    call func_007_7D96                            ; $4734: $CD $96 $7D
    ldh  a, [hActiveEntityState]                  ; $4737: $F0 $F0
    JP_TABLE                                      ; $4739
._00 dw func_007_4750                             ; $473A
._01 dw func_007_4759                             ; $473C
._02 dw func_007_47AE                             ; $473E
._03 dw func_007_47B1                             ; $4740
._04 dw func_007_47D9                             ; $4742
._05 dw func_007_47F5                             ; $4744
._06 dw func_007_480A                             ; $4746
._07 dw func_007_4867                             ; $4748
._08 dw func_007_488E                             ; $474A
._09 dw func_007_48B0                             ; $474C
._0A dw func_007_48CA                             ; $474E

func_007_4750::
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $30
    jp   IncrementEntityState

func_007_4759::
    ld   a, [wGameplayType]                       ; $4759: $FA $95 $DB
    cp   $0B                                      ; $475C: $FE $0B
    ret  nz                                       ; $475E: $C0

    ld   a, [wTransitionSequenceCounter]          ; $475F: $FA $6B $C1
    cp   $04                                      ; $4762: $FE $04
    ret  nz                                       ; $4764: $C0

    call func_007_7E5D                            ; $4765: $CD $5D $7E
    ld   a, e                                     ; $4768: $7B
    call SetEntitySpriteVariant                   ; $4769: $CD $0C $3B
    call func_007_7CF0                            ; $476C: $CD $F0 $7C
    call func_007_7E5D                            ; $476F: $CD $5D $7E
    add  $12                                      ; $4772: $C6 $12
    cp   $24                                      ; $4774: $FE $24
    jr   nc, jr_007_4793                          ; $4776: $30 $1B

    call func_007_7E6D                            ; $4778: $CD $6D $7E
    add  $12                                      ; $477B: $C6 $12
    cp   $24                                      ; $477D: $FE $24
    jr   nc, jr_007_4793                          ; $477F: $30 $12

    ldh  a, [hFF9C]                               ; $4781: $F0 $9C
    and  a                                        ; $4783: $A7
    jr   z, jr_007_4793                           ; $4784: $28 $0D

    call IncrementEntityState                     ; $4786: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $4789: $CD $05 $0C
    ld   [hl], $14                                ; $478C: $36 $14
    jp_open_dialog $1F1                           ; $478E

jr_007_4793:
    call func_007_7D43                            ; $4793: $CD $43 $7D
    ret  nc                                       ; $4796: $D0

    ld   a, [wTradeSequenceItem]                  ; $4797: $FA $0E $DB
    cp   $0C                                      ; $479A: $FE $0C
    jr   nz, jr_007_47A9                          ; $479C: $20 $0B

    call_open_dialog $1F2                         ; $479E
    call IncrementEntityState                     ; $47A3: $CD $12 $3B
    ld   [hl], $05                                ; $47A6: $36 $05
    ret                                           ; $47A8: $C9

jr_007_47A9:
    jp_open_dialog $1F0                           ; $47A9

func_007_47AE::
    jp   IncrementEntityState                     ; $47AE: $C3 $12 $3B

func_007_47B1::
    ld   a, [wDialogState]                        ; $47B1: $FA $9F $C1
    and  a                                        ; $47B4: $A7
    ret  nz                                       ; $47B5: $C0

    call GetEntityTransitionCountdown             ; $47B6: $CD $05 $0C
    jr   nz, jr_007_47C8                          ; $47B9: $20 $0D

    ld   [hl], $40                                ; $47BB: $36 $40
    call func_007_48FD                            ; $47BD: $CD $FD $48
    call IncrementEntityState                     ; $47C0: $CD $12 $3B
    ld   a, $FF                                   ; $47C3: $3E $FF
    jp   SetEntitySpriteVariant                   ; $47C5: $C3 $0C $3B

jr_007_47C8:
    ld   e, $FF                                   ; $47C8: $1E $FF
    cp   $10                                      ; $47CA: $FE $10
    jr   nc, jr_007_47D5                          ; $47CC: $30 $07

    ld   e, $02                                   ; $47CE: $1E $02
    cp   $08                                      ; $47D0: $FE $08
    jr   c, jr_007_47D5                           ; $47D2: $38 $01

    inc  e                                        ; $47D4: $1C

jr_007_47D5:
    ld   a, e                                     ; $47D5: $7B
    jp   SetEntitySpriteVariant                   ; $47D6: $C3 $0C $3B

func_007_47D9::
    call GetEntityTransitionCountdown             ; $47D9: $CD $05 $0C
    ret  nz                                       ; $47DC: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $47DD: $21 $B0 $C2
    add  hl, bc                                   ; $47E0: $09
    ld   a, [hl]                                  ; $47E1: $7E
    cpl                                           ; $47E2: $2F
    inc  a                                        ; $47E3: $3C
    ld   [hl], a                                  ; $47E4: $77
    ld   hl, wEntitiesPosXTable                   ; $47E5: $21 $00 $C2
    add  hl, bc                                   ; $47E8: $09
    add  [hl]                                     ; $47E9: $86
    ld   [hl], a                                  ; $47EA: $77
    ldh  [hActiveEntityPosX], a                   ; $47EB: $E0 $EE
    call IncrementEntityState                     ; $47ED: $CD $12 $3B
    ld   [hl], $01                                ; $47F0: $36 $01
    jp   func_007_48FD                            ; $47F2: $C3 $FD $48

func_007_47F5::
    call IncrementEntityState                     ; $47F5: $CD $12 $3B
    ld   a, [wC177]                               ; $47F8: $FA $77 $C1
    and  a                                        ; $47FB: $A7
    jr   nz, jr_007_4804                          ; $47FC: $20 $06

    call GetEntityTransitionCountdown             ; $47FE: $CD $05 $0C
    ld   [hl], $C0                                ; $4801: $36 $C0
    ret                                           ; $4803: $C9

jr_007_4804:
    ld   [hl], b                                  ; $4804: $70
    jp_open_dialog $1F4                           ; $4805

func_007_480A::
    ld   a, [wDialogState]                        ; $480A: $FA $9F $C1
    and  a                                        ; $480D: $A7
    ret  nz                                       ; $480E: $C0

    call GetEntityTransitionCountdown             ; $480F: $CD $05 $0C
    jr   z, jr_007_4854                           ; $4812: $28 $40

    cp   $70                                      ; $4814: $FE $70
    jr   nz, jr_007_4820                          ; $4816: $20 $08

    dec  [hl]                                     ; $4818: $35
    push af                                       ; $4819: $F5
    call_open_dialog $1F3                         ; $481A
    pop  af                                       ; $481F: $F1

jr_007_4820:
    cp   $90                                      ; $4820: $FE $90
    jr   nz, jr_007_483A                          ; $4822: $20 $16

    ldh  a, [hLinkPositionY]                      ; $4824: $F0 $99
    sub  $03                                      ; $4826: $D6 $03
    ldh  [hScratch1], a                           ; $4828: $E0 $D8
    ldh  a, [hLinkPositionX]                      ; $482A: $F0 $98
    ldh  [hScratch0], a                           ; $482C: $E0 $D7
    ld   a, JINGLE_WATER_DIVE                     ; $482E: $3E $0E
    ldh  [hJingle], a                             ; $4830: $E0 $F2
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $4832: $3E $01
    call AddTranscientVfx                         ; $4834: $CD $C7 $0C
    call GetEntityTransitionCountdown             ; $4837: $CD $05 $0C

jr_007_483A:
    ld   e, $00                                   ; $483A: $1E $00
    cp   $20                                      ; $483C: $FE $20
    jr   c, jr_007_4846                           ; $483E: $38 $06

    cp   $90                                      ; $4840: $FE $90
    jr   nc, jr_007_4846                          ; $4842: $30 $02

    ld   e, $01                                   ; $4844: $1E $01

jr_007_4846:
    ld   a, e                                     ; $4846: $7B
    ldh  [hFF9C], a                               ; $4847: $E0 $9C
    ld   hl, hLinkInteractiveMotionBlocked        ; $4849: $21 $A1 $FF
    ld   [hl], $02                                ; $484C: $36 $02
    ld   a, $04                                   ; $484E: $3E $04
    ld   [$C13B], a                               ; $4850: $EA $3B $C1
    ret                                           ; $4853: $C9

jr_007_4854:
    ld   a, $0D                                   ; $4854: $3E $0D
    ld   [wTradeSequenceItem], a                  ; $4856: $EA $0E $DB
    ldh  [hFFA5], a                               ; $4859: $E0 $A5
    call CreateTradingItemEntity                  ; $485B: $CD $0C $0C
    call IncrementEntityState                     ; $485E: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $4861: $CD $05 $0C
    ld   [hl], $30                                ; $4864: $36 $30
    ret                                           ; $4866: $C9

func_007_4867::
    call GetEntityTransitionCountdown             ; $4867: $CD $05 $0C
    ret  nz                                       ; $486A: $C0

    call IncrementEntityState                     ; $486B: $CD $12 $3B
    ldh  a, [hActiveEntitySpriteVariant]          ; $486E: $F0 $F1
    add  $04                                      ; $4870: $C6 $04
    call SetEntitySpriteVariant                   ; $4872: $CD $0C $3B
    ld   e, $08                                   ; $4875: $1E $08
    cp   $04                                      ; $4877: $FE $04
    jr   nz, jr_007_487D                          ; $4879: $20 $02

    ld   e, $F8                                   ; $487B: $1E $F8

jr_007_487D:
    ld   hl, wEntitiesSpeedXTable                 ; $487D: $21 $40 $C2
    add  hl, bc                                   ; $4880: $09
    ld   [hl], e                                  ; $4881: $73
    ld   hl, wEntitiesSpeedZTable                 ; $4882: $21 $20 $C3
    add  hl, bc                                   ; $4885: $09
    ld   [hl], $20                                ; $4886: $36 $20
    call func_007_48FD                            ; $4888: $CD $FD $48
    jp   func_007_733F                            ; $488B: $C3 $3F $73

func_007_488E::
    call func_007_7E0A                            ; $488E: $CD $0A $7E
    call func_007_7E43                            ; $4891: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $4894: $21 $20 $C3
    add  hl, bc                                   ; $4897: $09
    dec  [hl]                                     ; $4898: $35
    dec  [hl]                                     ; $4899: $35
    ld   hl, wEntitiesPosZTable                   ; $489A: $21 $10 $C3
    add  hl, bc                                   ; $489D: $09
    ld   a, [hl]                                  ; $489E: $7E
    and  $80                                      ; $489F: $E6 $80
    jr   z, jr_007_48AF                           ; $48A1: $28 $0C

    ld   [hl], b                                  ; $48A3: $70
    call IncrementEntityState                     ; $48A4: $CD $12 $3B
    call func_007_48FD                            ; $48A7: $CD $FD $48
    call GetEntityTransitionCountdown             ; $48AA: $CD $05 $0C
    ld   [hl], $10                                ; $48AD: $36 $10

jr_007_48AF:
    ret                                           ; $48AF: $C9

func_007_48B0::
    call GetEntityTransitionCountdown             ; $48B0: $CD $05 $0C
    jr   nz, jr_007_48BF                          ; $48B3: $20 $0A

    ld   [hl], $20                                ; $48B5: $36 $20
    ld   a, $FF                                   ; $48B7: $3E $FF
    call SetEntitySpriteVariant                   ; $48B9: $CD $0C $3B
    jp   IncrementEntityState                     ; $48BC: $C3 $12 $3B

jr_007_48BF:
    ld   e, $02                                   ; $48BF: $1E $02
    cp   $08                                      ; $48C1: $FE $08
    jr   nc, jr_007_48C6                          ; $48C3: $30 $01

    inc  e                                        ; $48C5: $1C

jr_007_48C6:
    ld   a, e                                     ; $48C6: $7B
    jp   SetEntitySpriteVariant                   ; $48C7: $C3 $0C $3B

func_007_48CA::
    call GetEntityTransitionCountdown             ; $48CA: $CD $05 $0C
    ret  nz                                       ; $48CD: $C0

    ld   hl, wEntitiesUnknowTableR                ; $48CE: $21 $90 $C3
    add  hl, bc                                   ; $48D1: $09
    ld   a, [hl]                                  ; $48D2: $7E
    cp   $03                                      ; $48D3: $FE $03
    jr   nz, jr_007_48E0                          ; $48D5: $20 $09

    xor  a                                        ; $48D7: $AF
    ldh  [hLinkInteractiveMotionBlocked], a       ; $48D8: $E0 $A1
    ld   [wC167], a                               ; $48DA: $EA $67 $C1
    jp   func_007_7EA4                            ; $48DD: $C3 $A4 $7E

jr_007_48E0:
    inc  [hl]                                     ; $48E0: $34
    call GetRandomByte                            ; $48E1: $CD $0D $28
    and  $01                                      ; $48E4: $E6 $01
    call SetEntitySpriteVariant                   ; $48E6: $CD $0C $3B
    ld   e, $10                                   ; $48E9: $1E $10
    and  a                                        ; $48EB: $A7
    jr   z, jr_007_48F0                           ; $48EC: $28 $02

    ld   e, $F0                                   ; $48EE: $1E $F0

jr_007_48F0:
    ld   hl, wEntitiesPosYTable                   ; $48F0: $21 $10 $C2
    add  hl, bc                                   ; $48F3: $09
    ld   a, [hl]                                  ; $48F4: $7E
    add  e                                        ; $48F5: $83
    ld   [hl], a                                  ; $48F6: $77
    call IncrementEntityState                     ; $48F7: $CD $12 $3B
    ld   [hl], $07                                ; $48FA: $36 $07
    ret                                           ; $48FC: $C9

func_007_48FD::
    ldh  a, [hActiveEntityVisualPosY]             ; $48FD: $F0 $EC
    ldh  [hScratch1], a                           ; $48FF: $E0 $D8
    ldh  a, [hActiveEntityPosX]                   ; $4901: $F0 $EE
    ldh  [hScratch0], a                           ; $4903: $E0 $D7
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $4905: $3E $01
    call AddTranscientVfx                         ; $4907: $CD $C7 $0C
    ld   a, JINGLE_WATER_DIVE                     ; $490A: $3E $0E
    ldh  [hJingle], a                             ; $490C: $E0 $F2
    ret                                           ; $490E: $C9

label_007_490F:
    push bc                                       ; $490F: $C5
    sla  c                                        ; $4910: $CB $21
    sla  c                                        ; $4912: $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ; $4914: $21 $80 $D5
    add  hl, bc                                   ; $4917: $09
    inc  hl                                       ; $4918: $23
    ld   a, $0A                                   ; $4919: $3E $0A
    ld   [hl+], a                                 ; $491B: $22
    ld   a, $FC                                   ; $491C: $3E $FC
    ld   [hl+], a                                 ; $491E: $22
    ld   a, $10                                   ; $491F: $3E $10
    ld   [hl], a                                  ; $4921: $77
    pop  bc                                       ; $4922: $C1
    ldh  a, [hActiveEntityState]                  ; $4923: $F0 $F0
    JP_TABLE                                      ; $4925
._00 dw func_007_492E                             ; $4926
._01 dw func_007_4945                             ; $4928
._02 dw func_007_4959                             ; $492A
._03 dw func_007_4982                             ; $492C

func_007_492E::
    call func_007_7D96                            ; $492E: $CD $96 $7D
    ld   hl, wEntitiesPosXTable                   ; $4931: $21 $00 $C2
    add  hl, bc                                   ; $4934: $09
    ld   [hl], $58                                ; $4935: $36 $58
    ld   hl, wEntitiesPosYTable                   ; $4937: $21 $10 $C2
    add  hl, bc                                   ; $493A: $09
    ld   [hl], $80                                ; $493B: $36 $80
    ld   a, [$C130]                               ; $493D: $FA $30 $C1
    and  a                                        ; $4940: $A7
    ret  z                                        ; $4941: $C8

    jp   IncrementEntityState                     ; $4942: $C3 $12 $3B

func_007_4945::
    call func_007_7D96                            ; $4945: $CD $96 $7D
    ld   hl, wEntitiesSpeedZTable                 ; $4948: $21 $20 $C3
    add  hl, bc                                   ; $494B: $09
    ld   [hl], $20                                ; $494C: $36 $20
    call GetEntitySpeedYAddress                   ; $494E: $CD $05 $40
    ld   [hl], $FC                                ; $4951: $36 $FC
    call func_007_48FD                            ; $4953: $CD $FD $48
    jp   IncrementEntityState                     ; $4956: $C3 $12 $3B

func_007_4959::
    call func_007_49DC                            ; $4959: $CD $DC $49
    call func_007_7D96                            ; $495C: $CD $96 $7D
    call func_007_7E0A                            ; $495F: $CD $0A $7E
    call func_007_7E43                            ; $4962: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $4965: $21 $20 $C3
    add  hl, bc                                   ; $4968: $09
    dec  [hl]                                     ; $4969: $35
    ld   hl, wEntitiesPosZTable                   ; $496A: $21 $10 $C3
    add  hl, bc                                   ; $496D: $09
    ld   a, [hl]                                  ; $496E: $7E
    and  $80                                      ; $496F: $E6 $80
    jr   z, jr_007_4977                           ; $4971: $28 $04

    ld   [hl], b                                  ; $4973: $70
    call IncrementEntityState                     ; $4974: $CD $12 $3B

jr_007_4977:
    ldh  a, [hFrameCounter]                       ; $4977: $F0 $E7
    rra                                           ; $4979: $1F
    rra                                           ; $497A: $1F
    rra                                           ; $497B: $1F
    rra                                           ; $497C: $1F
    and  $01                                      ; $497D: $E6 $01
    jp   SetEntitySpriteVariant                   ; $497F: $C3 $0C $3B

func_007_4982::
    call func_007_7CF0                            ; $4982: $CD $F0 $7C
    call func_007_7E5D                            ; $4985: $CD $5D $7E
    ld   a, e                                     ; $4988: $7B
    add  $02                                      ; $4989: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ; $498B: $E0 $F1
    call func_007_49DC                            ; $498D: $CD $DC $49
    call func_007_7D96                            ; $4990: $CD $96 $7D
    call func_007_7D43                            ; $4993: $CD $43 $7D
    ret  nc                                       ; $4996: $D0

    jp_open_dialog $1F7                           ; $4997

Data_007_499C::
    db   $F0, $00, $70, $01, $F0, $08, $72, $01, $00, $00, $74, $01, $00, $08, $76, $01
    db   $F0, $00, $72, $21, $F0, $08, $70, $21, $00, $00, $76, $21, $00, $08, $74, $21
    db   $F0, $FF, $72, $21, $F0, $07, $70, $21, $00, $00, $7A, $21, $00, $08, $78, $21
    db   $F0, $01, $70, $01, $F0, $09, $72, $01, $00, $00, $78, $01, $00, $08, $7A, $01

func_007_49DC::
    ldh  a, [hActiveEntitySpriteVariant]          ; $49DC: $F0 $F1
    rla                                           ; $49DE: $17
    rla                                           ; $49DF: $17
    rla                                           ; $49E0: $17
    rla                                           ; $49E1: $17
    and  $F0                                      ; $49E2: $E6 $F0
    ld   e, a                                     ; $49E4: $5F
    ld   d, b                                     ; $49E5: $50
    ld   hl, Data_007_499C                        ; $49E6: $21 $9C $49
    add  hl, de                                   ; $49E9: $19
    ld   c, $04                                   ; $49EA: $0E $04
    jp   RenderActiveEntitySpritesRect           ; $49EC: $C3 $E6 $3C

Data_007_49EF::
    db   $6E, $20, $6C, $20, $6C, $00, $6E, $00

Data_007_49F7::
    db   $70, $00, $72, $01, $74, $00, $76, $01, $78, $00, $7A, $01, $7C, $00, $76, $01

Data_007_4A07::
    db   $72, $20, $70, $21, $76, $20, $74, $21, $7A, $20, $78, $21, $76, $20, $7C, $21

Data_007_4A17::
    db   $7E, $01, $7E, $21

PapahlEntityHandler::
    ld   a, [wIsIndoor]                           ; $4A1B: $FA $A5 $DB
    and  a                                        ; $4A1E: $A7
    jr   z, jr_007_4A69                           ; $4A1F: $28 $48

    ld   a, [wTradeSequenceItem]                  ; $4A21: $FA $0E $DB
    cp   $08                                      ; $4A24: $FE $08
    jr   nc, jr_007_4A30                          ; $4A26: $30 $08

    ld   a, [wHasInstrument3]                     ; $4A28: $FA $67 $DB
    and  $02                                      ; $4A2B: $E6 $02
    jp   nz, func_007_7EA4                        ; $4A2D: $C2 $A4 $7E

jr_007_4A30:
    ld   de, Data_007_4A07                        ; $4A30: $11 $07 $4A
    ld   a, [wTradeSequenceItem]                  ; $4A33: $FA $0E $DB
    cp   $08                                      ; $4A36: $FE $08
    jr   nc, jr_007_4A43                          ; $4A38: $30 $09

    call func_007_7E5D                            ; $4A3A: $CD $5D $7E
    ld   a, e                                     ; $4A3D: $7B
    ldh  [hActiveEntitySpriteVariant], a          ; $4A3E: $E0 $F1
    ld   de, Data_007_49EF                        ; $4A40: $11 $EF $49

jr_007_4A43:
    call RenderActiveEntitySpritesPair            ; $4A43: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $4A46: $F0 $E7
    rra                                           ; $4A48: $1F
    rra                                           ; $4A49: $1F
    rra                                           ; $4A4A: $1F
    rra                                           ; $4A4B: $1F
    and  $01                                      ; $4A4C: $E6 $01
    call SetEntitySpriteVariant                   ; $4A4E: $CD $0C $3B
    call func_007_7CF0                            ; $4A51: $CD $F0 $7C
    call func_007_7D43                            ; $4A54: $CD $43 $7D
    ret  nc                                       ; $4A57: $D0

    ld   a, [wTradeSequenceItem]                  ; $4A58: $FA $0E $DB
    cp   $08                                      ; $4A5B: $FE $08
    jr   nc, jr_007_4A64                          ; $4A5D: $30 $05

    jp_open_dialog $027                           ; $4A5F

jr_007_4A64:
    jp_open_dialog $176                           ; $4A64

jr_007_4A69:
    ldh  a, [hRoomStatus]                         ; $4A69: $F0 $F8
    and  $20                                      ; $4A6B: $E6 $20
    jp   nz, func_007_7EA4                        ; $4A6D: $C2 $A4 $7E

    ld   de, Data_007_49F7                        ; $4A70: $11 $F7 $49
    ld   hl, wEntitiesDirectionTable              ; $4A73: $21 $80 $C3
    add  hl, bc                                   ; $4A76: $09
    ld   a, [hl]                                  ; $4A77: $7E
    and  a                                        ; $4A78: $A7
    jr   nz, jr_007_4A7E                          ; $4A79: $20 $03

    ld   de, Data_007_4A07                        ; $4A7B: $11 $07 $4A

jr_007_4A7E:
    call RenderActiveEntitySpritesPair            ; $4A7E: $CD $C0 $3B
    ld   a, [wTradeSequenceItem]                  ; $4A81: $FA $0E $DB
    cp   $08                                      ; $4A84: $FE $08
    jr   nc, jr_007_4AA0                          ; $4A86: $30 $18

    ldh  a, [hActiveEntityPosX]                   ; $4A88: $F0 $EE
    add  $10                                      ; $4A8A: $C6 $10
    ldh  [hActiveEntityPosX], a                   ; $4A8C: $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ; $4A8E: $F0 $EC
    sub  $10                                      ; $4A90: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $4A92: $E0 $EC
    xor  a                                        ; $4A94: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4A95: $E0 $F1
    ld   de, Data_007_4A17                        ; $4A97: $11 $17 $4A
    call RenderActiveEntitySpritesPair            ; $4A9A: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4A9D: $CD $8A $3D

jr_007_4AA0:
    call func_007_7D96                            ; $4AA0: $CD $96 $7D
    call func_007_7CF0                            ; $4AA3: $CD $F0 $7C
    ldh  a, [hActiveEntityState]                  ; $4AA6: $F0 $F0
    JP_TABLE                                      ; $4AA8
._00 dw func_007_4AB3                             ; $4AA9
._01 dw func_007_4AF3                             ; $4AAB
._02 dw func_007_4B1C                             ; $4AAD
._03 dw func_007_4B50                             ; $4AAF
._04 dw func_007_4B5B                             ; $4AB1

func_007_4AB3::
    call func_007_7E5D                            ; $4AB3: $CD $5D $7E
    ld   hl, wEntitiesDirectionTable              ; $4AB6: $21 $80 $C3
    add  hl, bc                                   ; $4AB9: $09
    ld   [hl], e                                  ; $4ABA: $73
    add  $24                                      ; $4ABB: $C6 $24
    cp   $48                                      ; $4ABD: $FE $48
    jr   nc, jr_007_4AE9                          ; $4ABF: $30 $28

    call func_007_7E6D                            ; $4AC1: $CD $6D $7E
    add  $24                                      ; $4AC4: $C6 $24
    cp   $48                                      ; $4AC6: $FE $48
    jr   nc, jr_007_4AE9                          ; $4AC8: $30 $1F

    call func_007_7D43                            ; $4ACA: $CD $43 $7D
    jr   nc, jr_007_4AE5                          ; $4ACD: $30 $16

    ld   a, [wTradeSequenceItem]                  ; $4ACF: $FA $0E $DB
    cp   $07                                      ; $4AD2: $FE $07
    ld   a, $70                                   ; $4AD4: $3E $70
    jr   z, jr_007_4ADA                           ; $4AD6: $28 $02

    ld   a, $77                                   ; $4AD8: $3E $77

jr_007_4ADA:
    call OpenDialogInTable1                       ; $4ADA: $CD $73 $23
    call IncrementEntityState                     ; $4ADD: $CD $12 $3B
    ld   a, $01                                   ; $4AE0: $3E $01
    ld   [wC167], a                               ; $4AE2: $EA $67 $C1

jr_007_4AE5:
    xor  a                                        ; $4AE5: $AF
    jp   SetEntitySpriteVariant                   ; $4AE6: $C3 $0C $3B

jr_007_4AE9:
    ldh  a, [hFrameCounter]                       ; $4AE9: $F0 $E7
    rra                                           ; $4AEB: $1F
    rra                                           ; $4AEC: $1F
    rra                                           ; $4AED: $1F
    and  $01                                      ; $4AEE: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4AF0: $C3 $0C $3B

func_007_4AF3::
    ld   a, [wC177]                               ; $4AF3: $FA $77 $C1
    and  a                                        ; $4AF6: $A7
    jr   nz, jr_007_4B0E                          ; $4AF7: $20 $15

    ld   a, [wTradeSequenceItem]                  ; $4AF9: $FA $0E $DB
    cp   $07                                      ; $4AFC: $FE $07
    jr   nz, jr_007_4B0E                          ; $4AFE: $20 $0E

    call_open_dialog $172                         ; $4B00
    call IncrementEntityState                     ; $4B05: $CD $12 $3B
    call GetEntityTransitionCountdown                 ; $4B08: $CD $05 $0C
    ld   [hl], $C0                                ; $4B0B: $36 $C0
    ret                                           ; $4B0D: $C9

jr_007_4B0E:
    call_open_dialog $171                         ; $4B0E
    xor  a                                        ; $4B13: $AF
    ld   [wC167], a                               ; $4B14: $EA $67 $C1
    call IncrementEntityState                     ; $4B17: $CD $12 $3B
    ld   [hl], b                                  ; $4B1A: $70
    ret                                           ; $4B1B: $C9

func_007_4B1C::
    ld   a, [wDialogState]                        ; $4B1C: $FA $9F $C1
    and  a                                        ; $4B1F: $A7
    jr   nz, func_007_4B44                        ; $4B20: $20 $22

    call GetEntityTransitionCountdown             ; $4B22: $CD $05 $0C
    jr   nz, jr_007_4B3B                          ; $4B25: $20 $14

    ld   [wMusicTrackTiming], a                               ; $4B27: $EA $0B $C1
    call_open_dialog $173                         ; $4B2A
    ld   a, $08                                   ; $4B2F: $3E $08
    ld   [wTradeSequenceItem], a                  ; $4B31: $EA $0E $DB
    ld   a, $0D                                   ; $4B34: $3E $0D
    ldh  [hFFA5], a                               ; $4B36: $E0 $A5
    jp   IncrementEntityState                     ; $4B38: $C3 $12 $3B

jr_007_4B3B:
    ld   a, $02                                   ; $4B3B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4B3D: $E0 $A1
    ld   a, $01                                   ; $4B3F: $3E $01
    ld   [wMusicTrackTiming], a                   ; $4B41: $EA $0B $C1

func_007_4B44::
    ldh  a, [hFrameCounter]                       ; $4B44: $F0 $E7
    rra                                           ; $4B46: $1F
    rra                                           ; $4B47: $1F
    rra                                           ; $4B48: $1F
    and  $01                                      ; $4B49: $E6 $01
    add  $02                                      ; $4B4B: $C6 $02
    jp   SetEntitySpriteVariant                   ; $4B4D: $C3 $0C $3B

func_007_4B50::
    ld   a, [wDialogState]                        ; $4B50: $FA $9F $C1
    and  a                                        ; $4B53: $A7
    ret  nz                                       ; $4B54: $C0

    call CreateTradingItemEntity                  ; $4B55: $CD $0C $0C
    jp   IncrementEntityState                     ; $4B58: $C3 $12 $3B

func_007_4B5B::
    call func_007_4B44                            ; $4B5B: $CD $44 $4B
    call func_007_7D43                            ; $4B5E: $CD $43 $7D
    ret  nc                                       ; $4B61: $D0

    xor  a                                        ; $4B62: $AF
    ld   [wC167], a                               ; $4B63: $EA $67 $C1
    jp_open_dialog $175                           ; $4B66

Data_007_4B6B::
    db   $FA, $00, $70, $03, $FA, $08, $72, $03, $FA, $10, $74, $03, $FA, $18, $70, $23
    db   $0A, $00, $76, $03, $0A, $08, $78, $03, $0A, $10, $78, $23, $0A, $18, $76, $23

Data_007_4B8B::
    db   $FA, $00, $70, $03, $FA, $08, $74, $23, $FA, $10, $72, $23, $FA, $18, $70, $23
    db   $0A, $00, $76, $03, $0A, $08, $78, $03, $0A, $10, $78, $23, $0A, $18, $76, $23

Data_007_4BAB::
    db   $7E, $07

Data_007_4BAD::
    db   $7A, $01, $7C, $01

Data_007_4BB1::
    db   $7C, $21, $7A, $21

BearEntityHandler::
    xor  a                                        ; $4BB5: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4BB6: $E0 $F1
    ld   a, $4A                                   ; $4BB8: $3E $4A
    ldh  [hActiveEntityVisualPosY], a             ; $4BBA: $E0 $EC
    ld   de, Data_007_4BAD                        ; $4BBC: $11 $AD $4B
    call RenderActiveEntitySpritesPair            ; $4BBF: $CD $C0 $3B
    ld   a, $68                                   ; $4BC2: $3E $68
    ldh  [hActiveEntityPosX], a                   ; $4BC4: $E0 $EE
    ld   de, Data_007_4BB1                        ; $4BC6: $11 $B1 $4B
    call RenderActiveEntitySpritesPair            ; $4BC9: $CD $C0 $3B
    ld   a, [wTradeSequenceItem]                  ; $4BCC: $FA $0E $DB
    cp   $06                                      ; $4BCF: $FE $06
    jr   nz, jr_007_4BE1                          ; $4BD1: $20 $0E

    ld   a, $74                                   ; $4BD3: $3E $74
    ldh  [hActiveEntityPosX], a                   ; $4BD5: $E0 $EE
    ld   a, $38                                   ; $4BD7: $3E $38
    ldh  [hActiveEntityVisualPosY], a             ; $4BD9: $E0 $EC
    ld   de, Data_007_4BAB                        ; $4BDB: $11 $AB $4B
    call RenderActiveEntitySprite                 ; $4BDE: $CD $77 $3C

jr_007_4BE1:
    call CopyEntityPositionToActivePosition       ; $4BE1: $CD $8A $3D
    ld   hl, wEntitiesSpriteVariantTable          ; $4BE4: $21 $B0 $C3
    add  hl, bc                                   ; $4BE7: $09
    ld   a, [hl]                                  ; $4BE8: $7E
    ld   hl, Data_007_4B6B                        ; $4BE9: $21 $6B $4B
    and  a                                        ; $4BEC: $A7
    jr   z, jr_007_4BF2                           ; $4BED: $28 $03

    ld   hl, Data_007_4B8B                        ; $4BEF: $21 $8B $4B

jr_007_4BF2:
    ld   c, $08                                   ; $4BF2: $0E $08
    call RenderActiveEntitySpritesRect            ; $4BF4: $CD $E6 $3C
    ld   a, $06                                   ; $4BF7: $3E $06
    call label_3DA0                               ; $4BF9: $CD $A0 $3D
    xor  a                                        ; $4BFC: $AF
    call SetEntitySpriteVariant                   ; $4BFD: $CD $0C $3B

jr_007_4C00:
    call func_007_7D96                            ; $4C00: $CD $96 $7D
    ldh  a, [hFrameCounter]                       ; $4C03: $F0 $E7
    and  $20                                      ; $4C05: $E6 $20
    call SetEntitySpriteVariant                   ; $4C07: $CD $0C $3B
    call func_007_7CF0                            ; $4C0A: $CD $F0 $7C
    ldh  a, [hActiveEntityState]                  ; $4C0D: $F0 $F0
    JP_TABLE                                      ; $4C0F
._00 dw func_007_4C16                             ; $4C10
._01 dw func_007_4C49                             ; $4C12
._02 dw func_007_4C70                             ; $4C14

func_007_4C16::
    call func_007_7D36                            ; $4C16: $CD $36 $7D
    ret  nc                                       ; $4C19: $D0

    ld   e, $D3                                   ; $4C1A: $1E $D3
    ld   a, [wOverworldRoomStatus + $FD]                               ; $4C1C: $FA $FD $D8
    and  $30                                      ; $4C1F: $E6 $30
    jr   nz, jr_007_4C45                          ; $4C21: $20 $22

    ld   a, [wTradeSequenceItem]                  ; $4C23: $FA $0E $DB
    cp   $06                                      ; $4C26: $FE $06
    jr   nz, jr_007_4C32                          ; $4C28: $20 $08

    ld   a, $CF                                   ; $4C2A: $3E $CF
    call func_007_4C83                            ; $4C2C: $CD $83 $4C
    jp   IncrementEntityState                     ; $4C2F: $C3 $12 $3B

jr_007_4C32:
    ld   e, $D4                                   ; $4C32: $1E $D4
    ld   a, [wIsMarinFollowingLink]               ; $4C34: $FA $73 $DB
    and  a                                        ; $4C37: $A7
    jr   nz, jr_007_4C45                          ; $4C38: $20 $0B

    ld   e, $CE                                   ; $4C3A: $1E $CE
    ld   a, [wTradeSequenceItem]                  ; $4C3C: $FA $0E $DB
    cp   TRADING_ITEM_PINEAPPLE                   ; $4C3F: $FE $07
    jr   nz, jr_007_4C45                          ; $4C41: $20 $02

func_007_4C43::
    ld   e, $D2                                   ; $4C43: $1E $D2

jr_007_4C45:
    ld   a, e                                     ; $4C45: $7B
    jp   func_007_4C83                            ; $4C46: $C3 $83 $4C

func_007_4C49::
    ld   a, [wDialogState]                        ; $4C49: $FA $9F $C1
    and  a                                        ; $4C4C: $A7
    jr   nz, jr_007_4C6F                          ; $4C4D: $20 $20

    call IncrementEntityState                     ; $4C4F: $CD $12 $3B
    ld   a, [wC177]                               ; $4C52: $FA $77 $C1
    and  a                                        ; $4C55: $A7
    jr   z, jr_007_4C5E                           ; $4C56: $28 $06

    ld   [hl], b                                  ; $4C58: $70
    ld   a, $D1                                   ; $4C59: $3E $D1
    jp   func_007_4C83                            ; $4C5B: $C3 $83 $4C

jr_007_4C5E:
    ld   a, TRADING_ITEM_PINEAPPLE                ; $4C5E: $3E $07
    ld   [wTradeSequenceItem], a                  ; $4C60: $EA $0E $DB
    ld   a, $0D                                   ; $4C63: $3E $0D
    ldh  [hFFA5], a                               ; $4C65: $E0 $A5
    call CreateTradingItemEntity                  ; $4C67: $CD $0C $0C
    call GetEntityTransitionCountdown             ; $4C6A: $CD $05 $0C
    ld   [hl], $70                                ; $4C6D: $36 $70

jr_007_4C6F:
    ret                                           ; $4C6F: $C9

func_007_4C70::
    call GetEntityTransitionCountdown             ; $4C70: $CD $05 $0C
    jr   nz, jr_007_4C82                          ; $4C73: $20 $0D

    ld   a, [wDialogState]                        ; $4C75: $FA $9F $C1
    and  a                                        ; $4C78: $A7
    jr   nz, jr_007_4C82                          ; $4C79: $20 $07

    call func_007_4C43                            ; $4C7B: $CD $43 $4C
    call IncrementEntityState                     ; $4C7E: $CD $12 $3B
    ld   [hl], b                                  ; $4C81: $70

jr_007_4C82:
    ret                                           ; $4C82: $C9

func_007_4C83::
    ld   e, a                                     ; $4C83: $5F
    ldh  a, [hLinkPositionY]                      ; $4C84: $F0 $99
    push af                                       ; $4C86: $F5
    ld   a, $10                                   ; $4C87: $3E $10
    ldh  [hLinkPositionY], a                      ; $4C89: $E0 $99
    ld   a, e                                     ; $4C8B: $7B
    call OpenDialogInTable1                       ; $4C8C: $CD $73 $23
    pop  af                                       ; $4C8F: $F1
    ldh  [hLinkPositionY], a                      ; $4C90: $E0 $99
    ret                                           ; $4C92: $C9

Data_007_4C93::
    db   $70, $01, $70, $21

HoneycombEntityHandler::
    ldh  a, [hRoomStatus]                         ; $4C97: $F0 $F8
    and  $20                                      ; $4C99: $E6 $20
    jp   nz, func_007_7EA4                        ; $4C9B: $C2 $A4 $7E

    ld   hl, wEntitiesUnknowTableP                ; $4C9E: $21 $40 $C4
    add  hl, bc                                   ; $4CA1: $09
    ld   a, [hl]                                  ; $4CA2: $7E
    and  a                                        ; $4CA3: $A7
    jp   nz, label_007_4D84                       ; $4CA4: $C2 $84 $4D

    ld   a, c                                     ; $4CA7: $79
    ld   [$D201], a                               ; $4CA8: $EA $01 $D2
    call GetEntityTransitionCountdown             ; $4CAB: $CD $05 $0C
    and  $20                                      ; $4CAE: $E6 $20
    jr   z, jr_007_4CB6                           ; $4CB0: $28 $04

    ld   hl, hActiveEntityPosX                    ; $4CB2: $21 $EE $FF
    dec  [hl]                                     ; $4CB5: $35

jr_007_4CB6:
    ld   de, Data_007_4C93                        ; $4CB6: $11 $93 $4C
    call RenderActiveEntitySpritesPair            ; $4CB9: $CD $C0 $3B
    call func_007_7D96                            ; $4CBC: $CD $96 $7D
    ldh  a, [hActiveEntityState]                  ; $4CBF: $F0 $F0
    JP_TABLE                                      ; $4CC1
._00 dw func_007_4CCC                             ; $4CC2
._01 dw func_007_4D1F                             ; $4CC4
._02 dw func_007_4D27                             ; $4CC6
._03 dw func_007_4D4D                             ; $4CC8
._04 dw func_007_4D4E                             ; $4CCA

func_007_4CCC::
    ld   a, [$DB7F]                               ; $4CCC: $FA $7F $DB
    cp   $02                                      ; $4CCF: $FE $02
    jr   nz, jr_007_4CE7                          ; $4CD1: $20 $14

    ld   hl, wEntitiesPosYTable                   ; $4CD3: $21 $10 $C2
    add  hl, bc                                   ; $4CD6: $09
    ld   a, [hl]                                  ; $4CD7: $7E
    add  $10                                      ; $4CD8: $C6 $10
    ld   [hl], a                                  ; $4CDA: $77
    ld   hl, wEntitiesPosZTable                   ; $4CDB: $21 $10 $C3
    add  hl, bc                                   ; $4CDE: $09
    ld   [hl], $10                                ; $4CDF: $36 $10
    call IncrementEntityState                     ; $4CE1: $CD $12 $3B
    ld   [hl], $04                                ; $4CE4: $36 $04
    ret                                           ; $4CE6: $C9

jr_007_4CE7:
    xor  a                                        ; $4CE7: $AF
    ld   [$D202], a                               ; $4CE8: $EA $02 $D2
    call IncrementEntityState                     ; $4CEB: $CD $12 $3B

func_007_4CEE::
    ld   a, $B3                                   ; $4CEE: $3E $B3
    call SpawnNewEntity_trampoline                ; $4CF0: $CD $86 $3B
    jr   c, jr_007_4D1D                           ; $4CF3: $38 $28

    ldh  a, [hScratch0]                           ; $4CF5: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4CF7: $21 $00 $C2
    add  hl, de                                   ; $4CFA: $19
    ld   [hl], a                                  ; $4CFB: $77
    ldh  a, [hScratch1]                           ; $4CFC: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4CFE: $21 $10 $C2
    add  hl, de                                   ; $4D01: $19
    ld   [hl], a                                  ; $4D02: $77
    ld   hl, wEntitiesUnknowTableP                ; $4D03: $21 $40 $C4
    add  hl, de                                   ; $4D06: $19
    ld   [hl], $01                                ; $4D07: $36 $01
    ld   hl, wEntitiesSpeedXTable                 ; $4D09: $21 $40 $C2
    add  hl, de                                   ; $4D0C: $19
    ld   [hl], $0E                                ; $4D0D: $36 $0E
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4D0F: $21 $40 $C3
    add  hl, de                                   ; $4D12: $19
    ld   [hl], $C1                                ; $4D13: $36 $C1
    ld   hl, wEntitiesHitboxFlagsTable            ; $4D15: $21 $50 $C3
    add  hl, de                                   ; $4D18: $19
    ld   [hl], $00                                ; $4D19: $36 $00
    and  a                                        ; $4D1B: $A7
    ret                                           ; $4D1C: $C9

jr_007_4D1D:
    scf                                           ; $4D1D: $37
    ret                                           ; $4D1E: $C9

func_007_4D1F::
    ld   a, [$D202]                               ; $4D1F: $FA $02 $D2
    and  a                                        ; $4D22: $A7
    jp   nz, IncrementEntityState                 ; $4D23: $C2 $12 $3B

    ret                                           ; $4D26: $C9

func_007_4D27::
    ld   hl, wEntitiesUnknowTableY                ; $4D27: $21 $D0 $C3
    add  hl, bc                                   ; $4D2A: $09
    ld   a, [hl]                                  ; $4D2B: $7E
    cp   $05                                      ; $4D2C: $FE $05
    jp   z, IncrementEntityState                  ; $4D2E: $CA $12 $3B

    ldh  a, [hFrameCounter]                       ; $4D31: $F0 $E7
    and  $07                                      ; $4D33: $E6 $07
    jr   nz, jr_007_4D4C                          ; $4D35: $20 $15

    call func_007_4CEE                            ; $4D37: $CD $EE $4C
    jr   c, jr_007_4D4C                           ; $4D3A: $38 $10

    ld   hl, wEntitiesUnknowTableY                ; $4D3C: $21 $D0 $C3
    add  hl, bc                                   ; $4D3F: $09
    inc  [hl]                                     ; $4D40: $34
    ld   a, [hl]                                  ; $4D41: $7E
    ld   hl, wEntitiesUnknowTableY                ; $4D42: $21 $D0 $C3
    add  hl, de                                   ; $4D45: $19
    ld   [hl], a                                  ; $4D46: $77
    ld   hl, wEntitiesSpeedXTable                 ; $4D47: $21 $40 $C2
    add  hl, de                                   ; $4D4A: $19
    ld   [hl], b                                  ; $4D4B: $70

jr_007_4D4C:
    ret                                           ; $4D4C: $C9

func_007_4D4D::
    ret                                           ; $4D4D: $C9

func_007_4D4E::
    call GetEntityTransitionCountdown             ; $4D4E: $CD $05 $0C
    ret  nz                                       ; $4D51: $C0

    call func_007_7E43                            ; $4D52: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $4D55: $21 $20 $C3
    add  hl, bc                                   ; $4D58: $09
    dec  [hl]                                     ; $4D59: $35
    dec  [hl]                                     ; $4D5A: $35
    ld   hl, wEntitiesPosZTable                   ; $4D5B: $21 $10 $C3
    add  hl, bc                                   ; $4D5E: $09
    ld   a, [hl]                                  ; $4D5F: $7E
    and  $80                                      ; $4D60: $E6 $80
    ret  z                                        ; $4D62: $C8

    ld   [hl], b                                  ; $4D63: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4D64: $21 $20 $C3
    add  hl, bc                                   ; $4D67: $09
    ld   [hl], b                                  ; $4D68: $70
    call CheckLinkCollisionWithEnemy_trampoline   ; $4D69: $CD $5A $3B
    ret  nc                                       ; $4D6C: $D0

    xor  a                                        ; $4D6D: $AF
    ld   [$DB7F], a                               ; $4D6E: $EA $7F $DB
    ld   a, $06                                   ; $4D71: $3E $06
    ld   [wTradeSequenceItem], a                  ; $4D73: $EA $0E $DB
    ld   a, $0D                                   ; $4D76: $3E $0D
    ldh  [hFFA5], a                               ; $4D78: $E0 $A5
    call CreateTradingItemEntity                  ; $4D7A: $CD $0C $0C
    jp   func_007_7EA4                            ; $4D7D: $C3 $A4 $7E

Data_007_4D80::
    db   $72, $00, $72, $40

label_007_4D84:
    ld   de, Data_007_4D80                        ; $4D84: $11 $80 $4D
    call RenderActiveEntitySprite                 ; $4D87: $CD $77 $3C
    ldh  a, [hFrameCounter]                       ; $4D8A: $F0 $E7
    rra                                           ; $4D8C: $1F
    rra                                           ; $4D8D: $1F
    and  $01                                      ; $4D8E: $E6 $01
    call SetEntitySpriteVariant                   ; $4D90: $CD $0C $3B
    call func_007_7D96                            ; $4D93: $CD $96 $7D
    ldh  a, [hActiveEntityState]                  ; $4D96: $F0 $F0
    JP_TABLE                                      ; $4D98
._00 dw func_007_4DA5                             ; $4D99
._01 dw func_007_4E25                             ; $4D9B
._02 dw func_007_4E8C                             ; $4D9D

Data_007_4D9F::
    db   $01, $FF

Data_007_4DA1::
    db   $10, $F0

Data_007_4DA3::
    db   $0B, $F5

func_007_4DA5::
    ldh  a, [hFrameCounter]                       ; $4DA5: $F0 $E7
    and  $01                                      ; $4DA7: $E6 $01
    jr   nz, jr_007_4DEA                          ; $4DA9: $20 $3F

    ld   hl, wEntitiesPrivateState1Table          ; $4DAB: $21 $B0 $C2
    add  hl, bc                                   ; $4DAE: $09
    ld   e, [hl]                                  ; $4DAF: $5E
    ld   d, b                                     ; $4DB0: $50
    ld   hl, Data_007_4D9F                        ; $4DB1: $21 $9F $4D
    add  hl, de                                   ; $4DB4: $19
    ld   a, [hl]                                  ; $4DB5: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4DB6: $21 $40 $C2
    add  hl, bc                                   ; $4DB9: $09
    add  [hl]                                     ; $4DBA: $86
    ld   [hl], a                                  ; $4DBB: $77
    ld   hl, Data_007_4DA1                        ; $4DBC: $21 $A1 $4D
    add  hl, de                                   ; $4DBF: $19
    cp   [hl]                                     ; $4DC0: $BE
    jr   nz, jr_007_4DCB                          ; $4DC1: $20 $08

    ld   hl, wEntitiesPrivateState1Table          ; $4DC3: $21 $B0 $C2
    add  hl, bc                                   ; $4DC6: $09
    ld   a, [hl]                                  ; $4DC7: $7E
    xor  $01                                      ; $4DC8: $EE $01
    ld   [hl], a                                  ; $4DCA: $77

jr_007_4DCB:
    ld   hl, wEntitiesPrivateState2Table          ; $4DCB: $21 $C0 $C2
    add  hl, bc                                   ; $4DCE: $09
    ld   e, [hl]                                  ; $4DCF: $5E
    ld   d, b                                     ; $4DD0: $50
    ld   hl, Data_007_4D9F                        ; $4DD1: $21 $9F $4D
    add  hl, de                                   ; $4DD4: $19
    ld   a, [hl]                                  ; $4DD5: $7E
    call GetEntitySpeedYAddress                   ; $4DD6: $CD $05 $40
    add  [hl]                                     ; $4DD9: $86
    ld   [hl], a                                  ; $4DDA: $77
    ld   hl, Data_007_4DA3                        ; $4DDB: $21 $A3 $4D
    add  hl, de                                   ; $4DDE: $19
    cp   [hl]                                     ; $4DDF: $BE
    jr   nz, jr_007_4DEA                          ; $4DE0: $20 $08

    ld   hl, wEntitiesPrivateState2Table          ; $4DE2: $21 $C0 $C2
    add  hl, bc                                   ; $4DE5: $09
    ld   a, [hl]                                  ; $4DE6: $7E
    xor  $01                                      ; $4DE7: $EE $01
    ld   [hl], a                                  ; $4DE9: $77

jr_007_4DEA:
    call func_007_7E0A                            ; $4DEA: $CD $0A $7E
    ld   a, [$D202]                               ; $4DED: $FA $02 $D2
    and  a                                        ; $4DF0: $A7
    jp   nz, IncrementEntityState                 ; $4DF1: $C2 $12 $3B

    ret                                           ; $4DF4: $C9

Data_007_4DF5::
    db   $F0, $E8, $E8, $E0, $E0, $D8, $10, $18, $18, $20, $20, $28, $00, $F8, $08, $F8
    db   $08, $00, $00, $08, $F8, $08, $F8, $00

Data_007_4E0D::
    db   $00, $F8, $08, $F8, $08, $00, $00, $08, $F8, $08, $F8, $00, $10, $18, $18, $20
    db   $20, $28, $F0, $E8, $E8, $E0, $E0, $D8

func_007_4E25::
    ld   a, JINGLE_HONEYCOMB                      ; $4E25: $3E $22
    ldh  [hJingle], a                             ; $4E27: $E0 $F2
    ld   a, [$D204]                               ; $4E29: $FA $04 $D2
    ld   e, a                                     ; $4E2C: $5F
    ld   d, b                                     ; $4E2D: $50
    ld   hl, wEntitiesStatusTable                 ; $4E2E: $21 $80 $C2
    add  hl, de                                   ; $4E31: $19
    ld   a, [hl]                                  ; $4E32: $7E
    and  a                                        ; $4E33: $A7

jr_007_4E34:
    jp   z, func_007_7EA4                         ; $4E34: $CA $A4 $7E

    ldh  a, [hFrameCounter]                       ; $4E37: $F0 $E7
    and  $07                                      ; $4E39: $E6 $07
    ld   hl, wEntitiesUnknowTableY                ; $4E3B: $21 $D0 $C3

jr_007_4E3E:
    add  hl, bc                                   ; $4E3E: $09
    cp   [hl]                                     ; $4E3F: $BE
    jr   nz, jr_007_4E89                          ; $4E40: $20 $47

    ld   a, [$D204]                               ; $4E42: $FA $04 $D2
    ld   e, a                                     ; $4E45: $5F
    ld   d, b                                     ; $4E46: $50
    ld   hl, wEntitiesDirectionTable              ; $4E47: $21 $80 $C3
    add  hl, de                                   ; $4E4A: $19
    ld   a, [hl]                                  ; $4E4B: $7E
    ld   e, a                                     ; $4E4C: $5F
    ld   hl, wEntitiesUnknowTableY                ; $4E4D: $21 $D0 $C3
    add  hl, bc                                   ; $4E50: $09
    rla                                           ; $4E51: $17
    rla                                           ; $4E52: $17
    and  $FC                                      ; $4E53: $E6 $FC
    add  e                                        ; $4E55: $83
    add  e                                        ; $4E56: $83
    add  [hl]                                     ; $4E57: $86
    ld   e, a                                     ; $4E58: $5F
    ld   d, b                                     ; $4E59: $50
    ldh  a, [hLinkPositionX]                      ; $4E5A: $F0 $98
    push af                                       ; $4E5C: $F5
    ldh  a, [hLinkPositionY]                      ; $4E5D: $F0 $99
    push af                                       ; $4E5F: $F5
    push bc                                       ; $4E60: $C5
    ld   a, [$D204]                               ; $4E61: $FA $04 $D2
    ld   c, a                                     ; $4E64: $4F
    ld   hl, Data_007_4DF5                        ; $4E65: $21 $F5 $4D
    add  hl, de                                   ; $4E68: $19
    ld   a, [hl]                                  ; $4E69: $7E
    ld   hl, wEntitiesPosXTable                   ; $4E6A: $21 $00 $C2
    add  hl, bc                                   ; $4E6D: $09
    add  [hl]                                     ; $4E6E: $86
    ldh  [hLinkPositionX], a                      ; $4E6F: $E0 $98
    ld   hl, Data_007_4E0D                        ; $4E71: $21 $0D $4E
    add  hl, de                                   ; $4E74: $19
    ld   a, [hl]                                  ; $4E75: $7E
    ld   hl, wEntitiesPosYTable                   ; $4E76: $21 $10 $C2
    add  hl, bc                                   ; $4E79: $09
    add  [hl]                                     ; $4E7A: $86
    ldh  [hLinkPositionY], a                      ; $4E7B: $E0 $99
    pop  bc                                       ; $4E7D: $C1
    ld   a, $24                                   ; $4E7E: $3E $24
    call ApplyVectorTowardsLink_trampoline        ; $4E80: $CD $AA $3B
    pop  af                                       ; $4E83: $F1
    ldh  [hLinkPositionY], a                      ; $4E84: $E0 $99
    pop  af                                       ; $4E86: $F1
    ldh  [hLinkPositionX], a                      ; $4E87: $E0 $98

jr_007_4E89:
    jp   func_007_7E0A                            ; $4E89: $C3 $0A $7E

func_007_4E8C::
    ret                                           ; $4E8C: $C9

; Tarin picking up the honeycomb
Data_007_4E8D::
    db   $5A, $22, $58, $22, $5E, $22, $5C, $22, $58, $02, $5A, $02, $5C, $02, $5E, $02
    db   $54, $02, $56, $02, $56, $22, $54, $22, $50, $02, $52, $02, $52, $22, $50, $22
    db   $74, $02, $76, $02

TarinEntityHandler::
    ld   a, c                                     ; $4EB1: $79
    ld   [$D204], a                               ; $4EB2: $EA $04 $D2
    ld   hl, wEntitiesUnknowTableR                ; $4EB5: $21 $90 $C3
    add  hl, bc                                   ; $4EB8: $09
    ld   a, [hl]                                  ; $4EB9: $7E
    and  a                                        ; $4EBA: $A7
    jr   nz, jr_007_4EC5                          ; $4EBB: $20 $08

    inc  [hl]                                     ; $4EBD: $34
    ldh  a, [hRoomStatus]                         ; $4EBE: $F0 $F8
    and  $40                                      ; $4EC0: $E6 $40
    jp   nz, func_007_7EA4                        ; $4EC2: $C2 $A4 $7E

jr_007_4EC5:
    ld   a, [wHasInstrument3]                     ; $4EC5: $FA $67 $DB
    and  $02                                      ; $4EC8: $E6 $02
    jp   z, func_007_7EA4                         ; $4ECA: $CA $A4 $7E

    ld   de, Data_007_4E8D                        ; $4ECD: $11 $8D $4E
    call RenderActiveEntitySpritesPair            ; $4ED0: $CD $C0 $3B
    call func_007_7D96                            ; $4ED3: $CD $96 $7D
    call func_007_7E43                            ; $4ED6: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $4ED9: $21 $20 $C3
    add  hl, bc                                   ; $4EDC: $09
    dec  [hl]                                     ; $4EDD: $35
    dec  [hl]                                     ; $4EDE: $35
    ld   hl, wEntitiesPosZTable                   ; $4EDF: $21 $10 $C3
    add  hl, bc                                   ; $4EE2: $09
    ld   a, [hl]                                  ; $4EE3: $7E
    and  $80                                      ; $4EE4: $E6 $80
    jr   z, jr_007_4EEE                           ; $4EE6: $28 $06

    ld   [hl], b                                  ; $4EE8: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4EE9: $21 $20 $C3
    add  hl, bc                                   ; $4EEC: $09
    ld   [hl], b                                  ; $4EED: $70

jr_007_4EEE:
    ldh  a, [hActiveEntityState]                  ; $4EEE: $F0 $F0
    JP_TABLE                                      ; $4EF0
._00 dw func_007_4EFF                             ; $4EF1
._01 dw func_007_4F1F                             ; $4EF3
._02 dw func_007_4F56                             ; $4EF5
._03 dw func_007_4FC6                             ; $4EF7
._04 dw func_007_504E                             ; $4EF9
._05 dw func_007_50B4                             ; $4EFB
._06 dw func_007_50E3                             ; $4EFD

func_007_4EFF::
    ld   a, $02                                   ; $4EFF: $3E $02
    call SetEntitySpriteVariant                   ; $4F01: $CD $0C $3B
    ld   hl, wEntitiesPosXTable                   ; $4F04: $21 $00 $C2
    add  hl, bc                                   ; $4F07: $09
    ld   [hl], $60                                ; $4F08: $36 $60
    ld   hl, wEntitiesPosYTable                   ; $4F0A: $21 $10 $C2
    add  hl, bc                                   ; $4F0D: $09
    ld   [hl], $58                                ; $4F0E: $36 $58
    call func_007_7CF0                            ; $4F10: $CD $F0 $7C
    call func_007_7D43                            ; $4F13: $CD $43 $7D
    ret  nc                                       ; $4F16: $D0

    call_open_dialog $1C0                         ; $4F17
    jp   IncrementEntityState                     ; $4F1C: $C3 $12 $3B

func_007_4F1F::
    call func_007_7CF0                            ; $4F1F: $CD $F0 $7C
    ld   a, [wDialogState]                        ; $4F22: $FA $9F $C1
    and  a                                        ; $4F25: $A7
    jr   nz, jr_007_4F4D                          ; $4F26: $20 $25

    ld   a, [wC177]                               ; $4F28: $FA $77 $C1
    and  a                                        ; $4F2B: $A7
    jr   nz, jr_007_4F44                          ; $4F2C: $20 $16

    ld   a, $02                                   ; $4F2E: $3E $02
    ld   [$DB7F], a                               ; $4F30: $EA $7F $DB
    ld   hl, wOverworldRoomStatus + $87                                ; $4F33: $21 $87 $D8
    set  6, [hl]                                  ; $4F36: $CB $F6
    call GetEntityTransitionCountdown             ; $4F38: $CD $05 $0C
    ld   [hl], $A0                                ; $4F3B: $36 $A0
    ld   a, JINGLE_TREASURE_FOUND                 ; $4F3D: $3E $01
    ldh  [hJingle], a                             ; $4F3F: $E0 $F2
    jp   IncrementEntityState                     ; $4F41: $C3 $12 $3B

jr_007_4F44:
    call_open_dialog $1C2                         ; $4F44
    call IncrementEntityState                     ; $4F49: $CD $12 $3B
    ld   [hl], b                                  ; $4F4C: $70

jr_007_4F4D:
    ret                                           ; $4F4D: $C9

Data_007_4F4E::
    db   $78, $01, $FF, $00, $7A, $01, $7C, $01

func_007_4F56::
    ld   a, $01                                   ; $4F56: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4F58: $E0 $A1
    ld   [wC167], a                               ; $4F5A: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $4F5D: $CD $05 $0C
    cp   $30                                      ; $4F60: $FE $30
    jr   c, jr_007_4F7B                           ; $4F62: $38 $17

    xor  a                                        ; $4F64: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4F65: $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ; $4F67: $F0 $EC
    sub  $10                                      ; $4F69: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $4F6B: $E0 $EC
    ld   de, Data_007_4F4E                        ; $4F6D: $11 $4E $4F
    call RenderActiveEntitySpritesPair            ; $4F70: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4F73: $CD $8A $3D
    ld   a, $08                                   ; $4F76: $3E $08
    jp   SetEntitySpriteVariant                   ; $4F78: $C3 $0C $3B

; Tarin beehive cutscene related
jr_007_4F7B:
    cp   $18                                      ; $4F7B: $FE $18
    jr   nc, jr_007_4FA5                          ; $4F7D: $30 $26

    ld   a, $02                                   ; $4F7F: $3E $02
    ldh  [hLinkDirection], a                      ; $4F81: $E0 $9E
    ld   hl, wEntitiesSpeedXTable                 ; $4F83: $21 $40 $C2
    add  hl, bc                                   ; $4F86: $09
    ld   [hl], $FE                                ; $4F87: $36 $FE
    call GetEntitySpeedYAddress                   ; $4F89: $CD $05 $40
    ld   [hl], $F4                                ; $4F8C: $36 $F4
    call func_007_7E0A                            ; $4F8E: $CD $0A $7E
    call GetEntityTransitionCountdown             ; $4F91: $CD $05 $0C
    jr   nz, jr_007_4FA5                          ; $4F94: $20 $0F

    ld   a, MUSIC_TARIN_BEEHIVE                   ; $4F96: $3E $34
    ld   [wMusicTrackToPlay], a                   ; $4F98: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $4F9B: $E0 $B0
    call GetEntityTransitionCountdown             ; $4F9D: $CD $05 $0C
    ld   [hl], $C0                                ; $4FA0: $36 $C0
    jp   IncrementEntityState                     ; $4FA2: $C3 $12 $3B

jr_007_4FA5:
    ld   a, $01                                   ; $4FA5: $3E $01
    ldh  [hActiveEntitySpriteVariant], a          ; $4FA7: $E0 $F1
    ldh  a, [hActiveEntityPosX]                   ; $4FA9: $F0 $EE
    sub  $0C                                      ; $4FAB: $D6 $0C
    ldh  [hActiveEntityPosX], a                   ; $4FAD: $E0 $EE
    ld   de, Data_007_4F4E                        ; $4FAF: $11 $4E $4F
    call RenderActiveEntitySpritesPair            ; $4FB2: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4FB5: $CD $8A $3D
    call GetEntityTransitionCountdown             ; $4FB8: $CD $05 $0C
    rra                                           ; $4FBB: $1F
    rra                                           ; $4FBC: $1F
    rra                                           ; $4FBD: $1F
    rra                                           ; $4FBE: $1F
    and  $01                                      ; $4FBF: $E6 $01
    add  $02                                      ; $4FC1: $C6 $02
    jp   SetEntitySpriteVariant                   ; $4FC3: $C3 $0C $3B

func_007_4FC6::
    ld   a, $01                                   ; $4FC6: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4FC8: $E0 $A1
    call GetEntityTransitionCountdown             ; $4FCA: $CD $05 $0C
    jr   nz, jr_007_4FD4                          ; $4FCD: $20 $05

    ld   [hl], $0C                                ; $4FCF: $36 $0C
    call IncrementEntityState                     ; $4FD1: $CD $12 $3B

jr_007_4FD4:
    call GetEntityTransitionCountdown             ; $4FD4: $CD $05 $0C
    cp   $20                                      ; $4FD7: $FE $20
    jr   nz, jr_007_4FE5                          ; $4FD9: $20 $0A

    ld   hl, wEntitiesSpeedZTable                 ; $4FDB: $21 $20 $C3
    add  hl, bc                                   ; $4FDE: $09
    ld   [hl], $18                                ; $4FDF: $36 $18
    call func_007_733F                            ; $4FE1: $CD $3F $73
    xor  a                                        ; $4FE4: $AF

jr_007_4FE5:
    cp   $60                                      ; $4FE5: $FE $60
    jr   nz, jr_007_4FED                          ; $4FE7: $20 $04

    ld   hl, $D202                                ; $4FE9: $21 $02 $D2
    inc  [hl]                                     ; $4FEC: $34

jr_007_4FED:
    cp   $A0                                      ; $4FED: $FE $A0
    jr   nz, jr_007_4FFC                          ; $4FEF: $20 $0B

    ld   a, [$D201]                               ; $4FF1: $FA $01 $D2
    ld   e, a                                     ; $4FF4: $5F
    ld   d, b                                     ; $4FF5: $50
    ld   hl, wEntitiesTransitionCountdownTable    ; $4FF6: $21 $E0 $C2
    add  hl, de                                   ; $4FF9: $19
    ld   [hl], $A0                                ; $4FFA: $36 $A0

jr_007_4FFC:
    and  $20                                      ; $4FFC: $E6 $20
    jr   z, jr_007_5012                           ; $4FFE: $28 $12

    ld   a, $01                                   ; $5000: $3E $01
    ldh  [hActiveEntitySpriteVariant], a          ; $5002: $E0 $F1
    ldh  a, [hActiveEntityPosX]                   ; $5004: $F0 $EE
    sub  $0E                                      ; $5006: $D6 $0E
    ldh  [hActiveEntityPosX], a                   ; $5008: $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ; $500A: $F0 $EC
    sub  $08                                      ; $500C: $D6 $08
    ldh  [hActiveEntityVisualPosY], a             ; $500E: $E0 $EC
    jr   jr_007_501B                              ; $5010: $18 $09

jr_007_5012:
    xor  a                                        ; $5012: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $5013: $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ; $5015: $F0 $EC
    sub  $10                                      ; $5017: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $5019: $E0 $EC

jr_007_501B:
    ld   de, Data_007_4F4E                        ; $501B: $11 $4E $4F
    call RenderActiveEntitySpritesPair            ; $501E: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $5021: $CD $8A $3D
    call GetEntityTransitionCountdown             ; $5024: $CD $05 $0C
    ld   e, $02                                   ; $5027: $1E $02
    and  $20                                      ; $5029: $E6 $20
    jr   z, jr_007_502E                           ; $502B: $28 $01

    inc  e                                        ; $502D: $1C

jr_007_502E:
    ld   a, e                                     ; $502E: $7B
    jp   SetEntitySpriteVariant                   ; $502F: $C3 $0C $3B

Data_007_5032::
    db   $20, $00, $E0, $00

Data_007_5036::
    db   $00, $E0, $00, $20

Data_007_503A::
    db   $00, $02, $01

Data_007_503D::
    db   $03, $16, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28

Data_007_504A::
    db   $00, $02, $04, $06

func_007_504E::
    ld   a, $01                                   ; $504E: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5050: $E0 $A1
    call GetEntityTransitionCountdown             ; $5052: $CD $05 $0C
    jr   nz, jr_007_506E                          ; $5055: $20 $17

    ld   hl, wEntitiesUnknowTableY                ; $5057: $21 $D0 $C3
    add  hl, bc                                   ; $505A: $09
    ld   a, [hl]                                  ; $505B: $7E
    inc  a                                        ; $505C: $3C
    ld   [hl], a                                  ; $505D: $77
    cp   $0B                                      ; $505E: $FE $0B
    jp   z, IncrementEntityState                  ; $5060: $CA $12 $3B

    ld   e, a                                     ; $5063: $5F
    ld   d, b                                     ; $5064: $50
    ld   hl, Data_007_503D                        ; $5065: $21 $3D $50
    add  hl, de                                   ; $5068: $19

jr_007_5069:
    ld   e, [hl]                                  ; $5069: $5E
    call GetEntityTransitionCountdown             ; $506A: $CD $05 $0C

jr_007_506D:
    ld   [hl], e                                  ; $506D: $73

jr_007_506E:
    ld   hl, wEntitiesUnknowTableY                ; $506E: $21 $D0 $C3

jr_007_5071:
    add  hl, bc                                   ; $5071: $09
    ld   a, [hl]                                  ; $5072: $7E
    and  $03                                      ; $5073: $E6 $03
    ld   e, a                                     ; $5075: $5F
    ld   d, b                                     ; $5076: $50
    ld   hl, Data_007_5032                        ; $5077: $21 $32 $50
    add  hl, de                                   ; $507A: $19
    ld   a, [hl]                                  ; $507B: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $507C: $21 $40 $C2
    add  hl, bc                                   ; $507F: $09
    ld   [hl], a                                  ; $5080: $77
    ld   hl, Data_007_5036                        ; $5081: $21 $36 $50
    add  hl, de                                   ; $5084: $19
    ld   a, [hl]                                  ; $5085: $7E
    call GetEntitySpeedYAddress                   ; $5086: $CD $05 $40
    ld   [hl], a                                  ; $5089: $77
    ld   hl, Data_007_503A                        ; $508A: $21 $3A $50
    add  hl, de                                   ; $508D: $19
    ld   a, [hl]                                  ; $508E: $7E
    ld   hl, wEntitiesDirectionTable              ; $508F: $21 $80 $C3
    add  hl, bc                                   ; $5092: $09
    ld   [hl], a                                  ; $5093: $77
    call func_007_7E7D                            ; $5094: $CD $7D $7E
    ld   a, e                                     ; $5097: $7B
    xor  $01                                      ; $5098: $EE $01

jr_007_509A:
    ldh  [hLinkDirection], a                      ; $509A: $E0 $9E
    call func_007_7E0A                            ; $509C: $CD $0A $7E
    ld   hl, wEntitiesDirectionTable              ; $509F: $21 $80 $C3
    add  hl, bc                                   ; $50A2: $09
    ld   e, [hl]                                  ; $50A3: $5E
    ld   d, b                                     ; $50A4: $50
    ld   hl, Data_007_504A                        ; $50A5: $21 $4A $50
    add  hl, de                                   ; $50A8: $19
    ldh  a, [hFrameCounter]                       ; $50A9: $F0 $E7
    rra                                           ; $50AB: $1F
    rra                                           ; $50AC: $1F
    rra                                           ; $50AD: $1F
    and  $01                                      ; $50AE: $E6 $01
    or   [hl]                                     ; $50B0: $B6
    jp   SetEntitySpriteVariant                   ; $50B1: $C3 $0C $3B

func_007_50B4::
    ld   a, $01                                   ; $50B4: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $50B6: $E0 $A1
    ld   hl, wEntitiesDirectionTable              ; $50B8: $21 $80 $C3
    add  hl, bc                                   ; $50BB: $09
    ld   a, $01                                   ; $50BC: $3E $01
    ld   [hl], a                                  ; $50BE: $77
    ld   hl, wEntitiesSpeedXTable                 ; $50BF: $21 $40 $C2
    add  hl, bc                                   ; $50C2: $09
    ld   [hl], $E4                                ; $50C3: $36 $E4
    call GetEntitySpeedYAddress                   ; $50C5: $CD $05 $40
    ld   [hl], $08                                ; $50C8: $36 $08
    call func_007_7E0A                            ; $50CA: $CD $0A $7E
    ldh  a, [hActiveEntityPosX]                   ; $50CD: $F0 $EE
    cp   $C0                                      ; $50CF: $FE $C0
    jr   c, label_007_50DF                        ; $50D1: $38 $0C

    cp   $C4                                      ; $50D3: $FE $C4
    jp   nc, label_007_50DF                       ; $50D5: $D2 $DF $50

    xor  a                                        ; $50D8: $AF
    ld   [wC167], a                               ; $50D9: $EA $67 $C1
    call IncrementEntityState                     ; $50DC: $CD $12 $3B

label_007_50DF:
    ld   a, $01                                   ; $50DF: $3E $01
    jr   jr_007_509A                              ; $50E1: $18 $B7

func_007_50E3::
    ld   a, [$D201]                               ; $50E3: $FA $01 $D2
    ld   e, a                                     ; $50E6: $5F
    ld   d, b                                     ; $50E7: $50
    ld   hl, wEntitiesStateTable                  ; $50E8: $21 $90 $C2
    add  hl, de                                   ; $50EB: $19
    inc  [hl]                                     ; $50EC: $34
    ld   hl, wEntitiesTransitionCountdownTable    ; $50ED: $21 $E0 $C2
    add  hl, de                                   ; $50F0: $19
    ld   [hl], $50                                ; $50F1: $36 $50
    ld   hl, wEntitiesPosYTable                   ; $50F3: $21 $10 $C2
    add  hl, de                                   ; $50F6: $19
    ld   a, [hl]                                  ; $50F7: $7E
    add  $10                                      ; $50F8: $C6 $10
    ld   [hl], a                                  ; $50FA: $77
    ld   hl, wEntitiesPosZTable                   ; $50FB: $21 $10 $C3
    add  hl, de                                   ; $50FE: $19
    ld   [hl], $10                                ; $50FF: $36 $10
    jp   func_007_7EA4                            ; $5101: $C3 $A4 $7E

Data_007_5104::
    db   $40, $02, $40, $22, $42, $02, $42, $22

HoleFillerEntityHandler::
    ld   de, Data_007_5104                        ; $510C: $11 $04 $51
    call RenderActiveEntitySpritesPair            ; $510F: $CD $C0 $3B
    call func_007_7D96                            ; $5112: $CD $96 $7D
    ldh  a, [hFrameCounter]                       ; $5115: $F0 $E7
    rra                                           ; $5117: $1F
    rra                                           ; $5118: $1F
    rra                                           ; $5119: $1F
    rra                                           ; $511A: $1F
    and  $01                                      ; $511B: $E6 $01
    call SetEntitySpriteVariant                   ; $511D: $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ; $5120: $F0 $F0
    JP_TABLE                                      ; $5122
._00 dw func_007_512F                             ; $5123
._01 dw func_007_517C                             ; $5125

Data_007_5127::
    db   $08, $F8, $00, $00

Data_007_512B::
    db   $00, $00, $F8, $08

func_007_512F::
    call func_007_7CF0                            ; $512F: $CD $F0 $7C
    jr   nc, jr_007_516E                          ; $5132: $30 $3A

    ldh  a, [hPressedButtonsMask]                 ; $5134: $F0 $CB
    and  $0F                                      ; $5136: $E6 $0F
    jr   z, jr_007_516E                           ; $5138: $28 $34

    ld   a, $01                                   ; $513A: $3E $01
    ld   [wIsLinkPushing], a                               ; $513C: $EA $44 $C1
    ld   hl, wEntitiesUnknowTableY                ; $513F: $21 $D0 $C3
    add  hl, bc                                   ; $5142: $09
    ld   a, [hl]                                  ; $5143: $7E
    inc  a                                        ; $5144: $3C
    ld   [hl], a                                  ; $5145: $77
    cp   $10                                      ; $5146: $FE $10
    jr   nz, jr_007_5173                          ; $5148: $20 $29

    call IncrementEntityState                     ; $514A: $CD $12 $3B
    call func_007_7E7D                            ; $514D: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $5150: $21 $80 $C3
    add  hl, bc                                   ; $5153: $09
    ld   a, e                                     ; $5154: $7B
    xor  $01                                      ; $5155: $EE $01
    ld   e, a                                     ; $5157: $5F
    ld   [hl], e                                  ; $5158: $73

func_007_5159::
    ld   d, b                                     ; $5159: $50
    ld   hl, Data_007_5127                        ; $515A: $21 $27 $51
    add  hl, de                                   ; $515D: $19
    ld   a, [hl]                                  ; $515E: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $515F: $21 $40 $C2
    add  hl, bc                                   ; $5162: $09
    ld   [hl], a                                  ; $5163: $77
    ld   hl, Data_007_512B                        ; $5164: $21 $2B $51
    add  hl, de                                   ; $5167: $19
    ld   a, [hl]                                  ; $5168: $7E
    call GetEntitySpeedYAddress                   ; $5169: $CD $05 $40
    ld   [hl], a                                  ; $516C: $77
    ret                                           ; $516D: $C9

jr_007_516E:
    ld   hl, wEntitiesUnknowTableY                ; $516E: $21 $D0 $C3
    add  hl, bc                                   ; $5171: $09
    ld   [hl], b                                  ; $5172: $70

jr_007_5173:
    ret                                           ; $5173: $C9

Data_007_5174::
    db   $10, $F0, $00, $00

Data_007_5178::
    db   $00, $00, $F0, $10

func_007_517C::
    ld   a, $01                                   ; $517C: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $517E: $E0 $A1
    ld   a, JINGLE_URCHIN_PUSH                    ; $5180: $3E $3E
    ldh  [hJingle], a                             ; $5182: $E0 $F2
    ldh  a, [hJoypadState]                        ; $5184: $F0 $CC
    and  $0F                                      ; $5186: $E6 $0F
    ld   d, a                                     ; $5188: $57
    jr   z, jr_007_51AA                           ; $5189: $28 $1F

    and  $03                                      ; $518B: $E6 $03
    jr   z, jr_007_5198                           ; $518D: $28 $09

    ld   e, $00                                   ; $518F: $1E $00
    and  $01                                      ; $5191: $E6 $01
    jr   nz, jr_007_5196                          ; $5193: $20 $01

    inc  e                                        ; $5195: $1C

jr_007_5196:
    jr   jr_007_519F                              ; $5196: $18 $07

jr_007_5198:
    ld   e, $02                                   ; $5198: $1E $02
    bit  2, d                                     ; $519A: $CB $52
    jr   nz, jr_007_519F                          ; $519C: $20 $01

    inc  e                                        ; $519E: $1C

jr_007_519F:
    ld   hl, wEntitiesDirectionTable              ; $519F: $21 $80 $C3
    add  hl, bc                                   ; $51A2: $09
    ld   a, [hl]                                  ; $51A3: $7E
    xor  e                                        ; $51A4: $AB
    cp   $01                                      ; $51A5: $FE $01
    jr   z, jr_007_51AA                           ; $51A7: $28 $01

    ld   [hl], e                                  ; $51A9: $73

jr_007_51AA:
    call func_007_7E0A                            ; $51AA: $CD $0A $7E
    ld   hl, wEntitiesPosXTable                   ; $51AD: $21 $00 $C2
    add  hl, bc                                   ; $51B0: $09
    ld   a, [hl]                                  ; $51B1: $7E
    sub  $08                                      ; $51B2: $D6 $08
    ld   hl, wEntitiesPosYTable                   ; $51B4: $21 $10 $C2
    add  hl, bc                                   ; $51B7: $09
    or   [hl]                                     ; $51B8: $B6
    and  $0F                                      ; $51B9: $E6 $0F
    jp   nz, jr_007_529F                          ; $51BB: $C2 $9F $52

    ld   a, [hl]                                  ; $51BE: $7E
    sub  $10                                      ; $51BF: $D6 $10
    ldh  [hSwordIntersectedAreaY], a              ; $51C1: $E0 $CD
    ld   hl, wEntitiesPosXTable                   ; $51C3: $21 $00 $C2
    add  hl, bc                                   ; $51C6: $09
    ld   a, [hl]                                  ; $51C7: $7E
    sub  $08                                      ; $51C8: $D6 $08
    ldh  [hSwordIntersectedAreaX], a              ; $51CA: $E0 $CE
    swap a                                        ; $51CC: $CB $37
    and  $0F                                      ; $51CE: $E6 $0F
    ld   e, a                                     ; $51D0: $5F
    ldh  a, [hSwordIntersectedAreaY]              ; $51D1: $F0 $CD
    and  $F0                                      ; $51D3: $E6 $F0
    or   e                                        ; $51D5: $B3
    ld   e, a                                     ; $51D6: $5F
    ld   d, b                                     ; $51D7: $50
    ld   hl, wRoomObjects                         ; $51D8: $21 $11 $D7
    add  hl, de                                   ; $51DB: $19
    ld   [hl], $0D                                ; $51DC: $36 $0D
    call label_2887                               ; $51DE: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $51E1: $F0 $FE
    and  a                                        ; $51E3: $A7
    jr   z, jr_007_51F2                           ; $51E4: $28 $0C

    push bc                                       ; $51E6: $C5
    ld   a, $0D                                   ; $51E7: $3E $0D
    ld   [$DDD8], a                               ; $51E9: $EA $D8 $DD
    ld   a, $07                                   ; $51EC: $3E $07
    call func_91D                                ; $51EE: $CD $1D $09
    pop  bc                                       ; $51F1: $C1

jr_007_51F2:
    ld   hl, wRequestDestinationHigh              ; $51F2: $21 $01 $D6
    ld   a, [wRequests]                           ; $51F5: $FA $00 $D6
    ld   e, a                                     ; $51F8: $5F
    add  $0A                                      ; $51F9: $C6 $0A
    ld   [wRequests], a                           ; $51FB: $EA $00 $D6
    ld   d, $00                                   ; $51FE: $16 $00
    add  hl, de                                   ; $5200: $19
    ldh  a, [$FFCF]                               ; $5201: $F0 $CF
    ld   [hl+], a                                 ; $5203: $22
    ldh  a, [$FFD0]                               ; $5204: $F0 $D0
    ld   [hl+], a                                 ; $5206: $22
    ld   a, $81                                   ; $5207: $3E $81
    ld   [hl+], a                                 ; $5209: $22
    ld   a, $10                                   ; $520A: $3E $10
    ld   [hl+], a                                 ; $520C: $22
    ld   a, $12                                   ; $520D: $3E $12
    ld   [hl+], a                                 ; $520F: $22
    ldh  a, [$FFCF]                               ; $5210: $F0 $CF
    ld   [hl+], a                                 ; $5212: $22
    ldh  a, [$FFD0]                               ; $5213: $F0 $D0
    inc  a                                        ; $5215: $3C
    ld   [hl+], a                                 ; $5216: $22
    ld   a, $81                                   ; $5217: $3E $81
    ld   [hl+], a                                 ; $5219: $22
    ld   a, $11                                   ; $521A: $3E $11
    ld   [hl+], a                                 ; $521C: $22
    ld   a, $13                                   ; $521D: $3E $13
    ld   [hl+], a                                 ; $521F: $22
    ld   [hl], b                                  ; $5220: $70
    ld   hl, wEntitiesDirectionTable              ; $5221: $21 $80 $C3
    add  hl, bc                                   ; $5224: $09
    ld   e, [hl]                                  ; $5225: $5E
    call func_007_5159                            ; $5226: $CD $59 $51
    ld   hl, wEntitiesDirectionTable              ; $5229: $21 $80 $C3
    add  hl, bc                                   ; $522C: $09
    ld   e, [hl]                                  ; $522D: $5E
    ld   d, b                                     ; $522E: $50
    ld   hl, Data_007_5174                        ; $522F: $21 $74 $51
    add  hl, de                                   ; $5232: $19
    ldh  a, [hSwordIntersectedAreaX]              ; $5233: $F0 $CE
    add  [hl]                                     ; $5235: $86
    swap a                                        ; $5236: $CB $37
    and  $0F                                      ; $5238: $E6 $0F
    push af                                       ; $523A: $F5
    ld   hl, Data_007_5178                        ; $523B: $21 $78 $51
    add  hl, de                                   ; $523E: $19
    pop  af                                       ; $523F: $F1
    ld   e, a                                     ; $5240: $5F
    ldh  a, [hSwordIntersectedAreaY]              ; $5241: $F0 $CD
    add  [hl]                                     ; $5243: $86
    and  $F0                                      ; $5244: $E6 $F0
    or   e                                        ; $5246: $B3
    ld   e, a                                     ; $5247: $5F
    ld   d, b                                     ; $5248: $50
    ld   hl, wRoomObjects                         ; $5249: $21 $11 $D7
    add  hl, de                                   ; $524C: $19
    ld   e, [hl]                                  ; $524D: $5E
    ld   d, $01                                   ; $524E: $16 $01
    call GetObjectPhysicsFlags_trampoline         ; $5250: $CD $26 $2A
    cp   $0B                                      ; $5253: $FE $0B
    jr   z, jr_007_529F                           ; $5255: $28 $48

    cp   $50                                      ; $5257: $FE $50
    jr   z, jr_007_529F                           ; $5259: $28 $44

    cp   $51                                      ; $525B: $FE $51
    jr   z, jr_007_529F                           ; $525D: $28 $40

    ldh  a, [hActiveEntityPosX]                   ; $525F: $F0 $EE
    ldh  [hScratch0], a                           ; $5261: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $5263: $F0 $EC
    ldh  [hScratch1], a                           ; $5265: $E0 $D8
    ld   a, JINGLE_POOF                           ; $5267: $3E $2F
    ldh  [hJingle], a                             ; $5269: $E0 $F2
    ld   a, TRANSCIENT_VFX_POOF                   ; $526B: $3E $02
    call AddTranscientVfx                         ; $526D: $CD $C7 $0C
    ld   hl, wTranscientVfxCountdownTable                                ; $5270: $21 $20 $C5
    add  hl, de                                   ; $5273: $19
    ld   [hl], $0F                                ; $5274: $36 $0F
    call func_007_7EA4                            ; $5276: $CD $A4 $7E
    ld   a, [wRoomEvent]                          ; $5279: $FA $8E $C1
    and  $0F                                      ; $527C: $E6 $0F
    cp   TRIGGER_FILL_LAVA_GAPS                   ; $527E: $FE $0E
    jr   nz, jr_007_529F                          ; $5280: $20 $1D

    push bc                                       ; $5282: $C5
    ld   c, b                                     ; $5283: $48
    ld   hl, wRoomObjectsArea                     ; $5284: $21 $00 $D7

jr_007_5287:
    ld   a, [hl+]                                 ; $5287: $2A
    push hl                                       ; $5288: $E5
    ld   e, a                                     ; $5289: $5F
    ld   d, $01                                   ; $528A: $16 $01
    call GetObjectPhysicsFlags_trampoline         ; $528C: $CD $26 $2A
    pop  hl                                       ; $528F: $E1
    cp   $50                                      ; $5290: $FE $50
    jr   z, jr_007_529E                           ; $5292: $28 $0A

    cp   $51                                      ; $5294: $FE $51
    jr   z, jr_007_529E                           ; $5296: $28 $06

    dec  c                                        ; $5298: $0D
    jr   nz, jr_007_5287                          ; $5299: $20 $EC

    call MarkTriggerAsResolved                    ; $529B: $CD $60 $0C

jr_007_529E:
    pop  bc                                       ; $529E: $C1

jr_007_529F:
    ret                                           ; $529F: $C9

Data_007_52A0::
    db   $00, $00, $01, $01, $01, $02, $02, $02, $00, $00, $0F, $0F, $0F, $0E, $0E, $0E
    db   $08, $08, $07, $07, $07, $06, $06, $06, $08, $08, $09, $09, $09, $0A, $0A, $0A

Data_007_52C0::
    db   $04, $04, $03, $03, $03, $02, $02, $02, $0C, $0C, $0D, $0D, $0D, $0E, $0E, $0E
    db   $04, $04, $05, $05, $05, $06, $06, $06, $0C, $0C, $0B, $0B, $0B, $0A, $0A, $0A

func_007_52E0::
    ldh  a, [hScratch0]                           ; $52E0: $F0 $D7
    rlca                                          ; $52E2: $07
    and  $01                                      ; $52E3: $E6 $01
    ld   e, a                                     ; $52E5: $5F
    ldh  a, [hScratch1]                           ; $52E6: $F0 $D8
    rlca                                          ; $52E8: $07
    rla                                           ; $52E9: $17
    and  $02                                      ; $52EA: $E6 $02
    or   e                                        ; $52EC: $B3
    rla                                           ; $52ED: $17
    rla                                           ; $52EE: $17
    rla                                           ; $52EF: $17
    and  $18                                      ; $52F0: $E6 $18
    ld   h, a                                     ; $52F2: $67
    ldh  a, [hScratch1]                           ; $52F3: $F0 $D8
    bit  7, a                                     ; $52F5: $CB $7F
    jr   z, jr_007_52FB                           ; $52F7: $28 $02

    cpl                                           ; $52F9: $2F
    inc  a                                        ; $52FA: $3C

jr_007_52FB:
    ld   d, a                                     ; $52FB: $57
    ldh  a, [hScratch0]                           ; $52FC: $F0 $D7
    bit  7, a                                     ; $52FE: $CB $7F
    jr   z, jr_007_5304                           ; $5300: $28 $02

    cpl                                           ; $5302: $2F
    inc  a                                        ; $5303: $3C

jr_007_5304:
    cp   d                                        ; $5304: $BA
    jr   nc, jr_007_5314                          ; $5305: $30 $0D

    sra  a                                        ; $5307: $CB $2F
    sra  a                                        ; $5309: $CB $2F
    add  h                                        ; $530B: $84
    ld   e, a                                     ; $530C: $5F
    ld   d, b                                     ; $530D: $50
    ld   hl, Data_007_52A0                        ; $530E: $21 $A0 $52
    add  hl, de                                   ; $5311: $19
    ld   a, [hl]                                  ; $5312: $7E
    ret                                           ; $5313: $C9

jr_007_5314:
    ld   a, d                                     ; $5314: $7A
    sra  a                                        ; $5315: $CB $2F
    sra  a                                        ; $5317: $CB $2F
    add  h                                        ; $5319: $84
    ld   e, a                                     ; $531A: $5F
    ld   d, b                                     ; $531B: $50
    ld   hl, Data_007_52C0                        ; $531C: $21 $C0 $52
    add  hl, de                                   ; $531F: $19
    ld   a, [hl]                                  ; $5320: $7E
    ret                                           ; $5321: $C9

PincerEntityHandler::
    ld   hl, wEntitiesUnknowTableI                ; $5322: $21 $70 $C4
    add  hl, bc                                   ; $5325: $09
    ld   [hl], b                                  ; $5326: $70
    ld   hl, $C3F0                                ; $5327: $21 $F0 $C3
    add  hl, bc                                   ; $532A: $09
    ld   [hl], b                                  ; $532B: $70
    ld   hl, wEntitiesUnknowTableS                ; $532C: $21 $00 $C4
    add  hl, bc                                   ; $532F: $09
    ld   [hl], b                                  ; $5330: $70
    call func_007_5453                            ; $5331: $CD $53 $54
    call func_007_7D96                            ; $5334: $CD $96 $7D
    call DecrementEntityIgnoreHitsCountdown       ; $5337: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $533A: $F0 $F0
    JP_TABLE                                      ; $533C
._00 dw func_007_5349                             ; $533D
._01 dw func_007_535A                             ; $533F
._02 dw func_007_5383                             ; $5341
._03 dw func_007_53BD                             ; $5343
._04 dw func_007_53CD                             ; $5345
._05 dw func_007_53D8                             ; $5347

func_007_5349::
    ldh  a, [hActiveEntityPosX]                   ; $5349: $F0 $EE
    ld   hl, wEntitiesPrivateState1Table          ; $534B: $21 $B0 $C2
    add  hl, bc                                   ; $534E: $09
    ld   [hl], a                                  ; $534F: $77
    ldh  a, [hActiveEntityPosY]                   ; $5350: $F0 $EF
    ld   hl, wEntitiesPrivateState2Table          ; $5352: $21 $C0 $C2
    add  hl, bc                                   ; $5355: $09
    ld   [hl], a                                  ; $5356: $77
    jp   IncrementEntityState                     ; $5357: $C3 $12 $3B

func_007_535A::
    call GetEntityTransitionCountdown             ; $535A: $CD $05 $0C
    jr   nz, jr_007_537F                          ; $535D: $20 $20

    ld   hl, wEntitiesPhysicsFlagsTable           ; $535F: $21 $40 $C3
    add  hl, bc                                   ; $5362: $09
    set  6, [hl]                                  ; $5363: $CB $F6
    call func_007_7E5D                            ; $5365: $CD $5D $7E
    add  $20                                      ; $5368: $C6 $20
    cp   $40                                      ; $536A: $FE $40
    jr   nc, jr_007_537F                          ; $536C: $30 $11

    call func_007_7E6D                            ; $536E: $CD $6D $7E
    add  $20                                      ; $5371: $C6 $20
    cp   $40                                      ; $5373: $FE $40
    jr   nc, jr_007_537F                          ; $5375: $30 $08

    call GetEntityTransitionCountdown             ; $5377: $CD $05 $0C
    ld   [hl], $30                                ; $537A: $36 $30
    call IncrementEntityState                     ; $537C: $CD $12 $3B

jr_007_537F:
    xor  a                                        ; $537F: $AF
    jp   SetEntitySpriteVariant                   ; $5380: $C3 $0C $3B

func_007_5383::
    call GetEntityTransitionCountdown             ; $5383: $CD $05 $0C
    jr   nz, jr_007_539E                          ; $5386: $20 $16

    ld   hl, wEntitiesUnknownTableD               ; $5388: $21 $D0 $C2
    add  hl, bc                                   ; $538B: $09
    ld   a, [hl]                                  ; $538C: $7E
    call SetEntitySpriteVariant                   ; $538D: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5390: $CD $05 $0C
    ld   [hl], $18                                ; $5393: $36 $18
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5395: $21 $40 $C3
    add  hl, bc                                   ; $5398: $09
    res  6, [hl]                                  ; $5399: $CB $B6
    jp   IncrementEntityState                     ; $539B: $C3 $12 $3B

jr_007_539E:
    cp   $10                                      ; $539E: $FE $10
    jr   nz, jr_007_53B8                          ; $53A0: $20 $16

    ld   a, $1F                                   ; $53A2: $3E $1F
    call ApplyVectorTowardsLink_trampoline        ; $53A4: $CD $AA $3B
    call func_007_52E0                            ; $53A7: $CD $E0 $52
    sra  a                                        ; $53AA: $CB $2F
    add  $02                                      ; $53AC: $C6 $02
    ld   hl, wEntitiesUnknownTableD               ; $53AE: $21 $D0 $C2
    add  hl, bc                                   ; $53B1: $09
    ld   [hl], a                                  ; $53B2: $77
    ld   a, $18                                   ; $53B3: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $53B5: $CD $AA $3B

jr_007_53B8:
    ld   a, $01                                   ; $53B8: $3E $01
    jp   SetEntitySpriteVariant                   ; $53BA: $C3 $0C $3B

func_007_53BD::
    call func_007_7E0A                            ; $53BD: $CD $0A $7E
    call GetEntityTransitionCountdown             ; $53C0: $CD $05 $0C
    jr   nz, jr_007_53CA                          ; $53C3: $20 $05

    ld   [hl], $20                                ; $53C5: $36 $20
    call IncrementEntityState                     ; $53C7: $CD $12 $3B

jr_007_53CA:
    jp   label_3B39                               ; $53CA: $C3 $39 $3B

func_007_53CD::
    call GetEntityTransitionCountdown             ; $53CD: $CD $05 $0C
    jr   nz, jr_007_53D5                          ; $53D0: $20 $03

    call IncrementEntityState                     ; $53D2: $CD $12 $3B

jr_007_53D5:
    jp   label_3B39                               ; $53D5: $C3 $39 $3B

func_007_53D8::
    ldh  a, [hLinkPositionX]                      ; $53D8: $F0 $98
    push af                                       ; $53DA: $F5
    ldh  a, [hLinkPositionY]                      ; $53DB: $F0 $99
    push af                                       ; $53DD: $F5
    ld   hl, wEntitiesPrivateState1Table          ; $53DE: $21 $B0 $C2
    add  hl, bc                                   ; $53E1: $09
    ld   a, [hl]                                  ; $53E2: $7E
    ldh  [hLinkPositionX], a                      ; $53E3: $E0 $98
    ld   hl, wEntitiesPrivateState2Table          ; $53E5: $21 $C0 $C2
    add  hl, bc                                   ; $53E8: $09
    ld   a, [hl]                                  ; $53E9: $7E
    ldh  [hLinkPositionY], a                      ; $53EA: $E0 $99
    ld   a, $10                                   ; $53EC: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $53EE: $CD $AA $3B
    call func_007_7E5D                            ; $53F1: $CD $5D $7E
    add  $02                                      ; $53F4: $C6 $02
    cp   $04                                      ; $53F6: $FE $04
    jr   nc, jr_007_541F                          ; $53F8: $30 $25

    call func_007_7E6D                            ; $53FA: $CD $6D $7E
    add  $02                                      ; $53FD: $C6 $02
    cp   $04                                      ; $53FF: $FE $04
    jr   nc, jr_007_541F                          ; $5401: $30 $1C

    ld   hl, wEntitiesPosXTable                   ; $5403: $21 $00 $C2
    add  hl, bc                                   ; $5406: $09
    ldh  a, [hLinkPositionX]                      ; $5407: $F0 $98
    ld   [hl], a                                  ; $5409: $77
    ld   hl, wEntitiesPosYTable                   ; $540A: $21 $10 $C2
    add  hl, bc                                   ; $540D: $09
    ldh  a, [hLinkPositionY]                      ; $540E: $F0 $99
    ld   [hl], a                                  ; $5410: $77
    xor  a                                        ; $5411: $AF
    call SetEntitySpriteVariant                   ; $5412: $CD $0C $3B
    call IncrementEntityState                     ; $5415: $CD $12 $3B
    ld   [hl], $01                                ; $5418: $36 $01
    call GetEntityTransitionCountdown             ; $541A: $CD $05 $0C
    ld   [hl], $20                                ; $541D: $36 $20

jr_007_541F:
    pop  af                                       ; $541F: $F1
    ldh  [hLinkPositionY], a                      ; $5420: $E0 $99
    pop  af                                       ; $5422: $F1
    ldh  [hLinkPositionX], a                      ; $5423: $E0 $98
    call func_007_7E0A                            ; $5425: $CD $0A $7E
    jp   label_3B39                               ; $5428: $C3 $39 $3B

Data_007_542B::
    db   $FF, $00, $FF, $20, $6C, $02, $6C, $22, $64, $22, $62, $22, $68, $22, $66, $22
    db   $60, $02, $60, $22, $66, $02, $68, $02, $62, $02, $64, $02, $66, $42, $68, $42
    db   $60, $42, $60, $62, $68, $62, $66, $62

func_007_5453::
    ld   de, Data_007_542B                        ; $5453: $11 $2B $54
    call RenderActiveEntitySpritesPair            ; $5456: $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ; $5459: $F0 $F0
    cp   $03                                      ; $545B: $FE $03
    ret  c                                        ; $545D: $D8

    ldh  a, [hActiveEntityPosX]                   ; $545E: $F0 $EE
    ld   hl, wEntitiesPrivateState1Table          ; $5460: $21 $B0 $C2
    add  hl, bc                                   ; $5463: $09
    sub  [hl]                                     ; $5464: $96
    sra  a                                        ; $5465: $CB $2F
    sra  a                                        ; $5467: $CB $2F
    ldh  [hScratch0], a                           ; $5469: $E0 $D7
    ldh  [hScratch2], a                           ; $546B: $E0 $D9
    ldh  a, [hActiveEntityVisualPosY]             ; $546D: $F0 $EC
    ld   hl, wEntitiesPrivateState2Table          ; $546F: $21 $C0 $C2
    add  hl, bc                                   ; $5472: $09
    sub  [hl]                                     ; $5473: $96
    sra  a                                        ; $5474: $CB $2F
    sra  a                                        ; $5476: $CB $2F
    ldh  [hScratch1], a                           ; $5478: $E0 $D8
    ldh  [hScratch3], a                           ; $547A: $E0 $DA
    ld   a, [wOAMNextAvailableSlot]               ; $547C: $FA $C0 $C3
    ld   e, a                                     ; $547F: $5F
    ld   d, $00                                   ; $5480: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $5482: $21 $30 $C0
    add  hl, de                                   ; $5485: $19
    ld   e, l                                     ; $5486: $5D
    ld   d, h                                     ; $5487: $54
    ld   a, $03                                   ; $5488: $3E $03

jr_007_548A:
    ldh  [hScratch4], a                           ; $548A: $E0 $DB
    ld   hl, wEntitiesPrivateState2Table          ; $548C: $21 $C0 $C2
    add  hl, bc                                   ; $548F: $09
    ldh  a, [hScratch1]                           ; $5490: $F0 $D8
    add  [hl]                                     ; $5492: $86
    ld   [de], a                                  ; $5493: $12
    inc  de                                       ; $5494: $13
    ld   hl, wEntitiesPrivateState1Table          ; $5495: $21 $B0 $C2
    add  hl, bc                                   ; $5498: $09
    ldh  a, [hScratch0]                           ; $5499: $F0 $D7
    add  [hl]                                     ; $549B: $86

jr_007_549C:
    add  $04                                      ; $549C: $C6 $04
    ld   [de], a                                  ; $549E: $12
    inc  de                                       ; $549F: $13
    ld   a, $6A                                   ; $54A0: $3E $6A
    ld   [de], a                                  ; $54A2: $12
    inc  de                                       ; $54A3: $13
    ld   a, $02                                   ; $54A4: $3E $02
    ld   [de], a                                  ; $54A6: $12
    inc  de                                       ; $54A7: $13
    ldh  a, [hScratch0]                           ; $54A8: $F0 $D7
    ld   hl, hScratch2                            ; $54AA: $21 $D9 $FF
    add  [hl]                                     ; $54AD: $86
    ldh  [hScratch0], a                           ; $54AE: $E0 $D7
    ldh  a, [hScratch1]                           ; $54B0: $F0 $D8
    ld   hl, hScratch3                            ; $54B2: $21 $DA $FF
    add  [hl]                                     ; $54B5: $86
    ldh  [hScratch1], a                           ; $54B6: $E0 $D8
    ldh  a, [hScratch4]                           ; $54B8: $F0 $DB
    dec  a                                        ; $54BA: $3D
    jr   nz, jr_007_548A                          ; $54BB: $20 $CD

    ld   a, $03                                   ; $54BD: $3E $03
    jp   label_3DA0

Data_007_54C2::
    db   $44, $29, $82, $CB, $64, $C1, $D0, $74, $6A, $36, $5E, $EC, $F5, $9D

Data_007_54D0::
    db   $9A, $16, $9C, $16

Data_007_54D4::
    db   $74, $00, $76, $00

Data_007_54D8::
    db   $9A, $17, $9C, $17, $9A, $17, $9C, $17, $9A, $17, $9C, $17, $9A, $17, $9C, $17
    db   $9A, $14, $9C, $14, $9A, $14, $9C, $14, $9A, $17, $9C, $17, $9A, $14, $9C, $14
    db   $9A, $17, $9C, $17, $9A, $16, $9C, $16, $9A, $17, $9C, $17, $9A, $16, $9C, $16
    db   $9A, $17, $9C, $17, $9A, $17, $9C, $17

TradingItemEntityHandler::
    ld   a, [wIsIndoor]                           ; $5510: $FA $A5 $DB
    and  a                                        ; $5513: $A7
    jr   nz, jr_007_552E                          ; $5514: $20 $18

    ldh  a, [hMapRoom]                            ; $5516: $F0 $F6
    cp   $6B                                      ; $5518: $FE $6B
    jr   z, jr_007_5528                           ; $551A: $28 $0C

    cp   $7A                                      ; $551C: $FE $7A
    jr   z, jr_007_5528                           ; $551E: $28 $08

    cp   $8B                                      ; $5520: $FE $8B
    jr   z, jr_007_5528                           ; $5522: $28 $04

    cp   $7B                                      ; $5524: $FE $7B
    jr   nz, jr_007_552E                          ; $5526: $20 $06

jr_007_5528:
    ld   a, [wOverworldRoomStatus + $7B]                               ; $5528: $FA $7B $D8
    and  $10                                      ; $552B: $E6 $10
    ret  z                                        ; $552D: $C8

jr_007_552E:
    ldh  a, [hRoomStatus]                         ; $552E: $F0 $F8
    and  $20                                      ; $5530: $E6 $20
    jp   nz, func_007_7EA4                        ; $5532: $C2 $A4 $7E

    ldh  a, [hIsGBC]                              ; $5535: $F0 $FE
    and  a                                        ; $5537: $A7
    jr   z, jr_007_555A                           ; $5538: $28 $20

    ldh  a, [hIsSideScrolling]                    ; $553A: $F0 $F9
    and  a                                        ; $553C: $A7
    jr   z, jr_007_5545                           ; $553D: $28 $06

    ldh  a, [hActiveEntityVisualPosY]             ; $553F: $F0 $EC
    add  $02                                      ; $5541: $C6 $02
    ldh  [hActiveEntityVisualPosY], a             ; $5543: $E0 $EC

jr_007_5545:
    push hl                                       ; $5545: $E5
    ld   de, Data_007_54D8                        ; $5546: $11 $D8 $54
    ld   a, [wTradeSequenceItem]                  ; $5549: $FA $0E $DB
    dec  a                                        ; $554C: $3D
    sla  a                                        ; $554D: $CB $27
    sla  a                                        ; $554F: $CB $27
    ld   l, a                                     ; $5551: $6F
    ld   h, $00                                   ; $5552: $26 $00
    add  hl, de                                   ; $5554: $19
    ld   e, l                                     ; $5555: $5D
    ld   d, h                                     ; $5556: $54
    pop  hl                                       ; $5557: $E1
    jr   jr_007_5572                              ; $5558: $18 $18

jr_007_555A:
    ld   de, Data_007_54D4                        ; $555A: $11 $D4 $54
    ld   a, [wTradeSequenceItem]                  ; $555D: $FA $0E $DB
    cp   $04                                      ; $5560: $FE $04
    jr   z, jr_007_5572                           ; $5562: $28 $0E

    ldh  a, [hIsSideScrolling]                    ; $5564: $F0 $F9
    and  a                                        ; $5566: $A7
    jr   z, jr_007_556F                           ; $5567: $28 $06

    ldh  a, [hActiveEntityVisualPosY]             ; $5569: $F0 $EC
    add  $02                                      ; $556B: $C6 $02
    ldh  [hActiveEntityVisualPosY], a             ; $556D: $E0 $EC

jr_007_556F:
    ld   de, Data_007_54D0                        ; $556F: $11 $D0 $54

jr_007_5572:
    call RenderActiveEntitySpritesPair            ; $5572: $CD $C0 $3B
    call GetEntityTransitionCountdown             ; $5575: $CD $05 $0C
    jr   nz, jr_007_559A                          ; $5578: $20 $20

    call CheckLinkCollisionWithEnemy_trampoline   ; $557A: $CD $5A $3B
    jr   nc, jr_007_5599                          ; $557D: $30 $1A

    ld   a, MUSIC_TOOL_ACQUIRED                   ; $557F: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $5581: $EA $68 $D3
    ld   [wC167], a                               ; $5584: $EA $67 $C1
    ldh  a, [hNextDefaultMusicTrack]              ; $5587: $F0 $BF
    ldh  [hDefaultMusicTrack], a                  ; $5589: $E0 $B0
    call GetEntityTransitionCountdown             ; $558B: $CD $05 $0C
    ld   a, $68                                   ; $558E: $3E $68
    ld   [hl], a                                  ; $5590: $77
    ld   a, $66                                   ; $5591: $3E $66
    ld   [wC111], a                               ; $5593: $EA $11 $C1
    jp   ResetSpinAttack                          ; $5596: $C3 $AF $0C

jr_007_5599:
    ret                                           ; $5599: $C9

jr_007_559A:
    cp   $10                                      ; $559A: $FE $10
    jr   nz, jr_007_55BA                          ; $559C: $20 $1C

    dec  [hl]                                     ; $559E: $35
    ld   a, [wTradeSequenceItem]                  ; $559F: $FA $0E $DB
    ld   e, a                                     ; $55A2: $5F
    ld   d, b                                     ; $55A3: $50
    ld   hl, Data_007_54C2 - 1                    ; $55A4: $21 $C1 $54
    add  hl, de                                   ; $55A7: $19
    ld   a, [hl]                                  ; $55A8: $7E
    cp   $9D                                      ; $55A9: $FE $9D
    jr   z, jr_007_55B1                           ; $55AB: $28 $04

    cp   $44                                      ; $55AD: $FE $44
    jr   nz, jr_007_55B6                          ; $55AF: $20 $05

jr_007_55B1:
    call OpenDialog                               ; $55B1: $CD $85 $23
    jr   jr_007_55B9                              ; $55B4: $18 $03

jr_007_55B6:
    call OpenDialogInTable1                       ; $55B6: $CD $73 $23

jr_007_55B9:
    xor  a                                        ; $55B9: $AF

jr_007_55BA:
    dec  a                                        ; $55BA: $3D
    jr   nz, jr_007_55CD                          ; $55BB: $20 $10

    xor  a                                        ; $55BD: $AF
    ld   [$DB7F], a                               ; $55BE: $EA $7F $DB
    ld   [wC167], a                               ; $55C1: $EA $67 $C1
    call func_007_560D                            ; $55C4: $CD $0D $56
    or   $20                                      ; $55C7: $F6 $20
    ld   [hl], a                                  ; $55C9: $77
    jp   func_007_7EA4                            ; $55CA: $C3 $A4 $7E

jr_007_55CD:
    ldh  a, [hLinkPositionX]                      ; $55CD: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $55CF: $21 $00 $C2
    add  hl, bc                                   ; $55D2: $09
    ld   [hl], a                                  ; $55D3: $77
    ldh  a, [hMapRoom]                            ; $55D4: $F0 $F6
    cp   $C9                                      ; $55D6: $FE $C9
    jr   nz, jr_007_55DF                          ; $55D8: $20 $05

    ld   a, $04                                   ; $55DA: $3E $04
    ld   [$C13B], a                               ; $55DC: $EA $3B $C1

jr_007_55DF:
    ld   hl, $C13B                                ; $55DF: $21 $3B $C1
    ldh  a, [hLinkPositionY]                      ; $55E2: $F0 $99
    add  [hl]                                     ; $55E4: $86
    ld   hl, wEntitiesPosYTable                   ; $55E5: $21 $10 $C2
    add  hl, bc                                   ; $55E8: $09
    sub  $10                                      ; $55E9: $D6 $10
    ld   [hl], a                                  ; $55EB: $77
    ldh  a, [hLinkPositionZ]                      ; $55EC: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $55EE: $21 $10 $C3
    add  hl, bc                                   ; $55F1: $09
    ld   [hl], a                                  ; $55F2: $77
    ld   a, $6C                                   ; $55F3: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $55F5: $E0 $9D
    ld   a, $02                                   ; $55F7: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $55F9: $E0 $A1
    ld   a, $03                                   ; $55FB: $3E $03
    ldh  [hLinkDirection], a                      ; $55FD: $E0 $9E
    xor  a                                        ; $55FF: $AF
    ld   [wSwordAnimationState], a                ; $5600: $EA $37 $C1
    ld   [wC16A], a                               ; $5603: $EA $6A $C1
    ld   [wSwordCharge], a                        ; $5606: $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ; $5609: $EA $21 $C1
    ret                                           ; $560C: $C9

func_007_560D::
    ld   hl, wOverworldRoomStatus                 ; $560D: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $5610: $F0 $F6
    ld   e, a                                     ; $5612: $5F
    ld   a, [wIsIndoor]                           ; $5613: $FA $A5 $DB
    ld   d, a                                     ; $5616: $57
    ldh  a, [hMapId]                              ; $5617: $F0 $F7
    cp   $1A                                      ; $5619: $FE $1A
    jr   nc, jr_007_5622                          ; $561B: $30 $05

    cp   $06                                      ; $561D: $FE $06
    jr   c, jr_007_5622                           ; $561F: $38 $01

    inc  d                                        ; $5621: $14

jr_007_5622:
    add  hl, de                                   ; $5622: $19
    ld   a, [hl]                                  ; $5623: $7E
    ret                                           ; $5624: $C9

Data_007_5625::
    db   $08, $F8, $00, $00

Data_007_5629::
    db   $00, $00, $F8, $08

Data_007_562D::
    db   $50, $02, $50, $22, $52, $02, $52, $22, $50, $42, $50, $62, $52, $42, $52, $62
    db   $54, $02, $56, $02, $58, $02, $5A, $02, $56, $22, $54, $22, $5A, $22, $58, $22

WingedOctorockEntityHandler::
    ld   de, Data_007_562D                        ; $564D: $11 $2D $56
    call RenderActiveEntitySpritesPair            ; $5650: $CD $C0 $3B
    call func_007_5805                            ; $5653: $CD $05 $58
    call func_007_7D96                            ; $5656: $CD $96 $7D
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5659: $21 $10 $C4
    add  hl, bc                                   ; $565C: $09
    ld   a, [hl]                                  ; $565D: $7E
    and  a                                        ; $565E: $A7
    jr   z, jr_007_566F                           ; $565F: $28 $0E

    ld   hl, wEntitiesStateTable                  ; $5661: $21 $90 $C2
    add  hl, bc                                   ; $5664: $09
    ld   a, $01                                   ; $5665: $3E $01
    ld   [hl], a                                  ; $5667: $77
    ldh  [hActiveEntityState], a                  ; $5668: $E0 $F0
    call GetEntityTransitionCountdown             ; $566A: $CD $05 $0C
    ld   [hl], $40                                ; $566D: $36 $40

jr_007_566F:
    call func_007_7DC3                            ; $566F: $CD $C3 $7D
    call func_007_7E0A                            ; $5672: $CD $0A $7E
    call func_007_7E43                            ; $5675: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $5678: $21 $20 $C3
    add  hl, bc                                   ; $567B: $09
    dec  [hl]                                     ; $567C: $35
    ld   hl, wEntitiesPosZTable                   ; $567D: $21 $10 $C3
    add  hl, bc                                   ; $5680: $09
    ld   a, [hl]                                  ; $5681: $7E
    and  $80                                      ; $5682: $E6 $80
    ldh  [hFFE8], a                               ; $5684: $E0 $E8
    jr   z, jr_007_5693                           ; $5686: $28 $0B

    ld   [hl], b                                  ; $5688: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5689: $21 $20 $C3
    add  hl, bc                                   ; $568C: $09
    ld   [hl], b                                  ; $568D: $70
    ld   hl, wEntitiesPrivateState2Table          ; $568E: $21 $C0 $C2
    add  hl, bc                                   ; $5691: $09
    ld   [hl], b                                  ; $5692: $70

jr_007_5693:
    call label_3B23                               ; $5693: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $5696: $F0 $F0
    cp   $02                                      ; $5698: $FE $02
    jp   z, label_007_577A                        ; $569A: $CA $7A $57

    and  a                                        ; $569D: $A7
    jr   z, jr_007_56FF                           ; $569E: $28 $5F

    call GetEntityTransitionCountdown             ; $56A0: $CD $05 $0C
    jr   z, jr_007_56BD                           ; $56A3: $28 $18

    cp   $0A                                      ; $56A5: $FE $0A
    jr   nz, jr_007_56B7                          ; $56A7: $20 $0E

    call func_007_7E7D                            ; $56A9: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $56AC: $21 $80 $C3
    add  hl, bc                                   ; $56AF: $09
    ld   a, e                                     ; $56B0: $7B
    cp   [hl]                                     ; $56B1: $BE
    jr   nz, jr_007_56B7                          ; $56B2: $20 $03

    call func_007_57B0                            ; $56B4: $CD $B0 $57

jr_007_56B7:
    call ClearEntitySpeed                         ; $56B7: $CD $7F $3D
    jp   label_007_5721                           ; $56BA: $C3 $21 $57

jr_007_56BD:
    call GetRandomByte                            ; $56BD: $CD $0D $28
    and  $1F                                      ; $56C0: $E6 $1F
    or   $20                                      ; $56C2: $F6 $20
    ld   [hl], a                                  ; $56C4: $77
    ld   hl, wEntitiesStateTable                  ; $56C5: $21 $90 $C2
    add  hl, bc                                   ; $56C8: $09
    ld   [hl], $00                                ; $56C9: $36 $00
    ld   hl, wEntitiesPrivateState1Table          ; $56CB: $21 $B0 $C2
    add  hl, bc                                   ; $56CE: $09
    ld   a, [hl]                                  ; $56CF: $7E
    inc  a                                        ; $56D0: $3C
    and  $03                                      ; $56D1: $E6 $03
    ld   [hl], a                                  ; $56D3: $77
    cp   $00                                      ; $56D4: $FE $00
    jr   nz, jr_007_56DD                          ; $56D6: $20 $05

    call func_007_7E7D                            ; $56D8: $CD $7D $7E
    jr   jr_007_56E0                              ; $56DB: $18 $03

jr_007_56DD:
    call GetRandomByte                            ; $56DD: $CD $0D $28

jr_007_56E0:
    and  $03                                      ; $56E0: $E6 $03
    ld   hl, wEntitiesDirectionTable              ; $56E2: $21 $80 $C3
    add  hl, bc                                   ; $56E5: $09
    ld   [hl], a                                  ; $56E6: $77
    ld   e, a                                     ; $56E7: $5F
    ld   d, b                                     ; $56E8: $50
    ld   hl, Data_007_5625                        ; $56E9: $21 $25 $56
    add  hl, de                                   ; $56EC: $19
    ld   a, [hl]                                  ; $56ED: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $56EE: $21 $40 $C2
    add  hl, bc                                   ; $56F1: $09
    ld   [hl], a                                  ; $56F2: $77
    ld   hl, Data_007_5629                        ; $56F3: $21 $29 $56
    add  hl, de                                   ; $56F6: $19
    ld   a, [hl]                                  ; $56F7: $7E
    call GetEntitySpeedYAddress                   ; $56F8: $CD $05 $40
    ld   [hl], a                                  ; $56FB: $77
    jp   label_007_5721                           ; $56FC: $C3 $21 $57

jr_007_56FF:
    ld   hl, wEntitiesCollisionsTable             ; $56FF: $21 $A0 $C2
    add  hl, bc                                   ; $5702: $09
    ld   a, [hl]                                  ; $5703: $7E
    and  $0F                                      ; $5704: $E6 $0F
    jr   nz, jr_007_570D                          ; $5706: $20 $05

    call GetEntityTransitionCountdown             ; $5708: $CD $05 $0C
    jr   nz, jr_007_571E                          ; $570B: $20 $11

jr_007_570D:
    call GetRandomByte                            ; $570D: $CD $0D $28
    and  $0F                                      ; $5710: $E6 $0F
    or   $10                                      ; $5712: $F6 $10
    ld   [hl], a                                  ; $5714: $77
    ld   hl, wEntitiesStateTable                  ; $5715: $21 $90 $C2
    add  hl, bc                                   ; $5718: $09
    ld   [hl], $01                                ; $5719: $36 $01
    call ClearEntitySpeed                         ; $571B: $CD $7F $3D

jr_007_571E:
    call func_007_7D1A                            ; $571E: $CD $1A $7D

label_007_5721:
    ld   hl, wEntitiesPrivateCountdown2Table      ; $5721: $21 $00 $C3
    add  hl, bc                                   ; $5724: $09
    ld   a, [hl]                                  ; $5725: $7E
    and  a                                        ; $5726: $A7
    jr   nz, jr_007_5777                          ; $5727: $20 $4E

    call func_007_7E5D                            ; $5729: $CD $5D $7E
    add  $20                                      ; $572C: $C6 $20
    cp   $40                                      ; $572E: $FE $40
    jr   nc, jr_007_5777                          ; $5730: $30 $45

    call func_007_7E6D                            ; $5732: $CD $6D $7E
    add  $20                                      ; $5735: $C6 $20
    cp   $40                                      ; $5737: $FE $40
    jr   nc, jr_007_5777                          ; $5739: $30 $3C

    ld   a, [wBButtonSlot]                        ; $573B: $FA $00 $DB
    cp   $01                                      ; $573E: $FE $01
    jr   nz, jr_007_574A                          ; $5740: $20 $08

    ldh  a, [hJoypadState]                        ; $5742: $F0 $CC
    and  $20                                      ; $5744: $E6 $20
    jr   nz, jr_007_5757                          ; $5746: $20 $0F

    jr   jr_007_5777                              ; $5748: $18 $2D

jr_007_574A:
    ld   a, [wAButtonSlot]                        ; $574A: $FA $01 $DB
    cp   $01                                      ; $574D: $FE $01
    jr   nz, jr_007_5777                          ; $574F: $20 $26

    ldh  a, [hJoypadState]                        ; $5751: $F0 $CC
    and  $10                                      ; $5753: $E6 $10
    jr   z, jr_007_5777                           ; $5755: $28 $20

jr_007_5757:
    call func_007_7E7D                            ; $5757: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $575A: $21 $80 $C3
    add  hl, bc                                   ; $575D: $09
    ld   a, [hl]                                  ; $575E: $7E
    xor  $01                                      ; $575F: $EE $01
    cp   e                                        ; $5761: $BB
    jr   z, jr_007_5777                           ; $5762: $28 $13

    ld   hl, wEntitiesSpeedZTable                 ; $5764: $21 $20 $C3
    add  hl, bc                                   ; $5767: $09
    ld   [hl], $18                                ; $5768: $36 $18
    ld   a, $10                                   ; $576A: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $576C: $CD $AA $3B
    call IncrementEntityState                     ; $576F: $CD $12 $3B
    ld   [hl], $02                                ; $5772: $36 $02
    jp   func_007_733F                            ; $5774: $C3 $3F $73

jr_007_5777:
    jp   label_3B39                               ; $5777: $C3 $39 $3B

label_007_577A:
    ldh  a, [hFrameCounter]                       ; $577A: $F0 $E7
    rra                                           ; $577C: $1F
    rra                                           ; $577D: $1F
    and  $01                                      ; $577E: $E6 $01
    ld   hl, wEntitiesPrivateState2Table          ; $5780: $21 $C0 $C2
    add  hl, bc                                   ; $5783: $09
    ld   [hl], a                                  ; $5784: $77
    call func_007_7E7D                            ; $5785: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $5788: $21 $80 $C3
    add  hl, bc                                   ; $578B: $09
    ld   [hl], e                                  ; $578C: $73
    call func_007_7D1A                            ; $578D: $CD $1A $7D
    ldh  a, [hFFE8]                               ; $5790: $F0 $E8
    and  a                                        ; $5792: $A7
    jr   z, jr_007_579F                           ; $5793: $28 $0A

    call IncrementEntityState                     ; $5795: $CD $12 $3B
    ld   [hl], $01                                ; $5798: $36 $01
    call GetEntityTransitionCountdown             ; $579A: $CD $05 $0C
    ld   [hl], $20                                ; $579D: $36 $20

jr_007_579F:
    ret                                           ; $579F: $C9

Data_007_57A0::
    db   $08, $F8, $00, $00

Data_007_57A4::
    db   $00, $00, $F8, $08

Data_007_57A8::
    db   $20, $E0, $00, $00

Data_007_57AC::
    db   $00, $00, $E0, $20

func_007_57B0::
    ld   a, $0A                                   ; $57B0: $3E $0A
    call SpawnNewEntity_trampoline                ; $57B2: $CD $86 $3B
    jr   c, jr_007_57F4                           ; $57B5: $38 $3D

    push bc                                       ; $57B7: $C5
    ld   hl, wEntitiesSpriteVariantTable          ; $57B8: $21 $B0 $C3
    add  hl, de                                   ; $57BB: $19
    ld   [hl], $01                                ; $57BC: $36 $01
    ldh  a, [hScratch2]                           ; $57BE: $F0 $D9
    ld   hl, wEntitiesDirectionTable              ; $57C0: $21 $80 $C3
    add  hl, de                                   ; $57C3: $19
    ld   [hl], a                                  ; $57C4: $77
    ld   c, a                                     ; $57C5: $4F
    ld   hl, Data_007_57A0                        ; $57C6: $21 $A0 $57
    add  hl, bc                                   ; $57C9: $09
    ldh  a, [hScratch0]                           ; $57CA: $F0 $D7
    add  [hl]                                     ; $57CC: $86
    ld   hl, wEntitiesPosXTable                   ; $57CD: $21 $00 $C2
    add  hl, de                                   ; $57D0: $19
    ld   [hl], a                                  ; $57D1: $77
    ld   hl, Data_007_57A4                        ; $57D2: $21 $A4 $57
    add  hl, bc                                   ; $57D5: $09
    ldh  a, [hScratch1]                           ; $57D6: $F0 $D8
    add  [hl]                                     ; $57D8: $86
    ld   hl, wEntitiesPosYTable                   ; $57D9: $21 $10 $C2
    add  hl, de                                   ; $57DC: $19
    ld   [hl], a                                  ; $57DD: $77
    ld   hl, Data_007_57A8                        ; $57DE: $21 $A8 $57
    add  hl, bc                                   ; $57E1: $09
    ld   a, [hl]                                  ; $57E2: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $57E3: $21 $40 $C2
    add  hl, de                                   ; $57E6: $19
    ld   [hl], a                                  ; $57E7: $77
    ld   hl, Data_007_57AC                        ; $57E8: $21 $AC $57
    add  hl, bc                                   ; $57EB: $09
    ld   a, [hl]                                  ; $57EC: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $57ED: $21 $50 $C2
    add  hl, de                                   ; $57F0: $19
    ld   [hl], a                                  ; $57F1: $77
    pop  bc                                       ; $57F2: $C1
    and  a                                        ; $57F3: $A7

jr_007_57F4:
    ret                                           ; $57F4: $C9

Data_007_57F5::
    db   $00, $FC, $22, $40, $00, $0C, $22, $60, $00, $FC, $22, $00, $00, $0C, $22, $20

func_007_5805::
    ld   hl, wEntitiesPrivateState2Table          ; $5805: $21 $C0 $C2
    add  hl, bc                                   ; $5808: $09
    ld   a, [hl]                                  ; $5809: $7E
    rla                                           ; $580A: $17
    rla                                           ; $580B: $17
    rla                                           ; $580C: $17
    and  $F8                                      ; $580D: $E6 $F8
    ld   e, a                                     ; $580F: $5F
    ld   d, b                                     ; $5810: $50
    ld   hl, Data_007_57F5                        ; $5811: $21 $F5 $57
    add  hl, de                                   ; $5814: $19
    ld   c, $02                                   ; $5815: $0E $02
    jp   RenderActiveEntitySpritesRect           ; $5817: $C3 $E6 $3C

Data_007_581A::
    db   $78, $02, $72, $02, $7A, $02, $72, $02, $70, $02, $72, $02, $7C, $02, $7E, $02
    db   $74, $02, $76, $02

Data_007_582E::
    db   $72, $22, $78, $22, $72, $22, $7A, $22, $72, $22, $70, $22, $7E, $22, $7C, $22
    db   $76, $22, $74, $22

KikiTheMonkeyEntityHandler::
    ldh  a, [hRoomStatus]                         ; $5842: $F0 $F8
    and  $10                                      ; $5844: $E6 $10
    jp   nz, func_007_7EA4                        ; $5846: $C2 $A4 $7E

    ld   de, Data_007_581A                        ; $5849: $11 $1A $58
    ld   hl, wEntitiesDirectionTable              ; $584C: $21 $80 $C3
    add  hl, bc                                   ; $584F: $09
    ld   a, [hl]                                  ; $5850: $7E
    and  a                                        ; $5851: $A7
    jr   nz, jr_007_5857                          ; $5852: $20 $03

    ld   de, Data_007_582E                        ; $5854: $11 $2E $58

jr_007_5857:
    call RenderActiveEntitySpritesPair            ; $5857: $CD $C0 $3B
    ld   hl, wEntitiesUnknowTableV                ; $585A: $21 $80 $C4
    add  hl, bc                                   ; $585D: $09
    ld   a, [hl]                                  ; $585E: $7E
    and  a                                        ; $585F: $A7
    jr   z, jr_007_5874                           ; $5860: $28 $12

    xor  a                                        ; $5862: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $5863: $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ; $5865: $F0 $EC
    sub  $0E                                      ; $5867: $D6 $0E
    ldh  [hActiveEntityVisualPosY], a             ; $5869: $E0 $EC
    ld   de, Data_007_594D                        ; $586B: $11 $4D $59
    call RenderActiveEntitySpritesPair            ; $586E: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $5871: $CD $8A $3D

jr_007_5874:
    call func_007_7D96                            ; $5874: $CD $96 $7D
    call func_007_7E43                            ; $5877: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $587A: $21 $20 $C3
    add  hl, bc                                   ; $587D: $09
    dec  [hl]                                     ; $587E: $35
    dec  [hl]                                     ; $587F: $35
    ld   hl, wEntitiesPosZTable                   ; $5880: $21 $10 $C3
    add  hl, bc                                   ; $5883: $09
    ld   a, [hl]                                  ; $5884: $7E
    and  $80                                      ; $5885: $E6 $80
    ldh  [hFFE8], a                               ; $5887: $E0 $E8
    jr   z, jr_007_5891                           ; $5889: $28 $06

    ld   [hl], b                                  ; $588B: $70
    ld   hl, wEntitiesSpeedZTable                 ; $588C: $21 $20 $C3
    add  hl, bc                                   ; $588F: $09
    ld   [hl], b                                  ; $5890: $70

jr_007_5891:
    ldh  a, [hActiveEntityState]                  ; $5891: $F0 $F0
    JP_TABLE                                      ; $5893
._00 dw func_007_58A8                             ; $5894
._01 dw func_007_591A                             ; $5896
._02 dw func_007_5934                             ; $5898
._03 dw func_007_5951                             ; $589A
._04 dw func_007_5997                             ; $589C
._05 dw func_007_5AAC                             ; $589E
._06 dw func_007_5B25                             ; $58A0
._07 dw func_007_5B69                             ; $58A2
._08 dw func_007_5BD9                             ; $58A4
._09 dw func_007_5BF0                             ; $58A6

func_007_58A8::
    ld   a, [wIsBowWowFollowingLink]              ; $58A8: $FA $56 $DB
    cp   $01                                      ; $58AB: $FE $01
    jr   nz, jr_007_58DE                          ; $58AD: $20 $2F

    ld   hl, wEntitiesFlashCountdownTable         ; $58AF: $21 $20 $C4
    add  hl, bc                                   ; $58B2: $09
    ld   a, [hl]                                  ; $58B3: $7E
    and  a                                        ; $58B4: $A7
    jr   nz, jr_007_58C9                          ; $58B5: $20 $12

    call func_007_7E5D                            ; $58B7: $CD $5D $7E
    add  $18                                      ; $58BA: $C6 $18
    cp   $30                                      ; $58BC: $FE $30
    jr   nc, jr_007_58DD                          ; $58BE: $30 $1D

    call func_007_7E6D                            ; $58C0: $CD $6D $7E
    add  $18                                      ; $58C3: $C6 $18
    cp   $30                                      ; $58C5: $FE $30
    jr   nc, jr_007_58DD                          ; $58C7: $30 $14

jr_007_58C9:
    call GetEntityTransitionCountdown             ; $58C9: $CD $05 $0C
    ld   [hl], $10                                ; $58CC: $36 $10
    call IncrementEntityState                     ; $58CE: $CD $12 $3B
    ld   [hl], $05                                ; $58D1: $36 $05
    ld   a, $60                                   ; $58D3: $3E $60

func_007_58D5::
    call OpenDialogInTable1                       ; $58D5: $CD $73 $23
    ld   a, $14                                   ; $58D8: $3E $14
    ld   [wDialogSFX], a                          ; $58DA: $EA $AB $C5

jr_007_58DD:
    ret                                           ; $58DD: $C9

jr_007_58DE:
    call func_007_7CF0                            ; $58DE: $CD $F0 $7C
    call func_007_7D43                            ; $58E1: $CD $43 $7D
    jr   nc, func_007_58FA                        ; $58E4: $30 $14

    ld   a, [wTradeSequenceItem]                  ; $58E6: $FA $0E $DB
    cp   $04                                      ; $58E9: $FE $04
    jr   nz, jr_007_58F5                          ; $58EB: $20 $08

    ld   a, $65                                   ; $58ED: $3E $65
    call func_007_58D5                            ; $58EF: $CD $D5 $58
    jp   IncrementEntityState                     ; $58F2: $C3 $12 $3B

jr_007_58F5:
    ld   a, $61                                   ; $58F5: $3E $61
    call func_007_58D5                            ; $58F7: $CD $D5 $58

func_007_58FA::
    ldh  a, [hFrameCounter]                       ; $58FA: $F0 $E7
    rra                                           ; $58FC: $1F
    rra                                           ; $58FD: $1F
    rra                                           ; $58FE: $1F
    and  $01                                      ; $58FF: $E6 $01
    call SetEntitySpriteVariant                   ; $5901: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $5904: $F0 $E7
    and  $1F                                      ; $5906: $E6 $1F
    jr   nz, jr_007_5919                          ; $5908: $20 $0F

    call GetRandomByte                            ; $590A: $CD $0D $28
    and  $01                                      ; $590D: $E6 $01
    jr   nz, jr_007_5919                          ; $590F: $20 $08

    ld   hl, wEntitiesDirectionTable              ; $5911: $21 $80 $C3
    add  hl, bc                                   ; $5914: $09
    ld   a, [hl]                                  ; $5915: $7E
    xor  $01                                      ; $5916: $EE $01
    ld   [hl], a                                  ; $5918: $77

jr_007_5919:
    ret                                           ; $5919: $C9

func_007_591A::
    ld   a, [wDialogState]                        ; $591A: $FA $9F $C1
    and  a                                        ; $591D: $A7
    ret  nz                                       ; $591E: $C0

    call IncrementEntityState                     ; $591F: $CD $12 $3B
    ld   a, [wC177]                               ; $5922: $FA $77 $C1
    and  a                                        ; $5925: $A7
    jr   nz, jr_007_592E                          ; $5926: $20 $06

    call GetEntityTransitionCountdown             ; $5928: $CD $05 $0C
    ld   [hl], $10                                ; $592B: $36 $10
    ret                                           ; $592D: $C9

jr_007_592E:
    ld   [hl], b                                  ; $592E: $70
    ld   a, $61                                   ; $592F: $3E $61
    jp   func_007_58D5                            ; $5931: $C3 $D5 $58

func_007_5934::
    call GetEntityTransitionCountdown             ; $5934: $CD $05 $0C
    jr   nz, jr_007_5948                          ; $5937: $20 $0F

    ld   [hl], $80                                ; $5939: $36 $80
    ld   hl, wEntitiesUnknowTableV                ; $593B: $21 $80 $C4
    add  hl, bc                                   ; $593E: $09
    ld   [hl], $80                                ; $593F: $36 $80
    ld   a, JINGLE_TREASURE_FOUND                 ; $5941: $3E $01
    ldh  [hJingle], a                             ; $5943: $E0 $F2
    call IncrementEntityState                     ; $5945: $CD $12 $3B

jr_007_5948:
    ld   a, $02                                   ; $5948: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $594A: $E0 $A1
    ret                                           ; $594C: $C9

Data_007_594D::
    db   $9A, $17, $9C, $17

func_007_5951::
    ld   a, $03                                   ; $5951: $3E $03
    call SetEntitySpriteVariant                   ; $5953: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5956: $CD $05 $0C
    jr   nz, jr_007_596A                          ; $5959: $20 $0F

    ld   a, MUSIC_MONKEYS_BUILDING_BRIDGE         ; $595B: $3E $36
    ld   [wMusicTrackToPlay], a                   ; $595D: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $5960: $E0 $B0
    call GetEntityDropTimer                       ; $5962: $CD $FB $0B
    ld   [hl], $80                                ; $5965: $36 $80
    jp   IncrementEntityState                     ; $5967: $C3 $12 $3B

jr_007_596A:
    cp   $10                                      ; $596A: $FE $10
    jr   nz, jr_007_5973                          ; $596C: $20 $05

    ld   a, $62                                   ; $596E: $3E $62
    call func_007_58D5                            ; $5970: $CD $D5 $58

jr_007_5973:
    ld   a, $02                                   ; $5973: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5975: $E0 $A1
    ret                                           ; $5977: $C9

Data_007_5978::
    db   $48, $48, $48, $48, $48, $48, $48

Data_007_597F::
    db   $18, $20, $28, $30, $38, $40, $48

Data_007_5986::
    db   $00, $78, $28, $58, $40, $30, $60

Data_007_598D::
    db   $00, $00, $80, $80, $00, $80, $00

Data_007_5994::
    db   $10, $30, $20

func_007_5997::
    ld   a, $02                                   ; $5997: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5999: $E0 $A1
    call func_007_58FA                            ; $599B: $CD $FA $58
    call GetEntityDropTimer                       ; $599E: $CD $FB $0B

jr_007_59A1:
    jr   nz, jr_007_59C8                          ; $59A1: $20 $25

    ld   a, JINGLE_PUZZLE_SOLVED                  ; $59A3: $3E $02
    ldh  [hJingle], a                             ; $59A5: $E0 $F2
    ld   a, [wOverworldRoomStatus + $7B]                               ; $59A7: $FA $7B $D8
    or   $10                                      ; $59AA: $F6 $10
    ld   [wOverworldRoomStatus + $7B], a                               ; $59AC: $EA $7B $D8
    ld   a, $01                                   ; $59AF: $3E $01
    ld   [$DB7F], a                               ; $59B1: $EA $7F $DB
    ld   a, $63                                   ; $59B4: $3E $63
    ld   [wC168], a                               ; $59B6: $EA $68 $C1
    call func_007_58D5                            ; $59B9: $CD $D5 $58
    call IncrementEntityState                     ; $59BC: $CD $12 $3B
    ld   [hl], $05                                ; $59BF: $36 $05
    ld   hl, wEntitiesUnknowTableY                ; $59C1: $21 $D0 $C3
    add  hl, bc                                   ; $59C4: $09

jr_007_59C5:
    ld   [hl], $06                                ; $59C5: $36 $06
    ret                                           ; $59C7: $C9

jr_007_59C8:
    cp   $01                                      ; $59C8: $FE $01
    jr   nz, jr_007_59D5                          ; $59CA: $20 $09

    ld   a, $05                                   ; $59CC: $3E $05
    ld   [wTradeSequenceItem], a                  ; $59CE: $EA $0E $DB
    ld   a, $0D                                   ; $59D1: $3E $0D
    ldh  [hFFA5], a                               ; $59D3: $E0 $A5

jr_007_59D5:
    ldh  a, [hFrameCounter]                       ; $59D5: $F0 $E7
    and  $1F                                      ; $59D7: $E6 $1F
    jr   nz, jr_007_5A2A                          ; $59D9: $20 $4F

    ld   hl, wEntitiesUnknownTableD               ; $59DB: $21 $D0 $C2
    add  hl, bc                                   ; $59DE: $09
    ld   a, [hl]                                  ; $59DF: $7E
    cp   $07                                      ; $59E0: $FE $07

jr_007_59E2:
    jr   z, jr_007_5A2A                           ; $59E2: $28 $46

    ld   a, $AD                                   ; $59E4: $3E $AD
    call SpawnNewEntity_trampoline                ; $59E6: $CD $86 $3B
    jr   c, jr_007_5A2A                           ; $59E9: $38 $3F

    push bc                                       ; $59EB: $C5
    call func_007_733F                            ; $59EC: $CD $3F $73
    ld   hl, wEntitiesUnknownTableD               ; $59EF: $21 $D0 $C2
    add  hl, bc                                   ; $59F2: $09
    ld   c, [hl]                                  ; $59F3: $4E
    inc  [hl]                                     ; $59F4: $34
    ld   hl, Data_007_5978                        ; $59F5: $21 $78 $59
    add  hl, bc                                   ; $59F8: $09
    ld   a, [hl]                                  ; $59F9: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $59FA: $21 $B0 $C2
    add  hl, de                                   ; $59FD: $19
    ld   [hl], a                                  ; $59FE: $77
    ld   hl, Data_007_597F                        ; $59FF: $21 $7F $59
    add  hl, bc                                   ; $5A02: $09
    ld   a, [hl]                                  ; $5A03: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $5A04: $21 $C0 $C2
    add  hl, de                                   ; $5A07: $19
    ld   [hl], a                                  ; $5A08: $77
    ld   hl, Data_007_5986                        ; $5A09: $21 $86 $59
    add  hl, bc                                   ; $5A0C: $09
    ld   a, [hl]                                  ; $5A0D: $7E
    ld   hl, wEntitiesPosXTable                   ; $5A0E: $21 $00 $C2
    add  hl, de                                   ; $5A11: $19
    ld   [hl], a                                  ; $5A12: $77
    ld   hl, Data_007_598D                        ; $5A13: $21 $8D $59
    add  hl, bc                                   ; $5A16: $09
    ld   a, [hl]                                  ; $5A17: $7E
    ld   hl, wEntitiesPosYTable                   ; $5A18: $21 $10 $C2
    add  hl, de                                   ; $5A1B: $19
    ld   [hl], a                                  ; $5A1C: $77
    ld   hl, wEntitiesStateTable                  ; $5A1D: $21 $90 $C2
    add  hl, de                                   ; $5A20: $19
    ld   [hl], $07                                ; $5A21: $36 $07
    ld   hl, wEntitiesPrivateCountdown2Table      ; $5A23: $21 $00 $C3
    add  hl, de                                   ; $5A26: $19
    ld   [hl], $80                                ; $5A27: $36 $80
    pop  bc                                       ; $5A29: $C1

jr_007_5A2A:
    call GetEntityDropTimer                       ; $5A2A: $CD $FB $0B
    cp   $40                                      ; $5A2D: $FE $40
    ret  nc                                       ; $5A2F: $D0

    ldh  a, [hFrameCounter]                       ; $5A30: $F0 $E7
    and  $3F                                      ; $5A32: $E6 $3F
    ret  nz                                       ; $5A34: $C0

    ld   hl, wEntitiesUnknowTableP                ; $5A35: $21 $40 $C4
    add  hl, bc                                   ; $5A38: $09
    ld   a, [hl]                                  ; $5A39: $7E
    cp   $03                                      ; $5A3A: $FE $03
    ret  nc                                       ; $5A3C: $D0

    ld   e, a                                     ; $5A3D: $5F
    ld   d, b                                     ; $5A3E: $50
    inc  [hl]                                     ; $5A3F: $34
    ld   hl, Data_007_5994                        ; $5A40: $21 $94 $59
    add  hl, de                                   ; $5A43: $19
    ld   a, [hl]                                  ; $5A44: $7E
    ldh  [hSwordIntersectedAreaY], a              ; $5A45: $E0 $CD
    ld   a, $40                                   ; $5A47: $3E $40
    ldh  [hSwordIntersectedAreaX], a              ; $5A49: $E0 $CE
    call label_2887                               ; $5A4B: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $5A4E: $F0 $FE
    and  a                                        ; $5A50: $A7
    jr   z, jr_007_5A5F                           ; $5A51: $28 $0C

    push bc                                       ; $5A53: $C5
    ld   a, $DB                                   ; $5A54: $3E $DB
    ld   [$DDD8], a                               ; $5A56: $EA $D8 $DD
    ld   a, $07                                   ; $5A59: $3E $07
    call func_91D                                ; $5A5B: $CD $1D $09
    pop  bc                                       ; $5A5E: $C1

jr_007_5A5F:
    ld   hl, wRequestDestinationHigh              ; $5A5F: $21 $01 $D6
    ld   a, [wRequests]                           ; $5A62: $FA $00 $D6
    ld   e, a                                     ; $5A65: $5F
    add  $0A                                      ; $5A66: $C6 $0A
    ld   [wRequests], a                           ; $5A68: $EA $00 $D6
    ld   d, $00                                   ; $5A6B: $16 $00
    add  hl, de                                   ; $5A6D: $19
    ldh  a, [$FFCF]                               ; $5A6E: $F0 $CF
    ld   [hl+], a                                 ; $5A70: $22
    ldh  a, [$FFD0]                               ; $5A71: $F0 $D0
    ld   [hl+], a                                 ; $5A73: $22
    ld   a, $81                                   ; $5A74: $3E $81
    ld   [hl+], a                                 ; $5A76: $22
    ld   a, $0C                                   ; $5A77: $3E $0C
    ld   [hl+], a                                 ; $5A79: $22
    ld   a, $1C                                   ; $5A7A: $3E $1C
    ld   [hl+], a                                 ; $5A7C: $22
    ldh  a, [$FFCF]                               ; $5A7D: $F0 $CF
    ld   [hl+], a                                 ; $5A7F: $22
    ldh  a, [$FFD0]                               ; $5A80: $F0 $D0
    inc  a                                        ; $5A82: $3C
    ld   [hl+], a                                 ; $5A83: $22
    ld   a, $81                                   ; $5A84: $3E $81
    ld   [hl+], a                                 ; $5A86: $22
    ld   a, $0D                                   ; $5A87: $3E $0D
    ld   [hl+], a                                 ; $5A89: $22
    ld   a, $1D                                   ; $5A8A: $3E $1D
    ld   [hl+], a                                 ; $5A8C: $22
    ld   [hl], b                                  ; $5A8D: $70
    ld   hl, $D725                                ; $5A8E: $21 $25 $D7
    ld   [hl], $DB                                ; $5A91: $36 $DB
    ld   a, $87                                   ; $5A93: $3E $87
    call func_2BF                                ; $5A95: $CD $2F $0B
    ld   hl, $D735                                ; $5A98: $21 $35 $D7
    ld   [hl], $DB                                ; $5A9B: $36 $DB
    ld   a, $87                                   ; $5A9D: $3E $87
    call func_2BF                                ; $5A9F: $CD $2F $0B
    ld   hl, $D745                                ; $5AA2: $21 $45 $D7
    ld   [hl], $DB                                ; $5AA5: $36 $DB
    ld   a, $87                                   ; $5AA7: $3E $87
    jp   func_2BF                                ; $5AA9: $C3 $2F $0B

func_007_5AAC::
    call GetEntityTransitionCountdown             ; $5AAC: $CD $05 $0C
    jr   nz, jr_007_5B19                          ; $5AAF: $20 $68

    call IncrementEntityState                     ; $5AB1: $CD $12 $3B
    ld   hl, wEntitiesUnknowTableY                ; $5AB4: $21 $D0 $C3
    add  hl, bc                                   ; $5AB7: $09
    ld   a, [hl]                                  ; $5AB8: $7E
    cp   $05                                      ; $5AB9: $FE $05
    jr   c, jr_007_5ADE                           ; $5ABB: $38 $21

    call GetRandomByte                            ; $5ABD: $CD $0D $28
    and  $0F                                      ; $5AC0: $E6 $0F
    add  $10                                      ; $5AC2: $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ; $5AC4: $21 $20 $C3
    add  hl, bc                                   ; $5AC7: $09
    ld   [hl], a                                  ; $5AC8: $77
    ld   e, $10                                   ; $5AC9: $1E $10
    and  $01                                      ; $5ACB: $E6 $01
    jr   z, jr_007_5AD1                           ; $5ACD: $28 $02

    ld   e, $F0                                   ; $5ACF: $1E $F0

jr_007_5AD1:
    ld   hl, wEntitiesSpeedXTable                 ; $5AD1: $21 $40 $C2
    add  hl, bc                                   ; $5AD4: $09
    ld   [hl], e                                  ; $5AD5: $73
    call GetEntitySpeedYAddress                   ; $5AD6: $CD $05 $40
    ld   [hl], $F0                                ; $5AD9: $36 $F0
    jp   func_007_5B08                            ; $5ADB: $C3 $08 $5B

jr_007_5ADE:
    ld   hl, wEntitiesSpeedZTable                 ; $5ADE: $21 $20 $C3
    add  hl, bc                                   ; $5AE1: $09
    ld   [hl], $18                                ; $5AE2: $36 $18
    ldh  a, [hLinkPositionX]                      ; $5AE4: $F0 $98
    push af                                       ; $5AE6: $F5
    ldh  a, [hLinkPositionY]                      ; $5AE7: $F0 $99
    push af                                       ; $5AE9: $F5
    ld   a, [$D154]                               ; $5AEA: $FA $54 $D1
    ld   e, a                                     ; $5AED: $5F
    ld   d, b                                     ; $5AEE: $50
    ld   hl, wEntitiesPosXTable                   ; $5AEF: $21 $00 $C2
    add  hl, de                                   ; $5AF2: $19
    ld   a, [hl]                                  ; $5AF3: $7E
    ldh  [hLinkPositionX], a                      ; $5AF4: $E0 $98
    ld   hl, wEntitiesPosYTable                   ; $5AF6: $21 $10 $C2
    add  hl, de                                   ; $5AF9: $19
    ld   a, [hl]                                  ; $5AFA: $7E
    ldh  [hLinkPositionY], a                      ; $5AFB: $E0 $99
    ld   a, $14                                   ; $5AFD: $3E $14
    call ApplyVectorTowardsLink_trampoline        ; $5AFF: $CD $AA $3B
    pop  af                                       ; $5B02: $F1
    ldh  [hLinkPositionY], a                      ; $5B03: $E0 $99
    pop  af                                       ; $5B05: $F1
    ldh  [hLinkPositionX], a                      ; $5B06: $E0 $98

func_007_5B08::
    ld   hl, wEntitiesSpeedXTable                 ; $5B08: $21 $40 $C2
    add  hl, bc                                   ; $5B0B: $09
    ld   a, [hl]                                  ; $5B0C: $7E
    ld   e, $00                                   ; $5B0D: $1E $00
    and  $80                                      ; $5B0F: $E6 $80
    jr   z, jr_007_5B14                           ; $5B11: $28 $01

    inc  e                                        ; $5B13: $1C

jr_007_5B14:
    ld   hl, wEntitiesDirectionTable              ; $5B14: $21 $80 $C3
    add  hl, bc                                   ; $5B17: $09
    ld   [hl], e                                  ; $5B18: $73

jr_007_5B19:
    call func_007_58FA                            ; $5B19: $CD $FA $58
    call GetEntityPrivateCountdown1               ; $5B1C: $CD $00 $0C
    ret  z                                        ; $5B1F: $C8

    ld   a, $04                                   ; $5B20: $3E $04
    jp   SetEntitySpriteVariant                   ; $5B22: $C3 $0C $3B

func_007_5B25::
    call func_007_7E0A                            ; $5B25: $CD $0A $7E
    ldh  a, [hActiveEntityPosY]                   ; $5B28: $F0 $EF
    cp   $08                                      ; $5B2A: $FE $08
    jp   c, func_007_7EA4                         ; $5B2C: $DA $A4 $7E

    ld   hl, wEntitiesUnknowTableY                ; $5B2F: $21 $D0 $C3
    add  hl, bc                                   ; $5B32: $09
    ld   a, [hl]                                  ; $5B33: $7E
    cp   $05                                      ; $5B34: $FE $05
    jr   nc, jr_007_5B3B                          ; $5B36: $30 $03

    call label_3B23                               ; $5B38: $CD $23 $3B

jr_007_5B3B:
    ldh  a, [hFFE8]                               ; $5B3B: $F0 $E8
    and  a                                        ; $5B3D: $A7
    jr   z, jr_007_5B64                           ; $5B3E: $28 $24

    call IncrementEntityState                     ; $5B40: $CD $12 $3B
    ld   [hl], $05                                ; $5B43: $36 $05
    ld   hl, wEntitiesUnknowTableY                ; $5B45: $21 $D0 $C3
    add  hl, bc                                   ; $5B48: $09
    ld   a, [hl]                                  ; $5B49: $7E
    cp   $05                                      ; $5B4A: $FE $05
    jr   c, jr_007_5B59                           ; $5B4C: $38 $0B

    call GetEntityTransitionCountdown             ; $5B4E: $CD $05 $0C
    ld   [hl], $10                                ; $5B51: $36 $10
    call GetEntityPrivateCountdown1               ; $5B53: $CD $00 $0C
    ld   [hl], $10                                ; $5B56: $36 $10
    ret                                           ; $5B58: $C9

jr_007_5B59:
    call GetEntityTransitionCountdown             ; $5B59: $CD $05 $0C
    call GetRandomByte                            ; $5B5C: $CD $0D $28
    and  $3F                                      ; $5B5F: $E6 $3F
    add  $30                                      ; $5B61: $C6 $30
    ld   [hl], a                                  ; $5B63: $77

jr_007_5B64:
    ld   a, $03                                   ; $5B64: $3E $03
    jp   SetEntitySpriteVariant                   ; $5B66: $C3 $0C $3B

func_007_5B69::
    call GetEntityTransitionCountdown             ; $5B69: $CD $05 $0C
    jr   nz, jr_007_5BCA                          ; $5B6C: $20 $5C

    ldh  a, [hLinkPositionX]                      ; $5B6E: $F0 $98
    push af                                       ; $5B70: $F5
    ldh  a, [hLinkPositionY]                      ; $5B71: $F0 $99
    push af                                       ; $5B73: $F5
    ld   hl, wEntitiesPrivateState1Table          ; $5B74: $21 $B0 $C2
    add  hl, bc                                   ; $5B77: $09
    ld   a, [hl]                                  ; $5B78: $7E
    ldh  [hLinkPositionX], a                      ; $5B79: $E0 $98
    ld   hl, wEntitiesPrivateState2Table          ; $5B7B: $21 $C0 $C2
    add  hl, bc                                   ; $5B7E: $09
    ld   a, [hl]                                  ; $5B7F: $7E
    ldh  [hLinkPositionY], a                      ; $5B80: $E0 $99
    ld   hl, wEntitiesPrivateCountdown2Table      ; $5B82: $21 $00 $C3
    add  hl, bc                                   ; $5B85: $09
    ld   a, [wC168]                               ; $5B86: $FA $68 $C1
    or   [hl]                                     ; $5B89: $B6
    ld   a, $10                                   ; $5B8A: $3E $10
    ld   e, $10                                   ; $5B8C: $1E $10
    jr   nz, jr_007_5B94                          ; $5B8E: $20 $04

    ld   a, $08                                   ; $5B90: $3E $08
    ld   e, $08                                   ; $5B92: $1E $08

jr_007_5B94:
    push de                                       ; $5B94: $D5
    call ApplyVectorTowardsLink_trampoline        ; $5B95: $CD $AA $3B
    pop  de                                       ; $5B98: $D1
    ld   hl, wEntitiesSpeedZTable                 ; $5B99: $21 $20 $C3
    add  hl, bc                                   ; $5B9C: $09
    ld   [hl], e                                  ; $5B9D: $73
    ld   a, [wC168]                               ; $5B9E: $FA $68 $C1
    and  a                                        ; $5BA1: $A7
    jr   z, jr_007_5BBE                           ; $5BA2: $28 $1A

    ldh  a, [hScratch0]                           ; $5BA4: $F0 $D7
    call GetEntitySpeedYAddress                   ; $5BA6: $CD $05 $40
    cpl                                           ; $5BA9: $2F
    inc  a                                        ; $5BAA: $3C
    ld   [hl], a                                  ; $5BAB: $77
    ldh  a, [hScratch1]                           ; $5BAC: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ; $5BAE: $21 $40 $C2
    add  hl, bc                                   ; $5BB1: $09
    cpl                                           ; $5BB2: $2F
    inc  a                                        ; $5BB3: $3C
    ld   [hl], a                                  ; $5BB4: $77
    ldh  a, [hActiveEntityPosY]                   ; $5BB5: $F0 $EF
    cp   $90                                      ; $5BB7: $FE $90
    jr   c, jr_007_5BBE                           ; $5BB9: $38 $03

    call func_007_7EA4                            ; $5BBB: $CD $A4 $7E

jr_007_5BBE:
    pop  af                                       ; $5BBE: $F1
    ldh  [hLinkPositionY], a                      ; $5BBF: $E0 $99
    pop  af                                       ; $5BC1: $F1
    ldh  [hLinkPositionX], a                      ; $5BC2: $E0 $98
    call IncrementEntityState                     ; $5BC4: $CD $12 $3B
    call func_007_5B08                            ; $5BC7: $CD $08 $5B

jr_007_5BCA:
    call GetEntitySpeedYAddress                   ; $5BCA: $CD $05 $40
    ld   a, [hl]                                  ; $5BCD: $7E
    and  $80                                      ; $5BCE: $E6 $80
    ld   a, $02                                   ; $5BD0: $3E $02
    jr   z, jr_007_5BD6                           ; $5BD2: $28 $02

    ld   a, $04                                   ; $5BD4: $3E $04

jr_007_5BD6:
    jp   SetEntitySpriteVariant                   ; $5BD6: $C3 $0C $3B

func_007_5BD9::
    ldh  a, [hFFE8]                               ; $5BD9: $F0 $E8
    and  a                                        ; $5BDB: $A7
    jr   z, jr_007_5BE8                           ; $5BDC: $28 $0A

    call GetEntityTransitionCountdown             ; $5BDE: $CD $05 $0C
    ld   [hl], $08                                ; $5BE1: $36 $08
    call IncrementEntityState                     ; $5BE3: $CD $12 $3B
    dec  [hl]                                     ; $5BE6: $35
    dec  [hl]                                     ; $5BE7: $35

jr_007_5BE8:
    ld   a, $03                                   ; $5BE8: $3E $03
    call SetEntitySpriteVariant                   ; $5BEA: $CD $0C $3B
    jp   func_007_7E0A                            ; $5BED: $C3 $0A $7E

func_007_5BF0::
    ret                                           ; $5BF0: $C9

Data_007_5BF1::
    db   $6A, $00, $6A, $20, $68, $00, $68, $20

BlooperEntityHandler::
    ld   de, Data_007_5BF1                        ; $5BF9: $11 $F1 $5B
    call RenderActiveEntitySpritesPair            ; $5BFC: $CD $C0 $3B
    call func_007_7D96                            ; $5BFF: $CD $96 $7D
    call func_007_7DC3                            ; $5C02: $CD $C3 $7D
    call label_3B39                               ; $5C05: $CD $39 $3B
    call func_007_7E0A                            ; $5C08: $CD $0A $7E

jr_007_5C0B:
    call label_3B23                               ; $5C0B: $CD $23 $3B
    ld   hl, wEntitiesUnknowTableI                ; $5C0E: $21 $70 $C4
    add  hl, bc                                   ; $5C11: $09
    ld   a, [hl]                                  ; $5C12: $7E
    and  a                                        ; $5C13: $A7
    jr   nz, jr_007_5C2A                          ; $5C14: $20 $14

    ld   hl, wEntitiesUnknowTableV                ; $5C16: $21 $80 $C4
    add  hl, bc                                   ; $5C19: $09
    ld   [hl], $10                                ; $5C1A: $36 $10
    ldh  a, [hActiveEntityPosX]                   ; $5C1C: $F0 $EE
    ld   hl, wEntitiesPosXTable                   ; $5C1E: $21 $00 $C2
    add  hl, bc                                   ; $5C21: $09
    ld   [hl], a                                  ; $5C22: $77
    ldh  a, [hActiveEntityPosY]                   ; $5C23: $F0 $EF
    ld   hl, wEntitiesPosYTable                   ; $5C25: $21 $10 $C2
    add  hl, bc                                   ; $5C28: $09
    ld   [hl], a                                  ; $5C29: $77

jr_007_5C2A:
    xor  a                                        ; $5C2A: $AF
    call SetEntitySpriteVariant                   ; $5C2B: $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ; $5C2E: $F0 $F0
    JP_TABLE                                      ; $5C30
._00 dw func_007_5C35                             ; $5C31
._01 dw func_007_5C79                             ; $5C33

func_007_5C35::
    call GetEntityTransitionCountdown             ; $5C35: $CD $05 $0C
    jr   nz, jr_007_5C58                          ; $5C38: $20 $1E

    call func_007_7E6D                            ; $5C3A: $CD $6D $7E
    ld   a, e                                     ; $5C3D: $7B
    cp   $03                                      ; $5C3E: $FE $03
    jr   z, jr_007_5C58                           ; $5C40: $28 $16

    call ClearEntitySpeed                         ; $5C42: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $5C45: $CD $05 $0C
    ld   [hl], $25                                ; $5C48: $36 $25
    call func_007_7E5D                            ; $5C4A: $CD $5D $7E
    ld   hl, wEntitiesDirectionTable              ; $5C4D: $21 $80 $C3
    add  hl, bc                                   ; $5C50: $09
    ld   [hl], e                                  ; $5C51: $73
    call IncrementEntityState                     ; $5C52: $CD $12 $3B
    ld   [hl], $01                                ; $5C55: $36 $01
    ret                                           ; $5C57: $C9

jr_007_5C58:
    call GetEntitySpeedYAddress                   ; $5C58: $CD $05 $40
    ld   a, [hl]                                  ; $5C5B: $7E
    sub  $04                                      ; $5C5C: $D6 $04

jr_007_5C5E:
    jr   z, jr_007_5C67                           ; $5C5E: $28 $07

    and  $80                                      ; $5C60: $E6 $80
    jr   z, jr_007_5C66                           ; $5C62: $28 $02

    inc  [hl]                                     ; $5C64: $34
    inc  [hl]                                     ; $5C65: $34

jr_007_5C66:
    dec  [hl]                                     ; $5C66: $35

jr_007_5C67:
    ld   hl, wEntitiesSpeedXTable                 ; $5C67: $21 $40 $C2
    add  hl, bc                                   ; $5C6A: $09
    ld   a, [hl]                                  ; $5C6B: $7E
    and  a                                        ; $5C6C: $A7
    jr   z, jr_007_5C76                           ; $5C6D: $28 $07

    and  $80                                      ; $5C6F: $E6 $80
    jr   z, jr_007_5C75                           ; $5C71: $28 $02

    inc  [hl]                                     ; $5C73: $34
    inc  [hl]                                     ; $5C74: $34

jr_007_5C75:
    dec  [hl]                                     ; $5C75: $35

jr_007_5C76:
    ret                                           ; $5C76: $C9

Data_007_5C77::
    db   $01, $FF

func_007_5C79::
    call GetEntityTransitionCountdown             ; $5C79: $CD $05 $0C
    jr   nz, jr_007_5C85                          ; $5C7C: $20 $07

    ld   [hl], $40                                ; $5C7E: $36 $40
    call IncrementEntityState                     ; $5C80: $CD $12 $3B
    ld   [hl], b                                  ; $5C83: $70
    ret                                           ; $5C84: $C9

jr_007_5C85:
    ldh  a, [hFrameCounter]                       ; $5C85: $F0 $E7
    and  $01                                      ; $5C87: $E6 $01
    jr   nz, jr_007_5CA0                          ; $5C89: $20 $15

    call GetEntitySpeedYAddress                   ; $5C8B: $CD $05 $40
    dec  [hl]                                     ; $5C8E: $35
    ld   hl, wEntitiesDirectionTable              ; $5C8F: $21 $80 $C3
    add  hl, bc                                   ; $5C92: $09
    ld   e, [hl]                                  ; $5C93: $5E
    ld   d, b                                     ; $5C94: $50
    ld   hl, Data_007_5C77                        ; $5C95: $21 $77 $5C
    add  hl, de                                   ; $5C98: $19
    ld   a, [hl]                                  ; $5C99: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5C9A: $21 $40 $C2
    add  hl, bc                                   ; $5C9D: $09
    add  [hl]                                     ; $5C9E: $86
    ld   [hl], a                                  ; $5C9F: $77

jr_007_5CA0:
    ld   a, $01                                   ; $5CA0: $3E $01
    jp   SetEntitySpriteVariant                   ; $5CA2: $C3 $0C $3B

func_007_5CA5::
    ldh  a, [hActiveEntitySpriteVariant]          ; $5CA5: $F0 $F1
    inc  a                                        ; $5CA7: $3C
    jr   z, jr_007_5CF3                           ; $5CA8: $28 $49

    push hl                                       ; $5CAA: $E5
    ld   a, [wOAMNextAvailableSlot]               ; $5CAB: $FA $C0 $C3
    ld   e, a                                     ; $5CAE: $5F
    ld   d, $00                                   ; $5CAF: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $5CB1: $21 $30 $C0
    add  hl, de                                   ; $5CB4: $19
    ld   e, l                                     ; $5CB5: $5D
    ld   d, h                                     ; $5CB6: $54
    pop  hl                                       ; $5CB7: $E1

jr_007_5CB8:
    ldh  a, [hActiveEntityVisualPosY]             ; $5CB8: $F0 $EC
    add  [hl]                                     ; $5CBA: $86
    cp   $7E                                      ; $5CBB: $FE $7E
    jr   c, jr_007_5CC0                           ; $5CBD: $38 $01

    xor  a                                        ; $5CBF: $AF

jr_007_5CC0:
    ld   [de], a                                  ; $5CC0: $12
    inc  hl                                       ; $5CC1: $23
    inc  de                                       ; $5CC2: $13
    push bc                                       ; $5CC3: $C5
    ld   a, [wScreenShakeHorizontal]              ; $5CC4: $FA $55 $C1
    ld   c, a                                     ; $5CC7: $4F
    ldh  a, [hActiveEntityPosX]                   ; $5CC8: $F0 $EE
    add  [hl]                                     ; $5CCA: $86
    sub  c                                        ; $5CCB: $91
    ld   [de], a                                  ; $5CCC: $12
    inc  hl                                       ; $5CCD: $23
    inc  de                                       ; $5CCE: $13
    ldh  a, [hActiveEntityTilesOffset]            ; $5CCF: $F0 $F5
    ld   c, a                                     ; $5CD1: $4F
    ld   a, [hl+]                                 ; $5CD2: $2A
    push af                                       ; $5CD3: $F5
    add  c                                        ; $5CD4: $81
    ld   [de], a                                  ; $5CD5: $12
    pop  af                                       ; $5CD6: $F1
    cp   $FF                                      ; $5CD7: $FE $FF
    jr   nz, jr_007_5CDF                          ; $5CD9: $20 $04

    dec  de                                       ; $5CDB: $1B
    xor  a                                        ; $5CDC: $AF
    ld   [de], a                                  ; $5CDD: $12
    inc  de                                       ; $5CDE: $13

jr_007_5CDF:
    pop  bc                                       ; $5CDF: $C1
    inc  de                                       ; $5CE0: $13
    ldh  a, [hActiveEntityFlipAttribute]          ; $5CE1: $F0 $ED
    xor  [hl]                                     ; $5CE3: $AE
    inc  hl                                       ; $5CE4: $23
    ld   [de], a                                  ; $5CE5: $12
    inc  de                                       ; $5CE6: $13
    dec  c                                        ; $5CE7: $0D
    jr   nz, jr_007_5CB8                          ; $5CE8: $20 $CE

    ld   a, [wActiveEntityIndex]                  ; $5CEA: $FA $23 $C1
    ld   c, a                                     ; $5CED: $4F
    ld   a, $0A                                   ; $5CEE: $3E $0A
    jp   label_3DA0                               ; $5CF0: $C3 $A0 $3D

jr_007_5CF3:
    ld   a, [wActiveEntityIndex]                  ; $5CF3: $FA $23 $C1
    ld   c, a                                     ; $5CF6: $4F
    ret                                           ; $5CF7: $C9

Data_007_5CF8::
    db   $00, $00, $4C, $07, $00, $08, $4C, $27, $F0, $00, $4A, $07, $F0, $08, $4A, $27
    db   $E0, $00, $4A, $07, $E0, $08, $4A, $27, $D0, $00, $4A, $07, $D0, $08, $4A, $27
    db   $C0, $00, $48, $07, $C0, $08, $48, $27, $00, $00, $4A, $07, $00, $08, $4A, $27
    db   $F0, $00, $4A, $07, $F0, $08, $4A, $27, $E0, $00, $4A, $07, $E0, $08, $4A, $27
    db   $D0, $00, $48, $07, $D0, $08, $48, $27, $C0, $00, $FF, $07, $C0, $08, $FF, $27
    db   $00, $00, $4A, $07, $00, $08, $4A, $27, $F0, $00, $4A, $07, $F0, $08, $4A, $27
    db   $E0, $00, $48, $07, $E0, $08, $48, $27, $D0, $00, $FF, $07, $D0, $08, $FF, $27
    db   $C0, $00, $FF, $07, $C0, $08, $FF, $27, $00, $00, $4A, $07, $00, $08, $4A, $27
    db   $F0, $00, $48, $07, $F0, $08, $48, $27, $E0, $00, $FF, $07, $E0, $08, $FF, $27
    db   $D0, $00, $FF, $07, $D0, $08, $FF, $27, $C0, $00, $FF, $07, $C0, $08, $FF, $27
    db   $00, $00, $48, $07, $00, $08, $48, $27, $F0, $00, $FF, $07, $F0, $08, $FF, $27
    db   $E0, $00, $FF, $07, $E0, $08, $FF, $27, $D0, $00, $FF, $07, $D0, $08, $FF, $27
    db   $C0, $00, $FF, $07, $C0, $08, $FF, $27

SmashablePillarEntityHandler::
    ldh  a, [hLinkPositionY]                      ; $5DC0: $F0 $99
    ld   e, a                                     ; $5DC2: $5F
    ld   hl, wEntitiesPosYTable                   ; $5DC3: $21 $10 $C2
    add  hl, bc                                   ; $5DC6: $09
    ld   a, [hl]                                  ; $5DC7: $7E
    sub  e                                        ; $5DC8: $93
    jr   c, jr_007_5DD0                           ; $5DC9: $38 $05

    ld   a, $01                                   ; $5DCB: $3E $01
    ld   [$DE00], a                               ; $5DCD: $EA $00 $DE

jr_007_5DD0:
    ld   hl, wEntitiesPrivateState1Table          ; $5DD0: $21 $B0 $C2
    add  hl, bc                                   ; $5DD3: $09
    ld   a, [hl]                                  ; $5DD4: $7E
    cp   $02                                      ; $5DD5: $FE $02
    jp   z, label_007_5FAB                        ; $5DD7: $CA $AB $5F

    and  a                                        ; $5DDA: $A7
    jp   nz, label_007_5F4D                       ; $5DDB: $C2 $4D $5F

    ldh  a, [hRoomStatus]                         ; $5DDE: $F0 $F8
    and  $20                                      ; $5DE0: $E6 $20
    jp   nz, func_007_7EA4                        ; $5DE2: $C2 $A4 $7E

    ld   a, [wRoomTransitionState]                ; $5DE5: $FA $24 $C1
    and  a                                        ; $5DE8: $A7
    jr   nz, jr_007_5DF5                          ; $5DE9: $20 $0A

    ld   hl, wEntitiesRoomTable                   ; $5DEB: $21 $E0 $C3
    add  hl, bc                                   ; $5DEE: $09
    ldh  a, [hMapRoom]                            ; $5DEF: $F0 $F6
    cp   [hl]                                     ; $5DF1: $BE
    jp   nz, func_007_7EA4                        ; $5DF2: $C2 $A4 $7E

jr_007_5DF5:
    ldh  a, [hActiveEntitySpriteVariant]          ; $5DF5: $F0 $F1
    cp   $05                                      ; $5DF7: $FE $05
    jr   nc, jr_007_5E12                          ; $5DF9: $30 $17

    rla                                           ; $5DFB: $17
    rla                                           ; $5DFC: $17
    and  $FC                                      ; $5DFD: $E6 $FC
    sla  a                                        ; $5DFF: $CB $27
    ld   e, a                                     ; $5E01: $5F
    sla  a                                        ; $5E02: $CB $27
    sla  a                                        ; $5E04: $CB $27
    add  e                                        ; $5E06: $83
    ld   e, a                                     ; $5E07: $5F
    ld   d, b                                     ; $5E08: $50

label_007_5E09:
    ld   hl, Data_007_5CF8                        ; $5E09: $21 $F8 $5C
    add  hl, de                                   ; $5E0C: $19
    ld   c, $0A                                   ; $5E0D: $0E $0A
    call func_007_5CA5                            ; $5E0F: $CD $A5 $5C

jr_007_5E12:
    call DecrementEntityIgnoreHitsCountdown       ; $5E12: $CD $56 $0C
    call label_3B70                               ; $5E15: $CD $70 $3B
    call func_007_7CF0                            ; $5E18: $CD $F0 $7C
    ldh  a, [hActiveEntityState]                  ; $5E1B: $F0 $F0
    JP_TABLE                                      ; $5E1D
._00 dw func_007_5E2A                             ; $5E1E
._01 dw func_007_5E2B                             ; $5E20
._02 dw func_007_5E43                             ; $5E22
._03 dw func_007_5EC5                             ; $5E24
._04 dw func_007_5EF2                             ; $5E26
._05 dw func_007_5F11                             ; $5E28

func_007_5E2A::
    ret

func_007_5E2B::
    call func_007_5EEA                            ; $5E2B: $CD $EA $5E
    call GetEntityTransitionCountdown             ; $5E2E: $CD $05 $0C
    jr   nz, func_007_5E36                        ; $5E31: $20 $03

    jp   IncrementEntityState                     ; $5E33: $C3 $12 $3B

func_007_5E36::
    ld   e, $00                                   ; $5E36: $1E $00
    and  $04                                      ; $5E38: $E6 $04
    jr   z, jr_007_5E3E                           ; $5E3A: $28 $02

    ld   e, $02                                   ; $5E3C: $1E $02

jr_007_5E3E:
    ld   a, e                                     ; $5E3E: $7B
    ld   [wScreenShakeHorizontal], a              ; $5E3F: $EA $55 $C1
    ret                                           ; $5E42: $C9

func_007_5E43::
    call func_007_5EEA                            ; $5E43: $CD $EA $5E
    ldh  a, [hFrameCounter]                       ; $5E46: $F0 $E7
    call func_007_5E36                            ; $5E48: $CD $36 $5E
    ldh  a, [hFrameCounter]                       ; $5E4B: $F0 $E7
    and  $1F                                      ; $5E4D: $E6 $1F
    jr   nz, jr_007_5E67                          ; $5E4F: $20 $16

    ld   hl, wEntitiesSpriteVariantTable          ; $5E51: $21 $B0 $C3
    add  hl, bc                                   ; $5E54: $09
    ld   a, [hl]                                  ; $5E55: $7E
    inc  a                                        ; $5E56: $3C
    ld   [hl], a                                  ; $5E57: $77
    cp   $05                                      ; $5E58: $FE $05
    jp   z, label_007_5EA7                        ; $5E5A: $CA $A7 $5E

    call GetRandomByte                            ; $5E5D: $CD $0D $28
    and  $03                                      ; $5E60: $E6 $03
    jr   z, jr_007_5E67                           ; $5E62: $28 $03

    call func_007_5F61                            ; $5E64: $CD $61 $5F

jr_007_5E67:
    ldh  a, [hFrameCounter]                       ; $5E67: $F0 $E7
    and  $03                                      ; $5E69: $E6 $03
    jr   nz, jr_007_5EA6                          ; $5E6B: $20 $39

    ld   a, $A7                                   ; $5E6D: $3E $A7
    call SpawnNewEntity_trampoline                ; $5E6F: $CD $86 $3B
    jr   c, jr_007_5EA6                           ; $5E72: $38 $32

    call GetRandomByte                            ; $5E74: $CD $0D $28
    and  $07                                      ; $5E77: $E6 $07
    sub  $04                                      ; $5E79: $D6 $04
    ld   hl, hScratch1                            ; $5E7B: $21 $D8 $FF
    add  [hl]                                     ; $5E7E: $86
    ld   hl, wEntitiesPosYTable                   ; $5E7F: $21 $10 $C2
    add  hl, de                                   ; $5E82: $19
    ld   [hl], a                                  ; $5E83: $77
    call GetRandomByte                            ; $5E84: $CD $0D $28
    and  $1F                                      ; $5E87: $E6 $1F
    sub  $10                                      ; $5E89: $D6 $10
    ld   hl, hScratch0                            ; $5E8B: $21 $D7 $FF
    add  [hl]                                     ; $5E8E: $86
    ld   hl, wEntitiesPosXTable                   ; $5E8F: $21 $00 $C2
    add  hl, de                                   ; $5E92: $19
    ld   [hl], a                                  ; $5E93: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5E94: $21 $40 $C3
    add  hl, de                                   ; $5E97: $19
    ld   [hl], $C2                                ; $5E98: $36 $C2
    ld   hl, wEntitiesTransitionCountdownTable    ; $5E9A: $21 $E0 $C2
    add  hl, de                                   ; $5E9D: $19
    ld   [hl], $10                                ; $5E9E: $36 $10
    ld   hl, wEntitiesPrivateState1Table          ; $5EA0: $21 $B0 $C2
    add  hl, de                                   ; $5EA3: $19
    ld   [hl], $01                                ; $5EA4: $36 $01

jr_007_5EA6:
    ret                                           ; $5EA6: $C9

label_007_5EA7:
    ld   a, $00                                   ; $5EA7: $3E $00
    ld   [wScreenShakeHorizontal], a              ; $5EA9: $EA $55 $C1
    ld   a, [wNumberOfDungeon7PillarsDestroyed]   ; $5EAC: $FA $72 $DB
    inc  a                                        ; $5EAF: $3C
    ld   [wNumberOfDungeon7PillarsDestroyed], a   ; $5EB0: $EA $72 $DB
    cp   $04                                      ; $5EB3: $FE $04
    jr   c, jr_007_5EBF                           ; $5EB5: $38 $08

    call GetEntityTransitionCountdown             ; $5EB7: $CD $05 $0C
    ld   [hl], $20                                ; $5EBA: $36 $20
    jp   IncrementEntityState                     ; $5EBC: $C3 $12 $3B

jr_007_5EBF:
    call func_007_6E7F                            ; $5EBF: $CD $7F $6E
    jp   func_007_7EA4                            ; $5EC2: $C3 $A4 $7E

func_007_5EC5::
    call GetEntityTransitionCountdown             ; $5EC5: $CD $05 $0C
    jr   nz, jr_007_5EDE                          ; $5EC8: $20 $14

    ld   [hl], $20                                ; $5ECA: $36 $20
    ld   a, $08                                   ; $5ECC: $3E $08
    ld   [wGameplayType], a                       ; $5ECE: $EA $95 $DB
    xor  a                                        ; $5ED1: $AF
    ld   [wTransitionSequenceCounter], a          ; $5ED2: $EA $6B $C1
    ld   [wC16C], a                               ; $5ED5: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $5ED8: $EA $96 $DB
    jp   IncrementEntityState                     ; $5EDB: $C3 $12 $3B

jr_007_5EDE:
    ld   e, $00                                   ; $5EDE: $1E $00
    and  $04                                      ; $5EE0: $E6 $04
    jr   z, jr_007_5EE6                           ; $5EE2: $28 $02

    ld   e, $02                                   ; $5EE4: $1E $02

jr_007_5EE6:
    ld   a, e                                     ; $5EE6: $7B
    ld   [wScreenShakeHorizontal], a              ; $5EE7: $EA $55 $C1

func_007_5EEA::
    ld   a, $02                                   ; $5EEA: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5EEC: $E0 $A1
    ld   [wC111], a                               ; $5EEE: $EA $11 $C1
    ret                                           ; $5EF1: $C9

func_007_5EF2::
    xor  a                                        ; $5EF2: $AF
    ld   [wScreenShakeHorizontal], a              ; $5EF3: $EA $55 $C1
    call GetEntityTransitionCountdown             ; $5EF6: $CD $05 $0C
    jr   nz, jr_007_5F06                          ; $5EF9: $20 $0B

    call func_007_6E7F                            ; $5EFB: $CD $7F $6E
    ld   hl, wHasInstrument7                      ; $5EFE: $21 $6B $DB
    set  2, [hl]                                  ; $5F01: $CB $D6
    jp   func_007_7EA4                            ; $5F03: $C3 $A4 $7E

jr_007_5F06:
    jp   func_007_5EEA                            ; $5F06: $C3 $EA $5E

Data_007_5F09::
    db   $00, $02, $04, $06, $06, $04, $02, $00

func_007_5F11::
    xor  a                                        ; $5F11: $AF
    ld   [wScreenShakeVertical], a                ; $5F12: $EA $56 $C1
    call GetEntityTransitionCountdown             ; $5F15: $CD $05 $0C
    jr   nz, jr_007_5F1D                          ; $5F18: $20 $03

    jp   func_007_7EA4                            ; $5F1A: $C3 $A4 $7E

jr_007_5F1D:
    push af                                       ; $5F1D: $F5
    and  $07                                      ; $5F1E: $E6 $07
    ld   e, a                                     ; $5F20: $5F
    ld   d, b                                     ; $5F21: $50
    ld   hl, Data_007_5F09                        ; $5F22: $21 $09 $5F
    add  hl, de                                   ; $5F25: $19
    ld   a, [hl]                                  ; $5F26: $7E
    ld   [wScreenShakeVertical], a                ; $5F27: $EA $56 $C1
    pop  af                                       ; $5F2A: $F1
    cp   $20                                      ; $5F2B: $FE $20
    jr   nc, jr_007_5F37                          ; $5F2D: $30 $08

    and  $03                                      ; $5F2F: $E6 $03
    jr   nz, jr_007_5F37                          ; $5F31: $20 $04

    call func_007_5F61                            ; $5F33: $CD $61 $5F
    xor  a                                        ; $5F36: $AF

jr_007_5F37:
    cp   $40                                      ; $5F37: $FE $40
    jr   c, jr_007_5F44                           ; $5F39: $38 $09

    and  $07                                      ; $5F3B: $E6 $07
    jr   nz, jr_007_5F44                          ; $5F3D: $20 $05

    ld   hl, hNoiseSfx                            ; $5F3F: $21 $F4 $FF
    ld   [hl], $0C                                ; $5F42: $36 $0C

jr_007_5F44:
    ret                                           ; $5F44: $C9

Data_007_5F45::
    db   $30, $01, $30, $21, $32, $01, $32, $21

label_007_5F4D:
    ld   de, Data_007_5F45                        ; $5F4D: $11 $45 $5F
    call RenderActiveEntitySpritesPair            ; $5F50: $CD $C0 $3B
    call GetEntityTransitionCountdown             ; $5F53: $CD $05 $0C
    jp   z, func_007_7EA4                         ; $5F56: $CA $A4 $7E

    cp   $04                                      ; $5F59: $FE $04
    ret  nz                                       ; $5F5B: $C0

    ld   a, $01                                   ; $5F5C: $3E $01
    jp   SetEntitySpriteVariant                   ; $5F5E: $C3 $0C $3B

func_007_5F61::
    ld   a, $A7                                   ; $5F61: $3E $A7
    call SpawnNewEntity_trampoline                ; $5F63: $CD $86 $3B
    jr   c, jr_007_5F9A                           ; $5F66: $38 $32

    ld   hl, wEntitiesPrivateState1Table          ; $5F68: $21 $B0 $C2
    add  hl, de                                   ; $5F6B: $19
    ld   [hl], $02                                ; $5F6C: $36 $02
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5F6E: $21 $40 $C3
    add  hl, de                                   ; $5F71: $19
    ld   [hl], $D1                                ; $5F72: $36 $D1
    ld   hl, wEntitiesPosZTable                   ; $5F74: $21 $10 $C3
    add  hl, de                                   ; $5F77: $19
    ld   [hl], $70                                ; $5F78: $36 $70
    call GetRandomByte                            ; $5F7A: $CD $0D $28
    and  $3F                                      ; $5F7D: $E6 $3F
    sub  $20                                      ; $5F7F: $D6 $20
    ld   hl, hScratch0                            ; $5F81: $21 $D7 $FF
    add  [hl]                                     ; $5F84: $86
    ld   hl, wEntitiesPosXTable                   ; $5F85: $21 $00 $C2
    add  hl, de                                   ; $5F88: $19
    ld   [hl], a                                  ; $5F89: $77
    call GetRandomByte                            ; $5F8A: $CD $0D $28
    and  $3F                                      ; $5F8D: $E6 $3F
    sub  $20                                      ; $5F8F: $D6 $20
    ld   hl, hScratch1                            ; $5F91: $21 $D8 $FF
    add  [hl]                                     ; $5F94: $86
    ld   hl, wEntitiesPosYTable                   ; $5F95: $21 $10 $C2
    add  hl, de                                   ; $5F98: $19
    ld   [hl], a                                  ; $5F99: $77

jr_007_5F9A:
    ret                                           ; $5F9A: $C9

Data_007_5F9B::
    db   $16, $03, $16, $23

Data_007_5F9F::
    db   $18, $10, $0C, $08

Data_007_5FA3::
    db   $0C, $F4, $0C, $F4

Data_007_5FA7::
    db   $F4, $F4, $0C, $0C

label_007_5FAB:
    ldh  a, [hActiveEntityVisualPosY]             ; $5FAB: $F0 $EC
    add  $08                                      ; $5FAD: $C6 $08
    ldh  [hActiveEntityVisualPosY], a             ; $5FAF: $E0 $EC

jr_007_5FB1:
    ld   de, Data_007_5F9B                        ; $5FB1: $11 $9B $5F
    call RenderActiveEntitySprite                 ; $5FB4: $CD $77 $3C
    call func_007_7E0A                            ; $5FB7: $CD $0A $7E
    call func_007_7E43                            ; $5FBA: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $5FBD: $21 $20 $C3
    add  hl, bc                                   ; $5FC0: $09
    dec  [hl]                                     ; $5FC1: $35
    dec  [hl]                                     ; $5FC2: $35
    ld   hl, wEntitiesPosZTable                   ; $5FC3: $21 $10 $C3
    add  hl, bc                                   ; $5FC6: $09
    ld   a, [hl]                                  ; $5FC7: $7E
    and  $80                                      ; $5FC8: $E6 $80
    ret  z                                        ; $5FCA: $C8

    ld   [hl], b                                  ; $5FCB: $70
    ld   hl, wEntitiesStateTable                  ; $5FCC: $21 $90 $C2
    add  hl, bc                                   ; $5FCF: $09
    ld   a, [hl]                                  ; $5FD0: $7E
    inc  [hl]                                     ; $5FD1: $34
    cp   $04                                      ; $5FD2: $FE $04
    jp   z, func_007_7EA4                         ; $5FD4: $CA $A4 $7E

    ld   e, a                                     ; $5FD7: $5F
    ld   d, b                                     ; $5FD8: $50
    ld   hl, Data_007_5F9F                        ; $5FD9: $21 $9F $5F
    add  hl, de                                   ; $5FDC: $19
    ld   a, [hl]                                  ; $5FDD: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $5FDE: $21 $20 $C3
    add  hl, bc                                   ; $5FE1: $09
    ld   [hl], a                                  ; $5FE2: $77
    call GetRandomByte                            ; $5FE3: $CD $0D $28
    and  $03                                      ; $5FE6: $E6 $03
    ld   e, a                                     ; $5FE8: $5F
    ld   d, b                                     ; $5FE9: $50
    ld   hl, Data_007_5FA3                        ; $5FEA: $21 $A3 $5F
    add  hl, de                                   ; $5FED: $19
    ld   a, [hl]                                  ; $5FEE: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5FEF: $21 $40 $C2
    add  hl, bc                                   ; $5FF2: $09
    ld   [hl], a                                  ; $5FF3: $77
    ld   hl, Data_007_5FA7                        ; $5FF4: $21 $A7 $5F
    add  hl, de                                   ; $5FF7: $19

jr_007_5FF8:
    ld   a, [hl]                                  ; $5FF8: $7E
    call GetEntitySpeedYAddress                   ; $5FF9: $CD $05 $40
    ld   [hl], a                                  ; $5FFC: $77
    ld   a, e                                     ; $5FFD: $7B
    and  $01                                      ; $5FFE: $E6 $01
    jp   SetEntitySpriteVariant                   ; $6000: $C3 $0C $3B

Data_007_6003::
    db   $4E, $00, $4E, $20

EntityA8Handler::
    ldh  a, [hActiveEntityStatus]                 ; $6007: $F0 $EA
    cp   $07                                      ; $6009: $FE $07
    jr   nz, jr_007_602A                          ; $600B: $20 $1D

    ld   a, [wLinkMotionState]                    ; $600D: $FA $1C $C1
    cp   $05                                      ; $6010: $FE $05
    jr   nz, jr_007_6019                          ; $6012: $20 $05

    ld   a, $10                                   ; $6014: $3E $10
    ld   [$C5AE], a                               ; $6016: $EA $AE $C5

jr_007_6019:
    ldh  a, [hMapRoom]                            ; $6019: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $601B: $21 $E0 $C3
    add  hl, bc                                   ; $601E: $09
    ld   [hl], a                                  ; $601F: $77
    ld   hl, wEntitiesPosXSignTable               ; $6020: $21 $20 $C2
    add  hl, bc                                   ; $6023: $09
    ld   [hl], b                                  ; $6024: $70
    ld   hl, wEntitiesPosYSignTable               ; $6025: $21 $30 $C2
    add  hl, bc                                   ; $6028: $09
    ld   [hl], b                                  ; $6029: $70

jr_007_602A:
    ld   de, Data_007_6003                        ; $602A: $11 $03 $60
    call RenderActiveEntitySpritesPair            ; $602D: $CD $C0 $3B
    ld   a, [wRoomTransitionState]                ; $6030: $FA $24 $C1
    and  a                                        ; $6033: $A7
    ret  nz                                       ; $6034: $C0

    ldh  a, [hMapRoom]                            ; $6035: $F0 $F6
    ld   [wWreckingBallRoom], a                   ; $6037: $EA $6F $DB
    ldh  a, [hActiveEntityPosX]                   ; $603A: $F0 $EE
    ld   [wWreckingBallPosX], a                   ; $603C: $EA $70 $DB
    ldh  a, [hActiveEntityPosY]                   ; $603F: $F0 $EF
    ld   [wWreckingBallPosY], a                   ; $6041: $EA $71 $DB
    ld   a, [wDialogState]                        ; $6044: $FA $9F $C1
    and  a                                        ; $6047: $A7
    ret  nz                                       ; $6048: $C0

    ldh  a, [hActiveEntityStatus]                 ; $6049: $F0 $EA
    cp   $02                                      ; $604B: $FE $02
    ret  z                                        ; $604D: $C8

    call DecrementEntityIgnoreHitsCountdown       ; $604E: $CD $56 $0C
    call label_3B70                               ; $6051: $CD $70 $3B
    call func_007_7E0A                            ; $6054: $CD $0A $7E
    call func_007_7E43                            ; $6057: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $605A: $21 $20 $C3
    add  hl, bc                                   ; $605D: $09
    dec  [hl]                                     ; $605E: $35
    dec  [hl]                                     ; $605F: $35
    ld   hl, wEntitiesPosZTable                   ; $6060: $21 $10 $C3
    add  hl, bc                                   ; $6063: $09
    ld   a, [hl]                                  ; $6064: $7E
    ldh  [hDungeonFloorTile], a                   ; $6065: $E0 $E9
    and  $80                                      ; $6067: $E6 $80
    ldh  [hFFE8], a                               ; $6069: $E0 $E8
    jr   z, jr_007_608F                           ; $606B: $28 $22

    ld   [hl], b                                  ; $606D: $70
    ld   hl, wEntitiesSpeedZTable                 ; $606E: $21 $20 $C3
    add  hl, bc                                   ; $6071: $09
    ld   a, [hl]                                  ; $6072: $7E
    sra  a                                        ; $6073: $CB $2F
    cpl                                           ; $6075: $2F
    cp   $07                                      ; $6076: $FE $07
    jr   c, jr_007_6082                           ; $6078: $38 $08

    push af                                       ; $607A: $F5
    ld   a, $17                                   ; $607B: $3E $17
    ldh  [hNoiseSfx], a                           ; $607D: $E0 $F4
    pop  af                                       ; $607F: $F1
    jr   jr_007_6083                              ; $6080: $18 $01

jr_007_6082:
    xor  a                                        ; $6082: $AF

jr_007_6083:
    ld   [hl], a                                  ; $6083: $77
    ld   hl, wEntitiesSpeedXTable                 ; $6084: $21 $40 $C2
    add  hl, bc                                   ; $6087: $09
    sra  [hl]                                     ; $6088: $CB $2E
    call GetEntitySpeedYAddress                   ; $608A: $CD $05 $40
    sra  [hl]                                     ; $608D: $CB $2E

jr_007_608F:
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $608F: $21 $10 $C4
    add  hl, bc                                   ; $6092: $09
    ld   [hl], $03                                ; $6093: $36 $03
    ld   e, $03                                   ; $6095: $1E $03
    ld   a, e                                     ; $6097: $7B
    ldh  [hActiveEntityFlipAttribute], a          ; $6098: $E0 $ED
    ld   hl, wEntitiesPosYTable                   ; $609A: $21 $10 $C2
    add  hl, bc                                   ; $609D: $09
    ld   a, [hl]                                  ; $609E: $7E
    add  e                                        ; $609F: $83
    ld   [hl], a                                  ; $60A0: $77
    ldh  a, [hActiveEntityPosY]                   ; $60A1: $F0 $EF
    add  e                                        ; $60A3: $83
    ldh  [hActiveEntityPosY], a                   ; $60A4: $E0 $EF
    call label_3B23                               ; $60A6: $CD $23 $3B
    ldh  a, [hActiveEntityFlipAttribute]          ; $60A9: $F0 $ED
    ld   e, a                                     ; $60AB: $5F
    ld   hl, wEntitiesPosYTable                   ; $60AC: $21 $10 $C2
    add  hl, bc                                   ; $60AF: $09
    ld   a, [hl]                                  ; $60B0: $7E
    sub  e                                        ; $60B1: $93
    ld   [hl], a                                  ; $60B2: $77
    ldh  a, [hActiveEntityPosY]                   ; $60B3: $F0 $EF
    sub  e                                        ; $60B5: $93
    ldh  [hActiveEntityPosY], a                   ; $60B6: $E0 $EF
    ldh  a, [hActiveEntityState]                  ; $60B8: $F0 $F0
    JP_TABLE                                      ; $60BA
._00 dw func_007_60C1                             ; $60BB
._01 dw func_007_6134                             ; $60BD
._02 dw func_007_6135                             ; $60BF

func_007_60C1::
    ldh  a, [hDungeonFloorTile]                   ; $60C1: $F0 $E9
    dec  a                                        ; $60C3: $3D
    and  $80                                      ; $60C4: $E6 $80
    jr   z, jr_007_60DD                           ; $60C6: $28 $15

    ld   hl, wEntitiesSpeedYTable                 ; $60C8: $21 $50 $C2
    call func_007_60D1                            ; $60CB: $CD $D1 $60
    ld   hl, wEntitiesSpeedXTable                 ; $60CE: $21 $40 $C2

func_007_60D1::
    add  hl, bc                                   ; $60D1: $09
    ld   a, [hl]                                  ; $60D2: $7E
    and  a                                        ; $60D3: $A7
    jr   z, jr_007_60DD                           ; $60D4: $28 $07

    and  $80                                      ; $60D6: $E6 $80
    jr   z, jr_007_60DC                           ; $60D8: $28 $02

    inc  [hl]                                     ; $60DA: $34
    inc  [hl]                                     ; $60DB: $34

jr_007_60DC:
    dec  [hl]                                     ; $60DC: $35

jr_007_60DD:
    call CheckLinkCollisionWithEnemy_trampoline   ; $60DD: $CD $5A $3B
    jr   nc, jr_007_6133                          ; $60E0: $30 $51

    ld   a, [$C19B]                               ; $60E2: $FA $9B $C1
    and  a                                        ; $60E5: $A7
    jr   nz, jr_007_6133                          ; $60E6: $20 $4B

    ld   a, [wBButtonSlot]                        ; $60E8: $FA $00 $DB
    cp   $03                                      ; $60EB: $FE $03
    jr   nz, jr_007_60F7                          ; $60ED: $20 $08

    ldh  a, [hJoypadState]                        ; $60EF: $F0 $CC
    and  $20                                      ; $60F1: $E6 $20
    jr   nz, jr_007_6104                          ; $60F3: $20 $0F

    jr   jr_007_6133                              ; $60F5: $18 $3C

jr_007_60F7:
    ld   a, [wAButtonSlot]                        ; $60F7: $FA $01 $DB
    cp   $03                                      ; $60FA: $FE $03
    jr   nz, jr_007_6133                          ; $60FC: $20 $35

    ldh  a, [hJoypadState]                        ; $60FE: $F0 $CC
    and  $10                                      ; $6100: $E6 $10
    jr   z, jr_007_6133                           ; $6102: $28 $2F

jr_007_6104:
    ld   a, [$C3CF]                               ; $6104: $FA $CF $C3
    and  a                                        ; $6107: $A7
    jr   nz, jr_007_6133                          ; $6108: $20 $29

    inc  a                                        ; $610A: $3C
    ld   [$C3CF], a                               ; $610B: $EA $CF $C3
    ldh  a, [hActiveEntityStatus]                 ; $610E: $F0 $EA
    cp   $07                                      ; $6110: $FE $07
    jr   z, jr_007_6133                           ; $6112: $28 $1F

    call IncrementEntityState                     ; $6114: $CD $12 $3B
    ld   [hl], $02                                ; $6117: $36 $02
    ld   hl, wEntitiesStatusTable                 ; $6119: $21 $80 $C2
    add  hl, bc                                   ; $611C: $09
    ld   [hl], $07                                ; $611D: $36 $07
    ld   hl, wEntitiesUnknowTableW                ; $611F: $21 $90 $C4
    add  hl, bc                                   ; $6122: $09
    ld   [hl], b                                  ; $6123: $70
    ldh  a, [hLinkDirection]                      ; $6124: $F0 $9E
    ld   [wC15D], a                               ; $6126: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $6129: $CD $05 $0C
    ld   [hl], $02                                ; $612C: $36 $02
    ld   hl, hWaveSfx                             ; $612E: $21 $F3 $FF
    ld   [hl], $02                                ; $6131: $36 $02

jr_007_6133:
    ret                                           ; $6133: $C9

func_007_6134::
    ret                                           ; $6134: $C9

func_007_6135::
    ldh  a, [hFFE8]                               ; $6135: $F0 $E8
    and  a                                        ; $6137: $A7
    jr   nz, jr_007_6159                          ; $6138: $20 $1F

    ld   hl, wEntitiesCollisionsTable             ; $613A: $21 $A0 $C2
    add  hl, bc                                   ; $613D: $09
    ld   a, [hl]                                  ; $613E: $7E
    and  a                                        ; $613F: $A7
    jr   z, jr_007_6164                           ; $6140: $28 $22

func_007_6142::
    ld   a, JINGLE_SWORD_POKING                   ; $6142: $3E $07
    ldh  [hJingle], a                             ; $6144: $E0 $F2
    ld   hl, wEntitiesSpeedXTable                 ; $6146: $21 $40 $C2
    add  hl, bc                                   ; $6149: $09
    ld   a, [hl]                                  ; $614A: $7E
    cpl                                           ; $614B: $2F
    inc  a                                        ; $614C: $3C
    sra  a                                        ; $614D: $CB $2F
    ld   [hl], a                                  ; $614F: $77
    call GetEntitySpeedYAddress                   ; $6150: $CD $05 $40
    ld   a, [hl]                                  ; $6153: $7E
    cpl                                           ; $6154: $2F
    inc  a                                        ; $6155: $3C
    sra  a                                        ; $6156: $CB $2F
    ld   [hl], a                                  ; $6158: $77

jr_007_6159:
    ld   hl, $C5D0                                ; $6159: $21 $D0 $C5
    add  hl, bc                                   ; $615C: $09
    ld   [hl], $FF                                ; $615D: $36 $FF
    call IncrementEntityState                     ; $615F: $CD $12 $3B
    ld   [hl], b                                  ; $6162: $70
    ret                                           ; $6163: $C9

jr_007_6164:
    call func_007_7D96                            ; $6164: $CD $96 $7D
    ld   a, $0B                                   ; $6167: $3E $0B
    ld   [$C19E], a                               ; $6169: $EA $9E $C1
    call label_3B7B                               ; $616C: $CD $7B $3B
    ld   e, $0F                                   ; $616F: $1E $0F
    ld   d, b                                     ; $6171: $50

jr_007_6172:
    ld   hl, wEntitiesStatusTable                 ; $6172: $21 $80 $C2
    add  hl, de                                   ; $6175: $19
    ld   a, [hl]                                  ; $6176: $7E
    and  a                                        ; $6177: $A7
    jr   z, jr_007_6188                           ; $6178: $28 $0E

    ld   hl, wEntitiesTypeTable                   ; $617A: $21 $A0 $C3
    add  hl, de                                   ; $617D: $19
    ld   a, [hl]                                  ; $617E: $7E
    cp   $A7                                      ; $617F: $FE $A7
    jr   nz, jr_007_6188                          ; $6181: $20 $05

    push de                                       ; $6183: $D5
    call func_007_618F                            ; $6184: $CD $8F $61
    pop  de                                       ; $6187: $D1

jr_007_6188:
    dec  e                                        ; $6188: $1D
    ld   a, e                                     ; $6189: $7B
    cp   $FF                                      ; $618A: $FE $FF
    jr   nz, jr_007_6172                          ; $618C: $20 $E4

    ret                                           ; $618E: $C9

func_007_618F::
    call GetEntityTransitionCountdown             ; $618F: $CD $05 $0C
    jr   nz, jr_007_61CD                          ; $6192: $20 $39

    ld   hl, wEntitiesPosXTable                   ; $6194: $21 $00 $C2
    add  hl, de                                   ; $6197: $19
    ldh  a, [hActiveEntityPosX]                   ; $6198: $F0 $EE
    sub  [hl]                                     ; $619A: $96
    add  $10                                      ; $619B: $C6 $10
    cp   $20                                      ; $619D: $FE $20
    jr   nc, jr_007_61CD                          ; $619F: $30 $2C

    ld   hl, wEntitiesPosYTable                   ; $61A1: $21 $10 $C2
    add  hl, de                                   ; $61A4: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $61A5: $F0 $EC
    sub  [hl]                                     ; $61A7: $96
    add  $18                                      ; $61A8: $C6 $18
    cp   $28                                      ; $61AA: $FE $28
    jr   nc, jr_007_61CD                          ; $61AC: $30 $1F

    call func_007_6142                            ; $61AE: $CD $42 $61
    ld   a, $25                                   ; $61B1: $3E $25
    ldh  [hNoiseSfx], a                           ; $61B3: $E0 $F4
    ld   a, JINGLE_HUGE_BUMP                      ; $61B5: $3E $0B
    ldh  [hJingle], a                             ; $61B7: $E0 $F2
    call GetEntityTransitionCountdown             ; $61B9: $CD $05 $0C
    ld   [hl], $10                                ; $61BC: $36 $10
    ld   hl, wEntitiesStateTable                  ; $61BE: $21 $90 $C2
    add  hl, de                                   ; $61C1: $19
    ld   a, [hl]                                  ; $61C2: $7E
    and  a                                        ; $61C3: $A7
    jr   nz, jr_007_61CD                          ; $61C4: $20 $07

    inc  [hl]                                     ; $61C6: $34
    ld   hl, wEntitiesTransitionCountdownTable    ; $61C7: $21 $E0 $C2
    add  hl, de                                   ; $61CA: $19
    ld   [hl], $50                                ; $61CB: $36 $50

jr_007_61CD:
    ret                                           ; $61CD: $C9

Data_007_61CE::
    db   $50, $07, $50, $27

SideViewWeightsEntityHandler::
    ld   de, Data_007_61CE                        ; $61D2: $11 $CE $61
    call RenderActiveEntitySpritesPair            ; $61D5: $CD $C0 $3B
    call func_007_7D96                            ; $61D8: $CD $96 $7D
    call func_007_639E                            ; $61DB: $CD $9E $63
    ld   hl, wEntitiesUnknownTableD               ; $61DE: $21 $D0 $C2
    add  hl, bc                                   ; $61E1: $09
    ld   a, [hl]                                  ; $61E2: $7E
    ld   e, a                                     ; $61E3: $5F
    and  a                                        ; $61E4: $A7
    jr   nz, jr_007_61FA                          ; $61E5: $20 $13

    ld   hl, wEntitiesPrivateState2Table          ; $61E7: $21 $C0 $C2
    add  hl, bc                                   ; $61EA: $09
    ld   a, [hl]                                  ; $61EB: $7E
    and  a                                        ; $61EC: $A7
    jr   z, jr_007_6248                           ; $61ED: $28 $59

    call func_007_631C                            ; $61EF: $CD $1C $63
    ld   hl, wEntitiesUnknownTableD               ; $61F2: $21 $D0 $C2
    add  hl, de                                   ; $61F5: $19
    ld   [hl], $F0                                ; $61F6: $36 $F0
    ld   e, $10                                   ; $61F8: $1E $10

jr_007_61FA:
    ldh  a, [hFrameCounter]                       ; $61FA: $F0 $E7
    and  $01                                      ; $61FC: $E6 $01
    jr   nz, jr_007_620E                          ; $61FE: $20 $0E

    call GetEntitySpeedYAddress                   ; $6200: $CD $05 $40
    ld   a, [hl]                                  ; $6203: $7E
    sub  e                                        ; $6204: $93
    jr   z, jr_007_620E                           ; $6205: $28 $07

    and  $80                                      ; $6207: $E6 $80
    jr   z, jr_007_620D                           ; $6209: $28 $02

    inc  [hl]                                     ; $620B: $34
    inc  [hl]                                     ; $620C: $34

jr_007_620D:
    dec  [hl]                                     ; $620D: $35

jr_007_620E:
    ld   hl, wEntitiesHitboxFlagsTable            ; $620E: $21 $50 $C3
    add  hl, bc                                   ; $6211: $09
    ld   [hl], $02                                ; $6212: $36 $02
    call GetEntitySpeedYAddress                   ; $6214: $CD $05 $40
    ld   a, [hl]                                  ; $6217: $7E
    push hl                                       ; $6218: $E5
    push af                                       ; $6219: $F5
    ld   [hl], e                                  ; $621A: $73
    ld   hl, wEntitiesPosYTable                   ; $621B: $21 $10 $C2
    add  hl, bc                                   ; $621E: $09
    ld   a, [hl]                                  ; $621F: $7E
    push hl                                       ; $6220: $E5
    push af                                       ; $6221: $F5
    call label_3B23                               ; $6222: $CD $23 $3B
    pop  af                                       ; $6225: $F1
    pop  hl                                       ; $6226: $E1
    ld   [hl], a                                  ; $6227: $77
    pop  af                                       ; $6228: $F1
    pop  hl                                       ; $6229: $E1
    ld   [hl], a                                  ; $622A: $77
    ld   hl, wEntitiesHitboxFlagsTable            ; $622B: $21 $50 $C3
    add  hl, bc                                   ; $622E: $09
    ld   [hl], $30                                ; $622F: $36 $30
    ld   hl, wEntitiesCollisionsTable             ; $6231: $21 $A0 $C2
    add  hl, bc                                   ; $6234: $09
    ld   a, [hl]                                  ; $6235: $7E
    and  a                                        ; $6236: $A7
    jr   z, jr_007_6246                           ; $6237: $28 $0D

    call GetEntitySpeedYAddress                   ; $6239: $CD $05 $40
    ld   [hl], b                                  ; $623C: $70
    call func_007_631C                            ; $623D: $CD $1C $63
    ld   hl, wEntitiesSpeedYTable                 ; $6240: $21 $50 $C2
    add  hl, de                                   ; $6243: $19
    ld   [hl], $00                                ; $6244: $36 $00

jr_007_6246:
    jr   jr_007_625F                              ; $6246: $18 $17

jr_007_6248:
    call GetEntitySpeedYAddress                   ; $6248: $CD $05 $40
    ld   a, [hl]                                  ; $624B: $7E
    and  a                                        ; $624C: $A7
    jr   z, jr_007_6256                           ; $624D: $28 $07

    and  $80                                      ; $624F: $E6 $80
    jr   z, jr_007_6255                           ; $6251: $28 $02

    inc  [hl]                                     ; $6253: $34
    inc  [hl]                                     ; $6254: $34

jr_007_6255:
    dec  [hl]                                     ; $6255: $35

jr_007_6256:
    call func_007_631C                            ; $6256: $CD $1C $63
    ld   hl, wEntitiesUnknownTableD               ; $6259: $21 $D0 $C2
    add  hl, de                                   ; $625C: $19
    ld   [hl], $00                                ; $625D: $36 $00

jr_007_625F:
    ldh  a, [hActiveEntityPosY]                   ; $625F: $F0 $EF
    and  $0F                                      ; $6261: $E6 $0F
    cp   $00                                      ; $6263: $FE $00
    jr   nz, jr_007_62D1                          ; $6265: $20 $6A

    ldh  a, [hActiveEntityPosY]                   ; $6267: $F0 $EF
    sub  $10                                      ; $6269: $D6 $10
    ldh  [hSwordIntersectedAreaY], a              ; $626B: $E0 $CD
    and  $F0                                      ; $626D: $E6 $F0
    ld   e, a                                     ; $626F: $5F
    ldh  a, [hActiveEntityPosX]                   ; $6270: $F0 $EE
    sub  $08                                      ; $6272: $D6 $08
    ldh  [hSwordIntersectedAreaX], a              ; $6274: $E0 $CE
    swap a                                        ; $6276: $CB $37
    and  $0F                                      ; $6278: $E6 $0F
    or   e                                        ; $627A: $B3
    ld   e, a                                     ; $627B: $5F
    ld   d, b                                     ; $627C: $50
    call GetEntitySpeedYAddress                   ; $627D: $CD $05 $40
    ld   a, [hl]                                  ; $6280: $7E
    and  a                                        ; $6281: $A7
    jr   z, jr_007_62D1                           ; $6282: $28 $4D

    and  $80                                      ; $6284: $E6 $80
    jr   nz, jr_007_62D2                          ; $6286: $20 $4A

    ld   hl, wRoomObjects                         ; $6288: $21 $11 $D7
    add  hl, de                                   ; $628B: $19
    ld   [hl], $4D                                ; $628C: $36 $4D
    call label_2887                               ; $628E: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $6291: $F0 $FE
    and  a                                        ; $6293: $A7
    jr   z, jr_007_62A2                           ; $6294: $28 $0C

    push bc                                       ; $6296: $C5
    ld   a, $4D                                   ; $6297: $3E $4D
    ld   [$DDD8], a                               ; $6299: $EA $D8 $DD
    ld   a, $07                                   ; $629C: $3E $07
    call func_91D                                ; $629E: $CD $1D $09
    pop  bc                                       ; $62A1: $C1

jr_007_62A2:
    ld   hl, wRequestDestinationHigh              ; $62A2: $21 $01 $D6
    ld   a, [wRequests]                           ; $62A5: $FA $00 $D6
    ld   e, a                                     ; $62A8: $5F
    add  $0A                                      ; $62A9: $C6 $0A
    ld   [wRequests], a                           ; $62AB: $EA $00 $D6
    ld   d, $00                                   ; $62AE: $16 $00
    add  hl, de                                   ; $62B0: $19
    ldh  a, [$FFCF]                               ; $62B1: $F0 $CF
    ld   [hl+], a                                 ; $62B3: $22
    ldh  a, [$FFD0]                               ; $62B4: $F0 $D0
    ld   [hl+], a                                 ; $62B6: $22
    ld   a, $81                                   ; $62B7: $3E $81
    ld   [hl+], a                                 ; $62B9: $22
    ld   a, $44                                   ; $62BA: $3E $44
    ld   [hl+], a                                 ; $62BC: $22
    ld   a, $54                                   ; $62BD: $3E $54
    ld   [hl+], a                                 ; $62BF: $22
    ldh  a, [$FFCF]                               ; $62C0: $F0 $CF
    ld   [hl+], a                                 ; $62C2: $22
    ldh  a, [$FFD0]                               ; $62C3: $F0 $D0
    inc  a                                        ; $62C5: $3C
    ld   [hl+], a                                 ; $62C6: $22
    ld   a, $81                                   ; $62C7: $3E $81
    ld   [hl+], a                                 ; $62C9: $22
    ld   a, $45                                   ; $62CA: $3E $45
    ld   [hl+], a                                 ; $62CC: $22
    ld   a, $55                                   ; $62CD: $3E $55
    ld   [hl+], a                                 ; $62CF: $22
    ld   [hl], b                                  ; $62D0: $70

jr_007_62D1:
    ret                                           ; $62D1: $C9

jr_007_62D2:
    ld   hl, wRoomObjects                         ; $62D2: $21 $11 $D7
    add  hl, de                                   ; $62D5: $19
    ld   [hl], $04                                ; $62D6: $36 $04
    call label_2887                               ; $62D8: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $62DB: $F0 $FE
    and  a                                        ; $62DD: $A7
    jr   z, jr_007_62EC                           ; $62DE: $28 $0C

    push bc                                       ; $62E0: $C5
    ld   a, $04                                   ; $62E1: $3E $04
    ld   [$DDD8], a                               ; $62E3: $EA $D8 $DD
    ld   a, $07                                   ; $62E6: $3E $07
    call func_91D                                ; $62E8: $CD $1D $09
    pop  bc                                       ; $62EB: $C1

jr_007_62EC:
    ld   hl, wRequestDestinationHigh              ; $62EC: $21 $01 $D6
    ld   a, [wRequests]                           ; $62EF: $FA $00 $D6
    ld   e, a                                     ; $62F2: $5F
    add  $0A                                      ; $62F3: $C6 $0A
    ld   [wRequests], a                           ; $62F5: $EA $00 $D6
    ld   d, $00                                   ; $62F8: $16 $00
    add  hl, de                                   ; $62FA: $19
    ldh  a, [$FFCF]                               ; $62FB: $F0 $CF
    ld   [hl+], a                                 ; $62FD: $22
    ldh  a, [$FFD0]                               ; $62FE: $F0 $D0
    ld   [hl+], a                                 ; $6300: $22
    ld   a, $81                                   ; $6301: $3E $81
    ld   [hl+], a                                 ; $6303: $22
    ld   a, $7E                                   ; $6304: $3E $7E
    ld   [hl+], a                                 ; $6306: $22
    ld   a, $7E                                   ; $6307: $3E $7E
    ld   [hl+], a                                 ; $6309: $22
    ldh  a, [$FFCF]                               ; $630A: $F0 $CF
    ld   [hl+], a                                 ; $630C: $22
    ldh  a, [$FFD0]                               ; $630D: $F0 $D0
    inc  a                                        ; $630F: $3C
    ld   [hl+], a                                 ; $6310: $22
    ld   a, $81                                   ; $6311: $3E $81
    ld   [hl+], a                                 ; $6313: $22
    ld   a, $7E                                   ; $6314: $3E $7E
    ld   [hl+], a                                 ; $6316: $22
    ld   a, $7E                                   ; $6317: $3E $7E
    ld   [hl+], a                                 ; $6319: $22
    ld   [hl], b                                  ; $631A: $70
    ret                                           ; $631B: $C9

func_007_631C::
    ld   hl, wEntitiesLoadOrderTable              ; $631C: $21 $60 $C4
    add  hl, bc                                   ; $631F: $09
    ld   a, [hl]                                  ; $6320: $7E
    xor  $01                                      ; $6321: $EE $01
    ldh  [hScratch0], a                           ; $6323: $E0 $D7
    ld   e, b                                     ; $6325: $58
    ld   d, b                                     ; $6326: $50

jr_007_6327:
    ld   hl, wEntitiesStatusTable                 ; $6327: $21 $80 $C2
    add  hl, de                                   ; $632A: $19
    ld   a, [hl]                                  ; $632B: $7E
    and  a                                        ; $632C: $A7
    jr   z, jr_007_6341                           ; $632D: $28 $12

    ld   hl, wEntitiesTypeTable                   ; $632F: $21 $A0 $C3
    add  hl, de                                   ; $6332: $19
    ld   a, [hl]                                  ; $6333: $7E
    cp   $A6                                      ; $6334: $FE $A6
    jr   nz, jr_007_6341                          ; $6336: $20 $09

    ld   hl, wEntitiesLoadOrderTable              ; $6338: $21 $60 $C4
    add  hl, de                                   ; $633B: $19
    ldh  a, [hScratch0]                           ; $633C: $F0 $D7
    cp   [hl]                                     ; $633E: $BE
    jr   z, jr_007_6347                           ; $633F: $28 $06

jr_007_6341:
    inc  e                                        ; $6341: $1C
    ld   a, e                                     ; $6342: $7B
    cp   $10                                      ; $6343: $FE $10
    jr   nz, jr_007_6327                          ; $6345: $20 $E0

jr_007_6347:
    ret                                           ; $6347: $C9

Data_007_6348::
    db   $00, $00, $50, $07, $00, $08, $52, $07, $00, $10, $52, $27, $00, $18, $50, $27

SideViewPlatformHorizontalEntityHandler::
SideViewPlatformVerticalEntityHandler::
    ld   hl, Data_007_6348                        ; $6358: $21 $48 $63
    ld   c, $04                                   ; $635B: $0E $04
    call RenderActiveEntitySpritesRect            ; $635D: $CD $E6 $3C
    call func_007_7D96                            ; $6360: $CD $96 $7D
    call GetEntityTransitionCountdown             ; $6363: $CD $05 $0C
    ld   e, a                                     ; $6366: $5F
    ld   hl, wEntitiesUnknowTableY                ; $6367: $21 $D0 $C3
    add  hl, bc                                   ; $636A: $09
    inc  [hl]                                     ; $636B: $34
    ld   a, [hl]                                  ; $636C: $7E
    and  $03                                      ; $636D: $E6 $03
    or   e                                        ; $636F: $B3
    jr   nz, func_007_639E                        ; $6370: $20 $2C

    ldh  a, [hActiveEntityType]                   ; $6372: $F0 $EB
    cp   ENTITY_SIDE_VIEW_PLATFORM_VERTICAL       ; $6374: $FE $A4
    jp   z, label_007_63FB                        ; $6376: $CA $FB $63

    ld   hl, wEntitiesPrivateState1Table          ; $6379: $21 $B0 $C2
    add  hl, bc                                   ; $637C: $09
    ld   e, [hl]                                  ; $637D: $5E
    ld   d, b                                     ; $637E: $50
    ld   hl, Data_007_63F7                        ; $637F: $21 $F7 $63
    add  hl, de                                   ; $6382: $19
    ld   a, [hl]                                  ; $6383: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6384: $21 $40 $C2
    add  hl, bc                                   ; $6387: $09
    add  [hl]                                     ; $6388: $86
    ld   [hl], a                                  ; $6389: $77
    ld   hl, Data_007_63F9                        ; $638A: $21 $F9 $63
    add  hl, de                                   ; $638D: $19
    cp   [hl]                                     ; $638E: $BE
    jr   nz, func_007_639E                        ; $638F: $20 $0D

    ld   hl, wEntitiesPrivateState1Table          ; $6391: $21 $B0 $C2
    add  hl, bc                                   ; $6394: $09
    ld   a, [hl]                                  ; $6395: $7E
    xor  $01                                      ; $6396: $EE $01
    ld   [hl], a                                  ; $6398: $77
    call GetEntityTransitionCountdown             ; $6399: $CD $05 $0C
    ld   [hl], $6A                                ; $639C: $36 $6A

func_007_639E::
    ld   hl, wEntitiesPrivateState2Table          ; $639E: $21 $C0 $C2
    add  hl, bc                                   ; $63A1: $09
    ld   [hl], b                                  ; $63A2: $70
    ldh  a, [hActiveEntityPosX]                   ; $63A3: $F0 $EE
    push af                                       ; $63A5: $F5
    call func_007_7E0A                            ; $63A6: $CD $0A $7E
    pop  af                                       ; $63A9: $F1
    ld   e, a                                     ; $63AA: $5F
    ld   hl, wEntitiesPosXTable                   ; $63AB: $21 $00 $C2
    add  hl, bc                                   ; $63AE: $09
    ld   a, [hl]                                  ; $63AF: $7E
    sub  e                                        ; $63B0: $93
    ldh  [hFFE8], a                               ; $63B1: $E0 $E8
    call label_3B23                               ; $63B3: $CD $23 $3B
    call CheckLinkCollisionWithEnemy_trampoline   ; $63B6: $CD $5A $3B
    jr   nc, jr_007_63F6                          ; $63B9: $30 $3B

    ldh  a, [hLinkPositionYIncrement]             ; $63BB: $F0 $9B
    and  $80                                      ; $63BD: $E6 $80
    jr   nz, jr_007_63F6                          ; $63BF: $20 $35

    call func_007_7E6D                            ; $63C1: $CD $6D $7E
    add  $08                                      ; $63C4: $C6 $08
    bit  7, a                                     ; $63C6: $CB $7F
    jr   z, jr_007_63F6                           ; $63C8: $28 $2C

    ld   hl, wEntitiesPosYTable                   ; $63CA: $21 $10 $C2
    add  hl, bc                                   ; $63CD: $09
    ld   a, [hl]                                  ; $63CE: $7E
    sub  $10                                      ; $63CF: $D6 $10
    ldh  [hLinkPositionY], a                      ; $63D1: $E0 $99
    ldh  a, [hLinkPositionXIncrement]             ; $63D3: $F0 $9A
    push af                                       ; $63D5: $F5
    ldh  a, [hFFE8]                               ; $63D6: $F0 $E8
    ldh  [hLinkPositionXIncrement], a             ; $63D8: $E0 $9A
    ld   hl, hLinkPositionX                       ; $63DA: $21 $98 $FF
    add  [hl]                                     ; $63DD: $86
    ld   [hl], a                                  ; $63DE: $77
    push bc                                       ; $63DF: $C5
    call label_3E19                               ; $63E0: $CD $19 $3E
    pop  bc                                       ; $63E3: $C1
    pop  af                                       ; $63E4: $F1
    ldh  [hLinkPositionXIncrement], a             ; $63E5: $E0 $9A
    ld   a, $02                                   ; $63E7: $3E $02
    ldh  [hLinkPositionYIncrement], a             ; $63E9: $E0 $9B
    ld   a, $01                                   ; $63EB: $3E $01
    ld   [$C147], a                               ; $63ED: $EA $47 $C1
    ld   hl, wEntitiesPrivateState2Table          ; $63F0: $21 $C0 $C2
    add  hl, bc                                   ; $63F3: $09
    ld   [hl], $10                                ; $63F4: $36 $10

jr_007_63F6:
    ret                                           ; $63F6: $C9

Data_007_63F7::
    db   $01, $FF

Data_007_63F9::
    db   $06, $FA

label_007_63FB:
    ld   hl, wEntitiesPrivateState1Table          ; $63FB: $21 $B0 $C2
    add  hl, bc                                   ; $63FE: $09
    ld   e, [hl]                                  ; $63FF: $5E
    ld   d, b                                     ; $6400: $50
    ld   hl, Data_007_63F7                        ; $6401: $21 $F7 $63
    add  hl, de                                   ; $6404: $19
    ld   a, [hl]                                  ; $6405: $7E
    call GetEntitySpeedYAddress                   ; $6406: $CD $05 $40
    add  [hl]                                     ; $6409: $86
    ld   [hl], a                                  ; $640A: $77
    ld   hl, Data_007_63F9                        ; $640B: $21 $F9 $63
    add  hl, de                                   ; $640E: $19
    cp   [hl]                                     ; $640F: $BE
    jr   nz, jr_007_641F                          ; $6410: $20 $0D

    ld   hl, wEntitiesPrivateState1Table          ; $6412: $21 $B0 $C2
    add  hl, bc                                   ; $6415: $09
    ld   a, [hl]                                  ; $6416: $7E
    xor  $01                                      ; $6417: $EE $01
    ld   [hl], a                                  ; $6419: $77
    call GetEntityTransitionCountdown             ; $641A: $CD $05 $0C
    ld   [hl], $6A                                ; $641D: $36 $6A

jr_007_641F:
    jp   func_007_639E                            ; $641F: $C3 $9E $63

Data_007_6422::
    db   $00, $00, $50, $07, $00, $08, $52, $07, $00, $10, $52, $27, $00, $18, $50, $27

SideViewPlatformEntityHandler::
    call GetEntityPrivateCountdown1               ; $6432: $CD $00 $0C
    jr   z, jr_007_643B                           ; $6435: $28 $04

    ld   a, $04                                   ; $6437: $3E $04
    ldh  [hActiveEntityTilesOffset], a            ; $6439: $E0 $F5

jr_007_643B:
    ld   hl, Data_007_6422                        ; $643B: $21 $22 $64
    ld   c, $04                                   ; $643E: $0E $04
    call RenderActiveEntitySpritesRect            ; $6440: $CD $E6 $3C
    call func_007_7D96                            ; $6443: $CD $96 $7D
    call func_007_639E                            ; $6446: $CD $9E $63
    ld   hl, wEntitiesPrivateState2Table          ; $6449: $21 $C0 $C2
    add  hl, bc                                   ; $644C: $09
    ld   a, [hl]                                  ; $644D: $7E
    and  a                                        ; $644E: $A7
    jr   z, jr_007_6489                           ; $644F: $28 $38

    ld   e, $04                                   ; $6451: $1E $04
    ldh  a, [hMapRoom]                            ; $6453: $F0 $F6
    cp   $3B                                      ; $6455: $FE $3B
    jr   z, jr_007_6466                           ; $6457: $28 $0D

    call GetEntityPrivateCountdown1               ; $6459: $CD $00 $0C
    ld   [hl], $08                                ; $645C: $36 $08
    ld   a, [$C3CF]                               ; $645E: $FA $CF $C3
    and  a                                        ; $6461: $A7
    jr   z, jr_007_6489                           ; $6462: $28 $25

    ld   e, $04                                   ; $6464: $1E $04

jr_007_6466:
    ld   hl, wEntitiesUnknowTableP                ; $6466: $21 $40 $C4
    add  hl, bc                                   ; $6469: $09
    ld   a, [hl]                                  ; $646A: $7E
    cp   $04                                      ; $646B: $FE $04
    jr   z, jr_007_6478                           ; $646D: $28 $09

    inc  [hl]                                     ; $646F: $34
    cp   $03                                      ; $6470: $FE $03
    jr   nz, jr_007_6478                          ; $6472: $20 $04

    ld   a, $11                                   ; $6474: $3E $11
    ldh  [hNoiseSfx], a                           ; $6476: $E0 $F4

jr_007_6478:
    ldh  a, [hFrameCounter]                       ; $6478: $F0 $E7
    and  $03                                      ; $647A: $E6 $03
    jr   nz, jr_007_6488                          ; $647C: $20 $0A

    call GetEntitySpeedYAddress                   ; $647E: $CD $05 $40

jr_007_6481:
    ld   a, [hl]                                  ; $6481: $7E
    sub  e                                        ; $6482: $93
    and  $80                                      ; $6483: $E6 $80
    jr   z, jr_007_6488                           ; $6485: $28 $01

    inc  [hl]                                     ; $6487: $34

jr_007_6488:
    ret                                           ; $6488: $C9

jr_007_6489:
    call GetEntitySpeedYAddress                   ; $6489: $CD $05 $40
    ld   [hl], b                                  ; $648C: $70
    ld   hl, wEntitiesUnknowTableP                ; $648D: $21 $40 $C4
    add  hl, bc                                   ; $6490: $09
    ld   [hl], b                                  ; $6491: $70
    ret                                           ; $6492: $C9

Data_007_6493::
    db   $98, $00, $53, $7F, $98, $20, $53, $7F, $98, $40, $53, $7F, $98, $60, $53, $7F
    db   $98, $80, $53, $7F, $98, $A0, $53, $7F, $98, $C0, $53, $7F, $98, $E0, $53, $7F
    db   $99, $00, $53, $7F, $99, $20, $53, $7F, $99, $40, $53, $7F, $99, $60, $53, $7F
    db   $99, $80, $53, $7F, $99, $A0, $53, $7F, $99, $C0, $53, $7F, $99, $E0, $53, $7F
    db   $9A, $00, $53, $7F, $9A, $20, $53, $7F, $98, $00, $53, $01, $98, $20, $53, $01
    db   $98, $40, $53, $01, $98, $60, $53, $01, $98, $80, $53, $01, $98, $A0, $53, $01
    db   $98, $C0, $53, $01, $98, $E0, $53, $01, $99, $00, $53, $01, $99, $20, $53, $01
    db   $99, $40, $53, $01, $99, $60, $53, $01, $99, $80, $53, $01, $99, $A0, $53, $01
    db   $99, $C0, $53, $01, $99, $E0, $53, $01, $9A, $00, $53, $01, $9A, $20, $53, $01

label_007_6523:
    xor  a                                        ; $6523: $AF
    ldh  [hBaseScrollX], a                        ; $6524: $E0 $96
    ldh  [hBaseScrollY], a                        ; $6526: $E0 $97
    ld   [wBGOriginLow], a                        ; $6528: $EA $2F $C1
    ld   [wBGOriginHigh], a                       ; $652B: $EA $2E $C1
    ld   hl, wLCDControl                          ; $652E: $21 $FD $D6
    res  5, [hl]                                  ; $6531: $CB $AE
    ld   hl, wEntitiesUnknowTableY                ; $6533: $21 $D0 $C3
    add  hl, bc                                   ; $6536: $09
    ld   a, [hl]                                  ; $6537: $7E
    cp   $09                                      ; $6538: $FE $09
    jr   z, jr_007_659D                           ; $653A: $28 $61

    ld   a, [wRequests]                           ; $653C: $FA $00 $D6
    ld   e, a                                     ; $653F: $5F
    add  $08                                      ; $6540: $C6 $08
    ld   [wRequests], a                           ; $6542: $EA $00 $D6
    ld   d, b                                     ; $6545: $50
    push bc                                       ; $6546: $C5
    ld   hl, wEntitiesUnknowTableY                ; $6547: $21 $D0 $C3
    add  hl, bc                                   ; $654A: $09
    ld   c, [hl]                                  ; $654B: $4E
    sla  c                                        ; $654C: $CB $21
    sla  c                                        ; $654E: $CB $21
    sla  c                                        ; $6550: $CB $21
    ld   hl, Data_007_6493                        ; $6552: $21 $93 $64
    add  hl, bc                                   ; $6555: $09
    ld   c, l                                     ; $6556: $4D
    ld   b, h                                     ; $6557: $44
    ld   hl, wRequestDestinationHigh              ; $6558: $21 $01 $D6
    add  hl, de                                   ; $655B: $19
    ld   e, $08                                   ; $655C: $1E $08

jr_007_655E:
    ld   a, [bc]                                  ; $655E: $0A
    inc  bc                                       ; $655F: $03
    ld   [hl+], a                                 ; $6560: $22
    dec  e                                        ; $6561: $1D
    jr   nz, jr_007_655E                          ; $6562: $20 $FA

    ld   [hl], $00                                ; $6564: $36 $00
    ldh  a, [hIsGBC]                              ; $6566: $F0 $FE
    and  a                                        ; $6568: $A7
    jr   z, jr_007_6596                           ; $6569: $28 $2B

    pop  bc                                       ; $656B: $C1
    ld   a, [$DC90]                               ; $656C: $FA $90 $DC
    ld   e, a                                     ; $656F: $5F
    add  $08                                      ; $6570: $C6 $08
    ld   [$DC90], a                               ; $6572: $EA $90 $DC
    ld   d, b                                     ; $6575: $50
    push bc                                       ; $6576: $C5
    ld   hl, wEntitiesUnknowTableY                ; $6577: $21 $D0 $C3
    add  hl, bc                                   ; $657A: $09
    ld   c, [hl]                                  ; $657B: $4E
    sla  c                                        ; $657C: $CB $21
    sla  c                                        ; $657E: $CB $21
    sla  c                                        ; $6580: $CB $21
    ld   hl, Data_007_6493                        ; $6582: $21 $93 $64
    add  hl, bc                                   ; $6585: $09
    ld   c, l                                     ; $6586: $4D
    ld   b, h                                     ; $6587: $44
    ld   hl, $DC91                                ; $6588: $21 $91 $DC
    add  hl, de                                   ; $658B: $19
    ld   e, $08                                   ; $658C: $1E $08

jr_007_658E:
    ld   a, [bc]                                  ; $658E: $0A
    inc  bc                                       ; $658F: $03
    ld   [hl+], a                                 ; $6590: $22
    dec  e                                        ; $6591: $1D
    jr   nz, jr_007_658E                          ; $6592: $20 $FA

    ld   [hl], $00                                ; $6594: $36 $00

jr_007_6596:
    pop  bc                                       ; $6596: $C1
    ld   hl, wEntitiesUnknowTableY                ; $6597: $21 $D0 $C3
    add  hl, bc                                   ; $659A: $09
    inc  [hl]                                     ; $659B: $34
    ret                                           ; $659C: $C9

jr_007_659D:
    call GetEntityTransitionCountdown             ; $659D: $CD $05 $0C
    ret  nz                                       ; $65A0: $C0

    ldh  a, [hMapId]                              ; $65A1: $F0 $F7
    add  $50                                      ; $65A3: $C6 $50
    call OpenDialogInTable1                       ; $65A5: $CD $73 $23
    ld   a, $E4                                   ; $65A8: $3E $E4
    ld   [wBGPalette], a                          ; $65AA: $EA $97 $DB
    ldh  a, [hIsGBC]                              ; $65AD: $F0 $FE
    and  a                                        ; $65AF: $A7
    jr   z, jr_007_65CB                           ; $65B0: $28 $19

    ld   de, $DC18                                ; $65B2: $11 $18 $DC
    ld   hl, $FF70                                ; $65B5: $21 $70 $FF
    di                                            ; $65B8: $F3

jr_007_65B9:
    ld   [hl], $02                                ; $65B9: $36 $02
    ld   a, [de]                                  ; $65BB: $1A
    ld   [hl], $00                                ; $65BC: $36 $00
    ld   [de], a                                  ; $65BE: $12
    inc  de                                       ; $65BF: $13
    ld   a, e                                     ; $65C0: $7B
    and  $07                                      ; $65C1: $E6 $07
    jr   nz, jr_007_65B9                          ; $65C3: $20 $F4

    ld   a, $01                                   ; $65C5: $3E $01
    ld   [wPaletteDataFlags], a                   ; $65C7: $EA $D1 $DD
    ei                                            ; $65CA: $FB

jr_007_65CB:
    jp   func_007_7EA4                            ; $65CB: $C3 $A4 $7E

Data_007_65CE::
    db   $4A, $02, $4C, $02, $4C, $22, $4A, $22, $4E, $02, $4E, $22

GoombaEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $65DA: $21 $B0 $C2
    add  hl, bc                                   ; $65DD: $09
    ld   a, [hl]                                  ; $65DE: $7E
    and  a                                        ; $65DF: $A7
    jp   nz, label_007_6523                       ; $65E0: $C2 $23 $65

    ld   de, Data_007_65CE                        ; $65E3: $11 $CE $65
    call RenderActiveEntitySpritesPair            ; $65E6: $CD $C0 $3B
    call func_007_7D96                            ; $65E9: $CD $96 $7D
    call func_007_7DC3                            ; $65EC: $CD $C3 $7D
    ldh  a, [hIsSideScrolling]                    ; $65EF: $F0 $F9
    and  a                                        ; $65F1: $A7
    jp   nz, label_007_6693                       ; $65F2: $C2 $93 $66

    ldh  a, [hActiveEntityState]                  ; $65F5: $F0 $F0
    JP_TABLE                                      ; $65F7
._00 dw func_007_6606                             ; $65F8
._01 dw func_007_6649                             ; $65FA
._02 dw func_007_666B                             ; $65FC

Data_007_65FE::
    db   $08, $F8, $00, $00

Data_007_6602::
    db   $00, $00, $F8, $08

func_007_6606::
    call label_3B70                               ; $6606: $CD $70 $3B
    call func_007_66F2                            ; $6609: $CD $F2 $66
    call GetEntityTransitionCountdown             ; $660C: $CD $05 $0C
    jr   nz, jr_007_6647                          ; $660F: $20 $36

    call GetRandomByte                            ; $6611: $CD $0D $28
    and  $3F                                      ; $6614: $E6 $3F
    add  $30                                      ; $6616: $C6 $30
    ld   [hl], a                                  ; $6618: $77
    ld   hl, wEntitiesUnknowTableY                ; $6619: $21 $D0 $C3
    add  hl, bc                                   ; $661C: $09
    ld   a, [hl]                                  ; $661D: $7E
    inc  a                                        ; $661E: $3C
    ld   [hl], a                                  ; $661F: $77
    cp   $04                                      ; $6620: $FE $04
    jr   nz, jr_007_662A                          ; $6622: $20 $06

    ld   [hl], b                                  ; $6624: $70
    call func_007_7E7D                            ; $6625: $CD $7D $7E
    jr   jr_007_6630                              ; $6628: $18 $06

jr_007_662A:
    call GetRandomByte                            ; $662A: $CD $0D $28
    and  $03                                      ; $662D: $E6 $03
    ld   e, a                                     ; $662F: $5F

jr_007_6630:
    ld   d, b                                     ; $6630: $50
    ld   hl, Data_007_65FE                        ; $6631: $21 $FE $65
    add  hl, de                                   ; $6634: $19
    ld   a, [hl]                                  ; $6635: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6636: $21 $40 $C2
    add  hl, bc                                   ; $6639: $09
    ld   [hl], a                                  ; $663A: $77
    ld   hl, Data_007_6602                        ; $663B: $21 $02 $66
    add  hl, de                                   ; $663E: $19
    ld   a, [hl]                                  ; $663F: $7E
    call GetEntitySpeedYAddress                   ; $6640: $CD $05 $40
    ld   [hl], a                                  ; $6643: $77
    call IncrementEntityState                     ; $6644: $CD $12 $3B

jr_007_6647:
    jr   label_007_6660                           ; $6647: $18 $17

func_007_6649::
    call label_3B70                               ; $6649: $CD $70 $3B
    call func_007_66F2                            ; $664C: $CD $F2 $66
    call GetEntityTransitionCountdown             ; $664F: $CD $05 $0C
    jr   nz, jr_007_665A                          ; $6652: $20 $06

    ld   [hl], $20                                ; $6654: $36 $20
    call IncrementEntityState                     ; $6656: $CD $12 $3B
    ld   [hl], b                                  ; $6659: $70

jr_007_665A:
    call func_007_7E0A                            ; $665A: $CD $0A $7E
    call label_3B23                               ; $665D: $CD $23 $3B

label_007_6660:
    ldh  a, [hFrameCounter]                       ; $6660: $F0 $E7
    rra                                           ; $6662: $1F
    rra                                           ; $6663: $1F
    rra                                           ; $6664: $1F
    rra                                           ; $6665: $1F
    and  $01                                      ; $6666: $E6 $01
    jp   SetEntitySpriteVariant                   ; $6668: $C3 $0C $3B

func_007_666B::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $666B: $21 $40 $C3
    add  hl, bc                                   ; $666E: $09
    ld   [hl], $C2                                ; $666F: $36 $C2
    call GetEntityTransitionCountdown             ; $6671: $CD $05 $0C
    jr   nz, jr_007_668E                          ; $6674: $20 $18

    ld   hl, wEntitiesDroppedItemTable            ; $6676: $21 $E0 $C4
    add  hl, bc                                   ; $6679: $09
    ld   [hl], ENTITY_DROPPABLE_HEART             ; $667A: $36 $2D
    ld   hl, wEntitiesUnknowTableV                ; $667C: $21 $80 $C4
    add  hl, bc                                   ; $667F: $09
    ld   [hl], $0C                                ; $6680: $36 $0C
    ld   hl, wEntitiesStatusTable                 ; $6682: $21 $80 $C2
    add  hl, bc                                   ; $6685: $09
    ld   [hl], $01                                ; $6686: $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6688: $21 $40 $C3
    add  hl, bc                                   ; $668B: $09
    ld   [hl], $04                                ; $668C: $36 $04

jr_007_668E:
    ld   a, $02                                   ; $668E: $3E $02
    jp   SetEntitySpriteVariant                   ; $6690: $C3 $0C $3B

label_007_6693:
    ldh  a, [hActiveEntityState]                  ; $6693: $F0 $F0
    cp   $02                                      ; $6695: $FE $02
    jr   z, func_007_666B                         ; $6697: $28 $D2

    call label_3B70                               ; $6699: $CD $70 $3B
    call func_007_66FE                            ; $669C: $CD $FE $66
    ldh  a, [hActiveEntityState]                  ; $669F: $F0 $F0
    JP_TABLE                                      ; $66A1
._00 dw func_007_66A6                             ; $66A2
._01 dw func_007_66B8                             ; $66A4

func_007_66A6::
    call func_007_7E5D                            ; $66A6: $CD $5D $7E
    ld   a, $08                                   ; $66A9: $3E $08
    dec  e                                        ; $66AB: $1D
    jr   nz, jr_007_66B0                          ; $66AC: $20 $02

    ld   a, $F8                                   ; $66AE: $3E $F8

jr_007_66B0:
    ld   hl, wEntitiesSpeedXTable                 ; $66B0: $21 $40 $C2
    add  hl, bc                                   ; $66B3: $09
    ld   [hl], a                                  ; $66B4: $77
    jp   IncrementEntityState                     ; $66B5: $C3 $12 $3B

func_007_66B8::
    call func_007_7E0A                            ; $66B8: $CD $0A $7E
    call GetEntitySpeedYAddress                   ; $66BB: $CD $05 $40
    inc  [hl]                                     ; $66BE: $34
    inc  [hl]                                     ; $66BF: $34
    call label_3B23                               ; $66C0: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $66C3: $21 $A0 $C2
    add  hl, bc                                   ; $66C6: $09
    ld   a, [hl]                                  ; $66C7: $7E
    and  $03                                      ; $66C8: $E6 $03
    jr   z, jr_007_66D4                           ; $66CA: $28 $08

    ld   hl, wEntitiesSpeedXTable                 ; $66CC: $21 $40 $C2
    add  hl, bc                                   ; $66CF: $09
    ld   a, [hl]                                  ; $66D0: $7E
    cpl                                           ; $66D1: $2F
    inc  a                                        ; $66D2: $3C
    ld   [hl], a                                  ; $66D3: $77

jr_007_66D4:
    ld   hl, wEntitiesCollisionsTable             ; $66D4: $21 $A0 $C2
    add  hl, bc                                   ; $66D7: $09
    ld   a, [hl]                                  ; $66D8: $7E
    and  $08                                      ; $66D9: $E6 $08
    jr   z, jr_007_66EE                           ; $66DB: $28 $11

    ld   hl, wEntitiesPosYTable                   ; $66DD: $21 $10 $C2
    add  hl, bc                                   ; $66E0: $09
    ld   a, [hl]                                  ; $66E1: $7E
    and  $F0                                      ; $66E2: $E6 $F0
    add  $03                                      ; $66E4: $C6 $03
    ld   [hl], a                                  ; $66E6: $77
    call GetEntitySpeedYAddress                   ; $66E7: $CD $05 $40
    ld   [hl], b                                  ; $66EA: $70
    jp   label_007_6660                           ; $66EB: $C3 $60 $66

jr_007_66EE:
    xor  a                                        ; $66EE: $AF
    jp   SetEntitySpriteVariant                   ; $66EF: $C3 $0C $3B

func_007_66F2::
    ldh  a, [hLinkPositionZ]                      ; $66F2: $F0 $A2
    and  a                                        ; $66F4: $A7
    jp   z, CheckLinkCollisionWithEnemy_trampoline; $66F5: $CA $5A $3B

    cp   $08                                      ; $66F8: $FE $08
    jp   c, CheckLinkCollisionWithEnemy_trampoline; $66FA: $DA $5A $3B

    ret                                           ; $66FD: $C9

func_007_66FE::
    jp   CheckLinkCollisionWithEnemy_trampoline   ; $66FE: $C3 $5A $3B

Data_007_6701::
    db   $40, $02, $40, $22, $42, $02, $42, $22

PeaHatEntityHandler::
    ld   de, Data_007_6701                        ; $6709: $11 $01 $67
    call RenderActiveEntitySpritesPair            ; $670C: $CD $C0 $3B
    call func_007_7D96                            ; $670F: $CD $96 $7D
    call func_007_7DC3                            ; $6712: $CD $C3 $7D
    call label_3B39                               ; $6715: $CD $39 $3B
    call func_007_7E0A                            ; $6718: $CD $0A $7E
    call func_007_7E43                            ; $671B: $CD $43 $7E
    call label_3B23                               ; $671E: $CD $23 $3B
    ld   hl, wEntitiesHitboxFlagsTable            ; $6721: $21 $50 $C3
    add  hl, bc                                   ; $6724: $09
    set  7, [hl]                                  ; $6725: $CB $FE
    ld   hl, wEntitiesUnknowTableH                ; $6727: $21 $30 $C4
    add  hl, bc                                   ; $672A: $09
    set  6, [hl]                                  ; $672B: $CB $F6
    ldh  a, [hActiveEntityState]                  ; $672D: $F0 $F0
    JP_TABLE                                      ; $672F
._00 dw func_007_6736                             ; $6730
._01 dw func_007_6790                             ; $6732
._02 dw func_007_67D7                             ; $6734

func_007_6736::
    ld   hl, wEntitiesPosZTable                   ; $6736: $21 $10 $C3
    add  hl, bc                                   ; $6739: $09
    ld   a, [hl]                                  ; $673A: $7E
    and  a                                        ; $673B: $A7
    jr   z, jr_007_6747                           ; $673C: $28 $09

    ldh  a, [hFrameCounter]                       ; $673E: $F0 $E7
    and  $07                                      ; $6740: $E6 $07
    jr   nz, jr_007_6753                          ; $6742: $20 $0F

    dec  [hl]                                     ; $6744: $35
    jr   jr_007_6753                              ; $6745: $18 $0C

jr_007_6747:
    ld   hl, wEntitiesHitboxFlagsTable            ; $6747: $21 $50 $C3
    add  hl, bc                                   ; $674A: $09
    res  7, [hl]                                  ; $674B: $CB $BE
    ld   hl, wEntitiesUnknowTableH                ; $674D: $21 $30 $C4
    add  hl, bc                                   ; $6750: $09
    res  6, [hl]                                  ; $6751: $CB $B6

jr_007_6753:
    ldh  a, [hFrameCounter]                       ; $6753: $F0 $E7
    and  $07                                      ; $6755: $E6 $07
    jr   nz, jr_007_6776                          ; $6757: $20 $1D

    ld   hl, wEntitiesSpeedXTable                 ; $6759: $21 $40 $C2
    add  hl, bc                                   ; $675C: $09
    ld   a, [hl]                                  ; $675D: $7E
    and  a                                        ; $675E: $A7
    jr   z, jr_007_6768                           ; $675F: $28 $07

    and  $80                                      ; $6761: $E6 $80
    jr   z, jr_007_6767                           ; $6763: $28 $02

    inc  [hl]                                     ; $6765: $34
    inc  [hl]                                     ; $6766: $34

jr_007_6767:
    dec  [hl]                                     ; $6767: $35

jr_007_6768:
    call GetEntitySpeedYAddress                   ; $6768: $CD $05 $40
    ld   a, [hl]                                  ; $676B: $7E
    and  a                                        ; $676C: $A7
    jr   z, jr_007_6776                           ; $676D: $28 $07

    and  $80                                      ; $676F: $E6 $80
    jr   z, jr_007_6775                           ; $6771: $28 $02

    inc  [hl]                                     ; $6773: $34
    inc  [hl]                                     ; $6774: $34

jr_007_6775:
    dec  [hl]                                     ; $6775: $35

jr_007_6776:
    call GetEntityDropTimer                       ; $6776: $CD $FB $0B
    jr   nz, jr_007_677E                          ; $6779: $20 $03

    call IncrementEntityState                     ; $677B: $CD $12 $3B

jr_007_677E:
    ld   hl, wEntitiesPrivateState1Table          ; $677E: $21 $B0 $C2
    add  hl, bc                                   ; $6781: $09
    ld   a, [hl]                                  ; $6782: $7E
    and  a                                        ; $6783: $A7
    jr   z, jr_007_678D                           ; $6784: $28 $07

    ldh  a, [hFrameCounter]                       ; $6786: $F0 $E7
    and  $1F                                      ; $6788: $E6 $1F
    jr   nz, jr_007_678D                          ; $678A: $20 $01

    dec  [hl]                                     ; $678C: $35

jr_007_678D:
    jp   func_007_67AE                            ; $678D: $C3 $AE $67

func_007_6790::
    ld   hl, wEntitiesPrivateState1Table          ; $6790: $21 $B0 $C2
    add  hl, bc                                   ; $6793: $09
    ld   a, [hl]                                  ; $6794: $7E
    cp   $08                                      ; $6795: $FE $08
    jr   c, jr_007_67A7                           ; $6797: $38 $0E

    call GetEntityDropTimer                       ; $6799: $CD $FB $0B
    call GetRandomByte                            ; $679C: $CD $0D $28
    and  $1F                                      ; $679F: $E6 $1F
    add  $80                                      ; $67A1: $C6 $80
    ld   [hl], a                                  ; $67A3: $77
    jp   IncrementEntityState                     ; $67A4: $C3 $12 $3B

jr_007_67A7:
    ldh  a, [hFrameCounter]                       ; $67A7: $F0 $E7
    and  $0F                                      ; $67A9: $E6 $0F
    jr   nz, func_007_67AE                        ; $67AB: $20 $01

    inc  [hl]                                     ; $67AD: $34

func_007_67AE::
    ld   hl, wEntitiesPrivateState1Table          ; $67AE: $21 $B0 $C2
    add  hl, bc                                   ; $67B1: $09
    ld   a, [hl]                                  ; $67B2: $7E
    ld   hl, wEntitiesUnknowTableY                ; $67B3: $21 $D0 $C3
    add  hl, bc                                   ; $67B6: $09
    add  [hl]                                     ; $67B7: $86
    ld   [hl], a                                  ; $67B8: $77
    rra                                           ; $67B9: $1F
    rra                                           ; $67BA: $1F
    rra                                           ; $67BB: $1F
    rra                                           ; $67BC: $1F
    rra                                           ; $67BD: $1F
    and  $01                                      ; $67BE: $E6 $01
    jp   SetEntitySpriteVariant                   ; $67C0: $C3 $0C $3B

Data_007_67C3::
    db   $00, $05, $0A, $0D

Data_007_67C7::
    db   $0E, $0D, $0A, $05, $00, $FB, $F6, $F3, $F2, $F3, $F6, $FB, $00, $05, $0A, $0D

func_007_67D7::
    call func_007_67AE                            ; $67D7: $CD $AE $67
    ld   hl, wEntitiesPosZTable                   ; $67DA: $21 $10 $C3
    add  hl, bc                                   ; $67DD: $09
    ld   a, [hl]                                  ; $67DE: $7E
    cp   $10                                      ; $67DF: $FE $10
    jr   z, jr_007_67EB                           ; $67E1: $28 $08

    ldh  a, [hFrameCounter]                       ; $67E3: $F0 $E7
    and  $07                                      ; $67E5: $E6 $07
    jr   nz, jr_007_67EA                          ; $67E7: $20 $01

    inc  [hl]                                     ; $67E9: $34

jr_007_67EA:
    ret                                           ; $67EA: $C9

jr_007_67EB:
    call GetEntityDropTimer                       ; $67EB: $CD $FB $0B
    jr   nz, jr_007_67F6                          ; $67EE: $20 $06

    ld   [hl], $60                                ; $67F0: $36 $60
    call IncrementEntityState                     ; $67F2: $CD $12 $3B
    ld   [hl], b                                  ; $67F5: $70

jr_007_67F6:
    ld   hl, wEntitiesUnknownTableD               ; $67F6: $21 $D0 $C2
    add  hl, bc                                   ; $67F9: $09
    inc  [hl]                                     ; $67FA: $34
    ld   a, [hl]                                  ; $67FB: $7E
    cp   $18                                      ; $67FC: $FE $18
    jr   c, jr_007_683D                           ; $67FE: $38 $3D

    ld   [hl], b                                  ; $6800: $70
    ld   hl, wEntitiesPrivateState2Table          ; $6801: $21 $C0 $C2
    add  hl, bc                                   ; $6804: $09
    ld   a, [hl]                                  ; $6805: $7E
    ld   hl, wEntitiesUnknowTableP                ; $6806: $21 $40 $C4
    add  hl, bc                                   ; $6809: $09
    add  [hl]                                     ; $680A: $86
    and  $0F                                      ; $680B: $E6 $0F
    ld   [hl], a                                  ; $680D: $77
    ld   hl, wEntitiesUnknowTableP                ; $680E: $21 $40 $C4
    add  hl, bc                                   ; $6811: $09
    ld   e, [hl]                                  ; $6812: $5E
    ld   d, b                                     ; $6813: $50
    ld   hl, Data_007_67C3                        ; $6814: $21 $C3 $67
    add  hl, de                                   ; $6817: $19
    ld   a, [hl]                                  ; $6818: $7E
    sra  a                                        ; $6819: $CB $2F
    call GetEntitySpeedYAddress                   ; $681B: $CD $05 $40
    ld   [hl], a                                  ; $681E: $77
    ld   hl, Data_007_67C7                        ; $681F: $21 $C7 $67
    add  hl, de                                   ; $6822: $19
    ld   a, [hl]                                  ; $6823: $7E
    sra  a                                        ; $6824: $CB $2F
    ld   hl, wEntitiesSpeedXTable                 ; $6826: $21 $40 $C2
    add  hl, bc                                   ; $6829: $09
    ld   [hl], a                                  ; $682A: $77
    call GetRandomByte                            ; $682B: $CD $0D $28
    and  $07                                      ; $682E: $E6 $07
    jr   nz, jr_007_683D                          ; $6830: $20 $0B

    call GetRandomByte                            ; $6832: $CD $0D $28
    and  $02                                      ; $6835: $E6 $02
    dec  a                                        ; $6837: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $6838: $21 $C0 $C2
    add  hl, bc                                   ; $683B: $09
    ld   [hl], a                                  ; $683C: $77

jr_007_683D:
    ret                                           ; $683D: $C9

Data_007_683E::
    db   $44, $03, $46, $03, $44, $03, $48, $03, $46, $23, $44, $23, $48, $23, $44, $23

SnakeEntityHandler::
    ld   hl, wEntitiesDirectionTable              ; $684E: $21 $80 $C3
    add  hl, bc                                   ; $6851: $09
    ldh  a, [hActiveEntitySpriteVariant]          ; $6852: $F0 $F1
    add  [hl]                                     ; $6854: $86
    ldh  [hActiveEntitySpriteVariant], a          ; $6855: $E0 $F1
    ld   de, Data_007_683E                        ; $6857: $11 $3E $68
    call RenderActiveEntitySpritesPair            ; $685A: $CD $C0 $3B
    call func_007_7D96                            ; $685D: $CD $96 $7D
    call func_007_7DC3                            ; $6860: $CD $C3 $7D
    call label_3B39                               ; $6863: $CD $39 $3B
    call func_007_7E0A                            ; $6866: $CD $0A $7E
    call label_3B23                               ; $6869: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $686C: $21 $A0 $C2
    add  hl, bc                                   ; $686F: $09
    ld   a, [hl]                                  ; $6870: $7E
    and  a                                        ; $6871: $A7
    jr   z, jr_007_6882                           ; $6872: $28 $0E

    call IncrementEntityState                     ; $6874: $CD $12 $3B
    ld   [hl], b                                  ; $6877: $70
    call GetEntityTransitionCountdown             ; $6878: $CD $05 $0C
    ld   [hl], $08                                ; $687B: $36 $08
    call GetEntityPrivateCountdown1               ; $687D: $CD $00 $0C
    ld   [hl], $20                                ; $6880: $36 $20

jr_007_6882:
    ldh  a, [hActiveEntityState]                  ; $6882: $F0 $F0
    JP_TABLE                                      ; $6884
._00 dw func_007_6897                             ; $6885
._01 dw func_007_68D8                             ; $6887
._02 dw func_007_6929                             ; $6889

Data_007_688B::
    db   $08, $F8, $00, $00

Data_007_688F::
    db   $00, $00, $F8, $08

Data_007_6893::
    db   $02, $00, $FF, $FF

func_007_6897::
    call GetEntityTransitionCountdown             ; $6897: $CD $05 $0C
    jr   nz, jr_007_68D0                          ; $689A: $20 $34

    call IncrementEntityState                     ; $689C: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $689F: $CD $05 $0C
    call GetRandomByte                            ; $68A2: $CD $0D $28
    and  $1F                                      ; $68A5: $E6 $1F
    add  $30                                      ; $68A7: $C6 $30
    ld   [hl], a                                  ; $68A9: $77
    and  $03                                      ; $68AA: $E6 $03
    ld   e, a                                     ; $68AC: $5F

func_007_68AD::
    ld   d, b                                     ; $68AD: $50
    ld   hl, Data_007_688B                        ; $68AE: $21 $8B $68
    add  hl, de                                   ; $68B1: $19
    ld   a, [hl]                                  ; $68B2: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $68B3: $21 $40 $C2
    add  hl, bc                                   ; $68B6: $09
    ld   [hl], a                                  ; $68B7: $77
    ld   hl, Data_007_688F                        ; $68B8: $21 $8F $68
    add  hl, de                                   ; $68BB: $19
    ld   a, [hl]                                  ; $68BC: $7E
    call GetEntitySpeedYAddress                   ; $68BD: $CD $05 $40
    ld   [hl], a                                  ; $68C0: $77
    ld   hl, Data_007_6893                        ; $68C1: $21 $93 $68
    add  hl, de                                   ; $68C4: $19
    ld   a, [hl]                                  ; $68C5: $7E
    cp   $FF                                      ; $68C6: $FE $FF
    jr   z, jr_007_68CF                           ; $68C8: $28 $05

    ld   hl, wEntitiesDirectionTable              ; $68CA: $21 $80 $C3
    add  hl, bc                                   ; $68CD: $09
    ld   [hl], a                                  ; $68CE: $77

jr_007_68CF:
    ret                                           ; $68CF: $C9

jr_007_68D0:
    call ClearEntitySpeed                         ; $68D0: $CD $7F $3D
    call func_007_68F0                            ; $68D3: $CD $F0 $68
    jr   jr_007_68E6                              ; $68D6: $18 $0E

func_007_68D8::
    call GetEntityTransitionCountdown             ; $68D8: $CD $05 $0C
    jr   nz, jr_007_68E3                          ; $68DB: $20 $06

    ld   [hl], $18                                ; $68DD: $36 $18
    call IncrementEntityState                     ; $68DF: $CD $12 $3B
    ld   [hl], b                                  ; $68E2: $70

jr_007_68E3:
    call func_007_68F0                            ; $68E3: $CD $F0 $68

jr_007_68E6:
    ldh  a, [hFrameCounter]                       ; $68E6: $F0 $E7
    rra                                           ; $68E8: $1F
    rra                                           ; $68E9: $1F
    rra                                           ; $68EA: $1F
    and  $01                                      ; $68EB: $E6 $01
    jp   SetEntitySpriteVariant                   ; $68ED: $C3 $0C $3B

func_007_68F0::
    call GetEntityPrivateCountdown1               ; $68F0: $CD $00 $0C
    jr   nz, jr_007_6919                          ; $68F3: $20 $24

    call func_007_7E5D                            ; $68F5: $CD $5D $7E
    add  $08                                      ; $68F8: $C6 $08
    cp   $10                                      ; $68FA: $FE $10
    jr   nc, jr_007_691A                          ; $68FC: $30 $1C

    call func_007_7E6D                            ; $68FE: $CD $6D $7E

jr_007_6901:
    call func_007_68AD                            ; $6901: $CD $AD $68
    ld   hl, wEntitiesSpeedXTable                 ; $6904: $21 $40 $C2
    add  hl, bc                                   ; $6907: $09
    sla  [hl]                                     ; $6908: $CB $26
    call GetEntitySpeedYAddress                   ; $690A: $CD $05 $40
    sla  [hl]                                     ; $690D: $CB $26
    call IncrementEntityState                     ; $690F: $CD $12 $3B
    ld   [hl], $02                                ; $6912: $36 $02
    call GetEntityTransitionCountdown             ; $6914: $CD $05 $0C
    ld   [hl], $30                                ; $6917: $36 $30

jr_007_6919:
    ret                                           ; $6919: $C9

jr_007_691A:
    call func_007_7E6D                            ; $691A: $CD $6D $7E
    add  $08                                      ; $691D: $C6 $08
    cp   $10                                      ; $691F: $FE $10
    jr   nc, jr_007_6928                          ; $6921: $30 $05

    call func_007_7E5D                            ; $6923: $CD $5D $7E
    jr   jr_007_6901                              ; $6926: $18 $D9

jr_007_6928:
    ret                                           ; $6928: $C9

func_007_6929::
    call GetEntityTransitionCountdown             ; $6929: $CD $05 $0C
    jr   nz, jr_007_6939                          ; $692C: $20 $0B

    ld   [hl], $20                                ; $692E: $36 $20
    call IncrementEntityState                     ; $6930: $CD $12 $3B
    ld   [hl], b                                  ; $6933: $70
    call GetEntityPrivateCountdown1               ; $6934: $CD $00 $0C
    ld   [hl], $40                                ; $6937: $36 $40

jr_007_6939:
    ldh  a, [hFrameCounter]                       ; $6939: $F0 $E7
    rra                                           ; $693B: $1F
    rra                                           ; $693C: $1F
    and  $01                                      ; $693D: $E6 $01
    jp   SetEntitySpriteVariant                   ; $693F: $C3 $0C $3B

Data_007_6942::
    db   $3A, $D5, $D6, $D7, $3A, $3A, $CD, $E1, $CE, $3A, $03, $09, $03, $09, $C6, $1B
    db   $1B, $03, $03, $09, $0E, $1B, $1B, $1B, $1B

Data_007_695B::
    db   $02, $12, $22, $32

Data_007_695F::
    db   $42, $00, $08, $10, $18, $20, $28, $30, $38, $40, $48

label_007_696A:
    call func_007_7D96                            ; $696A: $CD $96 $7D
    ld   a, $02                                   ; $696D: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $696F: $E0 $A1
    ld   [wC167], a                               ; $6971: $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ; $6974: $F0 $F0
    JP_TABLE                                      ; $6976
._00 dw func_007_697F                             ; $6977
._01 dw func_007_698A                             ; $6979
._02 dw func_007_6996                             ; $697B
._03 dw func_007_69A2                             ; $697D

func_007_697F::
    call PlayDoorUnlockedSfx                      ; $697F: $CD $00 $40
    call GetEntityTransitionCountdown             ; $6982: $CD $05 $0C
    ld   [hl], $28                                ; $6985: $36 $28
    jp   IncrementEntityState                     ; $6987: $C3 $12 $3B

func_007_698A::
    call GetEntityTransitionCountdown             ; $698A: $CD $05 $0C
    ret  nz                                       ; $698D: $C0

jr_007_698E:
    ld   a, MUSIC_WATERFALL_DRAIN                 ; $698E: $3E $4C
    ld   [wMusicTrackToPlay], a                   ; $6990: $EA $68 $D3
    jp   IncrementEntityState                     ; $6993: $C3 $12 $3B

func_007_6996::
    ld   a, $1D                                   ; $6996: $3E $1D
    ldh  [hNoiseSfx], a                           ; $6998: $E0 $F4
    call GetEntityTransitionCountdown             ; $699A: $CD $05 $0C
    ld   [hl], $80                                ; $699D: $36 $80
    jp   IncrementEntityState                     ; $699F: $C3 $12 $3B

func_007_69A2::
    ldh  a, [hFrameCounter]                       ; $69A2: $F0 $E7
    ld   e, $00                                   ; $69A4: $1E $00
    and  $08                                      ; $69A6: $E6 $08
    jr   z, jr_007_69AC                           ; $69A8: $28 $02

    ld   e, $02                                   ; $69AA: $1E $02

jr_007_69AC:
    ld   a, e                                     ; $69AC: $7B
    ld   [wScreenShakeHorizontal], a              ; $69AD: $EA $55 $C1
    call GetEntityTransitionCountdown             ; $69B0: $CD $05 $0C
    ret  nz                                       ; $69B3: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $69B4: $21 $B0 $C2
    add  hl, bc                                   ; $69B7: $09
    ld   a, [hl]                                  ; $69B8: $7E
    ld   e, a                                     ; $69B9: $5F
    inc  a                                        ; $69BA: $3C
    ld   [hl], a                                  ; $69BB: $77
    ldh  [hFFE8], a                               ; $69BC: $E0 $E8
    ld   a, e                                     ; $69BE: $7B
    and  $1F                                      ; $69BF: $E6 $1F
    jp   nz, label_007_69D0                       ; $69C1: $C2 $D0 $69

    ld   hl, wEntitiesUnknowTableY                ; $69C4: $21 $D0 $C3
    add  hl, bc                                   ; $69C7: $09
    ld   a, [hl]                                  ; $69C8: $7E
    cp   $0A                                      ; $69C9: $FE $0A
    jp   z, label_007_6A34                        ; $69CB: $CA $34 $6A

    inc  a                                        ; $69CE: $3C
    ld   [hl], a                                  ; $69CF: $77

label_007_69D0:
    ld   hl, wEntitiesUnknowTableY                ; $69D0: $21 $D0 $C3
    add  hl, bc                                   ; $69D3: $09
    push hl                                       ; $69D4: $E5
    ld   a, [hl]                                  ; $69D5: $7E
    ld   e, a                                     ; $69D6: $5F
    ld   d, b                                     ; $69D7: $50
    ld   hl, Data_007_695F                        ; $69D8: $21 $5F $69
    add  hl, de                                   ; $69DB: $19
    ld   a, [hl]                                  ; $69DC: $7E
    ldh  [hSwordIntersectedAreaY], a              ; $69DD: $E0 $CD
    ld   a, $20                                   ; $69DF: $3E $20
    ldh  [hSwordIntersectedAreaX], a              ; $69E1: $E0 $CE
    call label_2887                               ; $69E3: $CD $87 $28
    pop  hl                                       ; $69E6: $E1
    ld   d, h                                     ; $69E7: $54
    ld   e, l                                     ; $69E8: $5D

    ld   hl, wFarcallParams                       ; $69E9: $21 $01 $DE
    ld   a, BANK(AnglersTunnelDoorEntityHandler)                   ; $69EC: $3E $1A
    ld   [hl+], a                                 ; $69EE: $22
    ld   a, HIGH(AnglersTunnelDoorEntityHandler)                   ; $69EF: $3E $71
    ld   [hl+], a                                 ; $69F1: $22
    ld   a, LOW(AnglersTunnelDoorEntityHandler)                    ; $69F2: $3E $11
    ld   [hl+], a                                 ; $69F4: $22
    ld   a, BANK(@)                               ; $69F5: $3E $07
    ld   [hl], a                                  ; $69F7: $77
    call Farcall                                  ; $69F8: $CD $D7 $0B

    push bc                                       ; $69FB: $C5
    ld   hl, wEntitiesUnknowTableY                ; $69FC: $21 $D0 $C3
    add  hl, bc                                   ; $69FF: $09
    ld   a, [hl]                                  ; $6A00: $7E
    dec  a                                        ; $6A01: $3D
    rra                                           ; $6A02: $1F
    and  $07                                      ; $6A03: $E6 $07
    push af                                       ; $6A05: $F5
    ld   e, a                                     ; $6A06: $5F
    ld   d, b                                     ; $6A07: $50
    ld   hl, Data_007_695B                        ; $6A08: $21 $5B $69
    add  hl, de                                   ; $6A0B: $19
    ld   e, [hl]                                  ; $6A0C: $5E
    ld   hl, wRoomObjects                         ; $6A0D: $21 $11 $D7
    add  hl, de                                   ; $6A10: $19
    ld   c, l                                     ; $6A11: $4D
    ld   b, h                                     ; $6A12: $44
    pop  af                                       ; $6A13: $F1
    ld   e, a                                     ; $6A14: $5F
    sla  a                                        ; $6A15: $CB $27
    sla  a                                        ; $6A17: $CB $27
    add  e                                        ; $6A19: $83
    ld   e, a                                     ; $6A1A: $5F
    ld   d, $00                                   ; $6A1B: $16 $00
    ld   hl, Data_007_6942                        ; $6A1D: $21 $42 $69
    add  hl, de                                   ; $6A20: $19
    ld   e, $05                                   ; $6A21: $1E $05

jr_007_6A23:
    ld   a, [hl+]                                 ; $6A23: $2A
    ld   [bc], a                                  ; $6A24: $02
    push hl                                       ; $6A25: $E5
    ld   h, b                                     ; $6A26: $60
    ld   l, c                                     ; $6A27: $69
    ld   a, $87                                   ; $6A28: $3E $87
    call func_2BF                                ; $6A2A: $CD $2F $0B
    pop  hl                                       ; $6A2D: $E1
    inc  bc                                       ; $6A2E: $03
    dec  e                                        ; $6A2F: $1D
    jr   nz, jr_007_6A23                          ; $6A30: $20 $F1

    pop  bc                                       ; $6A32: $C1
    ret                                           ; $6A33: $C9

label_007_6A34:
    xor  a                                        ; $6A34: $AF
    ld   [wScreenShakeHorizontal], a              ; $6A35: $EA $55 $C1
    ld   [wC167], a                               ; $6A38: $EA $67 $C1
    call label_27DD                               ; $6A3B: $CD $DD $27
    jp   func_007_7EA4                            ; $6A3E: $C3 $A4 $7E

; Entity handler for:
;  - Master Stalfos
;  - Angler's Tunnel cascade
MasterStalfosEntityHandler::
    ld   hl, wEntitiesUnknowTableP                ; $6A41: $21 $40 $C4
    add  hl, bc                                   ; $6A44: $09
    ld   a, [hl]                                  ; $6A45: $7E
    cp   $FF                                      ; $6A46: $FE $FF
    jp   z, label_007_696A                        ; $6A48: $CA $6A $69

    and  a                                        ; $6A4B: $A7
    jr   nz, jr_007_6A52                          ; $6A4C: $20 $04

    inc  [hl]                                     ; $6A4E: $34
    call func_007_6ED0                            ; $6A4F: $CD $D0 $6E

jr_007_6A52:
    call func_007_6FB1                            ; $6A52: $CD $B1 $6F
    ldh  a, [hActiveEntityStatus]                 ; $6A55: $F0 $EA
    cp   $05                                      ; $6A57: $FE $05
    jp   nz, label_007_7EAA                       ; $6A59: $C2 $AA $7E

    call func_007_7D96                            ; $6A5C: $CD $96 $7D
    call label_394D                               ; $6A5F: $CD $4D $39
    call BossIntro                                ; $6A62: $CD $E8 $3E
    ld   hl, wEntitiesFlashCountdownTable         ; $6A65: $21 $20 $C4
    add  hl, bc                                   ; $6A68: $09
    ld   a, [hl]                                  ; $6A69: $7E
    cp   $16                                      ; $6A6A: $FE $16
    jr   nz, jr_007_6A89                          ; $6A6C: $20 $1B

    ldh  a, [hActiveEntityState]                  ; $6A6E: $F0 $F0
    cp   $09                                      ; $6A70: $FE $09
    jr   nc, jr_007_6A84                          ; $6A72: $30 $10

    ld   [hl], b                                  ; $6A74: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6A75: $21 $20 $C3
    add  hl, bc                                   ; $6A78: $09
    ld   [hl], b                                  ; $6A79: $70
    call IncrementEntityState                     ; $6A7A: $CD $12 $3B
    ld   a, $09                                   ; $6A7D: $3E $09
    ld   [hl], a                                  ; $6A7F: $77
    ldh  [hActiveEntityState], a                  ; $6A80: $E0 $F0
    jr   jr_007_6A89                              ; $6A82: $18 $05

jr_007_6A84:
    ld   hl, wEntitiesUnknowTableY                ; $6A84: $21 $D0 $C3
    add  hl, bc                                   ; $6A87: $09
    inc  [hl]                                     ; $6A88: $34

jr_007_6A89:
    call func_007_7DC3                            ; $6A89: $CD $C3 $7D
    call func_007_7E43                            ; $6A8C: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $6A8F: $21 $20 $C3
    add  hl, bc                                   ; $6A92: $09
    dec  [hl]                                     ; $6A93: $35
    dec  [hl]                                     ; $6A94: $35
    ld   hl, wEntitiesPosZTable                   ; $6A95: $21 $10 $C3
    add  hl, bc                                   ; $6A98: $09
    ld   a, [hl]                                  ; $6A99: $7E
    and  $80                                      ; $6A9A: $E6 $80
    ldh  [hFFE8], a                               ; $6A9C: $E0 $E8
    jr   z, jr_007_6AA6                           ; $6A9E: $28 $06

    ld   [hl], b                                  ; $6AA0: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6AA1: $21 $20 $C3
    add  hl, bc                                   ; $6AA4: $09
    ld   [hl], b                                  ; $6AA5: $70

jr_007_6AA6:
    ldh  a, [hActiveEntityState]                  ; $6AA6: $F0 $F0
    cp   $09                                      ; $6AA8: $FE $09
    jr   nc, jr_007_6AC0                          ; $6AAA: $30 $14

    call label_3B65                               ; $6AAC: $CD $65 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6AAF: $21 $10 $C4
    add  hl, bc                                   ; $6AB2: $09
    ld   a, [$C13E]                               ; $6AB3: $FA $3E $C1
    or   [hl]                                     ; $6AB6: $B6
    and  a                                        ; $6AB7: $A7
    jr   nz, jr_007_6AC0                          ; $6AB8: $20 $06

    call CheckLinkCollisionWithEnemy_trampoline   ; $6ABA: $CD $5A $3B
    call label_3B70                               ; $6ABD: $CD $70 $3B

jr_007_6AC0:
    ldh  a, [hActiveEntityState]                  ; $6AC0: $F0 $F0
     JP_TABLE                                      ; $6AC2
._00 dw func_007_6ADF                             ; $6AC3
._01 dw func_007_6AF5                             ; $6AC5
._02 dw func_007_6B16                             ; $6AC7
._03 dw func_007_6B68                             ; $6AC9
._04 dw func_007_6BC8                             ; $6ACB
._05 dw func_007_6BF4                             ; $6ACD
._06 dw func_007_6C39                             ; $6ACF
._07 dw func_007_6D18                             ; $6AD1
._08 dw func_007_6D5F                             ; $6AD3
._09 dw func_007_6D7F                             ; $6AD5
._0A dw func_007_6D9F                             ; $6AD7
._0B dw func_007_6DD9                             ; $6AD9
._0C dw func_007_6DF6                             ; $6ADB
._0D dw func_007_6E58                             ; $6ADD

func_007_6ADF::
    ld   hl, wEntitiesSpeedZTable                 ; $6ADF: $21 $20 $C3
    add  hl, bc                                   ; $6AE2: $09
    ld   [hl], b                                  ; $6AE3: $70
    call GetEntityTransitionCountdown             ; $6AE4: $CD $05 $0C
    jr   nz, jr_007_6AF4                          ; $6AE7: $20 $0B

    ld   [hl], $30                                ; $6AE9: $36 $30
    call IncrementEntityState                     ; $6AEB: $CD $12 $3B
    ld   hl, wEntitiesPosZTable                   ; $6AEE: $21 $10 $C3
    add  hl, bc                                   ; $6AF1: $09
    ld   [hl], $6F                                ; $6AF2: $36 $6F

jr_007_6AF4:
    ret                                           ; $6AF4: $C9

func_007_6AF5::
    call GetEntityTransitionCountdown             ; $6AF5: $CD $05 $0C
    jr   z, jr_007_6B08                           ; $6AF8: $28 $0E

    cp   $01                                      ; $6AFA: $FE $01
    jr   nz, jr_007_6B02                          ; $6AFC: $20 $04

    ld   a, JINGLE_JUMP_DOWN                      ; $6AFE: $3E $08
    ldh  [hJingle], a                             ; $6B00: $E0 $F2

jr_007_6B02:
    ld   hl, wEntitiesSpeedZTable                 ; $6B02: $21 $20 $C3
    add  hl, bc                                   ; $6B05: $09
    ld   [hl], b                                  ; $6B06: $70
    ret                                           ; $6B07: $C9

jr_007_6B08:
    ldh  a, [hFFE8]                               ; $6B08: $F0 $E8
    and  a                                        ; $6B0A: $A7
    jr   z, jr_007_6B15                           ; $6B0B: $28 $08

    call GetEntityTransitionCountdown             ; $6B0D: $CD $05 $0C
    ld   [hl], $40                                ; $6B10: $36 $40
    call IncrementEntityState                     ; $6B12: $CD $12 $3B

jr_007_6B15:
    ret                                           ; $6B15: $C9

func_007_6B16::
    call GetEntityTransitionCountdown             ; $6B16: $CD $05 $0C
    cp   $01                                      ; $6B19: $FE $01
    jr   nz, jr_007_6B33                          ; $6B1B: $20 $16

    ld   e, $12                                   ; $6B1D: $1E $12
    ldh  a, [hMapRoom]                            ; $6B1F: $F0 $F6
    cp   $92                                      ; $6B21: $FE $92
    jr   z, jr_007_6B2F                           ; $6B23: $28 $0A

    cp   $84                                      ; $6B25: $FE $84
    jr   z, jr_007_6B2F                           ; $6B27: $28 $06

    cp   $80                                      ; $6B29: $FE $80
    jr   nz, jr_007_6B33                          ; $6B2B: $20 $06

    ld   e, $14                                   ; $6B2D: $1E $14

jr_007_6B2F:
    ld   a, e                                     ; $6B2F: $7B
    call OpenDialogInTable1                       ; $6B30: $CD $73 $23

jr_007_6B33:
    call GetEntityTransitionCountdown             ; $6B33: $CD $05 $0C
    jr   nz, jr_007_6B45                          ; $6B36: $20 $0D

    ld   [hl], $A0                                ; $6B38: $36 $A0
    ldh  a, [hMapRoom]                            ; $6B3A: $F0 $F6
    cp   $95                                      ; $6B3C: $FE $95
    jr   z, jr_007_6B42                           ; $6B3E: $28 $02

jr_007_6B40:
    ld   [hl], $20                                ; $6B40: $36 $20

jr_007_6B42:
    jp   IncrementEntityState                     ; $6B42: $C3 $12 $3B

jr_007_6B45:
    ld   hl, $D20E                                ; $6B45: $21 $0E $D2
    ld   [hl], $F0                                ; $6B48: $36 $F0
    ld   hl, $D20B                                ; $6B4A: $21 $0B $D2
    ld   [hl], $F8                                ; $6B4D: $36 $F8
    ld   hl, $D20D                                ; $6B4F: $21 $0D $D2
    ld   [hl], $F0                                ; $6B52: $36 $F0
    cp   $20                                      ; $6B54: $FE $20
    jr   c, jr_007_6B67                           ; $6B56: $38 $0F

    ld   hl, $D20E                                ; $6B58: $21 $0E $D2
    ld   [hl], $F2                                ; $6B5B: $36 $F2
    ld   hl, $D20B                                ; $6B5D: $21 $0B $D2
    ld   [hl], $FA                                ; $6B60: $36 $FA
    ld   hl, $D20D                                ; $6B62: $21 $0D $D2
    ld   [hl], $F2                                ; $6B65: $36 $F2

jr_007_6B67:
    ret                                           ; $6B67: $C9

func_007_6B68::
    call GetEntityTransitionCountdown             ; $6B68: $CD $05 $0C
    jr   nz, jr_007_6B72                          ; $6B6B: $20 $05

    ld   [hl], $20                                ; $6B6D: $36 $20
    jp   IncrementEntityState                     ; $6B6F: $C3 $12 $3B

jr_007_6B72:
    and  $3F                                      ; $6B72: $E6 $3F
    jr   nz, jr_007_6B76                          ; $6B74: $20 $00

jr_007_6B76:
    call GetEntityTransitionCountdown             ; $6B76: $CD $05 $0C
    and  $40                                      ; $6B79: $E6 $40
    jr   z, func_007_6BA3                         ; $6B7B: $28 $26

func_007_6B7D::
    call func_007_6EF0                            ; $6B7D: $CD $F0 $6E
    ld   hl, $D208                                ; $6B80: $21 $08 $D2
    ld   [hl], $01                                ; $6B83: $36 $01
    ld   hl, $D209                                ; $6B85: $21 $09 $D2
    ld   [hl], b                                  ; $6B88: $70
    ld   hl, $D20A                                ; $6B89: $21 $0A $D2
    ld   [hl], $F0                                ; $6B8C: $36 $F0
    ld   hl, $D20B                                ; $6B8E: $21 $0B $D2
    ld   [hl], $F8                                ; $6B91: $36 $F8
    ld   hl, $D20D                                ; $6B93: $21 $0D $D2
    ld   [hl], $F3                                ; $6B96: $36 $F3
    ld   hl, $D20C                                ; $6B98: $21 $0C $D2
    ld   [hl], $10                                ; $6B9B: $36 $10
    ld   hl, $D207                                ; $6B9D: $21 $07 $D2
    ld   [hl], $00                                ; $6BA0: $36 $00
    ret                                           ; $6BA2: $C9

func_007_6BA3::
    call func_007_6EF0                            ; $6BA3: $CD $F0 $6E
    ld   hl, $D208                                ; $6BA6: $21 $08 $D2
    ld   [hl], b                                  ; $6BA9: $70
    ld   hl, $D209                                ; $6BAA: $21 $09 $D2
    ld   [hl], b                                  ; $6BAD: $70
    ld   hl, $D20A                                ; $6BAE: $21 $0A $D2
    ld   [hl], $F8                                ; $6BB1: $36 $F8
    ld   hl, $D20B                                ; $6BB3: $21 $0B $D2
    ld   [hl], $F8                                ; $6BB6: $36 $F8
    ld   hl, $D20D                                ; $6BB8: $21 $0D $D2
    ld   [hl], $F0                                ; $6BBB: $36 $F0
    ld   hl, $D20C                                ; $6BBD: $21 $0C $D2
    ld   [hl], $10                                ; $6BC0: $36 $10
    ld   hl, $D207                                ; $6BC2: $21 $07 $D2
    ld   [hl], $00                                ; $6BC5: $36 $00
    ret                                           ; $6BC7: $C9

func_007_6BC8::
    call func_007_6EA2                            ; $6BC8: $CD $A2 $6E
    call GetEntityTransitionCountdown             ; $6BCB: $CD $05 $0C
    ret  nz                                       ; $6BCE: $C0

    call GetRandomByte                            ; $6BCF: $CD $0D $28
    and  $1F                                      ; $6BD2: $E6 $1F
    add  $30                                      ; $6BD4: $C6 $30
    ld   [hl], a                                  ; $6BD6: $77
    ld   a, $08                                   ; $6BD7: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $6BD9: $CD $AA $3B
    call IncrementEntityState                     ; $6BDC: $CD $12 $3B

label_007_6BDF:
    call func_007_7E5D                            ; $6BDF: $CD $5D $7E
    ld   hl, wEntitiesDirectionTable              ; $6BE2: $21 $80 $C3
    add  hl, bc                                   ; $6BE5: $09
    ld   [hl], e                                  ; $6BE6: $73

func_007_6BE7::
    call func_007_6B7D                            ; $6BE7: $CD $7D $6B
    ld   hl, wEntitiesDirectionTable              ; $6BEA: $21 $80 $C3
    add  hl, bc                                   ; $6BED: $09
    ld   a, [hl]                                  ; $6BEE: $7E
    and  a                                        ; $6BEF: $A7
    ret  nz                                       ; $6BF0: $C0

    jp   func_007_6BA3                            ; $6BF1: $C3 $A3 $6B

func_007_6BF4::
    call func_007_6EA2                            ; $6BF4: $CD $A2 $6E
    call func_007_7E5D                            ; $6BF7: $CD $5D $7E
    add  $20                                      ; $6BFA: $C6 $20
    cp   $40                                      ; $6BFC: $FE $40
    jr   nc, jr_007_6C14                          ; $6BFE: $30 $14

    call func_007_7E6D                            ; $6C00: $CD $6D $7E
    add  $1C                                      ; $6C03: $C6 $1C
    cp   $38                                      ; $6C05: $FE $38
    jr   nc, jr_007_6C14                          ; $6C07: $30 $0B

    call IncrementEntityState                     ; $6C09: $CD $12 $3B
    ld   [hl], $06                                ; $6C0C: $36 $06
    call GetEntityTransitionCountdown             ; $6C0E: $CD $05 $0C
    ld   [hl], $30                                ; $6C11: $36 $30
    ret                                           ; $6C13: $C9

jr_007_6C14:
    call GetEntityTransitionCountdown             ; $6C14: $CD $05 $0C
    jr   nz, jr_007_6C27                          ; $6C17: $20 $0E

    call GetRandomByte                            ; $6C19: $CD $0D $28
    and  $0F                                      ; $6C1C: $E6 $0F
    add  $10                                      ; $6C1E: $C6 $10
    ld   [hl], a                                  ; $6C20: $77
    call IncrementEntityState                     ; $6C21: $CD $12 $3B
    ld   [hl], $04                                ; $6C24: $36 $04
    ret                                           ; $6C26: $C9

jr_007_6C27:
    and  $0F                                      ; $6C27: $E6 $0F
    jr   nz, func_007_6C33                        ; $6C29: $20 $08

    ld   a, [$D209]                               ; $6C2B: $FA $09 $D2
    xor  $01                                      ; $6C2E: $EE $01
    ld   [$D209], a                               ; $6C30: $EA $09 $D2

func_007_6C33::
    call func_007_7E0A                            ; $6C33: $CD $0A $7E
    jp   label_3B23                               ; $6C36: $C3 $23 $3B

func_007_6C39::
    call GetEntityTransitionCountdown             ; $6C39: $CD $05 $0C
    jr   nz, jr_007_6C55                          ; $6C3C: $20 $17

func_007_6C3E::
    call GetEntityTransitionCountdown             ; $6C3E: $CD $05 $0C
    ld   [hl], $20                                ; $6C41: $36 $20
    call IncrementEntityState                     ; $6C43: $CD $12 $3B
    ld   [hl], $04                                ; $6C46: $36 $04
    ld   hl, wEntitiesHitboxFlagsTable            ; $6C48: $21 $50 $C3
    add  hl, bc                                   ; $6C4B: $09
    set  7, [hl]                                  ; $6C4C: $CB $FE
    ld   hl, wEntitiesUnknowTableH                ; $6C4E: $21 $30 $C4
    add  hl, bc                                   ; $6C51: $09
    res  6, [hl]                                  ; $6C52: $CB $B6
    ret                                           ; $6C54: $C9

jr_007_6C55:
    ld   hl, wEntitiesDirectionTable              ; $6C55: $21 $80 $C3
    add  hl, bc                                   ; $6C58: $09
    ld   a, [hl]                                  ; $6C59: $7E
    and  a                                        ; $6C5A: $A7
    jr   nz, jr_007_6CB8                          ; $6C5B: $20 $5B

    call GetEntityTransitionCountdown             ; $6C5D: $CD $05 $0C
    cp   $18                                      ; $6C60: $FE $18
    jr   c, jr_007_6C77                           ; $6C62: $38 $13

    call func_007_6BA3                            ; $6C64: $CD $A3 $6B
    ld   a, $08                                   ; $6C67: $3E $08
    ld   [$D20C], a                               ; $6C69: $EA $0C $D2
    ld   a, $E0                                   ; $6C6C: $3E $E0
    ld   [$D20D], a                               ; $6C6E: $EA $0D $D2
    ld   a, $01                                   ; $6C71: $3E $01
    ld   [$D207], a                               ; $6C73: $EA $07 $D2
    ret                                           ; $6C76: $C9

jr_007_6C77:
    cp   $10                                      ; $6C77: $FE $10
    jr   c, jr_007_6C9E                           ; $6C79: $38 $23

    cp   $17                                      ; $6C7B: $FE $17
    jr   nz, jr_007_6C89                          ; $6C7D: $20 $0A

    ld   a, $27                                   ; $6C7F: $3E $27
    ldh  [hNoiseSfx], a                           ; $6C81: $E0 $F4
    ld   hl, wEntitiesPrivateCountdown2Table      ; $6C83: $21 $00 $C3
    add  hl, bc                                   ; $6C86: $09
    ld   [hl], $10                                ; $6C87: $36 $10

jr_007_6C89:
    ld   a, $FF                                   ; $6C89: $3E $FF
    ld   [$D207], a                               ; $6C8B: $EA $07 $D2
    ld   a, $F0                                   ; $6C8E: $3E $F0
    ld   [$D20A], a                               ; $6C90: $EA $0A $D2
    ld   a, $F4                                   ; $6C93: $3E $F4
    ld   [$D20B], a                               ; $6C95: $EA $0B $D2
    ld   a, $01                                   ; $6C98: $3E $01
    ld   [$D208], a                               ; $6C9A: $EA $08 $D2
    ret                                           ; $6C9D: $C9

jr_007_6C9E:
    ld   a, $03                                   ; $6C9E: $3E $03
    ld   [$D207], a                               ; $6CA0: $EA $07 $D2
    ld   a, $F8                                   ; $6CA3: $3E $F8
    ld   [$D20C], a                               ; $6CA5: $EA $0C $D2
    ld   a, $08                                   ; $6CA8: $3E $08
    ld   [$D20D], a                               ; $6CAA: $EA $0D $D2
    ld   a, $F0                                   ; $6CAD: $3E $F0
    ld   [$D20A], a                               ; $6CAF: $EA $0A $D2
    ld   a, $F0                                   ; $6CB2: $3E $F0
    ld   [$D20B], a                               ; $6CB4: $EA $0B $D2
    ret                                           ; $6CB7: $C9

jr_007_6CB8:
    call GetEntityTransitionCountdown             ; $6CB8: $CD $05 $0C
    cp   $18                                      ; $6CBB: $FE $18
    jr   c, jr_007_6CD7                           ; $6CBD: $38 $18

    call func_007_6B7D                            ; $6CBF: $CD $7D $6B
    ld   a, $01                                   ; $6CC2: $3E $01
    ld   [$D209], a                               ; $6CC4: $EA $09 $D2
    ld   a, $F8                                   ; $6CC7: $3E $F8
    ld   [$D20C], a                               ; $6CC9: $EA $0C $D2
    ld   a, $E8                                   ; $6CCC: $3E $E8
    ld   [$D20D], a                               ; $6CCE: $EA $0D $D2
    ld   a, $00                                   ; $6CD1: $3E $00
    ld   [$D207], a                               ; $6CD3: $EA $07 $D2
    ret                                           ; $6CD6: $C9

jr_007_6CD7:
    cp   $10                                      ; $6CD7: $FE $10
    jr   c, jr_007_6CFE                           ; $6CD9: $38 $23

    cp   $17                                      ; $6CDB: $FE $17
    jr   nz, jr_007_6CE9                          ; $6CDD: $20 $0A

    ld   a, $27                                   ; $6CDF: $3E $27
    ldh  [hNoiseSfx], a                           ; $6CE1: $E0 $F4
    ld   hl, wEntitiesPrivateCountdown2Table      ; $6CE3: $21 $00 $C3
    add  hl, bc                                   ; $6CE6: $09
    ld   [hl], $10                                ; $6CE7: $36 $10

jr_007_6CE9:
    ld   a, $FF                                   ; $6CE9: $3E $FF
    ld   [$D207], a                               ; $6CEB: $EA $07 $D2
    ld   a, $F0                                   ; $6CEE: $3E $F0
    ld   [$D20A], a                               ; $6CF0: $EA $0A $D2
    ld   a, $F0                                   ; $6CF3: $3E $F0
    ld   [$D20B], a                               ; $6CF5: $EA $0B $D2
    ld   a, $00                                   ; $6CF8: $3E $00
    ld   [$D208], a                               ; $6CFA: $EA $08 $D2
    ret                                           ; $6CFD: $C9

jr_007_6CFE:
    ld   a, $02                                   ; $6CFE: $3E $02
    ld   [$D207], a                               ; $6D00: $EA $07 $D2
    ld   a, $10                                   ; $6D03: $3E $10
    ld   [$D20C], a                               ; $6D05: $EA $0C $D2
    ld   a, $08                                   ; $6D08: $3E $08
    ld   [$D20D], a                               ; $6D0A: $EA $0D $D2
    ld   a, $F0                                   ; $6D0D: $3E $F0
    ld   [$D20A], a                               ; $6D0F: $EA $0A $D2
    ld   a, $EC                                   ; $6D12: $3E $EC
    ld   [$D20B], a                               ; $6D14: $EA $0B $D2
    ret                                           ; $6D17: $C9

func_007_6D18::
    call func_007_6BE7                            ; $6D18: $CD $E7 $6B
    call GetEntityTransitionCountdown             ; $6D1B: $CD $05 $0C
    jr   nz, jr_007_6D46                          ; $6D1E: $20 $26

    call IncrementEntityState                     ; $6D20: $CD $12 $3B
    call func_007_733F                            ; $6D23: $CD $3F $73
    ld   hl, wEntitiesPrivateState1Table          ; $6D26: $21 $B0 $C2
    add  hl, bc                                   ; $6D29: $09
    ld   a, [hl]                                  ; $6D2A: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $6D2B: $21 $20 $C3
    add  hl, bc                                   ; $6D2E: $09
    ld   [hl], $30                                ; $6D2F: $36 $30
    and  a                                        ; $6D31: $A7
    jr   nz, jr_007_6D3B                          ; $6D32: $20 $07

    ld   [hl], $28                                ; $6D34: $36 $28
    ld   a, $18                                   ; $6D36: $3E $18
    jp   ApplyVectorTowardsLink_trampoline        ; $6D38: $C3 $AA $3B

jr_007_6D3B:
    ld   a, $08                                   ; $6D3B: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $6D3D: $CD $AA $3B
    call GetEntitySpeedYAddress                   ; $6D40: $CD $05 $40
    ld   [hl], $F0                                ; $6D43: $36 $F0
    ret                                           ; $6D45: $C9

jr_007_6D46:
    ld   a, [$D20E]                               ; $6D46: $FA $0E $D2
    add  $02                                      ; $6D49: $C6 $02
    ld   [$D20E], a                               ; $6D4B: $EA $0E $D2
    ld   a, [$D20B]                               ; $6D4E: $FA $0B $D2
    add  $02                                      ; $6D51: $C6 $02
    ld   [$D20B], a                               ; $6D53: $EA $0B $D2
    ld   a, [$D20D]                               ; $6D56: $FA $0D $D2
    add  $02                                      ; $6D59: $C6 $02
    ld   [$D20D], a                               ; $6D5B: $EA $0D $D2
    ret                                           ; $6D5E: $C9

func_007_6D5F::
    call GetEntityTransitionCountdown             ; $6D5F: $CD $05 $0C
    jr   z, jr_007_6D70                           ; $6D62: $28 $0C

    dec  a                                        ; $6D64: $3D
    jr   nz, jr_007_6D6A                          ; $6D65: $20 $03

    call func_007_6C3E                            ; $6D67: $CD $3E $6C

jr_007_6D6A:
    call func_007_6BE7                            ; $6D6A: $CD $E7 $6B
    jp   jr_007_6D46                              ; $6D6D: $C3 $46 $6D

jr_007_6D70:
    call func_007_6C33                            ; $6D70: $CD $33 $6C
    ldh  a, [hFFE8]                               ; $6D73: $F0 $E8
    and  a                                        ; $6D75: $A7
    ret  z                                        ; $6D76: $C8

    call GetEntityTransitionCountdown             ; $6D77: $CD $05 $0C
    ld   [hl], $10                                ; $6D7A: $36 $10
    jp   jr_007_6B15                              ; $6D7C: $C3 $15 $6B

func_007_6D7F::
    ldh  a, [hFFE8]                               ; $6D7F: $F0 $E8
    and  a                                        ; $6D81: $A7
    jr   z, jr_007_6D9C                           ; $6D82: $28 $18

    call IncrementEntityState                     ; $6D84: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $6D87: $CD $05 $0C
    ld   [hl], $20                                ; $6D8A: $36 $20
    ld   hl, wEntitiesHitboxFlagsTable            ; $6D8C: $21 $50 $C3
    add  hl, bc                                   ; $6D8F: $09
    res  7, [hl]                                  ; $6D90: $CB $BE
    ld   hl, wEntitiesUnknowTableH                ; $6D92: $21 $30 $C4
    add  hl, bc                                   ; $6D95: $09
    set  6, [hl]                                  ; $6D96: $CB $F6
    ld   a, JINGLE_MASTER_STALFOS                 ; $6D98: $3E $28
    ldh  [hJingle], a                             ; $6D9A: $E0 $F2

jr_007_6D9C:
    jp   func_007_6C33                            ; $6D9C: $C3 $33 $6C

func_007_6D9F::
    call GetEntityTransitionCountdown             ; $6D9F: $CD $05 $0C
    jr   nz, jr_007_6DA9                          ; $6DA2: $20 $05

    ld   [hl], $C0                                ; $6DA4: $36 $C0
    jp   IncrementEntityState                     ; $6DA6: $C3 $12 $3B

jr_007_6DA9:
    ld   hl, $D20B                                ; $6DA9: $21 $0B $D2
    ld   a, [hl]                                  ; $6DAC: $7E
    sub  $03                                      ; $6DAD: $D6 $03
    jr   z, jr_007_6DB8                           ; $6DAF: $28 $07

    bit  7, a                                     ; $6DB1: $CB $7F
    jr   z, jr_007_6DB7                           ; $6DB3: $28 $02

    inc  [hl]                                     ; $6DB5: $34
    inc  [hl]                                     ; $6DB6: $34

jr_007_6DB7:
    dec  [hl]                                     ; $6DB7: $35

jr_007_6DB8:
    ld   hl, $D20D                                ; $6DB8: $21 $0D $D2
    ld   a, [hl]                                  ; $6DBB: $7E
    sub  $03                                      ; $6DBC: $D6 $03
    jr   z, jr_007_6DC7                           ; $6DBE: $28 $07

    bit  7, a                                     ; $6DC0: $CB $7F
    jr   z, jr_007_6DC6                           ; $6DC2: $28 $02

    inc  [hl]                                     ; $6DC4: $34
    inc  [hl]                                     ; $6DC5: $34

jr_007_6DC6:
    dec  [hl]                                     ; $6DC6: $35

jr_007_6DC7:
    call GetEntityTransitionCountdown             ; $6DC7: $CD $05 $0C
    cp   $14                                      ; $6DCA: $FE $14
    jr   nc, jr_007_6DD8                          ; $6DCC: $30 $0A

    ld   a, [$D20E]                               ; $6DCE: $FA $0E $D2
    and  a                                        ; $6DD1: $A7
    jr   z, jr_007_6DD8                           ; $6DD2: $28 $04

    inc  a                                        ; $6DD4: $3C
    ld   [$D20E], a                               ; $6DD5: $EA $0E $D2

jr_007_6DD8:
    ret                                           ; $6DD8: $C9

func_007_6DD9::
    call GetEntityTransitionCountdown             ; $6DD9: $CD $05 $0C
    jr   nz, jr_007_6DE3                          ; $6DDC: $20 $05

    ld   [hl], $30                                ; $6DDE: $36 $30
    jp   IncrementEntityState                     ; $6DE0: $C3 $12 $3B

jr_007_6DE3:
    cp   $30                                      ; $6DE3: $FE $30
    jr   nc, jr_007_6DF5                          ; $6DE5: $30 $0E

    and  $03                                      ; $6DE7: $E6 $03
    jr   nz, jr_007_6DF5                          ; $6DE9: $20 $0A

    ld   a, [$D20E]                               ; $6DEB: $FA $0E $D2
    add  $02                                      ; $6DEE: $C6 $02
    cpl                                           ; $6DF0: $2F
    inc  a                                        ; $6DF1: $3C
    ld   [$D20E], a                               ; $6DF2: $EA $0E $D2

jr_007_6DF5:
    ret                                           ; $6DF5: $C9

func_007_6DF6::
    ld   a, [$D20E]                               ; $6DF6: $FA $0E $D2
    cp   $F0                                      ; $6DF9: $FE $F0
    jr   z, jr_007_6E01                           ; $6DFB: $28 $04

    dec  a                                        ; $6DFD: $3D
    ld   [$D20E], a                               ; $6DFE: $EA $0E $D2

jr_007_6E01:
    call GetEntityTransitionCountdown             ; $6E01: $CD $05 $0C
    jr   nz, jr_007_6E35                          ; $6E04: $20 $2F

    ld   e, $FF                                   ; $6E06: $1E $FF
    ldh  a, [hMapRoom]                            ; $6E08: $F0 $F6
    cp   $80                                      ; $6E0A: $FE $80
    jr   z, jr_007_6E16                           ; $6E0C: $28 $08

    ld   e, $03                                   ; $6E0E: $1E $03
    cp   $95                                      ; $6E10: $FE $95
    jr   z, jr_007_6E16                           ; $6E12: $28 $02

    ld   e, $02                                   ; $6E14: $1E $02

jr_007_6E16:
    ld   hl, wEntitiesUnknowTableY                ; $6E16: $21 $D0 $C3
    add  hl, bc                                   ; $6E19: $09
    ld   a, [hl]                                  ; $6E1A: $7E
    cp   e                                        ; $6E1B: $BB
    jr   c, jr_007_6E32                           ; $6E1C: $38 $14

    ld   hl, wEntitiesHitboxFlagsTable            ; $6E1E: $21 $50 $C3
    add  hl, bc                                   ; $6E21: $09
    set  7, [hl]                                  ; $6E22: $CB $FE
    call IncrementEntityState                     ; $6E24: $CD $12 $3B
    call_open_dialog $113                         ; $6E27
    call GetEntityTransitionCountdown             ; $6E2C: $CD $05 $0C
    ld   [hl], $04                                ; $6E2F: $36 $04
    ret                                           ; $6E31: $C9

jr_007_6E32:
    jp   func_007_6C3E                            ; $6E32: $C3 $3E $6C

jr_007_6E35:
    cp   $24                                      ; $6E35: $FE $24
    jr   nc, jr_007_6E57                          ; $6E37: $30 $1E

    ld   hl, $D20B                                ; $6E39: $21 $0B $D2
    ld   a, [hl]                                  ; $6E3C: $7E
    sub  $F8                                      ; $6E3D: $D6 $F8
    jr   z, jr_007_6E48                           ; $6E3F: $28 $07

    bit  7, a                                     ; $6E41: $CB $7F
    jr   z, jr_007_6E47                           ; $6E43: $28 $02

    inc  [hl]                                     ; $6E45: $34
    inc  [hl]                                     ; $6E46: $34

jr_007_6E47:
    dec  [hl]                                     ; $6E47: $35

jr_007_6E48:
    ld   hl, $D20D                                ; $6E48: $21 $0D $D2
    ld   a, [hl]                                  ; $6E4B: $7E
    sub  $F0                                      ; $6E4C: $D6 $F0
    jr   z, jr_007_6E57                           ; $6E4E: $28 $07

    bit  7, a                                     ; $6E50: $CB $7F
    jr   z, jr_007_6E56                           ; $6E52: $28 $02

    inc  [hl]                                     ; $6E54: $34
    inc  [hl]                                     ; $6E55: $34

jr_007_6E56:
    dec  [hl]                                     ; $6E56: $35

jr_007_6E57:
    ret                                           ; $6E57: $C9

func_007_6E58::
    call func_007_6BE7                            ; $6E58: $CD $E7 $6B
    call GetEntityTransitionCountdown             ; $6E5B: $CD $05 $0C
    jr   z, jr_007_6E6A                           ; $6E5E: $28 $0A

    dec  a                                        ; $6E60: $3D
    jr   nz, jr_007_6E67                          ; $6E61: $20 $04

    ld   a, $3F                                   ; $6E63: $3E $3F
    ldh  [hNoiseSfx], a                           ; $6E65: $E0 $F4

jr_007_6E67:
    jp   jr_007_6D46                              ; $6E67: $C3 $46 $6D

jr_007_6E6A:
    ld   hl, wEntitiesSpeedZTable                 ; $6E6A: $21 $20 $C3
    add  hl, bc                                   ; $6E6D: $09
    ld   [hl], $30                                ; $6E6E: $36 $30
    ld   hl, wEntitiesPosZTable                   ; $6E70: $21 $10 $C3
    add  hl, bc                                   ; $6E73: $09
    ld   a, [hl]                                  ; $6E74: $7E
    cp   $78                                      ; $6E75: $FE $78
    jr   c, jr_007_6EA1                           ; $6E77: $38 $28

    call label_27DD                               ; $6E79: $CD $DD $27
    call func_007_7EA4                            ; $6E7C: $CD $A4 $7E

func_007_6E7F::
    ld   hl, wIndoorARoomStatus                   ; $6E7F: $21 $00 $D9
    ldh  a, [hMapRoom]                            ; $6E82: $F0 $F6
    cp   $FF                                      ; $6E84: $FE $FF
    jr   nz, jr_007_6E8D                          ; $6E86: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $6E88: $21 $E0 $DD
    jr   jr_007_6E9A                              ; $6E8B: $18 $0D

jr_007_6E8D:
    ld   e, a                                     ; $6E8D: $5F
    ld   d, b                                     ; $6E8E: $50
    ldh  a, [hMapId]                              ; $6E8F: $F0 $F7
    cp   $1A                                      ; $6E91: $FE $1A
    jr   nc, jr_007_6E9A                          ; $6E93: $30 $05

    cp   $06                                      ; $6E95: $FE $06
    jr   c, jr_007_6E9A                           ; $6E97: $38 $01

    inc  d                                        ; $6E99: $14

jr_007_6E9A:
    add  hl, de                                   ; $6E9A: $19
    ld   a, [hl]                                  ; $6E9B: $7E
    or   $20                                      ; $6E9C: $F6 $20
    ld   [hl], a                                  ; $6E9E: $77
    ldh  [hRoomStatus], a                         ; $6E9F: $E0 $F8

jr_007_6EA1:
    ret                                           ; $6EA1: $C9

func_007_6EA2::
    ld   hl, wEntitiesPrivateState1Table          ; $6EA2: $21 $B0 $C2
    add  hl, bc                                   ; $6EA5: $09
    ld   [hl], b                                  ; $6EA6: $70
    call func_007_7E5D                            ; $6EA7: $CD $5D $7E
    add  $30                                      ; $6EAA: $C6 $30
    cp   $60                                      ; $6EAC: $FE $60
    jr   nc, jr_007_6EC3                          ; $6EAE: $30 $13

    call func_007_7E6D                            ; $6EB0: $CD $6D $7E
    add  $30                                      ; $6EB3: $C6 $30
    cp   $60                                      ; $6EB5: $FE $60
    jr   nc, jr_007_6EC3                          ; $6EB7: $30 $0A

    ld   a, e                                     ; $6EB9: $7B
    cp   $02                                      ; $6EBA: $FE $02
    ret  nz                                       ; $6EBC: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $6EBD: $21 $B0 $C2
    add  hl, bc                                   ; $6EC0: $09
    ld   [hl], $01                                ; $6EC1: $36 $01

jr_007_6EC3:
    call IncrementEntityState                     ; $6EC3: $CD $12 $3B
    ld   [hl], $07                                ; $6EC6: $36 $07
    call GetEntityTransitionCountdown             ; $6EC8: $CD $05 $0C
    ld   [hl], $20                                ; $6ECB: $36 $20
    jp   label_007_6BDF                           ; $6ECD: $C3 $DF $6B

func_007_6ED0::
    ld   hl, wEntitiesPosZTable                   ; $6ED0: $21 $10 $C3
    add  hl, bc                                   ; $6ED3: $09
    ld   [hl], $7F                                ; $6ED4: $36 $7F
    call GetEntityTransitionCountdown             ; $6ED6: $CD $05 $0C
    ld   [hl], $80                                ; $6ED9: $36 $80
    ldh  a, [hDefaultMusicTrack]                  ; $6EDB: $F0 $B0
    ld   hl, wEntitiesUnknowTableR                ; $6EDD: $21 $90 $C3
    add  hl, bc                                   ; $6EE0: $09
    ld   [hl], a                                  ; $6EE1: $77
    ld   hl, wEntitiesHealthTable                 ; $6EE2: $21 $60 $C3
    add  hl, bc                                   ; $6EE5: $09
    ld   [hl], $FF                                ; $6EE6: $36 $FF
    ldh  a, [hMapRoom]                            ; $6EE8: $F0 $F6
    cp   $80                                      ; $6EEA: $FE $80
    jr   nz, func_007_6EF0                        ; $6EEC: $20 $02

    ld   [hl], $C0                                ; $6EEE: $36 $C0

func_007_6EF0::
    ld   a, $F8                                   ; $6EF0: $3E $F8
    ld   [$D20A], a                               ; $6EF2: $EA $0A $D2
    ld   a, $F8                                   ; $6EF5: $3E $F8
    ld   [$D20B], a                               ; $6EF7: $EA $0B $D2
    ld   a, $F0                                   ; $6EFA: $3E $F0
    ld   [$D20E], a                               ; $6EFC: $EA $0E $D2
    ld   a, $00                                   ; $6EFF: $3E $00
    ld   [$D207], a                               ; $6F01: $EA $07 $D2
    ld   [$D208], a                               ; $6F04: $EA $08 $D2
    ld   [$D209], a                               ; $6F07: $EA $09 $D2
    ld   a, $10                                   ; $6F0A: $3E $10
    ld   [$D20C], a                               ; $6F0C: $EA $0C $D2
    ld   a, $F0                                   ; $6F0F: $3E $F0
    ld   [$D20D], a                               ; $6F11: $EA $0D $D2
    ret                                           ; $6F14: $C9

Data_007_6F15::
    db   $70, $01, $70, $21

Data_007_6F19::
    db   $00, $F8, $60, $00, $00, $00, $62, $00, $00, $08, $64, $00, $00, $10, $66, $00
    db   $00, $F8, $66, $20, $00, $00, $64, $20, $00, $08, $62, $20, $00, $10, $60, $20

Data_007_6F39::
    db   $00, $F8, $68, $00, $00, $00, $6A, $00, $00, $08, $6C, $00, $00, $10, $6E, $00
    db   $00, $F8, $6E, $20, $00, $00, $6C, $20, $00, $08, $6A, $20, $00, $10, $68, $20

Data_007_6F59::
    db   $00, $00, $72, $03, $F8, $08, $74, $03, $F8, $00, $74, $23, $00, $08, $72, $23
    db   $00, $00, $72, $43, $08, $08, $74, $43, $08, $00, $74, $63, $00, $08, $72, $63

Data_007_6F79::
    db   $10, $00, $76, $00, $10, $08, $78, $00, $10, $10, $7A, $00, $08, $18, $7C, $00
    db   $F8, $18, $7E, $00

Data_007_6F8D::
    db   $10, $08, $76, $20, $10, $00, $78, $20, $10, $F8, $7A, $20, $08, $F0, $7C, $20
    db   $F8, $F0, $7E, $20

Data_007_6FA1::
    db   $0C, $FB, $26, $00, $0C, $01, $26, $00, $0C, $07, $26, $00, $0C, $0D, $26, $00

func_007_6FB1::
    ld   hl, wEntitiesPosZTable                   ; $6FB1: $21 $10 $C3
    add  hl, bc                                   ; $6FB4: $09
    ld   a, [hl]                                  ; $6FB5: $7E
    cp   $70                                      ; $6FB6: $FE $70
    ret  nc                                       ; $6FB8: $D0

    call func_007_6FE6                            ; $6FB9: $CD $E6 $6F
    call func_007_7015                            ; $6FBC: $CD $15 $70
    call func_007_703A                            ; $6FBF: $CD $3A $70
    call func_007_706F                            ; $6FC2: $CD $6F $70
    call func_007_7090                            ; $6FC5: $CD $90 $70
    ld   hl, wEntitiesPosZTable                   ; $6FC8: $21 $10 $C3
    add  hl, bc                                   ; $6FCB: $09
    ld   a, [hl]                                  ; $6FCC: $7E
    and  a                                        ; $6FCD: $A7
    jr   z, jr_007_6FE3                           ; $6FCE: $28 $13

    ldh  a, [hActiveEntityPosY]                   ; $6FD0: $F0 $EF
    sub  $02                                      ; $6FD2: $D6 $02
    ldh  [hActiveEntityVisualPosY], a             ; $6FD4: $E0 $EC
    ld   hl, Data_007_6FA1                        ; $6FD6: $21 $A1 $6F
    ld   c, $04                                   ; $6FD9: $0E $04
    call RenderActiveEntitySpritesRect            ; $6FDB: $CD $E6 $3C
    ld   a, $04                                   ; $6FDE: $3E $04
    call label_3DA0                               ; $6FE0: $CD $A0 $3D

jr_007_6FE3:
    jp   CopyEntityPositionToActivePosition       ; $6FE3: $C3 $8A $3D

func_007_6FE6::
    ld   a, [$D20C]                               ; $6FE6: $FA $0C $D2
    ld   hl, hActiveEntityPosX                    ; $6FE9: $21 $EE $FF
    add  [hl]                                     ; $6FEC: $86
    ld   [hl], a                                  ; $6FED: $77
    ld   a, [$D20D]                               ; $6FEE: $FA $0D $D2
    ld   hl, hActiveEntityVisualPosY              ; $6FF1: $21 $EC $FF
    add  [hl]                                     ; $6FF4: $86
    ld   [hl], a                                  ; $6FF5: $77
    ld   a, [$D207]                               ; $6FF6: $FA $07 $D2
    cp   $FF                                      ; $6FF9: $FE $FF
    jr   z, jr_007_7012                           ; $6FFB: $28 $15

    rla                                           ; $6FFD: $17
    rla                                           ; $6FFE: $17
    rla                                           ; $6FFF: $17
    and  $F8                                      ; $7000: $E6 $F8
    ld   e, a                                     ; $7002: $5F
    ld   d, b                                     ; $7003: $50
    ld   hl, Data_007_6F59                        ; $7004: $21 $59 $6F
    add  hl, de                                   ; $7007: $19
    ld   c, $02                                   ; $7008: $0E $02
    call RenderActiveEntitySpritesRect            ; $700A: $CD $E6 $3C
    ld   a, $02                                   ; $700D: $3E $02
    jp   label_007_7034                           ; $700F: $C3 $34 $70

jr_007_7012:
    jp   CopyEntityPositionToActivePosition       ; $7012: $C3 $8A $3D

func_007_7015::
    ld   hl, wEntitiesPrivateCountdown2Table      ; $7015: $21 $00 $C3
    add  hl, bc                                   ; $7018: $09
    ld   a, [hl]                                  ; $7019: $7E
    and  a                                        ; $701A: $A7
    ret  z                                        ; $701B: $C8

    call func_007_70B7                            ; $701C: $CD $B7 $70
    ld   hl, wEntitiesDirectionTable              ; $701F: $21 $80 $C3
    add  hl, bc                                   ; $7022: $09
    ld   a, [hl]                                  ; $7023: $7E
    ld   hl, Data_007_6F79                        ; $7024: $21 $79 $6F
    and  a                                        ; $7027: $A7
    jr   z, jr_007_702D                           ; $7028: $28 $03

    ld   hl, Data_007_6F8D                        ; $702A: $21 $8D $6F

jr_007_702D:
    ld   c, $05                                   ; $702D: $0E $05
    call RenderActiveEntitySpritesRect            ; $702F: $CD $E6 $3C
    ld   a, $05                                   ; $7032: $3E $05

label_007_7034:
    call label_3DA0                               ; $7034: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $7037: $C3 $8A $3D

func_007_703A::
    ld   a, [$D20A]                               ; $703A: $FA $0A $D2
    ld   hl, hActiveEntityPosX                    ; $703D: $21 $EE $FF
    add  [hl]                                     ; $7040: $86
    ld   [hl], a                                  ; $7041: $77
    ld   a, [$D20A]                               ; $7042: $FA $0A $D2
    add  $0C                                      ; $7045: $C6 $0C
    ld   [$D5C0], a                               ; $7047: $EA $C0 $D5
    ld   a, [$D20B]                               ; $704A: $FA $0B $D2
    ld   hl, hActiveEntityVisualPosY              ; $704D: $21 $EC $FF
    add  [hl]                                     ; $7050: $86
    ld   [hl], a                                  ; $7051: $77
    ld   a, [$D20B]                               ; $7052: $FA $0B $D2
    add  $08                                      ; $7055: $C6 $08
    ld   [$D5C2], a                               ; $7057: $EA $C2 $D5
    ld   a, $08                                   ; $705A: $3E $08
    ld   [$D5C1], a                               ; $705C: $EA $C1 $D5
    ld   a, $06                                   ; $705F: $3E $06
    ld   [$D5C3], a                               ; $7061: $EA $C3 $D5
    ld   de, Data_007_6F15                        ; $7064: $11 $15 $6F
    call RenderActiveEntitySpritesPair            ; $7067: $CD $C0 $3B
    ld   a, $02                                   ; $706A: $3E $02
    jp   label_007_7034                           ; $706C: $C3 $34 $70

func_007_706F::
    ld   a, [$D20E]                               ; $706F: $FA $0E $D2
    ld   hl, hActiveEntityVisualPosY              ; $7072: $21 $EC $FF
    add  [hl]                                     ; $7075: $86
    ld   [hl], a                                  ; $7076: $77
    ld   a, [$D208]                               ; $7077: $FA $08 $D2
    rla                                           ; $707A: $17
    rla                                           ; $707B: $17
    rla                                           ; $707C: $17
    rla                                           ; $707D: $17
    and  $F0                                      ; $707E: $E6 $F0
    ld   e, a                                     ; $7080: $5F
    ld   d, b                                     ; $7081: $50
    ld   hl, Data_007_6F19                        ; $7082: $21 $19 $6F
    add  hl, de                                   ; $7085: $19
    ld   c, $04                                   ; $7086: $0E $04
    call RenderActiveEntitySpritesRect            ; $7088: $CD $E6 $3C
    ld   a, $04                                   ; $708B: $3E $04
    jp   label_007_7034                           ; $708D: $C3 $34 $70

func_007_7090::
    ld   a, [$D20E]                               ; $7090: $FA $0E $D2
    cp   $00                                      ; $7093: $FE $00
    ret  z                                        ; $7095: $C8

    ld   a, [$D20F]                               ; $7096: $FA $0F $D2
    ld   hl, hActiveEntityVisualPosY              ; $7099: $21 $EC $FF
    add  [hl]                                     ; $709C: $86
    ld   [hl], a                                  ; $709D: $77
    ld   a, [$D209]                               ; $709E: $FA $09 $D2
    rla                                           ; $70A1: $17
    rla                                           ; $70A2: $17
    rla                                           ; $70A3: $17
    rla                                           ; $70A4: $17
    and  $F0                                      ; $70A5: $E6 $F0
    ld   e, a                                     ; $70A7: $5F
    ld   d, b                                     ; $70A8: $50
    ld   hl, Data_007_6F39                        ; $70A9: $21 $39 $6F
    add  hl, de                                   ; $70AC: $19
    ld   c, $04                                   ; $70AD: $0E $04
    call RenderActiveEntitySpritesRect            ; $70AF: $CD $E6 $3C
    ld   a, $04                                   ; $70B2: $3E $04
    jp   label_007_7034                           ; $70B4: $C3 $34 $70

func_007_70B7::
    ld   hl, $C146                                ; $70B7: $21 $46 $C1
    ld   a, [wInvincibilityCounter]               ; $70BA: $FA $C7 $DB
    or   [hl]                                     ; $70BD: $B6
    jr   nz, jr_007_7111                          ; $70BE: $20 $51

    ldh  a, [hActiveEntityVisualPosY]             ; $70C0: $F0 $EC
    add  $18                                      ; $70C2: $C6 $18
    ld   e, a                                     ; $70C4: $5F
    ldh  a, [hLinkPositionY]                      ; $70C5: $F0 $99
    ld   hl, hLinkPositionZ                       ; $70C7: $21 $A2 $FF
    sub  [hl]                                     ; $70CA: $96
    add  $08                                      ; $70CB: $C6 $08
    sub  e                                        ; $70CD: $93
    add  $0C                                      ; $70CE: $C6 $0C
    cp   $18                                      ; $70D0: $FE $18
    jr   nc, jr_007_7111                          ; $70D2: $30 $3D

    ld   hl, wEntitiesDirectionTable              ; $70D4: $21 $80 $C3
    add  hl, bc                                   ; $70D7: $09
    ld   e, $08                                   ; $70D8: $1E $08
    ld   a, [hl]                                  ; $70DA: $7E
    and  a                                        ; $70DB: $A7
    jr   z, jr_007_70E0                           ; $70DC: $28 $02

    ld   e, $F8                                   ; $70DE: $1E $F8

jr_007_70E0:
    ldh  a, [hActiveEntityPosX]                   ; $70E0: $F0 $EE
    add  e                                        ; $70E2: $83
    ld   hl, hLinkPositionX                       ; $70E3: $21 $98 $FF
    sub  [hl]                                     ; $70E6: $96
    add  $1A                                      ; $70E7: $C6 $1A
    cp   $34                                      ; $70E9: $FE $34
    jr   nc, jr_007_7111                          ; $70EB: $30 $24

    ld   a, $28                                   ; $70ED: $3E $28
    call GetVectorTowardsLink_trampoline          ; $70EF: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $70F2: $F0 $D7
    ldh  [hLinkPositionYIncrement], a             ; $70F4: $E0 $9B
    ldh  a, [hScratch1]                           ; $70F6: $F0 $D8
    ldh  [hLinkPositionXIncrement], a             ; $70F8: $E0 $9A
    ld   a, $02                                   ; $70FA: $3E $02
    ld   [$C146], a                               ; $70FC: $EA $46 $C1
    ld   a, $13                                   ; $70FF: $3E $13
    ldh  [$FFA3], a                               ; $7101: $E0 $A3
    ld   a, $08                                   ; $7103: $3E $08
    ld   [wSubtractHealthBuffer], a               ; $7105: $EA $94 $DB
    ld   a, $20                                   ; $7108: $3E $20
    ld   [wInvincibilityCounter], a               ; $710A: $EA $C7 $DB
    ld   a, $03                                   ; $710D: $3E $03
    ldh  [hWaveSfx], a                            ; $710F: $E0 $F3

jr_007_7111:
    ret                                           ; $7111: $C9

Data_007_7112::
    db   $12, $14, $16, $18, $19, $1A, $1A, $1A, $1A, $1A

FireballShooterEntityHandler::
    call func_007_7D96                            ; $711C: $CD $96 $7D
    call func_007_7E5D                            ; $711F: $CD $5D $7E
    add  $20                                      ; $7122: $C6 $20
    cp   $40                                      ; $7124: $FE $40
    jr   nc, jr_007_7131                          ; $7126: $30 $09

    call func_007_7E6D                            ; $7128: $CD $6D $7E
    add  $20                                      ; $712B: $C6 $20
    cp   $40                                      ; $712D: $FE $40
    jr   c, jr_007_7197                           ; $712F: $38 $66

jr_007_7131:
    ld   hl, wEntitiesSpriteVariantTable          ; $7131: $21 $B0 $C3
    add  hl, bc                                   ; $7134: $09
    ld   a, [hl]                                  ; $7135: $7E
    inc  a                                        ; $7136: $3C
    ld   [hl], a                                  ; $7137: $77
    and  $7F                                      ; $7138: $E6 $7F
    ret  nz                                       ; $713A: $C0

    ld   e, $0F                                   ; $713B: $1E $0F
    ld   d, b                                     ; $713D: $50

jr_007_713E:
    ld   hl, wEntitiesTypeTable                   ; $713E: $21 $A0 $C3
    add  hl, de                                   ; $7141: $19
    ld   a, [hl]                                  ; $7142: $7E
    cp   $82                                      ; $7143: $FE $82
    jr   z, jr_007_7161                           ; $7145: $28 $1A

    cp   $9E                                      ; $7147: $FE $9E
    jr   z, jr_007_7161                           ; $7149: $28 $16

    cp   $7D                                      ; $714B: $FE $7D
    jr   z, jr_007_7161                           ; $714D: $28 $12

    ld   hl, wEntitiesPhysicsFlagsTable           ; $714F: $21 $40 $C3
    add  hl, de                                   ; $7152: $19
    ld   a, [hl]                                  ; $7153: $7E
    and  $80                                      ; $7154: $E6 $80
    jr   nz, jr_007_7161                          ; $7156: $20 $09

    ld   hl, wEntitiesStatusTable                 ; $7158: $21 $80 $C2
    add  hl, de                                   ; $715B: $19
    ld   a, [hl]                                  ; $715C: $7E
    cp   $05                                      ; $715D: $FE $05
    jr   z, jr_007_7168                           ; $715F: $28 $07

jr_007_7161:
    dec  e                                        ; $7161: $1D
    ld   a, e                                     ; $7162: $7B
    cp   $FF                                      ; $7163: $FE $FF
    jr   nz, jr_007_713E                          ; $7165: $20 $D7

    ret                                           ; $7167: $C9

jr_007_7168:
    ld   a, [wRoomEventEffectExecuted]            ; $7168: $FA $8F $C1
    and  a                                        ; $716B: $A7
    ret  nz                                       ; $716C: $C0

    ld   a, $7D                                   ; $716D: $3E $7D
    call SpawnNewEntity_trampoline                ; $716F: $CD $86 $3B
    jr   c, jr_007_7197                           ; $7172: $38 $23

    ldh  a, [hScratch0]                           ; $7174: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7176: $21 $00 $C2
    add  hl, de                                   ; $7179: $19
    ld   [hl], a                                  ; $717A: $77
    ldh  a, [hScratch1]                           ; $717B: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $717D: $21 $10 $C2
    add  hl, de                                   ; $7180: $19
    ld   [hl], a                                  ; $7181: $77
    push bc                                       ; $7182: $C5
    ld   c, e                                     ; $7183: $4B
    ld   b, d                                     ; $7184: $42
    ldh  a, [hMapId]                              ; $7185: $F0 $F7
    ld   e, a                                     ; $7187: $5F
    ld   a, $14                                   ; $7188: $3E $14
    cp   $0A                                      ; $718A: $FE $0A
    jr   nc, jr_007_7193                          ; $718C: $30 $05

    ld   hl, Data_007_7112                        ; $718E: $21 $12 $71
    add  hl, de                                   ; $7191: $19
    ld   a, [hl]                                  ; $7192: $7E

jr_007_7193:
    call ApplyVectorTowardsLink_trampoline        ; $7193: $CD $AA $3B
    pop  bc                                       ; $7196: $C1

jr_007_7197:
    ret                                           ; $7197: $C9

KanaletBombableWallEntityHandler::
    ld   hl, wEntitiesLoadOrderTable              ; $7198: $21 $60 $C4
    add  hl, bc                                   ; $719B: $09
    ld   a, [hl]                                  ; $719C: $7E
    cp   $00                                      ; $719D: $FE $00
    jr   nz, jr_007_71B4                          ; $719F: $20 $13

    ldh  a, [hRoomStatus]                         ; $71A1: $F0 $F8
    and  $10                                      ; $71A3: $E6 $10
    jp   nz, func_007_7EA4                        ; $71A5: $C2 $A4 $7E

    ld   hl, wEntitiesLoadOrderTable              ; $71A8: $21 $60 $C4
    add  hl, bc                                   ; $71AB: $09
    ld   [hl], $FF                                ; $71AC: $36 $FF
    ld   hl, wEntitiesDroppedItemTable            ; $71AE: $21 $E0 $C4
    add  hl, bc                                   ; $71B1: $09
    ld   [hl], $3C                                ; $71B2: $36 $3C

jr_007_71B4:
    call func_007_7D96                            ; $71B4: $CD $96 $7D
    ld   hl, wEntitiesSpriteVariantTable          ; $71B7: $21 $B0 $C3
    add  hl, bc                                   ; $71BA: $09
    ld   [hl], b                                  ; $71BB: $70
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $71BC: $21 $10 $C4
    add  hl, bc                                   ; $71BF: $09
    ld   a, [hl]                                  ; $71C0: $7E
    and  a                                        ; $71C1: $A7
    jp   z, jr_007_7246                           ; $71C2: $CA $46 $72

    ld   a, $14                                   ; $71C5: $3E $14
    call SpawnNewEntity_trampoline                ; $71C7: $CD $86 $3B
    jr   c, jr_007_7246                           ; $71CA: $38 $7A

    ld   hl, wEntitiesDroppedItemTable            ; $71CC: $21 $E0 $C4
    add  hl, bc                                   ; $71CF: $09
    ld   a, [hl]                                  ; $71D0: $7E
    ld   hl, wEntitiesDroppedItemTable            ; $71D1: $21 $E0 $C4
    add  hl, de                                   ; $71D4: $19
    ld   [hl], a                                  ; $71D5: $77
    ldh  a, [hScratch0]                           ; $71D6: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $71D8: $21 $00 $C2
    add  hl, de                                   ; $71DB: $19
    ld   [hl], a                                  ; $71DC: $77
    ldh  a, [hScratch1]                           ; $71DD: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $71DF: $21 $10 $C2
    add  hl, de                                   ; $71E2: $19
    add  $08                                      ; $71E3: $C6 $08
    ld   [hl], a                                  ; $71E5: $77
    call label_3E34                               ; $71E6: $CD $34 $3E
    ldh  a, [hActiveEntityPosX]                   ; $71E9: $F0 $EE
    sub  $08                                      ; $71EB: $D6 $08
    ldh  [hSwordIntersectedAreaX], a              ; $71ED: $E0 $CE
    ldh  a, [hActiveEntityPosY]                   ; $71EF: $F0 $EF
    sub  $10                                      ; $71F1: $D6 $10
    ldh  [hSwordIntersectedAreaY], a              ; $71F3: $E0 $CD
    ldh  a, [hSwordIntersectedAreaX]              ; $71F5: $F0 $CE
    swap a                                        ; $71F7: $CB $37
    and  $0F                                      ; $71F9: $E6 $0F
    ld   e, a                                     ; $71FB: $5F
    ldh  a, [hSwordIntersectedAreaY]              ; $71FC: $F0 $CD
    and  $F0                                      ; $71FE: $E6 $F0
    or   e                                        ; $7200: $B3
    ld   e, a                                     ; $7201: $5F
    ld   d, b                                     ; $7202: $50
    ld   hl, wRoomObjects                         ; $7203: $21 $11 $D7
    add  hl, de                                   ; $7206: $19
    ld   [hl], $91                                ; $7207: $36 $91
    call label_2887                               ; $7209: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $720C: $F0 $FE
    and  a                                        ; $720E: $A7
    jr   z, jr_007_721D                           ; $720F: $28 $0C

    push bc                                       ; $7211: $C5
    ld   a, $91                                   ; $7212: $3E $91
    ld   [$DDD8], a                               ; $7214: $EA $D8 $DD
    ld   a, $07                                   ; $7217: $3E $07
    call func_91D                                ; $7219: $CD $1D $09
    pop  bc                                       ; $721C: $C1

jr_007_721D:
    ld   a, [wRequests]                           ; $721D: $FA $00 $D6
    ld   e, a                                     ; $7220: $5F
    ld   d, $00                                   ; $7221: $16 $00
    ld   hl, wRequestDestinationHigh              ; $7223: $21 $01 $D6
    add  hl, de                                   ; $7226: $19
    add  $0A                                      ; $7227: $C6 $0A
    ld   [wRequests], a                           ; $7229: $EA $00 $D6
    ld   e, $08                                   ; $722C: $1E $08
    call func_007_7233                            ; $722E: $CD $33 $72
    ld   e, $09                                   ; $7231: $1E $09

func_007_7233::
    ldh  a, [$FFCF]                               ; $7233: $F0 $CF
    ld   [hl+], a                                 ; $7235: $22
    ldh  a, [$FFD0]                               ; $7236: $F0 $D0
    ld   [hl+], a                                 ; $7238: $22
    inc  a                                        ; $7239: $3C
    ldh  [$FFD0], a                               ; $723A: $E0 $D0
    ld   a, $81                                   ; $723C: $3E $81
    ld   [hl+], a                                 ; $723E: $22
    ld   a, e                                     ; $723F: $7B
    ld   [hl+], a                                 ; $7240: $22
    inc  a                                        ; $7241: $3C
    inc  a                                        ; $7242: $3C
    ld   [hl+], a                                 ; $7243: $22
    xor  a                                        ; $7244: $AF
    ld   [hl], a                                  ; $7245: $77

jr_007_7246:
    ret                                           ; $7246: $C9

Data_007_7247::
    db   $74, $01, $74, $21, $76, $01, $78, $01, $7A, $01, $7A, $21, $78, $21, $76, $21
    db   $7C, $01, $7C, $01

StarEntityHandler::
    ld   de, Data_007_7247                        ; $725B: $11 $47 $72
    call RenderActiveEntitySpritesPair            ; $725E: $CD $C0 $3B
    call func_007_7D96                            ; $7261: $CD $96 $7D
    call func_007_7DC3                            ; $7264: $CD $C3 $7D
    call label_3B39                               ; $7267: $CD $39 $3B
    call func_007_7E0A                            ; $726A: $CD $0A $7E
    call label_3B23                               ; $726D: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7270: $21 $A0 $C2
    add  hl, bc                                   ; $7273: $09
    ld   a, [hl]                                  ; $7274: $7E
    and  $03                                      ; $7275: $E6 $03
    jr   nz, jr_007_7280                          ; $7277: $20 $07

    ld   a, [hl]                                  ; $7279: $7E
    and  $0C                                      ; $727A: $E6 $0C
    jr   nz, jr_007_728A                          ; $727C: $20 $0C

    jr   jr_007_7291                              ; $727E: $18 $11

jr_007_7280:
    ld   hl, wEntitiesSpeedXTable                 ; $7280: $21 $40 $C2
    add  hl, bc                                   ; $7283: $09
    ld   a, [hl]                                  ; $7284: $7E
    cpl                                           ; $7285: $2F
    inc  a                                        ; $7286: $3C
    ld   [hl], a                                  ; $7287: $77
    jr   jr_007_7291                              ; $7288: $18 $07

jr_007_728A:
    call GetEntitySpeedYAddress                   ; $728A: $CD $05 $40
    ld   a, [hl]                                  ; $728D: $7E
    cpl                                           ; $728E: $2F
    inc  a                                        ; $728F: $3C
    ld   [hl], a                                  ; $7290: $77

jr_007_7291:
    ldh  a, [hFrameCounter]                       ; $7291: $F0 $E7
    rra                                           ; $7293: $1F
    rra                                           ; $7294: $1F
    rra                                           ; $7295: $1F
    and  $03                                      ; $7296: $E6 $03
    jp   SetEntitySpriteVariant                   ; $7298: $C3 $0C $3B

Data_007_729B::
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $54, $00, $54, $20, $52, $00, $52, $20

Data_007_72AB::
    db   $56, $00, $56, $00

HidingGelEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $72AF: $F0 $F1
    cp   $01                                      ; $72B1: $FE $01
    jr   nz, jr_007_72BD                          ; $72B3: $20 $08

    ld   de, Data_007_72AB                        ; $72B5: $11 $AB $72
    call RenderActiveEntitySprite                 ; $72B8: $CD $77 $3C
    jr   jr_007_72C3                              ; $72BB: $18 $06

jr_007_72BD:
    ld   de, Data_007_729B                        ; $72BD: $11 $9B $72
    call RenderActiveEntitySpritesPair            ; $72C0: $CD $C0 $3B

jr_007_72C3:
    call func_007_7D96                            ; $72C3: $CD $96 $7D
    call func_007_7DC3                            ; $72C6: $CD $C3 $7D
    call func_007_7E43                            ; $72C9: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $72CC: $21 $20 $C3
    add  hl, bc                                   ; $72CF: $09
    dec  [hl]                                     ; $72D0: $35
    dec  [hl]                                     ; $72D1: $35
    ld   hl, wEntitiesPosZTable                   ; $72D2: $21 $10 $C3
    add  hl, bc                                   ; $72D5: $09
    ld   a, [hl]                                  ; $72D6: $7E
    and  $80                                      ; $72D7: $E6 $80
    ldh  [hFFE8], a                               ; $72D9: $E0 $E8
    jr   z, jr_007_72E3                           ; $72DB: $28 $06

    ld   [hl], b                                  ; $72DD: $70
    ld   hl, wEntitiesSpeedZTable                 ; $72DE: $21 $20 $C3
    add  hl, bc                                   ; $72E1: $09
    ld   [hl], b                                  ; $72E2: $70

jr_007_72E3:
    ldh  a, [hActiveEntityState]                  ; $72E3: $F0 $F0
    JP_TABLE                                      ; $72E5
._00 dw func_007_72F4                             ; $72E6
._01 dw func_007_7320                             ; $72E8
._02 dw func_007_7350                             ; $72EA
._03 dw func_007_735C                             ; $72EC
._04 dw func_007_737C                             ; $72EE
._05 dw func_007_73A0                             ; $72F0
._06 dw func_007_73D7                             ; $72F2

func_007_72F4::
    call GetEntityTransitionCountdown             ; $72F4: $CD $05 $0C
    jr   nz, jr_007_731F                          ; $72F7: $20 $26

    call func_007_7E5D                            ; $72F9: $CD $5D $7E
    add  $20                                      ; $72FC: $C6 $20
    cp   $40                                      ; $72FE: $FE $40
    jr   nc, jr_007_731F                          ; $7300: $30 $1D

jr_007_7302:
    call func_007_7E6D                            ; $7302: $CD $6D $7E
    add  $20                                      ; $7305: $C6 $20
    cp   $40                                      ; $7307: $FE $40
    jr   nc, jr_007_731F                          ; $7309: $30 $14

    call IncrementEntityState                     ; $730B: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $730E: $CD $05 $0C
    ld   [hl], $20                                ; $7311: $36 $20
    call GetRandomByte                            ; $7313: $CD $0D $28
    and  $03                                      ; $7316: $E6 $03
    add  $03                                      ; $7318: $C6 $03
    ld   hl, wEntitiesPrivateState1Table          ; $731A: $21 $B0 $C2
    add  hl, bc                                   ; $731D: $09
    ld   [hl], a                                  ; $731E: $77

jr_007_731F:
    ret                                           ; $731F: $C9

func_007_7320::
    call GetEntityTransitionCountdown             ; $7320: $CD $05 $0C
    jr   nz, jr_007_7344                          ; $7323: $20 $1F

    ld   hl, wEntitiesPosZTable                   ; $7325: $21 $10 $C3
    add  hl, bc                                   ; $7328: $09
    ld   [hl], $08                                ; $7329: $36 $08
    ld   hl, wEntitiesSpeedZTable                 ; $732B: $21 $20 $C3
    add  hl, bc                                   ; $732E: $09
    ld   [hl], $08                                ; $732F: $36 $08
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7331: $21 $40 $C3
    add  hl, bc                                   ; $7334: $09
    ld   [hl], $12                                ; $7335: $36 $12
    ld   a, $03                                   ; $7337: $3E $03
    call SetEntitySpriteVariant                   ; $7339: $CD $0C $3B
    call IncrementEntityState                     ; $733C: $CD $12 $3B

func_007_733F::
    ld   a, JINGLE_JUMP                           ; $733F: $3E $24
    ldh  [hJingle], a                             ; $7341: $E0 $F2
    ret                                           ; $7343: $C9

jr_007_7344:
    ld   e, $01                                   ; $7344: $1E $01
    cp   $10                                      ; $7346: $FE $10
    jr   nc, jr_007_734C                          ; $7348: $30 $02

    ld   e, $02                                   ; $734A: $1E $02

jr_007_734C:
    ld   a, e                                     ; $734C: $7B
    jp   SetEntitySpriteVariant                   ; $734D: $C3 $0C $3B

func_007_7350::
    ldh  a, [hFFE8]                               ; $7350: $F0 $E8
    and  a                                        ; $7352: $A7
    ret  z                                        ; $7353: $C8

    call GetEntityTransitionCountdown             ; $7354: $CD $05 $0C
    ld   [hl], $20                                ; $7357: $36 $20
    jp   IncrementEntityState                     ; $7359: $C3 $12 $3B

func_007_735C::
    call label_3B70                               ; $735C: $CD $70 $3B
    call GetEntityTransitionCountdown             ; $735F: $CD $05 $0C
    jr   nz, jr_007_736C                          ; $7362: $20 $08

    ld   [hl], $10                                ; $7364: $36 $10
    call ClearEntitySpeed                         ; $7366: $CD $7F $3D
    jp   IncrementEntityState                     ; $7369: $C3 $12 $3B

jr_007_736C:
    ld   e, $08                                   ; $736C: $1E $08
    and  $04                                      ; $736E: $E6 $04
    jr   z, jr_007_7374                           ; $7370: $28 $02

    ld   e, $F8                                   ; $7372: $1E $F8

jr_007_7374:
    ld   hl, wEntitiesSpeedXTable                 ; $7374: $21 $40 $C2
    add  hl, bc                                   ; $7377: $09
    ld   [hl], e                                  ; $7378: $73
    jp   func_007_7E17                            ; $7379: $C3 $17 $7E

func_007_737C::
    call label_3B39                               ; $737C: $CD $39 $3B
    call func_007_7E0A                            ; $737F: $CD $0A $7E
    call func_007_73F7                            ; $7382: $CD $F7 $73
    call GetEntityTransitionCountdown             ; $7385: $CD $05 $0C
    jr   nz, jr_007_739B                          ; $7388: $20 $11

    ld   a, $0C                                   ; $738A: $3E $0C
    call ApplyVectorTowardsLink_trampoline        ; $738C: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $738F: $21 $20 $C3
    add  hl, bc                                   ; $7392: $09
    ld   [hl], $18                                ; $7393: $36 $18
    call func_007_733F                            ; $7395: $CD $3F $73
    call IncrementEntityState                     ; $7398: $CD $12 $3B

jr_007_739B:
    ld   a, $03                                   ; $739B: $3E $03
    jp   SetEntitySpriteVariant                   ; $739D: $C3 $0C $3B

func_007_73A0::
    call label_3B39                               ; $73A0: $CD $39 $3B
    call func_007_7E0A                            ; $73A3: $CD $0A $7E
    call func_007_73F7                            ; $73A6: $CD $F7 $73
    ldh  a, [hFFE8]                               ; $73A9: $F0 $E8
    and  a                                        ; $73AB: $A7
    jr   z, jr_007_73D2                           ; $73AC: $28 $24

    call ClearEntitySpeed                         ; $73AE: $CD $7F $3D
    call IncrementEntityState                     ; $73B1: $CD $12 $3B
    ld   [hl], $04                                ; $73B4: $36 $04
    call GetEntityTransitionCountdown             ; $73B6: $CD $05 $0C
    ld   [hl], $20                                ; $73B9: $36 $20
    ld   hl, wEntitiesPrivateState1Table          ; $73BB: $21 $B0 $C2
    add  hl, bc                                   ; $73BE: $09
    dec  [hl]                                     ; $73BF: $35
    jr   nz, jr_007_73D2                          ; $73C0: $20 $10

    call IncrementEntityState                     ; $73C2: $CD $12 $3B
    ld   [hl], $06                                ; $73C5: $36 $06
    call GetEntityTransitionCountdown             ; $73C7: $CD $05 $0C
    ld   [hl], $30                                ; $73CA: $36 $30
    ld   hl, wEntitiesPhysicsFlagsTable           ; $73CC: $21 $40 $C3
    add  hl, bc                                   ; $73CF: $09
    ld   [hl], $D2                                ; $73D0: $36 $D2

jr_007_73D2:
    ld   a, $02                                   ; $73D2: $3E $02
    jp   SetEntitySpriteVariant                   ; $73D4: $C3 $0C $3B

func_007_73D7::
    call GetEntityTransitionCountdown             ; $73D7: $CD $05 $0C
    jr   nz, jr_007_73E6                          ; $73DA: $20 $0A

    ld   [hl], $50                                ; $73DC: $36 $50
    call IncrementEntityState                     ; $73DE: $CD $12 $3B
    ld   [hl], b                                  ; $73E1: $70
    xor  a                                        ; $73E2: $AF
    jp   SetEntitySpriteVariant                   ; $73E3: $C3 $0C $3B

jr_007_73E6:
    ld   e, $03                                   ; $73E6: $1E $03
    cp   $20                                      ; $73E8: $FE $20
    jr   nc, jr_007_73F3                          ; $73EA: $30 $07

    ld   e, $01                                   ; $73EC: $1E $01
    cp   $10                                      ; $73EE: $FE $10
    jr   c, jr_007_73F3                           ; $73F0: $38 $01

    inc  e                                        ; $73F2: $1C

jr_007_73F3:
    ld   a, e                                     ; $73F3: $7B
    jp   SetEntitySpriteVariant                   ; $73F4: $C3 $0C $3B

func_007_73F7::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $73F7: $21 $10 $C4
    add  hl, bc                                   ; $73FA: $09
    ld   [hl], $03                                ; $73FB: $36 $03
    call label_3B23                               ; $73FD: $CD $23 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7400: $21 $10 $C4
    add  hl, bc                                   ; $7403: $09
    ld   [hl], b                                  ; $7404: $70
    ret                                           ; $7405: $C9

FlyingTilesEntityHandler::
    call func_007_7D96                            ; $7406: $CD $96 $7D
    ldh  a, [hActiveEntityState]                  ; $7409: $F0 $F0
    JP_TABLE                                      ; $740B
._00 dw func_007_7410                             ; $740C
._01 dw func_007_74A8                             ; $740E

func_007_7410::
    ldh  a, [hActiveEntityPosX]                   ; $7410: $F0 $EE
    and  $70                                      ; $7412: $E6 $70
    ld   [$D201], a                               ; $7414: $EA $01 $D2
    call GetEntityTransitionCountdown             ; $7417: $CD $05 $0C
    ld   [hl], $80                                ; $741A: $36 $80
    jp   IncrementEntityState                     ; $741C: $C3 $12 $3B

Data_007_741F::
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $21, $28, $53, $56, $34, $45, $35, $44, $31, $48, $38, $41, $14, $66, $15, $63
    db   $31, $45, $38, $44, $13, $56, $16, $53, $27, $42, $47, $22, $65, $33, $64, $36
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54

Data_007_749F::
    db   $30, $30, $30, $30, $30, $30, $30, $28, $28

func_007_74A8::
    ld   hl, wEntitiesUnknowTableY                ; $74A8: $21 $D0 $C3
    add  hl, bc                                   ; $74AB: $09
    ld   a, [hl]                                  ; $74AC: $7E
    cp   $10                                      ; $74AD: $FE $10
    jp   z, func_007_7EA4                         ; $74AF: $CA $A4 $7E

    call GetEntityTransitionCountdown             ; $74B2: $CD $05 $0C
    jr   nz, jr_007_752C                          ; $74B5: $20 $75

    push hl                                       ; $74B7: $E5
    ldh  a, [hMapId]                              ; $74B8: $F0 $F7
    ld   e, a                                     ; $74BA: $5F
    ld   d, b                                     ; $74BB: $50
    ld   hl, Data_007_749F                        ; $74BC: $21 $9F $74
    add  hl, de                                   ; $74BF: $19
    ld   a, [hl]                                  ; $74C0: $7E
    pop  hl                                       ; $74C1: $E1
    ld   [hl], a                                  ; $74C2: $77
    ld   a, $5A                                   ; $74C3: $3E $5A
    call SpawnNewEntity_trampoline                ; $74C5: $CD $86 $3B
    jr   c, jr_007_752C                           ; $74C8: $38 $62

jr_007_74CA:
    ld   hl, wEntitiesPrivateState1Table          ; $74CA: $21 $B0 $C2
    add  hl, de                                   ; $74CD: $19
    ld   [hl], $02                                ; $74CE: $36 $02
    push bc                                       ; $74D0: $C5

jr_007_74D1:
    ld   a, [$D201]                               ; $74D1: $FA $01 $D2
    ld   hl, wEntitiesUnknowTableY                ; $74D4: $21 $D0 $C3
    add  hl, bc                                   ; $74D7: $09
    add  [hl]                                     ; $74D8: $86
    inc  [hl]                                     ; $74D9: $34
    ld   c, a                                     ; $74DA: $4F
    ld   hl, wEntitiesUnknowTableP                ; $74DB: $21 $40 $C4
    add  hl, de                                   ; $74DE: $19
    ldh  a, [hActiveEntityPosY]                   ; $74DF: $F0 $EF
    sub  $10                                      ; $74E1: $D6 $10
    and  $F0                                      ; $74E3: $E6 $F0
    jr   z, jr_007_74E8                           ; $74E5: $28 $01

    ld   [hl], a                                  ; $74E7: $77

jr_007_74E8:
    ld   a, c                                     ; $74E8: $79
    cp   $0F                                      ; $74E9: $FE $0F
    jr   nz, jr_007_74F8                          ; $74EB: $20 $0B

    ld   a, [wRoomEvent]                          ; $74ED: $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ; $74F0: $E6 $1F
    cp   TRIGGER_STEP_ON_BUTTON                   ; $74F2: $FE $03
    jr   nz, jr_007_74F8                          ; $74F4: $20 $02

    ld   [hl], $01                                ; $74F6: $36 $01

jr_007_74F8:
    ld   hl, Data_007_741F                        ; $74F8: $21 $1F $74
    add  hl, bc                                   ; $74FB: $09
    ld   a, [hl]                                  ; $74FC: $7E
    push af                                       ; $74FD: $F5
    swap a                                        ; $74FE: $CB $37
    and  $F0                                      ; $7500: $E6 $F0
    or   $08                                      ; $7502: $F6 $08
    ld   hl, wEntitiesPosXTable                   ; $7504: $21 $00 $C2
    add  hl, de                                   ; $7507: $19
    ld   [hl], a                                  ; $7508: $77
    pop  af                                       ; $7509: $F1
    and  $F0                                      ; $750A: $E6 $F0
    add  $10                                      ; $750C: $C6 $10
    ld   hl, wEntitiesPosYTable                   ; $750E: $21 $10 $C2
    add  hl, de                                   ; $7511: $19
    ld   [hl], a                                  ; $7512: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7513: $21 $40 $C3
    add  hl, de                                   ; $7516: $19
    ld   [hl], $12                                ; $7517: $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ; $7519: $21 $50 $C3
    add  hl, de                                   ; $751C: $19
    ld   [hl], $00                                ; $751D: $36 $00
    ld   hl, wEntitiesUnknowTableH                ; $751F: $21 $30 $C4
    add  hl, de                                   ; $7522: $19
    ld   [hl], $00                                ; $7523: $36 $00
    ld   hl, wEntitiesHealthGroup                 ; $7525: $21 $D0 $C4
    add  hl, de                                   ; $7528: $19
    ld   [hl], $00                                ; $7529: $36 $00
    pop  bc                                       ; $752B: $C1

jr_007_752C:
    ret                                           ; $752C: $C9

Data_007_752D::
    db   $70, $00, $70, $20, $72, $00, $72, $20

WaterTektiteEntityHandler::
    ld   de, Data_007_752D                        ; $7535: $11 $2D $75
    call RenderActiveEntitySpritesPair            ; $7538: $CD $C0 $3B
    call func_007_7D96                            ; $753B: $CD $96 $7D
    call func_007_7DC3                            ; $753E: $CD $C3 $7D
    ldh  a, [hFrameCounter]                       ; $7541: $F0 $E7
    rra                                           ; $7543: $1F
    rra                                           ; $7544: $1F
    rra                                           ; $7545: $1F
    rra                                           ; $7546: $1F

jr_007_7547:
    and  $01                                      ; $7547: $E6 $01
    call SetEntitySpriteVariant                   ; $7549: $CD $0C $3B
    call func_007_7E0A                            ; $754C: $CD $0A $7E
    call label_3B23                               ; $754F: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7552: $21 $A0 $C2
    add  hl, bc                                   ; $7555: $09
    ld   a, [hl]                                  ; $7556: $7E
    and  $0F                                      ; $7557: $E6 $0F
    jr   z, jr_007_756A                           ; $7559: $28 $0F

    call GetEntityTransitionCountdown             ; $755B: $CD $05 $0C
    ld   [hl], $10                                ; $755E: $36 $10
    call ClearEntitySpeed                         ; $7560: $CD $7F $3D
    call IncrementEntityState                     ; $7563: $CD $12 $3B
    xor  a                                        ; $7566: $AF
    ld   [hl], a                                  ; $7567: $77
    ldh  [hActiveEntityState], a                  ; $7568: $E0 $F0

jr_007_756A:
    call label_3B39                               ; $756A: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $756D: $F0 $F0
    JP_TABLE                                      ; $756F
._00 dw func_007_7576                             ; $7570
._01 dw func_007_7597                             ; $7572
._02 dw func_007_75B7                             ; $7574

func_007_7576::
    call GetEntityTransitionCountdown             ; $7576: $CD $05 $0C
    jr   nz, jr_007_7596                          ; $7579: $20 $1B

    ld   [hl], $20                                ; $757B: $36 $20
    call IncrementEntityState                     ; $757D: $CD $12 $3B
    call GetRandomByte                            ; $7580: $CD $0D $28
    and  $02                                      ; $7583: $E6 $02
    dec  a                                        ; $7585: $3D
    ld   hl, wEntitiesPrivateState1Table          ; $7586: $21 $B0 $C2
    add  hl, bc                                   ; $7589: $09
    ld   [hl], a                                  ; $758A: $77
    call GetRandomByte                            ; $758B: $CD $0D $28
    and  $02                                      ; $758E: $E6 $02
    dec  a                                        ; $7590: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $7591: $21 $C0 $C2
    add  hl, bc                                   ; $7594: $09
    ld   [hl], a                                  ; $7595: $77

jr_007_7596:
    ret                                           ; $7596: $C9

func_007_7597::
    call GetEntityTransitionCountdown             ; $7597: $CD $05 $0C
    jp   z, IncrementEntityState                  ; $759A: $CA $12 $3B

    and  $01                                      ; $759D: $E6 $01
    jr   nz, jr_007_75B6                          ; $759F: $20 $15

    ld   hl, wEntitiesPrivateState1Table          ; $75A1: $21 $B0 $C2

jr_007_75A4:
    add  hl, bc                                   ; $75A4: $09
    ld   a, [hl]                                  ; $75A5: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $75A6: $21 $40 $C2
    add  hl, bc                                   ; $75A9: $09
    add  [hl]                                     ; $75AA: $86
    ld   [hl], a                                  ; $75AB: $77
    ld   hl, wEntitiesPrivateState2Table          ; $75AC: $21 $C0 $C2
    add  hl, bc                                   ; $75AF: $09
    ld   a, [hl]                                  ; $75B0: $7E
    call GetEntitySpeedYAddress                   ; $75B1: $CD $05 $40
    add  [hl]                                     ; $75B4: $86
    ld   [hl], a                                  ; $75B5: $77

jr_007_75B6:
    ret                                           ; $75B6: $C9

func_007_75B7::
    ldh  a, [hFrameCounter]                       ; $75B7: $F0 $E7
    and  $01                                      ; $75B9: $E6 $01
    jr   nz, jr_007_75DD                          ; $75BB: $20 $20

    ld   hl, wEntitiesSpeedXTable                 ; $75BD: $21 $40 $C2
    add  hl, bc                                   ; $75C0: $09
    ld   a, [hl]                                  ; $75C1: $7E
    and  a                                        ; $75C2: $A7
    jr   nz, jr_007_75CF                          ; $75C3: $20 $0A

    call IncrementEntityState                     ; $75C5: $CD $12 $3B
    ld   [hl], b                                  ; $75C8: $70
    call GetEntityTransitionCountdown             ; $75C9: $CD $05 $0C
    ld   [hl], $10                                ; $75CC: $36 $10
    ret                                           ; $75CE: $C9

jr_007_75CF:
    call func_007_75D6                            ; $75CF: $CD $D6 $75
    call GetEntitySpeedYAddress                   ; $75D2: $CD $05 $40
    ld   a, [hl]                                  ; $75D5: $7E

func_007_75D6::
    bit  7, a                                     ; $75D6: $CB $7F
    jr   z, jr_007_75DC                           ; $75D8: $28 $02

    inc  [hl]                                     ; $75DA: $34
    inc  [hl]                                     ; $75DB: $34

jr_007_75DC:
    dec  [hl]                                     ; $75DC: $35

jr_007_75DD:
    ret                                           ; $75DD: $C9

Data_007_75DE::
    db   $60, $03, $62, $03, $64, $03, $66, $03, $62, $63, $60, $63, $66, $63, $64, $63
    db   $66, $23, $64, $23

HorsePieceEntityHandler::
    ld   hl, wEntitiesLoadOrderTable              ; $75F2: $21 $60 $C4
    add  hl, bc                                   ; $75F5: $09
    ld   a, [hl]                                  ; $75F6: $7E
    and  a                                        ; $75F7: $A7
    jr   z, jr_007_75FE                           ; $75F8: $28 $04

    ld   a, c                                     ; $75FA: $79
    ld   [$D201], a                               ; $75FB: $EA $01 $D2

jr_007_75FE:
    ld   de, Data_007_75DE                        ; $75FE: $11 $DE $75
    call RenderActiveEntitySpritesPair            ; $7601: $CD $C0 $3B
    call func_007_7D96                            ; $7604: $CD $96 $7D
    call func_007_7E0A                            ; $7607: $CD $0A $7E
    call func_007_7E43                            ; $760A: $CD $43 $7E
    call label_3B23                               ; $760D: $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                 ; $7610: $21 $20 $C3
    add  hl, bc                                   ; $7613: $09
    dec  [hl]                                     ; $7614: $35
    dec  [hl]                                     ; $7615: $35
    ld   hl, wEntitiesPosZTable                   ; $7616: $21 $10 $C3
    add  hl, bc                                   ; $7619: $09
    ld   a, [hl]                                  ; $761A: $7E
    ldh  [hFFE8], a                               ; $761B: $E0 $E8
    dec  a                                        ; $761D: $3D
    and  $80                                      ; $761E: $E6 $80
    jr   z, jr_007_7633                           ; $7620: $28 $11

    ld   [hl], b                                  ; $7622: $70
    ld   hl, wEntitiesSpeedZTable                 ; $7623: $21 $20 $C3
    add  hl, bc                                   ; $7626: $09
    ld   a, [hl]                                  ; $7627: $7E
    ldh  [hDungeonFloorTile], a                   ; $7628: $E0 $E9
    sra  a                                        ; $762A: $CB $2F
    cpl                                           ; $762C: $2F
    cp   $07                                      ; $762D: $FE $07
    jr   nc, jr_007_7632                          ; $762F: $30 $01

    xor  a                                        ; $7631: $AF

jr_007_7632:
    ld   [hl], a                                  ; $7632: $77

jr_007_7633:
    ldh  a, [hActiveEntityState]                  ; $7633: $F0 $F0
    JP_TABLE                                      ; $7635
._00 dw func_007_7640                             ; $7636
._01 dw func_007_7640                             ; $7638
._02 dw func_007_7657                             ; $763A
._03 dw func_007_76EE                             ; $763C
._04 dw func_007_7724                             ; $763E

func_007_7640::
    jp   label_007_7733                           ; $7640: $C3 $33 $77

Data_007_7643::
    db   $00, $0C, $10, $0C, $00, $F4, $F0, $F4

Data_007_764B::
    db   $F0, $F4, $00, $0C, $10, $0C, $00, $F4

Data_007_7653::
    db   $00, $01, $04, $00

func_007_7657::
    call GetEntityTransitionCountdown             ; $7657: $CD $05 $0C
    jr   nz, jr_007_7671                          ; $765A: $20 $15

    call ClearEntitySpeed                         ; $765C: $CD $7F $3D
    call IncrementEntityState                     ; $765F: $CD $12 $3B
    call GetRandomByte                            ; $7662: $CD $0D $28
    and  $03                                      ; $7665: $E6 $03
    ld   e, a                                     ; $7667: $5F
    ld   d, b                                     ; $7668: $50
    ld   hl, Data_007_7653                        ; $7669: $21 $53 $76
    add  hl, de                                   ; $766C: $19
    ld   a, [hl]                                  ; $766D: $7E
    jp   SetEntitySpriteVariant                   ; $766E: $C3 $0C $3B

jr_007_7671:
    and  $07                                      ; $7671: $E6 $07
    jr   nz, jr_007_767E                          ; $7673: $20 $09

    ld   hl, wEntitiesSpriteVariantTable          ; $7675: $21 $B0 $C3
    add  hl, bc                                   ; $7678: $09
    ld   a, [hl]                                  ; $7679: $7E
    inc  a                                        ; $767A: $3C
    and  $03                                      ; $767B: $E6 $03
    ld   [hl], a                                  ; $767D: $77

jr_007_767E:
    ldh  a, [hFFE8]                               ; $767E: $F0 $E8
    dec  a                                        ; $7680: $3D
    and  $80                                      ; $7681: $E6 $80
    jr   z, jr_007_76C2                           ; $7683: $28 $3D

    call func_007_76E7                            ; $7685: $CD $E7 $76
    ldh  a, [hDungeonFloorTile]                   ; $7688: $F0 $E9
    sub  $FC                                      ; $768A: $D6 $FC
    and  $80                                      ; $768C: $E6 $80
    jr   nz, jr_007_7696                          ; $768E: $20 $06

    ldh  a, [hFrameCounter]                       ; $7690: $F0 $E7
    and  $07                                      ; $7692: $E6 $07
    jr   nz, jr_007_76C2                          ; $7694: $20 $2C

jr_007_7696:
    call GetRandomByte                            ; $7696: $CD $0D $28
    and  $01                                      ; $7699: $E6 $01
    ld   e, $01                                   ; $769B: $1E $01
    jr   z, jr_007_76A1                           ; $769D: $28 $02

    ld   e, $FF                                   ; $769F: $1E $FF

jr_007_76A1:
    ld   hl, wEntitiesDirectionTable              ; $76A1: $21 $80 $C3
    add  hl, bc                                   ; $76A4: $09
    ld   a, [hl]                                  ; $76A5: $7E
    add  e                                        ; $76A6: $83
    and  $07                                      ; $76A7: $E6 $07
    ld   [hl], a                                  ; $76A9: $77
    ld   e, a                                     ; $76AA: $5F
    ld   d, b                                     ; $76AB: $50
    ld   hl, Data_007_7643                        ; $76AC: $21 $43 $76
    add  hl, de                                   ; $76AF: $19
    ld   a, [hl]                                  ; $76B0: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $76B1: $21 $40 $C2
    add  hl, bc                                   ; $76B4: $09
    ld   [hl], a                                  ; $76B5: $77
    ld   hl, Data_007_764B                        ; $76B6: $21 $4B $76
    add  hl, de                                   ; $76B9: $19
    ld   a, [hl]                                  ; $76BA: $7E
    call GetEntitySpeedYAddress                   ; $76BB: $CD $05 $40
    ld   [hl], a                                  ; $76BE: $77
    call func_007_76E7                            ; $76BF: $CD $E7 $76

jr_007_76C2:
    ld   hl, wEntitiesCollisionsTable             ; $76C2: $21 $A0 $C2
    add  hl, bc                                   ; $76C5: $09
    ld   a, [hl]                                  ; $76C6: $7E
    and  a                                        ; $76C7: $A7
    jr   z, jr_007_76ED                           ; $76C8: $28 $23

    ld   hl, wEntitiesDirectionTable              ; $76CA: $21 $80 $C3
    add  hl, bc                                   ; $76CD: $09
    ld   a, [hl]                                  ; $76CE: $7E
    xor  $04                                      ; $76CF: $EE $04
    ld   [hl], a                                  ; $76D1: $77
    call GetEntityTransitionCountdown             ; $76D2: $CD $05 $0C
    srl  [hl]                                     ; $76D5: $CB $3E
    ld   hl, wEntitiesSpeedXTable                 ; $76D7: $21 $40 $C2
    call func_007_76E0                            ; $76DA: $CD $E0 $76
    ld   hl, wEntitiesSpeedYTable                 ; $76DD: $21 $50 $C2

func_007_76E0::
    add  hl, bc                                   ; $76E0: $09
    ld   a, [hl]                                  ; $76E1: $7E
    cpl                                           ; $76E2: $2F
    sra  a                                        ; $76E3: $CB $2F
    inc  a                                        ; $76E5: $3C
    ld   [hl], a                                  ; $76E6: $77

func_007_76E7::
    ld   hl, $C5D0                                ; $76E7: $21 $D0 $C5
    add  hl, bc                                   ; $76EA: $09
    ld   [hl], $FF                                ; $76EB: $36 $FF

jr_007_76ED:
    ret                                           ; $76ED: $C9

func_007_76EE::
    ld   hl, wEntitiesLoadOrderTable              ; $76EE: $21 $60 $C4
    add  hl, bc                                   ; $76F1: $09
    ld   a, [hl]                                  ; $76F2: $7E
    and  a                                        ; $76F3: $A7
    ret  nz                                       ; $76F4: $C0

    ld   a, [$D201]                               ; $76F5: $FA $01 $D2
    ld   e, a                                     ; $76F8: $5F
    ld   d, b                                     ; $76F9: $50
    ld   hl, wEntitiesStateTable                  ; $76FA: $21 $90 $C2
    add  hl, de                                   ; $76FD: $19
    ld   a, [hl]                                  ; $76FE: $7E
    cp   $03                                      ; $76FF: $FE $03
    ret  nz                                       ; $7701: $C0

    inc  [hl]                                     ; $7702: $34
    call IncrementEntityState                     ; $7703: $CD $12 $3B
    ldh  a, [hActiveEntitySpriteVariant]          ; $7706: $F0 $F1
    cp   $00                                      ; $7708: $FE $00
    jr   nz, jr_007_7716                          ; $770A: $20 $0A

    ld   hl, wEntitiesSpriteVariantTable          ; $770C: $21 $B0 $C3
    add  hl, de                                   ; $770F: $19
    ld   a, [hl]                                  ; $7710: $7E
    cp   $00                                      ; $7711: $FE $00
    jp   z, MarkTriggerAsResolved                 ; $7713: $CA $60 $0C

jr_007_7716:
    ld   hl, wEntitiesTransitionCountdownTable    ; $7716: $21 $E0 $C2
    add  hl, de                                   ; $7719: $19
    ld   [hl], $40                                ; $771A: $36 $40
    call GetEntityTransitionCountdown             ; $771C: $CD $05 $0C
    ld   [hl], $40                                ; $771F: $36 $40
    jp   PlayWrongAnswerJingle                    ; $7721: $C3 $20 $0C

func_007_7724::
    call GetEntityTransitionCountdown             ; $7724: $CD $05 $0C
    cp   $01                                      ; $7727: $FE $01
    jr   nz, jr_007_7730                          ; $7729: $20 $05

    ld   a, $01                                   ; $772B: $3E $01
    call SetEntitySpriteVariant                   ; $772D: $CD $0C $3B

jr_007_7730:
    jp   label_007_7733                           ; $7730: $C3 $33 $77

label_007_7733:
    call CheckLinkCollisionWithEnemy_trampoline   ; $7733: $CD $5A $3B
    jr   nc, jr_007_7783                          ; $7736: $30 $4B

    ld   a, [$C19B]                               ; $7738: $FA $9B $C1
    and  a                                        ; $773B: $A7
    jr   nz, jr_007_7783                          ; $773C: $20 $45

    ld   a, [wBButtonSlot]                        ; $773E: $FA $00 $DB
    cp   $03                                      ; $7741: $FE $03
    jr   nz, jr_007_774D                          ; $7743: $20 $08

    ldh  a, [hJoypadState]                        ; $7745: $F0 $CC
    and  $20                                      ; $7747: $E6 $20
    jr   nz, jr_007_775A                          ; $7749: $20 $0F

    jr   jr_007_7783                              ; $774B: $18 $36

jr_007_774D:
    ld   a, [wAButtonSlot]                        ; $774D: $FA $01 $DB
    cp   $03                                      ; $7750: $FE $03
    jr   nz, jr_007_7783                          ; $7752: $20 $2F

    ldh  a, [hJoypadState]                        ; $7754: $F0 $CC
    and  $10                                      ; $7756: $E6 $10
    jr   z, jr_007_7783                           ; $7758: $28 $29

jr_007_775A:
    ld   a, [$C3CF]                               ; $775A: $FA $CF $C3
    and  a                                        ; $775D: $A7
    jr   nz, jr_007_7783                          ; $775E: $20 $23

    inc  a                                        ; $7760: $3C
    ld   [$C3CF], a                               ; $7761: $EA $CF $C3
    call IncrementEntityState                     ; $7764: $CD $12 $3B
    ld   [hl], $02                                ; $7767: $36 $02
    ld   hl, wEntitiesStatusTable                 ; $7769: $21 $80 $C2
    add  hl, bc                                   ; $776C: $09
    ld   [hl], $07                                ; $776D: $36 $07
    ld   hl, wEntitiesUnknowTableW                ; $776F: $21 $90 $C4
    add  hl, bc                                   ; $7772: $09
    ld   [hl], b                                  ; $7773: $70
    ldh  a, [hLinkDirection]                      ; $7774: $F0 $9E
    ld   [wC15D], a                               ; $7776: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $7779: $CD $05 $0C
    ld   [hl], $02                                ; $777C: $36 $02
    ld   hl, hWaveSfx                             ; $777E: $21 $F3 $FF
    ld   [hl], $02                                ; $7781: $36 $02

jr_007_7783:
    ret                                           ; $7783: $C9

Data_007_7784::
    db   $70, $00, $70, $20, $72, $00, $72, $20   ; $7784
    db   $74, $00, $74, $20, $76, $00, $76, $20   ; $778C

Data_007_7794::
    db   $60, $00, $60, $20, $62, $00, $62, $20
    db   $64, $00, $64, $20, $66, $00, $66, $20

SpikedBeetleEntityHandler::
    ld   de, Data_007_7784                        ; $77A4: $11 $84 $77
    ldh  a, [hMapId]                              ; $77A7: $F0 $F7
    cp   $03                                      ; $77A9: $FE $03
    jr   nz, jr_007_77B0                          ; $77AB: $20 $03

    ld   de, Data_007_7794                        ; $77AD: $11 $94 $77

jr_007_77B0:
    call RenderActiveEntitySpritesPair            ; $77B0: $CD $C0 $3B
    call func_007_7D96                            ; $77B3: $CD $96 $7D

jr_007_77B6:
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $77B6: $21 $10 $C4
    add  hl, bc                                   ; $77B9: $09
    ld   a, [hl]                                  ; $77BA: $7E
    and  a                                        ; $77BB: $A7
    jr   z, jr_007_77C1                           ; $77BC: $28 $03

    call ClearEntitySpeed                         ; $77BE: $CD $7F $3D

jr_007_77C1:
    call func_007_7DC3                            ; $77C1: $CD $C3 $7D
    call label_3B39                               ; $77C4: $CD $39 $3B
    call func_007_7E0A                            ; $77C7: $CD $0A $7E
    call func_007_7E43                            ; $77CA: $CD $43 $7E
    call label_3B23                               ; $77CD: $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                 ; $77D0: $21 $20 $C3
    add  hl, bc                                   ; $77D3: $09
    dec  [hl]                                     ; $77D4: $35
    dec  [hl]                                     ; $77D5: $35
    ld   hl, wEntitiesPosZTable                   ; $77D6: $21 $10 $C3
    add  hl, bc                                   ; $77D9: $09
    ld   a, [hl]                                  ; $77DA: $7E
    bit  7, a                                     ; $77DB: $CB $7F
    jr   nz, jr_007_77E2                          ; $77DD: $20 $03

    and  a                                        ; $77DF: $A7
    jr   nz, jr_007_780D                          ; $77E0: $20 $2B

jr_007_77E2:
    ld   [hl], b                                  ; $77E2: $70
    ldh  a, [hActiveEntityState]                  ; $77E3: $F0 $F0
    cp   $03                                      ; $77E5: $FE $03
    jr   nz, jr_007_7808                          ; $77E7: $20 $1F

    ld   hl, wEntitiesSpeedXTable                 ; $77E9: $21 $40 $C2
    add  hl, bc                                   ; $77EC: $09
    sra  [hl]                                     ; $77ED: $CB $2E
    call GetEntitySpeedYAddress                   ; $77EF: $CD $05 $40
    sra  [hl]                                     ; $77F2: $CB $2E
    ld   hl, wEntitiesSpeedZTable                 ; $77F4: $21 $20 $C3
    add  hl, bc                                   ; $77F7: $09
    ld   a, [hl]                                  ; $77F8: $7E
    sra  a                                        ; $77F9: $CB $2F

jr_007_77FB:
    cpl                                           ; $77FB: $2F
    ld   [hl], a                                  ; $77FC: $77
    cp   $07                                      ; $77FD: $FE $07
    jp   nc, jr_007_780D                          ; $77FF: $D2 $0D $78

    ld   [hl], b                                  ; $7802: $70
    call ClearEntitySpeed                         ; $7803: $CD $7F $3D
    jr   jr_007_780D                              ; $7806: $18 $05

jr_007_7808:
    ld   hl, wEntitiesSpeedZTable                 ; $7808: $21 $20 $C3
    add  hl, bc                                   ; $780B: $09
    ld   [hl], b                                  ; $780C: $70

jr_007_780D:
    ldh  a, [hActiveEntityState]                  ; $780D: $F0 $F0
    cp   $04                                      ; $780F: $FE $04
    jr   c, jr_007_7814                           ; $7811: $38 $01

    ret                                           ; $7813: $C9

jr_007_7814:
    JP_TABLE                                      ; $7814
._00 dw func_007_7825                             ; $7815
._01 dw func_007_7860                             ; $7817
._02 dw func_007_78A5                             ; $7819
._03 dw func_007_78EC                             ; $781B

Data_007_781D::
    db   $06, $FA, $00, $00

Data_007_7821::
    db   $00, $00, $FA, $06

func_007_7825::
    call ClearEntitySpeed                         ; $7825: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $7828: $CD $05 $0C
    jr   nz, jr_007_785E                          ; $782B: $20 $31

    call GetRandomByte                            ; $782D: $CD $0D $28
    and  $1F                                      ; $7830: $E6 $1F
    add  $30                                      ; $7832: $C6 $30
    ld   [hl], a                                  ; $7834: $77
    call IncrementEntityState                     ; $7835: $CD $12 $3B
    call GetRandomByte                            ; $7838: $CD $0D $28
    and  $06                                      ; $783B: $E6 $06
    jr   nz, jr_007_7844                          ; $783D: $20 $05

    call func_007_7E7D                            ; $783F: $CD $7D $7E
    jr   jr_007_784A                              ; $7842: $18 $06

jr_007_7844:
    call GetRandomByte                            ; $7844: $CD $0D $28
    and  $03                                      ; $7847: $E6 $03
    ld   e, a                                     ; $7849: $5F

jr_007_784A:
    ld   d, b                                     ; $784A: $50
    ld   hl, Data_007_781D                        ; $784B: $21 $1D $78
    add  hl, de                                   ; $784E: $19
    ld   a, [hl]                                  ; $784F: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7850: $21 $40 $C2
    add  hl, bc                                   ; $7853: $09
    ld   [hl], a                                  ; $7854: $77
    ld   hl, Data_007_7821                        ; $7855: $21 $21 $78
    add  hl, de                                   ; $7858: $19
    ld   a, [hl]                                  ; $7859: $7E
    call GetEntitySpeedYAddress                   ; $785A: $CD $05 $40
    ld   [hl], a                                  ; $785D: $77

jr_007_785E:
    jr   jr_007_786E                              ; $785E: $18 $0E

func_007_7860::
    call GetEntityTransitionCountdown             ; $7860: $CD $05 $0C
    jr   nz, jr_007_786B                          ; $7863: $20 $06

    ld   [hl], $18                                ; $7865: $36 $18
    call IncrementEntityState                     ; $7867: $CD $12 $3B
    ld   [hl], b                                  ; $786A: $70

jr_007_786B:
    call func_007_78E1                            ; $786B: $CD $E1 $78

jr_007_786E:
    ld   hl, wEntitiesHitboxFlagsTable            ; $786E: $21 $50 $C3
    add  hl, bc                                   ; $7871: $09
    ld   [hl], $80                                ; $7872: $36 $80
    ld   hl, wEntitiesUnknowTableH                ; $7874: $21 $30 $C4
    add  hl, bc                                   ; $7877: $09
    ld   [hl], $48                                ; $7878: $36 $48
    call func_007_7E5D                            ; $787A: $CD $5D $7E
    add  $06                                      ; $787D: $C6 $06
    cp   $0A                                      ; $787F: $FE $0A
    jr   c, jr_007_788C                           ; $7881: $38 $09

    call func_007_7E6D                            ; $7883: $CD $6D $7E
    add  $06                                      ; $7886: $C6 $06
    cp   $0A                                      ; $7888: $FE $0A
    jr   nc, jr_007_789C                          ; $788A: $30 $10

jr_007_788C:
    call func_007_7E7D                            ; $788C: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $788F: $21 $80 $C3
    add  hl, bc                                   ; $7892: $09
    ld   [hl], e                                  ; $7893: $73
    call IncrementEntityState                     ; $7894: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7897: $CD $05 $0C
    ld   [hl], $FF                                ; $789A: $36 $FF

jr_007_789C:
    ret                                           ; $789C: $C9

Data_007_789D::
    db   $18, $E8, $00, $00

Data_007_78A1::
    db   $00, $00, $E8, $18

func_007_78A5::
    call GetEntityTransitionCountdown             ; $78A5: $CD $05 $0C
    jr   z, jr_007_78DD                           ; $78A8: $28 $33

    ld   hl, wEntitiesDirectionTable              ; $78AA: $21 $80 $C3
    add  hl, bc                                   ; $78AD: $09
    ld   e, [hl]                                  ; $78AE: $5E
    ld   d, b                                     ; $78AF: $50
    ld   hl, Data_007_789D                        ; $78B0: $21 $9D $78
    add  hl, de                                   ; $78B3: $19
    ld   a, [hl]                                  ; $78B4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $78B5: $21 $40 $C2
    add  hl, bc                                   ; $78B8: $09
    sub  [hl]                                     ; $78B9: $96
    jr   z, jr_007_78C3                           ; $78BA: $28 $07

    and  $80                                      ; $78BC: $E6 $80
    jr   nz, jr_007_78C2                          ; $78BE: $20 $02

    inc  [hl]                                     ; $78C0: $34
    inc  [hl]                                     ; $78C1: $34

jr_007_78C2:
    dec  [hl]                                     ; $78C2: $35

jr_007_78C3:
    ld   hl, Data_007_78A1                        ; $78C3: $21 $A1 $78
    add  hl, de                                   ; $78C6: $19
    ld   a, [hl]                                  ; $78C7: $7E
    call GetEntitySpeedYAddress                   ; $78C8: $CD $05 $40
    sub  [hl]                                     ; $78CB: $96
    jr   z, jr_007_78D5                           ; $78CC: $28 $07

    and  $80                                      ; $78CE: $E6 $80
    jr   nz, jr_007_78D4                          ; $78D0: $20 $02

    inc  [hl]                                     ; $78D2: $34
    inc  [hl]                                     ; $78D3: $34

jr_007_78D4:
    dec  [hl]                                     ; $78D4: $35

jr_007_78D5:
    ld   hl, wEntitiesCollisionsTable             ; $78D5: $21 $A0 $C2
    add  hl, bc                                   ; $78D8: $09
    ld   a, [hl]                                  ; $78D9: $7E
    and  a                                        ; $78DA: $A7
    jr   z, func_007_78E1                         ; $78DB: $28 $04

jr_007_78DD:
    call IncrementEntityState                     ; $78DD: $CD $12 $3B
    ld   [hl], b                                  ; $78E0: $70

func_007_78E1::
    ldh  a, [hFrameCounter]                       ; $78E1: $F0 $E7
    rra                                           ; $78E3: $1F
    rra                                           ; $78E4: $1F
    rra                                           ; $78E5: $1F
    rra                                           ; $78E6: $1F
    and  $01                                      ; $78E7: $E6 $01
    jp   SetEntitySpriteVariant                   ; $78E9: $C3 $0C $3B

func_007_78EC::
    ld   hl, wEntitiesUnknowTableH                ; $78EC: $21 $30 $C4
    add  hl, bc                                   ; $78EF: $09
    ld   [hl], $08                                ; $78F0: $36 $08
    ld   hl, wEntitiesHitboxFlagsTable            ; $78F2: $21 $50 $C3
    add  hl, bc                                   ; $78F5: $09
    ld   [hl], $00                                ; $78F6: $36 $00
    ldh  a, [hFrameCounter]                       ; $78F8: $F0 $E7
    rra                                           ; $78FA: $1F
    rra                                           ; $78FB: $1F
    rra                                           ; $78FC: $1F
    rra                                           ; $78FD: $1F
    and  $01                                      ; $78FE: $E6 $01
    inc  a                                        ; $7900: $3C
    inc  a                                        ; $7901: $3C
    call SetEntitySpriteVariant                   ; $7902: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $7905: $CD $05 $0C
    jr   nz, jr_007_791A                          ; $7908: $20 $10

    call IncrementEntityState                     ; $790A: $CD $12 $3B
    ld   [hl], b                                  ; $790D: $70
    ld   hl, wEntitiesSpeedZTable                 ; $790E: $21 $20 $C3
    add  hl, bc                                   ; $7911: $09
    ld   [hl], $18                                ; $7912: $36 $18
    ld   hl, wEntitiesSpeedXTable                 ; $7914: $21 $40 $C2
    add  hl, bc                                   ; $7917: $09
    ld   [hl], b                                  ; $7918: $70
    ret                                           ; $7919: $C9

jr_007_791A:
    cp   $60                                      ; $791A: $FE $60
    jr   nc, jr_007_792B                          ; $791C: $30 $0D

    and  $04                                      ; $791E: $E6 $04
    ld   a, $08                                   ; $7920: $3E $08
    jr   nz, jr_007_7926                          ; $7922: $20 $02

    ld   a, $F8                                   ; $7924: $3E $F8

jr_007_7926:
    ld   hl, wEntitiesSpeedXTable                 ; $7926: $21 $40 $C2
    add  hl, bc                                   ; $7929: $09
    ld   [hl], a                                  ; $792A: $77

jr_007_792B:
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $792B: $21 $10 $C4
    add  hl, bc                                   ; $792E: $09
    ld   a, [hl]                                  ; $792F: $7E
    push af                                       ; $7930: $F5
    ld   [hl], $01                                ; $7931: $36 $01
    call label_3B23                               ; $7933: $CD $23 $3B
    pop  af                                       ; $7936: $F1
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7937: $21 $10 $C4
    add  hl, bc                                   ; $793A: $09
    ld   [hl], a                                  ; $793B: $77
    ret                                           ; $793C: $C9

Data_007_793D::
    db   $06, $04, $02, $00                       ; $793D

MoblinSwordEntityHandler::
    ldh  a, [hMapId]                              ; $7941: $F0 $F7
    cp   $15                                      ; $7943: $FE $15
    jr   nz, jr_007_794F                          ; $7945: $20 $08

    ld   a, [wIsBowWowFollowingLink]              ; $7947: $FA $56 $DB
    cp   $80                                      ; $794A: $FE $80
    jp   nz, func_007_7EA4                        ; $794C: $C2 $A4 $7E

jr_007_794F:
    call func_007_7AB5                            ; $794F: $CD $B5 $7A
    call func_007_7D96                            ; $7952: $CD $96 $7D
    ldh  a, [hMapId]                              ; $7955: $F0 $F7
    cp   $15                                      ; $7957: $FE $15
    jr   z, jr_007_7963                           ; $7959: $28 $08

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $795B: $21 $10 $C4
    add  hl, bc                                   ; $795E: $09
    ld   a, [hl]                                  ; $795F: $7E
    and  a                                        ; $7960: $A7
    jr   z, jr_007_7966                           ; $7961: $28 $03

jr_007_7963:
    call func_007_7A55                            ; $7963: $CD $55 $7A

jr_007_7966:
    call func_007_7DC3                            ; $7966: $CD $C3 $7D
    call label_3B65                               ; $7969: $CD $65 $3B
    call label_3B39                               ; $796C: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $796F: $F0 $F0
    JP_TABLE                                      ; $7971
._00 dw func_007_7980                             ; $7972
._01 dw func_007_79B4                             ; $7974
._02 dw func_007_79D7                             ; $7976

Data_007_7978::
    db   $06, $FA, $00, $00

Data_007_797C::
    db   $00, $00, $FA, $06

func_007_7980::
    call label_3B23                               ; $7980: $CD $23 $3B
    ld   hl, wEntitiesUnknowTableY                ; $7983: $21 $D0 $C3
    add  hl, bc                                   ; $7986: $09
    ld   [hl], $00                                ; $7987: $36 $00
    call func_007_7A2D                            ; $7989: $CD $2D $7A
    call GetEntityTransitionCountdown             ; $798C: $CD $05 $0C
    jr   nz, jr_007_79B3                          ; $798F: $20 $22

    ld   [hl], $80                                ; $7991: $36 $80
    call IncrementEntityState                     ; $7993: $CD $12 $3B

func_007_7996::
    ld   hl, wEntitiesDirectionTable              ; $7996: $21 $80 $C3
    add  hl, bc                                   ; $7999: $09
    ld   a, [hl]                                  ; $799A: $7E
    xor  $01                                      ; $799B: $EE $01
    ld   [hl], a                                  ; $799D: $77
    ld   e, a                                     ; $799E: $5F
    ld   d, b                                     ; $799F: $50
    ld   hl, Data_007_7978                        ; $79A0: $21 $78 $79
    add  hl, de                                   ; $79A3: $19
    ld   a, [hl]                                  ; $79A4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $79A5: $21 $40 $C2
    add  hl, bc                                   ; $79A8: $09
    ld   [hl], a                                  ; $79A9: $77
    ld   hl, Data_007_797C                        ; $79AA: $21 $7C $79
    add  hl, de                                   ; $79AD: $19
    ld   a, [hl]                                  ; $79AE: $7E
    call GetEntitySpeedYAddress                   ; $79AF: $CD $05 $40
    ld   [hl], a                                  ; $79B2: $77

jr_007_79B3:
    ret                                           ; $79B3: $C9

func_007_79B4::
    call func_007_7A2D                            ; $79B4: $CD $2D $7A
    ld   hl, wEntitiesCollisionsTable             ; $79B7: $21 $A0 $C2
    add  hl, bc                                   ; $79BA: $09
    ld   a, [hl]                                  ; $79BB: $7E
    and  a                                        ; $79BC: $A7
    jr   z, jr_007_79C2                           ; $79BD: $28 $03

    call func_007_7996                            ; $79BF: $CD $96 $79

jr_007_79C2:
    call func_007_7E0A                            ; $79C2: $CD $0A $7E
    call label_3B23                               ; $79C5: $CD $23 $3B
    call func_007_7D1A                            ; $79C8: $CD $1A $7D
    call GetEntityTransitionCountdown             ; $79CB: $CD $05 $0C
    jr   nz, jr_007_79D6                          ; $79CE: $20 $06

    ld   [hl], $30                                ; $79D0: $36 $30

func_007_79D2::
    call IncrementEntityState                     ; $79D2: $CD $12 $3B
    ld   [hl], b                                  ; $79D5: $70

jr_007_79D6:
    ret                                           ; $79D6: $C9

func_007_79D7::
    call GetEntityPrivateCountdown1               ; $79D7: $CD $00 $0C
    jr   z, jr_007_79F9                           ; $79DA: $28 $1D

    ld   a, [wTransitionSequenceCounter]          ; $79DC: $FA $6B $C1
    cp   $04                                      ; $79DF: $FE $04
    jr   nz, jr_007_79F9                          ; $79E1: $20 $16

    ldh  a, [hMapId]                              ; $79E3: $F0 $F7
    cp   $15                                      ; $79E5: $FE $15
    jr   nz, jr_007_79F9                          ; $79E7: $20 $10

    ld   hl, wEntitiesUnknownTableD               ; $79E9: $21 $D0 $C2
    add  hl, bc                                   ; $79EC: $09
    ld   a, [hl]                                  ; $79ED: $7E
    and  a                                        ; $79EE: $A7
    jr   nz, jr_007_7A1E                          ; $79EF: $20 $2D

    inc  [hl]                                     ; $79F1: $34
    call_open_dialog $190                         ; $79F2
    jr   jr_007_7A1E                              ; $79F7: $18 $25

jr_007_79F9:
    ld   a, [hl]                                  ; $79F9: $7E
    and  a                                        ; $79FA: $A7
    jr   nz, jr_007_7A1E                          ; $79FB: $20 $21

    call GetEntityTransitionCountdown             ; $79FD: $CD $05 $0C
    jr   nz, jr_007_7A07                          ; $7A00: $20 $05

    ld   [hl], $18                                ; $7A02: $36 $18
    call func_007_79D2                            ; $7A04: $CD $D2 $79

jr_007_7A07:
    call func_007_7D1A                            ; $7A07: $CD $1A $7D
    call func_007_7D1A                            ; $7A0A: $CD $1A $7D
    call func_007_7E0A                            ; $7A0D: $CD $0A $7E
    call label_3B23                               ; $7A10: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $7A13: $F0 $E7
    xor  c                                        ; $7A15: $A9
    and  $0F                                      ; $7A16: $E6 $0F
    ret  nz                                       ; $7A18: $C0

    ld   a, $0A                                   ; $7A19: $3E $0A
    call ApplyVectorTowardsLink_trampoline        ; $7A1B: $CD $AA $3B

jr_007_7A1E:
    call func_007_7E7D                            ; $7A1E: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $7A21: $21 $80 $C3
    add  hl, bc                                   ; $7A24: $09
    ld   [hl], a                                  ; $7A25: $77
    jp   func_007_7D1A                            ; $7A26: $C3 $1A $7D

Data_007_7A29::
    db   $01, $00, $03, $02

func_007_7A2D::
    ld   a, [$C502]                               ; $7A2D: $FA $02 $C5
    and  a                                        ; $7A30: $A7
    jr   nz, func_007_7A55                        ; $7A31: $20 $22

    call func_007_7E5D                            ; $7A33: $CD $5D $7E
    add  $30                                      ; $7A36: $C6 $30
    cp   $60                                      ; $7A38: $FE $60
    jr   nc, jr_007_7A6C                          ; $7A3A: $30 $30

    call func_007_7E6D                            ; $7A3C: $CD $6D $7E
    add  $30                                      ; $7A3F: $C6 $30
    cp   $60                                      ; $7A41: $FE $60
    jr   nc, jr_007_7A6C                          ; $7A43: $30 $27

    call func_007_7E7D                            ; $7A45: $CD $7D $7E
    ld   d, b                                     ; $7A48: $50
    ld   hl, Data_007_7A29                        ; $7A49: $21 $29 $7A
    add  hl, de                                   ; $7A4C: $19
    ld   a, [hl]                                  ; $7A4D: $7E
    ld   hl, wEntitiesDirectionTable              ; $7A4E: $21 $80 $C3
    add  hl, bc                                   ; $7A51: $09
    cp   [hl]                                     ; $7A52: $BE
    jr   z, jr_007_7A6C                           ; $7A53: $28 $17

func_007_7A55::
    ld   hl, wEntitiesStateTable                  ; $7A55: $21 $90 $C2
    add  hl, bc                                   ; $7A58: $09
    ld   a, [hl]                                  ; $7A59: $7E
    cp   $02                                      ; $7A5A: $FE $02
    jr   z, jr_007_7A65                           ; $7A5C: $28 $07

    push hl                                       ; $7A5E: $E5
    call GetEntityPrivateCountdown1               ; $7A5F: $CD $00 $0C
    ld   [hl], $10                                ; $7A62: $36 $10
    pop  hl                                       ; $7A64: $E1

jr_007_7A65:
    ld   [hl], $02                                ; $7A65: $36 $02
    call GetEntityTransitionCountdown             ; $7A67: $CD $05 $0C
    ld   [hl], $80                                ; $7A6A: $36 $80

jr_007_7A6C:
    ret                                           ; $7A6C: $C9

Data_007_7A6D::
    db   $00, $00, $F9, $F9, $F8, $F2, $08, $0E

Data_007_7A75::
    db   $08, $0E, $F8, $F2, $00, $00, $00, $00

Data_007_7A7D::
    db   $02, $02, $06, $06, $04, $04, $00, $00

Data_007_7A85::
    db   $0C, $0C, $04, $04, $FC, $FC, $14, $14

Data_007_7A8D::
    db   $14, $14, $FC, $FC, $0C, $0C, $0C, $0C

Data_007_7A95::
    db   $60, $03, $62, $03, $62, $23, $60, $23, $64, $03, $66, $03, $66, $23, $64, $23
    db   $68, $03, $6A, $03, $6C, $03, $6E, $03, $6A, $23, $68, $23, $6E, $23, $6C, $23

func_007_7AB5::
    call SkipDisabledEntityDuringRoomTransition   ; $7AB5: $CD $57 $3D
    ldh  a, [hActiveEntitySpriteVariant]          ; $7AB8: $F0 $F1
    cp   $02                                      ; $7ABA: $FE $02
    jr   nc, jr_007_7AC1                          ; $7ABC: $30 $03

    call func_007_7B30                            ; $7ABE: $CD $30 $7B

jr_007_7AC1:
    ldh  a, [hActiveEntitySpriteVariant]          ; $7AC1: $F0 $F1
    cp   $02                                      ; $7AC3: $FE $02
    jr   z, jr_007_7ACB                           ; $7AC5: $28 $04

    cp   $03                                      ; $7AC7: $FE $03
    jr   nz, jr_007_7AD1                          ; $7AC9: $20 $06

jr_007_7ACB:
    ld   de, Data_007_7A95                        ; $7ACB: $11 $95 $7A
    call RenderActiveEntitySpritesPair            ; $7ACE: $CD $C0 $3B

jr_007_7AD1:
    push bc                                       ; $7AD1: $C5
    ldh  a, [hActiveEntityVisualPosY]             ; $7AD2: $F0 $EC
    ldh  [hScratch0], a                           ; $7AD4: $E0 $D7
    ldh  a, [hActiveEntityPosX]                   ; $7AD6: $F0 $EE
    ldh  [hScratch1], a                           ; $7AD8: $E0 $D8
    ldh  a, [hActiveEntitySpriteVariant]          ; $7ADA: $F0 $F1
    ld   e, a                                     ; $7ADC: $5F
    ld   d, b                                     ; $7ADD: $50
    ld   hl, Data_007_7A85                        ; $7ADE: $21 $85 $7A
    add  hl, de                                   ; $7AE1: $19
    ld   a, [hl]                                  ; $7AE2: $7E
    ld   [$D5C0], a                               ; $7AE3: $EA $C0 $D5
    ld   hl, Data_007_7A8D                        ; $7AE6: $21 $8D $7A
    add  hl, de                                   ; $7AE9: $19
    ld   a, [hl]                                  ; $7AEA: $7E
    ld   [$D5C2], a                               ; $7AEB: $EA $C2 $D5
    ld   a, $02                                   ; $7AEE: $3E $02
    ld   [$D5C1], a                               ; $7AF0: $EA $C1 $D5
    ld   [$D5C3], a                               ; $7AF3: $EA $C3 $D5
    ld   hl, Data_007_7A7D                        ; $7AF6: $21 $7D $7A
    add  hl, de                                   ; $7AF9: $19
    ld   a, [hl]                                  ; $7AFA: $7E
    ldh  [hScratch2], a                           ; $7AFB: $E0 $D9
    ld   hl, Data_007_7A75                        ; $7AFD: $21 $75 $7A
    add  hl, de                                   ; $7B00: $19
    ld   a, [hl]                                  ; $7B01: $7E
    ld   hl, Data_007_7A6D                        ; $7B02: $21 $6D $7A
    add  hl, de                                   ; $7B05: $19
    ld   l, [hl]                                  ; $7B06: $6E
    ld   h, a                                     ; $7B07: $67
    push hl                                       ; $7B08: $E5
    ld   a, [wOAMNextAvailableSlot]               ; $7B09: $FA $C0 $C3
    ld   e, a                                     ; $7B0C: $5F
    ld   d, $00                                   ; $7B0D: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $7B0F: $21 $30 $C0
    add  hl, de                                   ; $7B12: $19
    ld   c, l                                     ; $7B13: $4D
    ld   b, h                                     ; $7B14: $44
    xor  a                                        ; $7B15: $AF
    ldh  [hScratch3], a                           ; $7B16: $E0 $DA
    pop  hl                                       ; $7B18: $E1
    call func_1819                               ; $7B19: $CD $19 $18
    ld   a, $02                                   ; $7B1C: $3E $02
    call label_3DA0                               ; $7B1E: $CD $A0 $3D
    pop  bc                                       ; $7B21: $C1
    ldh  a, [hActiveEntitySpriteVariant]          ; $7B22: $F0 $F1
    cp   $02                                      ; $7B24: $FE $02
    ret  z                                        ; $7B26: $C8

    cp   $03                                      ; $7B27: $FE $03
    ret  z                                        ; $7B29: $C8

    ld   de, Data_007_7A95                        ; $7B2A: $11 $95 $7A
    jp   RenderActiveEntitySpritesPair                ; $7B2D: $C3 $C0 $3B

func_007_7B30::
    xor  $01                                      ; $7B30: $EE $01
    push af                                       ; $7B32: $F5
    ld   a, [wOAMNextAvailableSlot]               ; $7B33: $FA $C0 $C3
    ld   l, a                                     ; $7B36: $6F
    ld   h, $00                                   ; $7B37: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $7B39: $11 $30 $C0
    add  hl, de                                   ; $7B3C: $19
    pop  de                                       ; $7B3D: $D1
    ldh  a, [hActiveEntityVisualPosY]             ; $7B3E: $F0 $EC
    add  d                                        ; $7B40: $82
    add  $04                                      ; $7B41: $C6 $04
    ld   [hl+], a                                 ; $7B43: $22
    ldh  a, [hActiveEntityPosX]                   ; $7B44: $F0 $EE
    add  $FE                                      ; $7B46: $C6 $FE
    ld   [hl+], a                                 ; $7B48: $22
    ld   a, $86                                   ; $7B49: $3E $86
    ld   [hl+], a                                 ; $7B4B: $22
    ld   [hl], $16                                ; $7B4C: $36 $16
    ld   a, $01                                   ; $7B4E: $3E $01
    jp   label_3DA0                               ; $7B50: $C3 $A0 $3D

include "code/entities/chest_with_item.asm"

func_007_7CF0::
    call CheckLinkCollisionWithEnemy_trampoline   ; $7CF0: $CD $5A $3B
    jr   nc, jr_007_7D14                          ; $7CF3: $30 $1F

    call CopyLinkFinalPositionToPosition          ; $7CF5: $CD $BE $0C
    call ResetPegasusBoots                        ; $7CF8: $CD $B6 $0C
    ld   a, [$C1A6]                               ; $7CFB: $FA $A6 $C1
    and  a                                        ; $7CFE: $A7
    jr   z, jr_007_7D12                           ; $7CFF: $28 $11

    ld   e, a                                     ; $7D01: $5F
    ld   d, b                                     ; $7D02: $50
    ld   hl, $C39F                                ; $7D03: $21 $9F $C3
    add  hl, de                                   ; $7D06: $19
    ld   a, [hl]                                  ; $7D07: $7E
    cp   $03                                      ; $7D08: $FE $03
    jr   nz, jr_007_7D12                          ; $7D0A: $20 $06

    ld   hl, wEntitiesStatusTable + $0F                         ; $7D0C: $21 $8F $C2
    add  hl, de                                   ; $7D0F: $19
    ld   [hl], $00                                ; $7D10: $36 $00

jr_007_7D12:
    scf                                           ; $7D12: $37
    ret                                           ; $7D13: $C9

jr_007_7D14:
    and  a                                        ; $7D14: $A7
    ret                                           ; $7D15: $C9

Data_007_7D16::
    db   $06, $04, $02, $00

func_007_7D1A::
    ld   hl, wEntitiesDirectionTable              ; $7D1A: $21 $80 $C3
    add  hl, bc                                   ; $7D1D: $09
    ld   e, [hl]                                  ; $7D1E: $5E
    ld   d, b                                     ; $7D1F: $50
    ld   hl, Data_007_7D16                        ; $7D20: $21 $16 $7D
    add  hl, de                                   ; $7D23: $19
    push hl                                       ; $7D24: $E5
    ld   hl, wEntitiesUnknowTableY                ; $7D25: $21 $D0 $C3
    add  hl, bc                                   ; $7D28: $09
    inc  [hl]                                     ; $7D29: $34
    ld   a, [hl]                                  ; $7D2A: $7E
    rra                                           ; $7D2B: $1F
    rra                                           ; $7D2C: $1F
    rra                                           ; $7D2D: $1F
    rra                                           ; $7D2E: $1F
    pop  hl                                       ; $7D2F: $E1
    and  $01                                      ; $7D30: $E6 $01
    or   [hl]                                     ; $7D32: $B6
    jp   SetEntitySpriteVariant                   ; $7D33: $C3 $0C $3B

func_007_7D36::
    ld   e, b                                     ; $7D36: $58
    ldh  a, [hLinkPositionY]                      ; $7D37: $F0 $99
    ld   hl, hActiveEntityPosY                                ; $7D39: $21 $EF $FF
    sub  [hl]                                     ; $7D3C: $96
    add  $14                                      ; $7D3D: $C6 $14
    cp   $38                                      ; $7D3F: $FE $38
    jr   jr_007_7D4E                              ; $7D41: $18 $0B

func_007_7D43::
    ld   e, b                                     ; $7D43: $58
    ldh  a, [hLinkPositionY]                      ; $7D44: $F0 $99
    ld   hl, hActiveEntityPosY                                ; $7D46: $21 $EF $FF
    sub  [hl]                                     ; $7D49: $96
    add  $14                                      ; $7D4A: $C6 $14
    cp   $28                                      ; $7D4C: $FE $28

jr_007_7D4E:
    jr   nc, jr_007_7D94                          ; $7D4E: $30 $44

    ldh  a, [hLinkPositionX]                      ; $7D50: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $7D52: $21 $EE $FF
    sub  [hl]                                     ; $7D55: $96
    add  $10                                      ; $7D56: $C6 $10
    cp   $20                                      ; $7D58: $FE $20
    jr   nc, jr_007_7D94                          ; $7D5A: $30 $38

    inc  e                                        ; $7D5C: $1C
    ldh  a, [hActiveEntityType]                   ; $7D5D: $F0 $EB
    cp   ENTITY_BEAR                              ; $7D5F: $FE $B5
    jr   z, jr_007_7D6F                           ; $7D61: $28 $0C

    push de                                       ; $7D63: $D5
    call func_007_7E7D                            ; $7D64: $CD $7D $7E
    ldh  a, [hLinkDirection]                      ; $7D67: $F0 $9E
    xor  $01                                      ; $7D69: $EE $01
    cp   e                                        ; $7D6B: $BB
    pop  de                                       ; $7D6C: $D1
    jr   nz, jr_007_7D94                          ; $7D6D: $20 $25

jr_007_7D6F:
    ld   hl, $C1AD                                ; $7D6F: $21 $AD $C1
    ld   [hl], $01                                ; $7D72: $36 $01
    ld   a, [wDialogState]                        ; $7D74: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7D77: $21 $4F $C1
    or   [hl]                                     ; $7D7A: $B6
    ld   hl, $C146                                ; $7D7B: $21 $46 $C1
    or   [hl]                                     ; $7D7E: $B6
    ld   hl, $C134                                ; $7D7F: $21 $34 $C1
    or   [hl]                                     ; $7D82: $B6
    jr   nz, jr_007_7D94                          ; $7D83: $20 $0F

    ld   a, [wWindowY]                            ; $7D85: $FA $9A $DB
    cp   $80                                      ; $7D88: $FE $80
    jr   nz, jr_007_7D94                          ; $7D8A: $20 $08

    ldh  a, [hJoypadState]                        ; $7D8C: $F0 $CC
    and  $10                                      ; $7D8E: $E6 $10
    jr   z, jr_007_7D94                           ; $7D90: $28 $02

    scf                                           ; $7D92: $37
    ret                                           ; $7D93: $C9

jr_007_7D94:
    and  a                                        ; $7D94: $A7
    ret                                           ; $7D95: $C9

func_007_7D96::
    ldh  a, [hActiveEntityStatus]                 ; $7D96: $F0 $EA
    cp   $05                                      ; $7D98: $FE $05
    jr   nz, jr_007_7DC1                          ; $7D9A: $20 $25

func_007_7D9C::
    ld   a, [wGameplayType]                       ; $7D9C: $FA $95 $DB
    cp   $07                                      ; $7D9F: $FE $07
    jr   z, jr_007_7DC1                           ; $7DA1: $28 $1E

    cp   $0B                                      ; $7DA3: $FE $0B
    jr   nz, jr_007_7DC1                          ; $7DA5: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7DA7: $FA $6B $C1
    cp   $04                                      ; $7DAA: $FE $04
    jr   nz, jr_007_7DC1                          ; $7DAC: $20 $13

    ld   a, [wDialogState]                        ; $7DAE: $FA $9F $C1
    ld   hl, $C1A8                                ; $7DB1: $21 $A8 $C1
    or   [hl]                                     ; $7DB4: $B6
    ld   hl, wInventoryAppearing                  ; $7DB5: $21 $4F $C1
    or   [hl]                                     ; $7DB8: $B6
    jr   nz, jr_007_7DC1                          ; $7DB9: $20 $06

    ld   a, [wRoomTransitionState]                ; $7DBB: $FA $24 $C1
    and  a                                        ; $7DBE: $A7
    jr   z, jr_007_7DC2                           ; $7DBF: $28 $01

jr_007_7DC1:
    pop  af                                       ; $7DC1: $F1

jr_007_7DC2:
    ret                                           ; $7DC2: $C9

func_007_7DC3::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7DC3: $21 $10 $C4
    add  hl, bc                                   ; $7DC6: $09
    ld   a, [hl]                                  ; $7DC7: $7E
    and  a                                        ; $7DC8: $A7
    jr   z, label_007_7E09                        ; $7DC9: $28 $3E

    dec  a                                        ; $7DCB: $3D
    ld   [hl], a                                  ; $7DCC: $77
    call label_3E8E                               ; $7DCD: $CD $8E $3E
    ld   hl, wEntitiesSpeedXTable                 ; $7DD0: $21 $40 $C2
    add  hl, bc                                   ; $7DD3: $09
    ld   a, [hl]                                  ; $7DD4: $7E
    push af                                       ; $7DD5: $F5
    call GetEntitySpeedYAddress                   ; $7DD6: $CD $05 $40
    ld   a, [hl]                                  ; $7DD9: $7E
    push af                                       ; $7DDA: $F5
    ld   hl, $C3F0                                ; $7DDB: $21 $F0 $C3
    add  hl, bc                                   ; $7DDE: $09
    ld   a, [hl]                                  ; $7DDF: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7DE0: $21 $40 $C2
    add  hl, bc                                   ; $7DE3: $09
    ld   [hl], a                                  ; $7DE4: $77
    ld   hl, wEntitiesUnknowTableS                ; $7DE5: $21 $00 $C4
    add  hl, bc                                   ; $7DE8: $09
    ld   a, [hl]                                  ; $7DE9: $7E
    call GetEntitySpeedYAddress                   ; $7DEA: $CD $05 $40
    ld   [hl], a                                  ; $7DED: $77
    call func_007_7E0A                            ; $7DEE: $CD $0A $7E
    ld   hl, wEntitiesUnknowTableH                ; $7DF1: $21 $30 $C4
    add  hl, bc                                   ; $7DF4: $09
    ld   a, [hl]                                  ; $7DF5: $7E
    and  $20                                      ; $7DF6: $E6 $20
    jr   nz, jr_007_7DFD                          ; $7DF8: $20 $03

    call label_3B23                               ; $7DFA: $CD $23 $3B

jr_007_7DFD:
    call GetEntitySpeedYAddress                   ; $7DFD: $CD $05 $40
    pop  af                                       ; $7E00: $F1
    ld   [hl], a                                  ; $7E01: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7E02: $21 $40 $C2
    add  hl, bc                                   ; $7E05: $09
    pop  af                                       ; $7E06: $F1
    ld   [hl], a                                  ; $7E07: $77
    pop  af                                       ; $7E08: $F1

label_007_7E09:
    ret                                           ; $7E09: $C9

func_007_7E0A::
    call func_007_7E17                            ; $7E0A: $CD $17 $7E
    push bc                                       ; $7E0D: $C5
    ld   a, c                                     ; $7E0E: $79
    add  $10                                      ; $7E0F: $C6 $10
    ld   c, a                                     ; $7E11: $4F
    call func_007_7E17                            ; $7E12: $CD $17 $7E
    pop  bc                                       ; $7E15: $C1
    ret                                           ; $7E16: $C9

func_007_7E17::
    ld   hl, wEntitiesSpeedXTable                 ; $7E17: $21 $40 $C2
    add  hl, bc                                   ; $7E1A: $09
    ld   a, [hl]                                  ; $7E1B: $7E
    and  a                                        ; $7E1C: $A7
    jr   z, jr_007_7E42                           ; $7E1D: $28 $23

    push af                                       ; $7E1F: $F5
    swap a                                        ; $7E20: $CB $37
    and  $F0                                      ; $7E22: $E6 $F0
    ld   hl, wEntitiesUnknowTableN                ; $7E24: $21 $60 $C2
    add  hl, bc                                   ; $7E27: $09
    add  [hl]                                     ; $7E28: $86
    ld   [hl], a                                  ; $7E29: $77
    rl   d                                        ; $7E2A: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7E2C: $21 $00 $C2

jr_007_7E2F:
    add  hl, bc                                   ; $7E2F: $09
    pop  af                                       ; $7E30: $F1
    ld   e, $00                                   ; $7E31: $1E $00
    bit  7, a                                     ; $7E33: $CB $7F
    jr   z, jr_007_7E39                           ; $7E35: $28 $02

    ld   e, $F0                                   ; $7E37: $1E $F0

jr_007_7E39:
    swap a                                        ; $7E39: $CB $37
    and  $0F                                      ; $7E3B: $E6 $0F
    or   e                                        ; $7E3D: $B3
    rr   d                                        ; $7E3E: $CB $1A
    adc  [hl]                                     ; $7E40: $8E
    ld   [hl], a                                  ; $7E41: $77

jr_007_7E42:
    ret                                           ; $7E42: $C9

func_007_7E43::
    ld   hl, wEntitiesSpeedZTable                 ; $7E43: $21 $20 $C3
    add  hl, bc                                   ; $7E46: $09
    ld   a, [hl]                                  ; $7E47: $7E
    and  a                                        ; $7E48: $A7
    jr   z, jr_007_7E42                           ; $7E49: $28 $F7

    push af                                       ; $7E4B: $F5
    swap a                                        ; $7E4C: $CB $37
    and  $F0                                      ; $7E4E: $E6 $F0
    ld   hl, wEntitiesUnknowTableK                ; $7E50: $21 $30 $C3
    add  hl, bc                                   ; $7E53: $09
    add  [hl]                                     ; $7E54: $86
    ld   [hl], a                                  ; $7E55: $77
    rl   d                                        ; $7E56: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7E58: $21 $10 $C3
    jr   jr_007_7E2F                              ; $7E5B: $18 $D2

func_007_7E5D::
    ld   e, $00                                   ; $7E5D: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7E5F: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $7E61: $21 $00 $C2
    add  hl, bc                                   ; $7E64: $09
    sub  [hl]                                     ; $7E65: $96
    bit  7, a                                     ; $7E66: $CB $7F
    jr   z, jr_007_7E6B                           ; $7E68: $28 $01

    inc  e                                        ; $7E6A: $1C

jr_007_7E6B:
    ld   d, a                                     ; $7E6B: $57
    ret                                           ; $7E6C: $C9

func_007_7E6D::
    ld   e, $02                                   ; $7E6D: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7E6F: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7E71: $21 $10 $C2
    add  hl, bc                                   ; $7E74: $09
    sub  [hl]                                     ; $7E75: $96
    bit  7, a                                     ; $7E76: $CB $7F
    jr   nz, jr_007_7E7B                          ; $7E78: $20 $01

    inc  e                                        ; $7E7A: $1C

jr_007_7E7B:
    ld   d, a                                     ; $7E7B: $57
    ret                                           ; $7E7C: $C9

func_007_7E7D::
    call func_007_7E5D                            ; $7E7D: $CD $5D $7E
    ld   a, e                                     ; $7E80: $7B
    ldh  [hScratch0], a                           ; $7E81: $E0 $D7
    ld   a, d                                     ; $7E83: $7A
    bit  7, a                                     ; $7E84: $CB $7F
    jr   z, jr_007_7E8A                           ; $7E86: $28 $02

    cpl                                           ; $7E88: $2F
    inc  a                                        ; $7E89: $3C

jr_007_7E8A:
    push af                                       ; $7E8A: $F5
    call func_007_7E6D                            ; $7E8B: $CD $6D $7E
    ld   a, e                                     ; $7E8E: $7B
    ldh  [hScratch1], a                           ; $7E8F: $E0 $D8
    ld   a, d                                     ; $7E91: $7A
    bit  7, a                                     ; $7E92: $CB $7F
    jr   z, jr_007_7E98                           ; $7E94: $28 $02

    cpl                                           ; $7E96: $2F
    inc  a                                        ; $7E97: $3C

jr_007_7E98:
    pop  de                                       ; $7E98: $D1
    cp   d                                        ; $7E99: $BA
    jr   nc, jr_007_7EA0                          ; $7E9A: $30 $04

    ldh  a, [hScratch0]                           ; $7E9C: $F0 $D7
    jr   jr_007_7EA2                              ; $7E9E: $18 $02

jr_007_7EA0:
    ldh  a, [hScratch1]                           ; $7EA0: $F0 $D8

jr_007_7EA2:
    ld   e, a                                     ; $7EA2: $5F
    ret                                           ; $7EA3: $C9

func_007_7EA4::
    ld   hl, wEntitiesStatusTable                 ; $7EA4: $21 $80 $C2
    add  hl, bc                                   ; $7EA7: $09
    ld   [hl], b                                  ; $7EA8: $70
    ret                                           ; $7EA9: $C9

label_007_7EAA:
    ld   hl, wEntitiesPrivateState2Table          ; $7EAA: $21 $C0 $C2
    add  hl, bc                                   ; $7EAD: $09
    ld   a, [hl]                                  ; $7EAE: $7E
    JP_TABLE                                      ; $7EAF
._00 dw func_007_7EB6                             ; $7EB0
._01 dw func_007_7EC7                             ; $7EB2
._02 dw func_007_7ED6                             ; $7EB4

func_007_7EB6::
    call GetEntityTransitionCountdown             ; $7EB6: $CD $05 $0C
    ld   [hl], $A0                                ; $7EB9: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $7EBB: $21 $20 $C4
    add  hl, bc                                   ; $7EBE: $09
    ld   [hl], $FF                                ; $7EBF: $36 $FF

label_007_7EC1:
    ld   hl, wEntitiesPrivateState2Table          ; $7EC1: $21 $C0 $C2
    add  hl, bc                                   ; $7EC4: $09
    inc  [hl]                                     ; $7EC5: $34
    ret                                           ; $7EC6: $C9

func_007_7EC7::
    call GetEntityTransitionCountdown             ; $7EC7: $CD $05 $0C
    ret  nz                                       ; $7ECA: $C0

    ld   [hl], $C0                                ; $7ECB: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $7ECD: $21 $20 $C4
    add  hl, bc                                   ; $7ED0: $09
    ld   [hl], $FF                                ; $7ED1: $36 $FF
    jp   label_007_7EC1                           ; $7ED3: $C3 $C1 $7E

func_007_7ED6::
    call GetEntityTransitionCountdown             ; $7ED6: $CD $05 $0C
    jr   nz, jr_007_7F13                          ; $7ED9: $20 $38

    ldh  a, [hActiveEntityType]                   ; $7EDB: $F0 $EB
    cp   ENTITY_MASTER_STALFOS                    ; $7EDD: $FE $5F
    jr   nz, jr_007_7F0A                          ; $7EDF: $20 $29

    ld   a, ENTITY_KEY_DROP_POINT                 ; $7EE1: $3E $30
    call SpawnNewEntity_trampoline                ; $7EE3: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $7EE6: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7EE8: $21 $00 $C2
    add  hl, de                                   ; $7EEB: $19
    ld   [hl], a                                  ; $7EEC: $77
    ldh  a, [hScratch1]                           ; $7EED: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7EEF: $21 $10 $C2
    add  hl, de                                   ; $7EF2: $19
    ld   [hl], a                                  ; $7EF3: $77
    ld   hl, wEntitiesSpeedZTable                 ; $7EF4: $21 $20 $C3
    add  hl, de                                   ; $7EF7: $19
    ld   [hl], $18                                ; $7EF8: $36 $18
    ld   hl, wEntitiesPrivateCountdown1Table      ; $7EFA: $21 $F0 $C2
    add  hl, de                                   ; $7EFD: $19
    ld   [hl], $20                                ; $7EFE: $36 $20
    ld   hl, wEntitiesUnknowTableR                ; $7F00: $21 $90 $C3
    add  hl, bc                                   ; $7F03: $09
    ld   a, [hl]                                  ; $7F04: $7E
    ldh  [hDefaultMusicTrack], a                  ; $7F05: $E0 $B0
    jp   jr_007_7F76                              ; $7F07: $C3 $76 $7F

jr_007_7F0A:
    call PlayBombExplosionSfx                     ; $7F0A: $CD $4B $0C
    call label_27DD                               ; $7F0D: $CD $DD $27
    jp   DidKillEnemy                             ; $7F10: $C3 $50 $3F

jr_007_7F13:
    jp   label_007_7F16                           ; $7F13: $C3 $16 $7F

label_007_7F16:
    and  $07                                      ; $7F16: $E6 $07
    ret  nz                                       ; $7F18: $C0

    call GetRandomByte                            ; $7F19: $CD $0D $28
    and  $1F                                      ; $7F1C: $E6 $1F
    sub  $10                                      ; $7F1E: $D6 $10
    ld   e, a                                     ; $7F20: $5F
    ld   hl, hActiveEntityPosX                    ; $7F21: $21 $EE $FF
    add  [hl]                                     ; $7F24: $86
    ld   [hl], a                                  ; $7F25: $77
    call GetRandomByte                            ; $7F26: $CD $0D $28
    and  $1F                                      ; $7F29: $E6 $1F
    sub  $14                                      ; $7F2B: $D6 $14
    ld   e, a                                     ; $7F2D: $5F
    ld   hl, hActiveEntityVisualPosY              ; $7F2E: $21 $EC $FF
    add  [hl]                                     ; $7F31: $86
    ld   [hl], a                                  ; $7F32: $77
    jp   label_007_7F36                           ; $7F33: $C3 $36 $7F

label_007_7F36:
    call func_007_7D9C                            ; $7F36: $CD $9C $7D
    ldh  a, [hActiveEntityPosX]                   ; $7F39: $F0 $EE
    ldh  [hScratch0], a                           ; $7F3B: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $7F3D: $F0 $EC
    ldh  [hScratch1], a                           ; $7F3F: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $7F41: $3E $02
    call AddTranscientVfx                         ; $7F43: $CD $C7 $0C
    ld   a, $13                                   ; $7F46: $3E $13
    ldh  [hNoiseSfx], a                           ; $7F48: $E0 $F4
    ret                                           ; $7F4A: $C9

    ld   a, $36                                   ; $7F4B: $3E $36
    call SpawnNewEntity_trampoline                ; $7F4D: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $7F50: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7F52: $21 $00 $C2
    add  hl, de                                   ; $7F55: $19
    ld   [hl], a                                  ; $7F56: $77
    ldh  a, [hScratch1]                           ; $7F57: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7F59: $21 $10 $C2
    add  hl, de                                   ; $7F5C: $19
    ld   [hl], a                                  ; $7F5D: $77
    ldh  a, [hIsSideScrolling]                    ; $7F5E: $F0 $F9
    and  a                                        ; $7F60: $A7
    jr   z, jr_007_7F6A                           ; $7F61: $28 $07

    call GetEntitySpeedYAddress                   ; $7F63: $CD $05 $40
    ld   [hl], $F0                                ; $7F66: $36 $F0
    jr   jr_007_7F76                              ; $7F68: $18 $0C

jr_007_7F6A:
    ld   hl, wEntitiesSpeedZTable                 ; $7F6A: $21 $20 $C3
    add  hl, de                                   ; $7F6D: $19
    ld   [hl], $10                                ; $7F6E: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7F70: $21 $10 $C3
    add  hl, de                                   ; $7F73: $19
    ld   [hl], $08                                ; $7F74: $36 $08

jr_007_7F76:
    call func_007_7EA4                            ; $7F76: $CD $A4 $7E
    ld   hl, hNoiseSfx                            ; $7F79: $21 $F4 $FF
    ld   [hl], $1A                                ; $7F7C: $36 $1A
    ret                                           ; $7F7E: $C9

